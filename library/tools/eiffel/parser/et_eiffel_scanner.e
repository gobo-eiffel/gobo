indexing

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
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

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= LAVS3)
		end

feature {NONE} -- Implementation

	yy_build_tables is
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

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 56 then
if yy_act <= 28 then
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_column := yy_column + 1
--|#line 37 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 37")
end

				last_break_end := 0
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			
else
yy_set_line_column
--|#line 42 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 42")
end

				last_text_count := 1
				last_break_end := text_count
				last_comment_end := 0
				process_one_char_symbol (text_item (1))
			
end
else
if yy_act = 3 then
yy_set_line_column
--|#line 48 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 48")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol (text_item (1))
			
else
yy_set_line_column
--|#line 54 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 54")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol ('-')
			
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
	yy_column := yy_column + 2
--|#line 60 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 60")
end

				last_break_end := 0
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			
else
yy_set_line_column
--|#line 65 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 65")
end

				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (text_item (1), text_item (2))
			
end
else
yy_set_line_column
--|#line 71 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 71")
end

				last_text_count := 2
				last_break_end := 0
				last_comment_end := text_count
				process_two_char_symbol (text_item (1), text_item (2))
			
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
	yy_end := yy_end - 1
	yy_column := yy_column + 4
--|#line 93 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 93")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_et_keyword_value := ast_factory.new_once_keyword (Current)
			
else
	yy_end := yy_end - 1
yy_set_line_column
--|#line 101 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 101")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				last_et_keyword_value := ast_factory.new_once_keyword (Current)
			
end
else
if yy_act = 10 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 110 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 110")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				last_et_keyword_value := ast_factory.new_once_keyword (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 123 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 123")
end

				last_break_end := 0
				last_comment_end := 0
				process_identifier (text_count)
			
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 128 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 128")
end

				last_text_count := text_count
				break_kind := identifier_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + 1
--|#line 143 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 143")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_free_operator_value := ast_factory.new_free_operator (Current)
			
end
else
	yy_column := yy_column + 2
--|#line 144 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 144")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_free_operator_value := ast_factory.new_free_operator (Current)
			
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 145 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 145")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_free_operator_value := ast_factory.new_free_operator (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 146 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 146")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_free_operator_value := ast_factory.new_free_operator (Current)
			
end
else
if yy_act = 17 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 147 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 147")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_free_operator_value := ast_factory.new_free_operator (Current)
			
else
	yy_end := yy_end - 1
	yy_column := yy_column + 1
--|#line 157 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 157")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
	yy_end := yy_end - 1
	yy_column := yy_column + 2
--|#line 158 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 158")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 159 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 159")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
end
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 160 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 160")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
end
end
else
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act = 22 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 161 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 161")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + 3
--|#line 173 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 173")
end

				last_break_end := 0
				last_comment_end := 0
				process_c1_character_constant (text_item (2))
			
end
else
if yy_act = 24 then
yy_set_line_column
--|#line 178 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 178")
end

				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (text_item (2))
			
else
yy_set_line_column
--|#line 184 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 184")
end

				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (text_item (2))
			
end
end
else
if yy_act <= 27 then
if yy_act = 26 then
	yy_column := yy_column + 4
--|#line 190 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 190")
end

				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
else
yy_set_line_column
--|#line 195 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 195")
end

				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
end
else
yy_set_line_column
--|#line 201 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 201")
end

				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			
end
end
end
end
else
if yy_act <= 42 then
if yy_act <= 35 then
if yy_act <= 32 then
if yy_act <= 30 then
if yy_act = 29 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 208 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 208")
end

				last_token := E_CHARACTER
				last_literal_start := 4
				last_literal_end := text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 216 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 216")
end

				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			
end
else
if yy_act = 31 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 225 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 225")
end

					-- Syntax error: invalid character code (too big)
					-- in special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAO_error (filename, current_position)
				last_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 235 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 235")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
end
end
else
if yy_act <= 34 then
if yy_act = 33 then
	yy_column := yy_column + 3
--|#line 245 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 245")
end

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			
else
	yy_column := yy_column + 2
--|#line 255 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 255")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 264 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 264")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
end
end
else
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act = 36 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 278 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 278")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 286 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 286")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
end
else
if yy_act = 38 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 295 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 295")
end

					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 301 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 301")
end

					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 309 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 309")
end

					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 317 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 317")
end

				verbatim_open_white_characters := text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
end
else
	yy_column := yy_column + 1
--|#line 323 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 323")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
end
end
else
if yy_act <= 49 then
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 341 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 341")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2), False, Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 356 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 356")
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
			
end
else
if yy_act = 45 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 368 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 368")
end

				more
				set_start_condition (VS3)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 372 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 372")
end

				more
				last_literal_end := text_count - 2
			
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 376 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 376")
end

				more
				last_literal_end := text_count - 1
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 380 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 380")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 398 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 398")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
end
end
else
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 403 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 403")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 408 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 408")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
else
if yy_act = 52 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 424 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 424")
end

					-- Left-aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 432 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 432")
end

				verbatim_open_white_characters := text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
	yy_column := yy_column + 1
--|#line 438 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 438")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 456 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 456")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					last_token := E_STRING
					last_break_end := 0
					last_comment_end := 0
					last_et_manifest_string_value := ast_factory.new_verbatim_string (verbatim_marker, verbatim_open_white_characters,
						text_substring (last_literal_end + 1, text_count - verbatim_marker.count - 2), True, Current)
					verbatim_marker := Void
					verbatim_open_white_characters := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 471 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 471")
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
			
end
end
end
end
end
else
if yy_act <= 84 then
if yy_act <= 70 then
if yy_act <= 63 then
if yy_act <= 60 then
if yy_act <= 58 then
if yy_act = 57 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 483 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 483")
end

				more
				set_start_condition (LAVS3)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 487 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 487")
end

				more
				last_literal_end := text_count - 2
			
end
else
if yy_act = 59 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 491 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 491")
end

				more
				last_literal_end := text_count - 1
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 495 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 495")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 62 then
if yy_act = 61 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 513 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 513")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 518 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 518")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 523 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 523")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 67 then
if yy_act <= 65 then
if yy_act = 64 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 539 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 539")
end

					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 548 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 548")
end

					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
end
else
if yy_act = 66 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 557 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 557")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 568 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 568")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
end
end
else
if yy_act <= 69 then
if yy_act = 68 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 573 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 573")
end

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 576 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 576")
end

					-- Syntax error: invalid character code (too big) in special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAO_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 589 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 589")
end

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAS_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
end
end
else
if yy_act <= 77 then
if yy_act <= 74 then
if yy_act <= 72 then
if yy_act = 71 then
	yy_column := yy_column + 2
--|#line 602 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 602")
end

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSAC_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + 2
--|#line 615 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 615")
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
			
end
else
if yy_act = 73 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 627 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 627")
end

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 630 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 630")
end

				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 76 then
if yy_act = 75 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 639 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 639")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + 2
--|#line 647 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 647")
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
			
end
else
	yy_column := yy_column + 1
--|#line 658 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 658")
end

					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSSC_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 81 then
if yy_act <= 79 then
if yy_act = 78 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 671 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 671")
end

					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNL_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 699 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 699")
end

				more
				set_start_condition (MS)
			
end
else
if yy_act = 80 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 703 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 703")
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
			
else
	yy_column := yy_column + 1
--|#line 714 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 714")
end

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 83 then
if yy_act = 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 745 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 745")
end

				last_token := E_BIT
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_bit_constant_value := ast_factory.new_bit_constant (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 753 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 753")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := bit_break
				more
				set_start_condition (BREAK)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 765 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 765")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			
end
end
end
end
else
if yy_act <= 98 then
if yy_act <= 91 then
if yy_act <= 88 then
if yy_act <= 86 then
if yy_act = 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 773 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 773")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 781 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 781")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
end
else
if yy_act = 87 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 789 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 789")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 797 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 797")
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
				last_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
end
end
else
if yy_act <= 90 then
if yy_act = 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 809 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 809")
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
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 821 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 821")
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
				last_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 833 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 833")
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
			
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 845 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 845")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 853 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 853")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
end
else
if yy_act = 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 865 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 865")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 866 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 866")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 867 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 867")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 875 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 875")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 876 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 876")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			
end
end
end
else
if yy_act <= 105 then
if yy_act <= 102 then
if yy_act <= 100 then
if yy_act = 99 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 877 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 877")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_regular_real_constant (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 888 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 888")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
end
else
if yy_act = 101 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 889 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 889")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 890 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 890")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
end
end
else
if yy_act <= 104 then
if yy_act = 103 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 898 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 898")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 899 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 899")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 900 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 900")
end

		-- The first regexp of this group uses a trailing context
		-- to make sure that an integer followed by two dots is
		-- not recognized as a real followed by a dot.
				last_token := E_REAL
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_et_real_constant_value := ast_factory.new_underscored_real_constant (Current)
			
end
end
else
if yy_act <= 109 then
if yy_act <= 107 then
if yy_act = 106 then
yy_set_line_column
--|#line 915 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 915")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			
else
yy_set_line_column
--|#line 925 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 925")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			
end
else
if yy_act = 108 then
yy_set_line_column
--|#line 936 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 936")
end

				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
else
yy_set_line_column
--|#line 942 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 942")
end

				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			
end
end
else
if yy_act <= 111 then
if yy_act = 110 then
	yy_column := yy_column + 1
--|#line 948 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 948")
end

					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + 1
--|#line 969 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 969")
end

				last_token := E_UNKNOWN
				last_et_position_value := current_position
			
end
else
yy_set_line_column
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 2 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSEQ_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 3 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				last_et_position_value := current_position
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 4 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 7 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 8 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 9 then
--|#line 0 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 0")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				last_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 2698)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   22,   23,   24,   23,   25,   26,   27,   22,   28,
			   29,   25,   25,   25,   30,   31,   32,   33,   34,   35,
			   35,   35,   35,   36,   37,   25,   38,   39,   40,   40,
			   40,   40,   40,   40,   40,   41,   40,   25,   42,   25,
			   43,   40,   40,   40,   40,   40,   25,   25,   45,   46,
			   45,   45,   46,   45,   49,   66,   67,   50,  358,   51,
			   47,   49,  356,   47,   50,  353,   51,   53,   54,   53,
			   53,   54,   53,   55,   66,   67,   55,   57,   58,   57,
			   57,   58,   57,   60,   61,   62,  357,   63,   60,   61,
			   62,  189,   63,   69,   70,   69,   69,   70,   69,   72,

			   73,   74,  190,   75,   72,   73,   74,  172,   75,   78,
			   79,   78,   79,   80,   80,   80,  112,   80,   80,   80,
			   82,   82,   82,  356,   96,   81,   97,  112,   64,   81,
			  146,  147,   83,   64,  148,  147,   76,   85,   86,   87,
			   86,   76,   91,   91,   91,   94,   94,   94,   98,   98,
			   98,  355,   92,   92,   92,  162,  163,  106,  106,  329,
			   99,   82,   82,   82,  120,  120,  121,  121,   88,  361,
			  164,  163,  100,   83,  208,  100,  361,   89,   82,   82,
			   82,  120,  361,  121,  100,  209,  130,  131,  130,  119,
			   83,  100,  132,  101,  101,  101,  101,  101,  101,  102,

			  102,  102,  114,  114,  114,  114,  114,  114,   82,   82,
			   82,  103,  104,  310,  105,  105,  106,  106,  106,  106,
			   83,  220,   82,   82,   82,  115,  107,  340,   82,   82,
			   82,  100,  221,  108,   83,  136,  137,  109,  138,  107,
			   83,   82,   82,   82,  100,  100,  110,  110,  110,  146,
			  147,  100,  100,   83,  110,  110,  110,  305,  111,  116,
			  116,  116,  136,  143,  100,  144,  111,  116,  116,  116,
			  334,  117,  122,  122,  122,  133,  134,  133,  189,  117,
			  149,  150,  149,  224,  123,  225,  113,  152,  153,  190,
			  154,  152,  159,  297,  160,  148,  147,  113,  124,  125,

			  126,  125,  124,  127,  124,  127,  124,  127,  127,  124,
			  124,  124,  124,  128,  124,  124,  124,  124,  124,  124,
			  124,  127,  124,  127,  124,  127,  127,  127,  124,  124,
			  127,  127,  124,  124,  124,  124,  124,  124,  129,  129,
			  129,  129,  129,  124,  124,  139,  136,  140,  291,  138,
			  139,  142,  140,  324,  138,  155,  152,  156,  323,  154,
			  155,  158,  156,  269,  154,   80,   80,   80,   82,   82,
			   82,   85,  254,   87,  166,  166,  166,   81,  252,   84,
			   83,   84,  120,  168,  121,   87,  167,  177,  178,  177,
			  141,   85,  157,   87,  278,  141,  361,  157,  181,  181,

			  181,  173,   88,  183,  183,  183,  179,  180,  179,  271,
			   85,   89,   87,  222,  169,   94,   94,   94,  187,  187,
			  187,  218,   88,  170,  172,  216,  173,  175,  173,  173,
			  188,   89,  136,  137,  174,  138,  176,  191,  191,  191,
			  202,   88,  173,  247,  173,  193,  173,  173,  173,  192,
			   89,  173,  173,  162,  163,  175,  202,  202,  202,  211,
			  126,  211,  164,  163,  176,  193,  193,  193,  203,  205,
			  205,  205,  205,  205,  205,  206,  243,  194,  242,  112,
			  101,  101,  101,  101,  101,  101,  142,  137,  206,  138,
			  112,  237,  109,  166,  195,  114,  114,  114,  114,  114,

			  114,  244,  244,  196,  198,  198,  198,  114,  114,  114,
			  114,  114,  114,  116,  116,  116,  199,  122,  207,  200,
			  200,  200,  200,  200,  200,  117,  122,  122,  122,  210,
			  115,  250,  250,  201,  133,  134,  133,  118,  123,  212,
			  213,  214,  215,  215,  215,  130,  131,  130,  139,  136,
			  140,  132,  138,  139,  142,  140,  110,  138,  136,  143,
			  361,  144,  142,  143,  102,  144,  216,  216,  216,  149,
			  150,  149,  152,  153,  184,  154,  158,  153,  217,  154,
			  155,  152,  156,  186,  154,  155,  158,  156,  184,  154,
			  165,  152,  159,  141,  160,  208,  158,  159,  141,  160,

			  218,  218,  218,  222,  222,  222,  209,  177,  178,  177,
			   99,  168,  219,   87,  118,  223,  224,  157,   87,  179,
			  180,  179,  157,  168,  100,   87,  232,  178,  232,  220,
			  361,  234,  234,  234,  235,  235,  235,  233,  180,  233,
			  221,  361,  169,  187,  187,  187,  236,  226,  189,  189,
			  189,  170,  294,  294,  169,  188,  227,  286,  361,  258,
			   81,  175,  112,  170,  361,  177,  178,  177,  287,   85,
			  176,   87,  175,  112,  288,  228,  229,  230,  231,  231,
			  231,  176,  179,  180,  179,  289,   85,  361,   87,  191,
			  191,  191,  211,  126,  211,  175,  252,  252,  252,  361,

			   88,  192,  361,  237,  176,  321,  327,  327,  253,   89,
			  238,  239,  240,  241,  241,  241,  322,   88,  246,  246,
			  246,  246,  246,  246,  335,  335,   89,  259,  259,  259,
			  259,  259,  259,  208,  208,  208,  220,  220,  220,  361,
			  286,  196,  193,  193,  193,  117,  351,  351,   83,  173,
			  207,  287,  361,  361,  194,  361,  361,  200,  200,  200,
			  200,  200,  200,  260,  261,  262,  263,  263,  263,  361,
			  175,  248,  264,  212,  213,  214,  215,  215,  215,  176,
			  249,  254,  254,  254,  264,  265,  265,  265,  265,  265,
			  265,  361,  361,  255,  256,  361,  205,  205,  205,  205,

			  205,  205,  264,  266,  266,  266,  266,  267,  268,  264,
			  268,  268,  268,  268,  268,  268,  269,  269,  269,  257,
			  272,  178,  272,  361,  224,  361,   87,  361,  270,  361,
			  273,  180,  273,  361,  224,  361,   87,  173,  274,  274,
			  274,  274,  274,  274,  173,  275,  275,  275,  275,  276,
			  277,  235,  235,  235,  361,  226,  173,  277,  277,  277,
			  277,  277,  277,  236,  227,  226,  232,  178,  232,  361,
			  361,  233,  180,  233,  227,  361,  279,  279,  279,  281,
			  238,  239,  240,  241,  241,  241,  361,  361,  280,  281,
			  282,  282,  282,  282,  282,  282,  307,  307,  307,  361,

			  308,  175,  279,  279,  279,  361,  175,  361,  309,  361,
			  176,  348,  348,  348,  280,  176,  281,  283,  283,  283,
			  283,  284,  285,  281,  285,  285,  285,  285,  285,  285,
			  245,  245,  245,  245,  245,  245,  193,  193,  193,  296,
			  296,  296,  296,  296,  296,  286,  286,  286,  194,  361,
			  288,  245,  245,  245,  245,  245,  245,  188,  288,  288,
			  288,  289,  249,  251,  251,  251,  251,  251,  251,  361,
			  192,  361,  361,  361,  290,  291,  291,  291,  119,  260,
			  261,  262,  263,  263,  263,  361,  361,  292,  361,  361,
			  246,  246,  246,  246,  246,  246,  119,  312,  312,  312, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  312,  312,  312,  361,  293,  119,  313,  313,  313,  313,
			  314,  315,  361,  196,  297,  297,  297,  119,  315,  315,
			  315,  315,  315,  315,  361,  361,  298,  361,  361,  251,
			  251,  251,  251,  251,  251,  264,  268,  268,  268,  268,
			  268,  268,  264,  268,  268,  268,  268,  268,  268,  361,
			  361,  361,  299,  301,  301,  301,  264,  268,  268,  268,
			  268,  268,  316,  361,  361,  302,  361,  361,  303,  303,
			  303,  303,  303,  303,  264,  316,  316,  316,  316,  316,
			  316,  361,  304,  305,  305,  305,  317,  318,  319,  320,
			  320,  320,  337,  337,  337,  306,  338,  361,  205,  205,

			  205,  205,  205,  205,  339,  361,  361,  361,  272,  178,
			  272,  361,  224,  361,   87,  295,  295,  295,  295,  295,
			  295,  257,  310,  310,  310,  321,  273,  180,  273,  361,
			  224,  361,   87,  361,  311,  361,  322,  259,  259,  259,
			  259,  259,  259,  226,  173,  277,  277,  277,  277,  277,
			  277,  361,  227,  173,  277,  277,  277,  277,  277,  277,
			  207,  226,  173,  277,  277,  277,  277,  277,  171,  361,
			  227,  281,  285,  285,  285,  285,  285,  285,  281,  285,
			  285,  285,  285,  285,  285,  281,  285,  285,  285,  285,
			  285,  325,  281,  325,  325,  325,  325,  325,  325,  326,

			  326,  326,  326,  326,  326,  333,  333,  333,  333,  333,
			  333,  303,  303,  303,  303,  303,  303,  361,  361,  361,
			  361,  361,  290,  329,  329,  329,  346,  361,  299,  119,
			  315,  315,  315,  315,  315,  330,  361,  347,  295,  295,
			  295,  295,  295,  295,  119,  315,  315,  315,  315,  315,
			  315,  119,  315,  315,  315,  315,  315,  315,  361,  361,
			  361,  331,  291,  291,  291,  341,  316,  316,  316,  316,
			  316,  316,  361,  361,  292,  361,  361,  296,  296,  296,
			  296,  296,  296,  172,  317,  318,  319,  320,  320,  320,
			  361,  332,  172,  342,  342,  342,  342,  342,  342,  361,

			  249,  172,  343,  343,  343,  343,  344,  345,  172,  345,
			  345,  345,  345,  345,  345,  321,  321,  321,  349,  325,
			  325,  325,  325,  325,  325,  361,  346,  236,  291,  291,
			  291,  328,  328,  328,  328,  328,  328,  347,  361,  361,
			  292,  361,  361,  326,  326,  326,  326,  326,  326,  350,
			  350,  350,  350,  350,  350,  336,  336,  336,  336,  336,
			  336,  337,  337,  337,  361,  338,  290,  291,  291,  291,
			  361,  361,  331,  339,  361,  361,  361,  361,  361,  292,
			  361,  361,  328,  328,  328,  328,  328,  328,  172,  345,
			  345,  345,  345,  345,  345,  172,  345,  345,  345,  345,

			  345,  345,  361,  361,  361,  290,  353,  353,  353,  172,
			  345,  345,  345,  345,  345,  346,  346,  346,  354,  361,
			  361,  333,  333,  333,  333,  333,  333,  280,  352,  352,
			  352,  352,  352,  352,  361,  361,  356,  356,  356,  361,
			  360,  361,  361,  361,  299,  353,  353,  353,  339,  245,
			  245,  361,  245,  245,  245,  361,  361,  354,  361,  361,
			  336,  336,  336,  336,  336,  336,  204,  204,  204,  361,
			  361,  204,  204,  204,  204,  251,  251,  361,  251,  251,
			  251,  361,  361,  299,  358,  358,  358,  295,  295,  361,
			  295,  295,  295,  361,  361,  361,  359,  361,  361,  350,

			  350,  350,  350,  350,  350,  328,  328,  361,  328,  328,
			  328,  336,  336,  361,  336,  336,  336,  361,  361,  361,
			  361,  361,  331,  358,  358,  358,  352,  352,  361,  352,
			  352,  352,  361,  361,  361,  359,  361,  361,  352,  352,
			  352,  352,  352,  352,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  331,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,

			   48,   48,   48,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   48,   48,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,

			   59,   59,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,

			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   84,   84,  361,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   90,   90,   90,   90,  361,  361,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   93,   93,   93,   93,  361,  361,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   95,   95,

			  361,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,  112,  112,  112,  361,
			  361,  361,  361,  361,  112,  361,  112,  112,  112,  361,
			  361,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  119,  119,  361,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  135,  135,  135,  135,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  135, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  135,  135,  135,  135,  135,  135,  135,  135,  135,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  157,  157,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,   86,
			   86,  361,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  171,  171,  361,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  171,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  171,

			  171,  171,  171,  171,  171,  182,  182,  182,  182,  361,
			  361,  182,  182,  182,  182,  182,  361,  361,  361,  182,
			  182,  185,  185,  361,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  361,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,

			  197,  197,  197,  197,  197,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  119,  119,  119,  119,  361,  361,  361,
			  361,  361,  361,  119,  119,  119,  119,  119,  361,  361,
			  119,  119,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  165,  165,  165,  165,  165,  165,  165,  165,  165,  165,
			  172,  172,  361,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  172,  172,  172,  172,  172,  172,

			  172,  172,  172,  172,  172,  172,  172,  172,  173,  173,
			  361,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  182,  182,  182,  182,
			  361,  361,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  172,  172,  172,  172,  361,  361,
			  361,  361,  361,  361,  172,  172,  172,  172,  172,  361,
			  361,  172,  172,  242,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,

			  242,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  242,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  300,
			  300,  300,  300,  300,  300,  300,  300,  300,  300,  361,
			  300,  300,  300,  300,  300,  300,  300,  300,  300,  300,
			  300,  300,  300,  300,  300,  300,  300,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  323,  323,  323,  323,  323,

			  323,  323,  323,  323,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  323,  323,  323,  323,  323,  323,  323,
			  323,  323,  323,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,   21,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>,
			1, 699, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 2698)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    3,    3,
			    3,    4,    4,    4,    5,   13,   13,    5,  359,    5,
			    3,    6,  355,    4,    6,  354,    6,    7,    7,    7,
			    8,    8,    8,    7,   14,   14,    8,    9,    9,    9,
			   10,   10,   10,   11,   11,   11,  349,   11,   12,   12,
			   12,   99,   12,   15,   15,   15,   16,   16,   16,   17,

			   17,   17,   99,   17,   18,   18,   18,  345,   18,   19,
			   19,   20,   20,   23,   23,   23,  112,   24,   24,   24,
			   25,   25,   25,  340,   29,   23,   29,  112,   11,   24,
			   65,   65,   25,   12,   67,   67,   17,   26,   26,   26,
			   26,   18,   27,   27,   27,   28,   28,   28,   30,   30,
			   30,  339,   27,   27,   27,   77,   77,   35,   35,  330,
			   30,   32,   32,   32,   48,  119,   48,  119,   26,   35,
			   79,   79,   30,   32,  118,   32,   35,   26,   31,   31,
			   31,  127,   35,  127,   32,  118,   53,   53,   53,  315,
			   31,   31,   53,   31,   31,   31,   31,   31,   31,   33,

			   33,   33,   43,   43,   43,   43,   43,   43,   36,   36,
			   36,   33,   33,  311,   33,   33,   33,   33,   33,   33,
			   36,  165,   37,   37,   37,   43,   33,  309,   38,   38,
			   38,   36,  165,   33,   37,   59,   59,   33,   59,   33,
			   38,   39,   39,   39,   37,   37,   40,   40,   40,  145,
			  145,   38,   38,   39,   41,   41,   41,  306,   40,   45,
			   45,   45,   64,   64,   39,   64,   41,   46,   46,   46,
			  302,   45,   50,   50,   50,   57,   57,   57,  190,   46,
			   69,   69,   69,  172,   50,  172,   41,   71,   71,  190,
			   71,   76,   76,  298,   76,  147,  147,   41,   51,   51,

			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   60,   60,   60,  292,   60,
			   62,   62,   62,  281,   62,   72,   72,   72,  280,   72,
			   74,   74,   74,  270,   74,   80,   80,   80,   82,   82,
			   82,   84,  255,   84,   85,   85,   85,   80,  253,   86,
			   82,   86,  264,   86,  264,   86,   85,   88,   88,   88,
			   60,   88,   72,   88,  236,   62,  171,   74,   90,   90,

			   90,  228,   84,   92,   92,   92,   89,   89,   89,  225,
			   89,   84,   89,  223,   86,   93,   93,   93,   98,   98,
			   98,  219,   88,   86,   87,  217,   87,  171,   87,   87,
			   98,   88,  135,  135,   87,  135,  171,  100,  100,  100,
			  203,   89,   87,  199,   87,  194,   87,   87,   87,  100,
			   89,   87,   87,  161,  161,   87,  107,  107,  107,  125,
			  125,  125,  163,  163,   87,  101,  101,  101,  107,  109,
			  109,  109,  109,  109,  109,  113,  192,  101,  188,  113,
			  101,  101,  101,  101,  101,  101,  137,  137,  113,  137,
			  113,  185,  109,  167,  101,  114,  114,  114,  114,  114,

			  114,  195,  195,  101,  104,  104,  104,  115,  115,  115,
			  115,  115,  115,  116,  116,  116,  104,  123,  114,  104,
			  104,  104,  104,  104,  104,  116,  120,  120,  120,  121,
			  115,  201,  201,  104,  133,  133,  133,  117,  120,  128,
			  128,  128,  128,  128,  128,  130,  130,  130,  139,  139,
			  139,  130,  139,  140,  140,  140,  111,  140,  141,  141,
			  105,  141,  143,  143,  103,  143,  144,  144,  144,  149,
			  149,  149,  151,  151,   97,  151,  153,  153,  144,  153,
			  155,  155,  155,   96,  155,  156,  156,  156,   95,  156,
			   83,  157,  157,  139,  157,  209,  159,  159,  140,  159,

			  160,  160,  160,  168,  168,  168,  209,  169,  169,  169,
			   81,  169,  160,  169,   47,  168,  173,  155,  173,  170,
			  170,  170,  156,  170,   42,  170,  175,  175,  175,  221,
			  175,  182,  182,  182,  184,  184,  184,  176,  176,  176,
			  221,  176,  169,  187,  187,  187,  184,  173,  189,  189,
			  189,  169,  248,  248,  170,  187,  173,  242,   34,  206,
			  189,  175,  206,  170,  174,  177,  177,  177,  242,  177,
			  175,  177,  176,  206,  243,  174,  174,  174,  174,  174,
			  174,  176,  179,  179,  179,  243,  179,   21,  179,  191,
			  191,  191,  211,  211,  211,  174,  204,  204,  204,    0,

			  177,  191,    0,  186,  174,  278,  293,  293,  204,  177,
			  186,  186,  186,  186,  186,  186,  278,  179,  196,  196,
			  196,  196,  196,  196,  304,  304,  179,  207,  207,  207,
			  207,  207,  207,  208,  208,  208,  220,  220,  220,  277,
			  287,  196,  200,  200,  200,  208,  332,  332,  220,  277,
			  207,  287,    0,    0,  200,    0,    0,  200,  200,  200,
			  200,  200,  200,  210,  210,  210,  210,  210,  210,    0,
			  277,  200,  212,  212,  212,  212,  212,  212,  212,  277,
			  200,  205,  205,  205,  213,  213,  213,  213,  213,  213,
			  213,    0,    0,  205,  205,    0,  205,  205,  205,  205,

			  205,  205,  214,  214,  214,  214,  214,  214,  214,  215,
			  215,  215,  215,  215,  215,  215,  224,  224,  224,  205,
			  226,  226,  226,    0,  226,    0,  226,    0,  224,    0,
			  227,  227,  227,    0,  227,    0,  227,  229,  229,  229,
			  229,  229,  229,  229,  230,  230,  230,  230,  230,  230,
			  230,  235,  235,  235,    0,  226,  231,  231,  231,  231,
			  231,  231,  231,  235,  226,  227,  232,  232,  232,    0,
			  232,  233,  233,  233,  227,  233,  237,  237,  237,  238,
			  238,  238,  238,  238,  238,  238,    0,    0,  237,  239,
			  239,  239,  239,  239,  239,  239,  258,  258,  258,    0,

			  258,  232,  279,  279,  279,    0,  233,    0,  258,    0,
			  232,  324,  324,  324,  279,  233,  240,  240,  240,  240,
			  240,  240,  240,  241,  241,  241,  241,  241,  241,  241,
			  244,  244,  244,  244,  244,  244,  245,  245,  245,  249,
			  249,  249,  249,  249,  249,  286,  286,  286,  245,    0,
			  289,  245,  245,  245,  245,  245,  245,  286,  288,  288,
			  288,  289,  249,  250,  250,  250,  250,  250,  250,    0,
			  288,    0,    0,    0,  245,  246,  246,  246,  260,  260,
			  260,  260,  260,  260,  260,    0,    0,  246,    0,    0,
			  246,  246,  246,  246,  246,  246,  261,  261,  261,  261, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  261,  261,  261,    0,  246,  262,  262,  262,  262,  262,
			  262,  262,    0,  246,  251,  251,  251,  263,  263,  263,
			  263,  263,  263,  263,    0,    0,  251,    0,    0,  251,
			  251,  251,  251,  251,  251,  265,  265,  265,  265,  265,
			  265,  265,  266,  266,  266,  266,  266,  266,  266,    0,
			    0,    0,  251,  256,  256,  256,  267,  267,  267,  267,
			  267,  267,  267,    0,    0,  256,    0,    0,  256,  256,
			  256,  256,  256,  256,  268,  268,  268,  268,  268,  268,
			  268,    0,  256,  257,  257,  257,  271,  271,  271,  271,
			  271,  271,  307,  307,  307,  257,  307,    0,  257,  257,

			  257,  257,  257,  257,  307,    0,    0,    0,  272,  272,
			  272,    0,  272,    0,  272,  294,  294,  294,  294,  294,
			  294,  257,  259,  259,  259,  322,  273,  273,  273,    0,
			  273,    0,  273,    0,  259,    0,  322,  259,  259,  259,
			  259,  259,  259,  272,  274,  274,  274,  274,  274,  274,
			  274,    0,  272,  275,  275,  275,  275,  275,  275,  275,
			  259,  273,  276,  276,  276,  276,  276,  276,  276,    0,
			  273,  282,  282,  282,  282,  282,  282,  282,  283,  283,
			  283,  283,  283,  283,  283,  284,  284,  284,  284,  284,
			  284,  284,  285,  285,  285,  285,  285,  285,  285,  290,

			  290,  290,  290,  290,  290,  299,  299,  299,  299,  299,
			  299,  303,  303,  303,  303,  303,  303,    0,    0,    0,
			    0,    0,  290,  295,  295,  295,  323,    0,  299,  314,
			  314,  314,  314,  314,  314,  295,    0,  323,  295,  295,
			  295,  295,  295,  295,  312,  312,  312,  312,  312,  312,
			  312,  313,  313,  313,  313,  313,  313,  313,    0,    0,
			    0,  295,  296,  296,  296,  316,  316,  316,  316,  316,
			  316,  316,    0,    0,  296,    0,    0,  296,  296,  296,
			  296,  296,  296,  317,  317,  317,  317,  317,  317,  317,
			    0,  296,  318,  318,  318,  318,  318,  318,  318,    0,

			  296,  319,  319,  319,  319,  319,  319,  319,  320,  320,
			  320,  320,  320,  320,  320,  321,  321,  321,  325,  325,
			  325,  325,  325,  325,  325,    0,  347,  321,  326,  326,
			  326,  327,  327,  327,  327,  327,  327,  347,    0,    0,
			  326,    0,    0,  326,  326,  326,  326,  326,  326,  331,
			  331,  331,  331,  331,  331,  335,  335,  335,  335,  335,
			  335,  337,  337,  337,    0,  337,  326,  328,  328,  328,
			    0,    0,  331,  337,    0,    0,    0,    0,    0,  328,
			    0,    0,  328,  328,  328,  328,  328,  328,  342,  342,
			  342,  342,  342,  342,  342,  343,  343,  343,  343,  343,

			  343,  343,    0,    0,    0,  328,  333,  333,  333,  344,
			  344,  344,  344,  344,  344,  346,  346,  346,  333,    0,
			    0,  333,  333,  333,  333,  333,  333,  346,  351,  351,
			  351,  351,  351,  351,    0,    0,  356,  356,  356,    0,
			  356,    0,    0,    0,  333,  336,  336,  336,  356,  396,
			  396,    0,  396,  396,  396,    0,    0,  336,    0,    0,
			  336,  336,  336,  336,  336,  336,  389,  389,  389,    0,
			    0,  389,  389,  389,  389,  397,  397,    0,  397,  397,
			  397,    0,    0,  336,  350,  350,  350,  401,  401,    0,
			  401,  401,  401,    0,    0,    0,  350,    0,    0,  350,

			  350,  350,  350,  350,  350,  404,  404,    0,  404,  404,
			  404,  405,  405,    0,  405,  405,  405,    0,    0,    0,
			    0,    0,  350,  352,  352,  352,  407,  407,    0,  407,
			  407,  407,    0,    0,    0,  352,    0,    0,  352,  352,
			  352,  352,  352,  352,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  352,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  362,  362,  362,  362,  362,  362,  362,  362,  362,  362,
			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,

			  363,  363,  363,  363,  363,  363,  363,  363,  363,  363,
			  363,  363,  363,  363,  363,  363,  363,  363,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  364,  364,  364,  364,
			  364,  364,  364,  364,  364,  364,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  365,  365,  365,  365,  365,  365,
			  365,  365,  365,  365,  366,  366,  366,  366,  366,  366,
			  366,  366,  366,  366,  366,  366,  366,  366,  366,  366,
			  366,  366,  366,  366,  366,  366,  366,  366,  366,  366,

			  366,  366,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  368,  368,
			  368,  368,  368,  368,  368,  368,  368,  368,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  369,  369,  369,  369,
			  369,  369,  369,  369,  369,  369,  370,  370,  370,  370,
			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,

			  370,  370,  370,  370,  370,  370,  370,  370,  370,  370,
			  370,  370,  370,  370,  371,  371,    0,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  372,  372,  372,  372,    0,    0,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  372,  372,  372,  372,  372,  372,  372,  372,  372,  372,
			  373,  373,  373,  373,    0,    0,  373,  373,  373,  373,
			  373,  373,  373,  373,  373,  373,  373,  373,  373,  373,
			  373,  373,  373,  373,  373,  373,  373,  373,  374,  374,

			    0,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  374,  374,  374,  374,
			  374,  374,  374,  374,  374,  374,  375,  375,  375,    0,
			    0,    0,    0,    0,  375,    0,  375,  375,  375,    0,
			    0,  375,  375,  375,  375,  375,  375,  375,  375,  375,
			  375,  375,  375,  376,  376,    0,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  376,  376,
			  376,  376,  376,  376,  376,  376,  376,  376,  376,  376,
			  376,  377,  377,  377,  377,  377,  377,  377,  377,  377,
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  377, yy_Dummy>>,
			1, 1000, 1000)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  377,  377,  377,  377,  377,  377,  377,  377,  377,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  381,  381,  381,  381,  381,  381,  381,

			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  383,
			  383,    0,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  384,  384,    0,
			  384,  384,  384,  384,  384,  384,  384,  384,  384,  384,
			  384,  384,  384,  384,  384,  384,  384,  384,  384,  384,

			  384,  384,  384,  384,  384,  385,  385,  385,  385,    0,
			    0,  385,  385,  385,  385,  385,    0,    0,    0,  385,
			  385,  386,  386,    0,  386,  386,  386,  386,  386,  386,
			  386,  386,  386,  386,  386,  386,  386,  386,  386,  386,
			  386,  386,  386,  386,  386,  386,  386,  386,  386,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,    0,  388,  388,
			  388,  388,  388,  388,  388,  388,  388,  388,  388,  388,

			  388,  388,  388,  388,  388,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  391,  391,  391,  391,    0,    0,    0,
			    0,    0,    0,  391,  391,  391,  391,  391,    0,    0,
			  391,  391,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  393,  393,    0,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,

			  393,  393,  393,  393,  393,  393,  393,  393,  394,  394,
			    0,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  395,  395,  395,  395,
			    0,    0,  395,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  398,  398,  398,  398,    0,    0,
			    0,    0,    0,    0,  398,  398,  398,  398,  398,    0,
			    0,  398,  398,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,

			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,    0,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  403,  403,  403,
			  403,  403,  403,  403,  403,  403,  403,  403,  403,  403,
			  403,  403,  403,  403,  403,  403,  403,  403,  403,  403,
			  403,  403,  403,  403,  403,  406,  406,  406,  406,  406,

			  406,  406,  406,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  406,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  406,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  408,  408,  408,
			  408,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>,
			1, 699, 2000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   46,   49,   51,   58,   65,   68,   75,
			   78,   81,   86,   52,   71,   91,   94,   97,  102,  106,
			  108,  687, 2651,  111,  115,  118,  131,  140,  143,  116,
			  146,  176,  159,  197,  622,  140,  206,  220,  226,  239,
			  244,  252,  586,  185, 2651,  257,  265,  600,  158, 2651,
			  270,  297, 2651,  184, 2651, 2651, 2651,  273, 2651,  232,
			  343, 2651,  348, 2651,  259,  127, 2651,  131, 2651,  278,
			 2651,  284,  353, 2651,  358, 2651,  288,  152, 2651,  167,
			  363,  596,  366,  576,  365,  372,  377,  418,  385,  404,
			  396, 2651,  401,  413, 2651,  578,  567,  564,  416,   88,

			  435,  463, 2651,  550,  502,  524,    0,  454,    0,  452,
			 2651,  542,   82,  445,  478,  490,  511,  523,  171,  159,
			  524,  513, 2651,  503, 2651,  457, 2651,  175,  522, 2651,
			  543, 2651, 2651,  532, 2651,  429, 2651,  483, 2651,  546,
			  551,  555, 2651,  559,  564,  246, 2651,  292, 2651,  567,
			 2651,  569, 2651,  573, 2651,  578,  583,  588, 2651,  593,
			  598,  450, 2651,  459, 2651,  218, 2651,  479,  601,  605,
			  617,  390,  277,  610,  658,  624,  635,  663, 2651,  680,
			 2651, 2651,  629, 2651,  632,  481,  693,  641,  464,  646,
			  275,  687,  462, 2651,  431,  488,  701, 2651, 2651,  429,

			  740,  518, 2651,  426,  694,  779,  628,  710,  731,  592,
			  746,  690,  756,  768,  786,  793, 2651,  411, 2651,  407,
			  734,  626, 2651,  399,  814,  393,  818,  828,  385,  821,
			  828,  840,  864,  869, 2651,  849,  380,  874,  863,  873,
			  900,  907,  654,  671,  913,  934,  973, 2651,  639,  922,
			  946, 1012, 2651,  364, 2651,  358, 1051, 1081,  894, 1120,
			  962,  980,  989, 1001,  376, 1019, 1026, 1040, 1058, 2651,
			  349, 1069, 1106, 1124, 1128, 1137, 1146,  733,  702,  900,
			  344,  343, 1155, 1162, 1169, 1176,  943,  737,  956,  947,
			 1182, 2651,  334,  693, 1098, 1221, 1260, 2651,  279, 1188,

			 2651, 2651,  256, 1194,  711, 2651,  243, 1090, 2651,  213,
			 2651,  199, 1228, 1235, 1213,  173, 1249, 1267, 1276, 1285,
			 1292, 1313, 1122, 1223,  909, 1302, 1326, 1314, 1365, 2651,
			  145, 1332,  733, 1404, 2651, 1338, 1443, 1359, 2651,  137,
			  120, 2651, 1372, 1379, 1393,   91, 1413, 1323, 2651,   76,
			 1482, 1411, 1521, 2651,   51,   59, 1434, 2651, 2651,   44,
			 2651, 2651, 1561, 1589, 1617, 1645, 1673, 1701, 1729, 1757,
			 1785, 1813, 1841, 1869, 1897, 1924, 1952, 1980, 2008, 2036,
			 2064, 2092, 2120, 2148, 2176, 2204, 2220, 2248, 2276, 1454,
			 2304, 2328, 2351, 2379, 2407, 2435, 1440, 1466, 2459, 2482,

			 2510, 1478, 2538, 2566, 1496, 1502, 2594, 1517, 2622, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  361,    1,  362,  362,  363,  363,  364,  364,  365,
			  365,  366,  366,  367,  367,  368,  368,  369,  369,  370,
			  370,  361,  361,  361,  361,  361,  371,  372,  373,  374,
			  361,  361,  361,  361,   33,   33,  361,  361,  361,  361,
			  375,  375,  361,  361,  361,  361,  361,  361,  376,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  377,
			  377,  361,  377,  361,  378,  379,  361,  379,  361,  361,
			  361,  380,  380,  361,  380,  361,  381,  382,  361,  382,
			  361,  361,  361,  361,  371,  361,  383,  384,  371,  371,
			  372,  361,  385,  373,  361,  361,  386,  361,  361,  387,

			  361,  361,  361,  361,  388,   33,   35,  361,  389,  361,
			  361,  361,   41,   41,  361,  361,  361,  361,  390,  376,
			  361,  391,  361,  361,  361,  361,  361,  376,  361,  361,
			  361,  361,  361,  361,  361,  377,  361,  377,  361,  377,
			  377,  378,  361,  378,  361,  379,  361,  379,  361,  361,
			  361,  380,  361,  380,  361,  380,  380,  381,  361,  381,
			  361,  382,  361,  382,  361,  392,  361,  361,  361,  383,
			  383,  384,  393,  394,  384,  384,  384,  371,  361,  371,
			  361,  361,  395,  361,  361,  361,  361,  361,  361,  361,
			  387,  361,  361,  361,  361,  396,  361,  361,  361,  361,

			  361,  397,  361,  361,  389,  361,   41,  361,  361,  390,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  392,  361,  361,  361,  398,  394,  394,  174,  174,
			  174,  174,  384,  384,  361,  361,  361,  361,  361,  361,
			  361,  361,  399,  400,  361,  361,  361,  361,  401,  361,
			  361,  361,  361,  361,  361,  361,  402,  361,  375,  361,
			  361,  361,  361,  361,  376,  361,  361,  361,  361,  361,
			  361,  361,  394,  394,  174,  174,  174,  384,  403,  361,
			  361,  361,  361,  361,  361,  361,  361,  399,  361,  400,
			  361,  361,  361,  404,  361,  361,  361,  361,  361,  361,

			  361,  361,  361,  296,  405,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  403,  406,  361,  361,  361,  361,  361,  361,
			  361,  361,  407,  361,  361,  361,  361,  361,  361,  361,
			  408,  361,  361,  361,  361,  361,  361,  406,  361,  361,
			  361,  361,  361,  361,  361,  408,  361,  361,  361,  361,
			  361,    0,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,
			  361,  361,  361,  361,  361,  361,  361,  361,  361,  361,

			  361,  361,  361,  361,  361,  361,  361,  361,  361, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    6,    7,    5,    8,    9,   10,
			   11,   11,   12,   13,    5,   14,   15,   16,   17,   18,
			   19,   20,   20,   21,   22,   22,   22,   22,   23,    5,
			   24,   25,   26,   27,    9,   28,   29,   30,   28,   31,
			   28,   32,   33,   32,   32,   32,   33,   32,   34,   35,
			   32,   33,   33,   33,   33,   33,   33,   32,   36,   32,
			   32,   37,   38,   39,    5,   40,    1,   41,   42,   43,

			   41,   31,   41,   32,   44,   32,   32,   32,   44,   32,
			   45,   35,   32,   44,   44,   44,   44,   44,   44,   32,
			   36,   32,   32,   46,    9,   47,    5,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    1,    5,    1,    6,    1,
			    7,    8,    1,    9,   10,   11,    7,   12,   12,   12,
			   12,   13,   14,    1,   15,    1,   16,    1,   17,   18,
			   19,   20,   21,   22,   23,   24,   25,    1,    1,    1,
			   26,   20,   20,   20,   27,   28,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    4,    5,    5,    5,    6,    7,
			    8,    9,   10,   12,   16,   19,   22,   25,   28,   31,
			   34,   37,   40,   43,   47,   51,   55,   58,   61,   64,
			   67,   71,   75,   77,   79,   81,   85,   88,   90,   92,
			   94,   97,   99,  101,  103,  105,  108,  110,  112,  114,
			  116,  118,  120,  122,  124,  126,  128,  130,  132,  134,
			  136,  138,  140,  142,  144,  146,  148,  150,  152,  154,
			  156,  158,  158,  160,  160,  161,  165,  166,  166,  168,
			  170,  171,  172,  173,  174,  175,  176,  177,  179,  180,

			  181,  182,  186,  187,  187,  188,  190,  192,  194,  194,
			  194,  195,  195,  197,  199,  199,  199,  201,  201,  202,
			  203,  205,  205,  206,  206,  207,  208,  209,  211,  213,
			  215,  215,  216,  217,  217,  218,  219,  220,  221,  222,
			  223,  224,  225,  227,  228,  231,  232,  233,  234,  236,
			  236,  237,  238,  239,  240,  241,  242,  243,  244,  246,
			  247,  250,  251,  252,  253,  255,  256,  258,  258,  264,
			  266,  268,  268,  269,  270,  270,  271,  272,  273,  274,
			  275,  276,  277,  278,  279,  280,  281,  283,  285,  285,
			  286,  287,  289,  289,  291,  291,  291,  291,  292,  294,

			  295,  299,  300,  301,  301,  303,  305,  307,  307,  308,
			  309,  309,  309,  310,  311,  312,  313,  314,  314,  315,
			  315,  316,  317,  320,  320,  322,  322,  324,  326,  326,
			  326,  326,  326,  326,  326,  327,  329,  329,  330,  331,
			  332,  333,  334,  335,  336,  336,  340,  342,  343,  343,
			  343,  343,  347,  348,  348,  349,  349,  350,  352,  354,
			  356,  356,  356,  356,  356,  359,  360,  361,  362,  363,
			  364,  364,  364,  365,  366,  366,  366,  366,  366,  367,
			  369,  369,  370,  371,  372,  373,  374,  375,  376,  377,
			  378,  378,  379,  379,  379,  379,  387,  389,  391,  391,

			  391,  392,  394,  395,  397,  398,  399,  399,  400,  401,
			  401,  402,  402,  402,  402,  402,  402,  403,  403,  403,
			  403,  403,  404,  405,  406,  408,  409,  411,  411,  413,
			  417,  417,  417,  417,  419,  420,  420,  422,  422,  424,
			  424,  425,  426,  426,  426,  426,  426,  427,  428,  429,
			  430,  434,  434,  438,  439,  439,  439,  439,  440,  442,
			  442,  443,  443, yy_Dummy>>)
		end

	yy_acclist_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   48,   48,   51,   51,   60,   60,   63,   63,  113,
			  111,  112,  106,  107,  111,  112,  106,  107,  112,    1,
			  111,  112,   66,  111,  112,   13,  111,  112,   17,  111,
			  112,   35,  111,  112,    1,  111,  112,    1,  111,  112,
			    1,  111,  112,   84,  111,  112, -197,   84,  111,  112,
			 -197,   84,  111,  112, -197,    1,  111,  112,    1,  111,
			  112,    1,  111,  112,    1,  111,  112,   11,  111,  112,
			 -124,   11,  111,  112, -124,  111,  112,  111,  112,  110,
			  112,  108,  109,  110,  112,  108,  109,  112,  110,  112,
			   73,  112,   78,  112,   74,  112, -187,   77,  112,   81,

			  112,   81,  112,   80,  112,   79,   81,  112,   42,  112,
			   42,  112,   41,  112,   48,  112,   48,  112,   47,  112,
			   48,  112,   45,  112,   48,  112,   51,  112,   50,  112,
			   51,  112,   54,  112,   54,  112,   53,  112,   60,  112,
			   60,  112,   59,  112,   60,  112,   57,  112,   60,  112,
			   63,  112,   62,  112,   63,  112,  106,  107,    2,    3,
			   66,   38,   64, -151, -177,   66,   66, -164,   66, -152,
			   16,   18,   14,   17,   22,   35,   35,   34,   35,    2,
			  107,    5,   99,  105, -208, -214,  -85, -206,   84, -197,
			   84, -197,   82, -195,  -12,   11, -124,   11, -124,  108,

			  109,  109,   73,   74, -187,  -75,   76,   76,   67,   73,
			   76,   71,   76,   72,   76,   80,   79,   41,   48,   47,
			   48,   45,   48,   48,   48,   46,   47,   48,   43,   45,
			 -156,   51,   50,   51,   49,   50,   53,   60,   59,   60,
			   57,   60,   60,   60,   58,   59,   60,   55,   57, -168,
			   63,   62,   63,   61,   62,    3,  -39,  -65,   36,   38,
			   64, -149, -151, -177,   66, -164,   66, -152,   66,   66,
			 -164, -152,   66,  -52,   66,  -40,   21,   15,   19,   23,
			   35,   33,   35,    2,    4,  107,  107,    6,    7,  -96,
			 -102,   97,  -94,   97,   97,   99,  105, -208, -214,   97,

			  -83,   92, -205,   86, -199,   11, -124,  109,  109,   70,
			   70,   70,   70,  -44,  -56,    3,    3,  -37,  -39,  -65,
			   64, -177,   66, -164,   66, -152,   20,   24,   25,   26,
			   32,   32,   32,   32,    4,    7,   99,  105, -208, -214,
			  105, -214,  -94,   98,  104, -207, -213,  -93,  -87, -212,
			   90, -203,   11, -124,   88, -201,   68,   69,   73,   70,
			   70,   70,   70,  -65,   66,   66,   25,   27,   28,   35,
			   32,   32,   32,   32,    4,    4,    7,    7, -102,   98,
			   99,  104,  105, -207, -208, -213, -214,  105, -214,  -95,
			 -101,  103, -100,  103,  103,  105, -214,  103,  -91,  -12,

			    8,  -89,   70,   25,   25,   28,   29,   31,   32,  105,
			 -214,  105, -214,  -95,  -96, -101, -102,  104, -213, -100,
			  104, -213,    9,   10,  -12,   69,   28,   28,   30,   35,
			  104,  105, -213, -214,  104,  105, -213, -214, -101,   31,
			 -101, -102,   10, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 2651
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 361
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 362
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is true
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is true
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 112
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 113
			-- End of buffer rule code

	yyLine_used: BOOLEAN is true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	BREAK: INTEGER is 1
	MS: INTEGER is 2
	MSN: INTEGER is 3
	VS1: INTEGER is 4
	VS2: INTEGER is 5
	VS3: INTEGER is 6
	LAVS1: INTEGER is 7
	LAVS2: INTEGER is 8
	LAVS3: INTEGER is 9
			-- Start condition codes

feature -- User-defined features



feature -- Scanning

	read_token is
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
					-- START INLINING 'yy_at_beginning_of_line'
					-- yy_current_state := yy_start_state + yy_at_beginning_of_line
					if input_buffer.beginning_of_line then
						yy_current_state := yy_start_state + 1
					else
						yy_current_state := yy_start_state
					end
					-- END INLINING 'yy_at_beginning_of_line'
					if yyReject_or_variable_trail_context then
							-- Set up for storing up states.
						yy_state_stack.put (yy_current_state, 0)
						yy_state_count := 1
					end
					yy_goto := yyMatch
				when yyMatch then
						-- Find the next match.
					from
						yy_done := False
					until
						yy_done
					loop
						if yy_ec /= Void then
							if yy_content_area /= Void then
								yy_c := yy_ec.item (yy_content_area.item (yy_cp).code)
							else
								yy_c := yy_ec.item (yy_content.item (yy_cp).code)
							end
						else
							if yy_content_area /= Void then
								yy_c := yy_content_area.item (yy_cp).code
							else
								yy_c := yy_content.item (yy_cp).code
							end
						end
						if
							not yyReject_or_variable_trail_context and then
							yy_accept.item (yy_current_state) /= 0
						then
								-- Save the backing-up info before computing
								-- the next state because we always compute one
								-- more state than needed - we always proceed
								-- until we reach a jam state.
							yy_last_accepting_state := yy_current_state
							yy_last_accepting_cpos := yy_cp
						end
						from until
							yy_chk.item (yy_base.item (yy_current_state) + yy_c) = yy_current_state
						loop
							yy_current_state := yy_def.item (yy_current_state)
							if
								yy_meta /= Void and then
								yy_current_state >= yyTemplate_mark
							then
									-- We've arranged it so that templates are
									-- never chained to one another. This means
									-- we can afford to make a very simple test
									-- to see if we need to convert to `yy_c''s
									-- meta-equivalence class without worrying
									-- about erroneously looking up the meta
									-- equivalence class twice.
								yy_c := yy_meta.item (yy_c)
							end
						end
						yy_current_state := yy_nxt.item (yy_base.item (yy_current_state) + yy_c)
						if yyReject_or_variable_trail_context then
							yy_state_stack.put (yy_current_state, yy_state_count)
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
					check reject_used: yyReject_or_variable_trail_context end
					from yy_found := False until yy_found loop
						if
							yy_lp /= 0 and
							yy_lp < yy_accept.item (yy_current_state + 1)
						then
							yy_act := yy_acclist.item (yy_lp)
							if yyVariable_trail_context then
								if
									yy_act < - yyNb_rules or
									yy_looking_for_trail_begin /= 0
								then
									if yy_act = yy_looking_for_trail_begin then
										yy_looking_for_trail_begin := 0
										yy_act := - yy_act - yyNb_rules
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
							elseif
								yy_end - yy_start - yy_more_len /= 0
							then
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
