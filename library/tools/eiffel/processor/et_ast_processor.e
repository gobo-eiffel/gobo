indexing

	description:

		"Eiffel AST processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_PROCESSOR

feature -- Processing

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_actual_generic_parameters (a_list: ET_ACTUAL_GENERIC_PARAMETERS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_all_export (an_export: ET_ALL_EXPORT) is
			-- Process `an_export'.
		require
			an_export_not_void: an_export /= Void
		deferred
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON) is
			-- Process `an_assertion'.
		require
			an_assertion_not_void: an_assertion /= Void
		deferred
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_bit_identifier (a_type: ET_BIT_IDENTIFIER) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_bit_type (a_type: ET_BIT_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA) is
			-- Process `a_choice'.
		require
			a_choice_not_void: a_choice /= Void
		deferred
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE) is
			-- Process `a_choice'.
		require
			a_choice_not_void: a_choice /= Void
		deferred
		end

	process_class_name_comma (a_name: ET_CLASS_NAME_COMMA) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_clients (a_list: ET_CLIENTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_colon_formal_argument (an_argument: ET_COLON_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_colon_local_variable (a_local: ET_COLON_LOCAL_VARIABLE) is
			-- Process `a_local'.
		require
			a_local_not_void: a_local /= Void
		deferred
		end

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_comma_formal_argument (an_argument: ET_COMMA_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_comma_local_variable (a_local: ET_COMMA_LOCAL_VARIABLE) is
			-- Process `a_local'.
		require
			a_local_not_void: a_local /= Void
		deferred
		end

	process_compound (a_list: ET_COMPOUND) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_constrained_formal_generic_parameter (a_parameter: ET_CONSTRAINED_FORMAL_GENERIC_PARAMETER) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_creator (a_list: ET_CREATOR) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_creators (a_list: ET_CREATORS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_debug_keys (a_list: ET_DEBUG_KEYS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_deferred_keyword (a_keyword: ET_DEFERRED_KEYWORD) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		deferred
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART) is
			-- Process `an_elseif_part'.
		require
			an_elseif_part_not_void: an_elseif_part /= Void
		deferred
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_equal_symbol (a_symbol: ET_EQUAL_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		deferred
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_expanded_keyword (a_keyword: ET_EXPANDED_KEYWORD) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		deferred
		end

	process_exports (a_list: ET_EXPORTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_expression_list (a_list: ET_EXPRESSION_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_expression_variant (a_variant: ET_EXPRESSION_VARIANT) is
			-- Process `a_variant'.
		require
			a_variant_not_void: a_variant /= Void
		deferred
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_feature_clause (a_list: ET_FEATURE_CLAUSE) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_feature_clauses (a_list: ET_FEATURE_CLAUSES) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT) is
			-- Process `an_export'.
		require
			an_export_not_void: an_export /= Void
		deferred
		end

	process_feature_name_comma (a_name: ET_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_feature_semicolon (a_feature: ET_FEATURE_SEMICOLON) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_formal_arguments (a_list: ET_FORMAL_ARGUMENTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_formal_generic_parameter (a_parameter: ET_FORMAL_GENERIC_PARAMETER) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_formal_generic_parameter_comma (a_parameter: ET_FORMAL_GENERIC_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_formal_generic_parameters (a_list: ET_FORMAL_GENERIC_PARAMETERS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_formal_generic_type (a_type: ET_FORMAL_GENERIC_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_generic_named_type (a_type: ET_GENERIC_NAMED_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_free_operator (an_operator: ET_FREE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		require
			an_identifier_not_void: an_identifier /= Void
		deferred
		end

	process_identifier_colon (an_identifier: ET_IDENTIFIER_COLON) is
			-- Process `an_identifier'.
		require
			an_identifier_not_void: an_identifier /= Void
		deferred
		end

	process_identifier_comma (an_identifier: ET_IDENTIFIER_COMMA) is
			-- Process `an_identifier'.
		require
			an_identifier_not_void: an_identifier /= Void
		deferred
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_indexing (an_indexing: ET_INDEXING) is
			-- Process `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		deferred
		end

	process_indexing_semicolon (an_indexing: ET_INDEXING_SEMICOLON) is
			-- Process `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		deferred
		end

	process_indexing_term_comma (an_indexing_term: ET_INDEXING_TERM_COMMA) is
			-- Process `an_indexing_term'.
		require
			an_indexing_term_not_void: an_indexing_term /= Void
		deferred
		end

	process_indexing_terms (a_list: ET_INDEXING_TERMS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_indexings (a_list: ET_INDEXINGS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_infix_and_name (a_name: ET_INFIX_AND_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_and_operator (an_operator: ET_INFIX_AND_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_and_then_name (a_name: ET_INFIX_AND_THEN_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_div_name (a_name: ET_INFIX_DIV_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_div_operator (an_operator: ET_INFIX_DIV_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_divide_name (a_name: ET_INFIX_DIVIDE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_divide_operator (an_operator: ET_INFIX_DIVIDE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_infix_free_name (a_name: ET_INFIX_FREE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_free_operator (an_operator: ET_INFIX_FREE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_ge_name (a_name: ET_INFIX_GE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_ge_operator (an_operator: ET_INFIX_GE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_gt_name (a_name: ET_INFIX_GT_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_gt_operator (an_operator: ET_INFIX_GT_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_implies_name (a_name: ET_INFIX_IMPLIES_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_implies_operator (an_operator: ET_INFIX_IMPLIES_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_le_name (a_name: ET_INFIX_LE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_le_operator (an_operator: ET_INFIX_LE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_lt_name (a_name: ET_INFIX_LT_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_lt_operator (an_operator: ET_INFIX_LT_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_minus_name (a_name: ET_INFIX_MINUS_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_minus_operator (an_operator: ET_INFIX_MINUS_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_mod_name (a_name: ET_INFIX_MOD_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_mod_operator (an_operator: ET_INFIX_MOD_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_or_else_name (a_name: ET_INFIX_OR_ELSE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_or_name (a_name: ET_INFIX_OR_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_or_operator (an_operator: ET_INFIX_OR_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_plus_name (a_name: ET_INFIX_PLUS_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_plus_operator (an_operator: ET_INFIX_PLUS_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_power_name (a_name: ET_INFIX_POWER_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_power_operator (an_operator: ET_INFIX_POWER_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_times_name (a_name: ET_INFIX_TIMES_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_times_operator (an_operator: ET_INFIX_TIMES_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_infix_xor_name (a_name: ET_INFIX_XOR_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_infix_xor_operator (an_operator: ET_INFIX_XOR_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_invariants (a_list: ET_INVARIANTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING) is
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	process_like_argument (a_type: ET_LIKE_ARGUMENT) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_like_identifier (a_type: ET_LIKE_IDENTIFIER) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON) is
			-- Process `an_argument'.
		require
			a_local_not_void: a_local /= Void
		deferred
		end

	process_local_variables (a_list: ET_LOCAL_VARIABLES) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_manifest_string_comma (a_string: ET_MANIFEST_STRING_COMMA) is
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_minus_symbol (a_symbol: ET_MINUS_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		deferred
		end

	process_named_type (a_type: ET_NAMED_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_none_clients (a_list: ET_NONE_CLIENTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_not_equal_symbol (a_symbol: ET_NOT_EQUAL_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		deferred
		end

	process_obsolete (an_obsolete: ET_OBSOLETE) is
			-- Process `an_obsolete'.
		require
			an_obsolete_not_void: an_obsolete /= Void
		deferred
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_parent (a_parent: ET_PARENT) is
			-- Process `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		deferred
		end

	process_parent_semicolon (a_parent: ET_PARENT_SEMICOLON) is
			-- Process `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
		deferred
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_parents (a_list: ET_PARENTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_plus_symbol (a_symbol: ET_PLUS_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		deferred
		end

	process_postconditions (a_list: ET_POSTCONDITIONS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_preconditions (a_list: ET_PRECONDITIONS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_prefix_free_name (a_name: ET_PREFIX_FREE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_prefix_free_operator (an_operator: ET_PREFIX_FREE_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_prefix_minus_name (a_name: ET_PREFIX_MINUS_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_prefix_minus_operator (an_operator: ET_PREFIX_MINUS_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_prefix_not_name (a_name: ET_PREFIX_NOT_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_prefix_not_operator (an_operator: ET_PREFIX_NOT_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_prefix_plus_name (a_name: ET_PREFIX_PLUS_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_prefix_plus_operator (an_operator: ET_PREFIX_PLUS_OPERATOR) is
			-- Process `an_operator'.
		require
			an_operator_not_void: an_operator /= Void
		deferred
		end

	process_qualified_bang_instruction (an_instruction: ET_QUALIFIED_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_qualified_create_expression (an_expression: ET_QUALIFIED_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_qualified_create_instruction (an_instruction: ET_QUALIFIED_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_qualified_precursor_expression (an_expression: ET_QUALIFIED_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_qualified_precursor_instruction (an_instruction: ET_QUALIFIED_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_qualified_typed_bang_instruction (an_instruction: ET_QUALIFIED_TYPED_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_qualified_typed_create_instruction (an_instruction: ET_QUALIFIED_TYPED_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_reference_keyword (a_keyword: ET_REFERENCE_KEYWORD) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		deferred
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_rename (a_rename: ET_RENAME) is
			-- Process `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		deferred
		end

	process_rename_comma (a_rename: ET_RENAME_COMMA) is
			-- Process `a_rename'.
		require
			a_rename_not_void: a_rename /= Void
		deferred
		end

	process_renames (a_list: ET_RENAMES) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		deferred
		end

	process_separate_keyword (a_keyword: ET_SEPARATE_KEYWORD) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		deferred
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_symbol (a_symbol: ET_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
		deferred
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION) is
			-- Process `an_assertion'.
		require
			an_assertion_not_void: an_assertion /= Void
		deferred
		end

	process_tagged_expression_variant (a_variant: ET_TAGGED_EXPRESSION_VARIANT) is
			-- Process `a_variant'.
		require
			a_variant_not_void: a_variant /= Void
		deferred
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		deferred
		end

	process_token (a_token: ET_TOKEN) is
			-- Process `a_token'.
		require
			a_token_not_void: a_token /= Void
		deferred
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_type_comma (a_type: ET_TYPE_COMMA) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_typed_bang_instruction (an_instruction: ET_TYPED_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_typed_create_instruction (an_instruction: ET_TYPED_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_variant (a_variant: ET_VARIANT) is
			-- Process `a_variant'.
		require
			a_variant_not_void: a_variant /= Void
		deferred
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		require
			a_string_not_void: a_string /= Void
		deferred
		end

	process_when_part (a_when_part: ET_WHEN_PART) is
			-- Process `a_when_part'.
		require
			a_when_part_not_void: a_when_part /= Void
		deferred
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

end
