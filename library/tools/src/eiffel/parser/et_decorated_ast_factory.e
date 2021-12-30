note

	description:

		"Eiffel decorated Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DECORATED_AST_FACTORY

inherit

	ET_AST_FACTORY
		redefine
			new_across_keyword,
			new_agent_keyword,
			new_alias_keyword,
			new_all_keyword,
			new_and_keyword,
			new_as_keyword,
			new_assign_keyword,
			new_attached_keyword,
			new_attribute_keyword,
			new_check_keyword,
			new_class_keyword,
			new_convert_keyword,
			new_create_keyword,
			new_creation_keyword,
			new_current_keyword,
			new_debug_keyword,
			new_deferred_keyword,
			new_detachable_keyword,
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
			new_inherit_keyword,
			new_inspect_keyword,
			new_invariant_keyword,
			new_is_keyword,
			new_like_keyword,
			new_local_keyword,
			new_loop_keyword,
			new_not_keyword,
			new_note_keyword,
			new_obsolete_keyword,
			new_old_keyword,
			new_once_keyword,
			new_or_keyword,
			new_precursor_keyword,
			new_redefine_keyword,
			new_reference_keyword,
			new_rename_keyword,
			new_require_keyword,
			new_rescue_keyword,
			new_result_keyword,
			new_retry_keyword,
			new_select_keyword,
			new_separate_keyword,
			new_some_keyword,
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
			new_and_symbol,
			new_and_then_symbol,
			new_arrow_symbol,
			new_assign_attempt_symbol,
			new_assign_symbol,
			new_at_symbol,
			new_bang_symbol,
			new_bar_symbol,
			new_close_repeat_symbol,
			new_colon_symbol,
			new_comma_symbol,
			new_div_symbol,
			new_divide_symbol,
			new_dollar_symbol,
			new_dot_symbol,
			new_dotdot_symbol,
			new_equal_symbol,
			new_for_all_symbol,
			new_ge_symbol,
			new_gt_symbol,
			new_implies_symbol,
			new_le_symbol,
			new_left_array_symbol,
			new_left_brace_symbol,
			new_left_bracket_symbol,
			new_left_parenthesis_symbol,
			new_lt_symbol,
			new_minus_symbol,
			new_mod_symbol,
			new_not_symbol,
			new_not_equal_symbol,
			new_not_tilde_symbol,
			new_open_repeat_symbol,
			new_or_symbol,
			new_or_else_symbol,
			new_plus_symbol,
			new_power_symbol,
			new_question_mark_symbol,
			new_right_array_symbol,
			new_right_brace_symbol,
			new_right_bracket_symbol,
			new_right_parenthesis_symbol,
			new_semicolon_symbol,
			new_there_exists_symbol,
			new_tilde_symbol,
			new_times_symbol,
			new_xor_symbol,
			new_binary_integer_constant,
			new_break,
			new_c1_character_constant,
			new_c2_character_constant,
			new_c3_character_constant,
			new_comment,
			new_free_operator,
			new_hexadecimal_integer_constant,
			new_identifier,
			new_octal_integer_constant,
			new_regular_integer_constant,
			new_regular_manifest_string,
			new_regular_real_constant,
			new_special_manifest_string,
			new_underscored_integer_constant,
			new_underscored_real_constant,
			new_verbatim_string,
			new_across_all_expression,
			new_across_instruction,
			new_across_some_expression,
			new_actual_arguments,
			new_actual_parameter_comma,
			new_actual_parameters,
			new_agent_argument_operand_comma,
			new_agent_argument_operands,
			new_agent_typed_open_argument,
			new_agent_open_target,
			new_alias_and_name,
			new_alias_and_symbol_name,
			new_alias_and_then_name,
			new_alias_and_then_symbol_name,
			new_alias_bracket_name,
			new_alias_div_name,
			new_alias_divide_name,
			new_alias_dotdot_name,
			new_alias_free_name,
			new_alias_ge_name,
			new_alias_gt_name,
			new_alias_implies_name,
			new_alias_implies_symbol_name,
			new_alias_le_name,
			new_alias_lt_name,
			new_alias_minus_name,
			new_alias_mod_name,
			new_alias_not_name,
			new_alias_not_symbol_name,
			new_alias_or_name,
			new_alias_or_symbol_name,
			new_alias_or_else_name,
			new_alias_or_else_symbol_name,
			new_alias_parenthesis_name,
			new_alias_plus_name,
			new_alias_power_name,
			new_alias_times_name,
			new_alias_xor_name,
			new_alias_xor_symbol_name,
			new_all_export,
			new_argument_name_comma,
			new_assertion_semicolon,
			new_assigner,
			new_assigner_instruction,
			new_assignment,
			new_assignment_attempt,
			new_attribute,
			new_attribute_compound,
			new_bang_instruction,
			new_bracket_arguments,
			new_check_instruction,
			new_choice_comma,
			new_choice_list,
			new_choice_range,
			new_client_comma,
			new_clients,
			new_colon_type,
			new_empty_compound,
			new_conditional,
			new_constant_attribute,
			new_constrained_formal_parameter,
			new_constraint_actual_parameter_comma,
			new_constraint_actual_parameters,
			new_constraint_creator,
			new_constraint_labeled_actual_parameter_semicolon,
			new_constraint_renames,
			new_convert_feature_comma,
			new_convert_features,
			new_convert_from_expression,
			new_convert_function,
			new_convert_procedure,
			new_convert_to_expression,
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
			new_do_function_inline_agent,
			new_do_procedure,
			new_do_procedure_inline_agent,
			new_dot_feature_name,
			new_else_compound,
			new_elseif_expression,
			new_exports,
			new_expression_address,
			new_expression_comma,
			new_extended_attribute,
			new_extended_feature_name_comma,
			new_external_alias,
			new_external_function,
			new_external_function_inline_agent,
			new_external_language,
			new_external_procedure,
			new_external_procedure_inline_agent,
			new_feature_address,
			new_feature_clause,
			new_feature_name_comma,
			new_for_all_quantifier_expression,
			new_formal_argument_semicolon,
			new_formal_arguments,
			new_formal_parameter_comma,
			new_formal_parameters,
			new_from_compound,
			new_if_expression,
			new_if_instruction,
			new_indexing_semicolon,
			new_indexing_term_comma,
			new_infix_and_then_operator,
			new_infix_or_else_operator,
			new_inspect_expression,
			new_inspect_instruction,
			new_invariants,
			new_iteration_cursor,
			new_keyword_feature_name_list,
			new_label_comma,
			new_labeled_actual_parameter_semicolon,
			new_like_current,
			new_like_feature,
			new_local_name_comma,
			new_local_variable_semicolon,
			new_local_variables,
			new_loop_compound,
			new_loop_instruction,
			new_loop_instruction_old_syntax,
			new_loop_invariants,
			new_manifest_array,
			new_manifest_string_comma,
			new_manifest_string_list,
			new_manifest_tuple,
			new_manifest_type,
			new_named_object_test,
			new_none_clients,
			new_null_export,
			new_null_instruction,
			new_object_test,
			new_obsolete_message,
			new_old_expression,
			new_old_object_test,
			new_once_compound,
			new_once_function,
			new_once_function_inline_agent,
			new_once_manifest_string,
			new_once_procedure,
			new_once_procedure_inline_agent,
			new_parent,
			new_parent_semicolon,
			new_parents,
			new_parenthesized_expression,
			new_postconditions,
			new_preconditions,
			new_precursor_class_name,
			new_precursor_expression,
			new_precursor_instruction,
			new_qualified_like_braced_type,
			new_rename,
			new_rename_comma,
			new_renames,
			new_repeat_instruction,
			new_rescue_compound,
			new_result_address,
			new_static_call_expression,
			new_static_call_instruction,
			new_strip_expression,
			new_tag,
			new_target_type,
			new_then_compound,
			new_there_exists_quantifier_expression,
			new_type_comma,
			new_type_constraint_comma,
			new_type_constraint_list,
			new_unique_attribute,
			new_variant,
			new_when_expression
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

	explicit_convert_class_names: detachable DS_ARRAYED_LIST [TUPLE [from_class, to_class: detachable LX_DFA_WILDCARD]]
			-- Implicit conversions that we want to make explicit.
			-- A void regular expression means "any class".
			-- An empty list means "all conversions".
			-- A void list means "no conversion".

feature -- Status setting

	set_keep_all_breaks (b: BOOLEAN)
			-- Set `keep_all_breaks' to `b'.
		do
			keep_all_breaks := b
		ensure
			keep_all_breaks_set: keep_all_breaks = b
		end

	set_keep_all_comments (b: BOOLEAN)
			-- Set `keep_all_comments' to `b'.
		do
			keep_all_comments := b
		ensure
			keep_all_comments_set: keep_all_comments = b
		end

	set_keep_header_comments (b: BOOLEAN)
			-- Set `keep_header_comments' to `b'.
		do
			keep_header_comments := b
		ensure
			keep_header_comments_set: keep_header_comments = b
		end

	set_explicit_convert_class_names (a_explicit_convert_class_names: like explicit_convert_class_names)
			-- Set `explicit_convert_class_names' to `a_explicit_convert_class_names'.
		require
			regexps_compiled: a_explicit_convert_class_names /= Void implies
				across a_explicit_convert_class_names as i_conversion all
					(attached i_conversion.from_class as l_from_class implies l_from_class.is_compiled) and
					(attached i_conversion.from_class as l_to_class implies l_to_class.is_compiled) end
		do
			explicit_convert_class_names := a_explicit_convert_class_names
		ensure
			explicit_convert_class_names_set: explicit_convert_class_names = a_explicit_convert_class_names
		end

feature -- Eiffel keywords

	new_across_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'across' keyword
		do
			create Result.make_across
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_agent_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_AGENT_KEYWORD
			-- New 'agent' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_alias_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'alias' keyword
		do
			create Result.make_alias
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_all_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'all' keyword
		do
			create Result.make_all
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_and_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'and' keyword
		do
			create Result.make_and
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_as_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'as' keyword
		do
			create Result.make_as
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_assign_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'assign' keyword
		do
			create Result.make_assign
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_attached_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'attached' keyword
		do
			create Result.make_attached
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_attribute_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'attribute' keyword
		do
			create Result.make_attribute
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_check_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'check' keyword
		do
			create Result.make_check
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_class_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'class' keyword
		do
			create Result.make_class
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_convert_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'convert' keyword
		do
			create Result.make_convert
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_create_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'create' keyword
		do
			create Result.make_create
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_creation_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'creation' keyword
		do
			create Result.make_creation
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_current_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_CURRENT
			-- New 'current' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_debug_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'debug' keyword
		do
			create Result.make_debug
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_deferred_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'deferred' keyword
		do
			create Result.make_deferred
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_detachable_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'detachable' keyword
		do
			create Result.make_detachable
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_do_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'do' keyword
		do
			create Result.make_do
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_else_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'else' keyword
		do
			create Result.make_else
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_elseif_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'elseif' keyword
		do
			create Result.make_elseif
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_end_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'end' keyword
		do
			create Result.make_end
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_ensure_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'ensure' keyword
		do
			create Result.make_ensure
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_expanded_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'expanded' keyword
		do
			create Result.make_expanded
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_export_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'export' keyword
		do
			create Result.make_export
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_external_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'external' keyword
		do
			create Result.make_external
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_false_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_FALSE_CONSTANT
			-- New 'false' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_feature_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'feature' keyword
		do
			create Result.make_feature
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_from_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'from' keyword
		do
			create Result.make_from
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_frozen_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'frozen' keyword
		do
			create Result.make_frozen
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_if_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'if' keyword
		do
			create Result.make_if
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_implies_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'implies' keyword
		do
			create Result.make_implies
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_indexing_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'indexing' keyword
		do
			create Result.make_indexing
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_inherit_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'inherit' keyword
		do
			create Result.make_inherit
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_inspect_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'inspect' keyword
		do
			create Result.make_inspect
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_invariant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'invariant' keyword
		do
			create Result.make_invariant
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_is_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'is' keyword
		do
			create Result.make_is
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_like_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'like' keyword
		do
			create Result.make_like
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_local_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'local' keyword
		do
			create Result.make_local
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_loop_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'loop' keyword
		do
			create Result.make_loop
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'not' keyword
		do
			create Result.make_not
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_note_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'note' keyword
		do
			create Result.make_note
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_obsolete_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'obsolete' keyword
		do
			create Result.make_obsolete
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_old_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'old' keyword
		do
			create Result.make_old
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_once_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'once' keyword
		do
			create Result.make_once
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_or_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'or' keyword
		do
			create Result.make_or
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_precursor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_PRECURSOR_KEYWORD
			-- New 'precursor' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_redefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'redefine' keyword
		do
			create Result.make_redefine
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_reference_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'reference' keyword
		do
			create Result.make_reference
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_rename_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'rename' keyword
		do
			create Result.make_rename
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_require_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'require' keyword
		do
			create Result.make_require
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_rescue_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'rescue' keyword
		do
			create Result.make_rescue
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_result_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_RESULT
			-- New 'result' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_retry_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_RETRY_INSTRUCTION
			-- New 'retry' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_select_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'select' keyword
		do
			create Result.make_select
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_separate_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'separate' keyword
		do
			create Result.make_separate
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_some_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'some' keyword
		do
			create Result.make_some
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_strip_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'strip' keyword
		do
			create Result.make_strip
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_then_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'then' keyword
		do
			create Result.make_then
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_true_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_TRUE_CONSTANT
			-- New 'true' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_undefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'undefine' keyword
		do
			create Result.make_undefine
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_unique_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'unique' keyword
		do
			create Result.make_unique
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_until_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'until' keyword
		do
			create Result.make_until
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_variant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'variant' keyword
		do
			create Result.make_variant
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_void_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_VOID
			-- New 'void' keyword
		do
			create Result.make
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_when_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD
			-- New 'when' keyword
		do
			create Result.make_when
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_xor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_KEYWORD_OPERATOR
			-- New 'xor' keyword
		do
			create Result.make_xor
			Result.set_text (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature -- Eiffel symbols

	new_and_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∧' symbol
		do
			create Result.make_and_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_and_then_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∧…' symbol
		do
			create Result.make_and_then_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_arrow_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '->' symbol
		do
			create Result.make_arrow
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_assign_attempt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '?=' symbol
		do
			create Result.make_assign_attempt
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_assign_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ':=' symbol
		do
			create Result.make_assign
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_at_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '@' symbol
		do
			create Result.make_at
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_bang_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '!' symbol
		do
			create Result.make_bang
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_bar_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '¦' symbol
		do
			create Result.make_bar
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_close_repeat_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '⟲' symbol
		do
			create Result.make_close_repeat
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_colon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ':' symbol
		do
			create Result.make_colon
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_comma_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ',' symbol
		do
			create Result.make_comma
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_div_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '//' symbol
		do
			create Result.make_div
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_divide_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '/' symbol
		do
			create Result.make_divide
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_dollar_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '$' symbol
		do
			create Result.make_dollar
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_dot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '.' symbol
		do
			create Result.make_dot
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_dotdot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '..' symbol
		do
			create Result.make_dotdot
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '=' symbol
		do
			create Result.make_equal
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_for_all_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '∀' symbol
		do
			create Result.make_for_all
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_ge_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '>=' symbol
		do
			create Result.make_ge
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_gt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '>' symbol
		do
			create Result.make_gt
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_implies_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '⇒' symbol
		do
			create Result.make_implies_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_le_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '<=' symbol
		do
			create Result.make_le
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '<<' symbol
		do
			create Result.make_left_array
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '{' symbol
		do
			create Result.make_left_brace
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_BRACKET_SYMBOL
			-- New '[' symbol
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_left_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '(' symbol
		do
			create Result.make_left_parenthesis
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_lt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '<' symbol
		do
			create Result.make_lt
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_minus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '-' symbol
		do
			create Result.make_minus
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_mod_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '\\' symbol
		do
			create Result.make_mod
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '¬' symbol
		do
			create Result.make_not_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '/=' symbol
		do
			create Result.make_not_equal
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_tilde_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '/~' symbol
		do
			create Result.make_not_tilde
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_open_repeat_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '⟳' symbol
		do
			create Result.make_open_repeat
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_or_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∨' symbol
		do
			create Result.make_or_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_or_else_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '∨…' symbol
		do
			create Result.make_or_else_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_plus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '+' symbol
		do
			create Result.make_plus
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_power_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '^' symbol
		do
			create Result.make_power
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_question_mark_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_QUESTION_MARK_SYMBOL
			-- New '?' symbol
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_right_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '>>' symbol
		do
			create Result.make_right_array
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_right_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '}' symbol
		do
			create Result.make_right_brace
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_right_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ']' symbol
		do
			create Result.make_right_bracket
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_right_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New ')' symbol
		do
			create Result.make_right_parenthesis
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_semicolon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SEMICOLON_SYMBOL
			-- New ';' symbol
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_there_exists_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '∃' symbol
		do
			create Result.make_there_exists
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_tilde_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL
			-- New '~' symbol
		do
			create Result.make_tilde
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_times_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '*' symbol
		do
			create Result.make_times
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_xor_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SYMBOL_OPERATOR
			-- New '⊻' symbol
		do
			create Result.make_xor_symbol
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature -- AST leaves

	new_binary_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_BINARY_INTEGER_CONSTANT
			-- New integer constant in binary format
		do
			Result := a_scanner.last_binary_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_break (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BREAK
			-- New break
		do
			create Result.make (a_scanner.last_break)
		end

	new_c1_character_constant (a_value: CHARACTER_32; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_C1_CHARACTER_CONSTANT
			-- New character constant of the form 'A'
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_c2_character_constant (a_value: CHARACTER_8; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_C2_CHARACTER_CONSTANT
			-- New character constant of the form '%A'
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_c3_character_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_C3_CHARACTER_CONSTANT
			-- New character constant of the form '%/code/`'
		do
			Result := a_scanner.last_c3_character_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_comment (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_COMMENT
			-- New comment
		do
			create Result.make (a_scanner.last_comment)
		end

	new_free_operator (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_FREE_OPERATOR
			-- New free operator
		do
			create Result.make_prefix (a_scanner.last_utf8_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_hexadecimal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_HEXADECIMAL_INTEGER_CONSTANT
			-- New integer constant in hexadecimal format
		do
			Result := a_scanner.last_hexadecimal_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_identifier (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_IDENTIFIER
			-- New identifier
		do
			Result := a_scanner.last_identifier
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_octal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_OCTAL_INTEGER_CONSTANT
			-- New integer constant in octal format
		do
			Result := a_scanner.last_octal_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_regular_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_REGULAR_INTEGER_CONSTANT
			-- New integer constant with no underscore
		do
			Result := a_scanner.last_regular_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_regular_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_REGULAR_MANIFEST_STRING
			-- New manifest string with no special character
		do
			create Result.make (a_scanner.last_utf8_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_regular_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_REGULAR_REAL_CONSTANT
			-- New real constant with no underscore
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_special_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_SPECIAL_MANIFEST_STRING
			-- New manifest string with special characters
		do
			Result := a_scanner.last_special_manifest_string
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_underscored_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_UNDERSCORED_INTEGER_CONSTANT
			-- New integer constant with underscores
		do
			Result := a_scanner.last_underscored_integer_constant
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_underscored_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_UNDERSCORED_REAL_CONSTANT
			-- New real constant with underscores
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

	new_verbatim_string (a_marker, an_open, a_close: STRING; a_left_aligned: BOOLEAN; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_VERBATIM_STRING
			-- New verbatim string
		do
			Result := a_scanner.last_verbatim_string (a_marker, an_open, a_close, a_left_aligned)
			Result.set_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (True, a_scanner))
		end

feature -- AST nodes

	new_across_all_expression (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
			a_as: detachable ET_KEYWORD; a_item_name: detachable ET_IDENTIFIER; an_invariant: detachable ET_LOOP_INVARIANTS;
			an_until_conditional: detachable ET_CONDITIONAL; a_all_conditional: detachable ET_CONDITIONAL;
			a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_EXPRESSION
				-- New across all expression
			do
				if a_iterable_expression /= Void and a_item_name /= Void and a_all_conditional /= Void then
					create Result.make_all (a_iterable_expression, a_item_name, an_until_conditional, a_all_conditional)
					Result.set_invariant_part (an_invariant)
					Result.set_variant_part (a_variant)
					if a_across /= Void then
						Result.set_across_keyword (a_across)
					end
					if a_as /= Void then
						Result.set_as_keyword (a_as)
					end
					if an_end /= Void then
						Result.set_end_keyword (an_end)
					end
				end
			end

	new_across_instruction (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
		a_as: detachable ET_KEYWORD; a_item_name: detachable ET_IDENTIFIER;
		a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_loop_compound: detachable ET_COMPOUND;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_INSTRUCTION
			-- New across instruction
		do
			if a_iterable_expression /= Void and a_item_name /= Void then
				create Result.make (a_iterable_expression, a_item_name, a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if a_across /= Void then
					Result.set_across_keyword (a_across)
				end
				if a_as /= Void then
					Result.set_as_keyword (a_as)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_across_some_expression (a_across: detachable ET_KEYWORD; a_iterable_expression: detachable ET_EXPRESSION;
		a_as: detachable ET_KEYWORD; a_item_name: detachable ET_IDENTIFIER; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_some_conditional: detachable ET_CONDITIONAL;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_ACROSS_EXPRESSION
			-- New across some expression
		do
			if a_iterable_expression /= Void and a_item_name /= Void and a_some_conditional /= Void then
				create Result.make_some (a_iterable_expression, a_item_name, an_until_conditional, a_some_conditional)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				if a_across /= Void then
					Result.set_across_keyword (a_across)
				end
				if a_as /= Void then
					Result.set_as_keyword (a_as)
				end
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_actual_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_ACTUAL_ARGUMENT_LIST
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

	new_actual_parameter_comma (a_parameter: detachable ET_ACTUAL_PARAMETER;
		a_comma: detachable ET_SYMBOL): detachable ET_ACTUAL_PARAMETER_ITEM
			-- New actual_parameter-comma
		do
			if a_comma = Void then
				Result := a_parameter
			elseif a_parameter /= Void then
				create {ET_ACTUAL_PARAMETER_COMMA} Result.make (a_parameter, a_comma)
			end
		end

	new_actual_parameters (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_ACTUAL_PARAMETER_LIST
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

	new_agent_argument_operand_comma (an_argument: detachable ET_AGENT_ARGUMENT_OPERAND;
		a_comma: detachable ET_SYMBOL): detachable ET_AGENT_ARGUMENT_OPERAND_ITEM
			-- New agent_argument_operand-comma
		do
			if a_comma = Void then
				Result := an_argument
			elseif an_argument /= Void then
				create {ET_AGENT_ARGUMENT_OPERAND_COMMA} Result.make (an_argument, a_comma)
			end
		end

	new_agent_argument_operands (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_AGENT_ARGUMENT_OPERAND_LIST
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

	new_agent_typed_open_argument (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE;
		r: detachable ET_SYMBOL; a_question_mark: detachable ET_QUESTION_MARK_SYMBOL): detachable ET_AGENT_TYPED_OPEN_ARGUMENT
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

	new_agent_open_target (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE;
		r: detachable ET_SYMBOL): detachable ET_AGENT_OPEN_TARGET
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

	new_alias_and_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "and" feature name
		do
			if a_string /= Void then
				create Result.make_and (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_and_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∧" feature name
		do
			if a_string /= Void then
				create Result.make_and_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_and_then_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "and then" feature name
		do
			if a_string /= Void then
				create Result.make_and_then (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_and_then_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∧…" feature name
		do
			if a_string /= Void then
				create Result.make_and_then_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_bracket_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "[]" feature name
		do
			if a_string /= Void then
				create Result.make_bracket (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_div_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_div (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_divide_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_divide (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_dotdot_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias ".." feature name
		do
			if a_string /= Void then
				create Result.make_dotdot (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_free_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_FREE_NAME
			-- New alias free feature name
		do
			if a_string /= Void then
				create Result.make_infix (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_ge_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias ">=" feature name
		do
			if a_string /= Void then
				create Result.make_ge (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_gt_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias ">" feature name
		do
			if a_string /= Void then
				create Result.make_gt (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_implies_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "implies" feature name
		do
			if a_string /= Void then
				create Result.make_implies (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_implies_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "⇒" feature name
		do
			if a_string /= Void then
				create Result.make_implies_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_le_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "<=" feature name
		do
			if a_string /= Void then
				create Result.make_le (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_lt_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "<" feature name
		do
			if a_string /= Void then
				create Result.make_lt (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_minus_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "-" feature name
		do
			if a_string /= Void then
				create Result.make_minus (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_mod_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "\\" feature name
		do
			if a_string /= Void then
				create Result.make_mod (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_not_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "not" feature name
		do
			if a_string /= Void then
				create Result.make_not (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_not_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "¬" feature name
		do
			if a_string /= Void then
				create Result.make_not_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "or" feature name
		do
			if a_string /= Void then
				create Result.make_or (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∨" feature name
		do
			if a_string /= Void then
				create Result.make_or_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_else_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "or else" feature name
		do
			if a_string /= Void then
				create Result.make_or_else (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_or_else_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "∨…" feature name
		do
			if a_string /= Void then
				create Result.make_or_else_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_parenthesis_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "()" feature name
		do
			if a_string /= Void then
				create Result.make_parenthesis (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_plus_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "+" feature name
		do
			if a_string /= Void then
				create Result.make_plus (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_power_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "^" feature name
		do
			if a_string /= Void then
				create Result.make_power (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_times_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "*" feature name
		do
			if a_string /= Void then
				create Result.make_times (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_xor_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "xor" feature name
		do
			if a_string /= Void then
				create Result.make_xor (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_alias_xor_symbol_name (an_alias: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING; a_convert: detachable ET_KEYWORD): detachable ET_ALIAS_NAME
			-- New alias "⊻" feature name
		do
			if a_string /= Void then
				create Result.make_xor_symbol (a_string)
				if an_alias /= Void then
					Result.set_alias_keyword (an_alias)
				end
				if a_convert /= Void then
					Result.set_convert_keyword (a_convert)
				end
			end
		end

	new_all_export (a_clients: detachable ET_CLIENTS;
		an_all: detachable ET_KEYWORD): detachable ET_ALL_EXPORT
			-- New 'all' export clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
				if an_all /= Void then
					Result.set_all_keyword (an_all)
				end
			end
		end

	new_argument_name_comma (a_name: detachable ET_IDENTIFIER;
		a_comma: detachable ET_SYMBOL): detachable ET_ARGUMENT_NAME
			-- New argument_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_IDENTIFIER_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_assertion_semicolon (an_assertion: detachable ET_ASSERTION;
		a_semicolon: detachable ET_SYMBOL): detachable ET_ASSERTION_ITEM
			-- New assertion followed by a semicolon
		do
			if a_semicolon = Void then
				Result := an_assertion
			elseif an_assertion /= Void then
				create {ET_ASSERTION_SEMICOLON} Result.make (an_assertion, a_semicolon)
			end
		end

	new_assigner (an_assign: detachable ET_KEYWORD;
		a_feature_name: detachable ET_FEATURE_NAME): detachable ET_ASSIGNER
			-- New assigner
		local
			l_assigner: ET_ASSIGN_FEATURE_NAME
		do
			if a_feature_name /= Void then
				create l_assigner.make (a_feature_name)
				Result := l_assigner
				if an_assign /= Void then
					l_assigner.set_assign_keyword (an_assign)
				end
			end
		end

	new_assigner_instruction (a_target: detachable ET_QUALIFIED_FEATURE_CALL_EXPRESSION;
		an_assign: detachable ET_SYMBOL; a_source: detachable ET_EXPRESSION): detachable ET_ASSIGNER_INSTRUCTION
			-- New assigner instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
				if an_assign /= Void then
					Result.set_assign_symbol (an_assign)
				end
			end
		end

	new_assignment (a_target: detachable ET_WRITABLE; an_assign: detachable ET_SYMBOL;
		a_source: detachable ET_EXPRESSION): detachable ET_ASSIGNMENT
			-- New assignment instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
				if an_assign /= Void then
					Result.set_assign_symbol (an_assign)
				end
			end
		end

	new_assignment_attempt (a_target: detachable ET_WRITABLE; an_assign_attempt: detachable ET_SYMBOL;
		a_source: detachable ET_EXPRESSION): detachable ET_ASSIGNMENT_ATTEMPT
			-- New assignment-attempt instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
				if an_assign_attempt /= Void then
					Result.set_assign_attempt_symbol (an_assign_attempt)
				end
			end
		end

	new_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_type: detachable ET_DECLARED_TYPE;
		an_assigner: detachable ET_ASSIGNER;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_ATTRIBUTE
			-- New attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_clients (a_clients)
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_attribute_compound (a_attribute: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
			-- New compound preceded by a 'attribute' keyword
		do
			if a_compound /= Void then
				if a_attribute /= Void then
					a_compound.set_keyword (a_attribute)
				else
					a_compound.set_keyword (tokens.attribute_keyword)
				end
				Result := a_compound
			end
		end

	new_bang_instruction (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE;
		r: detachable ET_SYMBOL; a_target: detachable ET_WRITABLE;
		a_call: detachable ET_QUALIFIED_CALL): detachable ET_BANG_INSTRUCTION
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

	new_bracket_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_ACTUAL_ARGUMENT_LIST
			-- New bracket argument list with given capacity
		do
			create Result.make_bracketed_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_symbol (a_left)
			end
			if a_right /= Void then
				Result.set_right_symbol (a_right)
			end
		end

	new_check_instruction (a_check: detachable ET_KEYWORD; a_then_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CHECK_INSTRUCTION
			-- New check instruction with given capacity
		do
			create Result.make_with_capacity (nb)
			Result.set_then_compound (a_then_compound)
			if a_check /= Void then
				Result.set_check_keyword (a_check)
			end
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_choice_comma (a_choice: detachable ET_CHOICE; a_comma: detachable ET_SYMBOL): detachable ET_CHOICE_ITEM
			-- New choice-comma
		do
			if a_comma = Void then
				Result := a_choice
			elseif a_choice /= Void then
				create {ET_CHOICE_COMMA} Result.make (a_choice, a_comma)
			end
		end

	new_choice_list (a_when: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CHOICE_LIST
			-- New choice list with capacity `nb'
		do
			create Result.make_with_capacity (nb)
			if a_when /= Void then
				Result.set_when_keyword (a_when)
			end
		end

	new_choice_range (a_lower: detachable ET_CHOICE_CONSTANT; a_dotdot: detachable ET_SYMBOL;
		an_upper: detachable ET_CHOICE_CONSTANT): detachable ET_CHOICE_RANGE
			-- New choice range
		do
			if a_lower /= Void and an_upper /= Void then
				create Result.make (a_lower, an_upper)
				if a_dotdot /= Void then
					Result.set_dotdot (a_dotdot)
				end
			end
		end

	new_client_comma (a_name: detachable ET_CLASS_NAME; a_base_class: detachable ET_NAMED_CLASS;
		a_comma: detachable ET_SYMBOL): detachable ET_CLIENT_ITEM
			-- New client followed by a comma
		do
			if a_name /= Void and a_base_class /= Void then
				if a_comma = Void then
					create {ET_CLIENT} Result.make (a_name, a_base_class)
				else
					create {ET_CLIENT_COMMA} Result.make (a_name, a_base_class, a_comma)
				end
			end
		end

	new_clients (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_CLIENTS
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

	new_colon_type (a_colon: detachable ET_SYMBOL; a_type: detachable ET_TYPE): detachable ET_DECLARED_TYPE
			-- New colon-type
		do
			if a_colon = Void then
				Result := a_type
			elseif a_type /= Void then
				create {ET_COLON_TYPE} Result.make (a_colon, a_type)
			end
		end

	new_empty_compound: detachable ET_COMPOUND
			-- New empty instruction compound
		do
			create Result.make_with_capacity (0)
		end

	new_conditional (a_keyword: detachable ET_KEYWORD; an_expression: detachable ET_EXPRESSION): detachable ET_CONDITIONAL
			-- New conditional
		do
			if a_keyword = Void then
				Result := an_expression
			elseif an_expression /= Void then
				create {ET_KEYWORD_EXPRESSION} Result.make (a_keyword, an_expression)
			end
		end

	new_constant_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_AST_LEAF; a_constant: detachable ET_CONSTANT; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_CONSTANT_ATTRIBUTE
			-- New constant attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_constant /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_constant, a_class)
				Result.set_assigner (an_assigner)
				Result.set_clients (a_clients)
				if an_is /= Void then
					Result.set_is_keyword (an_is)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_constrained_formal_parameter (a_type_mark: detachable ET_KEYWORD; a_name: detachable ET_IDENTIFIER;
		an_arrow: detachable ET_SYMBOL; a_constraint: detachable ET_CONSTRAINT;
		a_creation: detachable ET_CONSTRAINT_CREATOR; a_class: detachable ET_CLASS): detachable ET_CONSTRAINED_FORMAL_PARAMETER
			-- New constrained formal generic parameter
		do
			if a_name /= Void and a_constraint /= Void and a_class /= Void then
				create Result.make (a_name, a_constraint, a_creation, a_class)
				if a_type_mark /= Void then
					Result.set_type_mark (a_type_mark)
				end
				if an_arrow /= Void then
					Result.set_arrow_symbol (an_arrow)
				end
			end
		end

	new_constraint_actual_parameter_comma (a_parameter: detachable ET_CONSTRAINT_ACTUAL_PARAMETER;
		a_comma: detachable ET_SYMBOL): detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
			-- New constraint_actual_parameter-comma
		do
			if a_comma = Void then
				Result := a_parameter
			elseif a_parameter /= Void then
				create {ET_CONSTRAINT_ACTUAL_PARAMETER_COMMA} Result.make (a_parameter, a_comma)
			end
		end

	new_constraint_actual_parameters (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
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

	new_constraint_creator (a_create: detachable ET_KEYWORD; an_end: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CONSTRAINT_CREATOR
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

	new_constraint_labeled_actual_parameter_semicolon (a_parameter: detachable ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL): detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM
			-- New constraint_labeled_actual_parameter-semicolon
		do
			if a_semicolon = Void then
				Result := a_parameter
			elseif a_parameter /= Void then
				create {ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER_SEMICOLON} Result.make (a_parameter, a_semicolon)
			end
		end

	new_constraint_renames (a_rename: detachable ET_KEYWORD; a_end: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CONSTRAINT_RENAME_LIST
			-- New constraint rename clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_rename /= Void then
				Result.set_rename_keyword (a_rename)
			end
			if a_end /= Void then
				Result.set_end_keyword (a_end)
			end
		end

	new_convert_feature_comma (a_convert_feature: detachable ET_CONVERT_FEATURE;
		a_comma: detachable ET_SYMBOL): detachable ET_CONVERT_FEATURE_ITEM
			-- New convert_feature-comma
		do
			if a_comma = Void then
				Result := a_convert_feature
			elseif a_convert_feature /= Void then
				create {ET_CONVERT_FEATURE_COMMA} Result.make (a_convert_feature, a_comma)
			end
		end

	new_convert_features (a_convert: detachable ET_KEYWORD; nb: INTEGER): detachable ET_CONVERT_FEATURE_LIST
			-- New convert clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_convert /= Void then
				Result.set_convert_keyword (a_convert)
			end
		end

	new_convert_from_expression (a_source: ET_EXPRESSION; a_convert_feature: ET_CONVERT_FEATURE; a_source_type, a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_FROM_EXPRESSION
			-- New conversion from expresion to convert `a_source' of type `a_source_type' to `a_target_type'
			-- using `a_convert_feature'
		local
			i, nb: INTEGER
			l_explicit: BOOLEAN
			l_conversion: TUPLE [from_class, to_class: detachable LX_DFA_WILDCARD]
			l_from_class_name: STRING
			l_to_class_name: STRING
		do
			if attached explicit_convert_class_names as l_explicit_convert_class_names then
				nb := l_explicit_convert_class_names.count
				if nb = 0 then
					l_explicit := True
				else
					l_from_class_name := a_source_type.base_class.upper_name
					l_to_class_name := a_target_type.base_class.upper_name
					from i := 1 until i > nb loop
						l_conversion := l_explicit_convert_class_names.item (i)
						if
							(not attached l_conversion.from_class as l_from_class or else l_from_class.recognizes (l_from_class_name)) and then
							(not attached l_conversion.to_class as l_to_class or else l_to_class.recognizes (l_to_class_name))
						then
							l_explicit := True
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
			if l_explicit then
				create {ET_EXPLICIT_CONVERT_FROM_EXPRESSION} Result.make (a_target_type.named_type, a_convert_feature, a_source, a_source_type.named_type)
			else
				create Result.make (a_target_type.named_type, a_convert_feature, a_source)
			end
		end

	new_convert_function (a_name: detachable ET_FEATURE_NAME; a_colon: detachable ET_SYMBOL;
		a_types: detachable ET_TYPE_LIST): detachable ET_CONVERT_FUNCTION
			-- New convert function
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
				if a_colon /= Void then
					Result.set_colon (a_colon)
				end
			end
		end

	new_convert_procedure (a_name: detachable ET_FEATURE_NAME; a_left_parenthesis: detachable ET_SYMBOL;
		a_types: detachable ET_TYPE_LIST; a_right_parenthesis: detachable ET_SYMBOL): detachable ET_CONVERT_PROCEDURE
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

	new_convert_to_expression (a_source: ET_EXPRESSION; a_convert_feature: ET_CONVERT_FEATURE; a_source_type, a_target_type: ET_TYPE_CONTEXT): ET_CONVERT_TO_EXPRESSION
			-- New conversion to expresion to convert `a_source' of type `a_source_type' to `a_target_type'
			-- using `a_convert_feature'
		local
			i, nb: INTEGER
			l_explicit: BOOLEAN
			l_conversion: TUPLE [from_class, to_class: detachable LX_DFA_WILDCARD]
			l_from_class_name: STRING
			l_to_class_name: STRING
		do
			if attached explicit_convert_class_names as l_explicit_convert_class_names then
				nb := l_explicit_convert_class_names.count
				if nb = 0 then
					l_explicit := True
				else
					l_from_class_name := a_source_type.base_class.upper_name
					l_to_class_name := a_target_type.base_class.upper_name
					from i := 1 until i > nb loop
						l_conversion := l_explicit_convert_class_names.item (i)
						if
							(not attached l_conversion.from_class as l_from_class or else l_from_class.recognizes (l_from_class_name)) and then
							(not attached l_conversion.to_class as l_to_class or else l_to_class.recognizes (l_to_class_name))
						then
							l_explicit := True
							i := nb + 1 -- Jump out of the loop.
						else
							i := i + 1
						end
					end
				end
			end
			if l_explicit then
				create {ET_EXPLICIT_CONVERT_TO_EXPRESSION} Result.make (a_source, a_convert_feature, a_source_type.named_type, a_target_type.named_type)
			else
				create Result.make (a_source, a_convert_feature)
			end
		end

	new_convert_types (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_TYPE_LIST
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

	new_create_expression (a_create: detachable ET_KEYWORD; a_region: detachable ET_CREATION_REGION; a_type: detachable ET_TARGET_TYPE;
		a_call: detachable ET_QUALIFIED_CALL): detachable ET_CREATE_EXPRESSION
			-- New create expression
		do
			if a_type /= Void then
				create Result.make (a_type, a_call)
				if a_create /= Void then
					Result.set_create_keyword (a_create)
				end
				if a_region /= Void then
					Result.set_creation_region (a_region)
				end
			end
		end

	new_create_instruction (a_create: detachable ET_KEYWORD; a_region: detachable ET_CREATION_REGION; a_type: detachable ET_TARGET_TYPE;
		a_target: detachable ET_WRITABLE; a_call: detachable ET_QUALIFIED_CALL): detachable ET_CREATE_INSTRUCTION
			-- New create instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if a_create /= Void then
					Result.set_create_keyword (a_create)
				end
				if a_region /= Void then
					Result.set_creation_region (a_region)
				end
			end
		end

	new_creator (a_create: detachable ET_KEYWORD; a_clients: detachable ET_CLIENT_LIST; nb: INTEGER): detachable ET_CREATOR
			-- New creation clause with given capacity
		do
			if a_clients /= Void then
				create Result.make_with_capacity (a_clients, nb)
				if a_create /= Void then
					Result.set_create_keyword (a_create)
				end
			end
		end

	new_current_address (d: detachable ET_SYMBOL; c: detachable ET_CURRENT): detachable ET_CURRENT_ADDRESS
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

	new_custom_attribute (a_creation: detachable ET_CREATE_EXPRESSION;
		a_settings: detachable ET_MANIFEST_TUPLE; an_end: detachable ET_KEYWORD): detachable ET_CUSTOM_ATTRIBUTE
			-- New if instruction
		do
			if a_creation /= Void then
				create Result.make (a_creation, a_settings)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_debug_compound (a_debug: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_debug_instruction (a_keys: detachable ET_MANIFEST_STRING_LIST; a_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD): detachable ET_DEBUG_INSTRUCTION
			-- New debug instruction
		do
			create Result.make (a_keys, a_compound)
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_deferred_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_deferred: detachable ET_KEYWORD;
		a_postconditions: detachable ET_POSTCONDITIONS; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_DEFERRED_FUNCTION
			-- New deferred function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_clients (a_clients)
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

	new_deferred_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_deferred: detachable ET_KEYWORD; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_DEFERRED_PROCEDURE
			-- New deferred procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_class)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_clients (a_clients)
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

	new_do_compound (a_do: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_do_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_DO_FUNCTION
			-- New do function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
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

	new_do_function_inline_agent (an_agent: detachable ET_AGENT_KEYWORD;
		a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST; a_type: detachable ET_DECLARED_TYPE;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_DO_FUNCTION_INLINE_AGENT
			-- New inline agent whose associated feature is a do function
		do
			if a_type /= Void then
				create Result.make (a_formal_args, a_type, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_do_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_DO_PROCEDURE
			-- New do procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_class)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
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

	new_do_procedure_inline_agent (an_agent: detachable ET_AGENT_KEYWORD; a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_DO_PROCEDURE_INLINE_AGENT
			-- New inline agent whose associated feature is a do procedure
		do
			create Result.make (a_formal_args, an_actual_args)
			if an_agent /= Void then
				Result.set_agent_keyword (an_agent)
			end
			Result.set_preconditions (a_preconditions)
			Result.set_locals (a_locals)
			Result.set_compound (a_compound)
			Result.set_postconditions (a_postconditions)
			Result.set_rescue_clause (a_rescue)
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_dot_feature_name (a_dot: detachable ET_SYMBOL; a_name: detachable ET_FEATURE_NAME): detachable ET_QUALIFIED_FEATURE_NAME
			-- New dot-feature_name
		do
			if a_dot = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_DOT_FEATURE_NAME} Result.make (a_dot, a_name)
			end
		end

	new_else_compound (an_else: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_elseif_expression (a_conditional: detachable ET_CONDITIONAL;
		a_then_keyword: detachable ET_KEYWORD; a_then_expression: detachable ET_EXPRESSION): detachable ET_ELSEIF_EXPRESSION
			-- New 'elseif' part of 'if' expression
		do
			if a_conditional /= Void and a_then_expression /= Void then
				create Result.make (a_conditional, a_then_expression)
				if a_then_keyword /= Void then
					Result.set_then_keyword (a_then_keyword)
				end
			end
		end

	new_exports (an_export: detachable ET_KEYWORD; nb: INTEGER): detachable ET_EXPORT_LIST
			-- New export clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_export /= Void then
				Result.set_export_keyword (an_export)
			end
		end

	new_expression_address (d: detachable ET_SYMBOL; e: detachable ET_PARENTHESIZED_EXPRESSION): detachable ET_EXPRESSION_ADDRESS
			-- New expression address
		do
			if e /= Void then
				create Result.make (e)
				if d /= Void then
					Result.set_dollar (d)
				end
			end
		end

	new_expression_comma (an_expression: detachable ET_EXPRESSION; a_comma: detachable ET_SYMBOL): detachable ET_EXPRESSION_ITEM
			-- New expression-comma
		do
			if a_comma = Void then
				Result := an_expression
			elseif an_expression /= Void then
				create {ET_EXPRESSION_COMMA} Result.make (an_expression, a_comma)
			end
		end

	new_extended_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue_clause: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_EXTENDED_ATTRIBUTE
			-- New extended attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue_clause)
				Result.set_clients (a_clients)
				Result.set_first_indexing (a_first_indexing)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
				Result.set_semicolon (a_semicolon)
				Result.set_feature_clause (a_feature_clause)
			end
		end

	new_extended_feature_name_comma (a_name: detachable ET_EXTENDED_FEATURE_NAME;
		a_comma: detachable ET_SYMBOL): detachable ET_EXTENDED_FEATURE_NAME
			-- New extended_feature_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_EXTENDED_FEATURE_NAME_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_external_alias (a_keyword: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_EXTERNAL_ALIAS
			-- New external alias
		do
			if a_keyword = Void then
				Result := a_string
			elseif a_string /= Void then
				create {ET_KEYWORD_MANIFEST_STRING} Result.make (a_keyword, a_string)
			end
		end

	new_external_function (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_type: detachable ET_DECLARED_TYPE; an_assigner: detachable ET_ASSIGNER;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_EXTERNAL_FUNCTION
			-- New external function
		do
			if a_name /= Void and a_type /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_language, a_class)
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_alias_clause (an_alias)
				Result.set_clients (a_clients)
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

	new_external_function_inline_agent (an_agent: detachable ET_AGENT_KEYWORD;
		a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST; a_type: detachable ET_DECLARED_TYPE;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD; an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_EXTERNAL_FUNCTION_INLINE_AGENT
			-- New inline agent whose associated feature is an external function
		do
			if a_type /= Void and a_language /= Void then
				create Result.make (a_formal_args, a_type, a_language, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_alias_clause (an_alias)
				Result.set_postconditions (a_postconditions)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_external_language (a_keyword: detachable ET_KEYWORD; a_string: detachable ET_MANIFEST_STRING): detachable ET_EXTERNAL_LANGUAGE
			-- New external language
		do
			if a_keyword = Void then
				Result := a_string
			elseif a_string /= Void then
				create {ET_KEYWORD_MANIFEST_STRING} Result.make (a_keyword, a_string)
			end
		end

	new_external_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_EXTERNAL_PROCEDURE
			-- New external procedure
		do
			if a_name /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_language, a_class)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_postconditions (a_postconditions)
				Result.set_alias_clause (an_alias)
				Result.set_clients (a_clients)
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

	new_external_procedure_inline_agent (an_agent: detachable ET_AGENT_KEYWORD; a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_preconditions: detachable ET_PRECONDITIONS; a_language: detachable ET_EXTERNAL_LANGUAGE;
		an_alias: detachable ET_EXTERNAL_ALIAS; a_postconditions: detachable ET_POSTCONDITIONS;
		an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_EXTERNAL_PROCEDURE_INLINE_AGENT
			-- New inline agent whose associated feature is an external procedure
		do
			if a_language /= Void then
				create Result.make (a_formal_args, a_language, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_alias_clause (an_alias)
				Result.set_postconditions (a_postconditions)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_feature_address (d: detachable ET_SYMBOL; a_name: detachable ET_FEATURE_NAME): detachable ET_FEATURE_ADDRESS
			-- New feature address
		do
			if a_name /= Void then
				create Result.make (a_name)
				if d /= Void then
					Result.set_dollar (d)
				end
			end
		end

	new_feature_clause (a_feature: detachable ET_KEYWORD; a_clients: detachable ET_CLIENT_LIST): detachable ET_FEATURE_CLAUSE
			-- New fetaure clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
				if a_feature /= Void then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_feature_name_comma (a_name: detachable ET_FEATURE_NAME; a_comma: detachable ET_SYMBOL): detachable ET_FEATURE_NAME_ITEM
			-- New feature_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_FEATURE_NAME_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_for_all_quantifier_expression (a_quantifier_symbol: detachable ET_SYMBOL;
		a_item_name: detachable ET_IDENTIFIER; a_colon_symbol: detachable ET_SYMBOL;
		a_iterable_expression: detachable ET_EXPRESSION; a_bar_symbol: detachable ET_SYMBOL;
		a_iteration_expression: detachable ET_EXPRESSION): detachable ET_QUANTIFIER_EXPRESSION
			-- New quantifier expression of the form '∀'
		do
			if a_item_name /= Void and a_iterable_expression /= Void and a_iteration_expression /= Void then
				create Result.make_for_all (a_item_name, a_iterable_expression, a_iteration_expression)
				if a_quantifier_symbol /= Void then
					Result.set_quantifier_symbol (a_quantifier_symbol)
				end
				if a_colon_symbol /= Void then
					Result.set_colon_symbol (a_colon_symbol)
				end
				if a_bar_symbol /= Void then
					Result.set_bar_symbol (a_bar_symbol)
				end
			end
		end

	new_formal_argument_semicolon (an_argument: detachable ET_FORMAL_ARGUMENT;
		a_semicolon: detachable ET_SYMBOL): detachable ET_FORMAL_ARGUMENT_ITEM
			-- New formal_argument-semicolon
		do
			if a_semicolon = Void then
				Result := an_argument
			elseif an_argument /= Void then
				create {ET_FORMAL_ARGUMENT_SEMICOLON} Result.make (an_argument, a_semicolon)
			end
		end

	new_formal_arguments (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_FORMAL_ARGUMENT_LIST
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

	new_formal_parameter_comma (a_formal: detachable ET_FORMAL_PARAMETER;
		a_comma: detachable ET_SYMBOL): detachable ET_FORMAL_PARAMETER_ITEM
			-- New formal_generic_parameter-comma
		do
			if a_comma = Void then
				Result := a_formal
			elseif a_formal /= Void then
				create {ET_FORMAL_PARAMETER_COMMA} Result.make (a_formal, a_comma)
			end
		end

	new_formal_parameters (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_FORMAL_PARAMETER_LIST
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

	new_from_compound (a_from: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_if_expression (a_conditional: detachable ET_CONDITIONAL; a_then_keyword: detachable ET_KEYWORD; a_then_expression: detachable ET_EXPRESSION;
		a_elseif_parts: detachable ET_ELSEIF_EXPRESSION_LIST; a_else_keyword: detachable ET_KEYWORD; a_else_expression: detachable ET_EXPRESSION;
		a_end_keyword: detachable ET_KEYWORD): detachable ET_IF_EXPRESSION
			-- New 'if' expression
		do
			if a_conditional /= Void and a_then_expression /= Void and a_else_expression /= Void then
				create Result.make (a_conditional, a_then_expression, a_else_expression)
				Result.set_elseif_parts (a_elseif_parts)
				if a_then_keyword /= Void then
					Result.set_then_keyword (a_then_keyword)
				end
				if a_else_keyword /= Void then
					Result.set_else_keyword (a_else_keyword)
				end
				if a_end_keyword /= Void then
					Result.set_end_keyword (a_end_keyword)
				end
			end
		end

	new_if_instruction (a_conditional: detachable ET_CONDITIONAL; a_then_compound: detachable ET_COMPOUND;
		an_elseif_parts: detachable ET_ELSEIF_PART_LIST; an_else_compound: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD): detachable ET_IF_INSTRUCTION
			-- New 'if' instruction
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

	new_indexing_semicolon (an_indexing: detachable ET_INDEXING_ITEM; a_semicolon: detachable ET_SYMBOL): detachable ET_INDEXING_ITEM
			-- New indexing-semicolon
		do
			if a_semicolon = Void then
				Result := an_indexing
			elseif an_indexing /= Void then
				create {ET_INDEXING_SEMICOLON} Result.make (an_indexing, a_semicolon)
			end
		end

	new_indexing_term_comma (a_term: detachable ET_INDEXING_TERM; a_comma: detachable ET_SYMBOL): detachable ET_INDEXING_TERM_ITEM
			-- New indexing_term-comma
		do
			if a_comma = Void then
				Result := a_term
			elseif a_term /= Void then
				create {ET_INDEXING_TERM_COMMA} Result.make (a_term, a_comma)
			end
		end

	new_infix_and_then_operator (an_and: detachable ET_KEYWORD;
		a_then: detachable ET_KEYWORD): detachable ET_INFIX_AND_THEN_OPERATOR
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

	new_infix_or_else_operator (an_or: detachable ET_KEYWORD;
		an_else: detachable ET_KEYWORD): detachable ET_INFIX_OR_ELSE_OPERATOR
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

	new_inspect_expression (a_conditional: detachable ET_CONDITIONAL; a_when_parts: detachable ET_WHEN_EXPRESSION_LIST;
		an_else_part: detachable ET_CONDITIONAL; an_end: detachable ET_KEYWORD): detachable ET_INSPECT_EXPRESSION
			-- New inspect expression
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_when_parts)
				Result.set_else_part (an_else_part)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_inspect_instruction (a_conditional: detachable ET_CONDITIONAL; a_when_parts: detachable ET_WHEN_PART_LIST;
		an_else_compound: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD): detachable ET_INSPECT_INSTRUCTION
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

	new_invariants (an_invariant: detachable ET_KEYWORD; a_class: detachable ET_CLASS; nb: INTEGER): detachable ET_INVARIANTS
			-- New class invariants with given capacity
		do
			if a_class /= Void then
				create Result.make_with_capacity (a_class, nb)
				if an_invariant /= Void then
					Result.set_invariant_keyword (an_invariant)
				end
			end
		end

	new_iteration_cursor (a_at_symbol: detachable ET_SYMBOL; a_identifier: detachable ET_IDENTIFIER): detachable ET_ITERATION_CURSOR
			-- New iteration cursor '@i' expression
		do
			if a_identifier /= Void then
				create Result.make (a_identifier)
				if a_at_symbol /= Void then
					Result.set_at_symbol (a_at_symbol)
				end
			end
		end

	new_keyword_feature_name_list (a_keyword: detachable ET_KEYWORD; nb: INTEGER): detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- New feature name list, with a given capacity, preceded by a keyword
		do
			create Result.make_with_capacity (nb)
			if a_keyword /= Void then
				Result.set_keyword (a_keyword)
			end
		end

	new_label_comma (a_label: detachable ET_IDENTIFIER; a_comma: detachable ET_SYMBOL): detachable ET_LABEL
			-- New label-comma
		do
			if a_comma = Void then
				Result := a_label
			elseif a_label /= Void then
				create {ET_IDENTIFIER_COMMA} Result.make (a_label, a_comma)
			end
		end

	new_labeled_actual_parameter_semicolon (a_parameter: detachable ET_LABELED_ACTUAL_PARAMETER;
		a_semicolon: detachable ET_SYMBOL): detachable ET_ACTUAL_PARAMETER_ITEM
			-- New labeled_actual_parameter-semicolon
		do
			if a_semicolon = Void then
				Result := a_parameter
			elseif a_parameter /= Void then
				create {ET_LABELED_ACTUAL_PARAMETER_SEMICOLON} Result.make (a_parameter, a_semicolon)
			end
		end

	new_like_current (a_type_mark: detachable ET_TYPE_MARK; a_like: detachable ET_KEYWORD;
		a_current: detachable ET_CURRENT): detachable ET_LIKE_CURRENT
			-- New 'like Current' type
		do
			create Result.make (a_type_mark)
			if a_like /= Void then
				Result.set_like_keyword (a_like)
			end
			if a_current /= Void then
				Result.set_current_keyword (a_current)
			end
		end

	new_like_feature (a_type_mark: detachable ET_TYPE_MARK; a_like: detachable ET_KEYWORD;
		a_name: detachable ET_FEATURE_NAME): detachable ET_LIKE_FEATURE
			-- New 'like name' type
		do
			if a_name /= Void then
				create Result.make (a_type_mark, a_name)
				if a_like /= Void then
					Result.set_like_keyword (a_like)
				end
			end
		end

	new_local_name_comma (a_name: detachable ET_IDENTIFIER; a_comma: detachable ET_SYMBOL): detachable ET_LOCAL_NAME
			-- New local_name-comma
		do
			if a_comma = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_IDENTIFIER_COMMA} Result.make (a_name, a_comma)
			end
		end

	new_local_variable_semicolon (a_variable: detachable ET_LOCAL_VARIABLE;
		a_semicolon: detachable ET_SYMBOL): detachable ET_LOCAL_VARIABLE_ITEM
			-- New local_variable-semicolon
		do
			if a_semicolon = Void then
				Result := a_variable
			elseif a_variable /= Void then
				create {ET_LOCAL_VARIABLE_SEMICOLON} Result.make (a_variable, a_semicolon)
			end
		end

	new_local_variables (a_local: detachable ET_KEYWORD; nb: INTEGER): detachable ET_LOCAL_VARIABLE_LIST
			-- New local variable list with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_local /= Void then
				Result.set_local_keyword (a_local)
			end
		end

	new_loop_compound (a_loop: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_loop_instruction (a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		an_until_conditional: detachable ET_CONDITIONAL; a_loop_compound: detachable ET_COMPOUND;
		a_variant: detachable ET_VARIANT; an_end: detachable ET_KEYWORD): detachable ET_LOOP_INSTRUCTION
			-- New loop instruction
		do
			if an_until_conditional /= Void then
				create Result.make (a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				Result.set_has_old_variant_syntax (False)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_loop_instruction_old_syntax (a_from_compound: detachable ET_COMPOUND; an_invariant: detachable ET_LOOP_INVARIANTS;
		a_variant: detachable ET_VARIANT; an_until_conditional: detachable ET_CONDITIONAL;
		a_loop_compound: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD): detachable ET_LOOP_INSTRUCTION
			-- New loop instruction with the old syntax where the variant
			-- clause appears after the invariant clause
		do
			if an_until_conditional /= Void then
				create Result.make (a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
				Result.set_has_old_variant_syntax (True)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_loop_invariants (an_invariant: detachable ET_KEYWORD; nb: INTEGER): detachable ET_LOOP_INVARIANTS
			-- New loop invariants with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_invariant /= Void then
				Result.set_invariant_keyword (an_invariant)
			end
		end

	new_manifest_array (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_MANIFEST_ARRAY
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

	new_manifest_string_comma (a_string: detachable ET_MANIFEST_STRING;
		a_comma: detachable ET_SYMBOL): detachable ET_MANIFEST_STRING_ITEM
			-- New manifest_string-comma
		do
			if a_comma = Void then
				Result := a_string
			elseif a_string /= Void then
				create {ET_MANIFEST_STRING_COMMA} Result.make (a_string, a_comma)
			end
		end

	new_manifest_string_list (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_MANIFEST_STRING_LIST
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

	new_manifest_tuple (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_MANIFEST_TUPLE
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

	new_manifest_type (a_left: detachable ET_SYMBOL; a_type: detachable ET_TYPE;
		a_right: detachable ET_SYMBOL): detachable ET_MANIFEST_TYPE
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

	new_named_object_test (a_attached: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_expression: detachable ET_EXPRESSION; a_as: detachable ET_KEYWORD;
		a_name: detachable ET_IDENTIFIER): detachable ET_NAMED_OBJECT_TEST
			-- New named object-test expression
		do
			if a_name /= Void and a_expression /= Void then
				create Result.make (a_type, a_expression, a_name)
				if a_attached /= Void then
					Result.set_attached_keyword (a_attached)
				end
				if a_as /= Void then
					Result.set_as_keyword (a_as)
				end
			end
		end

	new_none_clients (a_left, a_right: detachable ET_SYMBOL): detachable ET_CLIENTS
			-- Client list of the form {}
		do
			create Result.make
			if a_left /= Void then
				Result.set_left_brace (a_left)
			end
			if a_right /= Void then
				Result.set_right_brace (a_right)
			end
		end

	new_null_export (a_semicolon: detachable ET_SEMICOLON_SYMBOL): detachable ET_NULL_EXPORT
			-- New null export
		do
			Result := a_semicolon
		end

	new_null_instruction (a_semicolon: detachable ET_SEMICOLON_SYMBOL): detachable ET_NULL_INSTRUCTION
			-- New null instruction
		do
			Result := a_semicolon
		end

	new_object_test (a_attached: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_expression: detachable ET_EXPRESSION): detachable ET_OBJECT_TEST
			-- New object-test expression
		do
			if a_expression /= Void then
				create Result.make (a_type, a_expression)
				if a_attached /= Void then
					Result.set_attached_keyword (a_attached)
				end
			end
		end

	new_obsolete_message (an_obsolete: detachable ET_KEYWORD;
		a_message: detachable ET_MANIFEST_STRING): detachable ET_OBSOLETE
			-- New obsolete clause
		do
			if an_obsolete = Void then
				Result := a_message
			elseif a_message /= Void then
				create {ET_KEYWORD_MANIFEST_STRING} Result.make (an_obsolete, a_message)
			end
		end

	new_old_expression (an_old: detachable ET_KEYWORD; e: detachable ET_EXPRESSION): detachable ET_OLD_EXPRESSION
			-- New old expression
		do
			if e /= Void then
				create Result.make (e)
				if an_old /= Void then
					Result.set_old_keyword (an_old)
				end
			end
		end

	new_old_object_test (a_left_brace: detachable ET_SYMBOL; a_name: detachable ET_IDENTIFIER;
		a_colon: detachable ET_SYMBOL; a_type: detachable ET_TYPE; a_right_brace: detachable ET_SYMBOL;
		a_expression: detachable ET_EXPRESSION): detachable ET_OLD_OBJECT_TEST
			-- New object-test expression
		do
			if a_name /= Void and a_type /= Void and a_expression /= Void then
				create Result.make (a_name, a_type, a_expression)
				if a_left_brace /= Void then
					Result.set_left_brace (a_left_brace)
				end
				if a_colon /= Void then
					Result.set_colon (a_colon)
				end
				if a_right_brace /= Void then
					Result.set_right_brace (a_right_brace)
				end
			end
		end

	new_once_compound (a_once: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_once_function (a_name: detachable ET_EXTENDED_FEATURE_NAME;
		args: detachable ET_FORMAL_ARGUMENT_LIST; a_type: detachable ET_DECLARED_TYPE;
		an_assigner: detachable ET_ASSIGNER; an_is: detachable ET_KEYWORD;
		a_first_indexing: detachable ET_INDEXING_LIST; an_obsolete: detachable ET_OBSOLETE;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE; a_class: detachable ET_CLASS): detachable ET_ONCE_FUNCTION
			-- New once function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_keys (a_keys)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
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

	new_once_function_inline_agent (an_agent: detachable ET_AGENT_KEYWORD;
		a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST; a_type: detachable ET_DECLARED_TYPE;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_ONCE_FUNCTION_INLINE_AGENT
			-- New inline agent whose associated feature is a once function
		do
			if a_type /= Void then
				create Result.make (a_formal_args, a_type, an_actual_args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_keys (a_keys)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_once_manifest_string (a_once: detachable ET_KEYWORD;
		a_string: detachable ET_MANIFEST_STRING): detachable ET_ONCE_MANIFEST_STRING
			-- New once manifest string
		do
			if a_string /= Void then
				create Result.make (a_string)
				if a_once /= Void then
					Result.set_once_keyword (a_once)
				end
			end
		end

	new_once_procedure (a_name: detachable ET_EXTENDED_FEATURE_NAME; args: detachable ET_FORMAL_ARGUMENT_LIST;
		an_is: detachable ET_KEYWORD; a_first_indexing: detachable ET_INDEXING_LIST;
		an_obsolete: detachable ET_OBSOLETE; a_preconditions: detachable ET_PRECONDITIONS;
		a_locals: detachable ET_LOCAL_VARIABLE_LIST; a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND;
		a_postconditions: detachable ET_POSTCONDITIONS; a_rescue: detachable ET_COMPOUND;
		an_end: detachable ET_KEYWORD;
		a_semicolon: detachable ET_SEMICOLON_SYMBOL; a_clients: detachable ET_CLIENT_LIST;
		a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_ONCE_PROCEDURE
			-- New once procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_class)
				Result.set_obsolete_message (an_obsolete)
				Result.set_preconditions (a_preconditions)
				Result.set_locals (a_locals)
				Result.set_keys (a_keys)
				Result.set_compound (a_compound)
				Result.set_postconditions (a_postconditions)
				Result.set_rescue_clause (a_rescue)
				Result.set_clients (a_clients)
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

	new_once_procedure_inline_agent (an_agent: detachable ET_AGENT_KEYWORD; a_formal_args: detachable ET_FORMAL_ARGUMENT_LIST;
		a_preconditions: detachable ET_PRECONDITIONS; a_locals: detachable ET_LOCAL_VARIABLE_LIST;
		a_keys: detachable ET_MANIFEST_STRING_LIST;
		a_compound: detachable ET_COMPOUND; a_postconditions: detachable ET_POSTCONDITIONS;
		a_rescue: detachable ET_COMPOUND; an_end: detachable ET_KEYWORD;
		an_actual_args: detachable ET_AGENT_ARGUMENT_OPERAND_LIST): detachable ET_ONCE_PROCEDURE_INLINE_AGENT
			-- New inline agent whose assicated feature is a once procedure
		do
			create Result.make (a_formal_args, an_actual_args)
			if an_agent /= Void then
				Result.set_agent_keyword (an_agent)
			end
			Result.set_preconditions (a_preconditions)
			Result.set_locals (a_locals)
			Result.set_keys (a_keys)
			Result.set_compound (a_compound)
			Result.set_postconditions (a_postconditions)
			Result.set_rescue_clause (a_rescue)
			if an_end /= Void then
				Result.set_end_keyword (an_end)
			end
		end

	new_parent (a_type: detachable ET_CLASS_TYPE; a_renames: detachable ET_RENAME_LIST;
		an_exports: detachable ET_EXPORT_LIST;
		an_undefines, a_redefines, a_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST;
		an_end: detachable ET_KEYWORD): detachable ET_PARENT
			-- New parent
		do
			if a_type /= Void then
				create Result.make (a_type, a_renames, an_exports, an_undefines, a_redefines, a_selects)
				if an_end /= Void then
					Result.set_end_keyword (an_end)
				end
			end
		end

	new_parent_semicolon (a_parent: detachable ET_PARENT; a_semicolon: detachable ET_SYMBOL): detachable ET_PARENT_ITEM
			-- New parent-semicolon
		do
			if a_semicolon = Void then
				Result := a_parent
			elseif a_parent /= Void then
				create {ET_PARENT_SEMICOLON} Result.make (a_parent, a_semicolon)
			end
		end

	new_parents (an_inherit: detachable ET_KEYWORD; nb: INTEGER): detachable ET_PARENT_LIST
			-- New class parent list with given capacity
		do
			create Result.make_with_capacity (nb)
			if an_inherit /= Void then
				Result.set_inherit_keyword (an_inherit)
			end
		end

	new_parenthesized_expression (l: detachable ET_SYMBOL; e: detachable ET_EXPRESSION;
		r: detachable ET_SYMBOL): detachable ET_PARENTHESIZED_EXPRESSION
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

	new_postconditions (an_ensure: detachable ET_KEYWORD;
		a_then: detachable ET_KEYWORD; nb: INTEGER): detachable ET_POSTCONDITIONS
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

	new_preconditions (a_require: detachable ET_KEYWORD;
		an_else: detachable ET_KEYWORD; nb: INTEGER): detachable ET_PRECONDITIONS
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

	new_precursor_class_name (l: detachable ET_SYMBOL; a_name: detachable ET_CLASS_NAME;
		r: detachable ET_SYMBOL): detachable ET_PRECURSOR_CLASS_NAME
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

	new_precursor_expression (is_parent_prefixed: BOOLEAN;
		a_precursor: detachable ET_PRECURSOR_KEYWORD;
		a_parent: detachable ET_PRECURSOR_CLASS_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_PRECURSOR_EXPRESSION
			-- New precursor expression
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_precursor_instruction (is_parent_prefixed: BOOLEAN; a_precursor: detachable ET_PRECURSOR_KEYWORD;
		a_parent: detachable ET_PRECURSOR_CLASS_NAME;
		args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_PRECURSOR_INSTRUCTION
			-- New precursor instruction
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_qualified_like_braced_type (a_type_mark: detachable ET_TYPE_MARK;
		a_like: detachable ET_KEYWORD; a_left_brace: detachable ET_SYMBOL;
		a_type: detachable ET_TYPE; a_right_brace: detachable ET_SYMBOL;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME;
		a_class: detachable ET_CLASS): detachable ET_QUALIFIED_LIKE_BRACED_TYPE
			-- New qualified anchored type of the form 'like {A}.b'
		do
			if a_type /= Void and a_name /= Void and a_class /= Void then
				create Result.make (a_type_mark, a_type, a_name, a_class)
				if a_like /= Void then
					Result.set_like_keyword (a_like)
				end
				if a_left_brace /= Void then
					Result.set_left_brace (a_left_brace)
				end
				if a_right_brace /= Void then
					Result.set_right_brace (a_right_brace)
				end
			end
		end

	new_rename (old_name: detachable ET_FEATURE_NAME; an_as: detachable ET_KEYWORD;
		new_name: detachable ET_EXTENDED_FEATURE_NAME): detachable ET_RENAME
			-- New rename pair
		do
			if old_name /= Void and new_name /= Void then
				create Result.make (old_name, new_name)
				if an_as /= Void then
					Result.set_as_keyword (an_as)
				end
			end
		end

	new_rename_comma (old_name: detachable ET_FEATURE_NAME; an_as: detachable ET_KEYWORD;
		new_name: detachable ET_EXTENDED_FEATURE_NAME; a_comma: detachable ET_SYMBOL): detachable ET_RENAME_ITEM
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

	new_renames (a_rename: detachable ET_KEYWORD; nb: INTEGER): detachable ET_RENAME_LIST
			-- New rename clause with given capacity
		do
			create Result.make_with_capacity (nb)
			if a_rename /= Void then
				Result.set_rename_keyword (a_rename)
			end
		end

	new_repeat_instruction (a_open_repeat_symbol: detachable ET_SYMBOL;
		a_item_name: detachable ET_IDENTIFIER; a_colon_symbol: detachable ET_SYMBOL;
		a_iterable_expression: detachable ET_EXPRESSION;
		a_bar_symbol: detachable ET_SYMBOL; a_loop_compound: detachable ET_COMPOUND;
		a_close_repeat_symbol: detachable ET_SYMBOL): detachable ET_REPEAT_INSTRUCTION
			-- New repeat instruction of the form '⟳ ... ⟲'
		do
			if a_item_name /= Void and a_iterable_expression /= Void then
				create Result.make (a_item_name, a_iterable_expression, a_loop_compound)
				if a_open_repeat_symbol /= Void then
					Result.set_open_repeat_symbol (a_open_repeat_symbol)
				end
				if a_colon_symbol /= Void then
					Result.set_colon_symbol (a_colon_symbol)
				end
				if a_bar_symbol /= Void then
					Result.set_bar_symbol (a_bar_symbol)
				end
				if a_close_repeat_symbol /= Void then
					Result.set_close_repeat_symbol (a_close_repeat_symbol)
				end
			end
		end

	new_rescue_compound (a_rescue: detachable ET_KEYWORD;
		a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_result_address (d: detachable ET_SYMBOL; r: detachable ET_RESULT): detachable ET_RESULT_ADDRESS
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

	new_static_call_expression (a_feature: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_STATIC_CALL_EXPRESSION
			-- New static call expression
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_static_call_instruction (a_feature: detachable ET_KEYWORD; a_type: detachable ET_TARGET_TYPE;
		a_name: detachable ET_QUALIFIED_FEATURE_NAME; args: detachable ET_ACTUAL_ARGUMENT_LIST): detachable ET_STATIC_CALL_INSTRUCTION
			-- New static call instruction
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_strip_expression (a_strip: detachable ET_KEYWORD; l, r: detachable ET_SYMBOL; nb: INTEGER): detachable ET_STRIP_EXPRESSION
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

	new_tag (a_name: detachable ET_IDENTIFIER; a_colon: detachable ET_SYMBOL): detachable ET_TAG
			-- New tag
		do
			if a_colon = Void then
				Result := a_name
			elseif a_name /= Void then
				create {ET_IDENTIFIER_COLON} Result.make (a_name, a_colon)
			end
		end

	new_target_type (l: detachable ET_SYMBOL; a_type: detachable ET_TYPE; r: detachable ET_SYMBOL): detachable ET_TARGET_TYPE
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

	new_then_compound (a_then: detachable ET_KEYWORD; a_compound: detachable ET_COMPOUND): detachable ET_COMPOUND
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

	new_there_exists_quantifier_expression (a_quantifier_symbol: detachable ET_SYMBOL;
		a_item_name: detachable ET_IDENTIFIER; a_colon_symbol: detachable ET_SYMBOL;
		a_iterable_expression: detachable ET_EXPRESSION; a_bar_symbol: detachable ET_SYMBOL;
		a_iteration_expression: detachable ET_EXPRESSION): detachable ET_QUANTIFIER_EXPRESSION
			-- New quantifier expression of the form '∃'
		do
			if a_item_name /= Void and a_iterable_expression /= Void and a_iteration_expression /= Void then
				create Result.make_there_exists (a_item_name, a_iterable_expression, a_iteration_expression)
				if a_quantifier_symbol /= Void then
					Result.set_quantifier_symbol (a_quantifier_symbol)
				end
				if a_colon_symbol /= Void then
					Result.set_colon_symbol (a_colon_symbol)
				end
				if a_bar_symbol /= Void then
					Result.set_bar_symbol (a_bar_symbol)
				end
			end
		end

	new_type_comma (a_type: detachable ET_TYPE; a_comma: detachable ET_SYMBOL): detachable ET_TYPE_ITEM
			-- New type-comma
		do
			if a_comma = Void then
				Result := a_type
			elseif a_type /= Void then
				create {ET_TYPE_COMMA} Result.make (a_type, a_comma)
			end
		end

	new_type_constraint_comma (a_type_constraint: detachable ET_TYPE_CONSTRAINT; a_comma: detachable ET_SYMBOL): detachable ET_TYPE_CONSTRAINT_ITEM
			-- New type_constraint-comma
		do
			if a_comma = Void then
				Result := a_type_constraint
			elseif a_type_constraint /= Void then
				create {ET_TYPE_CONSTRAINT_COMMA} Result.make (a_type_constraint, a_comma)
			end
		end

	new_type_constraint_list (a_left, a_right: detachable ET_SYMBOL; nb: INTEGER): detachable ET_TYPE_CONSTRAINT_LIST
			-- New type constraint list with capacity `nb'
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void then
				Result.set_left_brace (a_left)
			end
			if a_right /= Void then
				Result.set_right_brace (a_right)
			end
		end

	new_unique_attribute (a_name: detachable ET_EXTENDED_FEATURE_NAME; a_type: detachable ET_DECLARED_TYPE;
		an_assigner: detachable ET_ASSIGNER; an_is: detachable ET_AST_LEAF;
		a_unique: detachable ET_KEYWORD; a_semicolon: detachable ET_SEMICOLON_SYMBOL;
		a_clients: detachable ET_CLIENT_LIST; a_feature_clause: detachable ET_FEATURE_CLAUSE;
		a_class: detachable ET_CLASS): detachable ET_UNIQUE_ATTRIBUTE
			-- New unique attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, a_class)
				Result.set_assigner (an_assigner)
				Result.set_clients (a_clients)
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

	new_variant (a_variant: detachable ET_KEYWORD; a_tag: detachable ET_TAG;
		an_expression: detachable ET_EXPRESSION): detachable ET_VARIANT
			-- New loop variant
		do
			if an_expression /= Void then
				create Result.make (a_tag, an_expression)
				if a_variant /= Void then
					Result.set_variant_keyword (a_variant)
				end
			end
		end

	new_when_expression (a_choices: detachable ET_CHOICE_LIST;
		a_then_keyword: detachable ET_KEYWORD; a_then_expression: detachable ET_EXPRESSION): detachable ET_WHEN_EXPRESSION
			-- New 'elseif' part of 'if' expression
		do
			if a_choices /= Void and a_then_expression /= Void then
				create Result.make (a_choices, a_then_expression)
				if a_then_keyword /= Void then
					Result.set_then_keyword (a_then_keyword)
				end
			end
		end

feature {NONE} -- Implementation

	last_break (is_header: BOOLEAN; a_scanner: ET_EIFFEL_SCANNER_SKELETON): detachable ET_BREAK
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

invariant

	explicit_convert_class_names_regexps_compiled: attached explicit_convert_class_names as l_explicit_convert_class_names implies
		across l_explicit_convert_class_names as i_conversion all
			(attached i_conversion.from_class as l_from_class implies l_from_class.is_compiled) and
			(attached i_conversion.from_class as l_to_class implies l_to_class.is_compiled) end

end
