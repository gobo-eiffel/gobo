indexing

	description:

		"Test XPath root() function."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEST_ROOT

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

	test_root_one is
			-- Test root().
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_document: XM_XPATH_DOCUMENT
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("/*/para[1]/root()")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_document ?= evaluated_items.item (1)
			assert ("Document", a_document /= Void)
			assert ("Same node", a_document = an_evaluator.document)
		end

	test_root_two is
			-- Test root(on-a-node).
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
			a_document: XM_XPATH_DOCUMENT
		do
			create an_evaluator.make (18, False)
			an_evaluator.set_string_mode_ascii
			an_evaluator.build_static_context ("./data/languages.xml", False, False, False, True)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("root(*/para[1])")
			assert ("No evaluation error", not an_evaluator.is_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated item", evaluated_items /= Void and then evaluated_items.count = 1)
			a_document ?= evaluated_items.item (1)
			assert ("Document", a_document /= Void)
			assert ("Same node", a_document = an_evaluator.document)
		end

	set_up is
		do
			conformance.set_basic_xslt_processor
		end

end

			
