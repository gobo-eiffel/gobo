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
				process_one_char_symbol (unicode_text_item (1))
			
when 2 then
yy_set_line_column
--|#line 42 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 42")
end

				last_text_count := 1
				last_break_end := text_count
				last_comment_end := 0
				process_one_char_symbol (unicode_text_item (1))
			
when 3 then
yy_set_line_column
--|#line 48 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 48")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol (unicode_text_item (1))
			
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
			create an_array.make_filled (0, 0, 2773)
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
			an_array.area.fill_with (501, 2728, 2773)
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
			   33,   33,   33,   22,   19,   22,   16,   38,   39,   38,
			   38,   39,   38,   42,   42,  500,   43,   43,   40,   44,
			   44,   40,   46,   47,   46,   46,   47,   46,  492,   48,
			   59,   60,   48,   50,   51,   50,   50,   51,   50,   53,
			   54,   55,  488,   56,   53,   54,   55,  485,   56,   59,
			   60,   62,   62,   62,   66,   66,   66,   66,   66,   66,

			   95,   96,   63,  122,  102,   67,  123,   97,   67,  100,
			   64,  100,   65,   57,   68,   68,   68,  496,   57,   92,
			   92,   92,  132,  133,  132,   69,  112,  112,  112,  134,
			   93,  148,  149,   64,  102,   65,   71,  113,   71,   72,
			   73,   74,   75,   76,   71,   75,   72,   77,   78,   79,
			   71,   71,   71,   71,   80,   81,   75,   82,   83,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   84,   85,
			   75,   71,   70,   71,   71,   71,   71,   71,   84,   72,
			   71,   70,   86,   86,   86,   87,  154,   87,  501,   61,
			  150,  149,   87,   89,  151,   87,   98,   98,   98,  501, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,   90,  152,   91,  153,  469,  501,   99,  112,  112,
			  112,  465,   62,  501,  501,   87,   61,  100,   87,  113,
			  154,   92,   92,   92,  461,   87,  114,   61,   92,   92,
			   92,  458,   93,  135,  136,  135,  176,  115,  114,   93,
			  100,  100,  101,  101,  101,  101,  103,  103,  103,  115,
			  451,  157,   75,   92,   92,   92,  485,  104,  105,  154,
			  106,  106,  106,  106,  111,  484,  155,   92,   92,   92,
			  107,  108,  100,  100,  501,  176,  156,  109,   93,  138,
			  139,  110,  140,   75,  107,  108,  428,  100,   62,   62,
			   62,  116,  116,  116,  116,  118,  118,  118,  229,   63,

			  118,  118,  118,  124,  124,  124,  119,  138,  145,  186,
			  146,  119,  117,  268,  125,  187,  188,  187,  445,  176,
			   61,  102,  127,  128,  127,  126,  129,  126,  126,  129,
			  129,  129,  126,  126,  126,  130,  126,  126,  126,  126,
			  126,  129,  126,  129,  126,  129,  129,  129,  126,  126,
			  129,  129,  126,  126,  126,  126,  126,  126,  126,  131,
			  131,  131,  131,  131,  126,  126,  126,  126,  141,  138,
			  142,  441,  140,  141,  144,  142,  439,  140,   66,   66,
			   66,   92,   92,   92,  167,  167,  167,  186,  176,   67,
			  166,   70,   93,  205,  122,  168,   73,  123,  122,  184, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   75,  123,  143,  206,   75,  433,   75,  143,  158,  159,
			  158,   71,  160,   71,   71,  158,  161,   71,  158,  388,
			  192,  192,  192,   71,  162,   71,  163,   71,  385,  184,
			  185,  197,  148,  149,   70,  220,  220,  164,  158,   71,
			  329,  158,   75,   75,   70,  150,  149,  164,  158,  159,
			  158,   71,   73,   71,  271,  165,  221,  272,   71,   71,
			  246,   71,  451,  192,  192,  192,   71,   71,  154,   71,
			  501,  192,  192,  192,  193,   92,   92,   92,  203,  203,
			  203,   71,  197,  186,   71,  233,   93,  179,  383,  204,
			   88,   71,  198,   71,   71,  234,   71,  169,  170,  169,

			  122,  160,  251,  123,  169,  172,  253,  169,  501,  207,
			  207,  207,  252,  173,  254,  174,  255,  213,  213,  213,
			  208,  222,  222,  222,  380,  251,  175,  169,  214,  378,
			  169,  116,  116,  116,  116,  252,  175,  169,   71,  158,
			  178,  375,  223,  179,  180,  180,  236,  128,  236,  181,
			  138,  139,  117,  140,  372,  180,  205,  180,  230,  180,
			  180,  180,  114,  185,  180,  180,  206,  268,  182,  132,
			  133,  132,  230,  366,  114,  171,  134,   74,  182,   70,
			  176,   70,  501,  183,  144,  139,   70,  140,  421,   70,
			  118,  118,  118,  138,  145,   70,  146,   75,  135,  136, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  135,  119,  124,  124,  124,  237,  238,  238,  238,   70,
			  182,  420,   70,  125,  141,  138,  142,  344,  140,   70,
			  182,   70,   86,   86,   86,   87,   89,   87,  341,   61,
			  410,  410,   87,  189,   90,   87,   91,  339,  141,  144,
			  142,  190,  140,  191,  144,  145,  273,  146,  143,  239,
			  239,  239,  242,  242,  242,   87,  311,  311,   87,   73,
			  240,  320,  185,  243,  180,   87,   70,   61,  194,  194,
			  194,  195,  143,  195,   71,   97,   70,  221,  195,   86,
			  412,  195,  412,  241,  241,  241,  458,  196,  244,  244,
			  244,  187,  188,  187,   62,  246,  246,  246,  316,  245,

			  233,  195,  154,  424,  195,  424,  247,  248,  248,  248,
			  234,  195,  249,   97,  209,  209,  209,  251,   63,  312,
			  154,  249,  249,  249,  448,  210,  448,  252,  101,  101,
			  101,  101,  250,  256,  256,  256,   73,  308,  361,  186,
			  211,  422,  422,   70,  257,  259,  259,  259,  362,  212,
			  216,  216,  216,   71,   62,  353,  260,  264,  264,  264,
			  326,  217,  154,  114,  218,  218,  218,  218,  265,  187,
			  188,  187,  269,  269,  269,  114,  219,  226,  226,  226,
			  166,  271,  170,  270,  165,  186,  363,  253,  227,  268,
			  290,  228,  228,  228,  228,  254,  364,  255,  363,  280, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  188,  280,  286,  501,  187,  188,  187,  343,  364,  277,
			  251,  269,  110,  231,  231,  231,  281,  281,  281,  277,
			  252,  282,  282,  282,  232,  377,  377,  116,  116,  116,
			  116,  182,  283,  284,  284,  284,  194,  194,  194,   71,
			   88,  182,  198,  501,  285,  446,  446,  192,  117,  178,
			  418,   62,  258,  180,  180,  315,  315,  315,  181,  154,
			  419,  286,  286,  286,  180,  264,  180,   62,  180,  180,
			  180,   62,  287,  180,  180,  154,  223,  182,   62,  154,
			   90,  501,   91,  288,  288,  288,  154,  182,   71,  170,
			   71,  169,  170,  169,  289,  160,  361,  259,  169,  261,

			  161,  169,   90,  356,   91,  363,  362,  262,  173,  263,
			  174,  292,  292,  292,  256,  364,  290,  290,  290,  251,
			  175,  169,  293,  335,  169,  465,  491,  291,  491,  252,
			  175,  169,   71,  158,   71,   90,   71,   91,  266,  334,
			  121,  165,  203,  203,  203,  267,  295,  296,  296,  296,
			  205,  205,  205,  204,  207,  207,  207,  327,  328,  328,
			  328,   67,  488,  299,  299,  208,  175,  300,  300,  300,
			  300,  301,  301,  301,  301,  436,  175,  185,   71,   71,
			   74,  179,   74,  437,  183,  438,  239,   74,   71,  180,
			   74,  179,  212,  207,  207,  207,   74,  231,  233,  233, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  233,  306,  306,  226,  208,  307,  307,  307,  307,  119,
			   74,  159,  225,   74,  186,  316,  316,  316,   70,  418,
			   74,  303,   70,  258,  273,  258,  317,  160,   71,  419,
			  258,  274,  302,  258,  320,  320,  320,  489,  489,  275,
			  209,  276,  236,  128,  236,  321,  322,  251,  251,  251,
			  318,  439,  277,  258,  410,  410,  258,  159,   93,  199,
			  185,  440,  277,  258,   70,  258,  501,  329,  238,  238,
			  238,  238,   71,  298,   70,  449,  278,  279,  279,  279,
			  170,  422,  422,  185,  411,  411,  411,  268,  297,  333,
			  339,  339,  339,  459,  182,  171,  294,   74,  341,  341,

			  341,  340,  463,  460,  182,  209,  209,  209,  251,  342,
			  177,  177,  344,  344,  344,  179,  210,  177,  252,  218,
			  218,  218,  218,  345,  177,  177,  280,  188,  280,  179,
			  501,  304,  179,  292,  292,  292,  300,  300,  300,  300,
			  305,  308,  308,  308,  293,  167,  288,  288,  288,  354,
			  354,  354,  309,  178,  459,  220,  220,  351,  182,  180,
			  355,  288,  288,  288,  460,   90,  273,   91,  182,  186,
			  124,  251,  352,  179,  235,  500,  310,  312,  312,  312,
			   90,  252,   91,  356,  296,  296,  296,  296,  313,  120,
			  112,  222,  222,  222,  369,  369,  225,  103,  370,  370, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  370,  370,  423,  423,  423,  360,  371,  371,  371,  371,
			  251,  251,  314,  251,  251,  323,  251,  323,   61,  323,
			  252,  252,  323,  324,  252,  323,  252,  305,  385,  385,
			  385,  325,  307,  307,  307,  307,  388,  388,  388,  386,
			  400,  401,  400,  251,  200,  323,  202,  389,  323,  273,
			  200,  402,  185,  252,  199,  323,  179,  323,  329,  238,
			  238,  238,  238,  318,  180,  184,  179,  176,  166,  330,
			  331,  225,  413,  414,  414,  414,  332,  354,  354,  354,
			  333,  446,  446,  330,  331,  258,  273,  258,  355,  160,
			   99,  120,  258,  336,  501,  258,  238,  238,  238,  238,

			  501,  337,  486,  338,  121,  328,  328,  328,  328,  501,
			  501,  501,  489,  489,  277,  258,  501,  333,  258,  415,
			  415,  416,  416,  416,  277,  258,  409,  258,  179,  271,
			  179,  501,  183,  498,  501,  179,  180,  182,  179,  182,
			  224,  177,  224,  501,  179,  224,  180,  182,  501,  182,
			  426,  426,  177,  177,  427,  427,  427,  427,  179,  177,
			  501,  179,  296,  296,  296,  296,  177,  177,  179,  501,
			  179,  346,  188,  346,  501,  271,  501,  501,  165,  361,
			  361,  361,  501,  360,  363,  363,  363,  382,  382,  382,
			  204,  425,  425,  425,  425,  208,  370,  370,  370,  370, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  251,  251,  251,  277,  316,  316,  316,  432,  432,  432,
			  432,   93,  365,  277,  501,  317,  393,  393,  393,  393,
			  251,  251,  251,  180,  279,  279,  279,  279,  374,  501,
			  501,   93,  501,  501,  347,  348,  447,  447,  447,  318,
			  501,  349,  182,  501,  501,  350,  501,  501,  347,  348,
			  501,  501,  182,  356,  296,  296,  296,  296,  501,  418,
			  418,  418,  434,  434,  357,  358,  435,  435,  435,  435,
			  293,  359,  442,  442,  442,  360,  443,  501,  357,  358,
			  209,  209,  209,  444,  328,  328,  328,  328,  329,  410,
			  410,  210,  501,  501,  300,  300,  300,  300,  329,  411,

			  411,  411,  461,  461,  461,  409,  356,  422,  422,  501,
			  449,  501,  501,  462,  443,  365,  366,  366,  366,  501,
			  450,  178,  414,  414,  414,  414,  501,  367,  463,  501,
			  301,  301,  301,  301,  356,  423,  423,  423,  427,  427,
			  427,  427,  368,  455,  427,  427,  427,  427,  471,  472,
			  471,  212,  372,  372,  372,  501,  464,  466,  466,  466,
			  466,  501,   97,  373,   97,  501,  307,  307,  307,  307,
			  467,  467,  501,   97,  468,  468,  468,  468,  430,  435,
			  435,  435,  435,  435,  435,  435,  435,  374,  375,  375,
			  375,  501,  501,  473,  474,  473,  476,  477,  476,  376, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  377,  377,  475,  501,  501,  478,  479,  480,
			  479,  501,  199,  501,  440,  501,  481,  482,  481,  501,
			  121,  446,  446,  310,  378,  378,  378,  483,  501,  501,
			  442,  442,  442,  501,  443,  379,  501,  501,  311,  311,
			  501,  444,  486,  121,  447,  447,  447,  411,  411,  411,
			  490,  490,  490,  459,  459,  459,  501,  501,  501,  221,
			  380,  380,  380,  501,  355,  487,  415,  415,  450,  501,
			  501,  381,  443,  501,  382,  382,  382,  501,  414,  414,
			  414,  414,  501,  501,  182,  501,  501,  456,  423,  423,
			  423,  501,  501,  501,  182,  314,  383,  383,  383,  455,

			  468,  468,  468,  468,  501,  501,  501,  384,  501,  464,
			  315,  315,  315,  468,  468,  468,  468,  251,  251,  251,
			  501,  447,  447,  447,  251,  251,  251,  501,   93,  501,
			  501,  223,  391,  391,  391,   93,  501,  501,  501,  479,
			  480,  479,  487,  392,  501,  501,  393,  393,  393,  393,
			  494,  501,  251,  251,  251,  178,  489,  489,  394,  157,
			  396,  157,  395,   93,  395,  501,  395,  501,  501,  395,
			  397,  501,  395,  479,  480,  479,  501,  498,  398,  501,
			  399,  501,  501,  501,  495,  251,  251,  251,  251,  251,
			  251,  501,  395,  501,  501,  395,   93,  501,  319,   93, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  319,  501,  395,  319,  395,  403,  403,  403,  501,  404,
			  501,  485,  485,  485,  501,  497,  405,  178,  490,  490,
			  490,  501,  444,  490,  490,  490,   61,   61,  501,  501,
			   61,  501,   61,  501,  114,   61,  501,  501,  501,  499,
			  501,   61,  501,  501,  499,  501,  114,  404,  121,  328,
			  328,  328,  328,  497,  501,  501,  501,  501,  501,  406,
			  407,  501,  501,   97,   97,  501,  408,   97,  501,   97,
			  409,  501,   97,  406,  407,  346,  188,  346,   97,  271,
			  501,  201,  165,  201,  201,  501,  501,  501,  201,  201,
			  121,  201,  121,  121,  501,  501,  501,  121,  121,  501,

			  121,  178,  501,  178,  178,  501,  501,  277,  178,  178,
			  501,  178,  501,  387,  387,  501,  501,  277,  501,  387,
			  501,  387,  501,  387,  501,  501,  387,  501,  417,  417,
			  417,  417,  501,  501,  501,  501,  501,  417,  417,  417,
			  417,  501,  501,  501,  501,  501,  182,  501,  501,  501,
			  501,  417,  417,  417,  501,  501,  182,  428,  428,  428,
			  501,  501,  501,  501,  501,  501,  501,  501,  429,  501,
			  501,  370,  370,  370,  370,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  430,  366,  366,  366,  501,  501,  501,  501, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  501,  501,  367,  501,  501,  371,  371,  371,
			  371,  501,  501,  501,  501,  501,  501,  501,  501,  431,
			  501,  501,  501,  501,  501,  501,  501,  501,  305,  178,
			  414,  414,  414,  414,  501,  501,  501,  501,  501,  501,
			  452,  453,  501,  501,  501,  501,  501,  454,  501,  501,
			  501,  455,  501,  501,  452,  453,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  180,  415,  415,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  182,  501,  501,  456,  501,  501,
			  501,  501,  501,  501,  182,  501,  501,  501,  501,  501,

			  501,  501,  501,  501,  180,  416,  416,  416,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  182,  501,  501,  457,  501,  501,  501,
			  501,  501,  501,  182,  366,  366,  366,  501,  501,  501,
			  501,  501,  501,  501,  501,  367,  501,  501,  425,  425,
			  425,  425,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  365,
			  469,  469,  469,  501,  501,  501,  501,  501,  501,  501,
			  501,  470,  501,  501,  432,  432,  432,  432,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  501,  501,  501,  374,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  416,  416,  416,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  182,  501,  501,  457,  501,  501,
			  501,  501,  501,  501,  182,  492,  492,  492,  501,  501,
			  501,  501,  501,  501,  501,  501,  493,  501,  501,  466,
			  466,  466,  466,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  430,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   41,   41,   41,

			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   41,   41,   41,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   88,   88,  501,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,  501,   88,   94,  501,   94,   94,   94,   94,   94, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   94,   94,   94,   94,   94,   94,   94,   94,   94,  114,
			  114,  501,  501,  501,  501,  114,  501,  114,  501,  114,
			  114,  114,  114,  121,  501,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  171,  501,  171,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  171,

			  171,  171,  171,  177,  501,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,  215,  215,  215,  215,  215,
			  215,  215,  501,  215,  215,  215,  215,  215,  215,  215,
			  215,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  178,  501,  178,  178,  178,  178,  178,
			  178,  178,  178,  178,  178,  178,  178,  178,  178,  180, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  501,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  390,  390,  390,
			  390,  390,  390,  390,  501,  390,  390,  390,  390,  390,
			  390,  390,  390,  121,  501,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  353,
			  353,  353,  353,  353,  353,  353,  353,  353,  353,  353,
			  353,  353,  353,  353,  353,  420,  420,  420,  420,  420,

			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  484,  484,  484,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,   15, yy_Dummy>>,
			1, 128, 2600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2773)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 46)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (20, 138, 181)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (44, 322, 367)
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
			an_array.area.fill_with (501, 2727, 2773)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    3,    3,    4,    4,    4,    5,    6,  500,    5,
			    6,    3,    5,    6,    4,    7,    7,    7,    8,    8,
			    8,  493,    7,   13,   13,    8,    9,    9,    9,   10,
			   10,   10,   11,   11,   11,  488,   11,   12,   12,   12,
			  484,   12,   14,   14,   16,   16,   16,   17,   17,   17,
			   18,   18,   18,   23,   23,   16,   41,   26,   17,   41,
			   31,   18,   31,   16,   26,   16,   11,   19,   19,   19,
			  483,   12,   22,   22,   22,   46,   46,   46,   19,   33,
			   33,   33,   46,   22,   58,   58,   19,   26,   19,   20,
			   33, yy_Dummy>>,
			1, 91, 47)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   21,   21,   21,   21,   65,   21,   65,   21,   60,   60,
			   21,   21,   61,   21,   24,   24,   24,   28,   28,   21,
			   61,   21,   61,  470,   28,   24,   34,   34,   34,  465,
			   63,   28,   28,   21,   61,   24,   21,   34,   63,   29,
			   29,   29,  462,   21,  114,   21,   25,   25,   25,  458,
			   29,   50,   50,   50,   80,   34,  114,   25,   25,   29,
			   25,   25,   25,   25,   27,   27,   27,   34,  451,   69,
			   80,   30,   30,   30,  445,   27,   27,   69,   27,   27,
			   27,   27,   30,  444,   64,   32,   32,   32,   27,   27,
			   30,   30,   64,   78,   64,   27,   32,   52,   52,   27,

			   52,   78,   27,   27,  429,   32,   35,   35,   35,   36,
			   36,   36,   36,   38,   38,   38,  111,   35,   39,   39,
			   39,   43,   43,   43,   38,   57,   57,  174,   57,   39,
			   36,  174,   43,   84,   84,   84,  405,   84,  111,   35, yy_Dummy>>,
			1, 140, 182)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   53,   53,   53,  402,   53,   55,   55,   55,  399,   55,
			   66,   66,   66,   68,   68,   68,   73,   73,   73,   82,
			   83,   66,   79,   82,   68,   99,  121,   73,  161,  121,
			  129,   79,   82,  129,   53,   99,   83,  392,   79,   55,
			   70,   70,   70,   70,   70,  161,   70,   70,   70,   70,
			   70,  389,   91,   91,   91,   70,   70,   70,   70,   70,
			  386,   79,   81,   91,  147,  147,   81,  107,  107,   70,
			   70,   70,  412,   70,   81,   81,   81,  149,  149,   70,
			   70,  253,   70,   71,   71,   71,  178,   71,  107,  178,
			   71,   71,  247,   71,  412,   88,   88,   88,  253,   71,

			  247,   71,   88,   90,   90,   90,   88,   92,   92,   92,
			   98,   98,   98,   71,   90,  276,   71,  120,   92,  276,
			  384,   98,   90,   71,   90,   71,   74,  120,   74,   74,
			   74,   74,  329,   74,  157,  329,   74,   74,  158,   74,
			   88,  100,  100,  100,  157,   74,  158,   74,  158,  102,
			  102,  102,  100,  108,  108,  108,  381,  199,   74,   74,
			  102,  379,   74,  117,  117,  117,  117,  199,   74,   74,
			   74,   74,   76,  376,  108,   76,   76,   76,  127,  127,
			  127,   76,  137,  137,  117,  137,  373,   76,  206,   76,
			  115,   76,   76,   76,  115,  173,   76,   76,  206,  173, yy_Dummy>>,
			1, 200, 368)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   76,  132,  132,  132,  115,  367,  115,  173,  132,  173,
			   76,   77,   77,   77,  177,   77,  139,  139,   77,  139,
			  356,   77,  118,  118,  118,  143,  143,   77,  143,   77,
			  135,  135,  135,  118,  122,  122,  122,  130,  130,  130,
			  130,   77,  177,  355,   77,  122,  141,  141,  141,  345,
			  141,   77,  177,   77,   87,   87,   87,   87,  195,   87,
			  342,   87,  330,  330,   87,   87,  195,   87,  195,  340,
			  142,  142,  142,   87,  142,   87,  145,  145,  336,  145,
			  141,  146,  146,  146,  152,  152,  152,   87,  221,  221,
			   87,  162,  146,  321,  162,  152,  417,   87,  162,   87,

			   89,   89,   89,   89,  142,   89,  162,   89,  162,  221,
			   89,   89,  536,   89,  536,  151,  151,  151,  417,   89,
			  153,  153,  153,  164,  164,  164,  151,  154,  154,  154,
			  317,  153,  234,   89,  151,  538,   89,  538,  154,  155,
			  155,  155,  234,   89,  250,   89,  101,  101,  101,  252,
			  155,  313,  250,  156,  156,  156,  539,  101,  539,  252,
			  101,  101,  101,  101,  156,  159,  159,  159,  163,  309,
			  297,  163,  101,  357,  357,  163,  159,  166,  166,  166,
			  297,  101,  105,  105,  105,  163,  289,  293,  166,  170,
			  170,  170,  230,  105,  289,  230,  105,  105,  105,  105, yy_Dummy>>,
			1, 200, 568)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  170,  175,  175,  175,  176,  176,  176,  230,  105,  110,
			  110,  110,  184,  180,  263,  176,  180,  263,  298,  184,
			  110,  263,  291,  110,  110,  110,  110,  184,  298,  184,
			  302,  182,  182,  182,  287,  182,  187,  187,  187,  272,
			  302,  180,  324,  270,  110,  116,  116,  116,  189,  189,
			  189,  180,  324,  190,  190,  190,  116,  377,  377,  116,
			  116,  116,  116,  182,  190,  191,  191,  191,  193,  193,
			  193,  267,  190,  182,  190,  193,  191,  406,  406,  193,
			  116,  160,  353,  334,  160,  160,  160,  223,  223,  223,
			  160,  334,  353,  196,  196,  196,  160,  265,  160,  335,

			  160,  160,  160,  351,  196,  160,  160,  335,  223,  160,
			  352,  351,  196,  193,  196,  197,  197,  197,  352,  160,
			  169,  261,  169,  169,  169,  169,  197,  169,  362,  260,
			  169,  169,  268,  169,  197,  424,  197,  364,  362,  169,
			  268,  169,  268,  200,  200,  200,  257,  364,  198,  198,
			  198,  400,  169,  169,  200,  245,  169,  424,  542,  198,
			  542,  400,  169,  169,  169,  169,  171,  198,  171,  198,
			  171,  243,  448,  171,  203,  203,  203,  171,  202,  202,
			  202,  202,  205,  205,  205,  203,  207,  207,  207,  235,
			  235,  235,  235,  205,  448,  211,  211,  207,  171,  211, yy_Dummy>>,
			1, 200, 768)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  211,  211,  211,  212,  212,  212,  212,  395,  171,  275,
			  171,  171,  172,  275,  172,  395,  172,  395,  240,  172,
			  172,  275,  172,  275,  212,  213,  213,  213,  172,  232,
			  233,  233,  233,  219,  219,  227,  213,  219,  219,  219,
			  219,  233,  172,  255,  225,  172,  255,  224,  224,  224,
			  255,  419,  172,  217,  172,  179,  179,  179,  224,  179,
			  255,  419,  179,  179,  214,  179,  228,  228,  228,  452,
			  452,  179,  210,  179,  236,  236,  236,  228,  228,  251,
			  251,  251,  224,  398,  179,  179,  449,  449,  179,  254,
			  251,  398,  254,  398,  179,  179,  254,  179,  181,  238,

			  238,  238,  238,  238,  254,  208,  254,  449,  181,  181,
			  181,  181,  262,  463,  463,  262,  331,  331,  331,  262,
			  204,  238,  266,  266,  266,  420,  181,  262,  201,  262,
			  271,  271,  271,  266,  463,  420,  181,  218,  218,  218,
			  441,  271,  279,  279,  273,  273,  273,  186,  218,  279,
			  441,  218,  218,  218,  218,  273,  279,  279,  280,  280,
			  280,  185,  280,  218,  183,  292,  292,  292,  299,  299,
			  299,  299,  218,  220,  220,  220,  292,  168,  283,  283,
			  283,  294,  294,  294,  220,  491,  460,  220,  220,  283,
			  280,  165,  294,  285,  285,  285,  460,  283,  338,  283, yy_Dummy>>,
			1, 200, 968)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  280,  338,  125,  471,  285,  338,  123,  491,  220,  222,
			  222,  222,  285,  471,  285,  296,  296,  296,  296,  296,
			  222,  119,  113,  222,  222,  222,  304,  304,  109,  104,
			  304,  304,  304,  304,  358,  358,  358,  296,  305,  305,
			  305,  305,  473,  476,  222,  229,  479,  229,  481,  229,
			   97,  229,  473,  476,  229,  229,  479,  229,  481,  305,
			  318,  318,  318,  229,  306,  306,  306,  306,  319,  319,
			  319,  318,  325,  325,  325,  496,   96,  229,   95,  319,
			  229,  337,   94,  325,  337,  496,   93,  229,  337,  229,
			  237,  237,  237,  237,  237,  318,  337,   85,  337,   75,

			   72,  237,  237,  319,  343,  343,  343,  343,  237,  354,
			  354,  354,  237,  486,  486,  237,  237,  258,  258,  258,
			  354,  258,   67,   40,  258,  258,   15,  258,  333,  333,
			  333,  333,    0,  258,  486,  258,  328,  328,  328,  328,
			  328,  347,    0,  348,  498,  498,  258,  258,    0,  333,
			  258,  347,  347,  348,  348,  348,  258,  258,  328,  258,
			  274,  274,  274,    0,  274,  498,    0,  274,  274,  347,
			  274,  348,  523,  350,  523,    0,  274,  523,  274,  347,
			    0,  348,  368,  368,  350,  350,  368,  368,  368,  368,
			  274,  350,    0,  274,  360,  360,  360,  360,  350,  350, yy_Dummy>>,
			1, 200, 1168)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  274,    0,  274,  277,  277,  277,    0,  277,    0,    0,
			  277,  361,  361,  361,    0,  360,  363,  363,  363,  382,
			  382,  382,  361,  365,  365,  365,  365,  363,  369,  369,
			  369,  369,  396,  396,  396,  277,  387,  387,  387,  374,
			  374,  374,  374,  396,  365,  277,  278,  387,  393,  393,
			  393,  393,  401,  401,  401,  278,  278,  278,  278,  278,
			  374,    0,    0,  401,    0,    0,  278,  278,  407,  407,
			  407,  387,    0,  278,  278,    0,    0,  278,    0,    0,
			  278,  278,    0,    0,  278,  295,  295,  295,  295,  295,
			    0,  418,  418,  418,  394,  394,  295,  295,  394,  394,

			  394,  394,  418,  295,  403,  403,  403,  295,  403,    0,
			  295,  295,  300,  300,  300,  403,  409,  409,  409,  409,
			  410,  410,  410,  300,    0,    0,  300,  300,  300,  300,
			  411,  411,  411,  411,  421,  421,  421,  409,  422,  422,
			  422,    0,  410,    0,    0,  421,  403,  300,  301,  301,
			  301,    0,  411,  414,  414,  414,  414,  414,    0,  301,
			  422,    0,  301,  301,  301,  301,  423,  423,  423,  423,
			  426,  426,  426,  426,  301,  414,  427,  427,  427,  427,
			  436,  436,  436,  301,  307,  307,  307,    0,  423,  430,
			  430,  430,  430,    0,  517,  307,  517,    0,  307,  307, yy_Dummy>>,
			1, 200, 1368)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  307,  307,  431,  431,    0,  517,  431,  431,  431,  431,
			  430,  434,  434,  434,  434,  435,  435,  435,  435,  307,
			  310,  310,  310,    0,    0,  437,  437,  437,  438,  438,
			  438,  310,    0,    0,  310,  310,  437,    0,    0,  438,
			  439,  439,  439,    0,  437,    0,  437,    0,  440,  440,
			  440,    0,  446,  446,  446,  310,  311,  311,  311,  440,
			    0,    0,  442,  442,  442,    0,  442,  311,    0,    0,
			  311,  311,    0,  442,  446,  447,  447,  447,  447,  450,
			  450,  450,  453,  453,  453,  459,  459,  459,  456,    0,
			    0,  311,  314,  314,  314,    0,  459,  447,  456,  456,

			  450,    0,    0,  314,  442,    0,  314,  314,  314,    0,
			  455,  455,  455,  455,    0,    0,  456,    0,    0,  456,
			  464,  464,  464,    0,    0,    0,  456,  314,  315,  315,
			  315,  455,  467,  467,  467,  467,    0,    0,    0,  315,
			    0,  464,  315,  315,  315,  468,  468,  468,  468,  472,
			  472,  472,    0,  487,  487,  487,  474,  474,  474,    0,
			  472,    0,    0,  315,  322,  322,  322,  474,    0,    0,
			    0,  475,  475,  475,  487,  322,    0,    0,  322,  322,
			  322,  322,  475,    0,  477,  477,  477,  489,  489,  489,
			  322,  323,  323,  323,  323,  477,  323,    0,  323,    0, yy_Dummy>>,
			1, 200, 1568)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  323,  323,    0,  323,  478,  478,  478,    0,  489,
			  323,    0,  323,    0,    0,    0,  478,  480,  480,  480,
			  482,  482,  482,    0,  323,    0,    0,  323,  480,    0,
			  529,  482,  529,    0,  323,  529,  323,  326,  326,  326,
			    0,  326,    0,  485,  485,  485,    0,  485,  326,  490,
			  490,  490,  490,    0,  485,  499,  499,  499,  508,  508,
			    0,    0,  508,    0,  508,    0,  326,  508,    0,    0,
			    0,  490,    0,  508,    0,    0,  499,    0,  326,  326,
			  327,  327,  327,  327,  327,  485,    0,    0,    0,    0,
			    0,  327,  327,    0,    0,  511,  511,    0,  327,  511,

			    0,  511,  327,    0,  511,  327,  327,  346,  346,  346,
			  511,  346,    0,  520,  346,  520,  520,    0,    0,    0,
			  520,  520,  525,  520,  525,  525,    0,    0,    0,  525,
			  525,    0,  525,  530,    0,  530,  530,    0,    0,  346,
			  530,  530,    0,  530,    0,  533,  533,    0,    0,  346,
			  349,  533,    0,  533,    0,  533,    0,    0,  533,    0,
			  349,  349,  349,  349,    0,    0,    0,    0,    0,  349,
			  349,  349,  349,    0,    0,    0,    0,    0,  349,    0,
			    0,    0,    0,  349,  349,  349,    0,    0,  349,  370,
			  370,  370,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 1768)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  370,    0,    0,  370,  370,  370,  370,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  370,  371,  371,  371,    0,    0,
			    0,    0,    0,    0,    0,    0,  371,    0,    0,  371,
			  371,  371,  371,    0,    0,    0,    0,    0,    0,    0,
			    0,  371,    0,    0,    0,    0,    0,    0,    0,    0,
			  371,  413,  413,  413,  413,  413,    0,    0,    0,    0,
			    0,    0,  413,  413,    0,    0,    0,    0,    0,  413,
			    0,    0,    0,  413,    0,    0,  413,  413,  415,    0,
			    0,    0,    0,    0,    0,    0,    0,  415,  415,  415,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  415,    0,    0,  415,
			    0,    0,    0,    0,    0,    0,  415,  416,    0,    0,
			    0,    0,    0,    0,    0,    0,  416,  416,  416,  416,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  416,    0,    0,  416,    0,
			    0,    0,    0,    0,    0,  416,  425,  425,  425,    0,
			    0,    0,    0,    0,    0,    0,    0,  425,    0,    0,
			  425,  425,  425,  425,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 1968)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  425,  432,  432,  432,    0,    0,    0,    0,    0,
			    0,    0,    0,  432,    0,    0,  432,  432,  432,  432,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  432,  457,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  457,  457,
			  457,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  457,    0,    0,  457,
			    0,    0,    0,    0,    0,    0,  457,  466,  466,  466,
			    0,    0,    0,    0,    0,    0,    0,    0,  466,    0,
			    0,  466,  466,  466,  466,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  466,  502,  502,  502,  502,  502,  502,  502,
			  502,  502,  502,  502,  502,  502,  502,  502,  502,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  504,  504,  504,  504,  504,
			  504,  504,  504,  504,  504,  504,  504,  504,  504,  504,
			  504,  505,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  505,  505,  505,  505,  506,  506,  506,
			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,
			  506,  506,  506,  507,  507,  507,  507,  507,  507,  507, yy_Dummy>>,
			1, 200, 2168)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  507,  507,  507,  507,  507,  507,  507,  507,  507,  509,
			  509,    0,  509,  509,  509,  509,  509,  509,  509,  509,
			  509,  509,  509,    0,  509,  510,    0,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  512,  512,    0,    0,    0,    0,  512,    0,  512,
			    0,  512,  512,  512,  512,  513,    0,  513,  513,  513,
			  513,  513,  513,  513,  513,  513,  513,  513,  513,  513,
			  513,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  514,  514,  514,  514,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  515,  515,  515,  515,

			  515,  515,  515,  516,  516,  516,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  518,
			    0,  518,  518,  518,  518,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  518,  519,    0,  519,  519,  519,
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  521,  521,  521,  521,  521,  521,  521,  521,  521,
			  521,  521,  521,  521,  521,  521,  521,  522,  522,  522,
			  522,  522,  522,  522,    0,  522,  522,  522,  522,  522,
			  522,  522,  522,  524,  524,  524,  524,  524,  524,  524,
			  524,  524,  524,  524,  524,  524,  524,  524,  524,  526, yy_Dummy>>,
			1, 200, 2368)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  526,  526,  526,  526,  526,  526,  526,  526,  526,  526,
			  526,  526,  526,  526,  526,  527,    0,  527,  527,  527,
			  527,  527,  527,  527,  527,  527,  527,  527,  527,  527,
			  527,  528,    0,  528,  528,  528,  528,  528,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  531,  531,  531,
			  531,  531,  531,  531,  531,  531,  531,  531,  531,  531,
			  531,  531,  531,  532,  532,  532,  532,  532,  532,  532,
			  532,  532,  532,  532,  532,  532,  532,  532,  532,  534,
			  534,  534,  534,  534,  534,  534,    0,  534,  534,  534,
			  534,  534,  534,  534,  534,  535,    0,  535,  535,  535,

			  535,  535,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541, yy_Dummy>>,
			1, 159, 2568)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 542)
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
			   75,   78,   83,   68,   87, 1294,   90,   93,   96,  113,
			  135,  181,  118,   92,  195,  227,   90,  245,  174,  220,
			  252,   87,  266,  125,  207,  287,  276, 2727,  294,  299,
			 1279,   98, 2727,  302,  321, 2727,  121, 2727, 2727, 2727,
			  232, 2727,  277,  367, 2727,  372, 2727,  305,  129, 2727,
			  188,  182, 2727,  200,  254,  166,  377, 1278,  380,  239,
			  404,  447, 1263,  383,  493, 1262,  535,  575,  270,  385,
			  231,  422,  379,  383,  314, 1231, 2727,  621,  462,  667,
			  470,  419,  474, 1242, 1241, 1232, 1235, 1184,  477,  391,

			  508,  713,  516, 2727, 1185,  749,    0,  420,  506, 1160,
			  776,  286, 2727, 1178,  196,  532,  812,  516,  589, 1177,
			  483,  389,  601, 1160, 2727, 1158, 2727,  545, 2727,  393,
			  590, 2727,  568, 2727, 2727,  597, 2727,  548, 2727,  582,
			 2727,  613,  637,  591, 2727,  642,  648,  430, 2727,  443,
			 2727,  682,  651,  687,  694,  706,  720,  500,  494,  732,
			  844,  391,  654,  731,  690, 1151,  744, 2727, 1133,  887,
			  756,  933,  976,  555,  301,  768,  771,  577,  449, 1019,
			  776, 1061,  798, 1124,  775, 1121, 1107,  803, 2727,  815,
			  820,  832, 2727,  835, 2727,  614,  860,  882,  915,  523, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  910, 1087,  931,  941, 1076,  949,  554,  953, 1061, 2727,
			 1028,  952,  956,  992, 1020, 2727, 2727, 1009, 1104,  990,
			 1140,  641, 1176,  840, 1014,  976, 2727,  991, 1033, 1211,
			  733, 2727,  985,  997,  698,  942, 1041, 1244, 1053, 2727,
			  974, 2727, 2727,  927, 2727,  911, 2727,  448, 2727, 2727,
			  700, 1046,  715,  444, 1052, 1006, 2727,  902, 1281, 2727,
			  885,  884, 1075,  777, 2727,  853, 1089,  827,  888, 2727,
			  799, 1097,  793, 1111, 1324,  969,  475, 1370, 1409, 1085,
			 1125, 2727, 2727, 1145, 2727, 1160, 2727,  790, 2727,  742,
			 2727,  778, 1132,  743, 1148, 1439, 1169,  736,  784, 1121,

			 1479, 1515,  796, 2727, 1183, 1191, 1217, 1551, 2727,  725,
			 1587, 1623, 2727,  707, 1659, 1695, 2727,  686, 1227, 1235,
			 2727,  649, 1731, 1758,  808, 1239, 1804, 1834, 1290,  495,
			  615, 1069,    0, 1281,  839,  855,  641, 1244, 1161, 2727,
			  625, 2727,  616, 1257, 2727,  605, 1874, 1304, 1306, 1913,
			 1327,  859,  866,  848, 1276,  599,  579,  726, 1187,    0,
			 1347, 1378,  894, 1383,  903, 1376, 2727,  561, 1339, 1381,
			 1956, 1992, 2727,  542, 1392, 2727,  529,  810, 2727,  517,
			 2727,  512, 1372, 2727,  476, 2727,  416, 1403, 2727,  407,
			 2727, 2727,  393, 1401, 1451,  963, 1399,    0, 1039,  364, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  917, 1419,  359, 1471, 2727,  306,  830, 1421,    0, 1469,
			 1474, 1484,  426, 2015, 1507, 2051, 2090,  650, 1458, 1017,
			 1091, 1501, 1492, 1520,  889, 2133, 1523, 1529, 2727,  274,
			 1542, 1559, 2169, 2727, 1564, 1568, 1547, 1592, 1595, 1607,
			 1615, 1106, 1629, 2727,  253,  254, 1606, 1629,  926, 1039,
			 1632,  214, 1022, 1635,    0, 1663, 1651, 2201,  195, 1652,
			 1152, 2727,  212, 1066, 1673,  175, 2244, 1685, 1698, 2727,
			  193, 1169, 1716, 1208, 1723, 1738, 1209, 1751, 1772, 1212,
			 1784, 1214, 1787,  105,   85, 1810, 1266, 1706,   46, 1741,
			 1803, 1139, 2727,   56,    0,    0, 1241, 2727, 1297, 1808,

			   19, 2727, 2280, 2296, 2312, 2328, 2344, 2360, 1825, 2376,
			 2392, 1862, 2408, 2422, 2438, 2454, 2470, 1557, 2486, 2502,
			 1878, 2518, 2534, 1331, 2550, 1887, 2566, 2582, 2598, 1789,
			 1898, 2614, 2630, 1912, 2646, 2662,  671, 2678,  694,  715,
			 2694, 2710,  917, yy_Dummy>>,
			1, 143, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 542)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (501, 502, 542)
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
			   20,   70,   70,  501,  518,   71,  519,   71,   71,   70,
			   71,   77,   77,   71,   71,   70,  501,  509,  509,  509,
			   89,   89,  501,  501,  501,  520,  501,   35,  501,  521,

			  501,  501,   61,  501,  501,  522,   28,  501,  501,  523,
			  501,   35,  501,  501,   34,   34,  501,  501,  501,  501,
			  524,  513,  501,  525,  501,  501,  501,  501,  501,  513,
			  501,  501,  501,  501,  501,  501,  501,  514,  501,  514,
			  501,  514,  514,  515,  501,  515,  501,  516,  501,  516,
			  501,  517,   64,  151,   19,  154,  155,  526,   70,  501,
			  519,   77,   77,   77,   71,  160,  501,  501,  501,  518,
			  501,  518,  171,  172,  172,  171,  501,  519,  527,  528,
			  528,  519,  519,  160,   70,  160,  160,   71,  501,   89,
			   89,   89,  501,  509,  501,   87,   87,   87,   87,  526, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  501,  501,  501,  501,  501,  501,  521,  501,  501,  501,
			  501,  501,  501,  501,  151,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  523,  529,  501,  501,  110,  526,
			   34,  501,  501,  501,  524,  501,  501,  501,  501,  501,
			  501,  501,  501,  155,  501,  155,  501,  517,  501,  501,
			  517,  501,  526,   77,   77,   77,  501,  501,  528,  501,
			  501,  172,  172,  172,  501,  501,  501,  171,  169,  501,
			  501,  501,  530,  501,  258,  274,  274,  528,  519,  278,
			  519,  501,  501,   87,  501,   87,  501,   89,  501,  517,
			  501,   89,  501,  501,  501,  501,  501,  531,  532,  501,

			  501,  501,  532,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  533,  529,
			  501,  501,  534,  526,  526,  323,   34,  501,  501,  535,
			  501,  501,  536,  501,  517,  517,  274,  274,  274,  501,
			  501,  501,  501,  501,  501,  501,  528,  519,  519,  519,
			  278,  517,  517,  537,  501,  501,  501,  501,  501,  538,
			  501,  501,  531,  501,  532,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  220,  501,  501,
			  501,  501,  222,  501,  501,  501,  501,  533,  501,  501,
			  501,  501,  501,  371,  501,  323,  501,  229,  229,  229, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  526,  501,  229,  501,  501,  501,  501,  501,  539,  501,
			  501,  501,  536,  501,  501,  519,  519,  349,  501,  537,
			  540,  501,  501,  501,  538,  501,  501,  425,  501,  501,
			  501,  501,  501,  501,  501,  432,  229,  229,  229,  323,
			  323,  526,  501,  501,  501,  541,  501,  501,  539,  501,
			  501,  536,  501,  501,  542,  501,  519,  519,  349,  501,
			  540,  501,  501,  501,  501,  538,  501,  501,  466,  501,
			  501,  526,  501,  526,  501,  323,  526,  501,  323,  526,
			  501,  526,  501,  229,  541,  501,  501,  501,  539,  501,
			  501,  542,  501,  501,  229,  229,  526,  501,  501,  501,

			  542,    0, yy_Dummy>>,
			1, 102, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (46, 127, 159)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (46, 167, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (46, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (46, 8203, 8238)
			an_array.put (1, 8239)
			an_array.area.fill_with (46, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (46, 8288, 8703)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (46, 8708, 10225)
			an_array.area.fill_with (45, 10226, 10227)
			an_array.area.fill_with (46, 10228, 12287)
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
			   32,   28,   28,   43,    6,   35,   44, yy_Dummy>>,
			1, 127, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   46,   46,   46,   46,   46,   45, yy_Dummy>>,
			1, 7, 160)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   45,   46,   46,   45, yy_Dummy>>,
			1, 4, 8704)
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
			    0,    1,    2,    1,   16,    3,   16,    4,    5,    6,
			    6,   16,    7,    8,    5,    9,    9,    9,    9,    4,
			    5,    4,   10,    4,   11,   11,   11,    9,   12,   13,
			   13,   12,   12,    4,   16,    4,   14,   16,    9,    9,
			    9,   12,   12,    4,   16,   15,   16, yy_Dummy>>)
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

	yyJam_base: INTEGER = 2727
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 501
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 502
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
