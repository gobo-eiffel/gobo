indexing

	description:

		"Eiffel object-test finders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST_FINDER

inherit

	ET_AST_ITERATOR
		redefine
			process_object_test
		end

create

	make

feature -- Access

	object_tests: ET_OBJECT_TEST_LIST
			-- Object-tests found so far

feature -- Basic operations

	find_object_tests (a_ast_node: ET_AST_NODE; a_object_tests: ET_OBJECT_TEST_LIST) is
			-- Find all object-tests in `a_ast_node' and recursively its sub-nodes,
			-- and make them available in `a_object_tests'.
		require
			a_ast_node_not_void: a_ast_node /= Void
			a_object_tests_not_void: a_object_tests /= Void
		local
			old_object_tests: ET_OBJECT_TEST_LIST
		do
			old_object_tests := object_tests
			object_tests := a_object_tests
			a_ast_node.process (Current)
			object_tests := old_object_tests
		end

feature {ET_AST_NODE} -- Processing

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			if object_tests /= Void then
				object_tests.force_last (an_expression)
			end
			an_expression.expression.process (Current)
		end

end
