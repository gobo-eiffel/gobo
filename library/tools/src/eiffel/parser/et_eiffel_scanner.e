note

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_SCANNER

inherit

	ET_EIFFEL_SCANNER_SKELETON

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= LAVS3)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
			yy_acclist := yy_acclist_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
	yy_column := yy_column + 1
--|#line 37 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 37")
end

				last_break_end := 0
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			
when 2 then
yy_set_line_column
--|#line 42 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 42")
end

				last_text_count := 1
				last_break_end := text_count
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			
when 3 then
yy_set_line_column
--|#line 48 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 48")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol (text_item (1))
			
when 4 then
yy_set_line_column
--|#line 54 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 54")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol ('-')
			
when 5 then
	yy_column := yy_column + 2
--|#line 60 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 60")
end

				last_break_end := 0
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			
when 6 then
yy_set_line_column
--|#line 65 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 65")
end

				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			
when 7 then
yy_set_line_column
--|#line 71 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 71")
end

				last_text_count := 2
				last_break_end := 0
				last_comment_end := text_count
				process_two_char_symbol (text_item (1), text_item (2))
			
when 8 then
	yy_end := yy_end - 1
	yy_column := yy_column + 4
--|#line 111 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 111")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 9 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 119 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 119")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 10 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 128 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 128")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 11 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 141 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 141")
end

				last_break_end := 0
				last_comment_end := 0
				process_identifier (text_count)
			
when 12 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 146 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 146")
end

				last_text_count := text_count
				break_kind := identifier_break
				more
				set_start_condition (BREAK)
			
when 13 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 161 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 161")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 14 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 169 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 169")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 15 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 170 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 170")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 16 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 181 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 181")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 17 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 189 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 189")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 18 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 190 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 190")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 19 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 191 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 191")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 20 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 192 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 192")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 21 then
	yy_column := yy_column + 3
--|#line 204 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 204")
end

				last_break_end := 0
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			
when 22 then
yy_set_line_column
--|#line 209 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 209")
end

				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			
when 23 then
yy_set_line_column
--|#line 215 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 215")
end

				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (unicode_text_item (2))
			
when 24 then
	yy_column := yy_column + 4
--|#line 221 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 221")
end

				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 25 then
yy_set_line_column
--|#line 226 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 226")
end

				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 26 then
yy_set_line_column
--|#line 232 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 232")
end

				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			
when 27 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 239 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 239")
end

				last_token := E_CHARACTER
				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			
when 28 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 248 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 248")
end

				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			
when 29 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 256 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 256")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 30 then
	yy_column := yy_column + 3
--|#line 266 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 266")
end

					-- Syntax error: missing character code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			
when 31 then
	yy_column := yy_column + 2
--|#line 276 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 276")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			
when 32 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 285 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 285")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 33 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 299 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 299")
end

					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 34 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 307 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 307")
end

					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
when 35 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 316 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 316")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
when 36 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 317 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 317")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
when 37 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 325 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 325")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
when 38 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 326 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 326")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
when 39 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 334 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 334")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 40 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 342 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 342")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_freeop_break
				more
				set_start_condition (BREAK)
			
when 41 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 350 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 350")
end

					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 42 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 356 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 356")
end

					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
when 43 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 364 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 364")
end

					-- Verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				set_start_condition (VS1)
			
when 44 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 373 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 373")
end

				verbatim_open_white_characters := utf8_text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 45 then
	yy_column := yy_column + 1
--|#line 379 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 379")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 46 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 397 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 397")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2), False, Current)
					verbatim_marker := no_verbatim_marker
					verbatim_marker_count := 0
					verbatim_open_white_characters := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
when 47 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 413 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 413")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2)
					last_text_count := text_count
					break_kind := str_verbatim_break
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (VS3)
				end
			
when 48 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 425 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 425")
end

				more
				set_start_condition (VS3)
			
when 49 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 429 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 429")
end

				more
				last_literal_end := text_count - 2
			
when 50 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 433 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 433")
end

				more
				last_literal_end := text_count - 1
			
when 51 then
	yy_column := yy_column + 1
--|#line 437 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 437")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 52 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 455 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 455")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 53 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 460 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 460")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 54 then
	yy_column := yy_column + 1
--|#line 465 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 465")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 55 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 481 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 481")
end

					-- Left-aligned verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				set_start_condition (LAVS1)
			
when 56 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 490 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 490")
end

				verbatim_open_white_characters := utf8_text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
when 57 then
	yy_column := yy_column + 1
--|#line 496 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 496")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 58 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 514 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 514")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2), True, Current)
					verbatim_marker := no_verbatim_marker
					verbatim_marker_count := 0
					verbatim_open_white_characters := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
when 59 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 530 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 530")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2)
					last_text_count := text_count
					break_kind := str_left_aligned_verbatim_break
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (LAVS3)
				end
			
when 60 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 542 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 542")
end

				more
				set_start_condition (LAVS3)
			
when 61 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 546 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 546")
end

				more
				last_literal_end := text_count - 2
			
when 62 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 550 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 550")
end

				more
				last_literal_end := text_count - 1
			
when 63 then
	yy_column := yy_column + 1
--|#line 554 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 554")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 64 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 572 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 572")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
when 65 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 577 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 577")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
when 66 then
	yy_column := yy_column + 1
--|#line 582 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 582")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 67 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 598 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 598")
end

					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 68 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 607 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 607")
end

					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 69 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 616 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 616")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 70 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 627 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 627")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 71 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 632 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 632")
end

				more
			
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 635 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 635")
end

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 73 then
	yy_column := yy_column + 2
--|#line 648 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 648")
end

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 74 then
	yy_column := yy_column + 2
--|#line 661 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 661")
end

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 75 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 674 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 674")
end

				more
			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 677 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 677")
end

				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			
when 77 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 686 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 686")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 78 then
	yy_column := yy_column + 2
--|#line 694 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 694")
end

					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSSC_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			
when 79 then
	yy_column := yy_column + 1
--|#line 705 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 705")
end

					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSSC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 80 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 718 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 718")
end

					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNL_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 81 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 746 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 746")
end

				more
				set_start_condition (MS)
			
when 82 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 750 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 750")
end

					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				column := 1
				line := yy_line - 1
				set_syntax_error
				error_handler.report_SSEL_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			
when 83 then
	yy_column := yy_column + 1
--|#line 761 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 761")
end

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 84 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 792 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 792")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 800 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 800")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 808 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 808")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 87 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 816 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 816")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 824 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 824")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 836 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 836")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 90 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 848 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 848")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 91 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 860 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 860")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 872 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 872")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 880 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 880")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 888 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 888")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 95 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 900 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 900")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 912 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 912")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 924 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 924")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 98 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 936 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 936")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 99 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 944 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 944")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 952 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 952")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 101 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 964 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 964")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 102 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 976 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 976")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 103 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 988 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 988")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1000 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1000")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1008 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1008")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 106 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1016 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1016")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1028 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1028")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1040 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1040")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1052 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1052")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 110 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1068 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1068")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 111 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1069 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1069")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 112 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1070 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1070")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 113 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1078 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1078")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			
when 114 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1079 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1079")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			
when 115 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1080 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1080")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			
when 116 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1091 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1091")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 117 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1092 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1092")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1093 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1093")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 119 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1101 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1101")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			
when 120 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1102 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1102")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			
when 121 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1103 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1103")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			
when 122 then
yy_set_line_column
--|#line 1118 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1118")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			
when 123 then
yy_set_line_column
--|#line 1128 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1128")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			
when 124 then
yy_set_line_column
--|#line 1139 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1139")
end

				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 125 then
yy_set_line_column
--|#line 1145 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1145")
end

				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			
when 126 then
	yy_column := yy_column + 1
--|#line 1151 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1151")
end

					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 127 then
	yy_column := yy_column + 1
--|#line 1172 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1172")
end

				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			
when 128 then
yy_set_line_column
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 1171 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1171")
end
terminate
when 1 then
--|#line 1159 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1159")
end

					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 2 then
--|#line 730 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 730")
end

					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 3 then
--|#line 774 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 774")
end

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 4 then
--|#line 386 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 386")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 444 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 444")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 472 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 472")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 7 then
--|#line 503 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 503")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 8 then
--|#line 561 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 561")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 9 then
--|#line 589 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 589")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3377)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   23,   24,   23,   25,   26,   27,   28,   22,   29,
			   28,   25,   30,   31,   32,   33,   34,   34,   34,   35,
			   36,   28,   37,   38,   39,   39,   39,   39,   39,   39,
			   39,   40,   39,   28,   41,   28,   42,   22,   39,   39,
			   39,   39,   39,   28,   28,   25,   22,   44,   45,   44,
			   44,   45,   44,   48,   48,  545,   49,   49,   46,   50,
			   50,   46,   52,   53,   52,   52,   53,   52,  537,   54,
			   65,   66,   54,   56,   57,   56,   56,   57,   56,   59,
			   60,   61,  533,   62,   59,   60,   61,  530,   62,   65,
			   66,   68,   69,   68,   68,   69,   68,   71,   72,   73,

			  541,   74,   71,   72,   73,  514,   74,   77,   78,   77,
			   78,  114,  115,   80,   80,   80,  121,   84,   84,   84,
			  167,  168,   63,  119,   81,  510,  141,   63,   85,  142,
			  506,   75,   82,  116,   83,  119,   75,   84,   84,   84,
			   86,   86,   86,  111,  111,  111,  503,  121,   85,  157,
			  158,   87,  159,  189,  112,  546,  151,  152,  151,   82,
			  496,   83,   89,  153,   89,   90,   91,   92,   93,   94,
			   89,   93,   90,   95,   96,   97,   89,   89,   89,   89,
			   98,   99,   93,  100,  101,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,  102,  103,   93,   89,   88,   89, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   89,   89,   89,   89,  104,   93,   90,   88,  105,  105,
			  105,  106,   80,  106,  530,   79,  169,  168,  106,  108,
			  189,  106,  117,  117,  117,  546,  546,  109,  194,  110,
			  183,  184,  546,  118,  131,  131,  131,  185,  184,  546,
			  546,  106,  192,  119,  106,  132,  529,  111,  111,  111,
			  189,  473,  106,   79,  111,  111,  111,  222,  112,  167,
			  168,  135,  135,  135,  135,  112,  119,  119,  120,  120,
			  120,  120,  122,  122,  122,  154,  155,  154,  222,  111,
			  111,  111,  136,  123,  124,   93,  125,  125,  125,  125,
			  130,  260,  260,  111,  111,  111,  126,  127,  119,  119,

			  170,  171,  170,  128,  112,  157,  164,  129,  165,  222,
			  126,  127,  261,  119,  131,  131,  131,   80,   80,   80,
			  137,  137,  137,  173,  174,  132,  175,  133,   81,  173,
			  180,  138,  181,  137,  137,  137,  143,  143,  143,  133,
			  490,  190,  245,  134,  138,  141,  486,  144,  142,  546,
			  121,  191,  246,  169,  168,  134,  146,  147,  146,  145,
			  148,  145,  145,  148,  148,  148,  145,  145,  145,  149,
			  145,  145,  145,  145,  145,  148,  145,  148,  145,  148,
			  148,  148,  145,  145,  148,  148,  145,  145,  145,  145,
			  145,  145,  145,  150,  150,  150,  150,  150,  145,  145, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  145,  145,  160,  157,  161,  484,  159,  160,  163,  161,
			  273,  159,  176,  173,  177,  186,  175,  176,  179,  177,
			  274,  175,  224,  187,  293,  188,   88,   84,   84,   84,
			  111,  111,  111,   91,  294,   93,  201,   79,   85,  213,
			  141,  112,  201,  142,  269,  162,  178,  203,  203,  203,
			  162,  178,  193,  194,  193,  457,  195,  457,  204,  193,
			  196,  199,  193,  262,  262,  262,   79,  199,  197,  224,
			  198,  200,  213,  310,  223,  201,  213,  200,   88,  201,
			   93,  199,  193,  478,  263,  193,   93,   93,   88,  183,
			  184,  200,   93,  193,  193,  193,  202,  193,   91,  195,

			  199,  433,  193,  196,  199,  193,  232,  232,  232,  313,
			  200,  197,  314,  198,  200,   89,  213,  237,  288,  201,
			  232,  232,  232,  293,  199,  193,  189,  546,  193,  185,
			  184,  233,   93,  294,  200,  430,  193,  193,   89,  291,
			   89,  205,  206,  205,  199,  195,  223,  189,  205,  208,
			  310,  205,  157,  158,  200,  159,  295,  209,  207,  210,
			   92,  111,  111,  111,  296,  546,  297,  243,  243,  243,
			  211,  205,  112,  428,  205,  232,  232,  232,  244,  425,
			  212,  270,  205,  193,  215,  133,  237,  216,  217,  217,
			  276,  147,  276,  218,  107,  270,  238,  133,  224,  217, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  546,  217,  216,  217,  217,  217,   80,  423,  217,  217,
			  163,  158,  219,  159,  189,  247,  247,  247,  253,  253,
			  253,  420,  220,   88,  213,   88,  248,  221,  219,  254,
			   88,   89,  108,   88,  135,  135,  135,  135,  220,   88,
			  109,   93,  110,  137,  137,  137,  143,  143,  143,  277,
			  278,  278,  278,   88,  138,  136,   88,  144,  154,  155,
			  154,  279,  279,  279,   88,   88,  225,  226,  225,   80,
			  213,  417,  280,  201,  151,  152,  151,  189,  160,  157,
			  161,  153,  159,  160,  163,  161,  245,  159,  157,  164,
			  373,  165,  163,  164,  273,  165,  246,  293,  199,  170,

			  171,  170,  173,  174,  274,  175,  411,  294,  200,  227,
			  228,  227,  496,  213,  179,  174,  201,  175,  194,  173,
			  180,  162,  181,  325,  325,  325,  162,  176,  173,  177,
			  466,  175,  176,  179,  177,   89,  175,  179,  180,  406,
			  181,  199,  469,  194,  469,  281,  281,  281,  217,  407,
			  295,  200,  105,  105,  105,  106,  282,  106,  296,   79,
			  297,  178,  106,  229,   80,  106,  178,  283,  283,  283,
			  503,  230,  189,  231,  339,  340,  340,  340,   80,  284,
			  284,  284,  286,  286,  286,  106,  189,  465,  106,  370,
			  285,  388,  133,  287,  355,  355,  106,   79,  234,  234, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  234,  235,  385,  235,  133,  116,  408,  141,  235,  105,
			  142,  235,  288,  288,  288,  261,  409,  236,  290,  290,
			  290,  383,  196,  289,  291,  291,  291,  455,  455,   81,
			  209,  235,  210,  315,  235,  292,  298,  298,  298,  276,
			  147,  276,  235,  116,  249,  249,  249,  299,  364,   91,
			   91,  360,  223,  224,  356,  250,   88,   88,  120,  120,
			  120,  120,  313,   80,   89,  201,   88,   89,  408,  352,
			  251,  189,  301,  301,  301,  306,  306,  306,  409,  252,
			  256,  256,  256,  302,   80,  398,  307,  311,  311,  311,
			  319,  257,  189,  334,  258,  258,  258,  258,  312,  330,

			  320,  328,  328,  328,  467,  467,  259,  266,  266,  266,
			  206,  387,  329,  224,  336,  336,  336,  310,  267,  422,
			  422,  268,  268,  268,  268,  337,  243,  243,  243,  323,
			  226,  323,  311,  546,  324,  228,  324,  244,  546,  245,
			  245,  245,  129,  271,  271,  271,  345,  345,  345,  345,
			   85,  326,  326,  326,  272,  491,  491,  135,  135,  135,
			  135,  219,  327,  247,  247,  247,  219,  252,  455,  455,
			  107,  220,  238,  493,  248,  493,  220,  306,  136,  215,
			  401,  206,  300,  217,  217,  359,  359,  359,  218,  494,
			  234,  234,  234,  301,  217,  293,  217,  546,  217,  217, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  217,  232,  510,  217,  217,  294,  263,  219,  140,  298,
			  330,  330,  330,  332,  332,  332,  215,  220,  225,  226,
			  225,  331,   91,  463,  333,  201,  334,  334,  334,  109,
			  533,  110,  109,  464,  110,  546,  315,  335,  545,  224,
			  247,  247,  247,  216,  536,  109,  536,  110,  343,  343,
			  199,  248,  344,  344,  344,  344,  371,  372,  372,  372,
			  200,  227,  228,  227,  406,   91,  350,  350,  201,  379,
			  351,  351,  351,  351,  407,  360,  360,  360,  364,  364,
			  364,  273,  273,  273,  194,  378,  361,  223,  281,  365,
			  366,   88,  138,  199,  373,  278,  278,  278,  278,   89,

			  279,   88,  408,  200,   89,  271,   89,  205,  206,  205,
			  362,  195,  409,  266,  205,  303,  377,  205,  293,  293,
			  293,  194,  293,  304,  224,  305,  265,  206,   88,  112,
			  223,  223,  294,  347,  310,  216,  211,  205,   89,  346,
			  205,  463,  207,  217,   92,  216,  212,  249,  205,  193,
			   89,  464,   89,  342,  308,  534,  534,  201,  383,  383,
			  383,  309,  385,  385,  385,  388,  388,  388,  504,  384,
			  214,  214,  341,  386,  338,  216,  389,  214,  505,  323,
			  226,  323,  211,  546,  214,  214,  324,  228,  324,  216,
			  546,  481,  212,  216,  203,   89,   92,  308,   92,  482, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  221,  483,  217,   92,   89,  143,   92,  275,  336,  336,
			  336,  219,   92,  139,  207,  456,  456,  456,  219,  337,
			  131,  220,  265,  332,  332,  332,   92,  122,  220,   92,
			  344,  344,  344,  344,  396,  293,   79,   92,   88,  225,
			  226,  225,  109,  308,  110,  294,  201,  332,  332,  332,
			  309,  399,  399,  399,  351,  351,  351,  351,  397,  445,
			  446,  445,  400,  468,  468,  468,  109,  240,  110,  242,
			  447,  211,  401,  340,  340,  340,  340,  430,  430,  430,
			  504,  212,  240,  484,   89,  227,  228,  227,  431,  308,
			  505,  239,  201,  485,  405,  239,  309,  414,  414,  118,

			  139,  415,  415,  415,  415,  416,  416,  416,  416,  433,
			  433,  433,  362,  278,  278,  278,  278,  211,  293,  293,
			  434,  140,  372,  372,  372,  372,  349,  212,  294,  294,
			   89,  300,  315,  300,  377,  195,  293,  546,  300,  316,
			  293,  300,  546,  454,  265,  546,  294,  317,  315,  318,
			  294,  223,  427,  427,  427,  216,  458,  459,  459,  459,
			  319,  300,  546,  217,  300,  216,  546,  546,  546,  546,
			  320,  546,  300,  300,  546,  546,  460,  460,  461,  461,
			  461,  399,  399,  399,  321,  322,  322,  322,  406,  406,
			  406,  546,  400,  293,  219,  293,  219,  546,  214,  244, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  467,  467,  219,  294,  220,  294,  220,  546,  546,  214,
			  214,  546,  220,  225,  226,  225,  214,   91,  491,  491,
			  201,  508,  546,  214,  214,  340,  340,  340,  340,  408,
			  408,  408,  470,  470,  470,  470,  546,  471,  471,  531,
			  248,  472,  472,  472,  472,  199,  405,  415,  415,  415,
			  415,  546,  116,  410,  116,  200,  227,  228,  227,  546,
			   91,  546,  116,  201,  477,  477,  477,  477,  360,  360,
			  360,  438,  438,  438,  438,  546,  479,  479,  546,  361,
			  480,  480,  480,  480,  264,  419,  264,  546,  199,  264,
			  546,  293,  293,  293,  293,  293,  293,  546,  200,  249,

			  249,  249,  112,  362,  546,  112,  492,  492,  492,  546,
			  250,  546,  546,  258,  258,  258,  258,  487,  487,  487,
			  546,  488,  373,  455,  455,  348,  534,  534,  489,  546,
			  372,  372,  372,  372,  349,  352,  352,  352,  373,  456,
			  456,  456,  546,  363,  494,  363,  353,  543,  363,  260,
			  260,  454,  215,  459,  459,  459,  459,  546,  546,  488,
			  495,  401,  467,  467,  463,  463,  463,  506,  506,  506,
			  354,  356,  356,  356,  500,  337,  546,  546,  507,  516,
			  517,  516,  357,  508,  546,  262,  262,  262,  401,  468,
			  468,  468,  472,  472,  472,  472,  472,  472,  472,  472, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  511,  511,  511,  511,  546,  546,  358,  293,  546,  367,
			  509,  367,  546,  367,  546,  546,  367,  368,  546,  367,
			  546,  475,  512,  512,  546,  369,  513,  513,  513,  513,
			  480,  480,  480,  480,  480,  480,  480,  480,  546,  367,
			  546,  546,  367,  524,  525,  524,  518,  519,  518,  546,
			  367,  367,  373,  278,  278,  278,  278,  520,  521,  522,
			  521,  546,  546,  374,  375,  239,  546,  485,  546,  523,
			  376,  526,  527,  526,  377,  546,  546,  374,  375,  300,
			  315,  300,  528,  195,  546,  546,  300,  380,  546,  300,
			  487,  487,  487,  546,  488,  381,  546,  382,  456,  456,

			  456,  489,  546,  140,  491,  491,  546,  546,  319,  300,
			  546,  546,  300,  140,  492,  492,  492,  546,  320,  495,
			  300,  300,   89,  546,   89,  531,  308,  460,  460,  201,
			  546,  546,  488,   89,  546,  532,  535,  535,  535,  459,
			  459,  459,  459,  546,  546,  219,  546,  546,  501,  546,
			  504,  504,  504,  546,  211,  220,  468,  468,  468,  546,
			  500,  400,  546,  546,  212,  546,  546,   89,  216,  313,
			  216,  546,  221,  546,  546,  216,  217,  509,  216,  513,
			  513,  513,  513,  546,  216,  546,  217,  513,  513,  513,
			  513,  293,  293,  293,  293,  293,  293,  546,  216,  546, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  546,  216,  112,  546,  546,  112,  524,  525,  524,  216,
			  216,  390,  226,  390,  546,  313,  546,  539,  201,  293,
			  293,  293,  524,  525,  524,  293,  293,  293,  546,  546,
			  112,  546,  546,  540,  546,  546,  112,  293,  293,  293,
			  530,  530,  530,  319,  542,  492,  492,  492,  112,  546,
			  546,  489,  546,  320,  391,  228,  391,  546,  313,  546,
			  546,  201,  215,  534,  534,  546,  532,  215,  535,  535,
			  535,  535,  535,  535,   79,   79,  546,  546,   79,  546,
			   79,  546,  542,   79,  543,  546,  319,  546,   79,  544,
			  546,  241,  544,  241,  241,  546,  320,  546,  241,  241,

			  546,  241,  546,  546,  546,  546,  217,  322,  322,  322,
			  322,  546,  140,  546,  140,  140,  546,  392,  393,  140,
			  140,  546,  140,  546,  394,  219,  546,  546,  395,  546,
			  546,  392,  393,  546,  546,  220,  401,  340,  340,  340,
			  340,  546,  215,  546,  215,  215,  546,  402,  403,  215,
			  215,  546,  215,  546,  404,  546,  546,  546,  405,  546,
			  546,  402,  403,  249,  249,  249,  546,  116,  116,  546,
			  546,  116,  546,  116,  250,  546,  116,  344,  344,  344,
			  344,  116,  432,  432,  546,  546,  546,  546,  432,  546,
			  432,  546,  432,  546,  546,  432,  546,  546,  410,  411, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  411,  411,  546,  546,  546,  546,  546,  546,  546,  546,
			  412,  546,  546,  345,  345,  345,  345,  546,  546,  546,
			  546,  546,  546,  546,  546,  413,  546,  546,  546,  546,
			  546,  546,  546,  546,  252,  417,  417,  417,  546,  546,
			  546,  546,  546,  546,  546,  546,  418,  546,  546,  351,
			  351,  351,  351,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  419,  420,  420,  420,  546,  546,  546,  546,  546,  546,
			  546,  546,  421,  546,  546,  422,  422,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,

			  546,  546,  546,  546,  546,  546,  354,  423,  423,  423,
			  546,  546,  546,  546,  546,  546,  546,  546,  424,  546,
			  546,  355,  355,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  261,  425,  425,  425,  546,  546,  546,  546,
			  546,  546,  546,  546,  426,  546,  546,  427,  427,  427,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  358,  428,
			  428,  428,  546,  546,  546,  546,  546,  546,  546,  546,
			  429,  546,  546,  359,  359,  359,  546,  546,  546,  546, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  263,  436,  436,  436,  546,  546,
			  546,  546,  546,  546,  546,  546,  437,  546,  546,  438,
			  438,  438,  438,  546,  546,  546,  546,  546,  546,  546,
			  546,  439,  192,  441,  192,  440,  546,  440,  546,  440,
			  546,  546,  440,  442,  546,  440,  546,  546,  546,  546,
			  546,  443,  546,  444,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  440,  546,  546,  440,  546,
			  546,  546,  546,  546,  546,  546,  440,  440,  448,  448,
			  448,  546,  449,  546,  546,  546,  546,  546,  546,  450,

			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  133,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  133,
			  449,  140,  372,  372,  372,  372,  546,  546,  546,  546,
			  546,  546,  451,  452,  546,  546,  546,  546,  546,  453,
			  546,  546,  546,  454,  546,  546,  451,  452,  390,  226,
			  390,  546,  313,  546,  546,  201,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  319,  546,  546,  546,  546,  546,  546,  546,  546,  546, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  320,  391,  228,  391,  546,  313,  546,  546,  201,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  319,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  320,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  462,  462,  462,  462,  546,  546,
			  546,  546,  546,  462,  462,  462,  462,  546,  546,  546,
			  546,  546,  219,  546,  546,  546,  546,  462,  462,  462,
			  546,  546,  220,  473,  473,  473,  546,  546,  546,  546,
			  546,  546,  546,  546,  474,  546,  546,  415,  415,  415,

			  415,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  475,  411,
			  411,  411,  546,  546,  546,  546,  546,  546,  546,  546,
			  412,  546,  546,  416,  416,  416,  416,  546,  546,  546,
			  546,  546,  546,  546,  546,  476,  546,  546,  546,  546,
			  546,  546,  546,  546,  349,  215,  459,  459,  459,  459,
			  546,  546,  546,  546,  546,  546,  497,  498,  546,  546,
			  546,  546,  546,  499,  546,  546,  546,  500,  546,  546,
			  497,  498,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  217,  460,  460,  546,  546,  546,  546,  546,  546, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  219,  546,  546,  501,  546,  546,  546,  546,  546,  546,
			  220,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  217,  461,  461,  461,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  219,
			  546,  546,  502,  546,  546,  546,  546,  546,  546,  220,
			  411,  411,  411,  546,  546,  546,  546,  546,  546,  546,
			  546,  412,  546,  546,  470,  470,  470,  470,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  410,  514,  514,  514,  546,

			  546,  546,  546,  546,  546,  546,  546,  515,  546,  546,
			  477,  477,  477,  477,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  419,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  461,  461,  461,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  219,  546,  546,  502,  546,  546,  546,  546,  546,  546,
			  220,  537,  537,  537,  546,  546,  546,  546,  546,  546,
			  546,  546,  538,  546,  546,  511,  511,  511,  511,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  546,  546,  546,  546,  546,  546,  475,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   67,   67,   67,

			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,  107,  107,  546,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  113,  546,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  133,  133,  546,  546,  546,  546,  133,  546,
			  133,  546,  133,  133,  133,  133,  140,  546,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  140,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  166,  166,  166,  166,  166,  166,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  178,  178,  178,  178,  178,  178,  178,  178,  178,
			  178,  178,  178,  178,  178,  178,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,   89,  546,   89,   89,   89,   89,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,  207,  546,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  214,  546,  214,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  255,  255,  255,  255,  255,  255,  255,  546,  255,
			  255,  255,  255,  255,  255,  255,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  239,  239,  239,  239,  239,  239,  239,  239,  239,
			  239,  239,  239,  239,  239,  239,  215,  546,  215,  215, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  217,  546,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  341,  341,  341,  341,
			  341,  341,  341,  341,  341,  341,  341,  341,  341,  341,
			  341,  342,  342,  342,  342,  342,  342,  342,  342,  342,
			  342,  342,  342,  342,  342,  342,  435,  435,  435,  435,
			  435,  435,  435,  546,  435,  435,  435,  435,  435,  435,
			  435,  140,  546,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  398,  398,  398,  398,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,

			  398,  465,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  529,  529,  529,  529,
			  529,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,   21,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546, yy_Dummy>>,
			1, 178, 3200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 3377)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    3,    3,    3,
			    4,    4,    4,    5,    6,  545,    5,    6,    3,    5,
			    6,    4,    7,    7,    7,    8,    8,    8,  538,    7,
			   13,   13,    8,    9,    9,    9,   10,   10,   10,   11,
			   11,   11,  533,   11,   12,   12,   12,  529,   12,   14,
			   14,   15,   15,   15,   16,   16,   16,   17,   17,   17,

			  528,   17,   18,   18,   18,  515,   18,   19,   19,   20,
			   20,   29,   29,   22,   22,   22,   32,   23,   23,   23,
			   64,   64,   11,   32,   22,  510,   47,   12,   23,   47,
			  507,   17,   22,   37,   22,   37,   18,   24,   24,   24,
			   25,   25,   25,   28,   28,   28,  503,   32,   24,   58,
			   58,   25,   58,   83,   28,   83,   52,   52,   52,   25,
			  496,   25,   26,   52,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   26,   26,   26,   26,   26,   26,   26,   26,   27,   27,
			   27,   27,   81,   27,  490,   27,   66,   66,   27,   27,
			   81,   27,   30,   30,   30,   34,   34,   27,  103,   27,
			   76,   76,   34,   30,   39,   39,   39,   78,   78,   34,
			   34,   27,   87,   30,   27,   39,  489,   35,   35,   35,
			   87,  474,   27,   27,   31,   31,   31,  103,   35,  166,
			  166,   42,   42,   42,   42,   31,   31,   35,   31,   31,
			   31,   31,   33,   33,   33,   56,   56,   56,   97,   36,
			   36,   36,   42,   33,   33,   97,   33,   33,   33,   33,
			   36,  126,  126,   38,   38,   38,   33,   33,   36,   36,

			   68,   68,   68,   33,   38,   63,   63,   33,   63,   97,
			   33,   33,  126,   38,   40,   40,   40,   41,   41,   41,
			   44,   44,   44,   70,   70,   40,   70,  133,   41,   75,
			   75,   44,   75,   45,   45,   45,   49,   49,   49,  133,
			  450,   82,  118,   40,   45,  140,  447,   49,  140,   82,
			   41,   82,  118,  168,  168,   40,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   50,   50,   59,   59,   59,  444,   59,   61,   61,   61,
			  139,   61,   71,   71,   71,   79,   71,   73,   73,   73,
			  139,   73,  100,   79,  192,   79,  100,   84,   84,   84,
			   86,   86,   86,   89,  192,  100,   89,   79,   84,   93,
			  148,   86,   93,  148,  130,   59,   71,   91,   91,   91,
			   61,   73,   88,   88,   88,  588,   88,  588,   91,   88,
			   88,   89,   88,  127,  127,  127,  130,   93,   88,  210,
			   88,   89,   96,  210,   99,   96,   98,   93,   99,   98,
			   96,   88,   88,  437,  127,   88,   99,   99,   99,  182,
			  182,   88,   98,   88,   88,   90,   90,   90,  196,   90,

			   96,  434,   90,   90,   98,   90,  110,  110,  110,  215,
			   96,   90,  215,   90,   98,  196,  101,  110,  289,  101,
			  107,  107,  107,  239,   90,   90,  289,  107,   90,  184,
			  184,  107,  101,  239,   90,  431,   90,   90,   92,  292,
			   92,   92,   92,   92,  101,   92,  209,  292,   92,   92,
			  209,   92,  156,  156,  101,  156,  222,   92,  209,   92,
			  209,  111,  111,  111,  222,  107,  222,  117,  117,  117,
			   92,   92,  111,  429,   92,  109,  109,  109,  117,  426,
			   92,  134,   92,   92,   94,  134,  109,   94,   94,   94,
			  146,  146,  146,   94,  109,  134,  109,  134,  318,   94, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  214,   94,  318,   94,   94,   94,  333,  424,   94,   94,
			  158,  158,   94,  158,  333,  119,  119,  119,  121,  121,
			  121,  421,   94,   95,   95,   95,  119,   95,  214,  121,
			   95,   95,  235,   95,  136,  136,  136,  136,  214,   95,
			  235,   95,  235,  137,  137,  137,  141,  141,  141,  149,
			  149,  149,  149,   95,  137,  136,   95,  141,  154,  154,
			  154,  165,  165,  165,   95,   95,  102,  102,  102,  378,
			  102,  418,  165,  102,  151,  151,  151,  378,  160,  160,
			  160,  151,  160,  161,  161,  161,  246,  161,  162,  162,
			  457,  162,  164,  164,  274,  164,  246,  294,  102,  170,

			  170,  170,  172,  172,  274,  172,  412,  294,  102,  104,
			  104,  104,  457,  104,  174,  174,  104,  174,  295,  178,
			  178,  160,  178,  229,  229,  229,  161,  176,  176,  176,
			  401,  176,  177,  177,  177,  295,  177,  180,  180,  341,
			  180,  104,  590,  193,  590,  181,  181,  181,  462,  341,
			  193,  104,  106,  106,  106,  106,  181,  106,  193,  106,
			  193,  176,  106,  106,  379,  106,  177,  186,  186,  186,
			  462,  106,  379,  106,  242,  242,  242,  242,  186,  187,
			  187,  187,  188,  188,  188,  106,  186,  400,  106,  270,
			  187,  389,  270,  188,  261,  261,  106,  106,  108,  108, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  108,  108,  386,  108,  270,  108,  342,  373,  108,  108,
			  373,  108,  189,  189,  189,  261,  342,  108,  190,  190,
			  190,  384,  310,  189,  191,  191,  191,  374,  374,  190,
			  310,  108,  310,  380,  108,  191,  194,  194,  194,  276,
			  276,  276,  108,  108,  120,  120,  120,  194,  365,  197,
			  198,  361,  197,  198,  357,  120,  197,  198,  120,  120,
			  120,  120,  217,  396,  197,  217,  197,  198,  346,  353,
			  120,  396,  202,  202,  202,  206,  206,  206,  346,  120,
			  124,  124,  124,  202,  397,  337,  206,  213,  213,  213,
			  217,  124,  397,  335,  124,  124,  124,  124,  213,  331,

			  217,  231,  231,  231,  402,  402,  124,  129,  129,  129,
			  305,  314,  231,  305,  240,  240,  240,  305,  129,  422,
			  422,  129,  129,  129,  129,  240,  243,  243,  243,  219,
			  219,  219,  312,  219,  220,  220,  220,  243,  220,  245,
			  245,  245,  129,  135,  135,  135,  252,  252,  252,  252,
			  245,  230,  230,  230,  135,  451,  451,  135,  135,  135,
			  135,  219,  230,  247,  247,  247,  220,  252,  494,  494,
			  230,  219,  230,  591,  247,  591,  220,  307,  135,  195,
			  469,  303,  195,  195,  195,  263,  263,  263,  195,  494,
			  233,  233,  233,  302,  195,  368,  195,  233,  195,  195, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  195,  233,  469,  195,  195,  368,  263,  195,  493,  299,
			  236,  236,  236,  237,  237,  237,  536,  195,  199,  199,
			  199,  236,  199,  398,  237,  199,  238,  238,  238,  236,
			  493,  236,  237,  398,  237,  233,  382,  238,  536,  382,
			  253,  253,  253,  382,  594,  238,  594,  238,  251,  251,
			  199,  253,  251,  251,  251,  251,  275,  275,  275,  275,
			  199,  200,  200,  200,  407,  200,  259,  259,  200,  287,
			  259,  259,  259,  259,  407,  264,  264,  264,  268,  268,
			  268,  273,  273,  273,  296,  285,  264,  296,  282,  268,
			  268,  296,  273,  200,  278,  278,  278,  278,  278,  296,

			  280,  296,  409,  200,  205,  272,  205,  205,  205,  205,
			  264,  205,  409,  267,  205,  205,  278,  205,  293,  293,
			  293,  297,  445,  205,  297,  205,  265,  304,  297,  293,
			  304,  317,  445,  257,  304,  317,  205,  205,  297,  254,
			  205,  464,  304,  317,  304,  317,  205,  250,  205,  205,
			  207,  464,  207,  248,  207,  497,  497,  207,  308,  308,
			  308,  207,  313,  313,  313,  315,  315,  315,  465,  308,
			  322,  322,  244,  313,  241,  224,  315,  322,  465,  323,
			  323,  323,  207,  323,  322,  322,  324,  324,  324,  223,
			  324,  440,  207,  221,  204,  207,  208,  208,  208,  440, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  208,  440,  201,  208,  208,  144,  208,  142,  336,  336,
			  336,  323,  208,  138,  208,  375,  375,  375,  324,  336,
			  132,  323,  128,  327,  327,  327,  208,  123,  324,  208,
			  343,  343,  343,  343,  327,  486,  116,  208,  208,  211,
			  211,  211,  327,  211,  327,  486,  211,  329,  329,  329,
			  211,  338,  338,  338,  350,  350,  350,  350,  329,  369,
			  369,  369,  338,  403,  403,  403,  329,  115,  329,  114,
			  369,  211,  340,  340,  340,  340,  340,  362,  362,  362,
			  505,  211,  113,  443,  211,  212,  212,  212,  362,  212,
			  505,  443,  212,  443,  340,  112,  212,  348,  348,   85,

			   46,  348,  348,  348,  348,  349,  349,  349,  349,  363,
			  363,  363,  362,  377,  377,  377,  377,  212,  516,  518,
			  363,  372,  372,  372,  372,  372,  349,  212,  516,  518,
			  212,  216,  216,  216,  377,  216,  521,   21,  216,  216,
			  524,  216,    0,  372,  363,    0,  521,  216,  381,  216,
			  524,  381,  427,  427,  427,  381,  387,  387,  387,  387,
			  216,  216,    0,  381,  216,  381,  392,    0,  393,    0,
			  216,    0,  216,  216,  218,    0,  392,  392,  393,  393,
			  393,  399,  399,  399,  218,  218,  218,  218,  406,  406,
			  406,    0,  399,  526,  392,  541,  393,    0,  395,  406, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  508,  508,  218,  526,  392,  541,  393,    0,    0,  395,
			  395,    0,  218,  225,  225,  225,  395,  225,  531,  531,
			  225,  508,    0,  395,  395,  405,  405,  405,  405,  408,
			  408,  408,  410,  410,  410,  410,    0,  413,  413,  531,
			  408,  413,  413,  413,  413,  225,  405,  414,  414,  414,
			  414,    0,  568,  410,  568,  225,  227,  227,  227,    0,
			  227,    0,  568,  227,  419,  419,  419,  419,  432,  432,
			  432,  438,  438,  438,  438,    0,  439,  439,    0,  432,
			  439,  439,  439,  439,  575,  419,  575,    0,  227,  575,
			    0,  441,  441,  441,  446,  446,  446,    0,  227,  258,

			  258,  258,  441,  432,    0,  446,  452,  452,  452,    0,
			  258,    0,    0,  258,  258,  258,  258,  448,  448,  448,
			    0,  448,  455,  455,  455,  258,  543,  543,  448,    0,
			  454,  454,  454,  454,  258,  260,  260,  260,  456,  456,
			  456,  456,    0,  581,  455,  581,  260,  543,  581,  260,
			  260,  454,  459,  459,  459,  459,  459,    0,    0,  448,
			  456,  467,  467,  467,  463,  463,  463,  466,  466,  466,
			  260,  262,  262,  262,  459,  463,    0,    0,  466,  481,
			  481,  481,  262,  467,    0,  262,  262,  262,  468,  468,
			  468,  468,  471,  471,  471,  471,  472,  472,  472,  472, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  475,  475,  475,  475,    0,    0,  262,  269,    0,  269,
			  468,  269,    0,  269,    0,    0,  269,  269,    0,  269,
			    0,  475,  476,  476,    0,  269,  476,  476,  476,  476,
			  479,  479,  479,  479,  480,  480,  480,  480,    0,  269,
			    0,    0,  269,  484,  484,  484,  482,  482,  482,    0,
			  269,  269,  277,  277,  277,  277,  277,  482,  483,  483,
			  483,    0,    0,  277,  277,  482,    0,  482,    0,  483,
			  277,  485,  485,  485,  277,    0,    0,  277,  277,  300,
			  300,  300,  485,  300,    0,    0,  300,  300,    0,  300,
			  487,  487,  487,    0,  487,  300,    0,  300,  495,  495,

			  495,  487,    0,  491,  491,  491,    0,    0,  300,  300,
			    0,    0,  300,  492,  492,  492,  492,  501,  300,  495,
			  300,  300,  309,    0,  309,  491,  309,  501,  501,  309,
			    0,    0,  487,  309,    0,  492,  498,  498,  498,  500,
			  500,  500,  500,    0,    0,  501,    0,    0,  501,    0,
			  504,  504,  504,    0,  309,  501,  509,  509,  509,    0,
			  500,  504,    0,    0,  309,    0,    0,  309,  316,  316,
			  316,    0,  316,    0,    0,  316,  316,  509,  316,  512,
			  512,  512,  512,    0,  316,    0,  316,  513,  513,  513,
			  513,  517,  517,  517,  519,  519,  519,    0,  316,    0, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  316,  517,    0,    0,  519,  520,  520,  520,  316,
			  316,  319,  319,  319,    0,  319,    0,  520,  319,  522,
			  522,  522,  523,  523,  523,  525,  525,  525,    0,    0,
			  522,    0,    0,  523,    0,    0,  525,  527,  527,  527,
			  530,  530,  530,  319,  530,  532,  532,  532,  527,    0,
			    0,  530,    0,  319,  320,  320,  320,    0,  320,    0,
			    0,  320,  534,  534,  534,    0,  532,  535,  535,  535,
			  535,  544,  544,  544,  556,  556,    0,    0,  556,    0,
			  556,    0,  530,  556,  534,    0,  320,    0,  556,  535,
			    0,  572,  544,  572,  572,    0,  320,  321,  572,  572,

			    0,  572,    0,    0,    0,    0,  321,  321,  321,  321,
			  321,    0,  577,    0,  577,  577,    0,  321,  321,  577,
			  577,    0,  577,    0,  321,  321,    0,    0,  321,    0,
			    0,  321,  321,    0,    0,  321,  339,  339,  339,  339,
			  339,    0,  582,    0,  582,  582,    0,  339,  339,  582,
			  582,    0,  582,    0,  339,    0,    0,    0,  339,    0,
			    0,  339,  339,  344,  344,  344,    0,  559,  559,    0,
			    0,  559,    0,  559,  344,    0,  559,  344,  344,  344,
			  344,  559,  585,  585,    0,    0,    0,    0,  585,    0,
			  585,    0,  585,    0,    0,  585,    0,    0,  344,  345, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  345,  345,    0,    0,    0,    0,    0,    0,    0,    0,
			  345,    0,    0,  345,  345,  345,  345,    0,    0,    0,
			    0,    0,    0,    0,    0,  345,    0,    0,    0,    0,
			    0,    0,    0,    0,  345,  351,  351,  351,    0,    0,
			    0,    0,    0,    0,    0,    0,  351,    0,    0,  351,
			  351,  351,  351,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  351,  354,  354,  354,    0,    0,    0,    0,    0,    0,
			    0,    0,  354,    0,    0,  354,  354,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,  354,  355,  355,  355,
			    0,    0,    0,    0,    0,    0,    0,    0,  355,    0,
			    0,  355,  355,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  355,  358,  358,  358,    0,    0,    0,    0,
			    0,    0,    0,    0,  358,    0,    0,  358,  358,  358,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  358,  359,
			  359,  359,    0,    0,    0,    0,    0,    0,    0,    0,
			  359,    0,    0,  359,  359,  359,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  359,  366,  366,  366,    0,    0,
			    0,    0,    0,    0,    0,    0,  366,    0,    0,  366,
			  366,  366,  366,    0,    0,    0,    0,    0,    0,    0,
			    0,  366,  367,  367,  367,  367,    0,  367,    0,  367,
			    0,    0,  367,  367,    0,  367,    0,    0,    0,    0,
			    0,  367,    0,  367,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  367,    0,    0,  367,    0,
			    0,    0,    0,    0,    0,    0,  367,  367,  370,  370,
			  370,    0,  370,    0,    0,    0,    0,    0,    0,  370,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  370,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  370,
			  370,  371,  371,  371,  371,  371,    0,    0,    0,    0,
			    0,    0,  371,  371,    0,    0,    0,    0,    0,  371,
			    0,    0,    0,  371,    0,    0,  371,  371,  390,  390,
			  390,    0,  390,    0,    0,  390,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  390,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  390,  391,  391,  391,    0,  391,    0,    0,  391,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  391,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  391,  394,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  394,  394,  394,  394,    0,    0,
			    0,    0,    0,  394,  394,  394,  394,    0,    0,    0,
			    0,    0,  394,    0,    0,    0,    0,  394,  394,  394,
			    0,    0,  394,  415,  415,  415,    0,    0,    0,    0,
			    0,    0,    0,    0,  415,    0,    0,  415,  415,  415,

			  415,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  415,  416,
			  416,  416,    0,    0,    0,    0,    0,    0,    0,    0,
			  416,    0,    0,  416,  416,  416,  416,    0,    0,    0,
			    0,    0,    0,    0,    0,  416,    0,    0,    0,    0,
			    0,    0,    0,    0,  416,  458,  458,  458,  458,  458,
			    0,    0,    0,    0,    0,    0,  458,  458,    0,    0,
			    0,    0,    0,  458,    0,    0,    0,  458,    0,    0,
			  458,  458,  460,    0,    0,    0,    0,    0,    0,    0,
			    0,  460,  460,  460,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  460,    0,    0,  460,    0,    0,    0,    0,    0,    0,
			  460,  461,    0,    0,    0,    0,    0,    0,    0,    0,
			  461,  461,  461,  461,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  461,
			    0,    0,  461,    0,    0,    0,    0,    0,    0,  461,
			  470,  470,  470,    0,    0,    0,    0,    0,    0,    0,
			    0,  470,    0,    0,  470,  470,  470,  470,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  470,  477,  477,  477,    0,

			    0,    0,    0,    0,    0,    0,    0,  477,    0,    0,
			  477,  477,  477,  477,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  477,  502,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  502,  502,  502,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  502,    0,    0,  502,    0,    0,    0,    0,    0,    0,
			  502,  511,  511,  511,    0,    0,    0,    0,    0,    0,
			    0,    0,  511,    0,    0,  511,  511,  511,  511,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,  511,  547,  547,  547,
			  547,  547,  547,  547,  547,  547,  547,  547,  547,  547,
			  547,  547,  548,  548,  548,  548,  548,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  548,  549,  549,  549,
			  549,  549,  549,  549,  549,  549,  549,  549,  549,  549,
			  549,  549,  550,  550,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  550,  550,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  552,  552,  552,  552,  552,  552,  552,  552,
			  552,  552,  552,  552,  552,  552,  552,  553,  553,  553,

			  553,  553,  553,  553,  553,  553,  553,  553,  553,  553,
			  553,  553,  554,  554,  554,  554,  554,  554,  554,  554,
			  554,  554,  554,  554,  554,  554,  554,  555,  555,  555,
			  555,  555,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  555,  557,  557,    0,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  558,    0,  558,
			  558,  558,  558,  558,  558,  558,  558,  558,  558,  558,
			  558,  558,  560,  560,    0,    0,    0,    0,  560,    0,
			  560,    0,  560,  560,  560,  560,  561,    0,  561,  561,
			  561,  561,  561,  561,  561,  561,  561,  561,  561,  561, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  561,  562,  562,  562,  562,  562,  562,  562,  562,  562,
			  562,  562,  562,  562,  562,  562,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  564,  564,  564,  564,  564,  564,  564,  564,  564,
			  564,  564,  564,  564,  564,  564,  565,  565,  565,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  567,  567,  567,  567,
			  567,  567,  567,  567,  567,  567,  567,  567,  567,  567,
			  567,  569,    0,  569,  569,  569,  569,  569,  569,  569,

			  569,  569,  569,  569,  569,  569,  570,    0,  570,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  571,    0,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  573,  573,  573,  573,
			  573,  573,  573,  573,  573,  573,  573,  573,  573,  573,
			  573,  574,  574,  574,  574,  574,  574,  574,    0,  574,
			  574,  574,  574,  574,  574,  574,  576,  576,  576,  576,
			  576,  576,  576,  576,  576,  576,  576,  576,  576,  576,
			  576,  578,  578,  578,  578,  578,  578,  578,  578,  578,
			  578,  578,  578,  578,  578,  578,  579,    0,  579,  579, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  580,    0,  580,  580,  580,  580,  580,  580,  580,
			  580,  580,  580,  580,  580,  580,  583,  583,  583,  583,
			  583,  583,  583,  583,  583,  583,  583,  583,  583,  583,
			  583,  584,  584,  584,  584,  584,  584,  584,  584,  584,
			  584,  584,  584,  584,  584,  584,  586,  586,  586,  586,
			  586,  586,  586,    0,  586,  586,  586,  586,  586,  586,
			  586,  587,    0,  587,  587,  587,  587,  587,  587,  587,
			  587,  587,  587,  587,  587,  587,  589,  589,  589,  589,
			  589,  589,  589,  589,  589,  589,  589,  589,  589,  589,

			  589,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  593,  593,  593,  593,
			  593,  593,  593,  593,  593,  593,  593,  593,  593,  593,
			  593,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546, yy_Dummy>>,
			1, 178, 3200)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 594)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   46,   49,   51,   52,   61,   64,   72,
			   75,   78,   83,   68,   87,   90,   93,   96,  101,  105,
			  107, 1337,  112,  116,  136,  139,  161,  207,  142,  103,
			  221,  253,  102,  271,  200,  246,  278,  113,  292,  233,
			  313,  316,  246, 3331,  319,  332, 1288,  121, 3331,  335,
			  355, 3331,  155, 3331, 3331, 3331,  274, 3331,  147,  401,
			 3331,  406, 3331,  303,  118, 3331,  214, 3331,  299, 3331,
			  321,  411, 3331,  416, 3331,  327,  228, 3331,  235,  403,
			 3331,  200,  329,  133,  426, 1287,  429,  230,  448,  428,
			  491,  446,  537,  434,  579,  619,  467,  264,  471,  466,

			  414,  511,  665,  223,  708, 3331,  751,  519,  797,  574,
			  505,  560, 1283, 1273, 1255, 1258, 1202,  566,  340,  614,
			  843,  617, 3331, 1215,  879,    0,  276,  448, 1186,  906,
			  432, 3331, 1208,  297,  555,  942,  619,  642, 1201,  408,
			  340,  645, 1193, 3331, 1193, 3331,  589, 3331,  435,  634,
			 3331,  673, 3331, 3331,  657, 3331,  550, 3331,  608, 3331,
			  677,  682,  686, 3331,  690,  660,  257, 3331,  351, 3331,
			  698, 3331,  700, 3331,  712, 3331,  726,  731,  717, 3331,
			  735,  744,  487, 3331,  527, 3331,  766,  778,  781,  811,
			  817,  823,  422,  738,  835,  974,  493,  844,  845, 1017, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1060, 1194,  871, 3331, 1182, 1103,  874, 1149, 1192,  538,
			  461, 1238, 1284,  886,  595,  504, 1327,  857, 1369,  928,
			  933, 1185,  544, 1181, 1167, 1412, 3331, 1455, 3331,  722,
			  950,  900, 3331,  989, 3331,  620, 1009, 1012, 1025,  521,
			  913, 1165,  759,  925, 1160,  938,  684,  962, 1141, 3331,
			 1135, 1037,  931, 1039, 1127, 3331, 3331, 1121, 1498, 1055,
			 1534,  779, 1570,  970, 1074, 1090, 3331, 1101, 1077, 1605,
			  762, 3331, 1093, 1080,  692, 1041,  838, 1638, 1080, 3331,
			 1088, 3331, 1076, 3331, 3331, 1073, 3331, 1057, 3331,  506,
			 3331, 3331,  527, 1117,  695,  713, 1079, 1116, 3331,  997,

			 1675, 3331,  981,  976, 1122,  905, 3331,  965, 1157, 1721,
			  810, 3331,  920, 1161,  897, 1164, 1764, 1123,  590, 1810,
			 1853, 1892, 1145, 1178, 1185, 3331, 3331, 1222, 3331, 1246,
			 3331,  887, 3331,  594, 3331,  881, 1207,  873, 1250, 1922,
			 1258,  737,  804, 1215, 1962, 1998,  866, 3331, 1286, 1290,
			 1239, 2034, 3331,  857, 2070, 2106, 3331,  842, 2142, 2178,
			 3331,  839, 1276, 1308, 3331,  836, 2214, 2241,  993, 1258,
			 2287, 2317, 1307,  802,  812, 1200,    0, 1298,  657,  752,
			  828, 1343, 1031, 3331,  809, 3331,  790, 1341, 3331,  779,
			 2357, 2400, 1361, 1363, 2439, 1384,  851,  872, 1021, 1380, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  775,  721,  889, 1248,    0, 1410, 1387, 1062, 1428, 1100,
			 1417, 3331,  694, 1426, 1432, 2482, 2518, 3331,  659, 1449,
			 3331,  609,  904, 3331,  595, 3331,  567, 1337, 3331,  561,
			 3331,  523, 1467, 3331,  489, 3331, 3331,  471, 1456, 1465,
			 1179, 1490,    0, 1271,  393, 1120, 1493,  334, 1516, 3331,
			  328,  940, 1491,    0, 1515, 1508, 1524,  676, 2541, 1538,
			 2577, 2616,  734, 1563, 1139, 1166, 1566, 1547, 1574,  966,
			 2659, 1577, 1581, 3331,  239, 1585, 1611, 2695, 3331, 1615,
			 1619, 1578, 1645, 1657, 1642, 1670, 1233, 1689, 3331,  234,
			  212, 1689, 1699,  994,  953, 1683,  124, 1140, 1721,    0,

			 1724, 1712, 2727,  110, 1749, 1278, 3331,  118, 1385, 1741,
			   89, 2770, 1764, 1772, 3331,   93, 1316, 1790, 1317, 1793,
			 1805, 1334, 1818, 1821, 1338, 1824, 1391, 1836,   88,   85,
			 1839, 1403, 1830,   46, 1848, 1853, 1002, 3331,   56,    0,
			    0, 1393, 3331, 1511, 1856,   19, 3331, 2806, 2821, 2836,
			 2851, 2866, 2881, 2896, 2911, 2926, 1873, 2941, 2956, 1966,
			 2971, 2985, 3000, 3015, 3030, 3045, 3060, 3075, 1447, 3090,
			 3105, 3120, 1888, 3135, 3150, 1475, 3165, 1909, 3180, 3195,
			 3210, 1534, 1939, 3225, 3240, 1981, 3255, 3270,  446, 3285,
			  733,  964, 3300, 3315, 1035, yy_Dummy>>,
			1, 195, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 594)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  546,    1,  547,  547,  548,  548,  549,  549,  550,
			  550,  551,  551,  552,  552,  553,  553,  554,  554,  555,
			  555,  546,  556,  546,  546,  556,  546,  557,  546,  558,
			  559,  546,   25,  546,   33,  546,  559,   36,  546,  560,
			  560,   25,  546,  546,  546,  546,  546,  561,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  562,  562,
			  546,  562,  546,  563,  564,  546,  564,  546,  546,  546,
			  565,  565,  546,  565,  546,  566,  567,  546,  567,   41,
			  546,  568,  568,   82,  546,  546,  546,  568,  569,  569,
			  569,  546,  570,  569,  571,   90,  569,   90,  569,   95,

			   95,  569,  569,   90,  569,  546,  557,  557,  557,  108,
			  108,  546,  546,  546,  572,  546,   41,  546,  573,  546,
			  546,   79,  546,  546,  574,   34,  546,  546,  575,  546,
			   41,  546,  546,   40,   40,  546,  546,  546,  546,  576,
			  561,  546,  577,  546,  546,  546,  546,  546,  561,  546,
			  546,  546,  546,  546,  546,  546,  562,  546,  562,  546,
			  562,  562,  563,  546,  563,  546,  564,  546,  564,  546,
			  546,  546,  565,  546,  565,  546,  565,  565,  566,  546,
			  566,  546,  567,  546,  567,  546,  568,   82,  186,   25,
			  189,  190,  578,   90,  546,  571,   95,   95,   95,  569, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  569,  195,  546,  546,  546,  570,  546,  570,  205,  208,
			  208,  570,  570,  546,  571,  579,  580,  580,  571,  571,
			  571,  195,   90,  195,  195,  569,  546,  569,  546,  108,
			  108,  108,  546,  557,  546,  106,  106,  106,  106,  578,
			  546,  546,  546,  546,  546,  546,  573,  546,  546,  546,
			  546,  546,  546,  546,  186,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  575,  581,  546,  546,  129,  578,
			   40,  546,  546,  546,  576,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  190,  546,  190,  546,  568,
			  546,  546,  568,  546,  578,   95,   95,   95,  546,  546,

			  580,  546,  546,  208,  208,  208,  546,  546,  546,  570,
			  205,  546,  546,  546,  582,  546,  300,  316,  316,  580,
			  580,  571,  321,  571,  571,  546,  546,  106,  546,  106,
			  546,  108,  546,  568,  546,  108,  546,  546,  546,  546,
			  546,  583,  584,  546,  546,  546,  584,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  585,  581,  546,  546,  586,  578,  578,  367,
			   40,  546,  546,  587,  546,  546,  588,  546,  568,  568,
			  316,  316,  316,  546,  546,  546,  546,  546,  546,  546,
			  580,  580,  571,  571,  571,  321,  568,  568,  589,  546, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  546,  546,  546,  546,  590,  546,  546,  583,  546,  584,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  260,  546,  546,  546,  546,  262,  546,  546,
			  546,  546,  585,  546,  546,  546,  546,  546,  416,  546,
			  367,  546,  269,  269,  269,  578,  546,  269,  546,  546,
			  546,  546,  546,  591,  546,  546,  546,  588,  546,  546,
			  571,  571,  394,  546,  589,  592,  546,  546,  546,  590,
			  546,  546,  470,  546,  546,  546,  546,  546,  546,  546,
			  477,  269,  269,  269,  367,  367,  578,  546,  546,  546,
			  593,  546,  546,  591,  546,  546,  588,  546,  546,  594,

			  546,  571,  571,  394,  546,  592,  546,  546,  546,  546,
			  590,  546,  546,  511,  546,  546,  578,  546,  578,  546,
			  367,  578,  546,  367,  578,  546,  578,  546,  269,  593,
			  546,  546,  546,  591,  546,  546,  594,  546,  546,  269,
			  269,  578,  546,  546,  546,  594,    0,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546, yy_Dummy>>,
			1, 195, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (46, 200, 5759)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (46, 5960, 8191)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (46, 8392, 12287)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   46,   46,   46,   46,   46,   46,   46,   46,    1,
			    2,    1,    1,    3,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,    6,   24,   25,   26,   24,   27,
			   24,   28,   29,   28,   28,   28,   29,   28,   30,   31,
			   28,   29,   29,   29,   29,   29,   29,   28,   32,   28,
			   28,   33,   34,   35,    4,   36,   37,   38,   39,   40,

			   38,   27,   38,   28,   41,   28,   28,   28,   41,   28,
			   42,   31,   28,   41,   41,   41,   41,   41,   41,   28,
			   32,   28,   28,   43,    6,   44,   45,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			    1,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46, yy_Dummy>>,
			1, 200, 5760)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,    1,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,    1,   46,   46,   46,   46,

			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46, yy_Dummy>>,
			1, 200, 8192)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   46,   46, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,   15,    3,   15,    4,    5,    6,
			    6,   15,    7,    8,    5,    9,    9,    9,    9,    4,
			    5,    4,   10,    4,   11,   11,   11,    9,   12,   13,
			   13,   12,   12,    4,   15,    4,   14,   15,    9,    9,
			    9,   12,   12,    4,    4,   15,   15, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 547)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    6,   10,   13,   18,   21,   27,   30,
			   33,   36,   39,   44,   48,   52,   55,   58,   61,   64,
			   68,   72,   76,   78,   80,   84,   87,   89,   91,   93,
			   96,   98,  100,  102,  104,  107,  109,  111,  113,  115,
			  117,  119,  121,  124,  126,  128,  130,  132,  134,  136,
			  138,  140,  142,  144,  146,  149,  151,  153,  155,  157,
			  159,  160,  160,  160,  160,  162,  162,  165,  165,  166,
			  167,  168,  172,  173,  174,  174,  175,  176,  177,  178,

			  179,  180,  181,  183,  184,  186,  188,  192,  194,  195,
			  197,  199,  201,  201,  202,  202,  204,  206,  207,  208,
			  209,  213,  216,  217,  217,  218,  220,  220,  220,  220,
			  222,  224,  225,  225,  227,  229,  231,  231,  233,  233,
			  234,  235,  237,  237,  238,  238,  239,  240,  241,  243,
			  245,  247,  247,  248,  249,  249,  250,  250,  251,  251,
			  252,  252,  252,  252,  254,  254,  257,  257,  258,  258,
			  260,  260,  261,  261,  262,  262,  263,  263,  263,  263,
			  265,  265,  268,  268,  269,  269,  271,  272,  274,  276,
			  279,  281,  284,  286,  287,  295,  295,  296,  297,  298, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  300,  302,  302,  312,  314,  314,  315,  325,  326,  327,
			  328,  329,  331,  333,  339,  339,  340,  341,  342,  342,
			  343,  344,  344,  345,  345,  345,  346,  347,  348,  349,
			  351,  355,  359,  360,  361,  362,  366,  371,  374,  379,
			  380,  381,  382,  383,  385,  385,  386,  387,  389,  389,
			  391,  391,  391,  391,  394,  395,  396,  398,  399,  403,
			  403,  405,  405,  407,  407,  409,  409,  410,  410,  412,
			  413,  415,  416,  416,  417,  418,  418,  418,  419,  420,
			  421,  421,  422,  422,  423,  424,  426,  427,  429,  431,
			  431,  433,  435,  435,  436,  437,  438,  439,  440,  444,

			  444,  445,  450,  450,  451,  452,  453,  458,  458,  464,
			  465,  466,  469,  469,  471,  471,  475,  476,  477,  478,
			  480,  482,  482,  482,  482,  482,  484,  486,  489,  491,
			  494,  497,  498,  501,  502,  505,  506,  508,  508,  509,
			  510,  511,  512,  513,  513,  517,  519,  521,  522,  522,
			  522,  522,  526,  527,  527,  529,  531,  532,  532,  534,
			  536,  537,  537,  539,  541,  542,  542,  543,  546,  548,
			  552,  554,  554,  554,  556,  556,  556,  556,  556,  557,
			  558,  559,  560,  561,  564,  564,  565,  565,  565,  567,
			  567,  568,  569,  569,  569,  569,  569,  571,  573,  574, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  576,  576,  577,  577,  577,  577,  577,  578,  579,  580,
			  581,  581,  582,  582,  582,  582,  590,  592,  594,  594,
			  594,  595,  595,  597,  598,  598,  599,  599,  601,  602,
			  602,  603,  603,  605,  606,  606,  607,  609,  610,  612,
			  612,  615,  617,  618,  619,  620,  623,  626,  627,  628,
			  629,  629,  629,  629,  629,  629,  630,  631,  632,  632,
			  632,  632,  632,  632,  633,  634,  635,  637,  638,  639,
			  640,  642,  642,  644,  648,  648,  648,  648,  650,  651,
			  651,  653,  655,  658,  661,  664,  668,  671,  671,  673,
			  673,  674,  674,  674,  674,  674,  674,  674,  674,  674,

			  674,  674,  674,  674,  674,  675,  676,  677,  677,  677,
			  677,  677,  681,  681,  685,  686,  686,  688,  690,  692,
			  694,  697,  699,  701,  704,  707,  710,  713,  716,  717,
			  717,  717,  717,  717,  717,  717,  717,  717,  719,  719,
			  721,  723,  726,  727,  727,  727,  727,  727, yy_Dummy>>,
			1, 148, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 726)
			yy_acclist_template_1 (an_array)
			yy_acclist_template_2 (an_array)
			yy_acclist_template_3 (an_array)
			yy_acclist_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_acclist_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    0,  129,   16,  127,  128, -148,  122,  123,  127,  128,
			  122,  123,  128,    1,   16,  127,  128, -148,   69,  127,
			  128,   13,   16,  127,  128, -143, -148,    1,  127,  128,
			   32,  127,  128,    1,  127,  128,    1,  127,  128,    1,
			   16,  127,  128, -148,   84,  127,  128, -213,   84,  127,
			  128, -213,    1,  127,  128,    1,  127,  128,    1,  127,
			  128,    1,  127,  128,   11,  127,  128, -140,   11,  127,
			  128, -140,   16,  127,  128, -148,  127,  128,  126,  128,
			  124,  125,  126,  128,  124,  125,  128,  126,  128,   75,
			  128,   80,  128,   76,  128, -205,   79,  128,   83,  128,

			   83,  128,   82,  128,   81,   83,  128,   45,  128,   45,
			  128,   44,  128,   51,  128,   51,  128,   50,  128,   51,
			  128,   48,   51,  128,   51,  128,   54,  128,   53,  128,
			   54,  128,   57,  128,   57,  128,   56,  128,   63,  128,
			   63,  128,   62,  128,   63,  128,   60,   63,  128,   63,
			  128,   66,  128,   65,  128,   66,  128,   16, -148,  -20,
			  122,  123,    2,    3,  -20,   69,   69,   69,   41,   67,
			 -170, -196,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69, -183,   69,   69, -171,  -15,  -20,   13,   16,
			 -143, -148,   13, -143,   13,   13, -143,   13, -143,    2, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    3,   32,   31,   32,   16, -148,    2,  123,    5,  115,
			  121, -240, -246,    5,   16, -148,  -85, -238,   84, -213,
			   90, -219,   16, -148,  -12,   11, -140,   11, -140,   88,
			 -217,  124,  125,  125,   75,   76, -205,  -77,   78,   78,
			   70,   75,   78,   73,   78,   74,   78,   82,   81,   44,
			   50,   48,   49,   50,   46,   48, -175,   53,   52,   53,
			   56,   62,   60,   61,   62,   58,   60, -187,   65,   64,
			   65,   16,   16, -147,   16, -146,   16, -147, -148,   16,
			 -148,   16, -146, -148,    3,  -20,   69,   36,   39,   41,
			   67, -166, -168, -170, -196,   69,   69,   69,   69, -183,

			   69, -171,   33,   36,   39,   41,   67, -162, -166, -168,
			 -170, -196,  -42,  -68,   69,   35,   36,   39,   41,   67,
			 -165, -166, -168, -170, -196,   69,   69,   69,   69,   69,
			 -183,   69, -171,   33,   41,   67, -162, -170, -196,   69,
			   69,   69, -183, -171,   69,   69,  -55,   69,  -43,   13,
			   16,   13,   16, -143, -147,   13,   16, -143, -146,  -15,
			   13,   14,   13,   16, -143, -148,   13,   16, -143, -147,
			 -148,   13,   16, -148,   13,   16, -143, -146, -148,    3,
			   21,   32,   30,    2,    4,  123,  123,    6,    7, -112,
			 -118,    6,    7,  -20,   16,  113, -110,  113,  113,  115, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  121, -240, -246,  104, -233,   98, -227,   92, -221,  -91,
			   86, -215,    3,   11, -140,  -89,  125,  125,   72,   72,
			  -47,  -59,   17,  -19,   16, -148,  -18,   16, -148,  -19,
			  -20,   17,  -20,  -18,  -20,    3,    3,   69,   69,   69,
			  -38,  -40,  -42,  -68,   69,  -34,  -38,  -40,  -42,  -68,
			   69,   69,   69,  -37,  -38,  -40,  -42,  -68,   35,   41,
			   67, -165, -170, -196,   69,   69,  -34,  -42,  -68,   67,
			 -196,   39,   67, -168, -196,   69,   69,   69,   69, -183,
			   69, -171,   14,   17,  -15,  -19,   13,   16, -148,  -15,
			  -18,   13,   16, -148,  -15,  -19,  -20,   13,   14,   17,

			  -20,  -15,  -15,  -18,  -20,   13,   22,   23,   24,   29,
			   29,    4,    7,  115,  121, -240, -246,  121, -246,    7,
			  -20, -110,  114,  120, -239, -245, -105,  108, -237,  106,
			 -235,  -99,  102, -231,  100, -229,  -93,   96, -225,   94,
			 -223,  -87, -244,    3,   16, -148,    3,  -20,    3,   16,
			 -147, -148,   11, -140,   71,   75,  -19,  -18,   69,   69,
			   69,  -37,  -42,  -68,  -68,  -40,  -68,   69,   69,  -15,
			  -19,  -15,  -18,   23,   25,   26,   32,    4,    4,    7,
			    7, -118,  114,  115,  120,  121, -239, -240, -245, -246,
			  121, -246, -111, -117, -109,  104, -233, -107, -103,   98, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			 -227, -101,  -97,   92, -221,  -95,  119, -116,  119,  119,
			  121, -246,    3,   16, -148,    3,  -20,    3,    3,    3,
			    3,  -19,  -20,    3,  -19,  -20,    3,  -12,    8,   72,
			   72,   72,   23,   23,   26,   27, -156,   29,   29,   29,
			  121, -246,  121, -246, -111, -112, -117, -118,  120, -245,
			 -116,  120, -245,    3,   16,    3,   16, -147,    3,   16,
			 -146,    3,   16, -148,    3,   16, -146, -148,    3,  -19,
			  -20,    9,   10,  -12,   26,   26,  -28,  120,  121, -245,
			 -246,  120,  121, -245, -246, -117,    3,   17,    3,   17,
			    3,  -19,    3,  -19,    3,   16, -148,    3,  -18,    3,

			  -18,    3,   16, -148,    3,   17,  -20,    3,   17,  -20,
			    3,  -18,  -20,    3,  -18,  -20,    3, -117, -118,    3,
			  -19,    3,  -18,    3,  -18,  -20,   10, yy_Dummy>>,
			1, 127, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 3331
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 546
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 547
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 46
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 12289
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = true
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = true
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 128
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 129
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	BREAK: INTEGER = 1
	MS: INTEGER = 2
	MSN: INTEGER = 3
	VS1: INTEGER = 4
	VS2: INTEGER = 5
	VS3: INTEGER = 6
	LAVS1: INTEGER = 7
	LAVS2: INTEGER = 8
	LAVS3: INTEGER = 9
			-- Start condition codes

feature -- User-defined features



end
