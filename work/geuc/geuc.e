note

	description:

		"Gobo Eiffel generator for Unicode Classes"

	copyright: "Copyright (c) 2005-2012, Colin Adams and others"
	license: "MIT License"
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

	UC_UTF8_ROUTINES
		export {NONE} all end

	UC_IMPORTED_UNICODE_ROUTINES

	GEUC_CONSTANTS

create

	execute

feature -- Execution

	execute
			-- Start 'geuc' execution.
		do
			Arguments.set_program_name ("geuc")
			create error_handler.make_standard
			process_command_line
			create codes.make_filled (Void, minimum_unicode_character_code, maximum_unicode_character_code)
			parse_character_classes
			parse_derived_core_properties
			parse_derived_normalization_properties
			parse_special_casing
			generate_character_class_routines
			generate_lower_case_routines
			generate_upper_case_routines
			generate_title_case_routines
			generate_normalization_routines
			generate_full_casing_routines
		end

feature -- Processing

	process_command_line
			-- Process command line arguments.
		local
			nb: INTEGER
			arg: STRING
			l_version: INTEGER
		do
			nb := Arguments.argument_count
			if nb = 1 then
				arg := Arguments.argument (1)
				if arg.count > 10 and then arg.substring (1, 13).is_equal ("--uc_version=") then
					if arg.substring (14, arg.count).is_integer then
						l_version := arg.substring (14, arg.count).to_integer
						if l_version < 100 then
							report_usage_message
						else
							kernel_file_name_prefix := "uc_v" + arg.substring (14, arg.count).as_lower + "_"
							file_name_prefix := "st_unicode_v" + arg.substring (14, arg.count).as_lower + "_"
							update_version := l_version \\ 10
							major_version := l_version // 100
							minor_version := (l_version - major_version * 100 - update_version) // 10
						end
					else
						report_usage_message
					end
				else
					report_usage_message
				end
			else
				report_usage_message
			end
		ensure
			kernel_file_name_prefix_void: kernel_file_name_prefix /= Void
		end

	parse_character_classes
			-- Parse `Unicode_data' for character classes, etc.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_splitter: ST_SPLITTER
			l_fields: DS_LIST [STRING]
			l_hex_code, l_name: STRING
			l_code, i: INTEGER
		do
			create l_file.make (Unicode_data)
			create l_splitter.make_with_separators (";")
			l_file.open_read
			if l_file.is_open_read then
				from  until l_file.end_of_file loop
					l_file.read_line
					if not l_file.end_of_file then
						l_fields := l_splitter.split_greedy (l_file.last_string)
						if l_fields.count /= Field_count then
							report_general_message ("Bad data line in " + Unicode_data + " - not enough fields - data line is: " + l_file.last_string)
							Exceptions.die (1)
						else
							l_hex_code := l_fields.item (1)
							l_name := l_fields.item (2)
							if STRING_.is_hexadecimal (l_hex_code) then
								l_code := STRING_.hexadecimal_to_integer (l_hex_code)
								if is_range_start (l_name) then
									initial_code := l_code
								elseif is_range_finish (l_name) then
									if initial_code <= 0 or else initial_code > l_code then
										report_general_message ("Invalid start range - data line for end of range is: " + l_file.last_string)
										Exceptions.die (1)
									else
										from i := initial_code until i > l_code loop
											process_code_class (i, l_name.substring (2, l_name.count - 7), l_fields)
											i := i + 1
										end
									end
								else
									process_code_class (l_code, l_name, l_fields)
								end
							else
								report_general_message ("Invalid code point - data line is: " + l_file.last_string)
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

	parse_derived_core_properties
			-- Parse `Derived_core_properties'.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_splitter: ST_SPLITTER
			l_fields: DS_LIST [STRING]
			l_line, l_property: STRING
			l_hash: INTEGER
		do
			create l_file.make (Derived_core_properties)
			l_file.open_read
			if l_file.is_open_read then
				initialize_derived_core_properties
				from  until l_file.end_of_file loop
					l_file.read_line
					if not l_file.end_of_file then
						l_line := l_file.last_string
						l_hash :=  l_line.index_of ('#', 1)
						if l_hash > 0 then
								-- Strip comments.
							l_line := l_line.substring (1, l_hash - 1)
						end
						if not l_line.is_empty then
							create l_splitter.make_with_separators (";")
							l_fields := l_splitter.split_greedy (l_line)
							if l_fields.count /= 2 then
								report_general_message (Derived_core_properties + " must have precisely two fields. Found: " + l_file.last_string)
								Exceptions.die (1)
							else
								l_property := l_fields.item (2)
								STRING_.left_adjust (l_property)
								STRING_.right_adjust (l_property)
								if STRING_.same_string (l_property, Alphabetic_property) then
									set_alphabetic_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Default_ignorable_code_property) then
								elseif STRING_.same_string (l_property, Lowercase_property) then
									set_lower_case_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Grapheme_base_property) then
								elseif STRING_.same_string (l_property, Grapheme_extend_property) then
								elseif STRING_.same_string (l_property, Id_start_property) then
								elseif STRING_.same_string (l_property, Id_continue_property) then
								elseif STRING_.same_string (l_property, Math_property) then
									set_math_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Uppercase_property) then
									set_upper_case_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Xid_start_property) then
								elseif STRING_.same_string (l_property, Xid_continue_property) then
								elseif STRING_.same_string (l_property, Grapheme_link_property) then
								else
									report_general_message ("Unknown property name " + l_property + " in " + Derived_core_properties)
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

	parse_derived_normalization_properties
			-- Parse `Derived_normalization_properties'.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_splitter: ST_SPLITTER
			l_fields: DS_LIST [STRING]
			l_line, l_property: STRING
			l_hash: INTEGER
		do
			create l_file.make (Derived_normalization_properties)
			l_file.open_read
			if l_file.is_open_read then
				initialize_derived_normalization_properties
				from until l_file.end_of_file loop
					l_file.read_line
					if not l_file.end_of_file then
						l_line := l_file.last_string
						l_hash :=  l_line.index_of ('#', 1)
						if l_hash > 0 then
								-- Strip comments.
							l_line := l_line.substring (1, l_hash - 1)
						end
						if not l_line.is_empty then
							create l_splitter.make_with_separators (";")
							l_fields := l_splitter.split_greedy (l_line)
							if l_fields.count < 2 then
								report_general_message (Derived_normalization_properties + " must have at least two fields. Found: " + l_file.last_string)
								Exceptions.die (1)
							else
								l_property := l_fields.item (2)
								STRING_.left_adjust (l_property)
								STRING_.right_adjust (l_property)
								if STRING_.same_string (l_property, Expands_on_nfc_property) then
									set_nfc_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Expands_on_nfd_property) then
									set_nfd_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Expands_on_nfkc_property) then
									set_nfkc_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Expands_on_nfkd_property) then
									set_nfkd_property (l_fields.item (1))
								elseif STRING_.same_string (l_property, Fold_case_nfkc_closure_property) then
								elseif STRING_.same_string (l_property, Nfd_quick_check_property) then
									check_tristate_property (l_fields, l_file.last_string)
									l_property := l_fields.item (3)
									STRING_.left_adjust (l_property)
									STRING_.right_adjust (l_property)
									set_nfd_quick_check_property (l_property, l_fields.item (1))
								elseif STRING_.same_string (l_property, Nfc_quick_check_property) then
									check_tristate_property (l_fields, l_file.last_string)
									l_property := l_fields.item (3)
									STRING_.left_adjust (l_property)
									STRING_.right_adjust (l_property)
									set_nfc_quick_check_property (l_property, l_fields.item (1))
								elseif STRING_.same_string (l_property, Nfkd_quick_check_property) then
									check_tristate_property (l_fields, l_file.last_string)
									l_property := l_fields.item (3)
									STRING_.left_adjust (l_property)
									STRING_.right_adjust (l_property)
									set_nfkd_quick_check_property (l_property, l_fields.item (1))
								elseif STRING_.same_string (l_property, Nfkc_quick_check_property) then
									check_tristate_property (l_fields, l_file.last_string)
									l_property := l_fields.item (3)
									STRING_.left_adjust (l_property)
									STRING_.right_adjust (l_property)
									set_nfkc_quick_check_property (l_property, l_fields.item (1))
								elseif STRING_.same_string (l_property, Full_composition_exclusion_property) then
									set_full_composition_exclusion_property (l_fields.item (1))
								else
									report_general_message ("Unknown property name " + l_property + " in " + Derived_normalization_properties)
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

	parse_special_casing
			-- Parse `Special_casing'.
		local
			l_file: KL_TEXT_INPUT_FILE
			l_splitter: ST_SPLITTER
			l_fields: DS_LIST [STRING]
			l_line, l_lower, l_title, l_upper, l_condition: STRING
			l_hash: INTEGER
			l_condition_present: BOOLEAN
			l_hex_code: STRING
			l_code: INTEGER
		do
			create l_file.make (Special_casing)
			l_file.open_read
			if l_file.is_open_read then
				from until l_file.end_of_file loop
					l_file.read_line
					if not l_file.end_of_file then
						l_line := l_file.last_string
						l_hash :=  l_line.index_of ('#', 1)
						if l_hash > 0 then
								-- Strip comments.
							l_line := l_line.substring (1, l_hash - 1)
						end
						if not l_line.is_empty then
							create l_splitter.make_with_separators (";")
							l_fields := l_splitter.split_greedy (l_line)
							if l_fields.count < 4 then
								report_general_message (Special_casing + " must have at least four fields. Found: " + l_file.last_string)
								Exceptions.die (1)
							elseif l_fields.count > 6 then
								report_general_message (Special_casing + " must have no more than six fields. Found: " + l_file.last_string)
								Exceptions.die (1)
							else
								l_condition_present := False
								if l_fields.count >= 5 then
									l_condition := l_fields.item (5)
									l_condition.left_adjust
									l_condition.right_adjust
									if not l_condition.is_empty then
										l_condition_present := True
									end
								end
								if not l_condition_present then
									l_hex_code := l_fields.item (1)
									if STRING_.is_hexadecimal (l_hex_code) then
										l_code := STRING_.hexadecimal_to_integer (l_hex_code)
									else
										report_general_message ("Invalid code point - data line is: " + l_file.last_string)
										Exceptions.die (1)
									end
									l_lower := l_fields.item (2)
									l_title := l_fields.item (3)
									l_upper := l_fields.item (4)
									STRING_.left_adjust (l_lower)
									STRING_.right_adjust (l_lower)
									STRING_.left_adjust (l_title)
									STRING_.right_adjust (l_title)
									STRING_.left_adjust (l_upper)
									STRING_.right_adjust (l_upper)
									process_full_mapping_data (l_code, l_lower, l_title, l_upper)
								end
							end
						end
					end
				end
			else
				report_general_message ("Unable to open file " + Special_casing + " for reading")
				Exceptions.die (1)
			end
		end

feature -- Code generation

	kernel_file_name_prefix: STRING
			-- Prefix for generated kernel file names

	file_name_prefix: STRING
			-- Prefix for other generated file names

	kernel_class_name_prefix: STRING
			-- Prefix for generated kernel class names
		require
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
		do
			Result := kernel_file_name_prefix.as_upper
		ensure
			kernel_class_name_prefix_not_void: Result /= Void
		end

	class_name_prefix: STRING
			-- Prefix for other generated class names
		require
			file_name_prefix_not_void: file_name_prefix /= Void
		do
			Result := file_name_prefix.as_upper
		ensure
			class_name_prefix_not_void: Result /= Void
		end

	generate_character_class_routines
			-- Generate character class routines from `codes' data.
		require
			codes_not_void: codes /= Void
			file_name_prefix_not_void: file_name_prefix /= Void
			class_name_prefix_not_void: class_name_prefix /= Void
		local
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_output_file.make (file_name_prefix + "character_class_routines.e")
			l_output_file.open_write
			l_output_file.put_string ("note%N%N")
			l_output_file.put_string ("%Tdescription:%N%N")
			l_output_file.put_string ("%T%T%"Routines for determining class of Unicode characters%"%N%N")
			l_output_file.put_string ("%Tgenerator: %"geuc%"%N%N")
			l_output_file.put_string ("%Tlibrary: %"Gobo Eiffel String Library%"%N")
			l_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			l_output_file.put_string ("%Tlicense: %"MIT License%"%N")
			l_output_file.put_string ("%Tdate: %"$Date$%"%N")
			l_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			l_output_file.put_string ("class ")
			l_output_file.put_string (class_name_prefix)
			l_output_file.put_string ("CHARACTER_CLASS_ROUTINES%N%N")
			l_output_file.put_string ("inherit%N%N%TST_UNICODE_CHARACTER_CLASS_INTERFACE%N%N")
			write_versioning_routines (l_output_file)
			l_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_character_class_array (l_output_file)
			write_decimal_value_array (l_output_file)
			write_upper_case_property_array (l_output_file)
			write_lower_case_property_array (l_output_file)
			write_alphabetic_property_array (l_output_file)
			write_math_property_array (l_output_file)
			l_output_file.put_string ("end%N")
			l_output_file.close
		end

	generate_lower_case_routines
			-- Generate lower-case routines from `codes' data.
		require
			codes_not_void: codes /= Void
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
			kernel_class_name_prefix_not_void: kernel_class_name_prefix /= Void
		local
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_output_file.make (kernel_file_name_prefix + "ctype_lowercase.e")
			l_output_file.open_write
			l_output_file.put_string ("note%N%N")
			l_output_file.put_string ("%Tdescription:%N%N")
			l_output_file.put_string ("%T%T%"Database for simple mapping to lower case%"%N%N")
			l_output_file.put_string ("%Tgenerator: %"geuc%"%N%N")
			l_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			l_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			l_output_file.put_string ("%Tlicense: %"MIT License%"%N")
			l_output_file.put_string ("%Tdate: %"$Date$%"%N")
			l_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			l_output_file.put_string ("class ")
			l_output_file.put_string (kernel_class_name_prefix)
			l_output_file.put_string ("CTYPE_LOWERCASE%N%N")
			l_output_file.put_string ("inherit%N%N%TANY%N%N%TKL_IMPORTED_INTEGER_ROUTINES%N%T%Texport {NONE} all end%N%N")
			write_versioning_routines (l_output_file)
			l_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_lower_case_array (l_output_file)
			l_output_file.put_string ("end%N")
			l_output_file.close
		end

	generate_upper_case_routines
			-- Generate upper-case routines from `codes' data.
		require
			codes_not_void: codes /= Void
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
			kernel_class_name_prefix_not_void: kernel_class_name_prefix /= Void
		local
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_output_file.make (kernel_file_name_prefix + "ctype_uppercase.e")
			l_output_file.open_write
			l_output_file.put_string ("note%N%N")
			l_output_file.put_string ("%Tdescription:%N%N")
			l_output_file.put_string ("%T%T%"Database for simple mapping to upper case%"%N%N")
			l_output_file.put_string ("%Tgenerator: %"geuc%"%N%N")
			l_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			l_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			l_output_file.put_string ("%Tlicense: %"MIT License%"%N")
			l_output_file.put_string ("%Tdate: %"$Date$%"%N")
			l_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			l_output_file.put_string ("class ")
			l_output_file.put_string (kernel_class_name_prefix)
			l_output_file.put_string ("CTYPE_UPPERCASE%N%N")
			l_output_file.put_string ("inherit%N%N%TANY%N%N%TKL_IMPORTED_INTEGER_ROUTINES%N%T%Texport {NONE} all end%N%N")
			write_versioning_routines (l_output_file)
			l_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_upper_case_array (l_output_file)
			l_output_file.put_string ("end%N")
			l_output_file.close
		end

	generate_title_case_routines
			-- Generate title-case routines from `codes' data.
		require
			codes_not_void: codes /= Void
			kernel_file_name_prefix_not_void: kernel_file_name_prefix /= Void
			kernel_class_name_prefix_not_void: kernel_class_name_prefix /= Void
		local
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_output_file.make (kernel_file_name_prefix + "ctype_titlecase.e")
			l_output_file.open_write
			l_output_file.put_string ("note%N%N")
			l_output_file.put_string ("%Tdescription:%N%N")
			l_output_file.put_string ("%T%T%"Database for simple mapping to title case%"%N%N")
			l_output_file.put_string ("%Tgenerator: %"geuc%"%N%N")
			l_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			l_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			l_output_file.put_string ("%Tlicense: %"MIT License%"%N")
			l_output_file.put_string ("%Tdate: %"$Date$%"%N")
			l_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			l_output_file.put_string ("class ")
			l_output_file.put_string (kernel_class_name_prefix)
			l_output_file.put_string ("CTYPE_TITLECASE%N%N")
			l_output_file.put_string ("inherit%N%N%TANY%N%N%TKL_IMPORTED_INTEGER_ROUTINES%N%T%Texport {NONE} all end%N%N")
			write_versioning_routines (l_output_file)
			l_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_title_case_array (l_output_file)
			l_output_file.put_string ("end%N")
			l_output_file.close
		end

	generate_normalization_routines
			-- Generate normalization routines from parsed arrays.
		require
			codes_not_void: codes /= Void
			file_name_prefix_not_void: file_name_prefix /= Void
			class_name_prefix_not_void: class_name_prefix /= Void
		local
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_output_file.make (file_name_prefix + "normalization_routines.e")
			l_output_file.open_write
			l_output_file.put_string ("note%N%N")
			l_output_file.put_string ("%Tdescription:%N%N")
			l_output_file.put_string ("%T%T%"Routines for normalizing strings%"%N%N")
			l_output_file.put_string ("%Tgenerator: %"geuc%"%N%N")
			l_output_file.put_string ("%Tlibrary: %"Gobo Eiffel String Library%"%N")
			l_output_file.put_string ("%Tcopyright: %"Copyright (c) 2005, Colin Adams and others%"%N")
			l_output_file.put_string ("%Tlicense: %"MIT License%"%N")
			l_output_file.put_string ("%Tdate: %"$Date$%"%N")
			l_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			l_output_file.put_string ("class ")
			l_output_file.put_string (class_name_prefix)
			l_output_file.put_string ("NORMALIZATION_ROUTINES%N%N")
			l_output_file.put_string ("inherit%N%N%TST_UNICODE_NORMALIZATION_INTERFACE%N%N")
			write_versioning_routines (l_output_file)
			l_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_canonical_combining_class_property_array (l_output_file)
			create compositions.make (15000)
			store_hangul_compositions
			write_decomposition_type_property_array (l_output_file)
			write_decomposition_mapping_property_array (l_output_file)
			write_composition_map (l_output_file)
			write_expands_on_nfc_property_array (l_output_file)
			write_expands_on_nfd_property_array (l_output_file)
			write_expands_on_nfkc_property_array (l_output_file)
			write_expands_on_nfkd_property_array (l_output_file)
			write_nfc_quick_check_array (l_output_file)
			write_nfd_quick_check_array (l_output_file)
			write_nfkc_quick_check_array (l_output_file)
			write_nfkd_quick_check_array (l_output_file)
			l_output_file.put_string ("end%N")
			l_output_file.close
		end

	generate_full_casing_routines
			-- Generate routines for full case mappings from `codes'.
		require
			codes_not_void: codes /= Void
			file_name_prefix_not_void: file_name_prefix /= Void
			class_name_prefix_not_void: class_name_prefix /= Void
		local
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			create l_output_file.make (file_name_prefix + "full_case_mapping.e")
			l_output_file.open_write
			l_output_file.put_string ("note%N%N")
			l_output_file.put_string ("%Tdescription:%N%N")
			l_output_file.put_string ("%T%T%"Database for full case mapping%"%N%N")
			l_output_file.put_string ("%Tgenerator: %"geuc%"%N%N")
			l_output_file.put_string ("%Tlibrary: %"Gobo Eiffel Kernel Library%"%N")
			l_output_file.put_string ("%Tcopyright: %"Copyright (c) 2007, Colin Adams and others%"%N")
			l_output_file.put_string ("%Tlicense: %"MIT License%"%N")
			l_output_file.put_string ("%Tdate: %"$Date$%"%N")
			l_output_file.put_string ("%Trevision: %"$Revision$%"%N%N")
			l_output_file.put_string ("class ")
			l_output_file.put_string (class_name_prefix)
			l_output_file.put_string ("FULL_CASE_MAPPING%N%N")
			l_output_file.put_string ("inherit%N%N%TST_UNICODE_CASE_MAPPING_INTERFACE%N%N")
			l_output_file.put_string ("feature {NONE} -- Implementation%N%N")
			write_lower_case_mapping_array (l_output_file)
			write_title_case_mapping_array (l_output_file)
			write_upper_case_mapping_array (l_output_file)
			l_output_file.put_string ("end%N")
			l_output_file.close
		end

feature -- Access

	Unicode_data: STRING = "UnicodeData.txt"
	Derived_core_properties: STRING = "DerivedCoreProperties.txt"
	Derived_normalization_properties: STRING = "DerivedNormalizationProps.txt"
	Special_casing: STRING = "SpecialCasing.txt"
			-- Unicode Character Database filenames

	Alphabetic_property: STRING = "Alphabetic"
	Default_ignorable_code_property: STRING = "Default_Ignorable_Code_Point"
	Lowercase_property: STRING = "Lowercase"
	Grapheme_base_property: STRING = "Grapheme_Base"
	Grapheme_extend_property: STRING = "Grapheme_Extend"
	Grapheme_link_property: STRING = "Grapheme_Link"
	Id_start_property: STRING = "ID_Start"
	Id_continue_property: STRING = "ID_Continue"
	Math_property: STRING = "Math"
	Uppercase_property: STRING = "Uppercase"
	Xid_start_property: STRING = "XID_Start"
	Xid_continue_property: STRING = "XID_Continue"
	Full_composition_exclusion_property: STRING = "Full_Composition_Exclusion"
	Expands_on_nfc_property: STRING = "Expands_On_NFC"
	Expands_on_nfd_property: STRING = "Expands_On_NFD"
	Expands_on_nfkc_property: STRING = "Expands_On_NFKC"
	Expands_on_nfkd_property: STRING = "Expands_On_NFKD"
	Fold_case_nfkc_closure_property: STRING = "FC_NFKC"
	Nfd_quick_check_property: STRING = "NFD_QC"
	Nfc_quick_check_property: STRING = "NFC_QC"
	Nfkd_quick_check_property: STRING = "NFKD_QC"
	Nfkc_quick_check_property: STRING = "NFKC_QC"
			-- Property names

	codes: ARRAY [GEUC_UNICODE_DATA]
			-- Parsed data from `Unicode_data' for each code point;
			-- Note that Unicode does not assign most of the code points
			-- to characters, so many will be `Void'.

	compositions: DS_HASH_TABLE [INTEGER, DS_HASHABLE_PAIR [INTEGER, INTEGER]]
			-- Map of compositions indexed by character pairs

	is_range_start (a_name: STRING): BOOLEAN
			-- Is `a_name' indicating start of range rather than character name?
		require
			name_not_void: a_name /= Void
		do
			if a_name.count > 7 and then a_name.substring (a_name.count - 5, a_name.count).is_equal ("First>") then
				Result := True
			end
		end

	is_range_finish (a_name: STRING): BOOLEAN
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

	valid_code (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a valid Unicode code point?
		do
			Result := unicode.valid_code (a_code)
		end

feature -- Hangul

	Hangul_syllable_base: INTEGER = 44032
			-- Code-point of first Hangul syllable

	Hangul_syllable_count: INTEGER = 11172
			-- Number of Hangul syllables

	Leading_jamo_base: INTEGER = 4352
			-- Code-point of first leading consonant jamo

	Leading_jamo_count: INTEGER = 19
			-- Number of leading consonant jamo

	Vowel_jamo_base: INTEGER = 4449
			-- Code-point of first vowel jamo

	Vowel_jamo_count: INTEGER = 21
			-- Number of vowel jamo

	Trailing_jamo_base: INTEGER = 4519
			-- Code-point of first trailing consonant jamo

	Trailing_jamo_count: INTEGER = 28
			-- Number of trailing consonant jamo

	Jamo_permutation_count: INTEGER = 588
			-- `Vowel_jamo_count' * `Trailing_jamo_count'

	is_hangul_syllable (a_code: INTEGER): BOOLEAN
			-- Is `a_code' a Hangul syllable?
		require
			valid_code: valid_code (a_code)
		do
			Result := a_code >= Hangul_syllable_base and a_code < Hangul_syllable_base + Hangul_syllable_count
		end

	decomposed_hangul_syllable (a_code: INTEGER): DS_ARRAYED_LIST [INTEGER]
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

	store_hangul_compositions
			-- Store all composed hangul syllables.
		local
			s, t: INTEGER
			l_first, l_second: INTEGER
			l_pair: DS_HASHABLE_PAIR [INTEGER, INTEGER]
		do
			from s := 0 until s = Hangul_syllable_count loop
				t := s \\ Trailing_jamo_count
				if t /= 0 then -- Triple
					l_first := Hangul_syllable_base + s - t
					l_second := Trailing_jamo_base + t
				else
					l_first := Leading_jamo_base + s // Jamo_permutation_count
					l_second := Vowel_jamo_base + (s \\ Jamo_permutation_count) // Trailing_jamo_count
				end
				create l_pair.make (l_first, l_second)
				compositions.force (s + Hangul_syllable_base, l_pair)
				s := s + 1
			end
		end

feature -- Composition

	store_composition (a_code: INTEGER; a_value: DS_ARRAYED_LIST [INTEGER])
			-- Store `a_code' as a canonical composition.
		require
			valid_code: unicode.is_bmp_code (a_code)
			not_hangul_syllable: not is_hangul_syllable (a_code)
			value_not_void: a_value /= Void
		local
			l_first, l_second: INTEGER
			l_data_point: GEUC_UNICODE_DATA
			l_pair: DS_HASHABLE_PAIR [INTEGER, INTEGER]
		do
			l_data_point := codes.item (a_code)
			if
				l_data_point /= Void and then
				l_data_point.decomposition_type = Canonical_decomposition_mapping and
				not full_composition_exclusion_array.item (a_code)
			then
				check
					at_least_one_code: a_value.count > 0
				end
				l_first := 0
				l_second := a_value.item (1)
				if a_value.count > 1 then
					l_first := l_second
					l_second := a_value.item (2)
				end
				create l_pair.make (l_first, l_second)
				compositions.force (a_code, l_pair)
			end
		end

feature -- Versioning

	major_version: INTEGER
			-- Major version number of Unicode

	minor_version: INTEGER
			-- Minor version number of Unicode

	update_version: INTEGER
			-- Update version number of Unicode

	write_versioning_routines (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write routines to satisfy `UC_UNICODE_VERSIONING'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			a_output_file.put_string ("%Nfeature -- Access%N%N")
			a_output_file.put_string ("%Tmajor_version: INTEGER%N")
			a_output_file.put_string ("%T%T%T-- Major version number of Unicode%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := " + major_version.out + "%N")
			a_output_file.put_string ("%T%Tend%N%N")
			a_output_file.put_string ("%Tminor_version: INTEGER%N")
			a_output_file.put_string ("%T%T%T-- Minor version number of Unicode%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := " + minor_version.out + "%N")
			a_output_file.put_string ("%T%Tend%N%N")
			a_output_file.put_string ("%Tupdate_version: INTEGER%N")
			a_output_file.put_string ("%T%T%T-- Update version number of Unicode%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := " + update_version.out + "%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

feature {NONE} -- Implementation

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_usage_message
			-- Report usage message.
		do
			report_general_message ("Usage is geuc --uc_version=nnn (where nnn is an integer > 99")
			Exceptions.die (1)
		end

	report_general_message (a_message_string: STRING)
			-- Report a miscellaneous message.
		require
			message_not_void: a_message_string /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_message_string)
			error_handler.report_error (l_error)
		end

	initial_code: INTEGER
			-- Initial code point for range of characters in `Unicode_data'

	Empty_character_class_segment_array_name: STRING = "empty_character_class_segment"
			-- Name for empty character class segment

	Empty_character_class_plane_array_name: STRING = "empty_character_class_plane"
			-- Name for empty character class plane

	Empty_decimal_value_segment_array_name: STRING = "empty_decimal_value_segment"
			-- Name for empty decimal value segment

	Empty_decimal_value_plane_array_name: STRING = "empty_decimal_value_plane"
			-- Name for empty decimal value plane

	Empty_lower_code_segment_array_name: STRING = "empty_lower_code_segment"
			-- Name for empty lower code segment

	Empty_lower_code_plane_array_name: STRING = "empty_lower_code_plane"
			-- Name for empty lower code plane

	Empty_upper_code_segment_array_name: STRING = "empty_upper_code_segment"
			-- Name for empty upper code segment

	Empty_upper_code_plane_array_name: STRING = "empty_upper_code_plane"
			-- Name for empty upper code plane

	Empty_title_code_segment_array_name: STRING = "empty_title_code_segment"
			-- Name for empty title code segment

	Empty_title_code_plane_array_name: STRING = "empty_title_code_plane"
			-- Name for empty title_code plane

	write_character_class_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing character classes.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code: INTEGER
			l_category: INTEGER
			l_code_datum: GEUC_UNICODE_DATA
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_segment: ARRAY [INTEGER_8]
			l_plane_all_absent, l_segment_all_absent: BOOLEAN
			l_empty_plane_written, l_empty_segment_written: BOOLEAN
			l_plane_array_name, l_segment_array_name: STRING
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_absent := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_absent := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_code_datum := codes.item (l_code)
						if l_code_datum = Void then
							l_category := Unassigned_other_category
						else
							l_category := l_code_datum.general_category
							if l_category /= Unassigned_other_category then
								l_segment_all_absent := False
								l_plane_all_absent := False
							end
						end
						l_segment.put (INTEGER_.to_integer_8 (l_category), k)
						k := k + 1
					end
					if l_segment_all_absent then
						l_segment_array_name := Empty_character_class_segment_array_name
						if not l_empty_segment_written then
							l_empty_segment_written := True
							write_integer8_segment (l_segment, Empty_character_class_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "character_class_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_absent then
					l_plane_array_name := Empty_character_class_plane_array_name
					if not l_empty_plane_written then
						l_empty_plane_written := True
						write_empty_integer8_plane (l_plane_array_name, Empty_character_class_segment_array_name, a_output_file)
					end
				else
					l_plane_array_name := "character_class_plane_" + i.out
					write_integer8_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tcharacter_classes: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]]%N")
			a_output_file.put_string ("%T%T%T-- Character class for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_decimal_value_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing decimal digit values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code, l_category: INTEGER
			l_value: INTEGER_8
			l_code_datum: GEUC_UNICODE_DATA
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_segment: ARRAY [INTEGER_8]
			l_plane_all_absent, l_segment_all_absent: BOOLEAN
			l_empty_plane_written, l_empty_segment_written: BOOLEAN
			l_plane_array_name, l_segment_array_name: STRING
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_absent := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_absent := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_code_datum := codes.item (l_code)
						if l_code_datum = Void then
							l_value := Bad_decimal_value
						else
							l_category := l_code_datum.general_category
							if l_category = Decimal_digit_number_category then
								l_segment_all_absent := False
								l_plane_all_absent := False
								l_value := l_code_datum.decimal_digit_value
							else
								l_value := Bad_decimal_value
							end
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_absent then
						l_segment_array_name := Empty_decimal_value_segment_array_name
						if not l_empty_segment_written then
							l_empty_segment_written := True
							write_integer8_segment (l_segment, Empty_decimal_value_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "decimal_value_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_absent then
					l_plane_array_name := Empty_decimal_value_plane_array_name
					if not l_empty_plane_written then
						l_empty_plane_written := True
						write_empty_integer8_plane (l_plane_array_name, Empty_decimal_value_segment_array_name, a_output_file)
					end
				else
					l_plane_array_name := "decimal_value_plane_" + i.out
					write_integer8_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tdecimal_values: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]]%N")
			a_output_file.put_string ("%T%T%T-- Decimal value for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_upper_case_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing upper case property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_upper_case_property_segment",
				"all_true_upper_case_property_segment",
				"all_false_upper_case_property_plane",
				"upper_case_property_plane_",
				"upper_case_properties",
				"Uppercase property",
				upper_case_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_lower_case_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing lower case property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_lower_case_property_segment",
				"all_true_lower_case_property_segment",
				"all_false_lower_case_property_plane",
				"lower_case_property_plane_",
				"lower_case_properties",
				"Lowercase property",
				lower_case_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_alphabetic_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing alphabetic property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_alphabetic_property_segment",
				"all_true_alphabetic_property_segment",
				"all_false_alphabetic_property_plane",
				"alphabetic_property_plane_",
				"alphabetic_properties",
				"Alphabetic property",
				alphabetic_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_math_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing math property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_math_property_segment",
				"all_true_math_property_segment",
				"all_false_math_property_plane",
				"math_property_plane_",
				"math_properties",
				"Math property",
				math_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_expands_on_nfc_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing expands on NFC property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfc_property_segment",
				"all_true_expands_on_nfc_property_segment",
				"all_false_expands_on_nfc_property_plane",
				"expands_on_nfc_property_plane_",
				"expands_on_nfc_properties",
				"Expands_On_NFC property",
				expands_on_nfc_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_expands_on_nfd_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing expands on NFD property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfd_property_segment",
				"all_true_expands_on_nfd_property_segment",
				"all_false_expands_on_nfd_property_plane",
				"expands_on_nfd_property_plane_",
				"expands_on_nfd_properties",
				"Expands_On_NFD property",
				expands_on_nfd_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_expands_on_nfkc_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing expands on NFKC property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfkc_property_segment",
				"all_true_expands_on_nfkc_property_segment",
				"all_false_expands_on_nfkc_property_plane",
				"expands_on_nfkc_property_plane_",
				"expands_on_nfkc_properties",
				"Expands_On_NFKC property",
				expands_on_nfkc_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_expands_on_nfkd_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing expands on NFKD property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_boolean_property_array ("all_false_expands_on_nfkd_property_segment",
				"all_true_expands_on_nfkd_property_segment",
				"all_false_expands_on_nfkd_property_plane",
				"expands_on_nfkd_property_plane_",
				"expands_on_nfkd_properties",
				"Expands_On_NFKD property",
				expands_on_nfkd_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_boolean_property_array (all_false_segment_name, all_true_segment_name, all_false_plane_name, a_plane_prefix, an_array_name, a_title: STRING;
		an_array: ARRAY [BOOLEAN] ; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing full composition exclusion property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
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
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_false, l_segment_all_false, l_segment_all_true, l_value: BOOLEAN
			l_all_false_plane_written, l_all_false_segment_written, l_all_true_segment_written: BOOLEAN
			l_segment: ARRAY [BOOLEAN]
			l_plane_array_name, l_segment_array_name: STRING
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_false := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (False, 0, 255)
					l_segment_all_false := True
					l_segment_all_true := True
					from k := 0 until k > 255 loop
						l_value := an_array.item (k + 256 * j + 256 * 256 * i)
						if l_value then
							l_segment_all_false := False
							l_plane_all_false := False
						else
							l_segment_all_true := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_false then
						l_segment_array_name := all_false_segment_name
						if not l_all_false_segment_written then
							l_all_false_segment_written := True
							write_boolean_segment (l_segment, l_segment_array_name, a_output_file)
						end
					elseif l_segment_all_true then
						l_segment_array_name := all_true_segment_name
						if not l_all_true_segment_written then
							l_all_true_segment_written := True
							write_boolean_segment (l_segment, l_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := a_plane_prefix + i.out + "_segment_" + j.out
						write_boolean_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_false then
					l_plane_array_name := all_false_plane_name
					if not l_all_false_plane_written then
						l_all_false_plane_written := True
						write_all_false_boolean_plane (l_plane_array_name, all_false_segment_name, a_output_file)
					end
				else
					l_plane_array_name := a_plane_prefix + i.out
					write_boolean_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%T" + an_array_name + ": SPECIAL [SPECIAL [ARRAY [BOOLEAN]]]%N")
			a_output_file.put_string ("%T%T%T-- " + a_title + " for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_canonical_combining_class_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing Canonical_Combining_Class property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k: INTEGER
			l_plane_array_name, l_segment_array_name: STRING
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_zero, l_segment_all_zero: BOOLEAN
			l_all_zero_plane_written, l_all_zero_segment_written: BOOLEAN
			l_value: INTEGER
			l_segment: ARRAY [INTEGER_8]
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_zero := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_zero := True
					from k := 0 until k > 255 loop
						l_data_point := codes.item (k + 256 * j + 256 * 256 * i)
						if l_data_point = Void then
							l_value := 0
						else
							l_value := projected_combining_class (l_data_point.canonical_combining_class)
						end
						if l_value /= 0 then
							l_segment_all_zero := False
							l_plane_all_zero := False
						end
						l_segment.put (INTEGER_.to_integer_8 (l_value), k)
						k := k + 1
					end
					if l_segment_all_zero then
						l_segment_array_name := "all_zero_canonical_combining_class_segment"
						if not l_all_zero_segment_written then
							l_all_zero_segment_written := True
							write_integer8_segment (l_segment, l_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "canonical_combining_class_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_zero then
					l_plane_array_name := "all_zero_canonical_combining_class_plane"
					if not l_all_zero_plane_written then
						l_all_zero_plane_written := True
						write_empty_integer8_plane (l_plane_array_name, "all_zero_canonical_combining_class_segment", a_output_file)
					end
				else
					l_plane_array_name := "canonical_combining_class_plane_" + i.out
					write_integer8_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tcanonical_combining_class_properties: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]]%N")
			a_output_file.put_string ("%T%T%T-- Canonical combining class for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_decomposition_type_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing Decomposition_Type property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k: INTEGER
			l_plane_array_name, l_segment_array_name: STRING
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_zero, l_segment_all_zero: BOOLEAN
			l_all_zero_plane_written, l_all_zero_segment_written: BOOLEAN
			l_value: INTEGER
			l_segment: ARRAY [INTEGER_8]
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_zero := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_zero := True
					from k := 0 until k > 255 loop
						l_data_point := codes.item (k + 256 * j + 256 * 256 * i)
						if l_data_point = Void then
							l_value := 0
						else
							l_value := l_data_point.decomposition_type
						end
						if l_value /= 0 then
							l_segment_all_zero := False
							l_plane_all_zero := False
						end
						l_segment.put (INTEGER_.to_integer_8 (l_value), k)
						k := k + 1
					end
					if l_segment_all_zero then
						l_segment_array_name := "all_zero_decomposition_type_segment"
						if not l_all_zero_segment_written then
							l_all_zero_segment_written := True
							write_integer8_segment (l_segment, l_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "decomposition_type_plane_" + i.out + "_segment_" + j.out
						write_integer8_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_zero then
					l_plane_array_name := "all_zero_decomposition_type_plane"
					if not l_all_zero_plane_written then
						l_all_zero_plane_written := True
						write_empty_integer8_plane (l_plane_array_name, "all_zero_decomposition_type_segment", a_output_file)
					end
				else
					l_plane_array_name := "decomposition_type_plane_" + i.out
					write_integer8_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tdecomposition_type_properties: SPECIAL [SPECIAL [ARRAY [INTEGER_8]]]%N")
			a_output_file.put_string ("%T%T%T-- Decomposition type for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_decomposition_mapping_property_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing Decomposition_Mapping property values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code: INTEGER
			l_plane_array_name, l_segment_array_name: STRING
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_empty, l_segment_all_empty: BOOLEAN
			l_all_empty_plane_written, l_all_empty_segment_written: BOOLEAN
			l_value: DS_ARRAYED_LIST [INTEGER]
			l_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_empty := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (Void, 0, 255)
					l_segment_all_empty := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_data_point := codes.item (l_code)
						if is_hangul_syllable (l_code) then
							l_value := decomposed_hangul_syllable (l_code)
						elseif l_data_point = Void then
							l_value := Void
						else
							l_value := l_data_point.decomposition_mapping
							if unicode.is_bmp_code (l_code) and l_value /= Void then
								store_composition (l_code, l_value)
							end
						end
						if l_value /= Void then
							l_segment_all_empty := False
							l_plane_all_empty := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_empty then
						l_segment_array_name := "all_empty_decomposition_mapping_segment"
						if not l_all_empty_segment_written then
							l_all_empty_segment_written := True
							write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, True)
						end
					else
						l_segment_array_name := "decomposition_mapping_plane_" + i.out + "_segment_" + j.out
						write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, False)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_empty then
					l_plane_array_name := "all_empty_decomposition_mapping_plane"
					if not l_all_empty_plane_written then
						l_all_empty_plane_written := True
						write_empty_integer_list_plane (l_plane_array_name, "all_empty_decomposition_mapping_segment", a_output_file)
					end
				else
					l_plane_array_name := "decomposition_mapping_plane_" + i.out
					write_integer_list_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tdecomposition_mapping_properties: SPECIAL [SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]]%N")
			a_output_file.put_string ("%T%T%T-- Decomposition mapping for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_lower_case_mapping_array  (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing lower case code points.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code: INTEGER
			l_plane_array_name, l_segment_array_name: STRING
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_empty, l_segment_all_empty: BOOLEAN
			l_all_empty_plane_written, l_all_empty_segment_written: BOOLEAN
			l_value: DS_ARRAYED_LIST [INTEGER]
			l_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_empty := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (Void, 0, 255)
					l_segment_all_empty := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_data_point := codes.item (l_code)
						if l_data_point /= Void then
							l_value := l_data_point.lower_mapping
						end
						if l_value /= Void then
							l_segment_all_empty := False
							l_plane_all_empty := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_empty then
						l_segment_array_name := "all_empty_lower_case_mapping_segment"
						if not l_all_empty_segment_written then
							l_all_empty_segment_written := True
							write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, True)
						end
					else
						l_segment_array_name := "lower_case_mapping_plane_" + i.out + "_segment_" + j.out
						write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, False)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_empty then
					l_plane_array_name := "all_empty_lower_case_mapping_plane"
					if not l_all_empty_plane_written then
						l_all_empty_plane_written := True
						write_empty_integer_list_plane (l_plane_array_name, "all_empty_lower_case_mapping_segment", a_output_file)
					end
				else
					l_plane_array_name := "lower_case_mapping_plane_" + i.out
					write_integer_list_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tlower_case_mappings: SPECIAL [SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]]%N")
			a_output_file.put_string ("%T%T%T-- Full lower case mapping for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_title_case_mapping_array  (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing title case code points.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code: INTEGER
			l_plane_array_name, l_segment_array_name: STRING
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_empty, l_segment_all_empty: BOOLEAN
			l_all_empty_plane_written, l_all_empty_segment_written: BOOLEAN
			l_value: DS_ARRAYED_LIST [INTEGER]
			l_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_empty := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (Void, 0, 255)
					l_segment_all_empty := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_data_point := codes.item (l_code)
						if l_data_point /= Void then
							l_value := l_data_point.title_mapping
						end
						if l_value /= Void then
							l_segment_all_empty := False
							l_plane_all_empty := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_empty then
						l_segment_array_name := "all_empty_title_case_mapping_segment"
						if not l_all_empty_segment_written then
							l_all_empty_segment_written := True
							write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, True)
						end
					else
						l_segment_array_name := "title_case_mapping_plane_" + i.out + "_segment_" + j.out
						write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, False)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_empty then
					l_plane_array_name := "all_empty_title_case_mapping_plane"
					if not l_all_empty_plane_written then
						l_all_empty_plane_written := True
						write_empty_integer_list_plane (l_plane_array_name, "all_empty_title_case_mapping_segment", a_output_file)
					end
				else
					l_plane_array_name := "title_case_mapping_plane_" + i.out
					write_integer_list_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Ttitle_case_mappings: SPECIAL [SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]]%N")
			a_output_file.put_string ("%T%T%T-- Full title case mapping for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_upper_case_mapping_array  (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing upper case code points.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code: INTEGER
			l_plane_array_name, l_segment_array_name: STRING
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_empty, l_segment_all_empty: BOOLEAN
			l_all_empty_plane_written, l_all_empty_segment_written: BOOLEAN
			l_value: DS_ARRAYED_LIST [INTEGER]
			l_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_empty := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (Void, 0, 255)
					l_segment_all_empty := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_data_point := codes.item (l_code)
						if l_data_point /= Void then
							l_value := l_data_point.upper_mapping
						end
						if l_value /= Void then
							l_segment_all_empty := False
							l_plane_all_empty := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_empty then
						l_segment_array_name := "all_empty_upper_case_mapping_segment"
						if not l_all_empty_segment_written then
							l_all_empty_segment_written := True
							write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, True)
						end
					else
						l_segment_array_name := "upper_case_mapping_plane_" + i.out + "_segment_" + j.out
						write_integer_list_segment (l_segment, l_segment_array_name, a_output_file, False)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_empty then
					l_plane_array_name := "all_empty_upper_case_mapping_plane"
					if not l_all_empty_plane_written then
						l_all_empty_plane_written := True
						write_empty_integer_list_plane (l_plane_array_name, "all_empty_upper_case_mapping_segment", a_output_file)
					end
				else
					l_plane_array_name := "upper_case_mapping_plane_" + i.out
					write_integer_list_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tupper_case_mappings: SPECIAL [SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]]%N")
			a_output_file.put_string ("%T%T%T-- Full upper case mapping for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_composition_map (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write composition map.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			l_cursor: DS_HASH_TABLE_CURSOR [INTEGER, DS_HASHABLE_PAIR [INTEGER, INTEGER]]
			l_string_1, l_string_2, l_string_3: STRING
			l_ustring_1, l_ustring_2, l_ustring_3: UC_UTF8_STRING
			i, j, k, l: INTEGER
		do
			l_string_1 := ""
			l_string_2 := ""
			l_string_3 := ""
			l_cursor := compositions.new_cursor
			from l_cursor.start until l_cursor.after loop
				append_code_to_utf8 (l_string_1, l_cursor.key.first)
				append_code_to_utf8 (l_string_2, l_cursor.key.second)
				append_code_to_utf8 (l_string_3, l_cursor.item)
				l_cursor.forth
			end
			create l_ustring_1.make_from_utf8 (l_string_1)
			create l_ustring_2.make_from_utf8 (l_string_2)
			create l_ustring_3.make_from_utf8 (l_string_3)
			from i := 1 until i > l_ustring_1.count loop
				k := k + 1
				j := i + 1000
				if j > l_ustring_1.count then j := l_ustring_1.count end
				a_output_file.put_string ("%N%Tcomposition_map_first_integer_" + k.out + ": STRING = %"")
				a_output_file.put_string (to_utf8 (l_ustring_1.substring (i, j)))
				a_output_file.put_string ("%"%N%N")
				a_output_file.put_string ("%N%Tcomposition_map_second_integer_" + k.out + ": STRING = %"")
				a_output_file.put_string (to_utf8 (l_ustring_2.substring (i, j)))
				a_output_file.put_string ("%"%N%N")
				a_output_file.put_string ("%N%Tcomposition_map_third_integer_" + k.out + ": STRING = %"")
				a_output_file.put_string (to_utf8 (l_ustring_3.substring (i, j)))
				a_output_file.put_string ("%"%N%N")
				i := j + 1
			end
			a_output_file.put_string ("%Tcomposition_map: DS_HASH_TABLE [INTEGER, DS_HASHABLE_PAIR [INTEGER, INTEGER]]%N")
			a_output_file.put_string ("%T%T%T-- Map of compositions indexed by hashed character pairs%N")
			a_output_file.put_string ("%T%Tlocal%N")
			a_output_file.put_string ("%T%T%Ti, j, k: INTEGER%N")
			a_output_file.put_string ("%T%T%Tl_array_1, l_array_2, l_array_3: ARRAY [UC_UTF8_STRING]%N")
			a_output_file.put_string ("%T%T%Tl_string: UC_UTF8_STRING%N")
			a_output_file.put_string ("%T%T%Tl_pair: DS_HASHABLE_PAIR [INTEGER, INTEGER]%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make (" + compositions.count.out + ")%N")
			a_output_file.put_string ("%T%T%Tcreate l_array_1.make_filled (Void, 1, " + k.out + ")%N")
			a_output_file.put_string ("%T%T%Tcreate l_array_2.make_filled (Void, 1, " + k.out + ")%N")
			a_output_file.put_string ("%T%T%Tcreate l_array_3.make_filled (Void, 1, " + k.out + ")%N")
			from l := k; k := 1 until l = 0 loop
				a_output_file.put_string ("%T%T%Tcreate l_string.make_from_utf8 (composition_map_first_integer_" + k.out + ")%N")
				a_output_file.put_string ("%T%T%Tl_array_1.put (l_string, " + k.out + ")%N")
				a_output_file.put_string ("%T%T%Tcreate l_string.make_from_utf8 (composition_map_second_integer_" + k.out + ")%N")
				a_output_file.put_string ("%T%T%Tl_array_2.put (l_string, " + k.out + ")%N")
				a_output_file.put_string ("%T%T%Tcreate l_string.make_from_utf8 (composition_map_third_integer_" + k.out + ")%N")
				a_output_file.put_string ("%T%T%Tl_array_3.put (l_string, " + k.out + ")%N")
				k := k + 1
				l := l - 1
			end
			a_output_file.put_string ("%T%T%Tfrom%N")
			a_output_file.put_string ("%T%T%T%T i := 1; j := 1; k := 1%N")
			a_output_file.put_string ("%T%T%Tinvariant%N")
			a_output_file.put_string ("%T%T%T%T i >= j%N")
			a_output_file.put_string ("%T%T%T%T i >= k%N")
			a_output_file.put_string ("%T%T%Tuntil%N")
			a_output_file.put_string ("%T%T%T%T i > " + (compositions.count).out + "%N")
			a_output_file.put_string ("%T%T%Tloop%N")
			a_output_file.put_string ("%T%T%T%Tcreate l_pair.make (l_array_1.item (k).item_code (j), l_array_2.item (k).item_code (j))%N")
			a_output_file.put_string ("%T%T%T%TResult.put_new (l_array_3.item (k).item_code (j)")
			a_output_file.put_string (", l_pair)%N")
			a_output_file.put_string ("%T%T%T%Ti := i + 1; j := j + 1; if j > l_array_2.item (k).count  then j := 1; k := k + 1 end%N")
			a_output_file.put_string ("%T%T%Tvariant%N")
			a_output_file.put_string ("%T%T%T%T" + (compositions.count + 1).out + " - i%N")
			a_output_file.put_string ("%T%T%Tend%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_nfc_quick_check_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing NFC quick check values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_quick_check_array ("nfc_quick_check_array",
				"NFC_Quick_Check values",
				"all_true_nfc_quick_check_plane",
				"all_false_nfc_quick_check_segment",
				"all_true_nfc_quick_check_segment",
				"all_undefined_nfc_quick_check_segment",
				"nfc_quick_check_plane_",
				nfc_quick_check_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_nfd_quick_check_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing NFD quick check values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_quick_check_array ("nfd_quick_check_array",
				"NFD_Quick_Check values",
				"all_true_nfd_quick_check_plane",
				"all_false_nfd_quick_check_segment",
				"all_true_nfd_quick_check_segment",
				"all_undefined_nfd_quick_check_segment",
				"nfd_quick_check_plane_",
				nfd_quick_check_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_nfkc_quick_check_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing NFKC quick check values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_quick_check_array ("nfkc_quick_check_array",
				"NFKC_Quick_Check values",
				"all_true_nfkc_quick_check_plane",
				"all_false_nfkc_quick_check_segment",
				"all_true_nfkc_quick_check_segment",
				"all_undefined_nfkc_quick_check_segment",
				"nfkc_quick_check_plane_",
				nfkc_quick_check_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_nfkd_quick_check_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing NFKD quick check values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		do
			write_quick_check_array ("nfkd_quick_check_array",
				"NFKD_Quick_Check values",
				"all_true_nfkd_quick_check_plane",
				"all_false_nfkd_quick_check_segment",
				"all_true_nfkd_quick_check_segment",
				"all_undefined_nfkd_quick_check_segment",
				"nfkd_quick_check_plane_",
				nfkd_quick_check_array, a_output_file)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_quick_check_array (a_array_name, a_title: STRING;
		a_all_true_plane_name, a_all_false_segment_name, a_all_true_segment_name, a_all_undefined_segment_name, a_plane_prefix: STRING;
		a_array: ARRAY [UT_TRISTATE];
		a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing quick check values.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			array_not_void: a_array /= Void
			array_name_not_void: a_array_name /= Void
			array_name_not_empty: not a_array_name.is_empty
			title_not_void: a_title /= Void
			title_not_empty: not a_title.is_empty
			a_all_true_plane_name_not_void: a_all_true_plane_name /= Void
			a_all_true_plane_name_not_empty: not a_all_true_plane_name.is_empty
			a_all_false_segment_name_not_void: a_all_false_segment_name /= Void
			a_all_false_segment_name_not_empty: not a_all_false_segment_name.is_empty
			a_all_true_segment_name_not_void: a_all_true_segment_name /= Void
			a_all_true_segment_name_not_empty: not a_all_true_segment_name.is_empty
			a_all_undefined_segment_name_not_void: a_all_undefined_segment_name /= Void
			a_all_undefined_segment_name_not_empty: not a_all_undefined_segment_name.is_empty
			plane_prefix_not_void: a_plane_prefix /= Void
			plane_prefix_not_empty: not a_plane_prefix.is_empty
		local
			i: INTEGER
			l_plane_names: ARRAY [STRING]
			l_all_true_plane_written, l_all_false_segment_written, l_all_undefined_segment_written, l_all_true_segment_written: DS_CELL [BOOLEAN]
		do
			create l_plane_names.make_filled (Void, 0, 16)
			create l_all_true_plane_written.make (False)
			create l_all_false_segment_written.make (False)
			create l_all_undefined_segment_written.make (False)
			create l_all_true_segment_written.make (False)
			from i := 0 until i > 16 loop
				assemble_tristate_plane (i, a_array, l_plane_names,
					a_all_true_plane_name,
					a_all_false_segment_name,
					a_all_true_segment_name,
					a_all_undefined_segment_name,
					a_plane_prefix,
					l_all_true_plane_written,
					l_all_false_segment_written,
					l_all_undefined_segment_written,
					l_all_true_segment_written,
					a_output_file)
				i := i + 1
			end
			a_output_file.put_string ("%T" + a_array_name + ": SPECIAL [SPECIAL [ARRAY [CHARACTER]]]%N")
			a_output_file.put_string ("%T%T%T-- " + a_title + " for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	assemble_tristate_plane (i: INTEGER; l_array: ARRAY [UT_TRISTATE]; a_plane_names: ARRAY [STRING];
		a_all_true_plane_name, a_all_false_segment_name, a_all_true_segment_name, a_all_undefined_segment_name, a_plane_prefix: STRING;
		a_all_true_plane_written, a_all_false_segment_written, a_all_undefined_segment_written, a_all_true_segment_written: DS_CELL [BOOLEAN]
		a_output_file: KL_TEXT_OUTPUT_FILE)
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			plane_names_not_void: a_plane_names /= Void
			plane_names_indexed_from_zero: a_plane_names.lower = 0
			plane_names_indexed_to_sixteen: a_plane_names.upper = 16
			valid_plane_number: i >= 0 and i <= 16
			array_not_void: l_array /= Void
			a_all_true_plane_name_not_void: a_all_true_plane_name /= Void
			a_all_true_plane_name_not_empty: not a_all_true_plane_name.is_empty
			a_all_false_segment_name_not_void: a_all_false_segment_name /= Void
			a_all_false_segment_name_not_empty: not a_all_false_segment_name.is_empty
			a_all_true_segment_name_not_void: a_all_true_segment_name /= Void
			a_all_true_segment_name_not_empty: not a_all_true_segment_name.is_empty
			a_all_undefined_segment_name_not_void: a_all_undefined_segment_name /= Void
			a_all_undefined_segment_name_not_empty: not a_all_undefined_segment_name.is_empty
			plane_prefix_not_void: a_plane_prefix /= Void
			plane_prefix_not_empty: not a_plane_prefix.is_empty
		local
			l_segment_names: ARRAY [STRING]
			j, k: INTEGER
			l_segment: ARRAY [UT_TRISTATE]
			l_plane_array_name, l_segment_array_name: STRING
			l_plane_all_true, l_segment_all_false, l_segment_all_undefined, l_segment_all_true: DS_CELL [BOOLEAN]
			l_value: UT_TRISTATE
		do
			create l_segment_names.make_filled (Void, 0, 255)
			create l_plane_all_true.make (True)
			from j := 0 until j > 255 loop
				create l_segment.make_filled (Void, 0, 255)
				create l_segment_all_false.make (True)
				create l_segment_all_true.make (True)
				create l_segment_all_undefined.make (True)
				from  k := 0 until k > 255 loop
					l_value := l_array.item (k + 256 * j + 256 * 256 * i)
					if l_value.is_true then
						l_segment_all_false.put (False)
						l_segment_all_undefined.put (False)
					elseif l_value.is_undefined then
						l_segment_all_false.put (False)
						l_plane_all_true.put (False)
						l_segment_all_true.put (False)
					else
						l_segment_all_true.put (False)
						l_plane_all_true.put (False)
						l_segment_all_undefined.put (False)
					end
					l_segment.put (l_value, k)
					k := k + 1
				end
				if l_segment_all_false.item then
					l_segment_array_name := a_all_false_segment_name
					if not a_all_false_segment_written.item then
						a_all_false_segment_written.put (True)
						write_tristate_segment (l_segment, l_segment_array_name, a_output_file)
					end
				elseif l_segment_all_true.item then
					l_segment_array_name := a_all_true_segment_name
					if not a_all_true_segment_written.item then
						a_all_true_segment_written.put (True)
						write_tristate_segment (l_segment, l_segment_array_name, a_output_file)
					end
				elseif l_segment_all_undefined.item then
					l_segment_array_name := a_all_undefined_segment_name
					if not a_all_undefined_segment_written.item then
						a_all_undefined_segment_written.put (True)
						write_tristate_segment (l_segment, l_segment_array_name, a_output_file)
					end
				else
					l_segment_array_name := a_plane_prefix + i.out + "_segment_" + j.out
					write_tristate_segment (l_segment, l_segment_array_name, a_output_file)
				end
				l_segment_names.put (l_segment_array_name, j)
				j := j + 1
			end
			if l_plane_all_true.item then
				l_plane_array_name := a_all_true_plane_name
				if not a_all_true_plane_written.item then
					a_all_true_plane_written.put (True)
					write_all_true_tristate_plane (l_plane_array_name, a_all_true_segment_name, a_output_file)
				end
			else
				l_plane_array_name := a_plane_prefix + i.out
				write_tristate_plane (l_segment_names, l_plane_array_name, a_output_file)
			end
			a_plane_names.put (l_plane_array_name, i)
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_tristate_plane (a_segment_names: ARRAY [STRING]; a_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane `a_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_array_names_not_void: a_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_name)
			a_output_file.put_string (": SPECIAL [ARRAY [CHARACTER]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_names.item (0))
			a_output_file.put_string (", 256)%N")
			from i := 0 until i > 255 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (a_segment_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_all_true_tristate_plane (a_plane_name, a_segment_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane where every value is `True' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_plane_name)
			a_output_file.put_string (": SPECIAL [ARRAY [CHARACTER]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_name)
			a_output_file.put_string (", 256)%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_lower_case_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel `ARRAY' containing lower case equivalents.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code, l_value: INTEGER
			l_code_datum: GEUC_UNICODE_DATA
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_absent, l_segment_all_absent: BOOLEAN
			l_empty_plane_written, l_empty_segment_written: BOOLEAN
			l_segment: ARRAY [INTEGER]
			l_plane_array_name, l_segment_array_name: STRING
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				from l_plane_all_absent := True; j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_absent := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_code_datum := codes.item (l_code)
						if l_code_datum = Void then
							l_value := -1
						else
							l_value := l_code_datum.lower_code
						end
						if l_value /= - 1 then
							l_segment_all_absent := False
							l_plane_all_absent := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_absent then
						l_segment_array_name := Empty_lower_code_segment_array_name
						if not l_empty_segment_written then
							l_empty_segment_written := True
							write_integer_segment (l_segment, Empty_lower_code_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "lower_code_plane_" + i.out + "_segment_" + j.out
						write_integer_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_absent then
					l_plane_array_name := Empty_lower_code_plane_array_name
					if not l_empty_plane_written then
						l_empty_plane_written := True
						write_empty_integer_plane (l_plane_array_name, Empty_lower_code_segment_array_name, a_output_file)
					end
				else
					l_plane_array_name := "lower_code_plane_" + i.out
					write_integer_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tlower_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]]%N")
			a_output_file.put_string ("%T%T%T-- Lower case code points for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_upper_case_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing upper case equivalents.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code, l_value: INTEGER
			l_code_datum: GEUC_UNICODE_DATA
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_absent, l_segment_all_absent: BOOLEAN
			l_empty_plane_written, l_empty_segment_written: BOOLEAN
			l_segment: ARRAY [INTEGER]
			l_plane_array_name, l_segment_array_name: STRING
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_absent := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_absent := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_code_datum := codes.item (l_code)
						if l_code_datum = Void then
							l_value := -1
						else
							l_value := l_code_datum.upper_code
						end
						if l_value /= - 1 then
							l_segment_all_absent := False
							l_plane_all_absent := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_absent then
						l_segment_array_name := Empty_upper_code_segment_array_name
						if not l_empty_segment_written then
							l_empty_segment_written := True
							write_integer_segment (l_segment, Empty_upper_code_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "upper_code_plane_" + i.out + "_segment_" + j.out
						write_integer_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_absent then
					l_plane_array_name := Empty_upper_code_plane_array_name
					if not l_empty_plane_written then
						l_empty_plane_written := True
						write_empty_integer_plane (l_plane_array_name, Empty_upper_code_segment_array_name, a_output_file)
					end
				else
					l_plane_array_name := "upper_code_plane_" + i.out
					write_integer_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Tupper_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]]%N")
			a_output_file.put_string ("%T%T%T-- Upper case code points for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_title_case_array (a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an Eiffel 'ARRAY' containing title case equivalents.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
		local
			i, j, k, l_code, l_value: INTEGER
			l_code_datum: GEUC_UNICODE_DATA
			l_segment_names, l_plane_names: ARRAY [STRING]
			l_plane_all_absent, l_segment_all_absent: BOOLEAN
			l_empty_plane_written, l_empty_segment_written: BOOLEAN
			l_segment: ARRAY [INTEGER]
			l_plane_array_name, l_segment_array_name: STRING
		do
			create l_plane_names.make_filled (Void, 0, 16)
			from i := 0 until i > 16 loop
				create l_segment_names.make_filled (Void, 0, 255)
				l_plane_all_absent := True
				from j := 0 until j > 255 loop
					create l_segment.make_filled (0, 0, 255)
					l_segment_all_absent := True
					from k := 0 until k > 255 loop
						l_code := k + 256 * j + 256 * 256 * i
						l_code_datum := codes.item (l_code)
						if l_code_datum = Void then
							l_value := -1
						else
							l_value := l_code_datum.title_code
						end
						if l_value /= - 1 then
							l_segment_all_absent := False
							l_plane_all_absent := False
						end
						l_segment.put (l_value, k)
						k := k + 1
					end
					if l_segment_all_absent then
						l_segment_array_name := Empty_title_code_segment_array_name
						if not l_empty_segment_written then
							l_empty_segment_written := True
							write_integer_segment (l_segment, Empty_title_code_segment_array_name, a_output_file)
						end
					else
						l_segment_array_name := "title_code_plane_" + i.out + "_segment_" + j.out
						write_integer_segment (l_segment, l_segment_array_name, a_output_file)
					end
					l_segment_names.put (l_segment_array_name, j)
					j := j + 1
				end
				if l_plane_all_absent then
					l_plane_array_name := Empty_title_code_plane_array_name
					if not l_empty_plane_written then
						l_empty_plane_written := True
						write_empty_integer_plane (l_plane_array_name, Empty_title_code_segment_array_name, a_output_file)
					end
				else
					l_plane_array_name := "title_code_plane_" + i.out
					write_integer_plane (l_segment_names, l_plane_array_name, a_output_file)
				end
				l_plane_names.put (l_plane_array_name, i)
				i := i + 1
			end
			a_output_file.put_string ("%Ttitle_codes: SPECIAL [SPECIAL [ARRAY [INTEGER]]]%N")
			a_output_file.put_string ("%T%T%T-- Title case code points for each code point%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (l_plane_names.item (0))
			a_output_file.put_string (", 17)%N")
			from i := 0 until i > 16 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (l_plane_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	 write_integer8_plane (a_segment_names: ARRAY [STRING]; a_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane `a_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_array_names_not_void: a_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_name)
			a_output_file.put_string (": SPECIAL [ARRAY [INTEGER_8]]%N")
			a_output_file.put_string ("%T%T%T-- Generated character class array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_names.item (0))
			a_output_file.put_string (", 256)%N")
			from i := 0 until i > 255 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (a_segment_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_empty_integer8_plane (a_plane_name, a_segment_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an empty character-class plane to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_plane_name)
			a_output_file.put_string (": SPECIAL [ARRAY [INTEGER_8]]%N")
			a_output_file.put_string ("%T%T%T-- Generated character class array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_name)
			a_output_file.put_string (", 256)%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_integer8_segment (a_segment: ARRAY [INTEGER_8]; a_segment_array_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for `a_segment', named `a_segment_array_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			i, l_value: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_segment_array_name)
			a_output_file.put_string (": ARRAY [INTEGER_8]%N")
			a_output_file.put_string ("%T%T%T-- Generated character class array segment%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := string_to_array8 (%"")
			from until i > 255 loop
				l_value := a_segment.item (i)
				a_output_file.put_string ("%%/" + l_value.out + "/")
				i := i + 1
			end
			a_output_file.put_string ("%")%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_integer_plane (a_segment_names: ARRAY [STRING]; a_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane `a_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_array_names_not_void: a_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_name)
			a_output_file.put_string (": SPECIAL [ARRAY [INTEGER]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_names.item (0))
			a_output_file.put_string (", 256)%N")
			from i := 0 until i > 255 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (a_segment_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_empty_integer_plane (a_plane_name, a_segment_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an empty code plane to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_plane_name)
			a_output_file.put_string (": SPECIAL [ARRAY [INTEGER]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_name)
			a_output_file.put_string (", 256)%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_integer_segment (a_segment: ARRAY [INTEGER]; a_segment_array_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for `a_segment', named `a_segment_array_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_segment_array_name)
			a_output_file.put_string (": ARRAY [INTEGER]%N")
			a_output_file.put_string ("%T%T%T-- Generated array segment%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := <<%N%T%T%TINTEGER_.to_integer (")
			from until i > 255 loop
				a_output_file.put_string (a_segment.item (i).out)
				if i = 0 then
					a_output_file.put_string (")")
				end
				if i = 255 then
				   a_output_file.put_string (">>")
				else
					a_output_file.put_string (",")
				end
				if i \\ 10 = 0 then
					a_output_file.put_string ("%N%T%T%T")
				end
				i := i + 1
			end
			a_output_file.put_string ("%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%Tend%N%N")

		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_empty_integer_list_plane (a_plane_name, a_segment_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for an empty code plane to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_plane_name)
			a_output_file.put_string (": SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_name)
			a_output_file.put_string (", 256)%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_integer_list_plane (a_segment_names: ARRAY [STRING]; a_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane `a_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_array_names_not_void: a_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_name)
			a_output_file.put_string (": SPECIAL [ARRAY [DS_ARRAYED_LIST [INTEGER]]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_names.item (0))
			a_output_file.put_string (", 256)%N")
			from until i > 255 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (a_segment_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_integer_list_segment (a_segment: ARRAY [DS_ARRAYED_LIST [INTEGER]]; a_segment_array_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE; all_empty: BOOLEAN)
			-- Write code for `a_segment', named `a_segment_array_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			i, j: INTEGER
			l_list: DS_ARRAYED_LIST [INTEGER]
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_segment_array_name)
			a_output_file.put_string (": ARRAY [detachable DS_ARRAYED_LIST [INTEGER]]%N")
			a_output_file.put_string ("%T%T%T-- Generated arrayed_list segment%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (Void, 0, 255)%N")
			if not all_empty then
				from until i > 255 loop
					l_list := a_segment.item (i)
					if l_list /= Void then
						j := l_list.count
						if j = 1 then
							a_output_file.put_string ("%T%T%TResult.put (new_singleton (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 2 then
							a_output_file.put_string ("%T%T%TResult.put (new_pair (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 3 then
							a_output_file.put_string ("%T%T%TResult.put (new_triple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 4 then
							a_output_file.put_string ("%T%T%TResult.put (new_quadruple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (4).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 5 then
							a_output_file.put_string ("%T%T%TResult.put (new_quintuple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (4).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (5).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 6 then
							a_output_file.put_string ("%T%T%TResult.put (new_sextuple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (4).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (5).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (6).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 7 then
							a_output_file.put_string ("%T%T%TResult.put (new_heptuple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (4).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (5).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (6).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (7).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 8 then
							a_output_file.put_string ("%T%T%TResult.put (new_octuple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (4).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (5).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (6).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (7).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (8).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						elseif j = 18 then
							a_output_file.put_string ("%T%T%TResult.put (new_eighteen_tuple (")
							a_output_file.put_string (l_list.item (1).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (2).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (3).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (4).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (5).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (6).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (7).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (8).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (9).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (10).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (11).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (12).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (13).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (14).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (15).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (16).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (17).out)
							a_output_file.put_string (",")
							a_output_file.put_string (l_list.item (18).out)
							a_output_file.put_string ("),")
							a_output_file.put_string (i.out)
							a_output_file.put_string (")%N")
						else
							report_general_message ("Integer list too long - count = " + j.out)
							Exceptions.die (1)
						end
					end
					i := i + 1
				end
			end
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_boolean_plane (a_segment_names: ARRAY [STRING]; a_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane `a_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_array_names_not_void: a_segment_names /= Void
			name_not_void: a_name /= Void
			name_not_empty: not a_name.is_empty
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_name)
			a_output_file.put_string (": SPECIAL [ARRAY [BOOLEAN]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (")
			a_output_file.put_string (a_segment_names.item (0))
			a_output_file.put_string (", 256)%N")
			from until i > 255 loop
				a_output_file.put_string ("%T%T%TResult.put (")
				a_output_file.put_string (a_segment_names.item (i))
				a_output_file.put_string (", ")
				a_output_file.put_string (i.out)
				a_output_file.put_string (")%N")
				i := i + 1
			end
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_all_false_boolean_plane (a_plane_name, a_segment_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for plane where every value is `False' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			plane_name_not_void: a_plane_name /= Void
			plane_name_not_empty: not a_plane_name.is_empty
			segment_name_not_void: a_segment_name /= Void
			segment_name_not_empty: not a_segment_name.is_empty
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_plane_name)
			a_output_file.put_string (": SPECIAL [ARRAY [BOOLEAN]]%N")
			a_output_file.put_string ("%T%T%T-- Generated array plane%N")
			a_output_file.put_string ("%T%Tlocal%N")
			a_output_file.put_string ("%T%T%Ti: INTEGER%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%Tcreate Result.make_filled (create {ARRAY [BOOLEAN]}.make_filled (False, 1, 256), 256)%N")
			a_output_file.put_string ("%T%T%Tfrom%N")
			a_output_file.put_string ("%T%T%T%Ti := 0%N")
			a_output_file.put_string ("%T%T%Tuntil%N")
			a_output_file.put_string ("%T%T%T%Ti > 255%N")
			a_output_file.put_string ("%T%T%Tloop%N")
			a_output_file.put_string ("%T%T%T%TResult.put (create {ARRAY [BOOLEAN]}.make_filled (False, 1, 256), i)%N")
			a_output_file.put_string ("%T%T%T%Ti := i + 1%N")
			a_output_file.put_string ("%T%T%Tend%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%T%Tsub_arrays_not_void: True --not Result.has (Void)%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_boolean_segment (a_segment: ARRAY [BOOLEAN]; a_segment_array_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for `a_segment', named `a_segment_array_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_not_void: a_segment /= Void
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			i: INTEGER
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_segment_array_name)
			a_output_file.put_string (": ARRAY [BOOLEAN]%N")
			a_output_file.put_string ("%T%T%T-- Generated array segment%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := <<%N%T%T")
			from  until i > 255 loop
				a_output_file.put_string (a_segment.item (i).out)
				if i = 255 then
				   a_output_file.put_string (">>")
				else
					a_output_file.put_string (",")
				end
				if i \\ 10 = 0 then
					a_output_file.put_string ("%N%T%T%T")
				end
				i := i + 1
			end
			a_output_file.put_string ("%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	write_tristate_segment (a_segment: ARRAY [UT_TRISTATE]; a_segment_array_name: STRING; a_output_file: KL_TEXT_OUTPUT_FILE)
			-- Write code for `a_segment', named `a_segment_array_name' to `a_output_file'.
		require
			file_not_void: a_output_file /= Void
			file_open_write: a_output_file.is_open_write
			segment_not_void: a_segment /= Void
			-- no_void_segment_item: not a_segment.has (Void)
			segment_array_names_not_void: a_segment_array_name /= Void
		local
			i: INTEGER
			l_state: UT_TRISTATE
		do
			a_output_file.put_string ("%T")
			a_output_file.put_string (a_segment_array_name)
			a_output_file.put_string (": ARRAY [CHARACTER]%N")
			a_output_file.put_string ("%T%T%T-- Generated array segment%N")
			a_output_file.put_string ("%T%Tonce%N")
			a_output_file.put_string ("%T%T%TResult := <<")
			from until i > 255 loop
				l_state := a_segment.item (i)
				if l_state.is_true then
					a_output_file.put_string ("'%%/1/'")
				elseif l_state.is_false then
					a_output_file.put_string ("'%%/0/'")
				else
					a_output_file.put_string ("'%%/2/'")
				end
				if i = 255 then
					a_output_file.put_string (">>%N")
				else
					a_output_file.put_string (",")
					if i \\ 10 = 0 then
						a_output_file.put_string ("%N")
					end
				end
				i := i + 1
			end
			a_output_file.put_string ("%N")
			a_output_file.put_string ("%T%Tensure%N")
			a_output_file.put_string ("%T%T%Tresult_not_void: Result /= Void%N")
			a_output_file.put_string ("%T%Tend%N%N")
		ensure
			file_still_open: a_output_file.is_open_write
		end

	process_code_class (a_code: INTEGER; a_name: STRING; a_fields: DS_LIST [STRING])
			-- Process character class et. el. for `a_code'.
		require
			name_not_void: a_name /= Void
			fields_not_void: a_fields /= Void
			fifteen_fields: a_fields.count = Field_count
		local
			l_data_point: GEUC_UNICODE_DATA
		do
			create l_data_point.make (a_code, a_name, a_fields)
			if l_data_point.is_valid then
				codes.put (l_data_point, a_code)
			else
				report_general_message ("Invalid code point: " + a_code.out)
				Exceptions.die (1)
			end
		end

	process_full_mapping_data (a_code: INTEGER; a_lower, a_title, a_upper: STRING)
			-- Process special case mappings for `a_code'.
		require
			codes_not_void: codes /= Void
			a_lower_not_void: a_lower /= Void
			a_title_not_void: a_title /= Void
			a_upper_not_void: a_upper /= Void
		local
			l_data_point: GEUC_UNICODE_DATA
		do
			if codes.valid_index (a_code) then
				l_data_point := codes.item (a_code)
				l_data_point.set_special_case_mappings (a_lower, a_title, a_upper)
				if not l_data_point.is_valid then
					report_general_message ("Invalid special case mappings for code point: " + a_code.out)
					Exceptions.die (1)
				end
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

	initialize_derived_core_properties
			-- Create arrays for derived core properties.
		require
			upper_case_array_void: upper_case_array = Void
			lower_case_array_void: lower_case_array = Void
			alphabetic_array_void: alphabetic_array = Void
			math_array_void: math_array = Void
		do
			create upper_case_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create lower_case_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create alphabetic_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create math_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
		ensure
			upper_case_array_not_void: upper_case_array /= Void
			lower_case_array_not_void: lower_case_array /= Void
			alphabetic_array_not_void: alphabetic_array /= Void
			math_array_not_void: math_array /= Void
		end

	initialize_derived_normalization_properties
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
		local
			l_false_tristate: UT_TRISTATE
		do
			create full_composition_exclusion_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfc_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfd_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfkc_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create expands_on_nfkd_array.make_filled (False, minimum_unicode_character_code, maximum_unicode_character_code)
			create l_false_tristate.make_false
			create nfd_quick_check_array.make_filled (l_false_tristate, minimum_unicode_character_code, maximum_unicode_character_code)
			set_array_tristate_true (nfd_quick_check_array)
			create nfc_quick_check_array.make_filled (l_false_tristate, minimum_unicode_character_code, maximum_unicode_character_code)
			set_array_tristate_true (nfc_quick_check_array)
			create nfkd_quick_check_array.make_filled (l_false_tristate, minimum_unicode_character_code, maximum_unicode_character_code)
			set_array_tristate_true (nfkd_quick_check_array)
			create nfkc_quick_check_array.make_filled (l_false_tristate, minimum_unicode_character_code, maximum_unicode_character_code)
			set_array_tristate_true (nfkc_quick_check_array)
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

	set_upper_case_property (a_range: STRING)
			-- Set `Uppercase_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				upper_case_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_lower_case_property (a_range: STRING)
			-- Set `Lowercase_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				lower_case_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_alphabetic_property (a_range: STRING)
			-- Set `Alphabetic_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				alphabetic_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_math_property (a_range: STRING)
			-- Set `Math_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				math_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_full_composition_exclusion_property (a_range: STRING)
			-- Set `Full_composition_exclusion_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				full_composition_exclusion_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_nfc_property (a_range: STRING)
			-- Set `Expands_on_nfc_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				expands_on_nfc_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_nfd_property (a_range: STRING)
			-- Set `Expands_on_nfd_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				expands_on_nfd_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_nfkc_property (a_range: STRING)
			-- Set `Expands_on_nfkc_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				expands_on_nfkc_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_nfkd_property (a_range: STRING)
			-- Set `Expands_on_nfkd_property' to `True' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				expands_on_nfkd_array.put (True, l_code)
				l_code := l_code + 1
			end
		end

	set_nfd_quick_check_property (a_value, a_range: STRING)
			-- Set `Nfd_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfd_quick_check_array /= Void -- and then not nfd_quick_check_array.has (Void)
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfd_quick_check_array.item (l_code).set_false
				else
					nfd_quick_check_array.item (l_code).set_undefined
				end
				l_code := l_code + 1
			end
		end

	set_nfc_quick_check_property (a_value, a_range: STRING)
			-- Set `Nfc_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfc_quick_check_array /= Void -- and then not nfc_quick_check_array.has (Void)
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfc_quick_check_array.item (l_code).set_false
				else
					nfc_quick_check_array.item (l_code).set_undefined
				end
				l_code := l_code + 1
			end
		end

	set_nfkd_quick_check_property (a_value, a_range: STRING)
			-- Set `Nfkd_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfkd_quick_check_array /= Void -- and then not nfkd_quick_check_array.has (Void)
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfkd_quick_check_array.item (l_code).set_false
				else
					nfkd_quick_check_array.item (l_code).set_undefined
				end
				l_code := l_code + 1
			end
		end

	set_nfkc_quick_check_property (a_value, a_range: STRING)
			-- Set `Nfkc_quick_check_property' for all code-points in `a_range'.
		require
			range_not_void: a_range /= Void
			range_not_empty: not a_range.is_empty
			no_comment: a_range.index_of ('#', 1) = 0
			value_not_void: a_value /= Void
			good_value: STRING_.same_string ("N", a_value) or STRING_.same_string ("M", a_value)
			array_in_good_state: nfkc_quick_check_array /= Void -- and then not nfkc_quick_check_array.has (Void)
		local
			l_code, l_finish: INTEGER
		do
			from
				l_code := starting_code (a_range)
				l_finish := ending_code (a_range)
			until
				l_code > l_finish
			loop
				if STRING_.same_string ("N", a_value) then
					nfkc_quick_check_array.item (l_code).set_false
				else
					nfkc_quick_check_array.item (l_code).set_undefined
				end
				l_code := l_code + 1
			end
		end

	starting_code (a_code_range: STRING): INTEGER
			-- Starting code-point within `a_code_range'.
		require
			range_not_void: a_code_range /= Void
			range_not_empty: not a_code_range.is_empty
			no_comment: a_code_range.index_of ('#', 1) = 0
		local
			l_splitter: ST_SPLITTER
			l_codes: DS_LIST [STRING]
			l_range: STRING
			l_count: INTEGER
		do
			l_range := STRING_.cloned_string (a_code_range)
			STRING_.left_adjust (l_range)
			STRING_.right_adjust (l_range)
			create l_splitter.make_with_separators ("..")
			l_codes := l_splitter.split_greedy (l_range)
			l_count := l_codes.count
			if l_count = 1 or l_count = 3 then
				if l_count = 3 and then not l_codes.item (2).is_empty then
					report_general_message ("Invalid hexadecimal code point range: " + a_code_range)
					Exceptions.die (1)
				elseif STRING_.is_hexadecimal (l_codes.item (1)) then
					Result := STRING_.hexadecimal_to_integer (l_codes.item (1))
				else
					report_general_message ("Invalid initial hexadecimal code point: " + l_codes.item (1))
					Exceptions.die (1)
				end
			else
				report_general_message ("Invalid code point range: " + a_code_range.out)
				Exceptions.die (1)
			end
		end

	ending_code (a_code_range: STRING): INTEGER
			-- Ending code-point within `a_code_range'.
		require
			range_not_void: a_code_range /= Void
			range_not_empty: not a_code_range.is_empty
			no_comment: a_code_range.index_of ('#', 1) = 0
		local
			l_splitter: ST_SPLITTER
			l_codes: DS_LIST [STRING]
			l_range: STRING
			l_count: INTEGER
		do
			l_range := STRING_.cloned_string (a_code_range)
			STRING_.left_adjust (l_range)
			STRING_.right_adjust (l_range)
			create l_splitter.make_with_separators ("..")
			l_codes := l_splitter.split_greedy (l_range)
			l_count := l_codes.count
			if l_count = 1 then
				if STRING_.is_hexadecimal (l_codes.item (1)) then
					Result := STRING_.hexadecimal_to_integer (l_codes.item (1))
				else
					report_general_message ("Invalid initial hexadecimal code point: " + l_codes.item (1))
					Exceptions.die (1)
				end
			elseif l_count = 3 then
				if not l_codes.item (2).is_empty then
					report_general_message ("Invalid hexadecimal code point range: " + a_code_range)
					Exceptions.die (1)
				elseif STRING_.is_hexadecimal (l_codes.item (3)) then
					Result := STRING_.hexadecimal_to_integer (l_codes.item (3))
				else
					report_general_message ("Invalid final hexadecimal code: " + l_codes.item (2))
					Exceptions.die (1)
				end
			else
				report_general_message ("Invalid code point range: " + a_code_range.out)
				Exceptions.die (1)
			end
		end

	check_tristate_property (a_fields: DS_LIST [STRING]; a_line: STRING)
			-- Check `a_fields' has a valid tri-state property value.
		require
			a_fields_not_void: a_fields /= Void
			line_not_void: a_line /= Void
			line_not_empty: not a_line.is_empty
		local
			l_value: STRING
		do
			if a_fields.count /= 3 then
				report_general_message ("Exactly three fields must be present for a three-valued boolean property. Found: " + a_line)
				Exceptions.die (1)
			else
				l_value := a_fields.item (3)
				STRING_.left_adjust (l_value)
				STRING_.right_adjust (l_value)
				if STRING_.same_string ("M", l_value) then
					-- Maybe - OK
				elseif STRING_.same_string ("N", l_value) then
					-- No - OK
				else
					report_general_message ("Three-valued boolean property must be 'N' or 'M'. Found: " + l_value)
					Exceptions.die (1)
				end
			end
		ensure
			three_fields: a_fields.count = 3
			good_value: True -- 'M' or 'N'
		end

	set_array_tristate_true (l_array: ARRAY [UT_TRISTATE])
			-- Set all `l_array' to true.
		require
			array_not_void: l_array /= Void
		local
			l_true: UT_TRISTATE
			i, nb: INTEGER
		do
			i := l_array.lower
			nb := l_array.upper
			from until i > nb loop
				create l_true.make_true
				l_array.put (l_true, i)
				i := i + 1
			end
		ensure
			-- no_void_items: not l_array.has (Void)
			all_true: True
		end

	is_combining_class (a_class: INTEGER): BOOLEAN
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

	projected_combining_class (a_class: INTEGER): INTEGER_8
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
