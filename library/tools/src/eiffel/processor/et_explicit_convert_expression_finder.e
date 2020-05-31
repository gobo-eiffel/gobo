note

	description:

		"Eiffel explicit convert expression finders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EXPLICIT_CONVERT_EXPRESSION_FINDER

inherit

	ET_AST_ITERATOR
		redefine
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression
		end

create

	make

feature -- Access

	explicit_convert_expressions: detachable DS_ARRAYED_LIST [ET_EXPLICIT_CONVERT_EXPRESSION]
			-- Explicit convert expressions found so far

feature -- Basic operations

	find_explicit_convert_expressions (a_ast_node: ET_AST_NODE; a_explicit_convert_expressions: DS_ARRAYED_LIST [ET_EXPLICIT_CONVERT_EXPRESSION])
			-- Find all explicit convert expressions in `a_ast_node' and recursively its sub-nodes,
			-- and make them available in `a_explicit_convert_expressions'.
		require
			a_ast_node_not_void: a_ast_node /= Void
			a_explicit_convert_expressions_not_void: a_explicit_convert_expressions /= Void
		local
			old_explicit_convert_expressions: like explicit_convert_expressions
		do
			old_explicit_convert_expressions := explicit_convert_expressions
			explicit_convert_expressions := a_explicit_convert_expressions
			a_ast_node.process (Current)
			explicit_convert_expressions := old_explicit_convert_expressions
		end

feature {ET_AST_NODE} -- Processing

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			if attached explicit_convert_expressions as l_explicit_convert_expressions then
				l_explicit_convert_expressions.force_last (a_convert_expression)
			end
			a_convert_expression.expression.process (Current)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			if attached explicit_convert_expressions as l_explicit_convert_expressions then
				l_explicit_convert_expressions.force_last (a_convert_expression)
			end
			a_convert_expression.expression.process (Current)
		end

end
