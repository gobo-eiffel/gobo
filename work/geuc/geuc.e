indexing

	description:

		"Gobo Eiffel generator for Unicode Classes"

	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class GEUC

inherit

	KL_SHARED_ARGUMENTS
		export {NONE} all end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UNICODE_ROUTINES

	GEUC_CONSTANTS

create

	execute

feature -- Execution

	execute is
			-- Start 'geuc' execution.
		do
			Arguments.set_program_name ("geuc")
			create error_handler.make_standard
			process_command_line
			create codes.make (minimum_unicode_character_code, maximum_unicode_character_code)
			parse_character_classes
			parse_derived_core_properties
			parse_derived_normalization_properties
			generate_character_class_routines
			generate_lower_case_routines
			generate_upper_case_routines
			generate_title_case_routines
			generate_normalization_routines
		end

feature -- Processing

	process_command_line is
			-- Process command line arguments.
		local
			nb: INTEGER
			arg: STRING
		do
			nb := Arguments.argument_count
			if nb = 0 then
				kernel_file_name_prefix := "uc_"
				file_name_prefix := "st_unicode_"
			elseif nb = 1 then
				arg := Arguments.argument (1)
				if arg.count > 10 and then arg.substring (1, 13).is_equal ("--uc_version=") then
					kernel_file_name_prefix := "uc_" + arg.substring (14, arg.count).as_lower + "_"
					file_name_prefix := "st_unicode_" + arg.substring (14, arg.count).as_lower + "_"
				else
					report_general_message ("Usage is geuc [--uc_version=<version-prefix>]")
					Exceptions.die (1)
				end
			else
				report_general_message ("Too many arguments")
				report_general_message ("Usage is geuc [--uc_version=<version-prefix>]")
				Exceptions.die (1)
			end
		ensure
			kernel_file_name_prefix_void: kernel_file_name_prefix /= Void
		end

	parse_character_classes is
			-- Parse `Unicode_data' for character classes, etc.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_hex_code, a_name: STRING
			a_code, an_index: INTEGER
		do
			create a_file.make (Unicode_data)
			create a_splitter.make_with_separators (";")
			a_file.open_read
			if a_file.is_open_read then
				from  until a_file.end_of_file loop
					a_file.read_line
					if not a_file.end_of_file then
						some_fields := a_splitter.split_greedy (a_file.last_string)
						if some_fields.count /= Field_count then
							report_general_message ("Bad data line in " + Unicode_data + " - not enough fields - data line is: " + a_file.last_string)
							Exceptions.die (1)
						else
							a_hex_code := some_fields.item (1)
							a_name := some_fields.item (2)
							if STRING_.is_hexadecimal (a_hex_code) then
								a_code := STRING_.hexadecimal_to_integer (a_hex_code)
								if is_range_start (a_name) then
									initial_code := a_code
								elseif is_range_finish (a_name) then
									if initial_code <= 0 or else initial_code > a_code then
										report_general_message ("Invalid start range - data line for end of range is: " + a_file.last_string)
										Exceptions.die (1)
									else
										from an_index := initial_code until an_index > a_code loop
											process_code_class (an_index, a_name.substring (2, a_name.count - 7), some_fields)
											an_index := an_index + 1
										end
									end
								else
									process_code_class (a_code, a_name, some_fields)
								end
							else
								report_general_message ("Invalid code point - data line is: " + a_file.last_string)
								Exceptions.die (1)
							end
						end
					end
				end
			else
				report_general_message ("Unable to open file " + Unicode_data + " for reading")
				Exceptions.die (1)
			end
		end

	parse_derived_core_properties is
			-- Parse `Derived_core_properties'.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_line, a_property: STRING
			a_hash: INTEGER
		do
			create a_file.make (Derived_core_properties)
			a_file.open_read
			if a_file.is_open_read then
				initialize_derived_core_properties
				from  until a_file.end_of_file loop
					a_file.read_line
					if not a_file.end_of_file then
						a_line := a_file.last_string
						a_hash :=  a_line.index_of ('#', 1)
						if a_hash > 0 then
								-- Strip comments.
							a_line := a_line.substring (1, a_hash - 1)
						end
						if not a_line.is_empty then
							create a_splitter.make_with_separators (";")
							some_fields := a_splitter.split_greedy (a_line)
							if some_fields.count /= 2 then
								report_general_message (Derived_core_properties + " must have precisely two fields. Found: " + a_file.last_string)
								Exceptions.die (1)
							else
								a_property := some_fields.item (2)
								STRING_.left_adjust (a_property)
								STRING_.right_adjust (a_property)
								if STRING_.same_string (a_property, Alphabetic_property) then
									set_alphabetic_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Default_ignorable_code_property) then
								elseif STRING_.same_string (a_property, Lowercase_property) then
									set_lower_case_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Grapheme_base_property) then
								elseif STRING_.same_string (a_property, Grapheme_extend_property) then
								elseif STRING_.same_string (a_property, Id_start_property) then
								elseif STRING_.same_string (a_property, Id_continue_property) then
								elseif STRING_.same_string (a_property, Math_property) then
									set_math_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Uppercase_property) then
									set_upper_case_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Xid_start_property) then
								elseif STRING_.same_string (a_property, Xid_continue_property) then
								else
									report_general_message ("Unknown property name " + a_property + " in " + Derived_core_properties)
									Exceptions.die (1)
								end
							end
						end
					end
				end
			else
				report_general_message ("Unable to open file " + Derived_core_properties + " for reading")
				Exceptions.die (1)
			end
		end

	parse_derived_normalization_properties is
			-- Parse `Derived_normalization_properties'.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_line, a_property: STRING
			a_hash: INTEGER
		do
			create a_file.make (Derived_normalization_properties)
			a_file.open_read
			if a_file.is_open_read then
				initialize_derived_normalization_properties
				from until a_file.end_of_file loop
					a_file.read_line
					if not a_file.end_of_file then
						a_line := a_file.last_string
						a_hash :=  a_line.index_of ('#', 1)
						if a_hash > 0 then
								-- Strip comments.
							a_line := a_line.substring (1, a_hash - 1)
						end
						if not a_line.is_empty then
							create a_splitter.make_with_separators (";")
							some_fields := a_splitter.split_greedy (a_line)
							if some_fields.count < 2 then
								report_general_message (Derived_normalization_properties + " must have at least two fields. Found: " + a_file.last_string)
								Exceptions.die (1)
							else
								a_property := some_fields.item (2)
								STRING_.left_adjust (a_property)
								STRING_.right_adjust (a_property)
								if STRING_.same_string (a_property, Expands_on_nfc_property) then
									set_nfc_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Expands_on_nfd_property) then
									set_nfd_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Expands_on_nfkc_property) then
									set_nfkc_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Expands_on_nfkd_property) then
									set_nfkd_property (some_fields.item (1))
								elseif STRING_.same_string (a_property, Fold_case_nfkc_closure_property) then
								elseif STRING_.same_string (a_property, Nfd_quick_check_property) then
									check_tristate_property (some_fields, a_file.last_string)
									a_property := some_fields.item (3)
									STRING_.left_adjust (a_property)
									STRING_.right_adjust (a_property)
									set_nfd_quick_check_property (a_property, some_fields.item (1))
								elseif STRING_.same_string (a_property, Nfc_quick_check_property) then
									check_tristate_property (some_fields, a_file.last_string)
									a_property := some_fields.item (3)
									STRING_.left_adjust (a_property)
									STRING_.right_adjust (a_property)
									set_nfc_quick_check_property (a_property, some_fields.item (1))
								elseif STRING_.same_string (a_property, Nfkd_quick_check_property) then
									check_tristate_property (some_fields, a_file.last_string)
									a_property := some_fields.item (3)
									STRING_.left_adjust (a_property)
									STRING_.right_adjust (a_property)
									set_nfkd_quick_check_property (a_property, some_fields.item (1))
								elseif STRING_.same_string (a_property, Nfkc_quick_check_property) then
									check_tristate_property (some_fields, a_file.last_string)
									a_property := some_fields.item (3)
									STRING_.left_adjust (a_property)
									STRING_.right_adjust (a_property)
									set_nfkc_quick_check_property (a_property, some_fields.item (1))
								elseif STRING_.same_string (a_property, Full_composition_exclusion_property) then
									set_full_composition_exclusion_property (some_fields.item (1))
								else
									report_general_message ("Unknown property name " + a_property + " in " + Derived_normalization_properties)
									Exceptions.die (1)
								end
							end
						end
					end
				end
			else
				report_general_message ("Unable to open file " + Derived_normalization_properties + " for reading")
				Exceptions.die (1)
			end
		end

feature -- Code generation

	kernel_file_name_prefix: STRING
			-- Prefix for generated kernel file names

	file_name_prefix: STRING
			-- Prefix for other generated file names

	kernel_class_name_prefix: STRING is
			-- Prefix for generated kernel class names
		require
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
		do
			Result := kernel_file_name_prefix.as_upper
		ensure
			kernel_class_name_prefix_not_void: Result /= Void
		end

	class_name_prefix: STRING is
			-- Prefix for other generated class names
		require
			file_name_prefix_not_void: file_name_prefix /= Void
		do
			Result := file_name_prefix.as_upper
		ensure
			class_name_prefix_not_void: Result /= Void
		end

	generate_character_class_routines is
			-- Generate character class routines from `codes' data.
		require
			codes_not_void: codes /= Void
			file_name_prefix_not_void: file_name_prefix /= Void
			class_name_prefix_not_void: class_name_prefix /= Void
		local
			an_output_file: KL_TEXT_OUTPUT_FILE
		do
			create an_output_file.make (file_name_prefix + "character_class_routines.e")
			an_output_file.open_write
			an_output_file.put_string ("indexing%N%N")
			an_output_file.put_string ("%Tdescription:%N%N")
			an_output_file.put_string ("%T%T%"Routines for determining class of Unicode characters%"%N%N")
			an_output_file.put_string ("%Tremark:%N%N")
			an_output_file.put_string ("%T%T%"Generated by geuc%"%N%N")
			an_output_file.put_string ("%Tlibrary: %"Gobo Eiffel String Library%"%N")
			an_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			an_output_file.put_string ("%Tlicense: %"Eiffel Forum License v2 (see forum.txt)%"%N")
			an_output_file.put_string ("%Tdate: %"$Date$%"%N")
			an_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			an_output_file.put_string ("class ")
			an_output_file.put_string (class_name_prefix)
			an_output_file.put_string ("CHARACTER_CLASS_ROUTINES%N%N")
			an_output_file.put_string ("inherit%N%N%TST_UNICODE_CHARACTER_CLASS_INTERFACE%N%N")
			an_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_character_class_array (an_output_file)
			write_decimal_value_array (an_output_file)
			write_upper_case_property_array (an_output_file)
			write_lower_case_property_array (an_output_file)
			write_alphabetic_property_array (an_output_file)
			write_math_property_array (an_output_file)
			an_output_file.put_string ("end%N")
			an_output_file.close
		end

	generate_lower_case_routines is
			-- Generate lower-case routines from `codes' data.
		require
			codes_not_void: codes /= Void
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
			kernel_class_name_prefix_not_void: kernel_class_name_prefix /= Void
		local
			an_output_file: KL_TEXT_OUTPUT_FILE
		do
			create an_output_file.make (kernel_file_name_prefix + "ctype_lowercase.e")
			an_output_file.open_write
			an_output_file.put_string ("indexing%N%N")
			an_output_file.put_string ("%Tdescription:%N%N")
			an_output_file.put_string ("%T%T%"Database for simple mapping to lower case%"%N%N")
			an_output_file.put_string ("%Tremark:%N%N")
			an_output_file.put_string ("%T%T%"Generated by geuc%"%N%N")
			an_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			an_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			an_output_file.put_string ("%Tlicense: %"Eiffel Forum License v2 (see forum.txt)%"%N")
			an_output_file.put_string ("%Tdate: %"$Date$%"%N")
			an_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			an_output_file.put_string ("class ")
			an_output_file.put_string (kernel_class_name_prefix)
			an_output_file.put_string ("CTYPE_LOWERCASE%N%N")
			an_output_file.put_string ("inherit%N%N%TKL_IMPORTED_INTEGER_ROUTINES%N%T%Texport {NONE} all end%N%N")
			an_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_lower_case_array (an_output_file)
			an_output_file.put_string ("end%N")
			an_output_file.close
		end

	generate_upper_case_routines is
			-- Generate upper-case routines from `codes' data.
		require
			codes_not_void: codes /= Void
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
			kernel_class_name_prefix_not_void: kernel_class_name_prefix /= Void
		local
			an_output_file: KL_TEXT_OUTPUT_FILE
		do
			create an_output_file.make (kernel_file_name_prefix + "ctype_uppercase.e")
			an_output_file.open_write
			an_output_file.put_string ("indexing%N%N")
			an_output_file.put_string ("%Tdescription:%N%N")
			an_output_file.put_string ("%T%T%"Database for simple mapping to upper case%"%N%N")
			an_output_file.put_string ("%Tremark:%N%N")
			an_output_file.put_string ("%T%T%"Generated by geuc%"%N%N")
			an_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			an_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			an_output_file.put_string ("%Tlicense: %"Eiffel Forum License v2 (see forum.txt)%"%N")
			an_output_file.put_string ("%Tdate: %"$Date$%"%N")
			an_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			an_output_file.put_string ("class ")
			an_output_file.put_string (kernel_class_name_prefix)
			an_output_file.put_string ("CTYPE_UPPERCASE%N%N")
			an_output_file.put_string ("inherit%N%N%TKL_IMPORTED_INTEGER_ROUTINES%N%T%Texport {NONE} all end%N%N")
			an_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_upper_case_array (an_output_file)
			an_output_file.put_string ("end%N")
			an_output_file.close
		end

	generate_title_case_routines is
			-- Generate title-case routines from `codes' data.
		require
			codes_not_void: codes /= Void
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
			kernel_class_name_prefix_not_void: kernel_class_name_prefix /= Void
		local
			an_output_file: KL_TEXT_OUTPUT_FILE
		do
			create an_output_file.make (kernel_file_name_prefix + "ctype_titlecase.e")
			an_output_file.open_write
			an_output_file.put_string ("indexing%N%N")
			an_output_file.put_string ("%Tdescription:%N%N")
			an_output_file.put_string ("%T%T%"Database for simple mapping to title case%"%N%N")
			an_output_file.put_string ("%Tremark:%N%N")
			an_output_file.put_string ("%T%T%"Generated by geuc%"%N%N")
			an_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			an_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			an_output_file.put_string ("%Tlicense: %"Eiffel Forum License v2 (see forum.txt)%"%N")
			an_output_file.put_string ("%Tdate: %"$Date$%"%N")
			an_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			an_output_file.put_string ("class ")
			an_output_file.put_string (kernel_class_name_prefix)
			an_output_file.put_string ("CTYPE_TITLECASE%N%N")
			an_output_file.put_string ("inherit%N%N%TKL_IMPORTED_INTEGER_ROUTINES%N%T%Texport {NONE} all end%N%N")
			an_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_title_case_array (an_output_file)
			an_output_file.put_string ("end%N")
			an_output_file.close
		end

	generate_normalization_routines is
			-- Generate normalization routines from parsed arrays.
		require
			codes_not_void: codes /= Void
			file_name_prefix_not_void: file_name_prefix /= Void
			class_name_prefix_not_void: class_name_prefix /= Void
		local
			an_output_file: KL_TEXT_OUTPUT_FILE
		do
			create an_output_file.make (file_name_prefix + "normalization_routines.e")
			an_output_file.open_write
			an_output_file.put_string ("indexing%N%N")
			an_output_file.put_string ("%Tdescription:%N%N")
			an_output_file.put_string ("%T%T%"Routines for normalizing strings%"%N%N")
			an_output_file.put_string ("%Tremark:%N%N")
			an_output_file.put_string ("%T%T%"Generated by geuc%"%N%N")
			an_output_file.put_string ("%Tlibrary: %"Gobo Eiffel String Library%"%N")
			an_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			an_output_file.put_string ("%Tlicense: %"Eiffel Forum License v2 (see forum.txt)%"%N")
			an_output_file.put_string ("%Tdate: %"$Date$%"%N")
			an_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			an_output_file.put_string ("class ")
			an_output_file.put_string (class_name_prefix)
			an_output_file.put_string ("NORMALIZATION_ROUTINES%N%N")
			an_output_file.put_string ("inherit%N%N%TST_UNICODE_NORMALIZATION_INTERFACE%N%N")
			an_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_canonical_combining_class_property_array (an_output_file)
			create compositions.make (15000)
			store_hangul_compositions
			write_decomposition_type_property_array (an_output_file)
			write_decomposition_mapping_property_array (an_output_file)
			write_composition_map (an_output_file)
			write_expands_on_nfc_property_array (an_output_file)
			write_expands_on_nfd_property_array (an_output_file)
			write_expands_on_nfkc_property_array (an_output_file)
			write_expands_on_nfkd_property_array (an_output_file)
			write_nfc_quick_check_array (an_output_file)
			write_nfd_quick_check_array (an_output_file)
			write_nfkc_quick_check_array (an_output_file)
			write_nfkd_quick_check_array (an_output_file)
			an_output_file.put_string ("end%N")
			an_output_file.close
		end

feature -- Access

	Unicode_data: STRING is "UnicodeData.txt"
	Derived_core_properties: STRING is "DerivedCoreProperties.txt"
	Derived_normalization_properties: STRING is "DerivedNormalizationProps.txt"
			-- Unicode Character Database filenames

	Alphabetic_property: STRING is "Alphabetic"
	Default_ignorable_code_property: STRING is "Default_Ignorable_Code"
	Lowercase_property: STRING is "Lowercase"
	Grapheme_base_property: STRING is "Grapheme_Base"
	Grapheme_extend_property: STRING is "Grapheme_Extend"
	Id_start_property: STRING is "ID_Start"
	Id_continue_property: STRING is "ID_Continue"
	Math_property: STRING is "Math"
	Uppercase_property: STRING is "Uppercase"
	Xid_start_property: STRING is "XID_Start"
	Xid_continue_property: STRING is "XID_Continue"
	Full_composition_exclusion_property: STRING is "Full_Composition_Exclusion"
	Expands_on_nfc_property: STRING is "Expands_On_NFC"
	Expands_on_nfd_property: STRING is "Expands_On_NFD"
	Expands_on_nfkc_property: STRING is "Expands_On_NFKC"
	Expands_on_nfkd_property: STRING is "Expands_On_NFKD"
	Fold_case_nfkc_closure_property: STRING is "FC_NFKC"
	Nfd_quick_check_property: STRING is "NFD_QC"
	Nfc_quick_check_property: STRING is "NFC_QC"
	Nfkd_quick_check_property: STRING is "NFKD_QC"
	Nfkc_quick_check_property: STRING is "NFKC_QC"
			-- Property names

	codes: ARRAY [GEUC_UNICODE_DATA]
			-- Parsed data from `Unicode_data' for each code point;
			-- Not that Unicode does not assign most of the code points
			-- to characters, so many will be `Void'.

	compositions: DS_HASH_TABLE [INTEGER, DS_HASHABLE_PAIR [INTEGER, INTEGER]]
			-- Map of compositions indexed by character pairs

	is_range_start (a_name: STRING): BOOLEAN is
			-- Is `a_name' indicating start of range rather than character name?
		require
			name_not_void: a_name /= Void
		do
			if a_name.count > 7 and then a_name.substring (a_name.count - 5, a_name.count).is_equal ("First>") then
				Result := True
			end
		end

	is_range_finish (a_name: STRING): BOOLEAN is
			-- Is `a_name' indicating end of range rather than character name?
		require
			name_not_void: a_name /= Void
		do
			if a_name.count > 7 and then a_name.substring (a_name.count - 4, a_name.count).is_equal ("Last>") then
				Result := True
			end
		ensure
			at_least_eight_characters_for_range_finish: Result implies a_name.count > 7
		end

feature -- Status report

	valid_code (a_code: INTEGER): BOOLEAN is
			-- Is `a_code' a valid Unicode code point?
		do
			Result := unicode.valid_code (a_code)
		end

feature -- Hangul

	Hangul_syllable_base: INTEGER is 44032
			-- Code-point of first Hangul syllable

	Hangul_syllable_count: INTEGER is 11172
			-- Number of Hangul syllables

	Leading_jamo_base: INTEGER is 4352
			-- Code-point of first leading consonant jamo

	Leading_jamo_count: INTEGER is 19
			-- Number of leading consonant jamo

	Vowel_jamo_base: INTEGER is 4449
			-- Code-point of first vowel jamo

	Vowel_jamo_count: INTEGER is 21
			-- Number of vowel jamo

	Trailing_jamo_base: INTEGER is 4519
			-- Code-point of first trailing consonant jamo

	Trailing_jamo_count: INTEGER is 28
			-- Number of trailing consonant jamo

	Jamo_permutation_count: INTEGER is 588
			-- `Vowel_jamo_count' * `Trailing_jamo_count'

	is_hangul_syllable (a_code: INTEGER): BOOLEAN is
			-- Is `a_code' a Hangul syllable?
		require
			valid_code: valid_code (a_code)
		do
			Result := a_code >= Hangul_syllable_base and a_code < Hangul_syllable_base + Hangul_syllable_count
		end

	decomposed_hangul_syllable (a_code: INTEGER): DS_ARRAYED_LIST [INTEGER] is
			-- Decomposition of `a_code' into conjoining jamo
		require
			valid_code: valid_code (a_code)
			hangul_syllable: is_hangul_syllable (a_code)
		local
			s, l, v, t: INTEGER
		do
			s := a_code - Hangul_syllable_base
			l := Leading_jamo_base + s // Jamo_permutation_count
			v := Vowel_jamo_base + (s \\ Jamo_permutation_count) // Trailing_jamo_count
			t := Trailing_jamo_base + s \\ Trailing_jamo_count
			if t /= Trailing_jamo_base then
				create Result.make (3)
			else
				create Result.make (2)
			end
			Result.put (l, 1)
			Result.put (v, 2)
			if t /= Trailing_jamo_base then
				Result.put (t, 3)
			end
		ensure
			decomposed_hangul_syllable_not_void: Result /= Void
			two_or_three_jamo: Result.count = 2 or Result.count = 3
		end

	store_hangul_compositions is
			-- Store all composed hangul syllables.
		local
			s, t: INTEGER
			a_first, a_second: INTEGER
			a_pair: DS_HASHABLE_PAIR [INTEGER, INTEGER]
		do
			from s := 0 until s = Hangul_syllable_count loop
				t := s \\ Trailing_jamo_count
				if t /= 0 then -- Triple
					a_first := Hangul_syllable_base + s - t
					a_second := Trailing_jamo_base + t
				else
					a_first := Leading_jamo_base + s // Jamo_permutation_count
					a_second := Vowel_jamo_base + (s \\ Jamo_permutation_count) // Trailing_jamo_count
				end
				create a_pair.make (a_first, a_second)
				compositions.force (s + Hangul_syllable_base, a_pair)
				s := s + 1
			end
		end

feature -- Composition

	store_composition (a_code: INTEGER; a_value: DS_ARRAYED_LIST [INTEGER]) is
			-- Store `a_code' as a canonical composition.
		require
			valid_code: unicode.is_bmp_code (a_code)
			not_hangul_syllable: not is_hangul_syllable (a_code)
			value_not_void: a_value /= Void
		local
			a_first, a_second: INTEGER
			a_data_point: GEUC_UNICODE_DATA
			a_pair: DS_HASHABLE_PAIR [INTEGER, INTEGER]
		do
			a_data_point := codes.item (a_code)
			if
				a_data_point /= Void and then
				a_data_point.decomposition_type = Canonical_decomposition_mapping and
				not full_composition_exclusion_array.item (a_code)
			then
				check
					at_least_one_code: a_value.count > 0
				end
				a_first := 0
				a_second := a_value.item (1)
				if a_value.count > 1 then
					a_first := a_second
					a_second := a_value.item (2)
				end
				create a_pair.make (a_first, a_second)
				compositions.force (a_code, a_pair)
			end
		end

feature {NONE} -- Implementation

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_general_message (a_message_string: STRING) is
			-- Report a miscellaneous message.
		require
			message_not_void: a_message_string /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message_string)
			error_handler.report_error (an_error)
		end

	initial_code: INTEGER
			-- Initial code point for range of characters in `Unicode_data'

	Empty_character_class_segment_array_name: STRING is "empty_character_class_segment"
			-- Name for empty character class segment

	Empty_character_class_plane_array_name: STRING is "empty_character_class_plane"
			-- Name for empty character class plane

	Empty_decimal_value_segment_array_name: STRING is "empty_decimal_value_segment"
			-- Name for empty decimal value segment

	Empty_decimal_value_plane_array_name: STRING is "empty_decimal_value_plane"
			-- Name for empty decimal value plane

	Empty_lower_code_segment_array_name: STRING is "empty_lower_code_segment"
			-- Name for empty lower code segment

	Empty_lower_code_plane_array_name: STRING is "empty_lower_code_plane"
			-- Name for empty lower code plane

	Empty_upper_code_segment_array_name: STRING is "empty_upper_code_segment"
			-- Name for empty upper code segment

	Empty_upper_code_plane_array_name: STRING is "empty_upper_code_plane"
			-- Name for empty upper code plane

	Empty_title_code_segment_array_name: STRING is "empty_title_code_segment"
			-- Name for empty title code segment

	Empty_title_code_plane_array_name: STRING is "empty_title_code_plane"
			-- Name for empty title_code plane

	write_character_class_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing character classes.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k, a_code: INTEGER
			a_category: INTEGER
			a_code_datum: GEUC_UNICODE_DATA
			some_segment_names, some_plane_names: ARRAY [STRING]
			a_segment: ARRAY [INTEGER_8]
			plane_all_absent, segment_all_absent: BOOLEAN
			empty_plane_written, empty_segment_written: BOOLEAN
			a_plane_array_name, a_segment_array_name: STRING
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_absent := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_absent := True
					from k := 0 until k > 255 loop
						a_code := k + 256 * j + 256 * 256 * i
						a_code_datum := codes.item (a_code)
						if a_code_datum = Void then
							a_category := Unassigned_other_category
						else
							a_category := a_code_datum.general_category
							if a_category /= Unassigned_other_category then
								segment_all_absent := False
								plane_all_absent := False
							end
						end
						a_segment.put (INTEGER_.to_integer_8 (a_category), k)
						k := k + 1
					end
					if segment_all_absent then
						a_segment_array_name := Empty_character_class_segment_array_name
						if not empty_segment_written then
							empty_segment_written := True
							write_integer8_segment (a_segment, Empty_character_class_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "character_class_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_absent then
					a_plane_array_name := Empty_character_class_plane_array_name
					if not empty_plane_written then
						empty_plane_written := True
						write_empty_integer8_plane (a_plane_array_name, Empty_character_class_segment_array_name, an_output_file)
					end
				else
					a_plane_array_name := "character_class_plane_" + i.out
					write_integer8_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tcharacter_classes: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]] is%N")
			an_output_file.put_string ("%T%T%T-- Character class for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_decimal_value_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing decimal digit values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k, a_code, a_category: INTEGER
			a_value: INTEGER_8
			a_code_datum: GEUC_UNICODE_DATA
			some_segment_names, some_plane_names: ARRAY [STRING]
			a_segment: ARRAY [INTEGER_8]
			plane_all_absent, segment_all_absent: BOOLEAN
			empty_plane_written, empty_segment_written: BOOLEAN
			a_plane_array_name, a_segment_array_name: STRING
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_absent := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_absent := True
					from k := 0 until k > 255 loop
						a_code := k + 256 * j + 256 * 256 * i
						a_code_datum := codes.item (a_code)
						if a_code_datum = Void then
							a_value := Bad_decimal_value
						else
							a_category := a_code_datum.general_category
							if a_category = Decimal_digit_number_category then
								segment_all_absent := False
								plane_all_absent := False
								a_value := a_code_datum.decimal_digit_value
							else
								a_value := Bad_decimal_value
							end
						end
						a_segment.put (a_value, k)
						k := k + 1
					end
					if segment_all_absent then
						a_segment_array_name := Empty_decimal_value_segment_array_name
						if not empty_segment_written then
							empty_segment_written := True
							write_integer8_segment (a_segment, Empty_decimal_value_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "decimal_value_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_absent then
					a_plane_array_name := Empty_decimal_value_plane_array_name
					if not empty_plane_written then
						empty_plane_written := True
						write_empty_integer8_plane (a_plane_array_name, Empty_decimal_value_segment_array_name, an_output_file)
					end
				else
					a_plane_array_name := "decimal_value_plane_" + i.out
					write_integer8_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tdecimal_values: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]] is%N")
			an_output_file.put_string ("%T%T%T-- Decimal value for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_upper_case_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing upper case property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_upper_case_property_segment",
				"all_true_upper_case_property_segment",
				"all_false_upper_case_property_plane",
				"upper_case_property_plane_",
				"upper_case_properties",
				"Uppercase property",
				upper_case_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_lower_case_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing lower case property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_lower_case_property_segment",
				"all_true_lower_case_property_segment",
				"all_false_lower_case_property_plane",
				"lower_case_property_plane_",
				"lower_case_properties",
				"Lowercase property",
				lower_case_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_alphabetic_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing alphabetic property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_alphabetic_property_segment",
				"all_true_alphabetic_property_segment",
				"all_false_alphabetic_property_plane",
				"alphabetic_property_plane_",
				"alphabetic_properties",
				"Alphabetic property",
				alphabetic_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_math_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing math property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_math_property_segment",
				"all_true_math_property_segment",
				"all_false_math_property_plane",
				"math_property_plane_",
				"math_properties",
				"Math property",
				math_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_expands_on_nfc_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing expands on NFC property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfc_property_segment",
				"all_true_expands_on_nfc_property_segment",
				"all_false_expands_on_nfc_property_plane",
				"expands_on_nfc_property_plane_",
				"expands_on_nfc_properties",
				"Expands_On_NFC property",
				expands_on_nfc_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_expands_on_nfd_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing expands on NFD property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfd_property_segment",
				"all_true_expands_on_nfd_property_segment",
				"all_false_expands_on_nfd_property_plane",
				"expands_on_nfd_property_plane_",
				"expands_on_nfd_properties",
				"Expands_On_NFD property",
				expands_on_nfd_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_expands_on_nfkc_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing expands on NFKC property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfkc_property_segment",
				"all_true_expands_on_nfkc_property_segment",
				"all_false_expands_on_nfkc_property_plane",
				"expands_on_nfkc_property_plane_",
				"expands_on_nfkc_properties",
				"Expands_On_NFKC property",
				expands_on_nfkc_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_expands_on_nfkd_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing expands on NFKD property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfkd_property_segment",
				"all_true_expands_on_nfkd_property_segment",
				"all_false_expands_on_nfkd_property_plane",
				"expands_on_nfkd_property_plane_",
				"expands_on_nfkd_properties",
				"Expands_On_NFKD property",
				expands_on_nfkd_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_boolean_property_array (all_false_segment_name, all_true_segment_name, all_false_plane_name, a_plane_prefix, an_array_name, a_title: STRING;
		an_array: ARRAY [BOOLEAN] ; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing full composition exclusion property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			all_false_segment_name_not_void: all_false_segment_name /= Void
			all_false_segment_name_not_empty: not all_false_segment_name.is_empty
			all_true_segment_name_not_void: all_true_segment_name /= Void
			all_true_segment_name_not_empty: not all_true_segment_name.is_empty
			all_false_plane_name_not_void: all_false_plane_name /= Void
			all_false_plane_name_not_empty: not all_false_plane_name.is_empty
			plane_prefix_not_void: a_plane_prefix /= Void
			plane_prefix_not_empty: not a_plane_prefix.is_empty
			array_name_not_void: an_array_name /= Void
			array_name_not_empty: not an_array_name.is_empty
			title_not_void: a_title /= Void
			title_not_empty: not a_title.is_empty
			array_not_void: an_array /= Void
		local
			i, j, k: INTEGER
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_false, segment_all_false, segment_all_true, a_value: BOOLEAN
			all_false_plane_written, all_false_segment_written, all_true_segment_written: BOOLEAN
			a_segment: ARRAY [BOOLEAN]
			a_plane_array_name, a_segment_array_name: STRING
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_false := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_false := True
					segment_all_true := True
					from k := 0 until k > 255 loop
						a_value := an_array.item (k + 256 * j + 256 * 256 * i)
						if a_value then
							segment_all_false := False
							plane_all_false := False
						else
							segment_all_true := False
						end
						a_segment.put (a_value, k)
						k := k + 1
					end
					if segment_all_false then
						a_segment_array_name := all_false_segment_name
						if not all_false_segment_written then
							all_false_segment_written := True
							write_boolean_segment (a_segment, a_segment_array_name, an_output_file)
						end
					elseif segment_all_true then
						a_segment_array_name := all_true_segment_name
						if not all_true_segment_written then
							all_true_segment_written := True
							write_boolean_segment (a_segment, a_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := a_plane_prefix + i.out + "_segment_" + j.out
						write_boolean_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_false then
					a_plane_array_name := all_false_plane_name
					if not all_false_plane_written then
						all_false_plane_written := True
						write_all_false_boolean_plane (a_plane_array_name, all_false_segment_name, an_output_file)
					end
				else
					a_plane_array_name := a_plane_prefix + i.out
					write_boolean_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%T" + an_array_name + ": SPECIAL [SPECIAL [ARRAY [BOOLEAN]]] is%N")
			an_output_file.put_string ("%T%T%T-- " + a_title + " for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_canonical_combining_class_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing Canonical_Combining_Class property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k: INTEGER
			a_plane_array_name, a_segment_array_name: STRING
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_zero, segment_all_zero: BOOLEAN
			all_zero_plane_written, all_zero_segment_written: BOOLEAN
			a_value: INTEGER
			a_segment: ARRAY [INTEGER_8]
			a_data_point: GEUC_UNICODE_DATA
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_zero := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_zero := True
					from k := 0 until k > 255 loop
						a_data_point := codes.item (k + 256 * j + 256 * 256 * i)
						if a_data_point = Void then
							a_value := 0
						else
							a_value := projected_combining_class (a_data_point.canonical_combining_class)
						end
						if a_value /= 0 then
							segment_all_zero := False
							plane_all_zero := False
						end
						a_segment.put (INTEGER_.to_integer_8 (a_value), k)
						k := k + 1
					end
					if segment_all_zero then
						a_segment_array_name := "all_zero_canonical_combining_class_segment"
						if not all_zero_segment_written then
							all_zero_segment_written := True
							write_integer8_segment (a_segment, a_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "canonical_combining_class_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_zero then
					a_plane_array_name := "all_zero_canonical_combining_class_plane"
					if not all_zero_plane_written then
						all_zero_plane_written := True
						write_empty_integer8_plane (a_plane_array_name, "all_zero_canonical_combining_class_segment", an_output_file)
					end
				else
					a_plane_array_name := "canonical_combining_class_plane_" + i.out
					write_integer8_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tcanonical_combining_class_properties: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]] is%N")
			an_output_file.put_string ("%T%T%T-- Canonical combining class for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_decomposition_type_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing Decomposition_Type property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k: INTEGER
			a_plane_array_name, a_segment_array_name: STRING
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_zero, segment_all_zero: BOOLEAN
			all_zero_plane_written, all_zero_segment_written: BOOLEAN
			a_value: INTEGER
			a_segment: ARRAY [INTEGER_8]
			a_data_point: GEUC_UNICODE_DATA
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_zero := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_zero := True
					from k := 0 until k > 255 loop
						a_data_point := codes.item (k + 256 * j + 256 * 256 * i)
						if a_data_point = Void then
							a_value := 0
						else
							a_value := a_data_point.decomposition_type
						end
						if a_value /= 0 then
							segment_all_zero := False
							plane_all_zero := False
						end
						a_segment.put (INTEGER_.to_integer_8 (a_value), k)
						k := k + 1
					end
					if segment_all_zero then
						a_segment_array_name := "all_zero_decomposition_type_segment"
						if not all_zero_segment_written then
							all_zero_segment_written := True
							write_integer8_segment (a_segment, a_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "decomposition_type_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_zero then
					a_plane_array_name := "all_zero_decomposition_type_plane"
					if not all_zero_plane_written then
						all_zero_plane_written := True
						write_empty_integer8_plane (a_plane_array_name, "all_zero_decomposition_type_segment", an_output_file)
					end
				else
					a_plane_array_name := "decomposition_type_plane_" + i.out
					write_integer8_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tdecomposition_type_properties: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]] is%N")
			an_output_file.put_string ("%T%T%T-- Decomposition type for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_decomposition_mapping_property_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing Decomposition_Mapping property values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k, a_code: INTEGER
			a_plane_array_name, a_segment_array_name: STRING
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_empty, segment_all_empty: BOOLEAN
			all_empty_plane_written, all_empty_segment_written: BOOLEAN
			a_value: DS_ARRAYED_LIST [INTEGER]
			a_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]
			a_data_point: GEUC_UNICODE_DATA
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_empty := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_empty := True
					from k := 0 until k > 255 loop
						a_code := k + 256 * j + 256 * 256 * i
						a_data_point := codes.item (a_code)
						if is_hangul_syllable (a_code) then
							a_value := decomposed_hangul_syllable (a_code)
						elseif a_data_point = Void then
							a_value := Void
						else
							a_value := a_data_point.decomposition_mapping
							if unicode.is_bmp_code (a_code) and a_value /= Void then
								store_composition (a_code, a_value)
							end
						end
						if a_value /= Void then
							segment_all_empty := False
							plane_all_empty := False
						end
						a_segment.put (a_value, k)
						k := k + 1
					end
					if segment_all_empty then
						a_segment_array_name := "all_empty_decomposition_mapping_segment"
						if not all_empty_segment_written then
							all_empty_segment_written := True
							write_integer_list_segment (a_segment, a_segment_array_name, an_output_file, True)
						end
					else
						a_segment_array_name := "decomposition_mapping_plane_" + i.out + "_segment_" + j.out
						write_integer_list_segment (a_segment, a_segment_array_name, an_output_file, False)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_empty then
					a_plane_array_name := "all_empty_decomposition_mapping_plane"
					if not all_empty_plane_written then
						all_empty_plane_written := True
						write_empty_integer_list_plane (a_plane_array_name, "all_empty_decomposition_mapping_segment", an_output_file)
					end
				else
					a_plane_array_name := "decomposition_mapping_plane_" + i.out
					write_integer_list_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tdecomposition_mapping_properties: SPECIAL [SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]] is%N")
			an_output_file.put_string ("%T%T%T-- Decomposition mapping for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_composition_map (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write composition map.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			a_cursor: DS_HASH_TABLE_CURSOR [INTEGER, DS_HASHABLE_PAIR [INTEGER, INTEGER]]
		do
			an_output_file.put_string ("%Tcomposition_map: DS_HASH_TABLE [INTEGER, DS_HASHABLE_PAIR [INTEGER, INTEGER]] is%N")
			an_output_file.put_string ("%T%T%T-- Map of compositions indexed by hashed character pairs%N")
			an_output_file.put_string ("%T%Tlocal%N")
			an_output_file.put_string ("%T%T%Ta_pair: DS_HASHABLE_PAIR [INTEGER, INTEGER]%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (" + compositions.count.out + ")%N")
			a_cursor := compositions.new_cursor
			from a_cursor.start until a_cursor.after loop
				an_output_file.put_string ("%T%T%Tcreate a_pair.make (")
				an_output_file.put_string (a_cursor.key.first.out)
				an_output_file.put_string (", ")
				an_output_file.put_string (a_cursor.key.second.out)
				an_output_file.put_string (")%N")
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (a_cursor.item.out)
				an_output_file.put_string (", a_pair)%N")
				a_cursor.forth
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_nfc_quick_check_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing NFC quick check values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_quick_check_array ("nfc_quick_check_array",
				"NFC_Quick_Check values",
				"all_true_nfc_quick_check_plane",
				"all_false_nfc_quick_check_segment",
				"all_true_nfc_quick_check_segment",
				"all_undefined_nfc_quick_check_segment",
				"nfc_quick_check_plane_",
				nfc_quick_check_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_nfd_quick_check_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing NFD quick check values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_quick_check_array ("nfd_quick_check_array",
				"NFD_Quick_Check values",
				"all_true_nfd_quick_check_plane",
				"all_false_nfd_quick_check_segment",
				"all_true_nfd_quick_check_segment",
				"all_undefined_nfd_quick_check_segment",
				"nfd_quick_check_plane_",
				nfd_quick_check_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_nfkc_quick_check_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing NFKC quick check values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_quick_check_array ("nfkc_quick_check_array",
				"NFKC_Quick_Check values",
				"all_true_nfkc_quick_check_plane",
				"all_false_nfkc_quick_check_segment",
				"all_true_nfkc_quick_check_segment",
				"all_undefined_nfkc_quick_check_segment",
				"nfkc_quick_check_plane_",
				nfkc_quick_check_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_nfkd_quick_check_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing NFKD quick check values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		do
			write_quick_check_array ("nfkd_quick_check_array",
				"NFKD_Quick_Check values",
				"all_true_nfkd_quick_check_plane",
				"all_false_nfkd_quick_check_segment",
				"all_true_nfkd_quick_check_segment",
				"all_undefined_nfkd_quick_check_segment",
				"nfkd_quick_check_plane_",
				nfkd_quick_check_array, an_output_file)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_quick_check_array (an_array_name, a_title: STRING;
		all_true_plane_name, all_false_segment_name, all_true_segment_name, all_undefined_segment_name, a_plane_prefix: STRING;
		an_array: ARRAY [UT_TRISTATE];
		an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing quick check values.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			array_not_void: an_array /= Void
			array_name_not_void: an_array_name /= Void
			array_name_not_empty: not an_array_name.is_empty
			title_not_void: a_title /= Void
			title_not_empty: not a_title.is_empty
			all_true_plane_name_not_void: all_true_plane_name /= Void
			all_true_plane_name_not_empty: not all_true_plane_name.is_empty
			all_false_segment_name_not_void: all_false_segment_name /= Void
			all_false_segment_name_not_empty: not all_false_segment_name.is_empty
			all_true_segment_name_not_void: all_true_segment_name /= Void
			all_true_segment_name_not_empty: not all_true_segment_name.is_empty
			all_undefined_segment_name_not_void: all_undefined_segment_name /= Void
			all_undefined_segment_name_not_empty: not all_undefined_segment_name.is_empty
			plane_prefix_not_void: a_plane_prefix /= Void
			plane_prefix_not_empty: not a_plane_prefix.is_empty
		local
			i: INTEGER
			some_plane_names: ARRAY [STRING]
			all_true_plane_written, all_false_segment_written, all_undefined_segment_written, all_true_segment_written: DS_CELL [BOOLEAN]
		do
			create some_plane_names.make (0, 16)
			create all_true_plane_written.make (False)
			create all_false_segment_written.make (False)
			create all_undefined_segment_written.make (False)
			create all_true_segment_written.make (False)
			from i := 0 until i > 16 loop
				assemble_tristate_plane (i, an_array, some_plane_names,
					all_true_plane_name,
					all_false_segment_name,
					all_true_segment_name,
					all_undefined_segment_name,
					a_plane_prefix,
					all_true_plane_written,
					all_false_segment_written,
					all_undefined_segment_written,
					all_true_segment_written,
					an_output_file)
				i := i + 1
			end
			an_output_file.put_string ("%T" + an_array_name + ": SPECIAL [SPECIAL [ARRAY [CHARACTER]]] is%N")
			an_output_file.put_string ("%T%T%T-- " + a_title + " for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	assemble_tristate_plane (i: INTEGER; an_array: ARRAY [UT_TRISTATE]; some_plane_names: ARRAY [STRING];
		all_true_plane_name, all_false_segment_name, all_true_segment_name, all_undefined_segment_name, a_plane_prefix: STRING;
		all_true_plane_written, all_false_segment_written, all_undefined_segment_written, all_true_segment_written: DS_CELL [BOOLEAN]
		an_output_file: KL_TEXT_OUTPUT_FILE) is
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			plane_names_not_void: some_plane_names /= Void
			plane_names_indexed_from_zero: some_plane_names.lower = 0
			plane_names_indexed_to_sixteen: some_plane_names.upper = 16
			valid_plane_number: i >= 0 and i <= 16
			array_not_void: an_array /= Void
			all_true_plane_name_not_void: all_true_plane_name /= Void
			all_true_plane_name_not_empty: not all_true_plane_name.is_empty
			all_false_segment_name_not_void: all_false_segment_name /= Void
			all_false_segment_name_not_empty: not all_false_segment_name.is_empty
			all_true_segment_name_not_void: all_true_segment_name /= Void
			all_true_segment_name_not_empty: not all_true_segment_name.is_empty
			all_undefined_segment_name_not_void: all_undefined_segment_name /= Void
			all_undefined_segment_name_not_empty: not all_undefined_segment_name.is_empty
			plane_prefix_not_void: a_plane_prefix /= Void
			plane_prefix_not_empty: not a_plane_prefix.is_empty
		local
			some_segment_names: ARRAY [STRING]
			j, k: INTEGER
			a_segment: ARRAY [UT_TRISTATE]
			a_plane_array_name, a_segment_array_name: STRING
			plane_all_true, segment_all_false, segment_all_undefined, segment_all_true: DS_CELL [BOOLEAN]
			a_value: UT_TRISTATE
		do
			create some_segment_names.make (0, 255)
			create plane_all_true.make (True)
			from j := 0 until j > 255 loop
				create a_segment.make (0, 255)
				create segment_all_false.make (True)
				create segment_all_true.make (True)
				create segment_all_undefined.make (True)
				from  k := 0 until k > 255 loop
					a_value := an_array.item (k + 256 * j + 256 * 256 * i)
					if a_value.is_true then
						segment_all_false.put (False)
						segment_all_undefined.put (False)
					elseif a_value.is_undefined then
						segment_all_false.put (False)
						plane_all_true.put (False)
						segment_all_true.put (False)
					else
						segment_all_true.put (False)
						plane_all_true.put (False)
						segment_all_undefined.put (False)
					end
					a_segment.put (a_value, k)
					k := k + 1
				end
				if segment_all_false.item then
					a_segment_array_name := all_false_segment_name
					if not all_false_segment_written.item then
						all_false_segment_written.put (True)
						write_tristate_segment (a_segment, a_segment_array_name, an_output_file)
					end
				elseif segment_all_true.item then
					a_segment_array_name := all_true_segment_name
					if not all_true_segment_written.item then
						all_true_segment_written.put (True)
						write_tristate_segment (a_segment, a_segment_array_name, an_output_file)
					end
				elseif segment_all_undefined.item then
					a_segment_array_name := all_undefined_segment_name
					if not all_undefined_segment_written.item then
						all_undefined_segment_written.put (True)
						write_tristate_segment (a_segment, a_segment_array_name, an_output_file)
					end
				else
					a_segment_array_name := a_plane_prefix + i.out + "_segment_" + j.out
					write_tristate_segment (a_segment, a_segment_array_name, an_output_file)
				end
				some_segment_names.put (a_segment_array_name, j)
				j := j + 1
			end
			if plane_all_true.item then
				a_plane_array_name := all_true_plane_name
				if not all_true_plane_written.item then
					all_true_plane_written.put (True)
					write_all_true_tristate_plane (a_plane_array_name, all_true_segment_name, an_output_file)
				end
			else
				a_plane_array_name := a_plane_prefix + i.out
				write_tristate_plane (some_segment_names, a_plane_array_name, an_output_file)
			end
			some_plane_names.put (a_plane_array_name, i)
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_tristate_plane (some_segment_names: ARRAY [STRING]; a_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane `a_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_array_names_not_void: some_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_name)
			an_output_file.put_string (": SPECIAL [ARRAY [CHARACTER]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from  until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_segment_names.item (an_index))
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_all_true_tristate_plane (a_plane_name, a_segment_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane where every value is `True' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_plane_name)
			an_output_file.put_string (": SPECIAL [ARRAY [CHARACTER]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (a_segment_name)
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_lower_case_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel `ARRAY' containing lower case equivalents.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k, a_code, a_value: INTEGER
			a_code_datum: GEUC_UNICODE_DATA
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_absent, segment_all_absent: BOOLEAN
			empty_plane_written, empty_segment_written: BOOLEAN
			a_segment: ARRAY [INTEGER]
			a_plane_array_name, a_segment_array_name: STRING
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				from plane_all_absent := True; j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_absent := True
					from k := 0 until k > 255 loop
						a_code := k + 256 * j + 256 * 256 * i
						a_code_datum := codes.item (a_code)
						if a_code_datum = Void then
							a_value := -1
						else
							a_value := a_code_datum.lower_code
						end
						if a_value /= - 1 then
							segment_all_absent := False
							plane_all_absent := False
						end
						a_segment.put (a_value, k)
						k := k + 1
					end
					if segment_all_absent then
						a_segment_array_name := Empty_lower_code_segment_array_name
						if not empty_segment_written then
							empty_segment_written := True
							write_integer_segment (a_segment, Empty_lower_code_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "lower_code_plane_" + i.out + "_segment_" + j.out
						write_integer_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_absent then
					a_plane_array_name := Empty_lower_code_plane_array_name
					if not empty_plane_written then
						empty_plane_written := True
						write_empty_integer_plane (a_plane_array_name, Empty_lower_code_segment_array_name, an_output_file)
					end
				else
					a_plane_array_name := "lower_code_plane_" + i.out
					write_integer_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tlower_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]] is%N")
			an_output_file.put_string ("%T%T%T-- Lower case code points for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_upper_case_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing upper case equivalents.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k, a_code, a_value: INTEGER
			a_code_datum: GEUC_UNICODE_DATA
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_absent, segment_all_absent: BOOLEAN
			empty_plane_written, empty_segment_written: BOOLEAN
			a_segment: ARRAY [INTEGER]
			a_plane_array_name, a_segment_array_name: STRING
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_absent := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_absent := True
					from k := 0 until k > 255 loop
						a_code := k + 256 * j + 256 * 256 * i
						a_code_datum := codes.item (a_code)
						if a_code_datum = Void then
							a_value := -1
						else
							a_value := a_code_datum.upper_code
						end
						if a_value /= - 1 then
							segment_all_absent := False
							plane_all_absent := False
						end
						a_segment.put (a_value, k)
						k := k + 1
					end
					if segment_all_absent then
						a_segment_array_name := Empty_upper_code_segment_array_name
						if not empty_segment_written then
							empty_segment_written := True
							write_integer_segment (a_segment, Empty_upper_code_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "upper_code_plane_" + i.out + "_segment_" + j.out
						write_integer_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_absent then
					a_plane_array_name := Empty_upper_code_plane_array_name
					if not empty_plane_written then
						empty_plane_written := True
						write_empty_integer_plane (a_plane_array_name, Empty_upper_code_segment_array_name, an_output_file)
					end
				else
					a_plane_array_name := "upper_code_plane_" + i.out
					write_integer_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Tupper_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]] is%N")
			an_output_file.put_string ("%T%T%T-- Upper case code points for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_title_case_array (an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an Eiffel 'ARRAY' containing title case equivalents.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
		local
			i, j, k, a_code, a_value: INTEGER
			a_code_datum: GEUC_UNICODE_DATA
			some_segment_names, some_plane_names: ARRAY [STRING]
			plane_all_absent, segment_all_absent: BOOLEAN
			empty_plane_written, empty_segment_written: BOOLEAN
			a_segment: ARRAY [INTEGER]
			a_plane_array_name, a_segment_array_name: STRING
		do
			create some_plane_names.make (0, 16)
			from i := 0 until i > 16 loop
				create some_segment_names.make (0, 255)
				plane_all_absent := True
				from j := 0 until j > 255 loop
					create a_segment.make (0, 255)
					segment_all_absent := True
					from k := 0 until k > 255 loop
						a_code := k + 256 * j + 256 * 256 * i
						a_code_datum := codes.item (a_code)
						if a_code_datum = Void then
							a_value := -1
						else
							a_value := a_code_datum.title_code
						end
						if a_value /= - 1 then
							segment_all_absent := False
							plane_all_absent := False
						end
						a_segment.put (a_value, k)
						k := k + 1
					end
					if segment_all_absent then
						a_segment_array_name := Empty_title_code_segment_array_name
						if not empty_segment_written then
							empty_segment_written := True
							write_integer_segment (a_segment, Empty_title_code_segment_array_name, an_output_file)
						end
					else
						a_segment_array_name := "title_code_plane_" + i.out + "_segment_" + j.out
						write_integer_segment (a_segment, a_segment_array_name, an_output_file)
					end
					some_segment_names.put (a_segment_array_name, j)
					j := j + 1
				end
				if plane_all_absent then
					a_plane_array_name := Empty_title_code_plane_array_name
					if not empty_plane_written then
						empty_plane_written := True
						write_empty_integer_plane (a_plane_array_name, Empty_title_code_segment_array_name, an_output_file)
					end
				else
					a_plane_array_name := "title_code_plane_" + i.out
					write_integer_plane (some_segment_names, a_plane_array_name, an_output_file)
				end
				some_plane_names.put (a_plane_array_name, i)
				i := i + 1
			end
			an_output_file.put_string ("%Ttitle_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]] is%N")
			an_output_file.put_string ("%T%T%T-- Title case code points for each code point%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (17)%N")
			from i := 0 until i > 16 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_plane_names.item (i))
				an_output_file.put_string (", ")
				an_output_file.put_string (i.out)
				an_output_file.put_string (")%N")
				i := i + 1
			end
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	 write_integer8_plane (some_segment_names: ARRAY [STRING]; a_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane `a_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_array_names_not_void: some_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_name)
			an_output_file.put_string (": SPECIAL [ARRAY [INTEGER_8]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated character class array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from  until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_segment_names.item (an_index))
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_empty_integer8_plane (a_plane_name, a_segment_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an empty character-class plane to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_plane_name)
			an_output_file.put_string (": SPECIAL [ARRAY [INTEGER_8]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated character class array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (a_segment_name)
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_integer8_segment (a_segment: ARRAY [INTEGER_8]; a_segment_array_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for `a_segment', named `a_segment_array_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			an_index, a_value: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_segment_array_name)
			an_output_file.put_string (": ARRAY [INTEGER_8] is%N")
			an_output_file.put_string ("%T%T%T-- Generated character class array segment%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%TResult := string_to_array8 (%"")
			from until an_index > 255 loop
				a_value := a_segment.item (an_index)
				an_output_file.put_string ("%%/" + a_value.out + "/")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%")%N")
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_integer_plane (some_segment_names: ARRAY [STRING]; a_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane `a_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_array_names_not_void: some_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_name)
			an_output_file.put_string (": SPECIAL [ARRAY [INTEGER]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_segment_names.item (an_index))
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_empty_integer_plane (a_plane_name, a_segment_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an empty code plane to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_plane_name)
			an_output_file.put_string (": SPECIAL [ARRAY [INTEGER]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (a_segment_name)
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_integer_segment (a_segment: ARRAY [INTEGER]; a_segment_array_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for `a_segment', named `a_segment_array_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_segment_array_name)
			an_output_file.put_string (": ARRAY [INTEGER] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array segment%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%TResult := <<%N%T%T%TINTEGER_.to_integer (")
			from until an_index > 255 loop
				an_output_file.put_string (a_segment.item (an_index).out)
				if an_index = 0 then
					an_output_file.put_string (")")
				end
				if an_index = 255 then
				   an_output_file.put_string (">>")
				else
					an_output_file.put_string (",")
				end
				if an_index \\ 10 = 0 then
					an_output_file.put_string ("%N%T%T%T")
				end
				an_index := an_index + 1
			end
			an_output_file.put_string ("%N")
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%Tend%N%N")

		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_empty_integer_list_plane (a_plane_name, a_segment_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for an empty code plane to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_plane_name)
			an_output_file.put_string (": SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (a_segment_name)
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_integer_list_plane (some_segment_names: ARRAY [STRING]; a_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane `a_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_array_names_not_void: some_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_name)
			an_output_file.put_string (": SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_segment_names.item (an_index))
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_integer_list_segment (a_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]; a_segment_array_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE; all_empty: BOOLEAN) is
			-- Write code for `a_segment', named `a_segment_array_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			an_index, j: INTEGER
			a_list: DS_ARRAYED_LIST [INTEGER]
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_segment_array_name)
			an_output_file.put_string (": ARRAY [DS_ARRAYED_LIST [INTEGER]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated arrayed_list segment%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (0, 255)%N")
			if not all_empty then
				from until an_index > 255 loop
					a_list := a_segment.item (an_index)
					if a_list /= Void then
						j := a_list.count
						if j = 1 then
							an_output_file.put_string ("%T%T%TResult.put (new_singleton (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 2 then
							an_output_file.put_string ("%T%T%TResult.put (new_pair (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 3 then
							an_output_file.put_string ("%T%T%TResult.put (new_triple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 4 then
							an_output_file.put_string ("%T%T%TResult.put (new_quadruple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (4).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 5 then
							an_output_file.put_string ("%T%T%TResult.put (new_quintuple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (4).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (5).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 6 then
							an_output_file.put_string ("%T%T%TResult.put (new_sextuple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (4).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (5).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (6).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 7 then
							an_output_file.put_string ("%T%T%TResult.put (new_heptuple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (4).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (5).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (6).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (7).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 8 then
							an_output_file.put_string ("%T%T%TResult.put (new_octuple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (4).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (5).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (6).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (7).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (8).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						elseif j = 18 then
							an_output_file.put_string ("%T%T%TResult.put (new_eighteen_tuple (")
							an_output_file.put_string (a_list.item (1).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (2).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (3).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (4).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (5).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (6).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (7).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (8).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (9).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (10).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (11).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (12).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (13).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (14).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (15).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (16).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (17).out)
							an_output_file.put_string (",")
							an_output_file.put_string (a_list.item (18).out)
							an_output_file.put_string ("),")
							an_output_file.put_string (an_index.out)
							an_output_file.put_string (")%N")
						else
							report_general_message ("Integer list too long - count = " + j.out)
							Exceptions.die (1)
						end
					end
					an_index := an_index + 1
				end
			end
			an_output_file.put_string ("%N")
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_boolean_plane (some_segment_names: ARRAY [STRING]; a_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane `a_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_array_names_not_void: some_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_name)
			an_output_file.put_string (": SPECIAL [ARRAY [BOOLEAN]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			from until an_index > 255 loop
				an_output_file.put_string ("%T%T%TResult.put (")
				an_output_file.put_string (some_segment_names.item (an_index))
				an_output_file.put_string (", ")
				an_output_file.put_string (an_index.out)
				an_output_file.put_string (")%N")
				an_index := an_index + 1
			end
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_all_false_boolean_plane (a_plane_name, a_segment_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for plane where every value is `False' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_plane_name)
			an_output_file.put_string (": SPECIAL [ARRAY [BOOLEAN]] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array plane%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%Tcreate Result.make (256)%N")
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%T%Tsub_arrays_not_void: True -- all items are non-Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_boolean_segment (a_segment: ARRAY [BOOLEAN]; a_segment_array_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for `a_segment', named `a_segment_array_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			an_index: INTEGER
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_segment_array_name)
			an_output_file.put_string (": ARRAY [BOOLEAN] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array segment%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%TResult := <<%N%T%T")
			from  until an_index > 255 loop
				an_output_file.put_string (a_segment.item (an_index).out)
				if an_index = 255 then
				   an_output_file.put_string (">>")
				else
					an_output_file.put_string (",")
				end
				if an_index \\ 10 = 0 then
					an_output_file.put_string ("%N%T%T%T")
				end
				an_index := an_index + 1
			end
			an_output_file.put_string ("%N")
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	write_tristate_segment (a_segment: ARRAY [UT_TRISTATE]; a_segment_array_name: STRING; an_output_file: KL_TEXT_OUTPUT_FILE) is
			-- Write code for `a_segment', named `a_segment_array_name' to `an_output_file'.
		require
			file_not_void: an_output_file /= Void
			file_open_write: an_output_file.is_open_write
			segment_not_void: a_segment /= Void
			-- no_void_segment_item: not a_segment.has (Void)
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			an_index: INTEGER
			a_state: UT_TRISTATE
		do
			an_output_file.put_string ("%T")
			an_output_file.put_string (a_segment_array_name)
			an_output_file.put_string (": ARRAY [CHARACTER] is%N")
			an_output_file.put_string ("%T%T%T-- Generated array segment%N")
			an_output_file.put_string ("%T%Tonce%N")
			an_output_file.put_string ("%T%T%TResult := <<")
			from until an_index > 255 loop
				a_state := a_segment.item (an_index)
				if a_state.is_true then
					an_output_file.put_string ("'%%/1/'")
				elseif a_state.is_false then
					an_output_file.put_string ("'%%/0/'")
				else
					an_output_file.put_string ("'%%/2/'")
				end
				if an_index = 255 then
					an_output_file.put_string (">>%N")
				else
					an_output_file.put_string (",")
					if an_index \\ 10 = 0 then
						an_output_file.put_string ("%N")
					end
				end
				an_index := an_index + 1
			end
			an_output_file.put_string ("%N")
			an_output_file.put_string ("%T%Tensure%N")
			an_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			an_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: an_output_file.is_open_write
		end

	process_code_class (a_code: INTEGER; a_name: STRING; some_fields: DS_LIST [STRING]) is
			-- Process character class et. el. for `a_code'.
		require
			name_not_void: a_name /= Void
			fields_not_void: some_fields /= Void
			fifteen_fields: some_fields.count = Field_count
		local
			a_data_point: GEUC_UNICODE_DATA
		do
			create a_data_point.make (a_code, a_name, some_fields)
			if a_data_point.is_valid then
				codes.put (a_data_point, a_code)
			else
				report_general_message ("Invalid code point: " + a_code.out)
				Exceptions.die (1)
			end
		end

	upper_case_array: ARRAY [BOOLEAN]
			-- Values for `Uppercase_property'

	lower_case_array: ARRAY [BOOLEAN]
			-- Values for `Lowercase_property'

	alphabetic_array: ARRAY [BOOLEAN]
			-- Values for `Alphabetic_property'

	math_array: ARRAY [BOOLEAN]
			-- Values for `math_property'

	full_composition_exclusion_array: ARRAY [BOOLEAN]
			-- Values for `Full_composition_exclusion_property'

	expands_on_nfc_array: ARRAY [BOOLEAN]
			-- Values for `Expands_on_nfc_property'

	expands_on_nfd_array: ARRAY [BOOLEAN]
			-- Values for `Expands_on_nfd_property'

	expands_on_nfkc_array: ARRAY [BOOLEAN]
			-- Values for `Expands_on_nfkc_property'

	expands_on_nfkd_array: ARRAY [BOOLEAN]
			-- Values for `Expands_on_nfkd_property'

	nfd_quick_check_array: ARRAY [UT_TRISTATE]
			-- Values for `Nfd_quick_check_property'

	nfc_quick_check_array: ARRAY [UT_TRISTATE]
			-- Values for `Nfc_quick_check_property'

	nfkd_quick_check_array: ARRAY [UT_TRISTATE]
			-- Values for `Nfkd_quick_check_property'

	nfkc_quick_check_array: ARRAY [UT_TRISTATE]
			-- Values for `Nfkc_quick_check_property'

	initialize_derived_core_properties is
			-- Create arrays for derived core properties.
		require
			upper_case_array_void: upper_case_array = Void
			lower_case_array_void: lower_case_array = Void
			alphabetic_array_void: alphabetic_array = Void
			math_array_void: math_array = Void
		do
			create upper_case_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create lower_case_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create alphabetic_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create math_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
		ensure
			upper_case_array_not_void: upper_case_array /= Void
			lower_case_array_not_void: lower_case_array /= Void
			alphabetic_array_not_void: alphabetic_array /= Void
			math_array_not_void: math_array /= Void
		end

	initialize_derived_normalization_properties is
			-- Create arrays for derived normalization properties.
		require
			full_composition_exclusion_array_void: full_composition_exclusion_array = Void
			expands_on_nfc_array_void: expands_on_nfc_array = Void
			expands_on_nfd_array_void: expands_on_nfd_array = Void
			expands_on_nfkc_array_void: expands_on_nfkc_array = Void
			expands_on_nfkd_array_void: expands_on_nfkd_array = Void
			nfd_quick_check_array_void: nfd_quick_check_array = Void
			nfc_quick_check_array_void: nfc_quick_check_array = Void
			nfkd_quick_check_array_void: nfkd_quick_check_array = Void
			nfkc_quick_check_array_void: nfkc_quick_check_array = Void
		do
			create full_composition_exclusion_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfc_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfd_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfkc_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfkd_array.make (minimum_unicode_character_code, maximum_unicode_character_code)
			create nfd_quick_check_array.make (minimum_unicode_character_code, maximum_unicode_character_code); set_array_tristate_true (nfd_quick_check_array)
			create nfc_quick_check_array.make (minimum_unicode_character_code, maximum_unicode_character_code); set_array_tristate_true (nfc_quick_check_array)
			create nfkd_quick_check_array.make (minimum_unicode_character_code, maximum_unicode_character_code); set_array_tristate_true (nfkd_quick_check_array)
			create nfkc_quick_check_array.make (minimum_unicode_character_code, maximum_unicode_character_code); set_array_tristate_true (nfkc_quick_check_array)
		ensure
			full_composition_exclusion_array_not_void: full_composition_exclusion_array /= Void
			expands_on_nfc_array_not_void: expands_on_nfc_array /= Void
			expands_on_nfd_array_not_void: expands_on_nfd_array /= Void
			expands_on_nfkc_array_not_void: expands_on_nfkc_array /= Void
			expands_on_nfkd_array_not_void: expands_on_nfkd_array /= Void
			nfd_quick_check_array_not_void: nfd_quick_check_array /= Void
			nfc_quick_check_array_not_void: nfc_quick_check_array /= Void
			nfkd_quick_check_array_not_void: nfkd_quick_check_array /= Void
			nfkc_quick_check_array_not_void: nfkc_quick_check_array /= Void
		end

	set_upper_case_property (a_range: STRING) is
			-- Set `Uppercase_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				upper_case_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_lower_case_property (a_range: STRING) is
			-- Set `Lowercase_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				lower_case_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_alphabetic_property (a_range: STRING) is
			-- Set `Alphabetic_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				alphabetic_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_math_property (a_range: STRING) is
			-- Set `Math_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				math_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_full_composition_exclusion_property (a_range: STRING) is
			-- Set `Full_composition_exclusion_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				full_composition_exclusion_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_nfc_property (a_range: STRING) is
			-- Set `Expands_on_nfc_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				expands_on_nfc_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_nfd_property (a_range: STRING) is
			-- Set `Expands_on_nfd_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				expands_on_nfd_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_nfkc_property (a_range: STRING) is
			-- Set `Expands_on_nfkc_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				expands_on_nfkc_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_nfkd_property (a_range: STRING) is
			-- Set `Expands_on_nfkd_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				expands_on_nfkd_array.put (True, a_code)
				a_code := a_code + 1
			end
		end

	set_nfd_quick_check_property (a_value, a_range: STRING) is
			-- Set `Nfd_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfd_quick_check_array /= Void -- and then not nfd_quick_check_array.has (Void)
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfd_quick_check_array.item (a_code).set_false
				else
					nfd_quick_check_array.item (a_code).set_undefined
				end
				a_code := a_code + 1
			end
		end

	set_nfc_quick_check_property (a_value, a_range: STRING) is
			-- Set `Nfc_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfc_quick_check_array /= Void -- and then not nfc_quick_check_array.has (Void)
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfc_quick_check_array.item (a_code).set_false
				else
					nfc_quick_check_array.item (a_code).set_undefined
				end
				a_code := a_code + 1
			end
		end

	set_nfkd_quick_check_property (a_value, a_range: STRING) is
			-- Set `Nfkd_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfkd_quick_check_array /= Void -- and then not nfkd_quick_check_array.has (Void)
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfkd_quick_check_array.item (a_code).set_false
				else
					nfkd_quick_check_array.item (a_code).set_undefined
				end
				a_code := a_code + 1
			end
		end

	set_nfkc_quick_check_property (a_value, a_range: STRING) is
			-- Set `Nfkc_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfkc_quick_check_array /= Void -- and then not nfkc_quick_check_array.has (Void)
		local
			a_code, a_finish: INTEGER
		do
			from
				a_code := starting_code (a_range)
				a_finish := ending_code (a_range)
			until
				a_code > a_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfkc_quick_check_array.item (a_code).set_false
				else
					nfkc_quick_check_array.item (a_code).set_undefined
				end
				a_code := a_code + 1
			end
		end

	starting_code (a_code_range: STRING): INTEGER is
			-- Starting code-point within `a_code_range'.
		require
			range_not_void: a_code_range /= Void
			range_not_empty: not a_code_range.is_empty
			no_comment: a_code_range.index_of ('#', 1) = 0
		local
			a_splitter: ST_SPLITTER
			some_codes: DS_LIST [STRING]
			a_range: STRING
			a_count: INTEGER
		do
			a_range := STRING_.cloned_string (a_code_range)
			STRING_.left_adjust (a_range)
			STRING_.right_adjust (a_range)
			create a_splitter.make_with_separators ("..")
			some_codes := a_splitter.split_greedy (a_range)
			a_count := some_codes.count
			if a_count = 1 or a_count = 3 then
				if a_count = 3 and then not some_codes.item (2).is_empty then
					report_general_message ("Invalid hexadecimal code point range: " + a_code_range)
					Exceptions.die (1)
				elseif STRING_.is_hexadecimal (some_codes.item (1)) then
					Result := STRING_.hexadecimal_to_integer (some_codes.item (1))
				else
					report_general_message ("Invalid initial hexadecimal code point: " + some_codes.item (1))
					Exceptions.die (1)
				end
			else
				report_general_message ("Invalid code point range: " + a_code_range.out)
				Exceptions.die (1)
			end
		end

	ending_code (a_code_range: STRING): INTEGER is
			-- Ending code-point within `a_code_range'.
		require
			range_not_void: a_code_range /= Void
			range_not_empty: not a_code_range.is_empty
			no_comment: a_code_range.index_of ('#', 1) = 0
		local
			a_splitter: ST_SPLITTER
			some_codes: DS_LIST [STRING]
			a_range: STRING
			a_count: INTEGER
		do
			a_range := STRING_.cloned_string (a_code_range)
			STRING_.left_adjust (a_range)
			STRING_.right_adjust (a_range)
			create a_splitter.make_with_separators ("..")
			some_codes := a_splitter.split_greedy (a_range)
			a_count := some_codes.count
			if a_count = 1 then
				if STRING_.is_hexadecimal (some_codes.item (1)) then
					Result := STRING_.hexadecimal_to_integer (some_codes.item (1))
				else
					report_general_message ("Invalid initial hexadecimal code point: " + some_codes.item (1))
					Exceptions.die (1)
				end
			elseif a_count = 3 then
				if not some_codes.item (2).is_empty then
					report_general_message ("Invalid hexadecimal code point range: " + a_code_range)
					Exceptions.die (1)
				elseif STRING_.is_hexadecimal (some_codes.item (3)) then
					Result := STRING_.hexadecimal_to_integer (some_codes.item (3))
				else
					report_general_message ("Invalid final hexadecimal code: " + some_codes.item (2))
					Exceptions.die (1)
				end
			else
				report_general_message ("Invalid code point range: " + a_code_range.out)
				Exceptions.die (1)
			end
		end

	check_tristate_property (some_fields: DS_LIST [STRING]; a_line: STRING) is
			-- Check `some_fields' has a valid tri-state property value.
		require
			some_fields_not_void: some_fields /= Void
			line_not_void: a_line /= Void
			line_not_empty: not a_line.is_empty
		local
			a_value: STRING
		do
			if some_fields.count /= 3 then
				report_general_message ("Exactly three fields must be present for a three-valued boolean property. Found: " + a_line)
				Exceptions.die (1)
			else
				a_value := some_fields.item (3)
				STRING_.left_adjust (a_value)
				STRING_.right_adjust (a_value)
				if STRING_.same_string ("M", a_value) then
					-- Maybe - OK
				elseif STRING_.same_string ("N", a_value) then
					-- No - OK
				else
					report_general_message ("Three-valued boolean property must be 'N' or 'M'. Found: " + a_value)
					Exceptions.die (1)
				end
			end
		ensure
			three_fields: some_fields.count = 3
			good_value: True -- 'M' or 'N'
		end

	set_array_tristate_true (an_array: ARRAY [UT_TRISTATE]) is
			-- Set all `an_array' to true.
		require
			array_not_void: an_array /= Void
		local
			a_true: UT_TRISTATE
			i, nb: INTEGER
		do
			i := an_array.lower
			nb := an_array.upper
			from until i > nb loop
				create a_true.make_true
				an_array.put (a_true, i)
				i := i + 1
			end
		ensure
			-- no_void_items: not an_array.has (Void)
			all_true: True
		end

	is_combining_class (a_class: INTEGER): BOOLEAN is
			-- Is `a_class' a valid canonical combining class?
			-- Algorithm comes from inspecting values in UCD.
		do
			inspect a_class
			when 0, 1, 7, 8, 9, 10 then
				Result := True
			when
				11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
				21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
				31, 32, 33, 34, 35, 36
			then
				Result := True
			when 84, 91, 103, 107, 118, 122, 129, 130, 132 then
				Result := True
			when 199, 200, 202, 204, 208, 210, 212, 214 then
				Result := True
			when 216, 218, 220, 222, 224, 226, 228, 230, 232, 233, 234, 240 then
				Result := True
			end
		end

	projected_combining_class (a_class: INTEGER): INTEGER_8 is
			-- Canonical combining class projected onto a small set of integers
		require
			valid_combining_class: is_combining_class (a_class)
		do
			inspect a_class
			when 0 then
				Result := INTEGER_.to_integer_8 (0)
			when 1 then
				Result := INTEGER_.to_integer_8 (1)
			when 7 then
				Result := INTEGER_.to_integer_8 (2)
			when 8 then
				Result := INTEGER_.to_integer_8 (3)
			when 9 then
				Result := INTEGER_.to_integer_8 (4)
			when 10 then
				Result := INTEGER_.to_integer_8 (5)
			when
				11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
				21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
				31, 32, 33, 34, 35, 36
			then
				Result := INTEGER_.to_integer_8 (a_class - 5)
			when 84 then
				Result := INTEGER_.to_integer_8 (32)
			when 91 then
				Result := INTEGER_.to_integer_8 (33)
			when 103 then
				Result := INTEGER_.to_integer_8 (34)
			when 107 then
				Result := INTEGER_.to_integer_8 (35)
			when 118 then
				Result := INTEGER_.to_integer_8 (36)
			when 122 then
				Result := INTEGER_.to_integer_8 (37)
			when 129 then
				Result := INTEGER_.to_integer_8 (38)
			when 130 then
				Result := INTEGER_.to_integer_8 (39)
			when 132 then
				Result := INTEGER_.to_integer_8 (40)
			when 199 then
				Result := INTEGER_.to_integer_8 (41)
			when 200 then
				Result := INTEGER_.to_integer_8 (42)
			when 202 then
				Result := INTEGER_.to_integer_8 (43)
			when 204 then
				Result := INTEGER_.to_integer_8 (44)
			when 208 then
				Result := INTEGER_.to_integer_8 (45)
			when 210 then
				Result := INTEGER_.to_integer_8 (46)
			when 212 then
				Result := INTEGER_.to_integer_8 (47)
			when 214 then
				Result := INTEGER_.to_integer_8 (48)
			when 216 then
				Result := INTEGER_.to_integer_8 (49)
			when 218 then
				Result := INTEGER_.to_integer_8 (50)
			when 220 then
				Result := INTEGER_.to_integer_8 (51)
			when 222 then
				Result := INTEGER_.to_integer_8 (52)
			when 224 then
				Result := INTEGER_.to_integer_8 (53)
			when 226 then
				Result := INTEGER_.to_integer_8 (54)
			when 228 then
				Result := INTEGER_.to_integer_8 (55)
			when 230 then
				Result := INTEGER_.to_integer_8 (56)
			when 232 then
				Result := INTEGER_.to_integer_8 (57)
			when 233 then
				Result := INTEGER_.to_integer_8 (58)
			when 234 then
				Result := INTEGER_.to_integer_8 (59)
			when 240 then
				Result := INTEGER_.to_integer_8 (60)
			end
		ensure
			positive_number: Result >= 0
		end

invariant

	error_handler_not_void: error_handler /= Void

end
