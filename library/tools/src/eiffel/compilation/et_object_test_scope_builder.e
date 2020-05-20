note

	description:

		"Eiffel object-test scope builders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST_SCOPE_BUILDER

inherit

	ET_CLASS_SUBPROCESSOR

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
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
			-- successful if the expression in which they appear
			-- is evaluated to False?

feature -- Access

	scope: detachable ET_OBJECT_TEST_SCOPE
			-- Scope being built

feature -- Basic operations

	build_scope (a_expression: ET_EXPRESSION; a_scope: detachable ET_OBJECT_TEST_SCOPE; a_class: ET_CLASS)
			-- Add to `a_scope' the object-tests found in `a_expression', appearing in
			-- class `a_class', that are guaranteed to be successful if `a_expression'
			-- is evaluated to True.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_class_not_void: a_class /= Void
		local
			old_negated: BOOLEAN
			old_scope: like scope
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			old_scope := scope
			scope := a_scope
			old_negated := is_negated
			is_negated := False
			a_expression.process (Current)
			is_negated := old_negated
			current_class := old_class
			scope := old_scope
		end

	build_negated_scope (a_expression: ET_EXPRESSION; a_scope: detachable ET_OBJECT_TEST_SCOPE; a_class: ET_CLASS)
			-- Add to `a_scope' the object-tests found in `a_expression', appearing in
			-- class `a_class', that are guaranteed to be successful if `a_expression'
			-- is evaluated to False.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_class_not_void: a_class /= Void
		local
			old_negated: BOOLEAN
			old_scope: like scope
			old_class: ET_CLASS
		do
			has_fatal_error := False
			old_class := current_class
			current_class := a_class
			old_scope := scope
			scope := a_scope
			old_negated := is_negated
			is_negated := True
			a_expression.process (Current)
			is_negated := old_negated
			current_class := a_class
			scope := old_scope
		end

feature {ET_AST_NODE} -- Processing

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
			if not is_negated then
				if attached scope as l_scope then
					if attached l_scope.object_test (an_expression.name) as l_other_object_test then
							-- Two object-tests with the same local name appear in the same
							-- expression in such a way that their scope will overlap.
							-- For example:
							--
							--   if attached exp1 as x and attached exp2 as x then
							--      x.do_something
							--   end
						set_fatal_error
						error_handler.report_vuot1f_error (current_class, an_expression, l_other_object_test)
					else
						l_scope.add_object_test (an_expression)
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
