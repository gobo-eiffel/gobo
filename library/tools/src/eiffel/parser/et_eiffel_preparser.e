note

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
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
	yy_column := yy_column + 7
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
	yy_column := yy_column + 9
--|#line 74 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 74")
end

			
when 35 then
	yy_column := yy_column + 2
--|#line 75 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 75")
end

			
when 36 then
	yy_column := yy_column + 4
--|#line 76 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 76")
end

			
when 37 then
	yy_column := yy_column + 5
--|#line 77 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 77")
end

			
when 38 then
	yy_column := yy_column + 4
--|#line 78 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 78")
end

			
when 39 then
	yy_column := yy_column + 3
--|#line 79 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 79")
end

			
when 40 then
	yy_column := yy_column + 8
--|#line 80 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 80")
end

			
when 41 then
	yy_column := yy_column + 3
--|#line 81 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 81")
end

			
when 42 then
	yy_column := yy_column + 4
--|#line 82 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 82")
end

			
when 43 then
	yy_column := yy_column + 2
--|#line 83 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 83")
end

			
when 44 then
	yy_column := yy_column + 9
--|#line 84 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 84")
end

			
when 45 then
	yy_column := yy_column + 8
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
	yy_column := yy_column + 7
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
	yy_column := yy_column + 6
--|#line 89 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 89")
end

			
when 50 then
	yy_column := yy_column + 5
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
	yy_column := yy_column + 8
--|#line 92 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 92")
end

			
when 53 then
	yy_column := yy_column + 5
--|#line 93 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 93")
end

			
when 54 then
	yy_column := yy_column + 4
--|#line 94 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 94")
end

			
when 55 then
	yy_column := yy_column + 4
--|#line 95 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 95")
end

			
when 56 then
	yy_column := yy_column + 8
--|#line 96 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 96")
end

			
when 57 then
	yy_column := yy_column + 6
--|#line 97 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 97")
end

			
when 58 then
	yy_column := yy_column + 5
--|#line 98 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 98")
end

			
when 59 then
	yy_column := yy_column + 7
--|#line 99 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 99")
end

			
when 60 then
	yy_column := yy_column + 4
--|#line 100 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 100")
end

			
when 61 then
	yy_column := yy_column + 4
--|#line 101 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 101")
end

			
when 62 then
	yy_column := yy_column + 3
--|#line 102 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 102")
end

			
when 63 then
	yy_column := yy_column + 5
--|#line 104 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 104")
end

				class_keyword_found := True
			
when 64 then
	yy_column := yy_column + 8
--|#line 107 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 107")
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
			
when 65 then
	yy_column := yy_column + 9
--|#line 119 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 119")
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
			
when 66 then
	yy_column := yy_column + 10
--|#line 131 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 131")
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
			
when 67 then
	yy_column := yy_column + 4
--|#line 143 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 143")
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
			
when 68 then
	yy_column := yy_column + 9
--|#line 155 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 155")
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
			
when 69 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 171 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 171")
end

				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := text_count
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 70 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 190 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 190")
end

			
when 71 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 195 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 195")
end

			
when 72 then
	yy_column := yy_column + 3
--|#line 200 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 200")
end

			
when 73 then
	yy_column := yy_column + 4
--|#line 201 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 201")
end

			
when 74 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 202 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 202")
end

			
when 75 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 204 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 204")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
when 76 then
	yy_column := yy_column + 3
--|#line 213 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 213")
end

					-- Syntax error: missing character code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				column := column - 3
				last_token := E_CHARERR
			
when 77 then
	yy_column := yy_column + 2
--|#line 222 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 222")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				column := column - 1
				last_token := E_CHARERR
			
when 78 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 230 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 230")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
when 79 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 243 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 243")
end

			
when 80 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 246 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 246")
end

					-- Verbatim string.
				verbatim_marker := utf8_text_substring (2, text_count - 1)
				verbatim_marker_count := text_count - 2
				verbatim_opening_character := unicode_text_item (text_count)
				set_start_condition (VS1)
			
when 81 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 256 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 256")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 82 then
	yy_column := yy_column + 1
--|#line 261 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 261")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 83 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 277 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 277")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := no_verbatim_marker
					verbatim_marker_count := 0
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
when 84 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 287 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 287")
end

				more
				set_start_condition (VS3)
			
when 85 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 291 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 291")
end

				more
				last_literal_end := text_count - 2
			
when 86 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 295 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 295")
end

				more
				last_literal_end := text_count - 1
			
when 87 then
	yy_column := yy_column + 1
--|#line 299 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 299")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 88 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 315 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 315")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 89 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 320 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 320")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 90 then
	yy_column := yy_column + 1
--|#line 325 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 325")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 91 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 339 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 339")
end

					-- Manifest string with special characters.
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 342 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 342")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
when 93 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 353 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 353")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 358 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 358")
end

				more
			
when 95 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 361 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 361")
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
			
when 96 then
	yy_column := yy_column + 2
--|#line 373 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 373")
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
			
when 97 then
	yy_column := yy_column + 2
--|#line 385 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 385")
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
			
when 98 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 398 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 398")
end

				more
			
when 99 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 401 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 401")
end

				set_start_condition (INITIAL)
			
when 100 then
	yy_column := yy_column + 2
--|#line 404 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 404")
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
			
when 101 then
	yy_column := yy_column + 1
--|#line 415 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 415")
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
			
when 102 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 427 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 427")
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
			
when 103 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 453 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 453")
end

				more
				set_start_condition (MSN)
			
when 104 then
	yy_column := yy_column + 1
--|#line 457 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 457")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 472 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 472")
end

				more
				set_start_condition (MS)
			
when 106 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 476 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 476")
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
			
when 107 then
	yy_column := yy_column + 1
--|#line 487 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 487")
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
			
when 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 516 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 516")
end

			
when 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 518 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 518")
end

			
when 110 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 520 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 520")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 111 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 527 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 527")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 112 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 534 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 534")
end

			
when 113 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 536 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 536")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 114 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 543 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 543")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 115 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 550 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 550")
end

			
when 116 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 552 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 552")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 117 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 559 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 559")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 566 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 566")
end

			
when 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 568 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 568")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 120 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 575 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 575")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 121 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 586 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 586")
end

			
when 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 587 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 587")
end

			
when 123 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 588 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 588")
end

			
when 124 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 590 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 590")
end

			
when 125 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 591 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 591")
end

			
when 126 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 592 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 592")
end

			
when 127 then
	yy_column := yy_column + 1
--|#line 602 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 602")
end

				last_token := E_UNKNOWN
			
when 128 then
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
--|#line 601 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 601")
end
terminate
when 1 then
--|#line 438 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 438")
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
--|#line 499 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 499")
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
--|#line 463 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 463")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 4 then
--|#line 267 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 267")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 305 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 305")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 331 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 331")
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
			create an_array.make_filled (0, 0, 1828)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			an_array.area.fill_with (547, 1755, 1828)
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
			   19,   16,   53,   54,   16,   56,   56,   85,   57,   57,
			   86,   58,   58,   60,   61,   60,   60,   61,   60,  546,
			   62,   76,   77,   62,   64,   65,   64,   64,   65,   64,

			   67,   68,   67,   67,   68,   67,   70,   71,   72,  146,
			   73,   70,   71,   72,   79,   73,   76,   77,   82,   82,
			   82,  540,   80,   79,   81,   82,   82,   82,   97,   83,
			  137,   80,  545,   81,   94,   95,   83,  146,   98,   98,
			   87,   99,   99,   99,   99,   79,  101,  100,  102,  102,
			  102,  102,  137,   80,   98,   81,   74,   98,   98,   98,
			   98,   74,   88,  541,   88,  143,   78,  118,  519,   88,
			   90,  101,   88,  102,  102,  102,  102,  119,   91,  216,
			   92,  130,  144,  103,  104,  106,  108,  131,   78,  143,
			  113,  109,  151,  110,  114,  152,  145,  115,  111,  112, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  116,  216,  100,  117,  537,  105,  177,  178,   88,  100,
			  106,   88,  144,  103,  104,  536,  109,  110,  113,  114,
			  111,  112,  116,  346,  120,  117,  121,   88,   78,   78,
			   78,   78,   78,  126,  123,  141,  122,  547,  124,   78,
			  127,  128,  133,   82,  139,  142,  129,  547,   78,  120,
			  121,  125,  134,  199,  135,  547,  179,  178,  136,  140,
			  100,  480,  126,  141,  123,  128,  534,  142,  129,  159,
			  160,  159,  133,  125,  205,  205,  161,  134,  135,  217,
			  136,  140,  220,  215,  100,  148,  148,  148,  148,  162,
			  163,  162,  164,  165,  164,  167,  168,  180,  169,  167,

			  174,  217,  175,   78,  195,  181,  220,  182,   82,   82,
			   82,  206,   89,  215,  194,  151,  533,  151,  152,   83,
			  152,  532,  149,  154,  155,  154,  153,  156,  153,  153,
			  156,  156,  156,  153,  153,  153,  157,  153,  153,  153,
			  153,  153,  156,  153,  156,  153,  156,  156,  156,  156,
			  153,  156,  153,  156,  153,  153,  153,  156,  153,  156,
			  153,  153,  156,  156,  156,  156,  156,  156,  153,  153,
			  153,  153,  153,  153,  153,  153,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  153,  153,  153,  153,  153,  153,  153,  170,  167,  171, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  530,  169,  170,  173,  171,   85,  169,  547,   86,  188,
			  189,  188,  269,   85,  219,  270,   86,  547,  180,  177,
			  178,  193,   99,   99,   99,   99,  181,  490,  182,  203,
			  203,  203,  203,  232,  213,  200,  101,  214,  102,  102,
			  102,  102,  204,  222,  219,  226,  231,  172,  207,  207,
			  207,  547,  172,  179,  178,  211,  211,  211,  211,  201,
			  487,  547,  214,  232,  312,  222,  480,  226,   87,  184,
			  187,  231,  185,  185,  185,  106,   87,  313,  186,  547,
			  547,  547,  547,  547,  185,  208,  185,  244,  185,  185,
			  185,  185,  106,  185,  223,  185,  229,  242,  224,  185,

			  230,  185,  403,  243,  185,  185,  185,  185,  185,  185,
			  167,  168,  225,  169,  240,  227,  245,  244,  293,  242,
			  173,  168,  230,  169,  223,  243,  241,  224,  255,  314,
			  228,  403,  187,   88,  225,   88,  257,   78,  235,  261,
			   88,  190,  236,   88,  240,  227,  245,  264,  293,  191,
			  255,  192,  228,  237,  314,  253,  238,  258,  257,  254,
			  513,  261,  259,  266,  155,  266,   82,  503,  235,  264,
			  236,  167,  174,  260,  175,  237,  199,  501,  238,   88,
			  253,  442,   88,  267,  268,  268,  268,  258,  148,  148,
			  148,  148,  162,  163,  162,  260,  295,  195,   88,   78, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   78,   78,   78,   78,  194,   89,  194,  194,   96,  442,
			  297,  194,  547,  296,  194,  148,  148,  148,  148,  300,
			  194,  159,  160,  159,  499,  149,  295,  292,  161,  164,
			  165,  164,  170,  167,  171,  296,  169,  170,  173,  171,
			  297,  169,  173,  174,  269,  175,   90,   86,  547,  300,
			  194,  292,  149,  194,   91,  413,   92,   79,  272,  273,
			  273,  273,  274,  189,  274,   91,  547,   92,  497,  194,
			   96,   96,   96,   96,   96,  247,  449,  248,  494,  188,
			  189,  188,  172,   85,  413,  249,   86,  172,  250,  547,
			  251,  252,  304,  547,  276,  277,  277,  277,  280,  280,

			  280,  280,  205,  205,  449,  247,  248,  271,  298,  249,
			  250,  187,  251,  252,  278,  278,  421,  421,  279,  279,
			  279,  279,  304,  203,  203,  203,  203,  283,  283,  187,
			  298,  284,  284,  284,  284,  201,  281,  286,  286,  285,
			  207,  207,  207,  288,  288,  288,   87,  299,  301,  302,
			  306,  547,  547,  547,  547,  547,  310,  318,  185,  291,
			  282,  211,  211,  211,  211,  307,  311,  320,  329,  299,
			  301,  302,  306,  325,  206,  328,  330,  287,  310,  308,
			  208,  334,  332,  336,  342,  343,  339,  318,  311,  357,
			  329,  266,  155,  266,  331,  307,  487,  320,  106,  344, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  345,  345,  345,  325,  332,  328,  330,  336,  339,  343,
			  473,  334,  389,  374,  342,  150,  331,  346,  268,  268,
			  268,  268,  346,  268,  268,  268,  268,  490,  347,  348,
			  352,  189,  352,  547,  269,  374,  389,   86,  279,  279,
			  279,  279,  185,  273,  273,  273,  273,  274,  189,  274,
			  349,  547,  375,  519,  400,  350,  368,  368,  347,  348,
			  350,  357,  277,  277,  277,  277,  357,  277,  277,  277,
			  277,  377,  358,  359,  375,  279,  279,  279,  279,  400,
			  356,  284,  284,  284,  284,  386,  472,  280,  280,  280,
			  280,  380,  151,  285,  360,  152,  187,  271,  547,  361,

			  363,  377,  358,  359,  361,  286,  286,  185,  273,  273,
			  273,  273,  362,  380,  187,  386,  364,  364,  353,  354,
			  365,  365,  365,  365,  201,  366,  366,  366,  366,  284,
			  284,  284,  284,  369,  369,  369,  288,  288,  288,  401,
			  355,  468,  206,  382,  410,  356,  385,  388,  353,  354,
			  372,  372,  372,  372,  390,  391,  393,  397,  399,  402,
			  404,  187,  282,  373,  401,  382,  367,  407,  385,  388,
			  287,  408,  411,  208,  410,  414,  390,  391,  393,  397,
			  399,  402,  404,  415,  416,  422,  422,  422,  466,  407,
			  268,  268,  268,  268,  411,  465,  408,  414,  150,  345, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  345,  345,  345,  150,  345,  345,  345,  345,  415,  417,
			  418,  430,  430,  443,  416,  424,  425,  425,  425,  352,
			  189,  352,  547,  269,  368,  368,   86,  350,  431,  431,
			  431,  419,  426,  426,  547,  464,  420,  547,  441,  417,
			  418,  420,  450,  443,  427,  427,  427,  273,  273,  273,
			  273,  277,  277,  277,  277,  433,  433,  433,  433,  434,
			  434,  285,  441,  435,  435,  435,  435,  365,  365,  365,
			  365,  450,  475,  475,  462,  365,  365,  365,  365,  438,
			  438,  438,  438,  444,  356,  187,  271,  461,  361,  369,
			  369,  369,  362,  366,  366,  366,  366,  187,  547,  447,

			  187,  372,  372,  372,  372,  444,  437,  452,  428,  428,
			  428,  428,  436,  448,  437,  454,  367,  428,  428,  428,
			  428,  428,  428,  447,  453,  445,  287,  439,  439,  446,
			  282,  440,  440,  440,  440,  448,  455,  452,  282,  454,
			  456,  460,  471,  463,  467,  469,  453,  428,  428,  428,
			  428,  428,  470,  474,  476,  476,  476,  459,  455,  520,
			  520,  187,  423,  423,  456,  463,  467,  469,  346,  421,
			  421,  460,  471,  458,  470,  432,  432,  474,  345,  345,
			  345,  345,  346,  422,  422,  422,  184,  425,  425,  425,
			  425,  184,  425,  425,  425,  425,  495,  481,  482,  547, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  496,  498,  547,  357,  430,  430,  478,  457,  185,  426,
			  426,  185,  427,  427,  427,  420,  504,  500,  495,  483,
			  479,  451,  496,  498,  484,  289,  506,  481,  482,  484,
			  357,  431,  431,  431,  433,  433,  433,  433,  504,  429,
			  505,  488,  435,  435,  435,  435,  485,  500,  506,  486,
			  435,  435,  435,  435,  491,  491,  491,  491,  438,  438,
			  438,  438,  187,  502,  505,  187,  507,  508,  489,  492,
			  492,  362,  509,  493,  493,  493,  493,  440,  440,  440,
			  440,  440,  440,  440,  440,  510,  511,  362,  507,  512,
			  514,  436,  515,  502,  509,  367,  412,  508,  516,  150,

			  475,  475,  150,  476,  476,  476,  409,  510,  421,  421,
			  511,  525,  514,  512,  430,  430,  515,  524,  367,  523,
			  516,  422,  422,  422,  521,  521,  521,  425,  425,  425,
			  425,  547,  431,  431,  431,  525,  547,  517,  529,  524,
			  518,  426,  426,  526,  527,  478,  427,  427,  427,  523,
			  528,  488,  491,  491,  491,  491,  535,  531,  479,  493,
			  493,  493,  493,  529,  484,  493,  493,  493,  493,  489,
			  475,  475,  184,  526,  527,  476,  476,  476,  485,  542,
			  528,  531,  406,  486,  543,   78,  535,  544,  405,  436,
			  184,  520,  520,   78,  187,  184,  521,  521,  521,  187, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  520,  520,  436,   96,  542,  398,  543,  517,  396,  544,
			  540,   96,  518,  521,  521,  521,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,  209,  209,  538,  395,
			  209,  290,  290,  539,  394,  290,  392,  538,  107,  107,
			  107,  107,  107,  370,  370,  477,  477,  370,  522,  522,
			  539,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,

			   66,   66,   66,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   84,
			  387,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   93,  384,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,  150,  383,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  166,  166,
			  166,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  166,  172,  172,  172,  172,  172,  172,  172,  172,  172,
			  172,  172,  172,  172,  176,  176,  176,  176,  176,  176, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  176,  176,  176,  176,  176,  176,  176,  183,  381,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  197,  379,  197,  197,  378,  376,  197,  210,  197,   97,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,  202,  202,  202,  202,  202,  202,  289,  202,
			  202,  202,  202,  202,  202,  150,  351,  150,  150,  341,
			  340,  150,  338,  150,  184,  337,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  185,  335,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  184,  333,  184,  184,  327,  326,  184,  324,  184,  371,

			  371,  371,  371,  371,  371,  323,  371,  371,  371,  371,
			  371,  371,  322,  321,  319,  317,  316,  315,  309,  305,
			  303,  294,  210,  289,  275,  195,  547,  547,  265,  263,
			  262,  256,  246,  239,  234,  233,  221,  218,  212,  210,
			   78,  196,  198,  196,  195,   97,  547,  547,  147,  138,
			  132,   98,   98,  547,   15, yy_Dummy>>,
			1, 155, 1600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1828)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 74)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (58, 323, 396)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			an_array.area.fill_with (547, 1754, 1828)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    4,   20,    3,    4,   20,    3,    4,    5,    5,
			    5,    6,    6,    6,  542,    5,   13,   13,    6,    7,
			    7,    7,    8,    8,    8,    9,    9,    9,   10,   10,
			   10,   11,   11,   11,   49,   11,   12,   12,   12,   16,
			   12,   14,   14,   17,   17,   17,  540,   16,   19,   16,
			   18,   18,   18,   24,   17,   43,   19,  535,   19,   23,
			   23,   18,   49,   24,   25,   20,   25,   25,   25,   25,
			   26,   28,   26,   28,   28,   28,   28,   43,   26,   26,
			   26,   11,   30,   30,   31,   31,   12,   21,  524,   21,
			   47,   21,   36,  519,   21,   21,   27,   21,   27,   27,

			   27,   27,   36,   21,  111,   21,   40,   48,   27,   27,
			   28,   33,   40,   53,   47,   35,   33,   55,   33,   35,
			   55,   48,   35,   33,   33,   35,  111,   26,   35,  515,
			   27,   75,   75,   21,   53,   27,   21,   48,   27,   27,
			  514,   33,   33,   35,   35,   33,   33,   35,  423,   37,
			   35,   37,   21,   21,   21,   21,   21,   21,   39,   38,
			   46,   37,   79,   38,   54,   39,   39,   42,   97,   45,
			   46,   39,   79,   51,   37,   37,   38,   42,   97,   42,
			   51,   77,   77,   42,   45,   54,  423,   39,   46,   38,
			   39,  511,   46,   39,   60,   60,   60,   42,   38,  103, yy_Dummy>>,
			1, 200, 75)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  103,   60,   42,   42,  112,   42,   45,  115,  110,   51,
			   52,   52,   52,   52,   64,   64,   64,   67,   67,   67,
			   69,   69,   78,   69,   74,   74,  112,   74,   51,   91,
			   78,  115,   78,   82,   82,   82,  103,   91,  110,   91,
			  150,  510,  156,  150,   82,  156,  509,   52, yy_Dummy>>,
			1, 48, 275)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   70,   70,   70,  505,   70,   72,   72,   72,   84,   72,
			  183,   84,   87,   87,   87,  184,   87,  114,  184,   87,
			   89,  100,  176,  176,   89,   99,   99,   99,   99,  100,
			  490,  100,  101,  101,  101,  101,  124,  109,   99,  102,
			  109,  102,  102,  102,  102,  101,  117,  114,  120,  123,
			   70,  104,  104,  104,  180,   72,  178,  178,  106,  106,
			  106,  106,   99,  487,  180,  109,  124,  233,  117,  480,
			  120,   84,   86,  183,  123,   86,   86,   86,  102,   87,
			  233,   86,   89,   89,   89,   89,   89,   86,  104,   86,
			  134,   86,   86,   86,   86,  106,   86,  118,   86,  122,

			  132,  118,   86,  122,   86,  326,  133,   86,   86,   86,
			   86,   86,   86,  166,  166,  118,  166,  131,  121,  135,
			  134,  213,  132,  168,  168,  122,  168,  118,  133,  131,
			  118,  140,  234,  121,  326,   86,   88,  118,   88,  142,
			   88,  128,  144,   88,   88,  128,   88,  131,  121,  135,
			  147,  213,   88,  140,   88,  121,  128,  234,  139,  128,
			  143,  142,  139,  467,  144,  143,  154,  154,  154,  199,
			  455,  128,  147,  128,  172,  172,  143,  172,  128,  199,
			  452,  128,   88,  139,  377,   88,  157,  157,  157,  157,
			  143,  148,  148,  148,  148,  162,  162,  162,  143,  217, yy_Dummy>>,
			1, 200, 397)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  191,   88,   88,   88,   88,   88,   88,   90,  191,   90,
			  191,   90,  377,  218,   90,   90,  217,   90,  149,  149,
			  149,  149,  221,   90,  159,  159,  159,  448,  148,  217,
			  212,  159,  164,  164,  164,  170,  170,  170,  217,  170,
			  171,  171,  171,  218,  171,  174,  174,  185,  174,  194,
			  185,  186,  221,   90,  212,  149,   90,  194,  338,  194,
			  195,  186,  186,  186,  186,  187,  187,  187,  195,  187,
			  195,  446,   90,   90,   90,   90,   90,   90,  138,  386,
			  138,  442,  188,  188,  188,  170,  188,  338,  138,  188,
			  171,  138,  193,  138,  138,  225,  193,  198,  198,  198,

			  198,  201,  201,  201,  201,  205,  205,  386,  138,  138,
			  185,  219,  138,  138,  186,  138,  138,  200,  200,  347,
			  347,  200,  200,  200,  200,  225,  203,  203,  203,  203,
			  204,  204,  187,  219,  204,  204,  204,  204,  201,  203,
			  206,  206,  205,  207,  207,  207,  208,  208,  208,  188,
			  220,  222,  223,  228,  193,  193,  193,  193,  193,  231,
			  238,  428,  211,  203,  211,  211,  211,  211,  229,  232,
			  240,  250,  220,  222,  223,  228,  246,  206,  249,  251,
			  207,  231,  229,  208,  254,  252,  256,  262,  263,  259,
			  238,  232,  432,  250,  266,  266,  266,  251,  229,  428, yy_Dummy>>,
			1, 200, 597)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  240,  211,  265,  265,  265,  265,  246,  252,  249,  251,
			  256,  259,  263,  414,  254,  307,  292,  262,  477,  251,
			  267,  267,  267,  267,  267,  268,  268,  268,  268,  268,
			  432,  267,  267,  271,  271,  271,  273,  271,  292,  307,
			  271,  278,  278,  278,  278,  273,  273,  273,  273,  273,
			  274,  274,  274,  267,  274,  293,  477,  320,  267,  285,
			  285,  267,  267,  268,  276,  276,  276,  276,  276,  277,
			  277,  277,  277,  277,  295,  276,  276,  293,  279,  279,
			  279,  279,  320,  273,  283,  283,  283,  283,  304,  413,
			  280,  280,  280,  280,  298,  346,  285,  276,  346,  273,

			  271,  272,  276,  280,  295,  276,  276,  277,  286,  286,
			  272,  272,  272,  272,  272,  279,  298,  274,  304,  281,
			  281,  272,  272,  281,  281,  281,  281,  280,  282,  282,
			  282,  282,  284,  284,  284,  284,  287,  287,  287,  288,
			  288,  288,  323,  272,  407,  286,  300,  333,  272,  303,
			  306,  272,  272,  291,  291,  291,  291,  308,  309,  311,
			  316,  318,  325,  327,  272,  282,  291,  323,  300,  284,
			  330,  303,  306,  287,  331,  334,  288,  333,  339,  308,
			  309,  311,  316,  318,  325,  327,  340,  341,  348,  348,
			  348,  405,  330,  350,  350,  350,  350,  334,  404,  331, yy_Dummy>>,
			1, 200, 797)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  339,  344,  344,  344,  344,  344,  345,  345,  345,  345,
			  345,  340,  344,  344,  358,  358,  378,  341,  351,  351,
			  351,  351,  352,  352,  352,  353,  352,  368,  368,  352,
			  350,  359,  359,  359,  344,  353,  353,  354,  403,  344,
			  356,  376,  344,  344,  345,  387,  378,  354,  354,  354,
			  356,  356,  356,  356,  361,  361,  361,  361,  362,  362,
			  362,  362,  363,  363,  368,  376,  363,  363,  363,  363,
			  364,  364,  364,  364,  387,  417,  417,  401,  365,  365,
			  365,  365,  367,  367,  367,  367,  381,  356,  353,  352,
			  399,  361,  369,  369,  369,  362,  366,  366,  366,  366,

			  354,  355,  383,  356,  372,  372,  372,  372,  381,  366,
			  389,  355,  355,  355,  355,  365,  385,  372,  391,  367,
			  355,  355,  355,  355,  355,  355,  383,  390,  382,  369,
			  373,  373,  382,  366,  373,  373,  373,  373,  385,  393,
			  389,  372,  391,  394,  398,  411,  402,  406,  408,  390,
			  355,  355,  355,  355,  355,  410,  416,  418,  418,  418,
			  397,  393,  481,  481,  355,  576,  576,  394,  402,  406,
			  408,  421,  421,  421,  398,  411,  396,  410,  577,  577,
			  416,  420,  420,  420,  420,  422,  422,  422,  422,  424,
			  424,  424,  424,  424,  425,  425,  425,  425,  425,  443, yy_Dummy>>,
			1, 200, 997)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  424,  424,  426,  444,  447,  427,  430,  430,  430,  421,
			  395,  426,  426,  426,  427,  427,  427,  427,  420,  457,
			  449,  443,  424,  422,  388,  444,  447,  424,  370,  459,
			  424,  424,  425,  431,  431,  431,  431,  433,  433,  433,
			  433,  457,  357,  458,  430,  434,  434,  434,  434,  426,
			  449,  459,  427,  435,  435,  435,  435,  436,  436,  436,
			  436,  438,  438,  438,  438,  426,  454,  458,  427,  460,
			  461,  431,  437,  437,  433,  462,  437,  437,  437,  437,
			  439,  439,  439,  439,  440,  440,  440,  440,  463,  464,
			  435,  460,  465,  471,  436,  472,  454,  462,  438,  335,

			  461,  474,  475,  475,  475,  476,  476,  476,  476,  332,
			  463,  478,  478,  464,  497,  471,  465,  488,  488,  472,
			  495,  440,  494,  474,  479,  479,  479,  482,  482,  482,
			  484,  484,  484,  484,  485,  489,  489,  489,  497,  486,
			  475,  502,  495,  476,  485,  485,  499,  500,  478,  486,
			  486,  486,  494,  501,  488,  491,  491,  491,  491,  512,
			  508,  479,  492,  492,  492,  492,  502,  484,  493,  493,
			  493,  493,  489,  517,  517,  522,  499,  500,  518,  518,
			  518,  485,  527,  501,  508,  329,  486,  531,  554,  512,
			  533,  328,  491,  520,  520,  520,  554,  485,  521,  521, yy_Dummy>>,
			1, 200, 1197)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  521,  521,  486,  538,  538,  493,  558,  527,  317,  531,
			  517,  315,  533,  522,  558,  518,  539,  539,  539,  556,
			  556,  556,  556,  556,  556,  556,  556,  556,  556,  568,
			  568,  520,  314,  568,  572,  572,  521,  313,  572,  310,
			  538,  559,  559,  559,  559,  559,  574,  574,  578,  578,
			  574,  579,  579,  539,  548,  548,  548,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  548,  549,  549,  549,
			  549,  549,  549,  549,  549,  549,  549,  549,  549,  549,
			  550,  550,  550,  550,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  551,  551,  551,  551,  551,  551,  551,

			  551,  551,  551,  551,  551,  551,  552,  552,  552,  552,
			  552,  552,  552,  552,  552,  552,  552,  552,  552,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  553,  553,
			  553,  553,  555,  305,  555,  555,  555,  555,  555,  555,
			  555,  555,  555,  555,  555,  557,  302,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  560,  301,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  561,  561,  561,  561,  561,  561,  561,  561,  561,
			  561,  561,  561,  561,  562,  562,  562,  562,  562,  562,
			  562,  562,  562,  562,  562,  562,  562,  563,  563,  563, yy_Dummy>>,
			1, 200, 1397)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  563,  563,  563,  563,  563,  563,  563,  563,  563,  563,
			  564,  299,  564,  564,  564,  564,  564,  564,  564,  564,
			  564,  564,  564,  565,  297,  565,  565,  296,  294,  565,
			  290,  565,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  567,  567,  567,  567,  567,
			  567,  289,  567,  567,  567,  567,  567,  567,  569,  270,
			  569,  569,  261,  260,  569,  258,  569,  570,  257,  570,
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  571,  255,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  573,  253,  573,  573,  248,  247,  573,

			  245,  573,  575,  575,  575,  575,  575,  575,  243,  575,
			  575,  575,  575,  575,  575,  242,  241,  239,  237,  236,
			  235,  230,  226,  224,  216,  210,  209,  197,  192,  182,
			  181,  152,  146,  145,  141,  137,  130,  127,  125,  116,
			  113,  108,  105,   96,   95,   94,   93,   92,   83,   81,
			   80,   50,   44,   41,   32,   29,   15, yy_Dummy>>,
			1, 157, 1597)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 579)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   73,   74,   82,   85,   93,   96,   99,
			  102,  105,  110,   89,  114, 1753,  102,  117,  124,  111,
			   72,  158, 1754,  126,  116,  126,  133,  158,  133, 1731,
			  137,  138, 1730,  156,    0,  159,  139,  189,  210,  204,
			  149, 1712,  217,   89, 1721,  216,  204,  128,  158,   78,
			 1710,  234,  270,  138,  189,  187, 1754, 1754,  322, 1754,
			  268, 1754, 1754, 1754,  288, 1754, 1754,  291, 1754,  293,
			  396, 1754,  401, 1754,  297,  204, 1754,  254,  285,  225,
			 1727, 1724,  307, 1733,  400, 1754,  464,  408,  529,  409,
			  600,  292, 1732, 1734, 1728, 1732, 1690,  241, 1754,  407,

			  406,  414,  423,  259,  433, 1687,  440,    0, 1710,  402,
			  256,  137,  236, 1709,  390,  245, 1708,  402,  469,    0,
			  403,  488,  457,  411,  409, 1697,    0, 1695,  511,    0,
			 1699,  488,  454,  461,  460,  490,    0, 1704,  648,  520,
			  487, 1703,  492,  530,  498, 1698, 1701,  506,  573,  600,
			  310, 1754, 1714, 1754,  562, 1754,  312,  568, 1754,  620,
			 1754, 1754,  591, 1754,  628, 1754,  508, 1754,  518, 1754,
			  631,  636,  569, 1754,  640, 1754,  417, 1754,  451, 1754,
			  439, 1707, 1704,  402,  407,  639,  643,  661,  678, 1754,
			    0,  585, 1713,  681,  634,  645, 1754, 1715,  679,  564, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  703,  683, 1754,  708,  716,  687,  722,  725,  728, 1671,
			 1670,  746,  590,  494,    0,    0, 1689,  572,  584,  666,
			  702,  595,  707,  705, 1692,  668, 1691,    0,  706,  741,
			 1690,  714,  723,  428,  494, 1689, 1688, 1676,  733, 1686,
			  743, 1674, 1684, 1667,    0, 1669,  747, 1667, 1666,  751,
			  724,  750,  741, 1663,  757, 1646,  746, 1637, 1634,  746,
			 1628, 1627,  757,  748,    0,  784,  790,  803,  808, 1754,
			 1642,  829,  893,  828,  846, 1754,  847,  852,  823,  860,
			  872,  905,  910,  866,  914,  841,  890,  918,  921, 1596,
			 1575,  935,  770,  810, 1595,  845, 1592, 1587,  849, 1580,

			  900, 1528, 1513,  905,  859, 1498,  906,  775,  913,  914,
			 1408,  912,    0, 1406, 1397, 1361,  916, 1377,  917,    0,
			  819,    0,    0,  904,    0,  915,  473,  919, 1352, 1350,
			  923,  936, 1258,  918,  931, 1257,    0,    0,  626,  931,
			  948,  960,    0,    0,  984,  989,  887,  701,  970,    0,
			  975, 1000, 1018, 1017, 1029, 1093, 1032, 1230,  996, 1013,
			    0, 1036, 1040, 1048, 1052, 1060, 1078, 1064, 1009, 1074,
			 1173, 1754, 1086, 1116,    0,    0, 1001,  550,  988,    0,
			    0, 1042, 1097, 1062,    0, 1072,  645, 1013, 1193, 1080,
			 1081, 1078,    0, 1095, 1103, 1179, 1141, 1125, 1115, 1055, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0, 1046, 1102, 1003,  967,  960, 1103,  913, 1102,    0,
			 1109, 1118,    0,  854,  782,    0, 1116, 1057, 1139,    0,
			 1163, 1154, 1168,  209, 1172, 1177, 1194, 1197,  744, 1754,
			 1189, 1216,  775, 1219, 1227, 1235, 1239, 1258, 1243, 1262,
			 1266,    0,  650, 1152, 1157,    0,  630, 1158,  596, 1193,
			    0,    0,  549,    0, 1239,  539,    0, 1174, 1203, 1183,
			 1223, 1243, 1229, 1243, 1249, 1252,    0,  532,    0,    0,
			    0, 1247, 1255,    0, 1255, 1285, 1288,  801, 1293, 1306,
			  414, 1144, 1309,    0, 1312, 1326, 1331,  408, 1299, 1317,
			  375, 1337, 1344, 1350, 1292, 1274,    0, 1274,    0, 1316,

			 1319, 1323, 1303,    0,    0,  370,    0,    0, 1320,  293,
			  278,  238, 1330,    0,  187,  176,    0, 1355, 1360,  116,
			 1376, 1381, 1358,    0,  135,    0,    0, 1344,    0,    0,
			    0, 1341,    0, 1346,    0,  104,    0,    0, 1385, 1398,
			   69,    0,   61,    0,    0,    0,    0, 1754, 1450, 1463,
			 1476, 1489, 1502, 1515, 1380, 1528, 1412, 1541, 1398, 1430,
			 1554, 1567, 1580, 1593, 1606, 1617, 1628, 1641, 1418, 1652,
			 1663, 1676, 1423, 1687, 1435, 1698, 1154, 1167, 1437, 1440, yy_Dummy>>,
			1, 180, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 579)
			yy_def_template_1 (an_array)
			an_array.area.fill_with (559, 107, 147)
			yy_def_template_2 (an_array)
			an_array.area.fill_with (559, 212, 264)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (559, 292, 343)
			yy_def_template_4 (an_array)
			an_array.area.fill_with (559, 374, 416)
			yy_def_template_5 (an_array)
			an_array.area.fill_with (559, 441, 474)
			yy_def_template_6 (an_array)
			an_array.area.fill_with (547, 548, 579)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  547,    1,  548,  548,  549,  549,  550,  550,  551,
			  551,  552,  552,  553,  553,  547,  554,  547,  547,  554,
			  555,  556,  547,  557,  558,  547,  554,  547,  547,  547,
			  558,  558,  547,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,   26,  547,   51,   51,  560,  547,  547,  547,  547,
			  547,  547,  547,  547,  547,  547,  547,  547,  547,  561,
			  561,  547,  561,  547,  562,  563,  547,  563,  554,  558,
			  558,  558,  547,  547,  555,  547,  564,  555,  556,  556,
			  556,   90,   90,  547,  565,  547,   51,  566,  547,  547,

			  554,  567,  547,  547,  547,  568,  547, yy_Dummy>>,
			1, 107, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  547,  547,  560,  547,  569,  547,  547,  547,  560,  547,
			  547,  547,  547,  547,  547,  547,  547,  547,  561,  547,
			  561,  547,  561,  561,  562,  547,  562,  547,  563,  547,
			  563,  547,  558,  558,  558,  564,  570,  571,  564,  564,
			  555,  547,   90,   90,   90,  556,   88,   88,  547,  547,
			  547,  566,  547,  547,  547,  547,  547,  547,  547,  547,
			  547,  568,  572,  547, yy_Dummy>>,
			1, 64, 148)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  547,  547,  547,  547,  547,  573,  571,  564,  564,  564,
			  547,  547,  547,  547,  547,  547,  547,  547,  547,  547,
			  547,  547,  547,  547,  574,  572,  575, yy_Dummy>>,
			1, 27, 265)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  547,  547,  560,  547,  547,  576,  547,  547,  571,  564,
			  564,  564,  564,  547,  547,  547,  577,  547,  547,  547,
			  547,  547,  547,  547,  547,  547,  574,  547,  547,  547, yy_Dummy>>,
			1, 30, 344)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  547,  547,  578,  547,  547,  547,  576,  547,  547,  564,
			  564,  355,  547,  547,  547,  577,  547,  547,  547,  547,
			  547,  547,  547,  547, yy_Dummy>>,
			1, 24, 417)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  547,  547,  578,  547,  547,  576,  547,  547,  579,  547,
			  564,  564,  355,  547,  547,  577,  547,  547,  547,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  547,  547,  578,  547,  547,  579,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  559,  547,  547,  579,  559,  559,  559,  559,
			  559,  559,    0, yy_Dummy>>,
			1, 73, 475)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (74, 127, 159)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (74, 173, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (74, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (74, 8203, 8229)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (74, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (74, 8288, 8657)
			an_array.put (70, 8658)
			an_array.area.fill_with (74, 8659, 8703)
			yy_ec_template_4 (an_array)
			an_array.area.fill_with (74, 8708, 8742)
			yy_ec_template_5 (an_array)
			an_array.area.fill_with (74, 8745, 8890)
			an_array.put (70, 8891)
			an_array.area.fill_with (74, 8892, 10225)
			an_array.area.fill_with (70, 10226, 10227)
			an_array.area.fill_with (74, 10228, 12287)
			yy_ec_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   74,   74,   74,   74,   74,   74,   74,   74,    1,
			    2,    1,    1,    3,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,    6,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,
			   49,    7,   50,   51,    4,   52,   53,   54,   55,   56,

			   57,   28,   58,   30,   59,   32,   33,   34,   60,   36,
			   61,   38,   39,   62,   63,   64,   65,   66,   67,   46,
			   47,   48,   49,   68,    6,   51,   69, yy_Dummy>>,
			1, 127, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   74,   74,   74,   74,   74,   70,   74,   74,   74,
			   74,   74,   70, yy_Dummy>>,
			1, 13, 160)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   71,   74,   74,   74,   74,   74,   74,   74,   74,    1, yy_Dummy>>,
			1, 10, 8230)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   70,   74,   74,   70, yy_Dummy>>,
			1, 4, 8704)
		end

	yy_ec_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   72,   73, yy_Dummy>>,
			1, 2, 8743)
		end

	yy_ec_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   74,   74, yy_Dummy>>,
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
			   13,   13,   13,   13,   13, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 548)
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
			  106,  109,  112,  114,  118,  122,  124,  126,  128,  130,
			  132,  134,  136,  139,  141,  143,  145,  147,  149,  151,
			  153,  155,  157,  159,  162,  164,  166,  168,  170,  171,
			  171,  171,  171,  172,  172,  173,  175,  175,  177,  179,
			  180,  181,  182,  183,  184,  184,  186,  187,  188,  189,

			  191,  193,  193,  194,  194,  194,  194,  195,  196,  197,
			  198,  199,  201,  202,  203,  204,  205,  206,  207,  208,
			  210,  211,  212,  213,  214,  215,  216,  218,  219,  220,
			  222,  223,  224,  225,  226,  227,  228,  230,  231,  232,
			  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,
			  242,  243,  244,  244,  245,  246,  247,  249,  251,  253,
			  253,  254,  255,  255,  256,  256,  257,  257,  258,  258,
			  259,  259,  259,  259,  261,  261,  263,  263,  264,  264,
			  266,  267,  268,  269,  269,  270,  271,  271,  272,  273,
			  274,  276,  278,  280,  281,  283,  285,  286,  287,  288, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  289,  289,  289,  290,  292,  292,  293,  293,  294,  294,
			  295,  295,  296,  297,  298,  300,  302,  303,  304,  305,
			  306,  307,  308,  309,  310,  311,  312,  313,  315,  316,
			  317,  318,  319,  320,  321,  322,  323,  324,  325,  326,
			  327,  328,  329,  331,  332,  334,  335,  336,  337,  338,
			  339,  340,  341,  342,  343,  344,  345,  346,  347,  348,
			  349,  350,  351,  352,  353,  355,  355,  355,  356,  357,
			  358,  358,  360,  360,  360,  360,  361,  362,  363,  363,
			  365,  366,  366,  366,  366,  368,  369,  370,  371,  372,
			  373,  374,  374,  375,  376,  377,  378,  379,  380,  381,

			  382,  383,  384,  385,  386,  387,  389,  390,  391,  392,
			  393,  394,  395,  397,  398,  399,  400,  401,  402,  403,
			  405,  406,  408,  410,  411,  413,  414,  415,  416,  417,
			  418,  419,  420,  421,  422,  423,  424,  426,  428,  429,
			  430,  431,  432,  434,  436,  436,  436,  438,  438,  438,
			  438,  438,  438,  439,  439,  439,  439,  439,  440,  440,
			  440,  440,  440,  440,  440,  440,  444,  445,  445,  446,
			  447,  448,  449,  450,  450,  452,  454,  455,  456,  457,
			  459,  461,  462,  463,  464,  466,  467,  468,  469,  470,
			  471,  472,  473,  475,  476,  477,  478,  479,  480,  481, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  482,  484,  485,  486,  487,  488,  489,  490,  491,  492,
			  494,  495,  496,  498,  499,  500,  502,  503,  503,  503,
			  503,  503,  504,  505,  506,  506,  506,  506,  506,  506,
			  507,  508,  509,  510,  511,  511,  512,  512,  512,  513,
			  513,  514,  516,  517,  518,  519,  521,  522,  523,  524,
			  525,  527,  529,  530,  532,  533,  534,  536,  537,  538,
			  539,  540,  541,  542,  543,  544,  545,  547,  548,  550,
			  552,  554,  555,  556,  558,  559,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  561,  561,  563,  564,  565,  567,  568,  570,

			  571,  572,  573,  574,  576,  578,  579,  581,  583,  584,
			  585,  586,  587,  588,  590,  591,  592,  594,  594,  594,
			  594,  594,  594,  594,  596,  597,  599,  601,  602,  604,
			  606,  608,  609,  611,  612,  614,  615,  617,  619,  619,
			  619,  619,  621,  622,  624,  626,  628,  630,  630, yy_Dummy>>,
			1, 149, 400)
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
			    0,  129,   71,  127,  128,    1,  127,  128,    1,  128,
			    2,   71,  127,  128,   92,  127,  128,   70,   71,  127,
			  128,    2,  127,  128,   78,  127,  128,    2,  127,  128,
			    2,  127,  128,    2,   71,  127,  128,  108,  127,  128,
			  108,  127,  128,    2,  127,  128,    2,  127,  128,    2,
			  127,  128,    2,  127,  128,   69,  127,  128,   69,  127,
			  128,   69,  127,  128,   69,  127,  128,   69,  127,  128,
			   69,  127,  128,   69,  127,  128,   69,  127,  128,   69,
			  127,  128,   69,  127,  128,   69,  127,  128,   69,  127,
			  128,   69,  127,  128,   69,  127,  128,   69,  127,  128,

			   69,  127,  128,   69,  127,  128,   69,  127,  128,   71,
			  127,  128,  127,  128,    2,   71,  127,  128,    2,   71,
			  127,  128,   98,  128,  102,  128,   99,  128,  101,  128,
			  107,  128,  107,  128,  106,  128,  105,  107,  128,  104,
			  128,  104,  128,  103,  128,   82,  128,   82,  128,   81,
			  128,   87,  128,   87,  128,   86,  128,   87,  128,   84,
			   87,  128,   87,  128,   90,  128,   89,  128,   90,  128,
			   71,    1,   92,   79,   91,   92, -208,   70,   71,   70,
			   70,   70,   70,   78,   77,   78,   71,    1,    3,  123,
			  126,    3,   71,  108,  111,   69,   69,   69,   69,    8, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   69,   69,   69,   69,   69,   69,   69,   69,   17,   69,
			   69,   69,   69,   69,   69,   69,   29,   69,   69,   69,
			   35,   69,   69,   69,   69,   69,   69,   69,   43,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,  110,   98,   99,  100,  100,   93,   98,  100,   96,
			  100,   97,  100,  106,  105,  103,   81,   86,   84,   85,
			   86,   83,   84,   89,   88,   89,   71,   71,   71,   92,
			   92, -208,   92,  -80,   70,   71,   70,   71,   70,   71,
			   70,   70,   71,   70,   71,   72,   78,   76,    1,  121,
			  123,  126,  118,  115,  112,  109,   69,   69,    6,   69,

			    7,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   20,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   39,
			   69,   69,   41,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   62,   69,   95,   95,   91,   92, -208,
			   73,   75,   75,  123,  126,  126,  122,  125,  120,  119,
			  117,  116,  114,  113,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   18,   69,   69,
			   69,   69,   69,   69,   69,   27,   69,   69,   69,   69, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   69,   69,   69,   36,   69,   69,   38,   69,   67,   69,
			   69,   42,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   54,   69,   55,   69,   69,   69,
			   69,   69,   60,   69,   61,   69,   94,   98,   92,   78,
			  122,  123,  125,  126,  126,  118,  115,  112,  124,  126,
			    4,   69,    5,   69,   69,   69,   69,   10,   69,   63,
			   69,   69,   69,   69,   15,   69,   69,   69,   69,   69,
			   69,   69,   69,   25,   69,   69,   69,   69,   69,   69,
			   69,   69,   37,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   50,   69,   69,   69,   53,   69,   69,   69,

			   58,   69,   69,   95,   95,   95,   74,   75,   75,   75,
			  126,  126,  125,  125,    9,   69,   69,   69,   69,   12,
			   69,   69,   69,   69,   69,   19,   69,   21,   69,   69,
			   23,   69,   69,   69,   28,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   46,   69,   69,   48,   69,
			   49,   69,   51,   69,   69,   69,   57,   69,   69,  125,
			  126,  125,  126,   69,   69,   11,   69,   69,   14,   69,
			   69,   69,   69,   69,   26,   69,   30,   69,   69,   32,
			   69,   33,   69,   69,   69,   69,   69,   69,   47,   69,
			   69,   69,   59,   69,   64,   69,   69,   13,   69,   16, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   69,   69,   22,   69,   24,   69,   31,   69,   69,   40,
			   69,   69,   45,   69,   69,   52,   69,   56,   69,   65,
			   69,   69,   34,   69,   44,   69,   68,   69,   66,   69, yy_Dummy>>,
			1, 30, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1754
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 547
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 548
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 74
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
	MS: INTEGER = 1
	MSN: INTEGER = 2
	MSN1: INTEGER = 3
	VS1: INTEGER = 4
	VS2: INTEGER = 5
	VS3: INTEGER = 6
			-- Start condition codes

feature -- User-defined features



end
