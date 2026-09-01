note

	description:

		"Finders of features called by a given feature"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_FEATURE_CALLEE_FINDER

inherit

	ET_CLASS_PROCESSOR
		redefine
			make
		end

	ET_AST_ITERATOR
		rename
			make as make_ast_processor
		redefine
			process_assigner,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_bang_instruction,
			process_bracket_expression,
			process_call_agent,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_do_function_inline_agent,
			process_do_procedure_inline_agent,
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_external_function_inline_agent,
			process_external_procedure_inline_agent,
			process_feature_address,
			process_general_qualified_feature_call_expression,
			process_general_qualified_feature_call_instruction,
			process_infix_expression,
			process_like_feature,
			process_object_equality_expression,
			process_once_function_inline_agent,
			process_once_procedure_inline_agent,
			process_parenthesis_expression,
			process_parenthesis_instruction,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_static_call_expression,
			process_static_call_instruction,
			process_unqualified_call_expression,
			process_unqualified_call_instruction
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new feature callee finder.
		do
			precursor (a_system_processor)
			current_class := tokens.unknown_class
			current_closure := tokens.unknown_feature
			current_closure_impl := tokens.unknown_feature
			current_class_impl := tokens.unknown_class
			create expression_type_finder.make (a_system_processor)
			create internal_type_context.make_with_capacity (current_class, 100)
		end

feature -- Basic operations

	find_callees (a_caller_closure: ET_STANDALONE_CLOSURE)
			-- Find features called by `a_caller_closure'.
		require
			a_caller_closure_not_void: a_caller_closure /= Void
		local
			l_class_impl: like current_class
			l_closure_impl: ET_STANDALONE_CLOSURE
		do
			l_closure_impl := a_caller_closure.implementation_feature
			l_class_impl := l_closure_impl.implementation_class
			find_callees_in_ast_node (l_closure_impl, l_closure_impl, l_closure_impl, l_class_impl, l_class_impl)
		end

	find_callees_in_ast_node (a_ast_node: ET_AST_NODE; a_closure_impl, a_closure: ET_CLOSURE; a_class_impl, a_class: ET_CLASS)
			-- Find features called in `a_ast_node' which is written in `a_closure_impl`
			-- in `a_class_impl` and viewed from `a_closure` in `a_class`.
		require
			a_ast_node_not_void: a_ast_node /= Void
			a_closure_impl_not_void: a_closure_impl /= Void
			a_closure_not_void: a_closure /= Void
			a_class_impl_not_void: a_class_impl /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_closure: like current_closure
			l_old_class: like current_class
			l_old_closure_impl: like current_closure_impl
			l_old_class_impl: like current_class_impl
		do
			l_old_closure := current_closure
			current_closure := a_closure
			l_old_class := current_class
			current_class := a_class
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_closure_impl
			l_old_class_impl := current_class_impl
			current_class_impl := a_class_impl
			a_ast_node.process (Current)
			current_closure := l_old_closure
			current_class := l_old_class
			current_closure_impl := l_old_closure_impl
			current_class_impl := l_old_class_impl
		end

	report_callee (a_call_name: ET_CALL_NAME; a_callee_class: ET_CLASS)
			-- Report that feature `a_call_name' from `a_callee_class'
			-- is called in a closure from `current_class'.
		require
			a_call_name_not_void: a_call_name /= Void
			a_callee_class_not_void: a_callee_class /= Void
		do
		end

feature {ET_AST_NODE} -- Processing

	process_assigner (a_assigner: ET_ASSIGNER)
			-- Process `a_assigner'.
		local
			l_feature_name: ET_FEATURE_NAME
		do
			l_feature_name := a_assigner.feature_name
			report_callee (l_feature_name, current_class)
			precursor (a_assigner)
		end

	process_assigner_instruction (a_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_call_name: ET_IDENTIFIER
			l_old_call_name: ET_CALL_NAME
			l_position: ET_POSITION
		do
			l_old_call_name := a_instruction.name
			if not (attached {ET_IDENTIFIER} l_old_call_name as l_label and then l_label.is_tuple_label) then
				create l_call_name.make (a_instruction.assign_symbol.text)
				l_call_name.set_seed (l_old_call_name.seed)
				l_call_name.set_feature_name (True)
				l_position := a_instruction.assign_symbol.first_position
				l_call_name.set_position (l_position.line, l_position.column)
				a_instruction.set_name (l_call_name)
				process_qualified_feature_call (a_instruction)
				a_instruction.set_name (l_old_call_name)
			end
			precursor (a_instruction)
		end

	process_assignment (a_instruction: ET_ASSIGNMENT)
			-- Process `a_instruction'.
		do
			if attached {ET_IDENTIFIER} a_instruction.target as l_identifier and then l_identifier.is_feature_name then
				report_callee (l_identifier, current_class)
			end
			precursor (a_instruction)
		end

	process_assignment_attempt (a_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `a_instruction'.
		do
			if attached {ET_IDENTIFIER} a_instruction.target as l_identifier and then l_identifier.is_feature_name then
				report_callee (l_identifier, current_class)
			end
			precursor (a_instruction)
		end

	process_bang_instruction (a_instruction: ET_BANG_INSTRUCTION)
			-- Process `a_instruction`.
		do
			process_creation_instruction (a_instruction)
			precursor (a_instruction)
		end

	process_bracket_expression (a_expression: ET_BRACKET_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_call_agent (a_expression: ET_CALL_AGENT)
			-- Process `a_expression'.
		local
			l_name: ET_FEATURE_NAME
			l_target: ET_AGENT_TARGET
			l_class: ET_CLASS
		do
			l_name := a_expression.name
			l_target := a_expression.target
			internal_type_context.reset (current_class)
			if attached {ET_AGENT_OPEN_TARGET} l_target as l_open_target then
				internal_type_context.put_last (l_open_target.type)
			elseif attached {ET_EXPRESSION} l_target as l_expression_target then
				expression_type_finder.find_expression_type_in_closure (l_expression_target, current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
			end
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_callee (l_name, l_class)
			precursor (a_expression)
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_creation_expression (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_qualified_feature_call (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_create_expression (a_expression: ET_CREATE_EXPRESSION)
			-- Process `a_expression`.
		do
			process_creation_expression (a_expression)
			precursor (a_expression)
		end

	process_create_instruction (a_instruction: ET_CREATE_INSTRUCTION)
			-- Process `a_instruction`.
		do
			process_creation_instruction (a_instruction)
			precursor (a_instruction)
		end

	process_creation_expression (a_expression: ET_CREATION_EXPRESSION)
			-- Process `a_expression`.
		require
			a_expression_not_void: a_expression /= Void
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
		do
			l_name := a_expression.name
			internal_type_context.reset (current_class)
			internal_type_context.put_last (a_expression.type)
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_callee (l_name, l_class)
		end

	process_creation_instruction (a_instruction: ET_CREATION_INSTRUCTION)
			-- Process `a_instruction`.
		require
			a_instruction_not_void: a_instruction /= Void
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
			l_target: ET_WRITABLE
		do
			l_name := a_instruction.name
			l_target := a_instruction.target
			internal_type_context.reset (current_class)
			if attached a_instruction.type as l_type then
				internal_type_context.put_last (l_type)
			else
				expression_type_finder.find_expression_type_in_closure (l_target, current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
			end
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_callee (l_name, l_class)
			if attached {ET_IDENTIFIER} l_target as l_identifier and then l_identifier.is_feature_name then
				report_callee (l_identifier, current_class)
			end
		end

	process_do_function_inline_agent (a_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := a_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_expression.implementation_closure
			precursor (a_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_do_procedure_inline_agent (a_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := a_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_expression.implementation_closure
			precursor (a_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_creation_expression (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_qualified_feature_call (a_convert_expression)
			precursor (a_convert_expression)
		end

	process_external_function_inline_agent (a_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := a_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_expression.implementation_closure
			precursor (a_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end


	process_external_procedure_inline_agent (a_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := a_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_expression.implementation_closure
			precursor (a_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_feature_address (a_expression: ET_FEATURE_ADDRESS)
			-- Process `a_expression'.
		local
			l_name: ET_FEATURE_NAME
		do
			l_name := a_expression.name
			report_callee (l_name, current_class)
			precursor (a_expression)
		end

	process_general_qualified_feature_call_expression (a_expression: ET_GENERAL_QUALIFIED_FEATURE_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_general_qualified_feature_call_instruction (a_instruction: ET_GENERAL_QUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
			precursor (a_instruction)
		end

	process_infix_expression (a_expression: ET_INFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		local
			l_name: ET_FEATURE_NAME
		do
			l_name := a_type.name
			report_callee (l_name, current_class)
			precursor (a_type)
		end

	process_object_equality_expression (a_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_once_function_inline_agent (a_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := a_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_expression.implementation_closure
			precursor (a_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_once_procedure_inline_agent (a_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		local
			l_old_closure: like current_closure
			l_old_closure_impl: like current_closure_impl
		do
			l_old_closure := current_closure
			current_closure := a_expression
			l_old_closure_impl := current_closure_impl
			current_closure_impl := a_expression.implementation_closure
			precursor (a_expression)
			current_closure := l_old_closure
			current_closure_impl := l_old_closure_impl
		end

	process_parenthesis_expression (a_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_parenthesis_instruction (a_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
			precursor (a_instruction)
		end

	process_precursor_call (a_call: ET_PRECURSOR_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_PRECURSOR_KEYWORD
		do
			l_name := a_call.precursor_keyword
			if attached a_call.parent_type as l_parent_type then
				report_callee (l_name, l_parent_type.base_class)
			end
		end

	process_precursor_expression (a_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_expression)
			end
			precursor (a_expression)
		end

	process_precursor_instruction (a_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_instruction)
			end
			precursor (a_instruction)
		end

	process_prefix_expression (a_expression: ET_PREFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
			precursor (a_expression)
		end

	process_qualified_call_expression (a_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_expression)
			end
			precursor (a_expression)
		end

	process_qualified_call_instruction (a_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_instruction)
			end
			precursor (a_instruction)
		end

	process_qualified_feature_call (a_call: ET_QUALIFIED_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_class: ET_CLASS
		do
			l_name := a_call.name
			if not (attached {ET_IDENTIFIER} l_name as l_label and then l_label.is_tuple_label) then
				internal_type_context.reset (current_class)
				expression_type_finder.find_expression_type_in_closure (a_call.target, current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
				report_callee (l_name, l_class)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
			precursor (a_type)
		end

	process_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
		do
			l_name := a_type.name
			internal_type_context.reset (current_class)
			internal_type_context.put_last (a_type.target_type)
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_callee (l_name, l_class)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
			precursor (a_type)
		end

	process_static_call_expression (a_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if a_expression.is_once_creation_call then
				process_creation_expression (a_expression)
			elseif attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_expression)
			end
			precursor (a_expression)
		end

	process_static_call_instruction (a_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_instruction)
			end
			precursor (a_instruction)
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_name: ET_CALL_NAME
			l_class: ET_CLASS
		do
			l_name := a_call.name
			internal_type_context.reset (current_class)
			internal_type_context.put_last (a_call.type)
			l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_name.seed).base_class
			report_callee (l_name, l_class)
		end

	process_unqualified_call_expression (a_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				report_callee (a_expression.name, current_class)
			end
			precursor (a_expression)
		end

	process_unqualified_call_instruction (a_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				report_callee (a_instruction.name, current_class)
			end
			precursor (a_instruction)
		end

feature {NONE} -- Implementation

	current_closure: ET_CLOSURE
			-- Closure (feature, invariant, inline agent)
			-- being processed

	current_closure_impl: ET_CLOSURE
			-- Inner closure where the code being processed has been written
			--
			-- It might be different from `current_closure' or even from
			-- `current_closure.implementation_closure' when
			-- processing inherited assertions. For example:
			--
			--    deferred class A
			--    feature
			--       f (a: ANY)
			--           require
			--               pre: g (a)
			--           deferred
			--           end
			--      g (a: ANY): BOOLEAN deferred end
			--    end
			--    class B
			--    inherit
			--        A
			--    feature
			--        f (a: STRING) do ... end
			--        g (a: STRING): BOOLEAN do ... end
			--    end
			--
			-- When processing the inherited precondition 'pre' in B.f,
			-- `current_closure' is B.f and `current_closure_impl' is A.f
			-- (where the inherited precondition has been written).

	current_class_impl: ET_CLASS
			-- Class where `current_closure_impl' has been written

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

	internal_type_context: ET_NESTED_TYPE_CONTEXT
			-- Type context to be used internally

invariant

	current_closure_not_void: current_closure /= Void
	current_closure_impl_not_void: current_closure_impl /= Void
	current_class_impl_not_void: current_class_impl /= Void
	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void

end
