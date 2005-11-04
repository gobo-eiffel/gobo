indexing

	description:

		"Test features of class ST_UNICODE_NORMALIZATION_ROUTINES"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ST_TEST_NORMALIZATION_ROUTINES

inherit

	TS_TEST_CASE

	KL_SHARED_FILE_SYSTEM

	ST_UNICODE_NORMALIZATION_ROUTINES

feature -- Test

	test_decomposition is
			-- Test `decomposition_type_property' and `decomposition_mapping_property'.
		local
			a_string: STRING
			changed: DS_CELL [BOOLEAN]
		do
			assert ("LATIN CAPITAL A has no decomposition", decomposition_type_property (65) = Canonical_decomposition_mapping and decomposition_mapping_property (65) = Void)
			assert ("COMBINING GREEK DIALYTIKA TONOS has a canonical decomposition", decomposition_type_property (836) = Canonical_decomposition_mapping and decomposition_mapping_property (836) /= Void)
			assert ("COMBINING GREEK DIALYTIKA TONOS decomposes to COMBINING DIAERESIS + COMBINING ACUTE ACCENT",
					  decomposition_mapping_property (836).count = 2 and then (decomposition_mapping_property (836).item (1) = 776 and decomposition_mapping_property (836).item (2) = 769))
			assert ("GREEK YPOGEGRAMMENI has a compatibility decomposition", decomposition_type_property (890) = Compatibility_decomposition_mapping and decomposition_mapping_property (890) /= Void)
			assert ("GREEK YPOGEGRAMMENI decomposes to SPACE + COMBINING GREEK YPOGEGRAMMENI",
					  decomposition_mapping_property (890).count = 2 and then (decomposition_mapping_property (890).item (1) = 32 and decomposition_mapping_property (890).item (2) = 837))
			assert ("DOUBLE-STRUCK CAPITAL C has a font variant decomposition", decomposition_type_property (8450) = Font_decomposition_mapping and decomposition_mapping_property (8450) /= Void)
			assert ("DOUBLE-STRUCK CAPITAL C decomposes to LATIN CAPITAL CC",
					  decomposition_mapping_property (8450).count = 1 and then decomposition_mapping_property (8450).item (1) = 67)
			create changed.make (False)
			a_string := string_from_code_points (decomposition (a_acute_c_acute_cedilla, True, changed))
			assert ("a_acute_c_acute_cedilla decomposes canonically to a_acute_c_cedilla_accute 1", a_string /= Void and then a_string.count = 5)
			assert ("a_acute_c_acute_cedilla first character is a", a_string.item_code (1) = 97)
			assert ("a_acute_c_acute_cedilla second character is acute", a_string.item_code (2) = 769)
			assert ("a_acute_c_acute_cedilla third character is c", a_string.item_code (3) = 99)
			assert ("a_acute_c_acute_cedilla fourth character is cedilla", a_string.item_code (4) = 807)
			assert ("a_acute_c_acute_cedilla fifth character is acute", a_string.item_code (5) = 769)
		end

	test_normalization is
			-- Test normalization routines using test data file.
		local
			a_file: KL_TEXT_INPUT_FILE
			a_splitter: ST_SPLITTER
			some_fields: DS_LIST [STRING]
			a_hash, a_line_number: INTEGER
			a_line, c1, c2, c3, c4, c5: STRING
			is_part1: BOOLEAN
			last_part1_code_point, c1_code_point: INTEGER
		do
			last_part1_code_point := -1
			create a_file.make (normalization_test_filename)
			a_file.open_read
			if a_file.is_open_read then
				create a_splitter.make_with_separators (";")
				from  until a_file.end_of_file loop
					a_line_number := a_line_number + 1
					a_file.read_line
					if not a_file.end_of_file then
						a_line := a_file.last_string
						if not a_line.is_empty and then a_line.item (1) = '@' then
							assert ("@Partn", a_line.count >= 6 and then a_line.substring (6, 6).is_integer)
							is_part1	:= a_line.substring (6, 6).to_integer = 1
						else
							a_hash :=  a_line.index_of ('#', 1)
							if a_hash > 0 then a_line := a_line.substring (1, a_hash - 1) end -- strip comments
							if not a_line.is_empty then
								some_fields := a_splitter.split_greedy (a_line)
								if some_fields.count /= Test_file_field_count then
									assert ("Bad data line in NormalizationTest.txt - wrong number of fields - data line is: " + a_file.last_string, False)
								else
									c1 := decoded_string (some_fields.item (1))
									if is_part1 then
										assert ("Single code point", c1.count = 1)
										c1_code_point := c1.item_code (1)
										from last_part1_code_point := last_part1_code_point + 1 until c1_code_point = last_part1_code_point loop
											check_all_normal_forms_identity (last_part1_code_point)
											last_part1_code_point :=  last_part1_code_point + 1
										end
									end
									c2 := decoded_string (some_fields.item (2))
									c3 := decoded_string (some_fields.item (3))
									c4 := decoded_string (some_fields.item (4))
									c5 := decoded_string (some_fields.item (5))
									run_test_data (c1, c2, c3, c4, c5, a_line_number)
								end
							end
						end
					end
				end
				a_file.close
			end
		end

feature -- Access

	a_acute_c_acute_cedilla: STRING is
			-- Partially composed string
		once
			Result := STRING_.concat (unicode.code_to_string (225), unicode.code_to_string (99))
			Result := STRING_.appended_string (Result, unicode.code_to_string (769))
			Result := STRING_.appended_string (Result, unicode.code_to_string (807))
		ensure
			four_code_points: Result /= Void and then Result.count = 4
		end

	Test_file_field_count: INTEGER is 6
			-- Number of fields in "NormalizationTest.txt"
		
feature {NONE} -- Implementation

	data_dirname: STRING is
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"test", "string", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_empty: Result /= Void and then not Result.is_empty
		end
	
	normalization_test_filename: STRING is
			-- Pathname of file '.txt'
		once
			Result := file_system.pathname (data_dirname, "NormalizationTest.txt")
		ensure
			normalization_test_filename_not_void: Result /= Void
			normalization_test_filename_not_empty: not Result.is_empty
		end

	run_test_data (c1, c2, c3, c4, c5: STRING; a_line_number: INTEGER) is
			-- Run tests against data from "NormalizationTest.txt".
		require
			column_one_not_empty: c1 /= Void and then not c1.is_empty
			column_two_not_empty: c2 /= Void and then not c2.is_empty
			column_three_not_empty: c3 /= Void and then not c3.is_empty
			column_four_not_empty: c4 /= Void and then not c4.is_empty
			column_five_not_empty: c5 /= Void and then not c5.is_empty
			strictly_positive_line_number: a_line_number > 0
		do
			assert ("Column 3 is in NFD on line " + a_line_number.out + " in NormalizationTest.txt", is_nfd_normalized_string (c3))
			assert_strings_equal ("NFD (Column3) equals Column 3 on line " + a_line_number.out + " in NormalizationTest.txt", c3, as_nfd_normalized_string (c3))
			assert_strings_equal ("NFD (column 1) equals column 3 on line " + a_line_number.out + " in NormalizationTest.txt", c3, as_nfd_normalized_string (c1))
			assert_strings_equal ("NFD (column 2) equals column 3 on line " + a_line_number.out + " in NormalizationTest.txt", c3, as_nfd_normalized_string (c2))
			assert ("Column 5 is in NFD on line " + a_line_number.out + " in NormalizationTest.txt", is_nfd_normalized_string (c5))
			assert_strings_equal ("NFD (column 4) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfd_normalized_string (c4))
			assert_strings_equal ("NFD (column 5) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfd_normalized_string (c5))
			assert ("Column 5 is in NFKD on line " + a_line_number.out + " in NormalizationTest.txt", is_nfkd_normalized_string (c5))
			assert_strings_equal ("NFKD (column 1) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfkd_normalized_string (c1))
			assert_strings_equal ("NFKD (column 2) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfkd_normalized_string (c2))
			assert_strings_equal ("NFKD (column 3) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfkd_normalized_string (c3))
			assert_strings_equal ("NFKD (column 4) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfkd_normalized_string (c4))
			assert_strings_equal ("NFKD (column 5) equals column 5 on line " + a_line_number.out + " in NormalizationTest.txt", c5, as_nfkd_normalized_string (c5))
			assert ("Column 2 is in NFC on line " + a_line_number.out + " in NormalizationTest.txt", is_nfc_normalized_string (c2))
			assert_strings_equal ("NFC (Column1) equals Column 2 on line " + a_line_number.out + " in NormalizationTest.txt", c2, to_nfc_normalized_string (c1))
			assert_strings_equal ("NFC (Column2) equals Column 2 on line " + a_line_number.out + " in NormalizationTest.txt", c2, to_nfc_normalized_string (c2))
			assert_strings_equal ("NFC (Column3) equals Column 2 on line " + a_line_number.out + " in NormalizationTest.txt", c2, to_nfc_normalized_string (c3))
			assert ("Column 4 is in NFC on line " + a_line_number.out + " in NormalizationTest.txt", is_nfc_normalized_string (c4))
			assert_strings_equal ("NFC (Column4) equals Column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfc_normalized_string (c4))
			assert_strings_equal ("NFC (Column5) equals Column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfc_normalized_string (c5))
			assert ("Column 4 is in NFKC on line " + a_line_number.out + " in NormalizationTest.txt", is_nfkc_normalized_string (c4))
			assert_strings_equal ("NFKC (column 1) equals column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfkc_normalized_string (c1))
			assert_strings_equal ("NFKC (column 2) equals column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfkc_normalized_string (c2))
			assert_strings_equal ("NFKC (column 3) equals column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfkc_normalized_string (c3))
			assert_strings_equal ("NFKC (column 4) equals column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfkc_normalized_string (c4))
			assert_strings_equal ("NFKC (column 5) equals column 4 on line " + a_line_number.out + " in NormalizationTest.txt", c4, to_nfkc_normalized_string (c5))

		end

	check_all_normal_forms_identity (a_code_point: INTEGER) is
			-- Check that NFX (`a_code_point') = `a_code_point' for all normal forms.
		do
			assert (a_code_point.out + " is in NFD", is_nfd_normalized_string (unicode.code_to_string (a_code_point)))
			assert (a_code_point.out + " is in NFKD", is_nfkd_normalized_string (unicode.code_to_string (a_code_point)))
			assert (a_code_point.out + " is in NFC", is_nfc_normalized_string (unicode.code_to_string (a_code_point)))
			assert (a_code_point.out + " is in NFKC", is_nfkc_normalized_string (unicode.code_to_string (a_code_point)))
		end

	decoded_string (a_column: STRING): STRING is
			-- String decoded from code points in `a_column'
		require
			column_not_empty: a_column /= Void and then not a_column.is_empty
		local
			a_splitter: ST_SPLITTER
			some_codes: DS_LIST [STRING]
			a_cursor: DS_LIST_CURSOR [STRING]
			a_code_point: INTEGER
		do
			create a_splitter.make
			some_codes := a_splitter.split (a_column)
			create Result.make (some_codes.count)
			from a_cursor := some_codes.new_cursor; a_cursor.start until a_cursor.after loop
				assert ("Hexadecimal number", STRING_.is_hexadecimal (a_cursor.item))
				a_code_point := STRING_.hexadecimal_to_integer (a_cursor.item)
				assert ("Good code point", unicode.valid_code (a_code_point))
				Result := STRING_.appended_string (Result, unicode.code_to_string (a_code_point))
				a_cursor.forth
			end
		ensure
			decoded_string_not_empty: Result /= Void and then not Result.is_empty
		end

end
