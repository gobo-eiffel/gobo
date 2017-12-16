note

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_SCANNER

inherit

	ET_EIFFEL_SCANNER_SKELETON
		redefine
			read_token
		end

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
	yy_column := yy_column + 3
--|#line 39 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 39")
end

				-- Ignore byte order mark (BOM).
				-- See http://en.wikipedia.org/wiki/Byte_order_mark
			
when 2 then
	yy_column := yy_column + 1
--|#line 47 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 47")
end

				last_break_end := 0
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			
when 3 then
yy_set_line_column
--|#line 52 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 52")
end

				last_text_count := 1
				last_break_end := text_count
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			
when 4 then
yy_set_line_column
--|#line 58 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 58")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol (text_item (1))
			
when 5 then
yy_set_line_column
--|#line 64 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 64")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol ('-')
			
when 6 then
	yy_column := yy_column + 2
--|#line 70 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 70")
end

				last_break_end := 0
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			
when 7 then
yy_set_line_column
--|#line 75 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 75")
end

				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			
when 8 then
yy_set_line_column
--|#line 81 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 81")
end

				last_text_count := 2
				last_break_end := 0
				last_comment_end := text_count
				process_two_char_symbol (text_item (1), text_item (2))
			
when 9 then
	yy_end := yy_end - 1
	yy_column := yy_column + 4
--|#line 121 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 121")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 10 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 129 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 129")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 11 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 138 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 138")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 12 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 151 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 151")
end

				last_break_end := 0
				last_comment_end := 0
				process_identifier (text_count)
			
when 13 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 156 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 156")
end

				last_text_count := text_count
				break_kind := identifier_break
				more
				set_start_condition (BREAK)
			
when 14 then
	yy_column := yy_column + 1
--|#line 171 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 171")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 15 then
	yy_column := yy_column + 2
--|#line 172 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 172")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 16 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 173 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 173")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 17 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 174 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 174")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 18 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 175 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 175")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 19 then
	yy_end := yy_end - 1
	yy_column := yy_column + 1
--|#line 185 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 185")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 20 then
	yy_end := yy_end - 1
	yy_column := yy_column + 2
--|#line 186 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 186")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 21 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 187 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 187")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 22 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 188 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 188")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 23 then
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
			
when 24 then
	yy_column := yy_column + 3
--|#line 201 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 201")
end

				last_break_end := 0
				last_comment_end := 0
				process_c1_character_constant (text_item (2))
			
when 25 then
yy_set_line_column
--|#line 206 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 206")
end

				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (text_item (2))
			
when 26 then
yy_set_line_column
--|#line 212 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 212")
end

				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (text_item (2))
			
when 27 then
	yy_column := yy_column + 4
--|#line 218 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 218")
end

				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 28 then
yy_set_line_column
--|#line 223 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 223")
end

				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 29 then
yy_set_line_column
--|#line 229 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 229")
end

				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			
when 30 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 236 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 236")
end

				last_token := E_CHARACTER
				last_literal_start := 4
				last_literal_end := text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			
when 31 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 244 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 244")
end

				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			
when 32 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 253 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 253")
end

					-- Syntax error: invalid character code (too big)
					-- in special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAO_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 33 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 263 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 263")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 34 then
	yy_column := yy_column + 3
--|#line 273 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 273")
end

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			
when 35 then
	yy_column := yy_column + 2
--|#line 283 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 283")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			
when 36 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 292 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 292")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 37 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 306 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 306")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
when 38 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 314 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 314")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
when 39 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 323 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 323")
end

					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 40 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 329 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 329")
end

					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
when 41 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 337 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 337")
end

					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			
when 42 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 345 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 345")
end

				verbatim_open_white_characters := text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 43 then
	yy_column := yy_column + 1
--|#line 351 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 351")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 44 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 369 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 369")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2), False, Current)
					verbatim_marker := no_verbatim_marker
					verbatim_open_white_characters := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
when 45 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 384 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 384")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2)
					last_text_count := text_count
					break_kind := str_verbatim_break
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (VS3)
				end
			
when 46 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 396 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 396")
end

				more
				set_start_condition (VS3)
			
when 47 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 400 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 400")
end

				more
				last_literal_end := text_count - 2
			
when 48 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 404 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 404")
end

				more
				last_literal_end := text_count - 1
			
when 49 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 408 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 408")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 50 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 426 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 426")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 51 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 431 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 431")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 52 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 436 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 436")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 53 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 452 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 452")
end

					-- Left-aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			
when 54 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 460 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 460")
end

				verbatim_open_white_characters := text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
when 55 then
	yy_column := yy_column + 1
--|#line 466 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 466")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 56 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 484 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 484")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2), True, Current)
					verbatim_marker := no_verbatim_marker
					verbatim_open_white_characters := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
when 57 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 499 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 499")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_close_white_characters := text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2)
					last_text_count := text_count
					break_kind := str_left_aligned_verbatim_break
					more
					set_start_condition (BREAK)
				else
					more
					set_start_condition (LAVS3)
				end
			
when 58 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 511 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 511")
end

				more
				set_start_condition (LAVS3)
			
when 59 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 515 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 515")
end

				more
				last_literal_end := text_count - 2
			
when 60 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 519 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 519")
end

				more
				last_literal_end := text_count - 1
			
when 61 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 523 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 523")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 62 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 541 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 541")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
when 63 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 546 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 546")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
when 64 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 551 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 551")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 65 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 567 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 567")
end

					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 66 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 576 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 576")
end

					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 67 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 585 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 585")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 68 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 596 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 596")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 69 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 601 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 601")
end

				more
			
when 70 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 604 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 604")
end

					-- Syntax error: invalid character code (too big) in special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAO_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 71 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 617 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 617")
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
			
when 72 then
	yy_column := yy_column + 2
--|#line 630 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 630")
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
			
when 73 then
	yy_column := yy_column + 2
--|#line 643 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 643")
end

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			
when 74 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 655 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 655")
end

				more
			
when 75 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 658 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 658")
end

				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 667 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 667")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 77 then
	yy_column := yy_column + 2
--|#line 675 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 675")
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
			
when 78 then
	yy_column := yy_column + 1
--|#line 686 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 686")
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
			
when 79 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 699 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 699")
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
			
when 80 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 727 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 727")
end

				more
				set_start_condition (MS)
			
when 81 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 731 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 731")
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
			
when 82 then
	yy_column := yy_column + 1
--|#line 742 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 742")
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
			
when 83 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 773 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 773")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			
when 84 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 781 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 781")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 789 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 789")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 797 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 797")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 87 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 805 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 805")
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
			
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 817 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 817")
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
			
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 829 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 829")
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
			
when 90 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 841 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 841")
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
			
when 91 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 853 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 853")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 861 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 861")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 869 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 869")
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
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 881 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 881")
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
			
when 95 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 893 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 893")
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
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 905 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 905")
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
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 917 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 917")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 98 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 925 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 925")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 99 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 933 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 933")
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
			
when 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 945 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 945")
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
			
when 101 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 957 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 957")
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
			
when 102 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 969 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 969")
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
			
when 103 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 981 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 981")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 989 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 989")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 997 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 997")
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
			
when 106 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1009 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1009")
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
			
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1021 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1021")
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
			
when 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1033 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1033")
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
			
when 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1049 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1049")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 110 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1050 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1050")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 111 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1051 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1051")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 112 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1059 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1059")
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
			
when 113 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1060 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1060")
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
--|#line 1061 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1061")
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
--|#line 1072 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1072")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 116 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1073 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1073")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 117 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1074 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1074")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 118 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1082 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1082")
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
			
when 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1083 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1083")
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
--|#line 1084 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1084")
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
yy_set_line_column
--|#line 1099 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1099")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			
when 122 then
yy_set_line_column
--|#line 1109 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1109")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			
when 123 then
yy_set_line_column
--|#line 1120 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1120")
end

				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 124 then
yy_set_line_column
--|#line 1126 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1126")
end

				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			
when 125 then
	yy_column := yy_column + 1
--|#line 1132 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1132")
end

					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 126 then
	yy_column := yy_column + 1
--|#line 1153 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1153")
end

				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			
when 127 then
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
--|#line 1152 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1152")
end
terminate
when 1 then
--|#line 1140 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1140")
end

					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 2 then
--|#line 711 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 711")
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
--|#line 755 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 755")
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
--|#line 358 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 358")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 415 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 415")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 443 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 443")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 7 then
--|#line 473 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 473")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 8 then
--|#line 530 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 530")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 9 then
--|#line 558 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 558")
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
			create an_array.make_filled (0, 0, 2803)
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
			    0,   22,   23,   24,   23,   25,   26,   27,   22,   28,
			   29,   25,   25,   25,   30,   31,   32,   33,   34,   34,
			   34,   34,   34,   34,   35,   36,   25,   37,   38,   39,
			   39,   39,   39,   39,   39,   39,   40,   39,   25,   41,
			   25,   42,   39,   39,   39,   39,   39,   39,   25,   25,
			   25,   22,   22,   43,   45,   46,   45,   45,   46,   45,
			   49,   66,   67,   50,  173,   51,   47,   49,  393,   47,
			   50,  173,   51,   53,   54,   53,   53,   54,   53,   55,
			   66,   67,   55,   57,   58,   57,   57,   58,   57,   60,
			   61,   62,  380,   63,   60,   61,   62,  190,   63,   69,

			   70,   69,   69,   70,   69,   72,   73,   74,  191,   75,
			   72,   73,   74,  120,   75,   78,   79,   78,   79,   80,
			   80,   80,   80,   80,   80,   82,   82,   82,   91,   91,
			   91,   81,  410,   96,   81,   97,   64,   83,   92,   92,
			   92,   64,  393,   76,   85,   86,   87,   86,   76,   94,
			   94,   94,   98,   98,   98,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   99,  173,  121,   83,  122,  112,
			   83,  137,  138,   83,  139,  100,   88,  100,  380,  100,
			  112,  100,  100,  147,  148,  100,   89,   82,   82,   82,
			  131,  132,  131,  134,  135,  134,  133,  149,  148,   83, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  100,  120,  101,  101,  101,  101,  101,  101,  101,  100,
			  102,  102,  102,  216,  140,  137,  141,  402,  139,  150,
			  151,  150,  103,  104,  217,  105,  105,  105,  105,  105,
			  105,  105,  110,  110,  110,   82,   82,   82,  106,  107,
			  399,   82,   82,   82,  111,  108,  121,   83,  122,  109,
			  409,  106,  107,   83,  393,  108,  102,  102,  102,  100,
			  100,  142,  140,  143,  141,  100,  139,  407,  103,  104,
			  173,  105,  105,  105,  105,  105,  105,  105,  110,  110,
			  110,  117,  117,  117,  117,  117,  117,  123,  123,  123,
			  111,  137,  144,  118,  145,  109,  118,  153,  154,  124,

			  155,  156,  153,  157,  173,  155,  156,  159,  157,  142,
			  155,  113,  153,  160,  173,  161,  163,  164,  165,  164,
			  147,  148,  113,  126,  127,  126,   85,  128,   87,  128,
			  418,  128,  128,   80,   80,   80,  121,  129,  122,  158,
			  380,   82,   82,   82,  158,   81,  128,  232,  128,  233,
			  128,  128,  128,   83,  120,  128,  128,  402,   88,  167,
			  167,  167,  228,  130,  130,  130,  130,  130,   89,  190,
			   84,  168,   84,  229,  169,  401,   87,  178,  179,  178,
			  191,   85,  369,   87,  180,  181,  180,  121,   85,  122,
			   87,  182,  182,  182,  184,  184,  184,   94,   94,   94, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  188,  188,  188,  192,  192,  192,  170,  203,  203,  219,
			  127,  219,  189,   88,  367,  193,  171,  173,  216,  174,
			   88,  174,  174,   89,  212,  149,  148,  175,  112,  217,
			   89,  204,  213,  213,  213,  395,  174,  212,  174,  112,
			  174,  174,  174,  393,  214,  174,  174,  163,  164,  176,
			  205,  205,  205,  205,  205,  205,  117,  117,  117,  177,
			  194,  194,  194,  131,  132,  131,  165,  164,  118,  133,
			  173,  115,  195,  173,  206,  101,  101,  101,  101,  101,
			  101,  101,  123,  123,  123,  134,  135,  134,  137,  138,
			  196,  139,  143,  138,  124,  139,  150,  151,  150,  197,

			  199,  199,  199,  220,  221,  222,  223,  223,  223,  223,
			  137,  144,  200,  145,  228,  201,  201,  201,  201,  201,
			  201,  201,  140,  137,  141,  229,  139,  242,  242,  242,
			  202,  209,  209,  209,  140,  143,  141,  382,  139,  143,
			  144,  380,  145,  210,  252,  252,  211,  211,  211,  211,
			  211,  211,  211,  224,  224,  224,  153,  154,  120,  155,
			  159,  154,  121,  155,  122,  225,  258,  258,  120,  142,
			  109,  156,  153,  157,  120,  155,  156,  159,  157,  418,
			  155,  142,  153,  160,  418,  161,  159,  160,  378,  161,
			  226,  226,  226,  230,  230,  230,  372,  178,  179,  178, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  335,  169,  227,   87,  332,  231,  180,  181,  180,  158,
			  169,  176,   87,  232,  158,   87,  263,  263,  240,  179,
			  240,  177,  418,  243,  243,  243,  188,  188,  188,  330,
			  241,  181,  241,  170,  418,  244,  275,  327,  189,  112,
			  204,  325,  170,  171,  322,  234,  308,  178,  179,  178,
			  112,   85,  171,   87,  176,  235,  418,  309,  321,  180,
			  181,  180,  319,   85,  177,   87,  176,  236,  237,  238,
			  239,  239,  239,  239,  316,  316,  177,  190,  190,  190,
			  192,  192,  192,   88,  260,  260,  260,  313,  176,   81,
			  365,  365,  193,   89,  312,   88,  261,  301,  177,  203,

			  203,  219,  127,  219,  301,   89,  245,  267,  267,  267,
			  267,  267,  267,  246,  247,  248,  249,  249,  249,  249,
			  194,  194,  194,  262,  276,  277,  278,  279,  279,  279,
			  279,  206,  195,  373,  373,  201,  201,  201,  201,  201,
			  201,  201,  268,  268,  268,  272,  272,  272,  397,  397,
			  256,  216,  216,  216,  269,  310,  358,  273,  274,  257,
			  264,  264,  264,  118,  280,  301,  311,  359,  418,  361,
			  352,  352,  265,  360,  172,  205,  205,  205,  205,  205,
			  205,  270,  228,  228,  228,  287,  287,  287,  287,  301,
			  392,  392,  392,  280,   83,  363,  363,  288,  280,  266, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  280,  281,  221,  222,  223,  223,  223,  223,  290,  179,
			  290,  280,  232,  418,   87,  291,  181,  291,  120,  232,
			  120,   87,  240,  179,  240,  272,  418,  268,  243,  243,
			  243,  282,  280,  284,  284,  284,  284,  285,  286,  286,
			  244,  299,  299,  299,  234,  241,  181,  241,  308,  418,
			  418,  234,  310,  300,  235,  358,  301,  302,  176,  309,
			  418,  235,  418,  311,  264,  260,  359,  257,  177,  390,
			  174,  390,  174,  292,  237,  238,  239,  239,  239,  239,
			  391,  176,  391,  392,  392,  392,  301,  303,  301,  298,
			  289,  177,  176,  230,  176,  253,  253,  253,  253,  253,

			  253,  253,  177,  293,  177,  294,  294,  294,  294,  294,
			  294,  294,  194,  194,  194,  313,  313,  313,  283,  283,
			  283,  283,  226,  418,  195,  224,  280,  314,  259,  259,
			  259,  259,  259,  259,  259,  172,  295,  295,  295,  295,
			  296,  297,  297,  280,  213,  315,  319,  319,  319,  209,
			  208,  312,  255,  197,  197,  194,  251,  418,  320,  353,
			  354,  355,  356,  356,  356,  356,  172,  297,  297,  297,
			  297,  297,  297,  297,  322,  322,  322,  250,  245,  325,
			  325,  325,  351,  351,  351,  321,  323,  351,  351,  324,
			  324,  326,  167,  123,  263,  263,  218,  172,  301,  305, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  305,  305,  305,  306,  307,  307,  286,  286,  286,  286,
			  332,  332,  332,  262,  335,  335,  335,  119,  204,  327,
			  327,  327,  333,  215,  115,  110,  336,  208,  299,  299,
			  299,  328,  102,  185,  329,  329,  329,  329,  329,  329,
			  300,  187,  185,  166,  290,  179,  290,   99,  232,  270,
			   87,  253,  253,  208,  119,  253,  253,  253,  266,  330,
			  330,  330,  304,  304,  304,  304,  291,  181,  291,  116,
			  232,  331,   87,  115,  267,  267,  267,  267,  267,  267,
			  234,  308,  308,  308,  310,  310,  310,  100,  418,  418,
			  235,  418,  418,  189,  418,  418,  193,  418,  206,  338,

			  338,  338,  234,  317,  317,  317,  317,  317,  317,  317,
			  418,  339,  235,  418,  340,  340,  340,  340,  340,  340,
			  340,  313,  313,  313,  418,  367,  367,  367,  418,  341,
			  342,  342,  342,  314,  343,  418,  418,  368,  264,  264,
			  264,  418,  344,  418,  418,  418,  260,  260,  260,  418,
			  265,  370,  418,  268,  268,  268,  418,  418,  261,  418,
			  257,  324,  324,  112,  369,  269,  120,  350,  350,  350,
			  350,  350,  418,  418,  112,  418,  343,  120,  345,  277,
			  278,  279,  279,  279,  279,  262,  358,  358,  358,  375,
			  375,  375,  270,  376,  418,  313,  313,  313,  244,  259, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  259,  377,  418,  259,  259,  259,  418,  314,  346,  120,
			  348,  348,  348,  348,  349,  350,  350,  172,  357,  357,
			  357,  357,  357,  357,  357,  307,  307,  307,  307,  418,
			  357,  357,  357,  357,  312,  376,  366,  366,  366,  366,
			  366,  366,  366,  357,  357,  357,  418,  418,  172,  297,
			  297,  297,  297,  297,  297,  297,  313,  313,  313,  399,
			  399,  399,  347,  347,  347,  347,  418,  418,  314,  418,
			  418,  400,  374,  374,  374,  374,  374,  374,  374,  172,
			  297,  297,  297,  297,  297,  297,  297,  418,  399,  399,
			  399,  418,  375,  375,  375,  312,  376,  418,  321,  418,

			  400,  317,  317,  418,  377,  317,  317,  317,  418,  418,
			  172,  297,  297,  297,  297,  297,  172,  172,  173,  388,
			  388,  388,  388,  388,  390,  390,  390,  321,  410,  410,
			  410,  350,  350,  350,  350,  418,  300,  418,  376,  418,
			  411,  172,  313,  313,  313,  398,  398,  398,  398,  398,
			  398,  398,  418,  418,  314,  418,  418,  340,  340,  340,
			  340,  340,  340,  340,  410,  410,  410,  369,  114,  114,
			  114,  418,  370,  366,  366,  418,  411,  366,  366,  366,
			  114,  257,  173,  383,  354,  355,  356,  356,  356,  356,
			  418,  418,  402,  402,  402,  418,  412,  254,  254,  254, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  207,  207,  207,  369,  377,  207,  207,  418,  418,  254,
			  418,  418,  207,  384,  173,  386,  386,  386,  386,  387,
			  388,  388,  389,  389,  389,  389,  389,  389,  389,  418,
			  318,  318,  318,  418,  389,  389,  389,  389,  412,  271,
			  271,  271,  318,  418,  271,  271,  418,  389,  389,  389,
			  418,  271,  172,  406,  406,  406,  406,  406,  406,  406,
			  352,  352,  352,  352,  418,  406,  406,  406,  406,  362,
			  362,  362,  418,  418,  362,  362,  418,  418,  406,  406,
			  406,  297,  297,  297,  297,  297,  297,  297,  363,  363,
			  363,  363,  418,  297,  297,  297,  297,  374,  374,  418,

			  418,  374,  374,  374,  418,  418,  297,  297,  297,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   71,   71,

			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   84,   84,  418,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   90,
			   90,   90,   90,  418,  418,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   90,   90,   90,   90,   90,   90,   93,   93,   93,   93,
			  418,  418,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   95,   95,  418,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  112,  112,  112,  364,  364,  364,  418,  418,  112,  418,
			  418,  112,  112,  112,  418,  364,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  120,  120,  418,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,

			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  142,  142,  142,  142,  142,  142,
			  142,  142,  142,  142,  146,  146,  146,  146,  146,  146, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,

			  162,  162,   86,   86,  418,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,  172,
			  172,  418,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  183,  183,  183,  183,
			  418,  418,  183,  183,  183,  183,  183,  183,  418,  418,
			  418,  183,  183,  186,  186,  418,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  418,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  120,  120,  120,  120,  379,  379,  379,  120,  418,
			  379,  379,  120,  120,  120,  418,  418,  120,  120,  166,

			  166,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  166,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  166,  166,  166,  166,  166,  166,  173,  173,  418,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  174,  174,  418,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  183,  183,  183,  183,  418,  418,  183,  183,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  183,  183,  183,  183,  183,  183,  183,  173,  173,  173,
			  173,  398,  398,  418,  173,  398,  398,  398,  173,  173,
			  173,  418,  418,  173,  173,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  334,
			  334,  334,  371,  371,  371,  418,  418,  334,  418,  418,
			  334,  334,  334,  418,  371,  334,  334,  385,  385,  385,

			  385,  418,  334,  337,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  418,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  337,  337,  337,  337,
			  120,  120,  418,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  381,  381,  381,  381,  418,  418,
			  381,  381,  388,  388,  388,  388,  360,  360,  360,  360, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360,  360,  394,  394,  394,  394,  418,  418,  394,
			  394,  396,  396,  396,  403,  403,  403,  403,  418,  418,
			  403,  403,  418,  396,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  404,  404,  404,  404,  418,  418,  404,  404,  405,
			  405,  405,  418,  418,  405,  405,  408,  408,  408,  408,
			  418,  418,  408,  408,  413,  413,  413,  413,  418,  418,

			  413,  413,  414,  414,  414,  414,  418,  418,  414,  414,
			  415,  415,  415,  415,  418,  418,  415,  415,  416,  416,
			  416,  416,  418,  418,  416,  416,  350,  350,  350,  350,
			  418,  418,  350,  350,  417,  417,  417,  417,  418,  418,
			  417,  417,  388,  388,  388,  388,  418,  418,  388,  388,
			   21,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  418,  418,  418,  418, yy_Dummy>>,
			1, 4, 2800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2803)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    3,    3,    4,    4,    4,
			    5,   13,   13,    5,  417,    5,    3,    6,  416,    4,
			    6,  415,    6,    7,    7,    7,    8,    8,    8,    7,
			   14,   14,    8,    9,    9,    9,   10,   10,   10,   11,
			   11,   11,  414,   11,   12,   12,   12,   99,   12,   15,

			   15,   15,   16,   16,   16,   17,   17,   17,   99,   17,
			   18,   18,   18,  413,   18,   19,   19,   20,   20,   23,
			   23,   23,   24,   24,   24,   25,   25,   25,   27,   27,
			   27,   23,  411,   29,   24,   29,   11,   25,   27,   27,
			   27,   12,  408,   17,   26,   26,   26,   26,   18,   28,
			   28,   28,   30,   30,   30,   35,   35,   35,   36,   36,
			   36,   32,   32,   32,   30,  405,   48,   35,   48,  112,
			   36,   59,   59,   32,   59,   32,   26,   30,  404,   35,
			  112,   36,   36,   65,   65,   32,   26,   31,   31,   31,
			   53,   53,   53,   57,   57,   57,   53,   67,   67,   31, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   31,  403,   31,   31,   31,   31,   31,   31,   31,   32,
			   33,   33,   33,  119,   60,   60,   60,  401,   60,   69,
			   69,   69,   33,   33,  119,   33,   33,   33,   33,   33,
			   33,   33,   39,   39,   39,   37,   37,   37,   33,   33,
			  400,   38,   38,   38,   39,   33,  120,   37,  120,   33,
			  395,   33,   33,   38,  394,   33,   34,   34,   34,   37,
			   37,   60,   62,   62,   62,   38,   62,  393,   34,   34,
			  388,   34,   34,   34,   34,   34,   34,   34,   40,   40,
			   40,   45,   45,   45,   46,   46,   46,   50,   50,   50,
			   40,   64,   64,   45,   64,   34,   46,   71,   71,   50,

			   71,   72,   72,   72,  386,   72,   74,   74,   74,   62,
			   74,   40,   76,   76,  385,   76,   77,   77,   79,   79,
			  146,  146,   40,   51,   51,   51,   84,   51,   84,   51,
			  383,   51,   51,   80,   80,   80,  128,   51,  128,   72,
			  381,   82,   82,   82,   74,   80,   51,  173,   51,  173,
			   51,   51,   51,   82,  379,   51,   51,  378,   84,   85,
			   85,   85,  166,   51,   51,   51,   51,   51,   84,  191,
			   86,   85,   86,  166,   86,  377,   86,   88,   88,   88,
			  191,   88,  369,   88,   89,   89,   89,  280,   89,  280,
			   89,   90,   90,   90,   92,   92,   92,   93,   93,   93, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   98,   98,   98,  100,  100,  100,   86,  106,  106,  126,
			  126,  126,   98,   88,  368,  100,   86,   87,  217,   87,
			   89,   87,   87,   88,  113,  148,  148,   87,  113,  217,
			   89,  106,  114,  114,  114,  363,   87,  113,   87,  113,
			   87,   87,   87,  362,  114,   87,   87,  162,  162,   87,
			  107,  107,  107,  107,  107,  107,  117,  117,  117,   87,
			  101,  101,  101,  131,  131,  131,  164,  164,  117,  131,
			  356,  114,  101,  354,  107,  101,  101,  101,  101,  101,
			  101,  101,  121,  121,  121,  134,  134,  134,  136,  136,
			  101,  136,  138,  138,  121,  138,  150,  150,  150,  101,

			  104,  104,  104,  129,  129,  129,  129,  129,  129,  129,
			  142,  142,  104,  142,  229,  104,  104,  104,  104,  104,
			  104,  104,  140,  140,  140,  229,  140,  183,  183,  183,
			  104,  109,  109,  109,  141,  141,  141,  352,  141,  144,
			  144,  351,  144,  109,  196,  196,  109,  109,  109,  109,
			  109,  109,  109,  145,  145,  145,  152,  152,  350,  152,
			  154,  154,  380,  154,  380,  145,  202,  202,  348,  140,
			  109,  156,  156,  156,  347,  156,  157,  157,  157,  172,
			  157,  141,  158,  158,  345,  158,  160,  160,  344,  160,
			  161,  161,  161,  169,  169,  169,  339,  170,  170,  170, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  336,  170,  161,  170,  333,  169,  171,  171,  171,  156,
			  171,  172,  171,  174,  157,  174,  204,  204,  176,  176,
			  176,  172,  176,  185,  185,  185,  188,  188,  188,  331,
			  177,  177,  177,  170,  177,  185,  212,  328,  188,  212,
			  204,  326,  171,  170,  323,  174,  250,  178,  178,  178,
			  212,  178,  171,  178,  176,  174,  175,  250,  321,  180,
			  180,  180,  320,  180,  176,  180,  177,  175,  175,  175,
			  175,  175,  175,  175,  256,  256,  177,  190,  190,  190,
			  192,  192,  192,  178,  203,  203,  203,  314,  175,  190,
			  315,  315,  192,  178,  312,  180,  203,  307,  175,  203,

			  203,  219,  219,  219,  305,  180,  187,  206,  206,  206,
			  206,  206,  206,  187,  187,  187,  187,  187,  187,  187,
			  201,  201,  201,  203,  218,  218,  218,  218,  218,  218,
			  218,  206,  201,  341,  341,  201,  201,  201,  201,  201,
			  201,  201,  207,  207,  207,  211,  211,  211,  370,  370,
			  201,  216,  216,  216,  207,  251,  298,  211,  211,  201,
			  205,  205,  205,  216,  285,  304,  251,  298,  302,  301,
			  285,  285,  205,  300,  292,  205,  205,  205,  205,  205,
			  205,  207,  228,  228,  228,  232,  232,  232,  288,  306,
			  361,  361,  361,  286,  228,  306,  306,  232,  284,  205, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  220,  220,  220,  220,  220,  220,  220,  220,  234,  234,
			  234,  283,  234,  281,  234,  235,  235,  235,  279,  235,
			  277,  235,  240,  240,  240,  273,  240,  269,  243,  243,
			  243,  220,  222,  222,  222,  222,  222,  222,  222,  222,
			  243,  245,  245,  245,  234,  241,  241,  241,  309,  241,
			  246,  235,  311,  245,  234,  359,  246,  246,  240,  309,
			  297,  235,  236,  311,  265,  261,  359,  257,  240,  360,
			  297,  391,  236,  236,  236,  236,  236,  236,  236,  236,
			  360,  241,  391,  407,  407,  407,  249,  246,  247,  244,
			  233,  241,  297,  231,  236,  252,  252,  252,  252,  252,

			  252,  252,  297,  236,  236,  237,  237,  237,  237,  237,
			  237,  237,  253,  253,  253,  254,  254,  254,  459,  459,
			  459,  459,  227,  253,  253,  225,  223,  254,  258,  258,
			  258,  258,  258,  258,  258,  237,  238,  238,  238,  238,
			  238,  238,  238,  221,  214,  254,  259,  259,  259,  210,
			  208,  253,  200,  197,  254,  195,  193,  259,  259,  289,
			  289,  289,  289,  289,  289,  289,  238,  239,  239,  239,
			  239,  239,  239,  239,  262,  262,  262,  189,  186,  263,
			  263,  263,  473,  473,  473,  259,  262,  473,  473,  262,
			  262,  263,  168,  124,  263,  263,  122,  239,  248,  248, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  248,  248,  248,  248,  248,  248,  460,  460,  460,  460,
			  270,  270,  270,  262,  271,  271,  271,  118,  263,  266,
			  266,  266,  270,  116,  115,  111,  271,  108,  299,  299,
			  299,  266,  103,   97,  266,  266,  266,  266,  266,  266,
			  299,   96,   95,   83,  290,  290,  290,   81,  290,  270,
			  290,  455,  455,  271,   47,  455,  455,  455,  266,  267,
			  267,  267,  462,  462,  462,  462,  291,  291,  291,   43,
			  291,  267,  291,   42,  267,  267,  267,  267,  267,  267,
			  290,  308,  308,  308,  310,  310,  310,   41,   21,    0,
			  290,    0,    0,  308,    0,    0,  310,    0,  267,  274,

			  274,  274,  291,  316,  316,  316,  316,  316,  316,  316,
			    0,  274,  291,    0,  274,  274,  274,  274,  274,  274,
			  274,  318,  318,  318,    0,  317,  317,  317,    0,  274,
			  275,  275,  275,  318,  275,    0,  317,  317,  329,  329,
			  329,    0,  275,    0,    0,    0,  324,  324,  324,    0,
			  329,  318,    0,  334,  334,  334,    0,    0,  324,    0,
			  318,  324,  324,  275,  317,  334,  349,  349,  349,  349,
			  349,  349,    0,    0,  275,    0,  275,  276,  276,  276,
			  276,  276,  276,  276,  276,  324,  358,  358,  358,  342,
			  342,  342,  334,  342,    0,  364,  364,  364,  358,  457, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  457,  342,    0,  457,  457,  457,    0,  364,  276,  278,
			  278,  278,  278,  278,  278,  278,  278,  293,  293,  293,
			  293,  293,  293,  293,  293,  463,  463,  463,  463,    0,
			  293,  293,  293,  293,  364,  342,  365,  365,  365,  365,
			  365,  365,  365,  293,  293,  293,    0,    0,  293,  294,
			  294,  294,  294,  294,  294,  294,  366,  366,  366,  371,
			  371,  371,  470,  470,  470,  470,    0,  366,  366,    0,
			    0,  371,  373,  373,  373,  373,  373,  373,  373,  294,
			  295,  295,  295,  295,  295,  295,  295,    0,  374,  374,
			  374,    0,  375,  375,  375,  366,  375,    0,  371,  374,

			  374,  466,  466,    0,  375,  466,  466,  466,    0,    0,
			  295,  296,  296,  296,  296,  296,  296,  296,  387,  387,
			  387,  387,  387,  387,  390,  390,  390,  374,  396,  396,
			  396,  471,  471,  471,  471,    0,  390,    0,  375,    0,
			  396,  296,  340,  340,  340,  397,  397,  397,  397,  397,
			  397,  397,    0,    0,  340,    0,    0,  340,  340,  340,
			  340,  340,  340,  340,  398,  398,  398,  396,  433,  433,
			  433,    0,  340,  479,  479,  398,  398,  479,  479,  479,
			  433,  340,  353,  353,  353,  353,  353,  353,  353,  353,
			    0,    0,  402,  402,  402,    0,  402,  456,  456,  456, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  448,  448,  448,  398,  402,  448,  448,    0,    0,  456,
			    0,    0,  448,  353,  355,  355,  355,  355,  355,  355,
			  355,  355,  357,  357,  357,  357,  357,  357,  357,    0,
			  467,  467,  467,    0,  357,  357,  357,  357,  402,  458,
			  458,  458,  467,    0,  458,  458,    0,  357,  357,  357,
			    0,  458,  357,  389,  389,  389,  389,  389,  389,  389,
			  474,  474,  474,  474,    0,  389,  389,  389,  389,  476,
			  476,  476,    0,    0,  476,  476,    0,    0,  389,  389,
			  389,  406,  406,  406,  406,  406,  406,  406,  477,  477,
			  477,  477,    0,  406,  406,  406,  406,  481,  481,    0,

			    0,  481,  481,  481,    0,    0,  406,  406,  406,  419,
			  419,  419,  419,  419,  419,  419,  419,  419,  419,  419,
			  419,  419,  419,  419,  419,  419,  419,  419,  419,  419,
			  419,  419,  419,  419,  419,  419,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  421,  421,  421,  421,  421,  421,  421,
			  421,  421,  421,  421,  421,  421,  421,  421,  421,  421,
			  421,  421,  421,  421,  421,  421,  421,  421,  421,  421,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  425,  425,  425,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  425,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  425,  425,  425,  425,  425,  426,  426,

			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  426,
			  426,  426,  426,  426,  426,  427,  427,  427,  427,  427,
			  427,  427,  427,  427,  427,  427,  427,  427,  427,  427,
			  427,  427,  427,  427,  427,  427,  427,  427,  427,  427,
			  427,  427,  428,  428,    0,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  428,  428,  428,  428,  429,
			  429,  429,  429,    0,    0,  429,  429,  429,  429,  429,
			  429,  429,  429,  429,  429,  429,  429,  429,  429,  429, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  429,  429,  429,  429,  429,  429,  430,  430,  430,  430,
			    0,    0,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  430,  431,  431,    0,  431,  431,  431,  431,
			  431,  431,  431,  431,  431,  431,  431,  431,  431,  431,
			  431,  431,  431,  431,  431,  431,  431,  431,  431,  431,
			  432,  432,  432,  478,  478,  478,    0,    0,  432,    0,
			    0,  432,  432,  432,    0,  478,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  432,  434,  434,    0,  434,
			  434,  434,  434,  434,  434,  434,  434,  434,  434,  434,

			  434,  434,  434,  434,  434,  434,  434,  434,  434,  434,
			  434,  434,  434,  435,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  435,  435,  435,  435,  435,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  437,  437,  437,
			  437,  437,  437,  437,  437,  437,  437,  437,  437,  437,
			  437,  437,  437,  437,  437,  437,  437,  437,  437,  437,
			  437,  437,  437,  437,  438,  438,  438,  438,  438,  438, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  439,  439,  439,  439,  439,  439,  439,  439,  439,
			  439,  439,  439,  439,  439,  439,  439,  439,  439,  439,
			  439,  439,  439,  439,  439,  439,  439,  439,  440,  440,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  440,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  440,
			  440,  440,  440,  440,  440,  441,  441,  441,  441,  441,
			  441,  441,  441,  441,  441,  441,  441,  441,  441,  441,
			  441,  441,  441,  441,  441,  441,  441,  441,  441,  441,

			  441,  441,  442,  442,    0,  442,  442,  442,  442,  442,
			  442,  442,  442,  442,  442,  442,  442,  442,  442,  442,
			  442,  442,  442,  442,  442,  442,  442,  442,  442,  443,
			  443,    0,  443,  443,  443,  443,  443,  443,  443,  443,
			  443,  443,  443,  443,  443,  443,  443,  443,  443,  443,
			  443,  443,  443,  443,  443,  443,  444,  444,  444,  444,
			    0,    0,  444,  444,  444,  444,  444,  444,    0,    0,
			    0,  444,  444,  445,  445,    0,  445,  445,  445,  445,
			  445,  445,  445,  445,  445,  445,  445,  445,  445,  445,
			  445,  445,  445,  445,  445,  445,  445,  445,  445,  445, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  446,  446,  446,  446,  446,  446,  446,  446,  446,  446,
			  446,  446,  446,  446,  446,  446,  446,  446,  446,  446,
			  446,  446,  446,  446,  446,  446,  446,  447,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,    0,  447,  447,
			  447,  447,  447,  447,  447,  447,  447,  447,  447,  447,
			  447,  447,  447,  447,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  449,  449,  449,  449,  449,  449,  449,  449,  449,
			  449,  450,  450,  450,  450,  482,  482,  482,  450,    0,
			  482,  482,  450,  450,  450,    0,    0,  450,  450,  451,

			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,  451,  451,  451,  451,
			  451,  451,  451,  451,  451,  451,  452,  452,    0,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  452,  452,  452,  452,  452,  452,  452,  452,  452,
			  452,  452,  452,  453,  453,    0,  453,  453,  453,  453,
			  453,  453,  453,  453,  453,  453,  453,  453,  453,  453,
			  453,  453,  453,  453,  453,  453,  453,  453,  453,  453,
			  454,  454,  454,  454,    0,    0,  454,  454,  454,  454,
			  454,  454,  454,  454,  454,  454,  454,  454,  454,  454, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  454,  454,  454,  454,  454,  454,  454,  461,  461,  461,
			  461,  489,  489,    0,  461,  489,  489,  489,  461,  461,
			  461,    0,    0,  461,  461,  464,  464,  464,  464,  464,
			  464,  464,  464,  464,  464,  464,  464,  464,  464,  464,
			  464,  464,  464,  464,  464,  464,  464,  464,  464,  464,
			  464,  464,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  465,  465,  465,  465,  465,  465,  465,  465,  468,
			  468,  468,  480,  480,  480,    0,    0,  468,    0,    0,
			  468,  468,  468,    0,  480,  468,  468,  484,  484,  484,

			  484,    0,  468,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,    0,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			  472,  472,    0,  472,  472,  472,  472,  472,  472,  472,
			  472,  472,  472,  472,  472,  472,  472,  472,  472,  472,
			  472,  472,  472,  472,  472,  472,  472,  475,  475,  475,
			  475,  475,  475,  475,  475,  475,  475,  475,  475,  475,
			  475,  475,  475,  475,  475,  475,  475,  475,  475,  475,
			  475,  475,  475,  475,  483,  483,  483,  483,    0,    0,
			  483,  483,  485,  485,  485,  485,  486,  486,  486,  486, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  486,  486,  486,  486,  486,  486,  486,  486,  486,  486,
			  486,  486,  486,  486,  486,  486,  486,  486,  486,  486,
			  486,  486,  486,  487,  487,  487,  487,    0,    0,  487,
			  487,  488,  488,  488,  491,  491,  491,  491,    0,    0,
			  491,  491,    0,  488,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  492,  492,  492,  492,    0,    0,  492,  492,  493,
			  493,  493,    0,    0,  493,  493,  494,  494,  494,  494,
			    0,    0,  494,  494,  495,  495,  495,  495,    0,    0,

			  495,  495,  496,  496,  496,  496,    0,    0,  496,  496,
			  497,  497,  497,  497,    0,    0,  497,  497,  498,  498,
			  498,  498,    0,    0,  498,  498,  499,  499,  499,  499,
			    0,    0,  499,  499,  500,  500,  500,  500,    0,    0,
			  500,  500,  501,  501,  501,  501,    0,    0,  501,  501,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  418,  418,  418,  418, yy_Dummy>>,
			1, 4, 2800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 501)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   52,   55,   57,   64,   71,   74,   81,
			   84,   87,   92,   58,   77,   97,  100,  103,  108,  112,
			  114, 1088, 2750,  117,  120,  123,  138,  126,  147,  125,
			  150,  185,  159,  208,  254,  153,  156,  233,  239,  230,
			  276, 1048, 1032, 1018, 2750,  279,  282, 1040,  160, 2750,
			  285,  321, 2750,  188, 2750, 2750, 2750,  191, 2750,  168,
			  212, 2750,  260, 2750,  288,  180, 2750,  194, 2750,  217,
			 2750,  294,  299, 2750,  304, 2750,  309,  313, 2750,  315,
			  331, 1033,  339, 1029,  320,  357,  368,  411,  375,  382,
			  389, 2750,  392,  395, 2750, 1032, 1025, 1023,  398,   94,

			  401,  458, 2750, 1018,  498,    0,  390,  433,  986,  529,
			 2750, 1011,  134,  393,  430,  983,  971,  454, 1003,  210,
			  240,  480,  980, 2750,  979, 2750,  407, 2750,  330,  486,
			 2750,  461, 2750, 2750,  483, 2750,  485, 2750,  489, 2750,
			  520,  532,  507, 2750,  536,  551,  317, 2750,  422, 2750,
			  494, 2750,  553, 2750,  557, 2750,  569,  574,  579, 2750,
			  583,  588,  444, 2750,  463, 2750,  359, 2750,  978,  591,
			  595,  604,  573,  341,  607,  650,  616,  628,  645, 2750,
			  657, 2750, 2750,  525, 2750,  621,  968,  696,  624,  963,
			  675,  366,  678,  942, 2750,  941,  531,  912, 2750, 2750, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  938,  718,  553,  682,  599,  758,  690,  740,  909, 2750,
			  935,  743,  604, 2750,  930, 2750,  749,  415,  707,  699,
			  784,  927,  816,  910, 2750,  911, 2750,  908,  780,  511,
			 2750,  879,  783,  874,  806,  813,  856,  888,  919,  950,
			  820,  843, 2750,  826,  875,  839,  840,  872,  982,  870,
			  643,  752,  878,  910,  913, 2750,  661,  826,  911,  944,
			 2750,  851,  972,  977, 2750,  850, 1017, 1057, 2750,  813,
			 1008, 1012, 2750,  811, 1097, 1128, 1161,  804, 1193,  802,
			  381,  766,    0,  795,  782,  748,  777, 2750,  774,  942,
			 1042, 1064,  727, 1201, 1232, 1263, 1294,  854,  753, 1026,

			  759,  759,  721,    0,  749,  688,  773,  681, 1079,  845,
			 1082,  849,  653, 2750,  673,  677, 1086, 1123, 1119, 2750,
			  648,  617, 2750,  630, 1144, 2750,  627, 2750,  623, 1136,
			 2750,  615, 2750,  590, 1151, 2750,  586, 2750, 2750,  582,
			 1340,  720, 1187, 2750,  574,  537,    0,  558,  552, 1150,
			  542,  525,  521, 1366,  457, 1398,  454, 1405, 1184,  852,
			  866,  788,  427,  419, 1193, 1219, 1254, 2750,  400,  341,
			  735, 1257, 2750, 1255, 1286, 1290, 2750,  361,  354,  338,
			  556,  324, 2750,  283,    0,  298,  288, 1302,  254, 1436,
			 1322,  868, 2750,  257,  238,  240, 1326, 1328, 1362, 2750, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  226,  214, 1390,  185,  162,  149, 1464,  881,  126, 2750,
			 2750,  118, 2750,   97,   76,   55,   52,   48, 2750, 1508,
			 1535, 1562, 1589, 1616, 1643, 1670, 1697, 1724, 1751, 1778,
			 1805, 1832, 1858, 1355, 1885, 1912, 1939, 1966, 1993, 2020,
			 2047, 2074, 2101, 2128, 2155, 2172, 2199, 2226, 1387, 2253,
			 2276, 2298, 2325, 2352, 2379, 1042, 1384, 1190, 1426,  906,
			  994, 2402, 1050, 1213, 2424, 2451, 1292, 1417, 2477, 2502,
			 1250, 1319, 2529,  969, 1448, 2556, 1456, 1476, 1850, 1364,
			 2469, 1488, 2272, 2572, 2485, 2580, 2595, 2611, 2618, 2402,
			 2643, 2622, 2659, 2666, 2674, 2682, 2690, 2698, 2706, 2714,

			 2722, 2730, yy_Dummy>>,
			1, 102, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 501)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  418,    1,  419,  419,  420,  420,  421,  421,  422,
			  422,  423,  423,  424,  424,  425,  425,  426,  426,  427,
			  427,  418,  418,  418,  418,  418,  428,  429,  430,  431,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  432,
			  432,  418,  433,  418,  418,  418,  418,  418,  434,  418,
			  418,  435,  418,  418,  418,  418,  418,  418,  418,  436,
			  436,  418,  436,  418,  437,  438,  418,  438,  418,  418,
			  418,  439,  439,  418,  439,  418,  440,  441,  418,  441,
			  418,  418,  418,  418,  428,  418,  442,  443,  428,  428,
			  429,  418,  444,  430,  418,  418,  445,  418,  418,  446,

			  418,  418,  418,  418,  447,   34,  418,  418,  448,  418,
			  418,  418,   40,   40,  433,  433,  418,  418,  418,  449,
			  434,  418,  450,  418,  418,  418,  418,  418,  434,  418,
			  418,  418,  418,  418,  418,  418,  436,  418,  436,  418,
			  436,  436,  437,  418,  437,  418,  438,  418,  438,  418,
			  418,  418,  439,  418,  439,  418,  439,  439,  440,  418,
			  440,  418,  441,  418,  441,  418,  451,  418,  418,  418,
			  442,  442,  443,  452,  453,  443,  443,  443,  428,  418,
			  428,  418,  418,  454,  418,  418,  418,  418,  418,  418,
			  418,  446,  418,  418,  418,  418,  455,  456,  418,  418, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  418,  418,  457,  418,  418,  418,  418,  448,  458,  418,
			  418,  109,   40,  418,  418,  418,  418,  449,  418,  418,
			  418,  459,  418,  460,  418,  418,  418,  418,  418,  451,
			  418,  418,  418,  461,  453,  453,  443,  236,  236,  236,
			  443,  443,  418,  418,  418,  418,  187,  462,  418,  463,
			  464,  465,  418,  455,  456,  418,  466,  467,  418,  457,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  468,  458,  418,  418,  469,   40,  418,  470,  418,  471,
			  472,  220,  473,  460,  460,  460,  474,  418,  418,  418,
			  453,  453,  236,  236,  236,  236,  236,  443,  475,  418,

			  418,  418,  246,  476,  463,  463,  463,  477,  418,  464,
			  418,  465,  478,  418,  418,  479,  418,  466,  467,  418,
			  418,  480,  418,  418,  418,  418,  418,  418,  418,  266,
			  418,  418,  418,  418,  468,  418,  418,  418,  418,  418,
			  418,  481,  418,  418,  418,  276,  482,  471,  471,  418,
			  418,  483,  474,  418,  484,  418,  485,  236,  418,  475,
			  486,  418,  487,  477,  478,  418,  479,  418,  418,  488,
			  489,  480,  418,  418,  481,  418,  418,  418,  490,  491,
			  472,  492,  418,  353,  493,  485,  485,  418,  418,  357,
			  418,  486,  418,  418,  494,  418,  488,  418,  489,  418, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  418,  490,  418,  495,  496,  497,  389,  418,  498,  418,
			  418,  418,  418,  499,  418,  500,  418,  501,    0,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,

			  418,  418, yy_Dummy>>,
			1, 102, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 256)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    6,    7,    5,    8,    9,   10,
			   11,   11,   12,   13,    5,   14,   15,   16,   17,   18,
			   19,   20,   20,   21,   22,   22,   23,   23,   24,    5,
			   25,   26,   27,   28,    9,   29,   30,   31,   29,   32,
			   29,   33,   34,   33,   33,   33,   34,   33,   35,   36,
			   33,   34,   34,   34,   34,   34,   34,   33,   37,   33,
			   33,   38,   39,   40,    5,   41,    1,   42,   43,   44,

			   42,   32,   42,   33,   45,   33,   33,   33,   45,   33,
			   46,   36,   33,   45,   45,   45,   45,   45,   45,   33,
			   47,   33,   33,   48,    9,   49,   50,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,   51,    1,    1,
			    1,   52,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,   53,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    1,    5,    1,    6,    1,
			    7,    8,    1,    9,   10,   11,   12,   13,   13,   13,
			   13,   13,   14,   15,    1,   16,    1,   17,    1,   18,
			   18,   18,   19,   20,   21,   22,   23,   24,    1,    1,
			    1,   25,   19,   19,   19,   20,   26,   27,    1,    1,
			    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 419)
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
			    1,    1,    2,    3,    4,    5,    5,    5,    6,    7,
			    8,    9,   10,   12,   16,   19,   22,   25,   28,   31,
			   34,   37,   40,   43,   47,   51,   54,   57,   60,   63,
			   67,   71,   73,   75,   77,   79,   83,   86,   88,   90,
			   92,   95,   97,   99,  101,  103,  106,  108,  110,  112,
			  114,  116,  118,  120,  122,  124,  126,  128,  130,  132,
			  134,  136,  138,  140,  142,  144,  146,  148,  150,  152,
			  154,  156,  156,  158,  158,  159,  163,  164,  164,  166,
			  168,  169,  170,  171,  172,  173,  174,  175,  177,  178,

			  179,  180,  184,  185,  185,  186,  188,  188,  188,  188,
			  190,  191,  191,  193,  195,  197,  197,  197,  199,  199,
			  200,  201,  203,  203,  204,  204,  205,  206,  207,  209,
			  211,  213,  213,  214,  215,  215,  216,  217,  218,  219,
			  220,  221,  222,  223,  225,  226,  229,  230,  231,  232,
			  234,  234,  235,  236,  237,  238,  239,  240,  241,  242,
			  244,  245,  248,  249,  250,  251,  253,  254,  256,  256,
			  262,  264,  266,  266,  267,  268,  268,  269,  270,  271,
			  272,  273,  274,  275,  276,  277,  278,  279,  281,  283,
			  283,  284,  285,  287,  287,  289,  289,  289,  289,  290, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  292,  293,  297,  298,  300,  300,  302,  302,  304,  304,
			  305,  305,  307,  309,  310,  310,  311,  312,  313,  313,
			  313,  314,  315,  316,  317,  318,  318,  319,  319,  320,
			  321,  324,  324,  326,  326,  328,  330,  330,  330,  330,
			  330,  330,  330,  331,  333,  333,  334,  335,  336,  337,
			  338,  339,  340,  340,  344,  346,  347,  347,  347,  347,
			  351,  352,  352,  354,  356,  357,  357,  359,  361,  362,
			  362,  364,  366,  367,  367,  368,  370,  370,  370,  370,
			  370,  373,  374,  374,  375,  376,  377,  378,  379,  379,
			  379,  380,  381,  381,  381,  381,  381,  381,  381,  382,

			  384,  384,  385,  386,  386,  387,  388,  389,  390,  391,
			  392,  393,  394,  394,  395,  395,  395,  395,  403,  405,
			  407,  407,  407,  408,  408,  410,  411,  411,  412,  412,
			  414,  415,  415,  416,  416,  418,  419,  419,  420,  422,
			  423,  425,  426,  427,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  429,  429,  429,  429,  429,  429,  430,
			  431,  432,  434,  434,  435,  437,  437,  439,  443,  443,
			  443,  443,  445,  446,  446,  448,  448,  450,  450,  451,
			  451,  453,  453,  454,  454,  454,  454,  454,  454,  454,
			  454,  455,  456,  457,  457,  457,  458,  462,  462,  466, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  467,  467,  467,  467,  467,  467,  467,  467,  468,  468,
			  469,  471,  471,  472,  472,  472,  472,  472,  472,  472, yy_Dummy>>,
			1, 20, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 471)
			yy_acclist_template_1 (an_array)
			yy_acclist_template_2 (an_array)
			yy_acclist_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_acclist_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    0,   49,   49,   52,   52,   61,   61,   64,   64,  128,
			  126,  127,  121,  122,  126,  127,  121,  122,  127,    2,
			  126,  127,   67,  126,  127,   14,  126,  127,   18,  126,
			  127,   36,  126,  127,    2,  126,  127,    2,  126,  127,
			    2,  126,  127,   83,  126,  127, -211,   83,  126,  127,
			 -211,    2,  126,  127,    2,  126,  127,    2,  126,  127,
			    2,  126,  127,   12,  126,  127, -140,   12,  126,  127,
			 -140,  126,  127,  126,  127,  126,  127,  125,  127,  123,
			  124,  125,  127,  123,  124,  127,  125,  127,   74,  127,
			   79,  127,   75,  127, -203,   78,  127,   82,  127,   82,

			  127,   81,  127,   80,   82,  127,   43,  127,   43,  127,
			   42,  127,   49,  127,   49,  127,   48,  127,   49,  127,
			   46,  127,   49,  127,   52,  127,   51,  127,   52,  127,
			   55,  127,   55,  127,   54,  127,   61,  127,   61,  127,
			   60,  127,   61,  127,   58,  127,   61,  127,   64,  127,
			   63,  127,   64,  127,  121,  122,    3,    4,   67,   39,
			   65, -167, -193,   67,   67, -180,   67, -168,   17,   19,
			   15,   18,   23,   36,   36,   35,   36,    3,  122,    6,
			  114,  120, -238, -244,  -84, -236,   83, -211,   89, -217,
			  -13,   12, -140,   12, -140,   87, -215,  123,  124,  124, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   74,   75, -203,  -76,   77,   77,   68,   74,   77,   72,
			   77,   73,   77,   81,   80,   42,   49,   48,   49,   46,
			   49,   49,   49,   47,   48,   49,   44,   46, -172,   52,
			   51,   52,   50,   51,   54,   61,   60,   61,   58,   61,
			   61,   61,   59,   60,   61,   56,   58, -184,   64,   63,
			   64,   62,   63,    4,  -40,  -66,   37,   39,   65, -165,
			 -167, -193,   67, -180,   67, -168,   67,   67, -180, -168,
			   67,  -53,   67,  -41,   22,   16,   20,   24,   36,   34,
			   36,    3,    5,  122,  122,    7,    8, -111, -117,  112,
			 -109,  112,  112,  114,  120, -238, -244,  112,  103, -231,

			   97, -225,   91, -219,  -90,   85, -213,   12, -140,  -88,
			    1,  124,  124,   71,   71,   71,   71,  -45,  -57,    4,
			    4,  -38,  -40,  -66,   65, -193,   67, -180,   67, -168,
			   21,   25,   26,   27,   33,   33,   33,   33,    5,    8,
			  114,  120, -238, -244,  120, -244, -109,  113,  119, -237,
			 -243, -104,  107, -235,  105, -233,  -98,  101, -229,   99,
			 -227,  -92,   95, -223,   93, -221,  -86, -242,   12, -140,
			   69,   70,   74,   71,   71,   71,   71,   71,  -66,   67,
			   67,   26,   28,   29,   36,   33,   33,   33,   33,   33,
			    5,    5,    8,    8, -117,  113,  114,  119,  120, -237, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			 -238, -243, -244,  120, -244, -110, -116, -108,  103, -231,
			 -106, -102,   97, -225, -100,  -96,   91, -219,  -94,  118,
			 -115,  118,  118,  120, -244,  118,  -13,    9,   71,   26,
			   26,   29,   30,   32,   33,  120, -244,  120, -244, -110,
			 -111, -116, -117,  119, -243, -115,  119, -243,   10,   11,
			  -13,   69,   74,   70,   29,   29,   31,   36,  119,  120,
			 -243, -244,  119,  120, -243, -244, -116,   30,   32, -116,
			 -117,   11, yy_Dummy>>,
			1, 72, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2750
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 418
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 419
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

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

	yyNb_rules: INTEGER = 127
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 128
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



feature -- Scanning

	read_token
			-- (NOTE: THIS IS THE COPY/PASTE VERSION OF THE CODE IN
			-- THE YY_COMPRESSED_SCANNER_SKELETON CLASS, FOR OPTIMISATION
			-- WITH ISE EIFFEL (ALLOW INLINING NOT POSSIBLE IN
			-- YY_COMPRESSED_SCANNER_SKELETON).)

			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		local
			yy_cp, yy_bp: INTEGER
			yy_current_state: INTEGER
			yy_next_state: INTEGER
			yy_matched_count: INTEGER
			yy_act: INTEGER
			yy_goto: INTEGER
			yy_c: INTEGER
			yy_found: BOOLEAN
			yy_rejected_line: INTEGER
			yy_rejected_column: INTEGER
			yy_rejected_position: INTEGER
			yy_done: BOOLEAN
			l_content_area: like yy_content_area
		do
				-- This routine is implemented with a loop whose body
				-- is a big inspect instruction. This is a mere
				-- translation of C gotos into Eiffel. Needless to
				-- say that I'm not very proud of this piece of code.
				-- However I performed some benchmarks and the results
				-- were that this implementation runs amazingly faster
				-- than an alternative implementation with no loop nor
				-- inspect instructions and where every branch of the
				-- old inspect instruction was written in a separate
				-- routine. I think that the performance penalty is due
				-- to the routine call overhead and the depth of the call
				-- stack. Anyway, I prefer to provide you with a big and
				-- ugly but fast scanning routine rather than a nice and
				-- slow version. I hope you won't blame me for that! :-)
			from
				last_token := yyUnknown_token
				yy_goto := yyNext_token
			until
				last_token /= yyUnknown_token
			loop
				inspect yy_goto
				when yyNext_token then
					if yy_more_flag then
						yy_more_len := yy_end - yy_start
						yy_more_flag := False
					else
						yy_more_len := 0
						line := yy_line
						column := yy_column
						position := yy_position
					end
					yy_cp := yy_end
						-- `yy_bp' is the position of the first
						-- character of the current token.
					yy_bp := yy_cp
						-- Find the start state.
--	START INLINING 'yy_at_beginning_of_line'
--					yy_current_state := yy_start_state + yy_at_beginning_of_line
					if input_buffer.beginning_of_line then
						yy_current_state := yy_start_state + 1
					else
						yy_current_state := yy_start_state
					end
--	END INLINING 'yy_at_beginning_of_line'
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						SPECIAL_INTEGER_.force (yy_state_stack, yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
						-- Find the next match.
					l_content_area := yy_content_area
					from
						yy_done := False
					until
						yy_done
					loop
						if attached yy_ec as l_yy_ec then
							if l_content_area /= Void then
								yy_c := l_yy_ec.item (l_content_area.item (yy_cp).code)
							else
								yy_c := l_yy_ec.item (yy_content.item (yy_cp).code)
							end
						else
							if l_content_area /= Void then
								yy_c := l_content_area.item (yy_cp).code
							else
								yy_c := yy_content.item (yy_cp).code
							end
						end
						if not yyReject_or_variable_trail_context and then yy_accept.item (yy_current_state) /= 0 then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from
						until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if attached yy_meta as l_yy_meta and then yy_current_state >= yyTemplate_mark then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := l_yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							SPECIAL_INTEGER_.force (yy_state_stack, yy_current_state, yy_state_count)
							yy_state_count := yy_state_count + 1
						end
						yy_cp := yy_cp + 1
						yy_done := (yy_current_state = yyJam_state)
					end
					if not yyReject_or_variable_trail_context then
							-- Do the guaranteed-needed backing up
							-- to find out the match.
						yy_cp := yy_last_accepting_cpos
						yy_current_state := yy_last_accepting_state
					end
					yy_goto := yyFind_action
				when yyFind_action then
						-- Find the action number.
					if not yyReject_or_variable_trail_context then
						yy_act := yy_accept.item (yy_current_state)
						yy_goto := yyDo_action
					else
						yy_state_count := yy_state_count - 1
						yy_current_state := yy_state_stack.item (yy_state_count)
						yy_lp := yy_accept.item (yy_current_state)
						yy_goto := yyFind_rule
					end
				when yyFind_rule then
						-- We branch here when backing up.
					check
						reject_used: yyReject_or_variable_trail_context
						yy_acclist_not_void: attached yy_acclist as l_yy_acclist
					then
						from
							yy_found := False
						until
							yy_found
						loop
							if yy_lp /= 0 and yy_lp < yy_accept.item (yy_current_state + 1) then
								yy_act := l_yy_acclist.item (yy_lp)
								if yyVariable_trail_context then
									if yy_act < -yyNb_rules or yy_looking_for_trail_begin /= 0 then
										if yy_act = yy_looking_for_trail_begin then
											yy_looking_for_trail_begin := 0
											yy_act := -yy_act - yyNb_rules
											yy_found := True
										else
											yy_lp := yy_lp + 1
										end
									elseif yy_act < 0 then
										yy_looking_for_trail_begin := yy_act - yyNb_rules
										if yyReject_used then
												-- Remember matched text in case
												-- we back up due to `reject'.
											yy_full_match := yy_cp
											yy_full_state := yy_state_count
											yy_full_lp := yy_lp
										end
										yy_lp := yy_lp + 1
									else
										yy_full_match := yy_cp
										yy_full_state := yy_state_count
										yy_full_lp := yy_lp
										yy_found := True
									end
								else
									yy_full_match := yy_cp
									yy_found := True
								end
							else
								yy_cp := yy_cp - 1
								yy_state_count := yy_state_count - 1
								yy_current_state := yy_state_stack.item (yy_state_count)
								yy_lp := yy_accept.item (yy_current_state)
							end
						end
						yy_rejected_line := yy_line
						yy_rejected_column := yy_column
						yy_rejected_position := yy_position
						yy_goto := yyDo_action
					end
				when yyDo_action then
						-- Set up `text' before action.
					yy_bp := yy_bp - yy_more_len
					yy_start := yy_bp
					yy_end := yy_cp
					debug ("GELEX")
					end
					yy_goto := yyNext_token
						-- Semantic actions.
					if yy_act = 0 then
							-- Must back up.
						if not yyReject_or_variable_trail_context then
								-- Backing-up info for compressed tables is
								-- taken after `yy_cp' has been incremented
								-- for the next state.
							yy_cp := yy_last_accepting_cpos
							yy_bp := yy_bp + yy_more_len
							yy_current_state := yy_last_accepting_state
							yy_goto := yyFind_action
						else
							last_token := yyError_token
							fatal_error ("fatal scanner internal error: no action found")
						end
					elseif yy_act = yyEnd_of_buffer then
							-- Amount of text matched not including
							-- the EOB character.
						yy_matched_count := yy_cp - yy_bp - 1
							-- Note that here we test for `yy_end' "<="
							-- to the position of the first EOB in the buffer,
							-- since `yy_end' will already have been
							-- incremented past the NULL character (since all
							-- states make transitions on EOB to the
							-- end-of-buffer state). Contrast this with the
							-- test in `read_character'.
						if yy_end <= input_buffer.count + 1 then
								-- This was really a NULL character.
							yy_end := yy_bp + yy_matched_count
							yy_current_state := yy_previous_state
								-- We're now positioned to make the NULL
								-- transition. We couldn't have
								-- `yy_previous_state' go ahead and do it
								-- for us because it doesn't know how to deal
								-- with the possibility of jamming (and we
								-- don't want to build jamming into it because
								-- then it will run more slowly).
							yy_next_state := yy_null_trans_state (yy_current_state)
							yy_bp := yy_bp + yy_more_len
							if yy_next_state /= 0 then
									-- Consume the NULL character.
								yy_cp := yy_end + 1
								yy_end := yy_cp
								yy_current_state := yy_next_state
								yy_goto := yyMatch
							else
								if yyReject_or_variable_trail_context then
										-- Still need to initialize `yy_cp',
										-- though `yy_current_state' was set
										-- up by `yy_previous_state'.
									yy_cp := yy_end
										-- Remove the state which was inserted
										-- in `yy_state_stack' by the call to
										-- `yy_null_trans_state'.
									yy_state_count := yy_state_count - 1
								else
										-- Do the guaranteed-needed backing up
										-- then figure out the match.
									yy_cp := yy_last_accepting_cpos
									yy_current_state := yy_last_accepting_state
								end
								yy_goto := yyFind_action
							end
						else
								-- Do not take the EOB character
								-- into account.
							yy_end := yy_end - 1
							yy_refill_input_buffer
							if input_buffer.filled then
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyMatch
							elseif yy_end - yy_start - yy_more_len /= 0 then
									-- Some text has been matched prior to
									-- the EOB. First process it.
								yy_current_state := yy_previous_state
								yy_cp := yy_end
								yy_bp := yy_start + yy_more_len
								yy_goto := yyFind_action
							else
									-- Only the EOB character has been matched,
									-- so treat this as a final EOF.
								if wrap then
									yy_bp := yy_start
									yy_cp := yy_end
									yy_execute_eof_action ((yy_start_state - 1) // 2)
								end
							end
						end
					else
						yy_execute_action (yy_act)
						if yy_rejected then
							yy_rejected := False
							yy_line := yy_rejected_line
							yy_column := yy_rejected_column
							yy_position := yy_rejected_position
								-- Restore position backed-over text.
							yy_cp := yy_full_match
							if yyVariable_trail_context then
									-- Restore original accepting position.
								yy_lp := yy_full_lp
									-- Restore original state.
								yy_state_count := yy_full_state
									-- Restore current state.
								yy_current_state := yy_state_stack.item (yy_state_count - 1)
							end
							yy_lp := yy_lp + 1
							yy_goto := yyFind_rule
						end
					end
				end
			end
			debug ("GELEX")
				print_last_token
			end
		end

end
