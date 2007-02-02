indexing

	description:

		"Test XPath round-to-half-even() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_ROUND_HALF_EVEN

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
		
feature -- Constants

	two: MA_DECIMAL is
			-- 2 as a decimal
		once
			create Result.make_from_integer (2)
		ensure
			two_not_void: Result /= Void
		end

	three_five_six_oh_oh: MA_DECIMAL is
			-- 35600 as a decimal
		once
			create Result.make_from_integer (35600)
		ensure
			three_five_six_oh_oh_not_void: Result /= Void
		end

feature -- Tests

	-- All these tests commented out
	-- A fix is needed for use with SE - use MA_DECIMAL to produce `string_value'
-- 	test_round_a_half is
-- 			-- Test fn:round-to-half-even(0.5)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			a_decimal_value: XM_XPATH_DECIMAL_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(0.5)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			a_decimal_value ?= evaluated_items.item (1)
-- 			assert ("Decimal value", a_decimal_value /= Void)
-- 			assert ("Result is zero", a_decimal_value.value.is_zero)
-- 		end

-- 	test_round_one_and_a_half is
-- 			-- Test fn:round-to-half-even(1.5)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			a_decimal_value: XM_XPATH_DECIMAL_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(1.5)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			a_decimal_value ?= evaluated_items.item (1)
-- 			assert ("Decimal value", a_decimal_value /= Void)
-- 			assert ("Result is two", a_decimal_value.value.is_equal (two))
-- 		end

-- 	test_round_two_and_a_half is
-- 			-- Test fn:round-to-half-even(2.5)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			a_decimal_value: XM_XPATH_DECIMAL_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(2.5)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			a_decimal_value ?= evaluated_items.item (1)
-- 			assert ("Decimal value", a_decimal_value /= Void)
-- 			assert ("Result is two", a_decimal_value.value.is_equal (two))
-- 		end

-- 	test_round_big_double is
-- 			-- Test fn:round-to-half-even(3.567812E+3, 2)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			a_double_value: XM_XPATH_DOUBLE_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(3.567812E+3, 2)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			a_double_value ?= evaluated_items.item (1)
-- 			assert ("Double value", a_double_value /= Void)
-- 			--a_double := 3567.810000
-- 			--print ((a_double = 3567.81E0).out + "%N")
-- 			assert ("Correct result", a_double_value.value = 3567.81E0)
-- 		end

-- 	test_round_small_double is
-- 			-- Test fn:round-to-half-even(4.7564E-3, 2)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			a_double_value: XM_XPATH_DOUBLE_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(4.7564E-3, 2)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			a_double_value ?= evaluated_items.item (1)
-- 			assert ("Double value", a_double_value /= Void)
-- 			assert ("Correct result", a_double_value.value = 0.0E0)
-- 		end

-- 	test_round_losing_precision is
-- 			-- Test fn:round-to-half-even(35612.25, -2)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			a_decimal_value: XM_XPATH_DECIMAL_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(35612.25, -2)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			a_decimal_value ?= evaluated_items.item (1)
-- 			assert ("Decimal value", a_decimal_value /= Void)
-- 			assert ("Result is 35600", a_decimal_value.value.is_equal (three_five_six_oh_oh))
-- 		end

-- 	test_round_integer_losing_precision is
-- 			-- Test fn:round-to-half-even(35612, -2)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(35612, -2)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			an_integer_value ?= evaluated_items.item (1)
-- 			assert ("Integer value", an_integer_value /= Void)
-- 			assert ("Result is 35600", an_integer_value.value.is_equal (three_five_six_oh_oh))
-- 		end


-- 	test_round_integer_not_gaining_precision is
-- 			-- Test fn:round-to-half-even(35600, 2)
-- 		local
-- 			an_evaluator: XM_XPATH_EVALUATOR
-- 			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
-- 			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
-- 		do
-- 			create an_evaluator.make (18, False)
-- 			an_evaluator.set_string_mode_ascii
-- 			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
-- 			assert ("Build successfull", not an_evaluator.was_build_error)
-- 			an_evaluator.evaluate ("round-half-to-even(35600, 2)")
-- 			assert ("No evaluation error", not an_evaluator.is_error)
-- 			evaluated_items := an_evaluator.evaluated_items
-- 			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
-- 			an_integer_value ?= evaluated_items.item (1)
-- 			assert ("Integer value", an_integer_value /= Void)
-- 			assert ("Result is 35600", an_integer_value.value.is_equal (three_five_six_oh_oh))
--		end

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

			
