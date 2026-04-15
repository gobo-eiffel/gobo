note

	description:

		"Builders for selection ranges"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_SELECTION_RANGE_BUILDER

inherit

	ET_AST_ITERATOR
		rename
			make as make_ast_iterator
		redefine
			process_across_expression,
			process_across_instruction,
			process_actual_argument_list,
			process_actual_parameter_list,
			process_agent_argument_operand_list,
			process_agent_open_target,
			process_agent_typed_open_argument,
			process_alias_free_name,
			process_alias_name,
			process_aliased_feature_name,
			process_all_export,
			process_assign_feature_name,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_base_type_constraint_list,
			process_base_type_rename_constraint,
			process_binary_integer_constant,
			process_braced_class_name,
			process_braced_type,
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
			process_clients,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_constraint_creator,
			process_constraint_rename_list,
			process_convert_feature_list,
			process_convert_function,
			process_convert_procedure,
			process_create_expression,
			process_create_instruction,
			process_creation_region,
			process_creator,
			process_creator_list,
			process_current_address,
			process_custom_attribute,
			process_debug_instruction,
			process_deferred_function,
			process_deferred_procedure,
			process_do_function,
			process_do_function_inline_agent,
			process_do_procedure,
			process_do_procedure_inline_agent,
			process_dotnet_function,
			process_dotnet_procedure,
			process_elseif_expression,
			process_elseif_part,
			process_equality_expression,
			process_export_list,
			process_expression_address,
			process_extended_attribute,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_feature_address,
			process_feature_clause,
			process_feature_clause_list,
			process_feature_export,
			process_formal_argument,
			process_formal_argument_list,
			process_formal_parameter,
			process_formal_parameter_list,
			process_formal_parameter_type,
			process_general_qualified_feature_call_expression,
			process_general_qualified_feature_call_instruction,
			process_hexadecimal_integer_constant,
			process_if_expression,
			process_if_instruction,
			process_infix_and_then_operator,
			process_infix_expression,
			process_infix_or_else_operator,
			process_inline_separate_argument,
			process_inline_separate_arguments,
			process_inline_separate_instruction,
			process_inspect_expression,
			process_inspect_instruction,
			process_invariants,
			process_iteration_cursor,
			process_keyword_feature_name_list,
			process_keyword_manifest_string,
			process_labeled_actual_parameter,
			process_like_current,
			process_like_feature,
			process_like_n,
			process_local_variable,
			process_local_variable_list,
			process_loop_instruction,
			process_loop_invariants,
			process_manifest_array,
			process_manifest_string_list,
			process_manifest_tuple,
			process_manifest_type,
			process_named_object_test,
			process_note_list,
			process_note_term_list,
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
			process_qualified_call,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_qualified_regular_feature_call,
			process_quantifier_expression,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_rename,
			process_rename_list,
			process_repeat_instruction,
			process_result_address,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_strip_expression,
			process_symbol,
			process_tagged_assertion,
			process_tagged_note,
			process_token,
			process_tuple_type,
			process_type_constraint_list,
			process_type_rename_constraint,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_unqualified_regular_feature_call,
			process_variant,
			process_verbatim_string,
			process_when_expression,
			process_when_part
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initalization

	make (a_response: like response; a_message_manager: like message_manager)
			-- Create a new selection range builder.
		require
			a_response_not_void: a_response /= Void
			a_message_manager_not_void: a_message_manager /= Void
		do
			response := a_response
			message_manager := a_message_manager
			current_class := tokens.unknown_class
			current_position := tokens.null_position
			make_ast_iterator
		ensure
			response_set: response = a_response
			message_manager_set: message_manager = a_message_manager
		end

feature -- Access

	response: LS_SELECTION_RANGE_RESPONSE
			-- List of selection range to be built

	message_manager: GELSP
			-- Message manager

feature -- Basic operations

	build_selection_range (a_position: ET_POSITION; a_class: ET_CLASS)
			-- Build selection range for `a_position` in `a_class`.
		require
			a_position_not_void: a_position /= Void
			a_class_not_void: a_class /= Void
		local
			l_old_position: like current_position
			l_old_class: like current_class
		do
			l_old_class := current_class
			current_class := a_class
			l_old_position := current_position
			current_position := a_position
			a_class.process (Current)
			if attached current_selection_range as l_selection_range then
				response.add_selection_range (l_selection_range)
			end
			current_selection_range := Void
			current_position := l_old_position
			current_class := l_old_class
		end

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET)
			-- Process `a_target'.
		local
			l_range: LS_RANGE
		do
			if a_target.contains_position (current_position) then
				l_range := message_manager.range (a_target, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_target)
			end
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT)
			-- Process `an_argument'.
		local
			l_range: LS_RANGE
		do
			if an_argument.contains_position (current_position) then
				l_range := message_manager.range (an_argument, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_argument)
			end
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME)
			-- Process `a_name'.
		local
			l_range: LS_RANGE
		do
			if a_name.contains_position (current_position) then
				l_range := message_manager.range (a_name, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_name)
			end
		end

	process_alias_name (a_name: ET_ALIAS_NAME)
			-- Process `a_name'.
		local
			l_range: LS_RANGE
		do
			if a_name.contains_position (current_position) then
				l_range := message_manager.range (a_name, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_name)
			end
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME)
			-- Process `a_name'.
		local
			l_range: LS_RANGE
		do
			if a_name.contains_position (current_position) then
				l_range := message_manager.range (a_name, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_name)
			end
		end

	process_all_export (an_export: ET_ALL_EXPORT)
			-- Process `an_export'.
		local
			l_range: LS_RANGE
		do
			if an_export.contains_position (current_position) then
				l_range := message_manager.range (an_export, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_export)
			end
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME)
			-- Process `an_assigner'.
		local
			l_range: LS_RANGE
		do
			if an_assigner.contains_position (current_position) then
				l_range := message_manager.range (an_assigner, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_assigner)
			end
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_base_type_constraint_list (a_list: ET_BASE_TYPE_CONSTRAINT_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_base_type_rename_constraint (a_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		local
			l_range: LS_RANGE
		do
			if a_type_rename_constraint.contains_position (current_position) then
				l_range := message_manager.range (a_type_rename_constraint, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type_rename_constraint)
			end
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME)
			-- Process `a_name'.
		local
			l_range: LS_RANGE
		do
			if a_name.contains_position (current_position) then
				l_range := message_manager.range (a_name, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_name)
			end
		end

	process_braced_type (a_type: ET_BRACED_TYPE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE)
			-- Process `a_choice'.
		local
			l_range: LS_RANGE
		do
			if a_choice.contains_position (current_position) then
				l_range := message_manager.range (a_choice, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_choice)
			end
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		local
			l_range: LS_RANGE
		do
			if a_class.contains_position (current_position) then
				l_range := message_manager.range (a_class, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_class)
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_clients (a_list: ET_CLIENTS)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			l_range: LS_RANGE
		do
			if a_parameter.contains_position (current_position) then
				l_range := message_manager.range (a_parameter, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_parameter)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_constraint_rename_list (a_list: ET_CONSTRAINT_RENAME_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION)
			-- Process `a_convert_function'.
		local
			l_range: LS_RANGE
		do
			if a_convert_function.contains_position (current_position) then
				l_range := message_manager.range (a_convert_function, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_convert_function)
			end
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE)
			-- Process `a_convert_procedure'.
		local
			l_range: LS_RANGE
		do
			if a_convert_procedure.contains_position (current_position) then
				l_range := message_manager.range (a_convert_procedure, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_convert_procedure)
			end
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_creation_region (a_region: ET_CREATION_REGION)
			-- Process `a_region'.
		local
			l_range: LS_RANGE
		do
			if a_region.contains_position (current_position) then
				l_range := message_manager.range (a_region, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_region)
			end
		end

	process_creator (a_list: ET_CREATOR)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_creator_list (a_list: ET_CREATOR_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE)
			-- Process `an_attribute'.
		local
			l_range: LS_RANGE
		do
			if an_attribute.contains_position (current_position) then
				l_range := message_manager.range (an_attribute, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_attribute)
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_elseif_expression (an_elseif_part: ET_ELSEIF_EXPRESSION)
			-- Process `an_elseif_part'.
		local
			l_range: LS_RANGE
		do
			if an_elseif_part.contains_position (current_position) then
				l_range := message_manager.range (an_elseif_part, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_elseif_part)
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
		local
			l_range: LS_RANGE
		do
			if an_elseif_part.contains_position (current_position) then
				l_range := message_manager.range (an_elseif_part, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_elseif_part)
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_export_list (a_list: ET_EXPORT_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE)
			-- Process `a_feature_clause'.
		local
			l_range: LS_RANGE
		do
			if a_feature_clause.contains_position (current_position) then
				l_range := message_manager.range (a_feature_clause, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature_clause)
			end
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT)
			-- Process `an_export'.
		local
			l_range: LS_RANGE
		do
			if an_export.contains_position (current_position) then
				l_range := message_manager.range (an_export, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_export)
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT)
			-- Process `an_argument'.
		local
			l_range: LS_RANGE
		do
			if an_argument.contains_position (current_position) then
				l_range := message_manager.range (an_argument, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_argument)
			end
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		local
			l_range: LS_RANGE
		do
			if a_parameter.contains_position (current_position) then
				l_range := message_manager.range (a_parameter, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_parameter)
			end
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_general_qualified_feature_call_expression (a_expression: ET_GENERAL_QUALIFIED_FEATURE_CALL_EXPRESSION)
			-- Process `a_expression'.
		local
			l_range: LS_RANGE
		do
			if a_expression.contains_position (current_position) then
				l_range := message_manager.range (a_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_expression)
			end
		end

	process_general_qualified_feature_call_instruction (a_instruction: ET_GENERAL_QUALIFIED_FEATURE_CALL_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_range: LS_RANGE
		do
			if a_instruction.contains_position (current_position) then
				l_range := message_manager.range (a_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_instruction)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_if_expression (a_expression: ET_IF_EXPRESSION)
			-- Process `a_expression'.
		local
			l_range: LS_RANGE
		do
			if a_expression.contains_position (current_position) then
				l_range := message_manager.range (a_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_expression)
			end
		end

	process_if_instruction (a_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if a_instruction.contains_position (current_position) then
				l_range := message_manager.range (a_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_instruction)
			end
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR)
			-- Process `an_operator'.
		local
			l_range: LS_RANGE
		do
			if an_operator.contains_position (current_position) then
				l_range := message_manager.range (an_operator, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_operator)
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR)
			-- Process `an_operator'.
		local
			l_range: LS_RANGE
		do
			if an_operator.contains_position (current_position) then
				l_range := message_manager.range (an_operator, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_operator)
			end
		end

	process_inline_separate_argument (a_argument: ET_INLINE_SEPARATE_ARGUMENT)
			-- Process `a_argument'.
		local
			l_range: LS_RANGE
		do
			if a_argument.contains_position (current_position) then
				l_range := message_manager.range (a_argument, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_argument)
			end
		end

	process_inline_separate_arguments (a_arguments: ET_INLINE_SEPARATE_ARGUMENTS)
			-- Process `a_arguments'.
		local
			l_range: LS_RANGE
		do
			if a_arguments.contains_position (current_position) then
				l_range := message_manager.range (a_arguments, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_arguments)
			end
		end

	process_inline_separate_instruction (a_instruction: ET_INLINE_SEPARATE_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_range: LS_RANGE
		do
			if a_instruction.contains_position (current_position) then
				l_range := message_manager.range (a_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_instruction)
			end
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		local
			l_range: LS_RANGE
		do
			if a_expression.contains_position (current_position) then
				l_range := message_manager.range (a_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_expression)
			end
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_iteration_cursor (a_iteration_cursor: ET_ITERATION_CURSOR)
			-- Process `a_iteration_cursor'.
		local
			l_range: LS_RANGE
		do
			if a_iteration_cursor.contains_position (current_position) then
				l_range := message_manager.range (a_iteration_cursor, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_iteration_cursor)
			end
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING)
			-- Process `a_string'.
		local
			l_range: LS_RANGE
		do
			if a_string.contains_position (current_position) then
				l_range := message_manager.range (a_string, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_string)
			end
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER)
			-- Process `a_parameter'.
		local
			l_range: LS_RANGE
		do
			if a_parameter.contains_position (current_position) then
				l_range := message_manager.range (a_parameter, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_parameter)
			end
		end

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_like_n (a_type: ET_LIKE_N)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE)
			-- Process `a_local'.
		local
			l_range: LS_RANGE
		do
			if a_local.contains_position (current_position) then
				l_range := message_manager.range (a_local, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_local)
			end
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_note_list (a_list: ET_NOTE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_note_term_list (a_list: ET_NOTE_TERM_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				if attached a_feature.compound as l_compound and then l_compound.contains_position (current_position) then
					l_range := message_manager.range (l_compound, current_class)
					create current_selection_range.make_with_parent (l_range, current_selection_range)
				end
				precursor (a_feature)
			end
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				if attached a_feature.compound as l_compound and then l_compound.contains_position (current_position) then
					l_range := message_manager.range (l_compound, current_class)
					create current_selection_range.make_with_parent (l_range, current_selection_range)
				end
				precursor (a_feature)
			end
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_parent (a_parent: ET_PARENT)
			-- Process `a_parent'.
		local
			l_range: LS_RANGE
		do
			if a_parent.contains_position (current_position) then
				l_range := message_manager.range (a_parent, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_parent)
			end
		end

	process_parent_clause_list (a_list: ET_PARENT_CLAUSE_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_parent_list (a_list: ET_PARENT_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_parenthesis_expression (an_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_parenthesis_instruction (an_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end


	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL)
			-- Process `a_call'.
		local
			l_range: LS_RANGE
		do
			if a_call.contains_position (current_position) then
				l_range := message_manager.range (a_call, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_call)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_qualified_regular_feature_call (a_call: ET_QUALIFIED_REGULAR_FEATURE_CALL)
			-- Process `a_call'.
		local
			l_range: LS_RANGE
		do
			if a_call.contains_position (current_position) then
				l_range := message_manager.range (a_call, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_call)
			end
		end

	process_quantifier_expression (a_expression: ET_QUANTIFIER_EXPRESSION)
			-- Process `a_expression'.
		local
			l_range: LS_RANGE
		do
			if a_expression.contains_position (current_position) then
				l_range := message_manager.range (a_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_expression)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		local
			l_range: LS_RANGE
		do
			if a_string.contains_position (current_position) then
				l_range := message_manager.range (a_string, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_string)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_rename (a_rename: ET_RENAME)
			-- Process `a_rename'.
		local
			l_range: LS_RANGE
		do
			if a_rename.contains_position (current_position) then
				l_range := message_manager.range (a_rename, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_rename)
			end
		end

	process_rename_list (a_list: ET_RENAME_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_repeat_instruction (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Process `a_instruction'.
		local
			l_range: LS_RANGE
		do
			if a_instruction.contains_position (current_position) then
				l_range := message_manager.range (a_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_instruction)
			end
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		local
			l_range: LS_RANGE
		do
			if a_string.contains_position (current_position) then
				l_range := message_manager.range (a_string, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_string)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		local
			l_range: LS_RANGE
		do
			if an_instruction.contains_position (current_position) then
				l_range := message_manager.range (an_instruction, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_instruction)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION)
			-- Process `an_expression'.
		local
			l_range: LS_RANGE
		do
			if an_expression.contains_position (current_position) then
				l_range := message_manager.range (an_expression, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_expression)
			end
		end

	process_symbol (a_symbol: ET_SYMBOL)
			-- Process `a_symbol'.
		local
			l_range: LS_RANGE
		do
			if a_symbol.contains_position (current_position) then
				l_range := message_manager.range (a_symbol, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
			end
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
		local
			l_range: LS_RANGE
		do
			if an_assertion.contains_position (current_position) then
				l_range := message_manager.range (an_assertion, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (an_assertion)
			end
		end

	process_tagged_note (a_note: ET_TAGGED_NOTE)
			-- Process `a_note'.
		local
			l_range: LS_RANGE
		do
			if a_note.contains_position (current_position) then
				l_range := message_manager.range (a_note, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_note)
			end
		end

	process_token (a_token: ET_TOKEN)
			-- Process `a_token'.
		local
			l_range: LS_RANGE
		do
			if a_token.contains_position (current_position) then
				l_range := message_manager.range (a_token, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
			end
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		local
			l_range: LS_RANGE
		do
			if a_type.contains_position (current_position) then
				l_range := message_manager.range (a_type, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type)
			end
		end

	process_type_constraint_list (a_list: ET_TYPE_CONSTRAINT_LIST)
			-- Process `a_list'.
		local
			l_range: LS_RANGE
		do
			if a_list.contains_position (current_position) then
				l_range := message_manager.range (a_list, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_list)
			end
		end

	process_type_rename_constraint (a_type_rename_constraint: ET_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		local
			l_range: LS_RANGE
		do
			if a_type_rename_constraint.contains_position (current_position) then
				l_range := message_manager.range (a_type_rename_constraint, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_type_rename_constraint)
			end
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		local
			l_range: LS_RANGE
		do
			if a_constant.contains_position (current_position) then
				l_range := message_manager.range (a_constant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_constant)
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			l_range: LS_RANGE
		do
			if a_feature.contains_position (current_position) then
				l_range := message_manager.range (a_feature, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_feature)
			end
		end

	process_unqualified_regular_feature_call (a_call: ET_UNQUALIFIED_REGULAR_FEATURE_CALL)
			-- Process `a_call'.
		local
			l_range: LS_RANGE
		do
			if a_call.contains_position (current_position) then
				l_range := message_manager.range (a_call, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_call)
			end
		end

	process_variant (a_variant: ET_VARIANT)
			-- Process `a_variant'.
		local
			l_range: LS_RANGE
		do
			if a_variant.contains_position (current_position) then
				l_range := message_manager.range (a_variant, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_variant)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		local
			l_range: LS_RANGE
		do
			if a_string.contains_position (current_position) then
				l_range := message_manager.range (a_string, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_string)
			end
		end

	process_when_expression (a_when_part: ET_WHEN_EXPRESSION)
			-- Process `a_when_part'.
		local
			l_range: LS_RANGE
		do
			if a_when_part.contains_position (current_position) then
				l_range := message_manager.range (a_when_part, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_when_part)
			end
		end

	process_when_part (a_when_part: ET_WHEN_PART)
			-- Process `a_when_part'.
		local
			l_range: LS_RANGE
		do
			if a_when_part.contains_position (current_position) then
				l_range := message_manager.range (a_when_part, current_class)
				create current_selection_range.make_with_parent (l_range, current_selection_range)
				precursor (a_when_part)
			end
		end

feature {NONE} -- Implementation

	current_class: ET_CLASS
			-- Class being processed

	current_position: ET_POSITION
			-- Position of selection

	current_selection_range: detachable LS_SELECTION_RANGE
			-- Selection range being built

invariant

	response_not_void: response /= Void
	message_manager_not_void: message_manager /= Void
	current_class_not_void: current_class /= Void
	current_position_not_void: current_position /= Void

end
