note

	description:

		"Eiffel attached attribute initialization checkers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_ATTACHED_ATTRIBUTE_INITIALIZATION_CHECKER

inherit

	ET_CLASS_PROCESSOR
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
			process_class,
			process_compound,
			process_convert_builtin_expression,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_current,
			process_current_address,
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
			process_feature_address,
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

	ET_SHARED_ATTRIBUTE_COMPARATOR_BY_NAME
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new attached attribute initialization checker.
		do
			current_class_impl := tokens.unknown_class
			current_closure := tokens.unknown_feature
			current_closure_impl := tokens.unknown_feature
			current_creation_procedure := tokens.unknown_procedure
			create current_attached_attributes.make (50)
			create current_creation_procedures.make (20)
			create current_initialization_scope.make
			create unused_attachment_scopes.make (40)
			create visited_features.make (200)
			create pending_errors.make_map (50)
			create attribute_list.make (50)
			create precursors.make (100)
			create expression_type_finder.make (a_system_processor)
			create internal_type_context.make_with_capacity (tokens.unknown_class, 100)
			create attribute_sorter.make (attribute_comparator_by_name)
			create qualified_call_finder.make (a_system_processor)
			precursor (a_system_processor)
			make_ast_processor
		end

feature -- Processing

	process_class (a_class: ET_CLASS)
			-- Check implementation of `a_class' is not already done.
			-- Then check that all attached attributes have been initialized 
			-- at the end of all creation procedures of `a_class`.
			--
			-- Note that in multi-threaded mode, when several system processors
			-- are processing a Eiffel system together, the initialization of
			-- the attached attributes of `a_class' may still not be checked
			-- at the end of this routine if it is currently being processed by
			-- another system processor.
		local
			a_processor: like Current
		do
			if a_class.is_none then
				process_none_class (a_class)
			elseif a_class.is_formal then
				process_formal_class (a_class)
			elseif not current_class.is_unknown then
					-- Internal error (recursive call)
					-- This internal error is not fatal.
				error_handler.report_giaac_error (generator, "process_class", 1, "recursive call.")
				create a_processor.make (system_processor)
				a_processor.process_class (a_class)
			elseif a_class.is_unknown then
				set_fatal_error (a_class)
				error_handler.report_giaac_error (generator, "process_class", 2, "unknown class.")
			elseif not a_class.is_preparsed then
				set_fatal_error (a_class)
			else
				internal_process_class (a_class)
			end
		ensure then
			attached_attribute_initialization_checked: not {PLATFORM}.is_thread_capable implies a_class.attached_attribute_initialization_checked
		end

feature -- Error handling

	set_fatal_error (a_class: ET_CLASS)
			-- Report a fatal error to `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.set_attached_attribute_initialization_error
		ensure
			attached_attribute_initialization_checked: a_class.attached_attribute_initialization_checked
			has_attached_attribute_initialization_error: a_class.has_attached_attribute_initialization_error
		end

feature {NONE} -- Processing

	internal_process_class (a_class: ET_CLASS)
			-- Check implementation of `a_class' is not already done.
			-- Then check that all attached attributes have been initialized 
			-- at the end of all creation procedures of `a_class`.
			--
			-- Note that in multi-threaded mode, when several system processors
			-- are processing a Eiffel system together, the initialization of
			-- the attached attributes of `a_class' may still not be checked
			-- at the end of this routine if it is currently being processed by
			-- another system processor.
		require
			a_class_not_void: a_class /= Void
			a_class_preparsed: a_class.is_preparsed
		local
			l_old_class: ET_CLASS
			l_has_implementation_error: BOOLEAN
			l_old_error_handler: detachable ET_ERROR_HANDLER
		do
			l_old_class := current_class
			current_class := a_class
			if not {PLATFORM}.is_thread_capable or else current_class.processing_mutex.try_lock then
					-- No other thread is processing `current_class'.
					-- Got exclusive access for its processing.
				if not current_class.attached_attribute_initialization_checked then
						-- Check implementation of `current_class' if not already done.
					current_class.process (system_processor.implementation_checker)
					l_has_implementation_error := not current_class.implementation_checked_successfully
					if not l_has_implementation_error or system_processor.is_fault_tolerant then
						if l_has_implementation_error then
							l_old_error_handler := system_processor.error_handler
							system_processor.set_error_handler_only (tokens.null_error_handler)
						end
						error_handler.report_compilation_status (Current, current_class, system_processor)
						if current_system.attached_attribute_initialization_mode and then not current_class.is_deferred then
							build_current_attached_attributes
							if not current_attached_attributes.is_empty then
								build_current_creation_procedures
								from current_creation_procedures.start until current_creation_procedures.after loop
									process_creation_procedure (current_creation_procedures.item_for_iteration)
									current_creation_procedures.forth
								end
								current_creation_procedures.wipe_out
								current_attached_attributes.wipe_out
							end
						end
						current_class.set_attached_attribute_initialization_checked
						system_processor.report_class_processed (current_class)
						if l_old_error_handler /= Void then
							system_processor.set_error_handler_only (l_old_error_handler)
							set_fatal_error (current_class)
						end
					else
						set_fatal_error (current_class)
					end
				end
				current_class.processing_mutex.unlock
			end
			current_class := l_old_class
		end

	process_creation_procedure (a_procedure: ET_PROCEDURE)
			-- Check that all attached attributes of `current_class` are
			-- initialized at the end of the creation procedure `a_procedure`.
		require
			a_procedure_not_void: a_procedure /= Void
		local
			l_list: DS_ARRAYED_LIST [ET_ATTRIBUTE]
			l_old_creation_procedure: like current_creation_procedure
			l_old_class_impl: like current_class_impl
		do
			l_old_creation_procedure := current_creation_procedure
			current_creation_procedure := a_procedure
			l_old_class_impl := current_class_impl
				current_class_impl := a_procedure.implementation_class
			a_procedure.process (Current)
			if not are_all_attached_attributes_initialized then
				l_list := attribute_list
				add_non_initialized_attached_attributes_to_list (l_list)
				if l_list.count = 1 then
					set_fatal_error (current_class)
					error_handler.report_vevi0f_error (current_class, current_class_impl, a_procedure, l_list.first)
				elseif l_list.count > 1 then
					set_fatal_error (current_class)
					error_handler.report_vevi0g_error (current_class, current_class_impl, a_procedure, l_list)
				end
				l_list.wipe_out
			end
			current_initialization_scope.wipe_out
			pending_errors.wipe_out
			visited_features.wipe_out
			current_creation_procedure := l_old_creation_procedure
			current_class_impl := l_old_class_impl
		end

	process_none_class (a_class: ET_CLASS)
			-- Process class "NONE".
		require
			a_class_not_void: a_class /= Void
			a_class_is_none: a_class.is_none
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.attached_attribute_initialization_checked then
					a_class.set_attached_attribute_initialization_checked
					system_processor.report_class_processed (a_class)
				end
				a_class.processing_mutex.unlock
			end
		ensure
			attached_attribute_initialization_checked: not {PLATFORM}.is_thread_capable implies a_class.attached_attribute_initialization_checked
		end

	process_formal_class (a_class: ET_CLASS)
			-- Process virtual class representing formal generic parameters
			-- (used for Storable files).
		require
			a_class_not_void: a_class /= Void
			a_class_is_formal: a_class.is_formal
		do
			if not {PLATFORM}.is_thread_capable or else a_class.processing_mutex.try_lock then
				if not a_class.attached_attribute_initialization_checked then
					a_class.set_attached_attribute_initialization_checked
					system_processor.report_class_processed (a_class)
				end
				a_class.processing_mutex.unlock
			end
		ensure
			attached_attribute_initialization_checked: not {PLATFORM}.is_thread_capable implies a_class.attached_attribute_initialization_checked
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (a_expression: ET_ACROSS_EXPRESSION)
			-- Process `a_expression'.
		local
			l_old_initialization_scope: like current_initialization_scope
		do
			a_expression.iterable_expression.process (Current)
			if not are_all_attached_attributes_initialized then
				report_pending_errors
				l_old_initialization_scope := current_initialization_scope
				if attached a_expression.invariant_part as l_invariant_part then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					process_assertions (l_invariant_part)
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				if attached a_expression.until_conditional as l_until_conditional then
					l_until_conditional.expression.process (Current)
				end
				if not are_all_attached_attributes_initialized then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					a_expression.iteration_conditional.expression.process (Current)
					if are_all_attached_attributes_initialized then
						-- Done.
					elseif attached a_expression.variant_part as l_variant_part then 
						l_variant_part.expression.process (Current)
					end
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
			end
		end

	process_across_instruction (a_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_old_initialization_scope: like current_initialization_scope
		do
			a_instruction.iterable_expression.process (Current)
			if not are_all_attached_attributes_initialized then
				report_pending_errors
				if attached a_instruction.from_compound as l_from_compound then
					process_compound (l_from_compound)
				end
				if not are_all_attached_attributes_initialized then
					l_old_initialization_scope := current_initialization_scope
					if attached a_instruction.invariant_part as l_invariant_part then
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						process_assertions (l_invariant_part)
						free_attachment_scope (current_initialization_scope)
						current_initialization_scope := l_old_initialization_scope
					end
					if attached a_instruction.until_conditional as l_until_conditional then
						l_until_conditional.expression.process (Current)
					end
					if not are_all_attached_attributes_initialized then
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						if attached a_instruction.loop_compound as l_loop_compound then
							process_compound (l_loop_compound)
						end
						if are_all_attached_attributes_initialized then
							-- Done.
						elseif attached a_instruction.variant_part as l_variant_part then 
							l_variant_part.expression.process (Current)
						end
						free_attachment_scope (current_initialization_scope)
						current_initialization_scope := l_old_initialization_scope
					end
				end
			end
		end

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				if are_all_attached_attributes_initialized then
						-- Already initialized.
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
		local
			l_list: DS_ARRAYED_LIST [ET_ATTRIBUTE]
			l_error: ET_VALIDITY_ERROR
		do
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif attached {ET_EXPRESSION} a_agent.target as l_target then
				l_target.process (Current)
			elseif attached {ET_AGENT_IMPLICIT_CURRENT_TARGET} a_agent.target as l_current_operand then
				l_list := attribute_list
				add_non_initialized_attached_attributes_to_list (l_list)
				if current_class.is_expanded then
						-- Attachments will trigger a qualified call to 'twin/copy'
						-- and comparisons will trigger a qualified call to 'is_equal'.
					if l_list.count = 1 then
						set_fatal_error (current_class)
						error_handler.report_vevi0j_error (current_class, current_class_impl, a_agent, current_creation_procedure, l_list.first)
					elseif l_list.count > 1 then
						set_fatal_error (current_class)
						error_handler.report_vevi0k_error (current_class, current_class_impl, a_agent, current_creation_procedure, l_list)
					end
				else
					current_initialization_scope.add_current (l_current_operand)
					if l_list.count = 1 then
						create l_error.make_vevi0j (current_class, current_class_impl, a_agent, current_creation_procedure, l_list.first)
						pending_errors.force_last (l_error, l_current_operand)
					elseif l_list.count > 1 then
						create l_error.make_vevi0k (current_class, current_class_impl, a_agent, current_creation_procedure, l_list)
						pending_errors.force_last (l_error, l_current_operand)
					end
				end
				l_list.wipe_out
			end
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif attached {ET_AGENT_ARGUMENT_OPERAND_LIST} a_agent.arguments as l_actual_arguments then
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
				if are_all_attached_attributes_initialized then
						-- Already initialized.
					i := nb + 1
				elseif attached {ET_EXPRESSION} a_list.actual_argument (i) as l_expression then
					l_expression.process (Current)
				end
				i := i + 1
			end
		end

	process_all_postconditions (a_feature: ET_FEATURE)
			-- Process all postconditions of `a_feature`, including
			-- those inherited from precursors (recursively).
		require
			a_feature_not_void: a_feature /= Void
		local
			l_precursors: like precursors
			l_precursor: ET_FEATURE
			l_old_class_impl: ET_CLASS
			l_old_closure_impl: ET_CLOSURE
			l_old_initialization_scope: like current_initialization_scope
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
				l_old_initialization_scope := current_initialization_scope
				from l_precursors.start until l_precursors.after loop
					l_precursor := l_precursors.item_for_iteration
					if attached l_precursor.postconditions as l_postconditions then
						current_closure_impl := l_precursor
						current_class_impl := l_precursor.implementation_class
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						process_assertions (l_postconditions)
						free_attachment_scope (current_initialization_scope)
					end
					l_precursors.forth
				end
				l_precursors.wipe_out
				current_initialization_scope := l_old_initialization_scope
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
			l_precursors: like precursors
			l_precursor: ET_FEATURE
			l_old_class_impl: ET_CLASS
			l_old_closure_impl: ET_CLOSURE
			l_old_initialization_scope: like current_initialization_scope
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
				l_old_initialization_scope := current_initialization_scope
				from l_precursors.start until l_precursors.after loop
					l_precursor := l_precursors.item_for_iteration
					if attached l_precursor.preconditions as l_preconditions then
						current_closure_impl := l_precursor
						current_class_impl := l_precursor.implementation_class
						current_initialization_scope := new_attachment_scope
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						process_assertions (l_preconditions)
						free_attachment_scope (current_initialization_scope)
					end
					l_precursors.forth
				end
				l_precursors.wipe_out
				current_initialization_scope := l_old_initialization_scope
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
				if are_all_attached_attributes_initialized then
						-- Already initialized.
					i := nb + 1
				elseif attached a_list.assertion (i).expression as l_expression then
					l_expression.process (Current)
					if l_expression.is_false then
						current_initialization_scope.set_code_unreachable (True)
					end
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
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif attached {ET_IDENTIFIER} a_instruction.target as l_identifier and then l_identifier.is_feature_name then
				if not attached {ET_ATTRIBUTE} current_class.seeded_query (l_identifier.seed) as l_attribute then
						-- Internal error: the target of an assignment cannot be a routine.
					set_fatal_error (current_class)
					error_handler.report_giaac_error (generator, "process_assignment", 1, "target is no an attribute.")
				elseif current_attached_attributes.has (l_attribute) then
					current_initialization_scope.add_attribute (l_attribute.name)
				end
			end
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
			l_old_initialization_scope: like current_initialization_scope
		do
			l_old_initialization_scope := current_initialization_scope
			if a_instruction.then_compound = Void then
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
			end
			nb := a_instruction.count
			from i := 1 until i > nb loop
				if are_all_attached_attributes_initialized then
						-- Already initialized.
					i := nb + 1
				elseif attached a_instruction.assertion (i).expression as l_expression then
					l_expression.process (Current)
					if l_expression.is_false then
						current_initialization_scope.set_code_unreachable (True)
					end
				end
				i := i + 1
			end
			if attached a_instruction.then_compound as l_then_compound then
				if not are_all_attached_attributes_initialized then
					process_compound (l_then_compound)
				end
			else
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
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
				if are_all_attached_attributes_initialized then
						-- Already initialized.
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
		do
			l_arguments := a_expression.arguments
			if l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif current_initialization_scope.current_not_initialized.is_empty then
				-- OK.
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
					report_pending_errors
				else
					l_seed := l_creation_call.name.seed
					l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						qualified_call_finder.find_qualified_call_in_feature_and_invariant (l_procedure, l_class)
						if qualified_call_finder.has_fatal_error then
								-- Error already reported.
							set_fatal_error (current_class)
						end
						if qualified_call_finder.has_qualified_call then
							report_pending_errors
						end
					else
							-- Internal error: unknown creation procedure.
						set_fatal_error (current_class)
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
		do
			l_arguments := a_instruction.arguments
			if l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			if not are_all_attached_attributes_initialized then
				l_target := a_instruction.target
				if are_all_attached_attributes_initialized then
					-- Done.
				elseif current_initialization_scope.current_not_initialized.is_empty then
					-- OK.
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
							set_fatal_error (current_class)
						end
					end
					if not internal_type_context.is_type_reference then
							-- Attachments will trigger a qualified call to 'twin/copy'
							-- and comparisons will trigger a qualified call to 'is_equal'.
						report_pending_errors
					else
						l_seed := l_creation_call.name.seed
						l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
						if attached l_class.seeded_procedure (l_seed) as l_procedure then
							qualified_call_finder.find_qualified_call_in_feature_and_invariant (l_procedure, l_class)
							if qualified_call_finder.has_fatal_error then
									-- Error already reported.
								set_fatal_error (current_class)
							end
							if qualified_call_finder.has_qualified_call then
								report_pending_errors
							end
						else
								-- Internal error: unknown creation procedure.
							set_fatal_error (current_class)
							error_handler.report_giaac_error (generator, "process_creation_instruction", 1, "unknown creation procedure.")
						end
					end
				end
				if attached {ET_IDENTIFIER} l_target as l_identifier and then l_identifier.is_feature_name then
					if not attached {ET_ATTRIBUTE} current_class.seeded_query (l_identifier.seed) as l_attribute then
							-- Internal error: the target of a creation instruction cannot be a routine.
						set_fatal_error (current_class)
						error_handler.report_giaac_error (generator, "process_creation_instruction", 2, "target is not an attribute.")
					elseif current_attached_attributes.has (l_attribute) then
						current_initialization_scope.add_attribute (l_attribute.name)
					end
				end
			end
		end

	process_current (a_expression: ET_CURRENT)
			-- Process `a_expression'.
		local
			l_list: DS_ARRAYED_LIST [ET_ATTRIBUTE]
			l_error: ET_VALIDITY_ERROR
		do
			if not are_all_attached_attributes_initialized then
				l_list := attribute_list
				add_non_initialized_attached_attributes_to_list (l_list)
				if current_class.is_expanded then
						-- Attachments will trigger a qualified call to 'twin/copy'
						-- and comparisons will trigger a qualified call to 'is_equal'.
					if l_list.count = 1 then
						set_fatal_error (current_class)
						error_handler.report_vevi0h_error (current_class, current_class_impl, a_expression, current_creation_procedure, l_list.first)
					elseif l_list.count > 1 then
						set_fatal_error (current_class)
						error_handler.report_vevi0i_error (current_class, current_class_impl, a_expression, current_creation_procedure, l_list)
					end
				else
					current_initialization_scope.add_current (a_expression)
					if l_list.count = 1 then
						create l_error.make_vevi0h (current_class, current_class_impl, a_expression, current_creation_procedure, l_list.first)
						pending_errors.force_last (l_error, a_expression)
					elseif l_list.count > 1 then
						create l_error.make_vevi0i (current_class, current_class_impl, a_expression, current_creation_procedure, l_list)
						pending_errors.force_last (l_error, a_expression)
					end
				end
				l_list.wipe_out
			end
		end

	process_current_address (a_expression: ET_CURRENT_ADDRESS)
			-- Process `a_expression'.
		local
			l_list: DS_ARRAYED_LIST [ET_ATTRIBUTE]
		do
			if not are_all_attached_attributes_initialized then
				l_list := attribute_list
				add_non_initialized_attached_attributes_to_list (l_list)
				if l_list.count = 1 then
					set_fatal_error (current_class)
					error_handler.report_vevi0h_error (current_class, current_class_impl, a_expression.current_keyword, current_creation_procedure, l_list.first)
				elseif l_list.count > 1 then
					set_fatal_error (current_class)
					error_handler.report_vevi0i_error (current_class, current_class_impl, a_expression.current_keyword, current_creation_procedure, l_list)
				end
				l_list.wipe_out
			end
		end

	process_debug_instruction (a_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_old_initialization_scope: like current_initialization_scope
		do
			if attached a_instruction.compound as l_compound then
				l_old_initialization_scope := current_initialization_scope
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				process_compound (l_compound)
				free_attachment_scope (current_initialization_scope)
				current_initialization_scope := l_old_initialization_scope
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
			if not are_all_attached_attributes_initialized then
				a_expression.right.process (Current)
			end
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
			l_old_initialization_scope: like current_initialization_scope
		do
			if not visited_features.has (a_feature) then
				visited_features.force_last (a_feature)
				l_old_class_impl := current_class_impl
				current_class_impl := a_feature.implementation_class
				l_old_closure := current_closure
				current_closure := a_feature
				l_old_closure_impl := current_closure_impl
				current_closure_impl := a_feature
				l_old_initialization_scope := current_initialization_scope
				process_all_preconditions (a_feature)
				if attached a_feature.rescue_clause as l_rescue_clause then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					process_compound (l_rescue_clause)
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				if attached a_feature.compound as l_compound then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					process_compound (l_compound)
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				process_all_postconditions (a_feature)
				current_class_impl := l_old_class_impl
				current_closure := l_old_closure
				current_closure_impl := l_old_closure_impl
				visited_features.remove (a_feature)
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
				visited_features.remove (a_feature)
			end
		end

	process_feature_address (a_expression: ET_FEATURE_ADDRESS)
			-- Process `a_expression'.
		do
			if are_all_attached_attributes_initialized then
					-- Done.
			elseif
				attached {ET_ATTRIBUTE} current_class.seeded_query (a_expression.name.seed) as l_attribute and then
				current_attached_attributes.has (l_attribute) and then
				not current_initialization_scope.has_attribute (l_attribute.name)
			then
				set_fatal_error (current_class)
				error_handler.report_vevi0l_error (current_class, current_class_impl, a_expression.name, current_creation_procedure, l_attribute)
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
			l_conditional_initialization_scope: like current_initialization_scope
			l_if_initialization_scope: like current_initialization_scope
			l_elseif_initialization_scope: like current_initialization_scope
		do
			a_expression.conditional.expression.process (Current)
			if not are_all_attached_attributes_initialized then
				l_conditional_initialization_scope := current_initialization_scope
				l_if_initialization_scope := new_attachment_scope
				current_initialization_scope := l_if_initialization_scope
				current_initialization_scope.copy_scope (l_conditional_initialization_scope)
				a_expression.then_expression.process (Current)
				if attached a_expression.elseif_parts as l_elseif_parts then
					l_elseif_initialization_scope := new_attachment_scope
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						l_elseif := l_elseif_parts.item (i)
						current_initialization_scope := l_conditional_initialization_scope
						l_elseif.conditional.expression.process (Current)
						current_initialization_scope := l_elseif_initialization_scope
						current_initialization_scope.copy_scope (l_conditional_initialization_scope)
						l_elseif.then_expression.process (Current)
						l_if_initialization_scope.merge_scope (current_initialization_scope)
						i := i + 1
					end
					free_attachment_scope (l_elseif_initialization_scope)
				end
				current_initialization_scope := l_conditional_initialization_scope
				a_expression.else_expression.process (Current)
				current_initialization_scope.merge_scope (l_if_initialization_scope)
				free_attachment_scope (l_if_initialization_scope)
			end
		end

	process_if_instruction (a_instruction: ET_IF_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_elseif: ET_ELSEIF_PART
			i, nb: INTEGER
			l_conditional_initialization_scope: like current_initialization_scope
			l_if_initialization_scope: like current_initialization_scope
			l_elseif_initialization_scope: like current_initialization_scope
		do
			a_instruction.conditional.expression.process (Current)
			if not are_all_attached_attributes_initialized then
				l_conditional_initialization_scope := current_initialization_scope
				l_if_initialization_scope := new_attachment_scope
				current_initialization_scope := l_if_initialization_scope
				current_initialization_scope.copy_scope (l_conditional_initialization_scope)
				if attached a_instruction.then_compound as l_then_compound then
					l_then_compound.process (Current)
				end
				if attached a_instruction.elseif_parts as l_elseif_parts then
					l_elseif_initialization_scope := new_attachment_scope
					nb := l_elseif_parts.count
					from i := 1 until i > nb loop
						l_elseif := l_elseif_parts.item (i)
						current_initialization_scope := l_conditional_initialization_scope
						l_elseif.conditional.expression.process (Current)
						current_initialization_scope := l_elseif_initialization_scope
						current_initialization_scope.copy_scope (l_conditional_initialization_scope)
						if attached l_elseif.then_compound as l_then_compound then
							l_then_compound.process (Current)
						end
						l_if_initialization_scope.merge_scope (current_initialization_scope)
						i := i + 1
					end
					free_attachment_scope (l_elseif_initialization_scope)
				end
				current_initialization_scope := l_conditional_initialization_scope
				if attached a_instruction.else_compound as l_else_compound then
					l_else_compound.process (Current)
				end
				current_initialization_scope.merge_scope (l_if_initialization_scope)
				free_attachment_scope (l_if_initialization_scope)
			end
		end

	process_infix_cast_expression (a_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.expression.process (Current)
		end

	process_infix_expression (a_expression: ET_INFIX_EXPRESSION)
			-- Process `a_expression'.
		local
			l_name: ET_CALL_NAME
			l_semi_strict: BOOLEAN
			l_old_initialization_scope: like current_initialization_scope	
		do
			l_name := a_expression.name
			l_semi_strict := a_expression.is_boolean_operator and then
				(l_name.is_infix_and_then or l_name.is_infix_or_else or l_name.is_infix_implies or
				l_name.is_infix_and or l_name.is_infix_or or
				l_name.is_infix_and_then_symbol or l_name.is_infix_or_else_symbol or
				l_name.is_infix_implies_symbol or l_name.is_infix_and_symbol or l_name.is_infix_or_symbol)
			if l_semi_strict then
				a_expression.left.process (Current)
				if not are_all_attached_attributes_initialized then
					l_old_initialization_scope := current_initialization_scope	
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					a_expression.right.process (Current)
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
					report_pending_errors
				end
			else
				process_qualified_feature_call (a_expression)
			end
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
				if are_all_attached_attributes_initialized then
						-- Already initialized.
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
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif attached a_instruction.compound as l_compound then
				process_compound (l_compound)
			end
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		local
			l_when_part: ET_WHEN_EXPRESSION
			i, nb: INTEGER
			l_old_initialization_scope: like current_initialization_scope
			l_inspect_initialization_scope: detachable like current_initialization_scope
		do
			a_expression.conditional.expression.process (Current)
			if not are_all_attached_attributes_initialized then
				if attached a_expression.when_parts as l_when_parts then
					l_old_initialization_scope := current_initialization_scope
					current_initialization_scope := new_attachment_scope
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						l_when_part := l_when_parts.item (i)
						process_choice_list (l_when_part.choices)
						l_when_part.then_expression.process (Current)
						if l_inspect_initialization_scope = Void then
							l_inspect_initialization_scope := new_attachment_scope
							l_inspect_initialization_scope.copy_scope (current_initialization_scope)
						else
							l_inspect_initialization_scope.merge_scope (current_initialization_scope)
						end
						i := i + 1
					end
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				if attached a_expression.else_part as l_else_part then
					l_else_part.expression.process (Current)
				end
				if l_inspect_initialization_scope /= Void then
					current_initialization_scope.merge_scope (l_inspect_initialization_scope)
					free_attachment_scope (l_inspect_initialization_scope)
				end
			end
		end

	process_inspect_instruction (a_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_when_part: ET_WHEN_PART
			i, nb: INTEGER
			l_old_initialization_scope: like current_initialization_scope
			l_inspect_initialization_scope: detachable like current_initialization_scope
		do
			a_instruction.conditional.expression.process (Current)
			if not are_all_attached_attributes_initialized then
				if attached a_instruction.when_parts as l_when_parts then
					l_old_initialization_scope := current_initialization_scope
					current_initialization_scope := new_attachment_scope
					nb := l_when_parts.count
					from i := 1 until i > nb loop
						current_initialization_scope.copy_scope (l_old_initialization_scope)
						l_when_part := l_when_parts.item (i)
						process_choice_list (l_when_part.choices)
						if attached l_when_part.then_compound as l_then_compound then
							l_then_compound.process (Current)
						end
						if l_inspect_initialization_scope = Void then
							l_inspect_initialization_scope := new_attachment_scope
							l_inspect_initialization_scope.copy_scope (current_initialization_scope)
						else
							l_inspect_initialization_scope.merge_scope (current_initialization_scope)
						end
						i := i + 1
					end
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				if attached a_instruction.else_compound as l_else_compound then
					l_else_compound.process (Current)
				end
				if l_inspect_initialization_scope /= Void then
					current_initialization_scope.merge_scope (l_inspect_initialization_scope)
					free_attachment_scope (l_inspect_initialization_scope)
				end
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
			l_old_initialization_scope: like current_initialization_scope
		do
			if not visited_features.has (a_feature) then
				visited_features.force_last (a_feature)
				l_old_class_impl := current_class_impl
				current_class_impl := a_feature.implementation_class
				l_old_closure := current_closure
				current_closure := a_feature
				l_old_closure_impl := current_closure_impl
				current_closure_impl := a_feature
				l_old_initialization_scope := current_initialization_scope
				process_all_preconditions (a_feature)
				if attached a_feature.rescue_clause as l_rescue_clause then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					process_compound (l_rescue_clause)
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				if attached a_feature.compound as l_compound then
					process_compound (l_compound)
				end
				process_all_postconditions (a_feature)
				current_class_impl := l_old_class_impl
				current_closure := l_old_closure
				current_closure_impl := l_old_closure_impl
				visited_features.remove (a_feature)
			end
		end
		
	process_loop_instruction (a_instruction: ET_LOOP_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_old_initialization_scope: like current_initialization_scope
		do
			if attached a_instruction.from_compound as l_from_compound then
				l_from_compound.process (Current)
			end
			if not are_all_attached_attributes_initialized then
				l_old_initialization_scope := current_initialization_scope
				if attached a_instruction.invariant_part as l_invariant_part then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					process_assertions (l_invariant_part)
					free_attachment_scope (current_initialization_scope)
					current_initialization_scope := l_old_initialization_scope
				end
				if a_instruction.has_old_variant_syntax and then attached a_instruction.variant_part as l_variant_part then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					l_variant_part.expression.process (Current)
					current_initialization_scope := l_old_initialization_scope
				end
				a_instruction.until_conditional.process (Current)
				if not are_all_attached_attributes_initialized then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					if attached a_instruction.loop_compound as l_loop_compound then
						l_loop_compound.process (Current)
					end
					if not a_instruction.has_old_variant_syntax and then attached a_instruction.variant_part as l_variant_part and not are_all_attached_attributes_initialized then
						l_variant_part.expression.process (Current)
					end
					current_initialization_scope := l_old_initialization_scope
				end
			end
		end

	process_manifest_array (a_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			nb := a_expression.count
			from i := 1 until i > nb loop
				if are_all_attached_attributes_initialized then
						-- Already initialized.
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
				if are_all_attached_attributes_initialized then
						-- Already initialized.
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
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif not attached a_call.parent_type as l_parent_type then
					-- Internal error: parent type not known.
				set_fatal_error (current_class)
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
		local
			l_target: ET_EXPRESSION
			l_arguments: detachable ET_ACTUAL_ARGUMENTS
		do
			l_target := a_call.target
			l_arguments := a_call.arguments
			l_target.process (Current)
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif current_initialization_scope.current_not_initialized.is_empty then
				-- OK.
			elseif l_arguments /= Void and then has_reference_actual_argument (l_arguments) then
					-- At least one of the arguments may be of reference type.
				report_pending_errors
			else
				expression_type_finder.find_expression_type_in_closure (l_target, current_closure_impl, current_closure, current_class_impl, internal_type_context, current_universe.detachable_separate_any_type)
				if expression_type_finder.has_fatal_error then
						-- Error already reported.
					set_fatal_error (current_class)
				end
				if not internal_type_context.is_type_expanded then
						-- The target may be of reference type.
					report_pending_errors
				end
			end
		end

	process_quantifier_expression (a_expression: ET_QUANTIFIER_EXPRESSION)
			-- Process `a_expression'.
		local
			l_old_initialization_scope: like current_initialization_scope
		do
			a_expression.iterable_expression.process (Current)
			if not are_all_attached_attributes_initialized then
				report_pending_errors
				l_old_initialization_scope := current_initialization_scope
				current_initialization_scope := new_attachment_scope
				current_initialization_scope.copy_scope (l_old_initialization_scope)
				a_expression.iteration_expression.process (Current)
				current_initialization_scope := l_old_initialization_scope
			end
		end

	process_repeat_instruction (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_old_initialization_scope: like current_initialization_scope
		do
			a_instruction.iterable_expression.process (Current)
			if not are_all_attached_attributes_initialized then
				report_pending_errors
				l_old_initialization_scope := current_initialization_scope
				if attached a_instruction.loop_compound as l_loop_compound then
					current_initialization_scope := new_attachment_scope
					current_initialization_scope.copy_scope (l_old_initialization_scope)
					l_loop_compound.process (Current)
					current_initialization_scope := l_old_initialization_scope
				end
			end
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
		do
			l_arguments := a_call.arguments
			if l_arguments /= Void then
				process_actual_arguments (l_arguments)
			end
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif current_initialization_scope.current_not_initialized.is_empty then
				-- OK.
			elseif l_arguments = Void or else not has_reference_actual_argument (l_arguments) then
				-- OK.
			else
				internal_type_context.reset (current_class)
				internal_type_context.force_last (a_call.type)
				l_seed := a_call.name.seed
				l_class := internal_type_context.adapted_base_class_with_seeded_feature (l_seed).base_class
				if attached l_class.seeded_feature (l_seed) as l_feature then
					qualified_call_finder.find_qualified_call_in_feature (l_feature, l_class)
					if qualified_call_finder.has_fatal_error then
							-- Error already reported.
						set_fatal_error (current_class)
					end
					if qualified_call_finder.has_qualified_call then
						report_pending_errors
					end
				else
						-- Internal error: unknown feature.
					set_fatal_error (current_class)
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
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif attached current_class.seeded_feature (a_call.name.seed) as l_feature then
				if
					attached {ET_ATTRIBUTE} l_feature as l_attribute and then
					current_attached_attributes.has (l_attribute) and then
					not current_initialization_scope.has_attribute (l_attribute.name)
				then
					set_fatal_error (current_class)
					error_handler.report_vevi0l_error (current_class, current_class_impl, a_call.name, current_creation_procedure, l_attribute)
				end
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

	current_creation_procedure: ET_PROCEDURE
			-- Creation procedure of `current_class` being processed

	current_attached_attributes: DS_HASH_SET [ET_ATTRIBUTE]
			-- Attributes of `current_class` whose type is attached
			-- and are not self-initializing

	build_current_attached_attributes
			-- Add to `current_attached_attributes` the attributes
			-- of `current_class` whose type is attached and are not
			-- self-initializing.
		local
			i, nb: INTEGER
			l_queries: ET_QUERY_LIST
			l_list: DS_ARRAYED_LIST [ET_ATTRIBUTE]
		do
			l_list := attribute_list
			current_attached_attributes.wipe_out
			l_queries := current_class.queries
			nb := l_queries.count
			from i := 1 until i > nb loop
				if
					attached {ET_ATTRIBUTE} l_queries.item (i) as l_attribute and then
					(not attached {ET_EXTENDED_ATTRIBUTE} l_attribute as l_extended_attribute or else 
					not l_extended_attribute.has_self_initializing_code) and then
					not l_attribute.type.is_type_detachable (current_class) and then
					not l_attribute.type.is_type_expanded (current_class) 
				then
					l_list.force_last (l_attribute)
				end
				i := i + 1
			end
			l_list.sort (attribute_sorter)
			nb := l_list.count
			from i := 1 until i > nb loop
				current_attached_attributes.force_last (l_list.item (i))
				i := i + 1
			end
			l_list.wipe_out
		end

	are_all_attached_attributes_initialized: BOOLEAN
			-- Are all attached attributes of `current_class` already initialized,
			-- or is the current code unreachable?
		do
			Result := current_initialization_scope.attributes_attached.count = current_attached_attributes.count or
				current_initialization_scope.is_code_unreachable
		ensure
			definition: Result = (current_initialization_scope.attributes_attached.count = current_attached_attributes.count
				or current_initialization_scope.is_code_unreachable)
		end

	add_non_initialized_attached_attributes_to_list (a_list: DS_ARRAYED_LIST [ET_ATTRIBUTE])
			-- Add non-initialized attached attributes to `a_list`.
		require
			a_list_not_void: a_list /= Void
			no_void_attribute: not a_list.has_void
		local
			l_attribute: ET_ATTRIBUTE
		do
			if not current_initialization_scope.is_code_unreachable then
				from current_attached_attributes.start until current_attached_attributes.after loop
					l_attribute := current_attached_attributes.item_for_iteration
					if not current_initialization_scope.has_attribute (l_attribute.name) then
						a_list.force_last (l_attribute)
					end
					current_attached_attributes.forth
				end
			end
		ensure
			no_void_attribute: not a_list.has_void
		end

	attribute_sorter: DS_QUICK_SORTER [ET_ATTRIBUTE]
			-- Attribute sorter by name

	current_creation_procedures: DS_HASH_SET [ET_PROCEDURE]
			-- Creation procedures of `current_class`

	build_current_creation_procedures
			-- Add to `current_creation_procedures` the
			-- creation procedures of `current_class`.
		local
			i, nb: INTEGER
			j, nb2: INTEGER
			l_creator: ET_CREATOR
		do
			current_creation_procedures.wipe_out
			if attached current_class.creators as l_creators then
				nb := l_creators.count
				from i := 1 until i > nb loop
					l_creator := l_creators.item (i)
					nb2 := l_creator.count
					from j := 1 until j > nb2 loop
						if attached current_class.seeded_procedure (l_creator.feature_name (j).seed) as l_procedure then
							current_creation_procedures.force (l_procedure)
						else
								-- Internal error: unknown creation procedure.
								-- This error should have been reported in previous compilation stages.
							set_fatal_error (current_class)
							error_handler.report_giaac_error (generator, "build_current_creation_procedures", 1, "unknown creation procedure `" + l_creator.feature_name (j).lower_name + "`.")
						end
						j := j + 1
					end
					i := i + 1
				end
			elseif attached current_class.seeded_procedure (current_system.default_create_seed) as l_procedure then
				current_creation_procedures.force (l_procedure)
			else
					-- Internal error: unknown default creation procedure.
					-- This error should have been reported in previous compilation stages.
				set_fatal_error (current_class)
				error_handler.report_giaac_error (generator, "build_current_creation_procedures", 2, "unknown default creation procedure.")
			end
		end

	current_initialization_scope: ET_ATTACHMENT_SCOPE
			-- Initialization scopes, to determine whether a given attached
			-- attribute has been initialized

	new_attachment_scope: ET_ATTACHMENT_SCOPE
			-- New attachment scope
		do
			if unused_attachment_scopes.is_empty then
				create Result.make
			else
				Result := unused_attachment_scopes.last
				unused_attachment_scopes.remove_last
			end
		ensure
			new_attachment_scope_not_void: Result /= Void
		end

	free_attachment_scope (a_attachment_scope: ET_ATTACHMENT_SCOPE)
			-- Free `a_attachment_scope' so that it can be reused.
		require
			a_attachment_scope_not_void: a_attachment_scope /= Void
		do
			a_attachment_scope.wipe_out
			unused_attachment_scopes.force_last (a_attachment_scope)
		end

	unused_attachment_scopes: DS_ARRAYED_LIST [ET_ATTACHMENT_SCOPE]
			-- Attachment scopes that are not currently used

	has_reference_actual_argument (a_arguments: ET_ACTUAL_ARGUMENTS): BOOLEAN
			-- Does `a_arguments` contain at least one expression which may be of reference type?
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
					set_fatal_error (current_class)
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

	pending_errors: DS_HASH_TABLE [ET_VALIDITY_ERROR, ET_CURRENT_OPERAND]
			-- Errors to be reported if the current operand (the key)
			-- is used before being fully initialized

	report_pending_errors
			-- Report pending errors.
		local
			l_current_not_initialized: DS_HASH_SET [ET_CURRENT_OPERAND]
		do
			l_current_not_initialized := current_initialization_scope.current_not_initialized
			if are_all_attached_attributes_initialized then
				-- Done.
			elseif not l_current_not_initialized.is_empty then
				from l_current_not_initialized.start until l_current_not_initialized.after loop
					pending_errors.search (l_current_not_initialized.item_for_iteration)
					if pending_errors.found then
						set_fatal_error (current_class)
						if error_handler.reportable_vevi_error (current_class) then
							error_handler.report_validity_error (pending_errors.found_item)
						end
						pending_errors.remove_found_item
					end
					l_current_not_initialized.forth
				end
			end
		end

	attribute_list: DS_ARRAYED_LIST [ET_ATTRIBUTE]
			-- List of attributes

	precursors: DS_HASH_SET [ET_FEATURE]
			-- Feature precursors used to build inherited assertions

	in_assertions: BOOLEAN
			-- Are we currently processing assertions?

	qualified_call_finder: ET_QUALIFIED_CALL_FINDER
			-- Finders of qualified calls

invariant

	current_creation_procedure_not_void: current_creation_procedure /= Void
	current_class_impl_not_void: current_class_impl /= Void
	current_closure_not_void: current_closure /= Void
	current_closure_impl_not_void: current_closure_impl /= Void
	current_attached_attributes_not_void: current_attached_attributes /= Void
	no_void_current_attached_attribute: not current_attached_attributes.has_void
	current_creation_procedures_not_void: current_creation_procedures /= Void
	no_void_current_creation_procedure: not current_creation_procedures.has_void
	current_initialization_scope_not_void: current_initialization_scope /= Void
	unused_attachment_scopes_not_void: unused_attachment_scopes /= Void
	no_void_unused_attachment_scope: not unused_attachment_scopes.has_void
	visited_features_not_void: visited_features /= Void
	no_void_visited_feature: not visited_features.has_void
	attribute_list_not_void: attribute_list /= Void
	no_void_attribute_in_list: not attribute_list.has_void
	pending_errors_not_void: pending_errors /= Void
	no_void_pending_error: not pending_errors.has_void_item
	precursors_not_void: precursors /= Void
	no_void_precursor: not precursors.has_void
	expression_type_finder_not_void: expression_type_finder /= Void
	internal_type_context_not_void: internal_type_context /= Void
	attribute_sorter_not_void: attribute_sorter /= Void
	qualified_call_finder_not_void: qualified_call_finder /= Void

end
