note

	description:

		"Eiffel parser skeletons, fault tolerant"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_FAULT_TOLERANT_EIFFEL_PARSER

inherit

	ET_EIFFEL_PARSER_SKELETON
		rename
			make as make_parser_skeleton,
			read_token as yy_read_token
		redefine
			reset,
			set_syntax_error,
			report_syntax_error,
			system_processor
		end

	ET_EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner,
			read_token as yy_read_token
		undefine
			reset, set_syntax_error,
			report_syntax_error
		redefine
			system_processor
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_processor: like system_processor)
			-- Create a new Eiffel parser.
		require
			a_system_processor_not_void: a_system_processor /= Void
		do
			make_fault_tolerant_parser_skeleton
			make_parser_skeleton (a_system_processor)
		end

	make_fault_tolerant_parser_skeleton
			-- Create a new fault-tolerant parser skeleton.
		do
			create last_note_items.make (Initial_last_note_items_capacity)
			create last_note_term_items.make (Initial_last_note_term_items_capacity)
			create last_actual_parameter_items.make (Initial_last_actual_parameter_items_capacity)
			create last_formal_parameter_items.make (Initial_last_formal_parameter_items_capacity)
			create last_constraint_actual_parameter_items.make (Initial_last_constraint_actual_parameter_items_capacity)
			create last_type_constraint_items.make (Initial_last_type_constraint_items_capacity)
			create last_labels.make (Initial_last_labels_capacity)
			create last_feature_name_items.make (Initial_last_feature_name_items_capacity)
			create last_alias_name_items.make (Initial_last_alias_name_items_capacity)
			create last_extended_feature_name_items.make (Initial_last_extended_feature_name_items_capacity)
			create last_extended_feature_name_frozen_items.make (Initial_last_extended_feature_name_items_capacity)
			create last_parent_clause_items.make (Initial_last_parent_clause_items_capacity)
			create last_parent_items.make (Initial_last_parent_items_capacity)
			create last_rename_items.make (Initial_last_rename_items_capacity)
			create last_client_items.make (Initial_last_client_items_capacity)
			create last_export_items.make (Initial_last_export_items_capacity)
			create last_creator_items.make (Initial_last_creator_items_capacity)
			create last_type_items.make (Initial_last_type_items_capacity)
			create last_convert_feature_items.make (Initial_last_convert_feature_items_capacity)
			create last_feature_clause_items.make (Initial_last_feature_clause_items_capacity)
			create last_formal_argument_items.make (Initial_last_formal_argument_items_capacity)
			create last_local_variable_items.make (Initial_last_local_variable_items_capacity)
			create last_expression_items.make (Initial_last_expression_items_capacity)
			create last_agent_actual_argument_items.make (Initial_last_agent_actual_argument_items_capacity)
			create last_elseif_expression_items.make (Initial_last_elseif_expression_items_capacity)
			create last_when_expression_items.make (Initial_last_when_expression_items_capacity)
			create last_choice_items.make (Initial_last_choice_items_capacity)
			create last_manifest_string_items.make (Initial_last_manifest_string_items_capacity)
			create last_instruction_items.make (Initial_last_instruction_items_capacity)
			create last_elseif_part_items.make (Initial_last_elseif_part_items_capacity)
			create last_when_part_items.make (Initial_last_when_part_items_capacity)
			create last_inline_separate_argument_items.make (Initial_last_inline_separate_argument_items_capacity)
			create last_tokens.make (Initial_last_tokens_capacity)
			create last_detachable_any_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_keyword_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_agent_keyword_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_invariant_keyword_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_precursor_keyword_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_symbol_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_position_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_boolean_constant_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_break_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_character_constant_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_current_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_free_operator_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_identifier_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_integer_constant_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_keyword_operator_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_manifest_string_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_real_constant_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_result_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_retry_instruction_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_symbol_operator_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_void_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_semicolon_symbol_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_bracket_symbol_values.make (Initial_last_tokens_capacity)
			create last_detachable_et_question_mark_symbol_values.make (Initial_last_tokens_capacity)
		end

	reset_fault_tolerant_parser_skeleton
			-- Reset fault-tolerant parser skeleton.
		do
			is_parsing_stopped := False
			is_error_recovering := False
			internal_has_syntax_error := False
			last_note_items.wipe_out
			last_note_term_items.wipe_out
			last_actual_parameter_items.wipe_out
			last_constraint_actual_parameter_items.wipe_out
			last_formal_parameter_items.wipe_out
			last_type_constraint_items.wipe_out
			last_labels.wipe_out
			last_feature_name_items.wipe_out
			last_alias_name_items.wipe_out
			last_extended_feature_name_items.wipe_out
			last_extended_feature_name_frozen_items.wipe_out
			last_parent_clause_items.wipe_out
			last_parent_items.wipe_out
			last_rename_items.wipe_out
			last_client_items.wipe_out
			last_export_items.wipe_out
			last_creator_items.wipe_out
			last_type_items.wipe_out
			last_convert_feature_items.wipe_out
			last_feature_clause_items.wipe_out
			last_formal_argument_items.wipe_out
			last_local_variable_items.wipe_out
			last_expression_items.wipe_out
			last_agent_actual_argument_items.wipe_out
			last_elseif_expression_items.wipe_out
			last_when_expression_items.wipe_out
			last_choice_items.wipe_out
			last_manifest_string_items.wipe_out
			last_instruction_items.wipe_out
			last_elseif_part_items.wipe_out
			last_when_part_items.wipe_out
			last_inline_separate_argument_items.wipe_out
			last_notes := Void
			last_type := Void
			last_actual_parameters := Void
			last_formal_parameters := Void
			last_formal_parameter := Void
			last_constraint := Void
			last_type_constraint := Void
			last_constraint_type := Void
			last_constraint_actual_parameters := Void
			last_constraint_renames := Void
			last_constraint_creator := Void
			last_obsolete := Void
			last_parent_clauses := Void
			last_parents := Void
			last_parent := Void
			last_renames := Void
			last_export := Void
			last_exports := Void
			last_undefines := Void
			last_redefines := Void
			last_selects := Void
			last_creators := Void
			last_creator := Void
			last_converts := Void
			last_convert_types := Void
			last_feature_clauses := Void
			last_expression := Void
			last_parenthesized_expression := Void
			last_choice_constant := Void
			last_choice := Void
			last_choices := Void
			last_attribute_constant := Void
			last_create_expression := Void
			last_manifest_array := Void
			last_manifest_tuple := Void
			last_actual_arguments := Void
			last_agent_open_operand := Void
			last_agent_actual_arguments := Void
			last_keys := Void
			last_preconditions := Void
			last_postconditions := Void
			last_invariants := Void
			last_variant := Void
			last_loop_invariants := Void
			last_feature_name_identifier := Void
			last_class_name_identifier := Void
			last_cursor_name_identifier := Void
			last_object_test_local_identifier := Void
			last_inline_separate_argument_name_identifier := Void
			last_instruction := Void
			last_compound := Void
			last_feature_name := Void
			last_extended_feature_name := Void
			last_semicolon := Void
			last_is_dot_call_target := False
			last_is_bracket_call_target := False
			last_tokens.wipe_out
			last_detachable_any_values.wipe_out
			last_detachable_et_keyword_values.wipe_out
			last_detachable_et_agent_keyword_values.wipe_out
			last_detachable_et_invariant_keyword_values.wipe_out
			last_detachable_et_precursor_keyword_values.wipe_out
			last_detachable_et_symbol_values.wipe_out
			last_detachable_et_position_values.wipe_out
			last_detachable_et_boolean_constant_values.wipe_out
			last_detachable_et_break_values.wipe_out
			last_detachable_et_character_constant_values.wipe_out
			last_detachable_et_current_values.wipe_out
			last_detachable_et_free_operator_values.wipe_out
			last_detachable_et_identifier_values.wipe_out
			last_detachable_et_integer_constant_values.wipe_out
			last_detachable_et_keyword_operator_values.wipe_out
			last_detachable_et_manifest_string_values.wipe_out
			last_detachable_et_real_constant_values.wipe_out
			last_detachable_et_result_values.wipe_out
			last_detachable_et_retry_instruction_values.wipe_out
			last_detachable_et_symbol_operator_values.wipe_out
			last_detachable_et_void_values.wipe_out
			last_detachable_et_semicolon_symbol_values.wipe_out
			last_detachable_et_bracket_symbol_values.wipe_out
			last_detachable_et_question_mark_symbol_values.wipe_out
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			precursor {ET_EIFFEL_PARSER_SKELETON}
			reset_fault_tolerant_parser_skeleton
		end

feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature {NONE} -- Parsing

	parse_from_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse all classes in `a_file'.
		do
			eiffel_buffer.set_file (a_file)
			yy_load_input_buffer
			parse_buffer
		end

	parse_from_class_text (a_class_text: STRING_8)
			-- Parse all classes in `a_class_text'.
		do
			eiffel_buffer.set_utf8_string (a_class_text)
			yy_load_input_buffer
			parse_buffer
		end

	parse_buffer
			-- Parse the content of `input_buffer'.
		do
			read_token
			parse_class
			from until
				is_parsing_stopped or last_token <= 0
			loop
				if not system_processor.preparse_multiple_mode then
						-- Raise syntax error: it is not valid to have more
						-- than one class text in the same file.
					report_syntax_error (last_position, last_value, end_of_file_expected)
					stop_parsing
				else
					parse_class
				end
			end
		end

	parse_class
			-- Parse a class.
			-- Make the result available in `last_class'.
		local
			l_leading_break: detachable ET_BREAK
			l_first_note_clause: detachable ET_NOTE_LIST
			l_last_note_clause: detachable ET_NOTE_LIST
			l_obsolete: detachable ET_OBSOLETE
			l_parent_clauses: detachable ET_PARENT_CLAUSE_LIST
			l_creators: detachable ET_CREATOR_LIST
			l_converts: detachable ET_CONVERT_FEATURE_LIST
			l_feature_clauses: detachable ET_FEATURE_CLAUSE_LIST
			l_invariants: detachable ET_INVARIANTS
			l_end_keyword: detachable ET_KEYWORD
		do
			if last_token = E_BREAK then
				l_leading_break := last_detachable_et_break_value
				read_token
			end
			parse_optional_note_clause (True)
			l_first_note_clause := last_notes
			parse_class_header
			if not is_parsing_stopped then
				if attached last_class as l_last_class then
					l_last_class.set_leading_break (l_leading_break)
					l_last_class.set_first_note_clause (l_first_note_clause)
				end
				parse_optional_formal_parameters
				set_formal_parameters (last_formal_parameters)
				parse_optional_obsolete
				l_obsolete := last_obsolete
				parse_optional_parent_clauses
				l_parent_clauses := last_parent_clauses
				parse_optional_creators
				l_creators := last_creators
				parse_optional_converts
				l_converts := last_converts
				parse_optional_feature_clauses
				l_feature_clauses := last_feature_clauses
				set_class_features
				parse_optional_invariants
				l_invariants := last_invariants
				parse_optional_note_clause (True)
				l_last_note_clause := last_notes
				synchronize_token (end_expected_tokens, end_keyword_expected, True)
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				end
				set_class_to_end (last_class, l_obsolete, l_parent_clauses, l_creators, l_converts, l_feature_clauses, l_invariants, l_last_note_clause, l_end_keyword)
				set_class_providers
			end
		end

	parse_optional_note_clause (a_indexing_allowed: BOOLEAN)
			-- Parse an optional note clause.
			-- Make the result available in `last_note_clause'.
			-- `a_indexing_allowed' indicates whether the obsolete
			-- 'indexing' keyword is allowed.
		local
			l_note_keyword: detachable ET_KEYWORD
			l_is_note: BOOLEAN
			l_done: BOOLEAN
			l_tag: detachable ET_TAG
			l_has_tag: BOOLEAN
			l_identifier: detachable ET_IDENTIFIER
			l_first_semicolon: detachable ET_SEMICOLON_SYMBOL
			nb: INTEGER
			l_note: detachable ET_NOTE
			l_note_term: detachable ET_NOTE_TERM
			l_is_identifier: BOOLEAN
			l_note_term_expected: BOOLEAN
			l_notes: detachable ET_NOTE_LIST
			l_note_terms: detachable ET_NOTE_TERM_LIST
			l_old_is_error_recovering: BOOLEAN
			l_old_last_note_items_count: INTEGER
			l_old_last_note_term_items_count: INTEGER
			l_create_expression: detachable ET_CREATE_EXPRESSION
			l_settings: detachable ET_MANIFEST_TUPLE
		do
			last_notes := Void
			if last_token = E_NOTE or last_token = E_INDEXING then
				l_note_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = E_NOTE then
					l_is_note := True
				elseif not a_indexing_allowed then
					l_old_is_error_recovering := is_error_recovering
					report_syntax_error (last_position, l_note_keyword, note_keyword_expected)
					is_error_recovering := l_old_is_error_recovering
				end
				if last_token = Semicolon_code then
					parse_optional_semicolon
					l_first_semicolon := ast_factory.new_first_semicolon (last_semicolon)
				end
				l_old_last_note_items_count := last_note_items.count
				l_old_last_note_term_items_count := last_note_term_items.count
				from until l_done loop
					l_is_identifier := False
					l_note_term := Void
					inspect last_token
					when E_IDENTIFIER, E_NONE, E_TUPLE then
						l_identifier := last_detachable_et_identifier_value
						l_is_identifier := True
						l_note_term := l_identifier
						read_token
					when E_TRUE, E_FALSE then
						l_note_term := last_detachable_et_boolean_constant_value
						read_token
					when E_CHARACTER then
						l_note_term := last_detachable_et_character_constant_value
						read_token
					when E_INTEGER then
						l_note_term := last_detachable_et_integer_constant_value
						read_token
					when E_REAL then
						l_note_term := last_detachable_et_real_constant_value
						read_token
					when Plus_code, Minus_code then
						parse_attribute_constant
						if attached {ET_NOTE_TERM} last_attribute_constant as l_attribute_constant then
							l_note_term := l_attribute_constant
						end
					when Left_brace_code then
						parse_attribute_constant
						if attached {ET_NOTE_TERM} last_attribute_constant as l_attribute_constant then
							l_note_term := l_attribute_constant
						end
					when E_CREATE then
						parse_create_expression
						l_create_expression := last_create_expression
						if last_token = Left_bracket_code then
							parse_manifest_tuple
							l_settings := last_manifest_tuple
						end
						if last_token = E_END then
							l_note_term := ast_factory.new_custom_attribute (l_create_expression, l_settings, last_detachable_et_keyword_value)
							read_token
						else
							report_syntax_error (last_position, last_value, end_keyword_expected)
						end
					else
						if is_string_token (last_token) then
							l_note_term := last_detachable_et_manifest_string_value
							read_token
						else
							l_done := True
						end
					end
					if l_done then
						if l_note_term_expected then
							report_syntax_error (last_position, last_value, note_term_expected)
						end
					elseif not l_note_term_expected and then l_is_identifier and then last_token = Colon_code then
						l_tag := ast_factory.new_tag (l_identifier, last_detachable_et_symbol_value)
						l_has_tag := True
						l_note_term_expected := True
						read_token
					else
						if not l_note_term_expected and l_is_note then
							report_syntax_error (last_position, l_note_term, note_tag_expected)
						end
						l_note_term_expected := False
						if last_token = Comma_code then
							last_note_term_items.force (ast_factory.new_note_term_comma (l_note_term, last_detachable_et_symbol_value))
							l_note_term_expected := True
							read_token
						elseif last_token = Colon_code then
							report_syntax_error (last_position, last_detachable_et_symbol_value, comma_symbol_expected)
							read_token
							last_note_term_items.force (l_note_term)
						else
							last_note_term_items.force (l_note_term)
							nb := (last_note_term_items.count - l_old_last_note_term_items_count).max (0)
							l_note_terms := ast_factory.new_note_terms (nb)
							from until last_note_term_items.is_empty loop
								if l_note_terms /= Void and attached last_note_term_items.item as l_last_note_term then
									l_note_terms.put_first (l_last_note_term)
								end
								last_note_term_items.remove
							end
							if l_has_tag then
								l_note := ast_factory.new_tagged_note (l_tag, l_note_terms)
							else
								l_note := ast_factory.new_note (l_note_terms)
							end
							if last_token = Semicolon_code then
								parse_optional_semicolon
								last_note_items.force (ast_factory.new_note_semicolon (l_note, last_semicolon))
							else
								last_note_items.force (l_note)
							end
							l_has_tag := False
							l_note_term_expected := False
						end
					end
				end
				nb := last_note_term_items.count - l_old_last_note_term_items_count
				if nb > 0 then
					l_note_terms := ast_factory.new_note_terms (nb)
					from until last_note_term_items.is_empty loop
						if l_note_terms /= Void and attached last_note_term_items.item as l_last_note_term then
							l_note_terms.put_first (l_last_note_term)
						end
						last_note_term_items.remove
					end
					if l_has_tag then
						l_note := ast_factory.new_tagged_note (l_tag, l_note_terms)
					else
						l_note := ast_factory.new_note (l_note_terms)
					end
					last_note_items.force (l_note)
				end
				nb := (last_note_items.count - l_old_last_note_items_count).max (0)
				l_notes := ast_factory.new_notes (l_note_keyword, nb)
				from until last_note_items.is_empty loop
					if l_notes /= Void and attached last_note_items.item as l_last_note then
						l_notes.put_first (l_last_note)
					end
					last_note_items.remove
				end
				if l_notes /= Void then
					l_notes.set_first_semicolon (l_first_semicolon)
				end
			end
			last_notes := l_notes
		end

	parse_class_header
			-- Parse class header.
			-- Make the result available in `last_class'.
		local
			l_frozen_keyword: detachable ET_KEYWORD
			l_deferred_keyword: detachable ET_KEYWORD
			l_expanded_keyword: detachable ET_KEYWORD
			l_separate_keyword: detachable ET_KEYWORD
			l_external_keyword: detachable ET_KEYWORD
			l_class_keyword: detachable ET_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
		do
			last_class := Void
			synchronize_token (frozen_expected_tokens, class_keyword_expected, True)
			if last_token = E_FROZEN then
				l_frozen_keyword := last_detachable_et_keyword_value
				read_token
				synchronize_token (deferred_expected_tokens, class_keyword_expected, True)
			end
			if last_token = E_DEFERRED then
				l_deferred_keyword := last_detachable_et_keyword_value
				read_token
				synchronize_token (external_expected_tokens, class_keyword_expected, True)
			elseif last_token = E_EXPANDED then
				l_expanded_keyword := last_detachable_et_keyword_value
				read_token
				synchronize_token (external_expected_tokens, class_keyword_expected, True)
			elseif last_token = E_SEPARATE then
				l_separate_keyword := last_detachable_et_keyword_value
				read_token
				synchronize_token (external_expected_tokens, class_keyword_expected, True)
			end
			if last_token = E_EXTERNAL then
				l_external_keyword := last_detachable_et_keyword_value
				read_token
				synchronize_token (class_expected_tokens, class_keyword_expected, True)
			end
			if last_token = E_CLASS then
				l_class_keyword := last_detachable_et_keyword_value
				read_token
				if is_identifier_token (last_token) then
					l_identifier := last_detachable_et_identifier_value
					read_token
					if attached new_class (l_identifier) as l_last_class then
						last_class := l_last_class
						l_last_class.set_frozen_keyword (l_frozen_keyword)
						if l_deferred_keyword /= Void then
							l_last_class.set_class_mark (l_deferred_keyword)
						elseif l_expanded_keyword /= Void then
							l_last_class.set_class_mark (l_expanded_keyword)
						elseif l_separate_keyword /= Void then
							l_last_class.set_class_mark (l_separate_keyword)
						end
						l_last_class.set_external_keyword (l_external_keyword)
						if l_class_keyword /= Void then
							l_last_class.set_class_keyword (l_class_keyword)
						end
						if has_syntax_error then
							set_fatal_error (l_last_class)
						end
					end
				else
					report_syntax_error (last_position, last_value, class_name_expected)
				end
			end
		end

	parse_type
			-- Parse a type.
			-- Make the result available in `last_type`.
		local
			l_expanded_keyword: detachable ET_KEYWORD
			l_type_mark: detachable ET_TYPE_MARK
			l_has_type_mark: BOOLEAN
			l_separate_keyword: detachable ET_KEYWORD
			l_has_separate_keyword: BOOLEAN
			l_like_keyword: detachable ET_KEYWORD
		do
			last_type := Void
			if last_token = E_EXPANDED then
				l_expanded_keyword := last_detachable_et_keyword_value
				read_token
				if not is_class_name_token (last_token) then
					report_syntax_error (last_position, l_expanded_keyword, expanded_keyword_only_valid_for_class_types)
				else
					l_type_mark := l_expanded_keyword
					l_has_type_mark := True
				end
			end
			if last_token = E_ATTACHED then
				l_type_mark := last_detachable_et_keyword_value
				l_has_type_mark := True
				read_token
			elseif last_token = E_DETACHABLE then
				l_type_mark := last_detachable_et_keyword_value
				l_has_type_mark := True
				read_token
			elseif last_token = Exclamation_code then
				l_type_mark := last_detachable_et_symbol_value
				l_has_type_mark := True
				read_token
			elseif last_token = Question_mark_code then
				l_type_mark := last_detachable_et_question_mark_symbol_value
				l_has_type_mark := True
				read_token
			end
			if last_token = E_SEPARATE then
				l_separate_keyword := last_detachable_et_keyword_value
				l_has_separate_keyword := True
				read_token
				if l_has_type_mark then
					l_type_mark := ast_factory.new_attachment_mark_separate_keyword (l_type_mark, l_separate_keyword)
				else
					l_type_mark := l_separate_keyword
				end
			end
			if last_token = E_LIKE then
				l_like_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = E_CURRENT then
					if l_has_type_mark then
						l_type_mark := l_type_mark
					elseif l_has_separate_keyword then
						l_type_mark := ast_factory.new_attachment_mark_separate_keyword (tokens.implicit_attached_type_mark, l_separate_keyword)
					else
						l_type_mark := tokens.implicit_attached_type_mark
					end
				end
				unread_token
				set_last_keyword_token (E_LIKE, l_like_keyword)
			end
			parse_type_no_type_mark (l_type_mark)
		end

	parse_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse a type.
			-- Make the result available in `last_type`.
		do
			last_type := Void
			if last_token = E_LIKE then
				parse_anchored_type_no_type_mark (a_type_mark)
			elseif is_class_name_token (last_token) then
				parse_class_type_no_type_mark (a_type_mark)
			elseif last_token = E_TUPLE then
				parse_tuple_type_no_type_mark (a_type_mark)
			else
				report_syntax_error (last_position, last_value, class_name_tuple_like_keyword_expected)
			end
		end

	parse_class_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse a class type.
			-- Make the result available in `last_type`.
		local
			l_identifier: detachable ET_IDENTIFIER
			l_actual_parameters: detachable ET_ACTUAL_PARAMETER_LIST
		do
			last_type := Void
			parse_class_name_identifier
			l_identifier := last_class_name_identifier
			parse_optional_actual_parameters
			l_actual_parameters := last_actual_parameters
			last_type := new_named_type (a_type_mark, l_identifier, l_actual_parameters)
		end

	parse_optional_actual_parameters
			-- Parse an optional actual parameter list.
			-- Make the result available in `last_actual_parameters`.
		local
			l_old_last_actual_parameter_items_count: INTEGER
			l_left_bracket: detachable ET_BRACKET_SYMBOL
			l_right_bracket: detachable ET_SYMBOL
			l_type: detachable ET_TYPE
			l_done: BOOLEAN
			nb: INTEGER
			l_type_expected: BOOLEAN
			l_actual_parameters: detachable ET_ACTUAL_PARAMETER_LIST
		do
			last_actual_parameters := Void
			if last_token = Left_bracket_code then
				l_left_bracket := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_actual_parameter_items_count := last_actual_parameter_items.count
				from until l_done loop
					if last_token = Right_bracket_code then
						if l_type_expected then
							report_syntax_error (last_position, last_value, type_expected)
						end
						l_done := True
					else
						l_type_expected := False
						parse_type
						l_type := last_type
						if last_token = Comma_code then
							last_actual_parameter_items.force (ast_factory.new_actual_parameter_comma (l_type, last_detachable_et_symbol_value))
							l_type_expected := True
							read_token
						else
							last_actual_parameter_items.force (l_type)
							if last_token /= Right_bracket_code and then is_type_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_bracket_code then
					l_right_bracket := last_detachable_et_symbol_value
					read_token
					nb := (last_actual_parameter_items.count - l_old_last_actual_parameter_items_count).max (0)
					l_actual_parameters := ast_factory.new_actual_parameters (l_left_bracket, l_right_bracket, nb)
					from until nb <= 0 loop
						add_to_actual_parameter_list (last_actual_parameter_items.item, l_actual_parameters)
						last_actual_parameter_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
			end
			last_actual_parameters := l_actual_parameters
		end

	parse_tuple_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse a Tuple type.
			-- Make the result available in `last_type`.
		local
			l_identifier: detachable ET_IDENTIFIER
			l_actual_parameters: detachable ET_ACTUAL_PARAMETER_LIST
		do
			last_type := Void
			if last_token = E_TUPLE then
				l_identifier := last_detachable_et_identifier_value
				read_token
				parse_optional_tuple_actual_parameters
				l_actual_parameters := last_actual_parameters
				last_type := new_tuple_type (a_type_mark, l_identifier, last_actual_parameters)
			else
				report_syntax_error (last_position, last_value, tuple_expected)
			end
		end

	parse_optional_tuple_actual_parameters
			-- Parse an optional Tuple actual parameter list.
			-- Make the result available in `last_actual_parameters`.
		local
			l_old_last_actual_parameter_items_count: INTEGER
			l_old_last_labels_count: INTEGER
			l_left_bracket: detachable ET_BRACKET_SYMBOL
			l_right_bracket: detachable ET_SYMBOL
			l_first_semicolon: detachable ET_SEMICOLON_SYMBOL
			l_colon_symbol: detachable ET_SYMBOL
			l_type: detachable ET_TYPE
			l_first_parameter: BOOLEAN
			l_identifier: detachable ET_IDENTIFIER
			l_labeled_actual_parameter: detachable ET_LABELED_ACTUAL_PARAMETER
			l_done: BOOLEAN
			l_regular_actual_parameters: BOOLEAN
			i, nb: INTEGER
			l_identifier_expected: BOOLEAN
			l_identifier_code: INTEGER
			l_actual_parameters: detachable ET_ACTUAL_PARAMETER_LIST
		do
			last_actual_parameters := Void
			if last_token = Left_bracket_code then
				l_left_bracket := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_actual_parameter_items_count := last_actual_parameter_items.count
				l_old_last_labels_count := last_labels.count
				l_first_parameter := True
				if last_token = Semicolon_code then
					l_first_parameter := False
					parse_optional_semicolon
					l_first_semicolon := ast_factory.new_first_semicolon (last_semicolon)
				end
				from until l_done loop
					if is_identifier_token (last_token) then
						l_identifier_expected := False
						l_identifier := last_detachable_et_identifier_value
						l_identifier_code := last_token
						read_token
						if last_token = Comma_code then
							last_labels.force (ast_factory.new_label_comma (l_identifier, last_detachable_et_symbol_value))
							l_identifier_expected := True
							read_token
						elseif last_token = Colon_code then
							l_colon_symbol := last_detachable_et_symbol_value
							read_token
							parse_type
							l_type := last_type
							nb := last_labels.count
							from i := l_old_last_labels_count + 1 until i > nb loop
								last_actual_parameter_items.force (ast_factory.new_labeled_comma_actual_parameter (last_labels.i_th (i), l_type, last_class))
								i := i + 1
							end
							last_labels.keep (l_old_last_labels_count)
							l_labeled_actual_parameter := ast_factory.new_labeled_actual_parameter (l_identifier, ast_factory.new_colon_type (l_colon_symbol, l_type), last_class)
							if last_token = Semicolon_code then
								parse_optional_semicolon
								last_actual_parameter_items.force (ast_factory.new_labeled_actual_parameter_semicolon (l_labeled_actual_parameter, last_semicolon))
							else
								last_actual_parameter_items.force (l_labeled_actual_parameter)
							end
							l_first_parameter := False
						elseif l_first_parameter then
							l_regular_actual_parameters := True
							unread_token
							unread_identifier_token (l_identifier_code, l_identifier)
							l_done := True
						else
							report_syntax_error (last_position, last_value, colon_symbol_expected)
							l_done := True
						end
					elseif l_first_parameter then
						l_regular_actual_parameters := True
						unread_token
						l_done := True
					elseif l_identifier_expected then
						report_syntax_error (last_position, last_value, tuple_label_expected)
						l_done := True
					else
						l_done := True
					end
				end
				if l_regular_actual_parameters then
					nb := last_labels.count - l_old_last_labels_count
					from until nb <= 0 loop
						if not attached last_labels.item as l_last_label then
							unread_symbol_token (Comma_code, tokens.comma_symbol)
							l_identifier := Void
						elseif attached {ET_IDENTIFIER_COMMA} l_last_label as l_identifier_comma then
							unread_symbol_token (Comma_code, l_identifier_comma.comma)
							l_identifier := l_identifier_comma.identifier
						else
							unread_symbol_token (Comma_code, tokens.comma_symbol)
							l_identifier := l_last_label.identifier
						end
						if l_identifier = Void then
							unread_identifier_token (E_IDENTIFIER, l_identifier)
						elseif l_identifier.same_class_name (tokens.none_class_name) then
							unread_identifier_token (E_NONE, l_identifier)
						elseif l_identifier.same_class_name (tokens.tuple_class_name) then
							unread_identifier_token (E_TUPLE, l_identifier)
						else
							unread_identifier_token (E_IDENTIFIER, l_identifier)
						end
						last_labels.remove
						nb := nb - 1
					end
					set_last_bracket_symbol_token (Left_bracket_code, l_left_bracket)
					parse_optional_actual_parameters
					l_actual_parameters := last_actual_parameters
				elseif last_token = Right_bracket_code then
					l_right_bracket := last_detachable_et_symbol_value
					read_token
					nb := (last_actual_parameter_items.count - l_old_last_actual_parameter_items_count).max (0)
					l_actual_parameters := ast_factory.new_actual_parameters (l_left_bracket, l_right_bracket, nb)
					if l_actual_parameters /= Void then
						l_actual_parameters.set_first_symbol (l_first_semicolon)
					end
					from until nb <= 0 loop
						add_to_actual_parameter_list (last_actual_parameter_items.item, l_actual_parameters)
						last_actual_parameter_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
			end
			last_actual_parameters := l_actual_parameters
		end

	parse_anchored_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse an anchored type.
			-- Make the result available in `last_type`.
		local
			l_like_keyword: detachable ET_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
			l_like_type: detachable ET_LIKE_TYPE
			l_dot: detachable ET_SYMBOL
			l_left_brace: detachable ET_SYMBOL
			l_right_brace: detachable ET_SYMBOL
			l_last_type: detachable ET_TYPE
			l_type: detachable ET_TYPE
		do
			last_type := Void
			if last_token = E_LIKE then
				l_like_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = E_CURRENT then
					l_last_type := ast_factory.new_like_current (a_type_mark, l_like_keyword, last_detachable_et_current_value)
					read_token
				elseif is_identifier_token (last_token) then
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					if last_token /= Dot_code then
						l_last_type := new_like_feature (a_type_mark, l_like_keyword, l_identifier)
					else
						from
							l_like_type := new_like_feature (Void, l_like_keyword, l_identifier)
						until
							last_token /= Dot_code
						loop
							l_dot := last_detachable_et_symbol_value
							read_token
							parse_feature_name_identifier
							l_identifier := last_feature_name_identifier
							if last_token = Dot_code then
								l_like_type := ast_factory.new_qualified_like_type (Void, l_like_type, new_dot_feature_name (l_dot, l_identifier), last_class)
							else
								l_last_type := ast_factory.new_qualified_like_type (a_type_mark, l_like_type, new_dot_feature_name (l_dot, l_identifier), last_class)
							end
						end
					end
				elseif last_token = Left_brace_code then
					l_left_brace := last_detachable_et_symbol_value
					read_token
					parse_type
					l_type := last_type
					if last_token /= Right_brace_code then
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					else
						l_right_brace := last_detachable_et_symbol_value
						read_token
						if last_token /= Dot_code then
							report_syntax_error (last_position, last_value, dot_symbol_expected)
						else
							l_dot := last_detachable_et_symbol_value
							read_token
							if not is_identifier_token (last_token) then
								report_syntax_error (last_position, last_value, feature_name_expected)
							else
								parse_feature_name_identifier
								l_identifier := last_feature_name_identifier
								if last_token /= Dot_code then
									l_last_type := ast_factory.new_qualified_like_braced_type (a_type_mark, l_like_keyword, l_left_brace, l_type, l_right_brace, new_dot_feature_name (l_dot, l_identifier), last_class)
								else
									from
										l_like_type := ast_factory.new_qualified_like_braced_type (Void, l_like_keyword, l_left_brace, l_type, l_right_brace, new_dot_feature_name (l_dot, l_identifier), last_class)
									until
										last_token /= Dot_code
									loop
										l_dot := last_detachable_et_symbol_value
										read_token
										parse_feature_name_identifier
										l_identifier := last_feature_name_identifier
										if last_token = Dot_code then
											l_like_type := ast_factory.new_qualified_like_type (Void, l_like_type, new_dot_feature_name (l_dot, l_identifier), last_class)
										else
											l_last_type := ast_factory.new_qualified_like_type (a_type_mark, l_like_type, new_dot_feature_name (l_dot, l_identifier), last_class)
										end
									end
								end
							end
						end
					end
				else
					report_syntax_error (last_position, last_value, feature_name_type_or_current_keyword_expected)
				end
			else
				report_syntax_error (last_position, last_value, like_keyword_expected)
			end
			last_type := l_last_type
		end

	parse_optional_formal_parameters
			-- Parse optional formal parameters.
			-- Make the result available in `last_formal_parameters`.
		local
			l_old_last_formal_parameter_items_count: INTEGER
			l_left_bracket_symbol: detachable ET_BRACKET_SYMBOL
			l_right_bracket_symbol: detachable ET_SYMBOL
			l_formal_parameters: detachable ET_FORMAL_PARAMETER_LIST
			l_done: BOOLEAN
			nb: INTEGER
			l_formal_parameter_expected: BOOLEAN
		do
			last_formal_parameters := Void
			if last_token = Left_bracket_code then
				l_left_bracket_symbol := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_formal_parameter_items_count := last_formal_parameter_items.count
				from until l_done loop
					if last_token = Right_bracket_code then
						if l_formal_parameter_expected then
							report_syntax_error (last_position, last_value, formal_parameter_expected)
						end
						l_done := True
					else
						l_formal_parameter_expected := False
						parse_formal_parameter
						if last_token = Comma_code then
							last_formal_parameter_items.force (ast_factory.new_formal_parameter_comma (last_formal_parameter, last_detachable_et_symbol_value))
							l_formal_parameter_expected := True
							read_token
						else
							last_formal_parameter_items.force (last_formal_parameter)
							if last_token /= Right_bracket_code and then (last_token = E_EXPANDED or last_token = E_REFERENCE or is_identifier_token (last_token)) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_bracket_code then
					l_right_bracket_symbol := last_detachable_et_symbol_value
					read_token
					nb := (last_formal_parameter_items.count - l_old_last_formal_parameter_items_count).max (0)
					l_formal_parameters := ast_factory.new_formal_parameters (l_left_bracket_symbol, l_right_bracket_symbol, nb)
					from until nb <= 0 loop
						if l_formal_parameters /= Void and attached last_formal_parameter_items.item as l_last_formal_parameter_item then
							l_formal_parameters.put_first (l_last_formal_parameter_item)
						end
						last_formal_parameter_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
			end
			last_formal_parameters := l_formal_parameters
		end

	parse_formal_parameter
			-- Parse a formal parameter.
			-- Make the result available in `last_formal_parameter`.
		local
			l_type_mark: detachable ET_KEYWORD
			l_name: detachable ET_IDENTIFIER
			l_arrow_symbol: detachable ET_SYMBOL
			l_constraint: detachable ET_CONSTRAINT
			l_creator: detachable ET_CONSTRAINT_CREATOR
		do
			last_formal_parameter := Void
			if last_token = E_EXPANDED or last_token = E_REFERENCE then
				l_type_mark := last_detachable_et_keyword_value
				read_token
			end
			if is_identifier_token (last_token) then
				l_name := last_detachable_et_identifier_value
				read_token
				if last_token = E_ARROW then
					l_arrow_symbol := last_detachable_et_symbol_value
					read_token
					parse_constraint
					l_constraint := last_constraint
					parse_optional_constraint_creator
					l_creator := last_constraint_creator
					last_formal_parameter := ast_factory.new_constrained_formal_parameter (l_type_mark, l_name, l_arrow_symbol, l_constraint, l_creator, last_class)
				else
					last_formal_parameter := ast_factory.new_formal_parameter (l_type_mark, l_name, last_class)
				end
			else
				report_syntax_error (last_position, last_value, formal_parameter_expected)
			end
		end

	parse_constraint
			-- Parse a (possibly multiple) constraint.
			-- Make the result available in `last_constraint`.
		local
			l_old_last_type_constraint_items_count: INTEGER
			l_left_brace_symbol: detachable ET_SYMBOL
			l_right_brace_symbol: detachable ET_SYMBOL
			l_done: BOOLEAN
			nb: INTEGER
			l_constraint: detachable ET_TYPE_CONSTRAINT_LIST
			l_type_expected: BOOLEAN
		do
			last_constraint := Void
			if last_token = Left_brace_code then
				l_left_brace_symbol := last_detachable_et_symbol_value
				read_token
				l_old_last_type_constraint_items_count := last_type_constraint_items.count
				l_type_expected := True
				from until l_done loop
					if last_token = Right_brace_code then
						if l_type_expected then
							report_syntax_error (last_position, last_value, type_expected)
						end
						l_done := True
					else
						l_type_expected := False
						parse_type_constraint
						if last_token = Comma_code then
							last_type_constraint_items.force (ast_factory.new_type_constraint_comma (last_type_constraint, last_detachable_et_symbol_value))
							l_type_expected := False
							read_token
						else
							last_type_constraint_items.force (last_type_constraint)
							if last_token /= Right_brace_code and then is_type_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_brace_code then
					l_right_brace_symbol := last_detachable_et_symbol_value
					read_token
					nb := (last_type_constraint_items.count - l_old_last_type_constraint_items_count).max (0)
					l_constraint := ast_factory.new_type_constraint_list (l_left_brace_symbol, l_right_brace_symbol, nb)
					from until nb <= 0 loop
						if l_constraint /= Void and attached last_type_constraint_items.item as l_last_type_constraint_item then
							l_constraint.put_first (l_last_type_constraint_item)
						end
						last_type_constraint_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
				last_constraint := l_constraint
			else
				parse_type_constraint
				last_constraint := last_type_constraint
			end
		end

	parse_type_constraint
			-- Parse a type constraint.
			-- Make the result available in `last_type_constraint`.
		local
			l_constraint_type: detachable ET_CONSTRAINT_TYPE
		do
			last_type_constraint := Void
			parse_constraint_type
			l_constraint_type := last_constraint_type
			if last_token = E_RENAME then
				parse_optional_constraint_renames
				last_type_constraint := ast_factory.new_type_rename_constraint (dummy_constraint (l_constraint_type), last_constraint_renames)
			else
				last_type_constraint := dummy_constraint (l_constraint_type)
			end
			if last_type_constraint /= Void then
				register_constraint (l_constraint_type)
			end
		end

	parse_constraint_type
			-- Parse a constraint type.
			-- Make the result available in `last_constraint_type`.
		local
			l_expanded_keyword: detachable ET_KEYWORD
			l_type_mark: detachable ET_TYPE_MARK
			l_has_type_mark: BOOLEAN
			l_separate_keyword: detachable ET_KEYWORD
			l_has_separate_keyword: BOOLEAN
			l_like_keyword: detachable ET_KEYWORD
		do
			last_constraint_type := Void
			if last_token = E_EXPANDED then
				l_expanded_keyword := last_detachable_et_keyword_value
				read_token
				if not is_class_name_token (last_token) then
					report_syntax_error (last_position, l_expanded_keyword, expanded_keyword_only_valid_for_class_types)
				else
					l_type_mark := l_expanded_keyword
					l_has_type_mark := True
				end
			end
			if last_token = E_ATTACHED then
				l_type_mark := last_detachable_et_keyword_value
				l_has_type_mark := True
				read_token
			elseif last_token = E_DETACHABLE then
				l_type_mark := last_detachable_et_keyword_value
				l_has_type_mark := True
				read_token
			elseif last_token = Exclamation_code then
				l_type_mark := last_detachable_et_symbol_value
				l_has_type_mark := True
				read_token
			elseif last_token = Question_mark_code then
				l_type_mark := last_detachable_et_question_mark_symbol_value
				l_has_type_mark := True
				read_token
			end
			if last_token = E_SEPARATE then
				l_separate_keyword := last_detachable_et_keyword_value
				l_has_separate_keyword := True
				read_token
				if l_has_type_mark then
					l_type_mark := ast_factory.new_attachment_mark_separate_keyword (l_type_mark, l_separate_keyword)
				else
					l_type_mark := l_separate_keyword
				end
			end
			if last_token = E_LIKE then
				l_like_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = E_CURRENT then
					if l_has_type_mark then
						l_type_mark := l_type_mark
					elseif l_has_separate_keyword then
						l_type_mark := ast_factory.new_attachment_mark_separate_keyword (tokens.implicit_attached_type_mark, l_separate_keyword)
					else
						l_type_mark := tokens.implicit_attached_type_mark
					end
				end
				unread_token
				set_last_keyword_token (E_LIKE, l_like_keyword)
			end
			parse_constraint_type_no_type_mark (l_type_mark)
		end

	parse_constraint_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse a constraint type.
			-- Make the result available in `last_constraint_type`.
		do
			last_constraint_type := Void
			if last_token = E_LIKE then
				parse_anchored_type_no_type_mark (a_type_mark)
				last_constraint_type := last_type
			elseif last_token = E_IDENTIFIER or last_token = E_NONE then
				parse_constraint_class_type_no_type_mark (a_type_mark)
			elseif last_token = E_TUPLE then
				parse_constraint_tuple_type_no_type_mark (a_type_mark)
			else
				report_syntax_error (last_position, last_value, class_name_tuple_like_keyword_expected)
			end
		end

	parse_constraint_class_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse a constraint class type.
			-- Make the result available in `last_constraint_type`.
		local
			l_identifier: detachable ET_IDENTIFIER
			l_constraint_actual_parameters: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
			last_constraint_type := Void
			parse_class_name_identifier
			l_identifier := last_class_name_identifier
			parse_optional_constraint_actual_parameters
			l_constraint_actual_parameters := last_constraint_actual_parameters
			last_constraint_type := new_constraint_named_type (a_type_mark, l_identifier, l_constraint_actual_parameters)
		end

	parse_optional_constraint_actual_parameters
			-- Parse an optional constraint actual parameter list.
			-- Make the result available in `last_constraint_actual_parameters`.
		local
			l_old_last_constraint_actual_parameter_items_count: INTEGER
			l_left_bracket: detachable ET_BRACKET_SYMBOL
			l_right_bracket: detachable ET_SYMBOL
			l_type: detachable ET_CONSTRAINT_TYPE
			l_done: BOOLEAN
			nb: INTEGER
			l_type_expected: BOOLEAN
			l_constraint_actual_parameters: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
			last_constraint_actual_parameters := Void
			if last_token = Left_bracket_code then
				l_left_bracket := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_constraint_actual_parameter_items_count := last_constraint_actual_parameter_items.count
				from until l_done loop
					if last_token = Right_bracket_code then
						if l_type_expected then
							report_syntax_error (last_position, last_value, type_expected)
						end
						l_done := True
					else
						l_type_expected := False
						parse_constraint_type
						l_type := last_constraint_type
						if last_token = Comma_code then
							last_constraint_actual_parameter_items.force (ast_factory.new_constraint_actual_parameter_comma (l_type, last_detachable_et_symbol_value))
							l_type_expected := True
							read_token
						else
							last_constraint_actual_parameter_items.force (l_type)
							if last_token /= Right_bracket_code and then is_type_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_bracket_code then
					l_right_bracket := last_detachable_et_symbol_value
					read_token
					nb := (last_constraint_actual_parameter_items.count - l_old_last_constraint_actual_parameter_items_count).max (0)
					l_constraint_actual_parameters := ast_factory.new_constraint_actual_parameters (l_left_bracket, l_right_bracket, nb)
					from until nb <= 0 loop
						add_to_constraint_actual_parameter_list (last_constraint_actual_parameter_items.item, l_constraint_actual_parameters)
						last_constraint_actual_parameter_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
			end
			last_constraint_actual_parameters := l_constraint_actual_parameters
		end

	parse_constraint_tuple_type_no_type_mark (a_type_mark: detachable ET_TYPE_MARK)
			-- Parse a constraint Tuple type.
			-- Make the result available in `last_constraint_type`.
		local
			l_identifier: detachable ET_IDENTIFIER
			l_constraint_actual_parameters: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
			last_constraint_type := Void
			if last_token = E_TUPLE then
				l_identifier := last_detachable_et_identifier_value
				read_token
				parse_optional_constraint_tuple_actual_parameters
				l_constraint_actual_parameters := last_constraint_actual_parameters
				last_constraint_type := new_constraint_named_type (a_type_mark, l_identifier, l_constraint_actual_parameters)
			else
				report_syntax_error (last_position, last_value, tuple_expected)
			end
		end

	parse_optional_constraint_tuple_actual_parameters
			-- Parse an optional constraint Tuple actual parameter list.
			-- Make the result available in `last_constraint_actual_parameters`.
		local
			l_old_last_constraint_actual_parameter_items_count: INTEGER
			l_old_last_labels_count: INTEGER
			l_left_bracket: detachable ET_BRACKET_SYMBOL
			l_right_bracket: detachable ET_SYMBOL
			l_first_semicolon: detachable ET_SEMICOLON_SYMBOL
			l_colon_symbol: detachable ET_SYMBOL
			l_type: detachable ET_CONSTRAINT_TYPE
			l_first_parameter: BOOLEAN
			l_identifier: detachable ET_IDENTIFIER
			l_comma_symbol: detachable ET_SYMBOL
			l_labeled_actual_parameter: detachable ET_CONSTRAINT_LABELED_ACTUAL_PARAMETER
			l_done: BOOLEAN
			l_regular_actual_parameters: BOOLEAN
			i, nb: INTEGER
			l_identifier_expected: BOOLEAN
			l_identifier_code: INTEGER
			l_constraint_actual_parameters: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
		do
			last_constraint_actual_parameters := Void
			if last_token = Left_bracket_code then
				l_left_bracket := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_constraint_actual_parameter_items_count := last_constraint_actual_parameter_items.count
				l_old_last_labels_count := last_labels.count
				l_first_parameter := True
				if last_token = Semicolon_code then
					l_first_parameter := False
					parse_optional_semicolon
					l_first_semicolon := ast_factory.new_first_semicolon (last_semicolon)
				end
				from until l_done loop
					if is_identifier_token (last_token) then
						l_identifier_expected := False
						l_identifier := last_detachable_et_identifier_value
						l_identifier_code := last_token
						read_token
						if last_token = Comma_code then
							last_labels.force (ast_factory.new_label_comma (l_identifier, last_detachable_et_symbol_value))
							l_identifier_expected := True
							read_token
						elseif last_token = Colon_code then
							l_colon_symbol := last_detachable_et_symbol_value
							read_token
							parse_type
							l_type := last_type
							nb := last_labels.count
							from i := l_old_last_labels_count + 1 until i > nb loop
								if not attached last_labels.i_th (i) as l_last_label then
									l_comma_symbol := tokens.comma_symbol
									l_identifier := Void
								elseif attached {ET_IDENTIFIER_COMMA} l_last_label as l_identifier_comma then
									l_comma_symbol := l_identifier_comma.comma
									l_identifier := l_identifier_comma.identifier
								else
									l_comma_symbol := tokens.comma_symbol
									l_identifier := l_last_label.identifier
								end
								last_constraint_actual_parameter_items.force (ast_factory.new_constraint_labeled_comma_actual_parameter (l_identifier, l_comma_symbol, l_type, last_class))
								i := i + 1
							end
							last_labels.keep (l_old_last_labels_count)
							l_labeled_actual_parameter := ast_factory.new_constraint_labeled_actual_parameter (l_identifier, l_colon_symbol, l_type, last_class)
							if last_token = Semicolon_code then
								parse_optional_semicolon
								last_constraint_actual_parameter_items.force (ast_factory.new_constraint_labeled_actual_parameter_semicolon (l_labeled_actual_parameter, last_semicolon))
							else
								last_constraint_actual_parameter_items.force (l_labeled_actual_parameter)
							end
							l_first_parameter := False
						elseif l_first_parameter then
							l_regular_actual_parameters := True
							unread_token
							unread_identifier_token (l_identifier_code, l_identifier)
							l_done := True
						else
							report_syntax_error (last_position, last_value, colon_symbol_expected)
							l_done := True
						end
					elseif l_first_parameter then
							l_regular_actual_parameters := True
							unread_token
							l_done := True
					elseif l_identifier_expected then
						report_syntax_error (last_position, last_value, tuple_label_expected)
						l_done := True
					else
						l_done := True
					end
				end
				if l_regular_actual_parameters then
					nb := last_labels.count - l_old_last_labels_count
					from until nb <= 0 loop
						if not attached last_labels.item as l_last_label then
							unread_symbol_token (Comma_code, tokens.comma_symbol)
							l_identifier := Void
						elseif attached {ET_IDENTIFIER_COMMA} l_last_label as l_identifier_comma then
							unread_symbol_token (Comma_code, l_identifier_comma.comma)
							l_identifier := l_identifier_comma.identifier
						else
							unread_symbol_token (Comma_code, tokens.comma_symbol)
							l_identifier := l_last_label.identifier
						end
						if l_identifier = Void then
							unread_identifier_token (E_IDENTIFIER, l_identifier)
						elseif l_identifier.same_class_name (tokens.none_class_name) then
							unread_identifier_token (E_NONE, l_identifier)
						elseif l_identifier.same_class_name (tokens.tuple_class_name) then
							unread_identifier_token (E_TUPLE, l_identifier)
						else
							unread_identifier_token (E_IDENTIFIER, l_identifier)
						end
						last_labels.remove
						nb := nb - 1
					end
					set_last_bracket_symbol_token (Left_bracket_code, l_left_bracket)
					parse_optional_constraint_actual_parameters
					l_constraint_actual_parameters := last_constraint_actual_parameters
				elseif last_token = Right_bracket_code then
					l_right_bracket := last_detachable_et_symbol_value
					read_token
					nb := (last_constraint_actual_parameter_items.count - l_old_last_constraint_actual_parameter_items_count).max (0)
					l_constraint_actual_parameters := ast_factory.new_constraint_actual_parameters (l_left_bracket, l_right_bracket, nb)
					if l_constraint_actual_parameters /= Void then
						l_constraint_actual_parameters.set_first_symbol (l_first_semicolon)
					end
					from until nb <= 0 loop
						add_to_constraint_actual_parameter_list (last_constraint_actual_parameter_items.item, l_constraint_actual_parameters)
						last_constraint_actual_parameter_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
			end
			last_constraint_actual_parameters := l_constraint_actual_parameters
		end

	parse_optional_constraint_renames
			-- Parse an optional constraint renames.
			-- Make the result available in `last_constraint_renames'.
		local
			l_old_last_rename_items_count: INTEGER
			l_rename_keyword: detachable ET_KEYWORD
			nb: INTEGER
			l_done: BOOLEAN
			l_renames: detachable ET_CONSTRAINT_RENAME_LIST
			l_old_feature_name: detachable ET_FEATURE_NAME
			l_new_feature_name: detachable ET_EXTENDED_FEATURE_NAME
			l_as_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_constraint_renames := Void
			if last_token = E_RENAME then
				l_rename_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_rename_items_count := last_rename_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_old_feature_name := last_feature_name
						if last_token = E_AS then
							l_as_keyword := last_detachable_et_keyword_value
							read_token
							parse_extended_feature_name
							l_new_feature_name := last_extended_feature_name
							if last_token = Comma_code then
								last_rename_items.force (ast_factory.new_rename_comma (l_old_feature_name, l_as_keyword, l_new_feature_name, last_detachable_et_symbol_value))
								l_feature_name_expected := True
								read_token
							else
								last_rename_items.force (ast_factory.new_rename (l_old_feature_name, l_as_keyword, l_new_feature_name))
								l_comma_expected := True
							end
						else
							report_syntax_error (last_position, last_value, as_keyword_expected)
							l_done := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done :=True
					end
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
					nb := (last_rename_items.count - l_old_last_rename_items_count).max (0)
					l_renames := ast_factory.new_constraint_renames (l_rename_keyword, l_end_keyword, nb)
					from until nb <= 0 loop
						if l_renames /= Void and attached last_rename_items.item as l_last_rename_item then
							l_renames.put_first (l_last_rename_item)
						end
						last_rename_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
			end
			last_constraint_renames := l_renames
		end

	parse_optional_constraint_creator
			-- Parse an optional constraint creator.
			-- Make the result available in `last_constraint_creator'.
		local
			l_old_last_feature_name_items_count: INTEGER
			l_create_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_last_constraint_creator: detachable ET_CONSTRAINT_CREATOR
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_constraint_creator := Void
			if last_token = E_CREATE then
				l_create_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_feature_name_items_count := last_feature_name_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_feature_name := last_feature_name
						if last_token = Comma_code then
							last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
							l_feature_name_expected := True
							read_token
						else
							last_feature_name_items.force (l_feature_name)
							l_comma_expected := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
					nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
					l_last_constraint_creator := ast_factory.new_constraint_creator (l_create_keyword, l_end_keyword, nb)
					from until nb <= 0 loop
						if l_last_constraint_creator /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
							l_last_constraint_creator.put_first (l_last_feature_name_item)
						end
						last_feature_name_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
			end
			last_constraint_creator := l_last_constraint_creator
		end

	parse_optional_obsolete
			-- Parse an optional obsolete clause.
			-- Make the result available in `last_obsolete`.
		local
			l_obsolete_keyword: detachable ET_KEYWORD
		do
			last_obsolete := Void
			if last_token = E_OBSOLETE then
				l_obsolete_keyword := last_detachable_et_keyword_value
				read_token
				if is_string_token (last_token) then
					last_obsolete := ast_factory.new_obsolete_message (l_obsolete_keyword, last_detachable_et_manifest_string_value)
					read_token
				else
					report_syntax_error (last_position, last_value, obsolete_message_expected)
				end
			end
		end

	parse_optional_parent_clauses
			-- Parse optional parent clauses.
			-- Make the result available in `last_parent_clauses`.
		local
			l_done: BOOLEAN
			l_old_last_parent_clause_items_count: INTEGER
			nb: INTEGER
			l_parent_clauses: detachable ET_PARENT_CLAUSE_LIST
		do
			last_parent_clauses := Void
			l_old_last_parent_clause_items_count := last_parent_clause_items.count
			from until l_done loop
				synchronize_token (inherit_expected_tokens, inherit_keyword_expected, True)
				if last_token = E_INHERIT then
					parse_optional_parents
					last_parent_clause_items.force (last_parents)
				else
					l_done := True
				end
			end
			nb := last_parent_clause_items.count - l_old_last_parent_clause_items_count
			if nb > 0 then
				l_parent_clauses := ast_factory.new_parent_clauses (nb)
				from until nb <= 0 loop
					if l_parent_clauses /= Void and then attached last_parent_clause_items.item as l_last_parent_clause_item then
						l_parent_clauses.put_first (l_last_parent_clause_item)
					end
					last_parent_clause_items.remove
					nb := nb - 1
				end
			end
			last_parent_clauses := l_parent_clauses
		end

	parse_optional_parents
			-- Parse optional parents.
			-- Make the result available in `last_parents`.
		local
			l_inherit_keyword: detachable ET_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_right_brace_symbol: detachable ET_SYMBOL
			l_none_identifier: detachable ET_IDENTIFIER
			l_clients: detachable ET_CLIENTS
			l_first_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
			l_old_last_parent_items_count: INTEGER
			nb: INTEGER
			l_parents: detachable ET_PARENT_LIST
		do
			last_parents := Void
			if last_token = E_INHERIT then
				l_inherit_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					if last_token = E_NONE then
						l_none_identifier := last_detachable_et_identifier_value
						read_token
					else
						report_syntax_error (last_position, last_value, none_expected)
					end
					if last_token = Right_brace_code then
						l_right_brace_symbol := last_detachable_et_symbol_value
						read_token
						l_clients := ast_factory.new_clients (l_left_brace_symbol, l_right_brace_symbol, 1)
						if l_clients /= Void and attached new_client (l_none_identifier) as l_client then
							l_clients.put_first (l_client)
						end
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				end
				if last_token = Semicolon_code then
					parse_optional_semicolon
					l_first_semicolon_symbol := ast_factory.new_first_semicolon (last_semicolon)
				end
				l_old_last_parent_items_count := last_parent_items.count
				from
				until
					not is_class_name_token (last_token)
				loop
					parse_optional_parent
					if last_token = Semicolon_code then
						parse_optional_semicolon
						last_parent_items.force (ast_factory.new_parent_semicolon (last_parent, last_semicolon))
					else
						last_parent_items.force (last_parent)
					end
				end
				nb := (last_parent_items.count - l_old_last_parent_items_count).max (0)
				l_parents := ast_factory.new_parents (l_inherit_keyword, nb)
				if l_parents /= Void then
					l_parents.set_clients_clause (l_clients)
					l_parents.set_first_semicolon (l_first_semicolon_symbol)
				end
				from until nb <= 0 loop
					if l_parents /= Void and then attached last_parent_items.item as l_last_parent_item then
						l_parents.put_first (l_last_parent_item)
					end
					last_parent_items.remove
					nb := nb - 1
				end
			end
			last_parents := l_parents
		end

	parse_optional_parent
			-- Parse an optional parent.
			-- Make the result available in `last_parent`.
		local
			l_name: detachable ET_IDENTIFIER
			l_actual_parameters: detachable ET_ACTUAL_PARAMETER_LIST
			l_renames: detachable ET_RENAME_LIST
			l_exports: detachable ET_EXPORT_LIST
			l_undefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			l_redefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			l_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST
			l_end_needed: BOOLEAN
			l_end_keyword: detachable ET_KEYWORD
		do
			last_parent := Void
			if is_class_name_token (last_token) then
				parse_class_name_identifier
				l_name := last_class_name_identifier
				parse_optional_actual_parameters
				l_actual_parameters := last_actual_parameters
				if last_token = E_RENAME then
					parse_optional_renames
					l_renames := last_renames
					l_end_needed := True
				end
				if last_token = E_EXPORT then
					parse_optional_exports
					l_exports := last_exports
					l_end_needed := True
				end
				if last_token = E_UNDEFINE then
					parse_optional_undefines
					l_undefines := last_undefines
					l_end_needed := True
				end
				if last_token = E_REDEFINE then
					parse_optional_redefines
					l_redefines := last_redefines
					l_end_needed := True
				end
				if last_token = E_SELECT then
					parse_optional_selects
					l_selects := last_selects
					l_end_needed := True
				end
				if l_end_needed then
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
					end
				end
				last_parent := new_parent (l_name, l_actual_parameters, l_renames, l_exports, l_undefines, l_redefines, l_selects, l_end_keyword)
			end
		end

	parse_optional_renames
			-- Parse an optional renames.
			-- Make the result available in `last_renames'.
		local
			l_old_last_rename_items_count: INTEGER
			l_rename_keyword: detachable ET_KEYWORD
			nb: INTEGER
			l_done: BOOLEAN
			l_renames: detachable ET_RENAME_LIST
			l_old_feature_name: detachable ET_FEATURE_NAME
			l_new_feature_name: detachable ET_EXTENDED_FEATURE_NAME
			l_as_keyword: detachable ET_KEYWORD
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_renames := Void
			if last_token = E_RENAME then
				l_rename_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_rename_items_count := last_rename_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_old_feature_name := last_feature_name
						if last_token = E_AS then
							l_as_keyword := last_detachable_et_keyword_value
							read_token
							parse_extended_feature_name
							l_new_feature_name := last_extended_feature_name
							if last_token = Comma_code then
								last_rename_items.force (ast_factory.new_rename_comma (l_old_feature_name, l_as_keyword, l_new_feature_name, last_detachable_et_symbol_value))
								l_feature_name_expected := True
								read_token
							else
								last_rename_items.force (ast_factory.new_rename (l_old_feature_name, l_as_keyword, l_new_feature_name))
								l_comma_expected := True
							end
						else
							report_syntax_error (last_position, last_value, as_keyword_expected)
							l_done := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				nb := (last_rename_items.count - l_old_last_rename_items_count).max (0)
				l_renames := ast_factory.new_renames (l_rename_keyword, nb)
				from until nb <= 0 loop
					if l_renames /= Void and attached last_rename_items.item as l_last_rename_item then
						l_renames.put_first (l_last_rename_item)
					end
					last_rename_items.remove
					nb := nb - 1
				end
			end
			last_renames := l_renames
		end

	parse_optional_exports
			-- Parse an optional exports.
			-- Make the result available in `last_exports'.
		local
			l_export_keyword: detachable ET_KEYWORD
			l_old_last_export_items_count: INTEGER
			l_exports: detachable ET_EXPORT_LIST
			nb: INTEGER
		do
			last_exports := Void
			if last_token = E_EXPORT then
				l_export_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_export_items_count := last_export_items.count
				from
				until
					last_token /= left_brace_code and last_token /= Semicolon_code
				loop
					parse_optional_export
					last_export_items.force (last_export)
				end
				nb := (last_export_items.count - l_old_last_export_items_count).max (0)
				l_exports := ast_factory.new_exports (l_export_keyword, nb)
				from until nb <= 0 loop
					if l_exports /= Void and attached last_export_items.item as l_last_export_item then
						l_exports.put_first (l_last_export_item)
					end
					last_export_items.remove
					nb := nb - 1
				end
			end
			last_exports := l_exports
		end

	parse_optional_export
			-- Parse an optional export.
			-- Make the result available in `last_export'.
		local
			l_clients: detachable ET_CLIENTS
			l_old_last_feature_name_items_count: INTEGER
			l_feature_name: detachable ET_FEATURE_NAME
			l_export: detachable ET_FEATURE_EXPORT
			nb: INTEGER
			l_done: BOOLEAN
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_export := Void
			if last_token = left_brace_code then
				parse_optional_clients
				l_clients := last_clients
				if last_token = E_ALL then
					last_export := ast_factory.new_all_export (l_clients, last_detachable_et_keyword_value)
					read_token
				else
						-- Note: Empty feature list allowed in ETL2 page 101 and in ISE 5.6.
					l_old_last_feature_name_items_count := last_feature_name_items.count
					from until l_done loop
						if is_identifier_token (last_token) then
							l_feature_name_expected := False
							if l_comma_expected then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
								l_comma_expected := False
							end
							parse_feature_name
							l_feature_name := last_feature_name
							if last_token = Comma_code then
								last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
								l_feature_name_expected := True
								read_token
							else
								last_feature_name_items.force (l_feature_name)
								l_comma_expected := True
							end
						elseif l_feature_name_expected then
							report_syntax_error (last_position, last_value, feature_name_expected)
							l_done := True
						else
							l_done := True
						end
					end
					nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
					l_export := ast_factory.new_feature_export (l_clients, nb)
					last_export := l_export
					from until nb <= 0 loop
						if l_export /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
							l_export.put_first (l_last_feature_name_item)
						end
						last_feature_name_items.remove
						nb := nb - 1
					end
				end
			elseif last_token = Semicolon_code then
				last_export := ast_factory.new_null_export (last_detachable_et_semicolon_symbol_value)
				read_token
			end
		end

	parse_optional_undefines
			-- Parse an optional undefines.
			-- Make the result available in `last_undefines'.
		local
			l_old_last_feature_name_items_count: INTEGER
			l_undefine_keyword: detachable ET_KEYWORD
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_undefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_undefines := Void
			if last_token = E_UNDEFINE then
				l_undefine_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_feature_name_items_count := last_feature_name_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_feature_name := last_feature_name
						if last_token = Comma_code then
							last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
							l_feature_name_expected := True
							read_token
						else
							last_feature_name_items.force (l_feature_name)
							l_comma_expected := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
				l_undefines := ast_factory.new_keyword_feature_name_list (l_undefine_keyword, nb)
				from until nb <= 0 loop
					if l_undefines /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
						l_undefines.put_first (l_last_feature_name_item)
					end
					last_feature_name_items.remove
					nb := nb - 1
				end
			end
			last_undefines := l_undefines
		end

	parse_optional_redefines
			-- Parse an optional redefines.
			-- Make the result available in `last_redefines'.
		local
			l_old_last_feature_name_items_count: INTEGER
			l_redefine_keyword: detachable ET_KEYWORD
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_redefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_redefines := Void
			if last_token = E_REDEFINE then
				l_redefine_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_feature_name_items_count := last_feature_name_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_feature_name := last_feature_name
						if last_token = Comma_code then
							last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
							l_feature_name_expected := True
							read_token
						else
							last_feature_name_items.force (l_feature_name)
							l_comma_expected := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
				l_redefines := ast_factory.new_keyword_feature_name_list (l_redefine_keyword, nb)
				from until nb <= 0 loop
					if l_redefines /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
						l_redefines.put_first (l_last_feature_name_item)
					end
					last_feature_name_items.remove
					nb := nb - 1
				end
			end
			last_redefines := l_redefines
		end

	parse_optional_selects
			-- Parse an optional selects.
			-- Make the result available in `last_selects'.
		local
			l_old_last_feature_name_items_count: INTEGER
			l_select_keyword: detachable ET_KEYWORD
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_selects := Void
			if last_token = E_SELECT then
				l_select_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_feature_name_items_count := last_feature_name_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_feature_name := last_feature_name
						if last_token = Comma_code then
							last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
							l_feature_name_expected := True
							read_token
						else
							last_feature_name_items.force (l_feature_name)
							l_comma_expected := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
				l_selects := ast_factory.new_keyword_feature_name_list (l_select_keyword, nb)
				from until nb <= 0 loop
					if l_selects /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
						l_selects.put_first (l_last_feature_name_item)
					end
					last_feature_name_items.remove
					nb := nb - 1
				end
			end
			last_selects := l_selects
		end

	parse_optional_clients
			-- Parse an optional clients.
			-- Make the result available in `last_clients'.
		local
			l_old_last_client_items_count: INTEGER
			l_left_brace_symbol: detachable ET_SYMBOL
			l_right_brace_symbol: detachable ET_SYMBOL
			l_name: detachable ET_IDENTIFIER
			l_done: BOOLEAN
			nb: INTEGER
			l_clients: detachable ET_CLIENTS
			l_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_clients := Void
			if last_token = Left_brace_code then
				l_left_brace_symbol := last_detachable_et_symbol_value
				read_token
				l_old_last_client_items_count := last_client_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						l_name := last_detachable_et_identifier_value
						read_token
						if last_token = Comma_code then
							last_client_items.force (new_client_comma (l_name, last_detachable_et_symbol_value))
							l_name_expected := True
							read_token
						else
							last_client_items.force (new_client (l_name))
							l_comma_expected := True
						end
					elseif l_name_expected then
						report_syntax_error (last_position, last_value, class_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				if last_token = Right_brace_code then
					l_right_brace_symbol := last_detachable_et_symbol_value
					read_token
					nb := last_client_items.count - l_old_last_client_items_count
					if nb > 0 then
						l_clients := ast_factory.new_clients (l_left_brace_symbol, l_right_brace_symbol, nb)
						from until nb <= 0 loop
							if l_clients /= Void and attached last_client_items.item as l_last_client_item then
								l_clients.put_first (l_last_client_item)
							end
							last_client_items.remove
							nb := nb - 1
						end
					else
						l_clients := ast_factory.new_none_clients (l_left_brace_symbol, l_right_brace_symbol)
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
			end
			last_clients := l_clients
		end

	parse_optional_creators
			-- Parse optional creators.
			-- Make the result available in `last_creators`.
		local
			l_done: BOOLEAN
			l_old_last_creator_items_count: INTEGER
			nb: INTEGER
			l_creators: detachable ET_CREATOR_LIST
		do
			last_creators := Void
			l_old_last_creator_items_count := last_creator_items.count
			from until l_done loop
				synchronize_token (create_expected_tokens, feature_keyword_expected, True)
				if last_token = E_CREATE or last_token = E_CREATION then
					parse_optional_creator
					last_creator_items.force (last_creator)
				else
					l_done := True
				end
			end
			nb := last_creator_items.count - l_old_last_creator_items_count
			if nb > 0 then
				l_creators := ast_factory.new_creators (nb)
				from until nb <= 0 loop
					if l_creators /= Void and then attached last_creator_items.item as l_last_creator_item then
						l_creators.put_first (l_last_creator_item)
					end
					last_creator_items.remove
					nb := nb - 1
				end
			end
			last_creators := l_creators
		end

	parse_optional_creator
			-- Parse an optional creator.
			-- Make the result available in `last_creator'.
		local
			l_old_last_feature_name_items_count: INTEGER
			l_create_keyword: detachable ET_KEYWORD
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_creator: detachable ET_CREATOR
			l_clients: detachable ET_CLIENT_LIST
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_creator := Void
			if last_token = E_CREATE or last_token = E_CREATION then
				l_create_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					parse_optional_clients
					l_clients := last_clients
				else
					l_clients := new_any_clients (l_create_keyword)
				end
				l_old_last_feature_name_items_count := last_feature_name_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_feature_name := last_feature_name
						if last_token = Comma_code then
							last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
							l_feature_name_expected := True
							read_token
						else
							last_feature_name_items.force (l_feature_name)
							l_comma_expected := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
				l_creator := ast_factory.new_creator (l_create_keyword, l_clients, nb)
				from until nb <= 0 loop
					if l_creator /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
						l_creator.put_first (l_last_feature_name_item)
					end
					last_feature_name_items.remove
					nb := nb - 1
				end
			end
			last_creator := l_creator
		end

	parse_optional_converts
			-- Parse optional converts.
			-- Make the result available in `last_converts'.
		local
			l_old_last_convert_feature_items_count: INTEGER
			l_convert_keyword: detachable ET_KEYWORD
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_converts: detachable ET_CONVERT_FEATURE_LIST
			l_convert_feature: detachable ET_CONVERT_FEATURE
			l_colon_symbol: detachable ET_SYMBOL
			l_left_parenthesis_symbol: detachable ET_SYMBOL
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_converts := Void
			synchronize_token (convert_expected_tokens, feature_keyword_expected, True)
			if last_token = E_CONVERT then
				l_convert_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_convert_feature_items_count := last_convert_feature_items.count
				from until l_done loop
					if is_identifier_token (last_token) then
						l_feature_name_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						parse_feature_name
						l_feature_name := last_feature_name
						if last_token = Colon_code then
							l_colon_symbol := last_detachable_et_symbol_value
							read_token
							parse_convert_types
							l_convert_feature := ast_factory.new_convert_function (l_feature_name, l_colon_symbol, last_convert_types)
						elseif last_token = Left_parenthesis_code then
							l_left_parenthesis_symbol := last_detachable_et_symbol_value
							read_token
							parse_convert_types
							if last_token = Right_parenthesis_code then
								l_convert_feature := ast_factory.new_convert_procedure (l_feature_name, l_left_parenthesis_symbol, last_convert_types, last_detachable_et_symbol_value)
								read_token
							else
								report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
							end
						else
							report_syntax_error (last_position, last_value, colon_or_left_parenthesis_symbol_expected)
						end
						if last_token = Comma_code then
							last_convert_feature_items.force (ast_factory.new_convert_feature_comma (l_convert_feature, last_detachable_et_symbol_value))
							l_feature_name_expected := True
							read_token
						else
							last_convert_feature_items.force (l_convert_feature)
							l_comma_expected := True
						end
					elseif l_feature_name_expected then
						report_syntax_error (last_position, last_value, feature_name_expected)
						l_done := True
					else
						l_done := True
					end
				end
				nb := (last_convert_feature_items.count - l_old_last_convert_feature_items_count).max (0)
				l_converts := ast_factory.new_convert_features (l_convert_keyword, nb)
				from until nb <= 0 loop
					if l_converts /= Void and attached last_convert_feature_items.item as l_last_convert_feature_item then
						l_converts.put_first (l_last_convert_feature_item)
					end
					last_convert_feature_items.remove
					nb := nb - 1
				end
			end
			last_converts := l_converts
		end

	parse_convert_types
			-- Parse convert types.
			-- Make the result available in `last_convert_types`.
		local
			l_old_last_type_items_count: INTEGER
			l_left_brace: detachable ET_SYMBOL
			l_right_brace: detachable ET_SYMBOL
			l_type: detachable ET_TYPE
			l_types: detachable ET_TYPE_LIST
			l_done: BOOLEAN
			nb: INTEGER
			l_type_expected: BOOLEAN
		do
			last_convert_types := Void
			if last_token = Left_brace_code then
				l_left_brace := last_detachable_et_symbol_value
				read_token
				l_old_last_type_items_count := last_type_items.count
				from until l_done loop
					if last_token = Right_brace_code then
						if l_type_expected then
							report_syntax_error (last_position, last_value, type_expected)
						end
						l_done := True
					else
						l_type_expected := False
						parse_type
						l_type := last_type
						if last_token = Comma_code then
							last_type_items.force (ast_factory.new_type_comma (l_type, last_detachable_et_symbol_value))
							l_type_expected := True
							read_token
						else
							last_type_items.force (l_type)
							if last_token /= Right_brace_code and then is_type_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_brace_code then
					l_right_brace := last_detachable_et_symbol_value
					read_token
					nb := (last_type_items.count - l_old_last_type_items_count).max (0)
					l_types := ast_factory.new_convert_types (l_left_brace, l_right_brace, nb)
					from until nb <= 0 loop
						if l_types /= Void and then attached last_type_items.item as l_last_type_item then
							l_types.put_first (l_last_type_item)
						end
						last_type_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, left_brace_symbol_expected)
			end
			last_convert_types := l_types
		end

	parse_optional_feature_clauses
			-- Parse optional feature clauses.
			-- Make the result available in `last_feature_clauses`.
		local
			l_done: BOOLEAN
			l_old_last_feature_clause_items_count: INTEGER
			nb: INTEGER
			l_feature_clauses: detachable ET_FEATURE_CLAUSE_LIST
		do
			last_feature_clauses := Void
			l_old_last_feature_clause_items_count := last_feature_clause_items.count
			from until l_done loop
				synchronize_token (feature_expected_tokens, feature_keyword_expected, True)
				if last_token = E_FEATURE then
					parse_optional_feature_clause
					last_feature_clause_items.force (last_feature_clause)
				else
					l_done := True
				end
			end
			nb := last_feature_clause_items.count - l_old_last_feature_clause_items_count
			if nb > 0 then
				l_feature_clauses := ast_factory.new_feature_clauses (nb)
				from until nb <= 0 loop
					if l_feature_clauses /= Void and then attached last_feature_clause_items.item as l_last_feature_clause_item then
						l_feature_clauses.put_first (l_last_feature_clause_item)
					end
					last_feature_clause_items.remove
					nb := nb - 1
				end
			end
			last_feature_clauses := l_feature_clauses
		end

	parse_optional_feature_clause
			-- Parse optional feature clause.
			-- Make the result available in `last_feature_clause`.
		local
			l_feature_keyword: detachable ET_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
			l_feature_clause: detachable ET_FEATURE_CLAUSE
		do
			last_feature_clause := Void
			if last_token = E_FEATURE then
				l_feature_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					parse_optional_clients
					last_client_list := last_clients
				else
					last_client_list := new_any_clients (l_feature_keyword)
				end
				if last_token = Semicolon_code then
					parse_optional_semicolon
					l_semicolon_symbol := ast_factory.new_first_semicolon (last_semicolon)
				end
				l_feature_clause := ast_factory.new_feature_clause (l_feature_keyword, last_client_list)
				if l_feature_clause /= Void then
					l_feature_clause.set_first_semicolon (l_semicolon_symbol)
				end
				last_feature_clause := l_feature_clause
				from until
					not is_identifier_token (last_token) and last_token /= E_FROZEN
				loop
					parse_feature
					if is_error_recovering then
						synchronize_token (feature_name_expected_tokens_recovering, feature_keyword_expected, False)
					else
						synchronize_token (feature_name_expected_tokens, feature_keyword_expected, False)
					end
				end
			end
			last_feature_clause := l_feature_clause
		end

	parse_feature
			-- Parse feature.
		local
			l_frozen_keyword: detachable ET_KEYWORD
			l_extended_feature_name: detachable ET_EXTENDED_FEATURE_NAME
			l_old_last_extended_feature_name_items_count: INTEGER
			nb: INTEGER
			l_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_has_formal_arguments: BOOLEAN
			l_colon_symbol: detachable ET_SYMBOL
			l_type: ET_DECLARED_TYPE
			l_has_type: BOOLEAN
			l_assign_keyword: detachable ET_KEYWORD
			l_assigner: detachable ET_ASSIGNER
			l_is_keyword: detachable ET_KEYWORD
			l_has_is_keyword: BOOLEAN
			l_note_clause: detachable ET_NOTE_LIST
			l_has_note_clause: BOOLEAN
			l_obsolete: detachable ET_OBSOLETE
			l_has_obsolete: BOOLEAN
			l_preconditions: detachable ET_PRECONDITIONS
			l_has_preconditions: BOOLEAN
			l_postconditions: detachable ET_POSTCONDITIONS
			l_has_locals: BOOLEAN
			l_local_variables: detachable ET_LOCAL_VARIABLE_LIST
			l_do_keyword: detachable ET_KEYWORD
			l_once_keyword: detachable ET_KEYWORD
			l_external_keyword: detachable ET_KEYWORD
			l_alias_keyword: detachable ET_KEYWORD
			l_rescue_keyword: detachable ET_KEYWORD
			l_do_compound: detachable ET_COMPOUND
			l_once_compound: detachable ET_COMPOUND
			l_rescue_compound: detachable ET_COMPOUND
			l_keys: detachable ET_MANIFEST_STRING_LIST
			l_external_language: detachable ET_EXTERNAL_LANGUAGE
			l_alias_name: detachable ET_EXTERNAL_ALIAS
			l_deferred_keyword: detachable ET_KEYWORD
			l_attribute_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_unique_keyword: detachable ET_KEYWORD
			l_equal_symbol: detachable ET_AST_LEAF
			l_constant: detachable ET_CONSTANT
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
			l_query: detachable ET_QUERY
			l_query_synonym: detachable ET_QUERY
			l_procedure: detachable ET_PROCEDURE
			l_procedure_synonym: detachable ET_PROCEDURE
			l_feature: detachable ET_FEATURE
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
			l_unknown_string: ET_REGULAR_MANIFEST_STRING
			l_done: BOOLEAN
		do
			end_indentation_mismatch := Void
			l_old_last_extended_feature_name_items_count := last_extended_feature_name_items.count
			from until l_done loop
				if is_identifier_token (last_token) or last_token = E_FROZEN then
					l_feature_name_expected := False
					if l_comma_expected then
						report_syntax_error (last_position, last_value, comma_symbol_expected)
						l_comma_expected := False
					end
					if last_token = E_FROZEN then
						l_frozen_keyword := last_detachable_et_keyword_value
						last_extended_feature_name_frozen_items.force (l_frozen_keyword)
						read_token
					else
						last_extended_feature_name_frozen_items.force (Void)
					end
					parse_extended_feature_name
					l_extended_feature_name := last_extended_feature_name
					if last_token = Comma_code then
						last_extended_feature_name_items.force (ast_factory.new_extended_feature_name_comma (l_extended_feature_name, last_detachable_et_symbol_value))
						l_feature_name_expected := True
						read_token
					else
						last_extended_feature_name_items.force (l_extended_feature_name)
						l_comma_expected := True
					end
				elseif l_feature_name_expected then
					report_syntax_error (last_position, last_value, feature_name_expected)
					l_done := True
				else
					l_done := True
				end
			end
			nb := last_extended_feature_name_items.count - l_old_last_extended_feature_name_items_count
			if nb >= 1 then
				l_extended_feature_name := last_extended_feature_name_items.item
				last_extended_feature_name_items.remove
				l_frozen_keyword := last_extended_feature_name_frozen_items.item
				last_extended_feature_name_frozen_items.remove
				nb := nb - 1
				if last_token = Left_parenthesis_code then
					l_has_formal_arguments := True
					parse_optional_formal_arguments
					l_formal_arguments := last_formal_arguments
				end
				if last_token = Colon_code then
					l_has_type := True
					l_colon_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					l_type := ast_factory.new_colon_type (l_colon_symbol, last_type)
					if last_token = E_ASSIGN then
						l_assign_keyword := last_detachable_et_keyword_value
						read_token
						parse_feature_name
						l_assigner := ast_factory.new_assigner (l_assign_keyword, last_feature_name)
					end
				end
				if last_token = E_IS then
					l_has_is_keyword := True
					l_is_keyword := last_detachable_et_keyword_value
					read_token
				end
				if last_token = E_NOTE or last_token = E_INDEXING then
					l_has_note_clause := True
					parse_optional_note_clause (True)
					l_note_clause := last_notes
				end
				if last_token = E_OBSOLETE then
					l_has_obsolete := True
					parse_optional_obsolete
					l_obsolete := last_obsolete
				end
				if last_token = E_REQUIRE then
					l_has_preconditions := True
					parse_optional_preconditions
					l_preconditions := last_preconditions
				end
				if last_token = E_LOCAL then
					l_has_locals := True
					parse_optional_local_variables
					l_local_variables := last_local_variables
				end
				if last_token = E_DO then
					l_do_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_do_compound := ast_factory.new_do_compound (l_do_keyword, last_compound)
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_RESCUE then
						l_rescue_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_rescue_compound := ast_factory.new_rescue_compound (l_rescue_keyword, last_compound)
					end
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
						create l_end_keyword.make_end
						l_end_keyword.set_position (line, column)
					end
					if l_has_type then
						l_query := ast_factory.new_do_function (l_extended_feature_name, l_formal_arguments, l_type, l_assigner, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_local_variables, l_do_compound, l_postconditions, l_rescue_compound, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_query
					else
						l_procedure := ast_factory.new_do_procedure (l_extended_feature_name, l_formal_arguments, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_local_variables, l_do_compound, l_postconditions, l_rescue_compound, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_procedure
					end
				elseif last_token = E_ATTRIBUTE then
					if l_has_is_keyword or l_has_formal_arguments or not l_has_type then
						report_syntax_error (last_position, last_value, do_or_once_keyword_expected)
					end
					l_attribute_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_do_compound := ast_factory.new_attribute_compound (l_attribute_keyword, last_compound)
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_RESCUE then
						l_rescue_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_rescue_compound := ast_factory.new_rescue_compound (l_rescue_keyword, last_compound)
					end
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
						create l_end_keyword.make_end
						l_end_keyword.set_position (line, column)
					end
					l_query := ast_factory.new_extended_attribute (l_extended_feature_name, l_type, l_assigner, l_note_clause, l_obsolete, l_preconditions, l_local_variables, l_do_compound, l_postconditions, l_rescue_compound, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
					l_feature := l_query
				elseif last_token = E_ONCE then
					l_once_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_keys
					l_keys := last_keys
					parse_optional_compound (False)
					l_once_compound := ast_factory.new_do_compound (l_once_keyword, last_compound)
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_RESCUE then
						l_rescue_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_rescue_compound := ast_factory.new_rescue_compound (l_rescue_keyword, last_compound)
					end
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
						create l_end_keyword.make_end
						l_end_keyword.set_position (line, column)
					end
					if l_has_type then
						l_query := ast_factory.new_once_function (l_extended_feature_name, l_formal_arguments, l_type, l_assigner, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_local_variables, l_keys, l_once_compound, l_postconditions, l_rescue_compound, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_query
					else
						l_procedure := ast_factory.new_once_procedure (l_extended_feature_name, l_formal_arguments, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_local_variables, l_keys, l_once_compound, l_postconditions, l_rescue_compound, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_procedure
					end
				elseif last_token = E_EXTERNAL then
					if l_has_locals then
						report_syntax_error (last_position, last_value, do_or_once_keyword_expected)
					end
					l_external_keyword := last_detachable_et_keyword_value
					read_token
					if is_string_token (last_token) then
						l_external_language := ast_factory.new_external_language (l_external_keyword, last_detachable_et_manifest_string_value)
						read_token
					else
						create l_unknown_string.make (tokens.unknown_name)
						l_external_language := ast_factory.new_external_language (l_external_keyword, l_unknown_string)
						report_syntax_error (last_position, last_value, manifest_string_expected)
					end
					if last_token = E_ALIAS then
						l_alias_keyword := last_detachable_et_keyword_value
						read_token
						if is_string_token (last_token) then
							l_alias_name := ast_factory.new_external_alias (l_alias_keyword, last_detachable_et_manifest_string_value)
							read_token
						else
							report_syntax_error (last_position, last_value, manifest_string_expected)
						end
					end
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
						create l_end_keyword.make_end
						l_end_keyword.set_position (line, column)
					end
					if l_has_type then
						l_query := new_external_function (l_extended_feature_name, l_formal_arguments, l_type, l_assigner, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_external_language, l_alias_name, l_postconditions, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_query
					else
						l_procedure := new_external_procedure (l_extended_feature_name, l_formal_arguments, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_external_language, l_alias_name, l_postconditions, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_procedure
					end
				elseif last_token = E_DEFERRED then
					if l_has_locals then
						report_syntax_error (last_position, last_value, do_or_once_keyword_expected)
					end
					l_deferred_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
						create l_end_keyword.make_end
						l_end_keyword.set_position (line, column)
					end
					if l_has_type then
						l_query := ast_factory.new_deferred_function (l_extended_feature_name, l_formal_arguments, l_type, l_assigner, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_deferred_keyword, l_postconditions, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_query
					else
						l_procedure := ast_factory.new_deferred_procedure (l_extended_feature_name, l_formal_arguments, l_is_keyword, l_note_clause, l_obsolete, l_preconditions, l_deferred_keyword, l_postconditions, l_end_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_procedure
					end
				elseif l_has_formal_arguments or not l_has_type or l_has_obsolete or l_has_note_clause or l_has_preconditions or l_has_locals then
					report_syntax_error (last_position, last_value, do_or_once_keyword_expected)
				elseif l_has_is_keyword or last_token = Equal_code then
					if l_has_is_keyword then
						l_equal_symbol := l_is_keyword
					else
						l_equal_symbol := last_detachable_et_symbol_value
						read_token
					end
					if last_token = E_UNIQUE then
						l_unique_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
						l_query := ast_factory.new_unique_attribute (l_extended_feature_name, l_type, l_assigner, l_equal_symbol, l_unique_keyword, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_query
					else
						parse_attribute_constant
						l_constant := last_attribute_constant
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
						l_query := ast_factory.new_constant_attribute (l_extended_feature_name, l_type, l_assigner, l_equal_symbol, l_constant, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
						l_feature := l_query
					end
				else
					parse_optional_semicolon
					l_semicolon_symbol := last_semicolon
					l_query := ast_factory.new_attribute (l_extended_feature_name, l_type, l_assigner, l_semicolon_symbol, last_client_list, last_feature_clause, last_class)
					l_feature := l_query
				end
				if l_feature /= Void then
					l_feature.set_frozen_keyword (l_frozen_keyword)
				end
				if l_has_type then
					register_query (l_query)
					from until nb <= 0 loop
						l_extended_feature_name := last_extended_feature_name_items.item
						l_frozen_keyword := last_extended_feature_name_frozen_items.item
						l_query_synonym := new_query_synonym (l_extended_feature_name, l_query)
						if l_query_synonym /= Void then
							l_query_synonym.set_frozen_keyword (l_frozen_keyword)
						end
						register_query_synonym (l_query_synonym)
						last_extended_feature_name_items.remove
						last_extended_feature_name_frozen_items.remove
						nb := nb - 1
					end
				else
					register_procedure (l_procedure)
					from until nb <= 0 loop
						l_extended_feature_name := last_extended_feature_name_items.item
						l_frozen_keyword := last_extended_feature_name_frozen_items.item
						l_procedure_synonym := new_procedure_synonym (l_extended_feature_name, l_procedure)
						if l_procedure_synonym /= Void then
							l_procedure_synonym.set_frozen_keyword (l_frozen_keyword)
						end
						register_procedure_synonym (l_procedure_synonym)
						last_extended_feature_name_items.remove
						last_extended_feature_name_frozen_items.remove
						nb := nb - 1
					end
				end
			else
				report_syntax_error (last_position, last_value, feature_name_expected)
			end
			end_indentation_mismatch := Void
		end

	parse_optional_formal_arguments
			-- Parse optional formal arguments.
			-- Make the result available in `last_formal_arguments`.
		local
			l_old_last_formal_argument_items_count: INTEGER
			l_left_parenthesis: detachable ET_SYMBOL
			l_first_semicolon: detachable ET_SEMICOLON_SYMBOL
			l_colon_symbol: detachable ET_SYMBOL
			l_type: detachable ET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_formal_argument: detachable ET_FORMAL_ARGUMENT
			l_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_done: BOOLEAN
			nb: INTEGER
		do
			last_formal_arguments := Void
			if last_token = Left_parenthesis_code then
				l_left_parenthesis := last_detachable_et_symbol_value
				read_token
				l_old_last_formal_argument_items_count := last_formal_argument_items.count
				if last_token = Semicolon_code then
					parse_optional_semicolon
					l_first_semicolon := ast_factory.new_first_semicolon (last_semicolon)
				end
				from until l_done loop
					if is_identifier_token (last_token) then
						l_identifier := last_detachable_et_identifier_value
						read_token
						if last_token = Comma_code then
							last_formal_argument_items.force (ast_factory.new_formal_comma_argument (ast_factory.new_argument_name_comma (l_identifier, last_detachable_et_symbol_value), dummy_type))
							nb := nb + 1
							read_token
						elseif last_token = Colon_code then
							l_colon_symbol := last_detachable_et_symbol_value
							read_token
							parse_type
							l_type := last_type
							if l_type /= Void then
								from until nb <= 0 loop
									if attached last_formal_argument_items.i_th (last_formal_argument_items.count - nb + 1) as l_last_formal_argument_item then
										l_last_formal_argument_item.formal_argument.set_declared_type (l_type)
									end
									nb := nb - 1
								end
							end
							nb := 0
							l_formal_argument := ast_factory.new_formal_argument (l_identifier, ast_factory.new_colon_type (l_colon_symbol, l_type))
							if last_token = Semicolon_code then
								parse_optional_semicolon
								last_formal_argument_items.force (ast_factory.new_formal_argument_semicolon (l_formal_argument, last_semicolon))
							else
								last_formal_argument_items.force (l_formal_argument)
							end
						elseif is_identifier_token (last_token) then
							l_identifier := last_detachable_et_identifier_value
							read_token
							last_formal_argument_items.force (ast_factory.new_formal_comma_argument (l_identifier, dummy_type))
							nb := nb + 1
							report_syntax_error (last_position, last_value, comma_symbol_expected)
						else
							report_syntax_error (last_position, last_value, colon_symbol_expected)
							l_done := True
						end
					else
						l_done := True
					end
				end
				if last_token = Right_parenthesis_code then
					nb := (last_formal_argument_items.count - l_old_last_formal_argument_items_count).max (0)
					l_formal_arguments := new_formal_arguments (l_left_parenthesis, last_detachable_et_symbol_value, nb)
					if l_formal_arguments /= Void then
						l_formal_arguments.set_first_semicolon (l_first_semicolon)
					end
					from until nb <= 0 loop
						if l_formal_arguments /= Void and attached last_formal_argument_items.item as l_last_formal_argument_item then
							l_formal_arguments.put_first (l_last_formal_argument_item)
						end
						last_formal_argument_items.remove
						nb := nb - 1
					end
					read_token
				else
					report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
				end
			end
			last_formal_arguments := l_formal_arguments
		end

	parse_optional_local_variables
			-- Parse optional local variables.
			-- Make the result available in `last_local_variables`.
		local
			l_old_last_local_variable_items_count: INTEGER
			l_local_keyword: detachable ET_KEYWORD
			l_first_semicolon: detachable ET_SEMICOLON_SYMBOL
			l_colon_symbol: detachable ET_SYMBOL
			l_type: detachable ET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_local_variable: detachable ET_LOCAL_VARIABLE
			l_local_variables: detachable ET_LOCAL_VARIABLE_LIST
			l_done: BOOLEAN
			nb: INTEGER
		do
			last_local_variables := Void
			if last_token = E_LOCAL then
				l_local_keyword := last_detachable_et_keyword_value
				l_old_last_local_variable_items_count := last_local_variable_items.count
				read_token
				if last_token = Semicolon_code then
					parse_optional_semicolon
					l_first_semicolon := ast_factory.new_first_semicolon (last_semicolon)
				end
				from until l_done loop
					if is_identifier_token (last_token) then
						l_identifier := last_detachable_et_identifier_value
						read_token
						if last_token = Comma_code then
							last_local_variable_items.force (ast_factory.new_local_comma_variable (ast_factory.new_local_name_comma (l_identifier, last_detachable_et_symbol_value), dummy_type))
							nb := nb + 1
							read_token
						elseif last_token = Colon_code then
							l_colon_symbol := last_detachable_et_symbol_value
							read_token
							parse_type
							l_type := last_type
							if l_type /= Void then
								from until nb <= 0 loop
									if attached last_local_variable_items.i_th (last_local_variable_items.count - nb + 1) as l_local_variable_item then
										l_local_variable_item.local_variable.set_declared_type (l_type)
									end
									nb := nb - 1
								end
							end
							nb := 0
							l_local_variable := ast_factory.new_local_variable (l_identifier, ast_factory.new_colon_type (l_colon_symbol, l_type))
							if last_token = Semicolon_code then
								parse_optional_semicolon
								last_local_variable_items.force (ast_factory.new_local_variable_semicolon (l_local_variable, last_semicolon))
							else
								last_local_variable_items.force (l_local_variable)
							end
						elseif is_identifier_token (last_token) then
							l_identifier := last_detachable_et_identifier_value
							read_token
							last_local_variable_items.force (ast_factory.new_local_comma_variable (l_identifier, dummy_type))
							nb := nb + 1
							report_syntax_error (last_position, last_value, comma_symbol_expected)
						else
							report_syntax_error (last_position, last_value, colon_symbol_expected)
							l_done := True
						end
					else
						l_done := True
					end
				end
				nb := (last_local_variable_items.count - l_old_last_local_variable_items_count).max (0)
				l_local_variables := new_local_variables (l_local_keyword, nb)
				if l_local_variables /= Void then
					l_local_variables.set_first_semicolon (l_first_semicolon)
				end
				from until nb <= 0 loop
					if l_local_variables /= Void and attached last_local_variable_items.item as l_last_local_variable_item then
						l_local_variables.put_first (l_last_local_variable_item)
					end
					last_local_variable_items.remove
					nb := nb - 1
				end
			end
			last_local_variables := l_local_variables
		end

	parse_expression
			-- Parse an expression.
			-- Make the result available in `last_expression`.
		do
			last_expression := Void
			parse_non_binary_expression
			parse_binary_expression (last_expression, True)
		end

	parse_binary_expression (a_left_expression: detachable ET_EXPRESSION; a_recursive: BOOLEAN)
			-- Parse operator and right-hand-side of binary expression, if any.
			-- Make the result available in `last_expression`.
		local
			l_keyword_operator: detachable ET_KEYWORD_OPERATOR
			l_operator: detachable ET_OPERATOR
			l_symbol: detachable ET_SYMBOL
			l_left_expression: detachable ET_EXPRESSION
			l_right_expression: detachable ET_EXPRESSION
			l_done: BOOLEAN
		do
			last_expression := Void
			l_left_expression := a_left_expression
			inspect last_token
			when E_IMPLIES, E_IMPLIES_SYMBOL then
				if last_token = E_IMPLIES then
					l_operator := last_detachable_et_keyword_operator_value
				else
					l_operator := last_detachable_et_symbol_operator_value
				end
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when E_IMPLIES, E_IMPLIES_SYMBOL then
							-- Same precedence, left associative.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL then
				if last_token = E_OR then
					l_keyword_operator := last_detachable_et_keyword_operator_value
					l_operator := l_keyword_operator
					read_token
					if last_token = E_ELSE then
						l_operator := ast_factory.new_infix_or_else_operator (l_keyword_operator, last_detachable_et_keyword_value)
						read_token
					end
				elseif last_token = E_XOR then
					l_operator := last_detachable_et_keyword_operator_value
					read_token
				else
					l_operator := last_detachable_et_symbol_operator_value
					read_token
				end
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL then
				if last_token = E_AND then
					l_keyword_operator := last_detachable_et_keyword_operator_value
					l_operator := l_keyword_operator
					read_token
					if last_token = E_THEN then
						l_operator := ast_factory.new_infix_and_then_operator (l_keyword_operator, last_detachable_et_keyword_value)
						read_token
					end
				else
					l_operator := last_detachable_et_symbol_operator_value
					read_token
				end
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when Less_than_code, Greater_than_code, E_LE, E_GE then
				l_operator := last_detachable_et_symbol_operator_value
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when Equal_code, E_NE then
				l_symbol := last_detachable_et_symbol_value
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_equality_expression (l_left_expression, l_symbol, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_equality_expression (l_left_expression, l_symbol, l_right_expression)
						l_done := True
					end
				end
			when Tilde_code, E_NOT_TILDE then
				l_symbol := last_detachable_et_symbol_value
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_object_equality_expression (l_left_expression, l_symbol, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_object_equality_expression (l_left_expression, l_symbol, l_right_expression)
						l_done := True
					end
				end
			when Plus_code, Minus_code then
				if last_token = Plus_code then
					l_operator := ast_factory.new_infix_plus_operator (last_detachable_et_symbol_operator_value)
				else
					l_operator := ast_factory.new_infix_minus_operator (last_detachable_et_symbol_operator_value)
				end
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
						Plus_code, Minus_code
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Star_code, Slash_code, E_DIV, E_MOD,
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when Star_code, Slash_code, E_DIV, E_MOD then
				l_operator := last_detachable_et_symbol_operator_value
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD
					then
							-- Lower or same precedence, left associative.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when Caret_code then
				l_operator := last_detachable_et_symbol_operator_value
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				from until l_done loop
					inspect last_token
					when
						E_IMPLIES, E_IMPLIES_SYMBOL,
						E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
						E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
						Less_than_code, Greater_than_code, E_LE, E_GE,
						Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
						Plus_code, Minus_code,
						Star_code, Slash_code, E_DIV, E_MOD
					then
							-- Lower precedence.
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						if a_recursive then
							parse_binary_expression (l_left_expression, True)
							l_left_expression := last_expression
						end
						l_done := True
					when
						Caret_code,
						E_FREEOP, At_code
					then
							-- Higher precedence or same precedence, right associative.
						parse_binary_expression (l_right_expression, False)
						l_right_expression := last_expression
					else
						l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
						l_done := True
					end
				end
			when E_FREEOP, At_code then
				if last_token = At_code then
					l_operator := ast_factory.new_infix_free_operator_from_symbol (last_detachable_et_symbol_operator_value)
				else
					l_operator := ast_factory.new_infix_free_operator (last_detachable_et_free_operator_value)
				end
				read_token
				parse_non_binary_expression
				l_right_expression := last_expression
				inspect last_token
				when
					E_IMPLIES, E_IMPLIES_SYMBOL,
					E_OR, E_XOR, E_OR_SYMBOL, E_OR_ELSE_SYMBOL, E_XOR_SYMBOL,
					E_AND, E_AND_SYMBOL, E_AND_THEN_SYMBOL,
					Less_than_code, Greater_than_code, E_LE, E_GE,
					Equal_code, E_NE, Tilde_code, E_NOT_TILDE,
					Plus_code, Minus_code,
					Star_code, Slash_code, E_DIV, E_MOD,
					Caret_code,
					E_FREEOP, At_code
				then
						-- Lower or same precedence, left associative.
					l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
					if a_recursive then
						parse_binary_expression (l_left_expression, True)
						l_left_expression := last_expression
					end
				else
					l_left_expression := ast_factory.new_infix_expression (l_left_expression, l_operator, l_right_expression)
				end
			else
			end
			last_expression := l_left_expression
		end

	parse_non_binary_expression
			-- Parse an expression.
			-- Make the result available in `last_expression`.
		local
			l_sign_symbol: detachable ET_SYMBOL_OPERATOR
			l_identifier: detachable ET_IDENTIFIER
			l_is_dot_call_target: BOOLEAN
			l_is_bracket_call_target: BOOLEAN
			l_at_symbol: detachable ET_SYMBOL_OPERATOR
			l_not_keyword: detachable ET_KEYWORD_OPERATOR
			l_not_symbol: detachable ET_SYMBOL_OPERATOR
			l_old_keyword: detachable ET_KEYWORD
			l_freeop_symbol: detachable ET_FREE_OPERATOR
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			inspect last_token
			when E_TRUE, E_FALSE then
				l_last_expression := last_detachable_et_boolean_constant_value
				l_is_bracket_call_target := True
				read_token
			when E_CHARACTER then
				l_last_expression := last_detachable_et_character_constant_value
				l_is_bracket_call_target := True
				read_token
			when E_INTEGER then
				l_last_expression := last_detachable_et_integer_constant_value
				read_token
			when E_REAL then
				l_last_expression := last_detachable_et_real_constant_value
				read_token
			when Plus_code then
				l_sign_symbol := last_detachable_et_symbol_operator_value
				read_token
				parse_non_binary_expression
				l_last_expression := new_prefix_plus_expression (l_sign_symbol, last_expression)
			when Minus_code then
				l_sign_symbol := last_detachable_et_symbol_operator_value
				read_token
				parse_non_binary_expression
				l_last_expression := new_prefix_minus_expression (l_sign_symbol, last_expression)
			when E_NOT then
				l_not_keyword := last_detachable_et_keyword_operator_value
				read_token
				parse_non_binary_expression
				l_last_expression := ast_factory.new_prefix_expression (l_not_keyword, last_expression)
			when E_NOT_SYMBOL then
				l_not_symbol := last_detachable_et_symbol_operator_value
				read_token
				parse_non_binary_expression
				l_last_expression := ast_factory.new_prefix_expression (l_not_symbol, last_expression)
			when E_FREEOP then
				l_freeop_symbol := last_detachable_et_free_operator_value
				read_token
				parse_non_binary_expression
				l_last_expression := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator (l_freeop_symbol), last_expression)
			when E_OLD then
				l_old_keyword := last_detachable_et_keyword_value
				read_token
				parse_non_binary_expression
				l_last_expression := ast_factory.new_old_expression (l_old_keyword, last_expression)
			when Left_parenthesis_code then
				parse_parenthesized_expression
				l_last_expression := last_parenthesized_expression
				l_is_bracket_call_target := True
				l_is_dot_call_target := True
			when E_LARRAY then
				parse_manifest_array
				l_last_expression := last_manifest_array
			when Left_bracket_code then
				parse_manifest_tuple
				l_last_expression := last_manifest_tuple
			when E_FEATURE then
				parse_old_static_call_expression
				l_last_expression := last_expression
				l_is_bracket_call_target := True
				l_is_dot_call_target := True
			when E_CURRENT then
				l_last_expression := last_detachable_et_current_value
				l_is_bracket_call_target := True
				l_is_dot_call_target := True
				read_token
			when E_RESULT then
				l_last_expression := last_detachable_et_result_value
				l_is_bracket_call_target := True
				l_is_dot_call_target := True
				read_token
			when E_VOID then
				l_last_expression := last_detachable_et_void_value
				read_token
			when E_ONCE_STRING then
				parse_once_manifest_string
				l_last_expression := last_expression
				l_is_bracket_call_target := True
			when E_PRECURSOR then
				parse_precursor_expression
				l_last_expression := last_expression
				l_is_bracket_call_target := True
				l_is_dot_call_target := True
			when E_ATTACHED then
				parse_object_test
				l_last_expression := last_expression
			when E_CREATE then
				parse_create_expression
				l_last_expression := last_create_expression
			when E_IF then
				parse_conditional_expression
				l_last_expression := last_expression
			when E_INSPECT then
				parse_multi_branch_expression
				l_last_expression := last_expression
			when E_ACROSS then
				parse_across_expression
				l_last_expression := last_expression
			when E_FOR_ALL then
				parse_for_all_expression
				l_last_expression := last_expression
			when E_THERE_EXISTS then
				parse_there_exists_expression
				l_last_expression := last_expression
			when E_AGENT then
				parse_agent_expression
				l_last_expression := last_expression
			when E_STRIP then
				parse_strip_expression
				l_last_expression := last_expression
			when Dollar_code then
				parse_address_expression
				l_last_expression := last_expression
			when Left_brace_code then
				parse_typed_expression (False)
				l_last_expression := last_expression
				l_is_dot_call_target := last_is_dot_call_target
				l_is_bracket_call_target := last_is_bracket_call_target
			when At_code then
				l_at_symbol := last_detachable_et_symbol_operator_value
				read_token
				parse_cursor_name_identifier
				if current_universe.use_obsolete_syntax_mode then
					l_last_expression := ast_factory.new_prefix_expression (ast_factory.new_prefix_free_operator_from_symbol (l_at_symbol), last_cursor_name_identifier)
				else
					l_last_expression := new_iteration_cursor (l_at_symbol, last_cursor_name_identifier)
				end
				l_is_bracket_call_target := True
				l_is_dot_call_target := True
			else
				if is_string_token (last_token) then
					l_last_expression := last_detachable_et_manifest_string_value
					l_is_bracket_call_target := True
					read_token
				elseif is_identifier_token (last_token) then
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					parse_optional_actual_arguments
					l_last_expression := new_unqualified_call_expression (l_identifier, last_actual_arguments)
					l_is_bracket_call_target := True
					l_is_dot_call_target := True
				else
					report_syntax_error (last_position, last_value, expression_expected)
				end
			end
			if (l_is_dot_call_target and last_token = Dot_code) or (l_is_bracket_call_target and last_token = Left_bracket_code) then
				parse_qualified_call_expression (l_last_expression, l_is_dot_call_target, l_is_bracket_call_target)
				l_last_expression := last_expression
			end
			last_expression := l_last_expression
		end

	parse_qualified_call_expression (a_target_expression: detachable ET_EXPRESSION; a_is_dot_call_target, a_is_bracket_call_target: BOOLEAN)
			-- Parse a qualified call expression where `a_target_expression`
			-- is the target of that call and where `a_is_dot_call_target`
			-- and `a_is_bracket_call_target` whether this target expression
			-- is a valid target for a dot call and/or a bracket expression.
			-- Make the result available in `last_expression`.
		local
			l_is_dot_call_target: BOOLEAN
			l_is_bracket_call_target: BOOLEAN
			l_target: detachable ET_EXPRESSION
			l_left_bracket_symbol: detachable ET_BRACKET_SYMBOL
			l_dot_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			l_last_expression := a_target_expression
			l_is_dot_call_target := a_is_dot_call_target
			l_is_bracket_call_target := a_is_bracket_call_target
			from until
				(l_is_bracket_call_target implies last_token /= Left_bracket_code) and
				(l_is_dot_call_target implies last_token /= Dot_code)
			loop
				if l_is_bracket_call_target and last_token = Left_bracket_code then
					l_target := l_last_expression
					l_left_bracket_symbol := last_detachable_et_bracket_symbol_value
					parse_bracket_arguments
					l_last_expression := ast_factory.new_bracket_expression (l_target, l_left_bracket_symbol, last_actual_arguments)
					l_is_dot_call_target := True
				elseif l_is_dot_call_target and last_token = Dot_code then
					l_target := l_last_expression
					l_dot_symbol := last_detachable_et_symbol_value
					read_token
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					parse_optional_actual_arguments
					l_last_expression := ast_factory.new_qualified_call_expression (l_target, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
					l_is_bracket_call_target := True
				end
			end
			last_expression := l_last_expression
		end

	parse_parenthesized_expression
			-- Parse a parenthesized expression.
			-- Make the result available in `last_parenthesized_expression`.
		local
			l_left_parenthesis_symbol: detachable ET_SYMBOL
			l_right_parenthesis_symbol: detachable ET_SYMBOL
		do
			last_parenthesized_expression := Void
			if last_token = Left_parenthesis_code then
				l_left_parenthesis_symbol := last_detachable_et_symbol_value
				read_token
				parse_expression
				if last_token = Right_parenthesis_code then
					l_right_parenthesis_symbol := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
				end
				last_parenthesized_expression := ast_factory.new_parenthesized_expression (l_left_parenthesis_symbol, last_expression, l_right_parenthesis_symbol)
			else
				report_syntax_error (last_position, last_value, left_parenthesis_symbol_expected)
			end
		end

	parse_typed_expression (a_agent_open_operand_accepted: BOOLEAN)
			-- Parse expression which starts with a type.
			-- Make the result available in `last_expression`.
			-- Also update `last_is_dot_call_target` and
			-- `last_is_bracket_call_target`.
			-- When `a_agent_open_operand_accepted` is True,
			-- accept agent open operand of the form
			-- '{TYPE} ?', make it available in `last_agent_open_operand`
			-- and set `last_is_agent_open_operand` to True.
		local
			l_sign_symbol: detachable ET_SYMBOL_OPERATOR
			l_sign_code: INTEGER
			l_left_brace_symbol: detachable ET_SYMBOL
			l_right_brace_symbol: detachable ET_SYMBOL
			l_dot_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_last_code: INTEGER
			l_colon_symbol: detachable ET_SYMBOL
			l_is_old_attached_expression: BOOLEAN
			l_type: detachable ET_TYPE
			l_last_expression: detachable ET_EXPRESSION
			l_is_dot_call_target: BOOLEAN
			l_is_bracket_call_target: BOOLEAN
		do
			last_expression := Void
			last_agent_open_operand := Void
			last_is_dot_call_target := False
			last_is_bracket_call_target := False
			last_is_agent_open_operand := False
			if last_token = Left_brace_code then
				l_left_brace_symbol := last_detachable_et_symbol_value
				read_token
				if is_identifier_token (last_token) then
					l_last_code := last_token
					l_identifier := last_detachable_et_identifier_value
					read_token
					if last_token = Colon_code then
						l_colon_symbol := last_detachable_et_symbol_value
						l_is_old_attached_expression := True
						read_token
					else
						unread_token
						set_last_identifier_token (l_last_code, l_identifier)
					end
				end
				parse_type
				l_type := last_type
				if last_token = Right_brace_code then
					l_right_brace_symbol := last_detachable_et_symbol_value
					read_token
					if l_is_old_attached_expression then
						parse_non_binary_expression
						l_last_expression := new_old_object_test (l_left_brace_symbol, l_identifier, l_colon_symbol, l_type, l_right_brace_symbol, last_expression)
					elseif last_token = E_INTEGER then
						if attached last_detachable_et_integer_constant_value as l_integer_constant then
							l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
							l_integer_constant.set_cast_type (l_target_type)
							l_last_expression := l_integer_constant
						end
						read_token
					elseif last_token = E_REAL then
						if attached last_detachable_et_real_constant_value as l_real_constant then
							l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
							l_real_constant.set_cast_type (l_target_type)
							l_last_expression := l_real_constant
						end
						read_token
					elseif last_token = Plus_code or last_token = Minus_code then
						l_sign_symbol := last_detachable_et_symbol_operator_value
						l_sign_code := last_token
						read_token
						if last_token = E_INTEGER then
							if attached last_detachable_et_integer_constant_value as l_integer_constant then
								l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
								l_integer_constant.set_cast_type (l_target_type)
								l_integer_constant.set_sign (l_sign_symbol)
								l_last_expression := l_integer_constant
							end
							read_token
						elseif last_token = E_REAL then
							if attached last_detachable_et_real_constant_value as l_real_constant then
								l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
								l_real_constant.set_cast_type (l_target_type)
								l_real_constant.set_sign (l_sign_symbol)
								l_last_expression := l_real_constant
							end
							read_token
						else
							unread_token
							set_last_symbol_operator_token (l_sign_code, l_sign_symbol)
							l_last_expression := ast_factory.new_manifest_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
							l_is_bracket_call_target := True
						end
					elseif last_token = E_CHARACTER then
						if attached last_detachable_et_character_constant_value as l_character_constant then
							l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
							l_character_constant.set_cast_type (l_target_type)
							l_last_expression := l_character_constant
						end
						l_is_bracket_call_target := True
						read_token
					elseif last_token = E_LARRAY then
						parse_manifest_array
						if attached last_manifest_array as l_manifest_array then
							l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
							l_manifest_array.set_cast_type (l_target_type)
						end
						l_last_expression := last_manifest_array
						l_is_bracket_call_target := True
					elseif last_token = Dot_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
						l_dot_symbol := last_detachable_et_symbol_value
						read_token
						parse_feature_name_identifier
						l_identifier := last_feature_name_identifier
						parse_optional_actual_arguments
						l_last_expression := ast_factory.new_static_call_expression (Void, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
						l_is_bracket_call_target := True
						l_is_dot_call_target := True
					elseif a_agent_open_operand_accepted and then last_token = Question_mark_code then
							last_agent_open_operand := ast_factory.new_agent_typed_open_argument (l_left_brace_symbol, l_type, l_right_brace_symbol, last_detachable_et_question_mark_symbol_value)
							last_is_agent_open_operand := True
							read_token
					elseif is_string_token (last_token) then
						if attached last_detachable_et_manifest_string_value as l_manifest_string then
							l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
							l_manifest_string.set_cast_type (l_target_type)
							l_last_expression := l_manifest_string
						end
						l_is_bracket_call_target := True
						read_token
					else
						l_last_expression := ast_factory.new_manifest_type (l_left_brace_symbol, last_type, l_right_brace_symbol)
						l_is_bracket_call_target := True
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, left_brace_symbol_expected)
			end
			last_expression := l_last_expression
			last_is_dot_call_target := l_is_dot_call_target
			last_is_bracket_call_target := l_is_bracket_call_target
		end

	parse_precursor_expression
			-- Parse a precursor expression.
			-- Make the result available in `last_expression`.
		local
			l_precursor_keyword: detachable ET_PRECURSOR_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_precursor_class_name: detachable ET_PRECURSOR_CLASS_NAME
		do
			last_expression := Void
			if last_token = E_PRECURSOR then
				l_precursor_keyword := last_detachable_et_precursor_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_class_name_identifier
					if last_token = Right_brace_code then
						l_precursor_class_name := ast_factory.new_precursor_class_name (l_left_brace_symbol, last_class_name_identifier, last_detachable_et_symbol_value)
						read_token
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				end
				parse_optional_actual_arguments
				last_expression := ast_factory.new_precursor_expression (False, l_precursor_keyword, l_precursor_class_name, last_actual_arguments)
			else
				report_syntax_error (last_position, last_value, precursor_keyword_expected)
			end
		end

	parse_create_expression
			-- Parse a create expression.
			-- Make the result available in `last_create_expression`.
		local
			l_create_keyword: detachable ET_KEYWORD
			l_less_than_symbol: detachable ET_SYMBOL_OPERATOR
			l_region: detachable ET_CREATION_REGION
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_dot_symbol: detachable ET_SYMBOL
			l_call: detachable ET_QUALIFIED_CALL
		do
			last_create_expression := Void
			if last_token = E_CREATE then
				l_create_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Less_than_code then
					l_less_than_symbol := last_detachable_et_symbol_operator_value
					read_token
					parse_class_name_identifier
					if last_token = Greater_than_code then
						l_region := ast_factory.new_creation_region (l_less_than_symbol, last_class_name_identifier, last_detachable_et_symbol_operator_value)
						read_token
					else
						report_syntax_error (last_position, last_value, greater_than_symbol_expected)
					end
				end
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					if last_token = Right_brace_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
						read_token
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				else
					report_syntax_error (last_position, last_value, left_brace_symbol_expected)
				end
				if last_token = Dot_code then
					l_dot_symbol := last_detachable_et_symbol_value
					read_token
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					parse_optional_actual_arguments
					l_call := ast_factory.new_qualified_call (new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
				end
				last_create_expression := ast_factory.new_create_expression (l_create_keyword, l_region, l_target_type, l_call)
			else
				report_syntax_error (last_position, last_value, create_keyword_expected)
			end
		end

	parse_across_expression
			-- Parse an across expression.
			-- Make the result available in `last_expression`.
		local
			l_across_keyword: detachable ET_KEYWORD
			l_iterable_expression: detachable ET_EXPRESSION
			l_as_keyword: detachable ET_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
			l_loop_invariants: detachable ET_LOOP_INVARIANTS
			l_until_keyword: detachable ET_KEYWORD
			l_until_conditional: detachable ET_CONDITIONAL
			l_all_some_keyword: detachable ET_KEYWORD
			l_all_some_conditional: detachable ET_CONDITIONAL
			l_variant: detachable ET_VARIANT
			l_across_header: detachable ET_ACROSS_EXPRESSION
			l_last_expression: detachable ET_EXPRESSION
			l_is_all: BOOLEAN
			l_end_keyword: detachable ET_KEYWORD
			l_unknown_expression: ET_EXPRESSION
			l_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_ACROSS then
				l_unknown_expression := tokens.true_keyword
				l_across_keyword := last_detachable_et_keyword_value
				read_token
				parse_expression
				l_iterable_expression := last_expression
				if l_iterable_expression = Void and has_syntax_error then
					l_iterable_expression := l_unknown_expression
				end
				if last_token = E_AS or last_token = E_IS then
					l_as_keyword := last_detachable_et_keyword_value
					read_token
					parse_cursor_name_identifier
					l_identifier := last_cursor_name_identifier
				else
					report_syntax_error (last_position, last_value, all_or_some_keyword_expected)
					create l_identifier.make (tokens.unknown_name)
				end
				l_across_header := new_across_expression_header (l_across_keyword, l_iterable_expression, l_as_keyword, l_identifier)
				parse_optional_loop_invariants
				l_loop_invariants := last_loop_invariants
				if last_token = E_UNTIL then
					l_until_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_until_conditional := ast_factory.new_conditional (l_until_keyword, last_expression)
				end
				if last_token = E_ALL or last_token = E_SOME then
					l_is_all := last_token = E_ALL
					l_all_some_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_expression := last_expression
					if l_expression = Void and has_syntax_error then
						l_expression := l_unknown_expression
					end
					l_all_some_conditional := ast_factory.new_conditional (l_all_some_keyword, l_expression)
				else
					report_syntax_error (last_position, last_value, as_keyword_expected)
				end
				if l_all_some_conditional = Void and has_syntax_error then
					l_all_some_conditional := l_unknown_expression
				end
				parse_optional_variant
				l_variant := last_variant
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				if l_is_all then
					l_last_expression := new_across_all_expression (l_across_header, l_loop_invariants, l_until_conditional, l_all_some_conditional, l_variant, l_end_keyword)
				else
					l_last_expression := new_across_some_expression (l_across_header, l_loop_invariants, l_until_conditional, l_all_some_conditional, l_variant, l_end_keyword)
				end
			else
				report_syntax_error (last_position, last_value, across_keyword_expected)
			end
			last_expression := l_last_expression
		end

	parse_for_all_expression
			-- Parse a for_all expression.
			-- Make the result available in `last_expression`.
		local
			l_for_all_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_colon_symbol: detachable ET_SYMBOL
			l_expression: detachable ET_EXPRESSION
			l_bar_symbol: detachable ET_SYMBOL
			l_quantifier_expression_header: detachable ET_QUANTIFIER_EXPRESSION
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_FOR_ALL then
				l_for_all_symbol := last_detachable_et_symbol_value
				read_token
				parse_cursor_name_identifier
				l_identifier := last_cursor_name_identifier
				if last_token = Colon_code then
					l_colon_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_expression := last_expression
					if last_token = E_BAR then
						l_bar_symbol := last_detachable_et_symbol_value
						read_token
					else
						report_syntax_error (last_position, last_value, bar_symbol_expected)
					end
					l_quantifier_expression_header := new_for_all_quantifier_expression_header (l_for_all_symbol, l_identifier, l_colon_symbol, l_expression, l_bar_symbol)
					parse_expression
					l_expression := last_expression
				end
				l_last_expression := new_quantifier_expression (l_quantifier_expression_header, l_expression)
			else
				report_syntax_error (last_position, last_value, for_all_symbol_expected)
			end
			last_expression := l_last_expression
		end

	parse_there_exists_expression
			-- Parse a there_exists expression.
			-- Make the result available in `last_expression`.
		local
			l_for_all_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_colon_symbol: detachable ET_SYMBOL
			l_expression: detachable ET_EXPRESSION
			l_bar_symbol: detachable ET_SYMBOL
			l_quantifier_expression_header: detachable ET_QUANTIFIER_EXPRESSION
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_THERE_EXISTS then
				l_for_all_symbol := last_detachable_et_symbol_value
				read_token
				parse_cursor_name_identifier
				l_identifier := last_cursor_name_identifier
				if last_token = Colon_code then
					l_colon_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_expression := last_expression
					if last_token = E_BAR then
						l_bar_symbol := last_detachable_et_symbol_value
						read_token
					else
						report_syntax_error (last_position, last_value, bar_symbol_expected)
					end
					l_quantifier_expression_header := new_there_exists_quantifier_expression_header (l_for_all_symbol, l_identifier, l_colon_symbol, l_expression, l_bar_symbol)
					parse_expression
					l_expression := last_expression
				end
				l_last_expression := new_quantifier_expression (l_quantifier_expression_header, l_expression)
			else
				report_syntax_error (last_position, last_value, there_exists_symbol_expected)
			end
			last_expression := l_last_expression
		end

	parse_conditional_expression
			-- Parse a conditional expression.
			-- Make the result available in `last_expression`.
		local
			l_if_keyword: detachable ET_KEYWORD
			l_then_keyword: detachable ET_KEYWORD
			l_else_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_conditional_expression: detachable ET_EXPRESSION
			l_then_expression: detachable ET_EXPRESSION
			l_else_expression: detachable ET_EXPRESSION
			l_elseif_expression_list: detachable ET_ELSEIF_EXPRESSION_LIST
			l_old_last_elseif_expression_items_count: INTEGER
			l_elseif_keyword: detachable ET_KEYWORD
			l_elseif_then_keyword: detachable ET_KEYWORD
			l_elseif_conditional_expression: detachable ET_EXPRESSION
			l_elseif_conditional: detachable ET_CONDITIONAL
			l_elseif_then_expression: detachable ET_EXPRESSION
			nb: INTEGER
			l_last_expression: detachable ET_EXPRESSION
			l_unknown_expression: ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_IF then
				l_unknown_expression := tokens.true_keyword
				l_if_keyword := last_detachable_et_keyword_value
				read_token
				parse_expression
				l_conditional_expression := last_expression
				if l_conditional_expression = Void and has_syntax_error then
					l_conditional_expression := l_unknown_expression
				end
				if last_token = E_THEN then
					l_then_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_then_expression := last_expression
				else
					report_syntax_error (last_position, last_value, then_keyword_expected)
				end
				if l_then_expression = Void and has_syntax_error then
					l_then_expression := l_unknown_expression
				end
				l_old_last_elseif_expression_items_count := last_elseif_expression_items.count
				from until last_token /= E_ELSEIF loop
					l_elseif_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_elseif_conditional_expression := last_expression
					l_elseif_conditional := ast_factory.new_conditional (l_elseif_keyword, l_elseif_conditional_expression)
					if last_token = E_THEN then
						l_elseif_then_keyword := last_detachable_et_keyword_value
						read_token
						parse_expression
						l_elseif_then_expression := last_expression
					else
						report_syntax_error (last_position, last_value, then_keyword_expected)
						l_elseif_then_expression := Void
					end
					last_elseif_expression_items.force (ast_factory.new_elseif_expression (l_elseif_conditional, l_elseif_then_keyword, l_elseif_then_expression))
				end
				nb := last_elseif_expression_items.count - l_old_last_elseif_expression_items_count
				if nb > 0 then
					l_elseif_expression_list := ast_factory.new_elseif_expression_list (nb)
					from until nb <= 0 loop
						if l_elseif_expression_list /= Void and attached last_elseif_expression_items.item as l_last_elseif_expression_item then
							l_elseif_expression_list.put_first (l_last_elseif_expression_item)
						end
						last_elseif_expression_items.remove
						nb := nb - 1
					end
				end
				if last_token = E_ELSE then
					l_else_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_else_expression := last_expression
				else
					report_syntax_error (last_position, last_value, else_keyword_expected)
				end
				if l_else_expression = Void and has_syntax_error then
					l_else_expression := l_unknown_expression
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_last_expression := ast_factory.new_if_expression (ast_factory.new_conditional (l_if_keyword, l_conditional_expression), l_then_keyword, l_then_expression, l_elseif_expression_list, l_else_keyword, l_else_expression, l_end_keyword)
			else
				report_syntax_error (last_position, last_value, if_keyword_expected)
			end
			last_expression := l_last_expression
		end

	parse_multi_branch_expression
			-- Parse a multi branch expression.
			-- Make the result available in `last_expression`.
		local
			l_inspect_keyword: detachable ET_KEYWORD
			l_then_keyword: detachable ET_KEYWORD
			l_else_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_conditional_expression: detachable ET_EXPRESSION
			l_else_expression: detachable ET_CONDITIONAL
			l_when_expression_list: detachable ET_WHEN_EXPRESSION_LIST
			l_old_last_when_expression_items_count: INTEGER
			l_choices: detachable ET_CHOICE_LIST
			l_expression: detachable ET_EXPRESSION
			nb: INTEGER
			l_last_expression: detachable ET_EXPRESSION
			l_unknown_expression: ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_INSPECT then
				l_unknown_expression := tokens.true_keyword
				l_inspect_keyword := last_detachable_et_keyword_value
				read_token
				parse_expression
				l_conditional_expression := last_expression
				if l_conditional_expression = Void and has_syntax_error then
					l_conditional_expression := l_unknown_expression
				end
				l_old_last_when_expression_items_count := last_when_expression_items.count
				from until last_token /= E_WHEN loop
					parse_choices
					l_choices := last_choices
					if last_token = E_THEN then
						l_then_keyword := last_detachable_et_keyword_value
						read_token
						parse_expression
						l_expression := last_expression
					else
						report_syntax_error (last_position, last_value, then_keyword_expected)
						l_expression := Void
					end
					last_when_expression_items.force (ast_factory.new_when_expression (l_choices, l_then_keyword, l_expression))
				end
				nb := last_when_expression_items.count - l_old_last_when_expression_items_count
				if nb > 0 then
					l_when_expression_list := ast_factory.new_when_expression_list (nb)
					from until nb <= 0 loop
						if l_when_expression_list /= Void and attached last_when_expression_items.item as last_when_expression_item then
							l_when_expression_list.put_first (last_when_expression_item)
						end
						last_when_expression_items.remove
						nb := nb - 1
					end
				end
				if last_token = E_ELSE then
					l_else_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_else_expression := ast_factory.new_conditional (l_else_keyword, last_expression)
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_last_expression := ast_factory.new_inspect_expression (ast_factory.new_conditional (l_inspect_keyword, l_conditional_expression), l_when_expression_list, l_else_expression, l_end_keyword)
			else
				report_syntax_error (last_position, last_value, inspect_keyword_expected)
			end
			last_expression := l_last_expression
		end

	parse_choices
			-- Parse choices.
			-- Make the result available in `last_choices`.
		local
			l_when_keyword: detachable ET_KEYWORD
			l_old_last_choice_items_count: INTEGER
			l_choice: detachable ET_CHOICE
			l_choices: detachable ET_CHOICE_LIST
			nb: INTEGER
			l_done: BOOLEAN
			l_choice_expected: BOOLEAN
		do
			last_choices := Void
			if last_token = E_WHEN then
				l_when_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_choice_items_count := last_choice_items.count
				from until l_done loop
					if last_token = E_THEN then
						if l_choice_expected then
							report_syntax_error (last_position, last_value, integer_or_character_constant_expected)
						end
						l_done := True
					else
						l_choice_expected := False
						parse_choice
						l_choice := last_choice
						if last_token = Comma_code then
							last_choice_items.force (ast_factory.new_choice_comma (l_choice, last_detachable_et_symbol_value))
							l_choice_expected := True
							read_token
						else
							last_choice_items.force (l_choice)
							if last_token /= E_THEN and then is_choice_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				nb := (last_choice_items.count - l_old_last_choice_items_count).max (0)
				l_choices := ast_factory.new_choice_list (l_when_keyword, nb)
				from until nb <= 0 loop
					if l_choices /= Void and then attached last_choice_items.item as l_last_choice_item then
						l_choices.put_first (l_last_choice_item)
					end
					last_choice_items.remove
					nb := nb - 1
				end
			else
				report_syntax_error (last_position, last_value, when_keyword_expected)
			end
			last_choices := l_choices
		end

	parse_choice
			-- Parse a choice.
			-- Make the result available in `last_choice`.
		local
			l_dotdot_symbol: detachable ET_SYMBOL
			l_left: detachable ET_CHOICE_CONSTANT
		do
			last_choice := Void
			parse_choice_constant
			l_left := last_choice_constant
			last_choice := l_left
			if last_token = E_DOTDOT then
				l_dotdot_symbol := last_detachable_et_symbol_value
				read_token
				parse_choice_constant
				last_choice := ast_factory.new_choice_range (l_left, l_dotdot_symbol, last_choice_constant)
			end
		end

	parse_choice_constant
			-- Parse a choice constant.
			-- Make the result available in `last_choice_constant`.
		local
			l_sign_symbol: detachable ET_SYMBOL_OPERATOR
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_dot_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_last_choice_constant: detachable ET_CHOICE_CONSTANT
		do
			last_choice_constant := Void
			inspect last_token
			when E_CHARACTER then
				l_last_choice_constant := last_detachable_et_character_constant_value
				read_token
			when E_INTEGER then
				l_last_choice_constant := last_detachable_et_integer_constant_value
				read_token
			when Plus_code, Minus_code then
				l_sign_symbol := last_detachable_et_symbol_operator_value
				read_token
				if last_token = E_INTEGER then
					if attached last_detachable_et_integer_constant_value as l_integer_constant then
						l_integer_constant.set_sign (l_sign_symbol)
						l_last_choice_constant := l_integer_constant
					end
					read_token
				else
					report_syntax_error (last_position, last_value, integer_constant_expected)
				end
			when E_IDENTIFIER, E_NONE, E_TUPLE then
				l_last_choice_constant := new_choice_attribute_constant (last_detachable_et_identifier_value)
				read_token
			when E_FEATURE then
				parse_old_static_call_expression
				if attached {ET_CHOICE_CONSTANT} last_expression as l_choice_constant then
					l_last_choice_constant := l_choice_constant
				end
			when Left_brace_code then
				l_left_brace_symbol := last_detachable_et_symbol_value
				read_token
				parse_type
				if last_token = Right_brace_code then
					l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
					read_token
					if last_token = E_INTEGER then
						if attached last_detachable_et_integer_constant_value as l_integer_constant then
							l_integer_constant.set_cast_type (l_target_type)
							l_last_choice_constant := l_integer_constant
						end
						read_token
					elseif last_token = E_CHARACTER then
						if attached last_detachable_et_character_constant_value as l_character_constant then
							l_character_constant.set_cast_type (l_target_type)
							l_last_choice_constant := l_character_constant
						end
						read_token
					elseif last_token = Plus_code or last_token = Minus_code then
						l_sign_symbol := last_detachable_et_symbol_operator_value
						read_token
						if last_token = E_INTEGER then
							if attached last_detachable_et_integer_constant_value as l_integer_constant then
								l_integer_constant.set_cast_type (l_target_type)
								l_integer_constant.set_sign (l_sign_symbol)
								l_last_choice_constant := l_integer_constant
							end
							read_token
						else
							report_syntax_error (last_position, last_value, integer_constant_expected)
						end
					elseif last_token = Dot_code then
						l_dot_symbol := last_detachable_et_symbol_value
						read_token
						parse_feature_name_identifier
						l_identifier := last_feature_name_identifier
						parse_optional_actual_arguments
						l_last_choice_constant := ast_factory.new_static_call_expression (Void, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
					else
						report_syntax_error (last_position, last_value, integer_or_character_constant_expected)
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, integer_or_character_constant_expected)
			end
			last_choice_constant := l_last_choice_constant
		end

	parse_attribute_constant
			-- Parse an attribute constant.
			-- Make the result available in `last_attribute_constant`.
		local
			l_constant: detachable ET_CONSTANT
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_sign_symbol: detachable ET_SYMBOL_OPERATOR
		do
			last_attribute_constant := Void
			inspect last_token
			when E_TRUE, E_FALSE then
				l_constant := last_detachable_et_boolean_constant_value
				read_token
			when E_CHARACTER then
				l_constant := last_detachable_et_character_constant_value
				read_token
			when E_INTEGER then
				l_constant := last_detachable_et_integer_constant_value
				read_token
			when E_REAL then
				l_constant := last_detachable_et_real_constant_value
				read_token
			when Plus_code, Minus_code then
				l_sign_symbol := last_detachable_et_symbol_operator_value
				read_token
				if last_token = E_INTEGER then
					if attached last_detachable_et_integer_constant_value as l_integer_constant then
						l_integer_constant.set_sign (l_sign_symbol)
						l_constant := l_integer_constant
					end
					read_token
				elseif last_token = E_REAL then
					if attached last_detachable_et_real_constant_value as l_real_constant then
						l_real_constant.set_sign (l_sign_symbol)
						l_constant := l_real_constant
					end
					read_token
				else
					report_syntax_error (last_position, last_value, integer_or_real_constant_expected)
				end
			when Left_brace_code then
				l_left_brace_symbol := last_detachable_et_symbol_value
				read_token
				parse_type
				if last_token = Right_brace_code then
					l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
					read_token
					inspect last_token
					when E_CHARACTER then
						if attached last_detachable_et_character_constant_value as l_character_constant then
							l_character_constant.set_cast_type (l_target_type)
							l_constant := l_character_constant
						end
						read_token
					when E_INTEGER then
						if attached last_detachable_et_integer_constant_value as l_integer_constant then
							l_integer_constant.set_cast_type (l_target_type)
							l_constant := l_integer_constant
						end
						read_token
					when E_REAL then
						if attached last_detachable_et_real_constant_value as l_real_constant then
							l_real_constant.set_cast_type (l_target_type)
							l_constant := l_real_constant
						end
						read_token
					when Plus_code, Minus_code then
						l_sign_symbol := last_detachable_et_symbol_operator_value
						read_token
						if last_token = E_INTEGER then
							if attached last_detachable_et_integer_constant_value as l_integer_constant then
								l_integer_constant.set_sign (l_sign_symbol)
								l_integer_constant.set_cast_type (l_target_type)
								l_constant := l_integer_constant
							end
							read_token
						elseif last_token = E_REAL then
							if attached last_detachable_et_real_constant_value as l_real_constant then
								l_real_constant.set_sign (l_sign_symbol)
								l_real_constant.set_cast_type (l_target_type)
								l_constant := l_real_constant
							end
							read_token
						else
							report_syntax_error (last_position, last_value, integer_or_real_constant_expected)
						end
					else
						if is_string_token (last_token) then
							if attached last_detachable_et_manifest_string_value as l_manifest_string then
								l_manifest_string.set_cast_type (l_target_type)
								l_constant := l_manifest_string
							end
							read_token
						else
							report_syntax_error (last_position, last_value, manifest_constant_expected)
						end
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
			else
				if is_string_token (last_token) then
					l_constant := last_detachable_et_manifest_string_value
					read_token
				else
					report_syntax_error (last_position, last_value, manifest_constant_expected)
				end
			end
			last_attribute_constant := l_constant
		end

	parse_object_test
			-- Parse an object-test.
			-- Make the result available in `last_expression`.
		local
			l_attached_keyword: detachable ET_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_expression: detachable ET_EXPRESSION
			l_as_keyword: detachable ET_KEYWORD
			l_dot_symbol: detachable ET_SYMBOL
			l_expression_found: BOOLEAN
			l_last_expression: detachable ET_EXPRESSION
			l_unknown_expression: ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_ATTACHED then
				l_unknown_expression := tokens.true_keyword
				l_attached_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					if last_token = Right_brace_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
						read_token
						if last_token = Dot_code then
							l_dot_symbol := last_detachable_et_symbol_value
							read_token
							parse_feature_name_identifier
							l_identifier := last_feature_name_identifier
							parse_optional_actual_arguments
							l_expression := ast_factory.new_static_call_expression (Void, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
							if last_token = Dot_code or last_token = Left_bracket_code then
								parse_qualified_call_expression (l_expression, True, True)
								l_expression := last_expression
							end
							l_expression_found := True
							l_target_type := Void
						end
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				end
				if not l_expression_found then
					parse_non_binary_expression
					l_expression := last_expression
				end
				if l_expression = Void and has_syntax_error then
					l_expression := l_unknown_expression
				end
				if last_token = E_AS then
					l_as_keyword := last_detachable_et_keyword_value
					read_token
					parse_object_test_local_identifier
					l_identifier := last_object_test_local_identifier
					l_last_expression := new_named_object_test (l_attached_keyword, l_target_type, l_expression, l_as_keyword, l_identifier)
				else
					l_last_expression := ast_factory.new_object_test (l_attached_keyword, l_target_type, l_expression)
				end
			else
				report_syntax_error (last_position, last_value, attached_keyword_expected)
			end
			last_expression := l_last_expression
		end

	parse_old_static_call_expression
			-- Parse a static call expression (old syntax).
			-- Make the result available in `last_expression`.
		local
			l_feature_keyword: detachable ET_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_dot_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_FEATURE then
				l_feature_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					if last_token = Right_brace_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
						read_token
						if last_token = Dot_code then
							l_dot_symbol := last_detachable_et_symbol_value
							read_token
							parse_feature_name_identifier
							l_identifier := last_feature_name_identifier
							parse_optional_actual_arguments
							l_last_expression := ast_factory.new_static_call_expression (l_feature_keyword, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
						else
							report_syntax_error (last_position, last_value, dot_symbol_expected)
						end
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				else
					report_syntax_error (last_position, last_value, left_brace_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, feature_keyword_expected)
			end
			last_expression := l_last_expression
		end

	parse_strip_expression
			-- Parse strip expression.
			-- Make the result available in `last_expression`.
		local
			l_strip_keyword: detachable ET_KEYWORD
			l_left_parenthesis: detachable ET_SYMBOL
			l_right_parenthesis: detachable ET_SYMBOL
			l_old_last_feature_name_items_count: INTEGER
			l_feature_name: detachable ET_FEATURE_NAME
			nb: INTEGER
			l_done: BOOLEAN
			l_strip_expression: detachable ET_STRIP_EXPRESSION
			l_feature_name_expected: BOOLEAN
			l_comma_expected: BOOLEAN
		do
			last_expression := Void
			if last_token = E_STRIP then
				l_strip_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_parenthesis_code then
					l_left_parenthesis := last_detachable_et_symbol_value
					read_token
					l_old_last_feature_name_items_count := last_feature_name_items.count
					from until l_done loop
						if is_identifier_token (last_token) then
							l_feature_name_expected := False
							if l_comma_expected then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
								l_comma_expected := False
							end
							parse_feature_name
							l_feature_name := last_feature_name
							if last_token = Comma_code then
								last_feature_name_items.force (ast_factory.new_feature_name_comma (l_feature_name, last_detachable_et_symbol_value))
								l_feature_name_expected := True
								read_token
							else
								last_feature_name_items.force (l_feature_name)
								l_comma_expected := True
							end
						elseif l_feature_name_expected then
							report_syntax_error (last_position, last_value, feature_name_expected)
							l_done := True
						else
							l_done := True
						end
					end
					if last_token = Right_parenthesis_code then
						l_right_parenthesis := last_detachable_et_symbol_value
						read_token
					else
						report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
					end
					nb := (last_feature_name_items.count - l_old_last_feature_name_items_count).max (0)
					l_strip_expression := ast_factory.new_strip_expression (l_strip_keyword, l_left_parenthesis, l_right_parenthesis,  nb)
					from until nb <= 0 loop
						if l_strip_expression /= Void and attached last_feature_name_items.item as l_last_feature_name_item then
							l_strip_expression.put_first (l_last_feature_name_item)
						end
						last_feature_name_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, left_parenthesis_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, strip_keyword_expected)
			end
			last_expression := l_strip_expression
		end

	parse_address_expression
			-- Parse an address expression.
			-- Make the result available in `last_expression`.
		local
			l_dollar_symbol: detachable ET_SYMBOL
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			if last_token = Dollar_code then
				l_dollar_symbol := last_detachable_et_symbol_value
				read_token
				inspect last_token
				when E_IDENTIFIER, E_NONE, E_TUPLE then
					parse_feature_name
					l_last_expression := new_feature_address (l_dollar_symbol, last_feature_name)
				when E_CURRENT then
					l_last_expression := ast_factory.new_current_address (l_dollar_symbol, last_detachable_et_current_value)
					read_token
				when E_RESULT then
					l_last_expression := ast_factory.new_result_address (l_dollar_symbol, last_detachable_et_result_value)
					read_token
				when Left_parenthesis_code then
						-- Note: The following construct is an
						-- extension of the Eiffel syntax provided
						-- in ISE Eiffel compiler.
					parse_parenthesized_expression
					l_last_expression := ast_factory.new_expression_address (l_dollar_symbol, last_parenthesized_expression)
				else
					report_syntax_error (last_position, last_value, feature_name_current_or_result_keyword_expected)
				end
			else
				report_syntax_error (last_position, last_value, dollar_symbol_expected)
			end
			last_expression := l_last_expression
		end

	parse_once_manifest_string
			-- Parse a once manifest string.
			-- Make the result available in `last_expression`.
		local
			l_once_keyword: detachable ET_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
		do
			last_expression := Void
			if last_token = E_ONCE_STRING then
					--
					-- We need to make the distinction between once keywords followed
					-- by a manifest string and once keywords introducing a once-routine
					-- because otherwise we would need to have two look-ahead tokens
					-- to figure out that the first once keyword in the following example
					-- in part of a once manifest string expression and the second is
					-- part of the compound of the once routine:
					--   f is
					--      require
					--         once "foo" /= Void
					--      once
					--         do_nothing
					--      end
					-- Hence the use of 'E_ONCE_STRING' instead of 'E_ONCE'.
					--
					-- Also covers the case of typed manifest string:
					--
					--   f
					--      require
					--         once {STRING_8} "foo" /= Void
					--      once
					--         do_nothing
					--      end
					--
					-- although this will produce a syntax error when writing:
					--
					--   f
					--      once
					--         {CHARACTER_8}.Max_value.do_nothing
					--      end
					--
				l_once_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					if last_token = Right_brace_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
						read_token
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				end
				if is_string_token (last_token) then
					if attached last_detachable_et_manifest_string_value as l_manifest_string then
						l_manifest_string.set_cast_type (l_target_type)
						last_expression := new_once_manifest_string (l_once_keyword, l_manifest_string)
					end
					read_token
				else
					report_syntax_error (last_position, last_value, manifest_string_expected)
				end
			else
				report_syntax_error (last_position, last_value, once_keyword_expected)
			end
		end

	parse_manifest_array
			-- Parse a manifest array.
			-- Make the result available in `last_manifest_array`.
		local
			l_open_symbol: detachable ET_SYMBOL
			l_close_symbol: detachable ET_SYMBOL
			l_old_last_expression_items_count: INTEGER
			l_expression: detachable ET_EXPRESSION
			l_array: detachable ET_MANIFEST_ARRAY
			nb: INTEGER
			l_done: BOOLEAN
			l_expression_expected: BOOLEAN
		do
			last_manifest_array := Void
			if last_token = E_LARRAY then
				l_open_symbol := last_detachable_et_symbol_value
				read_token
				l_old_last_expression_items_count := last_expression_items.count
				from until l_done loop
					if last_token = E_RARRAY then
						if l_expression_expected then
							report_syntax_error (last_position, last_value, expression_expected)
						end
						l_done := True
					else
						l_expression_expected := False
						parse_expression
						l_expression := last_expression
						if last_token = Comma_code then
							last_expression_items.force (ast_factory.new_expression_comma (l_expression, last_detachable_et_symbol_value))
							l_expression_expected := True
							read_token
						else
							last_expression_items.force (l_expression)
							if last_token /= E_RARRAY and then is_expression_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = E_RARRAY then
					l_close_symbol := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_array_symbol_expected)
				end
				nb := (last_expression_items.count - l_old_last_expression_items_count).max (0)
				l_array := ast_factory.new_manifest_array (l_open_symbol, l_close_symbol, nb)
				from until nb <= 0 loop
					if l_array /= Void and then attached last_expression_items.item as l_last_expression_item then
						l_array.put_first (l_last_expression_item)
					end
					last_expression_items.remove
					nb := nb - 1
				end
			else
				report_syntax_error (last_position, last_value, left_array_symbol_expected)
			end
			last_manifest_array := l_array
		end

	parse_manifest_tuple
			-- Parse a manifest tuple.
			-- Make the result available in `last_manifest_tuple`.
		local
			l_open_symbol: detachable ET_BRACKET_SYMBOL
			l_close_symbol: detachable ET_SYMBOL
			l_old_last_expression_items_count: INTEGER
			l_expression: detachable ET_EXPRESSION
			l_tuple: detachable ET_MANIFEST_TUPLE
			nb: INTEGER
			l_done: BOOLEAN
			l_expression_expected: BOOLEAN
		do
			last_manifest_tuple := Void
			if last_token = Left_bracket_code then
				l_open_symbol := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_expression_items_count := last_expression_items.count
				from until l_done loop
					if last_token = Right_bracket_code then
						if l_expression_expected then
							report_syntax_error (last_position, last_value, expression_expected)
						end
						l_done := True
					else
						l_expression_expected := False
						parse_expression
						l_expression := last_expression
						if last_token = Comma_code then
							last_expression_items.force (ast_factory.new_expression_comma (l_expression, last_detachable_et_symbol_value))
							l_expression_expected := True
							read_token
						else
							last_expression_items.force (l_expression)
							if last_token /= Right_bracket_code and then is_expression_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_bracket_code then
					l_close_symbol := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
				nb := (last_expression_items.count - l_old_last_expression_items_count).max (0)
				l_tuple := ast_factory.new_manifest_tuple (l_open_symbol, l_close_symbol, nb)
				from until nb <= 0 loop
					if l_tuple /= Void and then attached last_expression_items.item as l_last_expression_item then
						l_tuple.put_first (l_last_expression_item)
					end
					last_expression_items.remove
					nb := nb - 1
				end
			else
				report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
			end
			last_manifest_tuple := l_tuple
		end

	parse_optional_actual_arguments
			-- Parse optional actual arguments.
			-- Make the result available in `last_actual_arguments`.
		local
			l_left_parenthesis: detachable ET_SYMBOL
			l_right_parenthesis: detachable ET_SYMBOL
			l_old_last_expression_items_count: INTEGER
			l_expression: detachable ET_EXPRESSION
			l_actual_arguments: detachable ET_ACTUAL_ARGUMENT_LIST
			nb: INTEGER
			l_done: BOOLEAN
			l_expression_expected: BOOLEAN
		do
			last_actual_arguments := Void
			if last_token = Left_parenthesis_code then
				l_left_parenthesis := last_detachable_et_symbol_value
				read_token
				l_old_last_expression_items_count := last_expression_items.count
				from until l_done loop
					if last_token = Right_parenthesis_code then
						if l_expression_expected then
							report_syntax_error (last_position, last_value, expression_expected)
						end
						l_done := True
					else
						l_expression_expected := False
						parse_expression
						l_expression := last_expression
						if last_token = Comma_code then
							last_expression_items.force (ast_factory.new_expression_comma (l_expression, last_detachable_et_symbol_value))
							l_expression_expected := True
							read_token
						else
							last_expression_items.force (l_expression)
							if last_token /= Right_parenthesis_code and then is_expression_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_parenthesis_code then
					l_right_parenthesis := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
				end
				nb := (last_expression_items.count - l_old_last_expression_items_count).max (0)
				l_actual_arguments := ast_factory.new_actual_arguments (l_left_parenthesis, l_right_parenthesis, nb)
				from until nb <= 0 loop
					if l_actual_arguments /= Void and then attached last_expression_items.item as l_last_expression_item then
						l_actual_arguments.put_first (l_last_expression_item)
					end
					last_expression_items.remove
					nb := nb - 1
				end
			end
			last_actual_arguments := l_actual_arguments
		end

	parse_bracket_arguments
			-- Parse bracket arguments.
			-- Make the result available in `last_actual_arguments`.
		local
			l_left_bracket_symbol: detachable ET_BRACKET_SYMBOL
			l_right_bracket_symbol: detachable ET_SYMBOL
			l_old_last_expression_items_count: INTEGER
			l_expression: detachable ET_EXPRESSION
			l_actual_arguments: detachable ET_ACTUAL_ARGUMENT_LIST
			nb: INTEGER
			l_done: BOOLEAN
			l_expression_expected: BOOLEAN
		do
			last_actual_arguments := Void
			if last_token = Left_bracket_code then
				l_left_bracket_symbol := last_detachable_et_bracket_symbol_value
				read_token
				l_old_last_expression_items_count := last_expression_items.count
				from until l_done loop
					if last_token = Right_bracket_code then
						if l_expression_expected then
							report_syntax_error (last_position, last_value, expression_expected)
						end
						l_done := True
					else
						l_expression_expected := False
						parse_expression
						l_expression := last_expression
						if last_token = Comma_code then
							last_expression_items.force (ast_factory.new_expression_comma (l_expression, last_detachable_et_symbol_value))
							l_expression_expected := True
							read_token
						else
							last_expression_items.force (l_expression)
							if last_token /= Right_bracket_code and then is_expression_first_token (last_token) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_bracket_code then
					l_right_bracket_symbol := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_bracket_symbol_expected)
				end
				nb := (last_expression_items.count - l_old_last_expression_items_count).max (0)
				l_actual_arguments := ast_factory.new_bracket_arguments (l_left_bracket_symbol, l_right_bracket_symbol, nb)
				from until nb <= 0 loop
					if l_actual_arguments /= Void and then attached last_expression_items.item as l_last_expression_item then
						l_actual_arguments.put_first (l_last_expression_item)
					end
					last_expression_items.remove
					nb := nb - 1
				end
			else
				report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
			end
			last_actual_arguments := l_actual_arguments
		end

	parse_agent_expression
			-- Parse an agent expression.
			-- Make the result available in `last_expression`.
		local
			l_agent_keyword: detachable ET_AGENT_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
			l_identifier_code: INTEGER
			l_left_brace_symbol: detachable ET_SYMBOL
			l_type: detachable ET_TYPE
			l_target: detachable ET_AGENT_TARGET
			l_dot_symbol: detachable ET_SYMBOL
			l_is_qualified: BOOLEAN
			l_left_parenthesis: detachable ET_SYMBOL
			l_actual_arguments: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
			l_last_expression: detachable ET_EXPRESSION
		do
			last_expression := Void
			if last_token = E_AGENT then
				l_agent_keyword := last_detachable_et_agent_keyword_value
				read_token
				inspect last_token
				when Colon_code, E_REQUIRE, E_LOCAL, E_DO, E_ONCE, E_EXTERNAL then
					unread_token
					set_last_agent_keyword_token (E_AGENT, l_agent_keyword)
					parse_inline_agent_expression
					l_last_expression := last_expression
				when Left_parenthesis_code then
					l_is_qualified := True
					l_left_parenthesis := last_detachable_et_symbol_value
					read_token
					if is_identifier_token (last_token) then
						l_identifier := last_detachable_et_identifier_value
						l_identifier_code := last_token
						read_token
						if last_token = Colon_code or last_token = Comma_code then
								-- Inline agent.
							l_is_qualified := False
						end
						unread_token
						unread_identifier_token (l_identifier_code, l_identifier)
						set_last_symbol_token (Left_parenthesis_code, l_left_parenthesis)
					else
						unread_token
						set_last_symbol_token (Left_parenthesis_code, l_left_parenthesis)
					end
					if l_is_qualified then
						parse_parenthesized_expression
						l_target := last_parenthesized_expression
					else
						unread_token
						set_last_agent_keyword_token (E_AGENT, l_agent_keyword)
						parse_inline_agent_expression
						l_last_expression := last_expression
					end
				when Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					l_type := last_type
					if last_token = Right_brace_code then
						l_target := ast_factory.new_agent_open_target (l_left_brace_symbol, l_type, last_detachable_et_symbol_value)
						l_is_qualified := True
						read_token
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				when E_RESULT then
					l_target := last_detachable_et_result_value
					l_is_qualified := True
					read_token
				when E_CURRENT then
					l_target := last_detachable_et_current_value
					l_is_qualified := True
					read_token
				else
					if is_identifier_token (last_token) then
						l_identifier := last_detachable_et_identifier_value
						l_identifier_code := last_token
						read_token
						if last_token = Dot_code then
							l_target := new_agent_identifier_target (l_identifier)
							l_is_qualified := True
						else
							if l_identifier /= Void then
								l_identifier.set_feature_name (True)
							end
							parse_optional_agent_actual_arguments
							l_actual_arguments := last_agent_actual_arguments
							l_last_expression := ast_factory.new_call_agent (l_agent_keyword, Void, l_identifier, l_actual_arguments)
						end
					else
						report_syntax_error (last_position, last_value, feature_name_or_agent_target_expected)
					end
				end
				if l_is_qualified then
					if last_token = Dot_code then
						l_dot_symbol := last_detachable_et_symbol_value
						read_token
						parse_feature_name_identifier
						l_identifier := last_feature_name_identifier
						parse_optional_agent_actual_arguments
						l_actual_arguments := last_agent_actual_arguments
						l_last_expression := ast_factory.new_call_agent (l_agent_keyword, l_target, ast_factory.new_dot_feature_name (l_dot_symbol, l_identifier), l_actual_arguments)
					else
						report_syntax_error (last_position, last_value, dot_symbol_expected)
					end
				end
			else
				report_syntax_error (last_position, last_value, agent_keyword_expected)
			end
			last_expression := l_last_expression
		end

	parse_inline_agent_expression
			-- Parse an inline agent expression.
			-- Make the result available in `last_expression`.
		local
			l_agent_keyword: detachable ET_AGENT_KEYWORD
			l_formal_arguments: detachable ET_FORMAL_ARGUMENT_LIST
			l_colon_symbol: detachable ET_SYMBOL
			l_type: ET_DECLARED_TYPE
			l_has_type: BOOLEAN
			l_preconditions: detachable ET_PRECONDITIONS
			l_postconditions: detachable ET_POSTCONDITIONS
			l_has_locals: BOOLEAN
			l_local_variables: detachable ET_LOCAL_VARIABLE_LIST
			l_do_keyword: detachable ET_KEYWORD
			l_once_keyword: detachable ET_KEYWORD
			l_external_keyword: detachable ET_KEYWORD
			l_alias_keyword: detachable ET_KEYWORD
			l_rescue_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_do_compound: detachable ET_COMPOUND
			l_once_compound: detachable ET_COMPOUND
			l_rescue_compound: detachable ET_COMPOUND
			l_keys: detachable ET_MANIFEST_STRING_LIST
			l_external_language: detachable ET_EXTERNAL_LANGUAGE
			l_alias_name: detachable ET_EXTERNAL_ALIAS
			l_actual_arguments: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
			l_inline_agent: detachable ET_INLINE_AGENT
		do
			last_expression := Void
			if last_token = E_AGENT then
				l_agent_keyword := last_detachable_et_agent_keyword_value
				read_token
				set_start_closure (Void)
				parse_optional_formal_arguments
				l_formal_arguments := last_formal_arguments
				if last_token = Colon_code then
					l_has_type := True
					l_colon_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					l_type := ast_factory.new_colon_type (l_colon_symbol, last_type)
				end
				parse_optional_preconditions
				l_preconditions := last_preconditions
				if last_token = E_LOCAL then
					l_has_locals := True
					parse_optional_local_variables
					l_local_variables := last_local_variables
				end
				if last_token = E_DO then
					l_do_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_do_compound := ast_factory.new_do_compound (l_do_keyword, last_compound)
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_RESCUE then
						l_rescue_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_rescue_compound := ast_factory.new_rescue_compound (l_rescue_keyword, last_compound)
					end
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
					end
					if l_has_type then
						l_inline_agent := ast_factory.new_do_function_inline_agent (l_agent_keyword, l_formal_arguments, l_type, l_preconditions, l_local_variables, l_do_compound, l_postconditions, l_rescue_compound, l_end_keyword, Void)
					else
						l_inline_agent := ast_factory.new_do_procedure_inline_agent (l_agent_keyword, l_formal_arguments, l_preconditions, l_local_variables, l_do_compound, l_postconditions, l_rescue_compound, l_end_keyword, Void)
					end
				elseif last_token = E_ONCE then
					l_once_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_keys
					l_keys := last_keys
					parse_optional_compound (False)
					l_once_compound := ast_factory.new_do_compound (l_once_keyword, last_compound)
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_RESCUE then
						l_rescue_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_rescue_compound := ast_factory.new_rescue_compound (l_rescue_keyword, last_compound)
					end
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
					end
					if l_has_type then
						l_inline_agent := ast_factory.new_once_function_inline_agent (l_agent_keyword, l_formal_arguments, l_type, l_preconditions, l_local_variables, l_keys, l_once_compound, l_postconditions, l_rescue_compound, l_end_keyword, Void)
					else
						l_inline_agent := ast_factory.new_once_procedure_inline_agent (l_agent_keyword, l_formal_arguments, l_preconditions, l_local_variables, l_keys, l_once_compound, l_postconditions, l_rescue_compound, l_end_keyword, Void)
					end
				elseif last_token = E_EXTERNAL then
					if l_has_locals then
						report_syntax_error (last_position, last_value, do_or_once_keyword_expected)
					end
					l_external_keyword := last_detachable_et_keyword_value
					read_token
					if is_string_token (last_token) then
						l_external_language := ast_factory.new_external_language (l_external_keyword, last_detachable_et_manifest_string_value)
						read_token
					else
						report_syntax_error (last_position, last_value, manifest_string_expected)
					end
					if last_token = E_ALIAS then
						l_alias_keyword := last_detachable_et_keyword_value
						read_token
						if is_string_token (last_token) then
							l_alias_name := ast_factory.new_external_alias (l_alias_keyword, last_detachable_et_manifest_string_value)
							read_token
						else
							report_syntax_error (last_position, last_value, manifest_string_expected)
						end
					end
					parse_optional_postconditions
					l_postconditions := last_postconditions
					if last_token = E_END then
						l_end_keyword := last_detachable_et_keyword_value
						read_token
					else
						report_syntax_error (last_position, last_value, end_keyword_expected)
					end
					if l_has_type then
						l_inline_agent := ast_factory.new_external_function_inline_agent (l_agent_keyword, l_formal_arguments, l_type, l_preconditions, l_external_language, l_alias_name, l_postconditions, l_end_keyword, Void)
					else
						l_inline_agent := ast_factory.new_external_procedure_inline_agent (l_agent_keyword, l_formal_arguments, l_preconditions, l_external_language, l_alias_name, l_postconditions, l_end_keyword, Void)
					end
				elseif l_has_locals then
					report_syntax_error (last_position, last_value, do_or_once_keyword_expected)
				else
					report_syntax_error (last_position, last_value, do_once_or_external_keyword_expected)
				end
				register_inline_agent (l_inline_agent)
				parse_optional_agent_actual_arguments
				l_actual_arguments := last_agent_actual_arguments
				set_inline_agent_actual_arguments (l_inline_agent, l_actual_arguments)
				last_expression := l_inline_agent
			else
				report_syntax_error (last_position, last_value, agent_keyword_expected)
			end
		end

	parse_optional_agent_actual_arguments
			-- Parse optional agent actual arguments.
			-- Make the result available in `last_agent_actual_arguments`.
		local
			l_left_parenthesis: detachable ET_SYMBOL
			l_right_parenthesis: detachable ET_SYMBOL
			l_old_last_agent_actual_argument_items_count: INTEGER
			l_actual_argument: detachable ET_AGENT_ARGUMENT_OPERAND
			l_actual_arguments: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
			nb: INTEGER
			l_done: BOOLEAN
			l_operand_expected: BOOLEAN
		do
			last_agent_actual_arguments := Void
			if last_token = Left_parenthesis_code then
				l_left_parenthesis := last_detachable_et_symbol_value
				read_token
				l_old_last_agent_actual_argument_items_count := last_agent_actual_argument_items.count
				from until l_done loop
					if last_token = Right_parenthesis_code then
						if l_operand_expected then
							report_syntax_error (last_position, last_value, expression_expected)
						end
						l_done := True
					else
						l_operand_expected := False
						if last_token = Question_mark_code then
							l_actual_argument := last_detachable_et_question_mark_symbol_value
							read_token
						elseif last_token = Left_brace_code then
							parse_typed_expression (True)
							if last_is_agent_open_operand then
								l_actual_argument := last_agent_open_operand
							else
								if (last_is_dot_call_target and last_token = Dot_code) or (last_is_bracket_call_target and last_token = Left_bracket_code) then
									parse_qualified_call_expression (last_expression, last_is_dot_call_target, last_is_bracket_call_target)
								end
								parse_binary_expression (last_expression, True)
								l_actual_argument := last_expression
							end
						else
							parse_expression
							l_actual_argument := last_expression
						end
						if last_token = Comma_code then
							last_agent_actual_argument_items.force (ast_factory.new_agent_argument_operand_comma (l_actual_argument, last_detachable_et_symbol_value))
							l_operand_expected := True
							read_token
						else
							last_agent_actual_argument_items.force (l_actual_argument)
							if last_token /= Right_parenthesis_code and then (is_expression_first_token (last_token) or last_token = Question_mark_code or last_token = Left_brace_code) then
								report_syntax_error (last_position, last_value, comma_symbol_expected)
							else
								l_done := True
							end
						end
					end
				end
				if last_token = Right_parenthesis_code then
					l_right_parenthesis := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
				end
				nb := (last_agent_actual_argument_items.count - l_old_last_agent_actual_argument_items_count).max (0)
				l_actual_arguments := ast_factory.new_agent_argument_operands (l_left_parenthesis, l_right_parenthesis, nb)
				from until nb <= 0 loop
					if l_actual_arguments /= Void and then attached last_agent_actual_argument_items.item as l_last_agent_actual_argument_item then
						l_actual_arguments.put_first (l_last_agent_actual_argument_item)
					end
					last_agent_actual_argument_items.remove
					nb := nb - 1
				end
			end
			last_agent_actual_arguments := l_actual_arguments
		end

	parse_optional_keys
			-- Parse optional keys.
			-- Make the result available in `last_keys`.
		local
			l_keys: detachable ET_MANIFEST_STRING_LIST
			l_left_parenthesis: detachable ET_SYMBOL
			l_right_parenthesis: detachable ET_SYMBOL
			l_old_last_manifest_string_items_count: INTEGER
			nb: INTEGER
			l_done: BOOLEAN
			l_string_expected: BOOLEAN
			l_comma_expected: BOOLEAN
			l_manifest_string: detachable ET_MANIFEST_STRING
		do
			last_keys := Void
			if last_token = Left_parenthesis_code then
				l_left_parenthesis := last_detachable_et_symbol_value
				read_token
				l_old_last_manifest_string_items_count := last_manifest_string_items.count
				from until l_done loop
					if is_string_token (last_token) then
						l_string_expected := False
						if l_comma_expected then
							report_syntax_error (last_position, last_value, comma_symbol_expected)
							l_comma_expected := False
						end
						l_manifest_string := last_detachable_et_manifest_string_value
						read_token
						if last_token = Comma_code then
							last_manifest_string_items.force (ast_factory.new_manifest_string_comma (l_manifest_string, last_detachable_et_symbol_value))
							l_string_expected := True
							read_token
						else
							last_manifest_string_items.force (l_manifest_string)
							l_comma_expected := True
						end
					elseif l_string_expected then
						report_syntax_error (last_position, last_value, manifest_string_expected)
						l_done := True
					else
						l_done := True
					end
				end
				if last_token = Right_parenthesis_code then
					l_right_parenthesis := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, right_parenthesis_symbol_expected)
				end
				nb := (last_manifest_string_items.count - l_old_last_manifest_string_items_count).max (0)
				l_keys := ast_factory.new_manifest_string_list (l_left_parenthesis, l_right_parenthesis,  nb)
				from until nb <= 0 loop
					if l_keys /= Void and attached last_manifest_string_items.item as l_last_manifest_string_item then
						l_keys.put_first (l_last_manifest_string_item)
					end
					last_manifest_string_items.remove
					nb := nb - 1
				end
			end
			last_keys := l_keys
		end

	parse_optional_assertions
			-- Parse optional assertions.
		local
			l_done: BOOLEAN
			l_class_keyword: detachable ET_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_identifier_code: INTEGER
			l_colon_symbol: detachable ET_SYMBOL
			l_expression: detachable ET_EXPRESSION
		do
			from until l_done loop
				l_semicolon_symbol := Void
				if last_token = E_CLASS then
					l_class_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_semicolon
					l_semicolon_symbol := last_semicolon
					if assertion_kind = assertion_kind_postcondition then
							-- 'class' assertions only allowed in postconditions.
						add_class_assertion (ast_factory.new_class_assertion (l_class_keyword), l_semicolon_symbol)
					else
						report_syntax_error (last_position, last_value, class_keyword_only_allowed_in_postconditions)
					end
				elseif is_identifier_token (last_token) then
					l_identifier := last_detachable_et_identifier_value
					l_identifier_code := last_token
					read_token
					if last_token = Colon_code then
						l_colon_symbol := last_detachable_et_symbol_value
						read_token
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
						add_tagged_assertion (l_identifier, l_colon_symbol, l_semicolon_symbol)
					else
						unread_token
						set_last_identifier_token (l_identifier_code, l_identifier)
						parse_expression
						l_expression := last_expression
						parse_optional_semicolon
						l_semicolon_symbol := last_semicolon
						add_expression_assertion (l_expression, l_semicolon_symbol)
					end
				elseif is_expression_first_token (last_token) then
					parse_expression
					l_expression := last_expression
					parse_optional_semicolon
					l_semicolon_symbol := last_semicolon
					add_expression_assertion (l_expression, l_semicolon_symbol)
				else
					l_done := True
				end
			end
		end

	parse_optional_preconditions
			-- Parse optional preconditions.
			-- Make the result available in `last_preconditions`.
		local
			l_require_keyword: detachable ET_KEYWORD
			l_else_keyword: detachable ET_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
		do
			last_preconditions := Void
			if last_token = E_REQUIRE then
				start_precondition
				l_require_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = E_ELSE then
					l_else_keyword := last_detachable_et_keyword_value
					read_token
				end
				parse_optional_semicolon
				l_semicolon_symbol := last_semicolon
				parse_optional_assertions
				last_preconditions := new_preconditions (l_require_keyword, l_else_keyword, l_semicolon_symbol)
			end
		end

	parse_optional_postconditions
			-- Parse optional postconditions.
			-- Make the result available in `last_postconditions`.
		local
			l_ensure_keyword: detachable ET_KEYWORD
			l_then_keyword: detachable ET_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
		do
			last_postconditions := Void
			if last_token = E_ENSURE then
				start_postcondition
				l_ensure_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = E_THEN then
					l_then_keyword := last_detachable_et_keyword_value
					read_token
				end
				parse_optional_semicolon
				l_semicolon_symbol := last_semicolon
				parse_optional_assertions
				last_postconditions := new_postconditions (l_ensure_keyword, l_then_keyword, l_semicolon_symbol)
			end
		end

	parse_optional_invariants
			-- Parse optional invariants.
			-- Make the result available in `last_invariants`.
		local
			l_invariant_keyword: detachable ET_INVARIANT_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
			l_invariants: detachable ET_INVARIANTS
		do
			last_invariants := Void
			synchronize_token (invariant_expected_tokens, end_keyword_expected, True)
			if last_token = E_INVARIANT then
				start_invariant
				l_invariant_keyword := last_detachable_et_invariant_keyword_value
				read_token
				parse_optional_semicolon
				l_semicolon_symbol := last_semicolon
				parse_optional_assertions
				l_invariants := new_invariants (l_invariant_keyword, l_semicolon_symbol)
			end
			last_invariants := l_invariants
		end

	parse_optional_variant
			-- Parse an optional variant.
			-- Make the result available in `last_variant`.
		local
			l_variant_keyword: detachable ET_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
			l_identifier_code: INTEGER
			l_tag: detachable ET_TAG
		do
			last_variant := Void
			if last_token = E_VARIANT then
				l_variant_keyword := last_detachable_et_keyword_value
				read_token
				if is_identifier_token (last_token) then
					l_identifier := last_detachable_et_identifier_value
					l_identifier_code := last_token
					read_token
					if last_token = Colon_code then
						l_tag := ast_factory.new_tag (l_identifier, last_detachable_et_symbol_value)
						read_token
					else
						unread_token
						set_last_identifier_token (l_identifier_code, l_identifier)
					end
				end
				parse_expression
				last_variant := ast_factory.new_variant (l_variant_keyword, l_tag, last_expression)
			end
		end

	parse_optional_loop_invariants
			-- Parse optional loop invariants.
			-- Make the result available in `last_loop_invariants`.
		local
			l_invariant_keyword: detachable ET_INVARIANT_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
		do
			last_loop_invariants := Void
			if last_token = E_INVARIANT then
				start_loop_invariant
				l_invariant_keyword := last_detachable_et_invariant_keyword_value
				read_token
				parse_optional_semicolon
				l_semicolon_symbol := last_semicolon
				parse_optional_assertions
				last_loop_invariants := new_loop_invariants (l_invariant_keyword, l_semicolon_symbol)
			end
		end

	parse_feature_name_identifier
			-- Parse a feature name.
			-- Make the result available in `last_feature_name_identifier`.
		do
			last_feature_name_identifier := Void
			if is_identifier_token (last_token) then
				last_feature_name_identifier := last_detachable_et_identifier_value
				read_token
			else
				report_syntax_error (last_position, last_value, feature_name_expected)
			end
		end

	parse_class_name_identifier
			-- Parse a class name.
			-- Make the result available in `last_class_name_identifier`.
		do
			last_class_name_identifier := Void
			if is_class_name_token (last_token) then
				last_class_name_identifier := last_detachable_et_identifier_value
				read_token
			else
				report_syntax_error (last_position, last_value, class_name_expected)
			end
		end

	parse_cursor_name_identifier
			-- Parse a cursor name.
			-- Make the result available in `last_cursor_name_identifier`.
		do
			last_cursor_name_identifier := Void
			if is_identifier_token (last_token) then
				last_cursor_name_identifier := last_detachable_et_identifier_value
				read_token
			else
				report_syntax_error (last_position, last_value, cursor_name_expected)
			end
		end

	parse_object_test_local_identifier
			-- Parse an object-test local name.
			-- Make the result available in `last_object_test_local_identifier`.
		do
			last_object_test_local_identifier := Void
			if is_identifier_token (last_token) then
				last_object_test_local_identifier := last_detachable_et_identifier_value
				read_token
			else
				report_syntax_error (last_position, last_value, object_test_local_name_expected)
			end
		end

	parse_inline_separate_argument_name_identifier
			-- Parse an inline separate argument name.
			-- Make the result available in `last_inline_separate_argument_name_identifier`.
		do
			last_inline_separate_argument_name_identifier := Void
			if is_identifier_token (last_token) then
				last_inline_separate_argument_name_identifier := last_detachable_et_identifier_value
				read_token
			else
				report_syntax_error (last_position, last_value, inline_separate_argument_name_expected)
			end
		end

	parse_instruction
			-- Parse an instruction.
			-- Make the result available in `last_instruction`.
		local
			l_target_expression: detachable ET_EXPRESSION
			l_is_bracket_call_target: BOOLEAN
			l_is_dot_call_target: BOOLEAN
			l_at_symbol: detachable ET_SYMBOL_OPERATOR
			l_result_keyword: detachable ET_RESULT
			l_assign_symbol: detachable ET_SYMBOL
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			inspect last_token
			when E_CREATE then
				parse_create_instruction
				l_instruction := last_instruction
			when Exclamation_code then
				parse_creation_instruction
				l_instruction := last_instruction
			when E_IF then
				parse_conditional_instruction
				l_instruction := last_instruction
			when E_INSPECT then
				parse_multi_branch_instruction
				l_instruction := last_instruction
			when E_FROM then
				parse_from_instruction
				l_instruction := last_instruction
			when E_OPEN_REPEAT then
				parse_repeat_instruction
				l_instruction := last_instruction
			when E_ACROSS then
				parse_across_instruction
				l_instruction := last_instruction
			when E_DEBUG then
				parse_debug_instruction
				l_instruction := last_instruction
			when E_CHECK then
				parse_check_instruction
				l_instruction := last_instruction
			when E_RETRY then
				l_instruction := last_detachable_et_retry_instruction_value
				read_token
			when E_PRECURSOR then
				parse_precursor_instruction
				l_instruction := last_instruction
				if last_token = Left_bracket_code then
					l_target_expression := last_expression
					l_is_bracket_call_target := True
				elseif last_token = Dot_code then
					l_target_expression := last_expression
					l_is_dot_call_target := True
				end
			when E_FEATURE then
				parse_old_static_call_instruction
				l_instruction := last_instruction
				if last_token = Left_bracket_code then
					l_target_expression := last_expression
					l_is_bracket_call_target := True
				elseif last_token = Dot_code then
					l_target_expression := last_expression
					l_is_dot_call_target := True
				end
			when E_SEPARATE then
				parse_inline_separate_instruction
				l_instruction := last_instruction
			when Semicolon_code then
				l_instruction := ast_factory.new_null_instruction (last_detachable_et_semicolon_symbol_value)
				read_token
			when Left_parenthesis_code then
				parse_parenthesized_expression
				l_target_expression := last_parenthesized_expression
				if last_token = Left_bracket_code then
					l_is_bracket_call_target := True
				elseif last_token = Dot_code then
					l_is_dot_call_target := True
				else
					report_syntax_error (last_position, last_value, dot_or_left_bracket_symbol_expected)
				end
			when E_TRUE, E_FALSE then
				l_target_expression := last_detachable_et_boolean_constant_value
				read_token
				if last_token = Left_bracket_code then
					l_is_bracket_call_target := True
				else
					report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
				end
			when E_CHARACTER then
				l_target_expression := last_detachable_et_character_constant_value
				read_token
				if last_token = Left_bracket_code then
					l_is_bracket_call_target := True
				else
					report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
				end
			when E_CURRENT then
				l_target_expression := last_detachable_et_current_value
				read_token
				if last_token = Left_bracket_code then
					l_is_bracket_call_target := True
				elseif last_token = Dot_code then
					l_is_dot_call_target := True
				else
					report_syntax_error (last_position, last_value, dot_or_left_bracket_symbol_expected)
				end
			when E_RESULT then
				l_result_keyword := last_detachable_et_result_value
				l_target_expression := l_result_keyword
				read_token
				if last_token = Left_bracket_code then
					l_is_bracket_call_target := True
				elseif last_token = Dot_code then
					l_is_dot_call_target := True
				elseif last_token = E_ASSIGN_SYMBOL then
					l_assign_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_instruction := ast_factory.new_assignment (l_result_keyword, l_assign_symbol, last_expression)
				elseif last_token = E_REVERSE then
					l_assign_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_instruction := ast_factory.new_assignment_attempt (l_result_keyword, l_assign_symbol, last_expression)
				else
					report_syntax_error (last_position, last_value, dot_or_left_bracket_symbol_expected)
				end
			when E_ONCE_STRING then
				parse_once_manifest_string
				l_target_expression := last_expression
				read_token
				if last_token = Left_bracket_code then
					l_is_bracket_call_target := True
				else
					report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
				end
			when At_code then
				if current_universe.use_obsolete_syntax_mode then
					report_syntax_error (last_position, last_value, instruction_expected)
				else
					l_at_symbol := last_detachable_et_symbol_operator_value
					read_token
					parse_cursor_name_identifier
					l_target_expression := new_iteration_cursor (l_at_symbol, last_cursor_name_identifier)
					if last_token = Left_bracket_code then
						l_is_bracket_call_target := True
					elseif last_token = Dot_code then
						l_is_dot_call_target := True
					else
						report_syntax_error (last_position, last_value, dot_or_left_bracket_symbol_expected)
					end
				end
			when Left_brace_code then
				parse_typed_instruction
				l_instruction := last_instruction
				l_target_expression := last_expression
				l_is_dot_call_target := last_is_dot_call_target
				l_is_bracket_call_target := last_is_bracket_call_target
			else
				if is_string_token (last_token) then
					l_target_expression := last_detachable_et_manifest_string_value
					read_token
					if last_token = Left_bracket_code then
						l_is_bracket_call_target := True
					else
						report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
					end
				elseif is_identifier_token (last_token) then
					parse_unqualified_call_instruction
					l_instruction := last_instruction
					l_target_expression := last_expression
					l_is_dot_call_target := last_is_dot_call_target
					l_is_bracket_call_target := last_is_bracket_call_target
				else
					report_syntax_error (last_position, last_value, instruction_expected)
				end
			end
			if (l_is_dot_call_target and last_token = Dot_code) or (l_is_bracket_call_target and last_token = Left_bracket_code) then
				parse_qualified_call_instruction (l_target_expression, l_is_dot_call_target, l_is_bracket_call_target)
				l_instruction := last_instruction
			end
			last_instruction := l_instruction
		end

	parse_optional_compound (a_explicit: BOOLEAN)
			-- Parse optional compound.
			-- `a_explicit` means that the need an explicit AST node
			-- even if the compound is empty.
			-- Make the result available in `last_compound`.
		local
			l_compound: detachable ET_COMPOUND
			l_old_last_instruction_items_count: INTEGER
			nb: INTEGER
		do
			last_compound := Void
			l_old_last_instruction_items_count := last_instruction_items.count
			from until
				not is_instruction_first_token (last_token) and then
				(is_error_recovering implies (
					last_token <= 0 or
					last_token = E_RESCUE or
					last_token = E_ENSURE or
					last_token = E_END or
					last_token = E_FEATURE or
					last_token = E_INVARIANT or
					last_token = E_NOTE or
					last_token = E_INDEXING or
					are_next_tokens_feature_header))
			loop
				if is_error_recovering and then not is_instruction_first_token (last_token) then
					read_token
				end
				parse_instruction
				last_instruction_items.force (last_instruction)
			end
			nb := last_instruction_items.count - l_old_last_instruction_items_count
			if nb > 0 then
				l_compound := ast_factory.new_compound (nb)
				from until nb <= 0 loop
					if l_compound /= Void and attached last_instruction_items.item as l_last_instruction_item then
						l_compound.put_first (l_last_instruction_item)
					end
					last_instruction_items.remove
					nb := nb - 1
				end
				last_compound := l_compound
			elseif a_explicit then
				last_compound := ast_factory.new_compound (0)
			else
				last_compound := ast_factory.new_empty_compound
			end
		end

	parse_qualified_call_instruction (a_target_expression: detachable ET_EXPRESSION; a_is_dot_call_target, a_is_bracket_call_target: BOOLEAN)
			-- Parse a qualified call instruction where `a_target_expression`
			-- is the target of that call and where `a_is_dot_call_target`
			-- and `a_is_bracket_call_target` whether this target expression
			-- is a valid target for a dot call and/or a bracket expression.
			-- Make the result available in `last_instruction.
		local
			l_is_dot_call_target: BOOLEAN
			l_is_bracket_call_target: BOOLEAN
			l_target_expression: detachable ET_EXPRESSION
			l_left_bracket_symbol: detachable ET_BRACKET_SYMBOL
			l_dot_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_qualified_target_expression: detachable ET_QUALIFIED_FEATURE_CALL_EXPRESSION
			l_assign_symbol: detachable ET_SYMBOL
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			l_target_expression := a_target_expression
			l_is_dot_call_target := a_is_dot_call_target
			l_is_bracket_call_target := a_is_bracket_call_target
			from until
				((l_is_bracket_call_target implies last_token /= Left_bracket_code) and
				(l_is_dot_call_target implies last_token /= Dot_code))
			loop
				if l_is_bracket_call_target and last_token = Left_bracket_code then
					l_left_bracket_symbol := last_detachable_et_bracket_symbol_value
					parse_bracket_arguments
					l_qualified_target_expression := ast_factory.new_bracket_expression (l_target_expression, l_left_bracket_symbol, last_actual_arguments)
					if last_token = Left_bracket_code then
						l_target_expression := l_qualified_target_expression
						l_is_bracket_call_target := True
					elseif last_token = Dot_code then
						l_target_expression := l_qualified_target_expression
						l_is_dot_call_target := True
					elseif last_token = E_ASSIGN_SYMBOL then
						l_assign_symbol := last_detachable_et_symbol_value
						read_token
						parse_expression
						l_instruction := ast_factory.new_assigner_instruction (l_qualified_target_expression, l_assign_symbol, last_expression)
					else
						report_syntax_error (last_position, last_value, dot_left_bracket_or_assign_symbol_expected)
					end
				elseif l_is_dot_call_target and last_token = Dot_code then
					l_dot_symbol := last_detachable_et_symbol_value
					read_token
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					parse_optional_actual_arguments
					if last_token = Left_bracket_code then
						l_target_expression := ast_factory.new_qualified_call_expression (l_target_expression, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
						l_is_bracket_call_target := True
					elseif last_token = Dot_code then
						l_target_expression := ast_factory.new_qualified_call_expression (l_target_expression, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
						l_is_dot_call_target := True
					elseif last_token = E_ASSIGN_SYMBOL then
						l_qualified_target_expression := ast_factory.new_qualified_call_expression (l_target_expression, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
						l_assign_symbol := last_detachable_et_symbol_value
						read_token
						parse_expression
						l_instruction := ast_factory.new_assigner_instruction (l_qualified_target_expression, l_assign_symbol, last_expression)
					else
						l_instruction := ast_factory.new_qualified_call_instruction (l_target_expression, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
					end
				end
			end
			last_instruction := l_instruction
		end

	parse_unqualified_call_instruction
			-- Parse a qualified call instruction.
			-- Make the result available in `last_instruction`,
			-- or in `last_expression` if it is the target of
			-- a qualified call or bracket expression.
			-- Also update `last_is_dot_call_target` and
			-- `last_is_bracket_call_target`.
		local
			l_identifier: detachable ET_IDENTIFIER
			l_assign_symbol: detachable ET_SYMBOL
			l_instruction: detachable ET_INSTRUCTION
			l_last_expression: detachable ET_EXPRESSION
			l_is_dot_call_target: BOOLEAN
			l_is_bracket_call_target: BOOLEAN
		do
			last_instruction := Void
			last_expression := Void
			last_is_dot_call_target := False
			last_is_bracket_call_target := False
			if is_identifier_token (last_token) then
				parse_feature_name_identifier
				l_identifier := last_feature_name_identifier
				if last_token = E_ASSIGN_SYMBOL then
					l_assign_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_instruction := ast_factory.new_assignment (new_writable (l_identifier), l_assign_symbol, last_expression)
				elseif last_token = E_REVERSE then
					l_assign_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_instruction := ast_factory.new_assignment_attempt (new_writable (l_identifier), l_assign_symbol, last_expression)
				else
					parse_optional_actual_arguments
					if last_token = Left_bracket_code then
						l_last_expression := new_unqualified_call_expression (l_identifier, last_actual_arguments)
						l_is_bracket_call_target := True
					elseif last_token = Dot_code then
						l_last_expression := new_unqualified_call_expression (l_identifier, last_actual_arguments)
						l_is_dot_call_target := True
					else
						l_instruction := new_unqualified_call_instruction (l_identifier, last_actual_arguments)
					end
				end
			else
				report_syntax_error (last_position, last_value, feature_name_expected)
			end
			last_instruction := l_instruction
			last_expression := l_last_expression
			last_is_dot_call_target := l_is_dot_call_target
			last_is_bracket_call_target := l_is_bracket_call_target
		end

	parse_typed_instruction
			-- Parse instruction which starts with a type.
			-- Make the result available in `last_instruction`,
			-- or in `last_expression` if it is the target of
			-- a qualified call or bracket expression.
			-- Also update `last_is_dot_call_target` and
			-- `last_is_bracket_call_target`.
		local
			l_left_brace_symbol: detachable ET_SYMBOL
			l_right_brace_symbol: detachable ET_SYMBOL
			l_dot_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_type: detachable ET_TYPE
			l_instruction: detachable ET_INSTRUCTION
			l_last_expression: detachable ET_EXPRESSION
			l_is_dot_call_target: BOOLEAN
			l_is_bracket_call_target: BOOLEAN
		do
			last_instruction := Void
			last_expression := Void
			last_is_dot_call_target := False
			last_is_bracket_call_target := False
			if last_token = Left_brace_code then
				l_left_brace_symbol := last_detachable_et_symbol_value
				read_token
				parse_type
				l_type := last_type
				if last_token = Right_brace_code then
					l_right_brace_symbol := last_detachable_et_symbol_value
					read_token
					if last_token = Dot_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
						l_dot_symbol := last_detachable_et_symbol_value
						read_token
						parse_feature_name_identifier
						l_identifier := last_feature_name_identifier
						parse_optional_actual_arguments
						if last_token = Left_bracket_code then
							l_last_expression := ast_factory.new_static_call_expression (Void, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
							l_is_bracket_call_target := True
						elseif last_token = Dot_code then
							l_last_expression := ast_factory.new_static_call_expression (Void, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
							l_is_dot_call_target := True
						else
							l_instruction := ast_factory.new_static_call_instruction (Void, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
						end
					elseif last_token = Left_bracket_code then
						l_last_expression := ast_factory.new_manifest_type (l_left_brace_symbol, l_type, l_right_brace_symbol)
						l_is_bracket_call_target := True
					elseif last_token = E_CHARACTER then
						if attached last_detachable_et_character_constant_value as l_character_constant then
							l_character_constant.set_cast_type (ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol))
							l_last_expression := l_character_constant
						end
						read_token
						if last_token = Left_bracket_code then
							l_is_bracket_call_target := True
						else
							report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
						end
					elseif is_string_token (last_token) then
						if attached last_detachable_et_manifest_string_value as l_manifest_string then
							l_manifest_string.set_cast_type (ast_factory.new_target_type (l_left_brace_symbol, l_type, l_right_brace_symbol))
							l_last_expression := l_manifest_string
						end
						read_token
						if last_token = Left_bracket_code then
							l_is_bracket_call_target := True
						else
							report_syntax_error (last_position, last_value, left_bracket_symbol_expected)
						end
					else
						report_syntax_error (last_position, last_value, dot_symbol_expected)
					end
				else
					report_syntax_error (last_position, last_value, right_brace_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, left_brace_symbol_expected)
			end
			last_instruction := l_instruction
			last_expression := l_last_expression
			last_is_dot_call_target := l_is_dot_call_target
			last_is_bracket_call_target := l_is_bracket_call_target
		end

	parse_precursor_instruction
			-- Parse a precursor instruction.
			-- Make the result available in `last_instruction`,
			-- or in `last_expression` if it is the target of
			-- a qualified call or bracket expression.
		local
			l_precursor_keyword: detachable ET_PRECURSOR_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_precursor_class_name: detachable ET_PRECURSOR_CLASS_NAME
			l_last_expression: detachable ET_EXPRESSION
			l_last_instruction: detachable ET_INSTRUCTION
		do
			last_expression := Void
			last_instruction := Void
			if last_token = E_PRECURSOR then
				l_precursor_keyword := last_detachable_et_precursor_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_class_name_identifier
					if last_token = Right_brace_code then
						l_precursor_class_name := ast_factory.new_precursor_class_name (l_left_brace_symbol, last_class_name_identifier, last_detachable_et_symbol_value)
						read_token
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				end
				parse_optional_actual_arguments
				if last_token = Dot_code or last_token = Left_bracket_code then
					l_last_expression := ast_factory.new_precursor_expression (False, l_precursor_keyword, l_precursor_class_name, last_actual_arguments)
				else
					l_last_instruction := ast_factory.new_precursor_instruction (False, l_precursor_keyword, l_precursor_class_name, last_actual_arguments)
				end
			else
				report_syntax_error (last_position, last_value, precursor_keyword_expected)
			end
			last_instruction := l_last_instruction
			last_expression := l_last_expression
		end

	parse_create_instruction
			-- Parse a create instruction.
			-- Make the result available in `last_instruction`.
		local
			l_create_keyword: detachable ET_KEYWORD
			l_less_than_symbol: detachable ET_SYMBOL_OPERATOR
			l_region: detachable ET_CREATION_REGION
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_identifier: detachable ET_IDENTIFIER
			l_dot_symbol: detachable ET_SYMBOL
			l_call: detachable ET_QUALIFIED_CALL
			l_target: detachable ET_WRITABLE
		do
			last_instruction := Void
			if last_token = E_CREATE then
				l_create_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Less_than_code then
					l_less_than_symbol := last_detachable_et_symbol_operator_value
					read_token
					parse_class_name_identifier
					if last_token = Greater_than_code then
						l_region := ast_factory.new_creation_region (l_less_than_symbol, last_class_name_identifier, last_detachable_et_symbol_operator_value)
						read_token
					else
						report_syntax_error (last_position, last_value, greater_than_symbol_expected)
					end
				end
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					if last_token = Right_brace_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
						read_token
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				end
				if last_token = E_RESULT then
					l_target := last_detachable_et_result_value
					read_token
				else
					parse_feature_name_identifier
					l_target := new_writable (last_feature_name_identifier)
				end
				if last_token = Dot_code then
					l_dot_symbol := last_detachable_et_symbol_value
					read_token
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					parse_optional_actual_arguments
					l_call := ast_factory.new_qualified_call (new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
				end
				last_instruction := ast_factory.new_create_instruction (l_create_keyword, l_region, l_target_type, l_target, l_call)
			else
				report_syntax_error (last_position, last_value, create_keyword_expected)
			end
		end

	parse_creation_instruction
			-- Parse a (obsolete) creation instruction.
			-- Make the result available in `last_instruction`.
		local
			l_left_bang_symbol: detachable ET_SYMBOL
			l_right_bang_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_dot_symbol: detachable ET_SYMBOL
			l_call: detachable ET_QUALIFIED_CALL
			l_target: detachable ET_WRITABLE
			l_identifier_code: INTEGER
			l_type: detachable ET_TYPE
		do
			last_instruction := Void
			if last_token = Exclamation_code then
				l_left_bang_symbol := last_detachable_et_symbol_value
				read_token
				if last_token = Exclamation_code then
					l_right_bang_symbol := last_detachable_et_symbol_value
					read_token
					if is_identifier_token (last_token) then
						l_identifier_code := last_token
						l_identifier := last_detachable_et_identifier_value
						read_token
						if last_token = Left_bracket_code then
							unread_token
							unread_identifier_token (l_identifier_code, l_identifier)
							set_last_symbol_token (Exclamation_code, l_right_bang_symbol)
							parse_type
							l_type := last_type
							if last_token = Exclamation_code then
								l_right_bang_symbol := last_detachable_et_symbol_value
								read_token
							else
								report_syntax_error (last_position, last_value, exclamation_symbol_expected)
							end
						else
							unread_token
							set_last_identifier_token (l_identifier_code, l_identifier)
						end
					elseif last_token /= E_RESULT then
						unread_token
						set_last_symbol_token (Exclamation_code, l_right_bang_symbol)
						parse_type
						l_type := last_type
						if last_token = Exclamation_code then
							l_right_bang_symbol := last_detachable_et_symbol_value
							read_token
						else
							report_syntax_error (last_position, last_value, exclamation_symbol_expected)
						end
					end
				else
					parse_type
					l_type := last_type
					if last_token = Exclamation_code then
						l_right_bang_symbol := last_detachable_et_symbol_value
						read_token
					else
						report_syntax_error (last_position, last_value, exclamation_symbol_expected)
					end
				end
				if last_token = E_RESULT then
					l_target := last_detachable_et_result_value
					read_token
				else
					parse_feature_name_identifier
					l_target := new_writable (last_feature_name_identifier)
				end
				if last_token = Dot_code then
					l_dot_symbol := last_detachable_et_symbol_value
					read_token
					parse_feature_name_identifier
					l_identifier := last_feature_name_identifier
					parse_optional_actual_arguments
					l_call := ast_factory.new_qualified_call (new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
				end
				last_instruction := ast_factory.new_bang_instruction (l_left_bang_symbol, l_type, l_right_bang_symbol, l_target, l_call)
			else
				report_syntax_error (last_position, last_value, exclamation_symbol_expected)
			end
		end

	parse_from_instruction
			-- Parse a from instruction.
			-- Make the result available in `last_instruction`.
		local
			l_from_keyword: detachable ET_KEYWORD
			l_from_compound: detachable ET_COMPOUND
			l_loop_invariants: detachable ET_LOOP_INVARIANTS
			l_until_keyword: detachable ET_KEYWORD
			l_until_conditional: detachable ET_CONDITIONAL
			l_loop_keyword: detachable ET_KEYWORD
			l_loop_compound: detachable ET_COMPOUND
			l_variant: detachable ET_VARIANT
			l_has_old_variant: BOOLEAN
			l_end_keyword: detachable ET_KEYWORD
			l_instruction: detachable ET_INSTRUCTION
			l_expression: detachable ET_EXPRESSION
			l_unknown_expression: ET_EXPRESSION
		do
			last_instruction := Void
			if last_token = E_FROM then
				l_unknown_expression := tokens.true_keyword
				l_from_keyword := last_detachable_et_keyword_value
				read_token
				parse_optional_compound (False)
				l_from_compound := ast_factory.new_from_compound (l_from_keyword, last_compound)
				parse_optional_loop_invariants
				l_loop_invariants := last_loop_invariants
				if last_token = E_VARIANT then
					parse_optional_variant
					l_variant := last_variant
					l_has_old_variant := True
				end
				if last_token = E_UNTIL then
					l_until_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_expression := last_expression
					if l_expression = Void and has_syntax_error then
						l_expression := l_unknown_expression
					end
					l_until_conditional := ast_factory.new_conditional (l_until_keyword, l_expression)
				else
					report_syntax_error (last_position, last_value, until_keyword_expected)
				end
				if l_until_conditional = Void and has_syntax_error then
					l_until_conditional := l_unknown_expression
				end
				if last_token = E_LOOP then
					l_loop_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_loop_compound := ast_factory.new_from_compound (l_loop_keyword, last_compound)
				else
					report_syntax_error (last_position, last_value, loop_keyword_expected)
				end
				if not l_has_old_variant then
					parse_optional_variant
					l_variant := last_variant
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				if l_has_old_variant then
					l_instruction := ast_factory.new_loop_instruction_old_syntax (l_from_compound, l_loop_invariants, l_variant, l_until_conditional, l_loop_compound, l_end_keyword)
				else
					l_instruction := ast_factory.new_loop_instruction (l_from_compound, l_loop_invariants, l_until_conditional, l_loop_compound, l_variant, l_end_keyword)
				end
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_from_keyword /= Void then
					if l_end_keyword.line /= l_from_keyword.line and l_end_keyword.column /= l_from_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, from_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_across_instruction
			-- Parse an across instruction.
			-- Make the result available in `last_instruction`.
		local
			l_across_keyword: detachable ET_KEYWORD
			l_iterable_expression: detachable ET_EXPRESSION
			l_as_keyword: detachable ET_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
			l_from_keyword: detachable ET_KEYWORD
			l_from_compound: detachable ET_COMPOUND
			l_loop_invariants: detachable ET_LOOP_INVARIANTS
			l_until_keyword: detachable ET_KEYWORD
			l_until_conditional: detachable ET_CONDITIONAL
			l_loop_keyword: detachable ET_KEYWORD
			l_loop_compound: detachable ET_COMPOUND
			l_variant: detachable ET_VARIANT
			l_across_header: detachable ET_ACROSS_INSTRUCTION
			l_end_keyword: detachable ET_KEYWORD
			l_instruction: detachable ET_INSTRUCTION
			l_unknown_expression: ET_EXPRESSION
		do
			last_instruction := Void
			if last_token = E_ACROSS then
				l_unknown_expression := tokens.true_keyword
				l_across_keyword := last_detachable_et_keyword_value
				read_token
				parse_expression
				l_iterable_expression := last_expression
				if l_iterable_expression = Void and has_syntax_error then
					l_iterable_expression := l_unknown_expression
				end
				if last_token = E_AS or last_token = E_IS then
					l_as_keyword := last_detachable_et_keyword_value
					read_token
					parse_cursor_name_identifier
					l_identifier := last_cursor_name_identifier
				else
					report_syntax_error (last_position, last_value, as_keyword_expected)
					create l_identifier.make (tokens.unknown_name)
				end
				l_across_header := new_across_instruction_header (l_across_keyword, l_iterable_expression, l_as_keyword, l_identifier)
				if last_token = E_FROM then
					l_from_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_from_compound := ast_factory.new_from_compound (l_from_keyword, last_compound)
				end
				parse_optional_loop_invariants
				l_loop_invariants := last_loop_invariants
				if last_token = E_UNTIL then
					l_until_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_until_conditional := ast_factory.new_conditional (l_until_keyword, last_expression)
				end
				if last_token = E_LOOP then
					l_loop_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_loop_compound := ast_factory.new_from_compound (l_loop_keyword, last_compound)
				else
					report_syntax_error (last_position, last_value, loop_keyword_expected)
				end
				parse_optional_variant
				l_variant := last_variant
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_instruction := new_across_instruction (l_across_header, l_from_compound, l_loop_invariants, l_until_conditional, l_loop_compound, l_variant, l_end_keyword)
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_across_keyword /= Void then
					if l_end_keyword.line /= l_across_keyword.line and l_end_keyword.column /= l_across_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, across_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_repeat_instruction
			-- Parse a repeat instruction.
			-- Make the result available in `last_instruction`.
		local
			l_open_symbol: detachable ET_SYMBOL
			l_close_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_colon_symbol: detachable ET_SYMBOL
			l_expression: detachable ET_EXPRESSION
			l_bar_symbol: detachable ET_SYMBOL
			l_repeat_instruction_header: detachable ET_REPEAT_INSTRUCTION
			l_compound: detachable ET_COMPOUND
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			if last_token = E_OPEN_REPEAT then
				l_open_symbol := last_detachable_et_symbol_value
				read_token
				parse_cursor_name_identifier
				l_identifier := last_cursor_name_identifier
				if last_token = Colon_code then
					l_colon_symbol := last_detachable_et_symbol_value
					read_token
					parse_expression
					l_expression := last_expression
					if last_token = E_BAR then
						l_bar_symbol := last_detachable_et_symbol_value
						read_token
					else
						report_syntax_error (last_position, last_value, bar_symbol_expected)
					end
					l_repeat_instruction_header := new_repeat_instruction_header (l_open_symbol, l_identifier, l_colon_symbol, l_expression, l_bar_symbol)
					parse_optional_compound (False)
					l_compound := last_compound
				end
				if last_token = E_CLOSE_REPEAT then
					l_close_symbol := last_detachable_et_symbol_value
					read_token
				else
					report_syntax_error (last_position, last_value, close_repeat_symbol_expected)
				end
				l_instruction := new_repeat_instruction (l_repeat_instruction_header, l_compound, l_close_symbol)
			else
				report_syntax_error (last_position, last_value, open_repeat_symbol_expected)
			end
			last_instruction := l_instruction
		end

	parse_conditional_instruction
			-- Parse a conditional instruction.
			-- Make the result available in `last_instruction`.
		local
			l_if_keyword: detachable ET_KEYWORD
			l_then_keyword: detachable ET_KEYWORD
			l_else_keyword: detachable ET_KEYWORD
			l_conditional_expression: detachable ET_EXPRESSION
			l_then_compound: detachable ET_COMPOUND
			l_else_compound: detachable ET_COMPOUND
			l_elseif_part_list: detachable ET_ELSEIF_PART_LIST
			l_old_last_elseif_part_items_count: INTEGER
			l_elseif_keyword: detachable ET_KEYWORD
			l_elseif_then_keyword: detachable ET_KEYWORD
			l_elseif_then_compound: detachable ET_COMPOUND
			l_elseif_conditional_expression: detachable ET_EXPRESSION
			l_end_keyword: detachable ET_KEYWORD
			l_unknown_expression: ET_EXPRESSION
			nb: INTEGER
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			if last_token = E_IF then
				l_unknown_expression := tokens.true_keyword
				l_if_keyword := last_detachable_et_keyword_value
				read_token
				parse_expression
				l_conditional_expression := last_expression
				if l_conditional_expression = Void and has_syntax_error then
					l_conditional_expression := l_unknown_expression
				end
				if last_token = E_THEN then
					l_then_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_then_compound := ast_factory.new_then_compound (l_then_keyword, last_compound)
				else
					report_syntax_error (last_position, last_value, then_keyword_expected)
				end
				l_old_last_elseif_part_items_count := last_elseif_part_items.count
				from until
					last_token /= E_ELSEIF
				loop
					l_elseif_keyword := last_detachable_et_keyword_value
					read_token
					parse_expression
					l_elseif_conditional_expression := last_expression
					if last_token = E_THEN then
						l_elseif_then_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_elseif_then_compound := ast_factory.new_then_compound (l_elseif_then_keyword, last_compound)
					else
						report_syntax_error (last_position, last_value, then_keyword_expected)
						l_elseif_then_compound := Void
					end
					last_elseif_part_items.force (ast_factory.new_elseif_part (ast_factory.new_conditional (l_elseif_keyword, l_elseif_conditional_expression), l_elseif_then_compound))
				end
				nb := last_elseif_part_items.count - l_old_last_elseif_part_items_count
				if nb > 0 then
					l_elseif_part_list := ast_factory.new_elseif_part_list (nb)
					from until nb <= 0 loop
						if l_elseif_part_list /= Void and attached last_elseif_part_items.item as l_last_elseif_part_item then
							l_elseif_part_list.put_first (l_last_elseif_part_item)
						end
						last_elseif_part_items.remove
						nb := nb - 1
					end
				end
				if last_token = E_ELSE then
					l_else_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_else_compound := ast_factory.new_then_compound (l_else_keyword, last_compound)
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_instruction := ast_factory.new_if_instruction (ast_factory.new_conditional (l_if_keyword, l_conditional_expression), l_then_compound, l_elseif_part_list, l_else_compound, l_end_keyword)
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_if_keyword /= Void then
					if l_end_keyword.line /= l_if_keyword.line and l_end_keyword.column /= l_if_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, if_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_multi_branch_instruction
			-- Parse a multi branch instruction.
			-- Make the result available in `last_instruction`.
		local
			l_inspect_keyword: detachable ET_KEYWORD
			l_then_keyword: detachable ET_KEYWORD
			l_else_keyword: detachable ET_KEYWORD
			l_conditional_expression: detachable ET_EXPRESSION
			l_then_compound: detachable ET_COMPOUND
			l_else_compound: detachable ET_COMPOUND
			l_when_part_list: detachable ET_WHEN_PART_LIST
			l_end_keyword: detachable ET_KEYWORD
			l_old_last_when_part_items_count: INTEGER
			l_choices: detachable ET_CHOICE_LIST
			nb: INTEGER
			l_instruction: detachable ET_INSTRUCTION
			l_unknown_expression: ET_EXPRESSION
		do
			last_instruction := Void
			if last_token = E_INSPECT then
				l_unknown_expression := tokens.true_keyword
				l_inspect_keyword := last_detachable_et_keyword_value
				read_token
				parse_expression
				l_conditional_expression := last_expression
				if l_conditional_expression = Void and has_syntax_error then
					l_conditional_expression := l_unknown_expression
				end
				l_old_last_when_part_items_count := last_when_part_items.count
				from until
					last_token /= E_WHEN
				loop
					parse_choices
					l_choices := last_choices
					if last_token = E_THEN then
						l_then_keyword := last_detachable_et_keyword_value
						read_token
						parse_optional_compound (False)
						l_then_compound := ast_factory.new_then_compound (l_then_keyword, last_compound)
					else
						report_syntax_error (last_position, last_value, then_keyword_expected)
						l_then_compound := Void
					end
					last_when_part_items.force (ast_factory.new_when_part (l_choices, l_then_compound))
				end
				nb := last_when_part_items.count - l_old_last_when_part_items_count
				if nb > 0 then
					l_when_part_list := ast_factory.new_when_part_list (nb)
					from until nb <= 0 loop
						if l_when_part_list /= Void and attached last_when_part_items.item as last_when_part_item then
							l_when_part_list.put_first (last_when_part_item)
						end
						last_when_part_items.remove
						nb := nb - 1
					end
				end
				if last_token = E_ELSE then
					l_else_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (True)
					l_else_compound := ast_factory.new_else_compound (l_else_keyword, last_compound)
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_instruction := ast_factory.new_inspect_instruction (ast_factory.new_conditional (l_inspect_keyword, l_conditional_expression), l_when_part_list, l_else_compound, l_end_keyword)
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_inspect_keyword /= Void then
					if l_end_keyword.line /= l_inspect_keyword.line and l_end_keyword.column /= l_inspect_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, inspect_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_old_static_call_instruction
			-- Parse a static call instruction (old syntax).
			-- Make the result available in `last_instruction`,
			-- or in `last_expression` if it is the target of
			-- a qualified call or bracket expression.
		local
			l_feature_keyword: detachable ET_KEYWORD
			l_left_brace_symbol: detachable ET_SYMBOL
			l_target_type: detachable ET_TARGET_TYPE
			l_dot_symbol: detachable ET_SYMBOL
			l_identifier: detachable ET_IDENTIFIER
			l_last_expression: detachable ET_EXPRESSION
			l_last_instruction: detachable ET_INSTRUCTION
		do
			last_expression := Void
			last_instruction := Void
			if last_token = E_FEATURE then
				l_feature_keyword := last_detachable_et_keyword_value
				read_token
				if last_token = Left_brace_code then
					l_left_brace_symbol := last_detachable_et_symbol_value
					read_token
					parse_type
					if last_token = Right_brace_code then
						l_target_type := ast_factory.new_target_type (l_left_brace_symbol, last_type, last_detachable_et_symbol_value)
						read_token
						if last_token = Dot_code then
							l_dot_symbol := last_detachable_et_symbol_value
							read_token
							parse_feature_name_identifier
							l_identifier := last_feature_name_identifier
							parse_optional_actual_arguments
							if last_token = Dot_code or last_token = Left_bracket_code then
								l_last_expression := ast_factory.new_static_call_expression (l_feature_keyword, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
							else
								l_last_instruction := ast_factory.new_static_call_instruction (l_feature_keyword, l_target_type, new_dot_feature_name (l_dot_symbol, l_identifier), last_actual_arguments)
							end
						else
							report_syntax_error (last_position, last_value, dot_symbol_expected)
						end
					else
						report_syntax_error (last_position, last_value, right_brace_symbol_expected)
					end
				else
					report_syntax_error (last_position, last_value, left_brace_symbol_expected)
				end
			else
				report_syntax_error (last_position, last_value, feature_keyword_expected)
			end
			last_instruction := l_last_instruction
			last_expression := l_last_expression
		end

	parse_check_instruction
			-- Parse check instruction.
			-- Make the result available in `last_instruction`.
		local
			l_check_keyword: detachable ET_KEYWORD
			l_semicolon_symbol: detachable ET_SEMICOLON_SYMBOL
			l_then_keyword: detachable ET_KEYWORD
			l_then_compound: detachable ET_COMPOUND
			l_end_keyword: detachable ET_KEYWORD
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			if last_token = E_CHECK then
				start_check_instruction
				l_check_keyword := last_detachable_et_keyword_value
				read_token
				parse_optional_semicolon
				l_semicolon_symbol := last_semicolon
				parse_optional_assertions
				if last_token = E_THEN then
					l_then_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (True)
					l_then_compound := ast_factory.new_then_compound (l_then_keyword, last_compound)
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_instruction := new_check_instruction (l_check_keyword, l_semicolon_symbol, l_then_compound, l_end_keyword)
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_check_keyword /= Void then
					if l_end_keyword.line /= l_check_keyword.line and l_end_keyword.column /= l_check_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, check_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_debug_instruction
			-- Parse debug instruction.
			-- Make the result available in `last_instruction`.
		local
			l_debug_keyword: detachable ET_KEYWORD
			l_debug_compound: detachable ET_COMPOUND
			l_keys: detachable ET_MANIFEST_STRING_LIST
			l_end_keyword: detachable ET_KEYWORD
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			if last_token = E_DEBUG then
				l_debug_keyword := last_detachable_et_keyword_value
				read_token
				parse_optional_keys
				l_keys := last_keys
				parse_optional_compound (False)
				l_debug_compound := ast_factory.new_then_compound (l_debug_keyword, last_compound)
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_instruction := ast_factory.new_debug_instruction (l_keys, l_debug_compound, l_end_keyword)
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_debug_keyword /= Void then
					if l_end_keyword.line /= l_debug_keyword.line and l_end_keyword.column /= l_debug_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, debug_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_inline_separate_instruction
			-- Parse inline separate instruction.
			-- Make the result available in `last_instruction`.
		local
			l_separate_keyword: detachable ET_KEYWORD
			l_do_compound: detachable ET_COMPOUND
			l_old_last_inline_separate_argument_items_count: INTEGER
			nb: INTEGER
			l_done: BOOLEAN
			l_inline_separate_argument_expected: BOOLEAN
			l_expression: detachable ET_EXPRESSION
			l_as_keyword: detachable ET_KEYWORD
			l_identifier: detachable ET_IDENTIFIER
			l_inline_separate_argument: detachable ET_INLINE_SEPARATE_ARGUMENT
			l_inline_separate_arguments: detachable ET_INLINE_SEPARATE_ARGUMENTS
			l_do_keyword: detachable ET_KEYWORD
			l_end_keyword: detachable ET_KEYWORD
			l_instruction: detachable ET_INSTRUCTION
		do
			last_instruction := Void
			if last_token = E_SEPARATE then
				l_separate_keyword := last_detachable_et_keyword_value
				read_token
				l_old_last_inline_separate_argument_items_count := last_inline_separate_argument_items.count
				from until l_done loop
					if last_token = E_DO then
						if l_inline_separate_argument_expected then
							report_syntax_error (last_position, last_value, expression_expected)
						end
						l_done := True
					else
						l_inline_separate_argument_expected := False
						parse_expression
						l_expression := last_expression
						if last_token = E_AS then
							l_as_keyword := last_detachable_et_keyword_value
							read_token
							parse_inline_separate_argument_name_identifier
							l_identifier := last_inline_separate_argument_name_identifier
							l_inline_separate_argument := new_inline_separate_argument (l_expression, l_as_keyword, l_identifier)
							if last_token = Comma_code then
								last_inline_separate_argument_items.force (ast_factory.new_inline_separate_argument_comma (l_inline_separate_argument, last_detachable_et_symbol_value))
								l_inline_separate_argument_expected := True
								read_token
							else
								last_inline_separate_argument_items.force (l_inline_separate_argument)
								if last_token /= E_DO and then is_expression_first_token (last_token) then
									report_syntax_error (last_position, last_value, comma_symbol_expected)
								else
									l_done := True
								end
							end
						else
							report_syntax_error (last_position, last_value, as_keyword_expected)
							create l_identifier.make (tokens.unknown_name)
							l_inline_separate_argument := new_inline_separate_argument (l_expression, l_as_keyword, l_identifier)
							last_inline_separate_argument_items.force (l_inline_separate_argument)
							l_done := True
						end
					end
				end
				nb := last_inline_separate_argument_items.count - l_old_last_inline_separate_argument_items_count
				if nb > 0 then
					l_inline_separate_arguments := ast_factory.new_inline_separate_arguments (l_separate_keyword, nb)
					from until nb <= 0 loop
						if l_inline_separate_arguments /= Void and then attached last_inline_separate_argument_items.item as l_last_inline_separate_argument_item then
							l_inline_separate_arguments.put_first (l_last_inline_separate_argument_item)
						end
						last_inline_separate_argument_items.remove
						nb := nb - 1
					end
				else
					report_syntax_error (last_position, last_value, expression_expected)
				end
				if last_token = E_DO then
					l_do_keyword := last_detachable_et_keyword_value
					read_token
					parse_optional_compound (False)
					l_do_compound := ast_factory.new_do_compound (l_do_keyword, last_compound)
				else
					report_syntax_error (last_position, last_value, do_keyword_expected)
				end
				if last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					read_token
				else
					report_syntax_error (last_position, last_value, end_keyword_expected)
				end
				l_instruction := new_inline_separate_instruction (l_inline_separate_arguments, l_do_compound, l_end_keyword)
				if end_indentation_mismatch = Void and l_end_keyword /= Void and l_separate_keyword /= Void then
					if l_end_keyword.line /= l_separate_keyword.line and l_end_keyword.column /= l_separate_keyword.column then
						end_indentation_mismatch := l_instruction
					end
				end
			else
				report_syntax_error (last_position, last_value, separate_keyword_expected)
			end
			last_instruction := l_instruction
		end

	parse_feature_name
			-- Parse a feature name.
			-- Make the result available in `last_feature_name`.
		do
			last_feature_name := Void
			if is_identifier_token (last_token) then
				if attached last_detachable_et_identifier_value as l_identifier then
					l_identifier.set_feature_name (True)
					last_feature_name := l_identifier
				end
				read_token
			else
				report_syntax_error (last_position, last_value, feature_name_expected)
			end
		end

	parse_extended_feature_name
			-- Parse an extended feature name.
			-- Make the result available in `last_extended_feature_name`.
		local
			l_alias_keyword: detachable ET_KEYWORD
			l_alias_name: detachable ET_ALIAS_NAME
			l_has_alias_error: BOOLEAN
			l_alias_name_list: detachable ET_ALIAS_NAME_LIST
			l_identifier: detachable ET_IDENTIFIER
			l_old_last_alias_name_items_count: INTEGER
			nb: INTEGER
			l_old_is_error_recovering: BOOLEAN
		do
			last_extended_feature_name := Void
			parse_feature_name_identifier
			l_identifier := last_feature_name_identifier
			l_old_last_alias_name_items_count := last_alias_name_items.count
			from
			until
				last_token /= E_ALIAS
			loop
				l_alias_keyword := last_detachable_et_keyword_value
				read_token
				l_has_alias_error := False
				inspect last_token
				when E_STRNOT then
					l_alias_name := ast_factory.new_alias_not_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRNOTSYMBOL then
					l_alias_name := ast_factory.new_alias_not_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRPLUS then
					l_alias_name := ast_factory.new_alias_plus_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRMINUS then
					l_alias_name := ast_factory.new_alias_minus_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRSTAR then
					l_alias_name := ast_factory.new_alias_times_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRSLASH then
					l_alias_name := ast_factory.new_alias_divide_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRDIV then
					l_alias_name := ast_factory.new_alias_div_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRMOD then
					l_alias_name := ast_factory.new_alias_mod_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRPOWER then
					l_alias_name := ast_factory.new_alias_power_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRLT then
					l_alias_name := ast_factory.new_alias_lt_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRLE then
					l_alias_name := ast_factory.new_alias_le_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRGT then
					l_alias_name := ast_factory.new_alias_gt_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRGE then
					l_alias_name := ast_factory.new_alias_ge_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRAND then
					l_alias_name := ast_factory.new_alias_and_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRANDSYMBOL then
					l_alias_name := ast_factory.new_alias_and_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRANDTHEN then
					l_alias_name := ast_factory.new_alias_and_then_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRANDTHENSYMBOL then
					l_alias_name := ast_factory.new_alias_and_then_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STROR then
					l_alias_name := ast_factory.new_alias_or_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRORSYMBOL then
					l_alias_name := ast_factory.new_alias_or_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRORELSE then
					l_alias_name := ast_factory.new_alias_or_else_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRORELSESYMBOL then
					l_alias_name := ast_factory.new_alias_or_else_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRIMPLIES then
					l_alias_name := ast_factory.new_alias_implies_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRIMPLIESSYMBOL then
					l_alias_name := ast_factory.new_alias_implies_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRXOR then
					l_alias_name := ast_factory.new_alias_xor_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRXORSYMBOL then
					l_alias_name := ast_factory.new_alias_xor_symbol_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRDOTDOT then
					l_alias_name := ast_factory.new_alias_dotdot_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRFREEOP then
					l_alias_name := ast_factory.new_alias_free_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRBRACKET then
					l_alias_name := ast_factory.new_alias_bracket_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRPARENTHESIS then
					l_alias_name := ast_factory.new_alias_parenthesis_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
				when E_STRING then
					l_alias_name := ast_factory.new_alias_free_name (l_alias_keyword, last_detachable_et_manifest_string_value, Void)
					l_old_is_error_recovering := is_error_recovering
					is_error_recovering := False
					report_syntax_error (last_position, last_value, alias_name_invalid)
					is_error_recovering := l_old_is_error_recovering
				else
					report_syntax_error (last_position, last_value, alias_name_expected)
					l_has_alias_error := True
				end
				if not l_has_alias_error then
					read_token
					if last_token = E_CONVERT then
						if l_alias_name /= Void then
							l_alias_name.set_convert_keyword (last_detachable_et_keyword_value)
						end
						read_token
					end
					last_alias_name_items.force (l_alias_name)
				end
			end
			nb := last_alias_name_items.count - l_old_last_alias_name_items_count
			if nb > 0 then
				l_alias_name_list := ast_factory.new_alias_name_list (nb)
				from until nb <= 0 loop
					if l_alias_name_list /= Void and attached last_alias_name_items.item as l_last_alias_name then
						l_alias_name_list.put_first (l_last_alias_name)
					end
					last_alias_name_items.remove
					nb := nb - 1
				end
				last_extended_feature_name := ast_factory.new_aliased_feature_name (l_identifier, l_alias_name_list)
			else
				last_extended_feature_name := l_identifier
			end
		end

	parse_optional_semicolon
			-- Parse a optional semicolon.
			-- Make the result available in `last_semicolon`.
		local
			l_semicolon: detachable ET_SEMICOLON_SYMBOL
			l_last_semicolon: detachable ET_SEMICOLON_SYMBOL
		do
			last_semicolon := Void
			from until
				last_token /= Semicolon_code
			loop
				l_semicolon := last_detachable_et_semicolon_symbol_value
				read_token
				if last_semicolon = Void then
					last_semicolon := l_semicolon
				elseif l_last_semicolon /= Void and then l_last_semicolon /= tokens.semicolon_symbol then
					l_last_semicolon.set_other (l_semicolon)
				end
				if l_semicolon /= Void then
					l_last_semicolon := l_semicolon
				end
			end
		end

feature -- Error handling

	has_syntax_error: BOOLEAN
			-- Has a syntax error been found?
		do
			Result := internal_has_syntax_error
		end

	is_error_recovering: BOOLEAN
			-- Are we recovering from a syntax error?

	report_syntax_error (a_position: ET_POSITION; a_ast_node: detachable ET_AST_NODE; a_message: STRING)
			-- Report a syntax error at position `a_position'.
		local
			l_position: ET_POSITION
		do
			if not is_error_recovering then
				set_syntax_error
				if attached end_indentation_mismatch as l_end_indentation_mismatch then
					error_handler.report_syntax_warning (filename, l_end_indentation_mismatch.position, l_end_indentation_mismatch, end_keyword_indentation_mismatch)
					end_indentation_mismatch := Void
				end
				l_position := a_position
				if l_position.is_null and a_ast_node /= Void then
					l_position := a_ast_node.position
				end
				if l_position.is_null then
					l_position := current_position
				end
				last_syntax_error_position := l_position
				error_handler.report_syntax_error (filename, l_position, a_ast_node, a_message)
				is_error_recovering := True
			end
		end

	set_syntax_error
			-- Set syntax error flag in class being parsed, if already known.
		do
			internal_has_syntax_error := True
			if attached last_class as l_last_class then
				set_fatal_error (l_last_class)
			end
		end

	stop_parsing
			-- Stop the parsing.
		do
			is_parsing_stopped := True
		end

	is_parsing_stopped: BOOLEAN
			-- Has parsing been stopped?

	end_indentation_mismatch: detachable ET_AST_NODE
			-- Eiffel construction with an indentation mismatch
			-- between the start keyword and the 'end' keyword,
			-- if any

	last_syntax_error_position: detachable ET_POSITION
			-- Position of the last syntax error reported by `report_syntax_error`

feature {NONE} -- Error handling

	internal_has_syntax_error: BOOLEAN
			-- Has a syntax error been reported?

feature {NONE} -- Access

	last_notes: detachable ET_NOTE_LIST
			-- Last notes parsed

	last_type: detachable ET_TYPE
			-- Last type parsed

	last_actual_parameters: detachable ET_ACTUAL_PARAMETER_LIST
			-- Last actual parameters parsed

	last_formal_parameters: detachable ET_FORMAL_PARAMETER_LIST
			-- Last formal parameters parsed

	last_formal_parameter: detachable ET_FORMAL_PARAMETER
			-- Last formal parameter parsed

	last_constraint: detachable ET_CONSTRAINT
			-- Last constraint parsed

	last_type_constraint: detachable ET_TYPE_CONSTRAINT
			-- Last type constraint parsed

	last_constraint_type: detachable ET_CONSTRAINT_TYPE
			-- Last constraint type parsed

	last_constraint_actual_parameters: detachable ET_CONSTRAINT_ACTUAL_PARAMETER_LIST
			-- Last constraint actual parameters parsed

	last_constraint_renames: detachable ET_CONSTRAINT_RENAME_LIST
			-- Last constraint renames parsed

	last_constraint_creator: detachable ET_CONSTRAINT_CREATOR
			-- Last constraint creator parsed

	last_obsolete: detachable ET_OBSOLETE
			-- Last obsolete parsed

	last_parent_clauses: detachable ET_PARENT_CLAUSE_LIST
			-- Last parent clauses parsed

	last_parents: detachable ET_PARENT_LIST
			-- Last parents parsed

	last_parent: detachable ET_PARENT
			-- Last parent parsed

	last_renames: detachable ET_RENAME_LIST
			-- Last renames parsed

	last_export: detachable ET_EXPORT
			-- Last export parsed

	last_exports: detachable ET_EXPORT_LIST
			-- Last exports parsed

	last_undefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- Last undefines parsed

	last_redefines: detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- Last redefines parsed

	last_selects: detachable ET_KEYWORD_FEATURE_NAME_LIST
			-- Last selects parsed

	last_creators: detachable ET_CREATOR_LIST
			-- Last creators parsed

	last_creator: detachable ET_CREATOR
			-- Last creator parsed

	last_converts: detachable ET_CONVERT_FEATURE_LIST
			-- Last converts parsed

	last_convert_types: detachable ET_TYPE_LIST
			-- Last convert types parsed

	last_feature_clauses: detachable ET_FEATURE_CLAUSE_LIST
			-- Last feature clauses parsed

	last_expression: detachable ET_EXPRESSION
			-- Last expression parsed

	last_parenthesized_expression: detachable ET_PARENTHESIZED_EXPRESSION
			-- Last parenthesized expression parsed

	last_choice_constant: detachable ET_CHOICE_CONSTANT
			-- Last choice constant parsed

	last_choice: detachable ET_CHOICE
			-- Last choice parsed

	last_choices: detachable ET_CHOICE_LIST
			-- Last choices parsed

	last_attribute_constant: detachable ET_CONSTANT
			-- Last attribute constant parsed

	last_create_expression: detachable ET_CREATE_EXPRESSION
			-- Last create expression parsed

	last_manifest_array: detachable ET_MANIFEST_ARRAY
			-- Last manifest array parsed

	last_manifest_tuple: detachable ET_MANIFEST_TUPLE
			-- Last manifest tuple parsed

	last_actual_arguments: detachable ET_ACTUAL_ARGUMENT_LIST
			-- Last actual arguments parsed

	last_agent_open_operand: detachable ET_AGENT_ARGUMENT_OPERAND
			-- Last agent open operand parsed

	last_agent_actual_arguments: detachable ET_AGENT_ARGUMENT_OPERAND_LIST
			-- Last agent actual arguments parsed

	last_keys: detachable ET_MANIFEST_STRING_LIST
			-- Last keys parsed

	last_preconditions: detachable ET_PRECONDITIONS
			-- Last preconditions parsed

	last_postconditions: detachable ET_POSTCONDITIONS
			-- Last postconditions parsed

	last_invariants: detachable ET_INVARIANTS
			-- Last invariants parsed

	last_variant: detachable ET_VARIANT
			-- Last variant parsed

	last_loop_invariants: detachable ET_LOOP_INVARIANTS
			-- Last loop invariants parsed

	last_class_name_identifier: detachable ET_IDENTIFIER
			-- Last class name identifier parsed

	last_feature_name_identifier: detachable ET_IDENTIFIER
			-- Last class name identifier parsed

	last_cursor_name_identifier: detachable ET_IDENTIFIER
			-- Last cursor name identifier parsed

	last_object_test_local_identifier: detachable ET_IDENTIFIER
			-- Last object-test local identifier parsed

	last_inline_separate_argument_name_identifier: detachable ET_IDENTIFIER
			-- Last inline separate argument name identifier parsed

	last_instruction: detachable ET_INSTRUCTION
			-- Last instruction parsed

	last_compound: detachable ET_COMPOUND
			-- Last compound parsed

	last_feature_name: detachable ET_FEATURE_NAME
			-- Last feature name parsed

	last_extended_feature_name: detachable ET_EXTENDED_FEATURE_NAME
			-- Last extended feature name parsed

	last_semicolon: detachable ET_SEMICOLON_SYMBOL
			-- Last semicolon parsed

	last_is_dot_call_target: BOOLEAN
			-- Can the last expression parsed be used as target of a dot call?

	last_is_bracket_call_target: BOOLEAN
			-- Can the last expression parsed be used as target of a bracket expression call?

	last_is_agent_open_operand: BOOLEAN
			-- Has an agent open operand been parsed and
			-- made available `last_agent_open_operand`?

	last_note_items: DS_ARRAYED_STACK [detachable ET_NOTE_ITEM]
			-- Last note items read

	last_note_term_items: DS_ARRAYED_STACK [detachable ET_NOTE_TERM_ITEM]
			-- Last note term items read

	last_actual_parameter_items: DS_ARRAYED_STACK [detachable ET_ACTUAL_PARAMETER_ITEM]
			-- Last actual_parameter items read

	last_formal_parameter_items: DS_ARRAYED_STACK [detachable ET_FORMAL_PARAMETER_ITEM]
			-- Last formal parameter item read

	last_constraint_actual_parameter_items: DS_ARRAYED_STACK [detachable ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM]
			-- Last constraint actual_parameter items read

	last_type_constraint_items: DS_ARRAYED_STACK [detachable ET_TYPE_CONSTRAINT_ITEM]
			-- Last type constraint items read

	last_labels: DS_ARRAYED_STACK [detachable ET_LABEL]
			-- Last labels read

	last_feature_name_items: DS_ARRAYED_STACK [detachable ET_FEATURE_NAME_ITEM]
			-- Last feature name items read

	last_alias_name_items: DS_ARRAYED_STACK [detachable ET_ALIAS_NAME]
			-- Last alias name items read

	last_extended_feature_name_items: DS_ARRAYED_STACK [detachable ET_EXTENDED_FEATURE_NAME]
			-- Last extended feature name items read

	last_extended_feature_name_frozen_items: DS_ARRAYED_STACK [detachable ET_KEYWORD]
			-- Last 'frozen' keywords before extended feature name items read

	last_parent_clause_items: DS_ARRAYED_STACK [detachable ET_PARENT_LIST]
			-- Last parent clause items read

	last_parent_items: DS_ARRAYED_STACK [detachable ET_PARENT_ITEM]
			-- Last parent items read

	last_rename_items: DS_ARRAYED_STACK [detachable ET_RENAME_ITEM]
			-- Last rename items read

	last_client_items: DS_ARRAYED_STACK [detachable ET_CLIENT_ITEM]
			-- Last client items read

	last_export_items: DS_ARRAYED_STACK [detachable ET_EXPORT]
			-- Last export items read

	last_creator_items: DS_ARRAYED_STACK [detachable ET_CREATOR]
			-- Last creator items read

	last_type_items: DS_ARRAYED_STACK [detachable ET_TYPE_ITEM]
			-- Last type items read

	last_convert_feature_items: DS_ARRAYED_STACK [detachable ET_CONVERT_FEATURE_ITEM]
			-- Last convert feature items read

	last_feature_clause_items: DS_ARRAYED_STACK [detachable ET_FEATURE_CLAUSE]
			-- Last feature clause items read

	last_formal_argument_items: DS_ARRAYED_STACK [detachable ET_FORMAL_ARGUMENT_ITEM]
			-- Last formal argument items read

	last_local_variable_items: DS_ARRAYED_STACK [detachable ET_LOCAL_VARIABLE_ITEM]
			-- Last local variable items read

	last_expression_items: DS_ARRAYED_STACK [detachable ET_EXPRESSION_ITEM]
			-- Last expression items read

	last_agent_actual_argument_items: DS_ARRAYED_STACK [detachable ET_AGENT_ARGUMENT_OPERAND_ITEM]
			-- Last agent actual argument items read

	last_elseif_expression_items: DS_ARRAYED_STACK [detachable ET_ELSEIF_EXPRESSION]
			-- Last elseif expression items read

	last_when_expression_items: DS_ARRAYED_STACK [detachable ET_WHEN_EXPRESSION]
			-- Last when expression items read

	last_choice_items: DS_ARRAYED_STACK [detachable ET_CHOICE_ITEM]
			-- Last when choice items read

	last_manifest_string_items: DS_ARRAYED_STACK [detachable ET_MANIFEST_STRING_ITEM]
			-- Last when manifest string items read

	last_instruction_items: DS_ARRAYED_STACK [detachable ET_INSTRUCTION]
			-- Last instruction items read

	last_elseif_part_items: DS_ARRAYED_STACK [detachable ET_ELSEIF_PART]
			-- Last elseif part items read

	last_when_part_items: DS_ARRAYED_STACK [detachable ET_WHEN_PART]
			-- Last when part items read

	last_inline_separate_argument_items: DS_ARRAYED_STACK [detachable ET_INLINE_SEPARATE_ARGUMENT_ITEM]
			-- Last inline separate argument items read

feature {NONE} -- Scanner

	read_token
			-- Read next token.
		do
			if not last_tokens.is_empty then
				last_token := last_tokens.last
				last_tokens.remove_last
				last_detachable_any_value := last_detachable_any_values.last
				last_detachable_any_values.remove_last
				last_detachable_et_keyword_value := last_detachable_et_keyword_values.last
				last_detachable_et_keyword_values.remove_last
				last_detachable_et_agent_keyword_value := last_detachable_et_agent_keyword_values.last
				last_detachable_et_agent_keyword_values.remove_last
				last_detachable_et_invariant_keyword_value := last_detachable_et_invariant_keyword_values.last
				last_detachable_et_invariant_keyword_values.remove_last
				last_detachable_et_precursor_keyword_value := last_detachable_et_precursor_keyword_values.last
				last_detachable_et_precursor_keyword_values.remove_last
				last_detachable_et_symbol_value := last_detachable_et_symbol_values.last
				last_detachable_et_symbol_values.remove_last
				last_detachable_et_position_value := last_detachable_et_position_values.last
				last_detachable_et_position_values.remove_last
				last_detachable_et_boolean_constant_value := last_detachable_et_boolean_constant_values.last
				last_detachable_et_boolean_constant_values.remove_last
				last_detachable_et_break_value := last_detachable_et_break_values.last
				last_detachable_et_break_values.remove_last
				last_detachable_et_character_constant_value := last_detachable_et_character_constant_values.last
				last_detachable_et_character_constant_values.remove_last
				last_detachable_et_current_value := last_detachable_et_current_values.last
				last_detachable_et_current_values.remove_last
				last_detachable_et_free_operator_value := last_detachable_et_free_operator_values.last
				last_detachable_et_free_operator_values.remove_last
				last_detachable_et_identifier_value := last_detachable_et_identifier_values.last
				last_detachable_et_identifier_values.remove_last
				last_detachable_et_integer_constant_value := last_detachable_et_integer_constant_values.last
				last_detachable_et_integer_constant_values.remove_last
				last_detachable_et_keyword_operator_value := last_detachable_et_keyword_operator_values.last
				last_detachable_et_keyword_operator_values.remove_last
				last_detachable_et_manifest_string_value := last_detachable_et_manifest_string_values.last
				last_detachable_et_manifest_string_values.remove_last
				last_detachable_et_real_constant_value := last_detachable_et_real_constant_values.last
				last_detachable_et_real_constant_values.remove_last
				last_detachable_et_result_value := last_detachable_et_result_values.last
				last_detachable_et_result_values.remove_last
				last_detachable_et_retry_instruction_value := last_detachable_et_retry_instruction_values.last
				last_detachable_et_retry_instruction_values.remove_last
				last_detachable_et_symbol_operator_value := last_detachable_et_symbol_operator_values.last
				last_detachable_et_symbol_operator_values.remove_last
				last_detachable_et_void_value := last_detachable_et_void_values.last
				last_detachable_et_void_values.remove_last
				last_detachable_et_semicolon_symbol_value := last_detachable_et_semicolon_symbol_values.last
				last_detachable_et_semicolon_symbol_values.remove_last
				last_detachable_et_bracket_symbol_value := last_detachable_et_bracket_symbol_values.last
				last_detachable_et_bracket_symbol_values.remove_last
				last_detachable_et_question_mark_symbol_value := last_detachable_et_question_mark_symbol_values.last
				last_detachable_et_question_mark_symbol_values.remove_last
			else
				yy_read_token
			end
		end

	set_last_agent_keyword_token (a_token: INTEGER; a_keyword_value: detachable ET_AGENT_KEYWORD)
			-- Set `last_token` to `a_token`.
			-- Set `last_detachable_et_agent_keyword_value` to `a_keyword_value`.
		do
			last_token := a_token
			last_detachable_et_agent_keyword_value := a_keyword_value
		ensure
			last_token_set: last_token = a_token
			last_detachable_et_agent_keyword_value_set: last_detachable_et_agent_keyword_value = a_keyword_value
		end

	set_last_bracket_symbol_token (a_token: INTEGER; a_symbol_value: detachable ET_BRACKET_SYMBOL)
			-- Set `last_token` to `a_token`.
			-- Set `last_detachable_et_bracket_symbol_value` to `a_keyword_value`.
		do
			last_token := a_token
			last_detachable_et_bracket_symbol_value := a_symbol_value
		ensure
			last_token_set: last_token = a_token
			last_detachable_et_keyword_value_set: last_detachable_et_bracket_symbol_value = a_symbol_value
		end

	set_last_identifier_token (a_token: INTEGER; a_identifier_value: detachable ET_IDENTIFIER)
			-- Set `last_token` to `a_token`.
			-- Set `last_detachable_et_identifier_value` to `a_identifier_value`.
		do
			last_token := a_token
			last_detachable_et_identifier_value := a_identifier_value
		ensure
			last_token_set: last_token = a_token
			last_detachable_et_identifier_value_set: last_detachable_et_identifier_value = a_identifier_value
		end

	set_last_keyword_token (a_token: INTEGER; a_keyword_value: detachable ET_KEYWORD)
			-- Set `last_token` to `a_token`.
			-- Set `last_detachable_et_keyword_value` to `a_keyword_value`.
		do
			last_token := a_token
			last_detachable_et_keyword_value := a_keyword_value
		ensure
			last_token_set: last_token = a_token
			last_detachable_et_keyword_value_set: last_detachable_et_keyword_value = a_keyword_value
		end

	set_last_symbol_token (a_token: INTEGER; a_symbol_value: detachable ET_SYMBOL)
			-- Set `last_token` to `a_token`.
			-- Set `last_detachable_et_symbol_value` to `a_symbol_value`.
		do
			last_token := a_token
			last_detachable_et_symbol_value := a_symbol_value
		ensure
			last_token_set: last_token = a_token
			last_detachable_et_symbol_value_set: last_detachable_et_symbol_value = a_symbol_value
		end

	set_last_symbol_operator_token (a_token: INTEGER; a_symbol_operator_value: detachable ET_SYMBOL_OPERATOR)
			-- Set `last_token` to `a_token`.
			-- Set `last_detachable_et_symbol_operator_value` to `a_symbol_operator_value`.
		do
			last_token := a_token
			last_detachable_et_symbol_operator_value := a_symbol_operator_value
		ensure
			last_token_set: last_token = a_token
			last_detachable_et_symbol_operator_value_set: last_detachable_et_symbol_operator_value = a_symbol_operator_value
		end

	unread_token
			-- Unread last token.
		do
			last_tokens.force_last (last_token)
			last_detachable_any_values.force_last (last_detachable_any_value)
			last_detachable_et_keyword_values.force_last (last_detachable_et_keyword_value)
			last_detachable_et_agent_keyword_values.force_last (last_detachable_et_agent_keyword_value)
			last_detachable_et_invariant_keyword_values.force_last (last_detachable_et_invariant_keyword_value)
			last_detachable_et_precursor_keyword_values.force_last (last_detachable_et_precursor_keyword_value)
			last_detachable_et_symbol_values.force_last (last_detachable_et_symbol_value)
			last_detachable_et_position_values.force_last (last_detachable_et_position_value)
			last_detachable_et_boolean_constant_values.force_last (last_detachable_et_boolean_constant_value)
			last_detachable_et_break_values.force_last (last_detachable_et_break_value)
			last_detachable_et_character_constant_values.force_last (last_detachable_et_character_constant_value)
			last_detachable_et_current_values.force_last (last_detachable_et_current_value)
			last_detachable_et_free_operator_values.force_last (last_detachable_et_free_operator_value)
			last_detachable_et_identifier_values.force_last (last_detachable_et_identifier_value)
			last_detachable_et_integer_constant_values.force_last (last_detachable_et_integer_constant_value)
			last_detachable_et_keyword_operator_values.force_last (last_detachable_et_keyword_operator_value)
			last_detachable_et_manifest_string_values.force_last (last_detachable_et_manifest_string_value)
			last_detachable_et_real_constant_values.force_last (last_detachable_et_real_constant_value)
			last_detachable_et_result_values.force_last (last_detachable_et_result_value)
			last_detachable_et_retry_instruction_values.force_last (last_detachable_et_retry_instruction_value)
			last_detachable_et_symbol_operator_values.force_last (last_detachable_et_symbol_operator_value)
			last_detachable_et_void_values.force_last (last_detachable_et_void_value)
			last_detachable_et_semicolon_symbol_values.force_last (last_detachable_et_semicolon_symbol_value)
			last_detachable_et_bracket_symbol_values.force_last (last_detachable_et_bracket_symbol_value)
			last_detachable_et_question_mark_symbol_values.force_last (last_detachable_et_question_mark_symbol_value)
		end

	unread_identifier_token (a_token: INTEGER; a_identifier_value: detachable ET_IDENTIFIER)
			-- Unread identifier token.
		do
			last_tokens.force_last (a_token)
			last_detachable_any_values.force_last (Void)
			last_detachable_et_keyword_values.force_last (Void)
			last_detachable_et_agent_keyword_values.force_last (Void)
			last_detachable_et_invariant_keyword_values.force_last (Void)
			last_detachable_et_precursor_keyword_values.force_last (Void)
			last_detachable_et_symbol_values.force_last (Void)
			last_detachable_et_position_values.force_last (Void)
			last_detachable_et_boolean_constant_values.force_last (Void)
			last_detachable_et_break_values.force_last (Void)
			last_detachable_et_character_constant_values.force_last (Void)
			last_detachable_et_current_values.force_last (Void)
			last_detachable_et_free_operator_values.force_last (Void)
			last_detachable_et_identifier_values.force_last (a_identifier_value)
			last_detachable_et_integer_constant_values.force_last (Void)
			last_detachable_et_keyword_operator_values.force_last (Void)
			last_detachable_et_manifest_string_values.force_last (Void)
			last_detachable_et_real_constant_values.force_last (Void)
			last_detachable_et_result_values.force_last (Void)
			last_detachable_et_retry_instruction_values.force_last (Void)
			last_detachable_et_symbol_operator_values.force_last (Void)
			last_detachable_et_void_values.force_last (Void)
			last_detachable_et_semicolon_symbol_values.force_last (Void)
			last_detachable_et_bracket_symbol_values.force_last (Void)
			last_detachable_et_question_mark_symbol_values.force_last (Void)
		end

	unread_keyword_token (a_token: INTEGER; a_keyword_value: detachable ET_KEYWORD)
			-- Unread keyword token.
		do
			last_tokens.force_last (a_token)
			last_detachable_any_values.force_last (Void)
			last_detachable_et_keyword_values.force_last (a_keyword_value)
			last_detachable_et_agent_keyword_values.force_last (Void)
			last_detachable_et_invariant_keyword_values.force_last (Void)
			last_detachable_et_precursor_keyword_values.force_last (Void)
			last_detachable_et_symbol_values.force_last (Void)
			last_detachable_et_position_values.force_last (Void)
			last_detachable_et_boolean_constant_values.force_last (Void)
			last_detachable_et_break_values.force_last (Void)
			last_detachable_et_character_constant_values.force_last (Void)
			last_detachable_et_current_values.force_last (Void)
			last_detachable_et_free_operator_values.force_last (Void)
			last_detachable_et_identifier_values.force_last (Void)
			last_detachable_et_integer_constant_values.force_last (Void)
			last_detachable_et_keyword_operator_values.force_last (Void)
			last_detachable_et_manifest_string_values.force_last (Void)
			last_detachable_et_real_constant_values.force_last (Void)
			last_detachable_et_result_values.force_last (Void)
			last_detachable_et_retry_instruction_values.force_last (Void)
			last_detachable_et_symbol_operator_values.force_last (Void)
			last_detachable_et_void_values.force_last (Void)
			last_detachable_et_semicolon_symbol_values.force_last (Void)
			last_detachable_et_bracket_symbol_values.force_last (Void)
			last_detachable_et_question_mark_symbol_values.force_last (Void)
		end

	unread_symbol_token (a_token: INTEGER; a_symbol_value: detachable ET_SYMBOL)
			-- Unread symbol token.
		do
			last_tokens.force_last (a_token)
			last_detachable_any_values.force_last (Void)
			last_detachable_et_keyword_values.force_last (Void)
			last_detachable_et_agent_keyword_values.force_last (Void)
			last_detachable_et_invariant_keyword_values.force_last (Void)
			last_detachable_et_precursor_keyword_values.force_last (Void)
			last_detachable_et_symbol_values.force_last (a_symbol_value)
			last_detachable_et_position_values.force_last (Void)
			last_detachable_et_boolean_constant_values.force_last (Void)
			last_detachable_et_break_values.force_last (Void)
			last_detachable_et_character_constant_values.force_last (Void)
			last_detachable_et_current_values.force_last (Void)
			last_detachable_et_free_operator_values.force_last (Void)
			last_detachable_et_identifier_values.force_last (Void)
			last_detachable_et_integer_constant_values.force_last (Void)
			last_detachable_et_keyword_operator_values.force_last (Void)
			last_detachable_et_manifest_string_values.force_last (Void)
			last_detachable_et_real_constant_values.force_last (Void)
			last_detachable_et_result_values.force_last (Void)
			last_detachable_et_retry_instruction_values.force_last (Void)
			last_detachable_et_symbol_operator_values.force_last (Void)
			last_detachable_et_void_values.force_last (Void)
			last_detachable_et_semicolon_symbol_values.force_last (Void)
			last_detachable_et_bracket_symbol_values.force_last (Void)
			last_detachable_et_question_mark_symbol_values.force_last (Void)
		end

	synchronize_token (a_expected_tokens: DS_HASH_SET [INTEGER]; a_message: STRING; a_recoverable: BOOLEAN)
			-- Read tokens until one of the expected tokens is found.
			-- Use `a_message` to report a syntax error when then current
			-- `last_token` is not one of these expected tokens.
			-- `a_recoverable` measn that `is_error_recovering` will
			-- be reset to False if one the expected token is found.
		require
			a_expected_tokens_not_void: a_expected_tokens /= Void
			a_message_not_void: a_message /= Void
		local
			l_found: BOOLEAN
			l_end_keyword: detachable ET_KEYWORD
			l_last_position: detachable ET_POSITION
			l_last_end_expected: BOOLEAN
		do
			l_last_end_expected := a_expected_tokens.has (E_LAST_END)
			from
			until
				l_found
			loop
				l_found := a_expected_tokens.has (last_token)
				if l_found then
					is_error_recovering := is_error_recovering and not a_recoverable
				elseif l_last_end_expected and last_token = E_END then
					l_end_keyword := last_detachable_et_keyword_value
					l_last_position := last_position
					read_token
					if last_token <= 0 then
						unread_token
						set_last_keyword_token (E_END, l_end_keyword)
						l_found := True
						is_error_recovering := is_error_recovering and not a_recoverable
					else
						report_syntax_error (l_last_position, l_end_keyword, a_message)
					end
				else
					report_syntax_error (last_position, last_value, a_message)
					if last_token <= 0 then
							-- No more token to be read.
						l_found := True
					else
						read_token
					end
				end
			end
		ensure
			found_or_eof: (last_token <= 0) or else (a_expected_tokens.has (last_token) or (a_expected_tokens.has (E_LAST_END) and last_token = E_END))
		end

	is_identifier_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' an identifier token?
		do
			Result := a_token = E_IDENTIFIER or a_token = E_NONE or a_token = E_TUPLE
		end

	is_class_name_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' a class name token?
		do
			Result := a_token = E_IDENTIFIER or a_token = E_NONE
		end

	is_string_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' an string token?
		do
			inspect a_token
			when
				E_STRPLUS,
				E_STRMINUS,
				E_STRSTAR,
				E_STRSLASH,
				E_STRDIV,
				E_STRMOD,
				E_STRPOWER,
				E_STRLT,
				E_STRLE,
				E_STRGT,
				E_STRGE,
				E_STRAND,
				E_STROR,
				E_STRXOR,
				E_STRANDTHEN,
				E_STRORELSE,
				E_STRDOTDOT,
				E_STRBRACKET,
				E_STRPARENTHESIS,
				E_STRIMPLIES,
				E_STRFREEOP,
				E_STRNOT,
				E_STRING,
				E_STRANDSYMBOL,
				E_STRORSYMBOL,
				E_STRXORSYMBOL,
				E_STRANDTHENSYMBOL,
				E_STRORELSESYMBOL,
				E_STRIMPLIESSYMBOL,
				E_STRNOTSYMBOL
			then
				Result := True
			else
				Result := False
			end
		end

	is_expression_first_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' the first token of an expression?
		do
			inspect a_token
			when
				E_TRUE, E_FALSE,
				E_CHARACTER, E_INTEGER, E_REAL,
				Plus_code, Minus_code,
				E_NOT, E_NOT_SYMBOL, E_FREEOP, E_OLD,
				Left_parenthesis_code, E_LARRAY,
				Left_bracket_code, E_FEATURE,
				E_CURRENT, E_RESULT, E_VOID,
				E_ONCE_STRING, E_PRECURSOR, E_ATTACHED,
				E_CREATE, E_IF, E_INSPECT, E_ACROSS,
				E_FOR_ALL, E_THERE_EXISTS, E_AGENT, E_STRIP,
				Dollar_code, Left_brace_code, At_code,
				E_IDENTIFIER, E_NONE, E_TUPLE
			then
				Result := True
			else
				Result := is_string_token (a_token)
			end
		end

	is_choice_first_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' the first token of a choice?
		do
			inspect a_token
			when
				E_CHARACTER, E_INTEGER,
				Plus_code, Minus_code,
				E_IDENTIFIER, E_NONE, E_TUPLE,
				E_FEATURE,
				Left_brace_code
			then
				Result := True
			else
				Result := False
			end
		end

	is_type_first_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' the first token of a type?
		do
			inspect a_token
			when
				E_EXPANDED,
				E_ATTACHED,
				E_DETACHABLE,
				Exclamation_code,
				Question_mark_code,
				E_SEPARATE,
				E_LIKE,
				E_IDENTIFIER,
				E_NONE,
				E_TUPLE
			then
				Result := True
			else
				Result := False
			end
		end

	is_instruction_first_token (a_token: INTEGER): BOOLEAN
			-- Is `a_token' the first token of an instruction?
		do
			inspect a_token
			when
				E_CREATE,
				Exclamation_code,
				E_IF,
				E_INSPECT,
				E_FROM,
				E_OPEN_REPEAT,
				E_ACROSS,
				E_DEBUG,
				E_CHECK,
				E_RETRY,
				E_PRECURSOR,
				E_FEATURE,
				E_SEPARATE,
				Semicolon_code,
				Left_parenthesis_code,
				E_TRUE, E_FALSE,
				E_CHARACTER,
				E_CURRENT,
				E_RESULT,
				E_ONCE_STRING,
				At_code,
				Left_brace_code,
				E_IDENTIFIER, E_NONE, E_TUPLE
			then
				Result := True
			else
				Result := is_string_token (a_token)
			end
		end

	are_next_tokens_feature_header: BOOLEAN
			-- Are the next tokens the beginning of a feature declaration?
		local
			l_identifier: detachable ET_IDENTIFIER
			l_identifier_code: INTEGER
			l_name: detachable ET_IDENTIFIER
			l_name_code: INTEGER
			l_comma_symbol: detachable ET_SYMBOL
			l_left_parenthesis: detachable ET_SYMBOL
			l_old_last_labels_count1: INTEGER
			l_old_last_labels_count2: INTEGER
			nb: INTEGER
			l_done: BOOLEAN
			l_result_found: BOOLEAN
		do
			if last_token = E_FROZEN then
				Result := True
			elseif is_identifier_token (last_token) then
				l_name := last_detachable_et_identifier_value
				l_name_code := last_token
				read_token
				inspect last_token
				when
					E_ALIAS,
					E_REQUIRE,
					E_LOCAL,
					E_NOTE,
					E_INDEXING,
					E_OBSOLETE,
					E_DO,
					E_ONCE,
					E_EXTERNAL,
					E_DEFERRED,
					Colon_code
				then
					unread_token
					Result := True
					l_result_found := True
				when Comma_code, Left_parenthesis_code then
					l_result_found := False
				else
					unread_token
					Result := False
					l_result_found := True
				end
				l_old_last_labels_count1 := last_labels.count
				if not l_result_found and then last_token = Comma_code then
					from until l_done loop
						inspect last_token
						when Comma_code then
							l_comma_symbol := last_detachable_et_symbol_value
							read_token
							if last_token = E_FROZEN then
								unread_token
								unread_symbol_token (Comma_code, l_comma_symbol)
								Result := True
								l_result_found := True
								l_done := True
							elseif is_identifier_token (last_token) then
								l_identifier := last_detachable_et_identifier_value
								read_token
								last_labels.force (ast_factory.new_label_comma (l_identifier, l_comma_symbol))
							else
								unread_token
								unread_symbol_token (Comma_code, l_comma_symbol)
								Result := False
								l_result_found := True
								l_done := True
							end
						when Left_parenthesis_code then
							l_result_found := False
							l_done := True
						when
							E_ALIAS,
							E_REQUIRE,
							E_LOCAL,
							E_NOTE,
							E_INDEXING,
							E_OBSOLETE,
							E_DO,
							E_ONCE,
							E_EXTERNAL,
							E_DEFERRED,
							Colon_code
						then
							unread_token
							Result := True
							l_result_found := True
							l_done := True
						else
							unread_token
							Result := False
							l_result_found := True
							l_done := True
						end
					end
				end
				if not l_result_found and then last_token = Left_parenthesis_code then
					l_left_parenthesis := last_detachable_et_symbol_value
					read_token
					l_old_last_labels_count2 := last_labels.count
					l_done := False
					from until l_done loop
						if is_identifier_token (last_token) then
							l_identifier := last_detachable_et_identifier_value
							l_identifier_code := last_token
							read_token
							if last_token = Comma_code then
								l_comma_symbol := last_detachable_et_symbol_value
								read_token
								last_labels.force (ast_factory.new_label_comma (l_identifier, l_comma_symbol))
							else
								Result := (last_token = Colon_code)
								unread_token
								unread_identifier_token (l_identifier_code, l_identifier)
								l_done := True
							end
						else
							unread_token
							Result := False
							l_done := True
						end
					end
					nb := last_labels.count - l_old_last_labels_count2
					from until nb <= 0 loop
						if not attached last_labels.item as l_last_label then
							unread_symbol_token (Comma_code, tokens.comma_symbol)
							l_identifier := Void
						elseif attached {ET_IDENTIFIER_COMMA} l_last_label as l_identifier_comma then
							unread_symbol_token (Comma_code, l_identifier_comma.comma)
							l_identifier := l_identifier_comma.identifier
						else
							unread_symbol_token (Comma_code, tokens.comma_symbol)
							l_identifier := l_last_label.identifier
						end
						if l_identifier = Void then
							unread_identifier_token (E_IDENTIFIER, l_identifier)
						elseif l_identifier.same_class_name (tokens.none_class_name) then
							unread_identifier_token (E_NONE, l_identifier)
						elseif l_identifier.same_class_name (tokens.tuple_class_name) then
							unread_identifier_token (E_TUPLE, l_identifier)
						else
							unread_identifier_token (E_IDENTIFIER, l_identifier)
						end
						last_labels.remove
						nb := nb - 1
					end
					unread_symbol_token (Left_parenthesis_code, l_left_parenthesis)
				end
				nb := last_labels.count - l_old_last_labels_count1
				from until nb <= 0 loop
					if not attached last_labels.item as l_last_label then
						l_comma_symbol := tokens.comma_symbol
						l_identifier := Void
					elseif attached {ET_IDENTIFIER_COMMA} l_last_label as l_identifier_comma then
						l_comma_symbol := l_identifier_comma.comma
						l_identifier := l_identifier_comma.identifier
					else
						l_comma_symbol := tokens.comma_symbol
						l_identifier := l_last_label.identifier
					end
					if l_identifier = Void then
						unread_identifier_token (E_IDENTIFIER, l_identifier)
					elseif l_identifier.same_class_name (tokens.none_class_name) then
						unread_identifier_token (E_NONE, l_identifier)
					elseif l_identifier.same_class_name (tokens.tuple_class_name) then
						unread_identifier_token (E_TUPLE, l_identifier)
					else
						unread_identifier_token (E_IDENTIFIER, l_identifier)
					end
					unread_symbol_token (Comma_code, l_comma_symbol)
					last_labels.remove
					nb := nb - 1
				end
				set_last_identifier_token (l_identifier_code, l_identifier)
			end
		end

	last_value: detachable ET_AST_LEAF
			-- Value of last token read
		do
			inspect last_token
			when Semicolon_code then
				Result := last_detachable_et_semicolon_symbol_value
			when Left_bracket_code then
				Result := last_detachable_et_bracket_symbol_value
			when Right_bracket_code then
				Result := last_detachable_et_symbol_value
			when question_mark_code then
				Result := last_detachable_et_question_mark_symbol_value
			when Minus_code then
				Result := last_detachable_et_symbol_operator_value
			when Plus_code then
				Result := last_detachable_et_symbol_operator_value
			when Star_code then
				Result := last_detachable_et_symbol_operator_value
			when Slash_code then
				Result := last_detachable_et_symbol_operator_value
			when Caret_code then
				Result := last_detachable_et_symbol_operator_value
			when Equal_code then
				Result := last_detachable_et_symbol_value
			when Greater_than_code then
				Result := last_detachable_et_symbol_operator_value
			when Less_than_code then
				Result := last_detachable_et_symbol_operator_value
			when Dot_code then
				Result := last_detachable_et_symbol_value
			when Comma_code then
				Result := last_detachable_et_symbol_value
			when Colon_code then
				Result := last_detachable_et_symbol_value
			when Exclamation_code then
				Result := last_detachable_et_symbol_value
			when Left_parenthesis_code then
				Result := last_detachable_et_symbol_value
			when Right_parenthesis_code then
				Result := last_detachable_et_symbol_value
			when Left_brace_code then
				Result := last_detachable_et_symbol_value
			when Right_brace_code then
				Result := last_detachable_et_symbol_value
			when Dollar_code then
				Result := last_detachable_et_symbol_value
			when Tilde_code then
				Result := last_detachable_et_symbol_value
			when E_ALIAS then
				Result := last_detachable_et_keyword_value
			when E_ALL then
				Result := last_detachable_et_keyword_value
			when E_AS then
				Result := last_detachable_et_keyword_value
			when E_CHECK then
				Result := last_detachable_et_keyword_value
			when E_CLASS then
				Result := last_detachable_et_keyword_value
			when E_CREATE then
				Result := last_detachable_et_keyword_value
			when E_CREATION then
				Result := last_detachable_et_keyword_value
			when E_DEBUG then
				Result := last_detachable_et_keyword_value
			when E_DO then
				Result := last_detachable_et_keyword_value
			when E_ELSE then
				Result := last_detachable_et_keyword_value
			when E_ELSEIF then
				Result := last_detachable_et_keyword_value
			when E_END then
				Result := last_detachable_et_keyword_value
			when E_ENSURE then
				Result := last_detachable_et_keyword_value
			when E_EXPORT then
				Result := last_detachable_et_keyword_value
			when E_EXTERNAL then
				Result := last_detachable_et_keyword_value
			when E_FEATURE then
				Result := last_detachable_et_keyword_value
			when E_FROM then
				Result := last_detachable_et_keyword_value
			when E_FROZEN then
				Result := last_detachable_et_keyword_value
			when E_IF then
				Result := last_detachable_et_keyword_value
			when E_INDEXING then
				Result := last_detachable_et_keyword_value
			when E_INHERIT then
				Result := last_detachable_et_keyword_value
			when E_INSPECT then
				Result := last_detachable_et_keyword_value
			when E_IS then
				Result := last_detachable_et_keyword_value
			when E_LIKE then
				Result := last_detachable_et_keyword_value
			when E_LOCAL then
				Result := last_detachable_et_keyword_value
			when E_LOOP then
				Result := last_detachable_et_keyword_value
			when E_NOTE then
				Result := last_detachable_et_keyword_value
			when E_OBSOLETE then
				Result := last_detachable_et_keyword_value
			when E_ONCE then
				Result := last_detachable_et_keyword_value
			when E_ONCE_STRING then
				Result := last_detachable_et_keyword_value
			when E_REDEFINE then
				Result := last_detachable_et_keyword_value
			when E_RENAME then
				Result := last_detachable_et_keyword_value
			when E_REQUIRE then
				Result := last_detachable_et_keyword_value
			when E_RESCUE then
				Result := last_detachable_et_keyword_value
			when E_SELECT then
				Result := last_detachable_et_keyword_value
			when E_STRIP then
				Result := last_detachable_et_keyword_value
			when E_WHEN then
				Result := last_detachable_et_keyword_value
			when E_THEN then
				Result := last_detachable_et_keyword_value
			when E_UNDEFINE then
				Result := last_detachable_et_keyword_value
			when E_UNIQUE then
				Result := last_detachable_et_keyword_value
			when E_UNTIL then
				Result := last_detachable_et_keyword_value
			when E_VARIANT then
				Result := last_detachable_et_keyword_value
			when E_DEFERRED then
				Result := last_detachable_et_keyword_value
			when E_EXPANDED then
				Result := last_detachable_et_keyword_value
			when E_REFERENCE then
				Result := last_detachable_et_keyword_value
			when E_SEPARATE then
				Result := last_detachable_et_keyword_value
			when E_ATTACHED then
				Result := last_detachable_et_keyword_value
			when E_DETACHABLE then
				Result := last_detachable_et_keyword_value
			when E_ATTRIBUTE then
				Result := last_detachable_et_keyword_value
			when E_CONVERT then
				Result := last_detachable_et_keyword_value
			when E_ASSIGN then
				Result := last_detachable_et_keyword_value
			when E_ACROSS then
				Result := last_detachable_et_keyword_value
			when E_SOME then
				Result := last_detachable_et_keyword_value
			when E_AGENT then
				Result := last_detachable_et_agent_keyword_value
			when E_INVARIANT then
				Result := last_detachable_et_invariant_keyword_value
			when E_PRECURSOR then
				Result := last_detachable_et_precursor_keyword_value
			when E_ARROW then
				Result := last_detachable_et_symbol_value
			when E_DOTDOT then
				Result := last_detachable_et_symbol_value
			when E_LARRAY then
				Result := last_detachable_et_symbol_value
			when E_RARRAY then
				Result := last_detachable_et_symbol_value
			when E_ASSIGN_SYMBOL then
				Result := last_detachable_et_symbol_value
			when E_REVERSE then
				Result := last_detachable_et_symbol_value
			when E_UNKNOWN then
				Result := Void
			when E_FALSE then
				Result := last_detachable_et_boolean_constant_value
			when E_TRUE then
				Result := last_detachable_et_boolean_constant_value
			when E_BREAK then
				Result := Void
			when E_CHARACTER then
				Result := last_detachable_et_character_constant_value
			when E_CURRENT then
				Result := last_detachable_et_current_value
			when E_FREEOP then
				Result := last_detachable_et_free_operator_value
			when E_IDENTIFIER then
				Result := last_detachable_et_identifier_value
			when E_TUPLE then
				Result := last_detachable_et_identifier_value
			when E_NONE then
				Result := last_detachable_et_identifier_value
			when E_INTEGER then
				Result := last_detachable_et_integer_constant_value
			when E_AND then
				Result := last_detachable_et_keyword_operator_value
			when E_OR then
				Result := last_detachable_et_keyword_operator_value
			when E_XOR then
				Result := last_detachable_et_keyword_operator_value
			when E_NOT then
				Result := last_detachable_et_keyword_operator_value
			when E_IMPLIES then
				Result := last_detachable_et_keyword_operator_value
			when E_STRPLUS then
				Result := last_detachable_et_manifest_string_value
			when E_STRMINUS then
				Result := last_detachable_et_manifest_string_value
			when E_STRSTAR then
				Result := last_detachable_et_manifest_string_value
			when E_STRSLASH then
				Result := last_detachable_et_manifest_string_value
			when E_STRDIV then
				Result := last_detachable_et_manifest_string_value
			when E_STRMOD then
				Result := last_detachable_et_manifest_string_value
			when E_STRPOWER then
				Result := last_detachable_et_manifest_string_value
			when E_STRLT then
				Result := last_detachable_et_manifest_string_value
			when E_STRLE then
				Result := last_detachable_et_manifest_string_value
			when E_STRGT then
				Result := last_detachable_et_manifest_string_value
			when E_STRGE then
				Result := last_detachable_et_manifest_string_value
			when E_STRAND then
				Result := last_detachable_et_manifest_string_value
			when E_STROR then
				Result := last_detachable_et_manifest_string_value
			when E_STRXOR then
				Result := last_detachable_et_manifest_string_value
			when E_STRANDTHEN then
				Result := last_detachable_et_manifest_string_value
			when E_STRORELSE then
				Result := last_detachable_et_manifest_string_value
			when E_STRDOTDOT then
				Result := last_detachable_et_manifest_string_value
			when E_STRBRACKET then
				Result := last_detachable_et_manifest_string_value
			when E_STRPARENTHESIS then
				Result := last_detachable_et_manifest_string_value
			when E_STRIMPLIES then
				Result := last_detachable_et_manifest_string_value
			when E_STRFREEOP then
				Result := last_detachable_et_manifest_string_value
			when E_STRNOT then
				Result := last_detachable_et_manifest_string_value
			when E_STRING then
				Result := last_detachable_et_manifest_string_value
			when E_STRANDSYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_STRORSYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_STRXORSYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_STRANDTHENSYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_STRORELSESYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_STRIMPLIESSYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_STRNOTSYMBOL then
				Result := last_detachable_et_manifest_string_value
			when E_REAL then
				Result := last_detachable_et_real_constant_value
			when E_RESULT then
				Result := last_detachable_et_result_value
			when E_RETRY then
				Result := last_detachable_et_retry_instruction_value
			when E_DIV then
				Result := last_detachable_et_symbol_operator_value
			when E_GE then
				Result := last_detachable_et_symbol_operator_value
			when E_LE then
				Result := last_detachable_et_symbol_operator_value
			when E_MOD then
				Result := last_detachable_et_symbol_operator_value
			when E_VOID then
				Result := last_detachable_et_void_value
			when E_CHARERR then
				Result := Void
			when E_STRERR then
				Result := Void
			when E_OLD then
				Result := last_detachable_et_keyword_value
			when E_FOR_ALL then
				Result := last_detachable_et_symbol_value
			when E_THERE_EXISTS then
				Result := last_detachable_et_symbol_value
			when E_BAR then
				Result := last_detachable_et_symbol_value
			when E_OPEN_REPEAT then
				Result := last_detachable_et_symbol_value
			when E_CLOSE_REPEAT then
				Result := last_detachable_et_symbol_value
			when E_IMPLIES_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_OR_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_OR_ELSE_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_XOR_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_AND_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_AND_THEN_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_NOT_SYMBOL then
				Result := last_detachable_et_symbol_operator_value
			when E_NE then
				Result := last_detachable_et_symbol_operator_value
			when E_NOT_TILDE then
				Result := last_detachable_et_symbol_operator_value
			when E_ITERATION_CURSOR_SYMBOL then
				Result := last_detachable_et_symbol_value
			else
				Result := Void
			end
		end

	last_position: ET_POSITION
			-- Position of last token read
		do
			if attached last_value as l_last_value then
				Result := l_last_value.position
			else
				inspect last_token
				when E_UNKNOWN then
					Result := last_detachable_et_position_value
				when E_CHARERR then
					Result := last_detachable_et_position_value
				when E_STRERR then
					Result := last_detachable_et_position_value
				else
					Result := Void
				end
			end
			if Result = Void or else Result.is_null then
				Result := current_position
			end
		end

	last_tokens: DS_ARRAYED_LIST [INTEGER]
	last_detachable_any_values: DS_ARRAYED_LIST [detachable ANY]
	last_detachable_et_keyword_values: DS_ARRAYED_LIST [detachable ET_KEYWORD]
	last_detachable_et_agent_keyword_values: DS_ARRAYED_LIST [detachable ET_AGENT_KEYWORD]
	last_detachable_et_invariant_keyword_values: DS_ARRAYED_LIST [detachable ET_INVARIANT_KEYWORD]
	last_detachable_et_precursor_keyword_values: DS_ARRAYED_LIST [detachable ET_PRECURSOR_KEYWORD]
	last_detachable_et_symbol_values: DS_ARRAYED_LIST [detachable ET_SYMBOL]
	last_detachable_et_position_values: DS_ARRAYED_LIST [detachable ET_POSITION]
	last_detachable_et_boolean_constant_values: DS_ARRAYED_LIST [detachable ET_BOOLEAN_CONSTANT]
	last_detachable_et_break_values: DS_ARRAYED_LIST [detachable ET_BREAK]
	last_detachable_et_character_constant_values: DS_ARRAYED_LIST [detachable ET_CHARACTER_CONSTANT]
	last_detachable_et_current_values: DS_ARRAYED_LIST [detachable ET_CURRENT]
	last_detachable_et_free_operator_values: DS_ARRAYED_LIST [detachable ET_FREE_OPERATOR]
	last_detachable_et_identifier_values: DS_ARRAYED_LIST [detachable ET_IDENTIFIER]
	last_detachable_et_integer_constant_values: DS_ARRAYED_LIST [detachable ET_INTEGER_CONSTANT]
	last_detachable_et_keyword_operator_values: DS_ARRAYED_LIST [detachable ET_KEYWORD_OPERATOR]
	last_detachable_et_manifest_string_values: DS_ARRAYED_LIST [detachable ET_MANIFEST_STRING]
	last_detachable_et_real_constant_values: DS_ARRAYED_LIST [detachable ET_REAL_CONSTANT]
	last_detachable_et_result_values: DS_ARRAYED_LIST [detachable ET_RESULT]
	last_detachable_et_retry_instruction_values: DS_ARRAYED_LIST [detachable ET_RETRY_INSTRUCTION]
	last_detachable_et_symbol_operator_values: DS_ARRAYED_LIST [detachable ET_SYMBOL_OPERATOR]
	last_detachable_et_void_values: DS_ARRAYED_LIST [detachable ET_VOID]
	last_detachable_et_semicolon_symbol_values: DS_ARRAYED_LIST [detachable ET_SEMICOLON_SYMBOL]
	last_detachable_et_bracket_symbol_values: DS_ARRAYED_LIST [detachable ET_BRACKET_SYMBOL]
	last_detachable_et_question_mark_symbol_values: DS_ARRAYED_LIST [detachable ET_QUESTION_MARK_SYMBOL]

feature {NONE} -- Constants

	across_keyword_expected: STRING = "'across' keyword expected"
	agent_keyword_expected: STRING = "'agent' keyword expected"
	alias_name_expected: STRING = "alias name expected"
	alias_name_invalid: STRING = "invalid alias name"
	all_or_some_keyword_expected: STRING = "'all' or 'some' keyword expected"
	as_keyword_expected: STRING = "'as' keyword expected"
	attached_keyword_expected: STRING = "'attached' keyword expected"
	bar_symbol_expected: STRING = "'¦' symbol expected"
	check_keyword_expected: STRING = "'check' keyword expected"
	class_keyword_expected: STRING = "'class' keyword expected"
	class_keyword_only_allowed_in_postconditions: STRING = "'class' keyword only allowed in postconditions"
	class_name_expected: STRING = "class name expected"
	class_name_tuple_like_keyword_expected: STRING = "class name, 'TUPLE' or 'like' keyword expected"
	close_repeat_symbol_expected: STRING = "close-repeat symbol expected"
	colon_symbol_expected: STRING = "':' symbol expected"
	colon_or_left_parenthesis_symbol_expected: STRING = "':' or '(' symbol expected"
	comma_symbol_expected: STRING = "',' symbol expected"
	create_keyword_expected: STRING = "'create' keyword expected"
	cursor_name_expected: STRING = "cursor name expected"
	debug_keyword_expected: STRING = "'debug' keyword expected"
	do_keyword_expected: STRING = "'do' keyword expected"
	do_or_once_keyword_expected: STRING = "'do' or 'once' keyword expected"
	do_once_or_external_keyword_expected: STRING = "'do', 'once' or 'external' keyword expected"
	dollar_symbol_expected: STRING = "'$' symbol expected"
	dot_symbol_expected: STRING = "'.' symbol expected"
	dot_or_left_bracket_symbol_expected: STRING = "'.' or '[' symbol expected"
	dot_left_bracket_or_assign_symbol_expected: STRING = "'.', '[' or ':=' symbol expected"
	else_keyword_expected: STRING = "'else' keyword expected"
	end_keyword_expected: STRING = "'end' keyword expected"
	end_keyword_indentation_mismatch: STRING = "'end' keyword indentation mismatch"
	end_of_file_expected: STRING = "end of file expected"
	exclamation_symbol_expected: STRING = "'!' symbol expected"
	expanded_keyword_only_valid_for_class_types: STRING = "'expanded' keyword only valid for class types"
	expression_expected: STRING = "expression expected"
	feature_keyword_expected: STRING = "'feature' keyword expected"
	feature_name_expected: STRING = "feature name expected"
	feature_name_or_agent_target_expected: STRING = "feature name or agent target expected"
	feature_name_current_or_result_keyword_expected: STRING = "feature name, 'Current' or 'Result' expected"
	feature_name_type_or_current_keyword_expected: STRING = "feature name, '{Type}' or 'Current' expected"
	for_all_symbol_expected: STRING = "for-all symbol expected"
	formal_parameter_expected: STRING = "formal parameter expected"
	from_keyword_expected: STRING = "'from' keyword expected"
	greater_than_symbol_expected: STRING = "'>' symbol expected"
	if_keyword_expected: STRING = "'if' keyword expected"
	inherit_keyword_expected: STRING = "'inherit' keyword expected"
	inline_separate_argument_name_expected: STRING = "inline separate argument name expected"
	inspect_keyword_expected: STRING = "'inspect' keyword expected"
	instruction_expected: STRING = "instruction expected"
	integer_constant_expected: STRING = "integer constant expected"
	integer_or_character_constant_expected: STRING = "integer or character constant expected"
	integer_or_real_constant_expected: STRING = "integer or real constant expected"
	left_array_symbol_expected: STRING = "'<<' symbol expected"
	left_brace_symbol_expected: STRING = "'{' symbol expected"
	left_bracket_symbol_expected: STRING = "'[' symbol expected"
	left_parenthesis_symbol_expected: STRING = "'(' symbol expected"
	like_keyword_expected: STRING = "'like' keyword expected"
	loop_keyword_expected: STRING = "'loop' keyword expected"
	manifest_constant_expected: STRING = "manifest constant expected"
	manifest_string_expected: STRING = "manifest string expected"
	none_expected: STRING = "'NONE' expected"
	note_keyword_expected: STRING = "'note' keyword expected"
	note_tag_expected: STRING = "note tag expected"
	note_term_expected: STRING = "note term expected"
	object_test_local_name_expected: STRING = "object-test local name expected"
	obsolete_message_expected: STRING = "obsolete message expected"
	once_keyword_expected: STRING = "'once' keyword expected"
	open_repeat_symbol_expected: STRING = "open-repeat symbol expected"
	precursor_keyword_expected: STRING = "'precursor' keyword expected"
	question_mark_symbol_expected: STRING = "'?' symbol expected"
	right_array_symbol_expected: STRING = "'>>' symbol expected"
	right_brace_symbol_expected: STRING = "'}' symbol expected"
	right_bracket_symbol_expected: STRING = "']' symbol expected"
	right_parenthesis_symbol_expected: STRING = "')' symbol expected"
	separate_keyword_expected: STRING = "'separate' keyword expected"
	strip_keyword_expected: STRING = "'strip' keyword expected"
	then_keyword_expected: STRING = "'then' keyword expected"
	there_exists_symbol_expected: STRING = "there-exists symbol expected"
	tuple_expected: STRING = "'TUPLE' expected"
	tuple_label_expected: STRING = "Tuple label expected"
	type_expected: STRING = "type expected"
	until_keyword_expected: STRING = "'until' keyword expected"
	when_keyword_expected: STRING = "'when' keyword expected"
			-- Error messages

	frozen_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when an
			-- 'frozen' class mark is expected
		once
			create Result.make (6)
			Result.put (E_FROZEN)
			Result.put (E_DEFERRED)
			Result.put (E_EXPANDED)
			Result.put (E_SEPARATE)
			Result.put (E_EXTERNAL)
			Result.put (E_CLASS)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	deferred_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when an
			-- 'deferred', 'expanded' or 'separate'
			-- class mark is expected
		once
			create Result.make (5)
			Result.put (E_DEFERRED)
			Result.put (E_EXPANDED)
			Result.put (E_SEPARATE)
			Result.put (E_EXTERNAL)
			Result.put (E_CLASS)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	external_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when an
			-- 'external' class mark is expected
		once
			create Result.make (2)
			Result.put (E_EXTERNAL)
			Result.put (E_CLASS)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	class_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- a 'class' keyword is expected
		once
			create Result.make (1)
			Result.put (E_CLASS)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	inherit_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- an inherit clause is expected
		once
			create Result.make (9)
			Result.put (E_INHERIT)
			Result.put (E_CREATE)
			Result.put (E_CREATION)
			Result.put (E_CONVERT)
			Result.put (E_FEATURE)
			Result.put (E_INVARIANT)
			Result.put (E_NOTE)
			Result.put (E_INDEXING)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	create_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- a create clause is expected
		once
			create Result.make (8)
			Result.put (E_CREATE)
			Result.put (E_CREATION)
			Result.put (E_CONVERT)
			Result.put (E_FEATURE)
			Result.put (E_INVARIANT)
			Result.put (E_NOTE)
			Result.put (E_INDEXING)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	convert_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- a convert clause is expected
		once
			create Result.make (6)
			Result.put (E_CONVERT)
			Result.put (E_FEATURE)
			Result.put (E_INVARIANT)
			Result.put (E_NOTE)
			Result.put (E_INDEXING)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	feature_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- a feature clause is expected
		once
			create Result.make (5)
			Result.put (E_FEATURE)
			Result.put (E_INVARIANT)
			Result.put (E_NOTE)
			Result.put (E_INDEXING)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	feature_name_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when the name
			-- of the next feature is expected
		once
			create Result.make (9)
			Result.put (E_FROZEN)
			Result.put (E_IDENTIFIER)
			Result.put (E_NONE)
			Result.put (E_TUPLE)
			Result.put (E_FEATURE)
			Result.put (E_INVARIANT)
			Result.put (E_NOTE)
			Result.put (E_INDEXING)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	feature_name_expected_tokens_recovering: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when the name
			-- of the next feature is expected
			-- while recovering from a syntax error
		once
			create Result.make (6)
			Result.put (E_FROZEN)
			Result.put (E_IDENTIFIER)
			Result.put (E_NONE)
			Result.put (E_TUPLE)
			Result.put (E_FEATURE)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	invariant_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- an invariant clause is expected
		once
			create Result.make (4)
			Result.put (E_INVARIANT)
			Result.put (E_NOTE)
			Result.put (E_INDEXING)
			Result.put (E_LAST_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	end_expected_tokens: DS_HASH_SET [INTEGER]
			-- Synchronization tokens when
			-- an 'end' keyword is expected
		once
			create Result.make (1)
			Result.put (E_END)
		ensure
			expected_tokens_not_void: Result /= Void
		end

	Initial_last_note_items_capacity: INTEGER = 10
			-- Initial capacity for `last_note_items'

	Initial_last_note_term_items_capacity: INTEGER = 5
			-- Initial capacity for `last_note_term_items'

	Initial_last_actual_parameter_items_capacity: INTEGER = 10
			-- Initial capacity for `last_actual_parameter_items'

	Initial_last_formal_parameter_items_capacity: INTEGER = 10
			-- Initial capacity for `last_formal_parameter_items'

	Initial_last_constraint_actual_parameter_items_capacity: INTEGER = 10
			-- Initial capacity for `last_constraint_actual_parameter_items'

	Initial_last_type_constraint_items_capacity: INTEGER = 5
			-- Initial capacity for `last_type_constraint_items'

	Initial_last_labels_capacity: INTEGER = 10
			-- Initial capacity for `last_labels'

	Initial_last_feature_name_items_capacity: INTEGER = 100
			-- Initial capacity for `last_feature_name_items'

	Initial_last_alias_name_items_capacity: INTEGER = 5
			-- Initial capacity for `last_alias_name_items'

	Initial_last_extended_feature_name_items_capacity: INTEGER = 100
			-- Initial capacity for `last_extended_feature_name_items'

	Initial_last_parent_clause_items_capacity: INTEGER = 20
			-- Initial capacity for `last_parent_clause_items'

	Initial_last_parent_items_capacity: INTEGER = 20
			-- Initial capacity for `last_parent_items'

	Initial_last_rename_items_capacity: INTEGER = 100
			-- Initial capacity for `last_rename_items'

	Initial_last_client_items_capacity: INTEGER = 20
			-- Initial capacity for `last_client_items'

	Initial_last_export_items_capacity: INTEGER = 10
			-- Initial capacity for `last_export_items'

	Initial_last_creator_items_capacity: INTEGER = 10
			-- Initial capacity for `last_creator_items'

	Initial_last_type_items_capacity: INTEGER = 10
			-- Initial capacity for `last_type_items'

	Initial_last_convert_feature_items_capacity: INTEGER = 20
			-- Initial capacity for `last_convert_feature_items'

	Initial_last_feature_clause_items_capacity: INTEGER = 100
			-- Initial capacity for `last_feature_clause_items'

	Initial_last_formal_argument_items_capacity: INTEGER = 20
			-- Initial capacity for `last_formal_argument_items'

	Initial_last_local_variable_items_capacity: INTEGER = 100
			-- Initial capacity for `last_local_variable_items'

	Initial_last_expression_items_capacity: INTEGER = 500
			-- Initial capacity for `last_expression_items'

	Initial_last_agent_actual_argument_items_capacity: INTEGER = 20
			-- Initial capacity for `last_agent_actual_argument_items'

	Initial_last_elseif_expression_items_capacity: INTEGER = 20
			-- Initial capacity for `last_elseif_expression_items'

	Initial_last_when_expression_items_capacity: INTEGER = 20
			-- Initial capacity for `last_when_expression_items'

	Initial_last_choice_items_capacity: INTEGER = 20
			-- Initial capacity for `last_choice_items'

	Initial_last_manifest_string_items_capacity: INTEGER = 20
			-- Initial capacity for `last_manifest_string_items'

	Initial_last_tokens_capacity: INTEGER = 50
			-- Initial capacity for `last_tokens'

	Initial_last_instruction_items_capacity: INTEGER = 500
			-- Initial capacity for `last_instruction_items'

	Initial_last_elseif_part_items_capacity: INTEGER = 50
			-- Initial capacity for `last_elseif_part_items'

	Initial_last_when_part_items_capacity: INTEGER = 100
			-- Initial capacity for `last_when_part_items'

	Initial_last_inline_separate_argument_items_capacity: INTEGER = 50
			-- Initial capacity for `last_inline_separate_argument_items'

invariant

	last_note_items_not_void: last_note_items /= Void
	last_note_term_items_not_void: last_note_term_items /= Void
	last_actual_parameter_items_not_void: last_actual_parameter_items /= Void
	last_formal_parameter_items_not_void: last_formal_parameter_items /= Void
	last_constraint_actual_parameter_items_not_void: last_constraint_actual_parameter_items /= Void
	last_type_constraint_items_not_void: last_type_constraint_items /= Void
	last_labels_not_void: last_labels /= Void
	last_feature_name_items_not_void: last_feature_name_items /= Void
	last_alias_name_items_not_void: last_alias_name_items /= Void
	last_extended_feature_name_items_not_void: last_extended_feature_name_items /= Void
	last_extended_feature_name_frozen_items_not_void: last_extended_feature_name_frozen_items /= Void
	last_parent_clause_items_not_void: last_parent_clause_items /= Void
	last_parent_items_not_void: last_parent_items /= Void
	last_rename_items_not_void: last_rename_items /= Void
	last_client_items_not_void: last_client_items /= Void
	last_export_items_not_void: last_export_items /= Void
	last_creator_items_not_void: last_creator_items /= Void
	last_type_items_not_void: last_type_items /= Void
	last_convert_feature_items_not_void: last_convert_feature_items /= Void
	last_feature_clause_items_not_void: last_feature_clause_items /= Void
	last_formal_argument_items_not_void: last_formal_argument_items /= Void
	last_local_variable_items_not_void: last_local_variable_items /= Void
	last_expression_items_not_void: last_expression_items /= Void
	last_agent_actual_argument_items_not_void: last_agent_actual_argument_items /= Void
	last_elseif_expression_items_not_void: last_elseif_expression_items /= Void
	last_when_expression_items_not_void: last_when_expression_items /= Void
	last_choice_items_not_void: last_choice_items /= Void
	last_manifest_string_items_not_void: last_manifest_string_items /= Void
	last_instruction_items_not_void: last_instruction_items /= Void
	last_elseif_part_items_not_void: last_elseif_part_items /= Void
	last_when_part_items_not_void: last_when_part_items /= Void
	last_inline_separate_argument_items_not_void: last_inline_separate_argument_items /= Void
	last_tokens_not_void: last_tokens /= Void
	last_detachable_any_values_not_void: last_detachable_any_values /= Void
	last_detachable_any_operator_values_count: last_detachable_any_values.count = last_tokens.count
	last_detachable_et_keyword_values_not_void: last_detachable_et_keyword_values /= Void
	last_detachable_et_keyword_values_count: last_detachable_et_keyword_values.count = last_tokens.count
	last_detachable_et_agent_keyword_values_not_void: last_detachable_et_agent_keyword_values /= Void
	last_detachable_et_agent_keyword_values_cound: last_detachable_et_agent_keyword_values.count = last_tokens.count
	last_detachable_et_invariant_keyword_values_not_void: last_detachable_et_invariant_keyword_values /= Void
	last_detachable_et_invariant_keyword_values_count: last_detachable_et_invariant_keyword_values.count = last_tokens.count
	last_detachable_et_precursor_keyword_values_not_void: last_detachable_et_precursor_keyword_values /= Void
	last_detachable_et_precursor_keyword_values_count: last_detachable_et_precursor_keyword_values.count = last_tokens.count
	last_detachable_et_symbol_values_not_void: last_detachable_et_symbol_values /= Void
	last_detachable_et_symbol_values_count: last_detachable_et_symbol_values.count = last_tokens.count
	last_detachable_et_position_values_not_void: last_detachable_et_position_values /= Void
	last_detachable_et_position_values_count: last_detachable_et_position_values.count = last_tokens.count
	last_detachable_et_boolean_constant_values_not_void: last_detachable_et_boolean_constant_values /= Void
	last_detachable_et_boolean_constant_values_count: last_detachable_et_boolean_constant_values.count = last_tokens.count
	last_detachable_et_break_values_not_void: last_detachable_et_break_values /= Void
	last_detachable_et_break_values_count: last_detachable_et_break_values.count = last_tokens.count
	last_detachable_et_character_constant_values_not_void: last_detachable_et_character_constant_values /= Void
	last_detachable_et_character_constant_values_count: last_detachable_et_character_constant_values.count = last_tokens.count
	last_detachable_et_current_values_not_void: last_detachable_et_current_values /= Void
	last_detachable_et_current_values_count: last_detachable_et_current_values.count = last_tokens.count
	last_detachable_et_free_operator_values_not_void: last_detachable_et_free_operator_values /= Void
	last_detachable_et_free_operator_values_count: last_detachable_et_free_operator_values.count = last_tokens.count
	last_detachable_et_identifier_values_not_void: last_detachable_et_identifier_values /= Void
	last_detachable_et_identifier_values_count: last_detachable_et_identifier_values.count = last_tokens.count
	last_detachable_et_integer_constant_values_not_void: last_detachable_et_integer_constant_values /= Void
	last_detachable_et_integer_constant_values_count: last_detachable_et_integer_constant_values.count = last_tokens.count
	last_detachable_et_keyword_operator_values_not_void: last_detachable_et_keyword_operator_values /= Void
	last_detachable_et_keyword_operator_values_count: last_detachable_et_keyword_operator_values.count = last_tokens.count
	last_detachable_et_manifest_string_values_not_void: last_detachable_et_manifest_string_values /= Void
	last_detachable_et_manifest_string_values_count: last_detachable_et_manifest_string_values.count = last_tokens.count
	last_detachable_et_real_constant_values_not_void: last_detachable_et_real_constant_values /= Void
	last_detachable_et_real_constant_values_count: last_detachable_et_real_constant_values.count = last_tokens.count
	last_detachable_et_result_values_not_void: last_detachable_et_result_values /= Void
	last_detachable_et_result_values_count: last_detachable_et_result_values.count = last_tokens.count
	last_detachable_et_retry_instruction_values_not_void: last_detachable_et_retry_instruction_values /= Void
	last_detachable_et_retry_instruction_values_count: last_detachable_et_retry_instruction_values.count = last_tokens.count
	last_detachable_et_symbol_operator_values_not_void: last_detachable_et_symbol_operator_values /= Void
	last_detachable_et_symbol_operator_values_count: last_detachable_et_symbol_operator_values.count = last_tokens.count
	last_detachable_et_void_values_not_void: last_detachable_et_void_values /= Void
	last_detachable_et_void_values_count: last_detachable_et_void_values.count = last_tokens.count
	last_detachable_et_semicolon_symbol_values_not_void: last_detachable_et_semicolon_symbol_values /= Void
	last_detachable_et_semicolon_symbol_values_count: last_detachable_et_semicolon_symbol_values.count = last_tokens.count
	last_detachable_et_bracket_symbol_values_not_void: last_detachable_et_bracket_symbol_values /= Void
	last_detachable_et_bracket_symbol_values_count: last_detachable_et_bracket_symbol_values.count = last_tokens.count
	last_detachable_et_question_mark_symbol_values_not_void: last_detachable_et_question_mark_symbol_values /= Void
	last_detachable_et_question_mark_symbol_values_count: last_detachable_et_question_mark_symbol_values.count = last_tokens.count

end
