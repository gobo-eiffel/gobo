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
			-- Test against an external XML file.
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

	-- Eventually, all errors should be tested here

	-- We can't test for XP0002 with the stand-alone evaluator, because it is proof against it. (??? - really - ALL parts - think about it!)

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

	
--	test_for_error_xp0006 is
--				-- Value doesn't match required type.
--			local
--				an_evaluator: XM_XPATH_EVALUATOR
--				a_string_value: XM_XPATH_STRING_VALUE
--			do
--				create an_evaluator
--				an_evaluator.build_static_context ("./books.xml", False, False)
--				create a_string_value.make ("fred")
--				an_evaluator.static_context.declare_variable ("node", a_string_value)
--				assert ("Build successful", not an_evaluator.was_build_error)
--				an_evaluator.evaluate ("some $part in //TITLE satisfies $part/@discounted")
--				assert ("Evaluation error", an_evaluator.is_evaluation_in_error)
--				print (an_evaluator.error_value.error_message); print ("%N")
--				print (an_evaluator.error_value.code.out)
--				assert ("XP0006", an_evaluator.error_value.type = Static_error and an_evaluator.error_value.code = 6)
--			end

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

--			print (an_evaluator.error_value.error_message); print ("%N")
--			print (an_evaluator.error_value.code.out)


	set_up is
		do
			set_string_mode_mixed
		end

end

			
