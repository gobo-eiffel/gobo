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

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES

feature

	test_against_xml_file is
			-- Test against an external XML file.
		local
			an_evaluator: XM_XPATH_EVALUATOR
			evaluated_items: DS_LINKED_LIST [XM_XPATH_ITEM]
		do
			create an_evaluator
			an_evaluator.build_static_context ("./books.xml", True, False)
			assert ("Build successfull", not an_evaluator.was_build_error)
			an_evaluator.evaluate ("BOOKLIST//ITEM[child::TITLE = 'When We Were Very Young']/attribute::CAT") -- should evaluate to "F"
			assert ("No evaluation error", not an_evaluator.is_evaluation_in_error)
			evaluated_items := an_evaluator.evaluated_items
			assert ("One evaluated_item", evaluated_items /= Void and then evaluated_items.count = 1)
		end

end

			
