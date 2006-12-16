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

	XM_XPATH_SHARED_CONFORMANCE

	KL_IMPORTED_STRING_ROUTINES

	KL_SHARED_STANDARD_FILES

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end
	
	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end
		
feature -- Test

	test_against_xml_file is
			-- Test against an external XML file.
			--  (checks various parts of expression syntax)
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("BOOKLIST//ITEM[child::TITLE = 'When We Were Very Young']/attribute::CAT") -- should evaluate to "F"
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
		end

	-- The following tests are of examples from the draft standard
	
	test_second_child_filter is
			-- Test second ITEM child of BOOKS node.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_node: XM_XPATH_NODE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/BOOKLIST/BOOKS/child::ITEM[2]")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_node ?= evaluated_items.item (1)
			assert ("Node not void", a_node /= Void)
			assert ("Title", check_title (a_node, "Tales of Grandpa Cat"))
		end

	test_descendant_and_attribute_axes is
			-- Test CAT attribute of descendant axis.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_node: XM_XPATH_NODE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("descendant::ITEM[attribute::CAT = 'X']")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_node ?= evaluated_items.item (1)
			assert ("Node not void", a_node /= Void)
			assert ("Title", check_title (a_node, "Patterns of Crime in Animal Culture"))
		end

	test_child_of_child is
			-- Test for BOOKLIST children that have a BOOKS child.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_node: XM_XPATH_NODE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("child::BOOKLIST[BOOKS]")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_node ?= evaluated_items.item (1)
			assert ("Node not void", a_node /= Void)
		end

	test_integers_divisible_by_5 is
			-- Test for integers divisible by 5.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("(1 to 100)[. mod 5 eq 0]")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Twenty evaluated items", evaluated_items /= Void and then evaluated_items.count = 20)
			an_integer_value ?= evaluated_items.item (19)
			assert ("Ninteenth number is 95", an_integer_value /= Void and then an_integer_value.as_integer = 95)
		end

	test_fifth_integer_in_sequence is
			-- Test for fifth integer in a sequence.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("(21 to 29)[5]")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			an_integer_value ?= evaluated_items.item (1)
			assert ("Fifth number is 25", an_integer_value /= Void and then an_integer_value.as_integer = 25)
		end

	test_value_comparison is
			-- Test a value comparison.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("BOOKLIST/BOOKS/ITEM[4]/AUTHOR eq 'Bonner'")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_general_comparison is
			-- Test a general comparison.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM/AUTHOR = 'Bonner'")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_node_comparison is
			-- Test a node comparison.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[child::AUTHOR = 'Milne, A. A.'] is //ITEM[child::TITLE = 'When We Were Very Young']")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end
	
	test_node_precedes is
			-- Test one node precedes another.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[child::AUTHOR = 'Milne, A. A.'] << /BOOKLIST/CATEGORIES")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_node_follows is
			-- Test one node follows another.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[child::AUTHOR = 'Milne, A. A.'] >> /BOOKLIST/CATEGORIES")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = False)
		end

	test_logical_and is
			-- Test logical and.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("1 eq 1 and 2 eq 2")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_logical_and_two is
			-- Test logical and.
			-- Dynamic error will be raised owing to static analysis.
			-- No. Returning false() is allowed, and now it does that
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("1 eq 2 and 3 idiv 0 = 1")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean false", a_boolean_value /= Void and then a_boolean_value.value = False)
		end

	test_logical_or is
			-- Test logical or.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("1 eq 1 or 2 eq 3")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_logical_or_two is
			-- Test logical or.
			-- Dynamic error will be raised owing to static analysis.
			-- No. Returning true() is allowed, and now it does that
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("1 eq 1 or 3 idiv 0 = 1")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)			
		end

	test_logical_and_three is
			-- Test logical and in error.
		local
			an_evaluator: XM_XPATH_EVALUATOR
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("1 eq 1 and 3 idiv 0 = 1")
			assert ("Evaluation error", an_evaluator.is_error)
		end

	test_for_expression is
			-- Test for expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("for $i in //* return name($i)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Fifty-one evaluated items", evaluated_items /= Void and then evaluated_items.count = 51)			
		end
	
	test_nested_for_expression is
			-- Test nested for expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("for $i in (10, 20), $j in (1, 2) return ($i + $j)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Four evaluated items", evaluated_items /= Void and then evaluated_items.count = 4)			
		end

	test_union_expression is
			-- Test union expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[AUTHOR = 'Bonner'] union //ITEM[@CAT = 'S']")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Four evaluated items", evaluated_items /= Void and then evaluated_items.count = 4)			
		end
	
	test_intersection_expression is
			-- Test union expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[AUTHOR = 'Bonner'] intersect //ITEM[@CAT = 'S']")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)			
		end

	test_difference_expression is
			-- Test union expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM except //ITEM[@CAT = 'S']")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Five evaluated items", evaluated_items /= Void and then evaluated_items.count = 5)			
		end
	
	test_conditional_expression is
			-- Test union expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//ITEM[if ( @CAT eq 'S' ) then true() else false() ]")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Three evaluated items", evaluated_items /= Void and then evaluated_items.count = 3)			
		end
	
	test_every is
			-- Test every - quantified expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("every $item in //ITEM satisfies $item/@CAT")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)			
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end
	
	
	test_every_false is
			-- Test every - quantified expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("every $item in //ITEM satisfies $item/@CAT eq 'X'")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)			
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean false", a_boolean_value /= Void and then a_boolean_value.value = False)
		end
	
	test_some is
			-- Test some - quantified expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("some $item in //ITEM satisfies $item/@CAT eq 'F'")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)			
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end
	
	test_some_false is
			-- Test some - quantified expression
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("some $item in //ITEM satisfies $item/@CAT eq 'G'")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)			
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean false", a_boolean_value /= Void and then a_boolean_value.value = False)
		end	
	
	test_instance_of is
			-- Test instance of
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("5 instance of xs:integer")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end	


	test_minimax_comparison is
			-- Test a minimax comparison.;
			-- N.B. It is advisable to turn on the debug key "XPath evaluator" to check that this is correctly optimised.
			-- Even then, you will need to insert debugging statements into the minimax analyze routine to check it is being called.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create an_integer_value.make_from_integer (7)
			an_evaluator.static_context.declare_variable ("fred", an_integer_value)
			an_evaluator.evaluate ("(8, ($fred - 1), 9) < (8, ($fred - 2), 4)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean true", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	test_atomic_values_in_path_expression is
			-- Final step of path expression is a value-sequence.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//TITLE/(string(.), 'fred', 2.01, 2.01e3, 7)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Five evaluated items", evaluated_items /= Void and then evaluated_items.count = 40)
		end

	test_zero_is_false is
			-- Test zero evaluates to boolean false.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("boolean(0)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean false", a_boolean_value /= Void and then a_boolean_value.value = False)
		end

	test_one_is_true is
			-- Test one evaluates to boolean true.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("boolean(1)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean false", a_boolean_value /= Void and then a_boolean_value.value = True)
		end

	-- Eventually, all errors should be tested here

	-- We can't test for XPDY0002 with the stand-alone evaluator, because it is proof against it. (NO - not if we can put the current iterator into error, or before )

	test_for_error_xpst0003 is
			-- Syntax error
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//[position() = ()]")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPST0003", an_evaluator.error_value.type = Static_error and STRING_.same_string (an_evaluator.error_value.code, "XPST0003"))

		end

	test_for_error_xpty0004 is
		local
			an_evaluator: XM_XPATH_EVALUATOR
			a_string_value: XM_XPATH_STRING_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			create a_string_value.make ("seven")
			an_evaluator.static_context.declare_variable ("fred", a_string_value)
			an_evaluator.evaluate ("(1 to $fred)")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPTY0004", an_evaluator.error_value.type = Type_error and STRING_.same_string (an_evaluator.error_value.code, "XPTY0004"))
		end

	test_for_error_xpst0008 is
			-- Name not bound in static context
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//TITLE[position() = $fred]")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPST0008", an_evaluator.error_value.type = Static_error and STRING_.same_string (an_evaluator.error_value.code, "XPST0008"))
		end

	test_for_error_xpst0017 is
			-- Function has wrong number of arguments
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//TITLE[position(1,2,3)]")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPST0017", an_evaluator.error_value.type = Static_error and STRING_.same_string (an_evaluator.error_value.code, "XPST0017"))
		end

	test_for_error_xpty0018 is
			-- Final step is heterogeneous
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("//TITLE/(string(.), .)")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPTY0018", an_evaluator.error_value.type = Type_error and STRING_.same_string (an_evaluator.error_value.code, "XPTY0018"))
		end

	test_for_error_xpty0019 is
			-- Non-final step is not a node
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/%"fred%"/%"fred%"")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPTY0019", an_evaluator.error_value.type = Type_error and STRING_.same_string (an_evaluator.error_value.code, "XPTY0019"))
		end

	test_for_error_xpty0020 is
			-- Context item for an axis expression is not a node
		local
			an_evaluator: XM_XPATH_EVALUATOR			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("'fred'[child::title]")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPTY0020", an_evaluator.error_value.type = Type_error and STRING_.same_string (an_evaluator.error_value.code, "XPTY0020"))
		end

	test_for_error_xpst0051 is
			-- Named type can't be found in the static context
		local
			an_evaluator: XM_XPATH_EVALUATOR
			
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context (books_xml_uri.full_reference, False, False, True, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("'fred' eq 'jim' cast as xs:Date")
			assert ("Evaluation error", an_evaluator.is_error)
			assert ("XPST0051", an_evaluator.error_value.type = Static_error and STRING_.same_string (an_evaluator.error_value.code, "XPST0051"))
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

			
