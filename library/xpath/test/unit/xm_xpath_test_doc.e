note

	description:

		"Test XPath collection(), doc() and doc-available functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2001-2016, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_DOC

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

	test_collection_not_found
			-- Test fn:collection("unknown:").
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("collection ('unknown:')")
			assert ("Error FODC0004", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FODC0004"))
		end

	test_collection_on_data_directory
			-- Test fn:collection("../data/").
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("collection ('../data/')")
			assert ("No error", not an_evaluator.is_error)
			assert ("At least 10 documents", an_evaluator.evaluated_items.count >= 10)
			-- TODO: add tests that all documents have same base URI, but each has a separate document-uri.
		end

	test_default_collection
			-- Test fn:collection().
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_unicode
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("collection ()")
			assert ("No error", not an_evaluator.is_error)
			assert ("At least 2 documents", an_evaluator.evaluated_items.count >= 2)
		end

	test_doc_available_function
			-- Test fn:doc-available()
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("doc-available('books.xsl')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Result is True", a_boolean_value.value)
		end

	test_doc_function
			-- Test fn:doc()
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("doc('books.xsl')/child::*[1]/attribute::version eq '2.0'")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Result is True", a_boolean_value.value)
		end

	test_doc_parse_error
			-- Test error fn:doc()
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("doc('boooks.xsl')/child::*[1]/attribute::version eq '2.0'")
			assert ("No evaluation error", an_evaluator.is_error)
			assert ("FODC0005", STRING_.same_string (an_evaluator.error_value.code, "FODC0005"))
		end

	set_up
		do
			conformance.set_basic_xslt_processor
		end

feature {NONE} -- Implementation

	data_dirname: STRING
			-- Name of directory containing data files
		once
			Result := file_system.nested_pathname ("${GOBO}", <<"library", "xpath", "test", "unit", "data">>)
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


