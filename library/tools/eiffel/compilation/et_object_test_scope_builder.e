note

	description:

		"Eiffel object-test scope builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST_SCOPE_BUILDER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			process_infix_expression,
			process_named_object_test,
			process_old_object_test,
			process_parenthesized_expression,
			process_prefix_expression
		end

create

	make

feature -- Status report

	is_negated: BOOLEAN
			-- Look for object-tests which are guaranteed to be
			-- successful is the expression in which they appear
			-- is evaluated to False?

feature -- Access

	scope: ET_OBJECT_TEST_SCOPE
			-- Scope being built

feature -- Basic operations

	build_scope (a_expression: ET_EXPRESSION; a_scope: ET_OBJECT_TEST_SCOPE) is
			-- Add to `a_scope' the object-tests found in `a_expression'
			-- that are guaranteed to be successful if `a_expression'
			-- is evaluated to True.
		require
			a_expression_not_void: a_expression /= Void
		local
			old_negated: BOOLEAN
			old_scope: like scope
		do
			old_scope := scope
			scope := a_scope
			old_negated := is_negated
			is_negated := False
			a_expression.process (Current)
			is_negated := old_negated
			scope := old_scope
		end

	build_negated_scope (a_expression: ET_EXPRESSION; a_scope: ET_OBJECT_TEST_SCOPE) is
			-- Add to `a_scope' the object-tests found in `a_expression'
			-- that are guaranteed to be successful if `a_expression'
			-- is evaluated to False.
		require
			a_expression_not_void: a_expression /= Void
		local
			old_negated: BOOLEAN
			old_scope: like scope
		do
			old_scope := scope
			scope := a_scope
			old_negated := is_negated
			is_negated := True
			a_expression.process (Current)
			is_negated := old_negated
			scope := old_scope
		end

feature {ET_AST_NODE} -- Processing

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		local
			l_name: ET_OPERATOR
		do
			if an_expression.is_boolean_operator then
				l_name := an_expression.name
				if is_negated then
					if l_name.is_infix_or or l_name.is_infix_or_else then
						an_expression.left.process (Current)
						an_expression.right.process (Current)
					elseif l_name.is_infix_implies then
							-- a implies b  <=>  not a or else b
						is_negated := not is_negated
						an_expression.left.process (Current)
						is_negated := not is_negated
						an_expression.right.process (Current)
					end
				else
					if l_name.is_infix_and or l_name.is_infix_and_then then
						an_expression.left.process (Current)
						an_expression.right.process (Current)
					end
				end
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			if not is_negated then
				if scope /= Void then
						-- Note that object-test local scope intersection (i.e.
						-- two object-tests with the same local name and whose
						-- scopes can overlap) is already taken care of with the
						-- validity rule VUOT-1.
					scope.add_object_test (an_expression)
				end
			end
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			process_named_object_test (an_expression)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if an_expression.is_boolean_operator then
				if an_expression.name.is_prefix_not then
					is_negated := not is_negated
					an_expression.expression.process (Current)
					is_negated := not is_negated
				end
			end
		end

end
