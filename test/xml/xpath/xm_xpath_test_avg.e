indexing

	description:

		"Test XPath statistical functions avg(), count(), sum(), min(), max()."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_AVG

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
		
feature -- Constant

	four: MA_DECIMAL is
			-- 4 as a decimal
		once
			create Result.make_from_integer (4)
		ensure
			four_not_void: Result /= Void
		end

feature -- Test

	test_avg_one is
			-- Test fn:avg((3, 4, 5)) returns 4.0.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_decimal_value: XM_XPATH_DECIMAL_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("avg((3, 4, 5))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_decimal_value ?= evaluated_items.item (1)
			assert ("Decimal value", a_decimal_value /= Void)
			assert ("Result is four", a_decimal_value.value.is_equal (four))
		end

	test_avg_empty is
			-- Test fn:avg(()) returns ().
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("avg(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("No evaluated items", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	test_avg_nan is
			-- Test fn:avg((xs:double ("INF"), xs:double ("-INF"))) returns xs:double ("NaN").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_double_value: XM_XPATH_DOUBLE_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("avg((xs:double ('INF'), xs:double ('-INF')))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_double_value ?= an_evaluator.evaluated_items.item (1)
			assert ("NaN", a_double_value /= Void and then a_double_value.is_nan)
		end

	test_avg_error is
			-- Test fn:avg(('a', 5)) returns error FORG0006.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("avg(('a', 5))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("FORG0006", STRING_.same_string (an_evaluator.error_value.code, "FORG0006"))
		end

	test_avg_error_two is
			-- Test fn:avg(((3, 4, 5), xdt:yearMonthDuration('P10M'))) returns error FORG0006.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("avg(((3, 4, 5), xdt:yearMonthDuration('P10M')))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("FORG0006", STRING_.same_string (an_evaluator.error_value.code, "FORG0006"))
		end

	test_avg_year_month is
			-- Test fn:avg((xdt:yearMonthDuration('P20Y'), xdt:yearMonthDuration('P10M'))) returns a yearMonthDuration with value 125 months.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_ymd: XM_XPATH_MONTHS_DURATION_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("avg((xdt:yearMonthDuration('P20Y'), xdt:yearMonthDuration('P10M')))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_ymd ?= evaluated_items.item (1)
			assert ("YearMonthDuration value", a_ymd /= Void)
			assert ("125 Months", a_ymd.months = 125)
		end

	test_sum_one is
			-- Test fn:sum((3, 4, 5)) returns 12.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("sum((3, 4, 5))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Integer value", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Result is 12", an_integer_value.as_integer = 12)
		end

	test_sum_empty_is_zero is
			-- Test fn:sum(()) returns 0.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("sum(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Integer value", an_integer_value /= Void)
			assert ("Result is 0", an_integer_value.is_zero)
		end

	test_sum_empty is
			-- Test fn:sum((), ()) returns ().
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("sum((), ())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Empty", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	test_filtered_sum_empty_is_zero is
			-- Test fn:sum((1 to 100)[.<0], 0) returns 0.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("sum((1 to 100)[.<0], 0)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Integer value", an_integer_value /= Void)
			assert ("Result is 0", an_integer_value.is_zero)
		end

	test_sum_year_month is
			-- Test fn:sum((xdt:yearMonthDuration('P20Y'), xdt:yearMonthDuration('P10M'))) returns a yearMonthDuration with value 125 months.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_ymd: XM_XPATH_MONTHS_DURATION_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("sum((xdt:yearMonthDuration('P20Y'), xdt:yearMonthDuration('P10M')))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_ymd ?= evaluated_items.item (1)
			assert ("YearMonthDuration value", a_ymd /= Void)
			assert ("250 Months", a_ymd.months = 250)
		end

	test_mixed_sum_error is
			-- Test fn:sum((xdt:yearMonthDuration('P20Y'), 9E1)) returns error FORG0006.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("sum((xdt:yearMonthDuration('P20Y'), 9E1))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("FORG0006", STRING_.same_string (an_evaluator.error_value.code, "FORG0006"))
		end

	test_max_one is
			-- Test fn:max((3, 4, 5)) returns 5.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("max((3, 4, 5))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Integer value", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Result is 5", an_integer_value.as_integer = 5)
		end

	test_max_mixed_numeric is
			-- Test fn:max((5, 5.0e0)) returns 5.0e0.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_double_value: XM_XPATH_DOUBLE_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("max((5, 5.0e0))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_double_value ?= evaluated_items.item (1)
			assert ("Double value", a_double_value /= Void)
			assert ("Result is 5.0", a_double_value.as_double = 5.0)
		end

	test_mixed_max_error is
			-- Test fn:max((3,4,"Zero")) returns error FORG0006.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("max((3,4,'Zero'))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("FORG0006", STRING_.same_string (an_evaluator.error_value.code, "FORG0006"))
		end

	test_max_mixed_zones is
			-- Test implicit time zone on dateTimes.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
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
			an_evaluator.evaluate ("max((xs:dateTime ('2005-09-17T00:00:00'), xs:dateTime('2005-09-17T04:00:00Z')))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_dt ?= evaluated_items.item (1)
			assert ("Zoneless dateTime value", a_dt /= Void and then not a_dt.zoned)
			assert ("Local hour is 0", a_dt.local_date_time.time.hour = 0)
		end

	test_max_strings is
			-- Test fn:max(("a", "b", "c")) returns "c".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("max(('a', 'b', 'c'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Result is c", STRING_.same_string ("c", a_string_value.string_value))
		end

	test_min_one is
			-- Test fn:min((3, 4, 5)) returns 3.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("min((3, 4, 5))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Integer value", an_integer_value /= Void and then an_integer_value.is_platform_integer)
			assert ("Result is 5", an_integer_value.as_integer = 3)
		end

	test_min_mixed_numeric is
			-- Test fn:min((5, 5.0e0)) returns 5.0e0.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_double_value: XM_XPATH_DOUBLE_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("min((5, 5.0e0))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_double_value ?= evaluated_items.item (1)
			assert ("Double value", a_double_value /= Void)
			assert ("Result is 5.0", a_double_value.as_double = 5.0)
		end

	test_mixed_min_error is
			-- Test fn:min((3,4,"Zero")) returns error FORG0006.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("min((3,4,'Zero'))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("FORG0006", STRING_.same_string (an_evaluator.error_value.code, "FORG0006"))
		end

	test_min_mixed_zones is
			-- Test implicit time zone on dateTimes.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
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
			an_evaluator.evaluate ("min((xs:dateTime ('2005-09-17T00:00:00'), xs:dateTime('2005-09-17T04:00:00Z')))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_dt ?= evaluated_items.item (1)
			assert ("Zoned dateTime value", a_dt /= Void and then a_dt.zoned)
			assert ("Local hour is 4", a_dt.zoned_date_time.date_time.hour = 4)
		end

	test_min_strings is
			-- Test fn:min(("a", "b", "c")) returns "a".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("min(('a', 'b', 'c'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Result is a", STRING_.same_string ("a", a_string_value.string_value))
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

feature {NONE} -- Implementation

	data_dirname: STRING is
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}",
																<<"test", "xml", "xpath", "data">>)
			Result := Execution_environment.interpreted_string (Result)
		ensure
			data_dirname_not_void: Result /= Void
			data_dirname_not_empty: not Result.is_empty
		end
		
	books_xml_uri: UT_URI is
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

			
