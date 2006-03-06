indexing

	description:

		"Eiffel decorated Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DECORATED_AST_FACTORY

inherit

	ET_AST_FACTORY
		redefine
			new_agent_keyword,
			new_alias_keyword,
			new_all_keyword,
			new_and_keyword,
			new_as_keyword,
			new_assign_keyword,
			new_attribute_keyword,
			new_check_keyword,
			new_class_keyword,
			new_convert_keyword,
			new_create_keyword,
			new_creation_keyword,
			new_current_keyword,
			new_debug_keyword,
			new_deferred_keyword,
			new_do_keyword,
			new_else_keyword,
			new_elseif_keyword,
			new_end_keyword,
			new_ensure_keyword,
			new_expanded_keyword,
			new_export_keyword,
			new_external_keyword,
			new_false_keyword,
			new_feature_keyword,
			new_from_keyword,
			new_frozen_keyword,
			new_if_keyword,
			new_implies_keyword,
			new_indexing_keyword,
			new_infix_keyword,
			new_inherit_keyword,
			new_inspect_keyword,
			new_invariant_keyword,
			new_is_keyword,
			new_like_keyword,
			new_local_keyword,
			new_loop_keyword,
			new_not_keyword,
			new_obsolete_keyword,
			new_old_keyword,
			new_once_keyword,
			new_or_keyword,
			new_precursor_keyword,
			new_prefix_keyword,
			new_recast_keyword,
			new_redefine_keyword,
			new_reference_keyword,
			new_rename_keyword,
			new_require_keyword,
			new_rescue_keyword,
			new_result_keyword,
			new_retry_keyword,
			new_select_keyword,
			new_separate_keyword,
			new_strip_keyword,
			new_then_keyword,
			new_true_keyword,
			new_undefine_keyword,
			new_unique_keyword,
			new_until_keyword,
			new_variant_keyword,
			new_void_keyword,
			new_when_keyword,
			new_xor_keyword,
			new_arrow_symbol,
			new_assign_attempt_symbol,
			new_assign_symbol,
			new_bang_symbol,
			new_colon_symbol,
			new_comma_symbol,
			new_div_symbol,
			new_divide_symbol,
			new_dollar_symbol,
			new_dot_symbol,
			new_dotdot_symbol,
			new_equal_symbol,
			new_ge_symbol,
			new_gt_symbol,
			new_le_symbol,
			new_left_array_symbol,
			new_left_brace_symbol,
			new_left_bracket_symbol,
			new_left_parenthesis_symbol,
			new_lt_symbol,
			new_minus_symbol,
			new_mod_symbol,
			new_not_equal_symbol,
			new_plus_symbol,
			new_power_symbol,
			new_question_mark_symbol,
			new_right_array_symbol,
			new_right_brace_symbol,
			new_right_bracket_symbol,
			new_right_parenthesis_symbol,
			new_semicolon_symbol,
			new_tilde_symbol,
			new_times_symbol,
			new_bit_constant,
			new_break,
			new_c1_character_constant,
			new_c2_character_constant,
			new_c3_character_constant,
			new_comment,
			new_free_operator,
			new_hexadecimal_integer_constant,
			new_identifier,
			new_regular_integer_constant,
			new_regular_manifest_string,
			new_regular_real_constant,
			new_special_manifest_string,
			new_underscored_integer_constant,
			new_underscored_real_constant,
			new_verbatim_string,
			new_actual_arguments,
			new_actual_parameter_comma,
			new_actual_parameters,
			new_agent_argument_operand_comma,
			new_agent_argument_operands,
			new_agent_typed_open_argument,
			new_agent_open_target,
			new_alias_and_name,
			new_alias_and_then_name,
			new_alias_bracket_name,
			new_alias_div_name,
			new_alias_divide_name,
			new_alias_dotdot_name,
			new_alias_free_name,
			new_alias_ge_name,
			new_alias_gt_name,
			new_alias_implies_name,
			new_alias_le_name,
			new_alias_lt_name,
			new_alias_minus_name,
			new_alias_mod_name,
			new_alias_not_name,
			new_alias_or_name,
			new_alias_or_else_name,
			new_alias_plus_name,
			new_alias_power_name,
			new_alias_times_name,
			new_alias_xor_name,
			new_all_export,
			new_argument_name_comma,
			new_assertion_semicolon,
			new_assigner,
			new_assigner_instruction,
			new_assignment,
			new_assignment_attempt,
			new_attribute,
			new_bang_instruction,
			new_bit_feature,
			new_bit_n,
			new_bracket_arguments,
			new_check_instruction,
			new_choice_comma,
			new_choice_list,
			new_choice_range,
			new_class_name_comma,
			new_clients,
			new_colon_type,
			new_compound,
			new_conditional,
			new_constant_attribute,
			new_constrained_formal_parameter,
			new_constraint_actual_parameter_comma,
			new_constraint_actual_parameters,
			new_constraint_creator,
			new_convert_feature_comma,
			new_convert_features,
			new_convert_function,
			new_convert_procedure,
			new_convert_types,
			new_create_expression,
			new_create_instruction,
			new_creator,
			new_current_address,
			new_custom_attribute,
			new_debug_compound,
			new_debug_instruction,
			new_deferred_function,
			new_deferred_procedure,
			new_do_compound,
			new_do_function,
			new_do_procedure,
			new_dot_feature_name,
			new_else_compound,
			new_exports,
			new_expression_address,
			new_expression_comma,
			new_extended_feature_name_comma,
			new_external_alias,
			new_external_function,
			new_external_language,
			new_external_procedure,
			new_feature_address,
			new_feature_clause,
			new_feature_name_comma,
			new_formal_argument_semicolon,
			new_formal_arguments,
			new_formal_parameter_comma,
			new_formal_parameters,
			new_from_compound,
			new_if_instruction,
			new_indexing,
			new_indexing_semicolon,
			new_indexing_terms,
			new_indexing_term_comma,
			new_indexings,
			new_infix_and_name,
			new_infix_and_then_name,
			new_infix_and_then_operator,
			new_infix_div_name,
			new_infix_divide_name,
			new_infix_free_name,
			new_infix_ge_name,
			new_infix_gt_name,
			new_infix_implies_name,
			new_infix_le_name,
			new_infix_lt_name,
			new_infix_minus_name,
			new_infix_mod_name,
			new_infix_or_name,
			new_infix_or_else_name,
			new_infix_or_else_operator,
			new_infix_plus_name,
			new_infix_power_name,
			new_infix_times_name,
			new_infix_xor_name,
			new_inspect_instruction,
			new_invariants,
			new_keyword_feature_name_list,
			new_like_current,
			new_like_feature,
			new_local_name_comma,
			new_local_variable_semicolon,
			new_local_variables,
			new_loop_compound,
			new_loop_instruction,
			new_loop_invariants,
			new_manifest_array,
			new_manifest_string_comma,
			new_manifest_string_list,
			new_manifest_tuple,
			new_manifest_type,
			new_null_export,
			new_null_instruction,
			new_obsolete_message,
			new_old_expression,
			new_once_compound,
			new_once_function,
			new_once_manifest_string,
			new_once_procedure,
			new_parent,
			new_parent_semicolon,
			new_parents,
			new_parenthesized_expression,
			new_postconditions,
			new_preconditions,
			new_precursor_class_name,
			new_precursor_expression,
			new_precursor_instruction,
			new_prefix_free_name,
			new_prefix_minus_name,
			new_prefix_not_name,
			new_prefix_plus_name,
			new_rename,
			new_rename_comma,
			new_renames,
			new_rescue_compound,
			new_result_address,
			new_static_call_expression,
			new_static_call_instruction,
			new_strip_expression,
			new_tag,
			new_tagged_indexing,
			new_target_type,
			new_then_compound,
			new_type_comma,
			new_unique_attribute,
			new_variant
		end

create

	make

feature -- Status report

	keep_all_breaks: BOOLEAN
			-- Should the generated AST be decorated with
			-- breaks and comments?

	keep_all_comments: BOOLEAN
			-- Should the generated AST be decorated with comments?

	keep_header_comments: BOOLEAN
			-- Should the generated AST be decorated with Feature
			-- and Feature_clause header comments?

feature -- Statut setting

	set_keep_all_breaks (b: BOOLEAN) is
			-- Set `keep_all_breaks' to `b'.
		do
			keep_all_breaks := b
		ensure
			keep_all_breaks_set: keep_all_breaks = b
		end

feature -- Eiffel keywords

	new_agent_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'agent' keyword
		do
			create Result.make_agent
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_alias_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'alias' keyword
		do
			create Result.make_alias
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_all_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'all' keyword
		do
			create Result.make_all
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_and_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'and' keyword
		do
			create Result.make_and
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_as_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'as' keyword
		do
			create Result.make_as
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_assign_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'assign' keyword
		do
			create Result.make_assign
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_attribute_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'attribute' keyword
		do
			create Result.make_attribute
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_check_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'check' keyword
		do
			create Result.make_check
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_class_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'class' keyword
		do
			create Result.make_class
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_convert_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'convert' keyword
		do
			create Result.make_convert
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_create_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'create' keyword
		do
			create Result.make_create
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_creation_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'creation' keyword
		do
			create Result.make_creation
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_current_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_CURRENT is
			-- New 'current' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_debug_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'debug' keyword
		do
			create Result.make_debug
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_deferred_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'deferred' keyword
		do
			create Result.make_deferred
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_do_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'do' keyword
		do
			create Result.make_do
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_else_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'else' keyword
		do
			create Result.make_else
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_elseif_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'elseif' keyword
		do
			create Result.make_elseif
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_end_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'end' keyword
		do
			create Result.make_end
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_ensure_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'ensure' keyword
		do
			create Result.make_ensure
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_expanded_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'expanded' keyword
		do
			create Result.make_expanded
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_export_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'export' keyword
		do
			create Result.make_export
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_external_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'external' keyword
		do
			create Result.make_external
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_false_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_FALSE_CONSTANT is
			-- New 'false' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_feature_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'feature' keyword
		do
			create Result.make_feature
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_from_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'from' keyword
		do
			create Result.make_from
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_frozen_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'frozen' keyword
		do
			create Result.make_frozen
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_if_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'if' keyword
		do
			create Result.make_if
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_implies_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'implies' keyword
		do
			create Result.make_implies
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_indexing_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'indexing' keyword
		do
			create Result.make_indexing
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_infix_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'infix' keyword
		do
			create Result.make_infix
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_inherit_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'inherit' keyword
		do
			create Result.make_inherit
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_inspect_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'inspect' keyword
		do
			create Result.make_inspect
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_invariant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'invariant' keyword
		do
			create Result.make_invariant
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_is_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'is' keyword
		do
			create Result.make_is
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_like_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'like' keyword
		do
			create Result.make_like
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_local_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'local' keyword
		do
			create Result.make_local
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_loop_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'loop' keyword
		do
			create Result.make_loop
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'not' keyword
		do
			create Result.make_not
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_obsolete_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'obsolete' keyword
		do
			create Result.make_obsolete
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_old_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'old' keyword
		do
			create Result.make_old
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_once_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'once' keyword
		do
			create Result.make_once
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_or_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'or' keyword
		do
			create Result.make_or
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_precursor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_PRECURSOR_KEYWORD is
			-- New 'precursor' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_prefix_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'prefix' keyword
		do
			create Result.make_prefix
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_recast_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'recast' keyword
		do
			create Result.make_recast
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_redefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'redefine' keyword
		do
			create Result.make_redefine
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_reference_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'reference' keyword
		do
			create Result.make_reference
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_rename_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'rename' keyword
		do
			create Result.make_rename
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_require_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'require' keyword
		do
			create Result.make_require
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_rescue_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'rescue' keyword
		do
			create Result.make_rescue
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_result_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_RESULT is
			-- New 'result' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_retry_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_RETRY_INSTRUCTION is
			-- New 'retry' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_select_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'select' keyword
		do
			create Result.make_select
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_separate_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'separate' keyword
		do
			create Result.make_separate
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_strip_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'strip' keyword
		do
			create Result.make_strip
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_then_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'then' keyword
		do
			create Result.make_then
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_true_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_TRUE_CONSTANT is
			-- New 'true' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_undefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'undefine' keyword
		do
			create Result.make_undefine
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_unique_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'unique' keyword
		do
			create Result.make_unique
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_until_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'until' keyword
		do
			create Result.make_until
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_variant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'variant' keyword
		do
			create Result.make_variant
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_void_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_VOID is
			-- New 'void' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_when_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'when' keyword
		do
			create Result.make_when
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_xor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'xor' keyword
		do
			create Result.make_xor
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature -- Eiffel symbols

	new_arrow_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '->' symbol
		do
			create Result.make_arrow
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_assign_attempt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '?=' symbol
		do
			create Result.make_assign_attempt
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_assign_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ':=' symbol
		do
			create Result.make_assign
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_bang_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '!' symbol
		do
			create Result.make_bang
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_colon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ':' symbol
		do
			create Result.make_colon
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_comma_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ',' symbol
		do
			create Result.make_comma
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_div_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '//' symbol
		do
			create Result.make_div
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_divide_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '/' symbol
		do
			create Result.make_divide
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_dollar_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '$' symbol
		do
			create Result.make_dollar
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_dot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '.' symbol
		do
			create Result.make_dot
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_dotdot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '..' symbol
		do
			create Result.make_dotdot
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '=' symbol
		do
			create Result.make_equal
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_ge_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '>=' symbol
		do
			create Result.make_ge
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_gt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '>' symbol
		do
			create Result.make_gt
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_le_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '<=' symbol
		do
			create Result.make_le
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '<<' symbol
		do
			create Result.make_left_array
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '{' symbol
		do
			create Result.make_left_brace
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BRACKET_SYMBOL is
			-- New '[' symbol
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '(' symbol
		do
			create Result.make_left_parenthesis
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_lt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '<' symbol
		do
			create Result.make_lt
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_minus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '-' symbol
		do
			create Result.make_minus
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_mod_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '\\' symbol
		do
			create Result.make_mod
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '/=' symbol
		do
			create Result.make_not_equal
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_plus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '+' symbol
		do
			create Result.make_plus
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_power_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '^' symbol
		do
			create Result.make_power
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_question_mark_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_QUESTION_MARK_SYMBOL is
			-- New '?' symbol
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_right_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '>>' symbol
		do
			create Result.make_right_array
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_right_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '}' symbol
		do
			create Result.make_right_brace
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_right_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ']' symbol
		do
			create Result.make_right_bracket
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_right_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ')' symbol
		do
			create Result.make_right_parenthesis
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_semicolon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SEMICOLON_SYMBOL is
			-- New ';' symbol
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_tilde_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '~' symbol
		do
			create Result.make_tilde
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_times_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '*' symbol
		do
			create Result.make_times
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature -- AST leaves

	new_bit_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BIT_CONSTANT is
			-- New bit constant
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_break (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BREAK is
			-- New break
		do
			create Result.make (a_scanner.last_break)
		end

	new_c1_character_constant (a_value: CHARACTER; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C1_CHARACTER_CONSTANT is
			-- New character constant of the form 'A'
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_c2_character_constant (a_value: CHARACTER; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C2_CHARACTER_CONSTANT is
			-- New character constant of the form '%A'
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_c3_character_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C3_CHARACTER_CONSTANT is
			-- New character constant of the form '%/code/`'
		do
			Result := a_scanner.last_c3_character_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_comment (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_COMMENT is
			-- New comment
		do
			create Result.make (a_scanner.last_comment)
		end

	new_free_operator (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_FREE_OPERATOR is
			-- New free operator
		do
			create Result.make_prefix (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_hexadecimal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_HEXADECIMAL_INTEGER_CONSTANT is
			-- New integer constant in hexadecimal format
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_identifier (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_IDENTIFIER is
			-- New identifier
		do
			Result := a_scanner.last_identifier
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_regular_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_INTEGER_CONSTANT is
			-- New integer constant with no underscore
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_regular_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_MANIFEST_STRING is
			-- New manifest string with no special character
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_regular_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_REAL_CONSTANT is
			-- New real constant with no underscore
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_special_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SPECIAL_MANIFEST_STRING is
			-- New manifest string with special characters
		do
			Result := a_scanner.last_special_manifest_string
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_underscored_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_UNDERSCORED_INTEGER_CONSTANT is
			-- New integer constant with underscores
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_underscored_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_UNDERSCORED_REAL_CONSTANT is
			-- New real constant with underscores
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_verbatim_string (a_marker, an_open, a_close: STRING; a_left_aligned: BOOLEAN; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_VERBATIM_STRING is
			-- New verbatim string
		do
			Result := a_scanner.last_verbatim_string (a_marker, an_open, a_close, a_left_aligned)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

feature -- AST nodes

	new_actual_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_ACTUAL_ARGUMENT_LIST is
			-- New actual argument list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_symbol (a_left)
			end
			if a_right /= Void then
				Result.set_right_symbol (a_right)
			end
		end

	new_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER; a_comma: ET_SYMBOL): ET_ACTUAL_PARAMETER_ITEM is
			-- New actual_parameter-comma
		do
			if a_comma = Void then
				Result := a_parameter
			elseif a_parameter /= Void then
				create {ET_ACTUAL_PARAMETER_COMMA} Result.make (a_parameter, a_comma)
			end
		end

	new_actual_parameters (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_ACTUAL_PARAMETER_LIST is
			-- New actual generic parameter list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_bracket (a_left)
			end
			if a_right /= Void then
				Result.set_right_bracket (a_right)
			end
		end

	new_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND; a_comma: ET_SYMBOL): ET_AGENT_ARGUMENT_OPERAND_ITEM is
			-- New agent_argument_operand-comma
		do
			if a_comma = Void then
				Result := an_argument
			elseif an_argument /= Void then
				create {ET_AGENT_ARGUMENT_OPERAND_COMMA} Result.make (an_argument, a_comma)
			end
		end

	new_agent_argument_operands (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_AGENT_ARGUMENT_OPERAND_LIST is
			-- New agent argument operand list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_parenthesis (a_left)
			end
			if a_right /= Void then
				Result.set_right_parenthesis (a_right)
			end
		end

	new_agent_typed_open_argument (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL; a_question_mark: ET_QUESTION_MARK_SYMBOL): ET_AGENT_TYPED_OPEN_ARGUMENT is
			-- New agent open argument of the form '{TYPE} ?'
		do
			if a_type /= Void then
				create Result.make (a_type)
				if l /= Void then
					Result.set_left_brace (l)
				end
				if r /= Void then
					Result.set_right_brace (r)
				end
				if a_question_mark /= Void then
					Result.set_question_mark (a_question_mark)
				end
			end
		end

	new_agent_open_target (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL): ET_AGENT_OPEN_TARGET is
			-- New agent open target of the form '{TYPE}'
		do
			if a_type /= Void then
				create Result.make (a_type)
				if l /= Void then
					Result.set_left_brace (l)
				end
				if r /= Void then
					Result.set_right_brace (r)
				end
			end
		end

	new_alias_and_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "and" feature name
		do
			if a_string /= Void then
				create Result.make_and (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_and_then_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "and then" feature name
		do
			if a_string /= Void then
				create Result.make_and_then (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_bracket_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "[]" feature name
		do
			if a_string /= Void then
				create Result.make_bracket (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_div_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_div (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_divide_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_divide (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_dotdot_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias ".." feature name
		do
			if a_string /= Void then
				create Result.make_dotdot (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_free_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_FREE_NAME is
			-- New alias free feature name
		do
			if a_string /= Void then
				create Result.make_infix (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_ge_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias ">=" feature name
		do
			if a_string /= Void then
				create Result.make_ge (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_gt_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias ">" feature name
		do
			if a_string /= Void then
				create Result.make_gt (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_implies_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "implies" feature name
		do
			if a_string /= Void then
				create Result.make_implies (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_le_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "<=" feature name
		do
			if a_string /= Void then
				create Result.make_le (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_lt_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "<" feature name
		do
			if a_string /= Void then
				create Result.make_lt (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_minus_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "-" feature name
		do
			if a_string /= Void then
				create Result.make_minus (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_mod_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "\\" feature name
		do
			if a_string /= Void then
				create Result.make_mod (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_not_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "not" feature name
		do
			if a_string /= Void then
				create Result.make_not (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_or_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "or" feature name
		do
			if a_string /= Void then
				create Result.make_or (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_or_else_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "or else" feature name
		do
			if a_string /= Void then
				create Result.make_or_else (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_plus_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "+" feature name
		do
			if a_string /= Void then
				create Result.make_plus (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_power_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "^" feature name
		do
			if a_string /= Void then
				create Result.make_power (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_times_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "*" feature name
		do
			if a_string /= Void then
				create Result.make_times (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_xor_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "xor" feature name
		do
			if a_string /= Void then
				create Result.make_xor (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_all_export (a_clients: ET_CLIENTS; an_all: ET_KEYWORD): ET_ALL_EXPORT is
			-- New 'all' export clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
				if an_all /= Void then
					Result.set_all_keyword (an_all)
				end
			end
		end

	new_argument_name_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_ARGUMENT_NAME is
			-- New argument_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_IDENTIFIER_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_assertion_semicolon (an_assertion: ET_ASSERTION; a_semicolon: ET_SYMBOL): ET_ASSERTION_ITEM is
			-- New assertion followed by a semicolon
		do
			if a_semicolon = Void then
				Result := an_assertion
			elseif an_assertion /= Void then
				create {ET_ASSERTION_SEMICOLON} Result.make (an_assertion, a_semicolon)
			end
		end

	new_assigner (an_assign: ET_KEYWORD; a_feature_name: ET_FEATURE_NAME): ET_ASSIGNER is
			-- New assigner
		do
			if a_feature_name /= Void then
				create Result.make (a_feature_name)
				if an_assign /= Void then
					Result.set_assign_keyword (an_assign)
				end
			end
		end

	new_assigner_instruction (a_target: ET_FEATURE_CALL_EXPRESSION; an_assign: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNER_INSTRUCTION is
			-- New assigner instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
				if an_assign /= Void then
					Result.set_assign_symbol (an_assign)
				end
			end
		end

	new_assignment (a_target: ET_WRITABLE; an_assign: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNMENT is
			-- New assignment instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
				if an_assign /= Void then
					Result.set_assign_symbol (an_assign)
				end
			end
		end

	new_assignment_attempt (a_target: ET_WRITABLE; an_assign_attempt: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNMENT_ATTEMPT is
			-- New assignment-attempt instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
				if an_assign_attempt /= Void then
					Result.set_assign_attempt_symbol (an_assign_attempt)
				end
			end
		end

	new_attribute (a_name: ET_EXTENDED_FEATURE_NAME; a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_ATTRIBUTE is
			-- New attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, an_assigner, a_clients, a_class)
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_bang_instruction (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL; a_target: ET_WRITABLE; a_call: ET_QUALIFIED_CALL): ET_BANG_INSTRUCTION is
			-- New bang creation instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if l /= Void then
					Result.set_left_bang (l)
				end
				if r /= Void then
					Result.set_right_bang (r)
				end
			end
		end

	new_bit_feature (a_bit: ET_IDENTIFIER; an_id: ET_IDENTIFIER): ET_BIT_FEATURE is
			-- New 'BIT Identifier' type
		do
			if an_id /= Void then
				create Result.make (an_id)
				if a_bit /= Void then
					Result.set_bit_keyword (a_bit)
				end
			end
		end

	new_bit_n (a_bit: ET_IDENTIFIER; an_int: ET_INTEGER_CONSTANT): ET_BIT_N is
			-- New 'BIT N' type
		do
			if an_int /= Void then
				create Result.make (an_int)
				if a_bit /= Void then
					Result.set_bit_keyword (a_bit)
				end
			end
		end

	new_bracket_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_BRACKET_ARGUMENT_LIST is
			-- New bracket argument list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_symbol (a_left)
			end
			if a_right /= Void then
				Result.set_right_symbol (a_right)
			end
		end

	new_check_instruction (a_check: ET_KEYWORD; an_end: ET_KEYWORD; nb: INTEGER): ET_CHECK_INSTRUCTION is
			-- New check instruction with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_check /= Void then
				Result.set_check_keyword (a_check)
			end
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_choice_comma (a_choice: ET_CHOICE; a_comma: ET_SYMBOL): ET_CHOICE_ITEM is
			-- New choice-comma
		do
			if a_comma = Void then
				Result := a_choice
			elseif a_choice /= Void then
				create {ET_CHOICE_COMMA} Result.make (a_choice, a_comma)
			end
		end

	new_choice_list (a_when: ET_KEYWORD; nb: INTEGER): ET_CHOICE_LIST is
			-- New choice list with capacity `nb'
		do
			create Result.make_with_capacity (nb)
			if a_when /= Void then
				Result.set_when_keyword (a_when)
			end
		end

	new_choice_range (a_lower: ET_CHOICE_CONSTANT; a_dotdot: ET_SYMBOL; an_upper: ET_CHOICE_CONSTANT): ET_CHOICE_RANGE is
			-- New choice range
		do
			if a_lower /= Void and an_upper /= Void then
				create Result.make (a_lower, an_upper)
				if a_dotdot /= Void then
					Result.set_dotdot (a_dotdot)
				end
			end
		end

	new_class_name_comma (a_name: ET_CLASS_NAME; a_comma: ET_SYMBOL): ET_CLASS_NAME_ITEM is
			-- New class_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_CLASS_NAME_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_clients (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_CLIENTS is
			-- New client clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_brace (a_left)
			end
			if a_right /= Void then
				Result.set_right_brace (a_right)
			end
		end

	new_colon_type (a_colon: ET_SYMBOL; a_type: ET_TYPE): ET_DECLARED_TYPE is
			-- New colon-type
		do
			if a_colon = Void then
				Result := a_type
			elseif a_type /= Void then
				create {ET_COLON_TYPE} Result.make (a_colon, a_type)
			end
		end

	new_compound (nb: INTEGER): ET_COMPOUND is
			-- New instruction compound with capacity `nb'
		do
			create Result.make_with_capacity (nb)
		end

	new_conditional (a_keyword: ET_KEYWORD; an_expression: ET_EXPRESSION): ET_CONDITIONAL is
			-- New conditional
		do
			if a_keyword = Void then
				Result := an_expression
			elseif an_expression /= Void then
				create {ET_KEYWORD_EXPRESSION} Result.make (a_keyword, an_expression)
			end
		end

	new_constant_attribute (a_name: ET_EXTENDED_FEATURE_NAME; a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER;
		an_is: ET_KEYWORD; a_constant: ET_CONSTANT; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_CONSTANT_ATTRIBUTE is
			-- New constant attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_constant /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, an_assigner, a_constant, a_clients, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_constrained_formal_parameter (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER; an_arrow: ET_SYMBOL; a_constraint: ET_TYPE;
		a_creation: ET_CONSTRAINT_CREATOR): ET_CONSTRAINED_FORMAL_PARAMETER is
			-- New constrained formal generic parameter
		do
			if a_name /= Void and a_constraint /= Void then
				create Result.make (a_name, a_constraint, a_creation)
				if a_type_mark /= Void then
					Result.set_type_mark (a_type_mark)
				end
				if an_arrow /= Void then
					Result.set_arrow_symbol (an_arrow)
				end
			end
		end

	new_constraint_actual_parameter_comma (a_parameter: ET_CONSTRAINT_ACTUAL_PARAMETER; a_comma: ET_SYMBOL): ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM is
			-- New constraint_actual_parameter-comma
		do
			if a_comma = Void then
				Result := a_parameter
			elseif a_parameter /= Void then
				create {ET_CONSTRAINT_ACTUAL_PARAMETER_COMMA} Result.make (a_parameter, a_comma)
			end
		end

	new_constraint_actual_parameters (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_CONSTRAINT_ACTUAL_PARAMETER_LIST is
			-- New constraint actual generic parameter list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_bracket (a_left)
			end
			if a_right /= Void then
				Result.set_right_bracket (a_right)
			end
		end

	new_constraint_creator (a_create: ET_KEYWORD; an_end: ET_KEYWORD; nb: INTEGER): ET_CONSTRAINT_CREATOR is
			-- New constraint creation clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_create /= Void then
				Result.set_create_keyword (a_create)
			end
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE; a_comma: ET_SYMBOL): ET_CONVERT_FEATURE_ITEM is
			-- New convert_feature-comma
		do
			if a_comma = Void then
				Result := a_convert_feature
			elseif a_convert_feature /= Void then
				create {ET_CONVERT_FEATURE_COMMA} Result.make (a_convert_feature, a_comma)
			end
		end

	new_convert_features (a_convert: ET_KEYWORD; nb: INTEGER): ET_CONVERT_FEATURE_LIST is
			-- New convert clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_convert /= Void then
				Result.set_convert_keyword (a_convert)
			end
		end

	new_convert_function (a_name: ET_FEATURE_NAME; a_colon: ET_SYMBOL; a_types: ET_TYPE_LIST): ET_CONVERT_FUNCTION is
			-- New convert function
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
				if a_colon /= Void then
					Result.set_colon (a_colon)
				end
			end
		end

	new_convert_procedure (a_name: ET_FEATURE_NAME; a_left_parenthesis: ET_SYMBOL; a_types: ET_TYPE_LIST; a_right_parenthesis: ET_SYMBOL): ET_CONVERT_PROCEDURE is
			-- New convert procedure
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
				if a_left_parenthesis /= Void then
					Result.set_left_parenthesis (a_left_parenthesis)
				end
				if a_right_parenthesis /= Void then
					Result.set_right_parenthesis (a_right_parenthesis)
				end
			end
		end

	new_convert_types (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_TYPE_LIST is
			-- New convert type list with given capacity
		local
			a_braced_types: ET_BRACED_TYPE_LIST
		do
			create a_braced_types.make_with_capacity (nb)
			Result := a_braced_types
			if a_left /= Void then
				a_braced_types.set_left_brace (a_left)
			end
			if a_right /= Void then
				a_braced_types.set_right_brace (a_right)
			end
		end

	new_create_expression (a_create: ET_KEYWORD; a_type: ET_TARGET_TYPE; a_call: ET_QUALIFIED_CALL): ET_CREATE_EXPRESSION is
			-- New create expression
		do
			if a_type /= Void then
				create Result.make (a_type, a_call)
				if a_create /= Void then
					Result.set_create_keyword (a_create)
				end
			end
		end

	new_create_instruction (a_create: ET_KEYWORD; a_type: ET_TARGET_TYPE; a_target: ET_WRITABLE; a_call: ET_QUALIFIED_CALL): ET_CREATE_INSTRUCTION is
			-- New create instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if a_create /= Void then
					Result.set_create_keyword (a_create)
				end
			end
		end

	new_creator (a_creation: ET_KEYWORD; a_clients: ET_CLASS_NAME_LIST; nb: INTEGER): ET_CREATOR is
			-- New creation clause with given capacity
		do
			if a_clients /= Void then
				create Result.make_with_capacity (a_clients, nb)
				if a_creation /= Void then
					Result.set_creation_keyword (a_creation)
				end
			end
		end

	new_current_address (d: ET_SYMBOL; c: ET_CURRENT): ET_CURRENT_ADDRESS is
			-- New address of Current
		do
			create Result.make
			if d /= Void then
				Result.set_dollar (d)
			end
			if c /= Void then
				Result.set_current_keyword (c)
			end
		end

	new_custom_attribute (a_creation: ET_CREATE_EXPRESSION;
		a_settings: ET_MANIFEST_TUPLE; an_end: ET_KEYWORD): ET_CUSTOM_ATTRIBUTE is
			-- New if instruction
		do
			if a_creation /= Void then
				create Result.make (a_creation, a_settings)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_debug_compound (a_debug: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'debug' keyword
		do
			if a_compound /= Void then
				if a_debug /= Void then
					a_compound.set_keyword (a_debug)
				else
					a_compound.set_keyword (tokens.debug_keyword)
				end
				Result := a_compound
			end
		end

	new_debug_instruction (a_keys: ET_MANIFEST_STRING_LIST; a_compound: ET_COMPOUND; an_end: ET_KEYWORD): ET_DEBUG_INSTRUCTION is
			-- New debug instruction
		do
			create Result.make (a_keys, a_compound)
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_deferred_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS; a_deferred: ET_KEYWORD;
		a_postconditions: ET_POSTCONDITIONS; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_DEFERRED_FUNCTION is
			-- New deferred function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions,
					a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if a_deferred /= Void then
					Result.set_deferred_keyword (a_deferred)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_deferred_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_deferred: ET_KEYWORD; a_postconditions: ET_POSTCONDITIONS;
		an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_DEFERRED_PROCEDURE is
			-- New deferred procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions,
					a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if a_deferred /= Void then
					Result.set_deferred_keyword (a_deferred)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_do_compound (a_do: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'do' keyword
		do
			if a_compound /= Void then
				if a_do /= Void then
					a_compound.set_keyword (a_do)
				else
					a_compound.set_keyword (tokens.do_keyword)
				end
				Result := a_compound
			end
		end

	new_do_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST; a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND; a_postconditions: ET_POSTCONDITIONS;
		a_rescue: ET_COMPOUND; an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_DO_FUNCTION is
			-- New do function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_do_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND; a_postconditions: ET_POSTCONDITIONS;
		a_rescue: ET_COMPOUND; an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_DO_PROCEDURE is
			-- New do procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_dot_feature_name (a_dot: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_QUALIFIED_FEATURE_NAME is
			-- New dot-feature_name
		do
			if a_dot = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_DOT_FEATURE_NAME} Result.make (a_dot, a_name)
			end
		end

	new_else_compound (an_else: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by an 'else' keyword
		do
			if a_compound /= Void then
				if an_else /= Void then
					a_compound.set_keyword (an_else)
				else
					a_compound.set_keyword (tokens.else_keyword)
				end
				Result := a_compound
			end
		end

	new_exports (an_export: ET_KEYWORD; nb: INTEGER): ET_EXPORT_LIST is
			-- New export clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_export /= Void then
				Result.set_export_keyword (an_export)
			end
		end

	new_expression_address (d: ET_SYMBOL; e: ET_PARENTHESIZED_EXPRESSION): ET_EXPRESSION_ADDRESS is
			-- New expression address
		do
			if e /= Void then
				create Result.make (e)
				if d /= Void then
					Result.set_dollar (d)
				end
			end
		end

	new_expression_comma (an_expression: ET_EXPRESSION; a_comma: ET_SYMBOL): ET_EXPRESSION_ITEM is
			-- New expression-comma
		do
			if a_comma = Void then
				Result := an_expression
			elseif an_expression /= Void then
				create {ET_EXPRESSION_COMMA} Result.make (an_expression, a_comma)
			end
		end

	new_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME; a_comma: ET_SYMBOL): ET_EXTENDED_FEATURE_NAME is
			-- New extended_feature_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_EXTENDED_FEATURE_NAME_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_external_alias (a_keyword: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_EXTERNAL_ALIAS is
			-- New external alias
		do
			if a_keyword = Void then
				Result := a_string
			elseif a_string /= Void then
				create {ET_KEYWORD_MANIFEST_STRING} Result.make (a_keyword, a_string)
			end
		end

	new_external_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE;
		an_alias: ET_EXTERNAL_ALIAS; a_postconditions: ET_POSTCONDITIONS;
		an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_FUNCTION is
			-- New external function
		do
			if a_name /= Void and a_type /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions,
					a_language, an_alias, a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_external_language (a_keyword: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_EXTERNAL_LANGUAGE is
			-- New external language
		do
			if a_keyword = Void then
				Result := a_string
			elseif a_string /= Void then
				create {ET_KEYWORD_MANIFEST_STRING} Result.make (a_keyword, a_string)
			end
		end

	new_external_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE;
		an_alias: ET_EXTERNAL_ALIAS; a_postconditions: ET_POSTCONDITIONS; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		do
			if a_name /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions,
					a_language, an_alias, a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_feature_address (d: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_FEATURE_ADDRESS is
			-- New feature address
		do
			if a_name /= Void then
				create Result.make (a_name)
				if d /= Void then
					Result.set_dollar (d)
				end
			end
		end

	new_feature_clause (a_feature: ET_KEYWORD; a_clients: ET_CLASS_NAME_LIST): ET_FEATURE_CLAUSE is
			-- New fetaure clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
				if a_feature /= Void then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_feature_name_comma (a_name: ET_FEATURE_NAME; a_comma: ET_SYMBOL): ET_FEATURE_NAME_ITEM is
			-- New feature_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_FEATURE_NAME_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT; a_semicolon: ET_SYMBOL): ET_FORMAL_ARGUMENT_ITEM is
			-- New formal_argument-semicolon
		do
			if a_semicolon = Void then
				Result := an_argument
			elseif an_argument /= Void then
				create {ET_FORMAL_ARGUMENT_SEMICOLON} Result.make (an_argument, a_semicolon)
			end
		end

	new_formal_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_FORMAL_ARGUMENT_LIST is
			-- New formal argument list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_parenthesis (a_left)
			end
			if a_right /= Void then
				Result.set_right_parenthesis (a_right)
			end
		end

	new_formal_parameter_comma (a_formal: ET_FORMAL_PARAMETER; a_comma: ET_SYMBOL): ET_FORMAL_PARAMETER_ITEM is
			-- New formal_generic_parameter-comma
		do
			if a_comma = Void then
				Result := a_formal
			elseif a_formal /= Void then
				create {ET_FORMAL_PARAMETER_COMMA} Result.make (a_formal, a_comma)
			end
		end

	new_formal_parameters (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_FORMAL_PARAMETER_LIST is
			-- New formal generic parameter list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_bracket (a_left)
			end
			if a_right /= Void then
				Result.set_right_bracket (a_right)
			end
		end

	new_from_compound (a_from: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'from' keyword
		do
			if a_compound /= Void then
				if a_from /= Void then
					a_compound.set_keyword (a_from)
				else
					a_compound.set_keyword (tokens.from_keyword)
				end
				Result := a_compound
			end
		end

	new_if_instruction (a_conditional: ET_CONDITIONAL; a_then_compound: ET_COMPOUND;
		an_elseif_parts: ET_ELSEIF_PART_LIST; an_else_compound: ET_COMPOUND;
		an_end: ET_KEYWORD): ET_IF_INSTRUCTION is
			-- New if instruction
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_then_compound)
				Result.set_elseif_parts (an_elseif_parts)
				Result.set_else_compound (an_else_compound)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_indexing (a_terms: ET_INDEXING_TERM_LIST): ET_INDEXING is
			-- New indexing clause
		do
			if a_terms /= Void then
				create Result.make (a_terms)
			end
		end

	new_indexing_semicolon (an_indexing: ET_INDEXING_ITEM; a_semicolon: ET_SYMBOL): ET_INDEXING_ITEM is
			-- New indexing-semicolon
		do
			if a_semicolon = Void then
				Result := an_indexing
			elseif an_indexing /= Void then
				create {ET_INDEXING_SEMICOLON} Result.make (an_indexing, a_semicolon)
			end
		end

	new_indexing_term_comma (a_term: ET_INDEXING_TERM; a_comma: ET_SYMBOL): ET_INDEXING_TERM_ITEM is
			-- New indexing_term-comma
		do
			if a_comma = Void then
				Result := a_term
			elseif a_term /= Void then
				create {ET_INDEXING_TERM_COMMA} Result.make (a_term, a_comma)
			end
		end

	new_indexing_terms (nb: INTEGER): ET_INDEXING_TERM_LIST is
			-- New indexing terms with given capacity
		do
			create Result.make_with_capacity (nb)
		end

	new_indexings (an_indexing: ET_KEYWORD; nb: INTEGER): ET_INDEXING_LIST is
			-- New indexing clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_indexing /= Void then
				Result.set_indexing_keyword (an_indexing)
			end
		end

	new_infix_and_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "and" feature name
		do
			if an_operator /= Void then
				create Result.make_and (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_and_then_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "and then" feature name
		do
			if an_operator /= Void then
				create Result.make_and_then (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_and_then_operator (an_and: ET_KEYWORD; a_then: ET_KEYWORD): ET_INFIX_AND_THEN_OPERATOR is
			-- New binary "and then" operator
		do
			create Result.make
			if an_and /= Void then
				Result.set_and_keyword (an_and)
			end
			if a_then /= Void then
				Result.set_then_keyword (a_then)
			end
		end

	new_infix_div_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "//" feature name
		do
			if an_operator /= Void then
				create Result.make_div (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_divide_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "//" feature name
		do
			if an_operator /= Void then
				create Result.make_divide (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_free_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New infix free feature name
		do
			if an_operator /= Void then
				if an_operator.value.count > 0 then
					create Result.make (an_operator)
					if an_infix /= Void then
						Result.set_infix_keyword (an_infix)
					end
				end
			end
		end

	new_infix_ge_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix ">=" feature name
		do
			if an_operator /= Void then
				create Result.make_ge (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_gt_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix ">" feature name
		do
			if an_operator /= Void then
				create Result.make_gt (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_implies_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "implies" feature name
		do
			if an_operator /= Void then
				create Result.make_implies (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_le_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "<=" feature name
		do
			if an_operator /= Void then
				create Result.make_le (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_lt_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "<" feature name
		do
			if an_operator /= Void then
				create Result.make_lt (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_minus_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "-" feature name
		do
			if an_operator /= Void then
				create Result.make_minus (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_mod_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "\\" feature name
		do
			if an_operator /= Void then
				create Result.make_mod (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_or_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "or" feature name
		do
			if an_operator /= Void then
				create Result.make_or (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_or_else_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "or else" feature name
		do
			if an_operator /= Void then
				create Result.make_or_else (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_or_else_operator (an_or: ET_KEYWORD; an_else: ET_KEYWORD): ET_INFIX_OR_ELSE_OPERATOR is
			-- New binary "or else" operator
		do
			create Result.make
			if an_or /= Void then
				Result.set_or_keyword (an_or)
			end
			if an_else /= Void then
				Result.set_else_keyword (an_else)
			end
		end

	new_infix_plus_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "+" feature name
		do
			if an_operator /= Void then
				create Result.make_plus (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_power_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "^" feature name
		do
			if an_operator /= Void then
				create Result.make_power (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_times_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "*" feature name
		do
			if an_operator /= Void then
				create Result.make_times (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_xor_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "xor" feature name
		do
			if an_operator /= Void then
				create Result.make_xor (an_operator)
				if an_infix /= Void then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_inspect_instruction (a_conditional: ET_CONDITIONAL; a_when_parts: ET_WHEN_PART_LIST;
		an_else_compound: ET_COMPOUND; an_end: ET_KEYWORD): ET_INSPECT_INSTRUCTION is
			-- New inspect instruction
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_when_parts)
				Result.set_else_compound (an_else_compound)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_invariants (an_invariant: ET_KEYWORD; a_class: ET_CLASS; nb: INTEGER): ET_INVARIANTS is
			-- New class invariants with given capacity
		do
			if a_class /= Void then
				create Result.make_with_capacity (a_class, nb)
				if an_invariant /= Void then
					Result.set_invariant_keyword (an_invariant)
				end
			end
		end

	new_keyword_feature_name_list (a_keyword: ET_KEYWORD; nb: INTEGER): ET_KEYWORD_FEATURE_NAME_LIST is
			-- New feature name list, with a given capacity, preceded by a keyword
		do
			create Result.make_with_capacity (nb)
			Result.set_keyword (a_keyword)
		end

	new_like_current (a_like: ET_KEYWORD; a_current: ET_CURRENT): ET_LIKE_CURRENT is
			-- New 'like Current' type
		do
			create Result.make
			if a_like /= Void then
				Result.set_like_keyword (a_like)
			end
			if a_current /= Void then
				Result.set_current_keyword (a_current)
			end
		end

	new_like_feature (a_like: ET_KEYWORD; a_name: ET_FEATURE_NAME): ET_LIKE_FEATURE is
			-- New 'like name' type
		do
			if a_name /= Void then
				create Result.make (a_name)
				if a_like /= Void then
					Result.set_like_keyword (a_like)
				end
			end
		end

	new_local_name_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_LOCAL_NAME is
			-- New local_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_IDENTIFIER_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_local_variable_semicolon (a_variable: ET_LOCAL_VARIABLE; a_semicolon: ET_SYMBOL): ET_LOCAL_VARIABLE_ITEM is
			-- New local_variable-semicolon
		do
			if a_semicolon = Void then
				Result := a_variable
			elseif a_variable /= Void then
				create {ET_LOCAL_VARIABLE_SEMICOLON} Result.make (a_variable, a_semicolon)
			end
		end

	new_local_variables (a_local: ET_KEYWORD; nb: INTEGER): ET_LOCAL_VARIABLE_LIST is
			-- New local variable list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_local /= Void then
				Result.set_local_keyword (a_local)
			end
		end

	new_loop_compound (a_loop: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'loop' keyword
		do
			if a_compound /= Void then
				if a_loop /= Void then
					a_compound.set_keyword (a_loop)
				else
					a_compound.set_keyword (tokens.loop_keyword)
				end
				Result := a_compound
			end
		end

	new_loop_instruction (a_from_compound: ET_COMPOUND; an_invariant: ET_LOOP_INVARIANTS;
		a_variant: ET_VARIANT; an_until_conditional: ET_CONDITIONAL;
		a_loop_compound: ET_COMPOUND; an_end: ET_KEYWORD): ET_LOOP_INSTRUCTION is
			-- New loop instruction
		do
			if an_until_conditional /= Void then
				create Result.make (a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_loop_invariants (an_invariant: ET_KEYWORD; nb: INTEGER): ET_LOOP_INVARIANTS is
			-- New loop invariants with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_invariant /= Void then
				Result.set_invariant_keyword (an_invariant)
			end
		end

	new_manifest_array (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_ARRAY is
			-- New manifest array with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_symbol (a_left)
			end
			if a_right /= Void then
				Result.set_right_symbol (a_right)
			end
		end

	new_manifest_string_comma (a_string: ET_MANIFEST_STRING; a_comma: ET_SYMBOL): ET_MANIFEST_STRING_ITEM is
			-- New manifest_string-comma
		do
			if a_comma = Void then
				Result := a_string
			elseif a_string /= Void then
				create {ET_MANIFEST_STRING_COMMA} Result.make (a_string, a_comma)
			end
		end

	new_manifest_string_list (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_STRING_LIST is
			-- New list of manifest strings with capacity `nb'.
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_parenthesis (a_left)
			end
			if a_right /= Void then
				Result.set_right_parenthesis (a_right)
			end
		end

	new_manifest_tuple (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_TUPLE is
			-- New manifest tuple with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_symbol (a_left)
			end
			if a_right /= Void then
				Result.set_right_symbol (a_right)
			end
		end

	new_manifest_type (a_left: ET_SYMBOL; a_type: ET_TYPE; a_right: ET_SYMBOL): ET_MANIFEST_TYPE is
			-- New manifest type
		do
			if a_type /= Void then
				create Result.make (a_type)
				if a_left /= Void then
					Result.set_left_brace (a_left)
				end
				if a_right /= Void then
					Result.set_right_brace (a_right)
				end
			end
		end

	new_null_export (a_semicolon: ET_SEMICOLON_SYMBOL): ET_NULL_EXPORT is
			-- New null export
		do
			Result := a_semicolon
		end

	new_null_instruction (a_semicolon: ET_SEMICOLON_SYMBOL): ET_NULL_INSTRUCTION is
			-- New null instruction
		do
			Result := a_semicolon
		end

	new_obsolete_message (an_obsolete: ET_KEYWORD; a_message: ET_MANIFEST_STRING): ET_OBSOLETE is
			-- New obsolete clause
		do
			if an_obsolete = Void then
				Result := a_message
			elseif a_message /= Void then
				create {ET_KEYWORD_MANIFEST_STRING} Result.make (an_obsolete, a_message)
			end
		end

	new_old_expression (an_old: ET_KEYWORD; e: ET_EXPRESSION): ET_OLD_EXPRESSION is
			-- New old expression
		do
			if e /= Void then
				create Result.make (e)
				if an_old /= Void then
					Result.set_old_keyword (an_old)
				end
			end
		end

	new_once_compound (a_once: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'once' keyword
		do
			if a_compound /= Void then
				if a_once /= Void then
					a_compound.set_keyword (a_once)
				else
					a_compound.set_keyword (tokens.once_keyword)
				end
				Result := a_compound
			end
		end

	new_once_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST; a_type: ET_DECLARED_TYPE;
		an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_ONCE_FUNCTION is
			-- New once function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_once_manifest_string (a_once: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ONCE_MANIFEST_STRING is
			-- New once manifest string
		do
			if a_string /= Void then
				create Result.make (a_string)
				if a_once /= Void then
					Result.set_once_keyword (a_once)
				end
			end
		end

	new_once_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND; a_postconditions: ET_POSTCONDITIONS;
		a_rescue: ET_COMPOUND; an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_ONCE_PROCEDURE is
			-- New once procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_parent (a_type: ET_CLASS_TYPE; a_renames: ET_RENAME_LIST; an_exports: ET_EXPORT_LIST;
		an_undefines, a_redefines, a_selects: ET_KEYWORD_FEATURE_NAME_LIST; an_end: ET_KEYWORD): ET_PARENT is
			-- New parent
		do
			if a_type /= Void then
				create Result.make (a_type, a_renames, an_exports, an_undefines, a_redefines, a_selects)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_parent_semicolon (a_parent: ET_PARENT; a_semicolon: ET_SYMBOL): ET_PARENT_ITEM is
			-- New parent-semicolon
		do
			if a_semicolon = Void then
				Result := a_parent
			elseif a_parent /= Void then
				create {ET_PARENT_SEMICOLON} Result.make (a_parent, a_semicolon)
			end
		end

	new_parents (an_inherit: ET_KEYWORD; nb: INTEGER): ET_PARENT_LIST is
			-- New class parent list with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_inherit /= Void then
				Result.set_inherit_keyword (an_inherit)
			end
		end

	new_parenthesized_expression (l: ET_SYMBOL; e: ET_EXPRESSION; r: ET_SYMBOL): ET_PARENTHESIZED_EXPRESSION is
			-- New parenthesized expression
		do
			if e /= Void then
				create Result.make (e)
				if l /= Void then
					Result.set_left_parenthesis (l)
				end
				if r /= Void then
					Result.set_right_parenthesis (r)
				end
			end
		end

	new_postconditions (an_ensure: ET_KEYWORD; a_then: ET_KEYWORD; nb: INTEGER): ET_POSTCONDITIONS is
			-- New postconditions with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_ensure /= Void then
				Result.set_ensure_keyword (an_ensure)
			end
			if a_then /= Void then
				Result.set_then_keyword (a_then)
			end
		end

	new_preconditions (a_require: ET_KEYWORD; an_else: ET_KEYWORD; nb: INTEGER): ET_PRECONDITIONS is
			-- New preconditions with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_require /= Void then
				Result.set_require_keyword (a_require)
			end
			if an_else /= Void then
				Result.set_else_keyword (an_else)
			end
		end

	new_precursor_class_name (l: ET_SYMBOL; a_name: ET_CLASS_NAME; r: ET_SYMBOL): ET_PRECURSOR_CLASS_NAME is
			-- New class name surrounded by braces
		local
			a_braced_name: ET_BRACED_CLASS_NAME
		do
			if a_name /= Void then
				create a_braced_name.make (a_name)
				if l /= Void then
					a_braced_name.set_left_brace (l)
				end
				if r /= Void then
					a_braced_name.set_right_brace (r)
				end
				Result := a_braced_name
			end
		end

	new_precursor_expression (is_parent_prefixed: BOOLEAN; a_precursor: ET_PRECURSOR_KEYWORD; a_parent: ET_PRECURSOR_CLASS_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_PRECURSOR_EXPRESSION is
			-- New precursor expression
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_precursor_instruction (is_parent_prefixed: BOOLEAN; a_precursor: ET_PRECURSOR_KEYWORD; a_parent: ET_PRECURSOR_CLASS_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_PRECURSOR_INSTRUCTION is
			-- New precursor instruction
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_prefix_free_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New prefix free feature name
		do
			if an_operator /= Void then
				if an_operator.value.count > 0 then
					create Result.make (an_operator)
					if a_prefix /= Void then
						Result.set_prefix_keyword (a_prefix)
					end
				end
			end
		end

	new_prefix_minus_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NAME is
			-- New prefix "-" feature name
		do
			if an_operator /= Void then
				create Result.make_minus (an_operator)
				if a_prefix /= Void then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_prefix_not_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NAME is
			-- New prefix "not" feature name
		do
			if an_operator /= Void then
				create Result.make_not (an_operator)
				if a_prefix /= Void then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_prefix_plus_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NAME is
			-- New prefix "+" feature name
		do
			if an_operator /= Void then
				create Result.make_plus (an_operator)
				if a_prefix /= Void then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_rename (old_name: ET_FEATURE_NAME; an_as: ET_KEYWORD; new_name: ET_EXTENDED_FEATURE_NAME): ET_RENAME is
			-- New rename pair
		do
			if old_name /= Void and new_name /= Void then
				create Result.make (old_name, new_name)
				if an_as /= Void then
					Result.set_as_keyword (an_as)
				end
			end
		end

	new_rename_comma (old_name: ET_FEATURE_NAME; an_as: ET_KEYWORD;
		new_name: ET_EXTENDED_FEATURE_NAME; a_comma: ET_SYMBOL): ET_RENAME_ITEM is
			-- New rename pair followed by a comma
		local
			a_rename: ET_RENAME
		do
			if old_name /= Void and new_name /= Void then
				if a_comma = Void then
					create a_rename.make (old_name, new_name)
				else
					create {ET_RENAME_COMMA} a_rename.make (old_name, new_name, a_comma)
				end
				if an_as /= Void then
					a_rename.set_as_keyword (an_as)
				end
				Result := a_rename
			end
		end

	new_renames (a_rename: ET_KEYWORD; nb: INTEGER): ET_RENAME_LIST is
			-- New rename clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_rename /= Void then
				Result.set_rename_keyword (a_rename)
			end
		end

	new_rescue_compound (a_rescue: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'rescue' keyword
		do
			if a_compound /= Void then
				if a_rescue /= Void then
					a_compound.set_keyword (a_rescue)
				else
					a_compound.set_keyword (tokens.rescue_keyword)
				end
				Result := a_compound
			end
		end

	new_result_address (d: ET_SYMBOL; r: ET_RESULT): ET_RESULT_ADDRESS is
			-- New address of 'Result'
		do
			create Result.make
			if d /= Void then
				Result.set_dollar (d)
			end
			if r /= Void then
				Result.set_result_keyword (r)
			end
		end

	new_static_call_expression (a_feature: ET_KEYWORD; a_type: ET_TARGET_TYPE;
		a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_STATIC_CALL_EXPRESSION is
			-- New static call expression
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_static_call_instruction (a_feature: ET_KEYWORD; a_type: ET_TARGET_TYPE;
		a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_STATIC_CALL_INSTRUCTION is
			-- New static call instruction
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_strip_expression (a_strip: ET_KEYWORD; l, r: ET_SYMBOL; nb: INTEGER): ET_STRIP_EXPRESSION is
			-- New strip expression with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_strip /= Void then
				Result.set_strip_keyword (a_strip)
			end
			if l /= Void then
				Result.set_left_parenthesis (l)
			end
			if r /= Void then
				Result.set_left_parenthesis (r)
			end
		end

	new_tag (a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL): ET_TAG is
			-- New tag
		do
			if a_colon = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_IDENTIFIER_COLON} Result.make (a_name, a_colon)
			end
		end

	new_tagged_indexing (a_tag: ET_TAG; a_terms: ET_INDEXING_TERM_LIST): ET_TAGGED_INDEXING is
			-- New tagged indexing clause
		do
			if a_tag /= Void and a_terms /= Void then
				create Result.make (a_tag, a_terms)
			end
		end

	new_target_type (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL): ET_TARGET_TYPE is
			-- New type surrounded by braces
		local
			a_braced_type: ET_BRACED_TYPE
		do
			if a_type /= Void then
				create a_braced_type.make (a_type)
				if l /= Void then
					a_braced_type.set_left_brace (l)
				end
				if r /= Void then
					a_braced_type.set_right_brace (r)
				end
				Result := a_braced_type
			end
		end

	new_then_compound (a_then: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'then' keyword
		do
			if a_compound /= Void then
				if a_then /= Void then
					a_compound.set_keyword (a_then)
				else
					a_compound.set_keyword (tokens.then_keyword)
				end
				Result := a_compound
			end
		end

	new_type_comma (a_type: ET_TYPE; a_comma: ET_SYMBOL): ET_TYPE_ITEM is
			-- New type-comma
		do
			if a_comma = Void then
				Result := a_type
			elseif a_type /= Void then
				create {ET_TYPE_COMMA} Result.make (a_type, a_comma)
			end
		end

	new_unique_attribute (a_name: ET_EXTENDED_FEATURE_NAME; a_type: ET_DECLARED_TYPE;
		an_assigner: ET_ASSIGNER; an_is, a_unique: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_UNIQUE_ATTRIBUTE is
			-- New unique attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, an_assigner, a_clients, a_class)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				if a_unique /= Void then
					Result.set_unique_keyword (a_unique)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_variant (a_variant: ET_KEYWORD; a_tag: ET_TAG; an_expression: ET_EXPRESSION): ET_VARIANT is
			-- New loop variant
		do
			create Result.make (a_tag, an_expression)
			if a_variant /= Void then
				Result.set_variant_keyword (a_variant)
			end
		end

feature {NONE} -- Implementation

	last_break (is_header: BOOLEAN; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BREAK is
			-- Last break, comment (or header comment when `is_header' is true)
			-- from `a_scanner'
		require
			a_scanner_not_void: a_scanner /= Void
		do
			if keep_all_breaks then
				if a_scanner.has_break then
					Result := new_break (a_scanner)
				elseif a_scanner.has_comment then
					Result := new_comment (a_scanner)
				end
			elseif keep_all_comments then
				if a_scanner.has_comment then
					Result := new_comment (a_scanner)
				end
			elseif keep_header_comments and is_header then
				if a_scanner.has_comment then
					Result := new_comment (a_scanner)
				end
			end
		end

end
