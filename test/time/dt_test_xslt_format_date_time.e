indexing

	description:

		"Test features of class DT_XSLT_FORMAT_DATE_TIME"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2008, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_XSLT_FORMAT_DATE_TIME

inherit

	TS_TEST_CASE

	DT_XSLT_FORMAT_DATE_TIME

create

	make_default

feature -- Test

	test_format_date_one is
			-- Test formatting '2002-12-31' as '[Y0001]-[M01]-[D01]'.
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[Y0001]-[M01]-[D01]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "2002-12-31", l_result.item.value)
		end

	test_format_date_two is
			-- Test formatting '2002-12-31' as '[M]-[D]-[Y]'.
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[M]-[D]-[Y]", "en", "AD", "GB")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "12-31-2002", l_result.item.value)
		end

	test_format_date_three is
			-- Test formatting '2002-12-31' as '[D]-[M]-[Y]'.
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[D]-[M]-[Y]", "en", "AD", "GB")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "31-12-2002", l_result.item.value)
		end

		test_format_date_four is
			-- Test formatting '2002-12-31' as '[D1] [MI] [Y]'.
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[D1]-[MI]-[Y]", "en", "AD", "GB")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "31-XII-2002", l_result.item.value)
		end

		test_format_date_five is
			-- Test formatting '2002-12-31' as '[D1o] [MNn], [Y]'.
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[D1o]-[MNn]-[Y]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "31st-December-2002", l_result.item.value)
		end

	test_format_date_six is
			-- Test formatting '2002-12-31' as '[[[Y0001]-[M01]-[D01]]]'.
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[[[Y0001]-[M01]-[D01]]]", "en", "AD", "GB")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "[2002-12-31]", l_result.item.value)
		end

	test_format_date_seven is
			-- Test formatting '2002-12-31' as '[YWw]'
		local
			l_date: DT_DATE
			l_value: DT_XPATH_DATE_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_date.make (2002, 12, 31)
			create l_value.make_from_date (l_date)
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[YWw]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "Two Thousand and Two", l_result.item.value)
		end

	test_format_time_one is
			-- Test formatting '15:58:45.762' as '[h]:[m01] [PN, *-2]'.
		local
			l_value: DT_XPATH_TIME_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_value.make ("15:58:45.762")
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[h]:[m01] [PN, *-2]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "3:58 PM", l_result.item.value)
		end

	test_format_time_two is
			-- Test formatting '15:58:45.762' as '[h]:[m01]:[s01] [Pn, 1-2]'.
		local
			l_value: DT_XPATH_TIME_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_value.make ("15:58:45.762")
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[h]:[m01]:[s01] [Pn, 1-2]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "3:58:45 pm", l_result.item.value)
		end

	test_format_time_three is
			-- Test formatting '15:58:45.762' as '[H01]:[m01]:[s01].[f001]'.
		local
			l_value: DT_XPATH_TIME_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_value.make ("15:58:45.762")
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[H01]:[m01]:[s01].[f001]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "15:58:45.762", l_result.item.value)
		end

	test_format_time_four is
			-- Test formatting '15:58:45.762+02:00' as '[H01]:[m01]:[s01] [z]'.
		local
			l_value: DT_XPATH_TIME_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_value.make ("15:58:45.762+02:00")
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[H01]:[m01]:[s01] [z]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "15:58:45 GMT+02:00", l_result.item.value)
		end

	test_format_date_time_one is
			-- Test formatting '2002-12-31T15:58:45.762+02:00' as '[h].[m01][Pn] on [FNn], [D1o] [MNn]'.
		local
			l_value: DT_XPATH_DATE_TIME_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_value.make ("2002-12-31T15:58:45.762+02:00")
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[h].[m01][Pn] on [FNn], [D1o] [MNn]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "3.58p.m. on Tuesday, 31st December", l_result.item.value)
		end

	test_format_date_time_two is
			-- Test formatting '2002-12-31T15:58:45.762+02:00' as '[M01]/[D01]/[Y0001] at [H01]:[m01]:[s01]').
		local
			l_value: DT_XPATH_DATE_TIME_VALUE
			l_result: DS_CELL [DT_FORMAT_DATE_TIME_RESULT]
		do
			create l_value.make ("2002-12-31T15:58:45.762+02:00")
			create l_result.make (Void)
			format_date_time (l_result, l_value, "[M01]/[D01]/[Y0001] at [H01]:[m01]:[s01]", "en", "CE", "US")
			assert  ("Result not void", l_result.item /= Void)
			assert ("No error", not l_result.item.is_error)
			assert_strings_equal ("Correct result", "12/31/2002 at 15:58:45", l_result.item.value)
		end

end

