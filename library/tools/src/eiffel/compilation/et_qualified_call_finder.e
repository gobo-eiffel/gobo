note

	description:

		"Finders of qualified calls in features and invariants"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_QUALIFIED_CALL_FINDER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		rename
			make as make_ast_processor
		redefine
			process_across_expression,
			process_across_instruction,
			process_agent_argument_operand_list,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_bang_instruction,
			process_bracket_expression,
			process_call_agent,
			process_check_instruction,
			process_choice_list,
			process_compound,
			process_convert_builtin_expression,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_debug_instruction,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_equality_expression,
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_expression_address,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_general_qualified_feature_call_expression,
			process_general_qualified_feature_call_instruction,
			process_if_expression,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inline_separate_argument,
			process_inline_separate_arguments,
			process_inline_separate_instruction,
			process_inspect_expression,
			process_inspect_instruction,
			process_loop_instruction,
			process_manifest_array,
			process_manifest_tuple,
			process_named_object_test,
			process_object_equality_expression,
			process_object_test,
			process_old_expression,
			process_old_object_test,
			process_once_function,
			process_once_function_inline_agent,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parenthesis_expression,
			process_parenthesis_instruction,
			process_parenthesized_expression,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_quantifier_expression,
			process_repeat_instruction,
			process_static_call_expression,
			process_static_call_instruction,
			process_unqualified_call_expression,
			process_unqualified_call_instruction
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new qualified call finder.
		do
			current_class_impl := tokens.unknown_class
			current_closure := tokens.unknown_feature
			current_closure_impl := tokens.unknown_feature
			create visited_features.make (200)
			create visited_qualified_features.make (20)
			create precursors.make (100)
			create expression_type_finder.make (a_system_processor)
			create internal_type_context.make_with_capacity (tokens.unknown_class, 100)
			precursor (a_system_processor)
		end

feature -- Basic operations

	find_qualified_call_in_feature (a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Check whether the feature `a_feature` from `a_class` contains qualified calls.
			-- Follow unqualified calls recursively, and traverse inherited pre- and postconditions.
			-- Make the result available in `has_qualified_call`.
			-- Note that when in doubt, or when it's two long to process,
			-- then set `has_qualified_call` to True.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			l_old_class: ET_CLASS
		do
			has_fatal_error := False
			l_old_class := current_class
			current_class := a_class
			has_qualified_call := False
			a_feature.process (Current)
			current_class := l_old_class
			visited_features.wipe_out
			visited_qualified_features.wipe_out
		end

	find_qualified_call_in_invariant (a_class: ET_CLASS)
			-- Check whether the invariant of `a_class` and its ancestors contains qualified calls.
			-- Follow unqualified calls recursively, and traverse inherited pre- and postconditions.
			-- Make the result available in `has_qualified_call`.
			-- Note that when in doubt, or when it's two long to process,
			-- then set `has_qualified_call` to True.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			l_old_class: ET_CLASS
		do
			has_fatal_error := False
			l_old_class := current_class
			current_class := a_class
			has_qualified_call := False
			process_all_invariants (a_class)
			current_class := l_old_class
			visited_features.wipe_out
			visited_qualified_features.wipe_out
		end

	find_qualified_call_in_feature_and_invariant (a_feature: ET_FEATURE; a_class: ET_CLASS)
			-- Check whether the feature `a_feature` from `a_class`, and the invariant
			-- of `a_class` and its ancestors, contain qualified calls.
			-- Follow unqualified calls recursively, and traverse inherited pre- and postconditions.
			-- Make the result available in `has_qualified_call`.
			-- Note that when in doubt, or when it's two long to process,
			-- then set `has_qualified_call` to True.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			l_old_class: ET_CLASS
		do
			has_fatal_error := False
			l_old_class := current_class
			current_class := a_class
			has_qualified_call := False
			a_feature.process (Current)
			process_all_invariants (a_class)
			current_class := l_old_class
			visited_features.wipe_out
			visited_qualified_features.wipe_out
		end

feature -- Status report

	has_qualified_call: BOOLEAN
			-- Has a qualified call been found?

feature {ET_AST_NODE} -- Processing

	process_across_expression (a_expression: ET_ACROSS_EXPRESSION)
			-- Process `a_expression'.
		do
			has_qualified_call := True
		end

	process_across_instruction (a_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `a_instruction'.
		do
			has_qualified_call := True
		end

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				else
					a_list.actual_argument (i).process (Current)
					i := i + 1
				end
			end
		end

	process_agent (a_agent: ET_AGENT)
			-- Process `a_agent'.
		require
			a_agent_not_void: a_agent /= Void
		do
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} a_agent.arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
			end
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				elseif attached {ET_EXPRESSION} a_list.actual_argument (i) as l_expression then
					l_expression.process (Current)
				end
				i := i + 1
			end
		end

	process_all_invariants (a_class: ET_CLASS)
			-- Process all invariants of `a_class`, including
			-- those inherited from ancestors (recursively).
		require
			a_class_not_void: a_class /= Void
		local
			l_old_class_impl: ET_CLASS
			l_old_closure_impl: ET_CLOSURE
			i, nb: INTEGER
			l_ancestors: ET_BASE_TYPE_LIST
			l_class: ET_CLASS
		do
			if not in_assertions then
					-- We are not checking assertions within assertions.
				in_assertions := True
				l_old_class_impl := current_class_impl
				l_old_closure_impl := current_closure_impl
				l_ancestors := a_class.ancestors
				nb := l_ancestors.count
				from i := 1 until i > nb loop
					if has_qualified_call then
						i := nb + 1
					else
						l_class := l_ancestors.item (i).base_class
						if attached l_class.invariants as l_invariants then
							current_closure_impl := l_invariants
							current_class_impl := l_invariants.implementation_class
							process_assertions (l_invariants)
						end
						i := i + 1
					end
				end
				current_class_impl := l_old_class_impl
				current_closure_impl := l_old_closure_impl
				in_assertions := False
			end
		end

	process_all_postconditions (a_feature: ET_FEATURE)
			-- Process all postconditions of `a_feature`, including
			-- those inherited from precursors (recursively).
		require
			a_feature_not_void: a_feature /= Void
		local
			l_old_class_impl: ET_CLASS
			l_old_closure_impl: ET_CLOSURE
			l_precursors: like precursors
			l_precursor: ET_FEATURE
		do
			if not in_assertions then
					-- We are not checking assertions within assertions.
				in_assertions := True
				l_old_class_impl := current_class_impl
				l_old_closure_impl := current_closure_impl
				l_precursors := precursors
				l_precursors.wipe_out
				a_feature.add_precursors_impl (l_precursors)
				l_precursors.force_last (a_feature.implementation_feature)
				from l_precursors.start until l_precursors.after loop
					if has_qualified_call then
						l_precursors.go_after
					else
						l_precursor := l_precursors.item_for_iteration
						if attached l_precursor.postconditions as l_postconditions then
							current_closure_impl := l_precursor
							current_class_impl := l_precursor.implementation_class
							process_assertions (l_postconditions)
						end
						l_precursors.forth
					end
				end
				l_precursors.wipe_out
				current_class_impl := l_old_class_impl
				current_closure_impl := l_old_closure_impl
				in_assertions := False
			end
		end

	process_all_preconditions (a_feature: ET_FEATURE)
			-- Process all preconditions of `a_feature`, including
			-- those inherited from precursors (recursively).
		require
			a_feature_not_void: a_feature /= Void
		local
			l_old_class_impl: ET_CLASS
			l_old_closure_impl: ET_CLOSURE
			l_precursors: like precursors
			l_precursor: ET_FEATURE
		do
			if not in_assertions then
					-- We are not checking assertions within assertions.
				in_assertions := True
				l_old_class_impl := current_class_impl
				l_old_closure_impl := current_closure_impl
				l_precursors := precursors
				l_precursors.wipe_out
				a_feature.add_precursors_impl (l_precursors)
				l_precursors.force_last (a_feature.implementation_feature)
				from l_precursors.start until l_precursors.after loop
					if has_qualified_call then
						l_precursors.go_after
					else
						l_precursor := l_precursors.item_for_iteration
						if attached l_precursor.preconditions as l_preconditions then
							current_closure_impl := l_precursor
							current_class_impl := l_precursor.implementation_class
							process_assertions (l_preconditions)
						end
						l_precursors.forth
					end
				end
				l_precursors.wipe_out
				current_class_impl := l_old_class_impl
				current_closure_impl := l_old_closure_impl
				in_assertions := False
			end
		end

	process_assertions (a_list: ET_ASSERTIONS)
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				elseif attached a_list.assertion (i).expression as l_expression then
					l_expression.process (Current)
				end
				i := i + 1
			end
		end

	process_assigner_instruction (a_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
		end

	process_assignment (a_instruction: ET_ASSIGNMENT)
			-- Process `a_instruction'.
		do
			a_instruction.source.process (Current)
		end

	process_assignment_attempt (a_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `a_instruction'.
		do
			a_instruction.source.process (Current)
		end

	process_bang_instruction (a_instruction: ET_BANG_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_creation_instruction (a_instruction)
		end

	process_bracket_expression (a_expression: ET_BRACKET_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
		end

	process_call_agent (a_expression: ET_CALL_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_check_instruction (a_instruction: ET_CHECK_INSTRUCTION)
			-- Process `a_instruction'.
		local
			i, nb: INTEGER
		do
			nb := a_instruction.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				elseif attached a_instruction.assertion (i).expression as l_expression then
					l_expression.process (Current)
				end
				i := i + 1
			end
			if attached a_instruction.then_compound as l_then_compound then
				process_compound (l_then_compound)
			end
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
			l_choice: ET_CHOICE
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				l_choice := a_list.choice (i)
				l_choice.lower.process (Current)
				if l_choice.is_range then
					l_choice.upper.process (Current)
				end
				i := i + 1
			end
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				else
					a_list.item (i).process (Current)
					i := i + 1
				end
			end
		end

	process_convert_builtin_expression (a_convert_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_creation_expression (a_convert_expression)
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_qualified_feature_call (a_convert_expression)
		end

	process_create_expression (a_expression: ET_CREATE_EXPRESSION)
			-- Process `a_expression'.
		do
			process_creation_expression (a_expression)
		end

	process_create_instruction (a_instruction: ET_CREATE_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_creation_instruction (a_instruction)
		end

	process_creation_expression (a_expression: ET_CREATION_EXPRESSION)
			-- Process `a_expression`.
		require
			a_expression_not_void: a_expression /= Void
		local
			l_arguments: detachable ET_ACTUAL_ARGUMENTS
			l_class: ET_CLASS
			l_seed: INTEGER
			l_old_class: ET_CLASS
			l_features: detachable DS_HASH_SET [ET_FEATURE]
		do
			l_arguments := a_expression.arguments
			if l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			if has_qualified_call then
				-- Done.
			elseif not attached a_expression.creation_call as l_creation_call then
				-- OK.
			elseif l_arguments = Void or else not has_reference_actual_argument (l_arguments) then
				-- OK.
			else
				internal_type_context.reset (current_class)
				internal_type_context.force_last (a_expression.type)
				if not internal_type_context.is_type_reference then
						-- Attachments will trigger a qualified call to 'twin/copy'
						-- and comparisons will trigger a qualified call to 'is_equal'.
					has_qualified_call := True
				else
					l_seed := l_creation_call.name.seed
					l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						l_features := visited_qualified_features.value (l_class)
						if l_features = Void or else not l_features.has (l_procedure) then
							if l_features = Void then
								create l_features.make (2)
								visited_qualified_features.force (l_features, l_class)
							end
							l_features.force (l_procedure)
							l_old_class := current_class
							current_class := l_class
							l_procedure.process (Current)
							current_class := l_old_class
						end
					else
							-- Internal error: unknown creation procedure.
						set_fatal_error
						error_handler.report_giaac_error (generator, "process_creation_expression", 1, "unknown creation procedure.")
					end
				end
			end
		end

	process_creation_instruction (a_instruction: ET_CREATION_INSTRUCTION)
			-- Process `a_instruction'.
		require
			a_instruction_not_void: a_instruction /= Void
		local
			l_arguments: detachable ET_ACTUAL_ARGUMENTS
			l_target: ET_WRITABLE
			l_class: ET_CLASS
			l_seed: INTEGER
			l_old_class: ET_CLASS
			l_features: detachable DS_HASH_SET [ET_FEATURE]
		do
			l_arguments := a_instruction.arguments
			if l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			l_target := a_instruction.target
			if has_qualified_call then
				-- Done.
			elseif not attached a_instruction.creation_call as l_creation_call then
				-- OK.
			elseif l_arguments = Void or else not has_reference_actual_argument (l_arguments) then
				-- OK.
			else
				internal_type_context.reset (current_class)
				if attached a_instruction.type as l_type then
					internal_type_context.force_last (l_type)
				else
					expression_type_finder.find_expression_type_in_closure (l_target, current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
					if expression_type_finder.has_fatal_error then
							-- Error already reported.
						set_fatal_error
					end
				end
				if not internal_type_context.is_type_reference then
						-- Attachments will trigger a qualified call to 'twin/copy'
						-- and comparisons will trigger a qualified call to 'is_equal'.
					has_qualified_call := True
				else
					l_seed := l_creation_call.name.seed
					l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						l_features := visited_qualified_features.value (l_class)
						if l_features = Void or else not l_features.has (l_procedure) then
							if l_features = Void then
								create l_features.make (2)
								visited_qualified_features.force (l_features, l_class)
							end
							l_features.force (l_procedure)
							l_old_class := current_class
							current_class := l_class
							l_procedure.process (Current)
							current_class := l_old_class
						end
					else
							-- Internal error: unknown creation procedure.
						set_fatal_error
						error_handler.report_giaac_error (generator, "process_creation_instruction", 1, "unknown creation procedure.")
					end
				end
			end
		end

	process_debug_instruction (a_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.compound as l_compound then
				process_compound (l_compound)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_do_function_inline_agent (a_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_do_procedure_inline_agent (a_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_equality_expression (a_expression: ET_EQUALITY_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.left.process (Current)
			a_expression.right.process (Current)
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_creation_expression (a_convert_expression)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			process_qualified_feature_call (a_convert_expression)
		end

	process_expression_address (a_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_old_class_impl: ET_CLASS
			l_old_closure: ET_CLOSURE
			l_old_closure_impl: ET_CLOSURE
		do
			if not visited_features.has (a_feature) then
				visited_features.force_last (a_feature)
				l_old_class_impl := current_class_impl
				current_class_impl := a_feature.implementation_class
				l_old_closure := current_closure
				current_closure := a_feature
				l_old_closure_impl := current_closure_impl
				current_closure_impl := a_feature
				process_all_preconditions (a_feature)
				if attached a_feature.rescue_clause as l_rescue_clause then
					process_compound (l_rescue_clause)
				end
				if attached a_feature.compound as l_compound then
					process_compound (l_compound)
				end
				process_all_postconditions (a_feature)
				current_class_impl := l_old_class_impl
				current_closure := l_old_closure
				current_closure_impl := l_old_closure_impl
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
		end

	process_external_function_inline_agent (a_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
		end

	process_external_procedure_inline_agent (a_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_external_routine (a_feature: ET_EXTERNAL_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_old_class_impl: ET_CLASS
			l_old_closure: ET_CLOSURE
			l_old_closure_impl: ET_CLOSURE
		do
			if not visited_features.has (a_feature) then
				visited_features.force_last (a_feature)
				l_old_class_impl := current_class_impl
				current_class_impl := a_feature.implementation_class
				l_old_closure := current_closure
				current_closure := a_feature
				l_old_closure_impl := current_closure_impl
				current_closure_impl := a_feature
				process_all_preconditions (a_feature)
				process_all_postconditions (a_feature)
				current_class_impl := l_old_class_impl
				current_closure := l_old_closure
				current_closure_impl := l_old_closure_impl
			end
		end

	process_general_qualified_feature_call_expression (a_expression: ET_GENERAL_QUALIFIED_FEATURE_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
		end

	process_general_qualified_feature_call_instruction (a_instruction: ET_GENERAL_QUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
		end

	process_if_expression (a_expression: ET_IF_EXPRESSION)
			-- Process `a_expression'.
		local
			l_elseif: ET_ELSEIF_EXPRESSION
			i, nb: INTEGER
		do
			a_expression.conditional.expression.process (Current)
			a_expression.then_expression.process (Current)
			if attached a_expression.elseif_parts as l_elseif_parts then
				nb := l_elseif_parts.count
				from i := 1 until i > nb loop
					l_elseif := l_elseif_parts.item (i)
					l_elseif.conditional.expression.process (Current)
					l_elseif.then_expression.process (Current)
					i := i + 1
				end
			end
			a_expression.else_expression.process (Current)
		end

	process_if_instruction (a_instruction: ET_IF_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
		do
			a_instruction.conditional.expression.process (Current)
			if attached a_instruction.then_compound as l_then_compound then
				l_then_compound.process (Current)
			end
			if attached a_instruction.elseif_parts as l_elseif_parts then
				nb := l_elseif_parts.count
				from i := 1 until i > nb loop
					l_elseif := l_elseif_parts.item (i)
					l_elseif.conditional.expression.process (Current)
					if attached l_elseif.then_compound as l_then_compound then
						l_then_compound.process (Current)
					end
					i := i + 1
				end
			end
			if attached a_instruction.else_compound as l_else_compound then
				l_else_compound.process (Current)
			end
		end

	process_infix_cast_expression (a_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_infix_expression (a_expression: ET_INFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
		end

	process_inline_separate_argument (a_argument: ET_INLINE_SEPARATE_ARGUMENT)
			-- Process `a_argument'.
		do
			a_argument.expression.process (Current)
		end

	process_inline_separate_arguments (a_arguments: ET_INLINE_SEPARATE_ARGUMENTS)
			-- Process `a_arguments'.
		local
			i, nb: INTEGER
		do
			nb := a_arguments.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				else
					process_inline_separate_argument (a_arguments.argument (i))
				end
				i := i + 1
			end
		end

	process_inline_separate_instruction (a_instruction: ET_INLINE_SEPARATE_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_inline_separate_arguments (a_instruction.arguments)
			if attached a_instruction.compound as l_compound then
				process_compound (l_compound)
			end
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		local
			l_when_part: ET_WHEN_EXPRESSION
			i, nb: INTEGER
		do
			a_expression.conditional.expression.process (Current)
			if attached a_expression.when_parts as l_when_parts then
				nb := l_when_parts.count
				from i := 1 until i > nb loop
					l_when_part := l_when_parts.item (i)
					process_choice_list (l_when_part.choices)
					l_when_part.then_expression.process (Current)
					i := i + 1
				end
			end
			if attached a_expression.else_part as l_else_part then
				l_else_part.expression.process (Current)
			end
		end

	process_inspect_instruction (a_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_when_part: ET_WHEN_PART
			i, nb: INTEGER
		do
			a_instruction.conditional.expression.process (Current)
			if attached a_instruction.when_parts as l_when_parts then
				nb := l_when_parts.count
				from i := 1 until i > nb loop
					l_when_part := l_when_parts.item (i)
					process_choice_list (l_when_part.choices)
					if attached l_when_part.then_compound as l_then_compound then
						l_then_compound.process (Current)
					end
					i := i + 1
				end
			end
			if attached a_instruction.else_compound as l_else_compound then
				l_else_compound.process (Current)
			end
		end

	process_internal_routine (a_feature: ET_INTERNAL_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		local
			l_old_class_impl: ET_CLASS
			l_old_closure: ET_CLOSURE
			l_old_closure_impl: ET_CLOSURE
		do
			if not visited_features.has (a_feature) then
				visited_features.force_last (a_feature)
				l_old_class_impl := current_class_impl
				current_class_impl := a_feature.implementation_class
				l_old_closure := current_closure
				current_closure := a_feature
				l_old_closure_impl := current_closure_impl
				current_closure_impl := a_feature
				process_all_preconditions (a_feature)
				if attached a_feature.rescue_clause as l_rescue_clause then
					process_compound (l_rescue_clause)
				end
				if attached a_feature.compound as l_compound then
					process_compound (l_compound)
				end
				process_all_postconditions (a_feature)
				current_class_impl := l_old_class_impl
				current_closure := l_old_closure
				current_closure_impl := l_old_closure_impl
			end
		end
		
	process_loop_instruction (a_instruction: ET_LOOP_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.from_compound as l_from_compound then
				l_from_compound.process (Current)
			end
			if attached a_instruction.invariant_part as l_invariant_part then
				process_assertions (l_invariant_part)
			end
			a_instruction.until_conditional.process (Current)
			if attached a_instruction.loop_compound as l_loop_compound then
				l_loop_compound.process (Current)
			end
			if attached a_instruction.variant_part as l_variant_part then
				l_variant_part.expression.process (Current)
			end
		end

	process_manifest_array (a_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			nb := a_expression.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				else
					a_expression.item (i).process (Current)
				end
				i := i + 1
			end
		end

	process_manifest_tuple (a_expression: ET_MANIFEST_TUPLE)
			-- Process `a_expression'.
		local
			i, nb: INTEGER
		do
			nb := a_expression.count
			from i := 1 until i > nb loop
				if has_qualified_call then
					i := nb + 1
				else
					a_expression.item (i).process (Current)
				end
				i := i + 1
			end
		end

	process_named_object_test (a_expression: ET_NAMED_OBJECT_TEST)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_object_equality_expression (a_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
		end

	process_object_test (a_expression: ET_OBJECT_TEST)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_old_expression (a_expression: ET_OLD_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_old_object_test (a_expression: ET_OLD_OBJECT_TEST)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_once_function_inline_agent (a_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_once_procedure_inline_agent (a_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `a_expression'.
		do
			process_agent (a_expression)
		end

	process_parenthesis_expression (a_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
		end

	process_parenthesis_instruction (a_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `a_instruction'.
		do
			process_qualified_feature_call (a_instruction)
		end

	process_parenthesized_expression (a_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_precursor_call (a_call: ET_PRECURSOR_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
			end
			if has_qualified_call then
				-- Done.
			elseif not attached a_call.parent_type as l_parent_type then
					-- Internal error: parent type not known.
				set_fatal_error
				error_handler.report_giaac_error (generator, "process_precursor_call", 1, "unknown parent type.")
			elseif attached l_parent_type.base_class.seeded_feature (a_call.precursor_keyword.seed) as l_feature then
				l_feature.process (Current)
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
		end

	process_precursor_instruction (a_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_precursor_call (a_instruction)
			end
		end

	process_prefix_expression (a_expression: ET_PREFIX_EXPRESSION)
			-- Process `a_expression'.
		do
			process_qualified_feature_call (a_expression)
		end

	process_qualified_call_expression (a_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_expression)
			end
		end

	process_qualified_call_instruction (a_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_qualified_feature_call (a_instruction)
			end
		end

	process_qualified_feature_call (a_call: ET_QUALIFIED_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
			has_qualified_call := True
		end

	process_quantifier_expression (a_expression: ET_QUANTIFIER_EXPRESSION)
			-- Process `a_expression'.
		do
			has_qualified_call := True
		end

	process_repeat_instruction (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Process `a_instruction'.
		do
			has_qualified_call := True
		end

	process_static_call_expression (a_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_expression)
			end
		end

	process_static_call_instruction (a_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_static_feature_call (a_instruction)
			end
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		local
			l_arguments: detachable ET_ACTUAL_ARGUMENT_LIST
			l_class: ET_CLASS
			l_seed: INTEGER
			l_old_class: ET_CLASS
			l_features: detachable DS_HASH_SET [ET_FEATURE]
		do
			l_arguments := a_call.arguments
			if l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			if has_qualified_call then
				-- Done.
			elseif l_arguments = Void or else not has_reference_actual_argument (l_arguments) then
				-- OK.
			else
				internal_type_context.reset (current_class)
				internal_type_context.force_last (a_call.type)
				l_seed := a_call.name.seed
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if attached l_class.seeded_feature (l_seed) as l_feature then
					l_features := visited_qualified_features.value (l_class)
					if l_features = Void or else not l_features.has (l_feature) then
						if l_features = Void then
							create l_features.make (2)
							visited_qualified_features.force (l_features, l_class)
						end
						l_features.force (l_feature)
						l_old_class := current_class
						current_class := l_class
						l_feature.process (Current)
						current_class := l_old_class
					end
				else
						-- Internal error: unknown feature.
					set_fatal_error
					error_handler.report_giaac_error (generator, "process_static_feature_call", 1, "unknown feature.")
				end
			end
		end

	process_unqualified_call_expression (a_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `a_expression'.
		do
			if attached a_expression.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_unqualified_feature_call (a_expression)
			end
		end

	process_unqualified_call_instruction (a_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		do
			if attached a_instruction.parenthesis_call as l_parenthesis_call then
				process_qualified_feature_call (l_parenthesis_call)
			else
				process_unqualified_feature_call (a_instruction)
			end
		end

	process_unqualified_feature_call (a_call: ET_UNQUALIFIED_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
			end
			if has_qualified_call then
				-- Done.
			elseif attached current_class.seeded_feature (a_call.name.seed) as l_feature then
				l_feature.process (Current)
			end
		end

feature {NONE} -- Implementation

	current_class_impl: ET_CLASS
			-- Class where the code currently being processed has been written

	current_closure: ET_CLOSURE
			-- Closure (feature, invariant, inline agent) being processed

	current_closure_impl: ET_CLOSURE
			-- Closure where the code currently being processed has been written

	has_reference_actual_argument (a_arguments: ET_ACTUAL_ARGUMENTS): BOOLEAN
			-- Does `a_arguments` contain at least one expression of reference type?
		require
			a_arguments_not_void: a_arguments /= Void
		local
			i, nb: INTEGER
		do
			nb := a_arguments.count
			from i := 1 until i > nb loop
				internal_type_context.reset (current_class)
				expression_type_finder.find_expression_type_in_closure (a_arguments.actual_argument (i), current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
				if expression_type_finder.has_fatal_error then
						-- Error already reported.
					set_fatal_error
				end
				if not internal_type_context.is_type_expanded then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				end
				i := i + 1
			end
		end

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

	internal_type_context: ET_NESTED_TYPE_CONTEXT
			-- Type context to be used internally

	visited_features: DS_HASH_SET [ET_FEATURE]
			-- Features already being processed

	visited_qualified_features: DS_HASH_TABLE [DS_HASH_SET [ET_FEATURE], ET_CLASS]
			-- Creation procedures and static features already processed

	precursors: DS_HASH_SET [ET_FEATURE]
			-- Feature precursors used to build inherited assertions

	in_assertions: BOOLEAN
			-- Are we currently processing assertions?

invariant

	current_class_impl_not_void: current_class_impl /= Void
	current_closure_not_void: current_closure /= Void
	current_closure_impl_not_void: current_closure_impl /= Void
	visited_features_not_void: visited_features /= Void
	no_void_visited_feature: not visited_features.has_void
	visited_qualified_features_not_void: visited_qualified_features /= Void
	precursors_not_void: precursors /= Void
	no_void_precursor: not precursors.has_void
	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void

end
