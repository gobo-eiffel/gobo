indexing

	description: "Test if invalid formats are properly recognized as such."

	library: "Gobo Eiffel Formatter Library"
	copyright: "Copyright (c) 2004, Berend de Boer and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"


deferred class

	ST_TEST_SCIENTIFIC_FORMAT_INVALID_FORMATS


inherit

	TS_TEST_CASE

	ST_FORMAT_ROUTINES


feature -- Tests

	test_bad_type_char is
			-- Test wrong type character.
		do
			assert (bad_format_1, not is_correct_format_and_parameters (bad_format_1, Void))
		end

	test_number_of_parameters is
			-- Test if exactly required number of parameters is detected.
		do
			assert (bad_format_2, not is_correct_format_and_parameters (bad_format_2, Void))
			assert (bad_format_2, not is_correct_format_and_parameters (bad_format_2, <<"1", "2">>))
		end

	test_bad_width is
			-- Test width not present or not an integer.
		do
			assert (bad_format_3, not is_correct_format_and_parameters (bad_format_3, <<integer_cell (1), double_cell (1.5)>>))
			assert (bad_format_3, not is_correct_format_and_parameters (bad_format_3, <<double_cell (1.5), integer_cell (1)>>))
			assert (bad_format_4, not is_correct_format_and_parameters (bad_format_4, <<integer_cell (1)>>))
		end

	test_bad_precision is
			-- Test precision not present or not an integer.
		do
			assert (bad_format_5, not is_correct_format_and_parameters (bad_format_5, <<integer_cell (1), double_cell (1.5)>>))
			assert (bad_format_6, not is_correct_format_and_parameters (bad_format_6, <<integer_cell (1)>>))
			assert (bad_format_7, not is_correct_format_and_parameters (bad_format_7, <<integer_cell (1)>>))
		end

	test_bad_flags is
			-- Test invalid combination of flags
		do
			assert (bad_format_8, not is_correct_format_and_parameters (bad_format_8, <<integer_cell (1)>>))
			assert (bad_format_9, not is_correct_format_and_parameters (bad_format_9, <<integer_cell (1)>>))
			assert (bad_format_10, not is_correct_format_and_parameters (bad_format_10, <<integer_cell (1)>>))
		end

feature {NONE} -- Format strings

	bad_format_1: STRING is "?Q"

	bad_format_2: STRING is "?s"

	bad_format_3: STRING is "?*i"

	bad_format_4: STRING is "?**i"

	bad_format_5: STRING is "?*i"

	bad_format_6: STRING is "?.i"

	bad_format_7: STRING is "?.!i"

	bad_format_8: STRING is "?0-i"

	bad_format_9: STRING is "?^-i"

	bad_format_10: STRING is "?^^i"

end
