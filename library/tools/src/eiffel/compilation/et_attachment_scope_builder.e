note

	description:

		"Eiffel attachment scope builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2011-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ATTACHMENT_SCOPE_BUILDER

inherit

	ET_AST_NULL_PROCESSOR
		redefine
			process_equality_expression,
			process_infix_expression,
			process_named_object_test,
			process_object_test,
			process_old_object_test,
			process_parenthesized_expression,
			process_prefix_expression
		end

create

	make

feature -- Status report

	is_negated: BOOLEAN
			-- Look for entities which are guaranteed to be
			-- attached if the expression in which they appear
			-- is evaluated to False?

feature -- Access

	scope: detachable ET_ATTACHMENT_SCOPE
			-- Scope being built

feature -- Basic operations

	build_scope (a_expression: ET_EXPRESSION; a_scope: ET_ATTACHMENT_SCOPE)
			-- Add to `a_scope' the entities found in `a_expression'
			-- that are guaranteed to be attached if `a_expression'
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

	build_negated_scope (a_expression: ET_EXPRESSION; a_scope: ET_ATTACHMENT_SCOPE)
			-- Add to `a_scope' the entities found in `a_expression'
			-- that are guaranteed to be attached if `a_expression'
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

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		local
			l_left: ET_EXPRESSION
			l_right: ET_EXPRESSION
		do
			if is_negated = an_expression.operator.is_equal_symbol then
				l_left := an_expression.left.unparenthesized_expression
				l_right := an_expression.right.unparenthesized_expression
				if attached {ET_VOID} l_right then
					if attached {ET_RESULT} l_left then
						if attached scope as l_scope then
							l_scope.add_result
						end
					elseif attached {ET_IDENTIFIER} l_left as l_identifier then
						if attached scope as l_scope then
							l_scope.add_name (l_identifier)
						end
					elseif attached {ET_UNQUALIFIED_CALL_EXPRESSION} l_left as l_unqualified_call then
						if l_unqualified_call.arguments = Void and then l_unqualified_call.parenthesis_call = Void and then attached {ET_IDENTIFIER} l_unqualified_call.name as l_identifier then
								-- This might be a stable attribute.
							if attached scope as l_scope then
								l_scope.add_name (l_identifier)
							end
						end
					end
				elseif attached {ET_VOID} l_left then
					if attached {ET_RESULT} l_right then
						if attached scope as l_scope then
							l_scope.add_result
						end
					elseif attached {ET_IDENTIFIER} l_right as l_identifier then
						if attached scope as l_scope then
							l_scope.add_name (l_identifier)
						end
					elseif attached {ET_UNQUALIFIED_CALL_EXPRESSION} l_left as l_unqualified_call then
							-- This might be a stable attribute.
						if l_unqualified_call.arguments = Void and then l_unqualified_call.parenthesis_call = Void and then attached {ET_IDENTIFIER} l_unqualified_call.name as l_identifier then
							if attached scope as l_scope then
								l_scope.add_name (l_identifier)
							end
						end
					end
				end
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		local
			l_name: ET_OPERATOR
		do
			if an_expression.is_boolean_operator then
				l_name := an_expression.name
				if is_negated then
					if l_name.is_infix_or or l_name.is_infix_or_else or l_name.is_infix_or_symbol or l_name.is_infix_or_else_symbol then
						an_expression.left.process (Current)
						an_expression.right.process (Current)
					elseif l_name.is_infix_implies or l_name.is_infix_implies_symbol then
							-- a implies b  <=>  not a or else b
						is_negated := not is_negated
						an_expression.left.process (Current)
						is_negated := not is_negated
						an_expression.right.process (Current)
					end
				else
					if l_name.is_infix_and or l_name.is_infix_and_then or l_name.is_infix_and_symbol or l_name.is_infix_and_then_symbol then
						an_expression.left.process (Current)
						an_expression.right.process (Current)
					end
				end
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		do
			process_object_test (an_expression)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_expression: ET_EXPRESSION
		do
			if not is_negated then
				l_expression := an_expression.expression.unparenthesized_expression
				if attached {ET_RESULT} l_expression then
					if attached scope as l_scope then
						l_scope.add_result
					end
				elseif attached {ET_IDENTIFIER} l_expression as l_identifier then
					if attached scope as l_scope then
						l_scope.add_name (l_identifier)
					end
				elseif attached {ET_UNQUALIFIED_CALL_EXPRESSION} l_expression as l_unqualified_call then
						-- This might be a stable attribute.
					if l_unqualified_call.arguments = Void and then l_unqualified_call.parenthesis_call = Void and then attached {ET_IDENTIFIER} l_unqualified_call.name as l_identifier then
						if attached scope as l_scope then
							l_scope.add_name (l_identifier)
						end
					end
				end
			end
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			process_named_object_test (an_expression)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			if an_expression.is_boolean_operator then
				if an_expression.name.is_prefix_not or an_expression.name.is_prefix_not_symbol then
					is_negated := not is_negated
					an_expression.expression.process (Current)
					is_negated := not is_negated
				end
			end
		end

end
