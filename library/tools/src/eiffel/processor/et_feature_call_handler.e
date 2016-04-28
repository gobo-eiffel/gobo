note

	description:

		"Eiffel feature call handlers: traverse features and report when feature calls are found."

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: 2010/04/06 $"
	revision: "$Revision: #12 $"

class ET_FEATURE_CALL_HANDLER

inherit

	ET_CLASS_SUBPROCESSOR
		redefine
			make
		end

	ET_AST_NULL_PROCESSOR
		undefine
			make
		redefine
			process_across_expression,
			process_across_instruction,
			process_actual_parameter_list,
			process_actual_parameter_sublist,
			process_agent_argument_operand_list,
			process_agent_typed_open_argument,
			process_agent_open_target,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_binary_integer_constant,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_check_instruction,
			process_choice_list,
			process_choice_range,
			process_class_type,
			process_compound,
			process_constant_attribute,
			process_convert_builtin_expression,
			process_convert_from_expression,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_attribute,
			process_dotnet_constant_attribute,
			process_dotnet_function,
			process_dotnet_procedure,
			process_elseif_part,
			process_elseif_part_list,
			process_equality_expression,
			process_expression_address,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_feature_address,
			process_formal_argument,
			process_formal_argument_list,
			process_hexadecimal_integer_constant,
			process_identifier,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inspect_instruction,
			process_invariants,
			process_like_feature,
			process_local_variable,
			process_local_variable_list,
			process_loop_instruction,
			process_loop_invariants,
			process_manifest_array,
			process_manifest_tuple,
			process_manifest_type,
			process_named_object_test,
			process_object_equality_expression,
			process_object_test,
			process_octal_integer_constant,
			process_old_expression,
			process_old_object_test,
			process_once_function,
			process_once_function_inline_agent,
			process_once_manifest_string,
			process_once_procedure,
			process_once_procedure_inline_agent,
			process_parenthesized_expression,
			process_postconditions,
			process_preconditions,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_qualified_call_expression,
			process_qualified_call_instruction,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_strip_expression,
			process_tagged_assertion,
			process_tuple_type,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unfolded_empty_tuple_actual_parameters,
			process_unfolded_tuple_actual_parameters,
			process_unique_attribute,
			process_unqualified_call_expression,
			process_unqualified_call_instruction,
			process_variant,
			process_verbatim_string,
			process_when_part,
			process_when_part_list
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new feature call handler.
		do
			create expression_type_finder.make
			expression_type_finder.set_internal_error_enabled (internal_error_enabled)
			current_class := tokens.unknown_class
			current_type := current_class
			current_feature := dummy_feature
			current_feature_impl := dummy_feature.implementation_feature
			current_class_impl := current_feature_impl.implementation_class
			create current_context.make_with_capacity (current_type, 10)
			create enclosing_inline_agents.make (10)
		end

feature -- Processing

	process_feature (a_feature: ET_FEATURE; a_current_type: ET_BASE_TYPE)
			-- Traverse `a_feature' in `a_current_type' and report when feature calls
			-- are found using 'report_*' features that can be redefined in descendants.
			-- Set `has_fatal_error' if a fatal error occurred.
			--
			-- Note that it is assumed that `a_feature' has been successfully checked
			-- in the context of `a_current_type' (using ET_FEATURE_CHECKER for example).
			-- Otherwise internal errors may be reported (using ET_ERROR_HANDLER.report_giaaa_error)
			-- if `a_feature' has not been checked or if `internal_error_enabled' has been set.
		require
			a_feature_not_void: a_feature /= Void
			a_current_type_not_void: a_current_type /= Void
			a_current_type_valid: a_current_type.is_valid_context
			a_current_class_preparsed: a_current_type.base_class.is_preparsed
		local
			l_feature_impl: ET_FEATURE
			l_class_impl: ET_CLASS
			old_feature: ET_STANDALONE_CLOSURE
			old_feature_impl: ET_STANDALONE_CLOSURE
			old_class: ET_CLASS
			old_class_impl: ET_CLASS
			old_type: ET_BASE_TYPE
		do
			reset_fatal_error (False)
			l_feature_impl := a_feature.implementation_feature
			l_class_impl := a_feature.implementation_class
			if not l_class_impl.is_preparsed then
		 			-- Internal error: we should already have reported a VTCT error
					-- somewhere stating that `l_class_impl' (which is supposed to
					-- be an ancestor of `l_class') does not exist.
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				old_feature_impl := current_feature_impl
				current_feature_impl := l_feature_impl
				old_feature := current_feature
				current_feature := a_feature
				old_class := current_class
				current_class := a_current_type.base_class
				old_type := current_type
				current_type := a_current_type
				old_class_impl := current_class_impl
				current_class_impl := l_class_impl
				a_feature.process (Current)
				current_class := old_class
				current_type := old_type
				current_class_impl := old_class_impl
				current_feature := old_feature
				current_feature_impl := old_feature_impl
			end
		end

feature -- Status report

	assertions_enabled: BOOLEAN
			-- Should feature calls appearing in assertions be reported?
			--
			-- Note that in the current implementation, inherited assertions
			-- and class invariants are not taken into account even when
			-- this boolean query is set to True.

	debug_instructions_enabled: BOOLEAN
			-- Should feature calls appearing in debug instructions be reported?

	anchored_types_enabled: BOOLEAN
			-- Should feature appearing as anchor of an anchored type be reported?

	internal_error_enabled: BOOLEAN
			-- Should an internal error be reported even when errors have already
			-- been reported on the feature being processed?

feature -- Status setting

	set_assertions_enabled (b: BOOLEAN)
			-- Set `assertions_enabled' to `b'.
		do
			assertions_enabled := b
		ensure
			assertions_enabled_set: assertions_enabled = b
		end

	set_debug_instructions_enabled (b: BOOLEAN)
			-- Set `debug_instructions_enabled' to `b'.
		do
			debug_instructions_enabled := b
		ensure
			debug_instructions_enabled_set: debug_instructions_enabled = b
		end

	set_anchored_types_enabled (b: BOOLEAN)
			-- Set `anchored_types_enabled' to `b'.
		do
			anchored_types_enabled := b
		ensure
			anchored_types_enabled_set: anchored_types_enabled = b
		end

	set_internal_error_enabled (b: BOOLEAN)
			-- Set `internal_error_enabled' to `b'.
		do
			internal_error_enabled := b
			expression_type_finder.set_internal_error_enabled (b)
		ensure
			internal_error_enabled_set: internal_error_enabled = b
		end

feature {NONE} -- Event handling

	report_polymorphic_feature_call (a_feature: ET_FEATURE; a_target_class: ET_CLASS)
			-- Report a call to `a_feature' where its versions in descendants of
			-- `a_target_class' should be taken into account.
		require
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
		do
		end

	report_monomorphic_feature_call (a_feature: ET_FEATURE; a_target_class: ET_CLASS)
			-- Report a call to `a_feature' where its versions in descendants of
			-- `a_target_class' should not be taken into account.
		require
			a_feature_not_void: a_feature /= Void
			a_target_class_not_void: a_target_class /= Void
		do
		end

	report_anchored_type (a_type: ET_LIKE_FEATURE; a_query: ET_QUERY)
			-- Report that the anchored type `a_type' has been processed
			-- with `a_query' as its anchor.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
			a_type_feature_anchored: not a_type.is_like_argument
			a_query_not_void: a_query /= Void
		do
		end

	report_attribute_address (an_expression: ET_FEATURE_ADDRESS; an_attribute: ET_QUERY)
			-- Report that attribute `an_attribute' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
			report_polymorphic_feature_call (an_attribute, current_class)
		end

	report_attribute_assignment_target (a_writable: ET_WRITABLE; an_attribute: ET_QUERY)
			-- Report that attribute `an_attribute' has been processed
			-- as target `a_writable' of an assignment (attempt).
		require
			no_error: not has_fatal_error
			a_writable_not_void: a_writable /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
			report_polymorphic_feature_call (an_attribute, current_class)
		end

	report_attribute_not_stripped (an_expression: ET_STRIP_EXPRESSION; an_attribute: ET_QUERY)
			-- Report that attribute `an_attribute' has not been stripped
			-- when processing the strip expression `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			an_attribute_not_void: an_attribute /= Void
			is_attribute: an_attribute.is_attribute
		do
		end

	report_creation_expression (an_expression: ET_EXPRESSION; a_creation_type: ET_TYPE_CONTEXT;
		a_procedure: ET_PROCEDURE; an_actuals: detachable ET_ACTUAL_ARGUMENTS)
			-- Report that a creation expression `an_expression' has been processed,
			-- where `a_creation_type' is the creation type and `a_procedure' is the creation procedure.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_creation_type_not_void: a_creation_type /= Void
			a_creation_type_valid: a_creation_type.is_valid_context
			a_procedure_not_void: a_procedure /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_creation_type.base_class
			report_polymorphic_feature_call (a_procedure, l_base_class)
		end

	report_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION; a_creation_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE)
			-- Report that a creation instruction `an_instruction' has been processed,
			-- where `a_creation_type' is the creation type and `a_procedure' is the creation procedure.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_creation_type_not_void: a_creation_type /= Void
			a_creation_type_valid: a_creation_type.is_valid_context
			a_procedure_not_void: a_procedure /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_creation_type.base_class
			report_polymorphic_feature_call (a_procedure, l_base_class)
		end

	report_function_address (an_expression: ET_FEATURE_ADDRESS; a_query: ET_QUERY)
			-- Report that function `a_query' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_query_not_void: a_query /= Void
		do
			if a_query = current_feature then
					-- Recursive use.
				report_monomorphic_feature_call (a_query, current_class)
			else
				report_polymorphic_feature_call (a_query, current_class)
			end
		end

	report_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION; a_parent_type: ET_BASE_TYPE; a_query: ET_QUERY)
			-- Report that a precursor expression has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_query' is the precursor feature.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_query_not_void: a_query /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_parent_type.base_class
			report_monomorphic_feature_call (a_query, l_base_class)
		end

	report_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION; a_parent_type: ET_BASE_TYPE; a_procedure: ET_PROCEDURE)
			-- Report that a precursor instruction has been processed.
			-- `a_parent_type' is viewed in the context of `current_type'
			-- and `a_procedure' is the precursor feature.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_parent_type_not_void: a_parent_type /= Void
			a_procedure_not_void: a_procedure /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_parent_type.base_class
			report_monomorphic_feature_call (a_procedure, l_base_class)
		end

	report_procedure_address (an_expression: ET_FEATURE_ADDRESS; a_procedure: ET_PROCEDURE)
			-- Report that procedure `a_procedure' has been processed
			-- as target of feature address `an_expression'.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_procedure_not_void: a_procedure /= Void
		do
			if current_feature = a_procedure then
					-- Recursive use.
				report_monomorphic_feature_call (a_procedure, current_class)
			else
				report_polymorphic_feature_call (a_procedure, current_class)
			end
		end

	report_qualified_anchored_type (a_type: ET_QUALIFIED_LIKE_IDENTIFIER; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY)
			-- Report that the qualified anchored type `a_type' has been processed
			-- with `a_query' from `a_target_type' as its anchor.
		require
			no_error: not has_fatal_error
			a_type_not_void: a_type /= Void
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_query_not_void: a_query /= Void
		do
		end

	report_qualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY)
			-- Report that a qualified call expression `an_expression' has been processed,
			-- where `a_target_type' is the type of the target and `a_query' is the
			-- query being called.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call: an_expression.is_qualified_call
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_query_not_void: a_query /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_target_type.base_class
			report_polymorphic_feature_call (a_query, l_base_class)
		end

	report_qualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE)
			-- Report that a qualified call instruction `an_instruction' has been processed,
			-- where `a_target_type' is the type of the target and `a_procedure' is the
			-- procedure being called.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			qualified_call: an_instruction.is_qualified_call
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_procedure_not_void: a_procedure /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_target_type.base_class
			report_polymorphic_feature_call (a_procedure, l_base_class)
		end

	report_qualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_target_type: ET_TYPE_CONTEXT; a_procedure: ET_PROCEDURE)
			-- Report that a qualified procedure call agent `an_agent' has been processed,
			-- where `a_procedure' is the procedure being called by the agent and
			-- `a_target_type' is the type of the target of that call.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_procedure_not_void: a_procedure /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_target_type.base_class
			report_polymorphic_feature_call (a_procedure, l_base_class)
		end

	report_qualified_query_call_agent (an_expression: ET_CALL_AGENT; a_target_type: ET_TYPE_CONTEXT; a_query: ET_QUERY)
			-- Report that a qualified query call agent `an_expression' has been processed.
			-- where `a_query' is the query being called by the agent and
			-- `a_target_type' is the type of the target of that call.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			a_target_type_not_void: a_target_type /= Void
			a_target_type_valid: a_target_type.is_valid_context
			a_query_not_void: a_query /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_target_type.base_class
			report_polymorphic_feature_call (a_query, l_base_class)
		end

	report_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION; a_type: ET_TYPE; a_query: ET_QUERY)
			-- Report that a static call expression `an_expression' has been processed,
			-- where `a_query' is the query being called anf `a_type' is the type
			-- as declared in the class where `an_expression' was written.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			a_type_not_void: a_type /= Void
			a_query_not_void: a_query /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_type.base_class (current_class)
			report_polymorphic_feature_call (a_query, l_base_class)
		end

	report_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION; a_type: ET_TYPE; a_procedure: ET_PROCEDURE)
			-- Report that a static call instruction `an_instruction' has been processed,
			-- where `a_procedure' is the procedure being called anf `a_type' is the type
			-- as declared in the class where `an_expression' was written.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			a_type_not_void: a_type /= Void
			a_procedure_not_void: a_procedure /= Void
		local
			l_base_class: ET_CLASS
		do
			l_base_class := a_type.base_class (current_class)
			report_polymorphic_feature_call (a_procedure, l_base_class)
		end

	report_unqualified_call_expression (an_expression: ET_FEATURE_CALL_EXPRESSION; a_query: ET_QUERY)
			-- Report that an unqualified call expression `an_expression' has been processed,
			-- where `a_query' is the query being called.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call: not an_expression.is_qualified_call
			a_query_not_void: a_query /= Void
		do
			if current_feature = a_query then
					-- Recursive call.
				report_monomorphic_feature_call (a_query, current_class)
			else
				report_polymorphic_feature_call (a_query, current_class)
			end
		end

	report_unqualified_call_instruction (an_instruction: ET_FEATURE_CALL_INSTRUCTION; a_procedure: ET_PROCEDURE)
			-- Report that an unqualified call instruction `an_instruction' has been processed,
			-- where `a_procedure' is the procedure being called.
		require
			no_error: not has_fatal_error
			an_instruction_not_void: an_instruction /= Void
			unqualified_call: not an_instruction.is_qualified_call
			a_procedure_not_void: a_procedure /= Void
		do
			if current_feature = a_procedure then
					-- Recursive call.
				report_monomorphic_feature_call (a_procedure, current_class)
			else
				report_polymorphic_feature_call (a_procedure, current_class)
			end
		end

	report_unqualified_procedure_call_agent (an_expression: ET_CALL_AGENT; a_procedure: ET_PROCEDURE)
			-- Report that an unqualified procedure call agent `an_expression' has been processed,
			-- where `a_procedure' is the procedure being called by the agent.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			procedure_call: an_expression.is_procedure
			a_procedure_not_void: a_procedure /= Void
		do
			if current_feature = a_procedure then
					-- Recursive use.
				report_monomorphic_feature_call (a_procedure, current_class)
			else
				report_polymorphic_feature_call (a_procedure, current_class)
			end
		end

	report_unqualified_query_call_agent (an_expression: ET_CALL_AGENT; a_query: ET_QUERY)
			-- Report that an unqualified query call agent `an_expression' has been processed,
			-- where `a_query' is the query being called by the agent.
		require
			no_error: not has_fatal_error
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
			query_call: not an_expression.is_procedure
			a_query_not_void: a_query /= Void
		do
			if current_feature = a_query then
					-- Recursive use.
				report_monomorphic_feature_call (a_query, current_class)
			else
				report_polymorphic_feature_call (a_query, current_class)
			end
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (an_expression.iterable_expression)
			had_error := has_fatal_error
			if assertions_enabled then
				if attached an_expression.invariant_part as l_invariant_part then
					process_loop_invariants (l_invariant_part)
					had_error := had_error or has_fatal_error
				end
			end
			if attached an_expression.until_conditional as l_conditional then
				process_expression (l_conditional.expression)
			end
			had_error := had_error or has_fatal_error
			process_expression (an_expression.iteration_conditional.expression)
			had_error := had_error or has_fatal_error
			if assertions_enabled then
				if attached an_expression.variant_part as l_variant_part then
					process_variant (l_variant_part)
					had_error := had_error or has_fatal_error
				end
			end
			process_expression (an_expression.new_cursor_expression)
			had_error := had_error or has_fatal_error
			process_expression (an_expression.cursor_after_expression)
			had_error := had_error or has_fatal_error
			an_expression.cursor_forth_instruction.process (Current)
			had_error := had_error or has_fatal_error
			reset_fatal_error (had_error)
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (an_instruction.iterable_expression)
			had_error := has_fatal_error
			if attached an_instruction.from_compound as l_from_compound then
				process_compound (l_from_compound)
				had_error := had_error or has_fatal_error
			end
			if assertions_enabled then
				if attached an_instruction.invariant_part as l_invariant_part then
					process_loop_invariants (l_invariant_part)
					had_error := had_error or has_fatal_error
				end
			end
			if attached an_instruction.until_conditional as l_conditional then
				process_expression (l_conditional.expression)
			end
			had_error := had_error or has_fatal_error
			if attached an_instruction.loop_compound as l_loop_compound then
				process_compound (l_loop_compound)
				had_error := had_error or has_fatal_error
			end
			if assertions_enabled then
				if attached an_instruction.variant_part as l_variant_part then
					process_variant (l_variant_part)
					had_error := had_error or has_fatal_error
				end
			end
			process_expression (an_instruction.new_cursor_expression)
			had_error := had_error or has_fatal_error
			process_expression (an_instruction.cursor_after_expression)
			had_error := had_error or has_fatal_error
			an_instruction.cursor_forth_instruction.process (Current)
			had_error := had_error or has_fatal_error
			reset_fatal_error (had_error)
		end

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				process_expression (a_list.actual_argument (i))
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_actual_parameters (a_list)
		end

	process_actual_parameter_sublist (a_list: ET_ACTUAL_PARAMETER_SUBLIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_actual_parameters (a_list)
		end

	process_actual_parameters (a_list: ET_ACTUAL_PARAMETERS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				nb := a_list.count
				from i := 1 until i > nb loop
					process_type (a_list.type (i))
					had_error := had_error or has_fatal_error
					i := i + 1
				end
			end
			reset_fatal_error (had_error)
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.actual_argument (i).process (Current)
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET)
			-- Process `a_target'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (a_target.type)
			end
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT)
			-- Process `an_argument'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (an_argument.type)
			end
		end

	process_assertion (an_assertion: ET_ASSERTION)
			-- Process `an_assertion'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_assertion_not_void: an_assertion /= Void
		do
			reset_fatal_error (False)
			if assertions_enabled then
				an_assertion.process (Current)
			end
		end

	process_assertions (a_list: ET_ASSERTIONS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if assertions_enabled then
				nb := a_list.count
				from i := 1 until i > nb loop
					process_assertion (a_list.assertion (i))
					had_error := had_error or has_fatal_error
					i := i + 1
				end
			end
			reset_fatal_error (had_error)
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_instruction (an_instruction)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_writable (an_instruction.target)
			had_error := has_fatal_error
			process_expression (an_instruction.source)
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_writable (an_instruction.target)
			had_error := has_fatal_error
			process_expression (an_instruction.source)
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (a_feature.type)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_creation_instruction (an_instruction)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_integer_constant (a_constant)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_expression (an_expression)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_character_constant (a_constant)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_character_constant (a_constant)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_character_constant (a_constant)
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_target: ET_AGENT_TARGET
		do
			if not an_expression.is_qualified_call then
				process_unqualified_call_agent (an_expression)
			else
				l_target := an_expression.target
				if attached {ET_EXPRESSION} l_target as l_expression_target then
					process_qualified_call_agent (an_expression, l_expression_target)
				elseif attached {ET_AGENT_OPEN_TARGET} l_target as l_type_target then
					process_typed_call_agent (an_expression, l_type_target)
				else
						-- Internal error: no other kind of targets.
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
			end
		end

	process_character_constant (a_constant: ET_CHARACTER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_constant.cast_type as l_type then
					process_type (l_type.type)
				end
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if attached an_instruction.then_compound as l_then_compound then
				process_compound (l_then_compound)
				had_error := has_fatal_error
				process_assertions (an_instruction)
				had_error := had_error or has_fatal_error
				reset_fatal_error (had_error)
			elseif assertions_enabled then
				process_assertions (an_instruction)
			end
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.choice (i).process (Current)
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE)
			-- Process `a_choice'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (a_choice.lower)
			had_error := has_fatal_error
			process_expression (a_choice.upper)
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_type.actual_parameters as l_actual_parameters then
					process_actual_parameters (l_actual_parameters)
				end
			end
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (a_feature.type)
				had_error := has_fatal_error
					-- The constant can be prefixed by its type.
				process_expression (a_feature.constant)
				reset_fatal_error (had_error or has_fatal_error)
			end
		end

	process_convert_builtin_expression (an_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression (an_expression.expression)
		end

	process_convert_from_expression (an_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_creation_expression (an_expression)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_expression (an_expression)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_creation_expression (an_expression)
		end

	process_creation_expression (an_expression: ET_CREATION_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
		local
			l_type: ET_TYPE
			l_seed: INTEGER
			l_context: ET_NESTED_TYPE_CONTEXT
			l_class: ET_CLASS
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_type := an_expression.type
			if anchored_types_enabled then
				process_type (l_type)
				had_error := has_fatal_error
			end
			if attached an_expression.name as l_name then
				if attached an_expression.arguments as l_arguments then
					process_actual_arguments (l_arguments)
					had_error := had_error or has_fatal_error
				end
				l_seed := l_name.seed
			else
				l_seed := current_system.default_create_seed
			end
			l_context := current_context
			l_context.reset (current_type)
			l_context.force_last (l_type)
			if not has_fatal_error then
				l_class := l_context.base_class
				if attached l_class.seeded_procedure (l_seed) as l_procedure then
					report_creation_expression (an_expression, l_context, l_procedure, an_expression.arguments)
				else
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
				reset_fatal_error (had_error)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_creation_instruction (an_instruction)
		end

	process_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_instruction_not_void: an_instruction /= Void
		local
			l_type: detachable ET_TYPE
			l_seed: INTEGER
			l_context: ET_NESTED_TYPE_CONTEXT
			l_class: ET_CLASS
			l_target: ET_WRITABLE
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_type := an_instruction.type
			if anchored_types_enabled then
				if l_type /= Void then
					process_type (l_type)
					had_error := has_fatal_error
				end
			end
			l_target := an_instruction.target
			process_writable (l_target)
			had_error := had_error or has_fatal_error
			if attached an_instruction.creation_call as l_call then
				if attached l_call.arguments as l_arguments then
					process_actual_arguments (l_arguments)
					had_error := had_error or has_fatal_error
				end
				l_seed := l_call.name.seed
			else
				l_seed := current_system.default_create_seed
			end
			l_context := current_context
			l_context.reset (current_type)
			if l_type /= Void then
				reset_fatal_error (False)
				l_context.force_last (l_type)
			else
				find_expression_type (l_target, l_context)
			end
			if not has_fatal_error then
				l_class := l_context.base_class
				if attached l_class.seeded_procedure (l_seed) as l_procedure then
					report_creation_instruction (an_instruction, l_context, l_procedure)
				else
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
				reset_fatal_error (had_error)
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if debug_instructions_enabled then
				if attached an_instruction.compound as l_compound then
					process_compound (l_compound)
				end
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_deferred_routine (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_deferred_routine (a_feature)
		end

	process_deferred_routine (a_feature: ET_DEFERRED_ROUTINE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_feature.arguments as l_arguments then
					process_formal_argument_list (l_arguments)
					had_error := has_fatal_error
				end
				if attached a_feature.type as l_type then
					process_type (l_type)
					had_error := had_error or has_fatal_error
				end
			end
			if assertions_enabled then
				if attached a_feature.preconditions as l_preconditions then
					process_preconditions (l_preconditions)
					had_error := had_error or has_fatal_error
				end
				if attached a_feature.postconditions as l_postconditions then
					process_postconditions (l_postconditions)
					had_error := had_error or has_fatal_error
				end
			end
			reset_fatal_error (had_error)
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine (a_feature)
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine (a_feature)
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_attribute (a_feature)
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_constant_attribute (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_feature.arguments as l_arguments then
					process_formal_argument_list (l_arguments)
					had_error := has_fatal_error
				end
				process_type (a_feature.type)
				reset_fatal_error (had_error or has_fatal_error)
			end
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_feature.arguments as l_arguments then
					process_formal_argument_list (l_arguments)
				end
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (an_elseif_part.expression)
			if attached an_elseif_part.then_compound as l_then_compound then
				had_error := has_fatal_error
				process_compound (l_then_compound)
				reset_fatal_error (had_error or has_fatal_error)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (an_expression.left)
			had_error := has_fatal_error
			process_expression (an_expression.right)
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_expression (a_expression: ET_EXPRESSION)
			-- Process `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
		do
			reset_fatal_error (False)
			a_expression.process (Current)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression (an_expression.expression)
		end

	process_expression_list (a_list: ET_EXPRESSION_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				process_expression (a_list.expression (i))
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_extended_attribute_closure (a_feature)
		end

	process_extended_attribute_closure (a_feature: ET_EXTENDED_ATTRIBUTE_CLOSURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (a_feature.type)
				had_error := had_error or has_fatal_error
			end
			if assertions_enabled then
				if attached a_feature.preconditions as l_preconditions then
					process_preconditions (l_preconditions)
					had_error := had_error or has_fatal_error
				end
			end
			if anchored_types_enabled then
				if attached a_feature.locals as l_locals then
					process_local_variable_list (l_locals)
					had_error := had_error or has_fatal_error
				end
			end
			if attached a_feature.compound as l_compound then
				process_compound (l_compound)
				had_error := had_error or has_fatal_error
			end
			if assertions_enabled then
				if attached a_feature.postconditions as l_postconditions then
					process_postconditions (l_postconditions)
					had_error := had_error or has_fatal_error
				end
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				process_compound (l_rescue_clause)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_external_routine (a_feature)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_external_routine_inline_agent (an_expression)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_external_routine (a_feature)
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_external_routine_inline_agent (an_expression)
		end

	process_external_routine (a_feature: ET_EXTERNAL_ROUTINE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_external_routine_closure (a_feature)
		end

	process_external_routine_closure (a_feature: ET_EXTERNAL_ROUTINE_CLOSURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_feature.arguments as l_arguments then
					process_formal_argument_list (l_arguments)
					had_error := has_fatal_error
				end
				if attached a_feature.type as l_type then
					process_type (l_type)
					had_error := had_error or has_fatal_error
				end
			end
			if assertions_enabled then
				if attached a_feature.preconditions as l_preconditions then
					process_preconditions (l_preconditions)
					had_error := had_error or has_fatal_error
				end
				if attached a_feature.postconditions as l_postconditions then
					process_postconditions (l_postconditions)
					had_error := had_error or has_fatal_error
				end
			end
			reset_fatal_error (had_error)
		end

	process_external_routine_inline_agent (an_expression: ET_EXTERNAL_ROUTINE_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
			process_external_routine_closure (an_expression)
			had_error := has_fatal_error
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_seed := l_name.seed
			if l_name.is_argument then
				-- Do nothing
			elseif l_name.is_local then
				-- Do nothing
			elseif l_name.is_object_test_local then
				-- Do nothing
			elseif l_name.is_across_cursor then
				-- Do nothing
			elseif attached current_class.seeded_procedure (l_seed) as l_procedure then
					-- This is of the form '$procedure_name'.
				report_procedure_address (an_expression, l_procedure)
			elseif attached current_class.seeded_query (l_seed) as l_query then
					-- This is of the form '$query_name'.
				if l_query.is_attribute then
					report_attribute_address (an_expression, l_query)
				else
					report_function_address (an_expression, l_query)
				end
			else
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT)
			-- Process `an_argument'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if an_argument.is_last_entity then
					process_type (an_argument.type)
				end
			end
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				nb := a_list.count
				from i := 1 until i > nb loop
					process_formal_argument (a_list.formal_argument (i))
					had_error := had_error or has_fatal_error
					i := i + 1
				end
				reset_fatal_error (had_error)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_integer_constant (a_constant)
		end

	process_identifier (an_identifier: ET_IDENTIFIER)
			-- Process `an_identifier'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if an_identifier.is_argument then
				-- Do nothing
			elseif an_identifier.is_local then
				-- Do nothing
			elseif an_identifier.is_object_test_local then
				-- Do nothing
			elseif an_identifier.is_across_cursor then
				-- Do nothing
			elseif an_identifier.is_instruction then
				process_unqualified_feature_call_instruction (an_identifier)
			else
				process_unqualified_feature_call_expression (an_identifier)
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (an_instruction.expression)
			had_error := has_fatal_error
			if attached an_instruction.then_compound as l_then_compound then
				process_compound (l_then_compound)
				had_error := had_error or has_fatal_error
			end
			if attached an_instruction.elseif_parts as l_elseif_parts then
				process_elseif_part_list (l_elseif_parts)
				had_error := had_error or has_fatal_error
			end
			if attached an_instruction.else_compound as l_else_compound then
				process_compound (l_else_compound)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression (an_expression.expression)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_expression (an_expression)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_expression (an_instruction.expression)
			had_error := has_fatal_error
			if attached an_instruction.when_parts as l_when_parts then
				process_when_part_list (l_when_parts)
				had_error := had_error or has_fatal_error
			end
			if attached an_instruction.else_compound as l_else_compound then
				process_compound (l_else_compound)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_integer_constant (a_constant: ET_INTEGER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_constant.cast_type as l_type then
					process_type (l_type.type)
				end
			end
		end

	process_internal_routine (a_feature: ET_INTERNAL_ROUTINE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_internal_routine_closure (a_feature)
		end

	process_internal_routine_closure (a_feature: ET_INTERNAL_ROUTINE_CLOSURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_feature_not_void: a_feature /= Void
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_feature.arguments as l_arguments then
					process_formal_argument_list (l_arguments)
					had_error := has_fatal_error
				end
				if attached a_feature.type as l_type then
					process_type (l_type)
					had_error := had_error or has_fatal_error
				end
			end
			if assertions_enabled then
				if attached a_feature.preconditions as l_preconditions then
					process_preconditions (l_preconditions)
					had_error := had_error or has_fatal_error
				end
			end
			if anchored_types_enabled then
				if attached a_feature.locals as l_locals then
					process_local_variable_list (l_locals)
					had_error := had_error or has_fatal_error
				end
			end
			if attached a_feature.compound as l_compound then
				process_compound (l_compound)
				had_error := had_error or has_fatal_error
			end
			if assertions_enabled then
				if attached a_feature.postconditions as l_postconditions then
					process_postconditions (l_postconditions)
					had_error := had_error or has_fatal_error
				end
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				process_compound (l_rescue_clause)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_internal_routine_inline_agent (an_expression: ET_INTERNAL_ROUTINE_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
				-- Manage enclosing inline agents stack.
			if attached current_inline_agent as l_current_inline_agent then
				enclosing_inline_agents.force_last (l_current_inline_agent)
			end
			current_inline_agent := an_expression
			process_internal_routine_closure (an_expression)
			had_error := has_fatal_error
				-- Manage enclosing inline agents stack.
			if not enclosing_inline_agents.is_empty then
				current_inline_agent := enclosing_inline_agents.last
				enclosing_inline_agents.remove_last
			else
				current_inline_agent := Void
			end
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_assertions (a_list)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_seed: INTEGER
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if not a_type.is_like_argument then
					l_seed := a_type.seed
					if attached current_class.seeded_query (l_seed) as l_query then
						report_anchored_type (a_type, l_query)
					else
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				end
			end
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE)
			-- Process `a_local'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if a_local.is_used then
					process_type (a_local.type)
				end
			end
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				nb := a_list.count
				from i := 1 until i > nb loop
					process_local_variable (a_list.local_variable (i))
					had_error := had_error or has_fatal_error
					i := i + 1
				end
			end
			reset_fatal_error (had_error)
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if attached an_instruction.from_compound as l_from_compound then
				process_compound (l_from_compound)
				had_error := has_fatal_error
			end
			if assertions_enabled then
				if attached an_instruction.invariant_part as l_invariant_part then
					process_loop_invariants (l_invariant_part)
					had_error := had_error or has_fatal_error
				end
			end
			process_expression (an_instruction.until_expression)
			had_error := had_error or has_fatal_error
			if attached an_instruction.loop_compound as l_loop_compound then
				process_compound (l_loop_compound)
				had_error := had_error or has_fatal_error
			end
			if assertions_enabled then
				if attached an_instruction.variant_part as l_variant_part then
					process_variant (l_variant_part)
					had_error := had_error or has_fatal_error
				end
			end
			reset_fatal_error (had_error)
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if assertions_enabled then
				process_assertions (a_list)
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression_list (an_expression)
		end

	process_manifest_string (a_string: ET_MANIFEST_STRING)
			-- Process `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_string_not_void: a_string /= Void
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_string.cast_type as l_type then
					process_type (l_type.type)
				end
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression_list (an_expression)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (an_expression.type)
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_object_test (an_expression)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_expression (an_expression)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached an_expression.type as l_type then
					process_type (l_type)
					had_error := has_fatal_error
				end
			end
			process_expression (an_expression.expression)
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_integer_constant (a_constant)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression (an_expression.expression)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_object_test (an_expression)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine (a_feature)
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_once_manifest_string (a_string: ET_ONCE_MANIFEST_STRING)
			-- Process `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_manifest_string (a_string.manifest_string)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine (a_feature)
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_expression (an_expression.expression)
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if assertions_enabled then
				process_assertions (a_list)
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if assertions_enabled then
				process_assertions (a_list)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_parent_type: detachable ET_BASE_TYPE
			l_class: ET_CLASS
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if attached an_expression.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := has_fatal_error
			end
			reset_fatal_error (False)
			l_parent_type := an_expression.parent_type
			if l_parent_type = Void then
					-- Internal error: the Precursor construct should
					-- already have been resolved when flattening the
					-- features of `current_class_impl'.
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_precursor_keyword := an_expression.precursor_keyword
				l_class := l_parent_type.base_class
				if not attached l_class.seeded_query (l_precursor_keyword.seed) as l_query then
						-- Internal error: the Precursor construct should
						-- already have been resolved when flattening the
						-- features of `current_class_impl'.
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					if current_class /= current_class_impl and l_parent_type.is_generic then
							-- Resolve generic parameters in the
							-- context of `current_type'.
						if attached current_class.ancestor (l_parent_type) as l_ancestor then
							l_parent_type := l_ancestor
						else
								-- Internal error: `l_parent_type' is an ancestor
								-- of `current_class_impl', and hence of `current_class'.
							set_fatal_error
							if internal_error_enabled or not current_class.has_implementation_error then
								error_handler.report_giaaa_error
							end
						end
					end
					if not has_fatal_error then
						report_precursor_expression (an_expression, l_parent_type, l_query)
					end
				end
			end
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_precursor_keyword: ET_PRECURSOR_KEYWORD
			l_parent_type: detachable ET_BASE_TYPE
			l_class: ET_CLASS
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if attached an_instruction.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := has_fatal_error
			end
			reset_fatal_error (False)
			l_parent_type := an_instruction.parent_type
			if l_parent_type = Void then
					-- Internal error: the Precursor construct should
					-- already have been resolved when flattening the
					-- features of `l_class_impl'.
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			else
				l_precursor_keyword := an_instruction.precursor_keyword
				l_class := l_parent_type.base_class
				if not attached l_class.seeded_procedure (l_precursor_keyword.seed) as l_procedure then
						-- Internal error: the Precursor construct should
						-- already have been resolved when flattening the
						-- features of `current_class_impl'.
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				else
					if current_class /= current_class_impl and l_parent_type.is_generic then
							-- Resolve generic parameters in the context of `current_type'.
						if attached current_class.ancestor (l_parent_type) as l_ancestor then
							l_parent_type := l_ancestor
						else
								-- Internal error: `l_parent_type' is an ancestor
								-- of `current_class_impl', and hence of `current_class'.
							set_fatal_error
							if internal_error_enabled or not current_class.has_implementation_error then
								error_handler.report_giaaa_error
							end
						end
					end
					if not has_fatal_error then
						report_precursor_instruction (an_instruction, l_parent_type, l_procedure)
					end
				end
			end
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_expression (an_expression)
		end

	process_qualified_call_agent (an_expression: ET_CALL_AGENT; a_target: ET_EXPRESSION)
			-- Process a qualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
			l_seed: INTEGER
			l_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_seed := l_name.seed
			if l_name.is_tuple_label then
				-- Do nothing.
			elseif an_expression.is_procedure then
				l_context := current_context
				l_context.reset (current_type)
				find_expression_type (a_target, l_context)
				if not has_fatal_error then
					l_class := l_context.base_class
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						report_qualified_procedure_call_agent (an_expression, l_context, l_procedure)
					else
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				end
			else
				l_context := current_context
				l_context.reset (current_type)
				find_expression_type (a_target, l_context)
				if not has_fatal_error then
					l_class := l_context.base_class
					if attached l_class.seeded_query (l_seed) as l_query then
						report_qualified_query_call_agent (an_expression, l_context, l_query)
					else
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
					end
				end
			end
			had_error := has_fatal_error
			process_expression (a_target)
			had_error := had_error or has_fatal_error
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_expression (an_expression)
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_feature_call_instruction (an_instruction)
		end

	process_qualified_feature_call_expression (a_call: ET_QUALIFIED_FEATURE_CALL_EXPRESSION)
			-- Process `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
		local
			l_target: ET_EXPRESSION
			l_seed: INTEGER
			l_class: ET_CLASS
			l_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_CALL_NAME
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_target := a_call.target
			process_expression (l_target)
			had_error := has_fatal_error
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := had_error or has_fatal_error
			end
			l_name := a_call.name
			if not l_name.is_tuple_label then
				l_context := current_context
				l_context.reset (current_type)
				find_expression_type (l_target, l_context)
				if not has_fatal_error then
					l_class := l_context.base_class
					l_seed := l_name.seed
					if attached l_class.seeded_query (l_seed) as l_query then
						report_qualified_call_expression (a_call, l_context, l_query)
					else
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				end
			end
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_qualified_feature_call_instruction (a_call: ET_QUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Process `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
		local
			l_target: ET_EXPRESSION
			l_seed: INTEGER
			l_class: ET_CLASS
			l_context: ET_NESTED_TYPE_CONTEXT
			l_name: ET_CALL_NAME
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_target := a_call.target
			process_expression (l_target)
			had_error := has_fatal_error
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := had_error or has_fatal_error
			end
			l_name := a_call.name
			if not l_name.is_tuple_label then
				l_context := current_context
				l_context.reset (current_type)
				find_expression_type (l_target, l_context)
				if not has_fatal_error then
					l_class := l_context.base_class
					l_seed := a_call.name.seed
					if attached l_class.seeded_procedure (l_seed) as l_procedure then
						report_qualified_call_instruction (a_call, l_context, l_procedure)
					else
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					end
				end
			end
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_qualified_like_identifier (a_type)
		end

	process_qualified_like_identifier (a_type: ET_QUALIFIED_LIKE_IDENTIFIER)
			-- Process `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		local
			l_target_type: ET_TYPE
			l_class: ET_CLASS
			l_context: ET_NESTED_TYPE_CONTEXT
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				l_target_type := a_type.target_type
				process_type (l_target_type)
				if not has_fatal_error then
					l_context := current_context
					l_context.reset (current_type)
					l_context.force_last (l_target_type)
					if not has_fatal_error then
						l_class := l_context.base_class
						if attached l_class.seeded_query (a_type.seed) as l_query then
							report_qualified_anchored_type (a_type, l_context, l_query)
						else
								-- This error should have already been reported when checking
								-- `current_feature' (using ET_FEATURE_CHECKER for example).
							set_fatal_error
							if internal_error_enabled or not current_class.has_implementation_error then
								error_handler.report_giaaa_error
							end
						end
					end
				end
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_qualified_like_identifier (a_type)
		end

	process_real_constant (a_constant: ET_REAL_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_constant_not_void: a_constant /= Void
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_constant.cast_type as l_type then
					process_type (l_type.type)
				end
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_integer_constant (a_constant)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_manifest_string (a_string)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_real_constant (a_constant)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_manifest_string (a_string)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_class: ET_CLASS
			l_type: ET_TYPE
			l_seed: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_type := an_expression.type
			if anchored_types_enabled then
				process_type (l_type)
				had_error := has_fatal_error
			end
			if attached an_expression.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := had_error or has_fatal_error
			end
			l_class := l_type.base_class (current_type)
			l_seed := an_expression.name.seed
			if attached l_class.seeded_query (l_seed) as l_query then
				report_static_call_expression (an_expression, l_type, l_query)
			else
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			end
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_class: ET_CLASS
			l_type: ET_TYPE
			l_seed: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_type := an_instruction.type
			if anchored_types_enabled then
				process_type (l_type)
				had_error := has_fatal_error
			end
			if attached an_instruction.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := had_error or has_fatal_error
			end
			l_class := l_type.base_class (current_type)
			l_seed := an_instruction.name.seed
			if attached l_class.seeded_procedure (l_seed) as l_procedure then
				report_static_call_instruction (an_instruction, l_type, l_procedure)
			else
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			end
			reset_fatal_error (had_error or has_fatal_error)
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			l_queries: ET_QUERY_LIST
			l_query: ET_QUERY
			i, nb: INTEGER
			j, nb2: INTEGER
			l_stripped: BOOLEAN
		do
			reset_fatal_error (False)
			l_queries := current_class.queries
			nb := l_queries.count
			from i := 1 until i > nb loop
				l_query := l_queries.item (i)
				if l_query.is_attribute then
					nb2 := an_expression.count
					l_stripped := False
					from j := 1 until j > nb2 loop
						if l_query.has_seed (an_expression.feature_name (j).seed) then
							l_stripped := True
							j := nb2
						else
							j := j + 1
						end
					end
					if not l_stripped then
						report_attribute_not_stripped (an_expression, l_query)
					end
				end
				i := i + 1
			end
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if assertions_enabled then
				if attached an_assertion.expression as l_expression then
					process_expression (l_expression)
				end
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				if attached a_type.actual_parameters as l_parameters then
					process_actual_parameters (l_parameters)
				end
			end
		end

	process_type (a_type: ET_TYPE)
			-- Process `a_type'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_type_not_void: a_type /= Void
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				a_type.process (Current)
			end
		end

	process_typed_call_agent (an_expression: ET_CALL_AGENT; a_target: ET_AGENT_OPEN_TARGET)
			-- Process a typed call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			qualified_call_agent: an_expression.is_qualified_call
			a_target_not_void: a_target /= Void
			valid_target: a_target = an_expression.target
		local
			l_name: ET_FEATURE_NAME
			l_class: ET_CLASS
			l_seed: INTEGER
			l_target_type: ET_TYPE
			l_context: ET_NESTED_TYPE_CONTEXT
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_target_type := a_target.type
			l_name := an_expression.name
			l_seed := l_name.seed
			if l_name.is_tuple_label then
				-- Do nothing
			elseif an_expression.is_procedure then
				l_context := current_context
				l_context.reset (current_type)
				l_context.force_last (l_target_type)
				l_class := l_context.base_class
				if attached l_class.seeded_procedure (l_seed) as l_procedure then
					report_qualified_procedure_call_agent (an_expression, l_context, l_procedure)
				else
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
			else
				l_context := current_context
				l_context.reset (current_type)
				l_context.force_last (l_target_type)
				l_class := l_context.base_class
				if attached l_class.seeded_query (l_seed) as l_query then
					report_qualified_query_call_agent (an_expression, l_context, l_query)
				else
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
			end
			had_error := has_fatal_error
			if anchored_types_enabled then
				process_type (a_target.type)
				had_error := had_error or has_fatal_error
			end
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
				had_error := had_error or has_fatal_error
			end
			reset_fatal_error (had_error)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_integer_constant (a_constant)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_real_constant (a_constant)
		end

	process_unfolded_empty_tuple_actual_parameters (a_list: ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_actual_parameters (a_list)
		end

	process_unfolded_tuple_actual_parameters (a_list: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_actual_parameters (a_list)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			if anchored_types_enabled then
				process_type (a_feature.type)
			end
		end

	process_unqualified_call_agent (an_expression: ET_CALL_AGENT)
			-- Process an unqualified call agent.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			an_expression_not_void: an_expression /= Void
			unqualified_call_agent: not an_expression.is_qualified_call
		local
			l_name: ET_FEATURE_NAME
			l_seed: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			l_name := an_expression.name
			l_seed := l_name.seed
			if an_expression.is_procedure then
				if attached current_class.seeded_procedure (l_seed) as l_procedure then
					report_unqualified_procedure_call_agent (an_expression, l_procedure)
				else
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
			else
				if attached current_class.seeded_query (l_seed) as l_query then
					report_unqualified_query_call_agent (an_expression, l_query)
				else
						-- This error should have already been reported when checking
						-- `current_feature' (using ET_FEATURE_CHECKER for example).
					set_fatal_error
					if internal_error_enabled or not current_class.has_implementation_error then
						error_handler.report_giaaa_error
					end
				end
			end
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.arguments as l_actual_arguments then
				had_error := has_fatal_error
				process_agent_argument_operand_list (l_actual_arguments)
				reset_fatal_error (had_error or has_fatal_error)
			end
		end

	process_unqualified_call_expression (an_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_unqualified_feature_call_expression (an_expression)
		end

	process_unqualified_call_instruction (an_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_unqualified_feature_call_instruction (an_instruction)
		end

	process_unqualified_feature_call_expression (a_call: ET_UNQUALIFIED_FEATURE_CALL_EXPRESSION)
			-- Process `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
		local
			l_seed: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
				had_error := has_fatal_error
			end
			reset_fatal_error (False)
			l_seed := a_call.name.seed
			if attached current_class.seeded_query (l_seed) as l_query then
				report_unqualified_call_expression (a_call, l_query)
				reset_fatal_error (had_error)
			else
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			end
		end

	process_unqualified_feature_call_instruction (a_call: ET_UNQUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Process `a_call'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_call_not_void: a_call /= Void
		local
			l_seed: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
			end
			reset_fatal_error (False)
			l_seed := a_call.name.seed
			if attached current_class.seeded_procedure (l_seed) as l_procedure then
				report_unqualified_call_instruction (a_call, l_procedure)
				reset_fatal_error (had_error)
			else
					-- This error should have already been reported when checking
					-- `current_feature' (using ET_FEATURE_CHECKER for example).
				set_fatal_error
				if internal_error_enabled or not current_class.has_implementation_error then
					error_handler.report_giaaa_error
				end
			end
		end

	process_variant (a_variant: ET_VARIANT)
			-- Process `a_variant'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			reset_fatal_error (False)
			process_expression (a_variant.expression)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
			-- Set `has_fatal_error' if a fatal error occurred.
		do
			process_manifest_string (a_string)
		end

	process_when_part (a_when_part: ET_WHEN_PART)
			-- Process `a_when_part'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			process_choice_list (a_when_part.choices)
			had_error := has_fatal_error
			if attached a_when_part.then_compound as l_then_compound then
				process_compound (l_then_compound)
				reset_fatal_error (had_error or has_fatal_error)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST)
			-- Process `a_list'.
			-- Set `has_fatal_error' if a fatal error occurred.
		local
			i, nb: INTEGER
			had_error: BOOLEAN
		do
			reset_fatal_error (False)
			nb := a_list.count
			from i := 1 until i > nb loop
				process_when_part (a_list.item (i))
				had_error := had_error or has_fatal_error
				i := i + 1
			end
			reset_fatal_error (had_error)
		end

	process_writable (a_writable: ET_WRITABLE)
			-- Process `a_writable'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_writable_not_void: a_writable /= Void
		local
			l_seed: INTEGER
		do
			reset_fatal_error (False)
			if attached {ET_IDENTIFIER} a_writable as l_identifier and then not l_identifier.is_local then
				l_seed := l_identifier.seed
				if l_seed /= 0 then
					if not attached current_class.seeded_query (l_seed) as l_attribute then
							-- Internal error: if we got a seed, `l_attribute' should not be void.
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					elseif not l_attribute.is_attribute then
							-- This error should have already been reported when checking
							-- `current_feature' (using ET_FEATURE_CHECKER for example).
						set_fatal_error
						if internal_error_enabled or not current_class.has_implementation_error then
							error_handler.report_giaaa_error
						end
					else
						report_attribute_assignment_target (a_writable, l_attribute)
					end
				end
			end
		end

feature {NONE} -- Access

	current_feature: ET_STANDALONE_CLOSURE
			-- Feature or invariant being processed

	current_feature_impl: ET_STANDALONE_CLOSURE
			-- Feature where the code being processed has been written;
			-- It might be different from `current_feature' or even from
			-- `current_feature.implementation_feature' when
			-- processing inherited assertions. For example:
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
			-- When processing the inherited precondition 'pre' in B.f,
			-- `current_feature' is B.f and `current_feature_impl' is A.f
			-- (where the inherited precondition has been written).

	current_inline_agent: detachable ET_INLINE_AGENT
			-- Inline agent being processed if any, Void otherwise

	enclosing_inline_agents: DS_ARRAYED_LIST [ET_INLINE_AGENT]
			-- Enclosing inline agents of `current_inline_agent' if any

	current_closure: ET_CLOSURE
			-- Inner closure being processed
		do
			if attached current_inline_agent as l_current_inline_agent then
				Result := l_current_inline_agent
			else
				Result := current_feature
			end
		ensure
			current_closure_not_void: Result /= Void
			in_agent: current_inline_agent /= Void implies Result = current_inline_agent
			not_in_agent: current_inline_agent = Void implies Result = current_feature
		end

	current_closure_impl: ET_CLOSURE
			-- Inner closure where the code being processed has been written
		do
			if attached current_inline_agent as l_current_inline_agent then
				Result := l_current_inline_agent
			else
				Result := current_feature_impl
			end
		ensure
			current_closure_impl_not_void: Result /= Void
			in_agent: current_inline_agent /= Void implies Result = current_inline_agent
			not_in_agent: current_inline_agent = Void implies Result = current_feature_impl
		end

	current_type: ET_BASE_TYPE
			-- Type from which `current_feature' is processed;
			-- It may not be the type to which `current_feature'
			-- belong when processing a precursor of a feature
			-- of `current_type'. In that case `current_type' is
			-- the type where the precursor call is processed,
			-- and `current_feature' is the precursor feature
			-- implemented in a proper parent.

	current_class_impl: ET_CLASS
			-- Class where `current_feature_impl' has been written

	current_context: ET_NESTED_TYPE_CONTEXT
			-- Context of expression being checked

feature {NONE} -- Expression types

	find_expression_type (a_expression: ET_EXPRESSION; a_context: ET_NESTED_TYPE_CONTEXT)
			-- Considering that `a_expression' is viewed from `a_context',
			-- alter `a_context' so that it represents the type of `a_expression'.
			-- Set `has_fatal_error' if a fatal error occurred.
		require
			a_expression_not_void: a_expression /= Void
			a_context_not_void: a_context /= Void
			a_current_class_preparsed: a_context.root_context.base_class.is_preparsed
		do
			reset_fatal_error (False)
			if attached current_inline_agent as l_current_inline_agent then
				expression_type_finder.find_expression_type_in_agent (a_expression, l_current_inline_agent, current_feature, a_context, current_system.detachable_any_type)
			elseif current_feature.is_feature then
				expression_type_finder.find_expression_type_in_feature (a_expression, current_feature.as_feature, a_context, current_system.detachable_any_type)
			else
				expression_type_finder.find_expression_type_in_invariant (a_expression, current_feature.as_invariants, a_context, current_system.detachable_any_type)
			end
			reset_fatal_error (expression_type_finder.has_fatal_error)
		end

	expression_type_finder: ET_EXPRESSION_TYPE_FINDER
			-- Expression type finder

feature {NONE} -- Implementation

	dummy_feature: ET_FEATURE
			-- Dummy feature
		local
			a_name: ET_FEATURE_NAME
		once
			create {ET_IDENTIFIER} a_name.make ("**dummy**")
			create {ET_DEFERRED_PROCEDURE} Result.make (a_name, Void, current_class)
		ensure
			dummy_feature_not_void: Result /= Void
		end

invariant

	current_feature_not_void: current_feature /= Void
	current_feature_impl_not_void: current_feature_impl /= Void
	current_feature_impl_constraint: current_feature_impl = current_feature_impl.implementation_feature
	enclosing_inline_agents_not_void: enclosing_inline_agents /= Void
	no_void_enclosing_inline_agent: not enclosing_inline_agents.has_void
	current_type_not_void: current_type /= Void
	current_type_valid: current_type.is_valid_context
	current_class_definition: current_class = current_type.base_class
	current_class_impl_not_void: current_class_impl /= Void
	current_class_impl_definition: current_class_impl = current_feature_impl.implementation_class
	expression_type_finder_not_void: expression_type_finder /= Void
	current_context_not_void: current_context /= Void

end
