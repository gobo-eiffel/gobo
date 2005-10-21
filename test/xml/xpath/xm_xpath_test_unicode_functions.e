indexing

	description:

		"Test XPath unicode functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_UNICODE_FUNCTIONS

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
	
feature -- Tests

	test_codepoints_to_string is
			-- Test fn:codepoints-to-string((2309, 2358, 2378, 2325)).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("codepoints-to-string((2309, 2358, 2378, 2325))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
		end

	test_string_to_codepoints is
			-- Test fn:string-to-codepoints ("Thérèse")
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("string-to-codepoints ('Thérèse')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Seven evaluated items", evaluated_items /= Void and then evaluated_items.count = 7)
			assert ("Eighty-four", evaluated_items.item (1).is_integer_value
					  and then evaluated_items.item (1).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (1).as_integer_value.as_integer = 84)
			assert ("One-oh-four", evaluated_items.item (2).is_integer_value
					  and then evaluated_items.item (2).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (2).as_integer_value.as_integer = 104)
			assert ("Two-three-three", evaluated_items.item (3).is_integer_value
					  and then evaluated_items.item (3).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (3).as_integer_value.as_integer = 233)
			assert ("One-one-four", evaluated_items.item (4).is_integer_value
					  and then evaluated_items.item (4).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (4).as_integer_value.as_integer = 114)
			assert ("Two-three-two", evaluated_items.item (5).is_integer_value
					  and then evaluated_items.item (5).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (5).as_integer_value.as_integer = 232)
			assert ("One-one-five", evaluated_items.item (6).is_integer_value
					  and then evaluated_items.item (6).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (6).as_integer_value.as_integer = 115)
			assert ("One-oh-one", evaluated_items.item (7).is_integer_value
					  and then evaluated_items.item (7).as_integer_value.is_platform_integer
					  and then  evaluated_items.item (7).as_integer_value.as_integer = 101)
		end

	test_codepoint_equal is
			-- Test fn:codepoint-equal ("abc", "ab").
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("codepoint-equal('abc', 'ab')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("Boolean value false", evaluated_items.item (1).is_boolean_value and then not evaluated_items.item (1).as_boolean_value.value)
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

			
