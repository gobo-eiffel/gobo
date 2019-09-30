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
			Result := (INITIAL <= sc and sc <= VS3)
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
				verbatim_opening_character := unicode_text_item (text_count)
				set_start_condition (VS1)
			
when 44 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 374 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 374")
end

				verbatim_open_white_characters := utf8_text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 45 then
	yy_column := yy_column + 1
--|#line 380 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 380")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 46 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 398 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 398")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2), verbatim_opening_character = '[', Current)
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
--|#line 414 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 414")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := utf8_text_substring (last_literal_end + 1, text_count - verbatim_marker_count - 2)
					last_text_count := text_count
					if verbatim_opening_character = '{' then
						break_kind := str_verbatim_break
					else
						break_kind := str_left_aligned_verbatim_break
					end
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (VS3)
				end
			
when 48 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 430 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 430")
end

				more
				set_start_condition (VS3)
			
when 49 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 434 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 434")
end

				more
				last_literal_end := text_count - 2
			
when 50 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 438 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 438")
end

				more
				last_literal_end := text_count - 1
			
when 51 then
	yy_column := yy_column + 1
--|#line 442 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 442")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 52 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 460 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 460")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 53 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 465 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 465")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 54 then
	yy_column := yy_column + 1
--|#line 470 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 470")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 55 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 486 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 486")
end

					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 56 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 495 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 495")
end

					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 57 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 504 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 504")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 58 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 515 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 515")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 59 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 520 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 520")
end

				more
			
when 60 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 523 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 523")
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
			
when 61 then
	yy_column := yy_column + 2
--|#line 536 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 536")
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
			
when 62 then
	yy_column := yy_column + 2
--|#line 549 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 549")
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
			
when 63 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 562 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 562")
end

				more
			
when 64 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 565 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 565")
end

				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			
when 65 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 574 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 574")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 66 then
	yy_column := yy_column + 2
--|#line 582 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 582")
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
			
when 67 then
	yy_column := yy_column + 1
--|#line 593 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 593")
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
			
when 68 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 606 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 606")
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
			
when 69 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 634 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 634")
end

				more
				set_start_condition (MS)
			
when 70 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 638 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 638")
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
			
when 71 then
	yy_column := yy_column + 1
--|#line 649 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 649")
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
			
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 680 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 680")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			
when 73 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 688 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 688")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			
when 74 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 696 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 696")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 75 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 704 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 704")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 712 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 712")
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
			
when 77 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 724 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 724")
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
			
when 78 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 736 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 736")
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
			
when 79 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 748 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 748")
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
			
when 80 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 760 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 760")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 81 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 768 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 768")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 776 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 776")
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
			
when 83 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 788 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 788")
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
			
when 84 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 800 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 800")
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
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 812 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 812")
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
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 824 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 824")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 87 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 832 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 832")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 840 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 840")
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
			
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 852 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 852")
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
			
when 90 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 864 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 864")
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
			
when 91 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 876 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 876")
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
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 888 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 888")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 896 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 896")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 904 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 904")
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
			
when 95 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 916 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 916")
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
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 928 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 928")
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
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 940 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 940")
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
			
when 98 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 956 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 956")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 99 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 957 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 957")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 958 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 958")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 101 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 966 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 966")
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
			
when 102 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 967 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 967")
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
			
when 103 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 968 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 968")
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
			
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 979 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 979")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 980 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 980")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 106 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 981 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 981")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 107 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 989 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 989")
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
			
when 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 990 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 990")
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
			
when 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 991 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 991")
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
			
when 110 then
yy_set_line_column
--|#line 1006 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1006")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			
when 111 then
yy_set_line_column
--|#line 1016 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1016")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			
when 112 then
yy_set_line_column
--|#line 1027 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1027")
end

				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 113 then
yy_set_line_column
--|#line 1033 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1033")
end

				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			
when 114 then
	yy_column := yy_column + 1
--|#line 1039 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1039")
end

					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 115 then
	yy_column := yy_column + 1
--|#line 1060 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1060")
end

				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			
when 116 then
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
--|#line 1059 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1059")
end
terminate
when 1 then
--|#line 1047 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1047")
end

					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 2 then
--|#line 618 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 618")
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
--|#line 662 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 662")
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
--|#line 387 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 387")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 449 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 449")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 477 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 477")
end

					-- No final brace-double-quote.
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
			create an_array.make_filled (0, 0, 2924)
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
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   17,   18,   17,   19,   20,   21,   22,   16,   23,
			   22,   19,   24,   25,   26,   27,   28,   28,   28,   29,
			   30,   22,   31,   32,   33,   33,   33,   33,   33,   33,
			   33,   34,   33,   22,   35,   22,   36,   16,   33,   33,
			   33,   33,   33,   22,   19,   16,   38,   39,   38,   38,
			   39,   38,   42,   42,  500,   43,   43,   40,   44,   44,
			   40,   46,   47,   46,   46,   47,   46,  492,   48,   59,
			   60,   48,   50,   51,   50,   50,   51,   50,   53,   54,
			   55,  488,   56,   53,   54,   55,  485,   56,   59,   60,
			   62,   62,   62,   66,   66,   66,   66,   66,   66,   95,

			   96,   63,  122,  102,   67,  123,   97,   67,  100,   64,
			  100,   65,   57,   68,   68,   68,  496,   57,   92,   92,
			   92,  132,  133,  132,   69,  112,  112,  112,  134,   93,
			  148,  149,   64,  102,   65,   71,  113,   71,   72,   73,
			   74,   75,   76,   71,   75,   72,   77,   78,   79,   71,
			   71,   71,   71,   80,   81,   75,   82,   83,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   84,   85,   75,
			   71,   70,   71,   71,   71,   71,   71,   84,   72,   70,
			   86,   86,   86,   87,  154,   87,  501,   61,  150,  149,
			   87,   89,  151,   87,   98,   98,   98,  501,  501,   90, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  152,   91,  153,  469,  501,   99,  159,  205,   92,   92,
			   92,  501,  501,   87,   61,  100,   87,  206,  465,   93,
			   62,   62,   62,   87,   61,   92,   92,   92,  100,  461,
			   62,   63,  135,  136,  135,  184,   93,  100,  154,  101,
			  101,  101,  101,  103,  103,  103,  138,  139,  157,  140,
			   92,   92,   92,  102,  104,  105,  154,  106,  106,  106,
			  106,  111,  233,  155,   92,   92,   92,  107,  108,  100,
			  100,  501,  234,  156,  109,   93,  138,  145,  110,  146,
			  122,  107,  108,  123,  100,  112,  112,  112,  116,  116,
			  116,  116,  118,  118,  118,  229,  113,  118,  118,  118,

			  124,  124,  124,  119,   66,   66,   66,  114,  119,  117,
			  122,  125,  186,  123,  115,   67,   70,   61,  458,  114,
			  236,  128,  236,  148,  149,   75,  115,  127,  128,  127,
			  126,  129,  126,  126,  129,  129,  129,  126,  126,  126,
			  130,  126,  126,  126,  126,  126,  129,  126,  129,  126,
			  129,  129,  129,  126,  126,  129,  129,  126,  126,  126,
			  126,  126,  126,  126,  131,  131,  131,  131,  131,  126,
			  126,  126,  141,  138,  142,  451,  140,  141,  144,  142,
			   73,  140,   92,   92,   92,  138,  139,   73,  140,  176,
			  165,  184,  165,   93,  167,  167,  167,   71,   75,  150, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  149,  176,  220,  220,  165,  168,  143,  144,  139,   75,
			  140,  143,  158,  159,  158,  164,  160,  164,  246,  158,
			  161,  184,  158,  221,  485,  164,  154,  164,  162,  164,
			  163,  176,  138,  145,  165,  146,  185,  410,  410,  164,
			   70,  164,  158,  144,  145,  158,  146,   75,   75,   75,
			   70,  164,  158,  158,  158,  166,  158,  271,  160,  164,
			  272,  158,  161,  251,  158,  192,  192,  192,  484,  164,
			  162,  186,  163,  252,  176,  268,  197,  165,  192,  192,
			  192,  251,  205,  164,  158,  501,  412,  158,  412,  193,
			   75,  252,  206,  164,  158,  158,   71,  159,   71,  169,

			  170,  169,  164,  160,  185,  501,  169,  172,  268,  169,
			  311,  311,  164,  428,   71,  173,  171,  174,   74,   92,
			   92,   92,  501,  203,  203,  203,  422,  422,  175,  169,
			   93,  221,  169,  182,  204,  132,  133,  132,  175,  169,
			  158,  178,  134,  182,  179,  180,  180,  222,  222,  222,
			  181,  249,  192,  192,  192,  329,  180,  233,  180,  154,
			  180,  180,  180,  197,   62,  180,  180,  234,  223,  182,
			   62,   88,  154,  198,  207,  207,  207,  451,  154,  182,
			   70,  176,   70,  445,  183,  208,  326,   70,   71,  114,
			   70,  213,  213,  213,  122,  230,   70,  123,   75,  114, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   62,  114,  214,  441,  116,  116,  116,  116,  154,  230,
			   70,  114,  170,   70,  439,  186,  118,  118,  118,  268,
			   70,   70,  187,  188,  187,  117,  176,  119,  433,  165,
			  124,  124,  124,  237,  238,  238,  238,  135,  136,  135,
			  180,  125,  388,  141,  138,  142,  159,  140,  141,  144,
			  142,  385,  140,  253,  164,  281,  281,  281,  239,  239,
			  239,  254,  458,  255,  164,   86,   86,   86,   87,  240,
			   87,  253,   61,  377,  377,   87,  189,  143,   87,  254,
			   73,  255,  143,  186,  190,  383,  191,   70,  241,  241,
			  241,  242,  242,  242,  244,  244,  244,   71,   87,   62,

			  186,   87,  243,  380,  179,  245,   89,  154,   87,   61,
			  194,  194,  194,  195,   90,  195,   91,   97,  251,   62,
			  195,   86,  378,  195,  246,  246,  246,  154,  252,  196,
			  248,  248,  248,  375,  161,  247,  249,  249,  249,  446,
			  446,   63,  173,  195,  174,  356,  195,  250,  256,  256,
			  256,  372,   62,  195,   97,  209,  209,  209,   73,  257,
			  154,  185,  236,  128,  236,   70,  210,  465,  366,  101,
			  101,  101,  101,   71,  421,   70,  259,  259,  259,  121,
			  420,  211,  178,  264,  264,  264,  271,  260,  344,  165,
			  212,  216,  216,  216,  265,  315,  315,  315,  269,  269, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  269,  488,  217,  361,  500,  218,  218,  218,  218,  270,
			  284,  284,  284,  362,  277,  363,  223,  219,  226,  226,
			  226,  285,  410,  410,  277,  364,  282,  282,  282,  227,
			  489,  489,  228,  228,  228,  228,  363,  283,  341,  339,
			  280,  188,  280,  449,  501,   88,  364,  198,  292,  292,
			  292,  273,  320,  110,  231,  231,  231,  251,  316,  293,
			  295,  296,  296,  296,  312,  232,  418,  252,  116,  116,
			  116,  116,  182,  194,  194,  194,  419,  286,  286,  286,
			  501,  361,  182,  308,  192,  411,  411,  411,  287,  117,
			  178,  362,  353,  258,  180,  180,   90,  273,   91,  181,

			  186,  288,  288,  288,  179,  180,  363,  180,  290,  180,
			  180,  180,  289,  286,  180,  180,  364,  501,  182,  424,
			   90,  424,   91,  290,  290,  290,  343,  269,  182,  187,
			  188,  187,  264,   73,  291,  170,  165,  203,  203,  203,
			  259,  448,   90,  448,   91,  205,  205,  205,  204,  207,
			  207,  207,  301,  301,  301,  301,   67,  256,  299,  299,
			  208,  164,  300,  300,  300,  300,  335,  207,  207,  207,
			  251,  164,   71,  212,   71,  169,  170,  169,  208,  160,
			  252,  334,  169,  261,  239,  169,  233,  233,  233,  159,
			  231,  262,  186,  263,  306,  306,   70,  119,  307,  307, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  307,  307,  418,  459,  175,  169,   71,  226,  169,  316,
			  316,  316,  419,  460,  175,  169,  158,   71,  225,   71,
			  317,  266,  422,  422,  165,  320,  320,  320,  267,  327,
			  328,  328,  328,  423,  423,  423,  321,  322,  329,  238,
			  238,  238,  238,  463,  318,  251,  251,  251,  251,  175,
			  159,  303,  491,  185,  491,  302,   93,   70,  252,  175,
			  333,   71,   74,  266,   74,   71,  183,   70,  170,   74,
			   71,  185,   74,  209,  436,  268,  298,  297,   74,  294,
			  171,  179,  437,  171,  438,   74,  339,  339,  339,   71,
			  501,   71,   74,  179,  179,   74,  224,  340,  224,  439,

			   71,  224,   74,   70,  187,  188,  187,  199,  266,  440,
			  167,  165,  341,  341,  341,  267,  344,  344,  344,  180,
			  185,  459,  124,  342,  179,  235,  120,  345,  177,  177,
			  112,  460,  180,  225,  179,  177,  175,  300,  300,  300,
			  300,  103,  177,  177,  251,  251,  175,   61,   71,  258,
			  273,  258,  200,  160,  252,  252,  258,  274,  202,  258,
			  200,  251,  288,  288,  288,  275,  199,  276,  280,  188,
			  280,  252,  501,  351,  288,  288,  288,  273,  277,  258,
			  185,   90,  258,   91,  179,  352,   99,  120,  277,  258,
			  258,  501,  180,   90,  179,   91,  292,  292,  292,  251, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  182,  278,  279,  279,  279,  501,  501,  293,  501,  252,
			  182,  354,  354,  354,  356,  296,  296,  296,  296,  182,
			  369,  369,  355,  251,  370,  370,  370,  370,  501,  182,
			  187,  188,  187,  252,   73,  501,  360,  165,  371,  371,
			  371,  371,  307,  307,  307,  307,  385,  385,  385,  501,
			  388,  388,  388,  400,  401,  400,  501,  386,  319,  305,
			  319,  389,  164,  319,  402,  238,  238,  238,  238,  382,
			  382,  382,  164,  209,  209,  209,  121,  328,  328,  328,
			  328,  318,  446,  446,  210,  225,  333,  218,  218,  218,
			  218,  413,  414,  414,  414,  354,  354,  354,  409,  304,

			  501,  501,  501,  486,  501,  501,  355,  501,  305,  308,
			  308,  308,  415,  415,  416,  416,  416,  361,  361,  361,
			  309,  251,  501,  220,  220,  177,  501,  501,  204,  501,
			  182,  252,  182,  447,  447,  447,  177,  177,  501,   97,
			  182,   97,  182,  177,  310,  312,  312,  312,  501,   97,
			  177,  177,  296,  296,  296,  296,  313,  501,  501,  222,
			  222,  222,  501,  363,  363,  363,  501,  425,  425,  425,
			  425,  426,  426,  360,  208,  427,  427,  427,  427,  501,
			  314,  251,  501,  323,  501,  323,  501,  323,  365,  501,
			  323,  324,  501,  323,  370,  370,  370,  370,  501,  325, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  432,  432,  432,  432,  316,  316,  316,  393,  393,  393,
			  393,  501,  501,  323,  501,  317,  323,  328,  328,  328,
			  328,  374,  501,  323,  323,  329,  238,  238,  238,  238,
			  251,  251,  251,  251,  251,  251,  330,  331,  409,  318,
			  501,   93,  501,  332,   93,  489,  489,  333,  501,  501,
			  330,  331,  258,  273,  258,  501,  160,  501,  501,  258,
			  336,  501,  258,  442,  442,  442,  498,  443,  337,  501,
			  338,  434,  434,  501,  444,  435,  435,  435,  435,  415,
			  415,  277,  258,  501,  501,  258,  329,  410,  410,  501,
			  501,  277,  258,  258,  179,  271,  179,  182,  183,  501,

			  456,  179,  180,  501,  179,  443,  501,  182,  449,  501,
			  179,  501,  180,  501,  418,  418,  418,  329,  411,  411,
			  411,  471,  472,  471,  179,  293,  501,  179,  178,  414,
			  414,  414,  414,  501,  179,  179,  346,  188,  346,  450,
			  271,  501,  501,  165,  461,  461,  461,  356,  422,  422,
			  455,  356,  423,  423,  423,  462,  427,  427,  427,  427,
			  427,  427,  427,  427,  466,  466,  466,  466,  277,  463,
			  467,  467,  501,  464,  468,  468,  468,  468,  277,  501,
			  435,  435,  435,  435,  501,  430,  501,  501,  180,  279,
			  279,  279,  279,  435,  435,  435,  435,  501,  501,  347, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  348,  476,  477,  476,  501,  501,  349,  182,  501,  501,
			  350,  501,  478,  347,  348,  501,  501,  182,  356,  296,
			  296,  296,  296,  479,  480,  479,  481,  482,  481,  357,
			  358,  473,  474,  473,  501,  501,  359,  483,  501,  501,
			  360,  501,  475,  357,  358,  209,  209,  209,  501,  501,
			  199,  501,  440,  121,  446,  446,  210,  501,  501,  300,
			  300,  300,  300,  442,  442,  442,  501,  443,  121,  447,
			  447,  447,  501,  501,  444,  486,  490,  490,  490,  501,
			  365,  366,  366,  366,  501,  411,  411,  411,  501,  501,
			  487,  501,  367,  501,  501,  301,  301,  301,  301,  414,

			  414,  414,  414,  501,  501,  443,  450,  368,  501,  501,
			  459,  459,  459,  501,  501,  501,  212,  372,  372,  372,
			  455,  355,  423,  423,  423,  501,  501,  501,  373,  501,
			  501,  307,  307,  307,  307,  468,  468,  468,  468,  468,
			  468,  468,  468,  464,  501,  251,  251,  251,  251,  251,
			  251,  501,  374,  375,  375,  375,   93,  501,  501,   93,
			  479,  480,  479,  501,  376,  501,  501,  377,  377,  501,
			  501,  494,  251,  251,  251,  479,  480,  479,  501,  501,
			  447,  447,  447,   93,  501,  501,  495,  501,  310,  378,
			  378,  378,  501,  501,  251,  251,  251,  251,  251,  251, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  379,  487,  501,  311,  311,   93,  501,  501,   93,  485,
			  485,  485,  501,  497,  501,  178,  489,  489,  501,  501,
			  444,  490,  490,  490,  221,  380,  380,  380,  178,  490,
			  490,  490,  501,  501,  501,  501,  381,  498,  501,  382,
			  382,  382,  499,   61,   61,  501,  501,   61,  501,   61,
			  499,  497,   61,  501,  501,  501,  501,   61,  501,  501,
			  314,  383,  383,  383,   97,   97,  501,  501,   97,  501,
			   97,  501,  384,   97,  501,  315,  315,  315,   97,  201,
			  501,  201,  201,  501,  501,  501,  201,  201,  501,  201,
			  501,  501,  501,  501,  387,  387,  223,  391,  391,  391,

			  387,  501,  387,  501,  387,  501,  501,  387,  392,  501,
			  501,  393,  393,  393,  393,  501,  501,  501,  501,  501,
			  501,  501,  501,  394,  157,  396,  157,  395,  501,  395,
			  501,  395,  501,  501,  395,  397,  501,  395,  501,  121,
			  501,  121,  121,  398,  501,  399,  121,  121,  178,  121,
			  178,  178,  501,  501,  501,  178,  178,  395,  178,  501,
			  395,  501,  501,  501,  501,  501,  501,  395,  395,  403,
			  403,  403,  501,  404,  501,  501,  501,  501,  501,  501,
			  405,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  114,  501, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  114,  404,  121,  328,  328,  328,  328,  501,  501,  501,
			  501,  501,  501,  406,  407,  501,  501,  501,  501,  501,
			  408,  501,  501,  501,  409,  501,  501,  406,  407,  346,
			  188,  346,  501,  271,  501,  501,  165,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  277,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  277,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  417,  417,  417,  417,  501,  501,  501,  501,

			  501,  417,  417,  417,  417,  501,  501,  501,  501,  501,
			  182,  501,  501,  501,  501,  417,  417,  417,  501,  501,
			  182,  428,  428,  428,  501,  501,  501,  501,  501,  501,
			  501,  501,  429,  501,  501,  370,  370,  370,  370,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  430,  366,  366,  366,
			  501,  501,  501,  501,  501,  501,  501,  501,  367,  501,
			  501,  371,  371,  371,  371,  501,  501,  501,  501,  501,
			  501,  501,  501,  431,  501,  501,  501,  501,  501,  501,
			  501,  501,  305,  178,  414,  414,  414,  414,  501,  501, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  501,  501,  452,  453,  501,  501,  501,  501,
			  501,  454,  501,  501,  501,  455,  501,  501,  452,  453,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  180,
			  415,  415,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  182,  501,
			  501,  456,  501,  501,  501,  501,  501,  501,  182,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  180,  416,
			  416,  416,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  182,  501,  501,
			  457,  501,  501,  501,  501,  501,  501,  182,  366,  366,

			  366,  501,  501,  501,  501,  501,  501,  501,  501,  367,
			  501,  501,  425,  425,  425,  425,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  365,  469,  469,  469,  501,  501,  501,
			  501,  501,  501,  501,  501,  470,  501,  501,  432,  432,
			  432,  432,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  374,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  416,  416,  416,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  182,  501, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  457,  501,  501,  501,  501,  501,  501,  182,  492,
			  492,  492,  501,  501,  501,  501,  501,  501,  501,  501,
			  493,  501,  501,  466,  466,  466,  466,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  430,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,

			   49,   49,   49,   49,   49,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   88,   88,  501,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   94,  501,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,  114,  114,  501,  501,  501,
			  501,  114,  501,  114,  501,  114,  114,  114,  114,  121,
			  501,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  137,  137,  137,  137,  137,  137, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,   71,
			  501,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,  171,  501,  171,  171,  171,  171,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  177,
			  501,  177,  177,  177,  177,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,  215,

			  215,  215,  215,  215,  215,  215,  501,  215,  215,  215,
			  215,  215,  215,  215,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  178,  501,  178,  178,  178,  178,
			  178,  178,  178,  178,  178,  178,  178,  178,  178,  180,
			  501,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  297,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  298,  298,  298,  298,  390,  390,  390,  390,  390,  390,
			  390,  501,  390,  390,  390,  390,  390,  390,  390,  121,
			  501,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  353,  353,  353,  353,  353,  353,
			  353,  353,  353,  353,  353,  353,  353,  353,  353,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,  484,  484,   15,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,

			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501, yy_Dummy>>,
			1, 125, 2800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2924)
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
			    1,    1,    1,    1,    1,    1,    3,    3,    3,    4,
			    4,    4,    5,    6,  500,    5,    6,    3,    5,    6,
			    4,    7,    7,    7,    8,    8,    8,  493,    7,   13,
			   13,    8,    9,    9,    9,   10,   10,   10,   11,   11,
			   11,  488,   11,   12,   12,   12,  484,   12,   14,   14,
			   16,   16,   16,   17,   17,   17,   18,   18,   18,   23,

			   23,   16,   41,   26,   17,   41,   31,   18,   31,   16,
			   26,   16,   11,   19,   19,   19,  483,   12,   22,   22,
			   22,   46,   46,   46,   19,   33,   33,   33,   46,   22,
			   58,   58,   19,   26,   19,   20,   33,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   21,   21,   21,   21,   65,   21,   65,   21,   60,   60,
			   21,   21,   61,   21,   24,   24,   24,   28,   28,   21, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   61,   21,   61,  470,   28,   24,   85,   99,   29,   29,
			   29,   28,   28,   21,   61,   24,   21,   99,  465,   29,
			   35,   35,   35,   21,   21,   25,   25,   25,   29,  462,
			   63,   35,   50,   50,   50,   85,   25,   25,   63,   25,
			   25,   25,   25,   27,   27,   27,   52,   52,   69,   52,
			   30,   30,   30,   35,   27,   27,   69,   27,   27,   27,
			   27,   30,  120,   64,   32,   32,   32,   27,   27,   30,
			   30,   64,  120,   64,   27,   32,   57,   57,   27,   57,
			  121,   27,   27,  121,   32,   34,   34,   34,   36,   36,
			   36,   36,   38,   38,   38,  111,   34,   39,   39,   39,

			   43,   43,   43,   38,   66,   66,   66,  114,   39,   36,
			  129,   43,   82,  129,   34,   66,   82,  111,  458,  114,
			  127,  127,  127,  147,  147,   82,   34,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   53,   53,   53,  451,   53,   55,   55,   55,
			  161,   55,   68,   68,   68,  137,  137,   71,  137,   75,
			   71,   79,   75,   68,   73,   73,   73,  161,   79,  149, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  149,   78,  107,  107,   78,   73,   53,  139,  139,   78,
			  139,   55,   70,   70,   70,   71,   70,   75,  247,   70,
			   70,   79,   70,  107,  445,   71,  247,   75,   70,   78,
			   70,   80,  143,  143,   80,  143,   81,  330,  330,   78,
			   81,   70,   70,  145,  145,   70,  145,   80,   81,   81,
			   81,   70,   70,   70,   72,   72,   72,  178,   72,   80,
			  178,   72,   72,  157,   72,   91,   91,   91,  444,   80,
			   72,  174,   72,  157,   83,  174,   91,   83,   88,   88,
			   88,  199,  206,   72,   72,   88,  537,   72,  537,   88,
			   83,  199,  206,   72,   72,   72,   74,  253,   74,   74,

			   74,   74,   83,   74,  173,  177,   74,   74,  173,   74,
			  221,  221,   83,  429,  253,   74,  173,   74,  173,   92,
			   92,   92,   88,   98,   98,   98,  357,  357,   74,   74,
			   92,  221,   74,  177,   98,  132,  132,  132,   74,   74,
			   74,   76,  132,  177,   76,   76,   76,  108,  108,  108,
			   76,  250,   90,   90,   90,  412,   76,  234,   76,  250,
			   76,   76,   76,   90,  289,   76,   76,  234,  108,   76,
			  334,   90,  289,   90,  100,  100,  100,  412,  334,   76,
			   77,   77,   77,  405,   77,  100,  230,   77,   77,  230,
			   77,  102,  102,  102,  329,  115,   77,  329,   77,  115, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  335,  230,  102,  402,  117,  117,  117,  117,  335,  115,
			   77,  115,  263,   77,  399,  263,  118,  118,  118,  263,
			   77,   77,   84,   84,   84,  117,   84,  118,  392,   84,
			  122,  122,  122,  130,  130,  130,  130,  135,  135,  135,
			  417,  122,  389,  141,  141,  141,  158,  141,  142,  142,
			  142,  386,  142,  158,   84,  189,  189,  189,  146,  146,
			  146,  158,  417,  158,   84,   87,   87,   87,   87,  146,
			   87,  184,   87,  377,  377,   87,   87,  141,   87,  184,
			  163,  184,  142,  163,   87,  384,   87,  163,  151,  151,
			  151,  152,  152,  152,  153,  153,  153,  163,   87,  151,

			  276,   87,  152,  381,  276,  153,  195,  151,   87,   87,
			   89,   89,   89,   89,  195,   89,  195,   89,  252,  351,
			   89,   89,  379,   89,  154,  154,  154,  351,  252,   89,
			  155,  155,  155,  376,  268,  154,  156,  156,  156,  406,
			  406,  155,  268,   89,  268,  424,   89,  156,  159,  159,
			  159,  373,  352,   89,   89,  101,  101,  101,  162,  159,
			  352,  162,  236,  236,  236,  162,  101,  424,  367,  101,
			  101,  101,  101,  162,  356,  162,  166,  166,  166,  448,
			  355,  101,  491,  170,  170,  170,  180,  166,  345,  180,
			  101,  105,  105,  105,  170,  223,  223,  223,  176,  176, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  176,  448,  105,  297,  491,  105,  105,  105,  105,  176,
			  191,  191,  191,  297,  180,  298,  223,  105,  110,  110,
			  110,  191,  449,  449,  180,  298,  190,  190,  190,  110,
			  452,  452,  110,  110,  110,  110,  302,  190,  342,  340,
			  182,  182,  182,  449,  182,  190,  302,  190,  200,  200,
			  200,  336,  321,  110,  116,  116,  116,  324,  317,  200,
			  202,  202,  202,  202,  313,  116,  353,  324,  116,  116,
			  116,  116,  182,  193,  193,  193,  353,  196,  196,  196,
			  193,  362,  182,  309,  193,  331,  331,  331,  196,  116,
			  160,  362,  293,  160,  160,  160,  196,  338,  196,  160,

			  338,  197,  197,  197,  338,  160,  364,  160,  291,  160,
			  160,  160,  197,  287,  160,  160,  364,  193,  160,  539,
			  197,  539,  197,  198,  198,  198,  272,  270,  160,  164,
			  164,  164,  265,  164,  198,  261,  164,  203,  203,  203,
			  260,  540,  198,  540,  198,  205,  205,  205,  203,  207,
			  207,  207,  212,  212,  212,  212,  205,  257,  211,  211,
			  207,  164,  211,  211,  211,  211,  245,  213,  213,  213,
			  400,  164,  169,  212,  169,  169,  169,  169,  213,  169,
			  400,  243,  169,  169,  240,  169,  233,  233,  233,  255,
			  232,  169,  255,  169,  219,  219,  255,  233,  219,  219, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  219,  219,  419,  420,  169,  169,  255,  227,  169,  224,
			  224,  224,  419,  420,  169,  169,  169,  171,  225,  171,
			  224,  171,  463,  463,  171,  228,  228,  228,  171,  235,
			  235,  235,  235,  358,  358,  358,  228,  228,  238,  238,
			  238,  238,  238,  463,  224,  251,  251,  251,  441,  171,
			  254,  217,  543,  254,  543,  214,  251,  254,  441,  171,
			  238,  171,  172,  172,  172,  254,  172,  254,  262,  172,
			  172,  262,  172,  210,  395,  262,  208,  204,  172,  201,
			  172,  186,  395,  262,  395,  262,  266,  266,  266,  267,
			  267,  267,  172,  185,  183,  172,  524,  266,  524,  398,

			  267,  524,  172,  172,  175,  175,  175,  398,  175,  398,
			  168,  175,  271,  271,  271,  175,  273,  273,  273,  165,
			  275,  460,  125,  271,  275,  123,  119,  273,  279,  279,
			  113,  460,  275,  109,  275,  279,  175,  299,  299,  299,
			  299,  104,  279,  279,  471,  473,  175,   97,  175,  179,
			  179,  179,   96,  179,  471,  473,  179,  179,   95,  179,
			   94,  476,  283,  283,  283,  179,   93,  179,  280,  280,
			  280,  476,  280,  283,  285,  285,  285,  337,  179,  179,
			  337,  283,  179,  283,  337,  285,   67,   40,  179,  179,
			  179,  181,  337,  285,  337,  285,  292,  292,  292,  479, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  280,  181,  181,  181,  181,   15,    0,  292,    0,  479,
			  280,  294,  294,  294,  296,  296,  296,  296,  296,  181,
			  304,  304,  294,  481,  304,  304,  304,  304,    0,  181,
			  187,  187,  187,  481,  187,    0,  296,  187,  305,  305,
			  305,  305,  306,  306,  306,  306,  318,  318,  318,    0,
			  319,  319,  319,  325,  325,  325,    0,  318,  530,  305,
			  530,  319,  187,  530,  325,  333,  333,  333,  333,  382,
			  382,  382,  187,  218,  218,  218,  328,  328,  328,  328,
			  328,  318,  486,  486,  218,  319,  333,  218,  218,  218,
			  218,  343,  343,  343,  343,  354,  354,  354,  328,  218,

			    0,    0,  347,  486,  348,    0,  354,    0,  218,  220,
			  220,  220,  347,  347,  348,  348,  348,  361,  361,  361,
			  220,  496,    0,  220,  220,  350,    0,    0,  361,    0,
			  347,  496,  348,  407,  407,  407,  350,  350,    0,  517,
			  347,  517,  348,  350,  220,  222,  222,  222,    0,  517,
			  350,  350,  360,  360,  360,  360,  222,    0,    0,  222,
			  222,  222,    0,  363,  363,  363,    0,  365,  365,  365,
			  365,  368,  368,  360,  363,  368,  368,  368,  368,    0,
			  222,  229,    0,  229,    0,  229,    0,  229,  365,    0,
			  229,  229,    0,  229,  369,  369,  369,  369,    0,  229, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  374,  374,  374,  374,  387,  387,  387,  393,  393,  393,
			  393,    0,    0,  229,    0,  387,  229,  409,  409,  409,
			  409,  374,    0,  229,  229,  237,  237,  237,  237,  237,
			  396,  396,  396,  401,  401,  401,  237,  237,  409,  387,
			    0,  396,    0,  237,  401,  498,  498,  237,    0,    0,
			  237,  237,  258,  258,  258,    0,  258,    0,    0,  258,
			  258,    0,  258,  403,  403,  403,  498,  403,  258,  456,
			  258,  394,  394,    0,  403,  394,  394,  394,  394,  456,
			  456,  258,  258,    0,    0,  258,  410,  410,  410,    0,
			    0,  258,  258,  258,  274,  274,  274,  456,  274,    0,

			  456,  274,  274,    0,  274,  403,    0,  456,  410,    0,
			  274,    0,  274,    0,  418,  418,  418,  411,  411,  411,
			  411,  436,  436,  436,  274,  418,    0,  274,  414,  414,
			  414,  414,  414,    0,  274,  274,  277,  277,  277,  411,
			  277,    0,    0,  277,  421,  421,  421,  422,  422,  422,
			  414,  423,  423,  423,  423,  421,  426,  426,  426,  426,
			  427,  427,  427,  427,  430,  430,  430,  430,  277,  422,
			  431,  431,    0,  423,  431,  431,  431,  431,  277,  278,
			  434,  434,  434,  434,    0,  430,    0,    0,  278,  278,
			  278,  278,  278,  435,  435,  435,  435,    0,    0,  278, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  278,  438,  438,  438,    0,    0,  278,  278,    0,    0,
			  278,    0,  438,  278,  278,    0,    0,  278,  295,  295,
			  295,  295,  295,  439,  439,  439,  440,  440,  440,  295,
			  295,  437,  437,  437,    0,    0,  295,  440,    0,    0,
			  295,    0,  437,  295,  295,  300,  300,  300,    0,    0,
			  437,    0,  437,  446,  446,  446,  300,    0,    0,  300,
			  300,  300,  300,  442,  442,  442,    0,  442,  447,  447,
			  447,  447,    0,    0,  442,  446,  453,  453,  453,    0,
			  300,  301,  301,  301,    0,  450,  450,  450,    0,    0,
			  447,    0,  301,    0,    0,  301,  301,  301,  301,  455,

			  455,  455,  455,    0,    0,  442,  450,  301,    0,    0,
			  459,  459,  459,    0,    0,    0,  301,  307,  307,  307,
			  455,  459,  464,  464,  464,    0,    0,    0,  307,    0,
			    0,  307,  307,  307,  307,  467,  467,  467,  467,  468,
			  468,  468,  468,  464,    0,  472,  472,  472,  474,  474,
			  474,    0,  307,  310,  310,  310,  472,    0,    0,  474,
			  475,  475,  475,    0,  310,    0,    0,  310,  310,    0,
			    0,  475,  477,  477,  477,  478,  478,  478,    0,    0,
			  487,  487,  487,  477,    0,    0,  478,    0,  310,  311,
			  311,  311,    0,    0,  480,  480,  480,  482,  482,  482, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  311,  487,    0,  311,  311,  480,    0,    0,  482,  485,
			  485,  485,    0,  485,    0,  489,  489,  489,    0,    0,
			  485,  499,  499,  499,  311,  314,  314,  314,  490,  490,
			  490,  490,    0,    0,    0,    0,  314,  489,    0,  314,
			  314,  314,  499,  508,  508,    0,    0,  508,    0,  508,
			  490,  485,  508,    0,    0,    0,    0,  508,    0,    0,
			  314,  315,  315,  315,  511,  511,    0,    0,  511,    0,
			  511,    0,  315,  511,    0,  315,  315,  315,  511,  521,
			    0,  521,  521,    0,    0,    0,  521,  521,    0,  521,
			    0,    0,    0,    0,  534,  534,  315,  322,  322,  322,

			  534,    0,  534,    0,  534,    0,    0,  534,  322,    0,
			    0,  322,  322,  322,  322,    0,    0,    0,    0,    0,
			    0,    0,    0,  322,  323,  323,  323,  323,    0,  323,
			    0,  323,    0,    0,  323,  323,    0,  323,    0,  526,
			    0,  526,  526,  323,    0,  323,  526,  526,  531,  526,
			  531,  531,    0,    0,    0,  531,  531,  323,  531,    0,
			  323,    0,    0,    0,    0,    0,    0,  323,  323,  326,
			  326,  326,    0,  326,    0,    0,    0,    0,    0,    0,
			  326,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  326,    0, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  326,  326,  327,  327,  327,  327,  327,    0,    0,    0,
			    0,    0,    0,  327,  327,    0,    0,    0,    0,    0,
			  327,    0,    0,    0,  327,    0,    0,  327,  327,  346,
			  346,  346,    0,  346,    0,    0,  346,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  346,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  346,  349,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  349,  349,  349,  349,    0,    0,    0,    0,

			    0,  349,  349,  349,  349,    0,    0,    0,    0,    0,
			  349,    0,    0,    0,    0,  349,  349,  349,    0,    0,
			  349,  370,  370,  370,    0,    0,    0,    0,    0,    0,
			    0,    0,  370,    0,    0,  370,  370,  370,  370,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  370,  371,  371,  371,
			    0,    0,    0,    0,    0,    0,    0,    0,  371,    0,
			    0,  371,  371,  371,  371,    0,    0,    0,    0,    0,
			    0,    0,    0,  371,    0,    0,    0,    0,    0,    0,
			    0,    0,  371,  413,  413,  413,  413,  413,    0,    0, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,  413,  413,    0,    0,    0,    0,
			    0,  413,    0,    0,    0,  413,    0,    0,  413,  413,
			  415,    0,    0,    0,    0,    0,    0,    0,    0,  415,
			  415,  415,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  415,    0,
			    0,  415,    0,    0,    0,    0,    0,    0,  415,  416,
			    0,    0,    0,    0,    0,    0,    0,    0,  416,  416,
			  416,  416,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  416,    0,    0,
			  416,    0,    0,    0,    0,    0,    0,  416,  425,  425,

			  425,    0,    0,    0,    0,    0,    0,    0,    0,  425,
			    0,    0,  425,  425,  425,  425,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  425,  432,  432,  432,    0,    0,    0,
			    0,    0,    0,    0,    0,  432,    0,    0,  432,  432,
			  432,  432,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  432,
			  457,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  457,  457,  457,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  457,    0, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  457,    0,    0,    0,    0,    0,    0,  457,  466,
			  466,  466,    0,    0,    0,    0,    0,    0,    0,    0,
			  466,    0,    0,  466,  466,  466,  466,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  466,  502,  502,  502,  502,  502,
			  502,  502,  502,  502,  502,  502,  502,  502,  502,  502,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  504,  504,  504,  504,  504,
			  504,  504,  504,  504,  504,  504,  504,  504,  504,  504,
			  505,  505,  505,  505,  505,  505,  505,  505,  505,  505,

			  505,  505,  505,  505,  505,  506,  506,  506,  506,  506,
			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,
			  507,  507,  507,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  507,  507,  509,  509,    0,  509,  509,
			  509,  509,  509,  509,  509,  509,  509,  509,  509,  509,
			  510,    0,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  512,  512,    0,    0,    0,
			    0,  512,    0,  512,    0,  512,  512,  512,  512,  513,
			    0,  513,  513,  513,  513,  513,  513,  513,  513,  513,
			  513,  513,  513,  513,  514,  514,  514,  514,  514,  514, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  515,
			  515,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  516,  516,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  518,
			    0,  518,  518,  518,  518,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  519,    0,  519,  519,  519,  519,
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  520,
			    0,  520,  520,  520,  520,  520,  520,  520,  520,  520,
			  520,  520,  520,  520,  522,  522,  522,  522,  522,  522,
			  522,  522,  522,  522,  522,  522,  522,  522,  522,  523,

			  523,  523,  523,  523,  523,  523,    0,  523,  523,  523,
			  523,  523,  523,  523,  525,  525,  525,  525,  525,  525,
			  525,  525,  525,  525,  525,  525,  525,  525,  525,  527,
			  527,  527,  527,  527,  527,  527,  527,  527,  527,  527,
			  527,  527,  527,  527,  528,    0,  528,  528,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  528,  528,  529,
			    0,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,  529,  529,  529,  532,  532,  532,  532,  532,  532,
			  532,  532,  532,  532,  532,  532,  532,  532,  532,  533,
			  533,  533,  533,  533,  533,  533,  533,  533,  533,  533, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  533,  533,  533,  533,  535,  535,  535,  535,  535,  535,
			  535,    0,  535,  535,  535,  535,  535,  535,  535,  536,
			    0,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  536,  538,  538,  538,  538,  538,  538,
			  538,  538,  538,  538,  538,  538,  538,  538,  538,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  542,  542,  542,  542,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,

			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501, yy_Dummy>>,
			1, 125, 2800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 543)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   45,   48,   50,   51,   60,   63,   71,
			   74,   77,   82,   67,   86, 1205,   89,   92,   95,  112,
			  134,  179,  117,   91,  193,  224,   89,  242,  172,  207,
			  249,   86,  263,  124,  284,  219,  273, 2879,  291,  296,
			 1175,   97, 2879,  299,  326, 2879,  120, 2879, 2879, 2879,
			  231, 2879,  244,  371, 2879,  376, 2879,  274,  128, 2879,
			  186,  180, 2879,  218,  251,  164,  303, 1174,  381,  236,
			  408,  382,  450,  393,  495,  384,  536,  576,  396,  377,
			  426,  428,  304,  469,  621,  201, 2879,  664,  477,  709,
			  551,  464,  518, 1154, 1151, 1144, 1143, 1113,  522,  205,

			  573,  754,  590, 2879, 1129,  790,    0,  387,  532, 1097,
			  817,  283, 2879, 1118,  277,  569,  853,  589,  615, 1114,
			  260,  275,  629, 1111, 2879, 1110, 2879,  319, 2879,  305,
			  618, 2879,  534, 2879, 2879,  636, 2879,  383, 2879,  405,
			 2879,  642,  647,  430, 2879,  441,  657,  321, 2879,  397,
			 2879,  687,  690,  693,  723,  729,  735,  461,  641,  747,
			  885,  375,  753,  675,  928, 1111,  775, 2879, 1098,  971,
			  782, 1016, 1058,  496,  463, 1103,  797,  500,  452, 1145,
			  781, 1186,  839, 1086,  659, 1085, 1073, 1229, 2879,  654,
			  825,  809, 2879,  872, 2879,  694,  876,  900,  922,  479, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  847, 1070,  845,  936, 1065,  944,  480,  948, 1064, 2879,
			 1061,  947,  937,  966, 1043, 2879, 2879, 1039, 1272,  983,
			 1308,  495, 1344,  780, 1008,  982, 2879,  995, 1024, 1379,
			  559, 2879,  978,  985,  555, 1014,  761, 1411, 1024, 2879,
			  972, 2879, 2879,  969, 2879,  954, 2879,  406, 2879, 2879,
			  539, 1044,  716,  492, 1045,  984, 2879,  945, 1448, 2879,
			  928,  930, 1063,  607, 2879,  920, 1085, 1088,  722, 2879,
			  915, 1111,  912, 1115, 1490, 1112,  692, 1535, 1574, 1103,
			 1167, 2879, 2879, 1161, 2879, 1173, 2879,  901, 2879,  552,
			 2879,  896, 1195,  880, 1210, 1604, 1200,  801,  813, 1122,

			 1644, 1680,  834, 2879, 1209, 1223, 1227, 1716, 2879,  871,
			 1752, 1788, 2879,  852, 1824, 1860, 2879,  846, 1245, 1249,
			 2879,  840, 1896, 1923,  855, 1252, 1968, 1998, 1262,  589,
			  422,  870,    0, 1250,  558,  588,  846, 1172,  892, 2879,
			  827, 2879,  826, 1276, 2879,  776, 2038, 1297, 1299, 2077,
			 1311,  707,  740,  864, 1294,  768,  765,  511, 1018,    0,
			 1337, 1316,  879, 1362,  904, 1352, 2879,  756, 1360, 1379,
			 2120, 2156, 2879,  739, 1385, 2879,  721,  658, 2879,  710,
			 2879,  691, 1254, 2879,  673, 2879,  639, 1403, 2879,  630,
			 2879, 2879,  616, 1392, 1460, 1062, 1429,    0, 1087,  602, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  968, 1432,  591, 1462, 2879,  571,  724, 1318,    0, 1402,
			 1472, 1503,  541, 2179, 1514, 2215, 2254,  626, 1513, 1000,
			 1001, 1543, 1533, 1537,  731, 2297, 1541, 1545, 2879,  501,
			 1549, 1559, 2333, 2879, 1565, 1578, 1520, 1630, 1600, 1622,
			 1625, 1046, 1662, 2879,  456,  422, 1639, 1654,  765,  807,
			 1670,  339,  815, 1661,    0, 1684, 1464, 2365,  282, 1709,
			 1119, 2879,  217, 1007, 1707,  182, 2408, 1720, 1724, 2879,
			  191, 1142, 1744, 1143, 1747, 1759, 1159, 1771, 1774, 1197,
			 1793, 1221, 1796,  104,   84, 1808, 1267, 1765,   45, 1801,
			 1814,  768, 2879,   55,    0,    0, 1319, 2879, 1430, 1806,

			   18, 2879, 2444, 2459, 2474, 2489, 2504, 2519, 1842, 2534,
			 2549, 1863, 2564, 2578, 2593, 2608, 2623, 1334, 2638, 2653,
			 2668, 1876, 2683, 2698, 1087, 2713, 1936, 2728, 2743, 2758,
			 1249, 1945, 2773, 2788, 1893, 2803, 2818,  477, 2833,  910,
			  932, 2848, 2863, 1043, yy_Dummy>>,
			1, 144, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 543)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  501,    1,  502,  502,  503,  503,  504,  504,  505,
			  505,  506,  506,  507,  507,  501,  508,  501,  501,  508,
			  501,  509,  501,  510,  511,  501,   19,  501,   27,  501,
			  511,   30,  501,  512,  512,   19,  501,  501,  501,  501,
			  501,  513,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  514,  514,  501,  514,  501,  515,  516,  501,
			  516,   35,  501,  517,  517,   64,  501,  501,  501,  517,
			  518,  518,  518,  501,  519,  518,  520,   72,  518,   72,
			  518,   77,   77,  518,  518,   72,  501,  509,  509,  509,
			   89,   89,  501,  501,  501,  521,  501,   35,  501,  522,

			  501,  501,   61,  501,  501,  523,   28,  501,  501,  524,
			  501,   35,  501,  501,   34,   34,  501,  501,  501,  501,
			  525,  513,  501,  526,  501,  501,  501,  501,  501,  513,
			  501,  501,  501,  501,  501,  501,  501,  514,  501,  514,
			  501,  514,  514,  515,  501,  515,  501,  516,  501,  516,
			  501,  517,   64,  151,   19,  154,  155,  527,   72,  501,
			  520,   77,   77,   77,  518,  160,  501,  501,  501,  519,
			  501,  519,  169,  172,  172,  519,  501,  520,  528,  529,
			  529,  520,  520,  160,   72,  160,  160,  518,  501,   89,
			   89,   89,  501,  509,  501,   87,   87,   87,   87,  527, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  501,  501,  501,  501,  522,  501,  501,  501,
			  501,  501,  501,  501,  151,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  524,  530,  501,  501,  110,  527,
			   34,  501,  501,  501,  525,  501,  501,  501,  501,  501,
			  501,  501,  501,  155,  501,  155,  501,  517,  501,  501,
			  517,  501,  527,   77,   77,   77,  501,  501,  529,  501,
			  501,  172,  172,  172,  501,  501,  501,  175,  169,  501,
			  501,  501,  531,  501,  258,  274,  274,  529,  520,  278,
			  520,  501,  501,   87,  501,   87,  501,   89,  501,  517,
			  501,   89,  501,  501,  501,  501,  501,  532,  533,  501,

			  501,  501,  533,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  534,  530,
			  501,  501,  535,  527,  527,  323,   34,  501,  501,  536,
			  501,  501,  537,  501,  517,  517,  274,  274,  274,  501,
			  501,  501,  501,  501,  501,  501,  529,  520,  520,  520,
			  278,  517,  517,  538,  501,  501,  501,  501,  501,  539,
			  501,  501,  532,  501,  533,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  220,  501,  501,
			  501,  501,  222,  501,  501,  501,  501,  534,  501,  501,
			  501,  501,  501,  371,  501,  323,  501,  229,  229,  229, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  527,  501,  229,  501,  501,  501,  501,  501,  540,  501,
			  501,  501,  537,  501,  501,  520,  520,  349,  501,  538,
			  541,  501,  501,  501,  539,  501,  501,  425,  501,  501,
			  501,  501,  501,  501,  501,  432,  229,  229,  229,  323,
			  323,  527,  501,  501,  501,  542,  501,  501,  540,  501,
			  501,  537,  501,  501,  543,  501,  520,  520,  349,  501,
			  541,  501,  501,  501,  501,  539,  501,  501,  466,  501,
			  501,  527,  501,  527,  501,  323,  527,  501,  323,  527,
			  501,  527,  501,  229,  542,  501,  501,  501,  540,  501,
			  501,  543,  501,  501,  229,  229,  527,  501,  501,  501,

			  543,    0,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501, yy_Dummy>>,
			1, 144, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (45, 200, 5759)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (45, 5960, 8191)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (45, 8392, 12287)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   45,   45,   45,   45,   45,   45,   45,   45,    1,
			    2,    1,    1,    3,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,    6,   24,   25,   26,   24,   27,
			   24,   28,   29,   28,   28,   28,   29,   28,   30,   31,
			   28,   29,   29,   29,   29,   29,   29,   28,   32,   28,
			   28,   33,   34,   35,    4,   36,   37,   38,   39,   40,

			   38,   27,   38,   28,   41,   28,   28,   28,   41,   28,
			   42,   31,   28,   41,   41,   41,   41,   41,   41,   28,
			   32,   28,   28,   43,    6,   35,   44,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			    1,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,

			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45, yy_Dummy>>,
			1, 200, 5760)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,    1,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,    1,   45,   45,   45,   45,

			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45, yy_Dummy>>,
			1, 200, 8192)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   45,   45, yy_Dummy>>,
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
			    9,   12,   12,    4,   15,   15, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 502)
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
			    1,    1,    1,    1,    1,    1,    2,    6,   10,   13,
			   18,   21,   27,   30,   33,   36,   39,   44,   48,   52,
			   55,   58,   61,   64,   68,   72,   76,   78,   80,   84,
			   87,   89,   91,   93,   96,   98,  100,  102,  104,  107,
			  109,  111,  113,  115,  117,  119,  121,  124,  126,  128,
			  130,  132,  134,  135,  135,  135,  135,  137,  137,  140,
			  140,  141,  142,  143,  147,  148,  149,  149,  150,  151,
			  152,  153,  154,  155,  156,  158,  159,  161,  165,  167,
			  168,  170,  172,  174,  174,  175,  175,  177,  179,  180,

			  181,  182,  186,  189,  190,  190,  191,  193,  193,  193,
			  193,  195,  197,  198,  198,  200,  202,  204,  204,  206,
			  206,  207,  208,  210,  210,  211,  211,  212,  213,  214,
			  216,  218,  220,  220,  221,  222,  222,  223,  223,  224,
			  224,  225,  225,  225,  225,  227,  227,  230,  230,  231,
			  231,  233,  234,  236,  238,  241,  243,  246,  248,  249,
			  257,  257,  258,  259,  260,  262,  262,  272,  274,  274,
			  275,  285,  286,  287,  288,  289,  291,  297,  297,  298,
			  299,  300,  300,  301,  301,  302,  302,  302,  303,  304,
			  306,  310,  314,  315,  316,  317,  321,  326,  329,  334, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  335,  336,  337,  338,  340,  340,  341,  342,  344,  344,
			  346,  346,  346,  346,  349,  350,  351,  353,  354,  358,
			  358,  360,  360,  362,  362,  364,  364,  365,  365,  367,
			  368,  370,  371,  371,  372,  373,  373,  373,  374,  375,
			  376,  376,  377,  378,  380,  381,  383,  385,  385,  387,
			  389,  389,  390,  391,  392,  393,  394,  398,  398,  399,
			  404,  404,  405,  406,  407,  412,  412,  418,  419,  420,
			  423,  423,  425,  425,  429,  430,  431,  432,  434,  434,
			  434,  434,  436,  438,  441,  443,  446,  449,  450,  453,
			  454,  457,  458,  460,  460,  461,  462,  463,  464,  465,

			  465,  469,  471,  473,  474,  474,  474,  474,  478,  479,
			  479,  481,  483,  484,  484,  486,  488,  489,  489,  491,
			  493,  494,  494,  495,  498,  500,  504,  506,  506,  506,
			  508,  508,  508,  508,  508,  509,  510,  511,  512,  513,
			  516,  516,  517,  517,  517,  519,  519,  520,  520,  520,
			  520,  520,  522,  524,  525,  527,  527,  528,  528,  528,
			  528,  528,  529,  530,  531,  532,  532,  533,  533,  533,
			  533,  541,  543,  545,  545,  545,  546,  546,  548,  549,
			  549,  550,  550,  552,  553,  553,  554,  554,  556,  557,
			  557,  558,  560,  561,  563,  563,  566,  568,  569,  570, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  571,  574,  577,  578,  579,  580,  580,  580,  580,  580,
			  580,  581,  582,  583,  583,  583,  583,  583,  583,  584,
			  585,  586,  588,  589,  590,  591,  593,  593,  595,  599,
			  599,  599,  599,  601,  602,  602,  604,  606,  609,  612,
			  615,  619,  622,  622,  624,  624,  625,  625,  625,  625,
			  625,  625,  625,  625,  625,  625,  625,  625,  625,  625,
			  626,  627,  628,  628,  628,  628,  628,  632,  632,  636,
			  637,  637,  639,  641,  643,  645,  648,  650,  652,  655,
			  658,  661,  664,  667,  668,  668,  668,  668,  668,  668,
			  668,  668,  668,  670,  670,  672,  674,  677,  678,  678,

			  678,  678,  678, yy_Dummy>>,
			1, 103, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 677)
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
			    0,  117,   16,  115,  116, -136,  110,  111,  115,  116,
			  110,  111,  116,    1,   16,  115,  116, -136,   57,  115,
			  116,   13,   16,  115,  116, -131, -136,    1,  115,  116,
			   32,  115,  116,    1,  115,  116,    1,  115,  116,    1,
			   16,  115,  116, -136,   72,  115,  116, -189,   72,  115,
			  116, -189,    1,  115,  116,    1,  115,  116,    1,  115,
			  116,    1,  115,  116,   11,  115,  116, -128,   11,  115,
			  116, -128,   16,  115,  116, -136,  115,  116,  114,  116,
			  112,  113,  114,  116,  112,  113,  116,  114,  116,   63,
			  116,   68,  116,   64,  116, -181,   67,  116,   71,  116,

			   71,  116,   70,  116,   69,   71,  116,   45,  116,   45,
			  116,   44,  116,   51,  116,   51,  116,   50,  116,   51,
			  116,   48,   51,  116,   51,  116,   54,  116,   53,  116,
			   54,  116,   16, -136,  -20,  110,  111,    2,    3,  -20,
			   57,   57,   57,   41,   55, -158, -172,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57, -159,   57,  -15,
			  -20,   13,   16, -131, -136,   13, -131,   13,   13, -131,
			   13, -131,    2,    3,   32,   31,   32,   16, -136,    2,
			  111,    5,  103,  109, -216, -222,    5,   16, -136,  -73,
			 -214,   72, -189,   78, -195,   16, -136,  -12,   11, -128, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   11, -128,   76, -193,  112,  113,  113,   63,   64, -181,
			  -65,   66,   66,   58,   63,   66,   61,   66,   62,   66,
			   70,   69,   44,   50,   48,   49,   50,   46,   48, -163,
			   53,   52,   53,   16,   16, -135,   16, -134,   16, -135,
			 -136,   16, -136,   16, -134, -136,    3,  -20,   57,   36,
			   39,   41,   55, -154, -156, -158, -172,   57,   57,   57,
			   57, -159,   33,   36,   39,   41,   55, -150, -154, -156,
			 -158, -172,  -42,  -56,   57,   35,   36,   39,   41,   55,
			 -153, -154, -156, -158, -172,   57,   57,   57,   57,   57,
			 -159,   33,   41,   55, -150, -158, -172,   57,   57,   57,

			 -159,   57,   57,  -43,   13,   16,   13,   16, -131, -135,
			   13,   16, -131, -134,  -15,   13,   14,   13,   16, -131,
			 -136,   13,   16, -131, -135, -136,   13,   16, -136,   13,
			   16, -131, -134, -136,    3,   21,   32,   30,    2,    4,
			  111,  111,    6,    7, -100, -106,    6,    7,  -20,   16,
			  101,  -98,  101,  101,  103,  109, -216, -222,   92, -209,
			   86, -203,   80, -197,  -79,   74, -191,    3,   11, -128,
			  -77,  113,  113,   60,   60,  -47,   17,  -19,   16, -136,
			  -18,   16, -136,  -19,  -20,   17,  -20,  -18,  -20,    3,
			    3,   57,   57,   57,  -38,  -40,  -42,  -56,   57,  -34, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  -38,  -40,  -42,  -56,   57,   57,   57,  -37,  -38,  -40,
			  -42,  -56,   35,   41,   55, -153, -158, -172,   57,   57,
			  -34,  -42,  -56,   55, -172,   39,   55, -156, -172,   57,
			   57,   57,   57, -159,   14,   17,  -15,  -19,   13,   16,
			 -136,  -15,  -18,   13,   16, -136,  -15,  -19,  -20,   13,
			   14,   17,  -20,  -15,  -15,  -18,  -20,   13,   22,   23,
			   24,   29,   29,    4,    7,  103,  109, -216, -222,  109,
			 -222,    7,  -20,  -98,  102,  108, -215, -221,  -93,   96,
			 -213,   94, -211,  -87,   90, -207,   88, -205,  -81,   84,
			 -201,   82, -199,  -75, -220,    3,   16, -136,    3,  -20,

			    3,   16, -135, -136,   11, -128,   59,   63,  -19,  -18,
			   57,   57,   57,  -37,  -42,  -56,  -56,  -40,  -56,   57,
			  -15,  -19,  -15,  -18,   23,   25,   26,   32,    4,    4,
			    7,    7, -106,  102,  103,  108,  109, -215, -216, -221,
			 -222,  109, -222,  -99, -105,  -97,   92, -209,  -95,  -91,
			   86, -203,  -89,  -85,   80, -197,  -83,  107, -104,  107,
			  107,  109, -222,    3,   16, -136,    3,  -20,    3,    3,
			    3,    3,  -19,  -20,    3,  -19,  -20,    3,  -12,    8,
			   60,   60,   60,   23,   23,   26,   27, -144,   29,   29,
			   29,  109, -222,  109, -222,  -99, -100, -105, -106,  108, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			 -221, -104,  108, -221,    3,   16,    3,   16, -135,    3,
			   16, -134,    3,   16, -136,    3,   16, -134, -136,    3,
			  -19,  -20,    9,   10,  -12,   26,   26,  -28,  108,  109,
			 -221, -222,  108,  109, -221, -222, -105,    3,   17,    3,
			   17,    3,  -19,    3,  -19,    3,   16, -136,    3,  -18,
			    3,  -18,    3,   16, -136,    3,   17,  -20,    3,   17,
			  -20,    3,  -18,  -20,    3,  -18,  -20,    3, -105, -106,
			    3,  -19,    3,  -18,    3,  -18,  -20,   10, yy_Dummy>>,
			1, 78, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2879
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 501
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 502
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 45
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

	yyNb_rules: INTEGER = 116
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 117
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
			-- Start condition codes

feature -- User-defined features



end
