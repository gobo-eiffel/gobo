indexing

	description:

		"Eiffel AST null processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_NULL_PROCESSOR

inherit

	ET_AST_PROCESSOR

create

	make

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		do
		end

	process_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		do
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Process `a_list'.
		do
		end

	process_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND_COMMA) is
			-- Process `an_argument'.
		do
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST) is
			-- Process `a_list'.
		do
		end

	process_agent_implicit_current_target (a_target: ET_AGENT_IMPLICIT_CURRENT_TARGET) is
			-- Process `a_target'.
		do
		end

	process_agent_implicit_open_argument (an_argument: ET_AGENT_IMPLICIT_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		do
		end

	process_agent_keyword (a_keyword: ET_AGENT_KEYWORD) is
			-- Process `a_keyword'.
		do
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		do
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET) is
			-- Process `a_target'.
		do
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME) is
			-- Process `a_name'.
		do
		end

	process_alias_name (a_name: ET_ALIAS_NAME) is
			-- Process `a_name'.
		do
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME) is
			-- Process `a_name'.
		do
		end

	process_all_export (an_export: ET_ALL_EXPORT) is
			-- Process `an_export'.
		do
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON) is
			-- Process `an_assertion'.
		do
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME) is
			-- Process `an_assigner'.
		do
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		do
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME) is
			-- Process `a_name'.
		do
		end

	process_braced_type (a_type: ET_BRACED_TYPE) is
			-- Process `a_type'.
		do
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST) is
			-- Process `a_list'.
		do
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST) is
			-- Process `a_list'.
		do
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_bracket_symbol (a_symbol: ET_BRACKET_SYMBOL) is
			-- Process `a_symbol'.
		do
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA) is
			-- Process `a_choice'.
		do
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
		do
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE) is
			-- Process `a_choice'.
		do
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		do
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
		end

	process_client (a_client: ET_CLIENT) is
			-- Process `a_client'.
		do
		end

	process_client_comma (a_client_comma: ET_CLIENT_COMMA) is
			-- Process `a_client_comma'.
		do
		end

	process_clients (a_list: ET_CLIENTS) is
			-- Process `a_list'.
		do
		end

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
		do
		end

	process_compound (a_list: ET_COMPOUND) is
			-- Process `a_list'.
		do
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		do
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR) is
			-- Process `a_list'.
		do
		end

	process_convert_builtin_expression (a_convert_expression: ET_CONVERT_BUILTIN_EXPRESSION) is
			-- Process `a_convert_expression'.
		do
		end

	process_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE_COMMA) is
			-- Process `a_convert_feature'.
		do
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST) is
			-- Process `a_list'.
		do
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION) is
			-- Process `a_convert_function'.
		do
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION) is
			-- Process `a_convert_expression'.
		do
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE) is
			-- Process `a_convert_procedure'.
		do
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `a_convert_expression'.
		do
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_creator (a_list: ET_CREATOR) is
			-- Process `a_list'.
		do
		end

	process_creator_list (a_list: ET_CREATOR_LIST) is
			-- Process `a_list'.
		do
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE) is
			-- Process `an_attribute'.
		do
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		do
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		do
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_dot_feature_name (a_name: ET_DOT_FEATURE_NAME) is
			-- Process `a_name'.
		do
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
		do
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
			-- Process `a_feature'.
		do
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART) is
			-- Process `an_elseif_part'.
		do
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST) is
			-- Process `a_list'.
		do
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_export_list (a_list: ET_EXPORT_LIST) is
			-- Process `a_list'.
		do
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
		end

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA) is
			-- Process `an_expression'.
		do
		end

	process_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		do
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		do
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE) is
			-- Process `a_feature_clause'.
		do
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST) is
			-- Process `a_list'.
		do
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT) is
			-- Process `an_export'.
		do
		end

	process_feature_name_comma (a_name: ET_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		do
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		do
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON) is
			-- Process `an_argument'.
		do
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		do
		end

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT) is
			-- Process `an_argument'.
		do
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		do
		end

	process_formal_parameter_comma (a_parameter: ET_FORMAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		do
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST) is
			-- Process `a_list'.
		do
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Process `a_type'.
		do
		end

	process_free_operator (an_operator: ET_FREE_OPERATOR) is
			-- Process `an_operator'.
		do
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		do
		end

	process_identifier_colon (an_identifier: ET_IDENTIFIER_COLON) is
			-- Process `an_identifier'.
		do
		end

	process_identifier_comma (an_identifier: ET_IDENTIFIER_COMMA) is
			-- Process `an_identifier'.
		do
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_indexing (an_indexing: ET_INDEXING) is
			-- Process `an_indexing'.
		do
		end

	process_indexing_semicolon (an_indexing: ET_INDEXING_SEMICOLON) is
			-- Process `an_indexing'.
		do
		end

	process_indexing_term_comma (an_indexing_term: ET_INDEXING_TERM_COMMA) is
			-- Process `an_indexing_term'.
		do
		end

	process_indexing_term_list (a_list: ET_INDEXING_TERM_LIST) is
			-- Process `a_list'.
		do
		end

	process_indexing_list (a_list: ET_INDEXING_LIST) is
			-- Process `a_list'.
		do
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR) is
			-- Process `an_operator'.
		do
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_infix_free_name (a_name: ET_INFIX_FREE_NAME) is
			-- Process `a_name'.
		do
		end

	process_infix_name (a_name: ET_INFIX_NAME) is
			-- Process `a_name'.
		do
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR) is
			-- Process `an_operator'.
		do
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_invariants (a_list: ET_INVARIANTS) is
			-- Process `a_list'.
		do
		end

	process_keyword (a_keyword: ET_KEYWORD) is
			-- Process `a_keyword'.
		do
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST) is
			-- Process `a_list'.
		do
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING) is
			-- Process `a_string'.
		do
		end

	process_keyword_operator (a_keyword: ET_KEYWORD_OPERATOR) is
			-- Process `a_keyword'.
		do
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		do
		end

	process_labeled_actual_parameter_semicolon (a_parameter: ET_LABELED_ACTUAL_PARAMETER_SEMICOLON) is
			-- Process `a_parameter'.
		do
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		do
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		do
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON) is
			-- Process `an_argument'.
		do
		end

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE) is
			-- Process `a_local'.
		do
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE) is
			-- Process `a_local'.
		do
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST) is
			-- Process `a_list'.
		do
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS) is
			-- Process `a_list'.
		do
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
		end

	process_manifest_string_comma (a_string: ET_MANIFEST_STRING_COMMA) is
			-- Process `a_string'.
		do
		end

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST) is
			-- Process `a_list'.
		do
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		do
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		do
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
		end

	process_parent (a_parent: ET_PARENT) is
			-- Process `a_parent'.
		do
		end

	process_parent_semicolon (a_parent: ET_PARENT_SEMICOLON) is
			-- Process `a_parent'.
		do
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_parent_list (a_list: ET_PARENT_LIST) is
			-- Process `a_list'.
		do
		end

	process_postconditions (a_list: ET_POSTCONDITIONS) is
			-- Process `a_list'.
		do
		end

	process_preconditions (a_list: ET_PRECONDITIONS) is
			-- Process `a_list'.
		do
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_precursor_keyword (a_keyword: ET_PRECURSOR_KEYWORD) is
			-- Process `a_keyword'.
		do
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_prefix_free_name (a_name: ET_PREFIX_FREE_NAME) is
			-- Process `a_name'.
		do
		end

	process_prefix_name (a_name: ET_PREFIX_NAME) is
			-- Process `a_name'.
		do
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL) is
			-- Process `a_call'.
		do
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE) is
			-- Process `a_type'.
		do
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
		end

	process_question_mark_symbol (a_symbol: ET_QUESTION_MARK_SYMBOL) is
			-- Process `a_symbol'.
		do
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_rename (a_rename: ET_RENAME) is
			-- Process `a_rename'.
		do
		end

	process_rename_comma (a_rename: ET_RENAME_COMMA) is
			-- Process `a_rename'.
		do
		end

	process_rename_list (a_list: ET_RENAME_LIST) is
			-- Process `a_list'.
		do
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
		end

	process_symbol (a_symbol: ET_SYMBOL) is
			-- Process `a_symbol'.
		do
		end

	process_symbol_operator (a_symbol: ET_SYMBOL_OPERATOR) is
			-- Process `a_symbol'.
		do
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION) is
			-- Process `an_assertion'.
		do
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
		do
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
		end

	process_type_comma (a_type: ET_TYPE_COMMA) is
			-- Process `a_type'.
		do
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
		end

	process_variant (a_variant: ET_VARIANT) is
			-- Process `a_variant'.
		do
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
		end

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		do
		end

	process_when_part (a_when_part: ET_WHEN_PART) is
			-- Process `a_when_part'.
		do
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST) is
			-- Process `a_list'.
		do
		end

feature {ET_CLUSTER} -- Processing

	process_cluster (a_cluster: ET_CLUSTER) is
			-- Process `a_cluster'.
		do
		end

end
