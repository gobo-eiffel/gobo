indexing

	description:

		"Test XPath index-of() function."

	test_status: "ok_to_run"
	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEST_INDEX_OF

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

	test_index_of_one is
			-- Test fn:index-of ((10, 20, 30, 40), 35) returns ().
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of ((10, 20, 30, 40), 35)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Empty sequence", evaluated_items /= Void and then evaluated_items.count = 0)
		end

	test_index_of_two is
			-- Test fn:index-of ((10, 20, 30, 30, 20, 10), 20) returns (2, 5).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of ((10, 20, 30, 30, 20, 10), 20)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two items", evaluated_items /= Void and then evaluated_items.count = 2)
			an_integer_value ?= evaluated_items.item (1)
			assert ("First position is 2", an_integer_value /= Void and then an_integer_value.value = 2)
			an_integer_value ?= evaluated_items.item (2)
			assert ("Second position is 5", an_integer_value /= Void and then an_integer_value.value = 5)
		end

	test_index_of_three is
			-- Test fn:index-of (("a", "sport", "and", "a", "pastime"), "a") returns (1, 4).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of (('a', 'sport', 'and', 'a', 'pastime'), 'a')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two items", evaluated_items /= Void and then evaluated_items.count = 2)
			an_integer_value ?= evaluated_items.item (1)
			assert ("First position is 1", an_integer_value /= Void and then an_integer_value.value = 1)
			an_integer_value ?= evaluated_items.item (2)
			assert ("Second position is 4", an_integer_value /= Void and then an_integer_value.value = 4)
		end

	test_index_of_error is
			-- Test fn:index-of (("a", 7, "and", "a", "pastime"), "a") returns an error.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of (('a', 7, 'and', 'a', 'pastime'), 'a')")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("Error FOTY0012", STRING_.same_string (an_evaluator.error_value.code, "FOTY0012"))
		end

	test_index_of_error2 is
			-- Test fn:index-of with a node is error.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (languages_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of (('a', (1,2)/last(), 'and', 'a', 'pastime'), 'a')")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("Error XPTY0019", STRING_.same_string (an_evaluator.error_value.code, "XPTY0019"))
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
		
	languages_xml_uri: UT_URI is
			-- URI of file 'languages.xml'
		local
			a_path: STRING
		once
			a_path := file_system.pathname (data_dirname, "languages.xml")
			Result := File_uri.filename_to_uri (a_path)
		ensure
			languages_xml_uri_not_void: Result /= Void
		end

end

			
