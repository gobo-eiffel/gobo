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
				set_start_condition (VS1)
			
when 83 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 257 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 257")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 84 then
	yy_column := yy_column + 1
--|#line 262 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 262")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 278 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 278")
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
--|#line 288 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 288")
end

				more
				set_start_condition (VS3)
			
when 87 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 292 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 292")
end

				more
				last_literal_end := text_count - 2
			
when 88 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 296 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 296")
end

				more
				last_literal_end := text_count - 1
			
when 89 then
	yy_column := yy_column + 1
--|#line 300 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 300")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 90 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 316 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 316")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 91 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 321 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 321")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 92 then
	yy_column := yy_column + 1
--|#line 326 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 326")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 340 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 340")
end

					-- Left-aligned verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				set_start_condition (LAVS1)
			
when 94 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 349 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 349")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
when 95 then
	yy_column := yy_column + 1
--|#line 354 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 354")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 370 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 370")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := no_verbatim_marker
					verbatim_marker_count := 0
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 380 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 380")
end

				more
				set_start_condition (LAVS3)
			
when 98 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 384 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 384")
end

				more
				last_literal_end := text_count - 2
			
when 99 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 388 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 388")
end

				more
				last_literal_end := text_count - 1
			
when 100 then
	yy_column := yy_column + 1
--|#line 392 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 392")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 101 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 408 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 408")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
when 102 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 413 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 413")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
when 103 then
	yy_column := yy_column + 1
--|#line 418 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 418")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 432 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 432")
end

					-- Manifest string with special characters.
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 435 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 435")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 106 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 446 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 446")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 107 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 451 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 451")
end

				more
			
when 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 454 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 454")
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
			
when 109 then
	yy_column := yy_column + 2
--|#line 466 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 466")
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
			
when 110 then
	yy_column := yy_column + 2
--|#line 478 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 478")
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
			
when 111 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 491 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 491")
end

				more
			
when 112 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 494 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 494")
end

				set_start_condition (INITIAL)
			
when 113 then
	yy_column := yy_column + 2
--|#line 497 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 497")
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
			
when 114 then
	yy_column := yy_column + 1
--|#line 508 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 508")
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
			
when 115 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 520 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 520")
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
			
when 116 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 546 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 546")
end

				more
				set_start_condition (MSN)
			
when 117 then
	yy_column := yy_column + 1
--|#line 550 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 550")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 565 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 565")
end

				more
				set_start_condition (MS)
			
when 119 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 569 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 569")
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
			
when 120 then
	yy_column := yy_column + 1
--|#line 580 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 580")
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
			
when 121 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 609 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 609")
end

			
when 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 611 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 611")
end

			
when 123 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 613 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 613")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 124 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 620 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 620")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 125 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 627 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 627")
end

			
when 126 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 629 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 629")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 127 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 636 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 636")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 128 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 643 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 643")
end

			
when 129 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 645 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 645")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 130 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 652 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 652")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 131 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 659 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 659")
end

			
when 132 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 661 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 661")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 133 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 668 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 668")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 134 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 679 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 679")
end

			
when 135 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 680 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 680")
end

			
when 136 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 681 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 681")
end

			
when 137 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 683 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 683")
end

			
when 138 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 684 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 684")
end

			
when 139 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 685 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 685")
end

			
when 140 then
	yy_column := yy_column + 1
--|#line 695 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 695")
end

				last_token := E_UNKNOWN
			
when 141 then
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
--|#line 694 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 694")
end
terminate
when 1 then
--|#line 531 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 531")
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
--|#line 592 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 592")
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
--|#line 556 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 556")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 4 then
--|#line 268 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 268")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 306 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 306")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 332 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 332")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 7 then
--|#line 360 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 360")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 8 then
--|#line 398 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 398")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 9 then
--|#line 424 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 424")
end

					-- No final bracket-double-quote.
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
			create an_array.make_filled (0, 0, 2083)
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
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   23,   24,   23,   25,   26,   27,   28,   22,   29,
			   28,   25,   30,   31,   32,   33,   34,   34,   34,   35,
			   36,   28,   37,   38,   39,   40,   41,   42,   43,   44,
			   40,   40,   45,   40,   40,   46,   40,   47,   48,   49,
			   40,   50,   51,   52,   53,   54,   55,   56,   40,   40,
			   28,   57,   28,   58,   22,   39,   40,   41,   42,   44,
			   40,   46,   47,   40,   50,   51,   52,   53,   54,   28,
			   28,   25,   22,   60,   60,  591,   61,   61,  163,   62,
			   62,   64,   65,   64,   64,   65,   64,  585,   66,   80,
			   81,   66,   68,   69,   68,   68,   69,   68,   71,   72,

			   71,   71,   72,   71,   74,   75,   76,  163,   77,   74,
			   75,   76,  114,   77,   80,   81,   83,   84,   83,   83,
			   84,   83,  115,   86,   87,   88,  160,   89,   86,   87,
			   88,   95,   89,   92,   93,   92,   93,  111,  112,   96,
			   95,   97,   98,   98,   98,   98,   98,   98,   96,  101,
			   97,  160,  102,   99,  117,  115,   99,  116,  116,  116,
			  116,  115,  118,  590,  119,  119,  119,  119,  115,  115,
			  115,  115,  135,   78,   90,  147,  130,  154,   78,   90,
			  131,  148,  136,  132,  161,  586,  133,  213,  156,  134,
			  165,  165,  165,  165,  103,  214,  168,  215,  162,  169, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  154,  564,  123,  157,  252,  130,  131,   98,  137,  133,
			  138,  117,  134,  104,  105,  161,  105,  235,   94,  267,
			  139,  105,  107,   98,  105,  140,  157,  252,  166,  141,
			  108,  125,  109,  235,  137,  138,  126,  253,  127,  143,
			  251,  158,  142,  128,  129,  267,  144,  145,  176,  177,
			  176,  159,  146,  194,  195,  178,  140,  179,  180,  179,
			  253,  105,  126,  127,  105,  142,  128,  129,  150,  143,
			  158,  251,  145,  582,  159,  146,  184,  185,  151,  186,
			  152,  105,   94,  118,  153,  119,  119,  119,  119,  181,
			  182,  181,  196,  195,  255,  120,  121,  184,  191,  150,

			  192,  197,  198,  197,  151,  152,  489,  153,  200,  201,
			  490,  202,  200,  207,   94,  208,  113,  122,  210,  211,
			  212,  211,   94,  123,  113,  255,  120,  121,  171,  172,
			  171,  170,  173,  170,  170,  173,  173,  173,  170,  170,
			  170,  174,  170,  170,  170,  170,  170,  173,  170,  173,
			  170,  173,  173,  173,  173,  170,  173,  170,  173,  170,
			  170,  170,  173,  170,  173,  170,  170,  173,  173,  173,
			  173,  173,  173,  170,  170,  170,  170,  170,  170,  170,
			  170,  170,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  170,  170,  170,  170, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  187,  184,  188,  258,  186,  187,  190,  188,  256,  186,
			  203,  200,  204,  581,  202,  203,  206,  204,  113,  202,
			  113,  249,  113,  592,  250,  113,  258,  229,  113,   98,
			   98,   98,  101,  256,  113,  102,  239,  239,  239,  239,
			   99,  222,  223,  222,  262,  101,  241,  241,  102,  240,
			  250,  116,  116,  116,  116,  265,  224,  225,  224,  266,
			  101,  205,  579,  102,  236,  113,  205,  262,  113,  189,
			  243,  243,  243,  263,  189,  279,  268,  103,  168,  277,
			  280,  169,  266,  578,  242,  113,  113,  592,  264,  237,
			  103,  278,  247,  247,  247,  247,  104,  217,  279,  353,

			  218,  218,  218,  280,  263,  103,  219,  268,  244,  104,
			  277,  264,  218,  443,  218,  292,  218,  218,  218,  218,
			  281,  218,  259,  218,  104,  353,  260,  218,  282,  218,
			  123,  294,  218,  218,  218,  218,  218,  218,  292,  443,
			  261,  118,  220,  119,  119,  119,  119,  168,  290,  447,
			  169,  281,  291,  259,  294,  295,  260,  194,  195,  282,
			  296,  221,  105,  261,  105,  577,   94,  298,  592,  105,
			  226,  297,  105,  271,  290,  272,  301,  273,  227,  447,
			  228,  123,  165,  165,  165,  165,  295,  575,  274,  457,
			  298,  275,  196,  195,  297,  303,  172,  303,  535,  301, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  304,  305,  305,  305,  271,  272,  273,  184,  185,  105,
			  186,  274,  105,  220,  275,  165,  165,  165,  165,  457,
			  166,  176,  177,  176,  179,  180,  179,  351,  178,  105,
			   94,  230,  221,  230,  387,  113,  210,  211,  230,  592,
			  352,  230,  181,  182,  181,  190,  185,  230,  186,  444,
			  187,  184,  188,  166,  186,  187,  190,  188,  592,  186,
			  184,  191,  592,  192,  190,  191,  532,  192,  197,  198,
			  197,  200,  201,  525,  202,  444,  206,  201,  230,  202,
			  331,  230,  203,  200,  204,  332,  202,  203,  206,  204,
			  336,  202,  200,  207,  525,  208,  212,  211,  230,  113,

			  230,  558,  230,  306,  113,  331,  307,  230,  231,  337,
			  230,  206,  207,  113,  208,  113,  332,  113,  230,  189,
			  113,  336,  592,  113,  189,  306,  241,  241,  102,  113,
			  592,  339,  337,  205,  334,  312,  223,  312,  205,  592,
			  310,  311,  311,  311,  313,  225,  313,  230,  592,  338,
			  230,  335,  222,  223,  222,  340,  101,  377,  384,  102,
			  113,  343,  339,  113,  324,  334,  548,  230,  113,  230,
			  308,  230,  338,  113,  335,  220,  230,  231,  340,  230,
			  113,  113,  377,  384,  220,  230,  546,  325,  325,  309,
			  341,  345,  343,  220,  221,  224,  225,  224,  544,  101, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  542,  103,  102,  221,  315,  316,  316,  316,  319,  319,
			  319,  319,  221,  341,  345,  452,  230,  317,  317,  230,
			  104,  318,  318,  318,  318,  242,  239,  239,  239,  239,
			  243,  243,  243,  327,  327,  327,  230,  113,  284,  320,
			  285,  452,  349,  539,  103,  518,  237,  517,  286,  350,
			  358,  287,  346,  288,  289,  322,  322,  465,  465,  323,
			  323,  323,  323,  104,  321,  349,  347,  360,  326,  284,
			  285,  244,  350,  286,  287,  369,  288,  289,  230,  370,
			  230,  358,  113,  346,  373,  230,  592,  330,  230,  247,
			  247,  247,  247,  365,  230,  380,  366,  513,  360,  371,

			  375,  383,  370,  303,  172,  303,  369,  373,  385,  386,
			  386,  386,  318,  318,  318,  318,  416,  372,  380,  387,
			  305,  305,  305,  305,  365,  230,  366,  123,  230,  417,
			  371,  375,  383,  422,  393,  223,  393,  431,  306,  416,
			  372,  102,  216,  216,  419,  230,  113,  230,  424,  230,
			  511,  113,  417,  459,  230,  231,  422,  230,  391,  394,
			  225,  394,  431,  306,  216,  230,  102,  510,  312,  223,
			  312,  424,  592,  216,  216,  419,  313,  225,  313,  459,
			  592,  410,  410,  308,  318,  318,  318,  318,  485,  399,
			  316,  316,  316,  316,  230,  325,  325,  230,  427,  406, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  406,  509,  309,  407,  407,  407,  407,  218,  308,  408,
			  408,  408,  408,  485,  230,  113,  230,  220,  230,  324,
			  113,  427,  404,  230,  231,  220,  230,  309,  403,  411,
			  411,  411,  230,  242,  428,  486,  221,  319,  319,  319,
			  319,  327,  327,  327,  221,  168,  532,  321,  169,  430,
			  405,  323,  323,  323,  323,  432,  323,  323,  323,  323,
			  454,  474,  474,  230,  486,  428,  230,  326,  414,  414,
			  414,  414,  430,  433,  435,  237,  440,  442,  432,  244,
			  494,  415,  445,  230,  113,  105,  448,  105,  451,   94,
			  455,  454,  105,  107,  409,  105,  433,  435,  458,  440,

			  442,  108,  460,  109,  592,  445,  466,  466,  466,  448,
			  494,  451,  487,  455,  470,  470,  167,  386,  386,  386,
			  386,  458,  305,  305,  305,  305,  468,  469,  469,  469,
			  520,  520,  105,  460,  488,  105,  492,  393,  223,  393,
			  491,  306,  493,  487,  102,  475,  475,  475,  496,  220,
			  497,  499,  105,   94,  105,  464,  105,  488,   94,  492,
			  391,  105,   95,  508,  105,  491,  592,  506,  221,  498,
			  108,  493,  109,  497,  499,  500,  471,  471,  471,  496,
			  394,  225,  394,  574,  306,  519,  308,  102,  407,  407,
			  407,  407,  478,  478,  498,  216,  479,  479,  479,  479, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  500,  105,  410,  410,  105,  309,  216,  216,  504,  574,
			  519,  220,  316,  316,  316,  316,  477,  477,  477,  477,
			  516,  105,   94,  387,  305,  305,  305,  305,  216,  308,
			  221,  411,  411,  411,  388,  389,  550,  216,  216,  504,
			  324,  507,  505,  407,  407,  407,  407,  503,  309,  502,
			  403,  516,  501,  399,  404,  495,  390,  408,  408,  408,
			  408,  550,  391,  328,  507,  388,  389,  592,  512,  326,
			  481,  473,  482,  482,  482,  482,  218,  311,  311,  311,
			  311,  480,  514,  414,  414,  414,  414,  395,  396,  545,
			  515,  512,  535,  483,  483,  321,  481,  484,  484,  484,

			  484,  521,  521,  521,  456,  514,  387,  465,  465,  397,
			  409,  547,  220,  515,  453,  398,  450,  167,  395,  396,
			  545,  321,  386,  386,  386,  386,  553,  387,  466,  466,
			  466,  221,  399,  316,  316,  316,  316,  479,  479,  479,
			  479,  540,  547,  400,  401,  523,  217,  469,  469,  469,
			  469,  449,  592,  399,  474,  474,  564,  553,  592,  446,
			  464,  218,  470,  470,  540,  402,  524,  218,  471,  471,
			  471,  403,  565,  565,  400,  401,  167,  386,  386,  386,
			  386,  484,  484,  484,  484,  529,  568,  461,  462,  537,
			  537,  541,  533,  538,  538,  538,  538,  220,  543,  441, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  530,  467,  467,  220,  549,  551,  531,  476,  476,  463,
			  399,  475,  475,  475,  541,  464,  221,  568,  461,  462,
			  592,  543,  221,  477,  477,  477,  477,  549,  551,  439,
			  472,  472,  472,  472,  566,  566,  566,  552,  556,  472,
			  472,  472,  472,  472,  472,  479,  479,  479,  479,  534,
			  522,  522,  536,  536,  536,  536,  482,  482,  482,  482,
			  552,  404,  438,  556,  571,  220,  484,  484,  484,  484,
			  472,  472,  472,  472,  472,  554,  555,  557,  559,  437,
			  560,  465,  465,  404,  221,  217,  469,  469,  469,  469,
			  480,  561,  474,  474,  409,  571,  526,  527,  554,  555,

			  436,  559,  557,  569,  409,  560,  167,  520,  520,  167,
			  521,  521,  521,  570,  561,  466,  466,  466,  528,  523,
			  469,  469,  469,  469,  529,  592,  569,  526,  527,  592,
			  533,  475,  475,  475,  572,  470,  470,  573,  570,  471,
			  471,  471,  576,  588,  580,  562,  520,  520,  563,  536,
			  536,  536,  536,  524,  538,  538,  538,  538,  529,  538,
			  538,  538,  538,  217,  587,  572,  588,  576,  573,  534,
			  220,  589,  434,  530,  220,  580,  429,  531,  521,  521,
			  521,  217,  565,  565,  562,  565,  565,  480,  426,  221,
			  587,  245,  245,  221,  589,  245,  425,  480,  217,  566, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  566,  566,  585,  566,  566,  566,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  563,  329,  329,  423,
			  583,  329,  421,  583,  124,  124,  124,  124,  124,  420,
			  233,  418,  233,  233,  567,  567,  233,  584,  233,  246,
			  328,  584,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   73,   73,   73,   73,   73,   73,

			   73,   73,   73,   73,   73,   73,   73,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,  100,
			  392,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  110,  382,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  167,  381,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  183,  183, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  189,  189,  189,  189,  189,  189,  189,  189,  189,
			  189,  189,  189,  189,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  216,  379,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,

			  114,  114,  238,  238,  238,  238,  238,  238,  378,  238,
			  238,  238,  238,  238,  238,  167,  376,  167,  167,  374,
			  368,  167,  367,  167,  217,  364,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  218,  363,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  217,  362,  217,  217,  361,  359,  217,  357,  217,  412,
			  412,  356,  355,  412,  413,  413,  413,  413,  413,  413,
			  354,  413,  413,  413,  413,  413,  413,  348,  344,  342,
			  333,  246,  328,  314,  592,  592,  302,  300,  299,  293,
			  283,  276,  270,  269,  257,  254,  248,  246,  232,  234, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  232,  114,  592,  592,  117,  164,  155,  149,  115,  115,
			  592,   21,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592, yy_Dummy>>,
			1, 84, 2000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2083)
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
			    1,    1,    1,    3,    4,  587,    3,    4,   55,    3,
			    4,    5,    5,    5,    6,    6,    6,  585,    5,   13,
			   13,    6,    7,    7,    7,    8,    8,    8,    9,    9,

			    9,   10,   10,   10,   11,   11,   11,   55,   11,   12,
			   12,   12,   30,   12,   14,   14,   15,   15,   15,   16,
			   16,   16,   30,   17,   17,   17,   53,   17,   18,   18,
			   18,   22,   18,   19,   19,   20,   20,   29,   29,   22,
			   25,   22,   23,   23,   23,   24,   24,   24,   25,   26,
			   25,   53,   26,   23,   32,   31,   24,   31,   31,   31,
			   31,   32,   34,  580,   34,   34,   34,   34,   36,   36,
			   37,   37,   42,   11,   17,   46,   41,   49,   12,   18,
			   41,   46,   42,   41,   54,  569,   41,   94,   51,   41,
			   58,   58,   58,   58,   26,   94,   59,   94,   54,   59, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   49,  564,   34,   51,  128,   41,   41,  114,   43,   41,
			   43,   32,   41,   26,   27,   54,   27,  114,   27,  140,
			   43,   27,   27,  235,   27,   44,   51,  128,   58,   44,
			   27,   39,   27,  235,   43,   43,   39,  129,   39,   45,
			  127,   52,   44,   39,   39,  140,   45,   45,   64,   64,
			   64,   52,   45,   79,   79,   64,   44,   68,   68,   68,
			  129,   27,   39,   39,   27,   44,   39,   39,   48,   45,
			   52,  127,   45,  560,   52,   45,   73,   73,   48,   73,
			   48,   27,   27,   33,   48,   33,   33,   33,   33,   71,
			   71,   71,   81,   81,  131,   33,   33,   78,   78,   48,

			   78,   83,   83,   83,   48,   48,  424,   48,   85,   85,
			  424,   85,   90,   90,  602,   90,  606,   33,   91,   91,
			   93,   93,  602,   33,  606,  131,   33,   33,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   74,   74,   74,  134,   74,   76,   76,   76,  132,   76,
			   86,   86,   86,  559,   86,   88,   88,   88,   95,   88,
			   95,  126,   95,  106,  126,   95,  134,  106,   95,   98,
			   98,   98,  100,  132,   95,  100,  118,  118,  118,  118,
			   98,  103,  103,  103,  137,  103,  120,  120,  103,  118,
			  126,  116,  116,  116,  116,  139,  104,  104,  104,  139,
			  104,   86,  556,  104,  116,   95,   88,  137,   95,   74,
			  121,  121,  121,  138,   76,  149,  141,  100,  167,  148,
			  150,  167,  139,  555,  120,   95,   95,  106,  138,  116,
			  103,  148,  123,  123,  123,  123,  100,  102,  149,  270,

			  102,  102,  102,  150,  138,  104,  102,  141,  121,  103,
			  148,  138,  102,  360,  102,  157,  102,  102,  102,  102,
			  151,  102,  135,  102,  104,  270,  135,  102,  152,  102,
			  123,  159,  102,  102,  102,  102,  102,  102,  157,  360,
			  135,  119,  102,  119,  119,  119,  119,  173,  156,  367,
			  173,  151,  156,  135,  159,  160,  135,  193,  193,  152,
			  160,  102,  105,  135,  105,  554,  105,  161,  216,  105,
			  105,  160,  105,  145,  156,  145,  164,  145,  105,  367,
			  105,  119,  165,  165,  165,  165,  160,  550,  145,  379,
			  161,  145,  195,  195,  160,  171,  171,  171,  535,  164, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  174,  174,  174,  174,  145,  145,  145,  183,  183,  105,
			  183,  145,  105,  216,  145,  166,  166,  166,  166,  379,
			  165,  176,  176,  176,  179,  179,  179,  269,  176,  105,
			  105,  107,  216,  107,  467,  107,  209,  209,  107,  107,
			  269,  107,  181,  181,  181,  185,  185,  107,  185,  363,
			  187,  187,  187,  166,  187,  188,  188,  188,  229,  188,
			  189,  189,  229,  189,  191,  191,  532,  191,  197,  197,
			  197,  199,  199,  467,  199,  363,  201,  201,  107,  201,
			  248,  107,  203,  203,  203,  249,  203,  204,  204,  204,
			  254,  204,  205,  205,  525,  205,  211,  211,  107,  107,

			  108,  512,  108,  217,  108,  248,  217,  108,  108,  255,
			  108,  207,  207,  213,  207,  213,  249,  213,  108,  187,
			  213,  254,  229,  213,  188,  218,  241,  241,  218,  213,
			  219,  257,  255,  203,  253,  220,  220,  220,  204,  220,
			  219,  219,  219,  219,  221,  221,  221,  108,  221,  256,
			  108,  253,  222,  222,  222,  258,  222,  293,  300,  222,
			  213,  261,  257,  213,  241,  253,  499,  108,  108,  109,
			  218,  109,  256,  109,  253,  219,  109,  109,  258,  109,
			  213,  213,  293,  300,  220,  109,  496,  242,  242,  218,
			  259,  264,  261,  221,  219,  224,  224,  224,  492,  224, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  490,  222,  224,  220,  234,  234,  234,  234,  237,  237,
			  237,  237,  221,  259,  264,  372,  109,  236,  236,  109,
			  222,  236,  236,  236,  236,  242,  239,  239,  239,  239,
			  243,  243,  243,  244,  244,  244,  109,  109,  155,  239,
			  155,  372,  267,  486,  224,  458,  237,  457,  155,  268,
			  275,  155,  265,  155,  155,  240,  240,  388,  388,  240,
			  240,  240,  240,  224,  239,  267,  265,  277,  243,  155,
			  155,  244,  268,  155,  155,  286,  155,  155,  226,  287,
			  226,  275,  226,  265,  289,  226,  226,  247,  226,  247,
			  247,  247,  247,  283,  226,  296,  283,  451,  277,  288,

			  291,  299,  287,  303,  303,  303,  286,  289,  302,  302,
			  302,  302,  317,  317,  317,  317,  331,  288,  296,  305,
			  305,  305,  305,  305,  283,  226,  283,  247,  226,  332,
			  288,  291,  299,  337,  308,  308,  308,  346,  308,  331,
			  288,  308,  311,  311,  334,  226,  226,  227,  339,  227,
			  449,  227,  332,  381,  227,  227,  337,  227,  305,  309,
			  309,  309,  346,  309,  311,  227,  309,  448,  312,  312,
			  312,  339,  312,  311,  311,  334,  313,  313,  313,  381,
			  313,  324,  324,  308,  318,  318,  318,  318,  418,  316,
			  316,  316,  316,  316,  227,  325,  325,  227,  342,  320, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  320,  447,  308,  320,  320,  320,  320,  472,  309,  321,
			  321,  321,  321,  418,  227,  227,  228,  312,  228,  324,
			  228,  342,  318,  228,  228,  313,  228,  309,  316,  326,
			  326,  326,  228,  325,  343,  419,  312,  319,  319,  319,
			  319,  327,  327,  327,  313,  387,  472,  321,  387,  345,
			  319,  322,  322,  322,  322,  347,  323,  323,  323,  323,
			  374,  400,  400,  228,  419,  343,  228,  326,  330,  330,
			  330,  330,  345,  348,  350,  319,  356,  358,  347,  327,
			  429,  330,  365,  228,  228,  230,  368,  230,  371,  230,
			  375,  374,  230,  230,  323,  230,  348,  350,  380,  356,

			  358,  230,  382,  230,  395,  365,  389,  389,  389,  368,
			  429,  371,  420,  375,  395,  395,  386,  386,  386,  386,
			  386,  380,  391,  391,  391,  391,  392,  392,  392,  392,
			  461,  461,  230,  382,  423,  230,  427,  393,  393,  393,
			  425,  393,  428,  420,  393,  401,  401,  401,  431,  395,
			  432,  435,  230,  230,  231,  386,  231,  423,  231,  427,
			  391,  231,  231,  446,  231,  425,  396,  444,  395,  433,
			  231,  428,  231,  432,  435,  436,  396,  396,  396,  431,
			  394,  394,  394,  547,  394,  460,  393,  394,  406,  406,
			  406,  406,  405,  405,  433,  398,  405,  405,  405,  405, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  436,  231,  410,  410,  231,  393,  398,  398,  441,  547,
			  460,  396,  403,  403,  403,  403,  404,  404,  404,  404,
			  455,  231,  231,  304,  304,  304,  304,  304,  398,  394,
			  396,  411,  411,  411,  304,  304,  502,  398,  398,  441,
			  410,  445,  442,  407,  407,  407,  407,  440,  394,  438,
			  403,  455,  437,  476,  404,  430,  304,  408,  408,  408,
			  408,  502,  304,  412,  445,  304,  304,  310,  450,  411,
			  408,  399,  409,  409,  409,  409,  310,  310,  310,  310,
			  310,  407,  452,  414,  414,  414,  414,  310,  310,  493,
			  454,  450,  476,  415,  415,  408,  414,  415,  415,  415,

			  415,  462,  462,  462,  376,  452,  465,  465,  465,  310,
			  409,  498,  310,  454,  373,  310,  370,  522,  310,  310,
			  493,  414,  464,  464,  464,  464,  505,  466,  466,  466,
			  466,  310,  315,  315,  315,  315,  315,  478,  478,  478,
			  478,  487,  498,  315,  315,  465,  469,  469,  469,  469,
			  469,  369,  470,  474,  474,  474,  522,  505,  471,  366,
			  464,  470,  470,  470,  487,  315,  466,  471,  471,  471,
			  471,  315,  526,  526,  315,  315,  385,  385,  385,  385,
			  385,  483,  483,  483,  483,  469,  539,  385,  385,  481,
			  481,  488,  474,  481,  481,  481,  481,  470,  491,  357, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  470,  627,  627,  471,  501,  503,  471,  628,  628,  385,
			  475,  475,  475,  475,  488,  385,  470,  539,  385,  385,
			  397,  491,  471,  477,  477,  477,  477,  501,  503,  355,
			  397,  397,  397,  397,  527,  527,  527,  504,  509,  397,
			  397,  397,  397,  397,  397,  479,  479,  479,  479,  475,
			  629,  629,  480,  480,  480,  480,  482,  482,  482,  482,
			  504,  477,  354,  509,  544,  397,  484,  484,  484,  484,
			  397,  397,  397,  397,  397,  506,  507,  510,  516,  353,
			  517,  523,  523,  479,  397,  468,  468,  468,  468,  468,
			  480,  519,  533,  533,  482,  544,  468,  468,  506,  507,

			  352,  516,  510,  540,  484,  517,  520,  520,  520,  521,
			  521,  521,  521,  542,  519,  524,  524,  524,  468,  523,
			  529,  529,  529,  529,  468,  530,  540,  468,  468,  531,
			  533,  534,  534,  534,  545,  530,  530,  546,  542,  531,
			  531,  531,  553,  576,  557,  520,  562,  562,  521,  536,
			  536,  536,  536,  524,  537,  537,  537,  537,  529,  538,
			  538,  538,  538,  567,  572,  545,  576,  553,  546,  534,
			  530,  578,  349,  530,  531,  557,  344,  531,  563,  563,
			  563,  565,  565,  565,  562,  583,  583,  536,  341,  530,
			  572,  619,  619,  531,  578,  619,  340,  538,  566,  566, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  566,  566,  567,  584,  584,  584,  604,  604,  604,  604,
			  604,  604,  604,  604,  604,  604,  563,  623,  623,  338,
			  565,  623,  336,  583,  607,  607,  607,  607,  607,  335,
			  616,  333,  616,  616,  630,  630,  616,  566,  616,  329,
			  328,  584,  593,  593,  593,  593,  593,  593,  593,  593,
			  593,  593,  593,  593,  593,  594,  594,  594,  594,  594,
			  594,  594,  594,  594,  594,  594,  594,  594,  595,  595,
			  595,  595,  595,  595,  595,  595,  595,  595,  595,  595,
			  595,  596,  596,  596,  596,  596,  596,  596,  596,  596,
			  596,  596,  596,  596,  597,  597,  597,  597,  597,  597,

			  597,  597,  597,  597,  597,  597,  597,  598,  598,  598,
			  598,  598,  598,  598,  598,  598,  598,  598,  598,  598,
			  599,  599,  599,  599,  599,  599,  599,  599,  599,  599,
			  599,  599,  599,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  600,  601,  601,  601,  601,
			  601,  601,  601,  601,  601,  601,  601,  601,  601,  603,
			  307,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  605,  298,  605,  605,  605,  605,  605,  605,
			  605,  605,  605,  605,  605,  608,  297,  608,  608,  608,
			  608,  608,  608,  608,  608,  608,  608,  608,  609,  609, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  609,  609,  609,  609,  609,  609,  609,  609,  609,  609,
			  609,  610,  610,  610,  610,  610,  610,  610,  610,  610,
			  610,  610,  610,  610,  611,  611,  611,  611,  611,  611,
			  611,  611,  611,  611,  611,  611,  611,  612,  612,  612,
			  612,  612,  612,  612,  612,  612,  612,  612,  612,  612,
			  613,  613,  613,  613,  613,  613,  613,  613,  613,  613,
			  613,  613,  613,  614,  614,  614,  614,  614,  614,  614,
			  614,  614,  614,  614,  614,  614,  615,  295,  615,  615,
			  615,  615,  615,  615,  615,  615,  615,  615,  615,  617,
			  617,  617,  617,  617,  617,  617,  617,  617,  617,  617,

			  617,  617,  618,  618,  618,  618,  618,  618,  294,  618,
			  618,  618,  618,  618,  618,  620,  292,  620,  620,  290,
			  285,  620,  284,  620,  621,  282,  621,  621,  621,  621,
			  621,  621,  621,  621,  621,  621,  621,  622,  280,  622,
			  622,  622,  622,  622,  622,  622,  622,  622,  622,  622,
			  624,  279,  624,  624,  278,  276,  624,  274,  624,  625,
			  625,  273,  272,  625,  626,  626,  626,  626,  626,  626,
			  271,  626,  626,  626,  626,  626,  626,  266,  262,  260,
			  252,  246,  245,  233,  215,  214,  169,  163,  162,  158,
			  154,  147,  144,  142,  133,  130,  125,  122,  112,  111, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  110,   99,   97,   96,   57,   56,   50,   47,   38,   35,
			   21,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592, yy_Dummy>>,
			1, 84, 2000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 630)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   71,   72,   80,   83,   91,   94,   97,
			  100,  103,  108,   87,  112,  115,  118,  122,  127,  131,
			  133, 2010,  119,  141,  144,  128,  144,  210, 2011,  129,
			  100,  142,  140,  270,  149, 1988,  148,  149, 1987,  201,
			    0,  145,  144,  173,  201,  210,  143, 1969,  243,  136,
			 1978,  160,  210,   89,  160,   47, 1967, 1953,  175,  191,
			 2011, 2011,  327, 2011,  247, 2011, 2011, 2011,  256, 2011,
			 2011,  288, 2011,  274,  399, 2011,  404, 2011,  295,  251,
			 2011,  290, 2011,  300, 2011,  306,  409, 2011,  414, 2011,
			  310,  316, 2011,  318,  175,  414, 1983, 1980,  428, 1989,

			  427, 2011,  492,  440,  455,  558,  415,  627,  696,  765,
			 1991, 1985, 1989,    0,  205, 2011,  436,    0,  421,  528,
			  431,  455, 1944,  477,    0, 1968,  389,  213,  162,  194,
			 1967,  270,  371, 1966,  362,  497,    0,  402,  446,  416,
			  184,  452, 1955,    0, 1953,  546,    0, 1957,  453,  432,
			  438,  493,  502,    0, 1962,  811,  513,  474, 1961,  487,
			  528,  526, 1956, 1959,  535,  567,  600,  473, 2011, 1972,
			 2011,  594, 2011,  542,  585, 2011,  620, 2011, 2011,  623,
			 2011,  641, 2011,  605, 2011,  643, 2011,  649,  654,  658,
			 2011,  662, 2011,  555, 2011,  590, 2011,  667, 2011,  669, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2011,  674, 2011,  681,  686,  690, 2011,  709, 2011,  634,
			 2011,  694, 2011,  709, 1965, 1962,  563,  698,  720,  725,
			  734,  743,  751, 2011,  794, 2011,  874,  943, 1012,  650,
			 1081, 1150, 2011, 1974,  789,  221,  806,  793, 2011,  811,
			  844,  711,  772,  815,  818, 1929, 1928,  874,  643,  661,
			    0,    0, 1948,  710,  664,  667,  704,  707,  714,  746,
			 1951,  737, 1950,    0,  747,  828, 1949,  800,  806,  591,
			  464, 1942, 1930, 1933, 1918,  826, 1927,  843, 1915, 1923,
			 1900,    0, 1897,  867, 1894, 1892,  851,  835,  873,  843,
			 1891,  876, 1884,  720, 1880, 1849,  855, 1754, 1741,  874,

			  721,    0,  893,  902, 1209,  905, 2011, 1746,  933,  958,
			 1262,  917,  967,  975, 2011, 1318,  975,  897,  969, 1022,
			  988,  994, 1036, 1041,  966,  980, 1014, 1026, 1587, 1586,
			 1053,  873,  887, 1601,  918, 1597, 1588,  891, 1591,  905,
			 1568, 1558,  957, 1008, 1544, 1008,  900, 1014, 1032, 1544,
			 1030,    0, 1472, 1447, 1415, 1382, 1035, 1371, 1036,    0,
			  478,    0,    0,  614,    0, 1038, 1327,  520, 1045, 1315,
			 1284, 1044,  780, 1266, 1034, 1049, 1265,    0,    0,  560,
			 1054,  918, 1078,    0,    0, 1362, 1102, 1040,  842, 1091,
			    0, 1107, 1111, 1136, 1179, 1099, 1161, 1415, 1181, 1262, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1046, 1130,    0, 1197, 1201, 1181, 1173, 1228, 1242, 1257,
			 1187, 1216, 1210, 2011, 1268, 1282,    0,    0,  951, 1004,
			 1087,    0,    0, 1093,  278, 1103,    0, 1095, 1111, 1051,
			 1227, 1121, 1107, 1132,    0, 1110, 1138, 1224, 1217,    0,
			 1215, 1182, 1210,    0, 1139, 1200, 1116,  969,  939,  922,
			 1227,  869, 1239,    0, 1247, 1196,    0,  815,  817,    0,
			 1148, 1115, 1286,    0, 1307, 1292, 1313,  620, 1471, 1332,
			 1347, 1353,  993, 2011, 1339, 1396, 1239, 1408, 1322, 1430,
			 1437, 1378, 1441, 1366, 1451,    0,  815, 1297, 1348,    0,
			  762, 1355,  770, 1265,    0,    0,  758,    0, 1287,  738,

			    0, 1362, 1199, 1362, 1394, 1302, 1432, 1434,    0, 1401,
			 1440,    0,  673,    0,    0,    0, 1435, 1443,    0, 1448,
			 1492, 1495, 1303, 1466, 1500,  641, 1357, 1419,    0, 1505,
			 1520, 1524,  613, 1477, 1516,  545, 1534, 1539, 1544, 1359,
			 1460,    0, 1476,    0, 1437, 1509, 1510, 1148,    0,    0,
			  557,    0,    0, 1505,  537,  445,  434, 1518,    0,  385,
			  245,    0, 1531, 1563,  148, 1567, 1584, 1549,    0,  157,
			    0,    0, 1529,    0,    0,    0, 1500,    0, 1530,    0,
			  135,    0,    0, 1570, 1588,   34,    0,   47,    0,    0,
			    0,    0, 2011, 1641, 1654, 1667, 1680, 1693, 1706, 1719, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1732, 1745,  309, 1758, 1602, 1771,  311, 1616, 1784, 1797,
			 1810, 1823, 1836, 1849, 1862, 1875, 1627, 1888, 1901, 1583,
			 1912, 1923, 1936, 1609, 1947, 1951, 1963, 1393, 1399, 1442,
			 1626, yy_Dummy>>,
			1, 31, 600)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 630)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (592, 600, 630)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  592,    1,  593,  593,  594,  594,  595,  595,  596,
			  596,  597,  597,  598,  598,  599,  599,  600,  600,  601,
			  601,  592,  602,  592,  592,  602,  603,  604,  592,  605,
			  606,  592,   25,  592,  592,  592,  606,  606,  592,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,   25,  592,  608,
			  592,  592,  592,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  609,  609,  592,  609,  592,  610,  611,
			  592,  611,  592,  592,  592,  612,  612,  592,  612,  592,
			  613,  614,  592,  614,   25,  592,  606,  606,  592,  592,

			  603,  592,  615,  603,  603,  604,  604,  604,  604,  604,
			  592,  616,  592,   25,  617,  592,  592,   94,  618,  592,
			  592,  592,  619,  592,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  592,  592,  608,  592,  620,
			  592,  592,  592,  608,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  609,  592,  609,  592,  609,  609,  610,
			  592,  610,  592,  611,  592,  611,  592,  592,  592,  612, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  592,  612,  592,  612,  612,  613,  592,  613,  592,  614,
			  592,  614,  592,  592,  606,  606,  615,  621,  622,  615,
			  615,  615,  603,  592,  603,  592,  604,  604,  604,  604,
			  604,  604,  592,  592,  592,  617,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  619,  623,  592,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,

			  607,  607,  592,  592,  592,  592,  592,  624,  622,  622,
			  615,  310,  615,  615,  592,  592,  592,  592,  592,  592,
			  592,  592,  592,  592,  592,  592,  592,  592,  625,  623,
			  626,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  592,  592,  608,  592,  592,
			  627,  592,  592,  622,  622,  615,  615,  615,  310,  592, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  592,  592,  628,  592,  592,  592,  592,  592,  592,  592,
			  592,  592,  625,  592,  592,  592,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  592,  592,  629,  592,  592,  592,  627,  592,  592,
			  615,  615,  397,  592,  592,  592,  628,  592,  592,  592,
			  592,  592,  592,  592,  592,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,

			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  592,  592,  629,  592,  592,  627,  592,  592,  630,  592,
			  615,  615,  397,  592,  592,  628,  592,  592,  592,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  592,  592,  629,  592,  592,  630,  607,  607,
			  607,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  592,  592,  630,  607,  607,  607,  607,
			  607,  607,    0,  592,  592,  592,  592,  592,  592,  592, yy_Dummy>>,
			1, 200, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (72, 200, 5759)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (72, 5960, 8191)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (72, 8392, 12287)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   72,   72,   72,   72,   72,   72,   72,   72,    1,
			    2,    1,    1,    3,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,    6,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,
			   49,   50,   51,   52,    4,   53,   54,   55,   56,   57,

			   58,   28,   59,   30,   60,   32,   33,   34,   61,   36,
			   62,   38,   39,   63,   64,   65,   66,   67,   68,   46,
			   47,   48,   49,   69,    6,   70,   71,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			    1,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72, yy_Dummy>>,
			1, 200, 5760)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,    1,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,    1,   72,   72,   72,   72,

			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72, yy_Dummy>>,
			1, 200, 8192)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   72,   72, yy_Dummy>>,
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
			    4,   13,    4,   12,   13,    8,    8,    8,    8,    8,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,    4,
			    4,   13,   13, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 593)
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
			    1,    1,    2,    5,    8,   10,   14,   17,   21,   24,
			   27,   30,   33,   37,   40,   43,   46,   49,   52,   55,
			   58,   61,   64,   67,   70,   73,   76,   79,   82,   85,
			   88,   91,   94,   97,  100,  103,  106,  109,  112,  114,
			  116,  118,  120,  122,  124,  126,  128,  131,  133,  135,
			  137,  139,  141,  143,  145,  147,  149,  151,  154,  156,
			  158,  160,  162,  164,  166,  168,  170,  172,  174,  176,
			  179,  181,  183,  185,  187,  188,  188,  188,  188,  189,

			  189,  190,  192,  192,  194,  196,  198,  199,  200,  201,
			  202,  203,  203,  205,  206,  207,  208,  210,  212,  212,
			  213,  213,  213,  213,  214,  215,  216,  217,  218,  220,
			  221,  222,  223,  224,  225,  226,  227,  229,  230,  231,
			  232,  233,  234,  235,  237,  238,  239,  241,  242,  243,
			  244,  245,  246,  247,  249,  250,  251,  252,  253,  254,
			  255,  256,  257,  258,  259,  260,  261,  261,  262,  263,
			  263,  264,  265,  266,  268,  270,  272,  272,  273,  274,
			  274,  275,  275,  276,  276,  277,  277,  278,  278,  278,
			  278,  280,  280,  282,  282,  283,  283,  285,  285,  286, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  286,  287,  287,  288,  288,  288,  288,  290,  290,  292,
			  292,  293,  293,  295,  296,  297,  298,  298,  299,  300,
			  300,  301,  302,  303,  304,  305,  306,  308,  310,  312,
			  313,  315,  317,  318,  319,  320,  321,  321,  321,  322,
			  324,  324,  325,  325,  326,  326,  327,  327,  328,  329,
			  330,  332,  334,  335,  336,  337,  338,  339,  340,  341,
			  342,  343,  344,  345,  347,  348,  349,  350,  351,  352,
			  353,  354,  355,  356,  357,  358,  359,  360,  361,  362,
			  364,  365,  367,  368,  369,  370,  371,  372,  373,  374,
			  375,  376,  377,  378,  379,  380,  381,  382,  383,  384,

			  385,  386,  388,  388,  388,  389,  390,  391,  391,  393,
			  395,  395,  395,  395,  395,  396,  397,  398,  398,  400,
			  401,  401,  401,  401,  403,  404,  405,  406,  407,  408,
			  409,  409,  410,  411,  412,  413,  414,  415,  416,  417,
			  418,  419,  420,  421,  422,  424,  425,  426,  427,  428,
			  429,  430,  432,  433,  434,  435,  436,  437,  438,  439,
			  441,  442,  444,  446,  447,  449,  450,  451,  452,  453,
			  454,  455,  456,  457,  458,  459,  460,  461,  463,  465,
			  466,  467,  468,  469,  471,  473,  473,  473,  475,  475,
			  475,  475,  475,  475,  476,  477,  477,  477,  477,  477, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  478,  478,  478,  478,  478,  478,  478,  478,  482,  483,
			  483,  484,  485,  486,  487,  488,  488,  490,  492,  493,
			  494,  495,  497,  499,  500,  501,  502,  504,  505,  506,
			  507,  508,  509,  510,  511,  513,  514,  515,  516,  517,
			  519,  520,  521,  522,  524,  525,  526,  527,  528,  529,
			  530,  531,  532,  533,  535,  536,  537,  539,  540,  541,
			  543,  544,  544,  544,  544,  544,  545,  546,  547,  547,
			  547,  547,  547,  547,  548,  549,  550,  551,  552,  552,
			  553,  553,  553,  554,  554,  555,  557,  558,  559,  560,
			  562,  563,  564,  565,  566,  568,  570,  571,  573,  574,

			  575,  577,  578,  579,  580,  581,  582,  583,  584,  586,
			  587,  588,  590,  591,  593,  595,  597,  598,  599,  601,
			  602,  602,  602,  602,  602,  602,  602,  602,  602,  602,
			  602,  602,  602,  602,  602,  602,  602,  604,  604,  606,
			  607,  608,  610,  611,  613,  614,  615,  616,  617,  619,
			  621,  622,  624,  626,  627,  628,  629,  630,  631,  633,
			  634,  635,  637,  637,  637,  637,  637,  637,  637,  639,
			  640,  642,  644,  645,  647,  649,  651,  652,  654,  655,
			  657,  658,  660,  662,  662,  662,  662,  664,  665,  667,
			  669,  671,  673,  673, yy_Dummy>>,
			1, 194, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 672)
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
			    0,  142,   73,  140,  141,    1,  140,  141,    1,  141,
			    2,   73,  140,  141,  105,  140,  141,   72,   73,  140,
			  141,    2,  140,  141,   80,  140,  141,    2,  140,  141,
			    2,  140,  141,    2,   73,  140,  141,  121,  140,  141,
			  121,  140,  141,    2,  140,  141,    2,  140,  141,    2,
			  140,  141,    2,  140,  141,   71,  140,  141,   71,  140,
			  141,   71,  140,  141,   71,  140,  141,   71,  140,  141,
			   71,  140,  141,   71,  140,  141,   71,  140,  141,   71,
			  140,  141,   71,  140,  141,   71,  140,  141,   71,  140,
			  141,   71,  140,  141,   71,  140,  141,   71,  140,  141,

			   71,  140,  141,   71,  140,  141,   71,  140,  141,   73,
			  140,  141,  140,  141,  111,  141,  115,  141,  112,  141,
			  114,  141,  120,  141,  120,  141,  119,  141,  118,  120,
			  141,  117,  141,  117,  141,  116,  141,   84,  141,   84,
			  141,   83,  141,   89,  141,   89,  141,   88,  141,   89,
			  141,   86,   89,  141,   89,  141,   92,  141,   91,  141,
			   92,  141,   95,  141,   95,  141,   94,  141,  100,  141,
			  100,  141,   99,  141,  100,  141,   97,  100,  141,  100,
			  141,  103,  141,  102,  141,  103,  141,   73,    1,  105,
			   81,  104,  105, -234,  105, -223,   72,   73,   72,   72, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   72,   72,   80,   79,   80,   73,    1,    3,  136,  139,
			    3,   73,  121,  124,   71,   71,   71,   71,    8,   71,
			   71,   71,   71,   71,   71,   71,   71,   17,   71,   71,
			   71,   71,   71,   71,   71,   29,   71,   71,   71,   36,
			   71,   71,   71,   71,   71,   71,   71,   44,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			  123,  111,  112,  113,  113,  106,  111,  113,  109,  113,
			  110,  113,  119,  118,  116,   83,   88,   86,   87,   88,
			   85,   86,   91,   90,   91,   94,   99,   97,   98,   99,
			   96,   97,  102,  101,  102,   73,   73,   73,  105,  105,

			 -234, -223,  105,  -93,  105,  -82,   72,   73,   72,   73,
			   72,   73,   72,   72,   73,   72,   73,   74,   80,   78,
			    1,  134,  136,  139,  131,  128,  125,  122,   71,   71,
			    6,   71,    7,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   20,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   40,   71,   71,   42,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   64,   71,  108,  108,
			  104,  105, -234,  105, -223,   75,   77,   77,  136,  139, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  139,  135,  138,  133,  132,  130,  129,  127,  126,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   18,   71,   71,   71,   71,   71,   71,   71,
			   27,   71,   71,   71,   71,   71,   71,   71,   71,   37,
			   71,   71,   39,   71,   69,   71,   71,   43,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   56,   71,   57,   71,   71,   71,   71,   71,   62,
			   71,   63,   71,  107,  111,  105,  105,   80,  135,  136,
			  138,  139,  139,  131,  128,  125,  137,  139,    4,   71,
			    5,   71,   71,   71,   71,   10,   71,   65,   71,   71,

			   71,   71,   15,   71,   71,   71,   71,   71,   71,   71,
			   71,   25,   71,   71,   71,   71,   71,   32,   71,   71,
			   71,   71,   38,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   52,   71,   71,   71,   55,   71,   71,
			   71,   60,   71,   71,  108,  108,  108,   76,   77,   77,
			   77,  139,  139,  138,  138,    9,   71,   71,   71,   71,
			   12,   71,   71,   71,   71,   71,   19,   71,   21,   71,
			   71,   23,   71,   71,   71,   28,   71,   71,   71,   71,
			   71,   71,   71,   71,   46,   71,   71,   71,   48,   71,
			   71,   50,   71,   51,   71,   53,   71,   71,   71,   59, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   71,   71,  138,  139,  138,  139,   71,   71,   11,   71,
			   71,   14,   71,   71,   71,   71,   71,   26,   71,   30,
			   71,   71,   33,   71,   34,   71,   71,   71,   71,   71,
			   71,   49,   71,   71,   71,   61,   71,   66,   71,   71,
			   13,   71,   16,   71,   71,   22,   71,   24,   71,   31,
			   71,   71,   41,   71,   71,   47,   71,   71,   54,   71,
			   58,   71,   67,   71,   71,   35,   71,   45,   71,   70,
			   71,   68,   71, yy_Dummy>>,
			1, 73, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2011
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 592
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 593
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 72
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

	yyNb_rules: INTEGER = 141
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 142
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
	LAVS1: INTEGER = 7
	LAVS2: INTEGER = 8
	LAVS3: INTEGER = 9
			-- Start condition codes

feature -- User-defined features



end
