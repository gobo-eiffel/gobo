indexing

	description:

		"Test XPath uri function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_URI_FUNCTIONS

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

feature -- Results

	expected_resolved_uri: STRING is
			-- Expected result from `test_resolve_relative_uri_against_static_content'
		local
			a_uri: UT_URI
		once
			create a_uri.make_resolve (current_directory_base, "./data/contents.html")
			Result := a_uri.full_reference  
		end

	current_directory_base: UT_URI is
			-- URI of current directory
		local
			a_cwd: KI_PATHNAME
		once
			a_cwd := file_system.string_to_pathname (file_system.current_working_directory)
			Result := File_uri.pathname_to_uri (a_cwd)
		end
		
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

	test_resolve_absolute_uri_against_static_context is
			-- Test fn:resolve-uri ("http://www.example.com/index.html").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-uri ('http://www.example.com/index.html')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert ("Correct result", STRING_.same_string (evaluated_items.item (1).as_any_uri.string_value, "http://www.example.com/index.html"))
		end

	test_resolve_relative_uri_against_absolute_uri is
			-- Test fn:resolve-uri ("./contents.html", "http://www.example.com/index.html").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-uri ('./contents.html', 'http://www.example.com/index.html')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert ("Correct result", STRING_.same_string (evaluated_items.item (1).as_any_uri.string_value, "http://www.example.com/contents.html"))
		end

	test_resolve_relative_uri_against_static_content is
			-- Test fn:resolve-uri ("./contents.html").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-uri ('./contents.html')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert ("Correct result", STRING_.same_string (evaluated_items.item (1).as_any_uri.string_value, expected_resolved_uri))
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
