indexing

	description:

		"Eiffel AST processors"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_AST_PROCESSOR

inherit

	ANY -- Needed by SE 2.1.

feature {NONE} -- Initialization

	make (a_universe: like universe) is
			-- Create a new AST processor.
		require
			a_universe_not_void: a_universe /= Void
		do
			universe := a_universe
		ensure
			universe_set: universe = a_universe
		end

feature -- Access

	universe: ET_UNIVERSE
			-- Surrounding universe

feature -- Error handling

	error_handler: ET_ERROR_HANDLER is
			-- Error handler
		do
			Result := universe.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND_COMMA) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_agent_implicit_current_target (a_target: ET_AGENT_IMPLICIT_CURRENT_TARGET) is
			-- Process `a_target'.
		require
			a_target_not_void: a_target /= Void
		deferred
		end

	process_agent_implicit_open_argument (an_argument: ET_AGENT_IMPLICIT_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET) is
			-- Process `a_target'.
		require
			a_target_not_void: a_target /= Void
		deferred
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_alias_name (a_name: ET_ALIAS_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
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

	process_assigner (an_assigner: ET_ASSIGNER) is
			-- Process `an_assigner'.
		require
			an_assigner_not_void: an_assigner /= Void
		deferred
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
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

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_braced_type (a_type: ET_BRACED_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_bracket_symbol (a_symbol: ET_BRACKET_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
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

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		require
			a_class_not_void: a_class /= Void
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

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
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

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER) is
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

	process_convert_expression (a_convert_expression: ET_CONVERT_EXPRESSION) is
			-- Process `a_convert_expression'.
		require
			a_convert_expression_not_void: a_convert_expression /= Void
		deferred
		end

	process_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE_COMMA) is
			-- Process `a_convert_feature'.
		require
			a_convert_feature_not_void: a_convert_feature /= Void
		deferred
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION) is
			-- Process `a_convert_function'.
		require
			a_convert_function_not_void: a_convert_function /= Void
		deferred
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE) is
			-- Process `a_convert_procedure'.
		require
			a_convert_procedure_not_void: a_convert_procedure /= Void
		deferred
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `a_convert_expression'.
		require
			a_convert_expression_not_void: a_convert_expression /= Void
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

	process_creator_list (a_list: ET_CREATOR_LIST) is
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

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE) is
			-- Process `an_attribute'.
		require
			an_attribute_not_void: an_attribute /= Void
		deferred
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		require
			an_instruction_not_void: an_instruction /= Void
		deferred
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
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

	process_dot_feature_name (a_name: ET_DOT_FEATURE_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_dotnet_attribute (a_feature: ET_DOTNET_ATTRIBUTE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_dotnet_constant_attribute (a_feature: ET_DOTNET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		deferred
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
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

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_export_list (a_list: ET_EXPORT_LIST) is
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

	process_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
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

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE) is
			-- Process `a_list'.
		require
			a_feature_clause_not_void: a_feature_clause /= Void
		deferred
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST) is
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

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT) is
			-- Process `an_argument'.
		require
			an_argument_not_void: an_argument /= Void
		deferred
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_formal_parameter_comma (a_parameter: ET_FORMAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE) is
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

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
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

	process_indexing_term_list (a_list: ET_INDEXING_TERM_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_indexing_list (a_list: ET_INDEXING_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR) is
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

	process_infix_name (a_name: ET_INFIX_NAME) is
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

	process_keyword (a_keyword: ET_KEYWORD) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		deferred
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
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

	process_keyword_operator (a_keyword: ET_KEYWORD_OPERATOR) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
		deferred
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_labeled_actual_parameter_semicolon (a_parameter: ET_LABELED_ACTUAL_PARAMETER_SEMICOLON) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
		deferred
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		require
			a_parameter_not_void: a_parameter /= Void
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

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE) is
			-- Process `a_local'.
		require
			a_local_not_void: a_local /= Void
		deferred
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE) is
			-- Process `a_local'.
		require
			a_local_not_void: a_local /= Void
		deferred
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON) is
			-- Process `an_argument'.
		require
			a_local_not_void: a_local /= Void
		deferred
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST) is
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

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
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

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
		deferred
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
		deferred
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
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

	process_parent_list (a_list: ET_PARENT_LIST) is
			-- Process `a_list'.
		require
			a_list_not_void: a_list /= Void
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

	process_precursor_keyword (a_keyword: ET_PRECURSOR_KEYWORD) is
			-- Process `a_keyword'.
		require
			a_keyword_not_void: a_keyword /= Void
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

	process_prefix_name (a_name: ET_PREFIX_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		deferred
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL) is
			-- Process `a_call'.
		require
			a_call_not_void: a_call /= Void
		deferred
		end

	process_question_mark_symbol (a_symbol: ET_QUESTION_MARK_SYMBOL) is
			-- Process `a_symbol'.
		require
			a_symbol_not_void: a_symbol /= Void
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

	process_rename_list (a_list: ET_RENAME_LIST) is
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

	process_symbol_operator (a_symbol: ET_SYMBOL_OPERATOR) is
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

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
		require
			an_indexing_not_void: an_indexing /= Void
		deferred
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		deferred
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
		deferred
		end

	process_type_comma (a_type: ET_TYPE_COMMA) is
			-- Process `a_type'.
		require
			a_type_not_void: a_type /= Void
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

	process_void (an_expression: ET_VOID) is
			-- Process `an_expression'.
		require
			an_expression_not_void: an_expression /= Void
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

invariant

	universe_not_void: universe /= Void

end
