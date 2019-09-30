note

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PREPARSER

inherit

	ET_EIFFEL_PREPARSER_SKELETON

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
yy_set_line_column
--|#line 37 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 37")
end

			
when 2 then
	yy_column := yy_column + 1
--|#line 38 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 38")
end

			
when 3 then
	yy_column := yy_column + 2
--|#line 39 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 39")
end

			
when 4 then
	yy_column := yy_column + 5
--|#line 44 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 44")
end

			
when 5 then
	yy_column := yy_column + 5
--|#line 45 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 45")
end

			
when 6 then
	yy_column := yy_column + 3
--|#line 46 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 46")
end

			
when 7 then
	yy_column := yy_column + 3
--|#line 47 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 47")
end

			
when 8 then
	yy_column := yy_column + 2
--|#line 48 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 48")
end

			
when 9 then
	yy_column := yy_column + 6
--|#line 49 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 49")
end

			
when 10 then
	yy_column := yy_column + 5
--|#line 50 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 50")
end

			
when 11 then
	yy_column := yy_column + 7
--|#line 51 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 51")
end

			
when 12 then
	yy_column := yy_column + 6
--|#line 52 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 52")
end

			
when 13 then
	yy_column := yy_column + 8
--|#line 53 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 53")
end

			
when 14 then
	yy_column := yy_column + 7
--|#line 54 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 54")
end

			
when 15 then
	yy_column := yy_column + 5
--|#line 55 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 55")
end

			
when 16 then
	yy_column := yy_column + 8
--|#line 56 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 56")
end

			
when 17 then
	yy_column := yy_column + 2
--|#line 57 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 57")
end

			
when 18 then
	yy_column := yy_column + 4
--|#line 58 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 58")
end

			
when 19 then
	yy_column := yy_column + 6
--|#line 59 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 59")
end

			
when 20 then
	yy_column := yy_column + 3
--|#line 60 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 60")
end

			
when 21 then
	yy_column := yy_column + 6
--|#line 61 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 61")
end

			
when 22 then
	yy_column := yy_column + 8
--|#line 62 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 62")
end

			
when 23 then
	yy_column := yy_column + 6
--|#line 63 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 63")
end

			
when 24 then
	yy_column := yy_column + 8
--|#line 64 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 64")
end

			
when 25 then
	yy_column := yy_column + 5
--|#line 65 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 65")
end

			
when 26 then
	yy_column := yy_column + 7
--|#line 66 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 66")
end

			
when 27 then
	yy_column := yy_column + 4
--|#line 67 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 67")
end

			
when 28 then
	yy_column := yy_column + 6
--|#line 68 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 68")
end

			
when 29 then
	yy_column := yy_column + 2
--|#line 69 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 69")
end

			
when 30 then
	yy_column := yy_column + 7
--|#line 70 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 70")
end

			
when 31 then
	yy_column := yy_column + 8
--|#line 71 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 71")
end

			
when 32 then
	yy_column := yy_column + 5
--|#line 72 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 72")
end

			
when 33 then
	yy_column := yy_column + 7
--|#line 73 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 73")
end

			
when 34 then
	yy_column := yy_column + 7
--|#line 74 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 74")
end

			
when 35 then
	yy_column := yy_column + 9
--|#line 75 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 75")
end

			
when 36 then
	yy_column := yy_column + 2
--|#line 76 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 76")
end

			
when 37 then
	yy_column := yy_column + 4
--|#line 77 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 77")
end

			
when 38 then
	yy_column := yy_column + 5
--|#line 78 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 78")
end

			
when 39 then
	yy_column := yy_column + 4
--|#line 79 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 79")
end

			
when 40 then
	yy_column := yy_column + 3
--|#line 80 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 80")
end

			
when 41 then
	yy_column := yy_column + 8
--|#line 81 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 81")
end

			
when 42 then
	yy_column := yy_column + 3
--|#line 82 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 82")
end

			
when 43 then
	yy_column := yy_column + 4
--|#line 83 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 83")
end

			
when 44 then
	yy_column := yy_column + 2
--|#line 84 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 84")
end

			
when 45 then
	yy_column := yy_column + 9
--|#line 85 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 85")
end

			
when 46 then
	yy_column := yy_column + 6
--|#line 86 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 86")
end

			
when 47 then
	yy_column := yy_column + 8
--|#line 87 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 87")
end

			
when 48 then
	yy_column := yy_column + 6
--|#line 88 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 88")
end

			
when 49 then
	yy_column := yy_column + 7
--|#line 89 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 89")
end

			
when 50 then
	yy_column := yy_column + 6
--|#line 90 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 90")
end

			
when 51 then
	yy_column := yy_column + 6
--|#line 91 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 91")
end

			
when 52 then
	yy_column := yy_column + 5
--|#line 92 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 92")
end

			
when 53 then
	yy_column := yy_column + 6
--|#line 93 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 93")
end

			
when 54 then
	yy_column := yy_column + 8
--|#line 94 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 94")
end

			
when 55 then
	yy_column := yy_column + 5
--|#line 95 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 95")
end

			
when 56 then
	yy_column := yy_column + 4
--|#line 96 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 96")
end

			
when 57 then
	yy_column := yy_column + 4
--|#line 97 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 97")
end

			
when 58 then
	yy_column := yy_column + 8
--|#line 98 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 98")
end

			
when 59 then
	yy_column := yy_column + 6
--|#line 99 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 99")
end

			
when 60 then
	yy_column := yy_column + 5
--|#line 100 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 100")
end

			
when 61 then
	yy_column := yy_column + 7
--|#line 101 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 101")
end

			
when 62 then
	yy_column := yy_column + 4
--|#line 102 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 102")
end

			
when 63 then
	yy_column := yy_column + 4
--|#line 103 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 103")
end

			
when 64 then
	yy_column := yy_column + 3
--|#line 104 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 104")
end

			
when 65 then
	yy_column := yy_column + 5
--|#line 106 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 106")
end

				class_keyword_found := True
			
when 66 then
	yy_column := yy_column + 8
--|#line 109 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 109")
end

				if use_attached_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 67 then
	yy_column := yy_column + 9
--|#line 121 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 121")
end

				if use_attribute_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 68 then
	yy_column := yy_column + 10
--|#line 133 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 133")
end

				if use_detachable_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 69 then
	yy_column := yy_column + 4
--|#line 145 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 145")
end

				if use_note_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 4
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 70 then
	yy_column := yy_column + 9
--|#line 157 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 157")
end

				if use_reference_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 9
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 71 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 173 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 173")
end

				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := text_count
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 192 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 192")
end

			
when 73 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 197 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 197")
end

			
when 74 then
	yy_column := yy_column + 3
--|#line 202 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 202")
end

			
when 75 then
	yy_column := yy_column + 4
--|#line 203 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 203")
end

			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 204 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 204")
end

			
when 77 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 206 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 206")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
when 78 then
	yy_column := yy_column + 3
--|#line 215 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 215")
end

					-- Syntax error: missing character code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				column := column - 3
				last_token := E_CHARERR
			
when 79 then
	yy_column := yy_column + 2
--|#line 224 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 224")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				column := column - 1
				last_token := E_CHARERR
			
when 80 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 232 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 232")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
when 81 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 245 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 245")
end

			
when 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 248 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 248")
end

					-- Verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				verbatim_opening_character := unicode_text_item (text_count)
				set_start_condition (VS1)
			
when 83 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 258 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 258")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 84 then
	yy_column := yy_column + 1
--|#line 263 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 263")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 279 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 279")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := no_verbatim_marker
					verbatim_marker_count := 0
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 289 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 289")
end

				more
				set_start_condition (VS3)
			
when 87 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 293 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 293")
end

				more
				last_literal_end := text_count - 2
			
when 88 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 297 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 297")
end

				more
				last_literal_end := text_count - 1
			
when 89 then
	yy_column := yy_column + 1
--|#line 301 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 301")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 90 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 317 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 317")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 91 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 322 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 322")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 92 then
	yy_column := yy_column + 1
--|#line 327 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 327")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 341 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 341")
end

					-- Manifest string with special characters.
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 344 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 344")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 95 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 355 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 355")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 360 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 360")
end

				more
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 363 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 363")
end

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSAS_error (filename, current_position)
				column := ms_column
				line := ms_line
--				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 98 then
	yy_column := yy_column + 2
--|#line 375 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 375")
end

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSAC_error (filename, current_position)
				column := ms_column
				line := ms_line
--				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 99 then
	yy_column := yy_column + 2
--|#line 387 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 387")
end

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line
--				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 400 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 400")
end

				more
			
when 101 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 403 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 403")
end

				set_start_condition (INITIAL)
			
when 102 then
	yy_column := yy_column + 2
--|#line 406 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 406")
end

					-- Syntax error: Invalid special character
					-- in manifest strings.
				column := yy_column - 1
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSSC_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			
when 103 then
	yy_column := yy_column + 1
--|#line 417 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 417")
end

					-- Syntax error: invalid special character
					-- %l in manifest strings.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSSC_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 104 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 429 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 429")
end

					-- Syntax error: Invalid new-line in manifest string.
				column := 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNL_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 105 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 455 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 455")
end

				more
				set_start_condition (MSN)
			
when 106 then
	yy_column := yy_column + 1
--|#line 459 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 459")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 474 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 474")
end

				more
				set_start_condition (MS)
			
when 108 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 478 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 478")
end

					-- Syntax error: empty line in middle of
					-- multi-line manifest string.
				column := 1
				line := yy_line - 1
--				set_syntax_error
--				error_handler.report_SSEL_error (filename, current_position)
				column := ms_column
				line := ms_line
				more
			
when 109 then
	yy_column := yy_column + 1
--|#line 489 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 489")
end

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column - 1
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 110 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 518 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 518")
end

			
when 111 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 520 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 520")
end

			
when 112 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 522 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 522")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 113 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 529 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 529")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 114 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 536 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 536")
end

			
when 115 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 538 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 538")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 116 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 545 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 545")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 117 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 552 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 552")
end

			
when 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 554 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 554")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 561 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 561")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 120 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 568 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 568")
end

			
when 121 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 570 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 570")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 577 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 577")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 123 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 588 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 588")
end

			
when 124 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 589 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 589")
end

			
when 125 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 590 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 590")
end

			
when 126 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 592 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 592")
end

			
when 127 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 593 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 593")
end

			
when 128 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 594 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 594")
end

			
when 129 then
	yy_column := yy_column + 1
--|#line 604 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 604")
end

				last_token := E_UNKNOWN
			
when 130 then
yy_set_line_column
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
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
--|#line 603 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 603")
end
terminate
when 1 then
--|#line 440 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 440")
end

					-- Syntax error: missing double quote at
					-- end of manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSEQ_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 2 then
--|#line 501 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 501")
end

					-- Syntax error: missing character % at beginning
					-- of line in multi-line manifest string.
				column := yy_column
				line := yy_line
				set_syntax_error
				error_handler.report_SSNP_error (filename, current_position)
				column := ms_column
				line := ms_line
				last_token := E_STRERR
				set_start_condition (INITIAL)
			
when 3 then
--|#line 465 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 465")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 4 then
--|#line 269 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 269")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 307 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 307")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 333 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 333")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
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
			create an_array.make_filled (0, 0, 1871)
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
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   17,   18,   17,   19,   20,   21,   22,   16,   23,
			   22,   19,   24,   25,   26,   27,   28,   28,   28,   29,
			   30,   22,   31,   32,   33,   34,   35,   36,   37,   38,
			   34,   34,   39,   34,   34,   40,   34,   41,   42,   43,
			   34,   44,   45,   46,   47,   48,   49,   50,   34,   34,
			   51,   22,   52,   16,   33,   34,   35,   36,   38,   34,
			   40,   41,   34,   44,   45,   46,   47,   48,   22,   19,
			   16,   54,   54,   83,   55,   55,   84,   56,   56,   58,
			   59,   58,   58,   59,   58,  550,   60,   74,   75,   60,
			   62,   63,   62,   62,   63,   62,   65,   66,   65,   65,

			   66,   65,   68,   69,   70,  544,   71,   68,   69,   70,
			   77,   71,   74,   75,   80,   80,   80,  549,   78,   77,
			   79,   80,   80,   80,   95,   81,   98,   78,  144,   79,
			   92,   93,   81,   96,   96,   96,   85,   97,   97,   97,
			   97,   99,  135,  100,  100,  100,  100,   96,   96,   96,
			   96,  116,   72,  128,  175,  176,  144,   72,   86,  129,
			   86,  117,   76,  545,  135,   86,   88,  121,   86,  141,
			  149,  122,  218,  150,   89,  118,   90,  119,  106,  137,
			  104,   98,  111,  107,  123,  108,  112,  120,  142,  113,
			  109,  110,  114,  141,  138,  115,  218,  121,  177,  176, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  118,  119,  143,  551,   86,   80,  123,   86,  107,  108,
			  111,  112,  109,  110,  114,  197,  138,  115,  142,  165,
			  166,  139,  167,   86,   76,   99,  124,  100,  100,  100,
			  100,  140,  213,  125,  126,  131,  178,  101,  102,  127,
			  146,  146,  146,  146,  179,  132,  180,  133,  448,  139,
			  214,  134,  449,  140,  149,  124,  311,  150,  126,  103,
			  149,  127,  213,  150,  104,  131,  185,  101,  102,  312,
			  132,  133,  214,  134,  160,  161,  160,  147,  152,  153,
			  152,  151,  154,  151,  151,  154,  154,  154,  151,  151,
			  151,  155,  151,  151,  151,  151,  151,  154,  151,  154,

			  151,  154,  154,  154,  154,  151,  154,  151,  154,  151,
			  151,  151,  154,  151,  154,  151,  151,  154,  154,  154,
			  154,  154,  154,  151,  151,  151,  151,  151,  151,  151,
			  151,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  151,  151,  151,  157,  158,
			  157,  162,  163,  162,   80,  159,  168,  165,  169,  217,
			  167,  168,  171,  169,  197,  167,  165,  172,   94,  173,
			   94,  211,   94,   83,  212,   94,   84,   76,   94,   80,
			   80,   80,  551,  406,   94,   76,  191,  203,  203,  217,
			   81,  215,  230,  186,  187,  186,  220,   83,  268,  212, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   84,  269,   97,   97,   97,   97,  170,  201,  201,  201,
			  201,  170,  406,  215,   94,  198,  224,   94,  220,  523,
			  202,  241,  230,   99,  204,  100,  100,  100,  100,  205,
			  205,  205,  149,   94,   94,  150,   85,  182,  224,  199,
			  183,  183,  183,  241,  551,  541,  184,  209,  209,  209,
			  209,  243,  183,  229,  183,  225,  183,  183,  183,  183,
			   85,  183,  104,  183,  221,  242,  206,  183,  222,  183,
			  226,  254,  183,  183,  183,  183,  183,  183,  229,  445,
			  244,  243,  223,  239,  104,  225,  227,  242,  165,  166,
			  228,  167,  226,  254,  221,  240,  291,  222,  252,  256,

			  185,   86,  253,   86,  223,   76,  260,  445,   86,  188,
			  244,   86,  228,  239,  233,  263,  234,  189,  235,  190,
			  291,  256,  257,  252,  265,  153,  265,  258,  260,  236,
			  175,  176,  237,  266,  267,  267,  267,  263,  259,  540,
			  146,  146,  146,  146,  233,  234,  235,   86,  177,  176,
			   86,  236,  257,  538,  237,  146,  146,  146,  146,  537,
			  259,  551,  157,  158,  157,  551,   86,   76,  192,  159,
			  192,  297,   94,  337,  536,  192,  551,  147,  192,  160,
			  161,  160,  203,  203,  192,  162,  163,  162,  171,  166,
			  298,  167,  147,  297,  168,  165,  169,  337,  167,  168, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  171,  169,  292,  167,  165,  172,  300,  173,  171,  172,
			  268,  173,  298,   84,  192,  534,  296,  192,  301,  284,
			   94,   94,   94,  551,   94,  285,  285,   94,  300,   94,
			   94,  344,  292,  192,   94,  192,   94,  192,  299,   94,
			  301,  303,  192,  193,  170,  192,  296,  313,  551,  170,
			  273,  187,  273,  192,  551,  344,  305,  309,  271,  272,
			  272,  272,  204,  186,  187,  186,   94,   83,  299,   94,
			   84,  303,  313,  270,  275,  276,  276,  276,  305,  309,
			  452,  192,  402,  310,  192,   94,   94,  277,  277,  424,
			  424,  278,  278,  278,  278,  279,  279,  279,  279,  318,

			  192,   94,  192,  494,  192,  310,   94,  402,  452,  192,
			  193,  185,  192,  201,  201,  201,  201,  185,  192,  205,
			  205,  205,  287,  287,  287,  294,  280,  320,  325,  318,
			   85,  326,  199,  282,  282,  306,  329,  283,  283,  283,
			  283,  290,  295,  209,  209,  209,  209,  335,  192,  307,
			  281,  192,  330,  333,  340,  294,  286,  320,  325,  206,
			  326,  343,  433,  433,  295,  306,  329,  192,   94,  246,
			  491,  247,  369,  369,  330,  333,  340,  335,  390,  248,
			  104,  378,  249,  331,  250,  251,  345,  346,  346,  346,
			  444,  343,  265,  153,  265,  278,  278,  278,  278,  246, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  247,  332,  390,  248,  249,  484,  250,  251,  192,  284,
			  192,  378,   94,  331,  444,  192,  551,  347,  192,  278,
			  278,  278,  278,  332,  192,  347,  267,  267,  267,  267,
			  353,  187,  353,  551,  268,  285,  285,   84,  283,  283,
			  283,  283,  183,  272,  272,  272,  272,  273,  187,  273,
			  517,  551,  416,  403,  192,  484,  363,  192,  279,  279,
			  279,  279,  375,  351,  358,  276,  276,  276,  276,  411,
			  507,  364,  204,  192,   94,  192,  376,  192,  403,   94,
			  357,  416,  192,  193,  375,  192,  367,  367,  367,  367,
			  370,  370,  370,  192,  411,  199,  185,  270,  376,  365,

			  365,  505,  362,  366,  366,  366,  366,  381,  283,  283,
			  283,  283,  383,  386,  185,  389,  287,  287,  287,  479,
			  479,  192,  503,  281,  192,  387,  391,  286,  501,  381,
			  373,  373,  373,  373,  383,  386,  413,  389,  392,  394,
			  192,   94,  192,  374,  192,  368,   94,  399,  391,  192,
			  193,  401,  192,  206,  404,  387,  407,  410,  192,  414,
			  392,  394,  417,  419,  418,  447,  413,  498,  450,  399,
			  425,  425,  425,  401,  477,  551,  404,  476,  407,  410,
			  446,  414,  524,  524,  417,  429,  429,  447,  192,  418,
			  451,  192,  450,  419,  148,  346,  346,  346,  346,  267, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  267,  267,  267,  427,  428,  428,  428,  192,   94,   86,
			  446,   86,  451,   76,  453,  456,   86,   88,  183,   86,
			  369,  369,  353,  187,  353,   89,  268,   90,  472,   84,
			  551,  470,  423,  469,  551,  455,  351,  456,  185,  358,
			  430,  430,  430,  453,  272,  272,  272,  272,  434,  434,
			  434,  276,  276,  276,  276,   86,  491,  284,   86,  436,
			  436,  436,  436,  437,  437,  455,  457,  438,  438,  438,
			  438,  370,  370,  370,   86,   76,   86,  494,   86,  463,
			   76,  357,  459,   86,   77,  458,   86,  468,  362,  270,
			  457,  475,   89,  185,   90,  478,  363,  185,  366,  366,

			  366,  366,  366,  366,  366,  366,  459,  458,  286,  463,
			  467,  367,  367,  367,  367,  441,  441,  441,  441,  478,
			  465,  475,   86,  464,  440,   86,  462,  373,  373,  373,
			  373,  442,  442,  461,  466,  443,  443,  443,  443,  439,
			  440,   86,   76,  347,  267,  267,  267,  267,  281,  471,
			  473,  474,  368,  499,  348,  349,  466,  480,  480,  480,
			  438,  438,  438,  438,  281,  346,  346,  346,  346,  426,
			  426,  471,  473,  474,  460,  499,  350,  347,  424,  424,
			  454,  351,  551,  504,  348,  349,  551,  347,  425,  425,
			  425,  183,  429,  429,  500,  183,  272,  272,  272,  272, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  502,  506,  423,  358,  433,  433,  354,  355,  182,  428,
			  428,  428,  428,  504,  509,  482,  500,  508,  358,  434,
			  434,  434,  502,  515,  288,  483,  510,  432,  356,  489,
			  415,  506,  412,  357,  435,  435,  354,  355,  509,  508,
			  409,  492,  481,  481,  148,  185,  488,  515,  510,  185,
			  358,  276,  276,  276,  276,  551,  493,  443,  443,  443,
			  443,  359,  360,  511,  183,  430,  430,  430,  512,  436,
			  436,  436,  436,  438,  438,  438,  438,  495,  495,  495,
			  495,  513,  523,  361,  408,  511,  514,  516,  362,  519,
			  518,  359,  360,  148,  346,  346,  346,  346,  512,  526,

			  526,  520,  490,  513,  420,  421,  363,  182,  514,  529,
			  363,  516,  518,  519,  439,  496,  496,  405,  185,  497,
			  497,  497,  497,  520,  424,  424,  422,  441,  441,  441,
			  441,  423,  527,  529,  420,  421,  551,  443,  443,  443,
			  443,  148,  479,  479,  400,  544,  431,  431,  431,  431,
			  525,  525,  525,  433,  433,  431,  431,  431,  431,  431,
			  431,  482,  527,  398,  368,  397,  551,  148,  480,  480,
			  480,  425,  425,  425,  368,  528,  429,  429,  396,  521,
			  428,  428,  428,  428,  551,  431,  431,  431,  431,  431,
			  492,  434,  434,  434,  430,  430,  430,  528,  395,  185, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  182,  428,  428,  428,  428,  522,  535,  533,  483,  530,
			  531,  485,  486,  489,  532,  539,  393,  488,  495,  495,
			  495,  495,  497,  497,  497,  497,  479,  479,  493,  185,
			  535,  490,  533,  487,  497,  497,  497,  497,  488,  530,
			  531,  485,  486,  546,  532,  539,  388,  185,  480,  480,
			  480,  182,  524,  524,  547,  439,  182,  525,  525,  525,
			  548,  524,  524,  521,  525,  525,  525,  195,  546,  195,
			  195,  439,  385,  195,  384,  195,  547,  105,  105,  105,
			  105,  105,  548,  207,  207,  522,  382,  207,  380,  542,
			  379,  289,  289,  377,  543,  289,  371,  371,  542,  208,

			  371,  543,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   82,  288,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   87,   87,   87,   87,   87,   87,   87, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   87,   87,   87,   91,  352,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,  148,  342,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  170,  170,  170,  170,  170,  170,  170,  170,
			  170,  170,  170,  170,  170,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  181,  341,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,  200,  200,  200,  200,  200,  200,

			  339,  200,  200,  200,  200,  200,  200,  148,  338,  148,
			  148,  336,  334,  148,  328,  148,  182,  327,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  183,
			  324,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  183,  182,  323,  182,  182,  322,  321,  182,  319,
			  182,  372,  372,  372,  372,  372,  372,  317,  372,  372,
			  372,  372,  372,  372,  316,  315,  314,  308,  304,  302,
			  293,  208,  288,  274,  551,  551,  264,  262,  261,  255,
			  245,  238,  232,  231,  219,  216,  210,  208,  194,  196,
			  194,   95,  551,  551,   98,  145,  136,  130,   96,   96, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  551,   15,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551, yy_Dummy>>,
			1, 72, 1800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1871)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,    4,   20,    3,    4,   20,    3,    4,    5,
			    5,    5,    6,    6,    6,  546,    5,   13,   13,    6,
			    7,    7,    7,    8,    8,    8,    9,    9,    9,   10,

			   10,   10,   11,   11,   11,  544,   11,   12,   12,   12,
			   16,   12,   14,   14,   17,   17,   17,  539,   16,   19,
			   16,   18,   18,   18,   24,   17,   26,   19,   49,   19,
			   23,   23,   18,   26,   24,   25,   20,   25,   25,   25,
			   25,   28,   43,   28,   28,   28,   28,   30,   30,   31,
			   31,   36,   11,   40,   73,   73,   49,   12,   21,   40,
			   21,   36,   21,  528,   43,   21,   21,   38,   21,   47,
			   53,   38,  113,   53,   21,   37,   21,   37,   33,   45,
			   28,   26,   35,   33,   38,   33,   35,   37,   48,   35,
			   33,   33,   35,   47,   45,   35,  113,   38,   75,   75, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   37,   37,   48,  181,   21,   95,   38,   21,   33,   33,
			   35,   35,   33,   33,   35,   95,   45,   35,   48,   67,
			   67,   46,   67,   21,   21,   27,   39,   27,   27,   27,
			   27,   46,  108,   39,   39,   42,   76,   27,   27,   39,
			   52,   52,   52,   52,   76,   42,   76,   42,  383,   46,
			  109,   42,  383,   46,  148,   39,  231,  148,   39,   27,
			  154,   39,  108,  154,   27,   42,  181,   27,   27,  231,
			   42,   42,  109,   42,   62,   62,   62,   52,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,

			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   58,   58,
			   58,   65,   65,   65,  197,   58,   68,   68,   68,  112,
			   68,   70,   70,   70,  197,   70,   72,   72,   77,   72,
			   77,  107,   77,   82,  107,   77,   82,  558,   77,   80,
			   80,   80,   87,  327,   77,  558,   87,  101,  101,  112,
			   80,  110,  122,   85,   85,   85,  115,   85,  182,  107, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   85,  182,   97,   97,   97,   97,   68,   99,   99,   99,
			   99,   70,  327,  110,   77,   97,  118,   77,  115,  523,
			   99,  130,  122,  100,  101,  100,  100,  100,  100,  102,
			  102,  102,  347,   77,   77,  347,   82,   84,  118,   97,
			   84,   84,   84,  130,   87,  519,   84,  104,  104,  104,
			  104,  132,   84,  121,   84,  119,   84,   84,   84,   84,
			   85,   84,  100,   84,  116,  131,  102,   84,  116,   84,
			  119,  138,   84,   84,   84,   84,   84,   84,  121,  378,
			  133,  132,  116,  129,  104,  119,  120,  131,  164,  164,
			  120,  164,  119,  138,  116,  129,  210,  116,  137,  140,

			   84,   86,  137,   86,  116,   86,  142,  378,   86,   86,
			  133,   86,  120,  129,  126,  145,  126,   86,  126,   86,
			  210,  140,  141,  137,  152,  152,  152,  141,  142,  126,
			  174,  174,  126,  155,  155,  155,  155,  145,  141,  518,
			  146,  146,  146,  146,  126,  126,  126,   86,  176,  176,
			   86,  126,  141,  515,  126,  147,  147,  147,  147,  514,
			  141,  191,  157,  157,  157,  191,   86,   86,   88,  157,
			   88,  217,   88,  255,  513,   88,   88,  146,   88,  160,
			  160,  160,  203,  203,   88,  162,  162,  162,  166,  166,
			  218,  166,  147,  217,  168,  168,  168,  255,  168,  169, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  169,  169,  211,  169,  170,  170,  220,  170,  172,  172,
			  183,  172,  218,  183,   88,  509,  216,   88,  221,  203,
			  178,  562,  178,  191,  178,  204,  204,  178,  220,  562,
			  178,  262,  211,   88,   88,   89,  178,   89,  219,   89,
			  221,  223,   89,   89,  168,   89,  216,  232,  184,  169,
			  185,  185,  185,   89,  185,  262,  226,  229,  184,  184,
			  184,  184,  204,  186,  186,  186,  178,  186,  219,  178,
			  186,  223,  232,  183,  196,  196,  196,  196,  226,  229,
			  387,   89,  320,  230,   89,  178,  178,  198,  198,  348,
			  348,  198,  198,  198,  198,  199,  199,  199,  199,  237,

			   89,   89,   90,  494,   90,  230,   90,  320,  387,   90,
			   90,  184,   90,  201,  201,  201,  201,  185,   90,  205,
			  205,  205,  206,  206,  206,  215,  201,  239,  245,  237,
			  186,  245,  199,  202,  202,  227,  248,  202,  202,  202,
			  202,  209,  215,  209,  209,  209,  209,  253,   90,  227,
			  201,   90,  249,  251,  258,  215,  205,  239,  245,  206,
			  245,  261,  359,  359,  215,  227,  248,   90,   90,  136,
			  491,  136,  284,  284,  249,  251,  258,  253,  306,  136,
			  209,  294,  136,  250,  136,  136,  264,  264,  264,  264,
			  377,  261,  265,  265,  265,  277,  277,  277,  277,  136, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  136,  250,  306,  136,  136,  484,  136,  136,  188,  284,
			  188,  294,  188,  250,  377,  188,  188,  426,  188,  278,
			  278,  278,  278,  250,  188,  267,  267,  267,  267,  267,
			  270,  270,  270,  272,  270,  285,  285,  270,  282,  282,
			  282,  282,  272,  272,  272,  272,  272,  273,  273,  273,
			  471,  273,  339,  323,  188,  426,  278,  188,  279,  279,
			  279,  279,  291,  267,  276,  276,  276,  276,  276,  332,
			  458,  279,  285,  188,  188,  189,  292,  189,  323,  189,
			  272,  339,  189,  189,  291,  189,  281,  281,  281,  281,
			  286,  286,  286,  189,  332,  279,  272,  270,  292,  280,

			  280,  455,  276,  280,  280,  280,  280,  297,  283,  283,
			  283,  283,  299,  302,  273,  305,  287,  287,  287,  420,
			  420,  189,  451,  281,  189,  303,  307,  286,  449,  297,
			  290,  290,  290,  290,  299,  302,  334,  305,  308,  310,
			  189,  189,  190,  290,  190,  283,  190,  316,  307,  190,
			  190,  318,  190,  287,  325,  303,  328,  331,  190,  335,
			  308,  310,  340,  342,  341,  382,  334,  445,  384,  316,
			  349,  349,  349,  318,  417,  354,  325,  416,  328,  331,
			  379,  335,  485,  485,  340,  354,  354,  382,  190,  341,
			  386,  190,  384,  342,  346,  346,  346,  346,  346,  351, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  351,  351,  351,  352,  352,  352,  352,  190,  190,  192,
			  379,  192,  386,  192,  388,  391,  192,  192,  431,  192,
			  369,  369,  353,  353,  353,  192,  353,  192,  410,  353,
			  355,  408,  346,  407,  357,  390,  351,  391,  354,  435,
			  355,  355,  355,  388,  357,  357,  357,  357,  360,  360,
			  360,  362,  362,  362,  362,  192,  431,  369,  192,  363,
			  363,  363,  363,  364,  364,  390,  392,  364,  364,  364,
			  364,  370,  370,  370,  192,  192,  193,  435,  193,  400,
			  193,  357,  395,  193,  193,  394,  193,  406,  362,  353,
			  392,  414,  193,  355,  193,  419,  363,  357,  365,  365,

			  365,  365,  366,  366,  366,  366,  395,  394,  370,  400,
			  405,  367,  367,  367,  367,  368,  368,  368,  368,  419,
			  403,  414,  193,  401,  367,  193,  399,  373,  373,  373,
			  373,  374,  374,  397,  404,  374,  374,  374,  374,  366,
			  373,  193,  193,  266,  266,  266,  266,  266,  367,  409,
			  411,  413,  368,  446,  266,  266,  404,  421,  421,  421,
			  437,  437,  437,  437,  373,  423,  423,  423,  423,  580,
			  580,  409,  411,  413,  396,  446,  266,  424,  424,  424,
			  389,  266,  429,  452,  266,  266,  271,  425,  425,  425,
			  425,  429,  429,  429,  447,  271,  271,  271,  271,  271, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  450,  457,  423,  433,  433,  433,  271,  271,  428,  428,
			  428,  428,  428,  452,  461,  424,  447,  460,  434,  434,
			  434,  434,  450,  468,  371,  425,  462,  358,  271,  429,
			  336,  457,  333,  271,  581,  581,  271,  271,  461,  460,
			  330,  433,  582,  582,  481,  429,  428,  468,  462,  271,
			  275,  275,  275,  275,  275,  430,  434,  442,  442,  442,
			  442,  275,  275,  463,  430,  430,  430,  430,  464,  436,
			  436,  436,  436,  438,  438,  438,  438,  439,  439,  439,
			  439,  465,  481,  275,  329,  463,  466,  469,  275,  476,
			  475,  275,  275,  345,  345,  345,  345,  345,  464,  583,

			  583,  478,  430,  465,  345,  345,  436,  526,  466,  501,
			  438,  469,  475,  476,  439,  440,  440,  326,  430,  440,
			  440,  440,  440,  478,  482,  482,  345,  441,  441,  441,
			  441,  345,  498,  501,  345,  345,  356,  443,  443,  443,
			  443,  479,  479,  479,  317,  526,  356,  356,  356,  356,
			  486,  486,  486,  492,  492,  356,  356,  356,  356,  356,
			  356,  482,  498,  315,  441,  314,  489,  480,  480,  480,
			  480,  483,  483,  483,  443,  499,  489,  489,  313,  479,
			  488,  488,  488,  488,  490,  356,  356,  356,  356,  356,
			  492,  493,  493,  493,  490,  490,  490,  499,  312,  356, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  427,  427,  427,  427,  427,  480,  512,  506,  483,  503,
			  504,  427,  427,  489,  505,  516,  309,  488,  495,  495,
			  495,  495,  496,  496,  496,  496,  521,  521,  493,  489,
			  512,  490,  506,  427,  497,  497,  497,  497,  427,  503,
			  504,  427,  427,  531,  505,  516,  304,  490,  522,  522,
			  522,  524,  524,  524,  535,  495,  525,  525,  525,  525,
			  537,  542,  542,  521,  543,  543,  543,  569,  531,  569,
			  569,  497,  301,  569,  300,  569,  535,  563,  563,  563,
			  563,  563,  537,  572,  572,  522,  298,  572,  296,  524,
			  295,  576,  576,  293,  525,  576,  578,  578,  542,  289,

			  578,  543,  552,  552,  552,  552,  552,  552,  552,  552,
			  552,  552,  552,  552,  552,  553,  553,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  554,  554,
			  554,  554,  554,  554,  554,  554,  554,  554,  554,  554,
			  554,  555,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  555,  555,  555,  556,  556,  556,  556,  556,  556,
			  556,  556,  556,  556,  556,  556,  556,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  559,  288,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  559,  560,  560,  560,  560,  560,  560,  560, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  560,  560,  560,  561,  269,  561,  561,  561,  561,  561,
			  561,  561,  561,  561,  561,  561,  564,  260,  564,  564,
			  564,  564,  564,  564,  564,  564,  564,  564,  564,  565,
			  565,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  567,  567,  567,  567,  567,
			  567,  567,  567,  567,  567,  567,  567,  567,  568,  259,
			  568,  568,  568,  568,  568,  568,  568,  568,  568,  568,
			  568,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  570,  570,  570,  571,  571,  571,  571,  571,  571,

			  257,  571,  571,  571,  571,  571,  571,  573,  256,  573,
			  573,  254,  252,  573,  247,  573,  574,  246,  574,  574,
			  574,  574,  574,  574,  574,  574,  574,  574,  574,  575,
			  244,  575,  575,  575,  575,  575,  575,  575,  575,  575,
			  575,  575,  577,  242,  577,  577,  241,  240,  577,  238,
			  577,  579,  579,  579,  579,  579,  579,  236,  579,  579,
			  579,  579,  579,  579,  235,  234,  233,  228,  224,  222,
			  214,  208,  207,  195,  180,  179,  150,  144,  143,  139,
			  135,  128,  125,  123,  114,  111,  106,  103,   93,   92,
			   91,   81,   79,   78,   51,   50,   44,   41,   32,   29, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   15,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551, yy_Dummy>>,
			1, 72, 1800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 583)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   69,   70,   78,   81,   89,   92,   95,
			   98,  101,  106,   85,  110, 1800,   98,  113,  120,  107,
			   68,  154, 1801,  122,  112,  122,  112,  212,  128, 1778,
			  127,  128, 1777,  148,    0,  151,  123,  140,  143,  197,
			  121, 1759,  210,  101, 1768,  151,  190,  132,  164,   97,
			 1757, 1744,  225,  165, 1801, 1801,  277, 1801,  347, 1801,
			 1801, 1801,  273, 1801, 1801,  350, 1801,  217,  355, 1801,
			  360, 1801,  364,  152, 1801,  196,  224,  364, 1773, 1770,
			  378, 1779,  368, 1801,  432,  392,  497,  374,  564,  631,
			  698, 1781, 1775, 1779,    0,  203, 1801,  387,    0,  392,

			  410,  372,  414, 1735,  432,    0, 1758,  339,  205,  208,
			  348, 1757,  335,  135, 1756,  355,  439,    0,  374,  428,
			  447,  418,  368, 1745,    0, 1743,  487,    0, 1747,  457,
			  378,  423,  424,  454,    0, 1752,  742,  463,  430, 1751,
			  455,  495,  465, 1746, 1749,  474,  525,  540,  249, 1801,
			 1762, 1801,  523, 1801,  255,  518, 1801,  561, 1801, 1801,
			  578, 1801,  584, 1801,  486, 1801,  586, 1801,  593,  598,
			  602, 1801,  606, 1801,  528, 1801,  546, 1801,  616, 1755,
			 1752,  198,  393,  605,  643,  649,  662, 1801,  804,  871,
			  938,  553, 1005, 1072, 1801, 1764,  659,  352,  676,  680, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1801,  698,  722,  567,  610,  704,  707, 1720, 1719,  728,
			  459,  578,    0,    0, 1738,  701,  590,  529,  545,  614,
			  565,  574, 1741,  617, 1740,    0,  612,  711, 1739,  615,
			  640,  220,  612, 1738, 1733, 1736, 1718,  675, 1721,  703,
			 1708, 1718, 1705,    0, 1702,  702, 1689, 1686,  712,  708,
			  757,  712, 1684,  723, 1679,  536, 1680, 1672,  714, 1637,
			 1585,  734,  594,    0,  771,  791, 1129,  811, 1801, 1590,
			  829, 1181,  828,  846, 1801, 1236,  850,  780,  804,  843,
			  888,  871,  823,  893,  757,  820,  875,  901, 1529, 1447,
			  915,  819,  834, 1463,  755, 1458, 1454,  865, 1458,  869,

			 1446, 1442,  872,  899, 1414,  874,  741,  885,  897, 1388,
			  895,    0, 1370, 1346, 1318, 1316,  906, 1316,  910,    0,
			  647,    0,    0,  818,    0,  910, 1285,  354,  915, 1248,
			 1208,  913,  834, 1184,  910,  918, 1191,    0,    0,  823,
			  918,  929,  939,    0,    0, 1279,  980,  427,  674,  955,
			    0,  984,  988, 1021,  970, 1025, 1331, 1029, 1218,  747,
			 1033,    0, 1036, 1044, 1052, 1083, 1087, 1096, 1100, 1005,
			 1056, 1172, 1801, 1112, 1120,    0,    0,  753,  448,  955,
			    0,    0,  924,  220,  931,    0,  949,  649,  985, 1152,
			 1008,  972, 1029,    0, 1044, 1045, 1146, 1101,    0, 1094, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1053, 1091,    0, 1092, 1093, 1063, 1055, 1005, 1003, 1108,
			 1000, 1107,    0, 1108, 1067,    0,  945,  946,    0, 1058,
			  904, 1142,    0, 1150, 1163, 1173,  803, 1386, 1194, 1177,
			 1250, 1004, 1801, 1189, 1204, 1025, 1254, 1145, 1258, 1262,
			 1304, 1312, 1242, 1322,    0,  939, 1109, 1151,    0,  890,
			 1157,  894, 1159,    0,    0,  873,    0, 1177,  842,    0,
			 1175, 1177, 1183, 1220, 1244, 1238, 1244,    0, 1186, 1250,
			    0,  822,    0,    0,    0, 1247, 1252,    0, 1258, 1327,
			 1353, 1230, 1309, 1356,  753,  967, 1335,    0, 1365, 1361,
			 1379,  718, 1338, 1376,  651, 1403, 1407, 1419, 1305, 1332,

			    0, 1272,    0, 1382, 1385, 1387, 1372,    0,    0,  585,
			    0,    0, 1369,  546,  521,  525, 1389,    0,  511,  417,
			    0, 1411, 1433,  367, 1437, 1442, 1293,    0,  135,    0,
			    0, 1408,    0,    0,    0, 1411,    0, 1419,    0,   89,
			    0,    0, 1446, 1449,   53,    0,   57,    0,    0,    0,
			    0, 1801, 1501, 1514, 1527, 1540, 1553, 1566,  372, 1579,
			 1589, 1602,  616, 1469, 1615, 1628, 1641, 1654, 1667, 1464,
			 1680, 1693, 1475, 1704, 1715, 1728, 1483, 1739, 1488, 1750,
			 1161, 1226, 1234, 1291, yy_Dummy>>,
			1, 184, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 583)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  551,    1,  552,  552,  553,  553,  554,  554,  555,
			  555,  556,  556,  557,  557,  551,  558,  551,  551,  558,
			  559,  560,  551,  561,  562,  551,   19,  551,  551,  551,
			  562,  562,  551,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,   19,  551,  564,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  565,  565,  551,
			  565,  551,  566,  567,  551,  567,   19,  551,  562,  562,
			  551,  551,  559,  551,  568,  559,  560,  560,  560,  560,
			  560,  551,  569,  551,   19,  570,  551,  551,   76,  571,

			  551,  551,  551,  572,  551,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  551,  551,  564,  551,
			  573,  551,  551,  551,  564,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  565,  551,  565,  551,  565,  565,
			  566,  551,  566,  551,  567,  551,  567,  551,  551,  562,
			  562,  568,  574,  575,  568,  568,  559,  551,  560,  560,
			  560,  560,  560,  560,  551,  551,  551,  570,  551,  551, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  551,  551,  551,  551,  551,  551,  551,  572,  576,  551,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  551,  551,  551,  551,  551,  577,
			  575,  568,  568,  568,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  578,  576,
			  579,  563,  563,  563,  563,  563,  563,  563,  563,  563,

			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  551,  551,  564,  551,  551,
			  580,  551,  551,  575,  568,  568,  568,  568,  551,  551,
			  551,  581,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  578,  551,  551,  551,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  551,  551,  582,  551,  551,  551,  580,  551,  551,  568,
			  568,  356,  551,  551,  551,  581,  551,  551,  551,  551,
			  551,  551,  551,  551,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  551,
			  551,  582,  551,  551,  580,  551,  551,  583,  551,  568,
			  568,  356,  551,  551,  581,  551,  551,  551,  563,  563,

			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  551,  551,  582,  551,  551,  583,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  551,  551,  583,  563,  563,  563,  563,  563,
			  563,    0,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551, yy_Dummy>>,
			1, 184, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (70, 200, 5759)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (70, 5960, 8191)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (70, 8392, 12287)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   70,   70,   70,   70,   70,   70,   70,   70,    1,
			    2,    1,    1,    3,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,    6,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,
			   49,    7,   50,   51,    4,   52,   53,   54,   55,   56,

			   57,   28,   58,   30,   59,   32,   33,   34,   60,   36,
			   61,   38,   39,   62,   63,   64,   65,   66,   67,   46,
			   47,   48,   49,   68,    6,   51,   69,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			    1,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,

			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70, yy_Dummy>>,
			1, 200, 5760)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,    1,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,    1,   70,   70,   70,   70,

			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70, yy_Dummy>>,
			1, 200, 8192)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   70,   70, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,   13,    3,   13,    4,    5,    6,
			    6,   13,   13,    7,    5,    8,    8,    8,    8,    4,
			    5,    4,    5,    4,    9,    9,    9,    9,    8,    9,
			   10,   11,   10,   10,   10,   11,   10,   11,   10,   10,
			   11,   11,   11,   11,   11,   11,   10,   10,   10,   10,
			   13,    4,   12,   13,    8,    8,    8,    8,    8,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,    4,   13,
			   13, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 552)
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
			    1,    1,    1,    1,    1,    1,    2,    5,    8,   10,
			   14,   17,   21,   24,   27,   30,   33,   37,   40,   43,
			   46,   49,   52,   55,   58,   61,   64,   67,   70,   73,
			   76,   79,   82,   85,   88,   91,   94,   97,  100,  103,
			  106,  109,  112,  114,  116,  118,  120,  122,  124,  126,
			  128,  131,  133,  135,  137,  139,  141,  143,  145,  147,
			  149,  151,  154,  156,  158,  160,  162,  163,  163,  163,
			  163,  164,  164,  165,  167,  167,  169,  171,  172,  173,
			  174,  175,  176,  176,  178,  179,  180,  181,  183,  185,

			  185,  186,  186,  186,  186,  187,  188,  189,  190,  191,
			  193,  194,  195,  196,  197,  198,  199,  200,  202,  203,
			  204,  205,  206,  207,  208,  210,  211,  212,  214,  215,
			  216,  217,  218,  219,  220,  222,  223,  224,  225,  226,
			  227,  228,  229,  230,  231,  232,  233,  234,  234,  235,
			  236,  236,  237,  238,  239,  241,  243,  245,  245,  246,
			  247,  247,  248,  248,  249,  249,  250,  250,  251,  251,
			  251,  251,  253,  253,  255,  255,  256,  256,  258,  259,
			  260,  261,  261,  262,  263,  263,  264,  265,  266,  268,
			  270,  272,  273,  275,  277,  278,  279,  280,  281,  281, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  281,  282,  284,  284,  285,  285,  286,  286,  287,  287,
			  288,  289,  290,  292,  294,  295,  296,  297,  298,  299,
			  300,  301,  302,  303,  304,  305,  307,  308,  309,  310,
			  311,  312,  313,  314,  315,  316,  317,  318,  319,  320,
			  321,  322,  324,  325,  327,  328,  329,  330,  331,  332,
			  333,  334,  335,  336,  337,  338,  339,  340,  341,  342,
			  343,  344,  345,  346,  348,  348,  348,  349,  350,  351,
			  351,  353,  353,  353,  353,  354,  355,  356,  356,  358,
			  359,  359,  359,  359,  361,  362,  363,  364,  365,  366,
			  367,  367,  368,  369,  370,  371,  372,  373,  374,  375,

			  376,  377,  378,  379,  380,  382,  383,  384,  385,  386,
			  387,  388,  390,  391,  392,  393,  394,  395,  396,  397,
			  399,  400,  402,  404,  405,  407,  408,  409,  410,  411,
			  412,  413,  414,  415,  416,  417,  418,  419,  421,  423,
			  424,  425,  426,  427,  429,  431,  431,  431,  433,  433,
			  433,  433,  433,  433,  434,  434,  434,  434,  434,  435,
			  435,  435,  435,  435,  435,  435,  435,  439,  440,  440,
			  441,  442,  443,  444,  445,  445,  447,  449,  450,  451,
			  452,  454,  456,  457,  458,  459,  461,  462,  463,  464,
			  465,  466,  467,  468,  470,  471,  472,  473,  474,  476, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  477,  478,  479,  481,  482,  483,  484,  485,  486,  487,
			  488,  489,  490,  492,  493,  494,  496,  497,  498,  500,
			  501,  501,  501,  501,  501,  502,  503,  504,  504,  504,
			  504,  504,  504,  505,  506,  507,  508,  509,  509,  510,
			  510,  510,  511,  511,  512,  514,  515,  516,  517,  519,
			  520,  521,  522,  523,  525,  527,  528,  530,  531,  532,
			  534,  535,  536,  537,  538,  539,  540,  541,  543,  544,
			  545,  547,  548,  550,  552,  554,  555,  556,  558,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  561,  561,  563,  564,

			  565,  567,  568,  570,  571,  572,  573,  574,  576,  578,
			  579,  581,  583,  584,  585,  586,  587,  588,  590,  591,
			  592,  594,  594,  594,  594,  594,  594,  594,  596,  597,
			  599,  601,  602,  604,  606,  608,  609,  611,  612,  614,
			  615,  617,  619,  619,  619,  619,  621,  622,  624,  626,
			  628,  630,  630, yy_Dummy>>,
			1, 153, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 629)
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
			    0,  131,   73,  129,  130,    1,  129,  130,    1,  130,
			    2,   73,  129,  130,   94,  129,  130,   72,   73,  129,
			  130,    2,  129,  130,   80,  129,  130,    2,  129,  130,
			    2,  129,  130,    2,   73,  129,  130,  110,  129,  130,
			  110,  129,  130,    2,  129,  130,    2,  129,  130,    2,
			  129,  130,    2,  129,  130,   71,  129,  130,   71,  129,
			  130,   71,  129,  130,   71,  129,  130,   71,  129,  130,
			   71,  129,  130,   71,  129,  130,   71,  129,  130,   71,
			  129,  130,   71,  129,  130,   71,  129,  130,   71,  129,
			  130,   71,  129,  130,   71,  129,  130,   71,  129,  130,

			   71,  129,  130,   71,  129,  130,   71,  129,  130,   73,
			  129,  130,  129,  130,  100,  130,  104,  130,  101,  130,
			  103,  130,  109,  130,  109,  130,  108,  130,  107,  109,
			  130,  106,  130,  106,  130,  105,  130,   84,  130,   84,
			  130,   83,  130,   89,  130,   89,  130,   88,  130,   89,
			  130,   86,   89,  130,   89,  130,   92,  130,   91,  130,
			   92,  130,   73,    1,   94,   81,   93,   94, -212,   72,
			   73,   72,   72,   72,   72,   80,   79,   80,   73,    1,
			    3,  125,  128,    3,   73,  110,  113,   71,   71,   71,
			   71,    8,   71,   71,   71,   71,   71,   71,   71,   71, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   17,   71,   71,   71,   71,   71,   71,   71,   29,   71,
			   71,   71,   36,   71,   71,   71,   71,   71,   71,   71,
			   44,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,  112,  100,  101,  102,  102,   95,  100,
			  102,   98,  102,   99,  102,  108,  107,  105,   83,   88,
			   86,   87,   88,   85,   86,   91,   90,   91,   73,   73,
			   73,   94,   94, -212,   94,  -82,   72,   73,   72,   73,
			   72,   73,   72,   72,   73,   72,   73,   74,   80,   78,
			    1,  123,  125,  128,  120,  117,  114,  111,   71,   71,
			    6,   71,    7,   71,   71,   71,   71,   71,   71,   71,

			   71,   71,   71,   71,   71,   20,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   40,   71,   71,   42,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   64,   71,   97,   97,
			   93,   94, -212,   75,   77,   77,  125,  128,  128,  124,
			  127,  122,  121,  119,  118,  116,  115,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   18,   71,   71,   71,   71,   71,   71,   71,   27,   71,
			   71,   71,   71,   71,   71,   71,   71,   37,   71,   71, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   39,   71,   69,   71,   71,   43,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   56,
			   71,   57,   71,   71,   71,   71,   71,   62,   71,   63,
			   71,   96,  100,   94,   80,  124,  125,  127,  128,  128,
			  120,  117,  114,  126,  128,    4,   71,    5,   71,   71,
			   71,   71,   10,   71,   65,   71,   71,   71,   71,   15,
			   71,   71,   71,   71,   71,   71,   71,   71,   25,   71,
			   71,   71,   71,   71,   32,   71,   71,   71,   71,   38,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   52,   71,   71,   71,   55,   71,   71,   71,   60,   71,

			   71,   97,   97,   97,   76,   77,   77,   77,  128,  128,
			  127,  127,    9,   71,   71,   71,   71,   12,   71,   71,
			   71,   71,   71,   19,   71,   21,   71,   71,   23,   71,
			   71,   71,   28,   71,   71,   71,   71,   71,   71,   71,
			   71,   46,   71,   71,   71,   48,   71,   71,   50,   71,
			   51,   71,   53,   71,   71,   71,   59,   71,   71,  127,
			  128,  127,  128,   71,   71,   11,   71,   71,   14,   71,
			   71,   71,   71,   71,   26,   71,   30,   71,   71,   33,
			   71,   34,   71,   71,   71,   71,   71,   71,   49,   71,
			   71,   71,   61,   71,   66,   71,   71,   13,   71,   16, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   71,   71,   22,   71,   24,   71,   31,   71,   71,   41,
			   71,   71,   47,   71,   71,   54,   71,   58,   71,   67,
			   71,   71,   35,   71,   45,   71,   70,   71,   68,   71, yy_Dummy>>,
			1, 30, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1801
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 551
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 552
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 70
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

	yyNb_rules: INTEGER = 130
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 131
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	MS: INTEGER = 1
	MSN: INTEGER = 2
	MSN1: INTEGER = 3
	VS1: INTEGER = 4
	VS2: INTEGER = 5
	VS3: INTEGER = 6
			-- Start condition codes

feature -- User-defined features



end
