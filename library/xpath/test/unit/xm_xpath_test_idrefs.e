note

	description:

		"Test XPath id() and idref() functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005-2016, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_IDREFS

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

	test_single_id_against_tiny_tree
			-- Test fn:id ('A6').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A6 ')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
		end

	test_single_id_against_standard_tree
			-- Test fn:id ('A6').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A6 ')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
		end

	test_multiple_id_strings_against_standard_tree
			-- Test fn:id (('A6', 'A1')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end

	test_multiple_id_strings_against_tiny_tree
			-- Test fn:id (('A6', 'A1')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end

	test_multiple_id_multiple_strings_against_standard_tree
			-- Test fn:id (('A6', 'A1 A2')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1 A2'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Three evaluated items", evaluated_items /= Void and then evaluated_items.count = 3)
		end

	test_multiple_id_multiple_strings_against_tiny_tree
			-- Test fn:id (('A6', 'A1 A2')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1 A2'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Three evaluated items", evaluated_items /= Void and then evaluated_items.count = 3)
		end

	test_multiple_ids_against_standard_tree
			--	Test fn:id (' A1 A6 B99').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A1 A6 B99')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end

	test_multiple_ids_against_tiny_tree
			--	Test fn:id (' A1 A6 B99').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A1 A6 B99')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end

	test_idrefs_against_tiny_tree
			--	Test fn:idref ((' A1 ', 'A3 A7 A2 ')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("idref ((' A6 ', 'A3 A7 A2 '))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("four evaluated items", evaluated_items /= Void and then evaluated_items.count = 4)
		end

	test_idrefs_against_standard_tree
			--	Test fn:idref ((' A1 ', 'A3 A7 A2 ')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (idrefs_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("idref ((' A6 ', 'A3 A7 A2 '))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("four evaluated items", evaluated_items /= Void and then evaluated_items.count = 4)
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

	idrefs_xml_uri: UT_URI
			-- URI of file 'idrefs.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "idrefs.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			idrefs_xml_uri_not_void: Result /= Void
		end

end


