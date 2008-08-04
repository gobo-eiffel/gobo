indexing

	description:

		"Test XPath uri function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_URI_FUNCTIONS

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

feature -- Results

	expected_resolved_uri: STRING is
			-- Expected result from `test_resolve_relative_uri_against_static_content'
		local
			a_uri: UT_URI
		once
			create a_uri.make_resolve (base_directory, "./data/contents.html")
			Result := a_uri.full_reference  
		end

	base_directory: UT_URI is
			-- URI of directory containing this class
		local
			l_uri: STRING
		once
			l_uri := file_system.nested_pathname ("${GOBO}", <<"test", "xml", "xpath", "dummy.xml">>)
			l_uri := Execution_environment.interpreted_string (l_uri)
			Result := File_uri.filename_to_uri (l_uri)
		end
		
feature -- Tests

	test_escape_html_uri is
			-- Test fn:escape-html-uri ("http://www.example.com/00/Weather/CA/Los 20Angeles#ocean").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("escape-html-uri ('http://www.example.com/00/Weather/CA/Los Angeles#ocean')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert_strings_equal ("Correct result", "http://www.example.com/00/Weather/CA/Los Angeles#ocean", a_string_value.string_value)
		end

	test_encode_for_uri_one is
			-- Test fn:encode-for-uri ("http://www.example.com/00/Weather/CA/Los%20Angeles#ocean").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("encode-for-uri ('http://www.example.com/00/Weather/CA/Los%%20Angeles#ocean')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert_strings_equal ("Correct result", "http%%3A%%2F%%2Fwww.example.com%%2F00%%2FWeather%%2FCA%%2FLos%%2520Angeles#ocean", a_string_value.string_value)
		end

	test_encode_for_uri_two is
			-- Test fn:concat("http://www.example.com/", encode-for-uri("~bébé")).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("concat('http://www.example.com/', encode-for-uri('~bébé'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert_strings_equal ("Correct result", "http://www.example.com/~b%%C3%%A9b%%C3%%A9", a_string_value.string_value)
		end

	test_encode_for_uri_three is
			-- Test fn:concat("http://www.example.com/", encode-for-uri("100% organic"))
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("concat('http://www.example.com/', encode-for-uri('100%% organic'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert_strings_equal ("Correct result", "http://www.example.com/100%%25%%20organic", a_string_value.string_value)
		end

	test_iri_two_uri_one is
			-- Test fn:iri-to-uri ("http://www.example.com/00/Weather/CA/Los%20Angeles#ocean").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("iri-to-uri ('http://www.example.com/00/Weather/CA/Los%%20Angeles#ocean')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert_strings_equal ("Correct result", "http://www.example.com/00/Weather/CA/Los%%20Angeles#ocean", a_string_value.string_value)
		end
	
	test_iri_two_uri_two is
			-- Test fn:iri-to-uri ("http://www.example.com/~bébé")..
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("iri-to-uri ('http://www.example.com/~bébé')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert_strings_equal ("Correct result", "http://www.example.com/~b%%C3%%A9b%%C3%%A9", a_string_value.string_value)
		end
	
	test_resolve_absolute_uri_against_static_context is
			-- Test fn:resolve-uri ("http://www.example.com/index.html").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-uri ('http://www.example.com/index.html')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert_strings_equal ("Correct result", "http://www.example.com/index.html", evaluated_items.item (1).as_any_uri.string_value)
		end

	test_resolve_relative_uri_against_absolute_uri is
			-- Test fn:resolve-uri ("./contents.html", "http://www.example.com/index.html").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-uri ('./contents.html', 'http://www.example.com/index.html')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert_strings_equal ("Correct result", "http://www.example.com/contents.html", evaluated_items.item (1).as_any_uri.string_value)
		end

	test_resolve_relative_uri_against_static_content is
			-- Test fn:resolve-uri ("./contents.html").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("resolve-uri ('./contents.html')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("AnyURI value", evaluated_items.item (1).is_any_uri)
			assert_strings_case_insensitive_equal ("Correct result", expected_resolved_uri, evaluated_items.item (1).as_any_uri.string_value)
		end

	set_up is
			-- <Precursor>.
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
