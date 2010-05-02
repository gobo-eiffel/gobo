note

	description:

		"Test XPath calendar functions."

	test_status: "ok_to_run"
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_CALENDAR_FUNCTIONS

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_XPATH_TYPE

	XM_XPATH_ERROR_TYPES

	XM_XPATH_SHARED_CONFORMANCE

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

create

	make_default

feature -- Test

	test_parsing_durations
			-- Test parsing xs:duration literals.
		local
			a_parser: XM_XPATH_DURATION_PARSER
			a_duration: DT_DATE_TIME_DURATION
		do
			create a_parser.make
			assert ("P1Y2M3DT10H30M", a_parser.is_duration ("P1Y2M3DT10H30M"))
			a_duration := a_parser.string_to_duration ("P1Y2M3DT10H30M")
			assert ("Correct duration", a_duration /= Void
					  and then a_duration.year = 1
					  and then a_duration.month = 2
					  and then a_duration.day = 3
					  and then a_duration.hour = 10
					  and then a_duration.minute = 30
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("-P120D", a_parser.is_duration ("-P120D"))
			a_duration := a_parser.string_to_duration ("-P120D")
			assert ("Correct duration 2", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 0
					  and then a_duration.day = -120
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P1347Y", a_parser.is_duration ("P1347Y"))
			a_duration := a_parser.string_to_duration ("P1347Y")
			assert ("Correct duration 3", a_duration /= Void
					  and then a_duration.year = 1347
					  and then a_duration.month = 0
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P1347M ", a_parser.is_duration ("P1347M "))
			a_duration := a_parser.string_to_duration ("P1347M ")
			assert ("Correct duration 4", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 1347
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P1Y2MT2H", a_parser.is_duration ("P1Y2MT2H"))
			a_duration := a_parser.string_to_duration ("P1Y2MT2H")
			assert ("Correct duration 5", a_duration /= Void
					  and then a_duration.year = 1
					  and then a_duration.month = 2
					  and then a_duration.day = 0
					  and then a_duration.hour = 2
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P0Y1347M", a_parser.is_duration ("P0Y1347M"))
			a_duration := a_parser.string_to_duration ("P0Y1347M")
			assert ("Correct duration 6", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 1347
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P0Y1347M0D", a_parser.is_duration ("P0Y1347M0D"))
			a_duration := a_parser.string_to_duration ("P0Y1347M0D")
			assert ("Correct duration 7", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 1347
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("-P1347M", a_parser.is_duration ("-P1347M"))
			a_duration := a_parser.string_to_duration ("-P1347M")
			assert ("Correct duration 8", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = -1347
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P-1347M", not a_parser.is_duration ("P-1347M"))
			assert ("P1Y2MT", not a_parser.is_duration ("P1Y2MT"))
			assert ("P1Y2M", a_parser.is_months_duration ("P1Y2M"))
			a_duration := a_parser.string_to_months_duration ("P1Y2M")
			assert ("Correct yearMonthDuration", a_duration /= Void
					  and then a_duration.year = 1
					  and then a_duration.month = 2
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P12M", a_parser.is_months_duration ("P12M"))
			a_duration := a_parser.string_to_months_duration ("P12M")
			assert ("Correct yearMonthDuration 2", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 12
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("-P1Y2M", a_parser.is_months_duration ("-P1Y2M"))
			a_duration := a_parser.string_to_months_duration ("-P1Y2M")
			assert ("Correct yearMonthDuration", a_duration /= Void
					  and then a_duration.year = -1
					  and then a_duration.month = -2
					  and then a_duration.day = 0
					  and then a_duration.hour = 0
					  and then a_duration.minute = 0
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P12M3D", not a_parser.is_months_duration ("P12M3D"))
			assert ("P3DT10H30M", a_parser.is_seconds_duration ("P3DT10H30M"))
			a_duration := a_parser.string_to_seconds_duration ("P3DT10H30M")
			assert ("Correct dayTimeDuration", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 0
					  and then a_duration.day = 3
					  and then a_duration.hour = 10
					  and then a_duration.minute = 30
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("-P3DT10H30M", a_parser.is_seconds_duration ("-P3DT10H30M"))
			a_duration := a_parser.string_to_seconds_duration ("-P3DT10H30M")
			assert ("Correct dayTimeDuration 2", a_duration /= Void
					  and then a_duration.year = 0
					  and then a_duration.month = 0
					  and then a_duration.day = -3
					  and then a_duration.hour = -10
					  and then a_duration.minute = -30
					  and then a_duration.second = 0
					  and then a_duration.millisecond = 0)
			assert ("P12M3D", not a_parser.is_seconds_duration ("P12M3D"))
		end

	test_years_from_duration
			-- Test fn:years-from-duration.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("years-from-duration(xs:yearMonthDuration('P20Y15M'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Year count is 21", an_integer_value.as_integer = 21)
			an_evaluator.evaluate ("years-from-duration(xs:yearMonthDuration('-P15M'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Year count is -1", an_integer_value.as_integer = -1)
		end

	test_months_from_duration
			-- Test fn:months-from-duration.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("months-from-duration(xs:yearMonthDuration('P20Y15M'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Month count is 3", an_integer_value.as_integer = 3)
			an_evaluator.evaluate ("months-from-duration(xs:yearMonthDuration('-P20Y18M'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Month count is -6", an_integer_value.as_integer = -6)
		end

	test_days_from_duration
			-- Test fn:days-from-duration.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("days-from-duration(xs:dayTimeDuration('P3DT55H'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Day count is 5", an_integer_value.as_integer = 5)
			an_evaluator.evaluate ("days-from-duration(xs:dayTimeDuration('P3DT10H'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Day count is 3", an_integer_value.as_integer = 3)
		end

	test_hours_from_duration
			-- Test fn:hours-from-duration.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("hours-from-duration(xs:dayTimeDuration('P3DT10H'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Hour count is 10", an_integer_value.as_integer = 10)
			an_evaluator.evaluate ("hours-from-duration(xs:dayTimeDuration('P3DT12H32M12S'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Hour count is 12", an_integer_value.as_integer = 12)
			an_evaluator.evaluate ("hours-from-duration(xs:dayTimeDuration('PT123H'))")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 3", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Hour count is 3", an_integer_value.as_integer = 3)
			an_evaluator.evaluate ("hours-from-duration(xs:dayTimeDuration('-P3DT10H'))")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 4", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Hour count is -10", an_integer_value.as_integer = -10)
		end

	test_minutes_from_duration
			-- Test fn:minutes-from-duration.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("minutes-from-duration(xs:dayTimeDuration('P3DT10H'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Minute count is 0", an_integer_value.as_integer = 0)
			an_evaluator.evaluate ("minutes-from-duration(xs:dayTimeDuration('-P5DT12H30M'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Minute count is -30", an_integer_value.as_integer = -30)
		end

	test_seconds_from_duration
			-- Test fn:seconds-from-duration.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("seconds-from-duration(xs:dayTimeDuration('P3DT10H12.5S'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_decimal_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is decimal", a_decimal_value /= Void)
			assert ("Seconds count is 12.5", a_decimal_value.value.is_equal (twelve_point_five))
		end

	test_year_from_date_time
			-- Test fn:year-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("year-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Year is 1999", an_integer_value.as_integer = 1999)
		end

	test_month_from_date_time
			-- Test fn:month-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("month-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Month is May", an_integer_value.as_integer = 5)
		end

	test_day_from_date_time
			-- Test fn:day-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("day-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Day is 31st", an_integer_value.as_integer = 31)
		end

	test_hours_from_date_time
			-- Test fn:hours-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("hours-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Nine p.m.", an_integer_value.as_integer = 21)
		end

	test_minutes_from_date_time
			-- Test fn:minutes-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("minutes-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Thirty minutes", an_integer_value.as_integer = 30)
		end

	test_seconds_from_date_time
			-- Test fn:seconds-from-dateTime(xs:dateTime('1999-05-31T21:30:21.5647-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("seconds-from-dateTime(xs:dateTime('1999-05-31T21:30:21.5647-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_decimal_value ?= an_evaluator.evaluated_items.item (1)
			assert ("21.565", a_decimal_value.value.is_equal (expected_seconds))
		end

	test_time_zone_from_date_time
			-- Test fn:timezone-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_duration_value: XM_XPATH_SECONDS_DURATION_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("timezone-from-dateTime(xs:dateTime('1999-05-31T21:30:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_duration_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is duration", a_duration_value /= Void)
			assert ("Minus five hours", STRING_.same_string (a_duration_value.string_value, "-PT5H"))
		end

	test_year_from_date
			-- Test fn:year-from-date.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("year-from-date(xs:date('1999-05-31'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Year is 1999", an_integer_value.as_integer = 1999)
			an_evaluator.evaluate ("year-from-date(xs:date('2000-01-01+05:00'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Year is 2000", an_integer_value.as_integer = 2000)
		end

	test_month_from_date
			-- Test fn:month-from-date.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("month-from-date(xs:date('1999-05-31-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Month is 5", an_integer_value.as_integer = 5)
			an_evaluator.evaluate ("month-from-date(xs:date('2000-01-01+05:00'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Month is 1", an_integer_value.as_integer = 1)
		end

	test_day_from_date
			-- Test fn:day-from-date.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("day-from-date(xs:date('1999-05-31-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Day is 31", an_integer_value.as_integer = 31)
			an_evaluator.evaluate ("day-from-date(xs:date('2000-01-01+05:00'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Day is 1", an_integer_value.as_integer = 1)
		end

	test_time_zone_from_date
			-- Test fn:timezone-from-date(xs:date('1999-05-31T21:30:00-05:00')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_duration_value: XM_XPATH_SECONDS_DURATION_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("timezone-from-date(xs:date('1999-05-31-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_duration_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is duration", a_duration_value /= Void)
			assert ("Minus five hours", STRING_.same_string (a_duration_value.string_value, "-PT5H"))
			an_evaluator.evaluate ("timezone-from-date(xs:date('2000-06-12Z'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_duration_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is duration 2", a_duration_value /= Void)
			assert ("UTC", STRING_.same_string (a_duration_value.string_value, "PT0S"))
		end

	test_hours_from_time
			-- Test fn:hours-from-time.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("hours-from-time(xs:time('11:23:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Eleven a.m.", an_integer_value.as_integer = 11)
			an_evaluator.evaluate ("hours-from-time(xs:time('21:23:00'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 2", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Nine p.m.", an_integer_value.as_integer = 21)
			an_evaluator.evaluate ("hours-from-time(xs:time('01:23:00+05:00'))")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 3", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("One a.m.", an_integer_value.as_integer = 1)
			an_evaluator.evaluate ("hours-from-time(adjust-time-to-timezone(xs:time('01:23:00+05:00'), xs:dayTimeDuration('PT0H')))")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer 4", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Eight p.m.", an_integer_value.as_integer = 20)
		end

	test_minutes_from_time
			-- Test fn:minutes-from-time.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("minutes-from-time(xs:time('13:00:00Z'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			an_integer_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is platform integer", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Zero minutes", an_integer_value.as_integer = 0)
		end

	test_seconds_from_time
			-- Test fn:seconds-from-time.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("seconds-from-time(xs:time('13:20:10.5'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_decimal_value ?= an_evaluator.evaluated_items.item (1)
			assert ("10.5", a_decimal_value.value.is_equal (expected_seconds_two))
		end

	test_time_zone_from_time
			-- Test fn:timezone-from-time.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_duration_value: XM_XPATH_SECONDS_DURATION_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("timezone-from-time(xs:time('13:20:00-05:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_duration_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is duration", a_duration_value /= Void)
			assert ("Minus five hours", STRING_.same_string (a_duration_value.string_value, "-PT5H"))
			an_evaluator.evaluate ("timezone-from-time(xs:time('13:20:00'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			assert ("Empty sequence", an_evaluator.evaluated_items.count = 0)
		end

	test_adjust_date_time_to_timezone
			-- Test fn:adjust-dateTime-to-timezone.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_dt: XM_XPATH_DATE_TIME_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned dateTime", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 10", a_dt.zoned_date_time.date_time.time.hour = 10)
			assert ("Zone hour is -5", a_dt.zoned_date_time.time_zone.fixed_offset.hour = -5)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00'), xs:dayTimeDuration('PT14H1M'))")
			assert ("Error FODT0003", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FODT0003"))
			an_evaluator.reset_errors
			an_evaluator.evaluate ("adjust-dateTime-to-timezone((), xs:dayTimeDuration('PT14H'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			assert ("Empty sequence", an_evaluator.evaluated_items.count = 0)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00-07:00'))")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned dateTime 2", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 12", a_dt.zoned_date_time.date_time.time.hour = 12)
			assert ("Zone hour is -5 (2)", a_dt.zoned_date_time.time_zone.fixed_offset.hour = -5)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00'), xs:dayTimeDuration('-PT10H'))")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned dateTime 3", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 10 (2)", a_dt.zoned_date_time.date_time.time.hour = 10)
			assert ("Zone hour is -10", a_dt.zoned_date_time.time_zone.fixed_offset.hour = -10)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00-07:00'), xs:dayTimeDuration('-PT10H'))")
			assert ("No evaluation error 5", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned dateTime 4", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 7", a_dt.zoned_date_time.date_time.time.hour = 7)
			assert ("Zone hour is -10 (2)", a_dt.zoned_date_time.time_zone.fixed_offset.hour = -10)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00-07:00'), xs:dayTimeDuration('PT10H'))")
			assert ("No evaluation error 6", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned dateTime 5", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 3", a_dt.zoned_date_time.date_time.time.hour = 3)
			assert ("Zone hour is 10", a_dt.zoned_date_time.time_zone.fixed_offset.hour = 10)
			assert ("Day 8", a_dt.zoned_date_time.date_time.date.day = 8)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T00:00:00+01:00'), xs:dayTimeDuration('-PT8H'))")
			assert ("No evaluation error 7", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned dateTime 6", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 15", a_dt.zoned_date_time.date_time.time.hour = 15)
			assert ("Zone hour is -8", a_dt.zoned_date_time.time_zone.fixed_offset.hour = -8)
			assert ("Day 6", a_dt.zoned_date_time.date_time.date.day = 6)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00'), ())")
			assert ("No evaluation error 8", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is not zoned", a_dt /= Void and then not a_dt.zoned)
			assert ("Local hour is 10 (3)", a_dt.local_date_time.time.hour = 10)
			an_evaluator.evaluate ("adjust-dateTime-to-timezone(xs:dateTime('2002-03-07T10:00:00-07:00'), ())")
			assert ("No evaluation error 9", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is not zoned 2", a_dt /= Void and then not a_dt.zoned)
			assert ("Local hour is 10 (4)", a_dt.local_date_time.time.hour = 10)
		end


	test_adjust_date_to_timezone
			-- Test fn:adjust-date-to-timezone.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_dt: XM_XPATH_DATE_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned date", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -5", a_dt.zoned_date.time_zone.fixed_offset.hour = -5)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07'), xs:dayTimeDuration('PT14H1M'))")
			assert ("Error FODT0003", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FODT0003"))
			an_evaluator.reset_errors
			an_evaluator.evaluate ("adjust-date-to-timezone((), xs:dayTimeDuration('PT14H'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			assert ("Empty sequence", an_evaluator.evaluated_items.count = 0)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07-07:00'))")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned date 2", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -5 (2)", a_dt.zoned_date.time_zone.fixed_offset.hour = -5)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07'), xs:dayTimeDuration('-PT10H'))")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned date 3", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -10", a_dt.zoned_date.time_zone.fixed_offset.hour = -10)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07-07:00'), xs:dayTimeDuration('-PT10H'))")
			assert ("No evaluation error 5", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned date 4", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -10 (2)", a_dt.zoned_date.time_zone.fixed_offset.hour = -10)
			assert ("Day 6", a_dt.zoned_date.date.day = 6)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07'), ())")
			assert ("No evaluation error 6", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is unzoned date", a_dt /= Void and then not a_dt.zoned)
			an_evaluator.evaluate ("adjust-date-to-timezone(xs:date('2002-03-07-07:00'), ())")
			assert ("No evaluation error 7", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is unzoned date (2)", a_dt /= Void and then not a_dt.zoned)
		end

	test_adjust_time_to_timezone
			-- Test fn:adjust-time-to-timezone.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_dt: XM_XPATH_TIME_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned time", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -5", a_dt.zoned_time.time_zone.fixed_offset.hour = -5)
			assert ("Local hour is 10", a_dt.zoned_time.time.hour = 10)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00'), xs:dayTimeDuration('PT14H1M'))")
			assert ("Error FODT0003", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FODT0003"))
			an_evaluator.reset_errors
			an_evaluator.evaluate ("adjust-time-to-timezone((), xs:dayTimeDuration('PT14H'))")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			assert ("Empty sequence", an_evaluator.evaluated_items.count = 0)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00-07:00'))")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned time (2)", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -5 (2)", a_dt.zoned_time.time_zone.fixed_offset.hour = -5)
			assert ("Local hour is 12", a_dt.zoned_time.time.hour = 12)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00'), xs:dayTimeDuration('-PT10H'))")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned time (3)", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -10)", a_dt.zoned_time.time_zone.fixed_offset.hour = -10)
			assert ("Local hour is 10 (2)", a_dt.zoned_time.time.hour = 10)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00-07:00'), xs:dayTimeDuration('-PT10H'))")
			assert ("No evaluation error 5", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned time (4)", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is -10 (2))", a_dt.zoned_time.time_zone.fixed_offset.hour = -10)
			assert ("Local hour is 7", a_dt.zoned_time.time.hour = 7)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00'), ())")
			assert ("No evaluation error 6", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is unzoned time", a_dt /= Void and then not a_dt.zoned)
			assert ("Local hour is 10 (3)", a_dt.local_time.hour = 10)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00-07:00'), ())")
			assert ("No evaluation error 7", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is unzoned time (2)", a_dt /= Void and then not a_dt.zoned)
			assert ("Local hour is 10 (4)", a_dt.local_time.hour = 10)
			an_evaluator.evaluate ("adjust-time-to-timezone(xs:time('10:00:00-07:00'), xs:dayTimeDuration('PT10H'))")
			assert ("No evaluation error 8", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is zoned time (5)", a_dt /= Void and then a_dt.zoned)
			assert ("Zone hour is 10)", a_dt.zoned_time.time_zone.fixed_offset.hour = 10)
			assert ("Local hour is 3", a_dt.zoned_time.time.hour = 3)
		end

	test_date_time_equalities
			-- Test equalities on dateTime values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:dateTime('2002-04-02T12:00:00-01:00') eq xs:dateTime('2002-04-02T17:00:00+04:00')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true()", a_boolean_value /= Void and then a_boolean_value.value)
			an_evaluator.evaluate ("xs:dateTime('2002-04-02T12:00:00') eq xs:dateTime('2002-04-02T23:00:00+06:00')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true() 2", a_boolean_value /= Void and then a_boolean_value.value)
			an_evaluator.evaluate ("xs:dateTime('2002-04-02T12:00:00') eq xs:dateTime('2002-04-02T17:00:00')")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
			an_evaluator.evaluate ("xs:dateTime('2002-04-02T12:00:00') eq xs:dateTime('2002-04-02T12:00:00')")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true() 3", a_boolean_value /= Void and then a_boolean_value.value)
			an_evaluator.evaluate ("xs:dateTime('2002-04-02T23:00:00-04:00') eq xs:dateTime('2002-04-03T02:00:00-01:00')")
			assert ("No evaluation error 5", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true() 4", a_boolean_value /= Void and then a_boolean_value.value)
		end

	test_date_equalities
			-- Test equalities on date values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:date('2004-12-25Z') eq xs:date('2004-12-25+07:00')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
			an_evaluator.evaluate ("xs:date('2004-12-25-12:00') eq xs:date('2004-12-26+12:00')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true()", a_boolean_value /= Void and then a_boolean_value.value)
		end

	test_date_less_than
			-- Test lt on date values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:date('2004-12-25-12:00') lt xs:date('2004-12-26+12:00')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
			an_evaluator.evaluate ("xs:date('2004-12-25Z') lt xs:date('2004-12-25-05:00')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true()", a_boolean_value /= Void and then a_boolean_value.value)
		end

	test_date_greater_than
			-- Test gt on date values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:date('2004-12-25-12:00') gt xs:date('2004-12-26+12:00')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
			an_evaluator.evaluate ("xs:date('2004-12-25Z') gt xs:date('2004-12-25+07:00')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true()", a_boolean_value /= Void and then a_boolean_value.value)
		end

	test_time_equalities
			-- Test equalities on time values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:time('21:30:00+10:30') eq xs:time('06:00:00-05:00')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true()", a_boolean_value /= Void and then a_boolean_value.value)
			an_evaluator.evaluate ("xs:time('08:00:00+09:00') eq xs:time('17:00:00-06:00')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
		end

	test_time_less_than
			-- Test lt on time values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:time('11:00:00') lt xs:time('17:00:00Z')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean true()", a_boolean_value /= Void and then a_boolean_value.value)
			an_evaluator.evaluate ("xs:time('12:00:00') lt xs:time('23:00:00+06:00')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
		end

	test_time_greater_than
			-- Test gt on time values.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_TIME_DURATION
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:time('08:00:00+09:00') gt xs:time('17:00:00-06:00')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_boolean_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is boolean false()", a_boolean_value /= Void and then not a_boolean_value.value)
		end

	test_duration_arithmetic
			-- Test artihmetic on durations.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_ymd: XM_XPATH_MONTHS_DURATION_VALUE
			a_dtd: XM_XPATH_SECONDS_DURATION_VALUE
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("xs:yearMonthDuration('P2Y11M') + xs:yearMonthDuration('P3Y3M')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_ymd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is yearMonthDuration", a_ymd /= Void)
			assert ("Six years, 2 months", a_ymd.months = 74)
			an_evaluator.evaluate ("xs:yearMonthDuration('P2Y11M') - xs:yearMonthDuration('P3Y3M')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_ymd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is yearMonthDuration 2", a_ymd /= Void)
			assert ("Negative 4 months", a_ymd.months = -4)
			an_evaluator.evaluate ("xs:yearMonthDuration('P2Y11M') * 2.30001")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			a_ymd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is yearMonthDuration 3", a_ymd /= Void)
			assert ("Six years, 9 months", a_ymd.months = 81)
			an_evaluator.evaluate ("xs:yearMonthDuration('P60000Y11M') * 1000000000")
			assert ("Overflow", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FODT0002"))
			an_evaluator.reset_errors
			an_evaluator.evaluate ("xs:yearMonthDuration('-P60000Y11M') * 1000000000")
			assert ("Overflow 2", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FODT0002"))
			an_evaluator.reset_errors
			an_evaluator.evaluate ("xs:yearMonthDuration('P2Y11M') div 1.5")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			a_ymd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is yearMonthDuration 3", a_ymd /= Void)
			assert ("One year, 11 months", a_ymd.months = 23)
			an_evaluator.evaluate ("xs:yearMonthDuration('P3Y4M') div xs:yearMonthDuration('-P1Y4M')")
			assert ("No evaluation error 5", not an_evaluator.is_error)
			a_decimal_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is decimal", a_decimal_value /= Void)
			assert ("Minus 2.5", a_decimal_value.value.is_equal (minus_two_point_five))
			an_evaluator.evaluate ("xs:dayTimeDuration('P2DT12H5M') + xs:dayTimeDuration('P5DT12H')")
			assert ("No evaluation error 6", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration", a_dtd /= Void)
			assert ("Eight days, five minutes", a_dtd.duration.day = 8 and then a_dtd.duration.minute = 5)
			an_evaluator.evaluate ("xs:dayTimeDuration('P2DT12H') - xs:dayTimeDuration('P1DT10H30M')")
			assert ("No evaluation error 7", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 2", a_dtd /= Void)
			assert ("One day, 1 hour and 30 minutes", a_dtd.duration.day = 1 and then a_dtd.duration.hour = 1 and then a_dtd.duration.minute = 30)
			an_evaluator.evaluate ("xs:dayTimeDuration('PT2H10M') * 2.1")
			assert ("No evaluation error 8", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 3", a_dtd /= Void)
			assert ("Four hours and 33 minutes", a_dtd.duration.hour = 4 and then a_dtd.duration.minute = 33)
			an_evaluator.evaluate ("xs:dayTimeDuration('P1DT2H30M10.5S') div 1.5")
			assert ("No evaluation error 9", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 4", a_dtd /= Void)
			assert ("Seventeen hours, 40 minutes and 7 seconds", a_dtd.duration.hour = 17 and then a_dtd.duration.minute = 40 and then a_dtd.duration.second = 7)
			an_evaluator.evaluate ("xs:dayTimeDuration('P2DT53M11S') div xs:dayTimeDuration('P1DT10H')")
			assert ("No evaluation error 10", not an_evaluator.is_error)
			a_decimal_value ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is decimal 2", a_decimal_value /= Void)
		end

	test_date_time_arithmetic
			-- Test artihmetic on dates and times.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_duration: DT_TIME_DURATION
			a_time_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_dtd: XM_XPATH_SECONDS_DURATION_VALUE
			a_dt: XM_XPATH_DATE_TIME_VALUE
			a_date: XM_XPATH_DATE_VALUE
			a_time: XM_XPATH_TIME_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:dateTime('2000-10-30T06:12:00') - xs:dateTime('1999-11-28T09:00:00Z')")
			assert ("No evaluation error", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration", a_dtd /= Void)
			assert ("337 day, 2 hours and 12 minutes", a_dtd.duration.day = 337 and a_dtd.duration.hour = 2 and a_dtd.duration.minute = 12)
			an_evaluator.evaluate ("xs:date('2000-10-30') - xs:date('1999-11-28')")
			assert ("No evaluation error 2", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 2", a_dtd /= Void)
			assert ("337 days", a_dtd.duration.day = 337)
			create a_duration.make (5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:date('2000-10-30') - xs:date('1999-11-28Z')")
			assert ("No evaluation error 3", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 3", a_dtd /= Void)
			assert ("336 days and 19 hours", a_dtd.duration.day = 336 and a_dtd.duration.hour = 19)
			an_evaluator.evaluate ("xs:date('2000-10-15-05:00') - xs:date('2000-10-10+02:00')")
			assert ("No evaluation error 4", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 4", a_dtd /= Void)
			assert ("5 days and 7 hours", a_dtd.duration.day = 5 and a_dtd.duration.hour = 7)
			create a_duration.make (-5, 0, 0)
			create a_time_zone.make (a_duration)
			an_evaluator.set_implicit_timezone (a_time_zone)
			an_evaluator.evaluate ("xs:time('11:12:00Z') - xs:time('04:00:00')")
			assert ("No evaluation error 5", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 5", a_dtd /= Void)
			assert ("2 hours and 12 minutes", a_dtd.duration.hour = 2 and a_dtd.duration.minute = 12)
			an_evaluator.evaluate ("xs:time('11:00:00-05:00') - xs:time('21:30:00+05:30')")
			assert ("No evaluation error 6", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 6", a_dtd /= Void)
			assert ("Same time", a_dtd.duration.hour = 0 and a_dtd.duration.minute = 0)
			an_evaluator.evaluate ("xs:time('17:00:00-06:00') - xs:time('08:00:00+09:00')")
			assert ("No evaluation error 7", not an_evaluator.is_error)
			a_dtd ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dayTimeDuration 7", a_dtd /= Void)
			assert ("One day", a_dtd.duration.hour = 0 and a_dtd.duration.day = 1)
			an_evaluator.evaluate ("xs:dateTime('2000-10-30T11:12:00') + xs:yearMonthDuration('P1Y2M')")
			assert ("No evaluation error 8", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dateTime", a_dt /= Void)
			assert ("2001-12-30T11:12:00", a_dt.date.year = 2001 and then a_dt.date.month = 12 and then a_dt.date.day = 30
				and then a_dt.time.hour = 11 and then a_dt.time.minute = 12 and then a_dt.time.second = 0)
			an_evaluator.evaluate ("xs:dateTime('2000-10-30T11:12:00') + xs:dayTimeDuration('P3DT1H15M')")
			assert ("No evaluation error 9", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dateTime 2", a_dt /= Void)
			assert ("2000-11-02T12:27:00", a_dt.date.year = 2000 and then a_dt.date.month = 11 and then a_dt.date.day = 2
				and then a_dt.time.hour = 12 and then a_dt.time.minute = 27 and then a_dt.time.second = 0)
			an_evaluator.evaluate ("xs:dateTime('2000-10-30T11:12:00') - xs:yearMonthDuration('P1Y2M')")
			assert ("No evaluation error 10", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dateTime 3", a_dt /= Void)
			assert ("1999-08-30T11:12:00", a_dt.date.year = 1999 and then a_dt.date.month = 8 and then a_dt.date.day = 30
				and then a_dt.time.hour = 11 and then a_dt.time.minute = 12 and then a_dt.time.second = 0)
			an_evaluator.evaluate ("xs:dateTime('2000-10-30T11:12:00') - xs:dayTimeDuration('P3DT1H15M')")
			assert ("No evaluation error 11", not an_evaluator.is_error)
			a_dt ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is dateTime 4", a_dt /= Void)
			assert ("2000-10-27T09:57:00", a_dt.date.year = 2000 and then a_dt.date.month = 10 and then a_dt.date.day = 27
				and then a_dt.time.hour = 9 and then a_dt.time.minute = 57 and then a_dt.time.second = 0)
			an_evaluator.evaluate ("xs:date('2000-10-30') + xs:yearMonthDuration('P1Y2M')")
			assert ("No evaluation error 12", not an_evaluator.is_error)
			a_date ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is date", a_date /= Void)
			assert ("December 30th, 2001", a_date.date.year = 2001 and then a_date.date.month = 12 and then a_date.date.day = 30)
			an_evaluator.evaluate ("xs:date('2004-10-30Z') + xs:dayTimeDuration('P2DT2H30M0S')")
			assert ("No evaluation error 13", not an_evaluator.is_error)
			a_date ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is date 2", a_date /= Void)
			assert ("November 1, 2004", a_date.date.year = 2004 and then a_date.date.month = 11 and then a_date.date.day = 1)
			an_evaluator.evaluate ("xs:date('2000-10-30') - xs:yearMonthDuration('P1Y2M')")
			assert ("No evaluation error 14", not an_evaluator.is_error)
			a_date ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is date 3", a_date /= Void)
			assert ("August 30, 1999", a_date.date.year = 1999 and then a_date.date.month = 8 and then a_date.date.day = 30)
			an_evaluator.evaluate ("xs:date('2000-02-29Z') - xs:yearMonthDuration('P1Y')")
			assert ("No evaluation error 15", not an_evaluator.is_error)
			a_date ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is date 4", a_date /= Void)
			assert ("February 28, 1999 in timezone Z.", a_date.date.year = 1999 and then a_date.date.month = 2 and then a_date.date.day = 28
				and then a_date.zoned and then a_date.zoned_date.time_zone.fixed_offset.hour = 0)
			an_evaluator.evaluate ("xs:date('2000-10-31-05:00') - xs:yearMonthDuration('P1Y1M')")
			assert ("No evaluation error 16", not an_evaluator.is_error)
			a_date ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is date 5", a_date /= Void)
			assert ("September 30, 1999 in timezone -05:00.", a_date.date.year = 1999 and then a_date.date.month = 9 and then a_date.date.day = 30
				and then a_date.zoned and then a_date.zoned_date.time_zone.fixed_offset.hour = -5)
			an_evaluator.evaluate ("xs:date('2000-10-30') - xs:dayTimeDuration('P3DT1H15M')")
			assert ("No evaluation error 17", not an_evaluator.is_error)
			a_date ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is date 6", a_date /= Void)
			assert ("October 26, 2000", a_date.date.year = 2000 and then a_date.date.month = 10 and then a_date.date.day = 26)
			an_evaluator.evaluate ("xs:time('11:12:00') + xs:dayTimeDuration('P3DT1H15M')")
			assert ("No evaluation error 18", not an_evaluator.is_error)
			a_time ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is time", a_time /= Void)
			assert ("12:27:00", a_time.time.hour = 12 and then a_time.time.minute = 27 and then a_time.time.second = 0)
			an_evaluator.evaluate ("xs:time('23:12:00+03:00') + xs:dayTimeDuration('P1DT3H15M')")
			assert ("No evaluation error 19", not an_evaluator.is_error)
			a_time ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is time 2", a_time /= Void)
			assert ("02:27:00+03:00", a_time.time.hour = 2 and then a_time.time.minute = 27 and then a_time.time.second = 0
				and then a_time.zoned and then a_time.zoned_time.time_zone.fixed_offset.hour = 3)
			an_evaluator.evaluate ("xs:time('11:12:00') - xs:dayTimeDuration('P3DT1H15M')")
			assert ("No evaluation error 20", not an_evaluator.is_error)
			a_time ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is time 3", a_time /= Void)
			assert ("09:57:00", a_time.time.hour = 9 and then a_time.time.minute = 57 and then a_time.time.second = 0)
			an_evaluator.evaluate ("xs:time('08:20:00-05:00') - xs:dayTimeDuration('P23DT10H10M')")
			assert ("No evaluation error 21", not an_evaluator.is_error)
			a_time ?= an_evaluator.evaluated_items.item (1)
			assert ("Value is time 4", a_time /= Void)
			assert ("22:10:00-05:00", a_time.time.hour = 22 and then a_time.time.minute = 10 and then a_time.time.second = 0
				and then a_time.zoned and then a_time.zoned_time.time_zone.fixed_offset.hour = -5)
		end

	set_up
		do
			conformance.set_basic_xslt_processor
		end

feature -- Results

	expected_seconds: MA_DECIMAL
			-- Expected seconds value
		once
			create Result.make_from_string ("21.565")
		end

	expected_seconds_two: MA_DECIMAL
			-- Expected seconds value
		once
			create Result.make_from_string ("10.5")
		end

	twelve_point_five: MA_DECIMAL
			-- 12.5
		once
			create Result.make_from_string ("12.5")
		end

	minus_two_point_five: MA_DECIMAL
			-- -2.5
		once
			create Result.make_from_string ("-2.5")
		end

feature {NONE} -- Implementation

	data_dirname: STRING
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"test", "xml", "xpath", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end

	books_xml_uri: UT_URI
			-- URI of file 'books.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "books.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			books_xml_uri_not_void: Result /= Void
		end

end


