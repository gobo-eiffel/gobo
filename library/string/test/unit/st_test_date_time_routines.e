note

	description:

		"Test features of class ST_DATE_TIME_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"

class ST_TEST_DATE_TIME_ROUTINES

inherit

	TS_TEST_CASE

	ST_DATE_TIME_ROUTINES

create

		make_default

feature -- Test

	text_xslt_formatted_time
			-- Test feature `xslt_formatted_time'.
		local
			l_time: DT_TIME
			l_result: ST_FORMAT_DATE_TIME_RESULT
		do

			create l_time.make (4, 23, 56)
			l_result := xslt_formatted_time (l_time, Void, "[h]:[m] [P,2-2]", Void, Void, Void)
			assert ("Result not void", l_result /= Void)
			assert ("No error", not l_result.is_error)
			assert ("Non-void value", l_result.value /= Void)
			assert_strings_equal ("Correct result", "4:23 AM", l_result.value)
		end

	text_xslt_formatted_date
			-- Test feature `xslt_formatted_date'.
		local
			l_date: DT_DATE
			l_result: ST_FORMAT_DATE_TIME_RESULT
		do
			-- Saturday 1 January 2005.
			create l_date.make (2005, 1, 1)
			l_result := xslt_formatted_date (l_date, Void, "[FNn] [Do] of [MNn], [Y]", Void, Void, Void)
			assert ("Result not void", l_result /= Void)
			assert ("No error", not l_result.is_error)
			assert ("Non-void value", l_result.value /= Void)
			assert_strings_equal ("Correct result", "Saturday 1st of January, 2005", l_result.value)
		end

	text_xslt_formatted_date_time
			-- Test feature `xslt_formatted_date_time'.
		local
			l_date_time: DT_DATE_TIME
			l_result: ST_FORMAT_DATE_TIME_RESULT
		do
			-- Saturday 1 January 2005, 21:45:15.
			create l_date_time.make (2005, 1, 1, 21, 45, 15)
			l_result := xslt_formatted_date_time (l_date_time, Void, "[h]:[m] [P] on [FNn] [Do] of [MNn], [Y]", Void, Void, Void)
			assert ("Result not void", l_result /= Void)
			assert ("No error", not l_result.is_error)
			assert ("Non-void value", l_result.value /= Void)
			assert_strings_equal ("Correct result", "9:45 P.M. on Saturday 1st of January, 2005", l_result.value)
		end

end
