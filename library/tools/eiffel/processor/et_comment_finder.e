indexing

	description:

		"Eiffel AST comment finders"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_COMMENT_FINDER

inherit

	ET_AST_ITERATOR
		redefine
			make,
			process_actual_argument_list,
			process_actual_parameter_comma,
			process_actual_parameter_list,
			process_agent_argument_operand_comma,
			process_agent_argument_operand_list,
			process_agent_open_target,
			process_agent_typed_open_argument,
			process_alias_free_name,
			process_alias_name,
			process_aliased_feature_name,
			process_all_export,
			process_assertion_semicolon,
			process_assign_feature_name,
			process_assigner_instruction,
			process_assignment,
			process_assignment_attempt,
			process_attribute,
			process_bang_instruction,
			process_binary_integer_constant,
			process_bit_constant,
			process_bit_feature,
			process_bit_n,
			process_braced_class_name,
			process_braced_type,
			process_braced_type_list,
			process_bracket_argument_list,
			process_bracket_expression,
			process_break,
			process_c1_character_constant,
			process_c2_character_constant,
			process_c3_character_constant,
			process_call_agent,
			process_call_expression,
			process_call_instruction,
			process_check_instruction,
			process_choice_comma,
			process_choice_list,
			process_choice_range,
			process_class,
			process_class_type,
			process_client,
			process_client_comma,
			process_clients,
			process_colon_type,
			process_compound,
			process_constant_attribute,
			process_constrained_formal_parameter,
			process_constraint_creator,
			process_convert_builtin_expression,
			process_convert_feature_comma,
			process_convert_feature_list,
			process_convert_function,
			process_convert_from_expression,
			process_convert_procedure,
			process_convert_to_expression,
			process_create_expression,
			process_create_instruction,
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
			process_dot_feature_name,
			process_dotnet_function,
			process_dotnet_procedure,
			process_elseif_part,
			process_elseif_part_list,
			process_equality_expression,
			process_export_list,
			process_expression_address,
			process_expression_comma,
			process_extended_feature_name_comma,
			process_external_function,
			process_external_function_inline_agent,
			process_external_procedure,
			process_external_procedure_inline_agent,
			process_feature_address,
			process_feature_clause,
			process_feature_clause_list,
			process_feature_export,
			process_feature_name_comma,
			process_features,
			process_formal_argument,
			process_formal_argument_semicolon,
			process_formal_argument_list,
			process_formal_comma_argument,
			process_formal_parameter,
			process_formal_parameter_comma,
			process_formal_parameter_list,
			process_formal_parameter_type,
			process_generic_class_type,
			process_hexadecimal_integer_constant,
			process_identifier_colon,
			process_identifier_comma,
			process_if_instruction,
			process_indexing,
			process_indexing_semicolon,
			process_indexing_term_comma,
			process_indexing_term_list,
			process_indexing_list,
			process_infix_cast_expression,
			process_infix_and_then_operator,
			process_infix_expression,
			process_infix_name,
			process_infix_or_else_operator,
			process_inspect_instruction,
			process_invariants,
			process_keyword_expression,
			process_keyword_feature_name_list,
			process_keyword_manifest_string,
			process_labeled_actual_parameter,
			process_labeled_actual_parameter_semicolon,
			process_labeled_comma_actual_parameter,
			process_like_current,
			process_like_feature,
			process_local_variable_semicolon,
			process_local_comma_variable,
			process_local_variable,
			process_local_variable_list,
			process_loop_instruction,
			process_loop_invariants,
			process_manifest_array,
			process_manifest_string_comma,
			process_manifest_string_list,
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
			process_parent_semicolon,
			process_parenthesized_expression,
			process_parent_list,
			process_postconditions,
			process_preconditions,
			process_precursor_expression,
			process_precursor_instruction,
			process_prefix_expression,
			process_prefix_name,
			process_qualified_call,
			process_qualified_like_braced_type,
			process_qualified_like_type,
			process_regular_integer_constant,
			process_regular_manifest_string,
			process_regular_real_constant,
			process_rename,
			process_rename_comma,
			process_rename_list,
			process_result_address,
			process_special_manifest_string,
			process_static_call_expression,
			process_static_call_instruction,
			process_strip_expression,
			process_symbol,
			process_tagged_assertion,
			process_tagged_indexing,
			process_token,
			process_tuple_type,
			process_type_comma,
			process_underscored_integer_constant,
			process_underscored_real_constant,
			process_unique_attribute,
			process_variant,
			process_verbatim_string,
			process_when_part,
			process_when_part_list
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new comment finder.
		do
			create comment_list.make (0)
			create excluded_nodes.make (10)
		end

feature -- Basic operations

	find_comments (a_node: ET_AST_NODE; a_list: DS_ARRAYED_LIST [ET_BREAK]) is
			-- Add to the end of `a_list' the comments that appear in `a_node'
			-- and recursively in its sub-nodes, in the order they would appear
			-- in a printed text. Do not take into account comments that appear
			-- in nodes listed in `excluded_nodes'.
		require
			a_node_not_void: a_node /= Void
			a_list_not_void: a_list /= Void
			no_void_comment: not a_list.has (Void)
			all_comments: a_list.for_all (agent {ET_BREAK}.has_comment)
		local
			old_list: DS_ARRAYED_LIST [ET_BREAK]
		do
			old_list := comment_list
			comment_list := a_list
			a_node.process (Current)
			comment_list := old_list
		ensure
			no_void_comment: not a_list.has (Void)
			all_comments: a_list.for_all (agent {ET_BREAK}.has_comment)
		end

feature -- Excluded nodes

	excluded_nodes: DS_ARRAYED_LIST [ET_AST_NODE]
			-- Nodes that should not be taken into account when
			-- searching for comments

	add_excluded_node (a_node: ET_AST_NODE) is
			-- Add `a_node' to `excluded_nodes'.
		require
			a_node_not_void: a_node /= Void
		do
			excluded_nodes.force_last (a_node)
		ensure
			added: excluded_nodes.has (a_node)
		end

	reset_excluded_nodes is
			-- Get rid of excluded nodes.
		do
			excluded_nodes.wipe_out
		ensure
			no_excluded_nodes: excluded_nodes.is_empty
		end

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND_COMMA) is
			-- Process `an_argument'.
		do
			if not excluded_nodes.has (an_argument) then
				precursor (an_argument)
			end
		end

	process_agent_argument_operand_list (a_list: ET_AGENT_ARGUMENT_OPERAND_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_agent_open_target (a_target: ET_AGENT_OPEN_TARGET) is
			-- Process `a_target'.
		do
			if not excluded_nodes.has (a_target) then
				precursor (a_target)
			end
		end

	process_agent_typed_open_argument (an_argument: ET_AGENT_TYPED_OPEN_ARGUMENT) is
			-- Process `an_argument'.
		do
			if not excluded_nodes.has (an_argument) then
				precursor (an_argument)
			end
		end

	process_alias_free_name (a_name: ET_ALIAS_FREE_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_alias_name (a_name: ET_ALIAS_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_aliased_feature_name (a_name: ET_ALIASED_FEATURE_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_all_export (an_export: ET_ALL_EXPORT) is
			-- Process `an_export'.
		do
			if not excluded_nodes.has (an_export) then
				precursor (an_export)
			end
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON) is
			-- Process `an_assertion'.
		do
			if not excluded_nodes.has (an_assertion) then
				precursor (an_assertion)
			end
		end

	process_assign_feature_name (an_assigner: ET_ASSIGN_FEATURE_NAME) is
			-- Process `an_assigner'.
		do
			if not excluded_nodes.has (an_assigner) then
				precursor (an_assigner)
			end
		end

	process_assigner_instruction (an_instruction: ET_ASSIGNER_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_binary_integer_constant (a_constant: ET_BINARY_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_bit_n (a_type: ET_BIT_N) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_braced_class_name (a_name: ET_BRACED_CLASS_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_braced_type (a_type: ET_BRACED_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_braced_type_list (a_list: ET_BRACED_TYPE_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_bracket_argument_list (a_list: ET_BRACKET_ARGUMENT_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_bracket_expression (an_expression: ET_BRACKET_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_break (a_break: ET_BREAK) is
			-- Process `a_break'.
		do
			if a_break /= Void and then a_break.has_comment then
				comment_list.force_last (a_break)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA) is
			-- Process `a_choice'.
		do
			if not excluded_nodes.has (a_choice) then
				precursor (a_choice)
			end
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE) is
			-- Process `a_choice'.
		do
			if not excluded_nodes.has (a_choice) then
				precursor (a_choice)
			end
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		do
			if not excluded_nodes.has (a_class) then
				precursor (a_class)
			end
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_client (a_client: ET_CLIENT) is
			-- Process `a_client'.
		do
			if not excluded_nodes.has (a_client) then
				precursor (a_client)
			end
		end

	process_client_comma (a_client_comma: ET_CLIENT_COMMA) is
			-- Process `a_client_comma'.
		do
			if not excluded_nodes.has (a_client_comma) then
				precursor (a_client_comma)
			end
		end

	process_clients (a_list: ET_CLIENTS) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_compound (a_list: ET_COMPOUND) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_constrained_formal_parameter (a_parameter: ET_CONSTRAINED_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_convert_builtin_expression (a_convert_expression: ET_CONVERT_BUILTIN_EXPRESSION) is
			-- Process `a_convert_expression'.
		do
			if not excluded_nodes.has (a_convert_expression) then
				precursor (a_convert_expression)
			end
		end

	process_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE_COMMA) is
			-- Process `a_convert_feature'.
		do
			if not excluded_nodes.has (a_convert_feature) then
				precursor (a_convert_feature)
			end
		end

	process_convert_feature_list (a_list: ET_CONVERT_FEATURE_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_convert_function (a_convert_function: ET_CONVERT_FUNCTION) is
			-- Process `a_convert_function'.
		do
			if not excluded_nodes.has (a_convert_function) then
				precursor (a_convert_function)
			end
		end

	process_convert_from_expression (a_convert_expression: ET_CONVERT_FROM_EXPRESSION) is
			-- Process `a_convert_expression'.
		do
			if not excluded_nodes.has (a_convert_expression) then
				precursor (a_convert_expression)
			end
		end

	process_convert_procedure (a_convert_procedure: ET_CONVERT_PROCEDURE) is
			-- Process `a_convert_procedure'.
		do
			if not excluded_nodes.has (a_convert_procedure) then
				precursor (a_convert_procedure)
			end
		end

	process_convert_to_expression (a_convert_expression: ET_CONVERT_TO_EXPRESSION) is
			-- Process `a_convert_expression'.
		do
			if not excluded_nodes.has (a_convert_expression) then
				precursor (a_convert_expression)
			end
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_creator (a_list: ET_CREATOR) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_creator_list (a_list: ET_CREATOR_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_custom_attribute (an_attribute: ET_CUSTOM_ATTRIBUTE) is
			-- Process `an_attribute'.
		do
			if not excluded_nodes.has (an_attribute) then
				precursor (an_attribute)
			end
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_do_function_inline_agent (an_expression: ET_DO_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_do_procedure_inline_agent (an_expression: ET_DO_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_dot_feature_name (a_name: ET_DOT_FEATURE_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_dotnet_function (a_feature: ET_DOTNET_FUNCTION) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_dotnet_procedure (a_feature: ET_DOTNET_PROCEDURE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART) is
			-- Process `an_elseif_part'.
		do
			if not excluded_nodes.has (an_elseif_part) then
				precursor (an_elseif_part)
			end
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_export_list (a_list: ET_EXPORT_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_external_function_inline_agent (an_expression: ET_EXTERNAL_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_external_procedure_inline_agent (an_expression: ET_EXTERNAL_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_feature_clause (a_feature_clause: ET_FEATURE_CLAUSE) is
			-- Process `a_feature_clause'.
		do
			if not excluded_nodes.has (a_feature_clause) then
				precursor (a_feature_clause)
			end
		end

	process_feature_clause_list (a_list: ET_FEATURE_CLAUSE_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT) is
			-- Process `an_export'.
		do
			if not excluded_nodes.has (an_export) then
				precursor (an_export)
			end
		end

	process_feature_name_comma (a_name: ET_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_features (a_class: ET_CLASS) is
			-- Process feature clauses of `a_class'.
		local
			a_feature_clauses: ET_FEATURE_CLAUSE_LIST
		do
			a_feature_clauses := a_class.feature_clauses
			if a_feature_clauses /= Void then
				if not excluded_nodes.has (a_feature_clauses) then
					precursor (a_class)
				end
			end
		end

	process_formal_argument (an_argument: ET_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		do
			if not excluded_nodes.has (an_argument) then
				precursor (an_argument)
			end
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON) is
			-- Process `an_argument'.
		do
			if not excluded_nodes.has (an_argument) then
				precursor (an_argument)
			end
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_formal_comma_argument (an_argument: ET_FORMAL_COMMA_ARGUMENT) is
			-- Process `an_argument'.
		do
			if not excluded_nodes.has (an_argument) then
				precursor (an_argument)
			end
		end

	process_formal_parameter (a_parameter: ET_FORMAL_PARAMETER) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_formal_parameter_comma (a_parameter: ET_FORMAL_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_formal_parameter_list (a_list: ET_FORMAL_PARAMETER_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_formal_parameter_type (a_type: ET_FORMAL_PARAMETER_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_identifier_colon (an_identifier: ET_IDENTIFIER_COLON) is
			-- Process `an_identifier'.
		do
			if not excluded_nodes.has (an_identifier) then
				precursor (an_identifier)
			end
		end

	process_identifier_comma (an_identifier: ET_IDENTIFIER_COMMA) is
			-- Process `an_identifier'.
		do
			if not excluded_nodes.has (an_identifier) then
				precursor (an_identifier)
			end
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_indexing (an_indexing: ET_INDEXING) is
			-- Process `an_indexing'.
		do
			if not excluded_nodes.has (an_indexing) then
				precursor (an_indexing)
			end
		end

	process_indexing_semicolon (an_indexing: ET_INDEXING_SEMICOLON) is
			-- Process `an_indexing'.
		do
			if not excluded_nodes.has (an_indexing) then
				precursor (an_indexing)
			end
		end

	process_indexing_term_comma (an_indexing_term: ET_INDEXING_TERM_COMMA) is
			-- Process `an_indexing_term'.
		do
			if not excluded_nodes.has (an_indexing_term) then
				precursor (an_indexing_term)
			end
		end

	process_indexing_term_list (a_list: ET_INDEXING_TERM_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_indexing_list (a_list: ET_INDEXING_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_infix_cast_expression (an_expression: ET_INFIX_CAST_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR) is
			-- Process `an_operator'.
		do
			if not excluded_nodes.has (an_operator) then
				precursor (an_operator)
			end
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_infix_name (a_name: ET_INFIX_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR) is
			-- Process `an_operator'.
		do
			if not excluded_nodes.has (an_operator) then
				precursor (an_operator)
			end
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_invariants (a_list: ET_INVARIANTS) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_keyword_expression (an_expression: ET_KEYWORD_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if not excluded_nodes.has (a_string) then
				precursor (a_string)
			end
		end

	process_labeled_actual_parameter (a_parameter: ET_LABELED_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_labeled_actual_parameter_semicolon (a_parameter: ET_LABELED_ACTUAL_PARAMETER_SEMICOLON) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_labeled_comma_actual_parameter (a_parameter: ET_LABELED_COMMA_ACTUAL_PARAMETER) is
			-- Process `a_parameter'.
		do
			if not excluded_nodes.has (a_parameter) then
				precursor (a_parameter)
			end
		end

	process_leaf (a_leaf: ET_AST_LEAF) is
			-- Process `a_leaf'.
		require
			a_leaf_not_void: a_leaf /= Void
		do
			if not excluded_nodes.has (a_leaf) then
				process_break (a_leaf.break)
			end
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON) is
			-- Process `an_argument'.
		do
			if not excluded_nodes.has (a_local) then
				precursor (a_local)
			end
		end

	process_local_comma_variable (a_local: ET_LOCAL_COMMA_VARIABLE) is
			-- Process `a_local'.
		do
			if not excluded_nodes.has (a_local) then
				precursor (a_local)
			end
		end

	process_local_variable (a_local: ET_LOCAL_VARIABLE) is
			-- Process `a_local'.
		do
			if not excluded_nodes.has (a_local) then
				precursor (a_local)
			end
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_manifest_string_comma (a_string: ET_MANIFEST_STRING_COMMA) is
			-- Process `a_string'.
		do
			if not excluded_nodes.has (a_string) then
				precursor (a_string)
			end
		end

	process_manifest_string_list (a_list: ET_MANIFEST_STRING_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_manifest_type (an_expression: ET_MANIFEST_TYPE) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_named_object_test (an_expression: ET_NAMED_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_object_equality_expression (an_expression: ET_OBJECT_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_object_test (an_expression: ET_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_octal_integer_constant (a_constant: ET_OCTAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_old_object_test (an_expression: ET_OLD_OBJECT_TEST) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_once_function_inline_agent (an_expression: ET_ONCE_FUNCTION_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_once_procedure_inline_agent (an_expression: ET_ONCE_PROCEDURE_INLINE_AGENT) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_parent (a_parent: ET_PARENT) is
			-- Process `a_parent'.
		do
			if not excluded_nodes.has (a_parent) then
				precursor (a_parent)
			end
		end

	process_parent_semicolon (a_parent: ET_PARENT_SEMICOLON) is
			-- Process `a_parent'.
		do
			if not excluded_nodes.has (a_parent) then
				precursor (a_parent)
			end
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_parent_list (a_list: ET_PARENT_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_postconditions (a_list: ET_POSTCONDITIONS) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_prefix_name (a_name: ET_PREFIX_NAME) is
			-- Process `a_name'.
		do
			if not excluded_nodes.has (a_name) then
				precursor (a_name)
			end
		end

	process_qualified_call (a_call: ET_QUALIFIED_CALL) is
			-- Process `a_call'.
		do
			if not excluded_nodes.has (a_call) then
				precursor (a_call)
			end
		end

	process_qualified_like_braced_type (a_type: ET_QUALIFIED_LIKE_BRACED_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_qualified_like_type (a_type: ET_QUALIFIED_LIKE_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if not excluded_nodes.has (a_string) then
				precursor (a_string)
				process_break (a_string.break)
			end
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_rename (a_rename: ET_RENAME) is
			-- Process `a_rename'.
		do
			if not excluded_nodes.has (a_rename) then
				precursor (a_rename)
			end
		end

	process_rename_comma (a_rename: ET_RENAME_COMMA) is
			-- Process `a_rename'.
		do
			if not excluded_nodes.has (a_rename) then
				precursor (a_rename)
			end
		end

	process_rename_list (a_list: ET_RENAME_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			if not excluded_nodes.has (a_string) then
				precursor (a_string)
				process_break (a_string.break)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			if not excluded_nodes.has (an_instruction) then
				precursor (an_instruction)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		do
			if not excluded_nodes.has (an_expression) then
				precursor (an_expression)
			end
		end

	process_symbol (a_symbol: ET_SYMBOL) is
			-- Process `a_symbol'.
		do
			process_leaf (a_symbol)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION) is
			-- Process `an_assertion'.
		do
			if not excluded_nodes.has (an_assertion) then
				precursor (an_assertion)
			end
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
		do
			if not excluded_nodes.has (an_indexing) then
				precursor (an_indexing)
			end
		end

	process_token (a_token: ET_TOKEN) is
			-- Process `a_token'.
		do
			process_leaf (a_token)
		end

	process_tuple_type (a_type: ET_TUPLE_TYPE) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_type_comma (a_type: ET_TYPE_COMMA) is
			-- Process `a_type'.
		do
			if not excluded_nodes.has (a_type) then
				precursor (a_type)
			end
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		do
			if not excluded_nodes.has (a_constant) then
				precursor (a_constant)
				process_break (a_constant.break)
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		do
			if not excluded_nodes.has (a_feature) then
				precursor (a_feature)
			end
		end

	process_variant (a_variant: ET_VARIANT) is
			-- Process `a_variant'.
		do
			if not excluded_nodes.has (a_variant) then
				precursor (a_variant)
			end
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			if not excluded_nodes.has (a_string) then
				precursor (a_string)
				process_break (a_string.break)
			end
		end

	process_when_part (a_when_part: ET_WHEN_PART) is
			-- Process `a_when_part'.
		do
			if not excluded_nodes.has (a_when_part) then
				precursor (a_when_part)
			end
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST) is
			-- Process `a_list'.
		do
			if not excluded_nodes.has (a_list) then
				precursor (a_list)
			end
		end

feature {NONE} -- Implementation

	comment_list: DS_ARRAYED_LIST [ET_BREAK]
			-- List of comments found so far

invariant

	comment_list_not_void: comment_list /= Void
	no_void_comment: not comment_list.has (Void)
	all_comments: comment_list.for_all (agent {ET_BREAK}.has_comment)
	excluded_nodes_not_void: excluded_nodes /= Void
	no_void_excluded_nod: not excluded_nodes.has (Void)

end
