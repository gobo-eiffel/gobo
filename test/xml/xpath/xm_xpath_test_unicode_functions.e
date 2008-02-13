indexing

	description:

		"Test XPath unicode functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_UNICODE_FUNCTIONS

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

	UC_IMPORTED_UNICODE_ROUTINES

create

	make_default

feature -- Tests

	test_upper_case is
			-- Test fn:upper-case().
		local
			l_evaluator: XM_XPATH_EVALUATOR
			l_evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			l_function: STRING
		do
			create l_evaluator.make (18, False)
			l_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not l_evaluator.was_build_error)
			l_function := STRING_.concat ("upper-case('", Lower_essen)
			l_evaluator.evaluate (STRING_.appended_string (l_function, "')"))
			assert ("No evaluation error", not l_evaluator.is_error)
			l_evaluated_items := l_evaluator.evaluated_items
			assert ("One evaluated item", l_evaluated_items /= Void and then l_evaluated_items.count = 1)
			assert ("String value", l_evaluated_items.item (1).is_string_value)
			assert ("Correct result", STRING_.same_string (Upper_essen, l_evaluated_items.item (1).as_string_value.string_value))
		end

	test_lower_case is
			-- Test fn:lower-case().
		local
			l_evaluator: XM_XPATH_EVALUATOR
			l_evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create l_evaluator.make (18, False)
			l_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not l_evaluator.was_build_error)
			l_evaluator.evaluate ("lower-case('ESSEN')")
			assert ("No evaluation error", not l_evaluator.is_error)
			l_evaluated_items := l_evaluator.evaluated_items
			assert ("One evaluated item", l_evaluated_items /= Void and then l_evaluated_items.count = 1)
			assert ("String value", l_evaluated_items.item (1).is_string_value)
			assert ("Correct result", STRING_.same_string (Unorthodox_essen, l_evaluated_items.item (1).as_string_value.string_value))
		end
	
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

	test_normalize_unicode is
			-- Test fn:normaize-unicode().
		local
			an_expression: STRING
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("normalize-unicode(())")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("Empty string", evaluated_items.item (1).is_string_value and then evaluated_items.item (1).as_string_value.string_value.is_empty)
			an_evaluator.evaluate ("normalize-unicode('fred', ' fully-normalized')")
			assert ("Normalization form not supported", an_evaluator.is_error and then STRING_.same_string (an_evaluator.error_value.code, "FOCH0003"))
			an_evaluator.reset_errors
			an_expression := STRING_.concat ("normalize-unicode('", raw_affin)
			an_expression := STRING_.appended_string (an_expression, "', ' nFc ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Same string under NFC", raw_affin, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", raw_affin)
			an_expression := STRING_.appended_string (an_expression, "', ' nFd ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Decomposed string under NFD", decomposed_affin, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", affin_with_ligature)
			an_expression := STRING_.appended_string (an_expression, "', ' nFc ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Same string under NFC 2", affin_with_ligature, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", affin_with_ligature)
			an_expression := STRING_.appended_string (an_expression, "', ' nFD ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("partially decomposed string under NFD", canonically_decomposed_affin_with_ligature, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", raw_affin)
			an_expression := STRING_.appended_string (an_expression, "', ' nFkc ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Same string under NFKC", raw_affin, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", raw_affin)
			an_expression := STRING_.appended_string (an_expression, "', ' nFkd ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Decomposed string under NFKD", decomposed_affin, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", affin_with_ligature)
			an_expression := STRING_.appended_string (an_expression, "', ' nFkc ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Composed under NFKC", raw_affin, evaluated_items.item (1).as_string_value.string_value)
			an_expression := STRING_.concat ("normalize-unicode('", affin_with_ligature)
			an_expression := STRING_.appended_string (an_expression, "', ' nFkD ')")
			an_evaluator.evaluate (an_expression)
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			assert ("String value", evaluated_items.item (1).is_string_value)
			assert_strings_equal ("Decomposed string under NFKD", decomposed_affin, evaluated_items.item (1).as_string_value.string_value)
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

	raw_affin: STRING is
			-- Test string
		once
			Result := STRING_.concat (unicode.code_to_string (196), "ffin")
		ensure
			five_characters: Result /= Void and then Result.count = 5
		end

	decomposed_affin: STRING is
			-- Test string
		once
			Result := STRING_.concat ("A", unicode.code_to_string (776))
			Result := STRING_.appended_string (Result, "ffin")
		ensure
			six_characters: Result /= Void and then Result.count = 6
		end

	affin_with_ligature: STRING is
			-- Test string
		once
			Result := STRING_.concat (unicode.code_to_string (196), unicode.code_to_string (64259))
			Result := STRING_.appended_string (Result, "n")
		ensure
			three_characters: Result /= Void and then Result.count = 3
		end

	canonically_decomposed_affin_with_ligature: STRING is
			-- Test string
		once
			Result := STRING_.concat ("A", unicode.code_to_string (776))
			Result := STRING_.appended_string (Result, unicode.code_to_string (64259))
			Result := STRING_.appended_string (Result, "n")
		ensure
			four_characters: Result /= Void and then Result.count = 4
		end

	Lower_essen: STRING is "e%/223/en"
			-- German verb meaning 'to eat'

	Upper_essen: STRING is "ESSEN"
			-- German verb meaning 'to eat'

	Unorthodox_essen: STRING is "essen"
			-- German verb meaning 'to eat' with unorthodox spelling

end

			
