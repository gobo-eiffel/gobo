indexing

	description:

		"Test XPath escape-uri() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_ESCAPE_URI

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

	test_escape_uri_one is
			-- Test fn:escape-uri ("http://www.example.com/00/Weather/CA/Los%20Angeles#ocean", true()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("escape-uri ('http://www.example.com/00/Weather/CA/Los%%20Angeles#ocean', true())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "http%%3A%%2F%%2Fwww.example.com%%2F00%%2FWeather%%2FCA%%2FLos%%20Angeles#ocean"))
		end

	test_escape_uri_two is
			-- Test fn:escape-uri ("http://www.example.com/00/Weather/CA/Los%20Angeles#ocean", false()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("escape-uri ('http://www.example.com/00/Weather/CA/Los%%20Angeles#ocean', false())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "http://www.example.com/00/Weather/CA/Los%%20Angeles#ocean"))
		end

	
	test_escape_uri_three is
			-- Test fn:escape-uri ("http://www.example.com/~bébé", false()).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("escape-uri ('http://www.example.com/~bébé', false())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "http://www.example.com/~b%%C3%%A9b%%C3%%A9"))
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
