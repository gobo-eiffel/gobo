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
			-- Array with just INTEGER and DOUBLE together crashes VE
			assert (bad_format_3, not is_correct_format_and_parameters (bad_format_3, <<integer_one, double_one_and_a_half>>))
			assert (bad_format_3, not is_correct_format_and_parameters (bad_format_3, <<double_one_and_a_half, integer_one>>))
			assert (bad_format_4, not is_correct_format_and_parameters (bad_format_4, <<1>>))
		end

	test_bad_precision is
			-- Test precision not present or not an integer.
		do
			-- Array with just INTEGER and DOUBLE together crashes VE
			assert (bad_format_5, not is_correct_format_and_parameters (bad_format_5, <<integer_one, double_one_and_a_half>>))
			assert (bad_format_6, not is_correct_format_and_parameters (bad_format_6, <<1>>))
			assert (bad_format_7, not is_correct_format_and_parameters (bad_format_7, <<1>>))
		end

	test_bad_flags is
			-- Test invalid combination of flags
		do
			assert (bad_format_8, not is_correct_format_and_parameters (bad_format_8, <<1>>))
			assert (bad_format_9, not is_correct_format_and_parameters (bad_format_9, <<1>>))
			assert (bad_format_10, not is_correct_format_and_parameters (bad_format_10, <<1>>))
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

feature {NONE} -- Numbers as reference

	integer_one: INTEGER_REF is
		once
			create Result
			Result.set_item (1)
		end

	double_one_and_a_half: DOUBLE_REF is
		once
			create Result
			Result.set_item (1.5)
		end

end
