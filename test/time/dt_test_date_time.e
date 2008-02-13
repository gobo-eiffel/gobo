indexing

	description:

		"Test features of class DT_DATE_TIME"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_DATE_TIME

inherit

	TS_TEST_CASE
	DT_GREGORIAN_CALENDAR

create

	make_default

feature -- Test

	test_date_duration is
			-- Test feature `date_duration'.
		local
			dt1, dt2: DT_DATE_TIME
			dd1: DT_DATE_DURATION
		do
			create dt1.make (2007, 9, 18, 16, 0, 0)
			create dt2.make (2007, 9, 18, 17, 0, 0)
			create dd1.make (0, 0, 0)
			assert_equal ("date_duration1", dd1, dt1.date_duration (dt1))
			assert_equal ("date_duration2", dd1, dt1.date_duration (dt2))
		end

	test_time_duration is
			-- Test feature `time_duration'.
		local
			dt1, dt2: DT_DATE_TIME
			td1: DT_TIME_DURATION
		do
			create dt1.make (2007, 9, 20, 16, 0, 0)
			create dt2.make (2007, 9, 18, 16, 0, 0)
			create td1.make (0, 0, 0)
			assert_equal ("time_duration1", td1, dt1.time_duration (dt1))
			assert_equal ("time_duration2", td1, dt1.time_duration (dt2))
		end

	text_xslt_formatting is
			-- Test feature `xslt_formatted' of class DT_DATE_TIME.
		local
			l_date_time: DT_DATE_TIME
			l_result: DT_FORMAT_DATE_TIME_RESULT
		do
			-- Saturday 1 January 2005, 21:45:15.
			create l_date_time.make (2005, 1, 1, 21, 45, 15)
			l_result := l_date_time.xslt_formatted (Void, "[h]:[m] [P] on [FNn] [Do] of [MNn], [Y]", Void, Void, Void)
			assert ("Result not void", l_result /= Void)
			assert ("No error", not l_result.is_error)
			assert ("Non-void value", l_result.value /= Void)
			assert_strings_equal ("Correct result", "9:45 P.M. on Saturday 1st of January, 2005", l_result.value)
		end

end
