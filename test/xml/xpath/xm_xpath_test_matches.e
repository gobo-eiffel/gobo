indexing

	description:

		"Test XPath matches() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_MATCHES

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

	test_matches_one is
			-- Test fn:matches("abracadabra", "bra") returns true.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches('abracadabra', 'bra')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Matches", a_boolean_value.value)
		end

	test_matches_two is
			-- Test fn:matches("abracadabra", "^a.*a$") returns true.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches('abracadabra', '^a.*a$')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Matches", a_boolean_value.value)
		end

	test_matches_three is
			-- Test fn:matches("abracadabra", "^bra") returns false.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/books.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches('abracadabra', '^bra')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Doesnt match", not a_boolean_value.value)
		end

	test_matches_four is
			-- Test fn:matches(., "Kaum.*krähen") returns false when applied to poem.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/poem.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches(/*[1], 'Kaum.*krähen')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Doesnt match", not a_boolean_value.value)
		end

	test_matches_five is
			-- Test fn:matches(., "Kaum.*krähen", "s") returns true when applied to poem.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/poem.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches(/*[1], 'Kaum.*krähen', 's')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Matches", a_boolean_value.value)
		end

	test_matches_six is
			-- Test fn:matches(., "^Kaum.*gesehen,$", "m") returns true when applied to poem.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_unicode
			an_evaluator.build_static_context ("./data/poem.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches(/*[1], '^Kaum.*gesehen,', 'm')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Matches", a_boolean_value.value)
		end


	test_matches_seven is
			-- Test fn:matches(., "^Kaum.*gesehen,$") returns false when applied to poem.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/poem.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches(/*[1], '^Kaum.*gesehen,$')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Doesnt match", not a_boolean_value.value)
		end
	
	test_matches_eight is
			-- Test fn:matches(., "kiki", "i") returns true when applied to poem.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_boolean_value: XM_XPATH_BOOLEAN_VALUE
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_mixed
			an_evaluator.build_static_context ("./data/poem.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("matches(/*[1], 'kiki', 'i')")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_boolean_value ?= evaluated_items.item (1)
			assert ("Boolean value", a_boolean_value /= Void)
			assert ("Matches", a_boolean_value.value)
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
