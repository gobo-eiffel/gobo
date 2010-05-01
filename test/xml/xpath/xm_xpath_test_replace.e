note

	description:

		"Test XPath replace() function."

	test_status: "ok_to_run"
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_REPLACE

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

	test_replace_one is
			-- Test replace("abracadabra", "bra", "*") returns "a*cada*".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('abracadabra', 'bra', '*')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "a*cada*"))
		end

	test_replace_two is
			-- Test replace("abracadabra", "a.*a", "*") returns "*".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('abracadabra', 'a.*a', '*')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Star", STRING_.same_string (a_string_value.string_value, "*"))
		end

	test_replace_three is
			-- Test replace("abracadabra", "a.*?a", "*") returns "*c*bra".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('abracadabra', 'a.*?a', '*')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "*c*bra"))
		end

	test_replace_four is
			-- Test replace("abracadabra", "a", "") returns "brcdbr".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('abracadabra', 'a', '')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "brcdbr"))
		end

	test_replace_five is
			-- Test replace("abracadabra", "a(.)", "a$1$1") returns "abbraccaddabbra".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('abracadabra', 'a(.)', 'a$1$1')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "abbraccaddabbra"))
		end

	test_replace_six is
			-- Test replace("abracadabra", ".*?", "$1") raises an error, because the pattern matches the zero-length string.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('abracadabra', '.*?', '$1')")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("Error FORX0003", STRING_.same_string (an_evaluator.error_value.code, "FORX0003"))
		end

	test_replace_seven is
			-- Test replace("AAAA", "A+", "b") returns "b".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('AAAA', 'A+', 'b')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "b"))
		end

	test_replace_eight is
			-- Test replace("AAAA", "A+?", "b") returns "bbbb".
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('AAAA', 'A+?', 'b')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "bbbb"))
		end
	
	test_replace_nine is
			-- Test replace("darted", "^(.*?)d(.*)$", "$1c$2") returns "carted". The first "d" is replaced.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("replace('darted', '^(.*?)d(.*)$', '$1c$2')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_string_value ?= evaluated_items.item (1)
			assert ("String value", a_string_value /= Void)
			assert ("Correct result", STRING_.same_string (a_string_value.string_value, "carted"))
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

			
