indexing

	description:

		"Test XPath zero-or-one(), exactly-one() and one-or-more() functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_CARDINALITY_CHECKS

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

feature -- Tests

	test_zero_or_one_no_error is
			-- Test fn:zero-or-one ('a') returns 'a'.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("zero-or-one ('a')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One value", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("First value is string", a_string_value /= Void)
			assert ("First value is a", STRING_.same_string (a_string_value.string_value, "a"))
		end

	test_zero_or_one_error is
			-- Test fn:zero-or-one (('a', 'b')) is an error.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("zero-or-one (('a', 'b'))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("Error FORG0003", STRING_.same_string (an_evaluator.error_value.code, "FORG0003"))
		end

	test_exactly_one_no_error is
			-- Test fn:exactly-one ('a') returns 'a'.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("exactly-one ('a')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One value", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("First value is string", a_string_value /= Void)
			assert ("First value is a", STRING_.same_string (a_string_value.string_value, "a"))
		end

	test_exactly_one_error is
			-- Test fn:exactly-one (('a', 'b')) is an error.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("exactly-one (('a', 'b'))")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("Error FORG0004", STRING_.same_string (an_evaluator.error_value.code, "FORG0005"))
		end

	test_one_or_more_no_error is
			-- Test fn:one-or-more ('a') returns 'a'.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("one-or-more ('a')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One value", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("First value is string", a_string_value /= Void)
			assert ("First value is a", STRING_.same_string (a_string_value.string_value, "a"))
		end

	test_one_or_more_error is
			-- Test fn:one-or-more (()) is an error.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("one-or-more (())")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("Error FORG0005", STRING_.same_string (an_evaluator.error_value.code, "FORG0004"))
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
