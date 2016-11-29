note

	description:

		"Eiffel system class markers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2010-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date: $"
	revision: "$Revision: $"

class ET_SYSTEM_CLASS_MARKER

inherit

	ET_AST_NULL_PROCESSOR
		rename
			make as make_null
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
			process_braced_type_list,
			process_bracket_expression,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_check_instruction,
			process_choice_list,
			process_choice_range,
			process_class,
			process_class_type,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_convert_builtin_expression,
			process_convert_feature_list,
			process_convert_function,
			process_convert_from_expression,
			process_convert_procedure,
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
			process_formal_argument,
			process_formal_argument_list,
			process_formal_parameter_list,
			process_hexadecimal_integer_constant,
			process_if_instruction,
			process_infix_cast_expression,
			process_infix_expression,
			process_inspect_instruction,
			process_invariants,
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
			process_parent,
			process_parent_clause_list,
			process_parent_list,
			process_parenthesis_expression,
			process_parenthesis_instruction,
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
			-- Create a new system class marker.
		do
		end

feature -- Processing

	mark_system (a_class: ET_CLASS)
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well.
		require
			a_class_not_void: a_class /= Void
		do
			unmark_all (a_class.current_system)
			mark_system_no_unmark (a_class)
		ensure
			a_class_marked: a_class.is_marked
		end

	mark_system_no_unmark (a_class: ET_CLASS)
			-- Identify the classes that `a_class' recursively depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Mark `a_class' as well. (Do not call `unmark_all'
			-- before marking the classes.)
		require
			a_class_not_void: a_class /= Void
		do
			is_recursive := True
			a_class.set_marked (True)
			process_class (a_class)
		ensure
			a_class_marked: a_class.is_marked
		end

	mark_shallow (a_class: ET_CLASS)
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself.
		require
			a_class_not_void: a_class /= Void
		do
			unmark_all (a_class.current_system)
			mark_shallow_no_unmark (a_class)
		end

	mark_shallow_no_unmark (a_class: ET_CLASS)
			-- Identify the classes that `a_class' directly depends on
			-- (see definition in ETL page 35) and mark them as being part
			-- of the system. Do not mark `a_class' if it does not
			-- directly depend on itself. (Do not call `unmark_all'
			-- before marking the classes.)
		require
			a_class_not_void: a_class /= Void
		do
			is_recursive := False
			process_class (a_class)
		end

	unmark_all (a_system: ET_SYSTEM)
			-- Unmark all classes of `a_system' as if none of them
			-- was in the system.
		require
			a_system_not_void: a_system /= Void
		do
			a_system.classes_do_recursive (agent {ET_CLASS}.set_marked (False))
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.iterable_expression)
			if attached an_expression.invariant_part as an_invariant_part then
				process_loop_invariants (an_invariant_part)
			end
			if attached an_expression.until_conditional as a_conditional then
				process_expression (a_conditional.expression)
			end
			process_expression (an_expression.iteration_conditional.expression)
			if attached an_expression.variant_part as a_variant_part then
				process_variant (a_variant_part)
			end
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.iterable_expression)
			if attached an_instruction.from_compound as l_from_compound then
				process_compound (l_from_compound)
			end
			if attached an_instruction.invariant_part as an_invariant_part then
				process_loop_invariants (an_invariant_part)
			end
			if attached an_instruction.until_conditional as a_conditional then
				process_expression (a_conditional.expression)
			end
			if attached an_instruction.loop_compound as l_loop_compound then
				process_compound (l_loop_compound)
			end
			if attached an_instruction.variant_part as a_variant_part then
				process_variant (a_variant_part)
			end
		end

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS)
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_expression (a_list.actual_argument (i))
				i := i + 1
			end
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST)
			-- Process `a_list'.
		do
			process_actual_parameters (a_list)
		end

	process_actual_parameter_sublist (a_list: ET_ACTUAL_PARAMETER_SUBLIST)
			-- Process `a_list'.
		do
			process_actual_parameters (a_list)
		end

	process_actual_parameters (a_list: ET_ACTUAL_PARAMETERS)
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_type (a_list.type (i))
				i := i + 1
			end
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.actual_argument (i).process (Current)
				i := i + 1
			end
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET)
			-- Process `a_target'.
		do
			process_type (a_target.type)
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT)
			-- Process `an_argument'.
		do
			process_type (an_argument.type)
		end

	process_assertion (an_assertion: ET_ASSERTION)
			-- Process `an_assertion'.
		require
			an_assertion_not_void: an_assertion /= Void
		do
			an_assertion.process (Current)
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
				process_assertion (a_list.assertion (i))
				i := i + 1
			end
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_feature_call (an_instruction.call)
			process_expression (an_instruction.source)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.source)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.source)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_type (a_feature.type)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_creation_instruction (an_instruction)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_type (a_list.type (i))
				i := i + 1
			end
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		do
			process_feature_call (an_expression)
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			process_character_constant (a_constant)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			process_character_constant (a_constant)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			process_character_constant (a_constant)
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		local
			a_target: ET_AGENT_TARGET
		do
			a_target := an_expression.target
			a_target.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.arguments as an_arguments then
				process_agent_argument_operand_list (an_arguments)
			end
		end

	process_character_constant (a_constant: ET_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if attached a_constant.cast_type as a_type then
				process_type (a_type.type)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_assertions (an_instruction)
			if attached an_instruction.then_compound as l_compound then
				process_compound (l_compound)
			end
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.choice (i).process (Current)
				i := i + 1
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE)
			-- Process `a_choice'.
		do
			process_expression (a_choice.lower)
			process_expression (a_choice.upper)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			a_cursor: DS_HASH_SET_CURSOR [ET_NAMED_CLASS]
			a_provider: ET_CLASS
		do
			if attached a_class.providers as a_providers then
				a_cursor := a_providers.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_provider := a_cursor.item.actual_class
					if not a_provider.is_marked then
						a_provider.set_marked (True)
						if is_recursive then
							process_class (a_provider)
						end
					end
					a_cursor.forth
				end
			else
				if attached a_class.formal_parameters as a_formal_parameters then
					process_formal_parameter_list (a_formal_parameters)
				end
				if attached a_class.parent_clauses as a_parents then
					process_parent_clause_list (a_parents)
				end
				if attached a_class.convert_features as a_convert_features then
					process_convert_feature_list (a_convert_features)
				end
				process_features (a_class)
				if attached a_class.invariants as an_invariants then
					process_invariants (an_invariants)
				end
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		local
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if not a_class.is_marked then
				a_class.set_marked (True)
				if is_recursive then
					process_class (a_class)
				end
			end
			if attached a_type.actual_parameters as l_actual_parameters then
				process_actual_parameters (l_actual_parameters)
			end
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_type (a_feature.type)
				-- The constant can be prefixed by its type.
			a_feature.constant.process (Current)
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		do
			process_type  (a_parameter.constraint)
		end

	process_convert_builtin_expression (an_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.convert_feature (i).process (Current)
				i := i + 1
			end
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION)
			-- Process `a_convert_function'.
		do
			a_convert_function.types.process (Current)
		end

	process_convert_from_expression (an_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE)
			-- Process `a_convert_procedure'.
		do
			a_convert_procedure.types.process (Current)
		end

	process_convert_to_expression (an_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
		do
			process_type (an_expression.type)
			if attached an_expression.creation_call as a_call then
				if attached a_call.arguments as an_arguments then
					process_actual_arguments (an_arguments)
				end
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_creation_instruction (an_instruction)
		end

	process_creation_instruction (an_instruction: ET_CREATION_INSTRUCTION)
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		do
			if attached an_instruction.type as a_type then
				process_type (a_type)
			end
			if attached an_instruction.creation_call as a_call then
				if attached a_call.arguments as an_arguments then
					process_actual_arguments (an_arguments)
				end
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.compound as a_compound then
				process_compound (a_compound)
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		do
			process_deferred_routine (a_feature)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		do
			process_deferred_routine (a_feature)
		end

	process_deferred_routine (a_feature: ET_DEFERRED_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.arguments as an_arguments then
				process_formal_argument_list (an_arguments)
			end
			if attached a_feature.type as a_type then
				process_type (a_type)
			end
			if attached a_feature.preconditions as a_preconditions then
				process_preconditions (a_preconditions)
			end
			if attached a_feature.postconditions as a_postconditions then
				process_postconditions (a_postconditions)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_attribute (a_feature)
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_constant_attribute (a_feature)
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		do
			if attached a_feature.arguments as an_arguments then
				process_formal_argument_list (an_arguments)
			end
			process_type (a_feature.type)
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		do
			if attached a_feature.arguments as an_arguments then
				process_formal_argument_list (an_arguments)
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
		do
			process_expression (an_elseif_part.expression)
			if attached an_elseif_part.then_compound as a_compound then
				process_compound (a_compound)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_elseif_part (a_list.item (i))
				i := i + 1
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.left)
			process_expression (an_expression.right)
		end

	process_expression (a_expression: ET_EXPRESSION)
			-- Process `a_expression'.
		require
			a_expression_not_void: a_expression /= Void
		do
			a_expression.process (Current)
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_expression_list (a_list: ET_EXPRESSION_LIST)
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_expression (a_list.expression (i))
				i := i + 1
			end
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_extended_attribute_closure (a_feature)
		end

	process_extended_attribute_closure (a_feature: ET_EXTENDED_ATTRIBUTE_CLOSURE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_type (a_feature.type)
			if attached a_feature.preconditions as a_preconditions then
				process_preconditions (a_preconditions)
			end
			if attached a_feature.locals as a_locals then
				process_local_variable_list (a_locals)
			end
			if attached a_feature.compound as a_compound then
				process_compound (a_compound)
			end
			if attached a_feature.postconditions as a_postconditions then
				process_postconditions (a_postconditions)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				process_compound (l_rescue_clause)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_external_routine_inline_agent (an_expression)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		do
			process_external_routine (a_feature)
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_external_routine_inline_agent (an_expression)
		end

	process_external_routine (a_feature: ET_EXTERNAL_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_external_routine_closure (a_feature)
		end

	process_external_routine_closure (a_feature: ET_EXTERNAL_ROUTINE_CLOSURE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.arguments as l_arguments then
				process_formal_argument_list (l_arguments)
			end
			if attached a_feature.type as l_type then
				process_type (l_type)
			end
			if attached a_feature.preconditions as l_preconditions then
				process_preconditions (l_preconditions)
			end
			if attached a_feature.postconditions as l_postconditions then
				process_postconditions (l_postconditions)
			end
		end

	process_external_routine_inline_agent (an_expression: ET_EXTERNAL_ROUTINE_INLINE_AGENT)
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			process_external_routine_closure (an_expression)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
			end
		end

	process_feature_call (a_call: ET_FEATURE_CALL)
			-- Process `a_call'.
		do
			if attached a_call.target as l_target then
				process_expression (l_target)
			end
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
			end
		end

	process_features (a_class: ET_CLASS)
			-- Process features of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			l_queries: ET_QUERY_LIST
			l_procedures: ET_PROCEDURE_LIST
			i, nb: INTEGER
		do
			l_queries := a_class.queries
			nb := l_queries.declared_count
			from i := 1 until i > nb loop
				l_queries.item (i).process (Current)
				i := i + 1
			end
			l_procedures := a_class.procedures
			nb := l_procedures.declared_count
			from i := 1 until i > nb loop
				l_procedures.item (i).process (Current)
				i := i + 1
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT)
			-- Process `an_argument'.
		do
			if an_argument.is_last_entity then
				process_type (an_argument.type)
			end
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_formal_argument (a_list.formal_argument (i))
				i := i + 1
			end
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.formal_parameter (i).process (Current)
				i := i + 1
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.expression)
			if attached an_instruction.then_compound as l_then_compound then
				process_compound (l_then_compound)
			end
			if attached an_instruction.elseif_parts as l_elseif_parts then
				process_elseif_part_list (l_elseif_parts)
			end
			if attached an_instruction.else_compound as l_else_compound then
				process_compound (l_else_compound)
			end
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.left)
			process_expression (an_expression.right)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_expression (an_instruction.expression)
			if attached an_instruction.when_parts as l_when_parts then
				process_when_part_list (l_when_parts)
			end
			if attached an_instruction.else_compound as l_else_compound then
				process_compound (l_else_compound)
			end
		end

	process_integer_constant (a_constant: ET_INTEGER_CONSTANT)
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			if attached a_constant.cast_type as l_type then
				process_type (l_type.type)
			end
		end

	process_internal_routine (a_feature: ET_INTERNAL_ROUTINE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			process_internal_routine_closure (a_feature)
		end

	process_internal_routine_closure (a_feature: ET_INTERNAL_ROUTINE_CLOSURE)
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			if attached a_feature.arguments as l_arguments then
				process_formal_argument_list (l_arguments)
			end
			if attached a_feature.type as l_type then
				process_type (l_type)
			end
			if attached a_feature.preconditions as l_preconditions then
				process_preconditions (l_preconditions)
			end
			if attached a_feature.locals as l_locals then
				process_local_variable_list (l_locals)
			end
			if attached a_feature.compound as l_compound then
				process_compound (l_compound)
			end
			if attached a_feature.postconditions as l_postconditions then
				process_postconditions (l_postconditions)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				process_compound (l_rescue_clause)
			end
		end

	process_internal_routine_inline_agent (an_expression: ET_INTERNAL_ROUTINE_INLINE_AGENT)
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		do
			process_internal_routine_closure (an_expression)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				process_agent_argument_operand_list (l_actual_arguments)
			end
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE)
			-- Process `a_local'.
		do
			if a_local.is_last_entity then
				process_type (a_local.type)
			end
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_local_variable (a_list.local_variable (i))
				i := i + 1
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.from_compound as l_from_compound then
				process_compound (l_from_compound)
			end
			if attached an_instruction.invariant_part as l_invariant_part then
				process_loop_invariants (l_invariant_part)
			end
			process_expression (an_instruction.until_expression)
			if attached an_instruction.loop_compound as l_loop_compound then
				process_compound (l_loop_compound)
			end
			if attached an_instruction.variant_part as l_variant_part then
				process_variant (l_variant_part)
			end
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		do
			process_expression_list (an_expression)
		end

	process_manifest_string (a_string: ET_MANIFEST_STRING)
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			if attached a_string.cast_type as l_type then
				process_type (l_type.type)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
		do
			process_expression_list (an_expression)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		do
			process_type (an_expression.type)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		do
			process_object_test (an_expression)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.left)
			process_expression (an_expression.right)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		do
			if attached an_expression.type as l_type then
				process_type (l_type)
			end
			process_expression (an_expression.expression)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			process_object_test (an_expression)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_once_manifest_string (a_string: ET_ONCE_MANIFEST_STRING)
			-- Process `a_string'.
		do
			process_manifest_string (a_string.manifest_string)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		do
			process_internal_routine (a_feature)
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			process_internal_routine_inline_agent (an_expression)
		end

	process_parent (a_parent: ET_PARENT)
			-- Process `a_parent'.
		do
			a_parent.type.process (Current)
		end

	process_parent_clause_list (a_list: ET_PARENT_CLAUSE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_parent_list (a_list.item (i))
				i := i + 1
			end
		end

	process_parent_list (a_list: ET_PARENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_parent (a_list.parent (i))
				i := i + 1
			end
		end

	process_parenthesis_expression (an_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `an_expression'.
		do
			process_feature_call (an_expression)
		end

	process_parenthesis_instruction (an_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_feature_call (an_instruction)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- Process `a_list'.
		do
			process_assertions (a_list)
		end

	process_precursor_call (a_call: ET_PRECURSOR_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
				-- The parent class name should already appear
				-- in the inheritance clause.
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		do
			process_precursor_call (an_expression)
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_precursor_call (an_instruction)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			process_expression (an_expression.expression)
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_feature_call (an_expression)
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_feature_call (an_instruction)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			process_type (a_type.target_type)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			process_type (a_type.target_type)
		end

	process_real_constant (a_constant: ET_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				process_type (l_type.type)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		do
			process_manifest_string (a_string)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			process_real_constant (a_constant)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		do
			process_manifest_string (a_string)
		end

	process_static_feature_call (a_call: ET_STATIC_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
			process_type (a_call.type)
			if attached a_call.arguments as l_arguments then
				process_actual_arguments (l_arguments)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_static_feature_call (an_expression)
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_static_feature_call (an_instruction)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
		do
			if attached an_assertion.expression as l_expression then
				process_expression (l_expression)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		local
			a_class: ET_CLASS
		do
			a_class := a_type.base_class
			if not a_class.is_marked then
				a_class.set_marked (True)
				if is_recursive then
					process_class (a_class)
				end
			end
			if attached a_type.actual_parameters as l_actual_parameters then
				process_actual_parameters (l_actual_parameters)
			end
		end

	process_type (a_type: ET_TYPE)
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		do
			a_type.process (Current)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			process_integer_constant (a_constant)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			process_real_constant (a_constant)
		end

	process_unfolded_empty_tuple_actual_parameters (a_list: ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS)
			-- Process `a_list'.
		do
			process_actual_parameters (a_list)
		end

	process_unfolded_tuple_actual_parameters (a_list: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS)
			-- Process `a_list'.
		do
			process_actual_parameters (a_list)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		do
			process_type (a_feature.type)
		end

	process_unqualified_call_expression (an_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_feature_call (an_expression)
		end

	process_unqualified_call_instruction (an_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_feature_call (an_instruction)
		end

	process_variant (a_variant: ET_VARIANT)
			-- Process `a_variant'.
		do
			process_expression (a_variant.expression)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		do
			process_manifest_string (a_string)
		end

	process_when_part (a_when_part: ET_WHEN_PART)
			-- Process `a_when_part'.
		do
			process_choice_list (a_when_part.choices)
			if attached a_when_part.then_compound as l_then_compound then
				process_compound (l_then_compound)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				process_when_part (a_list.item (i))
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	is_recursive: BOOLEAN
			-- Is the processing recursive?

end
