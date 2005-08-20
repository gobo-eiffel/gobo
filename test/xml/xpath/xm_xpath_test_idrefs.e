indexing

	description:

		"Test XPath id() and idref() functions."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_IDREFS

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

	test_single_id_against_tiny_tree is
			-- Test fn:id ('A6').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A6 ')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
		end

	test_single_id_against_standard_tree is
			-- Test fn:id ('A6').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A6 ')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
		end
	
	test_multiple_id_strings_against_standard_tree is
			-- Test fn:id (('A6', 'A1')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end
	
	test_multiple_id_strings_against_tiny_tree is
			-- Test fn:id (('A6', 'A1')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end
	
	test_multiple_id_multiple_strings_against_standard_tree is
			-- Test fn:id (('A6', 'A1 A2')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1 A2'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Three evaluated items", evaluated_items /= Void and then evaluated_items.count = 3)
		end

	test_multiple_id_multiple_strings_against_tiny_tree is
			-- Test fn:id (('A6', 'A1 A2')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id(('A6 ', 'A1 A2'))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Three evaluated items", evaluated_items /= Void and then evaluated_items.count = 3)
		end

	test_multiple_ids_against_standard_tree is
			--	Test fn:id (' A1 A6 B99').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A1 A6 B99')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end

	test_multiple_ids_against_tiny_tree is
			--	Test fn:id (' A1 A6 B99').
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("id (' A1 A6 B99')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two evaluated items", evaluated_items /= Void and then evaluated_items.count = 2)
		end

	test_idrefs_against_tiny_tree is
			--	Test fn:idref ((' A1 ', 'A3 A7 A2 ')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("idref ((' A6 ', 'A3 A7 A2 '))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("four evaluated items", evaluated_items /= Void and then evaluated_items.count = 4)
		end

	test_idrefs_against_standard_tree is
			--	Test fn:idref ((' A1 ', 'A3 A7 A2 ')).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/idrefs.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("idref ((' A6 ', 'A3 A7 A2 '))")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("four evaluated items", evaluated_items /= Void and then evaluated_items.count = 4)
		end


	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
