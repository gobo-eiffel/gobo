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
				process_two_char_symbol (unicode_text_item (1), unicode_text_item (2))
			
when 6 then
yy_set_line_column
--|#line 65 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 65")
end

				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (unicode_text_item (1), unicode_text_item (2))
			
when 7 then
yy_set_line_column
--|#line 71 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 71")
end

				last_text_count := 2
				last_break_end := 0
				last_comment_end := text_count
				process_two_char_symbol (unicode_text_item (1), unicode_text_item (2))
			
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
			create an_array.make_filled (0, 0, 2564)
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
			an_array.area.fill_with (515, 2516, 2564)
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
			   33,   33,   33,   22,   19,   19,   16,   37,   38,   16,
			   40,   41,   40,   40,   41,   40,   44,   44,  514,   45,
			   45,   42,   46,   46,   42,   48,   49,   48,   48,   49,
			   48,  506,   50,   61,   62,   50,   52,   53,   52,   52,
			   53,   52,   55,   56,   57,  502,   58,   55,   56,   57,
			  499,   58,   61,   62,   64,   64,   64,   68,   68,   68,

			   68,   68,   68,   99,  100,   65,  126,  106,   69,  127,
			  101,   69,  104,   66,  104,   67,   59,   70,   70,   70,
			  510,   59,   96,   96,   96,  136,  137,  136,   71,  116,
			  116,  116,  138,   97,  152,  153,   66,  106,   67,   73,
			  117,   73,   74,   75,   76,   77,   78,   73,   77,   74,
			   79,   80,   81,   73,   73,   73,   73,   82,   83,   77,
			   84,   85,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   86,   87,   77,   73,   72,   73,   73,   73,   73,
			   73,   86,   74,   74,   72,   88,   89,   72,   90,   90,
			   90,   91,  482,   91,   75,   63,  154,  153,   91,   93, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  155,   91,  102,  102,  102,  515,  515,   94,  156,   95,
			  157,   73,  515,  103,   64,   64,   64,  164,  118,  515,
			  515,   91,   63,  104,   91,   65,  139,  140,  139,  478,
			  118,   91,   63,   63,   63,   63,   63,   96,   96,   96,
			  120,  120,  120,  120,  152,  153,  189,  106,   97,  104,
			  160,  105,  105,  105,  105,  107,  107,  107,  515,  336,
			  161,  121,   96,   96,   96,  211,  108,  109,  474,  110,
			  110,  110,  110,   97,  240,  212,   96,   96,   96,  111,
			  112,  464,  104,  471,  241,  189,  113,  115,  142,  143,
			  114,  144,   77,  111,  112,  104,  104,   96,   96,   96,

			  116,  116,  116,  122,  122,  122,  142,  149,   97,  150,
			  126,  117,  191,  127,  123,  189,  276,  104,  185,  122,
			  122,  122,  128,  128,  128,   68,   68,   68,  126,  119,
			  123,  127,  464,  129,  154,  153,   69,  243,  132,  243,
			  471,  119,  131,  132,  131,  130,  133,  130,  130,  133,
			  133,  133,  130,  130,  130,  134,  130,  130,  130,  130,
			  130,  133,  130,  133,  130,  133,  133,  133,  130,  130,
			  133,  133,  130,  130,  130,  130,  130,  130,  130,  135,
			  135,  135,  135,  135,  130,  130,  130,  130,  130,  130,
			  130,  145,  142,  146,  499,  144,  145,  148,  146,  259, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  144,  515,  515,  515,   96,   96,   96,  498,   75,  260,
			  191,  170,  158,  440,   72,   97,  172,  172,  172,  259,
			  159,  279,  515,   77,  280,  147,  458,  173,  515,  260,
			  147,  163,  164,  163,  164,  165,  169,  454,  163,  166,
			  269,  163,  197,  197,  197,  452,  169,  167,  270,  168,
			  271,   73,  181,  203,  181,  170,  187,  170,  451,  211,
			  169,  163,   77,  445,  163,  399,  187,  226,  226,  212,
			  169,  163,  163,  163,  163,  163,  163,  163,  171,  163,
			  169,  165,  169,  396,  163,  166,  181,  163,  227,  170,
			  169,  240,  169,  167,  259,  168,  139,  140,  139,  190,

			  394,  241,   77,   72,  260,  191,  169,  163,  391,  184,
			  163,   77,   77,   72,  169,  389,  169,  163,  163,  163,
			  163,  163,  163,   73,  169,   73,  174,  175,  174,  176,
			  165,  176,  176,  174,  177,  176,  174,  176,  176,  176,
			  176,  176,  178,  176,  179,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  180,  174,  176,  176,  174,
			  176,  176,  176,  176,  176,  180,  174,  163,  163,  163,
			  163,  163,  183,  386,  237,  184,  185,  185,  118,  181,
			  383,  186,  170,   96,   96,   96,  377,  185,  237,  185,
			  118,  185,  185,  185,   97,   77,  185,  185,  367,  164, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  187,  192,  193,  192,  125,  181,  261,  169,  170,  433,
			  187,   72,  181,   72,  262,  188,  263,  169,   72,   73,
			  478,   72,  432,  209,  209,  209,  502,   72,  515,   77,
			  248,  248,  248,  169,  210,  213,  213,  213,  219,  219,
			  219,   72,  126,  169,   72,  127,  214,  142,  143,  220,
			  144,   72,   72,   72,   72,   72,   72,   90,   90,   90,
			   91,  372,   91,  515,   63,  190,  353,   91,  194,  276,
			   91,  373,  350,  197,  197,  197,  195,  176,  196,   76,
			  235,  235,  235,  348,  203,  422,  422,  122,  122,  122,
			   91,  236,   92,   91,  204,  228,  228,  228,  123,  281,

			   91,   63,   63,   63,   63,   63,  197,  197,  197,  120,
			  120,  120,  120,  515,  434,  434,  229,  198,  128,  128,
			  128,  244,  245,  245,  245,  136,  137,  136,   75,  129,
			  121,  191,  138,  148,  143,   72,  144,  145,  142,  146,
			  515,  144,  145,  148,  146,   73,  144,  192,  193,  192,
			  515,  515,  515,  515,  515,  199,  199,  199,  200,  515,
			  200,  328,  101,  374,  324,  200,  201,  320,  200,  142,
			  149,  147,  150,  375,  202,  316,  147,  148,  149,  261,
			  150,  246,  246,  246,  249,  249,  249,  262,  200,  263,
			  364,  200,  247,  319,  319,  250,  459,  459,  200,  101, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  101,  101,  101,  101,  215,  215,  215,  279,  503,  503,
			  170,  251,  251,  251,  227,  216,  183,  363,  105,  105,
			  105,  105,  252,  253,  253,  253,  255,  255,  255,   75,
			  217,  515,  190,  374,  254,  285,   72,  256,  514,  218,
			  222,  222,  222,  375,   73,  285,   72,  257,  257,  257,
			  333,  223,  362,  118,  224,  224,  224,  224,  258,  264,
			  264,  264,  267,  267,  267,  118,  225,  232,  232,  232,
			  265,  422,  422,  268,  272,  272,  272,  352,  233,  424,
			  424,  234,  234,  234,  234,  273,  277,  277,  277,  192,
			  193,  192,  462,   75,  434,  434,  170,  278,  515,  289,

			  289,  289,  114,  238,  238,  238,  430,  277,  286,  287,
			  287,  287,  436,  436,  239,  476,  431,  120,  120,  120,
			  120,  169,   93,  288,  193,  288,  187,  515,  459,  459,
			   94,  169,   95,  243,  132,  243,  187,  166,  121,  183,
			  461,  461,  266,  185,  185,  323,  323,  323,  186,  500,
			  292,  292,  292,   73,  185,  187,  185,  272,  185,  185,
			  185,  293,  175,  185,  185,  187,  229,  187,  192,  193,
			  192,  372,   75,  267,  374,  170,  264,  187,  176,  274,
			  176,  373,  170,  190,  375,  176,  275,  184,  176,  259,
			  199,  199,  199,  344,  176,  185,  176,  184,  515,  260, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  169,  197,  300,  300,  300,  423,  423,  423,  176,  343,
			  169,  176,  342,  301,  290,  290,  290,  259,  176,   73,
			   73,   73,   73,   73,   76,  291,   76,  260,  188,  505,
			  505,   76,   73,   92,   76,  204,  341,  294,  294,  294,
			   76,  296,  296,  296,  303,  304,  304,  304,  295,  435,
			  435,  435,  297,  448,   76,  246,   94,   76,   95,  238,
			   94,  449,   95,  450,   76,   72,   72,   72,   72,   72,
			  266,  281,  266,  232,  165,  231,  311,  266,  282,  452,
			  266,  215,  306,  298,  298,  298,  283,  205,  284,  453,
			  209,  209,  209,  305,  299,  211,  211,  211,  430,  285,

			  266,  210,   94,  266,   95,  302,   69,  184,  431,  285,
			  266,  266,  266,  266,  266,  266,  213,  213,  213,  307,
			  307,  503,  503,  308,  308,  308,  308,  214,  309,  309,
			  309,  309,  213,  213,  213,  248,  248,  248,  334,  335,
			  335,  335,  512,  214,  184,  472,  310,  184,  172,  218,
			  215,  215,  215,  314,  314,  473,  185,  315,  315,  315,
			  315,  216,  259,  128,  224,  224,  224,  224,  316,  316,
			  316,  259,  260,  324,  324,  324,  312,  242,  124,  317,
			  116,  260,  226,  226,  325,  313,  328,  328,  328,  240,
			  240,  240,  336,  245,  245,  245,  245,  329,  330,  472, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  123,  231,  107,  318,  320,  320,  320,  259,  326,  473,
			  259,  259,  259,   63,  340,  321,  206,  260,  228,  228,
			  228,   97,  308,  308,  308,  308,  164,  175,  164,  190,
			  191,  191,  208,   72,  276,   72,  348,  348,  348,  322,
			  259,   73,  331,   72,  331,   73,  331,  349,  175,  331,
			  260,  190,  331,  206,  259,  276,  205,  189,  332,  350,
			  350,  350,  189,  176,  260,   76,  353,  353,  353,  162,
			  351,  103,  331,  160,  124,  331,  106,  354,  315,  315,
			  315,  315,  331,  331,  331,  331,  331,  331,  336,  245,
			  245,  245,  245,  106,  355,  193,  355,  515,  279,  337,

			  338,  170,  425,  426,  426,  426,  339,  288,  193,  288,
			  340,  515,  515,  337,  338,  266,  281,  266,  515,  165,
			  182,  182,  266,  345,  515,  266,  285,  182,  393,  393,
			  393,  346,  515,  347,  182,  182,  285,  259,  515,  187,
			  300,  300,  300,  281,  285,  266,  191,  260,  266,  187,
			  184,  301,  515,  515,  285,  266,  266,  266,  266,  266,
			  266,  184,  279,  184,  515,  188,  515,  515,  184,  185,
			  259,  184,  515,  515,  296,  296,  296,  184,  515,  185,
			  260,  365,  365,  365,  515,  360,  367,  304,  304,  304,
			  304,  184,  366,   94,  184,   95,  515,  515,  396,  396, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  396,  184,  184,  184,  184,  184,  184,  515,  371,  397,
			  296,  296,  296,  460,  460,  460,  185,  287,  287,  287,
			  287,  361,  382,  382,  382,  382,  259,  356,  357,   94,
			  259,   95,  515,  326,  358,  187,  260,  515,  359,  515,
			  260,  356,  357,  313,  515,  187,  367,  304,  304,  304,
			  304,  515,  412,  413,  412,  380,  380,  368,  369,  381,
			  381,  381,  381,  414,  370,  386,  386,  386,  371,  515,
			  515,  368,  369,  215,  215,  215,  387,  515,  515,  388,
			  388,  389,  389,  389,  216,  515,  515,  308,  308,  308,
			  308,  515,  390,  515,  515,  319,  319,  336,  422,  422,

			  318,  399,  399,  399,  427,  427,  515,  515,  376,  377,
			  377,  377,  400,  423,  423,  423,  227,  230,  230,  462,
			  378,  230,  187,  309,  309,  309,  309,  125,  335,  335,
			  335,  335,  187,  515,  463,  379,  231,  245,  245,  245,
			  245,  365,  365,  365,  218,  383,  383,  383,  281,  421,
			  515,  190,  366,  327,  327,  184,  384,  327,  340,  315,
			  315,  315,  315,  185,  515,  184,  355,  193,  355,  515,
			  279,  515,  515,  170,  515,  515,  372,  372,  372,  515,
			  385,  391,  391,  391,  428,  428,  428,  210,  182,  367,
			  434,  434,  392,  515,  515,  393,  393,  393,  285,  182, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  182,  515,  187,  504,  504,  504,  182,  515,  285,  515,
			  515,  476,  187,  182,  182,  515,  322,  394,  394,  394,
			  304,  304,  304,  304,  374,  374,  374,  515,  395,  515,
			  515,  323,  323,  323,  515,  214,  437,  437,  437,  437,
			  515,  371,  438,  438,  515,  515,  439,  439,  439,  439,
			  515,  515,  229,  402,  402,  402,  515,  376,  381,  381,
			  381,  381,  515,  515,  403,  515,  515,  404,  404,  404,
			  404,  444,  444,  444,  444,  324,  324,  324,  515,  405,
			  407,  408,  407,  406,  515,  406,  325,  406,  515,  515,
			  406,  409,  385,  406,  404,  404,  404,  404,  515,  410,

			  515,  411,  515,  316,  316,  316,  439,  439,  439,  439,
			  326,  515,  515,  406,  317,  515,  406,  388,  388,  439,
			  439,  439,  439,  406,  406,  406,  406,  406,  406,  415,
			  415,  415,  515,  416,  335,  335,  335,  335,  318,  515,
			  417,  446,  446,  515,  515,  447,  447,  447,  447,  259,
			  259,  259,  259,  259,  259,  421,  515,  515,  118,  515,
			   97,  515,  515,   97,  336,  423,  423,  423,  515,  515,
			  118,  416,  125,  335,  335,  335,  335,  515,  183,  426,
			  426,  426,  426,  418,  419,  515,  463,  435,  435,  435,
			  420,  515,  515,  515,  421,  515,  515,  418,  419,  515, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  468,  515,  455,  455,  455,  515,  456,  515,  477,  429,
			  429,  429,  429,  457,  430,  430,  430,  515,  429,  429,
			  429,  429,  515,  515,  515,  301,  515,  187,  367,  435,
			  435,  435,  429,  429,  429,  515,  515,  187,  440,  440,
			  440,  125,  459,  459,  456,  515,  474,  474,  474,  441,
			  477,  515,  381,  381,  381,  381,  515,  475,  479,  479,
			  479,  479,  515,  500,  515,  185,  427,  427,  447,  447,
			  447,  447,  515,  442,  377,  377,  377,  515,  515,  442,
			  447,  447,  447,  447,  187,  378,  515,  469,  382,  382,
			  382,  382,  480,  480,  187,  515,  481,  481,  481,  481,

			  443,  515,  515,  515,  484,  485,  484,  515,  515,  313,
			  183,  426,  426,  426,  426,  451,  489,  490,  489,  515,
			  515,  465,  466,  486,  487,  486,  515,  491,  467,  492,
			  493,  492,  468,  515,  488,  465,  466,  515,  515,  515,
			  494,  515,  205,  515,  453,  515,  185,  428,  428,  428,
			  495,  496,  495,  455,  455,  455,  515,  456,  472,  472,
			  472,  497,   63,   63,  457,  187,   63,  515,  470,  366,
			  481,  481,  481,  481,   63,  187,  377,  377,  377,  125,
			  460,  460,  460,  426,  426,  426,  426,  378,  515,  515,
			  437,  437,  437,  437,  515,  456,  481,  481,  481,  481, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  515,  501,  515,  515,  468,  515,  515,  515,  183,  503,
			  503,  376,  482,  482,  482,  427,  427,  428,  428,  428,
			  259,  259,  259,  483,  515,  515,  444,  444,  444,  444,
			  512,   97,  515,  187,  515,  187,  469,  515,  470,  515,
			  259,  259,  259,  187,  515,  187,  515,  385,  506,  506,
			  506,   97,  515,  515,  515,  492,  493,  492,  515,  507,
			  515,  515,  479,  479,  479,  479,  508,  259,  259,  259,
			  492,  493,  492,  259,  259,  259,  515,  515,   97,  515,
			  515,  509,  515,  442,   97,  259,  259,  259,  499,  499,
			  499,  515,  511,  460,  460,  460,   97,  515,  515,  457,

			  183,  504,  504,  504,  504,  504,  504,  101,  101,  515,
			  207,  101,  207,  207,  501,  515,  207,  515,  207,  101,
			  515,  125,  513,  125,  125,  513,  515,  125,  515,  125,
			  511,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   60,   60,   60,   60, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   92,
			   92,  515,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   98,  515,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  118,  118,  515,  515,  515,
			  515,  515,  118,  118,  118,  118,  118,  125,  515,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,   73,

			  515,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,  182,  515,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  221,  221,
			  221,  221,  221,  221,  515,  221,  221,  221,  221,  221,
			  221,  124,  124,  124,  124,  124,  124,  124,  124,  124,
			  124,  124,  124,  124,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  183,  515,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  185,  515,  185,  185,  185,  185,  185,  185,  185,  185, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  185,  185,  185,  183,  515,  183,  183,  515,  515,  183,
			  515,  183,  305,  305,  305,  305,  305,  305,  305,  305,
			  305,  305,  305,  305,  305,  306,  306,  306,  306,  306,
			  306,  306,  306,  306,  306,  306,  306,  306,  398,  398,
			  515,  515,  515,  515,  515,  398,  398,  515,  515,  398,
			  401,  401,  401,  401,  401,  401,  515,  401,  401,  401,
			  401,  401,  401,  125,  515,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,

			  432,  432,  498,  498,  498,  498,  498,  498,  498,  498,
			  498,  498,  498,  498,  498,   15, yy_Dummy>>,
			1, 116, 2400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2564)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 49)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (20, 141, 187)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (46, 342, 390)
			yy_chk_template_3 (an_array)
			an_array.area.fill_with (76, 525, 571)
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
			an_array.area.fill_with (515, 2515, 2564)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    3,    3,    4,    4,    4,    5,    6,  514,    5,
			    6,    3,    5,    6,    4,    7,    7,    7,    8,    8,
			    8,  507,    7,   13,   13,    8,    9,    9,    9,   10,
			   10,   10,   11,   11,   11,  502,   11,   12,   12,   12,
			  498,   12,   14,   14,   16,   16,   16,   17,   17,   17,
			   18,   18,   18,   23,   23,   16,   43,   26,   17,   43,
			   31,   18,   31,   16,   26,   16,   11,   19,   19,   19,
			  497,   12,   22,   22,   22,   48,   48,   48,   19,   33,
			   33,   33,   48,   22,   60,   60,   19,   26,   19,   20,
			   33, yy_Dummy>>,
			1, 91, 50)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   21,   21,   21,   21,  483,   21,  166,   21,   62,   62,
			   21,   21,   63,   21,   24,   24,   24,   28,   28,   21,
			   63,   21,   63,  166,   28,   24,   35,   35,   35,   87,
			  118,   28,   28,   21,   63,   24,   21,   35,   52,   52,
			   52,  478,  118,   21,   21,   21,   21,   21,   21,   25,
			   25,   25,   36,   36,   36,   36,  151,  151,   87,   35,
			   25,   25,   66,   25,   25,   25,   25,   27,   27,   27,
			   66,  424,   66,   36,   29,   29,   29,  103,   27,   27,
			  475,   27,   27,   27,   27,   29,  124,  103,   30,   30,
			   30,   27,   27,  424,   29,  471,  124,   81,   27,   30,

			   54,   54,   27,   54,   81,   27,   27,   30,   30,   32,
			   32,   32,   34,   34,   34,   40,   40,   40,   59,   59,
			   32,   59,  125,   34,  179,  125,   40,   81,  179,   32,
			  429,   41,   41,   41,   45,   45,   45,   68,   68,   68,
			  133,   34,   41,  133,  464,   45,  153,  153,   68,  131,
			  131,  131,  429,   34, yy_Dummy>>,
			1, 154, 188)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,  458,   55,   57,   57,   57,  162,   57,
			   65,   65,   65,   70,   70,   70,  457,   73,  162,   84,
			   73,   65,  441,   84,   70,   75,   75,   75,  205,   65,
			  183,   65,   84,  183,   55,  417,   75,  182,  205,   57,
			   72,   72,   72,  261,   72,   73,  414,   72,   72,  174,
			   72,   95,   95,   95,  411,   73,   72,  174,   72,  174,
			  261,   77,   95,   80,   77,  182,   80,  409,  212,   72,
			   72,   80,  403,   72,  400,  182,  111,  111,  212,   72,
			   72,   72,   72,   72,   72,   72,   74,   74,   74,   77,
			   74,   80,  397,   74,   74,   82,   74,  111,   82,   77,

			  241,   80,   74,  260,   74,  139,  139,  139,   83,  395,
			  241,   82,   83,  260,  284,   74,   74,  392,  284,   74,
			   83,   83,   83,   82,  390,   74,   74,   74,   74,   74,
			   74,   74,   76,   82, yy_Dummy>>,
			1, 134, 391)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   78,  387,  119,   78,   78,   78,  119,   85,  384,   78,
			   85,   96,   96,   96,  378,   78,  119,   78,  119,   78,
			   78,   78,   96,   85,   78,   78,  436,  163,   78,   86,
			   86,   86,  461,   86,  163,   85,   86,  367,   78,   79,
			   79,   79,  163,   79,  163,   85,   79,   79,  436,   79,
			  366,  102,  102,  102,  461,   79,  361,   79,  155,  155,
			  155,   86,  102,  104,  104,  104,  106,  106,  106,   79,
			  336,   86,   79,  336,  104,  141,  141,  106,  141,   79,
			   79,   79,   79,   79,   79,   91,   91,   91,   91,  305,
			   91,  360,   91,  178,  354,   91,   91,  178,   91,  305,

			  351,   94,   94,   94,   91,  178,   91,  178,  115,  115,
			  115,  349,   94,  337,  337,  122,  122,  122,   91,  115,
			   94,   91,   94,  112,  112,  112,  122,  345,   91,   91,
			   91,   91,   91,   91,   92,   92,   92,  121,  121,  121,
			  121,   92,  368,  368,  112,   92,  126,  126,  126,  134,
			  134,  134,  134,  136,  136,  136,  168,  126,  121,  168,
			  136,  143,  143,  168,  143,  145,  145,  145,  342,  145,
			  146,  146,  146,  168,  146,  180,  180,  180,   92,   92,
			   92,   92,   92,   93,   93,   93,   93,  341,   93,  329,
			   93,  306,  325,   93,   93,  321,   93,  147,  147,  145, yy_Dummy>>,
			1, 200, 572)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  147,  306,   93,  317,  146,  149,  149,  189,  149,  150,
			  150,  150,  156,  156,  156,  189,   93,  189,  301,   93,
			  150,  227,  227,  156,  418,  418,   93,   93,   93,   93,
			   93,   93,  105,  105,  105,  185,  465,  465,  185,  157,
			  157,  157,  227,  105,  505,  299,  105,  105,  105,  105,
			  157,  159,  159,  159,  160,  160,  160,  167,  105,  297,
			  167,  310,  159,  185,  167,  160,  505,  105,  109,  109,
			  109,  310,  167,  185,  167,  161,  161,  161,  237,  109,
			  295,  237,  109,  109,  109,  109,  161,  164,  164,  164,
			  171,  171,  171,  237,  109,  114,  114,  114,  164,  462,

			  462,  171,  175,  175,  175,  280,  114,  549,  549,  114,
			  114,  114,  114,  175,  181,  181,  181,  169,  169,  169,
			  462,  169,  476,  476,  169,  181,  186,  194,  194,  194,
			  114,  120,  120,  120,  364,  278,  186,  186,  186,  186,
			  551,  551,  120,  476,  364,  120,  120,  120,  120,  169,
			  200,  187,  187,  187,  186,  187,  500,  500,  200,  169,
			  200,  243,  243,  243,  186,  276,  120,  165,  552,  552,
			  165,  165,  165,  229,  229,  229,  165,  500,  196,  196,
			  196,  275,  165,  187,  165,  273,  165,  165,  165,  196,
			  269,  165,  165,  187,  229,  165,  192,  192,  192,  373, yy_Dummy>>,
			1, 200, 772)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  192,  268,  375,  192,  265,  165,  176,  176,  176,  373,
			  176,  283,  375,  176,  176,  283,  176,  407,  198,  198,
			  198,  258,  176,  283,  176,  283,  256,  407,  192,  198,
			  206,  206,  206,  338,  338,  338,  176,  254,  192,  176,
			  252,  206,  195,  195,  195,  412,  176,  176,  176,  176,
			  176,  176,  177,  195,  177,  412,  177,  555,  555,  177,
			  177,  195,  177,  195,  250,  202,  202,  202,  177,  203,
			  203,  203,  208,  208,  208,  208,  202,  369,  369,  369,
			  203,  406,  177,  247,  202,  177,  202,  239,  203,  406,
			  203,  406,  177,  177,  177,  177,  177,  177,  184,  184,

			  184,  233,  184,  231,  223,  184,  184,  410,  184,  216,
			  214,  204,  204,  204,  184,  410,  184,  410,  209,  209,
			  209,  210,  204,  211,  211,  211,  431,  184,  184,  209,
			  204,  184,  204,  207,  211,  191,  431,  184,  184,  184,
			  184,  184,  184,  184,  213,  213,  213,  217,  217,  512,
			  512,  217,  217,  217,  217,  213,  218,  218,  218,  218,
			  219,  219,  219,  220,  220,  220,  242,  242,  242,  242,
			  512,  219,  190,  432,  220,  188,  173,  218,  224,  224,
			  224,  225,  225,  432,  170,  225,  225,  225,  225,  224,
			  451,  129,  224,  224,  224,  224,  226,  226,  226,  454, yy_Dummy>>,
			1, 200, 972)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  451,  230,  230,  230,  224,  127,  123,  226,  117,  454,
			  226,  226,  230,  224,  234,  234,  234,  240,  240,  240,
			  245,  245,  245,  245,  245,  234,  234,  473,  240,  113,
			  108,  226,  228,  228,  228,  484,  230,  473,  259,  259,
			  259,  101,  245,  228,  100,  484,  228,  228,  228,  259,
			  307,  307,  307,  307,  262,  271,  263,  262,  271,  263,
			   99,  262,  271,  263,  274,  274,  274,  228,  236,  262,
			  236,  262,  236,  263,  236,  274,  270,  236,  236,  270,
			  236,   98,  486,  270,   97,   89,  236,  279,  279,  279,
			   88,  270,  486,  270,  281,  281,  281,   71,  279,   69,

			  236,   67,   42,  236,   38,  281,  314,  314,  314,  314,
			  236,  236,  236,  236,  236,  236,  244,  244,  244,  244,
			  244,   37,  285,  285,  285,   15,  285,  244,  244,  285,
			  352,  352,  352,  352,  244,  288,  288,  288,  244,  288,
			    0,  244,  244,  266,  266,  266,    0,  266,  287,  287,
			  266,  266,    0,  266,  285,  287,  393,  393,  393,  266,
			    0,  266,  287,  287,  285,  489,    0,  288,  300,  300,
			  300,  347,  266,  266,  347,  489,  266,  288,  347,  300,
			    0,    0,  266,  266,  266,  266,  266,  266,  266,  282,
			  282,  282,    0,  282,    0,    0,  282,  282,  492,  282, yy_Dummy>>,
			1, 200, 1172)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  291,  291,  291,  282,    0,  282,  492,  302,
			  302,  302,    0,  291,  304,  304,  304,  304,  304,  282,
			  302,  291,  282,  291,    0,    0,  326,  326,  326,  282,
			  282,  282,  282,  282,  282,  286,  304,  326,  293,  293,
			  293,  419,  419,  419,  286,  286,  286,  286,  286,  293,
			  313,  313,  313,  313,  495,  286,  286,  293,  510,  293,
			    0,  326,  286,  286,  495,    0,  286,    0,  510,  286,
			  286,  313,    0,  286,  303,  303,  303,  303,  303,    0,
			  332,  332,  332,  312,  312,  303,  303,  312,  312,  312,
			  312,  332,  303,  318,  318,  318,  303,    0,    0,  303,

			  303,  308,  308,  308,  318,    0,    0,  318,  318,  319,
			  319,  319,  308,    0,    0,  308,  308,  308,  308,    0,
			  319,    0,  356,  319,  319,  422,  422,  422,  318,  327,
			  327,  327,  356,  356,    0,    0,  308,  309,  309,  309,
			  327,  463,  463,  463,  319,  536,  536,  422,  309,  536,
			  356,  309,  309,  309,  309,  335,  335,  335,  335,  335,
			  356,    0,  463,  309,  327,  340,  340,  340,  340,  365,
			  365,  365,  309,  315,  315,  315,  346,  335,    0,  346,
			  365,  542,  542,  346,  315,  542,  340,  315,  315,  315,
			  315,  346,    0,  346,  355,  355,  355,    0,  355,    0, yy_Dummy>>,
			1, 200, 1372)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  355,  357,    0,  372,  372,  372,    0,  315,  322,
			  322,  322,  357,  357,  357,  372,  359,  434,  434,  434,
			  322,    0,    0,  322,  322,  322,  355,  359,  359,    0,
			  357,  466,  466,  466,  359,    0,  355,    0,    0,  434,
			  357,  359,  359,    0,  322,  323,  323,  323,  371,  371,
			  371,  371,  374,  374,  374,    0,  323,    0,    0,  323,
			  323,  323,    0,  374,  376,  376,  376,  376,    0,  371,
			  379,  379,    0,    0,  379,  379,  379,  379,    0,    0,
			  323,  330,  330,  330,    0,  376,  380,  380,  380,  380,
			    0,    0,  330,    0,    0,  330,  330,  330,  330,  385,

			  385,  385,  385,  398,  398,  398,    0,  330,  331,  331,
			  331,  331,    0,  331,  398,  331,    0,    0,  331,  331,
			  385,  331,  404,  404,  404,  404,    0,  331,    0,  331,
			    0,  388,  388,  388,  438,  438,  438,  438,  398,    0,
			    0,  331,  388,    0,  331,  388,  388,  439,  439,  439,
			  439,  331,  331,  331,  331,  331,  331,  333,  333,  333,
			    0,  333,  421,  421,  421,  421,  388,    0,  333,  405,
			  405,    0,    0,  405,  405,  405,  405,  408,  408,  408,
			  413,  413,  413,  421,    0,    0,  333,    0,  408,    0,
			    0,  413,  423,  423,  423,  423,    0,    0,  333,  333, yy_Dummy>>,
			1, 200, 1572)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  334,  334,  334,  334,  334,    0,  426,  426,  426,  426,
			  426,  334,  334,    0,  423,  477,  477,  477,  334,    0,
			    0,    0,  334,    0,    0,  334,  334,  358,  426,    0,
			  415,  415,  415,    0,  415,    0,  477,  358,  358,  358,
			  358,  415,  430,  430,  430,    0,  358,  358,  358,  358,
			    0,    0,    0,  430,    0,  358,  435,  435,  435,  435,
			  358,  358,  358,    0,    0,  358,  381,  381,  381,  459,
			  459,  459,  415,    0,  433,  433,  433,  381,  435,    0,
			  381,  381,  381,  381,  427,  433,  442,  442,  442,  442,
			    0,  459,    0,  427,  427,  427,  446,  446,  446,  446,

			    0,  381,  382,  382,  382,    0,    0,  442,  447,  447,
			  447,  447,  427,  382,    0,  427,  382,  382,  382,  382,
			  443,  443,  427,    0,  443,  443,  443,  443,  382,    0,
			    0,    0,  448,  448,  448,    0,    0,  382,  425,  425,
			  425,  425,  425,  448,  450,  450,  450,    0,    0,  425,
			  425,  449,  449,  449,    0,  450,  425,  452,  452,  452,
			  425,    0,  449,  425,  425,  428,    0,    0,  452,    0,
			  449,    0,  449,    0,  428,  428,  428,  428,  453,  453,
			  453,  455,  455,  455,    0,  455,  472,  472,  472,  453,
			  522,  522,  455,  428,  522,    0,  428,  472,  480,  480, yy_Dummy>>,
			1, 200, 1772)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  480,  480,  522,  428,  437,  437,  437,  460,  460,  460,
			  460,  468,  468,  468,  468,  437,    0,    0,  437,  437,
			  437,  437,    0,  455,  481,  481,  481,  481,    0,  460,
			    0,    0,  468,  469,    0,  470,  503,  503,  503,  437,
			  444,  444,  444,  469,  469,  470,  470,  470,  485,  485,
			  485,  444,    0,    0,  444,  444,  444,  444,  503,  485,
			    0,  469,    0,  470,  469,    0,  470,    0,  487,  487,
			  487,  469,    0,  470,    0,  444,  479,  479,  479,  487,
			    0,    0,    0,  488,  488,  488,    0,  479,    0,    0,
			  479,  479,  479,  479,  488,  490,  490,  490,  491,  491,

			  491,  493,  493,  493,    0,    0,  490,    0,    0,  491,
			    0,  479,  493,  496,  496,  496,  499,  499,  499,    0,
			  499,  501,  501,  501,  496,    0,    0,  499,  504,  504,
			  504,  504,  513,  513,  513,  525,  525,    0,  533,  525,
			  533,  533,  501,    0,  533,    0,  533,  525,    0,  538,
			  504,  538,  538,  513,    0,  538,    0,  538,  499,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  516,
			  516,  516,  517,  517,  517,  517,  517,  517,  517,  517,
			  517,  517,  517,  517,  517,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  518,  518,  518,  518,  519,  519, yy_Dummy>>,
			1, 200, 1972)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  520,  520,  520,  520,  520,  520,  520,  520,  520,
			  520,  520,  520,  520,  521,  521,  521,  521,  521,  521,
			  521,  521,  521,  521,  521,  521,  521,  523,  523,    0,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  524,    0,  524,  524,  524,  524,  524,  524,  524,  524,
			  524,  524,  524,  526,  526,    0,    0,    0,    0,    0,
			  526,  526,  526,  526,  526,  527,    0,  527,  527,  527,
			  527,  527,  527,  527,  527,  527,  527,  527,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  528,  528,  528,

			  528,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,  529,  529,  529,  530,  530,  530,  530,  530,  530,
			  530,  530,  530,  530,  530,  530,  530,  531,    0,  531,
			  531,  531,  531,  531,  531,  531,  531,  531,  531,  531,
			  532,    0,  532,  532,  532,  532,  532,  532,  532,  532,
			  532,  532,  532,  534,  534,  534,  534,  534,  534,  534,
			  534,  534,  534,  534,  534,  534,  535,  535,  535,  535,
			  535,  535,    0,  535,  535,  535,  535,  535,  535,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  539,  539,  539,  539,  539,  539,  539,  539, yy_Dummy>>,
			1, 200, 2172)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  539,  539,  539,  539,  539,  540,    0,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  540,  541,    0,
			  541,  541,  541,  541,  541,  541,  541,  541,  541,  541,
			  541,  543,    0,  543,  543,    0,    0,  543,    0,  543,
			  544,  544,  544,  544,  544,  544,  544,  544,  544,  544,
			  544,  544,  544,  545,  545,  545,  545,  545,  545,  545,
			  545,  545,  545,  545,  545,  545,  546,  546,    0,    0,
			    0,    0,    0,  546,  546,    0,    0,  546,  547,  547,
			  547,  547,  547,  547,    0,  547,  547,  547,  547,  547,
			  547,  548,    0,  548,  548,  548,  548,  548,  548,  548,

			  548,  548,  548,  548,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  550,  550,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  553,  553,
			  554,  554,  554,  554,  554,  554,  554,  554,  554,  554,
			  554,  554,  554, yy_Dummy>>,
			1, 143, 2372)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 555)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   49,   52,   54,   55,   64,   67,   75,
			   78,   81,   86,   71,   90, 1297,   93,   96,   99,  116,
			  138,  187,  121,   95,  201,  236,   93,  254,  180,  261,
			  275,   90,  296,  128,  299,  213,  225, 1247, 1230, 2515,
			  302,  318, 1262,  101, 2515,  321,  341, 2515,  124, 2515,
			 2515, 2515,  225, 2515,  286,  390, 2515,  395, 2515,  304,
			  132, 2515,  194,  188, 2515,  400,  238, 1261,  324, 1259,
			  403, 1257,  427,  403,  473,  415,  522,  447,  567,  607,
			  449,  271,  481,  491,  402,  574,  600,  212, 1216, 1211,
			 2515,  656,  705,  754,  672,  441,  582, 1244, 1244, 1218,

			 1207, 1179,  622,  263,  634,  803,  637, 2515, 1190,  839,
			    0,  452,  680, 1165,  866,  679, 2515, 1168,  188,  548,
			  902,  694,  686, 1166,  272,  305,  717, 1163, 2515, 1151,
			 2515,  336, 2515,  323,  706, 2515,  724, 2515, 2515,  495,
			 2515,  645, 2515,  731, 2515,  736,  741,  767, 2515,  775,
			  780,  242, 2515,  332, 2515,  629,  783,  810, 2515,  822,
			  825,  846,  397,  594,  858,  934,  189,  824,  723,  888,
			 1148,  861, 2515, 1136,  428,  873,  974, 1020,  657,  304,
			  746,  885,  423,  416, 1066,  802,  893,  922, 1139,  767,
			 1136, 1099,  967, 2515,  898, 1013,  949, 2515,  989, 2515, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  910, 2515, 1036, 1040, 1082,  417, 1001, 1096, 1029, 1089,
			 1081, 1094,  457, 1115, 1070, 2515, 1069, 1108, 1113, 1131,
			 1134, 2515, 2515, 1064, 1149, 1142, 1167,  778, 1203,  930,
			 1172, 1039, 2515, 1061, 1185, 2515, 1238,  823, 2515, 1047,
			 1188,  489, 1123,  932, 1274, 1178, 2515, 1043, 2515, 2515,
			 1024, 2515, 1000, 2515,  997, 2515,  986, 2515,  981, 1209,
			  492,  429, 1221, 1223, 2515,  964, 1311, 2515,  961,  957,
			 1243, 1222, 2515,  945, 1235,  941,  925, 2515,  895, 1258,
			  863, 1265, 1357,  975,  497, 1293, 1402, 1295, 1306, 2515,
			 2515, 1373, 2515, 1409, 2515,  840, 2515,  819, 2515,  805,

			 1339,  778, 1380, 1432, 1372,  659,  761, 1207, 1472, 1508,
			  831, 2515, 1444, 1407, 1263, 1544, 2515,  763, 1464, 1480,
			 2515,  755, 1580, 1616, 2515,  752, 1397, 1500, 2515,  749,
			 1652, 1679, 1451, 1728, 1758, 1513,  637,  670,  990,    0,
			 1522,  747,  728, 2515, 2515,  694, 1543, 1338, 2515,  671,
			 2515,  660, 1287, 2515,  654, 1565, 1489, 1569, 1794, 1574,
			  651,  616, 2515, 2515,  904, 1540,  610,  600,  699, 1034,
			    0, 1605, 1575,  969, 1623,  972, 1621, 2515,  574, 1631,
			 1643, 1837, 1873, 2515,  568, 1656, 2515,  561, 1702, 2515,
			  503, 2515,  496, 1313, 2515,  488, 2515,  471, 1674, 2515, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  453, 2515, 2515,  451, 1679, 1730, 1041,  987, 1748,  446,
			 1067,  433, 1015, 1751,  425, 1801, 2515,  414,  781, 1398,
			    0, 1719, 1483, 1750,  245, 1896, 1764, 1851, 1932,  304,
			 1813, 1096, 1143, 1845, 1575, 1814,  584, 1975, 1691, 1704,
			 2515,  401, 1843, 1881, 2011, 2515, 1853, 1865, 1903, 1922,
			 1915, 1160, 1928, 1949, 1169, 1952, 2515,  395,  392, 1827,
			 1965,  590,  856, 1498,  296,  793, 1588,    0, 1968, 2000,
			 2002,  247, 1957, 1197, 2515,  256,  879, 1772,  193, 2047,
			 1955, 1981, 2515,  180, 1205, 2019, 1252, 2039, 2054, 1335,
			 2066, 2069, 1368, 2072,    0, 1424, 2084,  108,   88, 2087,

			  913, 2078,   49, 1994, 2086,  802, 2515,   59,    0,    0,
			 1428, 2515, 1106, 2089,   22, 2515, 2130, 2143, 2156, 2169,
			 2182, 2195, 1961, 2208, 2221, 2106, 2234, 2246, 2259, 2272,
			 2285, 2298, 2311, 2107, 2324, 2337, 1509, 2350, 2118, 2363,
			 2376, 2389, 1545, 2400, 2411, 2424, 2437, 2449, 2462,  871,
			 2475,  904,  932, 2488, 2501, 1021, yy_Dummy>>,
			1, 156, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 555)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (515, 516, 555)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  515,    1,  516,  516,  517,  517,  518,  518,  519,
			  519,  520,  520,  521,  521,  515,  522,  515,  515,  522,
			  515,  523,  515,  524,  525,  515,   19,  515,   27,  515,
			  525,   30,  515,  526,  526,   19,  515,   19,   19,  515,
			  515,  515,  515,  527,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  528,  528,  515,  528,  515,  529,
			  530,  515,  530,   35,  515,  525,   65,   65,  515,  515,
			  515,   65,  531,  531,  531,  515,  515,  531,  532,   74,
			  531,   74,  531,   79,   79,  531,  531,   74,   74,   74,
			  515,  523,  523,   92,   93,   93,  515,  515,  515,  533,

			  515,   35,  515,  534,  515,  515,   63,  515,  515,  535,
			   28,  515,  515,  536,  515,   19,  515,  515,   34,   34,
			  515,  515,  515,  515,  537,  527,  515,  538,  515,  515,
			  515,  515,  515,  527,  515,  515,  515,  515,  515,  515,
			  515,  528,  515,  528,  515,  528,  528,  529,  515,  529,
			  515,  530,  515,  530,  515,   65,   66,   65,  515,  115,
			  159,  160,  539,   74,  515,  532,   79,   79,   79,  531,
			  165,  515,  515,  515,   76,  515,   76,  176,  177,  177,
			  176,  515,  532,  540,  541,  541,  532,  532,  165,   74,
			  165,  165,  531,  515,   93,   93,   93,  515,   92,  515, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			   91,  515,   91,   91,   91,  539,  515,  515,  515,  515,
			  515,  515,  534,  515,  515,  515,  515,  515,  515,  515,
			  157,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  536,  542,  515,  515,  114,  515,  539,   34,  515,  515,
			  515,  537,  515,  515,  515,  515,  515,  515,  515,  515,
			  160,  515,  160,  515,   65,  515,   65,  515,   65,  515,
			  539,   79,   79,   79,  515,  515,  541,  515,  515,  177,
			  177,  177,  515,  515,  515,  176,   76,  515,  515,  515,
			  543,  515,  266,  282,  282,  541,  532,  286,  532,  515,
			  515,   91,  515,   91,  515,   93,  515,   65,  515,   93,

			  515,  515,  515,  515,  515,  544,  545,  515,  515,  515,
			  545,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  546,  542,  515,  515,
			  547,  539,  331,   34,  515,  515,  548,  515,  515,  549,
			  515,   65,   65,  515,  515,  282,  282,  282,  515,  515,
			  515,  515,  515,  515,  515,  541,  532,  532,  532,  286,
			   65,   65,  515,  515,  550,  515,  515,  515,  515,  515,
			  551,  515,  515,  544,  515,  545,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  228,  515,  515,  515,  515,  546,  515, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  515,  515,  515,  515,  382,  515,  331,  539,  515,  236,
			  236,  236,  539,  515,  236,  515,  515,  515,  515,  515,
			  552,  515,  515,  515,  549,  515,  515,  532,  532,  358,
			  515,  550,  553,  515,  515,  515,  551,  515,  515,  437,
			  515,  515,  515,  515,  515,  515,  515,  444,  236,  236,
			  236,  539,  331,  331,  539,  515,  515,  515,  554,  515,
			  515,  552,  515,  515,  549,  515,  515,  555,  515,  532,
			  532,  358,  515,  553,  515,  515,  515,  515,  551,  515,
			  515,  479,  515,  515,  539,  515,  539,  515,  331,  539,
			  515,  331,  539,  515,  236,  539,  515,  236,  554,  515,

			  515,  515,  552,  515,  515,  555,  515,  515,  236,  236,
			  539,  515,  515,  515,  555,    0, yy_Dummy>>,
			1, 116, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (49, 127, 159)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (49, 173, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (49, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (49, 8203, 8229)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (49, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (49, 8288, 8657)
			an_array.put (45, 8658)
			an_array.area.fill_with (49, 8659, 8703)
			yy_ec_template_4 (an_array)
			an_array.area.fill_with (49, 8708, 8742)
			yy_ec_template_5 (an_array)
			an_array.area.fill_with (49, 8745, 8890)
			an_array.put (45, 8891)
			an_array.area.fill_with (49, 8892, 10225)
			an_array.area.fill_with (45, 10226, 10227)
			an_array.area.fill_with (49, 10228, 12287)
			yy_ec_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   49,   49,   49,   49,   49,   49,   49,   49,    1,
			    2,    1,    1,    3,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,    1,    4,    5,    6,    7,    8,    6,    9,
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
			    1,   49,   49,   49,   49,   49,   45,   49,   49,   49,
			   49,   49,   45, yy_Dummy>>,
			1, 13, 160)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   46,   49,   49,   49,   49,   49,   49,   49,   49,    1, yy_Dummy>>,
			1, 10, 8230)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   45,   49,   49,   45, yy_Dummy>>,
			1, 4, 8704)
		end

	yy_ec_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   47,   48, yy_Dummy>>,
			1, 2, 8743)
		end

	yy_ec_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   49,   49, yy_Dummy>>,
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
			    8,   10,   10,    4,   13,   13,   13,   13,   13,   13, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 516)
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
			   55,   58,   61,   64,   68,   72,   76,   78,   83,   88,
			   90,   94,   97,   99,  101,  103,  106,  108,  110,  112,
			  114,  117,  119,  121,  123,  125,  127,  129,  131,  134,
			  136,  138,  140,  142,  144,  146,  146,  146,  146,  148,
			  148,  152,  152,  153,  154,  155,  159,  160,  161,  161,
			  162,  163,  164,  165,  166,  167,  168,  170,  171,  172,
			  173,  176,  180,  182,  183,  185,  187,  189,  189,  190,

			  190,  192,  194,  195,  196,  197,  201,  204,  205,  205,
			  206,  208,  208,  208,  208,  210,  211,  212,  212,  214,
			  216,  218,  218,  220,  220,  221,  222,  224,  224,  225,
			  225,  226,  227,  228,  230,  232,  234,  234,  235,  236,
			  236,  237,  237,  238,  238,  239,  239,  239,  239,  241,
			  241,  244,  244,  245,  245,  247,  248,  250,  252,  253,
			  256,  257,  260,  262,  263,  271,  271,  272,  273,  274,
			  276,  276,  286,  288,  288,  289,  299,  300,  301,  302,
			  303,  305,  311,  311,  312,  313,  314,  314,  315,  315,
			  316,  316,  316,  317,  318,  320,  324,  328,  329,  330, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  331,  335,  337,  342,  344,  349,  350,  351,  352,  353,
			  355,  355,  356,  357,  359,  359,  361,  361,  361,  361,
			  365,  366,  367,  369,  370,  374,  374,  376,  376,  378,
			  378,  380,  380,  381,  381,  383,  384,  385,  387,  388,
			  388,  389,  390,  390,  390,  391,  392,  393,  393,  394,
			  395,  396,  397,  398,  401,  401,  403,  403,  406,  406,
			  407,  408,  409,  410,  411,  415,  415,  416,  421,  421,
			  422,  423,  424,  429,  429,  435,  436,  437,  440,  440,
			  442,  442,  446,  447,  448,  449,  451,  451,  451,  451,
			  453,  455,  457,  459,  461,  465,  466,  469,  470,  474,

			  475,  477,  477,  478,  479,  480,  481,  482,  482,  486,
			  488,  490,  491,  491,  491,  491,  495,  496,  496,  498,
			  500,  501,  501,  503,  505,  506,  506,  508,  510,  511,
			  511,  512,  515,  519,  521,  521,  521,  523,  523,  523,
			  523,  523,  524,  525,  527,  529,  530,  531,  532,  535,
			  535,  536,  536,  536,  538,  538,  539,  539,  539,  539,
			  539,  541,  543,  546,  549,  550,  552,  552,  553,  553,
			  553,  553,  553,  554,  555,  556,  557,  557,  558,  558,
			  558,  558,  566,  568,  570,  570,  570,  571,  571,  573,
			  574,  574,  575,  575,  577,  578,  578,  579,  579,  581, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  582,  582,  583,  585,  586,  588,  588,  591,  594,  597,
			  598,  599,  600,  604,  608,  609,  610,  611,  611,  611,
			  611,  611,  611,  612,  613,  614,  614,  614,  614,  614,
			  614,  615,  616,  617,  619,  620,  621,  622,  624,  624,
			  626,  630,  630,  630,  630,  632,  633,  633,  635,  637,
			  640,  643,  645,  647,  651,  654,  654,  656,  656,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  658,  659,  660,  660,  660,  660,  660,
			  664,  664,  668,  669,  669,  671,  673,  675,  677,  679,
			  681,  683,  685,  688,  691,  692,  696,  700,  701,  701,

			  701,  701,  701,  701,  701,  701,  701,  703,  703,  705,
			  707,  710,  711,  711,  711,  711,  711, yy_Dummy>>,
			1, 117, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 710)
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
			  117, -129,   16,  116,  117, -138,  116,  117,    1,   16,
			  116,  117, -138,    1,   16,  116,  117, -138,  115,  117,
			  113,  114,  115,  117,  113,  114,  117,  115,  117,   64,

			  117,   69,  117,   65,  117, -183,   68,  117,   72,  117,
			   72,  117,   71,  117,   70,   72,  117,   46,  117,   46,
			  117,   45,  117,   52,  117,   52,  117,   51,  117,   52,
			  117,   49,   52,  117,   52,  117,   55,  117,   54,  117,
			   55,  117,   16, -138,   20,  -21,  111,  112,    2,    3,
			   20,  -21,   58,   58,   58,   42,   56, -160, -174,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   58, -161,
			   58,   58,   58,  -15,   20,  -21,   13,   16, -132, -138,
			   13, -132,   13,   13, -132,   13, -132,    2,    3,   33,
			   32,   33,   16, -138,    2,  112,    5,  104,  110, -218, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			 -224,    5,   16, -138,  -74, -216,   73, -191,   79, -197,
			   16,  -12,   11, -129,   11, -129,   77, -195,  113,  114,
			  114,   64,   65, -183,  -66,   67,   67,   59,   64,   67,
			   62,   67,   63,   67,   71,   70,   45,   51,   49,   50,
			   51,   47,   49, -165,   54,   53,   54,   16,   16, -136,
			   16, -135,  -21,   16, -136, -138,   16,   16, -135, -138,
			    3,  -21,   58,   37,   40,   42,   56, -156, -158, -160,
			 -174,   58,   58,   58,   58, -161,   34,   37,   40,   42,
			   56, -152, -156, -158, -160, -174,  -43,  -57,   58,   36,
			   37,   40,   42,   56, -155, -156, -158, -160, -174,   58,

			   58,   58,   58,   58, -161,   34,   42,   56, -152, -160,
			 -174,   58,   58,   58, -161,   58,   58,  -44,   13,   16,
			   13,   16, -132, -136,   13,   16, -132, -135,  -15,   13,
			   14,   13,   16, -132, -138,  -15,  -21,   13,   16, -132,
			 -136, -138,   13,   16,   13,   16, -132, -135, -138,    3,
			   22,   33,   31,    2,    4,  112,  112,    6,    7, -101,
			 -107,    6,    7,   20,  -21,   16,  102,  -99,  102,  102,
			  104,  110, -218, -224,   93, -211,   87, -205,   81, -199,
			  -80,   75, -193,   20,    3,   11, -129,  -78,  114,  114,
			   61,   61,  -48,   17,  -19,   16,  -18,   16,  -19,   20, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  -21,   17,   20,  -18,   20,  -21,    3,    3,   58,   58,
			   58,  -39,  -41,  -43,  -57,   58,  -35,  -39,  -41,  -43,
			  -57,   58,   58,   58,  -38,  -39,  -41,  -43,  -57,   36,
			   42,   56, -155, -160, -174,   58,   58,  -35,  -43,  -57,
			   56, -174,   40,   56, -158, -174,   58,   58,   58,   58,
			 -161,   14,   17,  -15,  -19,   13,   16,  -15,  -18,   13,
			   16,  -15,  -19,   20,  -21,   13,   14,   17,   20,  -15,
			  -15,  -18,   20,  -21,   13,   23,   24,   25,   30,   30,
			    4,    7,  104,  110, -218, -224,  110, -224,    7,  -21,
			  -99,  103,  109, -217, -223,  -94,   97, -215,   95, -213,

			  -88,   91, -209,   89, -207,  -82,   85, -203,   83, -201,
			  -76, -222,    3,   16, -138,    3,   16, -136, -138,   11,
			 -129,   60,   64,  -19,  -18,  -19,  -21,  -18,  -21,   58,
			   58,   58,  -38,  -43,  -57,  -57,  -41,  -57,   58,  -15,
			  -19,  -15,  -18,  -15,  -19,  -21,  -15,  -18,  -21,   24,
			   26,   27,   33,    4,    4,    7,    7, -107,  103,  104,
			  109,  110, -217, -218, -223, -224,  110, -224, -100, -106,
			  -98,   93, -211,  -96,  -92,   87, -205,  -90,  -86,   81,
			 -199,  -84,  108, -105,  108,  108,  110, -224,    3,   16,
			 -138,    3,   20,  -21,    3,   20,  -21,    3,    3,    3, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    3,  -19,   20,  -21,    3,  -19,   20,  -21,    3,  -12,
			    8,   61,   61,   61,   24,   24,   27,   28, -146,   30,
			   30,   30,  110, -224,  110, -224, -100, -101, -106, -107,
			  109, -223, -105,  109, -223,    3,   16,    3,   16, -136,
			    3,   16, -135,    3,  -21,    3,   16,    3,   16, -135,
			 -138,    3,  -19,  -21,    9,   10,  -12,   27,   27,  -29,
			  109,  110, -223, -224,  109,  110, -223, -224, -106,    3,
			   17,    3,   17,    3,  -19,    3,  -19,    3,   16,    3,
			  -18,    3,  -18,    3,   16,    3,   17,   20,    3,   17,
			   20,    3,    3,  -18,   20,  -21,    3,  -18,   20,  -21,

			    3, -106, -107,    3,  -19,    3,  -18,    3,  -18,  -21,
			   10, yy_Dummy>>,
			1, 111, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2515
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 515
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 516
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 49
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
