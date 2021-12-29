note

	description:

		"Eiffel AST iterators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_ITERATOR

inherit

	ET_AST_PROCESSOR

create

	make

feature {ET_AST_NODE} -- Processing

	process_across_expression (an_expression: ET_ACROSS_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.across_keyword.process (Current)
			an_expression.iterable_expression.process (Current)
			an_expression.as_keyword.process (Current)
			an_expression.item_name.process (Current)
			if attached an_expression.invariant_part as l_invariant_part then
				l_invariant_part.process (Current)
			end
			if attached an_expression.until_conditional as l_until_conditional then
				l_until_conditional.process (Current)
			end
			an_expression.iteration_conditional.process (Current)
			if attached an_expression.variant_part as l_variant_part then
				l_variant_part.process (Current)
			end
			an_expression.end_keyword.process (Current)
		end

	process_across_instruction (an_instruction: ET_ACROSS_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.across_keyword.process (Current)
			an_instruction.iterable_expression.process (Current)
			an_instruction.as_keyword.process (Current)
			an_instruction.item_name.process (Current)
			if attached an_instruction.from_compound as l_from_compound then
				l_from_compound.process (Current)
			end
			if attached an_instruction.invariant_part as l_invariant_part then
				l_invariant_part.process (Current)
			end
			if attached an_instruction.until_conditional as l_until_conditional then
				l_until_conditional.process (Current)
			end
			if attached an_instruction.loop_compound as l_loop_compound then
				l_loop_compound.process (Current)
			end
			if attached an_instruction.variant_part as l_variant_part then
				l_variant_part.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_symbol.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_symbol.process (Current)
		end

	process_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER_COMMA)
			-- Process `a_parameter'.
		do
			a_parameter.actual_parameter.process (Current)
			a_parameter.comma.process (Current)
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_bracket.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_bracket.process (Current)
		end

	process_actual_parameter_sublist (a_list: ET_ACTUAL_PARAMETER_SUBLIST)
			-- Process `a_list'.
		do
			a_list.actual_parameters.process (Current)
		end

	process_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND_COMMA)
			-- Process `an_argument'.
		do
			an_argument.agent_actual_argument.process (Current)
			an_argument.comma.process (Current)
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_agent_implicit_current_target (a_target: ET_AGENT_IMPLICIT_CURRENT_TARGET)
			-- Process `a_target'.
		do
			-- Do nothing.
		end

	process_agent_implicit_open_argument (an_argument: ET_AGENT_IMPLICIT_OPEN_ARGUMENT)
			-- Process `an_argument'.
		do
			-- Do nothing.
		end

	process_agent_keyword (a_keyword: ET_AGENT_KEYWORD)
			-- Process `a_keyword'.
		do
			process_keyword (a_keyword)
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET)
			-- Process `a_target'.
		do
			a_target.left_brace.process (Current)
			a_target.type.process (Current)
			a_target.right_brace.process (Current)
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.left_brace.process (Current)
			an_argument.type.process (Current)
			an_argument.right_brace.process (Current)
			an_argument.question_mark.process (Current)
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME)
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			a_name.alias_string.process (Current)
			if attached a_name.convert_keyword as l_convert_keyword then
				l_convert_keyword.process (Current)
			end
		end

	process_alias_name (a_name: ET_ALIAS_NAME)
			-- Process `a_name'.
		do
			a_name.alias_keyword.process (Current)
			a_name.alias_string.process (Current)
			if attached a_name.convert_keyword as l_convert_keyword then
				l_convert_keyword.process (Current)
			end
		end

	process_alias_name_list (a_list: ET_ALIAS_NAME_LIST)
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

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME)
			-- Process `a_name'.
		do
			a_name.feature_name.process (Current)
			a_name.alias_names.process (Current)
		end

	process_all_export (an_export: ET_ALL_EXPORT)
			-- Process `an_export'.
		do
			an_export.clients_clause.process (Current)
			an_export.all_keyword.process (Current)
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON)
			-- Process `an_assertion'.
		do
			an_assertion.assertion.process (Current)
			an_assertion.semicolon.process (Current)
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME)
			-- Process `an_assigner'.
		do
			an_assigner.assign_keyword.process (Current)
			an_assigner.feature_name.process (Current)
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.call.process (Current)
			an_instruction.assign_symbol.process (Current)
			an_instruction.source.process (Current)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT)
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			an_instruction.assign_symbol.process (Current)
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT)
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			an_instruction.assign_attempt_symbol.process (Current)
			an_instruction.source.process (Current)
		end

	process_ast_null_leaf (a_leaf: ET_AST_NULL_LEAF)
			-- Process `a_leaf'.
		do
		end

	process_attachment_mark_separate_keyword (a_keywords: ET_ATTACHMENT_MARK_SEPARATE_KEYWORD)
			-- Process `a_keywords'.
		do
			a_keywords.attachment_mark.process (Current)
			a_keywords.separateness_keyword.process (Current)
		end

	process_attribute (a_feature: ET_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.left_bang.process (Current)
			if attached an_instruction.type as l_type then
				l_type.process (Current)
			end
			an_instruction.right_bang.process (Current)
			an_instruction.target.process (Current)
			if attached an_instruction.creation_call as l_creation_call then
				l_creation_call.process (Current)
			end
		end

	process_base_type_constraint_list (a_list: ET_BASE_TYPE_CONSTRAINT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_base_type_rename_constraint (a_type_rename_constraint: ET_BASE_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		do
			a_type_rename_constraint.type.process (Current)
			a_type_rename_constraint.renames.process (Current)
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME)
			-- Process `a_name'.
		do
			a_name.left_brace.process (Current)
			a_name.class_name.process (Current)
			a_name.right_brace.process (Current)
		end

	process_braced_type (a_type: ET_BRACED_TYPE)
			-- Process `a_type'.
		do
			a_type.left_brace.process (Current)
			a_type.type.process (Current)
			a_type.right_brace.process (Current)
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.target.process (Current)
			if attached an_expression.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_bracket_symbol (a_symbol: ET_BRACKET_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_break (a_break: detachable ET_BREAK)
			-- Process `a_break'.
		do
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT)
			-- Process `an_expression'.
		do
			an_expression.agent_keyword.process (Current)
			an_expression.target.process (Current)
			an_expression.qualified_name.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION)
			-- Process `an_instruction'.
		local
			i, nb: INTEGER
		do
			an_instruction.check_keyword.process (Current)
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_instruction.item (i).process (Current)
				i := i + 1
			end
			if attached an_instruction.then_compound as l_then_compound then
				l_then_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA)
			-- Process `a_choice'.
		do
			a_choice.choice.process (Current)
			a_choice.comma.process (Current)
		end

	process_choice_list (a_list: ET_CHOICE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.when_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE)
			-- Process `a_choice'.
		do
			a_choice.lower.process (Current)
			a_choice.dotdot.process (Current)
			a_choice.upper.process (Current)
		end

	process_class (a_class: ET_CLASS)
			-- Process `a_class'.
		do
			process_break (a_class.leading_break)
			if attached a_class.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_class.frozen_keyword as l_frozen_keyword then
				l_frozen_keyword.process (Current)
			end
			if attached a_class.class_mark as l_class_mark then
				l_class_mark.process (Current)
			end
			if attached a_class.external_keyword as l_external_keyword then
				l_external_keyword.process (Current)
			end
			a_class.class_keyword.process (Current)
			a_class.name.process (Current)
			if attached a_class.formal_parameters as l_formal_parameters then
				l_formal_parameters.process (Current)
			end
			if attached a_class.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_class.parent_clauses as l_parent_clauses then
				l_parent_clauses.process (Current)
			end
			if attached a_class.creators as l_creators then
				l_creators.process (Current)
			end
			if attached a_class.convert_features as l_convert_features then
				l_convert_features.process (Current)
			end
			process_features (a_class)
			if attached a_class.invariants as l_invariants then
				l_invariants.process (Current)
			end
			if attached a_class.second_indexing as l_second_indexing then
				l_second_indexing.process (Current)
			end
			a_class.end_keyword.process (Current)
		end

	process_class_assertion (a_assertion: ET_CLASS_ASSERTION)
			-- Process `a_assertion'.
		do
			process_keyword (a_assertion.class_keyword)
		end

	process_class_type (a_type: ET_CLASS_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.name.process (Current)
			if attached a_type.actual_parameters as l_actual_parameters then
				l_actual_parameters.process (Current)
			end
		end

	process_client (a_client: ET_CLIENT)
			-- Process `a_client'.
		do
			a_client.name.process (Current)
		end

	process_client_comma (a_client_comma: ET_CLIENT_COMMA)
			-- Process `a_client_comma'.
		do
			a_client_comma.name.process (Current)
			a_client_comma.comma.process (Current)
		end

	process_clients (a_list: ET_CLIENTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_colon_type (a_type: ET_COLON_TYPE)
			-- Process `a_type'.
		do
			a_type.colon.process (Current)
			a_type.type.process (Current)
		end

	process_compound (a_list: ET_COMPOUND)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			a_feature.is_keyword.process (Current)
			a_feature.constant.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		do
			if attached a_parameter.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_parameter.name.process (Current)
			a_parameter.arrow_symbol.process (Current)
			a_parameter.constraint.process (Current)
			if attached a_parameter.creation_procedures as l_creation_procedures then
				l_creation_procedures.process (Current)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.create_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_constraint_rename_list (a_list: ET_CONSTRAINT_RENAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.rename_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_convert_builtin_expression (a_convert_expression: ET_CONVERT_BUILTIN_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE_COMMA)
			-- Process `a_convert_feature'.
		do
			a_convert_feature.convert_feature.process (Current)
			a_convert_feature.comma.process (Current)
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.convert_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION)
			-- Process `a_convert_function'.
		do
			a_convert_function.name.process (Current)
			a_convert_function.colon.process (Current)
			a_convert_function.types.process (Current)
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE)
			-- Process `a_convert_procedure'.
		do
			a_convert_procedure.name.process (Current)
			a_convert_procedure.left_parenthesis.process (Current)
			a_convert_procedure.types.process (Current)
			a_convert_procedure.right_parenthesis.process (Current)
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.create_keyword.process (Current)
			if attached an_expression.creation_region as l_creation_region then
				l_creation_region.process (Current)
			end
			an_expression.creation_type.process (Current)
			if attached an_expression.creation_call as l_creation_call then
				l_creation_call.process (Current)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.create_keyword.process (Current)
			if attached an_instruction.creation_region as l_creation_region then
				l_creation_region.process (Current)
			end
			if attached an_instruction.creation_type as l_creation_type then
				l_creation_type.process (Current)
			end
			an_instruction.target.process (Current)
			if attached an_instruction.creation_call as l_creation_call then
				l_creation_call.process (Current)
			end
		end

	process_creation_region (a_region: ET_CREATION_REGION)
			-- Process `a_region'.
		do
			a_region.left_symbol.process (Current)
			a_region.class_name.process (Current)
			a_region.right_symbol.process (Current)
		end

	process_creator (a_list: ET_CREATOR)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.create_keyword.process (Current)
			if attached a_list.clients_clause as l_clients_clause then
				l_clients_clause.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_creator_list (a_list: ET_CREATOR_LIST)
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

	process_current (an_expression: ET_CURRENT)
			-- Process `an_expression'.
		do
			process_keyword (an_expression)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.current_keyword.process (Current)
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE)
			-- Process `an_attribute'.
		do
			an_attribute.creation_expression.process (Current)
			if attached an_attribute.settings as l_settings then
				l_settings.process (Current)
			end
			an_attribute.end_keyword.process (Current)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION)
			-- Process `an_instruction'.
		local
			i, nb: INTEGER
		do
			if attached an_instruction.compound as l_compound then
				l_compound.keyword.process (Current)
				if attached an_instruction.keys as l_keys then
					l_keys.process (Current)
				end
				nb := l_compound.count
				from i := 1 until i > nb loop
					l_compound.item (i).process (Current)
					i := i + 1
				end
			elseif attached an_instruction.keys as l_keys then
				l_keys.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			a_feature.deferred_keyword.process (Current)
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			a_feature.deferred_keyword.process (Current)
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached a_feature.locals as l_locals then
				l_locals.process (Current)
			end
			if attached a_feature.compound as l_compound then
				l_compound.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			an_expression.agent_keyword.process (Current)
			if attached an_expression.formal_arguments as l_formal_arguments then
				l_formal_arguments.process (Current)
			end
			an_expression.declared_type.process (Current)
			if attached an_expression.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached an_expression.locals as l_locals then
				l_locals.process (Current)
			end
			if attached an_expression.compound as l_compound then
				l_compound.process (Current)
			end
			if attached an_expression.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached an_expression.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			an_expression.end_keyword.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached a_feature.locals as l_locals then
				l_locals.process (Current)
			end
			if attached a_feature.compound as l_compound then
				l_compound.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			an_expression.agent_keyword.process (Current)
			if attached an_expression.formal_arguments as l_formal_arguments then
				l_formal_arguments.process (Current)
			end
			if attached an_expression.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached an_expression.locals as l_locals then
				l_locals.process (Current)
			end
			if attached an_expression.compound as l_compound then
				l_compound.process (Current)
			end
			if attached an_expression.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached an_expression.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			an_expression.end_keyword.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_dot_feature_name (a_name: ET_DOT_FEATURE_NAME)
			-- Process `a_name'.
		do
			a_name.dot.process (Current)
			a_name.feature_name.process (Current)
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
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_elseif_expression (an_elseif_part: ET_ELSEIF_EXPRESSION)
			-- Process `an_elseif_part'.
		do
			an_elseif_part.conditional.process (Current)
			an_elseif_part.then_keyword.process (Current)
			an_elseif_part.then_expression.process (Current)
		end

	process_elseif_expression_list (a_list: ET_ELSEIF_EXPRESSION_LIST)
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

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART)
			-- Process `an_elseif_part'.
		do
			an_elseif_part.conditional.process (Current)
			if attached an_elseif_part.then_compound as l_then_compound then
				l_then_compound.process (Current)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST)
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

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.operator.process (Current)
			an_expression.right.process (Current)
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- Process `a_convert_expression'.
		do
			a_convert_expression.expression.process (Current)
		end

	process_export_list (a_list: ET_EXPORT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.export_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.expression.process (Current)
		end

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
			an_expression.comma.process (Current)
		end

	process_extended_attribute (a_feature: ET_EXTENDED_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached a_feature.locals as l_locals then
				l_locals.process (Current)
			end
			if attached a_feature.compound as l_compound then
				l_compound.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME_COMMA)
			-- Process `a_name'.
		do
			a_name.extended_feature_name.process (Current)
			a_name.comma.process (Current)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			if attached a_feature.alias_clause as l_alias_clause then
				l_alias_clause.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		do
			an_expression.agent_keyword.process (Current)
			if attached an_expression.formal_arguments as l_formal_arguments then
				l_formal_arguments.process (Current)
			end
			an_expression.declared_type.process (Current)
			if attached an_expression.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			an_expression.language.process (Current)
			if attached an_expression.alias_clause as l_alias_clause then
				l_alias_clause.process (Current)
			end
			if attached an_expression.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			an_expression.end_keyword.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			if attached a_feature.alias_clause as l_alias_clause then
				l_alias_clause.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		do
			an_expression.agent_keyword.process (Current)
			if attached an_expression.formal_arguments as l_formal_arguments then
				l_formal_arguments.process (Current)
			end
			if attached an_expression.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			an_expression.language.process (Current)
			if attached an_expression.alias_clause as l_alias_clause then
				l_alias_clause.process (Current)
			end
			if attached an_expression.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			an_expression.end_keyword.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT)
			-- Process `a_constant'.
		do
			process_keyword (a_constant)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.name.process (Current)
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE)
			-- Process `a_feature_clause'.
		do
			a_feature_clause.feature_keyword.process (Current)
			if attached a_feature_clause.clients_clause as l_clients_clause then
				l_clients_clause.process (Current)
			end
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST)
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

	process_feature_export (an_export: ET_FEATURE_EXPORT)
			-- Process `an_export'.
		local
			i, nb: INTEGER
		do
			an_export.clients_clause.process (Current)
			nb := an_export.count
			from i := 1 until i > nb loop
				an_export.item (i).process (Current)
				i := i + 1
			end
		end

	process_feature_name_comma (a_name: ET_FEATURE_NAME_COMMA)
			-- Process `a_name'.
		do
			a_name.feature_name.process (Current)
			a_name.comma.process (Current)
		end

	process_features (a_class: ET_CLASS)
			-- Process feature clauses of `a_class'.
		require
			a_class_not_void: a_class /= Void
		local
			a_feature_clause: ET_FEATURE_CLAUSE
			l_queries: ET_QUERY_LIST
			l_query: detachable ET_QUERY
			l_procedures: ET_PROCEDURE_LIST
			l_procedure: detachable ET_PROCEDURE
			i, nb: INTEGER
			j, nb_queries: INTEGER
			k, nb_procedures: INTEGER
			l_process_query: BOOLEAN
		do
			if attached a_class.feature_clauses as l_feature_clauses then
				j := 1
				l_queries := a_class.queries
				nb_queries := l_queries.count
				if nb_queries > 0 then
					l_query := l_queries.first
				end
				k := 1
				l_procedures := a_class.procedures
				nb_procedures := l_procedures.count
				if nb_procedures > 0 then
					l_procedure := l_procedures.first
				end
				nb := l_feature_clauses.count
				from i := 1 until i > nb loop
					a_feature_clause := l_feature_clauses.item (i)
					a_feature_clause.process (Current)
					from
					until
						(l_query = Void or else l_query.feature_clause /= a_feature_clause) and
						(l_procedure = Void or else l_procedure.feature_clause /= a_feature_clause)
					loop
						if l_query /= Void and then l_query.feature_clause = a_feature_clause then
							if l_procedure /= Void and then l_procedure.feature_clause = a_feature_clause then
								l_process_query := l_query.name.position < l_procedure.name.position
							else
								l_process_query := True
							end
						else
							l_process_query := False
						end
						if l_process_query and l_query /= Void then
							l_query.process (Current)
								-- Next query.
							from
							until
								l_query = Void or else l_query.synonym = Void
							loop
								j := j + 1
								if j <= nb_queries then
									l_query := l_queries.item (j)
								else
									l_query := Void
								end
							end
							j := j + 1
							if j <= nb_queries then
								l_query := l_queries.item (j)
							else
								l_query := Void
							end
						elseif l_procedure /= Void then
							l_procedure.process (Current)
								-- Next procedure.
							from
							until
								l_procedure = Void or else l_procedure.synonym = Void
							loop
								k := k + 1
								if k <= nb_procedures then
									l_procedure := l_procedures.item (k)
								else
									l_procedure := Void
								end
							end
							k := k + 1
							if k <= nb_procedures then
								l_procedure := l_procedures.item (k)
							else
								l_procedure := Void
							end
						end
					end
					i := i + 1
				end
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.name_item.process (Current)
			an_argument.declared_type.process (Current)
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON)
			-- Process `an_argument'.
		do
			an_argument.formal_argument.process (Current)
			an_argument.semicolon.process (Current)
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT)
			-- Process `an_argument'.
		do
			an_argument.name_item.process (Current)
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER)
			-- Process `a_parameter'.
		do
			if attached a_parameter.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_parameter.name.process (Current)
		end

	process_formal_parameter_comma (a_parameter: ET_FORMAL_PARAMETER_COMMA)
			-- Process `a_parameter'.
		do
			a_parameter.formal_parameter.process (Current)
			a_parameter.comma.process (Current)
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_bracket.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_bracket.process (Current)
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.name.process (Current)
		end

	process_free_operator (an_operator: ET_FREE_OPERATOR)
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_identifier (an_identifier: ET_IDENTIFIER)
			-- Process `an_identifier'.
		do
			process_token (an_identifier)
		end

	process_identifier_colon (an_identifier: ET_IDENTIFIER_COLON)
			-- Process `an_identifier'.
		do
			an_identifier.identifier.process (Current)
			an_identifier.colon.process (Current)
		end

	process_identifier_comma (an_identifier: ET_IDENTIFIER_COMMA)
			-- Process `an_identifier'.
		do
			an_identifier.identifier.process (Current)
			an_identifier.comma.process (Current)
		end

	process_if_expression (a_expression: ET_IF_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.conditional.process (Current)
			a_expression.then_keyword.process (Current)
			a_expression.then_expression.process (Current)
			if attached a_expression.elseif_parts as l_elseif_parts then
				l_elseif_parts.process (Current)
			end
			a_expression.else_keyword.process (Current)
			a_expression.else_expression.process (Current)
			a_expression.end_keyword.process (Current)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.conditional.process (Current)
			if attached an_instruction.then_compound as l_then_compound then
				l_then_compound.process (Current)
			end
			if attached an_instruction.elseif_parts as l_elseif_parts then
				l_elseif_parts.process (Current)
			end
			if attached an_instruction.else_compound as l_else_compound then
				l_else_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_implicit_type_mark (a_type_mark: ET_IMPLICIT_TYPE_MARK)
			-- Process `a_type_mark'.
		do
			-- Implicit type marks are ignored.
		end

	process_indexing (an_indexing: ET_INDEXING)
			-- Process `an_indexing'.
		do
			an_indexing.terms.process (Current)
		end

	process_indexing_list (a_list: ET_INDEXING_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.indexing_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_indexing_semicolon (an_indexing: ET_INDEXING_SEMICOLON)
			-- Process `an_indexing'.
		do
			an_indexing.indexing_item.process (Current)
			an_indexing.semicolon.process (Current)
		end

	process_indexing_term_comma (an_indexing_term: ET_INDEXING_TERM_COMMA)
			-- Process `an_indexing_term'.
		do
			an_indexing_term.indexing_term.process (Current)
			an_indexing_term.comma.process (Current)
		end

	process_indexing_term_list (a_list: ET_INDEXING_TERM_LIST)
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

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR)
			-- Process `an_operator'.
		do
			an_operator.and_keyword.process (Current)
			an_operator.then_keyword.process (Current)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.name.process (Current)
			an_expression.right.process (Current)
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR)
			-- Process `an_operator'.
		do
			an_operator.or_keyword.process (Current)
			an_operator.else_keyword.process (Current)
		end

	process_inspect_expression (a_expression: ET_INSPECT_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.conditional.process (Current)
			if attached a_expression.when_parts as l_when_parts then
				l_when_parts.process (Current)
			end
			if attached a_expression.else_part as l_else_part then
				l_else_part.process (Current)
			end
			a_expression.end_keyword.process (Current)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.conditional.process (Current)
			if attached an_instruction.when_parts as l_when_parts then
				l_when_parts.process (Current)
			end
			if attached an_instruction.else_compound as l_else_compound then
				l_else_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.invariant_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_iteration_cursor (a_iteration_cursor: ET_ITERATION_CURSOR)
			-- Process `a_iteration_cursor'.
		do
			a_iteration_cursor.at_symbol.process (Current)
			a_iteration_cursor.item_name.process (Current)
		end

	process_keyword (a_keyword: ET_KEYWORD)
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.keyword.process (Current)
			an_expression.expression.process (Current)
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING)
			-- Process `a_string'.
		do
			a_string.keyword.process (Current)
			a_string.manifest_string.process (Current)
		end

	process_keyword_operator (a_keyword: ET_KEYWORD_OPERATOR)
			-- Process `a_keyword'.
		do
			process_keyword (a_keyword)
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER)
			-- Process `a_parameter'.
		do
			a_parameter.label_item.process (Current)
			a_parameter.declared_type.process (Current)
		end

	process_labeled_actual_parameter_semicolon (a_parameter: ET_LABELED_ACTUAL_PARAMETER_SEMICOLON)
			-- Process `a_parameter'.
		do
			a_parameter.actual_parameter.process (Current)
			a_parameter.semicolon.process (Current)
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER)
			-- Process `a_parameter'.
		do
			a_parameter.label_item.process (Current)
		end

	process_like_current (a_type: ET_LIKE_CURRENT)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.like_keyword.process (Current)
			a_type.current_keyword.process (Current)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.like_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_like_n (a_type: ET_LIKE_N)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.like_keyword.process (Current)
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON)
			-- Process `a_local'.
		do
			a_local.local_variable.process (Current)
			a_local.semicolon.process (Current)
		end

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE)
			-- Process `a_local'.
		do
			a_local.name_item.process (Current)
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE)
			-- Process `a_local'.
		do
			a_local.name_item.process (Current)
			a_local.declared_type.process (Current)
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.local_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.from_compound as l_from_compound then
				l_from_compound.process (Current)
			end
			if attached an_instruction.invariant_part as l_invariant_part then
				l_invariant_part.process (Current)
			end
			if an_instruction.has_old_variant_syntax and then attached an_instruction.variant_part as l_variant_part then
				l_variant_part.process (Current)
			end
			an_instruction.until_conditional.process (Current)
			if attached an_instruction.loop_compound as l_loop_compound then
				l_loop_compound.process (Current)
			end
			if not an_instruction.has_old_variant_syntax and then attached an_instruction.variant_part as l_variant_part then
				l_variant_part.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.invariant_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			if attached an_expression.cast_type as l_type then
				l_type.process (Current)
			end
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	process_manifest_string_comma (a_string: ET_MANIFEST_STRING_COMMA)
			-- Process `a_string'.
		do
			a_string.manifest_string.process (Current)
			a_string.comma.process (Current)
		end

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_parenthesis.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_parenthesis.process (Current)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.left_symbol.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_symbol.process (Current)
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			an_expression.type.process (Current)
			an_expression.right_brace.process (Current)
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.attached_keyword.process (Current)
			if attached an_expression.declared_type as l_declared_type then
				l_declared_type.process (Current)
			end
			an_expression.expression.process (Current)
			an_expression.as_keyword.process (Current)
			an_expression.name.process (Current)
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.operator.process (Current)
			an_expression.right.process (Current)
		end

	process_object_test (an_expression: ET_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.attached_keyword.process (Current)
			if attached an_expression.declared_type as l_declared_type then
				l_declared_type.process (Current)
			end
			an_expression.expression.process (Current)
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.old_keyword.process (Current)
			an_expression.expression.process (Current)
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST)
			-- Process `an_expression'.
		do
			an_expression.left_brace.process (Current)
			an_expression.name.process (Current)
			an_expression.colon.process (Current)
			an_expression.type.process (Current)
			an_expression.right_brace.process (Current)
			an_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
			i, nb: INTEGER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached a_feature.locals as l_locals then
				l_locals.process (Current)
			end
			if attached a_feature.compound as l_compound then
				l_compound.keyword.process (Current)
				if attached a_feature.keys as l_keys then
					l_keys.process (Current)
				end
				nb := l_compound.count
				from i := 1 until i > nb loop
					l_compound.item (i).process (Current)
					i := i + 1
				end
			elseif attached a_feature.keys as l_keys then
				l_keys.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.agent_keyword.process (Current)
			if attached an_expression.formal_arguments as l_formal_arguments then
				l_formal_arguments.process (Current)
			end
			an_expression.declared_type.process (Current)
			if attached an_expression.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached an_expression.locals as l_locals then
				l_locals.process (Current)
			end
			if attached an_expression.compound as l_compound then
				l_compound.keyword.process (Current)
				if attached an_expression.keys as l_keys then
					l_keys.process (Current)
				end
				nb := l_compound.count
				from i := 1 until i > nb loop
					l_compound.item (i).process (Current)
					i := i + 1
				end
			elseif attached an_expression.keys as l_keys then
				l_keys.process (Current)
			end
			if attached an_expression.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached an_expression.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			an_expression.end_keyword.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING)
			-- Process `an_expression'.
		do
			an_expression.once_keyword.process (Current)
			an_expression.manifest_string.process (Current)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
			i, nb: INTEGER
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			if attached a_feature.arguments as l_arguments then
				l_arguments.process (Current)
			end
			if attached a_feature.is_keyword as l_is_keyword then
				l_is_keyword.process (Current)
			end
			if attached a_feature.first_indexing as l_first_indexing then
				l_first_indexing.process (Current)
			end
			if attached a_feature.obsolete_message as l_obsolete_message then
				l_obsolete_message.process (Current)
			end
			if attached a_feature.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached a_feature.locals as l_locals then
				l_locals.process (Current)
			end
			if attached a_feature.compound as l_compound then
				l_compound.keyword.process (Current)
				if attached a_feature.keys as l_keys then
					l_keys.process (Current)
				end
				nb := l_compound.count
				from i := 1 until i > nb loop
					l_compound.item (i).process (Current)
					i := i + 1
				end
			elseif attached a_feature.keys as l_keys then
				l_keys.process (Current)
			end
			if attached a_feature.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached a_feature.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.agent_keyword.process (Current)
			if attached an_expression.formal_arguments as l_formal_arguments then
				l_formal_arguments.process (Current)
			end
			if attached an_expression.preconditions as l_preconditions then
				l_preconditions.process (Current)
			end
			if attached an_expression.locals as l_locals then
				l_locals.process (Current)
			end
			if attached an_expression.compound as l_compound then
				l_compound.keyword.process (Current)
				if attached an_expression.keys as l_keys then
					l_keys.process (Current)
				end
				nb := l_compound.count
				from i := 1 until i > nb loop
					l_compound.item (i).process (Current)
					i := i + 1
				end
			elseif attached an_expression.keys as l_keys then
				l_keys.process (Current)
			end
			if attached an_expression.postconditions as l_postconditions then
				l_postconditions.process (Current)
			end
			if attached an_expression.rescue_clause as l_rescue_clause then
				l_rescue_clause.process (Current)
			end
			an_expression.end_keyword.process (Current)
			if attached {ET_AGENT_ARGUMENT_OPERAND_LIST} an_expression.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_parent (a_parent: ET_PARENT)
			-- Process `a_parent'.
		do
			a_parent.type.process (Current)
			if attached a_parent.renames as l_renames then
				l_renames.process (Current)
			end
			if attached a_parent.exports as l_exports then
				l_exports.process (Current)
			end
			if attached a_parent.undefines as l_undefines then
				l_undefines.process (Current)
			end
			if attached a_parent.redefines as l_redefines then
				l_redefines.process (Current)
			end
			if attached a_parent.selects as l_selects then
				l_selects.process (Current)
			end
			if attached a_parent.end_keyword as l_end_keyword then
				l_end_keyword.process (Current)
			end
		end

	process_parent_clause_list (a_list: ET_PARENT_CLAUSE_LIST)
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

	process_parent_list (a_list: ET_PARENT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.inherit_keyword.process (Current)
			if attached a_list.clients_clause as l_clients_clause then
				l_clients_clause.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_parent_semicolon (a_parent: ET_PARENT_SEMICOLON)
			-- Process `a_parent'.
		do
			a_parent.parent.process (Current)
			a_parent.semicolon.process (Current)
		end

	process_parenthesis_expression (an_expression: ET_PARENTHESIS_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.target.process (Current)
			if attached an_expression.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_parenthesis_instruction (an_instruction: ET_PARENTHESIS_INSTRUCTION)
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			if attached an_instruction.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_parenthesis_symbol (a_symbol: ET_PARENTHESIS_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.left_parenthesis.process (Current)
			an_expression.expression.process (Current)
			an_expression.right_parenthesis.process (Current)
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.ensure_keyword.process (Current)
			if attached a_list.then_keyword as l_then_keyword then
				l_then_keyword.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.require_keyword.process (Current)
			if attached a_list.else_keyword as l_else_keyword then
				l_else_keyword.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION)
			-- Process `an_expression'.
		do
			if not an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			if attached an_expression.parent_name as l_parent_name then
				l_parent_name.process (Current)
			end
			if an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			if attached an_expression.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if not an_instruction.is_parent_prefixed then
				an_instruction.precursor_keyword.process (Current)
			end
			if attached an_instruction.parent_name as l_parent_name then
				l_parent_name.process (Current)
			end
			if an_instruction.is_parent_prefixed then
				an_instruction.precursor_keyword.process (Current)
			end
			if attached an_instruction.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_precursor_keyword (a_keyword: ET_PRECURSOR_KEYWORD)
			-- Process `a_keyword'.
		do
			process_keyword (a_keyword)
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION)
			-- Process `an_expression'.
		do
			an_expression.name.process (Current)
			an_expression.expression.process (Current)
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL)
			-- Process `a_call'.
		do
			a_call.qualified_name.process (Current)
			if attached a_call.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_qualified_regular_feature_call (an_expression)
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_qualified_regular_feature_call (an_instruction)
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.like_keyword.process (Current)
			a_type.left_brace.process (Current)
			a_type.target_type.process (Current)
			a_type.right_brace.process (Current)
			a_type.qualified_name.process (Current)
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.target_type.process (Current)
			a_type.qualified_name.process (Current)
		end

	process_qualified_regular_feature_call (a_call: ET_QUALIFIED_REGULAR_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.target.process (Current)
			a_call.qualified_name.process (Current)
			if attached a_call.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_quantifier_expression (a_expression: ET_QUANTIFIER_EXPRESSION)
			-- Process `a_expression'.
		do
			a_expression.quantifier_symbol.process (Current)
			a_expression.item_name.process (Current)
			a_expression.colon_symbol.process (Current)
			a_expression.iterable_expression.process (Current)
			a_expression.bar_symbol.process (Current)
			a_expression.iteration_expression.process (Current)
		end

	process_question_mark_symbol (a_symbol: ET_QUESTION_MARK_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING)
			-- Process `a_string'.
		do
			if attached a_string.cast_type as l_type then
				l_type.process (Current)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_rename (a_rename: ET_RENAME)
			-- Process `a_rename'.
		do
			a_rename.old_name.process (Current)
			a_rename.as_keyword.process (Current)
			a_rename.new_name.process (Current)
		end

	process_rename_comma (a_rename: ET_RENAME_COMMA)
			-- Process `a_rename'.
		do
			process_rename (a_rename)
			a_rename.comma.process (Current)
		end

	process_rename_list (a_list: ET_RENAME_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.rename_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_repeat_instruction (a_instruction: ET_REPEAT_INSTRUCTION)
			-- Process `a_instruction'.
		local
			i, nb: INTEGER
		do
			a_instruction.open_repeat_symbol.process (Current)
			a_instruction.item_name.process (Current)
			a_instruction.colon_symbol.process (Current)
			a_instruction.iterable_expression.process (Current)
			a_instruction.bar_symbol.process (Current)
			if attached a_instruction.loop_compound as l_loop_compound then
				nb := l_loop_compound.count
				from i := 1 until i > nb loop
					l_loop_compound.item (i).process (Current)
					i := i + 1
				end
			end
			a_instruction.close_repeat_symbol.process (Current)
		end

	process_result (an_expression: ET_RESULT)
			-- Process `an_expression'.
		do
			process_keyword (an_expression)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS)
			-- Process `an_expression'.
		do
			an_expression.dollar.process (Current)
			an_expression.result_keyword.process (Current)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_keyword (an_instruction)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING)
			-- Process `a_string'.
		do
			if attached a_string.cast_type as l_type then
				l_type.process (Current)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			if attached an_expression.feature_keyword as l_feature_keyword then
				l_feature_keyword.process (Current)
			end
			an_expression.static_type.process (Current)
			an_expression.qualified_name.process (Current)
			if attached an_expression.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			if attached an_instruction.feature_keyword as l_feature_keyword then
				l_feature_keyword.process (Current)
			end
			an_instruction.static_type.process (Current)
			an_instruction.qualified_name.process (Current)
			if attached an_instruction.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION)
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.strip_keyword.process (Current)
			an_expression.left_parenthesis.process (Current)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			an_expression.right_parenthesis.process (Current)
		end

	process_symbol (a_symbol: ET_SYMBOL)
			-- Process `a_symbol'.
		do
		end

	process_symbol_operator (a_symbol: ET_SYMBOL_OPERATOR)
			-- Process `a_symbol'.
		do
			process_symbol (a_symbol)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION)
			-- Process `an_assertion'.
		do
			an_assertion.tag.process (Current)
			if attached an_assertion.untagged_assertion as l_untagged_assertion then
				l_untagged_assertion.process (Current)
			end
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING)
			-- Process `an_indexing'.
		do
			an_indexing.tag.process (Current)
			process_indexing (an_indexing)
		end

	process_token (a_token: ET_TOKEN)
			-- Process `a_token'.
		require
			a_token_not_void: a_token /= Void
		do
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT)
			-- Process `a_constant'.
		do
			process_keyword (a_constant)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE)
			-- Process `a_type'.
		do
			if attached a_type.type_mark as l_type_mark then
				l_type_mark.process (Current)
			end
			a_type.tuple_keyword.process (Current)
			if attached a_type.actual_parameters as l_parameters then
				l_parameters.process (Current)
			end
		end

	process_type_comma (a_type: ET_TYPE_COMMA)
			-- Process `a_type'.
		do
			a_type.type.process (Current)
			a_type.comma.process (Current)
		end

	process_type_constraint_comma (a_type_constraint_comma: ET_TYPE_CONSTRAINT_COMMA)
			-- Process `a_type_constraint_comma'.
		do
			a_type_constraint_comma.type_constraint.process (Current)
			a_type_constraint_comma.comma.process (Current)
		end

	process_type_constraint_list (a_list: ET_TYPE_CONSTRAINT_LIST)
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.left_brace.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.right_brace.process (Current)
		end

	process_type_rename_constraint (a_type_rename_constraint: ET_TYPE_RENAME_CONSTRAINT)
			-- Process `a_type_rename_constraint'.
		do
			a_type_rename_constraint.type.process (Current)
			a_type_rename_constraint.renames.process (Current)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT)
			-- Process `a_constant'.
		do
			if attached a_constant.cast_type as l_type then
				l_type.process (Current)
			end
			if attached a_constant.sign as l_sign then
				l_sign.process (Current)
			end
		end

	process_unfolded_empty_tuple_actual_parameters (a_list: ET_UNFOLDED_EMPTY_TUPLE_ACTUAL_PARAMETERS)
			-- Process `a_list'.
		do
		end

	process_unfolded_tuple_actual_argument_list (a_list: ET_UNFOLDED_TUPLE_ACTUAL_ARGUMENT_LIST)
			-- Process `a_list'.
		do
			if attached a_list.actual_arguments as l_actual_arguments then
				l_actual_arguments.process (Current)
			end
		end

	process_unfolded_tuple_actual_parameters (a_list: ET_UNFOLDED_TUPLE_ACTUAL_PARAMETERS)
			-- Process `a_list'.
		do
			a_list.actual_parameters.process (Current)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- Process `a_feature'.
		local
			a_synonym: detachable ET_FEATURE
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			a_feature.is_keyword.process (Current)
			a_feature.unique_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_unqualified_call_expression (an_expression: ET_UNQUALIFIED_CALL_EXPRESSION)
			-- Process `an_expression'.
		do
			process_unqualified_regular_feature_call (an_expression)
		end

	process_unqualified_call_instruction (an_instruction: ET_UNQUALIFIED_CALL_INSTRUCTION)
			-- Process `an_instruction'.
		do
			process_unqualified_regular_feature_call (an_instruction)
		end

	process_unqualified_regular_feature_call (a_call: ET_UNQUALIFIED_REGULAR_FEATURE_CALL)
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		do
			a_call.name.process (Current)
			if attached a_call.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_variant (a_variant: ET_VARIANT)
			-- Process `a_variant'.
		do
			a_variant.variant_keyword.process (Current)
			if attached a_variant.tag as l_tag then
				l_tag.process (Current)
			end
			a_variant.expression.process (Current)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING)
			-- Process `a_string'.
		do
			if attached a_string.cast_type as l_type then
				l_type.process (Current)
			end
		end

	process_void (an_expression: ET_VOID)
			-- Process `an_expression'.
		do
			process_keyword (an_expression)
		end

	process_when_expression (a_when_part: ET_WHEN_EXPRESSION)
			-- Process `a_when_part'.
		do
			a_when_part.choices.process (Current)
			a_when_part.then_keyword.process (Current)
			a_when_part.then_expression.process (Current)
		end

	process_when_expression_list (a_list: ET_WHEN_EXPRESSION_LIST)
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

	process_when_part (a_when_part: ET_WHEN_PART)
			-- Process `a_when_part'.
		do
			a_when_part.choices.process (Current)
			if attached a_when_part.then_compound as l_compound then
				l_compound.process (Current)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST)
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

feature {ET_CLUSTER} -- Processing

	process_cluster (a_cluster: ET_CLUSTER)
			-- Process `a_cluster'.
		do
			-- Do not iterate over classes of `a_cluster'.
		end

feature {ET_MASTER_CLASS} -- Processing

	process_master_class (a_class: ET_MASTER_CLASS)
			-- Process `a_class'.
		do
			-- Do not iterate over classes of `a_class'.
		end

end
