note

	description:

		"Scanner skeletons for Eiffel type parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class ET_TYPE_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton
		redefine
			text,
			utf8_text,
			text_substring,
			utf8_text_substring,
			reset,
			fatal_error,
			report_invalid_unicode_character_error
		end

	ET_TYPE_TOKENS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
	KL_SHARED_STRING_EQUALITY_TESTER

feature {NONE} -- Initialization

	make (a_filename: STRING; a_system_processor: like system_processor)
			-- Create a new Eiffel scanner.
		require
			a_filename_not_void: a_filename /= Void
			a_filename_not_empty: not a_filename.is_empty
			a_system_processor_not_void: a_system_processor /= Void
		do
			system_processor := a_system_processor
			make_with_buffer (Empty_buffer)
			last_text_count := 1
			last_literal_start := 1
			filename := a_filename
			current_system := tokens.unknown_system
		ensure
			filename_set: filename = a_filename
			system_processor_set: system_processor = a_system_processor
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			last_literal_start := 1
			last_literal_end := 0
			precursor
		end

feature -- Access

	filename: STRING
			-- Name of file being parsed

	current_universe: ET_UNIVERSE
			-- Universe to which the type name being parsed belongs
		do
			Result := current_system
		ensure
			current_universe_not_void: Result /= Void
		end

	current_system: ET_SYSTEM
			-- Surrounding Eiffel system

	current_position: ET_POSITION
			-- Current position
			-- (Create a new object at each call.)
		do
			create {ET_FILE_POSITION} Result.make (filename, line, column)
		ensure
			current_position_not_void: Result /= Void
		end

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory
		do
			Result := system_processor.ast_factory
		ensure
			ast_factory_not_void: Result /= Void
		end

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

feature -- Status report

	use_attached_keyword: BOOLEAN
			-- Should 'attached' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := system_processor.use_attached_keyword
		end

	use_attribute_keyword: BOOLEAN
			-- Should 'attribute' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := system_processor.use_attribute_keyword
		end

	use_detachable_keyword: BOOLEAN
			-- Should 'detachable' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := system_processor.use_detachable_keyword
		end

	use_note_keyword: BOOLEAN
			-- Should 'note' be considered as
			-- a keyword (otherwise identifier)?
		do
		end

	use_reference_keyword: BOOLEAN
			-- Should 'reference' be considered as
			-- a keyword (otherwise identifier)?
		do
			Result := system_processor.use_reference_keyword
		end

feature -- Error handling

	error_handler: ET_ERROR_HANDLER
			-- Error handler
		do
			Result := system_processor.error_handler
		ensure
			error_handler_not_void: Result /= Void
		end

	fatal_error (a_message: STRING_8)
			-- A fatal error occurred.
			-- Print error message.
		do
			report_syntax_error (current_position)
		end

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read from the input
			-- buffer and caused the scanner to fail.
		do
			report_syntax_error (current_position)
		end

	report_syntax_error (a_position: ET_POSITION)
			-- Report a syntax error at position `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			set_syntax_error
			error_handler.report_syntax_error (filename, a_position)
		end

	set_syntax_error
			-- Set syntax error flag in class being parsed, if already known.
		do
		end

feature -- Tokens

	last_unicode_literal: STRING_32
			-- Last literal scanned (Unicode version)
		do
			Result := unicode_text_substring (last_literal_start, last_literal_end)
		ensure
			last_unicode_literal_not_void: Result /= Void
		end

	last_identifier: ET_IDENTIFIER
			-- Last identifier scanned
		require
			valid_literal: {ET_IDENTIFIER}.valid_name (last_unicode_literal)
		local
			a_string: STRING_8
			a_name: STRING_8
			a_code: INTEGER
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_substring_to_string (last_literal_start, last_literal_end, a_string)
			strings.search (a_string)
			if strings.found then
				a_name := strings.found_key
				a_code := strings.found_item
				if a_code >= 0 then
					create Result.make_with_hash_code (a_name, a_code)
				else
					create Result.make (a_name)
					strings.replace_found_item (Result.hash_code)
				end
			else
				create a_name.make (a_string.count)
				a_name.append_string (a_string)
				create Result.make (a_name)
				strings.force_new (Result.hash_code, a_name)
			end
		ensure
			last_identifier_not_void: Result /= Void
		end

	text: STRING
			-- Text of last token read
			-- (Share strings when already scanned.)
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_to_string (a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_key
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (-1, Result)
			end
		end

	utf8_text: STRING_8
			-- UTF-8 representation of last token read
			-- (Share strings when already scanned.)
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_utf8_text_to_string (a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_key
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (-1, Result)
			end
		end

	text_substring (s, e: INTEGER): STRING
			-- Substring of last token read
			-- (Share strings when already scanned.)
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_text_substring_to_string (s, e, a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_key
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (-1, Result)
			end
		end

	utf8_text_substring (s, e: INTEGER): STRING_8
			-- UTF-8 representation of substring of last token read
		local
			a_string: STRING
		do
			a_string := string_buffer
			STRING_.wipe_out (a_string)
			append_utf8_text_substring_to_string (s, e, a_string)
			strings.search (a_string)
			if strings.found then
				Result := strings.found_key
			else
				create Result.make (a_string.count)
				Result.append_string (a_string)
				strings.force_new (-1, Result)
			end
		end

feature {NONE} -- Positions

	last_literal_start: INTEGER
			-- Start position of the last literal read

	last_literal_end: INTEGER
			-- End position of the last literal read

	last_text_count: INTEGER
			-- Number of characters in the last text read

feature {NONE} -- String handler

	strings: DS_HASH_TABLE [INTEGER, STRING_8]
			-- Strings known by the current scanner, and the associated
			-- hash codes when they are used as identifier
		once
			create Result.make_map (200)
			Result.set_key_equality_tester (string_equality_tester)
				-- Needed for compatibility with 5.6.0610 (to be removed later):
			Result.force_new (-1, tokens.capitalized_boolean_ref_name)
			Result.force_new (-1, tokens.capitalized_character_ref_name)
			Result.force_new (-1, tokens.capitalized_character_8_ref_name)
			Result.force_new (-1, tokens.capitalized_character_32_ref_name)
			Result.force_new (-1, tokens.capitalized_double_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_8_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_16_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_32_ref_name)
			Result.force_new (-1, tokens.capitalized_integer_64_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_8_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_16_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_32_ref_name)
			Result.force_new (-1, tokens.capitalized_natural_64_ref_name)
			Result.force_new (-1, tokens.capitalized_pointer_ref_name)
			Result.force_new (-1, tokens.capitalized_real_ref_name)
			Result.force_new (-1, tokens.capitalized_real_32_ref_name)
			Result.force_new (-1, tokens.capitalized_real_64_ref_name)
			Result.force_new (-1, tokens.capitalized_wide_character_ref_name)
				-- Class names.
			Result.force_new (-1, tokens.capitalized_any_name)
			Result.force_new (-1, tokens.capitalized_arguments_name)
			Result.force_new (-1, tokens.capitalized_arguments_32_name)
			Result.force_new (-1, tokens.capitalized_array_name)
			Result.force_new (-1, tokens.capitalized_boolean_name)
			Result.force_new (-1, tokens.capitalized_character_name)
			Result.force_new (-1, tokens.capitalized_character_8_name)
			Result.force_new (-1, tokens.capitalized_character_32_name)
			Result.force_new (-1, tokens.capitalized_com_failure_name)
			Result.force_new (-1, tokens.capitalized_disposable_name)
			Result.force_new (-1, tokens.capitalized_double_name)
			Result.force_new (-1, tokens.capitalized_exception_name)
			Result.force_new (-1, tokens.capitalized_exception_manager_name)
			Result.force_new (-1, tokens.capitalized_exception_manager_factory_name)
			Result.force_new (-1, tokens.capitalized_function_name)
			Result.force_new (-1, tokens.capitalized_identified_routines_name)
			Result.force_new (-1, tokens.capitalized_immutable_string_8_name)
			Result.force_new (-1, tokens.capitalized_immutable_string_32_name)
			Result.force_new (-1, tokens.capitalized_integer_name)
			Result.force_new (-1, tokens.capitalized_integer_8_name)
			Result.force_new (-1, tokens.capitalized_integer_16_name)
			Result.force_new (-1, tokens.capitalized_integer_32_name)
			Result.force_new (-1, tokens.capitalized_integer_64_name)
			Result.force_new (-1, tokens.capitalized_internal_name)
			Result.force_new (-1, tokens.capitalized_ise_exception_manager_name)
			Result.force_new (-1, tokens.capitalized_ise_runtime_name)
			Result.force_new (-1, tokens.capitalized_iterable_name)
			Result.force_new (-1, tokens.capitalized_iteration_cursor_name)
			Result.force_new (-1, tokens.capitalized_memory_name)
			Result.force_new (-1, tokens.capitalized_native_array_name)
			Result.force_new (-1, tokens.capitalized_natural_name)
			Result.force_new (-1, tokens.capitalized_natural_8_name)
			Result.force_new (-1, tokens.capitalized_natural_16_name)
			Result.force_new (-1, tokens.capitalized_natural_32_name)
			Result.force_new (-1, tokens.capitalized_natural_64_name)
			Result.force_new (-1, tokens.capitalized_none_name)
			Result.force_new (-1, tokens.capitalized_platform_name)
			Result.force_new (-1, tokens.capitalized_pointer_name)
			Result.force_new (-1, tokens.capitalized_predicate_name)
			Result.force_new (-1, tokens.capitalized_procedure_name)
			Result.force_new (-1, tokens.capitalized_real_name)
			Result.force_new (-1, tokens.capitalized_real_32_name)
			Result.force_new (-1, tokens.capitalized_real_64_name)
			Result.force_new (-1, tokens.capitalized_routine_name)
			Result.force_new (-1, tokens.capitalized_special_name)
			Result.force_new (-1, tokens.capitalized_string_name)
			Result.force_new (-1, tokens.capitalized_string_8_name)
			Result.force_new (-1, tokens.capitalized_string_32_name)
			Result.force_new (-1, tokens.capitalized_system_object_name)
			Result.force_new (-1, tokens.capitalized_system_string_name)
			Result.force_new (-1, tokens.capitalized_tuple_name)
			Result.force_new (-1, tokens.capitalized_type_name)
			Result.force_new (-1, tokens.capitalized_typed_pointer_name)
			Result.force_new (-1, tokens.capitalized_wide_character_name)
			Result.force_new (-1, tokens.capitalized_unknown_name)
				-- Keywords.
			Result.force_new (-1, tokens.capitalized_current_keyword_name)
			Result.force_new (-1, tokens.attached_keyword_name)
			Result.force_new (-1, tokens.current_keyword_name)
			Result.force_new (-1, tokens.detachable_keyword_name)
			Result.force_new (-1, tokens.expanded_keyword_name)
			Result.force_new (-1, tokens.like_keyword_name)
			Result.force_new (-1, tokens.reference_keyword_name)
			Result.force_new (-1, tokens.separate_keyword_name)
				-- Symbols.
			Result.force_new (-1, tokens.bang_symbol_name)
			Result.force_new (-1, tokens.colon_symbol_name)
			Result.force_new (-1, tokens.comma_symbol_name)
			Result.force_new (-1, tokens.dot_symbol_name)
			Result.force_new (-1, tokens.left_brace_symbol_name)
			Result.force_new (-1, tokens.left_bracket_symbol_name)
			Result.force_new (-1, tokens.question_mark_symbol_name)
			Result.force_new (-1, tokens.right_brace_symbol_name)
			Result.force_new (-1, tokens.right_bracket_symbol_name)
		ensure
			strings_not_void: Result /= Void
			no_void_string: not Result.has_void
		end

	string_buffer: STRING_8
			-- String buffer
		once
			create Result.make (30)
		ensure
			string_buffer_not_void: Result /= Void
			string_buffer_is_string_8: Result.same_type ({STRING_8} "")
		end

feature {NONE} -- Processing

	process_identifier (nb: INTEGER)
			-- Process identifier with `nb' characters.
			-- Detect keywords.
		require
			nb_large_enough: nb >= 1
			nb_small_enough: nb <= text_count
			valid_text: {ET_IDENTIFIER}.valid_name (unicode_text_substring (1, nb))
		do
			last_token := E_IDENTIFIER
			last_literal_start := 1
			last_literal_end := nb
			inspect nb
			when 2 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 's', 'S' then
						last_token := E_AS
						last_detachable_et_keyword_value := tokens.as_keyword
					else
						-- Do nothing.
					end
				when 'd', 'D' then
					inspect text_item (2)
					when 'o', 'O' then
						last_token := E_DO
						last_detachable_et_keyword_value := tokens.do_keyword
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'f', 'F' then
						last_token := E_IF
						last_detachable_et_keyword_value := tokens.if_keyword
					when 's', 'S' then
						last_token := E_IS
						last_detachable_et_keyword_value := tokens.is_keyword
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'r', 'R' then
						last_token := E_OR
						last_detachable_et_keyword_operator_value := tokens.or_keyword
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 3 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							last_token := E_AND
							last_detachable_et_keyword_operator_value := tokens.and_keyword
						else
							-- Do nothing.
						end
					when 'l', 'L' then
						inspect text_item (3)
						when 'l', 'L' then
							last_token := E_ALL
							last_detachable_et_keyword_value := tokens.all_keyword
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'e', 'E' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							last_token := E_END
							last_detachable_et_keyword_value := tokens.end_keyword
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'n', 'N' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 't', 'T' then
							last_token := E_NOT
							last_detachable_et_keyword_operator_value := tokens.not_keyword
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'l', 'L' then
						inspect text_item (3)
						when 'd', 'D' then
							last_token := E_OLD
							last_detachable_et_keyword_value := tokens.old_keyword
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'x', 'X' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'r', 'R' then
							last_token := E_XOR
							last_detachable_et_keyword_operator_value := tokens.xor_keyword
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 4 then
				inspect text_item (1)
				when 'e', 'E' then
					inspect text_item (2)
					when 'l', 'L' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_ELSE
								last_detachable_et_keyword_value := tokens.else_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'o', 'O' then
							inspect text_item (4)
							when 'm', 'M' then
								last_token := E_FROM
								last_detachable_et_keyword_value := tokens.from_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'l', 'L' then
					inspect text_item (2)
					when 'i', 'I' then
						inspect text_item (3)
						when 'k', 'K' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_LIKE
								last_detachable_et_keyword_value := tokens.like_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'o', 'O' then
						inspect text_item (3)
						when 'o', 'O' then
							inspect text_item (4)
							when 'p', 'P' then
								last_token := E_LOOP
								last_detachable_et_keyword_value := tokens.loop_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'n', 'N' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'n', 'N' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_NONE
								last_detachable_et_identifier_value := last_identifier
							else
								-- Do nothing.
							end
						when 't', 'T' then
							inspect text_item (4)
							when 'e', 'E' then
								if use_note_keyword then
									last_token := E_NOTE
									last_detachable_et_keyword_value := tokens.note_keyword
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'c', 'C' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_ONCE
								last_detachable_et_keyword_value := tokens.once_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'm', 'M' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_SOME
								last_detachable_et_keyword_value := tokens.some_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 't', 'T' then
					inspect text_item (2)
					when 'h', 'H' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'n', 'N' then
								last_token := E_THEN
								last_detachable_et_keyword_value := tokens.then_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'r', 'R' then
						inspect text_item (3)
						when 'u', 'U' then
							inspect text_item (4)
							when 'e', 'E' then
								last_token := E_TRUE
								last_detachable_et_boolean_constant_value := tokens.true_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'v', 'V' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'i', 'I' then
							inspect text_item (4)
							when 'd', 'D' then
								last_token := E_VOID
								last_detachable_et_void_value := tokens.void_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'w', 'W' then
					inspect text_item (2)
					when 'h', 'H' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'n', 'N' then
								last_token := E_WHEN
								last_detachable_et_keyword_value := tokens.when_keyword
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 5 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 'g', 'G' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'n', 'N' then
								inspect text_item (5)
								when 't', 'T' then
									last_token := E_AGENT
									last_detachable_et_agent_keyword_value := tokens.agent_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'l', 'L' then
						inspect text_item (3)
						when 'i', 'I' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 's', 'S' then
									last_token := E_ALIAS
									last_detachable_et_keyword_value := tokens.alias_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'c', 'C' then
					inspect text_item (2)
					when 'h', 'H' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'c', 'C' then
								inspect text_item (5)
								when 'k', 'K' then
									last_token := E_CHECK
									last_detachable_et_keyword_value := tokens.check_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'l', 'L' then
						inspect text_item (3)
						when 'a', 'A' then
							inspect text_item (4)
							when 's', 'S' then
								inspect text_item (5)
								when 's', 'S' then
									last_token := E_CLASS
									last_detachable_et_keyword_value := tokens.class_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'd', 'D' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'b', 'B' then
							inspect text_item (4)
							when 'u', 'U' then
								inspect text_item (5)
								when 'g', 'G' then
									last_token := E_DEBUG
									last_detachable_et_keyword_value := tokens.debug_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'a', 'A' then
						inspect text_item (3)
						when 'l', 'L' then
							inspect text_item (4)
							when 's', 'S' then
								inspect text_item (5)
								when 'e', 'E' then
									last_token := E_FALSE
									last_detachable_et_boolean_constant_value := tokens.false_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'l', 'L' then
					inspect text_item (2)
					when 'o', 'O' then
						inspect text_item (3)
						when 'c', 'C' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'l', 'L' then
									last_token := E_LOCAL
									last_detachable_et_keyword_value := tokens.local_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'r', 'R' then
								inspect text_item (5)
								when 'y', 'Y' then
									last_token := E_RETRY
									last_detachable_et_retry_instruction_value := tokens.retry_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 't', 'T' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'p', 'P' then
									last_token := E_STRIP
									last_detachable_et_keyword_value := tokens.strip_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 't', 'T' then
					inspect text_item (2)
					when 'u', 'U' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'l', 'L' then
								inspect text_item (5)
								when 'e', 'E' then
									last_token := E_TUPLE
									last_detachable_et_identifier_value := last_identifier
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'u', 'U' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'l', 'L' then
									last_token := E_UNTIL
									last_detachable_et_keyword_value := tokens.until_keyword
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 6 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 'c', 'C' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'o', 'O' then
								inspect text_item (5)
								when 's', 'S' then
									inspect text_item (6)
									when 's', 'S' then
										last_token := E_ACROSS
										last_detachable_et_keyword_value := tokens.across_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 's', 'S' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'g', 'G' then
									inspect text_item (6)
									when 'n', 'N' then
										last_token := E_ASSIGN
										last_detachable_et_keyword_value := tokens.assign_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'c', 'C' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 't', 'T' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_CREATE
										last_detachable_et_keyword_value := tokens.create_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'e', 'E' then
					inspect text_item (2)
					when 'l', 'L' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'f', 'F' then
										last_token := E_ELSEIF
										last_detachable_et_keyword_value := tokens.elseif_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'n', 'N' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'u', 'U' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_ENSURE
										last_detachable_et_keyword_value := tokens.ensure_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'x', 'X' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'o', 'O' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 't', 'T' then
										last_token := E_EXPORT
										last_detachable_et_keyword_value := tokens.export_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'o', 'O' then
							inspect text_item (4)
							when 'z', 'Z' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'n', 'N' then
										last_token := E_FROZEN
										last_detachable_et_keyword_value := tokens.frozen_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'n', 'N' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'm', 'M' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_RENAME
										last_detachable_et_keyword_value := tokens.rename_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						when 's', 'S' then
							inspect text_item (4)
							when 'c', 'C' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_RESCUE
										last_detachable_et_keyword_value := tokens.rescue_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							when 'u', 'U' then
								inspect text_item (5)
								when 'l', 'L' then
									inspect text_item (6)
									when 't', 'T' then
										last_token := E_RESULT
										last_detachable_et_result_value := tokens.result_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'l', 'L' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'c', 'C' then
									inspect text_item (6)
									when 't', 'T' then
										last_token := E_SELECT
										last_detachable_et_keyword_value := tokens.select_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'u', 'U' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'i', 'I' then
							inspect text_item (4)
							when 'q', 'Q' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'e', 'E' then
										last_token := E_UNIQUE
										last_detachable_et_keyword_value := tokens.unique_keyword
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 7 then
				inspect text_item (1)
				when 'c', 'C' then
					inspect text_item (2)
					when 'u', 'U' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'r', 'R' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'n', 'N' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_CURRENT
											last_detachable_et_current_value := tokens.current_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'o', 'O' then
						inspect text_item (3)
						when 'n', 'N' then
							inspect text_item (4)
							when 'v', 'V' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_CONVERT
											last_detachable_et_keyword_value := tokens.convert_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'f', 'F' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'a', 'A' then
							inspect text_item (4)
							when 't', 'T' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 'e', 'E' then
											last_token := E_FEATURE
											last_detachable_et_keyword_value := tokens.feature_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'm', 'M' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'l', 'L' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'e', 'E' then
										inspect text_item (7)
										when 's', 'S' then
											last_token := E_IMPLIES
											last_detachable_et_keyword_operator_value := tokens.implies_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					when 'n', 'N' then
						inspect text_item (3)
						when 'h', 'H' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_INHERIT
											last_detachable_et_keyword_value := tokens.inherit_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						when 's', 'S' then
							inspect text_item (4)
							when 'p', 'P' then
								inspect text_item (5)
								when 'e', 'E' then
									inspect text_item (6)
									when 'c', 'C' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_INSPECT
											last_detachable_et_keyword_value := tokens.inspect_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'q', 'Q' then
							inspect text_item (4)
							when 'u', 'U' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 'e', 'E' then
											last_token := E_REQUIRE
											last_detachable_et_keyword_value := tokens.require_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'v', 'V' then
					inspect text_item (2)
					when 'a', 'A' then
						inspect text_item (3)
						when 'r', 'R' then
							inspect text_item (4)
							when 'i', 'I' then
								inspect text_item (5)
								when 'a', 'A' then
									inspect text_item (6)
									when 'n', 'N' then
										inspect text_item (7)
										when 't', 'T' then
											last_token := E_VARIANT
											last_detachable_et_keyword_value := tokens.variant_keyword
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 8 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 't', 'T' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'c', 'C' then
									inspect text_item (6)
									when 'h', 'H' then
										inspect text_item (7)
										when 'e', 'E' then
											inspect text_item (8)
											when 'd', 'D' then
												if use_attached_keyword then
													last_token := E_ATTACHED
													last_detachable_et_keyword_value := tokens.attached_keyword
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'c', 'C' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 't', 'T' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'o', 'O' then
											inspect text_item (8)
											when 'n', 'N' then
												last_token := E_CREATION
												last_detachable_et_keyword_value := tokens.creation_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'd', 'D' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'f', 'F' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 'e', 'E' then
											inspect text_item (8)
											when 'd', 'D' then
												last_token := E_DEFERRED
												last_detachable_et_keyword_value := tokens.deferred_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'e', 'E' then
					inspect text_item (2)
					when 'x', 'X' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'n', 'N' then
									inspect text_item (6)
									when 'd', 'D' then
										inspect text_item (7)
										when 'e', 'E' then
											inspect text_item (8)
											when 'd', 'D' then
												last_token := E_EXPANDED
												last_detachable_et_keyword_value := tokens.expanded_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						when 't', 'T' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'n', 'N' then
										inspect text_item (7)
										when 'a', 'A' then
											inspect text_item (8)
											when 'l', 'L' then
												last_token := E_EXTERNAL
												last_detachable_et_keyword_value := tokens.external_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'x', 'X' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'g', 'G' then
												last_token := E_INDEXING
												last_detachable_et_keyword_value := tokens.indexing_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'o', 'O' then
					inspect text_item (2)
					when 'b', 'B' then
						inspect text_item (3)
						when 's', 'S' then
							inspect text_item (4)
							when 'o', 'O' then
								inspect text_item (5)
								when 'l', 'L' then
									inspect text_item (6)
									when 'e', 'E' then
										inspect text_item (7)
										when 't', 'T' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_OBSOLETE
												last_detachable_et_keyword_value := tokens.obsolete_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'd', 'D' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'f', 'F' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_REDEFINE
												last_detachable_et_keyword_value := tokens.redefine_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 's', 'S' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'p', 'P' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'a', 'A' then
										inspect text_item (7)
										when 't', 'T' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_SEPARATE
												last_detachable_et_keyword_value := tokens.separate_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'u', 'U' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'd', 'D' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'f', 'F' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'e', 'E' then
												last_token := E_UNDEFINE
												last_detachable_et_keyword_value := tokens.undefine_keyword
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 9 then
				inspect text_item (1)
				when 'a', 'A' then
					inspect text_item (2)
					when 't', 'T' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'r', 'R' then
								inspect text_item (5)
								when 'i', 'I' then
									inspect text_item (6)
									when 'b', 'B' then
										inspect text_item (7)
										when 'u', 'U' then
											inspect text_item (8)
											when 't', 'T' then
												inspect text_item (9)
												when 'e', 'E' then
													if use_attribute_keyword then
														last_token := E_ATTRIBUTE
														last_detachable_et_keyword_value := tokens.attribute_keyword
													end
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'i', 'I' then
					inspect text_item (2)
					when 'n', 'N' then
						inspect text_item (3)
						when 'v', 'V' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'i', 'I' then
										inspect text_item (7)
										when 'a', 'A' then
											inspect text_item (8)
											when 'n', 'N' then
												inspect text_item (9)
												when 't', 'T' then
													last_token := E_INVARIANT
													last_detachable_et_invariant_keyword_value := tokens.invariant_keyword
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'p', 'P' then
					inspect text_item (2)
					when 'r', 'R' then
						inspect text_item (3)
						when 'e', 'E' then
							inspect text_item (4)
							when 'c', 'C' then
								inspect text_item (5)
								when 'u', 'U' then
									inspect text_item (6)
									when 'r', 'R' then
										inspect text_item (7)
										when 's', 'S' then
											inspect text_item (8)
											when 'o', 'O' then
												inspect text_item (9)
												when 'r', 'R' then
													last_token := E_PRECURSOR
													last_detachable_et_precursor_keyword_value := tokens.precursor_keyword
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				when 'r', 'R' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 'f', 'F' then
							inspect text_item (4)
							when 'e', 'E' then
								inspect text_item (5)
								when 'r', 'R' then
									inspect text_item (6)
									when 'e', 'E' then
										inspect text_item (7)
										when 'n', 'N' then
											inspect text_item (8)
											when 'c', 'C' then
												inspect text_item (9)
												when 'e', 'E' then
													if use_reference_keyword then
														last_token := E_REFERENCE
														last_detachable_et_keyword_value := tokens.reference_keyword
													end
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			when 10 then
				inspect text_item (1)
				when 'd', 'D' then
					inspect text_item (2)
					when 'e', 'E' then
						inspect text_item (3)
						when 't', 'T' then
							inspect text_item (4)
							when 'a', 'A' then
								inspect text_item (5)
								when 'c', 'C' then
									inspect text_item (6)
									when 'h', 'H' then
										inspect text_item (7)
										when 'a', 'A' then
											inspect text_item (8)
											when 'b', 'B' then
												inspect text_item (9)
												when 'l', 'L' then
													inspect text_item (10)
													when 'e', 'E' then
														if use_detachable_keyword then
															last_token := E_DETACHABLE
															last_detachable_et_keyword_value := tokens.detachable_keyword
														end
													else
														-- Do nothing.
													end
												else
													-- Do nothing.
												end
											else
												-- Do nothing.
											end
										else
											-- Do nothing.
										end
									else
										-- Do nothing.
									end
								else
									-- Do nothing.
								end
							else
								-- Do nothing.
							end
						else
							-- Do nothing.
						end
					else
						-- Do nothing.
					end
				else
					-- Do nothing.
				end
			else
				-- Do nothing.
			end
			if last_token = E_IDENTIFIER then
				last_detachable_et_identifier_value := last_identifier
			end
		end

	process_one_char_symbol (c: CHARACTER_32)
			-- Process Eiffel symbol with made up of only
			-- one character `c'.
		require
			one_char: text_count >= 1
			valid_string: {RX_PCRE_ROUTINES}.regexp ({STRING_32} "[.;,:!?{}[\]]").recognizes (unicode_text_substring (1, 1))
			valid_c: unicode_text_item (1) = c
		do
			last_literal_start := 1
			last_literal_end := 1
			inspect c
			when '.' then
				last_token := Dot_code
				last_detachable_et_symbol_value := tokens.dot_symbol
			when ';' then
				last_token := Semicolon_code
				last_detachable_et_semicolon_symbol_value := tokens.semicolon_symbol
			when ',' then
				last_token := Comma_code
				last_detachable_et_symbol_value := tokens.comma_symbol
			when ':' then
				last_token := Colon_code
				last_detachable_et_symbol_value := tokens.colon_symbol
			when '!' then
				last_token := Exclamation_code
				last_detachable_et_symbol_value := tokens.bang_symbol
			when '?' then
				last_token := Question_mark_code
				last_detachable_et_question_mark_symbol_value :=tokens.question_mark_symbol
			when '{' then
				last_token := Left_brace_code
				last_detachable_et_symbol_value := tokens.left_brace_symbol
			when '}' then
				last_token := Right_brace_code
				last_detachable_et_symbol_value := tokens.right_brace_symbol
			when '[' then
				last_token := Left_bracket_code
				last_detachable_et_bracket_symbol_value := tokens.left_bracket_symbol
			when ']' then
				last_token := Right_bracket_code
				last_detachable_et_symbol_value := tokens.right_bracket_symbol
			else
				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			end
		end

invariant

	current_system_not_void: current_system /= Void
	filename_not_void: filename /= Void
	last_text_count_positive: last_text_count >= 0
	last_literal_start_large_enough: last_literal_start >= 1
	last_literal_start_small_enough: last_literal_start <= last_literal_end + 1
	last_literal_end_small_enough: last_literal_end <= text_count
	system_processor_not_void: system_processor /= Void

end
