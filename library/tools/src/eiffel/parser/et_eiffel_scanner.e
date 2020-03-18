note

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2020, Eric Bezault and others"
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
	yy_end := yy_end - 1
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
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 193 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 193")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 22 then
	yy_column := yy_column + 3
--|#line 205 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 205")
end

				last_break_end := 0
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			
when 23 then
yy_set_line_column
--|#line 210 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 210")
end

				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			
when 24 then
yy_set_line_column
--|#line 216 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 216")
end

				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (unicode_text_item (2))
			
when 25 then
	yy_column := yy_column + 4
--|#line 222 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 222")
end

				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 26 then
yy_set_line_column
--|#line 227 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 227")
end

				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 27 then
yy_set_line_column
--|#line 233 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 233")
end

				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			
when 28 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 240 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 240")
end

				last_token := E_CHARACTER
				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			
when 29 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 249 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 249")
end

				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			
when 30 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 257 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 257")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 31 then
	yy_column := yy_column + 3
--|#line 267 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 267")
end

					-- Syntax error: missing character code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			
when 32 then
	yy_column := yy_column + 2
--|#line 277 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 277")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			
when 33 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 286 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 286")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 34 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 300 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 300")
end

					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 35 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 308 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 308")
end

					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
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
--|#line 318 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 318")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
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
--|#line 327 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 327")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
when 40 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 335 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 335")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 41 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 343 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 343")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_freeop_break
				more
				set_start_condition (BREAK)
			
when 42 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 351 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 351")
end

					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 43 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 357 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 357")
end

					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
when 44 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 365 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 365")
end

					-- Verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				verbatim_opening_character := unicode_text_item (text_count)
				set_start_condition (VS1)
			
when 45 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 375 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 375")
end

				verbatim_open_white_characters := utf8_text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 46 then
	yy_column := yy_column + 1
--|#line 381 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 381")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 47 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 399 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 399")
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
			
when 48 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 415 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 415")
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
			
when 49 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 431 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 431")
end

				more
				set_start_condition (VS3)
			
when 50 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 435 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 435")
end

				more
				last_literal_end := text_count - 2
			
when 51 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 439 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 439")
end

				more
				last_literal_end := text_count - 1
			
when 52 then
	yy_column := yy_column + 1
--|#line 443 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 443")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 53 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 461 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 461")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 54 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 466 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 466")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 55 then
	yy_column := yy_column + 1
--|#line 471 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 471")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 56 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 487 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 487")
end

					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 57 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 496 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 496")
end

					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 58 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 505 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 505")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 59 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 516 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 516")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 60 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 521 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 521")
end

				more
			
when 61 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 524 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 524")
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
			
when 62 then
	yy_column := yy_column + 2
--|#line 537 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 537")
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
			
when 63 then
	yy_column := yy_column + 2
--|#line 550 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 550")
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
			
when 64 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 563 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 563")
end

				more
			
when 65 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 566 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 566")
end

				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			
when 66 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 575 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 575")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 67 then
	yy_column := yy_column + 2
--|#line 583 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 583")
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
			
when 68 then
	yy_column := yy_column + 1
--|#line 594 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 594")
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
			
when 69 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 607 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 607")
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
			
when 70 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 635 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 635")
end

				more
				set_start_condition (MS)
			
when 71 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 639 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 639")
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
			
when 72 then
	yy_column := yy_column + 1
--|#line 650 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 650")
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
			
when 73 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 681 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 681")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			
when 74 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 689 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 689")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			
when 75 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 697 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 697")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 705 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 705")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 77 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 713 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 713")
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
			
when 78 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 725 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 725")
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
			
when 79 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 737 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 737")
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
			
when 80 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 749 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 749")
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
			
when 81 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 761 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 761")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 769 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 769")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 83 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 777 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 777")
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
			
when 84 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 789 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 789")
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
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 801 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 801")
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
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 813 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 813")
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
			
when 87 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 825 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 825")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 833 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 833")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 841 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 841")
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
			
when 90 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 853 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 853")
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
			
when 91 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 865 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 865")
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
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 877 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 877")
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
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 889 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 889")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 897 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 897")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 95 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 905 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 905")
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
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 917 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 917")
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
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 929 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 929")
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
			
when 98 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 941 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 941")
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
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 959 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 959")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 102 then
	yy_end := yy_end - 1
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
--|#line 969 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 969")
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
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 982 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 982")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 108 then
	yy_end := yy_end - 1
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
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 992 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 992")
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
			
when 111 then
yy_set_line_column
--|#line 1007 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1007")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			
when 112 then
yy_set_line_column
--|#line 1017 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1017")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			
when 113 then
yy_set_line_column
--|#line 1028 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1028")
end

				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 114 then
yy_set_line_column
--|#line 1034 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1034")
end

				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			
when 115 then
	yy_column := yy_column + 1
--|#line 1040 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1040")
end

					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 116 then
	yy_column := yy_column + 1
--|#line 1061 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1061")
end

				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			
when 117 then
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
--|#line 1060 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1060")
end
terminate
when 1 then
--|#line 1048 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1048")
end

					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 2 then
--|#line 619 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 619")
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
--|#line 663 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 663")
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
--|#line 388 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 388")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 450 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 450")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 478 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 478")
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
			an_array.area.fill_with (511, 2879, 2924)
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
			   33,   33,   33,   22,   19,   19,   16,   38,   39,   38,
			   38,   39,   38,   42,   42,  510,   43,   43,   40,   44,
			   44,   40,   46,   47,   46,   46,   47,   46,  502,   48,
			   59,   60,   48,   50,   51,   50,   50,   51,   50,   53,
			   54,   55,  498,   56,   53,   54,   55,  495,   56,   59,
			   60,   62,   62,   62,   66,   66,   66,   66,   66,   66,

			   95,   96,   63,  122,  102,   67,  123,   97,   67,  100,
			   64,  100,   65,   57,   68,   68,   68,  506,   57,   92,
			   92,   92,  132,  133,  132,   69,  112,  112,  112,  134,
			   93,  148,  149,   64,  102,   65,   71,  113,   71,   72,
			   73,   74,   75,   76,   71,   75,   72,   77,   78,   79,
			   71,   71,   71,   71,   80,   81,   75,   82,   83,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   84,   85,
			   75,   71,   70,   71,   71,   71,   71,   71,   84,   72,
			   72,   70,   86,   86,   86,   87,  478,   87,   73,   61,
			  150,  149,   87,   89,  151,   87,   98,   98,   98,  511, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  511,   90,  152,   91,  153,   71,  511,   99,  112,  112,
			  112,  474,  114,  511,  511,   87,   61,  100,   87,  113,
			  470,   92,   92,   92,  114,   87,   61,   61,   92,   92,
			   92,  467,   93,  135,  136,  135,  460,  115,  495,   93,
			  100,  100,  101,  101,  101,  101,  103,  103,  103,  115,
			  148,  149,  187,   92,   92,   92,   70,  104,  105,  494,
			  106,  106,  106,  106,  111,   75,  156,   92,   92,   92,
			  107,  108,  100,  100,  511,  436,  157,  109,   93,  138,
			  139,  110,  140,  454,  107,  108,  160,  100,   62,   62,
			   62,  116,  116,  116,  116,  118,  118,  118,  450,   63,

			  118,  118,  118,  124,  124,  124,  119,  138,  145,  207,
			  146,  119,  117,  122,  125,  185,  123,  122,  448,  208,
			  123,  102,  127,  128,  127,  126,  129,  126,  126,  129,
			  129,  129,  126,  126,  126,  130,  126,  126,  126,  126,
			  126,  129,  126,  129,  126,  129,  129,  129,  126,  126,
			  129,  129,  126,  126,  126,  126,  126,  126,  126,  131,
			  131,  131,  131,  131,  126,  126,  126,  126,  141,  138,
			  142,  447,  140,  141,  144,  142,  441,  140,  511,  511,
			  511,   66,   66,   66,   92,   92,   92,  275,  236,  154,
			  276,   73,   67,  177,  166,   93,  166,  155,  237,  511, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  150,  149,  143,  168,  168,  168,  185,  143,  159,  160,
			  159,  160,  161,   75,  169,  159,  162,  255,  159,  165,
			  395,  165,  138,  139,  163,  140,  164,  256,   71,  165,
			  186,  165,  177,  392,   70,  166,  185,  165,  159,  390,
			   75,  159,   75,   75,   70,  222,  222,  165,  159,  159,
			  159,  159,  167,  159,  122,  161,  387,  123,  159,  162,
			  165,  159,  193,  193,  193,  385,  223,  163,  382,  164,
			  165,  379,  177,  199,  373,  166,   92,   92,   92,  429,
			  165,  159,  144,  139,  159,  140,  177,   93,   75,  166,
			  165,  159,  159,  159,   71,  428,   71,  170,  171,  170,

			  165,  161,   75,  511,  170,  173,  511,  170,  138,  145,
			  165,  146,  187,  174,  165,  175,  272,  205,  205,  205,
			  224,  224,  224,  349,  165,  255,  176,  170,  206,  332,
			  170,  193,  193,  193,  346,  256,  176,  170,  159,  159,
			  179,  225,  199,  180,  181,  181,  239,  128,  239,  182,
			   88,  460,  200,  144,  145,  181,  146,  181,  187,  181,
			  181,  181,  180,  171,  181,  181,  187,  207,  183,  344,
			  272,  209,  209,  209,  215,  215,  215,  208,  183,   70,
			  177,   70,  210,  184,  233,  216,   70,   71,  114,   70,
			  231,  231,  231,  329,  277,   70,  114,   75,  233,  511, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  114,  232,  418,  418,  116,  116,  116,  116,  114,   70,
			  430,  430,   70,  135,  136,  135,  118,  118,  118,   70,
			   70,   70,  188,  189,  188,  117,  177,  119,  511,  166,
			  124,  124,  124,  240,  241,  241,  241,  132,  133,  132,
			  257,  125,  384,  384,  134,  141,  138,  142,  258,  140,
			  259,  141,  144,  142,  165,  140,  315,  315,  242,  242,
			  242,  244,  244,  244,  165,   86,   86,   86,   87,  243,
			   87,  324,   61,  236,  320,   87,  190,  223,   87,  143,
			  245,  245,  245,  237,  191,  143,  192,  316,  247,  247,
			  247,  246,  249,  249,  249,  251,  251,  251,   87,  248,

			  312,   87,  360,  250,  455,  455,  252,  359,   87,   61,
			   61,  193,  193,  193,  253,  253,  253,  160,  511,  260,
			  260,  260,  194,  511,  257,  254,   73,  358,   73,  186,
			  261,  187,  258,   70,  259,   70,  263,  263,  263,  255,
			  348,   71,  273,   70,  368,   71,  511,  264,   71,  256,
			  268,  268,  268,  370,  369,  511,  511,  195,  195,  195,
			  196,  269,  196,  371,   97,  186,  268,  196,  197,  272,
			  196,  188,  189,  188,  183,  370,  198,  172,  171,   74,
			  273,  273,  273,  275,  183,  371,  166,  285,  285,  285,
			  196,  274,  263,  196,  284,  189,  284,  260,  511,   89, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  196,   97,   97,  211,  211,  211,  426,   90,  340,   91,
			  511,  281,  368,  339,  212,  338,  427,  101,  101,  101,
			  101,  281,  369,  286,  286,  286,  183,  162,  337,  213,
			  299,  300,  300,  300,  287,  174,  183,  175,  214,  218,
			  218,  218,   88,  242,  200,  234,  288,  288,  288,  181,
			  219,  499,  499,  220,  220,  220,  220,  289,  296,  296,
			  296,  205,  205,  205,  228,  221,  228,  228,  228,  297,
			  227,  467,  206,  290,  290,  290,  363,  229,  420,  420,
			  230,  230,  230,  230,  291,  370,  292,  292,  292,  294,
			  294,  294,   90,  121,   91,  371,  255,  293,  474,  255,

			  295,  110,  234,  234,  234,   90,  256,   91,   90,  256,
			   91,  418,  418,  235,  307,  498,  116,  116,  116,  116,
			  207,  207,  207,  209,  209,  209,  432,  432,  209,  209,
			  209,   67,  458,  277,  210,  306,  187,  117,  179,  210,
			  180,  262,  181,  181,  303,  303,  444,  182,  304,  304,
			  304,  304,  211,  181,  445,  181,  446,  181,  181,  181,
			  179,  426,  181,  181,  302,  468,  183,  305,  305,  305,
			  305,  427,  319,  319,  319,  469,  183,  188,  189,  188,
			  160,   73,  510,  187,  166,  310,  310,   70,  214,  311,
			  311,  311,  311,  225,  320,  320,  320,   71,  301,  324, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  324,  324,  236,  236,  236,  321,  239,  128,  239,  165,
			  325,  326,  298,  119,  330,  331,  331,  331,  180,  165,
			   71,  180,   71,  170,  171,  170,  180,  161,  186,  322,
			  170,  265,  180,  170,  255,  168,  178,  178,  181,  266,
			  181,  267,  180,  178,  256,  332,  241,  241,  241,  241,
			  178,  178,  176,  170,  457,  457,  170,  124,  255,  255,
			  255,  238,  176,  170,  159,  159,   71,  336,   71,   93,
			  270,  160,  171,  166,  186,  186,  120,  271,   70,  272,
			  344,  344,  344,  346,  346,  346,   71,  172,   70,   74,
			  112,  345,  255,  227,  347,  349,  349,  349,  176,  284,

			  189,  284,  256,  511,  103,  448,  350,  468,  176,   61,
			   71,   71,   74,  201,   74,  449,  184,  469,  202,   74,
			   71,  204,   74,  501,  501,  292,  292,  292,   74,  430,
			  430,  183,  296,  296,  296,  202,  356,  304,  304,  304,
			  304,  183,   74,  297,   90,   74,   91,  292,  292,  292,
			  472,  255,   74,   70,   70,  262,  277,  262,  357,  161,
			  255,  256,  262,  278,  255,  262,   90,  201,   91,  158,
			  256,  279,   99,  280,  256,  361,  361,  361,  363,  300,
			  300,  300,  300,  255,  281,  262,  362,  156,  262,  311,
			  311,  311,  311,  256,  281,  262,  262,  262,  511,  120, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  367,  378,  378,  378,  378,  419,  419,  419,  282,  283,
			  283,  283,  376,  376,  455,  455,  377,  377,  377,  377,
			  511,  511,  309,  392,  392,  392,  183,  511,  511,  395,
			  395,  395,  255,  255,  393,  496,  183,  188,  189,  188,
			  396,   73,  256,  256,  166,  408,  409,  408,  121,  331,
			  331,  331,  331,  431,  431,  431,  410,  511,  322,  421,
			  422,  422,  422,  511,  227,  241,  241,  241,  241,  165,
			  417,  511,  511,  511,  300,  300,  300,  300,  511,  165,
			  195,  195,  195,  423,  423,  277,  336,  511,  186,  499,
			  499,  193,  180,  511,  511,  367,  511,  178,  511,  511,

			  181,  183,  180,  424,  424,  424,  511,  511,  178,  178,
			  508,  183,  389,  389,  389,  178,  511,  511,  361,  361,
			  361,  183,  178,  178,  511,  511,  211,  211,  211,  362,
			  511,  183,  511,  368,  368,  368,  511,  212,  511,  511,
			  220,  220,  220,  220,  206,  370,  370,  370,  433,  433,
			  433,  433,  308,  434,  434,  511,  210,  435,  435,  435,
			  435,  309,  312,  312,  312,  377,  377,  377,  377,  372,
			  456,  456,  456,  313,  226,  226,  222,  222,  226,  511,
			  440,  440,  440,  440,  320,  320,  320,  400,  400,  400,
			  400,  255,  255,  255,  511,  321,  511,  314,  316,  316, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  316,  381,   93,  511,  255,  255,  255,  323,  323,  317,
			  511,  323,  224,  224,  224,   93,  442,  442,  511,  322,
			  443,  443,  443,  443,  394,  394,  451,  451,  451,  511,
			  452,  394,  394,  318,  255,  394,  327,  453,  327,  203,
			  327,  203,  203,  327,  256,  203,  327,  203,  332,  418,
			  418,  511,  328,  331,  331,  331,  331,  435,  435,  435,
			  435,  511,  332,  419,  419,  419,  327,  511,  452,  327,
			  458,  500,  500,  500,  417,  511,  327,  327,  327,  332,
			  241,  241,  241,  241,  459,  426,  426,  426,  511,  511,
			  333,  334,  470,  470,  470,  511,  297,  335,  363,  430,

			  430,  336,  511,  471,  333,  334,  262,  277,  262,  511,
			  161,   61,   61,  262,  341,   61,  262,  419,  419,  419,
			  472,  511,  342,   61,  343,  435,  435,  435,  435,  511,
			  179,  422,  422,  422,  422,  281,  262,  511,  459,  262,
			  363,  431,  431,  431,  511,  281,  262,  262,  262,  180,
			  275,  180,  464,  184,   97,   97,  180,  181,   97,  180,
			  511,  511,  473,  511,  511,  180,   97,  181,  443,  443,
			  443,  443,  511,  511,  475,  475,  475,  475,  511,  180,
			  476,  476,  180,  511,  477,  477,  477,  477,  511,  180,
			  180,  180,  351,  189,  351,  438,  275,  511,  511,  166, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  443,  443,  443,  443,  480,  481,  480,  482,  483,  482,
			  485,  486,  485,  511,  121,  447,  121,  121,  484,  511,
			  121,  487,  121,  511,  281,  511,  201,  511,  449,  488,
			  489,  488,  511,  511,  281,  511,  121,  455,  455,  511,
			  490,  491,  492,  491,  181,  283,  283,  283,  283,  451,
			  451,  451,  493,  452,  511,  352,  353,  511,  496,  511,
			  453,  511,  354,  183,  511,  511,  355,  511,  511,  352,
			  353,  511,  511,  183,  363,  300,  300,  300,  300,  477,
			  477,  477,  477,  511,  511,  364,  365,  121,  456,  456,
			  456,  452,  366,  423,  423,  511,  367,  511,  511,  364,

			  365,  211,  211,  211,  422,  422,  422,  422,  511,  497,
			  511,  183,  212,  511,  465,  304,  304,  304,  304,  511,
			  511,  183,  468,  468,  468,  464,  431,  431,  431,  477,
			  477,  477,  477,  362,  511,  511,  372,  373,  373,  373,
			  511,  456,  456,  456,  255,  255,  255,  473,  374,  511,
			  511,  305,  305,  305,  305,   93,  255,  255,  255,  488,
			  489,  488,  497,  375,  179,  499,  499,   93,  511,  511,
			  504,  511,  214,  379,  379,  379,  179,  500,  500,  500,
			  255,  255,  255,  511,  380,  511,  508,  311,  311,  311,
			  311,   93,  488,  489,  488,  255,  255,  255,  509,  511, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  500,  500,  500,  505,  511,  511,   93,  511,  381,  382,
			  382,  382,  511,  511,  255,  255,  255,  511,  511,  511,
			  383,  509,  511,  384,  384,   93,  495,  495,  495,  511,
			  507,  511,  179,  511,  179,  179,  511,  453,  179,  511,
			  179,  511,  511,  511,  314,  385,  385,  385,  511,  511,
			  511,  511,  511,  511,  511,  511,  386,  511,  511,  315,
			  315,  511,  511,  511,  511,  511,  511,  511,  507,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  223,  387,  387,  387,  511,  511,  511,  511,  511,  511,
			  511,  511,  388,  511,  511,  389,  389,  389,  511,  511,

			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  318,  390,  390,  390,
			  511,  511,  511,  511,  511,  511,  511,  511,  391,  511,
			  511,  319,  319,  319,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  225,  398,  398,  398,  511,  511,  511,  511,
			  511,  511,  511,  511,  399,  511,  511,  400,  400,  400,
			  400,  511,  511,  511,  511,  511,  511,  511,  511,  401,
			  403,  404,  403,  402,  511,  402,  511,  402,  511,  511,
			  402,  405,  511,  402,  511,  511,  511,  511,  511,  406, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  511,  407,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  402,  511,  511,  402,  511,  511,  511,
			  511,  511,  511,  402,  402,  402,  411,  411,  411,  511,
			  412,  511,  511,  511,  511,  511,  511,  413,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  114,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  114,  412,  121,
			  331,  331,  331,  331,  511,  511,  511,  511,  511,  511,
			  414,  415,  511,  511,  511,  511,  511,  416,  511,  511,
			  511,  417,  511,  511,  414,  415,  351,  189,  351,  511,

			  275,  511,  511,  166,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  281,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  281,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  425,
			  425,  425,  425,  511,  511,  511,  511,  511,  425,  425,
			  425,  425,  511,  511,  511,  511,  511,  183,  511,  511,
			  511,  511,  425,  425,  425,  511,  511,  183,  436,  436,
			  436,  511,  511,  511,  511,  511,  511,  511,  511,  437,
			  511,  511,  377,  377,  377,  377,  511,  511,  511,  511, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  438,  373,  373,  373,  511,  511,  511,
			  511,  511,  511,  511,  511,  374,  511,  511,  378,  378,
			  378,  378,  511,  511,  511,  511,  511,  511,  511,  511,
			  439,  511,  511,  511,  511,  511,  511,  511,  511,  309,
			  179,  422,  422,  422,  422,  511,  511,  511,  511,  511,
			  511,  461,  462,  511,  511,  511,  511,  511,  463,  511,
			  511,  511,  464,  511,  511,  461,  462,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  181,  423,  423,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,

			  511,  511,  511,  511,  511,  183,  511,  511,  465,  511,
			  511,  511,  511,  511,  511,  183,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  181,  424,  424,  424,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  183,  511,  511,  466,  511,  511,
			  511,  511,  511,  511,  183,  373,  373,  373,  511,  511,
			  511,  511,  511,  511,  511,  511,  374,  511,  511,  433,
			  433,  433,  433,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  372,  478,  478,  478,  511,  511,  511,  511,  511,  511, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  511,  511,  479,  511,  511,  440,  440,  440,  440,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  381,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  424,  424,  424,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  183,  511,  511,  466,  511,
			  511,  511,  511,  511,  511,  183,  502,  502,  502,  511,
			  511,  511,  511,  511,  511,  511,  511,  503,  511,  511,
			  475,  475,  475,  475,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,

			  511,  438,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   88,   88,  511,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   94,  511,   94,   94,   94,   94,   94, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   94,   94,   94,   94,   94,   94,  114,  114,  511,  511,
			  511,  511,  511,  114,  114,  114,  114,  114,  121,  511,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			   71,  511,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,  172,  511,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  178,  511,  178,  178,

			  178,  178,  178,  178,  178,  178,  178,  178,  178,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  217,  217,  217,  217,  217,  217,  511,  217,
			  217,  217,  217,  217,  217,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  179,  511,  179,  179,  179,  179,  179,  179,  179,
			  179,  179,  179,  179,  181,  511,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  301,  301,  301, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  302,  302,  302,  302,  302,  302,  302,  302,  302,  302,
			  302,  302,  302,  397,  397,  397,  397,  397,  397,  511,
			  397,  397,  397,  397,  397,  397,  121,  511,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  360,
			  360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360,  428,  428,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,   15, yy_Dummy>>,
			1, 79, 2800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2924)
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
			yy_chk_template_15 (an_array)
			an_array.area.fill_with (511, 2878, 2924)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    3,    3,    4,    4,    4,    5,    6,  510,    5,
			    6,    3,    5,    6,    4,    7,    7,    7,    8,    8,
			    8,  503,    7,   13,   13,    8,    9,    9,    9,   10,
			   10,   10,   11,   11,   11,  498,   11,   12,   12,   12,
			  494,   12,   14,   14,   16,   16,   16,   17,   17,   17,
			   18,   18,   18,   23,   23,   16,   41,   26,   17,   41,
			   31,   18,   31,   16,   26,   16,   11,   19,   19,   19,
			  493,   12,   22,   22,   22,   46,   46,   46,   19,   33,
			   33,   33,   46,   22,   58,   58,   19,   26,   19,   20,
			   33, yy_Dummy>>,
			1, 91, 47)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   21,   21,   21,   21,  479,   21,  162,   21,   60,   60,
			   21,   21,   61,   21,   24,   24,   24,   28,   28,   21,
			   61,   21,   61,  162,   28,   24,   34,   34,   34,  474,
			  114,   28,   28,   21,   61,   24,   21,   34,  471,   29,
			   29,   29,  114,   21,   21,   21,   25,   25,   25,  467,
			   29,   50,   50,   50,  460,   34,  454,   25,   25,   29,
			   25,   25,   25,   25,   27,   27,   27,   34,  147,  147,
			   82,   30,   30,   30,   82,   27,   27,  453,   27,   27,
			   27,   27,   30,   82,   64,   32,   32,   32,   27,   27,
			   30,   30,   64,  437,   64,   27,   32,   52,   52,   27,

			   52,  413,   27,   27,   85,   32,   35,   35,   35,   36,
			   36,   36,   36,   38,   38,   38,  410,   35,   39,   39,
			   39,   43,   43,   43,   38,   57,   57,   99,   57,   39,
			   36,  121,   43,   85,  121,  129,  407,   99,  129,   35, yy_Dummy>>,
			1, 140, 182)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   53,   53,   53,  405,   53,   55,   55,   55,  399,   55,
			   63,   63,   63,   66,   66,   66,   68,   68,   68,  179,
			  120,   63,  179,   71,   66,   75,   71,   68,   75,   63,
			  120,   63,  149,  149,   53,   73,   73,   73,   79,   55,
			   70,   70,   70,  257,   70,   79,   73,   70,   70,  158,
			   70,   71,  396,   75,  137,  137,   70,  137,   70,  158,
			  257,   71,   81,   75,   78,  393,   81,   78,   79,   70,
			   70,  391,   78,   70,   81,   81,   81,  107,  107,   70,
			   70,   70,   70,   72,   72,   72,  332,   72,  388,  332,
			   72,   72,   78,   72,   91,   91,   91,  386,  107,   72,

			  383,   72,   78,  380,   80,   91,  374,   80,   92,   92,
			   92,  363,   72,   72,  139,  139,   72,  139,   83,   92,
			   80,   83,   72,   72,   72,   72,   74,  362,   74,   74,
			   74,   74,   80,   74,   83,  357,   74,   74,  356,   74,
			  143,  143,   80,  143,  175,   74,   83,   74,  175,   98,
			   98,   98,  108,  108,  108,  350,   83,  201,   74,   74,
			   98,  420,   74,   90,   90,   90,  347,  201,   74,   74,
			   74,   74,   76,  108,   90,   76,   76,   76,  127,  127,
			  127,   76,   90,  420,   90,  145,  145,   76,  145,   76,
			  280,   76,   76,   76,  280,  267,   76,   76,  267,  208, yy_Dummy>>,
			1, 200, 368)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   76,  345,  267,  100,  100,  100,  102,  102,  102,  208,
			   76,   77,   77,   77,  100,   77,  115,  102,   77,   77,
			  115,   77,  111,  111,  111,  233,  341,   77,  233,   77,
			  115,  338,  115,  111,  333,  333,  117,  117,  117,  117,
			  233,   77,  364,  364,   77,  135,  135,  135,  118,  118,
			  118,   77,   77,   77,   84,   84,   84,  117,   84,  118,
			  337,   84,  122,  122,  122,  130,  130,  130,  130,  132,
			  132,  132,  185,  122,  384,  384,  132,  141,  141,  141,
			  185,  141,  185,  142,  142,  142,   84,  142,  223,  223,
			  146,  146,  146,  151,  151,  151,   84,   87,   87,   87,

			   87,  146,   87,  325,   87,  237,  321,   87,   87,  223,
			   87,  141,  152,  152,  152,  237,   87,  142,   87,  317,
			  153,  153,  153,  152,  155,  155,  155,  156,  156,  156,
			   87,  153,  313,   87,  297,  155,  414,  414,  156,  295,
			   87,   87,   87,   88,   88,   88,  157,  157,  157,  159,
			   88,  160,  160,  160,   88,  293,  159,  157,  163,  291,
			  164,  163,  160,  164,  159,  163,  159,  164,  167,  167,
			  167,  256,  276,  163,  274,  163,  301,  164,  178,  167,
			  271,  256,  171,  171,  171,  302,  301,   88,   88,   89,
			   89,   89,   89,  171,   89,  302,   89,  174,  269,   89, yy_Dummy>>,
			1, 200, 568)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   89,  174,   89,  176,  176,  176,  178,  306,   89,  174,
			  265,  174,  177,  177,  177,  181,  178,  306,  181,  190,
			  190,  190,   89,  177,  264,   89,  183,  183,  183,  261,
			  183,  196,   89,   89,   89,  101,  101,  101,  360,  196,
			  254,  196,  252,  181,  369,  250,  101,  248,  360,  101,
			  101,  101,  101,  181,  369,  191,  191,  191,  183,  272,
			  246,  101,  204,  204,  204,  204,  191,  272,  183,  272,
			  101,  105,  105,  105,  191,  243,  191,  235,  192,  192,
			  192,  425,  105,  461,  461,  105,  105,  105,  105,  192,
			  202,  202,  202,  205,  205,  205,  229,  105,  110,  110,

			  110,  202,  227,  425,  205,  198,  198,  198,  432,  110,
			  546,  546,  110,  110,  110,  110,  198,  371,  199,  199,
			  199,  200,  200,  200,  198,  457,  198,  371,  403,  199,
			  432,  408,  200,  110,  116,  116,  116,  199,  403,  199,
			  200,  408,  200,  458,  458,  116,  219,  457,  116,  116,
			  116,  116,  207,  207,  207,  209,  209,  209,  548,  548,
			  215,  215,  215,  207,  458,  343,  209,  216,  343,  116,
			  161,  215,  343,  161,  161,  161,  213,  213,  402,  161,
			  213,  213,  213,  213,  212,  161,  402,  161,  402,  161,
			  161,  161,  501,  427,  161,  161,  210,  428,  161,  214, yy_Dummy>>,
			1, 200, 768)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  214,  214,  214,  427,  225,  225,  225,  428,  161,  165,
			  165,  165,  259,  165,  501,  259,  165,  221,  221,  259,
			  214,  221,  221,  221,  221,  225,  226,  226,  226,  259,
			  206,  230,  230,  230,  236,  236,  236,  226,  239,  239,
			  239,  165,  230,  230,  203,  236,  238,  238,  238,  238,
			  187,  165,  170,  186,  170,  170,  170,  170,  184,  170,
			  279,  226,  170,  170,  279,  170,  447,  169,  283,  283,
			  166,  170,  279,  170,  279,  283,  447,  241,  241,  241,
			  241,  241,  283,  283,  170,  170,  549,  549,  170,  125,
			  255,  255,  255,  123,  170,  170,  170,  170,  172,  241,

			  172,  255,  172,  258,  266,  172,  258,  266,  119,  172,
			  258,  266,  270,  270,  270,  275,  275,  275,  258,  266,
			  258,  266,  113,  270,  450,  109,  275,  277,  277,  277,
			  172,  284,  284,  284,  450,  284,  104,  406,  277,  469,
			  172,   97,  172,  172,  173,  406,  173,  406,  173,  469,
			   96,  173,  173,   95,  173,  552,  552,  287,  287,  287,
			  173,  472,  472,  284,  296,  296,  296,   94,  287,  303,
			  303,  303,  303,  284,  173,  296,  287,  173,  287,  289,
			  289,  289,  472,  480,  173,  173,  173,  180,  180,  180,
			  289,  180,  482,  480,  180,  180,  485,  180,  289,   93, yy_Dummy>>,
			1, 200, 968)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  289,   69,  482,  180,   67,  180,  485,  298,  298,  298,
			  300,  300,  300,  300,  300,  488,  180,  180,  298,   65,
			  180,  310,  310,  310,  310,  488,  180,  180,  180,  180,
			  182,   40,  300,  309,  309,  309,  309,  334,  334,  334,
			  182,  182,  182,  182,  308,  308,  496,  496,  308,  308,
			  308,  308,   15,    0,  309,  322,  322,  322,  182,    0,
			    0,  323,  323,  323,  491,  506,  322,  496,  182,  188,
			  188,  188,  323,  188,  491,  506,  188,  328,  328,  328,
			  331,  331,  331,  331,  331,  365,  365,  365,  328,    0,
			  322,  348,  348,  348,  348,    0,  323,  336,  336,  336,

			  336,  188,  331,    0,    0,  352,  367,  367,  367,  367,
			    0,  188,  194,  194,  194,  352,  352,  342,  336,  194,
			  342,  508,  508,  194,  342,  353,    0,  367,    0,  355,
			    0,    0,  342,  352,  342,  353,  353,  353,    0,    0,
			  355,  355,  508,  352,  389,  389,  389,  355,    0,    0,
			  361,  361,  361,  353,  355,  355,  194,  194,  220,  220,
			  220,  361,    0,  353,    0,  368,  368,  368,    0,  220,
			    0,    0,  220,  220,  220,  220,  368,  370,  370,  370,
			  372,  372,  372,  372,  220,  375,  375,    0,  370,  375,
			  375,  375,  375,  220,  222,  222,  222,  376,  376,  376, yy_Dummy>>,
			1, 200, 1168)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  376,  372,  415,  415,  415,  222,  533,  533,  222,  222,
			  533,    0,  381,  381,  381,  381,  394,  394,  394,  400,
			  400,  400,  400,  404,  404,  404,    0,  394,    0,  222,
			  224,  224,  224,  381,  404,    0,  409,  409,  409,  539,
			  539,  224,    0,  539,  224,  224,  224,  409,  401,  401,
			    0,  394,  401,  401,  401,  401,  543,  543,  411,  411,
			  411,    0,  411,  543,  543,  224,  232,  543,  232,  411,
			  232,  530,  232,  530,  530,  232,  232,  530,  232,  530,
			  418,  418,  418,    0,  232,  417,  417,  417,  417,  434,
			  434,  434,  434,    0,  419,  419,  419,  419,  232,    0,

			  411,  232,  418,  462,  462,  462,  417,    0,  232,  232,
			  232,  240,  240,  240,  240,  240,  419,  426,  426,  426,
			    0,    0,  240,  240,  429,  429,  429,    0,  426,  240,
			  430,  430,  430,  240,    0,  429,  240,  240,  262,  262,
			  262,    0,  262,  518,  518,  262,  262,  518,  262,  459,
			  459,  459,  430,    0,  262,  518,  262,  435,  435,  435,
			  435,    0,  422,  422,  422,  422,  422,  262,  262,    0,
			  459,  262,  431,  431,  431,  431,    0,  262,  262,  262,
			  262,  278,  278,  278,  422,  278,  521,  521,  278,  278,
			  521,  278,    0,    0,  431,    0,    0,  278,  521,  278, yy_Dummy>>,
			1, 200, 1368)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  442,  442,  442,  442,    0,    0,  438,  438,  438,  438,
			    0,  278,  439,  439,  278,    0,  439,  439,  439,  439,
			    0,  278,  278,  278,  281,  281,  281,  438,  281,    0,
			    0,  281,  443,  443,  443,  443,  444,  444,  444,  445,
			  445,  445,  446,  446,  446,    0,  535,  444,  535,  535,
			  445,    0,  535,  446,  535,    0,  281,    0,  445,    0,
			  445,  448,  448,  448,    0,    0,  281,  282,  455,  455,
			  455,    0,  448,  449,  449,  449,  282,  282,  282,  282,
			  282,  451,  451,  451,  449,  451,    0,  282,  282,    0,
			  455,    0,  451,    0,  282,  282,    0,    0,  282,    0,

			    0,  282,  282,    0,    0,  282,  299,  299,  299,  299,
			  299,  476,  476,  476,  476,  465,    0,  299,  299,  456,
			  456,  456,  456,  451,  299,  465,  465,    0,  299,    0,
			    0,  299,  299,  304,  304,  304,  464,  464,  464,  464,
			    0,  456,    0,  465,  304,    0,  465,  304,  304,  304,
			  304,    0,    0,  465,  468,  468,  468,  464,  473,  473,
			  473,  477,  477,  477,  477,  468,    0,    0,  304,  305,
			  305,  305,    0,  497,  497,  497,  481,  481,  481,  473,
			  305,    0,    0,  305,  305,  305,  305,  481,  483,  483,
			  483,  484,  484,  484,  497,  305,  499,  499,  499,  483, yy_Dummy>>,
			1, 200, 1568)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  484,    0,  305,  311,  311,  311,  500,  500,
			  500,  500,  486,  486,  486,    0,  311,    0,  499,  311,
			  311,  311,  311,  486,  487,  487,  487,  489,  489,  489,
			  500,    0,  509,  509,  509,  487,    0,    0,  489,    0,
			  311,  314,  314,  314,    0,    0,  492,  492,  492,    0,
			    0,    0,  314,  509,    0,  314,  314,  492,  495,  495,
			  495,    0,  495,    0,  540,    0,  540,  540,    0,  495,
			  540,    0,  540,    0,    0,    0,  314,  315,  315,  315,
			    0,    0,    0,    0,    0,    0,    0,    0,  315,    0,
			    0,  315,  315,    0,    0,    0,    0,    0,    0,    0,

			  495,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  315,  318,  318,  318,    0,    0,    0,    0,
			    0,    0,    0,    0,  318,    0,    0,  318,  318,  318,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  318,  319,
			  319,  319,    0,    0,    0,    0,    0,    0,    0,    0,
			  319,    0,    0,  319,  319,  319,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  319,  326,  326,  326,    0,    0,
			    0,    0,    0,    0,    0,    0,  326,    0,    0,  326, yy_Dummy>>,
			1, 200, 1768)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  326,  326,  326,    0,    0,    0,    0,    0,    0,    0,
			    0,  326,  327,  327,  327,  327,    0,  327,    0,  327,
			    0,    0,  327,  327,    0,  327,    0,    0,    0,    0,
			    0,  327,    0,  327,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  327,    0,    0,  327,    0,
			    0,    0,    0,    0,    0,  327,  327,  327,  329,  329,
			  329,    0,  329,    0,    0,    0,    0,    0,    0,  329,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  329,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  329,

			  329,  330,  330,  330,  330,  330,    0,    0,    0,    0,
			    0,    0,  330,  330,    0,    0,    0,    0,    0,  330,
			    0,    0,    0,  330,    0,    0,  330,  330,  351,  351,
			  351,    0,  351,    0,    0,  351,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  351,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  351,  354,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  354,  354,  354,  354,    0,    0,    0,    0,    0,
			  354,  354,  354,  354,    0,    0,    0,    0,    0,  354, yy_Dummy>>,
			1, 200, 1968)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,  354,  354,  354,    0,    0,  354,
			  377,  377,  377,    0,    0,    0,    0,    0,    0,    0,
			    0,  377,    0,    0,  377,  377,  377,  377,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  377,  378,  378,  378,    0,
			    0,    0,    0,    0,    0,    0,    0,  378,    0,    0,
			  378,  378,  378,  378,    0,    0,    0,    0,    0,    0,
			    0,    0,  378,    0,    0,    0,    0,    0,    0,    0,
			    0,  378,  421,  421,  421,  421,  421,    0,    0,    0,
			    0,    0,    0,  421,  421,    0,    0,    0,    0,    0,

			  421,    0,    0,    0,  421,    0,    0,  421,  421,  423,
			    0,    0,    0,    0,    0,    0,    0,    0,  423,  423,
			  423,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  423,    0,    0,
			  423,    0,    0,    0,    0,    0,    0,  423,  424,    0,
			    0,    0,    0,    0,    0,    0,    0,  424,  424,  424,
			  424,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  424,    0,    0,  424,
			    0,    0,    0,    0,    0,    0,  424,  433,  433,  433,
			    0,    0,    0,    0,    0,    0,    0,    0,  433,    0, yy_Dummy>>,
			1, 200, 2168)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  433,  433,  433,  433,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  433,  440,  440,  440,    0,    0,    0,    0,
			    0,    0,    0,    0,  440,    0,    0,  440,  440,  440,
			  440,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  440,  466,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  466,
			  466,  466,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  466,    0,    0,
			  466,    0,    0,    0,    0,    0,    0,  466,  475,  475,

			  475,    0,    0,    0,    0,    0,    0,    0,    0,  475,
			    0,    0,  475,  475,  475,  475,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,  475,  512,  512,  512,  512,  512,  512,
			  512,  512,  512,  512,  512,  512,  512,  513,  513,  513,
			  513,  513,  513,  513,  513,  513,  513,  513,  513,  513,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  517, yy_Dummy>>,
			1, 200, 2368)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  517,  517,  517,  517,  517,  517,  517,  517,  517,  517,
			  517,  517,  519,  519,    0,  519,  519,  519,  519,  519,
			  519,  519,  519,  519,  519,  520,    0,  520,  520,  520,
			  520,  520,  520,  520,  520,  520,  520,  520,  522,  522,
			    0,    0,    0,    0,    0,  522,  522,  522,  522,  522,
			  523,    0,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  524,  524,  524,  524,  524,  524,  524,
			  524,  524,  524,  524,  524,  524,  525,  525,  525,  525,
			  525,  525,  525,  525,  525,  525,  525,  525,  525,  526,
			  526,  526,  526,  526,  526,  526,  526,  526,  526,  526,

			  526,  526,  527,    0,  527,  527,  527,  527,  527,  527,
			  527,  527,  527,  527,  527,  528,    0,  528,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  528,  529,    0,
			  529,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,  531,  531,  531,  531,  531,  531,  531,  531,  531,
			  531,  531,  531,  531,  532,  532,  532,  532,  532,  532,
			    0,  532,  532,  532,  532,  532,  532,  534,  534,  534,
			  534,  534,  534,  534,  534,  534,  534,  534,  534,  534,
			  536,  536,  536,  536,  536,  536,  536,  536,  536,  536,
			  536,  536,  536,  537,    0,  537,  537,  537,  537,  537, yy_Dummy>>,
			1, 200, 2568)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  537,  537,  537,  537,  537,  537,  538,    0,  538,  538,
			  538,  538,  538,  538,  538,  538,  538,  538,  538,  541,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  541,  542,  542,  542,  542,  542,  542,  542,  542,
			  542,  542,  542,  542,  542,  544,  544,  544,  544,  544,
			  544,    0,  544,  544,  544,  544,  544,  544,  545,    0,
			  545,  545,  545,  545,  545,  545,  545,  545,  545,  545,
			  545,  547,  547,  547,  547,  547,  547,  547,  547,  547,
			  547,  547,  547,  547,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  550,  550,  551,  551,  551,

			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551, yy_Dummy>>,
			1, 110, 2768)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 552)
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
			   75,   78,   83,   68,   87, 1220,   90,   93,   96,  113,
			  135,  181,  118,   92,  195,  227,   90,  245,  174,  220,
			  252,   87,  266,  125,  207,  287,  276, 2878,  294,  299,
			 1187,   98, 2878,  302,  321, 2878,  121, 2878, 2878, 2878,
			  232, 2878,  277,  367, 2878,  372, 2878,  305,  129, 2878,
			  188,  182, 2878,  377,  254, 1175,  380, 1160,  383, 1157,
			  404,  386,  447,  402,  493,  388,  535,  575,  427,  392,
			  467,  422,  244,  481,  621,  281, 2878,  664,  710,  756,
			  530,  461,  475, 1155, 1126, 1107, 1109, 1075,  516,  307,

			  570,  802,  573, 2878, 1092,  838,    0,  430,  505, 1057,
			  865,  589, 2878, 1078,  182,  558,  901,  589,  615, 1064,
			  386,  308,  629, 1047, 2878, 1045, 2878,  545, 2878,  312,
			  618, 2878,  636, 2878, 2878,  612, 2878,  420, 2878,  480,
			 2878,  644,  650,  506, 2878,  551,  657,  248, 2878,  398,
			 2878,  660,  679,  687, 2878,  691,  694,  713,  415,  712,
			  718,  933,  183,  721,  723,  976, 1030,  735, 2878, 1023,
			 1019,  749, 1065, 1108,  757,  504,  770,  779,  741,  382,
			 1151,  778, 1193,  793, 1018,  628, 1013, 1010, 1236, 2878,
			  786,  822,  845, 2878, 1279, 2878,  787, 2878,  872,  885, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  888,  523,  857, 1003,  815,  860,  986,  919,  565,  922,
			  952, 2878,  940,  933,  952,  927,  923, 2878, 2878,  902,
			 1325,  974, 1361,  641, 1397,  957,  993,  834, 2878,  852,
			  998, 2878, 1432,  566, 2878,  833, 1001,  671,  999, 1005,
			 1465, 1031, 2878,  831, 2878, 2878,  816, 2878,  803, 2878,
			  801, 2878,  798, 2878,  796, 1057,  737,  406, 1066,  975,
			 2878,  785, 1502, 2878,  780,  773, 1067,  558, 2878,  754,
			 1079,  736,  815, 2878,  730, 1082,  726, 1094, 1545, 1020,
			  550, 1591, 1630, 1011, 1098, 2878, 2878, 1124, 2878, 1146,
			 2878,  715, 2878,  711, 2878,  695, 1131,  690, 1174, 1660,

			 1164,  742,  751, 1122, 1700, 1736,  773, 2878, 1201, 1186,
			 1174, 1772, 2878,  688, 1808, 1844, 2878,  675, 1880, 1916,
			 2878,  662, 1222, 1228, 2878,  659, 1952, 1979, 1244, 2025,
			 2055, 1234,  449,  587, 1190,    0, 1250,  616,  587, 2878,
			 2878,  589, 1280,  928, 2878,  557, 2878,  522, 1244, 2878,
			  511, 2095, 1268, 1288, 2134, 1283,  494,  491, 2878, 2878,
			  804, 1317,  483,  470,  595, 1238,    0, 1259, 1332,  810,
			 1344,  883, 1333, 2878,  462, 1342, 1350, 2177, 2213, 2878,
			  459, 1365, 2878,  456,  627, 2878,  453, 2878,  444, 1297,
			 2878,  427, 2878,  421, 1383, 2878,  408, 2878, 2878,  364, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1372, 1405,  934,  894, 1390,  359, 1093,  306,  897, 1403,
			  286, 1425, 2878,  271,  689, 1355,    0, 1438, 1434, 1448,
			  515, 2236, 1516, 2272, 2311,  835, 1484,  959,  963, 1491,
			 1484, 1526,  862, 2354, 1442, 1510, 2878,  263, 1559, 1569,
			 2390, 2878, 1553, 1585, 1603, 1606, 1609, 1032, 1628, 1640,
			 1090, 1648, 2878,  247,  236, 1622, 1673,  879,  896, 1502,
			  200,  836, 1456,    0, 1689, 1678, 2422,  195, 1721, 1105,
			 2878,  208, 1114, 1711,  175, 2465, 1664, 1714, 2878,  174,
			 1149, 1743, 1158, 1755, 1758, 1162, 1779, 1791, 1181, 1794,
			    0, 1230, 1813,  105,   85, 1825, 1199, 1726,   46, 1750,

			 1762,  946, 2878,   56,    0,    0, 1231, 2878, 1274, 1785,
			   19, 2878, 2501, 2514, 2527, 2540, 2553, 2566, 1510, 2579,
			 2592, 1553, 2605, 2617, 2630, 2643, 2656, 2669, 2682, 2695,
			 1436, 2708, 2721, 1366, 2734, 1611, 2747, 2760, 2773, 1399,
			 1829, 2786, 2799, 1423, 2812, 2825,  870, 2838,  918, 1046,
			 2851, 2864, 1115, yy_Dummy>>,
			1, 153, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 552)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (511, 512, 552)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  511,    1,  512,  512,  513,  513,  514,  514,  515,
			  515,  516,  516,  517,  517,  511,  518,  511,  511,  518,
			  511,  519,  511,  520,  521,  511,   19,  511,   27,  511,
			  521,   30,  511,  522,  522,   19,  511,  511,  511,  511,
			  511,  523,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  524,  524,  511,  524,  511,  525,  526,  511,
			  526,   35,  511,  521,   63,   63,  511,  511,  511,   63,
			  527,  527,  527,  511,  528,  527,  529,   72,  527,   72,
			  527,   77,   77,  527,  527,   72,  511,  519,  519,  519,
			   89,   89,  511,  511,  511,  530,  511,   35,  511,  531,

			  511,  511,   61,  511,  511,  532,   28,  511,  511,  533,
			  511,   19,  511,  511,   34,   34,  511,  511,  511,  511,
			  534,  523,  511,  535,  511,  511,  511,  511,  511,  523,
			  511,  511,  511,  511,  511,  511,  511,  524,  511,  524,
			  511,  524,  524,  525,  511,  525,  511,  526,  511,  526,
			  511,   63,   64,  151,  511,  111,  155,  156,  536,   72,
			  511,  529,   77,   77,   77,  527,  161,  511,  511,  511,
			  528,  511,  528,  172,  173,  173,  172,  511,  529,  537,
			  538,  538,  529,  529,  161,   72,  161,  161,  527,  511,
			   89,   89,   89,  511,  519,  511,   87,  511,   87,   87, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			   87,  536,  511,  511,  511,  511,  511,  511,  531,  511,
			  511,  511,  511,  511,  511,  511,  151,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  533,  539,  511,  511,
			  110,  511,  536,   34,  511,  511,  511,  534,  511,  511,
			  511,  511,  511,  511,  511,  511,  156,  511,  156,  511,
			   63,  511,   63,  511,   63,  511,  536,   77,   77,   77,
			  511,  511,  538,  511,  511,  173,  173,  173,  511,  511,
			  511,  172,  170,  511,  511,  511,  540,  511,  262,  278,
			  278,  538,  529,  282,  529,  511,  511,   87,  511,   87,
			  511,   89,  511,   63,  511,   89,  511,  511,  511,  511,

			  511,  541,  542,  511,  511,  511,  542,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  543,  539,  511,  511,  544,  536,  327,   34,
			  511,  511,  545,  511,  511,  546,  511,   63,   63,  511,
			  511,  278,  278,  278,  511,  511,  511,  511,  511,  511,
			  511,  538,  529,  529,  529,  282,   63,   63,  511,  511,
			  547,  511,  511,  511,  511,  511,  548,  511,  511,  541,
			  511,  542,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  222,  511,  511,  511,  511,  224,
			  511,  511,  511,  511,  543,  511,  511,  511,  511,  511, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  378,  511,  327,  536,  511,  232,  232,  232,  536,  511,
			  232,  511,  511,  511,  511,  511,  549,  511,  511,  511,
			  546,  511,  511,  529,  529,  354,  511,  547,  550,  511,
			  511,  511,  548,  511,  511,  433,  511,  511,  511,  511,
			  511,  511,  511,  440,  232,  232,  232,  536,  327,  327,
			  536,  511,  511,  511,  551,  511,  511,  549,  511,  511,
			  546,  511,  511,  552,  511,  529,  529,  354,  511,  550,
			  511,  511,  511,  511,  548,  511,  511,  475,  511,  511,
			  536,  511,  536,  511,  327,  536,  511,  327,  536,  511,
			  232,  536,  511,  232,  551,  511,  511,  511,  549,  511,

			  511,  552,  511,  511,  232,  232,  536,  511,  511,  511,
			  552,    0, yy_Dummy>>,
			1, 112, 400)
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
			    0,    1,    2,    1,   13,    3,   13,    4,    5,    6,
			    6,   13,    1,    7,    5,    8,    8,    8,    8,    4,
			    5,    4,    5,    4,    9,    9,    9,    8,   10,   11,
			   11,   10,   10,    4,   13,    4,   12,   13,    8,    8,
			    8,   10,   10,    4,   13,   13,   13, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 512)
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
			  130,  132,  134,  136,  136,  136,  136,  138,  138,  142,
			  142,  143,  144,  145,  149,  150,  151,  151,  152,  153,
			  154,  155,  156,  157,  158,  160,  161,  164,  168,  170,
			  171,  173,  175,  177,  177,  178,  178,  180,  182,  183,

			  184,  185,  189,  192,  193,  193,  194,  196,  196,  196,
			  196,  198,  199,  200,  200,  202,  204,  206,  206,  208,
			  208,  209,  210,  212,  212,  213,  213,  214,  215,  216,
			  218,  220,  222,  222,  223,  224,  224,  225,  225,  226,
			  226,  227,  227,  227,  227,  229,  229,  232,  232,  233,
			  233,  235,  236,  238,  240,  241,  244,  245,  248,  250,
			  251,  259,  259,  260,  261,  262,  264,  264,  274,  276,
			  276,  277,  287,  288,  289,  290,  291,  293,  299,  299,
			  300,  301,  302,  302,  303,  303,  304,  304,  304,  305,
			  306,  308,  312,  316,  317,  318,  319,  323,  325,  330, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  332,  337,  338,  339,  340,  341,  343,  343,  344,  345,
			  347,  347,  349,  349,  349,  349,  353,  354,  355,  357,
			  358,  362,  362,  364,  364,  366,  366,  368,  368,  369,
			  369,  371,  372,  373,  375,  376,  376,  377,  378,  378,
			  378,  379,  380,  381,  381,  382,  383,  384,  385,  386,
			  389,  389,  391,  391,  394,  394,  395,  396,  397,  398,
			  399,  403,  403,  404,  409,  409,  410,  411,  412,  417,
			  417,  423,  424,  425,  428,  428,  430,  430,  434,  435,
			  436,  437,  439,  439,  439,  439,  441,  443,  445,  447,
			  449,  453,  454,  457,  458,  462,  463,  465,  465,  466,

			  467,  468,  469,  470,  470,  474,  476,  478,  479,  479,
			  479,  479,  483,  484,  484,  486,  488,  489,  489,  491,
			  493,  494,  494,  496,  498,  499,  499,  500,  503,  507,
			  509,  509,  509,  511,  511,  511,  511,  511,  512,  513,
			  515,  517,  518,  519,  520,  523,  523,  524,  524,  524,
			  526,  526,  527,  527,  527,  527,  527,  529,  531,  534,
			  537,  538,  540,  540,  541,  541,  541,  541,  541,  542,
			  543,  544,  545,  545,  546,  546,  546,  546,  554,  556,
			  558,  558,  558,  559,  559,  561,  562,  562,  563,  563,
			  565,  566,  566,  567,  567,  569,  570,  570,  571,  573, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  574,  576,  576,  579,  582,  585,  586,  587,  588,  592,
			  596,  597,  598,  599,  599,  599,  599,  599,  599,  600,
			  601,  602,  602,  602,  602,  602,  602,  603,  604,  605,
			  607,  608,  609,  610,  612,  612,  614,  618,  618,  618,
			  618,  620,  621,  621,  623,  625,  628,  631,  633,  635,
			  639,  642,  642,  644,  644,  645,  645,  645,  645,  645,
			  645,  645,  645,  645,  645,  645,  645,  645,  645,  646,
			  647,  648,  648,  648,  648,  648,  652,  652,  656,  657,
			  657,  659,  661,  663,  665,  667,  669,  671,  673,  676,
			  679,  680,  684,  688,  689,  689,  689,  689,  689,  689,

			  689,  689,  689,  691,  691,  693,  695,  698,  699,  699,
			  699,  699,  699, yy_Dummy>>,
			1, 113, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 698)
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
			    0,  118,   16,  116,  117, -138,  111,  112,  116,  117,
			  111,  112,  117,    1,   16,  116,  117, -138,   58,  116,
			  117,   13,   16,  116,  117, -132, -138,    1,  116,  117,
			   33,  116,  117,    1,  116,  117,    1,  116,  117,    1,
			   16,  116,  117, -138,   73,  116,  117, -191,   73,  116,
			  117, -191,    1,  116,  117,    1,  116,  117,    1,  116,
			  117,    1,  116,  117,   11,  116,  117, -129,   11,  116,
			  117, -129,   16,  116,  117, -138,  116,  117,  115,  117,
			  113,  114,  115,  117,  113,  114,  117,  115,  117,   64,
			  117,   69,  117,   65,  117, -183,   68,  117,   72,  117,

			   72,  117,   71,  117,   70,   72,  117,   46,  117,   46,
			  117,   45,  117,   52,  117,   52,  117,   51,  117,   52,
			  117,   49,   52,  117,   52,  117,   55,  117,   54,  117,
			   55,  117,   16, -138,   20,  -21,  111,  112,    2,    3,
			   20,  -21,   58,   58,   58,   42,   56, -160, -174,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58, -161,
			   58,  -15,   20,  -21,   13,   16, -132, -138,   13, -132,
			   13,   13, -132,   13, -132,    2,    3,   33,   32,   33,
			   16, -138,    2,  112,    5,  104,  110, -218, -224,    5,
			   16, -138,  -74, -216,   73, -191,   79, -197,   16,  -12, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   11, -129,   11, -129,   77, -195,  113,  114,  114,   64,
			   65, -183,  -66,   67,   67,   59,   64,   67,   62,   67,
			   63,   67,   71,   70,   45,   51,   49,   50,   51,   47,
			   49, -165,   54,   53,   54,   16,   16, -136,   16, -135,
			  -21,   16, -136, -138,   16,   16, -135, -138,    3,  -21,
			   58,   37,   40,   42,   56, -156, -158, -160, -174,   58,
			   58,   58,   58, -161,   34,   37,   40,   42,   56, -152,
			 -156, -158, -160, -174,  -43,  -57,   58,   36,   37,   40,
			   42,   56, -155, -156, -158, -160, -174,   58,   58,   58,
			   58,   58, -161,   34,   42,   56, -152, -160, -174,   58,

			   58,   58, -161,   58,   58,  -44,   13,   16,   13,   16,
			 -132, -136,   13,   16, -132, -135,  -15,   13,   14,   13,
			   16, -132, -138,  -15,  -21,   13,   16, -132, -136, -138,
			   13,   16,   13,   16, -132, -135, -138,    3,   22,   33,
			   31,    2,    4,  112,  112,    6,    7, -101, -107,    6,
			    7,   20,  -21,   16,  102,  -99,  102,  102,  104,  110,
			 -218, -224,   93, -211,   87, -205,   81, -199,  -80,   75,
			 -193,   20,    3,   11, -129,  -78,  114,  114,   61,   61,
			  -48,   17,  -19,   16,  -18,   16,  -19,   20,  -21,   17,
			   20,  -18,   20,  -21,    3,    3,   58,   58,   58,  -39, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  -41,  -43,  -57,   58,  -35,  -39,  -41,  -43,  -57,   58,
			   58,   58,  -38,  -39,  -41,  -43,  -57,   36,   42,   56,
			 -155, -160, -174,   58,   58,  -35,  -43,  -57,   56, -174,
			   40,   56, -158, -174,   58,   58,   58,   58, -161,   14,
			   17,  -15,  -19,   13,   16,  -15,  -18,   13,   16,  -15,
			  -19,   20,  -21,   13,   14,   17,   20,  -15,  -15,  -18,
			   20,  -21,   13,   23,   24,   25,   30,   30,    4,    7,
			  104,  110, -218, -224,  110, -224,    7,  -21,  -99,  103,
			  109, -217, -223,  -94,   97, -215,   95, -213,  -88,   91,
			 -209,   89, -207,  -82,   85, -203,   83, -201,  -76, -222,

			    3,   16, -138,    3,   16, -136, -138,   11, -129,   60,
			   64,  -19,  -18,  -19,  -21,  -18,  -21,   58,   58,   58,
			  -38,  -43,  -57,  -57,  -41,  -57,   58,  -15,  -19,  -15,
			  -18,  -15,  -19,  -21,  -15,  -18,  -21,   24,   26,   27,
			   33,    4,    4,    7,    7, -107,  103,  104,  109,  110,
			 -217, -218, -223, -224,  110, -224, -100, -106,  -98,   93,
			 -211,  -96,  -92,   87, -205,  -90,  -86,   81, -199,  -84,
			  108, -105,  108,  108,  110, -224,    3,   16, -138,    3,
			   20,  -21,    3,   20,  -21,    3,    3,    3,    3,  -19,
			   20,  -21,    3,  -19,   20,  -21,    3,  -12,    8,   61, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   61,   61,   24,   24,   27,   28, -146,   30,   30,   30,
			  110, -224,  110, -224, -100, -101, -106, -107,  109, -223,
			 -105,  109, -223,    3,   16,    3,   16, -136,    3,   16,
			 -135,    3,  -21,    3,   16,    3,   16, -135, -138,    3,
			  -19,  -21,    9,   10,  -12,   27,   27,  -29,  109,  110,
			 -223, -224,  109,  110, -223, -224, -106,    3,   17,    3,
			   17,    3,  -19,    3,  -19,    3,   16,    3,  -18,    3,
			  -18,    3,   16,    3,   17,   20,    3,   17,   20,    3,
			    3,  -18,   20,  -21,    3,  -18,   20,  -21,    3, -106,
			 -107,    3,  -19,    3,  -18,    3,  -18,  -21,   10, yy_Dummy>>,
			1, 99, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2878
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 511
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 512
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

	yyNb_rules: INTEGER = 117
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 118
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
