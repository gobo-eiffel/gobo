indexing

	description:

		"Test XPath index-of() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_INDEX_OF

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

	test_index_of_one is
			-- Test fn:index-of ((10, 20, 30, 40), 35) returns ().
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
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
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of ((10, 20, 30, 30, 20, 10), 20)")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two items", evaluated_items /= Void and then evaluated_items.count = 2)
			an_integer_value ?= evaluated_items.item (1)
			assert ("First position is 2", an_integer_value /= Void and then an_integer_value.value.is_integer and then an_integer_value.value.to_integer = 2)
			an_integer_value ?= evaluated_items.item (2)
			assert ("Second position is 5", an_integer_value /= Void and then an_integer_value.value.is_integer and then an_integer_value.value.to_integer = 5)
		end

	test_index_of_three is
			-- Test fn:index-of (("a", "sport", "and", "a", "pastime"), "a") returns (1, 4).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("index-of (('a', 'sport', 'and', 'a', 'pastime'), 'a')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("Two items", evaluated_items /= Void and then evaluated_items.count = 2)
			an_integer_value ?= evaluated_items.item (1)
			assert ("First position is 1", an_integer_value /= Void and then an_integer_value.value.is_integer and then an_integer_value.value.to_integer = 1)
			an_integer_value ?= evaluated_items.item (2)
			assert ("Second position is 4", an_integer_value /= Void and then an_integer_value.value.is_integer and then an_integer_value.value.to_integer = 4)
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
