indexing

	description:

		"Test stand-alone XPath evaluation"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_EVALUATOR

inherit

	TS_TEST_CASE
		redefine
			set_up
		end

	XM_XPATH_TYPE
	
	XM_XPATH_ERROR_TYPES

	XM_STRING_MODE

	KL_IMPORTED_STRING_ROUTINES

feature

	test_against_xml_file is
			-- Test against an external XML file;
			--  checks various parts of expression syntax
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("BOOKLIST//ITEM[child::TITLE = 'When We Were Very Young']/attribute::CAT") -- should evaluate to "F"
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
		end

	-- The following tests are of examples from the draft standard
	
	test_second_child_filter is
			-- Test second ITEM child of BOOKS node
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_node: XM_XPATH_NODE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/BOOKLIST/BOOKS/child::ITEM[2]")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_node ?= evaluated_items.item (1)
			assert ("Node not void", a_node /= Void)
			assert ("Title", check_title (a_node, "Tales of Grandpa Cat"))
		end

	test_descendant_and_attribute_axes is
			-- Test CAT attribute of descendant axis
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_node: XM_XPATH_NODE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("descendant::ITEM[attribute::CAT = 'X']")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_node ?= evaluated_items.item (1)
			assert ("Node not void", a_node /= Void)
			assert ("Title", check_title (a_node, "Patterns of Crime in Animal Culture"))
		end

	test_child_of_child is
			-- Test for BOOKLIST children that have a BOOKS child
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_node: XM_XPATH_NODE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("child::BOOKLIST[BOOKS]")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_node ?= evaluated_items.item (1)
			assert ("Node not void", a_node /= Void)
		end

	test_integers_divisible_by_5 is
			-- Test for integers divisible by 5
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("(1 to 100)[. mod 5 eq 0]")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Twenty evaluated_items", evaluated_items /= Void and then evaluated_items.count = 20)
			an_integer_value ?= evaluated_items.item (19)
			assert ("Ninteenth number is 95", an_integer_value /= Void and then an_integer_value.value = 95)
		end

	test_fifth_integer_in_sequence is
			-- Test for fifth integer in a sequence
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("(21 to 29)[5]")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Fifth number is 25", an_integer_value /= Void and then an_integer_value.value = 25)
		end

	test_value_comparison is
			-- Test a value comparison
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("BOOKLIST/BOOKS/ITEM[4]/AUTHOR eq 'Bonner'")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_general_comparison is
			-- Test a general comparison
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM/AUTHOR = 'Bonner'")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_node_comparison is
			-- Test a node comparison
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[child::AUTHOR = 'Milne, A. A.'] is //ITEM[child::TITLE = 'When We Were Very Young']")
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	-- Eventually, all errors should be tested here

	-- We can't test for XP0002 with the stand-alone evaluator, because it is proof against it. (NO - not if we can put the current iterator into error, or before )

	test_for_error_xp0003 is
			-- Syntax error
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//[position() = ()]")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
			assert ("XP0003", an_evaluator.error_value.type = Static_error and an_evaluator.error_value.code = 3)

		end

	test_for_error_xp0004 is
			-- Type error during static analysis
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/%"fred%"")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
			assert ("XP0004", an_evaluator.error_value.type = Type_error and an_evaluator.error_value.code = 4)
		end

	test_for_error_xp0006 is
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_string_value.make ("seven")
			an_evaluator.static_context.declare_variable ("fred", a_string_value)
			an_evaluator.evaluate ("(1 to $fred)")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
		end

	test_for_error_xp0008 is
			-- Name not bound in static context
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//TITLE[position() = $fred]")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
			assert ("XP0008", an_evaluator.error_value.type = Static_error and an_evaluator.error_value.code = 8)
		end

	test_for_error_xp0017 is
			-- Function has wrong number of arguments
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//TITLE[position(1,2,3)]")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
			assert ("XP0017", an_evaluator.error_value.type = Static_error and an_evaluator.error_value.code = 17)
		end

	test_for_error_xp0020 is
			-- Context item for an axis expression is not a node
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("'fred'[child::title]")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
			assert ("XP0020", an_evaluator.error_value.type = Type_error and an_evaluator.error_value.code = 20)
		end

--	test_for_error_xp0021 is
--			-- Cast expression cannot be cast to correct type - this is probably a 4 or a 6, but Cast needs fixing anyway.
--		local
--			an_evaluator: XM_XPATH_EVALUATOR
--			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
--		do
--			create an_evaluator
--			an_evaluator.build_static_context ("./books.xml", False, False)
--			assert ("Build successfull", not an_evaluator.was_build_error)
--			an_evaluator.evaluate ("'fred' eq 'jim' cast as xs:date")
--			evaluated_items := an_evaluator.evaluated_items
--			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
--			print (an_evaluator.error_value.error_message); print ("%N")
--			assert ("XP0021", an_evaluator.error_value.type = Dynamic_error and an_evaluator.error_value.code = 21)
--		end

	test_for_error_xp0051 is
			-- Named type can't be found in the static context
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", False, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("'fred' eq 'jim' cast as xs:Date")
			assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
			assert ("XP0051", an_evaluator.error_value.type = Static_error and an_evaluator.error_value.code = 51)
		end

	set_up is
		do
			set_string_mode_mixed
		end

feature {NONE} -- Implementation

	check_title (a_node: XM_XPATH_NODE; a_title: STRING): BOOLEAN is
			-- Check `a_node' has a "TITLE" child whose text is `a_title'
		require
			node_not_void: a_node /= Void
			title_not_void: a_title /= Void
		local
			another_node: like a_node
		do
			another_node := a_node.first_child
			if another_node /= Void and then STRING_.same_string (another_node.node_name, "TITLE") then
				another_node := another_node.first_child
				if another_node /= Void then
					Result := STRING_.same_string (another_node.string_value, a_title)
				end
			end
		end

	diagnose_evaluation_error (an_evaluator: XM_XPATH_EVALUATOR) is
		-- Print error diagnosis to standard error stream.
		do
			std.error.put_string (an_evaluator.error_value.error_message)
			std.error.put_string (", error code is ")
			std.error.put_string (an_evaluator.error_value.code.out)
			std.error.put_new_line
		end

end

			
