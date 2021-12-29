note

	description:

		"Scanners for Eiffel parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2021, Eric Bezault and others"
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
	yy_column := yy_column + 1
--|#line 54 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 54")
end

				if current_universe.use_obsolete_syntax_mode then
					last_token := E_FREEOP
					last_text_count := 1
					last_literal_start := 1
					last_literal_end := 1
					last_break_end := 0
					last_comment_end := 0
					last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
				else
					last_break_end := 0
					last_comment_end := 0
					process_one_char_symbol (unicode_text_item (1))
				end
			
when 5 then
yy_set_line_column
--|#line 69 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 69")
end

				if current_universe.use_obsolete_syntax_mode then
					last_token := E_FREEOP
					last_text_count := 1
					last_literal_start := 1
					last_literal_end := 1
					last_break_end := text_count
					last_comment_end := 0
					last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
				else
					last_text_count := 1
					last_break_end := text_count
					last_comment_end := 0
					process_one_char_symbol (unicode_text_item (1))
				end
			
when 6 then
yy_set_line_column
--|#line 85 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 85")
end

				if current_universe.use_obsolete_syntax_mode then
					last_token := E_FREEOP
					last_text_count := 1
					last_literal_start := 1
					last_literal_end := 1
					last_break_end := 0
					last_comment_end := text_count
					last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
				else
					last_text_count := 1
					last_break_end := 0
					last_comment_end := text_count
					process_one_char_symbol (unicode_text_item (1))
				end
			
when 7 then
yy_set_line_column
--|#line 101 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 101")
end

				last_text_count := 1
				last_break_end := 0
				last_comment_end := text_count
				process_one_char_symbol ('-')
			
when 8 then
	yy_column := yy_column + 2
--|#line 107 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 107")
end

				last_break_end := 0
				last_comment_end := 0
				process_two_char_symbol (unicode_text_item (1), unicode_text_item (2))
			
when 9 then
yy_set_line_column
--|#line 112 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 112")
end

				last_text_count := 2
				last_break_end := text_count
				last_comment_end := 0
				process_two_char_symbol (unicode_text_item (1), unicode_text_item (2))
			
when 10 then
yy_set_line_column
--|#line 118 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 118")
end

				last_text_count := 2
				last_break_end := 0
				last_comment_end := text_count
				process_two_char_symbol (unicode_text_item (1), unicode_text_item (2))
			
when 11 then
	yy_end := yy_end - 1
	yy_column := yy_column + 4
--|#line 158 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 158")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 12 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 166 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 166")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 13 then
	yy_end := yy_end - 1
yy_set_line_column
--|#line 175 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 175")
end

				last_token := E_ONCE_STRING
				last_literal_start := 1
				last_literal_end := 4
				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_keyword_value := ast_factory.new_once_keyword (Current)
			
when 14 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 188 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 188")
end

				last_break_end := 0
				last_comment_end := 0
				process_identifier (text_count)
			
when 15 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 193 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 193")
end

				last_text_count := text_count
				break_kind := identifier_break
				more
				set_start_condition (BREAK)
			
when 16 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 208 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 208")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 17 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 209 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 209")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 18 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 217 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 217")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 19 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 218 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 218")
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
--|#line 219 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 219")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 21 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 220 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 220")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 22 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 231 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 231")
end

				last_token := E_FREEOP
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_free_operator_value := ast_factory.new_free_operator (Current)
			
when 23 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 239 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 239")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 24 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 240 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 240")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 25 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 241 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 241")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 26 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 242 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 242")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 27 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 243 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 243")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := freeop_break
				more
				set_start_condition (BREAK)
			
when 28 then
	yy_column := yy_column + 3
--|#line 255 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 255")
end

				last_break_end := 0
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			
when 29 then
yy_set_line_column
--|#line 260 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 260")
end

				last_text_count := 3
				last_break_end := text_count
				last_comment_end := 0
				process_c1_character_constant (unicode_text_item (2))
			
when 30 then
yy_set_line_column
--|#line 266 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 266")
end

				last_text_count := 3
				last_break_end := 0
				last_comment_end := text_count
				process_c1_character_constant (unicode_text_item (2))
			
when 31 then
	yy_column := yy_column + 4
--|#line 272 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 272")
end

				last_break_end := 0
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 32 then
yy_set_line_column
--|#line 277 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 277")
end

				last_text_count := 4
				last_break_end := text_count
				last_comment_end := 0
				process_c2_character_constant (text_item (3))
			
when 33 then
yy_set_line_column
--|#line 283 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 283")
end

				last_text_count := 4
				last_break_end := 0
				last_comment_end := text_count
				process_c2_character_constant (text_item (3))
			
when 34 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 290 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 290")
end

				last_token := E_CHARACTER
				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_character_constant_value := ast_factory.new_c3_character_constant (Current)
			
when 35 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 299 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 299")
end

				last_text_count := text_count
				last_literal_start := 4
				last_literal_end := last_text_count - 2
				break_kind := character_break
				more
				set_start_condition (BREAK)
			
when 36 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 307 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 307")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 37 then
	yy_column := yy_column + 3
--|#line 317 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 317")
end

					-- Syntax error: missing character code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 3
				last_token := E_CHARERR
			
when 38 then
	yy_column := yy_column + 2
--|#line 327 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 327")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - 1
				last_token := E_CHARERR
			
when 39 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 336 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 336")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				last_detachable_et_position_value := current_position
				column := column - text_count
				last_token := E_CHARERR
			
when 40 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 350 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 350")
end

					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 41 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 358 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 358")
end

					-- Regular manifest string.
					-- Special symbols, standard operators and predefined operators
					-- which cannot be free operators.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
when 42 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 367 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 367")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
when 43 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 368 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 368")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_regular_manifest_string (Current)
			
when 44 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 376 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 376")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
when 45 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 377 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 377")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_freeop_break
				more
				set_start_condition (BREAK)
			
when 46 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 385 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 385")
end

				last_token := E_STRFREEOP
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 47 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 393 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 393")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_freeop_break
				more
				set_start_condition (BREAK)
			
when 48 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 401 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 401")
end

					-- Regular manifest string.
				last_break_end := 0
				last_comment_end := 0
				process_regular_manifest_string (text_count)
			
when 49 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 407 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 407")
end

					-- Regular manifest string.
				last_text_count := text_count
				break_kind := string_break
				more
				set_start_condition (BREAK)
			
when 50 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 415 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 415")
end

					-- Verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				verbatim_opening_character := unicode_text_item (text_count)
				set_start_condition (VS1)
			
when 51 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 425 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 425")
end

				verbatim_open_white_characters := utf8_text
				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 52 then
	yy_column := yy_column + 1
--|#line 431 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 431")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 53 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 449 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 449")
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
			
when 54 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 465 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 465")
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
			
when 55 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 481 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 481")
end

				more
				set_start_condition (VS3)
			
when 56 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 485 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 485")
end

				more
				last_literal_end := text_count - 2
			
when 57 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 489 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 489")
end

				more
				last_literal_end := text_count - 1
			
when 58 then
	yy_column := yy_column + 1
--|#line 493 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 493")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 59 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 511 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 511")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 60 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 516 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 516")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 61 then
	yy_column := yy_column + 1
--|#line 521 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 521")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 62 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 537 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 537")
end

					-- Manifest string with special characters.
				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
			
when 63 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 546 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 546")
end

					-- Manifest string with special characters.
				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 64 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 555 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 555")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 65 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 566 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 566")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 66 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 571 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 571")
end

				more
			
when 67 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 574 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 574")
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
			
when 68 then
	yy_column := yy_column + 2
--|#line 587 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 587")
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
			
when 69 then
	yy_column := yy_column + 2
--|#line 600 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 600")
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
			
when 70 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 613 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 613")
end

				more
			
when 71 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 616 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 616")
end

				last_token := E_STRING
				last_literal_start := 2
				last_literal_end := text_count - 1
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_manifest_string_value := ast_factory.new_special_manifest_string (Current)
				set_start_condition (INITIAL)
			
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 625 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 625")
end

				last_text_count := text_count
				last_literal_start := 2
				last_literal_end := last_text_count - 1
				break_kind := str_special_break
				more
				set_start_condition (BREAK)
			
when 73 then
	yy_column := yy_column + 2
--|#line 633 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 633")
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
			
when 74 then
	yy_column := yy_column + 1
--|#line 644 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 644")
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
			
when 75 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 657 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 657")
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
			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 685 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 685")
end

				more
				set_start_condition (MS)
			
when 77 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 689 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 689")
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
			
when 78 then
	yy_column := yy_column + 1
--|#line 700 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 700")
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
			
when 79 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 731 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 731")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_regular_integer_constant (Current)
			
when 80 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 739 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 739")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := integer_break
				more
				set_start_condition (BREAK)
			
when 81 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 747 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 747")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_underscored_integer_constant (Current)
			
when 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 755 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 755")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := uinteger_break
				more
				set_start_condition (BREAK)
			
when 83 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 763 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 763")
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
			
when 84 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 775 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 775")
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
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 787 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 787")
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
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 799 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 799")
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
			
when 87 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 811 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 811")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_hexadecimal_integer_constant (Current)
			
when 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 819 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 819")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := hinteger_break
				more
				set_start_condition (BREAK)
			
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 827 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 827")
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
			
when 90 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 839 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 839")
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
			
when 91 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 851 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 851")
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
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 863 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 863")
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
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 875 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 875")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_octal_integer_constant (Current)
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 883 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 883")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ointeger_break
				more
				set_start_condition (BREAK)
			
when 95 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 891 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 891")
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
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 903 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 903")
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
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 915 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 915")
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
			
when 98 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 927 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 927")
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
			
when 99 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 939 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 939")
end

				last_token := E_INTEGER
				last_literal_start := 1
				last_literal_end := text_count
				last_break_end := 0
				last_comment_end := 0
				last_detachable_et_integer_constant_value := ast_factory.new_binary_integer_constant (Current)
			
when 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 947 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 947")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := binteger_break
				more
				set_start_condition (BREAK)
			
when 101 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 955 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 955")
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
			
when 102 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 967 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 967")
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
			
when 103 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 979 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 979")
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
			
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 991 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 991")
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
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1007 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1007")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 106 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1008 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1008")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1009 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1009")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := real_break
				more
				set_start_condition (BREAK)
			
when 108 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1017 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1017")
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
			
when 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1018 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1018")
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
			
when 110 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1019 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1019")
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
			
when 111 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1030 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1030")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 112 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1031 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1031")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 113 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1032 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1032")
end

				last_text_count := text_count
				last_literal_start := 1
				last_literal_end := last_text_count
				break_kind := ureal_break
				more
				set_start_condition (BREAK)
			
when 114 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1040 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1040")
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
			
when 115 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1041 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1041")
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
			
when 116 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 1042 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1042")
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
			
when 117 then
yy_set_line_column
--|#line 1057 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1057")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := text_count
				last_comment_end := 0
				last_detachable_et_break_value := ast_factory.new_break (Current)
				last_token := E_BREAK
			
when 118 then
yy_set_line_column
--|#line 1067 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1067")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
				last_break_end := 0
				last_comment_end := text_count
				last_detachable_et_break_value := ast_factory.new_comment (Current)
				last_token := E_BREAK
			
when 119 then
yy_set_line_column
--|#line 1078 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1078")
end

				last_break_end := text_count
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 120 then
yy_set_line_column
--|#line 1084 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1084")
end

				last_break_end := 0
				last_comment_end := text_count
				process_break
				set_start_condition (INITIAL)
			
when 121 then
	yy_column := yy_column + 1
--|#line 1090 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1090")
end

					-- Should never happen.
				less (0)
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 122 then
	yy_column := yy_column + 1
--|#line 1111 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1111")
end

				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			
when 123 then
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
--|#line 1110 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1110")
end
terminate
when 1 then
--|#line 1098 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 1098")
end

					-- Should never happen.
				last_break_end := 0
				last_comment_end := 0
				process_break
				set_start_condition (INITIAL)
			
when 2 then
--|#line 669 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 669")
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
--|#line 713 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 713")
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
--|#line 438 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 438")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 500 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 500")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				last_detachable_et_position_value := current_position
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 528 "et_eiffel_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_scanner.l' at line 528")
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
			create an_array.make_filled (0, 0, 2753)
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
			an_array.area.fill_with (556, 2704, 2753)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   17,   18,   17,   19,   20,   21,   22,   16,   23,
			   22,   19,   24,   25,   26,   27,   28,   28,   28,   29,
			   30,   22,   31,   32,   33,   34,   34,   34,   34,   34,
			   34,   34,   35,   34,   22,   36,   22,   37,   16,   34,
			   34,   34,   34,   34,   22,   19,   19,   16,   38,   39,
			   16,   41,   42,   41,   41,   42,   41,   45,   45,  555,
			   46,   46,   43,   47,   47,   43,   49,   50,   49,   49,
			   50,   49,  547,   51,   62,   63,   51,   53,   54,   53,
			   53,   54,   53,   56,   57,   58,  543,   59,   56,   57,
			   58,  540,   59,   62,   63,   65,   65,   65,   69,   69,

			   69,   69,   69,   69,  100,  101,   66,  133,  107,   70,
			  134,  102,   70,  105,   67,  105,   68,  551,   60,   71,
			   71,   71,  523,   60,   97,   97,   97,  143,  144,  143,
			   72,  123,  123,  123,  145,   98,  159,  160,   67,  107,
			   68,   74,  124,   74,   75,   76,   77,   78,   79,   74,
			   78,   75,   80,   81,   82,   74,   74,   74,   74,   83,
			   84,   78,   85,   86,   77,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   87,   88,   78,   74,   73,   74,
			   74,   74,   74,   74,   87,   75,   75,   73,   89,   90,
			   73,   91,   91,   91,   92,  519,   92,   93,   64,   93, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   93,   92,   94,   93,   92,   93,   93,   93,   93,   93,
			   95,   93,   96,   93,   92,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   92,   93,   93,   92,   93,
			   93,   93,   93,   93,   93,   92,   64,   64,   64,   64,
			   64,  103,  103,  103,  556,  556,   97,   97,   97,  161,
			  160,  556,  104,  146,  147,  146,  188,   98,  556,  556,
			  188,  167,  105,   97,   97,   97,  105,  149,  150,  556,
			  151,  168,   78,  515,   98,  105,   78,  106,  106,  106,
			  106,  108,  108,  108,  152,  149,  153,  125,  151,   97,
			   97,   97,  109,  110,  188,  111,  111,  111,  111,  125,

			  116,  218,   78,   97,   97,   97,  112,  113,  105,  105,
			  512,  219,  505,  114,   98,  149,  156,  115,  157,  154,
			  112,  113,  178,  105,  117,  117,  117,  118,  540,  118,
			  119,   64,  119,  119,  118,  120,  119,  118,  119,  119,
			  119,  119,  119,  121,  119,  122,  119,  118,  263,  139,
			  263,  123,  123,  123,   65,   65,   65,  119,  118,  119,
			  119,  118,  124,  539,  196,   66,  178,  119,  118,   64,
			   64,   64,   64,   64,  127,  127,  127,  127,  129,  129,
			  129,  126,  198,  129,  129,  129,   73,  481,  107,  130,
			  135,  135,  135,  126,  130,   78,  128,  162,  146,  147, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  146,  136,  138,  139,  138,  163,  140,  164,  196,  140,
			  140,  140,  152,  155,  153,  141,  151,  159,  160,  260,
			   64,  140,  133,  140,  499,  134,  140,  140,  140,  261,
			  133,  140,  140,  134,  556,  556,  556,   69,   69,   69,
			  142,  142,  142,  142,  142,  165,  201,  154,   70,   97,
			   97,   97,  279,  166,  202,  556,  203,  161,  160,  556,
			   98,   74,  280,   74,  170,  171,  170,   74,  172,   74,
			   74,  170,  173,   74,  170,   74,   74,   74,   74,   74,
			  174,   74,  175,   74,  170,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,  176,  170,   74,   74,  170,   74,

			   74,   74,   74,   74,  176,  170,  170,  170,  170,  170,
			  170,   74,   76,   74,  299,  177,  198,  300,   74,   74,
			  296,   74,  179,  179,  179,  182,  197,   74,  198,   74,
			   73,   74,  296,  180,  264,  265,  265,  265,   78,   78,
			   73,  281,   74,  463,  463,   74,  199,  200,  199,  282,
			  188,  283,   74,   74,   74,   74,   74,   74,   74,  556,
			   74,  181,  182,  181,  183,  172,  183,  183,  181,  184,
			  183,  181,  183,  183,  183,  183,  183,  185,  183,  186,
			  183,  181,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  187,  181,  183,  183,  181,  183,  183,  183,  183, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  183,  187,  181,  170,  170,  170,  170,  170,  190,  373,
			   76,  191,  192,  192,  233,  233,  192,  193,  171,  143,
			  144,  143,  178,  192,  556,  192,  145,   74,  192,  192,
			  192,  196,  505,  192,  192,   74,  234,  194,   78,  512,
			  204,  204,  204,  204,  204,  204,  279,  194,   73,  188,
			   73,  210,  195,  194,  210,   73,  280,  289,   73,   93,
			  495,  211,  196,  194,   73,  290,   78,  291,   73,   97,
			   97,   97,  216,  216,  216,  220,  220,  220,  218,   73,
			   98,  493,   73,  217,  149,  150,  221,  151,  219,   73,
			   73,   73,   73,   73,   73,  204,  204,  204,   93,  257,

			   93,  133,  556,  125,  134,   93,  205,  362,   93,  226,
			  226,  226,  492,  257,   93,  125,   93,  363,   93,  486,
			  227,  260,  242,  242,  242,  155,  150,  436,  151,   93,
			  198,  261,   93,  243,  191,  235,  235,  235,  433,   93,
			  556,  556,  556,  556,  556,  206,  206,  206,  207,  431,
			  207,  428,  102,  339,  339,  207,  208,  236,  207,  244,
			  244,  244,  475,  475,  209,  250,  250,  250,  207,  426,
			  245,  279,  250,  250,  250,  234,  255,  149,  156,  207,
			  157,  280,  207,  255,  119,  404,  256,  500,  500,  207,
			  102,  102,  102,  102,  102,  222,  222,  222,  127,  127, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  127,  127,  129,  129,  129,  423,  223,  132,  519,  106,
			  106,  106,  106,  130,  135,  135,  135,  152,  149,  153,
			  128,  151,  224,  155,  156,  136,  157,  266,  266,  266,
			  543,  225,  229,  229,  229,  152,  155,  153,  267,  151,
			  268,  268,  268,  230,  463,  463,  231,  231,  231,  231,
			  544,  544,  154,  271,  271,  271,  199,  200,  199,  232,
			  239,  239,  239,  409,  272,  420,  503,  269,  269,  269,
			  154,  240,  414,  410,  241,  241,  241,  241,  270,  273,
			  273,  273,  275,  275,  275,  411,  556,  214,  168,  214,
			  274,  411,  214,  276,  214,  412,  115,  246,  246,  246,

			  118,  412,  118,  119,   64,  119,  119,  118,  247,  119,
			  118,  119,  119,  119,  119,  119,  248,  119,  249,  119,
			  118,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  118,  119,  119,  118,  119,  119,  119,  119,  119,
			  119,  118,   64,   64,   64,   64,   64,  250,  250,  250,
			  119,  474,  119,  473,  556,  197,  556,  119,  251,  296,
			  119,  277,  277,  277,  190,  556,  119,  183,  119,   77,
			  119,  390,  278,  362,  284,  284,  284,  287,  287,  287,
			  362,  119,  387,  363,  119,  285,  370,  555,  288,  125,
			  363,  119,  556,  556,  556,  556,  556,  556,  556,  556, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  252,  125,  252,  385,  102,  471,   76,  252,  253,  197,
			  252,   76,  178,   73,  198,  472,  254,  301,   73,  281,
			  252,   74,  361,   73,  292,  292,  292,  282,   74,  283,
			  121,  252,  122,  556,  252,  293,  199,  200,  199,  556,
			  556,  252,  102,  102,  102,  102,  102,  258,  258,  258,
			  306,  307,  307,  307,  297,  297,  297,  556,  259,  465,
			  465,  127,  127,  127,  127,  298,  199,  200,  199,  194,
			  309,  309,  309,  348,  308,  200,  308,  344,  556,  194,
			  312,  312,  312,  128,  190,  477,  477,  286,  192,  192,
			  382,  313,  409,  193,  323,  324,  324,  324,  383,  192,

			  384,  192,  410,  340,  192,  192,  192,  194,  336,  192,
			  192,  411,  279,  194,  343,  343,  343,  194,  310,  310,
			  310,  412,  280,  194,  183,  294,  183,  401,  177,  311,
			  400,  183,  295,  489,  183,  556,  236,   93,  399,  211,
			  183,  490,  183,  491,  183,  206,  206,  206,  314,  314,
			  314,  316,  316,  316,  389,  183,  204,  171,  183,  315,
			  197,  297,  317,  173,   73,  183,   74,   74,   74,   74,
			   74,   77,   74,   77,   73,  195,  279,   74,   77,   74,
			  292,   77,  318,  318,  318,  182,  280,   77,  320,  320,
			  320,   77,  287,  319,  471,  216,  216,  216,  284,  321, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  301,  513,   77,  198,  472,   77,  217,  191,  218,  218,
			  218,  514,   77,   73,   73,   73,   73,   73,  192,   70,
			  192,  286,  301,  286,  192,  172,  192,  192,  286,  302,
			  192,  286,  192,  192,  192,  192,  192,  303,  192,  304,
			  192,  286,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  305,  286,  192,  192,  286,  192,  192,  192,  192,
			  192,  305,  286,  286,  286,  286,  286,  286,  192,  299,
			  192,  381,  177,  197,  556,  192,  192,  191,  192,  220,
			  220,  220,  502,  502,  192,  192,  192,  191,  192,  380,
			  221,  327,  327,  189,  189,  328,  328,  328,  328,  192,

			  189,  379,  192,  329,  329,  329,  329,  189,  189,  192,
			  192,  192,  192,  192,  192,  220,  220,  220,  268,  268,
			  268,  371,  372,  372,  372,  225,  221,  546,  546,  330,
			  222,  222,  222,  334,  334,  378,  266,  335,  335,  335,
			  335,  223,  279,  258,  231,  231,  231,  231,  336,  336,
			  336,  279,  280,  344,  344,  344,  353,  332,  239,  337,
			  238,  280,  233,  233,  345,  331,  333,  348,  348,  348,
			  244,  244,  244,  263,  139,  263,  475,  475,  349,  350,
			  493,  245,  222,  326,  338,  340,  340,  340,  212,  346,
			  494,  354,  354,  354,  500,  500,  341,  325,  517,  235, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  235,  235,  355,  322,  356,  356,  356,  358,  358,  358,
			  373,  265,  265,  265,  265,  357,  541,  513,  359,  279,
			  279,  342,  279,  119,  351,  256,  351,  514,  351,  280,
			  280,  351,  280,  377,  351,  360,  360,  360,  191,  191,
			  352,  364,  364,  364,  351,  191,  250,  279,  260,  260,
			  260,  279,  365,  279,  279,  351,  179,  280,  351,  130,
			  121,  280,  122,  280,  280,  351,  351,  351,  351,  351,
			  351,  366,  366,  366,  368,  368,  368,  279,  279,  279,
			  544,  544,  367,  192,  171,  369,  135,  198,   98,  262,
			  121,   73,  122,  121,  131,  122,  373,  265,  265,  265,

			  265,   74,  553,  182,  123,  238,  197,  108,  374,  375,
			  296,  392,  200,  392,   64,  376,  213,  215,  183,  377,
			   77,  213,  374,  375,  385,  385,  385,  387,  387,  387,
			  390,  390,  390,  301,  212,  386,  197,  196,  388,  188,
			  191,  391,  191,  556,  191,  178,  195,  169,  192,  191,
			  191,  104,  191,  468,  468,  316,  316,  316,  191,  316,
			  316,  316,  191,  308,  200,  308,  397,  556,  167,  131,
			  398,  107,  194,  191,  237,  237,  191,  107,  237,  320,
			  320,  320,  194,  191,  191,  191,  191,  191,  191,  556,
			  321,  556,  402,  402,  402,  556,  194,  556,  192,  307, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  307,  307,  307,  403,  556,  556,  194,  464,  464,  464,
			  393,  394,  404,  324,  324,  324,  324,  395,  194,  347,
			  347,  396,  556,  347,  393,  394,  556,  556,  194,  404,
			  324,  324,  324,  324,  556,  408,  328,  328,  328,  328,
			  556,  405,  406,  335,  335,  335,  335,  556,  407,  392,
			  200,  392,  408,  556,  556,  405,  406,  222,  222,  222,
			  417,  417,  556,  556,  418,  418,  418,  418,  223,  556,
			  556,  328,  328,  328,  328,  419,  419,  419,  419,  556,
			  433,  433,  433,  466,  467,  467,  467,  423,  423,  423,
			  556,  434,  556,  413,  414,  414,  414,  333,  424,  556,

			  556,  425,  425,  556,  556,  415,  556,  556,  329,  329,
			  329,  329,  556,  426,  426,  426,  346,  556,  436,  436,
			  436,  416,  556,  338,  427,  556,  556,  339,  339,  437,
			  225,  420,  420,  420,  476,  476,  476,  556,  556,  449,
			  450,  449,  421,  556,  556,  335,  335,  335,  335,  234,
			  451,  360,  360,  360,  238,  366,  366,  366,  265,  265,
			  265,  265,  355,  430,  430,  430,  452,  422,  428,  428,
			  428,  501,  501,  501,  121,  556,  122,   64,   64,  429,
			  377,   64,  430,  430,  430,  362,  362,  362,   64,  366,
			  366,  366,  360,  360,  360,  556,  245,  545,  545,  545, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  453,  556,  556,  454,  342,  431,  431,  431,  121,  556,
			  122,  360,  360,  360,  556,  556,  432,  556,  556,  343,
			  343,  343,  455,  132,  372,  372,  372,  372,  402,  402,
			  402,  556,  324,  324,  324,  324,  556,  556,  556,  403,
			  556,  236,  439,  439,  439,  556,  462,  469,  469,  469,
			  409,  409,  409,  440,  408,  556,  441,  441,  441,  441,
			  556,  217,  556,  411,  411,  411,  194,  556,  556,  442,
			  444,  445,  444,  443,  221,  443,  194,  443,  556,  556,
			  443,  446,  189,  443,  478,  478,  478,  478,  556,  447,
			  556,  448,  556,  443,  189,  189,  418,  418,  418,  418,

			  556,  189,  556,  556,  443,  556,  413,  443,  189,  189,
			  441,  441,  441,  441,  443,  443,  443,  443,  443,  443,
			  456,  456,  456,  556,  457,  373,  463,  463,  479,  479,
			  556,  458,  480,  480,  480,  480,  485,  485,  485,  485,
			  556,  556,  336,  336,  336,  556,  556,  132,  503,  132,
			  125,  556,  132,  337,  132,  556,  425,  425,  422,  344,
			  344,  344,  125,  457,  132,  372,  372,  372,  372,  556,
			  345,  279,  279,  279,  556,  556,  459,  460,  338,  464,
			  464,  464,   98,  461,  556,  102,  102,  462,  556,  102,
			  459,  460,  556,  487,  487,  346,  102,  488,  488,  488, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  488,  504,  470,  470,  470,  470,  279,  279,  279,  556,
			  556,  556,  470,  470,  470,  470,  556,   98,  496,  496,
			  496,  194,  497,  476,  476,  476,  470,  470,  470,  498,
			  556,  194,  481,  481,  481,  372,  372,  372,  372,  373,
			  464,  464,  464,  482,  556,  518,  418,  418,  418,  418,
			  190,  467,  467,  467,  467,  556,  556,  462,  404,  475,
			  475,  497,  504,  556,  556,  556,  556,  556,  483,  414,
			  414,  414,  556,  509,  192,  468,  468,  471,  471,  471,
			  415,  517,  556,  419,  419,  419,  419,  556,  321,  515,
			  515,  515,  556,  556,  194,  556,  484,  510,  556,  556,

			  516,  132,  500,  500,  194,  333,  190,  467,  467,  467,
			  467,  556,  404,  476,  476,  476,  556,  556,  506,  507,
			  480,  480,  480,  480,  541,  508,  556,  556,  556,  509,
			  556,  556,  506,  507,  556,  518,  480,  480,  480,  480,
			  556,  556,  556,  192,  469,  469,  469,  520,  520,  520,
			  520,  521,  521,  556,  556,  522,  522,  522,  522,  488,
			  488,  488,  488,  194,  556,  556,  511,  556,  556,  483,
			  525,  526,  525,  194,  414,  414,  414,  488,  488,  488,
			  488,  492,  527,  528,  527,  415,  556,  556,  478,  478,
			  478,  478,  556,  529,  530,  531,  530,  533,  534,  533, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  556,  212,  190,  494,  190,  532,  556,  190,  535,  190,
			  413,  523,  523,  523,  132,  501,  501,  501,  536,  537,
			  536,  556,  524,  556,  556,  485,  485,  485,  485,  538,
			  496,  496,  496,  556,  497,  556,  556,  542,  556,  556,
			  556,  498,  467,  467,  467,  467,  556,  422,  468,  468,
			  469,  469,  469,  556,  513,  513,  513,  522,  522,  522,
			  522,  556,  556,  556,  509,  403,  556,  194,  556,  194,
			  510,  556,  511,  497,  556,  556,  556,  194,  556,  194,
			  547,  547,  547,  522,  522,  522,  522,  279,  279,  279,
			  556,  548,  556,  556,  520,  520,  520,  520,   98,  279,

			  279,  279,  533,  534,  533,  556,  279,  279,  279,  556,
			   98,  556,  556,  549,  556,  556,  483,   98,  533,  534,
			  533,  279,  279,  279,  279,  279,  279,  556,  556,  550,
			  556,  556,   98,  556,  556,   98,  540,  540,  540,  556,
			  552,  501,  501,  501,  190,  544,  544,  498,  190,  545,
			  545,  545,  545,  545,  545,  435,  435,  556,  556,  556,
			  556,  435,  435,  542,  556,  435,  556,  553,  556,  556,
			  556,  554,  556,  556,  554,  556,  556,  556,  556,  552,
			   40,   40,   40,   40,   40,   40,   40,   40,   40,   40,
			   40,   40,   44,   44,   44,   44,   44,   44,   44,   44, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   44,   44,   44,   44,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   48,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   99,  556,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,  125,  125,  556,  556,  556,  556,
			  125,  125,  125,  125,  125,  132,  556,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  148,

			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  189,  556,  189,  189,  189,
			  189,  189,  189,  189,  189,  189,  189,  104,  104,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  228,
			  228,  228,  228,  228,  556,  228,  228,  228,  228,  228,
			  228,  131,  131,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  190,  556,  190,  190,  190, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  190,  190,  190,  190,  190,  190,  190,  353,  353,  353,
			  353,  353,  353,  353,  353,  353,  353,  353,  353,  325,
			  325,  325,  325,  325,  325,  325,  325,  325,  325,  325,
			  325,  326,  326,  326,  326,  326,  326,  326,  326,  326,
			  326,  326,  326,  438,  438,  438,  438,  438,  556,  438,
			  438,  438,  438,  438,  438,  132,  556,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  473,
			  473,  473,  473,  473,  473,  473,  473,  473,  473,  473,
			  473,  539,  539,  539,  539,  539,  539,  539,  539,  539,

			  539,  539,  539,   15, yy_Dummy>>,
			1, 104, 2600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2753)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 50)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (20, 143, 190)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (21, 196, 240)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			an_array.area.fill_with (73, 463, 510)
			yy_chk_template_5 (an_array)
			an_array.area.fill_with (77, 560, 607)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			an_array.area.fill_with (118, 902, 946)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			an_array.area.fill_with (191, 1220, 1267)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			an_array.area.fill_with (556, 2703, 2753)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    3,    3,    4,    4,    4,    5,    6,  555,    5,
			    6,    3,    5,    6,    4,    7,    7,    7,    8,    8,
			    8,  548,    7,   13,   13,    8,    9,    9,    9,   10,
			   10,   10,   11,   11,   11,  543,   11,   12,   12,   12,
			  539,   12,   14,   14,   16,   16,   16,   17,   17,   17,
			   18,   18,   18,   23,   23,   16,   44,   26,   17,   44,
			   31,   18,   31,   16,   26,   16,  538,   11,   19,   19,
			   19,  524,   12,   22,   22,   22,   49,   49,   49,   19,
			   34,   34,   34,   49,   22,   61,   61,   19,   26,   19,
			   20,   34, yy_Dummy>>,
			1, 92, 51)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   21,   21,   21,   21,  519, yy_Dummy>>,
			1, 5, 191)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   24,   24,   24,   28,   28,   29,   29,   29,   63,   63,
			   28,   24,   53,   53,   53,   83,   29,   28,   28,   86,
			   67,   24,   25,   25,   25,   29,   55,   55,   67,   55,
			   67,   83,  516,   25,   25,   86,   25,   25,   25,   25,
			   27,   27,   27,   56,   56,   56,  125,   56,   30,   30,
			   30,   27,   27,   81,   27,   27,   27,   27,  125,   30,
			  104,   81,   32,   32,   32,   27,   27,   30,   30,  512,
			  104,  505,   27,   32,   60,   60,   27,   60,   56,   27,
			   27,   89,   32,   33,   33,   33,   33,  499,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,

			   33,   33,   33,   33,   33,   33,   33,  138,  138,  138,
			   35,   35,   35,   36,   36,   36,   33,   33,   33,   33,
			   33,   35,  498,   89,   36,   90,   33,   33,   33,   33,
			   33,   33,   33,   37,   37,   37,   37,   41,   41,   41,
			   35,   85,   42,   42,   42,   85,  482,   36,   41,   46,
			   46,   46,   35,   42,   85,   37,   64,  146,  146,  146,
			   46,   47,   47,   47,   64,   47,   64,   90,   47,   47,
			   47,   58,   58,   58,   47,   58,  158,  158,  131,   64,
			   47,  132,   47,  458,  132,   47,   47,   47,  131,  140,
			   47,   47,  140,   66,   66,   66,   69,   69,   69,   47, yy_Dummy>>,
			1, 200, 241)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   47,   47,   47,   47,   66,   92,   58,   69,   71,   71,
			   71,  169,   66,   92,   66,   92,  160,  160,  453,   71,
			   73,  169, yy_Dummy>>,
			1, 22, 441)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   74,   74,   74,  190,   74,  186,  190,   74,   74,  186,
			   74,   76,   76,   76,  291,   84,   74,  291,   74,   84,
			   74,  291,   76,  141,  141,  141,  141,   84,   84,   84,
			  170,   74,  374,  374,   74,   87,   87,   87,  170,   87,
			  170,   74,   74,   74,   74,   74,   74,   77,  452, yy_Dummy>>,
			1, 49, 511)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   79,  465,  173,   79,   79,   79,  112,  112,  470,   79,
			  281,  143,  143,  143,   82,   79,  189,   79,  143,  173,
			   79,   79,   79,   82,  465,   79,   79,  281,  112,   79,
			   82,  470,   95,   95,   95,   96,   96,   96,  212,   79,
			   80,   80,   80,   95,   80,  189,   96,   80,  212,  181,
			   80,   95,  451,   95,   82,  189,   80,  181,   80,  181,
			   80,   97,   97,   97,  103,  103,  103,  105,  105,  105,
			  219,   80,   97,  448,   80,  103,  148,  148,  105,  148,
			  219,   80,   80,   80,   80,   80,   80,   93,   93,   93,
			   93,  126,   93,  373,   93,  126,  373,   93,   93,  253,

			   93,  107,  107,  107,  446,  126,   93,  126,   93,  253,
			   93,  440,  107,  261,  116,  116,  116,  150,  150,  437,
			  150,   93,  304,  261,   93,  116,  304,  113,  113,  113,
			  434,   93,   93,   93,   93,   93,   93,   94,   94,   94,
			   94,  432,   94,  429,   94,  234,  234,   94,   94,  113,
			   94,  117,  117,  117,  405,  405,   94,  121,  121,  121,
			   94,  427,  117,  280,  122,  122,  122,  234,  121,  154,
			  154,   94,  154,  280,   94,  122,  121,  477,  121,  459,
			  459,   94,   94,   94,   94,   94,   94,  106,  106,  106,
			  128,  128,  128,  128,  129,  129,  129,  424,  106,  502, yy_Dummy>>,
			1, 200, 608)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  477,  106,  106,  106,  106,  129,  133,  133,  133,  152,
			  152,  152,  128,  152,  106,  156,  156,  133,  156,  157,
			  157,  157,  502,  106,  110,  110,  110,  153,  153,  153,
			  157,  153,  162,  162,  162,  110,  503,  503,  110,  110,
			  110,  110,  506,  506,  152,  164,  164,  164,  176,  176,
			  176,  110,  115,  115,  115,  325,  164,  421,  503,  163,
			  163,  163,  153,  115,  415,  325,  115,  115,  115,  115,
			  163,  166,  166,  166,  167,  167,  167,  326,  163,  573,
			  163,  573,  166,  330,  573,  167,  573,  326,  115,  118,
			  118,  118,  118,  330, yy_Dummy>>,
			1, 94, 808)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  119,  119,  119,  119,  404,  119,  403,  119,  185,  398,
			  119,  119,  185,  119,  168,  168,  168,  546,  397,  119,
			  185,  119,  185,  119,  391,  168,  353,  171,  171,  171,
			  178,  178,  178,  363,  119,  388,  353,  119,  171,  257,
			  546,  178,  257,  363,  119,  119,  119,  119,  119,  119,
			  120,  120,  120,  120,  257,  120,  386,  120,  401,  174,
			  120,  120,  174,  120,  175,  196,  174,  175,  401,  120,
			  382,  175,  196,  120,  174,  252,  174,  182,  182,  182,
			  196,  175,  196,  252,  120,  252,  379,  120,  182,  187,
			  187,  187,  378,  193,  120,  120,  120,  120,  120,  120,

			  127,  127,  127,  193,  193,  193,  193,  188,  188,  188,
			  367,  127,  589,  589,  127,  127,  127,  127,  188,  199,
			  199,  199,  193,  201,  201,  201,  349,  194,  194,  194,
			  345,  194,  193,  203,  203,  203,  127,  172,  591,  591,
			  172,  172,  172,  286,  203,  410,  172,  215,  215,  215,
			  215,  286,  172,  286,  172,  410,  341,  172,  172,  172,
			  194,  337,  172,  172,  412,  444,  172,  236,  236,  236,
			  194,  202,  202,  202,  412,  444,  172,  183,  183,  183,
			  321,  183,  202,  319,  183,  183,  443,  183,  317,  236,
			  202,  315,  202,  183,  443,  183,  443,  183,  205,  205, yy_Dummy>>,
			1, 200, 947)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  205,  209,  209,  209,  210,  210,  210,  300,  183,  205,
			  282,  183,  209,  282,  298,  210,  296,  282,  183,  183,
			  183,  183,  183,  183,  184,  282,  184,  282,  184,  449,
			  295,  184,  184,  293,  184,  211,  211,  211,  289,  449,
			  184,  213,  213,  213,  184,  288,  211,  472,  216,  216,
			  216,  285,  213,  384,  473,  184,  384,  472,  184,  216,
			  384,  218,  218,  218,  473,  184,  184,  184,  184,  184,
			  184,  191,  218, yy_Dummy>>,
			1, 73, 1147)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  192,  192,  192,  278,  192,  303,  276,  192,  192,  303,
			  192,  220,  220,  220,  592,  592,  192,  303,  192,  303,
			  192,  274,  220,  224,  224,  307,  307,  224,  224,  224,
			  224,  192,  307,  272,  192,  225,  225,  225,  225,  307,
			  307,  192,  192,  192,  192,  192,  192,  226,  226,  226,
			  227,  227,  227,  262,  262,  262,  262,  225,  226,  595,
			  595,  227,  231,  231,  231,  232,  232,  270,  267,  232,
			  232,  232,  232,  231,  492,  259,  231,  231,  231,  231,
			  233,  233,  233,  495,  492,  237,  237,  237,  245,  231,
			  240,  233,  238,  495,  233,  233,  237,  230,  231,  241,

			  241,  241,  244,  244,  244,  263,  263,  263,  517,  517,
			  241,  241,  447,  244,  223,  221,  233,  235,  235,  235,
			  447,  237,  447,  247,  247,  247,  541,  541,  235,  217,
			  517,  235,  235,  235,  247,  214,  248,  248,  248,  249,
			  249,  249,  265,  265,  265,  265,  265,  248,  541,  514,
			  249,  525,  527,  235,  243,  248,  243,  248,  243,  514,
			  243,  525,  527,  243,  243,  265,  243,  251,  251,  251,
			  198,  197,  243,  254,  254,  254,  243,  195,  251,  530,
			  260,  260,  260,  533,  254,  536,  551,  243,  180,  530,
			  243,  260,  254,  533,  254,  536,  551,  243,  243,  243, yy_Dummy>>,
			1, 200, 1268)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  243,  243,  243,  255,  255,  255,  256,  256,  256,  279,
			  279,  279,  553,  553,  255,  177,  283,  256,  136,  283,
			  279,  134,  255,  283,  255,  256,  130,  256,  264,  264,
			  264,  264,  264,  283,  553,  290,  124,  114,  290,  109,
			  264,  264,  290,  305,  305,  305,  102,  264,  101,  100,
			  290,  264,  290,   99,  264,  264,  294,  294,  294,  299,
			  299,  299,  301,  301,  301,  383,   98,  294,  383,   88,
			  299,   78,  383,  301,  302,  393,  302,   75,  302,   72,
			  383,  302,  383,   70,  302,  393,  393,  311,  311,  311,
			  302,  313,  313,  313,  302,  308,  308,  308,  311,  308,

			   68,   43,  313,   39,  393,  302,  576,  576,  302,   38,
			  576,  320,  320,  320,  393,  302,  302,  302,  302,  302,
			  302,  306,  320,   15,  322,  322,  322,    0,  308,    0,
			  306,  306,  306,  306,  306,  322,    0,    0,  308,  375,
			  375,  375,  306,  306,  324,  324,  324,  324,  324,  306,
			  306,  581,  581,  306,    0,  581,  306,  306,    0,    0,
			  306,  323,  323,  323,  323,  323,    0,  324,  327,  327,
			  327,  327,    0,  323,  323,  334,  334,  334,  334,    0,
			  323,  392,  392,  392,  323,    0,    0,  323,  323,  328,
			  328,  328,  332,  332,    0,    0,  332,  332,  332,  332, yy_Dummy>>,
			1, 200, 1468)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  328,    0,    0,  328,  328,  328,  328,  333,  333,  333,
			  333,    0,  346,  346,  346,  389,  389,  389,  389,  338,
			  338,  338,    0,  346,    0,  328,  329,  329,  329,  333,
			  338,    0,    0,  338,  338,    0,    0,  329,    0,    0,
			  329,  329,  329,  329,    0,  339,  339,  339,  346,    0,
			  347,  347,  347,  329,    0,  338,  339,    0,    0,  339,
			  339,  347,  329,  335,  335,  335,  406,  406,  406,    0,
			    0,  352,  352,  352,  335,    0,    0,  335,  335,  335,
			  335,  339,  352,  361,  361,  361,  347,  357,  357,  357,
			  377,  377,  377,  377,  361,  430,  430,  430,  357,  335,

			  342,  342,  342,  460,  460,  460,  357,    0,  357,  563,
			  563,  342,  377,  563,  342,  342,  342,  362,  362,  362,
			  563,  359,  359,  359,  365,  365,  365,    0,  362,  507,
			  507,  507,  359,    0,    0,  365,  342,  343,  343,  343,
			  359,    0,  359,  369,  369,  369,    0,    0,  343,    0,
			    0,  343,  343,  343,  369,  372,  372,  372,  372,  372,
			  402,  402,  402,    0,  408,  408,  408,  408,    0,  394,
			    0,  402,    0,  343,  350,  350,  350,    0,  372,  394,
			  394,  394,  409,  409,  409,  350,  408,    0,  350,  350,
			  350,  350,    0,  409,    0,  411,  411,  411,  394,    0, yy_Dummy>>,
			1, 200, 1668)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  350,  351,  351,  351,  351,  411,  351,  394,  351,
			    0,    0,  351,  351,  396,  351,  413,  413,  413,  413,
			    0,  351,    0,  351,    0,  351,  396,  396,  417,  417,
			  417,  417,    0,  396,    0,    0,  351,    0,  413,  351,
			  396,  396,  441,  441,  441,  441,  351,  351,  351,  351,
			  351,  351,  370,  370,  370,    0,  370,  463,  463,  463,
			  416,  416,    0,  370,  416,  416,  416,  416,  422,  422,
			  422,  422,    0,    0,  425,  425,  425,    0,    0,  578,
			  463,  578,  370,    0,  578,  425,  578,    0,  425,  425,
			  422,  435,  435,  435,  370,  370,  371,  371,  371,  371,

			  371,    0,  435,  445,  445,  445,    0,    0,  371,  371,
			  425,  504,  504,  504,  445,  371,    0,  565,  565,  371,
			    0,  565,  371,  371,  395,  442,  442,  435,  565,  442,
			  442,  442,  442,  504,  395,  395,  395,  395,  450,  450,
			  450,    0,    0,    0,  395,  395,  395,  395,    0,  450,
			  456,  456,  456,  395,  456,  518,  518,  518,  395,  395,
			  395,  456,    0,  395,  418,  418,  418,  462,  462,  462,
			  462,  464,  464,  464,  464,  418,    0,  518,  418,  418,
			  418,  418,  467,  467,  467,  467,  467,    0,    0,  462,
			  475,  475,  475,  456,  464,    0,    0,  468,    0,    0, yy_Dummy>>,
			1, 200, 1868)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  418,  419,  419,  419,    0,  467,  468,  468,  468,  471,
			  471,  471,  419,  475,    0,  419,  419,  419,  419,    0,
			  471,  474,  474,  474,    0,    0,  468,    0,  419,  468,
			    0,    0,  474,  500,  500,  500,  468,  419,  466,  466,
			  466,  466,  466,    0,  476,  476,  476,  476,    0,    0,
			  466,  466,  479,  479,  479,  479,  500,  466,    0,    0,
			    0,  466,    0,    0,  466,  466,  469,  476,  480,  480,
			  480,  480,    0,    0,    0,  469,  469,  469,  469,  483,
			  483,  483,  483,  484,  484,    0,    0,  484,  484,  484,
			  484,  487,  487,  487,  487,  469,    0,    0,  469,    0,

			    0,  483,  489,  489,  489,  469,  478,  478,  478,  488,
			  488,  488,  488,  489,  490,  490,  490,  478,    0,    0,
			  478,  478,  478,  478,    0,  490,  491,  491,  491,  493,
			  493,  493,    0,  490,  583,  490,  583,  491,    0,  583,
			  493,  583,  478,  485,  485,  485,  501,  501,  501,  501,
			  494,  494,  494,    0,  485,    0,    0,  485,  485,  485,
			  485,  494,  496,  496,  496,    0,  496,    0,    0,  501,
			  510,    0,  511,  496,  509,  509,  509,  509,    0,  485,
			  510,  510,  511,  511,  511,    0,  513,  513,  513,  521,
			  521,  521,  521,    0,    0,    0,  509,  513,    0,  510, yy_Dummy>>,
			1, 200, 2068)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  511,  510,    0,  511,  496,    0,    0,    0,  510,
			    0,  511,  520,  520,  520,  522,  522,  522,  522,  526,
			  526,  526,    0,  520,    0,    0,  520,  520,  520,  520,
			  526,  528,  528,  528,  529,  529,  529,    0,  531,  531,
			  531,    0,  528,    0,    0,  529,    0,    0,  520,  531,
			  532,  532,  532,  534,  534,  534,  537,  537,  537,    0,
			    0,  532,    0,    0,  534,    0,    0,  537,  540,  540,
			  540,    0,  540,  542,  542,  542,  544,  544,  544,  540,
			  545,  545,  545,  545,  554,  554,  554,  586,  586,    0,
			    0,    0,    0,  586,  586,  542,    0,  586,    0,  544,

			    0,    0,    0,  545,    0,    0,  554,    0,    0,    0,
			    0,  540,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  558,  558,  558,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  561,  561,  561,  561,  561,  561,  561,  561,  561,  561,
			  561,  561,  562,  562,  562,  562,  562,  562,  562,  562,
			  562,  562,  562,  562,  564,    0,  564,  564,  564,  564,
			  564,  564,  564,  564,  564,  564,  566,  566,    0,    0, yy_Dummy>>,
			1, 200, 2268)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  566,  566,  566,  566,  566,  567,    0,  567,
			  567,  567,  567,  567,  567,  567,  567,  567,  567,  568,
			  568,  568,  568,  568,  568,  568,  568,  568,  568,  568,
			  568,  569,  569,  569,  569,  569,  569,  569,  569,  569,
			  569,  569,  569,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  570,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  572,    0,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  574,
			  574,  574,  574,  574,  574,  574,  574,  574,  574,  574,
			  574,  575,  575,  575,  575,  575,    0,  575,  575,  575,

			  575,  575,  575,  577,  577,  577,  577,  577,  577,  577,
			  577,  577,  577,  577,  577,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  579,  579,  580,    0,  580,
			  580,  580,  580,  580,  580,  580,  580,  580,  580,  582,
			  582,  582,  582,  582,  582,  582,  582,  582,  582,  582,
			  582,  584,  584,  584,  584,  584,  584,  584,  584,  584,
			  584,  584,  584,  585,  585,  585,  585,  585,  585,  585,
			  585,  585,  585,  585,  585,  587,  587,  587,  587,  587,
			    0,  587,  587,  587,  587,  587,  587,  588,    0,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  590, yy_Dummy>>,
			1, 200, 2468)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  590,  590,  590,  590,  590,  590,  590,  590,  590,  590,
			  590,  593,  593,  593,  593,  593,  593,  593,  593,  593,
			  593,  593,  593,  594,  594,  594,  594,  594,  594,  594,
			  594,  594,  594,  594,  594, yy_Dummy>>,
			1, 35, 2668)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 595)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   50,   53,   55,   56,   65,   68,   76,
			   79,   82,   87,   72,   91, 1591,   94,   97,  100,  118,
			  140,  190,  123,   96,  240,  262,   94,  280,  218,  245,
			  288,   91,  302,  323,  130,  350,  353,  359, 1530, 1524,
			 2703,  377,  382, 1557,  102, 2703,  389,  401, 2703,  126,
			 2703, 2703, 2703,  252, 2703,  265,  283, 2703,  411, 2703,
			  313,  134, 2703,  247,  385, 2703,  433,  249, 1556,  436,
			 1539,  448, 1535,  460,  507, 1540,  521,  557, 1534,  603,
			  644,  289,  617,  251,  518,  374,  255,  545, 1502,  317,
			  361, 2703,  434,  694,  744,  639,  642,  668, 1522, 1512,

			 1503, 1507, 1479,  671,  299,  674,  794,  708, 2703, 1495,
			  831,    0,  599,  720, 1468,  859,  721,  758,  896,  946,
			  996,  764,  771, 2703, 1492,  256,  672, 1046,  783,  801,
			 1482,  417,  417,  813, 1475, 2703, 1474, 2703,  347, 2703,
			  425,  519, 2703,  618, 2703, 2703,  397, 2703,  682, 2703,
			  723, 2703,  816,  834,  775, 2703,  821,  826,  415, 2703,
			  455, 2703,  839,  866,  852, 2703,  878,  881,  960,  450,
			  529,  973, 1079,  605, 1001, 1006,  855, 1475,  976, 2703,
			 1444,  645, 1023, 1120, 1167,  947,  508, 1035, 1053,  619,
			  509, 1217, 1264, 1035, 1073, 1437, 1007, 1431, 1430, 1065, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2703, 1069, 1117, 1079, 2703, 1144, 2703,    0, 2703, 1147,
			 1150, 1181,  644, 1187, 1394, 1079, 1194, 1385, 1207,  676,
			 1278, 1371, 2703, 1370, 1280, 1288, 1314, 1317, 2703, 2703,
			 1353, 1329, 1322, 1347,  738, 1384, 1099, 1352, 1323, 2703,
			 1346, 1366, 2703, 1420, 1369, 1344, 2703, 1390, 1403, 1406,
			 2703, 1434, 1010,  705, 1440, 1470, 1473,  958, 2703, 1331,
			 1447,  719, 1306, 1372, 1482, 1396, 2703, 1324, 2703, 2703,
			 1323, 2703, 1289, 2703, 1277, 2703, 1262, 2703, 1259, 1476,
			  769,  613, 1152, 1479, 2703, 1186, 1078, 2703, 1180, 1180,
			 1498,  520, 2703, 1168, 1523, 1165, 1151, 2703, 1149, 1526,

			 1140, 1529, 1538, 1265,  722, 1510, 1584, 1267, 1562, 2703,
			 2703, 1554, 2703, 1558, 2703, 1126, 2703, 1123, 2703, 1118,
			 1578, 1115, 1591, 1615, 1598,  861,  883, 1621, 1656, 1693,
			  889, 2703, 1649, 1660, 1628, 1730, 2703, 1096, 1686, 1712,
			 2703, 1091, 1767, 1804, 2703, 1065, 1679, 1717, 2703, 1061,
			 1841, 1869, 1738,  971, 2703, 2703, 2703, 1754, 2703, 1788,
			 2703, 1750, 1784,  978, 2703, 1791, 2703, 1045, 2703, 1810,
			 1919, 1950, 1809,  696,  528, 1592,    0, 1743, 1027, 1021,
			 2703, 2703, 1012, 1528, 1195, 2703,  991, 2703,  970, 1668,
			 2703,  959, 1648, 1538, 1832, 1987, 1868,  953,  944, 2703, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2703, 1003, 1827,  941,  942,  747, 1719,    0, 1817, 1849,
			 1090, 1862, 1109, 1869, 2703,  860, 1917, 1881, 2031, 2068,
			 2703,  853, 1921, 2703,  793, 1941, 2703,  757, 2703,  739,
			 1748, 2703,  737, 2703,  726, 1958, 2703,  715, 2703, 2703,
			  707, 1895, 1982, 1121, 1110, 1970,  700, 1368,  669, 1174,
			 2005,  648,  547,  447, 2703, 2703, 2017, 2703,  412,  772,
			 1756,    0, 2020, 1911, 2025,  595, 2092, 2036, 2060, 2129,
			  602, 2076, 1192, 1199, 2088, 2044, 2098,  771, 2173, 2105,
			 2121, 2703,  375, 2132, 2140, 2210, 2703, 2144, 2162, 2169,
			 2181, 2193, 1340, 2196, 2217, 1349, 2229, 2703,  351,  326,

			 2087, 2200,  793,  829, 1964,  275,  835, 1782,    0, 2227,
			 2233, 2235,  273, 2253, 1415, 2703,  261, 1361, 2008,  158,
			 2279, 2242, 2268, 2703,  110, 1417, 2286, 1418, 2298, 2301,
			 1445, 2305, 2317, 1449, 2320,    0, 1451, 2323,  105,   89,
			 2335, 1379, 2326,   49, 2330, 2334,  950, 2703,   60,    0,
			    0, 1452, 2703, 1465, 2337,   22, 2703, 2379, 2391, 2403,
			 2415, 2427, 2439, 1776, 2451, 1984, 2463, 2474, 2486, 2498,
			 2510, 2522, 2534,  884, 2546, 2558, 1567, 2570, 1944, 2582,
			 2594, 1612, 2606, 2199, 2618, 2630, 2354, 2642, 2654, 1052,
			 2666, 1078, 1275, 2678, 2690, 1320, yy_Dummy>>,
			1, 196, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 595)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (556, 557, 595)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  556,    1,  557,  557,  558,  558,  559,  559,  560,
			  560,  561,  561,  562,  562,  556,  563,  556,  556,  563,
			  556,  556,  556,  564,  565,  556,   19,  556,   27,  556,
			  565,   30,  556,  556,  566,  566,   19,  556,   19,   19,
			  556,  556,  556,  556,  567,  556,  556,  568,  556,  556,
			  556,  556,  556,  556,  556,  569,  569,  556,  569,  556,
			  570,  571,  556,  571,   36,  556,  565,   66,   66,  556,
			  556,  556,   66,  556,   73,   73,  556,  556,   74,  572,
			   74,   74,   73,   74,   80,   80,   74,   74,   73,   73,
			   73,  556,   21,   21,   93,   94,   94,  556,  556,  556,

			  573,  556,   36,  556,  574,  556,  556,   64,  556,  556,
			  575,   28,  556,  556,  576,  556,   19,  556,  556,  118,
			  119,  120,  120,  556,  556,   35,   35,  556,  556,  556,
			  556,  577,  567,  556,  578,  556,  556,  556,  556,  556,
			  567,  556,  556,  556,  556,  556,  556,  556,  569,  556,
			  569,  556,  569,  569,  570,  556,  570,  556,  571,  556,
			  571,  556,   66,   66,   66,  556,  116,  166,  167,  579,
			   73,  556,  572,   80,   80,   80,   74,  172,  556,  556,
			  556,   77,  556,   77,  183,  184,  184,  183,  556,  572,
			  580,  556,  191,  572,  572,  172,   73,  172,  172,   74, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  556,   94,   94,   94,  556,   93,  556,   21,  556,   21,
			   21,   21,  579,  556,  556,  556,  556,  556,  556,  574,
			  556,  556,  556,  556,  556,  556,  556,  164,  556,  556,
			  556,  556,  556,  556,  556,  556,  556,  576,  581,  556,
			  556,  115,  556,  579,  556,  556,  556,  120,  120,  120,
			  556,  119,  118,  582,  118,  118,  118,   35,  556,  556,
			  556,  577,  556,  556,  556,  556,  556,  556,  556,  556,
			  167,  556,  167,  556,   66,  556,   66,  556,   66,  556,
			  579,   80,   80,   80,  556,  556,  191,  556,  556,  184,
			  184,  184,  556,  556,  556,  183,   77,  556,  556,  556,

			  583,  556,  192,  302,  302,  192,  572,  306,  572,  556,
			  556,   21,  556,   21,  556,   94,  556,   66,  556,   94,
			  556,  556,  556,  556,  556,  584,  585,  556,  556,  556,
			  585,  556,  556,  556,  556,  556,  556,  556,  556,  556,
			  556,  556,  556,  556,  556,  556,  586,  581,  556,  556,
			  587,  579,  351,  582,  556,  556,  556,  118,  556,  118,
			  556,  120,  556,  582,  556,  120,  556,   66,  556,  120,
			   35,  556,  556,  588,  556,  556,  589,  556,   66,   66,
			  556,  556,  302,  302,  302,  556,  556,  556,  556,  556,
			  556,  556,  192,  572,  572,  572,  306,   66,   66,  556, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  556,  590,  556,  556,  556,  556,  556,  591,  556,  556,
			  584,  556,  585,  556,  556,  556,  556,  556,  556,  556,
			  556,  556,  556,  556,  556,  556,  556,  556,  556,  556,
			  235,  556,  556,  556,  556,  586,  556,  556,  556,  556,
			  556,  419,  556,  351,  579,  556,  243,  243,  243,  579,
			  556,  243,   66,   66,  556,  556,  556,  556,  556,  556,
			  556,  592,  556,  556,  556,  589,  556,  556,  572,  572,
			  395,  556,  590,  593,  556,  556,  556,  591,  556,  556,
			  478,  556,  556,  556,  556,  556,  556,  556,  485,  243,
			  243,  243,  579,  351,  351,  579,  556,  556,  556,  594,

			  556,  556,  592,  556,  556,  589,  556,  556,  595,  556,
			  572,  572,  395,  556,  593,  556,  556,  556,  556,  591,
			  556,  556,  520,  556,  556,  579,  556,  579,  556,  351,
			  579,  556,  351,  579,  556,  243,  579,  556,  243,  594,
			  556,  556,  556,  592,  556,  556,  595,  556,  556,  243,
			  243,  579,  556,  556,  556,  595,    0, yy_Dummy>>,
			1, 157, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (50, 127, 159)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (50, 173, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (50, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (50, 8203, 8229)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (50, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (50, 8288, 8657)
			an_array.put (46, 8658)
			an_array.area.fill_with (50, 8659, 8703)
			yy_ec_template_4 (an_array)
			an_array.area.fill_with (50, 8708, 8742)
			yy_ec_template_5 (an_array)
			an_array.area.fill_with (50, 8745, 8890)
			an_array.put (46, 8891)
			an_array.area.fill_with (50, 8892, 10225)
			an_array.area.fill_with (46, 10226, 10227)
			an_array.area.fill_with (50, 10228, 12287)
			yy_ec_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   50,   50,   50,   50,   50,   50,   50,   50,    1,
			    2,    1,    1,    3,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,   24,   25,   26,   27,   25,   28,
			   25,   29,   30,   29,   29,   29,   30,   29,   31,   32,
			   29,   30,   30,   30,   30,   30,   30,   29,   33,   29,
			   29,   34,   35,   36,    4,   37,   38,   39,   40,   41,

			   39,   28,   39,   29,   42,   29,   29,   29,   42,   29,
			   43,   32,   29,   42,   42,   42,   42,   42,   42,   29,
			   33,   29,   29,   44,    6,   36,   45, yy_Dummy>>,
			1, 127, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   50,   50,   50,   50,   50,   46,   50,   50,   50,
			   50,   50,   46, yy_Dummy>>,
			1, 13, 160)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   47,   50,   50,   50,   50,   50,   50,   50,   50,    1, yy_Dummy>>,
			1, 10, 8230)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   46,   50,   50,   46, yy_Dummy>>,
			1, 4, 8704)
		end

	yy_ec_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   48,   49, yy_Dummy>>,
			1, 2, 8743)
		end

	yy_ec_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   50,   50, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,   12,    3,   12,    4,    5,    3,
			    3,   12,    1,    6,    5,    7,    7,    7,    7,    4,
			    5,    4,    5,    4,   12,    8,    8,    8,    7,    9,
			   10,   10,    9,    9,    4,   12,    4,   11,   12,    7,
			    7,    7,    9,    9,    4,   12,   12,   12,   12,   12,
			   12, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 557)
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
			   55,   58,   61,   64,   69,   73,   77,   81,   83,   88,
			   93,   95,   99,  102,  104,  106,  108,  111,  113,  115,
			  117,  119,  122,  124,  126,  128,  130,  132,  134,  136,
			  139,  141,  143,  145,  147,  149,  151,  151,  151,  151,
			  153,  153,  157,  157,  158,  159,  160,  164,  165,  166,
			  166,  167,  168,  169,  170,  171,  172,  173,  175,  176,
			  177,  178,  181,  185,  187,  188,  190,  192,  194,  194,

			  195,  195,  197,  199,  200,  201,  202,  206,  209,  210,
			  210,  211,  213,  213,  213,  213,  215,  216,  220,  224,
			  226,  226,  228,  230,  231,  231,  233,  235,  237,  237,
			  239,  239,  240,  241,  243,  243,  244,  244,  245,  246,
			  247,  249,  251,  253,  253,  254,  255,  255,  256,  256,
			  257,  257,  258,  258,  258,  258,  260,  260,  263,  263,
			  264,  264,  266,  267,  269,  271,  272,  275,  276,  279,
			  281,  282,  290,  290,  291,  292,  293,  295,  295,  305,
			  307,  307,  308,  318,  319,  320,  321,  322,  324,  330,
			  330,  331,  332,  333,  333,  334,  334,  335,  335,  335, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  336,  337,  339,  343,  347,  348,  349,  350,  354,  356,
			  361,  363,  368,  369,  370,  371,  372,  374,  374,  375,
			  376,  378,  378,  380,  380,  380,  380,  384,  385,  386,
			  388,  389,  393,  393,  395,  395,  397,  397,  399,  399,
			  400,  400,  402,  403,  404,  406,  406,  409,  411,  415,
			  419,  420,  421,  425,  427,  432,  434,  439,  441,  442,
			  442,  443,  444,  444,  444,  445,  446,  447,  447,  448,
			  449,  450,  451,  452,  455,  455,  457,  457,  460,  460,
			  461,  462,  463,  464,  465,  469,  469,  470,  475,  475,
			  476,  477,  478,  483,  483,  489,  490,  491,  494,  494,

			  496,  496,  500,  501,  502,  503,  505,  505,  505,  505,
			  507,  509,  511,  513,  515,  519,  520,  523,  524,  528,
			  529,  531,  531,  532,  533,  534,  535,  536,  536,  540,
			  542,  544,  545,  545,  545,  545,  549,  550,  550,  552,
			  554,  555,  555,  557,  559,  560,  560,  562,  564,  565,
			  565,  566,  569,  573,  574,  576,  578,  580,  582,  584,
			  586,  587,  588,  589,  590,  594,  595,  598,  599,  603,
			  604,  606,  606,  606,  608,  608,  608,  608,  608,  609,
			  610,  612,  614,  615,  616,  617,  620,  620,  621,  621,
			  621,  623,  623,  624,  624,  624,  624,  624,  626,  628, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  631,  634,  635,  637,  637,  638,  638,  638,  638,  638,
			  639,  640,  641,  642,  642,  643,  643,  643,  643,  651,
			  653,  655,  655,  655,  656,  656,  658,  659,  659,  660,
			  660,  662,  663,  663,  664,  664,  666,  667,  667,  668,
			  670,  671,  673,  673,  676,  679,  682,  683,  684,  685,
			  689,  693,  694,  696,  698,  701,  704,  705,  706,  706,
			  706,  706,  706,  706,  707,  708,  709,  709,  709,  709,
			  709,  709,  710,  711,  712,  714,  715,  716,  717,  719,
			  719,  721,  725,  725,  725,  725,  727,  728,  728,  730,
			  732,  735,  738,  740,  742,  746,  749,  749,  751,  751,

			  752,  752,  752,  752,  752,  752,  752,  752,  752,  752,
			  752,  752,  752,  752,  753,  754,  755,  755,  755,  755,
			  755,  759,  759,  763,  764,  764,  766,  768,  770,  772,
			  774,  776,  778,  780,  783,  786,  787,  791,  795,  796,
			  796,  796,  796,  796,  796,  796,  796,  796,  798,  798,
			  800,  802,  805,  806,  806,  806,  806,  806, yy_Dummy>>,
			1, 158, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 805)
			yy_acclist_template_1 (an_array)
			yy_acclist_template_2 (an_array)
			yy_acclist_template_3 (an_array)
			yy_acclist_template_4 (an_array)
			yy_acclist_template_5 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_acclist_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    0,  124,   22,  122,  123, -150,  117,  118,  122,  123,
			  117,  118,  123,    1,   22,  122,  123, -150,   64,  122,
			  123,   16,   22,  122,  123, -142, -150,    1,  122,  123,
			   39,  122,  123,    1,  122,  123,    1,  122,  123,    1,
			   22,  122,  123, -150,   79,  122,  123, -203,   79,  122,
			  123, -203,    1,  122,  123,    1,  122,  123,    1,  122,
			  123,    1,  122,  123,    4,   22,  122,  123, -150,   14,
			  122,  123, -138,   14,  122,  123, -138,   22,  122,  123,
			 -150,  122,  123,    1,   22,  122,  123, -150,    1,   22,
			  122,  123, -150,  121,  123,  119,  120,  121,  123,  119,

			  120,  123,  121,  123,   70,  123,   75,  123,   71,  123,
			 -195,   74,  123,   78,  123,   78,  123,   77,  123,   76,
			   78,  123,   52,  123,   52,  123,   51,  123,   58,  123,
			   58,  123,   57,  123,   58,  123,   55,   58,  123,   58,
			  123,   61,  123,   60,  123,   61,  123,   22, -150,   26,
			  -27,  117,  118,    2,    3,   26,  -27,   64,   64,   64,
			   48,   62, -172, -186,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64, -173,   64,   64,   64,  -19,   26,
			  -27,   16,   22, -142, -150,   16, -142,   16,   16, -142,
			   16, -142,    2,    3,   39,   38,   39,   22, -150,    2, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  118,    8,  110,  116, -230, -236,    8,   22, -150,  -80,
			 -228,   79, -203,   85, -209,   22,    5,    6,   26,  -27,
			   17,   22, -144, -150,   17, -144,   17, -144,   17, -144,
			  -15,   14, -138,   14, -138,   83, -207,  119,  120,  120,
			   70,   71, -195,  -72,   73,   73,   65,   70,   73,   68,
			   73,   69,   73,   77,   76,   51,   57,   55,   56,   57,
			   53,   55, -177,   60,   59,   60,   22,   22, -148,   22,
			 -147,  -27,   22, -148, -150,   22,   22, -147, -150,    3,
			  -27,   64,   43,   46,   48,   62, -168, -170, -172, -186,
			   64,   64,   64,   64, -173,   40,   43,   46,   48,   62,

			 -164, -168, -170, -172, -186,  -49,  -63,   64,   42,   43,
			   46,   48,   62, -167, -168, -170, -172, -186,   64,   64,
			   64,   64,   64, -173,   40,   48,   62, -164, -172, -186,
			   64,   64,   64, -173,   64,   64,  -50,   16,   22,   16,
			   22, -142, -148,   16,   22, -142, -147,  -19,   16,   18,
			   16,   22, -142, -150,  -19,  -27,   16,   22, -142, -148,
			 -150,   16,   22,   16,   22, -142, -147, -150,    3,   28,
			   39,   37,    2,    7,  118,  118,    9,   10, -107, -113,
			    9,   10,   26,  -27,   22,  108, -105,  108,  108,  110,
			  116, -230, -236,   99, -223,   93, -217,   87, -211,  -86, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   81, -205,   26,    3,    5,    6,  -21,   26,  -27,   17,
			   22,   17,   22, -144, -148,   17,   22, -144, -147,  -21,
			   17,   17,   22, -144, -150,    6,  -27,   17,   22, -144,
			 -148, -150,   17,   22,   17,   22, -144, -147, -150,   14,
			 -138,  -84,  120,  120,   67,   67,  -54,   23,  -25,   22,
			  -24,   22,  -25,   26,  -27,   23,   26,  -24,   26,  -27,
			    3,    3,   64,   64,   64,  -45,  -47,  -49,  -63,   64,
			  -41,  -45,  -47,  -49,  -63,   64,   64,   64,  -44,  -45,
			  -47,  -49,  -63,   42,   48,   62, -167, -172, -186,   64,
			   64,  -41,  -49,  -63,   62, -186,   46,   62, -170, -186,

			   64,   64,   64,   64, -173,   18,   23,  -19,  -25,   16,
			   22,  -19,  -24,   16,   22,  -19,  -25,   26,  -27,   16,
			   18,   23,   26,  -19,  -19,  -24,   26,  -27,   16,   29,
			   30,   31,   36,   36,    7,   10,  110,  116, -230, -236,
			  116, -236,   10,  -27, -105,  109,  115, -229, -235, -100,
			  103, -227,  101, -225,  -94,   97, -221,   95, -219,  -88,
			   91, -215,   89, -213,  -82, -234,    3,   22, -150,    3,
			   22, -148, -150,    6,   20,   23,  -21,  -27,  -21,  -25,
			   17,   22,  -21,  -24,   17,   22,   20,   17,    6,    6,
			  -21,  -25,   26,  -27,   17,   20,   23,   26,  -21,  -21, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  -24,   26,  -27,   17,   14, -138,   66,   70,  -25,  -24,
			  -25,  -27,  -24,  -27,   64,   64,   64,  -44,  -49,  -63,
			  -63,  -47,  -63,   64,  -19,  -25,  -19,  -24,  -19,  -25,
			  -27,  -19,  -24,  -27,   30,   32,   33,   39,    7,    7,
			   10,   10, -113,  109,  110,  115,  116, -229, -230, -235,
			 -236,  116, -236, -106, -112, -104,   99, -223, -102,  -98,
			   93, -217,  -96,  -92,   87, -211,  -90,  114, -111,  114,
			  114,  116, -236,    3,   22, -150,    3,   26,  -27,    3,
			   26,  -27,    3,    3,    3,    3,  -25,   26,  -27,    3,
			  -25,   26,  -27,    3,  -21,  -25,  -21,  -24,  -21,  -25,

			  -27,  -21,  -24,  -27,  -15,   11,   67,   67,   67,   30,
			   30,   33,   34, -158,   36,   36,   36,  116, -236,  116,
			 -236, -106, -107, -112, -113,  115, -235, -111,  115, -235,
			    3,   22,    3,   22, -148,    3,   22, -147,    3,  -27,
			    3,   22,    3,   22, -147, -150,    3,  -25,  -27,   12,
			   13,  -15,   33,   33,  -35,  115,  116, -235, -236,  115,
			  116, -235, -236, -112,    3,   23,    3,   23,    3,  -25,
			    3,  -25,    3,   22,    3,  -24,    3,  -24,    3,   22,
			    3,   23,   26,    3,   23,   26,    3,    3,  -24,   26,
			  -27,    3,  -24,   26,  -27,    3, -112, -113,    3,  -25, yy_Dummy>>,
			1, 200, 600)
		end

	yy_acclist_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    3,  -24,    3,  -24,  -27,   13, yy_Dummy>>,
			1, 6, 800)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2703
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 556
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 557
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 50
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

	yyNb_rules: INTEGER = 123
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 124
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
