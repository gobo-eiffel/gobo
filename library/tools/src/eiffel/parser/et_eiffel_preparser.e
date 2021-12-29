note

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2021, Eric Bezault and others"
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
			create an_array.make_filled (0, 0, 1832)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			an_array.area.fill_with (548, 1758, 1832)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   17,   18,   17,   19,   20,   21,   22,   16,   23,
			   22,   19,   24,   25,   26,   27,   28,   28,   28,   29,
			   30,   22,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   35,   35,   40,   35,   35,   41,   35,   42,   43,
			   44,   35,   45,   46,   47,   48,   49,   50,   51,   35,
			   35,   52,   22,   53,   16,   34,   35,   36,   37,   39,
			   35,   41,   42,   35,   45,   46,   47,   48,   49,   22,
			   19,   19,   16,   54,   55,   16,   57,   57,   86,   58,
			   58,   87,   59,   59,   61,   62,   61,   61,   62,   61,
			  547,   63,   77,   78,   63,   65,   66,   65,   65,   66,

			   65,   68,   69,   68,   68,   69,   68,   71,   72,   73,
			  147,   74,   71,   72,   73,   80,   74,   77,   78,   83,
			   83,   83,  541,   81,   80,   82,   83,   83,   83,   98,
			   84,  546,   81,   79,   82,   95,   96,   84,  147,   99,
			  232,   99,   88,  100,  100,  100,  100,   80,  102,  101,
			  103,  103,  103,  103,  101,   81,   99,   82,   75,   99,
			   99,  104,  105,   75,   89,  232,   89,  542,   79,   99,
			   99,   89,   91,  102,   89,  103,  103,  103,  103,  520,
			   92,  131,   93,  106,   89,  119,  138,  132,  107,  109,
			  538,  104,  105,  114,  110,  120,  111,  115,  178,  179, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  116,  112,  113,  117,  152,  101,  118,  153,  138,  180,
			  179,   89,  124,  107,   89,  152,  125,  144,  153,  110,
			  111,  114,  115,  112,  113,  117,   79,  537,  118,  126,
			   89,   79,   79,   79,   79,   79,   89,  121,   89,  122,
			   79,  144,  124,   89,   91,  548,   89,  101,  142,  123,
			  315,  126,   92,  127,   93,  548,   89,  134,  143,  140,
			  128,  129,  121,  122,  145,   86,  130,  135,   87,  136,
			  535,   83,   79,  137,  141,  315,  142,  534,  146,  548,
			  143,  200,  127,   89,  533,  129,   89,  134,  130,  163,
			  164,  163,  135,  136,  145,  137,  141,  149,  149,  149,

			  149,  216,   89,   79,   79,   79,   79,   79,  217,  101,
			  160,  161,  160,  165,  166,  165,  181,  162,  168,  169,
			  531,  170,  168,  175,  182,  176,  183,  491,   79,   88,
			  217,  216,  267,  156,  267,  150,  155,  156,  155,  154,
			  157,  154,  154,  157,  157,  157,  154,  154,  154,  158,
			  154,  154,  154,  154,  154,  157,  154,  157,  154,  154,
			  157,  157,  157,  157,  154,  157,  154,  157,  154,  154,
			  154,  157,  154,  157,  154,  154,  157,  157,  157,  157,
			  157,  157,  154,  154,  154,  154,  154,  154,  154,  154,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  159,  159,  159,  159,  154,  154,  154,  154,  154,  154,
			  154,  171,  168,  172,  488,  170,  171,  174,  172,  191,
			  170,   83,   83,   83,  189,  190,  189,  192,   86,  193,
			  196,   87,   84,  220,  204,  204,  204,  204,   90,  218,
			  195,  100,  100,  100,  100,  481,  181,  548,  205,  206,
			  206,  194,  221,  223,  182,  201,  183,  401,  208,  208,
			  208,  218,  173,  220,  227,  548,  214,  173,  185,  215,
			  548,  186,  186,  186,  230,  223,  221,  187,  231,  202,
			  548,  243,  401,  186,  313,  186,  227,  207,  186,  186,
			  186,  186,   88,  186,  215,  186,  209,  314,  224,  186,

			  231,  186,  225,  243,  186,  186,  186,  186,  186,  186,
			  548,  548,  548,  548,  548,  102,  226,  103,  103,  103,
			  103,  212,  212,  212,  212,  244,  233,  228,  224,  188,
			  236,  225,  188,  195,  237,  195,  245,   97,  226,  241,
			  195,  548,  229,  195,  246,  238,  254,  244,  239,  195,
			  255,  242,  514,  195,  256,  107,  233,  228,  152,  107,
			  236,  153,  237,  258,  229,  262,  245,  238,  259,  241,
			  239,  254,  265,  260,  246,  504,  256,  163,  164,  163,
			  195,  178,  179,  195,  261,  258,  294,  262,  149,  149,
			  149,  149,  180,  179,  265,  165,  166,  165,  259,  195, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   97,   97,   97,   97,   97,  248,  261,  249,  149,  149,
			  149,  149,  160,  161,  160,  250,  294,  502,  251,  162,
			  252,  253,  268,  269,  269,  269,  150,  168,  169,  548,
			  170,  174,  169,  548,  170,  248,  249,  298,  270,  250,
			  251,  271,  252,  253,  293,   83,  150,  171,  168,  172,
			  500,  170,  171,  174,  172,  200,  170,  168,  175,  548,
			  176,  174,  175,  270,  176,  498,   87,  298,  293,  273,
			  274,  274,  274,  275,  190,  275,  196,  548,  189,  190,
			  189,  495,   86,  402,   90,   87,  195,  277,  278,  278,
			  278,  299,  548,  548,  548,  548,  548,  409,  173,  474,

			  279,  279,  300,  173,  280,  280,  280,  280,  402,  281,
			  281,  281,  281,  299,  204,  204,  204,  204,  206,  206,
			  287,  287,  409,  188,  300,  284,  284,  272,  282,  285,
			  285,  285,  285,  208,  208,  208,  289,  289,  289,  301,
			  292,  188,  212,  212,  212,  212,   88,  202,  296,  305,
			  302,  303,  283,  307,  308,  311,  286,  473,  207,  312,
			  319,  321,  326,  329,  330,  297,  333,  331,  309,  301,
			  335,  288,  302,  303,  209,  307,  340,  311,  296,  305,
			  107,  312,  337,  343,  308,  332,  330,  297,  333,  375,
			  319,  321,  326,  329,  344,  422,  422,  331,  340,  378, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  335,  345,  346,  346,  346,  416,  337,  332,  267,  156,
			  267,  375,  469,  343,  280,  280,  280,  280,  344,  347,
			  269,  269,  269,  269,  347,  269,  269,  269,  269,  378,
			  416,  348,  349,  353,  190,  353,  548,  270,  376,  467,
			   87,  280,  280,  280,  280,  186,  274,  274,  274,  274,
			  275,  190,  275,  350,  548,  530,  381,  466,  351,  387,
			  376,  348,  349,  351,  358,  278,  278,  278,  278,  358,
			  278,  278,  278,  278,  465,  390,  359,  360,  381,  363,
			  530,  365,  365,  383,  357,  366,  366,  366,  366,  387,
			  281,  281,  281,  281,  367,  367,  367,  367,  361,  390,

			  188,  272,  548,  362,  364,  383,  359,  360,  362,  369,
			  369,  186,  274,  274,  274,  274,  431,  431,  188,  285,
			  285,  285,  285,  354,  355,  287,  287,  386,  202,  370,
			  370,  370,  283,  285,  285,  285,  285,  289,  289,  289,
			  389,  373,  373,  373,  373,  356,  391,  286,  392,  386,
			  357,  394,  398,  354,  355,  374,  400,  403,  404,  405,
			  408,  411,  389,  207,  412,  414,  188,  288,  391,  417,
			  392,  368,  442,  394,  398,  209,  415,  152,  400,  403,
			  153,  405,  408,  423,  423,  423,  412,  404,  353,  190,
			  353,  411,  270,  444,  414,   87,  442,  463,  415,  417, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  151,  346,  346,  346,  346,  151,  346,  346,  346,  346,
			  443,  451,  418,  419,  269,  269,  269,  269,  425,  426,
			  426,  426,  548,  444,  462,  548,  432,  432,  432,  445,
			  476,  476,  427,  427,  420,  428,  428,  428,  443,  421,
			  451,  543,  418,  419,  421,  278,  278,  278,  278,  369,
			  369,  445,  351,  370,  370,  370,  272,  548,  434,  434,
			  434,  434,  366,  366,  366,  366,  543,  274,  274,  274,
			  274,  435,  435,  448,  453,  436,  436,  436,  436,  366,
			  366,  366,  366,  362,  446,  449,  188,  286,  447,  188,
			  548,  288,  367,  367,  367,  367,  363,  448,  450,  461,

			  429,  429,  429,  429,  453,  357,  438,  449,  460,  472,
			  429,  429,  429,  429,  429,  429,  454,  437,  477,  477,
			  477,  188,  439,  439,  439,  439,  450,  456,  459,  461,
			  283,  373,  373,  373,  373,  455,  464,  457,  454,  472,
			  429,  429,  429,  429,  429,  438,  440,  440,  468,  456,
			  441,  441,  441,  441,  188,  470,  471,  475,  464,  455,
			  368,  457,  346,  346,  346,  346,  347,  422,  422,  283,
			  468,  347,  423,  423,  423,  347,  186,  470,  471,  358,
			  506,  475,  185,  426,  426,  426,  426,  185,  426,  426,
			  426,  426,  548,  501,  482,  483,  458,  548,  496,  452, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  421,  186,  427,  427,  506,  479,  186,  428,  428,  428,
			  480,  358,  431,  431,  481,  488,  484,  497,  491,  290,
			  496,  485,  503,  501,  482,  483,  485,  358,  432,  432,
			  432,  434,  434,  434,  434,  436,  436,  436,  436,  497,
			  486,  436,  436,  436,  436,  487,  492,  492,  492,  492,
			  489,  430,  503,  493,  493,  509,  188,  494,  494,  494,
			  494,  188,  439,  439,  439,  439,  490,  499,  505,  363,
			  441,  441,  441,  441,  441,  441,  441,  441,  151,  363,
			  507,  508,  510,  511,  437,  509,  512,  513,  413,  499,
			  505,  515,  516,  517,  151,  476,  476,  422,  422,  410,

			  368,  524,  507,  508,  510,  511,  151,  477,  477,  477,
			  512,  513,  368,  515,  526,  517,  516,  520,  423,  423,
			  423,  521,  521,  522,  522,  522,  426,  426,  426,  426,
			  548,  524,  548,  518,  185,  479,  431,  431,  526,  525,
			  427,  427,  428,  428,  428,  519,  432,  432,  432,  492,
			  492,  492,  492,  527,  407,  528,  480,  494,  494,  494,
			  494,  525,  529,  406,  485,  494,  494,  494,  494,  532,
			  536,  476,  476,  541,  489,  477,  477,  477,  486,  544,
			  487,  521,  521,  527,  490,  528,  545,  437,  185,  521,
			  521,  399,  529,  532,  188,  397,  188,  522,  522,  522, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  536,  544,   79,  437,  185,  522,  522,  522,  545,  518,
			   79,  396,   97,  519,  108,  108,  108,  108,  108,  539,
			   97,  395,  198,  393,  198,  198,  388,  539,  198,  385,
			  198,  384,  210,  210,  382,  540,  210,  291,  291,  424,
			  424,  291,  380,  540,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   70,   70,   70,   70,

			   70,   70,   70,   70,   70,   70,   70,   70,   70,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   85,  379,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   94,  377,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,  151,  211,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  177,  177,  177, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  177,
			  184,  290,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,  203,  203,  203,  203,
			  203,  203,  352,  203,  203,  203,  203,  203,  203,  151,
			  342,  151,  151,  433,  433,  151,  341,  151,  185,  339,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  186,  338,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  185,  336,  185,  185,  478,  478,
			  185,  334,  185,  371,  371,  523,  523,  371,  372,  372,

			  372,  372,  372,  372,  328,  372,  372,  372,  372,  372,
			  372,  327,  325,  324,  323,  322,  320,  318,  317,  316,
			  310,  306,  304,  295,  211,  290,  276,   80,  196,  548,
			  548,  266,  264,  263,  257,  247,  240,  235,  234,  222,
			  219,  213,  211,   79,  197,  199,  197,  196,   98,  548,
			  548,  148,  139,  133,   99,   99,  548,   15, yy_Dummy>>,
			1, 158, 1600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1832)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 75)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (59, 336, 410)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			an_array.area.fill_with (548, 1757, 1832)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    4,   20,    3,    4,   20,    3,    4,    5,    5,
			    5,    6,    6,    6,  543,    5,   13,   13,    6,    7,
			    7,    7,    8,    8,    8,    9,    9,    9,   10,   10,
			   10,   11,   11,   11,   50,   11,   12,   12,   12,   16,
			   12,   14,   14,   17,   17,   17,  541,   16,   19,   16,
			   18,   18,   18,   24,   17,  536,   19,   54,   19,   23,
			   23,   18,   50,   24,  124,   25,   20,   25,   25,   25,
			   25,   26,   27,   26,   27,   27,   27,   27,   54,   26,
			   26,   26,   11,   30,   30,   27,   27,   12,   21,  124,
			   21,  525,   21,   31,   31,   21,   21,   28,   21,   28,

			   28,   28,   28,  520,   21,   41,   21,   27,   21,   37,
			   44,   41,   27,   34,  516,   27,   27,   36,   34,   37,
			   34,   36,   76,   76,   36,   34,   34,   36,   56,   26,
			   36,   56,   44,   78,   78,   21,   39,   28,   21,  151,
			   39,   48,  151,   34,   34,   36,   36,   34,   34,   36,
			   55,  515,   36,   39,   21,   21,   21,   21,   21,   21,
			   33,   38,   33,   38,   33,   48,   39,   33,   33,   80,
			   33,   55,   47,   38,  235,   39,   33,   40,   33,   80,
			   33,   43,   47,   46,   40,   40,   38,   38,   49,   85,
			   40,   43,   85,   43,  512,   98,   52,   43,   46,  235, yy_Dummy>>,
			1, 200, 76)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   47,  511,   49,   52,   47,   98,   40,   33,  510,   40,
			   33,   43,   40,   65,   65,   65,   43,   43,   49,   43,
			   46,   53,   53,   53,   53,  111,   33,   33,   33,   33,
			   33,   33,  112,   52,   61,   61,   61,   68,   68,   68,
			   79,   61,   70,   70,  506,   70,   75,   75,   79,   75,
			   79,  491,   52,   85,  112,  111,  155,  155,  155,   53, yy_Dummy>>,
			1, 60, 276)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   71,   71,   71,  488,   71,   73,   73,   73,   89,   73,
			   83,   83,   83,   88,   88,   88,   89,   88,   89,   92,
			   88,   83,  115,  102,  102,  102,  102,   92,  113,   92,
			  100,  100,  100,  100,  481,  101,   90,  102,  104,  104,
			   90,  116,  118,  101,  100,  101,  321,  105,  105,  105,
			  113,   71,  115,  121,  184,  110,   73,   87,  110,  181,
			   87,   87,   87,  123,  118,  116,   87,  123,  100,  181,
			  133,  321,   87,  234,   87,  121,  104,   87,   87,   87,
			   87,   88,   87,  110,   87,  105,  234,  119,   87,  123,
			   87,  119,  133,   87,   87,   87,   87,   87,   87,   90,

			   90,   90,   90,   90,  103,  119,  103,  103,  103,  103,
			  107,  107,  107,  107,  134,  125,  122,  119,  184,  129,
			  119,   87,   91,  129,   91,  135,   91,  119,  132,   91,
			   91,  122,   91,  136,  129,  140,  134,  129,   91,  140,
			  132,  468,   91,  141,  103,  125,  122,  157,  107,  129,
			  157,  129,  143,  122,  145,  135,  129,  144,  132,  129,
			  140,  148,  144,  136,  456,  141,  163,  163,  163,   91,
			  177,  177,   91,  144,  143,  214,  145,  149,  149,  149,
			  149,  179,  179,  148,  165,  165,  165,  144,   91,   91,
			   91,   91,   91,   91,  139,  144,  139,  150,  150,  150, yy_Dummy>>,
			1, 200, 411)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  150,  160,  160,  160,  139,  214,  453,  139,  160,  139,
			  139,  158,  158,  158,  158,  149,  167,  167,  194,  167,
			  169,  169,  194,  169,  139,  139,  219,  185,  139,  139,
			  185,  139,  139,  213,  200,  150,  171,  171,  171,  449,
			  171,  172,  172,  172,  200,  172,  173,  173,  187,  173,
			  175,  175,  186,  175,  447,  186,  219,  213,  187,  187,
			  187,  187,  188,  188,  188,  192,  188,  189,  189,  189,
			  443,  189,  324,  192,  189,  192,  199,  199,  199,  199,
			  220,  194,  194,  194,  194,  194,  332,  171,  415,  201,
			  201,  221,  172,  201,  201,  201,  201,  324,  202,  202,

			  202,  202,  220,  204,  204,  204,  204,  206,  206,  207,
			  207,  332,  187,  221,  205,  205,  186,  204,  205,  205,
			  205,  205,  208,  208,  208,  209,  209,  209,  222,  212,
			  188,  212,  212,  212,  212,  189,  202,  218,  226,  223,
			  224,  204,  229,  230,  232,  206,  414,  207,  233,  239,
			  241,  247,  250,  251,  218,  253,  252,  230,  222,  255,
			  208,  223,  224,  209,  229,  260,  232,  218,  226,  212,
			  233,  257,  263,  230,  252,  251,  218,  253,  293,  239,
			  241,  247,  250,  264,  348,  348,  252,  260,  296,  255,
			  266,  266,  266,  266,  341,  257,  252,  267,  267,  267, yy_Dummy>>,
			1, 200, 611)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  293,  408,  263,  279,  279,  279,  279,  264,  268,  268,
			  268,  268,  268,  269,  269,  269,  269,  269,  296,  341,
			  268,  268,  272,  272,  272,  274,  272,  294,  406,  272,
			  280,  280,  280,  280,  274,  274,  274,  274,  274,  275,
			  275,  275,  268,  275,  503,  299,  405,  268,  305,  294,
			  268,  268,  269,  277,  277,  277,  277,  277,  278,  278,
			  278,  278,  278,  404,  308,  277,  277,  299,  280,  503,
			  282,  282,  301,  274,  282,  282,  282,  282,  305,  281,
			  281,  281,  281,  283,  283,  283,  283,  277,  308,  274,
			  272,  273,  277,  281,  301,  277,  277,  278,  286,  286,

			  273,  273,  273,  273,  273,  359,  359,  275,  284,  284,
			  284,  284,  273,  273,  287,  287,  304,  281,  288,  288,
			  288,  283,  285,  285,  285,  285,  289,  289,  289,  307,
			  292,  292,  292,  292,  273,  309,  286,  310,  304,  273,
			  312,  317,  273,  273,  292,  319,  326,  327,  328,  331,
			  334,  307,  287,  335,  339,  273,  288,  309,  342,  310,
			  285,  377,  312,  317,  289,  340,  347,  319,  326,  347,
			  328,  331,  349,  349,  349,  335,  327,  353,  353,  353,
			  334,  353,  379,  339,  353,  377,  402,  340,  342,  345,
			  345,  345,  345,  345,  346,  346,  346,  346,  346,  378, yy_Dummy>>,
			1, 200, 811)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  388,  345,  345,  351,  351,  351,  351,  352,  352,  352,
			  352,  354,  379,  400,  355,  360,  360,  360,  382,  418,
			  418,  354,  354,  345,  355,  355,  355,  378,  345,  388,
			  528,  345,  345,  346,  362,  362,  362,  362,  369,  369,
			  382,  351,  370,  370,  370,  353,  357,  363,  363,  363,
			  363,  365,  365,  365,  365,  528,  357,  357,  357,  357,
			  364,  364,  384,  390,  364,  364,  364,  364,  366,  366,
			  366,  366,  362,  383,  386,  354,  369,  383,  355,  356,
			  370,  367,  367,  367,  367,  363,  384,  387,  399,  356,
			  356,  356,  356,  390,  357,  367,  386,  398,  412,  356,

			  356,  356,  356,  356,  356,  391,  366,  419,  419,  419,
			  357,  368,  368,  368,  368,  387,  394,  397,  399,  367,
			  373,  373,  373,  373,  392,  403,  395,  391,  412,  356,
			  356,  356,  356,  356,  373,  374,  374,  407,  394,  374,
			  374,  374,  374,  356,  409,  411,  417,  403,  392,  368,
			  395,  421,  421,  421,  421,  422,  422,  422,  373,  407,
			  423,  423,  423,  423,  424,  429,  409,  411,  433,  459,
			  417,  425,  425,  425,  425,  425,  426,  426,  426,  426,
			  426,  427,  450,  425,  425,  396,  428,  444,  389,  421,
			  427,  427,  427,  459,  422,  428,  428,  428,  428,  423, yy_Dummy>>,
			1, 200, 1011)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  431,  431,  431,  424,  429,  425,  445,  433,  371,  444,
			  425,  455,  450,  425,  425,  426,  432,  432,  432,  432,
			  434,  434,  434,  434,  435,  435,  435,  435,  445,  427,
			  436,  436,  436,  436,  428,  437,  437,  437,  437,  431,
			  358,  455,  438,  438,  462,  427,  438,  438,  438,  438,
			  428,  439,  439,  439,  439,  432,  448,  458,  434,  440,
			  440,  440,  440,  441,  441,  441,  441,  478,  436,  460,
			  461,  463,  464,  437,  462,  465,  466,  336,  448,  458,
			  472,  473,  475,  476,  476,  476,  479,  479,  333,  439,
			  495,  460,  461,  463,  464,  477,  477,  477,  477,  465,

			  466,  441,  472,  498,  475,  473,  478,  480,  480,  480,
			  482,  482,  483,  483,  483,  485,  485,  485,  485,  486,
			  495,  487,  476,  523,  479,  489,  489,  498,  496,  486,
			  486,  487,  487,  487,  477,  490,  490,  490,  492,  492,
			  492,  492,  500,  330,  501,  480,  493,  493,  493,  493,
			  496,  502,  329,  485,  494,  494,  494,  494,  509,  513,
			  518,  518,  523,  489,  519,  519,  519,  486,  532,  487,
			  539,  539,  500,  490,  501,  534,  492,  521,  521,  521,
			  318,  502,  509,  486,  316,  487,  540,  540,  540,  513,
			  532,  555,  494,  522,  522,  522,  522,  534,  518,  555, yy_Dummy>>,
			1, 200, 1211)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  315,  559,  519,  560,  560,  560,  560,  560,  539,  559,
			  314,  566,  311,  566,  566,  306,  521,  566,  303,  566,
			  302,  569,  569,  300,  540,  569,  573,  573,  577,  577,
			  573,  298,  522,  549,  549,  549,  549,  549,  549,  549,
			  549,  549,  549,  549,  549,  549,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  550,  550,  550,  550,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  552,  552,  552,  552,  552,  552,  552,  552,
			  552,  552,  552,  552,  552,  553,  553,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  554,  554,

			  554,  554,  554,  554,  554,  554,  554,  554,  554,  554,
			  554,  556,  297,  556,  556,  556,  556,  556,  556,  556,
			  556,  556,  556,  556,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  558,  295,  558,  558,  558,  558,
			  558,  558,  558,  558,  558,  558,  558,  561,  291,  561,
			  561,  561,  561,  561,  561,  561,  561,  561,  561,  561,
			  562,  562,  562,  562,  562,  562,  562,  562,  562,  562,
			  562,  562,  562,  563,  563,  563,  563,  563,  563,  563,
			  563,  563,  563,  563,  563,  563,  564,  564,  564,  564,
			  564,  564,  564,  564,  564,  564,  564,  564,  564,  565, yy_Dummy>>,
			1, 200, 1411)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  290,  565,  565,  565,  565,  565,  565,  565,  565,  565,
			  565,  565,  567,  567,  567,  567,  567,  567,  567,  567,
			  567,  567,  567,  567,  567,  568,  568,  568,  568,  568,
			  568,  271,  568,  568,  568,  568,  568,  568,  570,  262,
			  570,  570,  578,  578,  570,  261,  570,  571,  259,  571,
			  571,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  572,  258,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  574,  256,  574,  574,  579,  579,  574,
			  254,  574,  575,  575,  580,  580,  575,  576,  576,  576,
			  576,  576,  576,  249,  576,  576,  576,  576,  576,  576,

			  248,  246,  244,  243,  242,  240,  238,  237,  236,  231,
			  227,  225,  217,  211,  210,  198,  196,  193,  183,  182,
			  153,  147,  146,  142,  138,  131,  128,  126,  117,  114,
			  109,  106,   97,   96,   95,   94,   93,   84,   82,   81,
			   51,   45,   42,   32,   29,   15, yy_Dummy>>,
			1, 146, 1611)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 580)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   74,   75,   83,   86,   94,   97,  100,
			  103,  106,  111,   90,  115, 1756,  103,  118,  125,  112,
			   73,  160, 1757,  127,  117,  128,  135,  135,  160, 1734,
			  139,  148, 1733,  232,  158,    0,  161,  156,  201,  187,
			  223,  148, 1714,  231,  144, 1723,  230,  216,  179,  239,
			   78, 1712,  258,  282,   82,  175,  199, 1757, 1757,  335,
			 1757,  309, 1757, 1757, 1757,  288, 1757, 1757,  312, 1757,
			  316,  410, 1757,  415, 1757,  320,  196, 1757,  207,  304,
			  233, 1730, 1727,  420, 1736,  260, 1757,  463,  423,  407,
			  439,  529,  418, 1735, 1737, 1731, 1735, 1692,  269, 1757,

			  426,  434,  419,  502,  434,  443, 1689,  506,    0, 1712,
			  433,  273,  265,  395, 1711,  408,  414, 1710,  411,  472,
			    0,  421,  499,  434,  104,  501, 1699,    0, 1697,  502,
			    0, 1701,  512,  437,  482,  508,  517,    0, 1706,  577,
			  510,  512, 1705,  518,  540,  523, 1700, 1703,  530,  573,
			  593,  210, 1757, 1717, 1757,  331, 1757,  553,  607, 1757,
			  611, 1757, 1757,  576, 1757,  594, 1757,  625, 1757,  629,
			 1757,  646,  651,  655, 1757,  659, 1757,  579, 1757,  590,
			 1757,  458, 1710, 1707,  460,  633,  658,  654,  672,  677,
			 1757,    0,  664, 1716,  621,    0, 1715, 1757, 1717,  672, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  643,  689,  694, 1757,  699,  714,  703,  705,  718,  721,
			 1672, 1671,  727,  606,  561,    0,    0, 1690,  723,  610,
			  648,  656,  714,  708,  706, 1693,  724, 1692,    0,  708,
			  729, 1691,  712,  715,  447,  214, 1690, 1689, 1677,  735,
			 1687,  736, 1675, 1685, 1674,    0, 1683,  735, 1682, 1675,
			  738,  719,  740,  724, 1662,  745, 1652,  744, 1643, 1630,
			  735, 1623, 1617,  755,  756,    0,  786,  807,  805,  810,
			 1757, 1628,  832,  897,  831,  849, 1757,  850,  855,  799,
			  826,  875,  870,  879,  904,  918,  894,  910,  914,  922,
			 1558, 1506,  926,  745,  795, 1515,  772, 1490, 1407,  813,

			 1405,  839, 1402, 1398,  885,  832, 1393,  898,  837,  904,
			  906, 1394,  906,    0, 1392, 1378, 1347,  910, 1362,  914,
			    0,  421,    0,    0,  647,    0,  912,  928,  917, 1326,
			 1321,  915,  661, 1250,  934,  922, 1248,    0,    0,  935,
			  931,  769,  944,    0,    0,  986,  991,  972,  780,  968,
			    0,  999, 1003,  987, 1017, 1020, 1085, 1052, 1242,  901,
			 1011,    0, 1030, 1043, 1060, 1047, 1064, 1077, 1107, 1034,
			 1038, 1166, 1757, 1116, 1135,    0,    0,  934,  978,  967,
			    0,    0,  987, 1055, 1035,    0, 1043, 1066,  981, 1170,
			 1046, 1072, 1097,    0, 1085, 1099, 1167, 1095, 1075, 1072, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  991,    0,  968, 1094,  841,  828,  810, 1106,  783, 1111,
			    0, 1112, 1084,    0,  724,  670,    0, 1119, 1015, 1103,
			    0, 1147, 1152, 1157, 1161, 1168, 1173, 1187, 1192, 1162,
			 1757, 1197, 1213, 1165, 1216, 1220, 1226, 1231, 1242, 1247,
			 1255, 1259,    0,  652, 1153, 1173,    0,  626, 1223,  621,
			 1168,    0,    0,  588,    0, 1197,  546,    0, 1225, 1142,
			 1236, 1237, 1230, 1238, 1240, 1248, 1249,    0,  523,    0,
			    0,    0, 1247, 1254,    0, 1249, 1280, 1292, 1264, 1282,
			 1303,  392, 1306, 1308,    0, 1311, 1325, 1327,  361, 1321,
			 1331,  274, 1334, 1342, 1350, 1273, 1295,    0, 1276,    0,

			 1325, 1329, 1334,  819,    0,    0,  289,    0,    0, 1331,
			  255,  238,  241, 1343,    0,  198,  161,    0, 1356, 1360,
			  126, 1374, 1390, 1320,    0,  138,    0,    0, 1005,    0,
			    0,    0, 1335,    0, 1344,    0,  102,    0,    0, 1366,
			 1382,   69,    0,   61,    0,    0,    0,    0, 1757, 1443,
			 1456, 1469, 1482, 1495, 1508, 1397, 1521, 1531, 1544, 1407,
			 1406, 1557, 1570, 1583, 1596, 1609, 1419, 1622, 1635, 1424,
			 1646, 1657, 1670, 1429, 1681, 1685, 1697, 1431, 1645, 1680,
			 1687, yy_Dummy>>,
			1, 181, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 580)
			yy_def_template_1 (an_array)
			an_array.area.fill_with (560, 108, 148)
			yy_def_template_2 (an_array)
			an_array.area.fill_with (560, 213, 265)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (560, 293, 344)
			yy_def_template_4 (an_array)
			an_array.area.fill_with (560, 375, 417)
			yy_def_template_5 (an_array)
			an_array.area.fill_with (560, 442, 475)
			yy_def_template_6 (an_array)
			an_array.area.fill_with (548, 549, 580)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  548,    1,  549,  549,  550,  550,  551,  551,  552,
			  552,  553,  553,  554,  554,  548,  555,  548,  548,  555,
			  556,  557,  548,  558,  559,  548,  555,  548,  548,  548,
			  559,  559,  548,  557,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,   26,  548,   52,   52,  561,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  548,  548,  548,  548,
			  562,  562,  548,  562,  548,  563,  564,  548,  564,  555,
			  559,  559,  559,  548,  548,  556,  548,  565,  556,   33,
			  557,  557,   91,   91,  548,  566,  548,   52,  567,  548,

			  548,  555,  568,  548,  548,  548,  569,  548, yy_Dummy>>,
			1, 108, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  548,  548,  561,  548,  570,  548,  548,  548,  561,  548,
			  548,  548,  548,  548,  548,  548,  548,  548,  562,  548,
			  562,  548,  562,  562,  563,  548,  563,  548,  564,  548,
			  564,  548,  559,  559,  559,  565,  571,  572,  565,  565,
			  556,  548,   91,   91,   91,  557,   33,   33,  548,  548,
			  548,  567,  548,  548,  548,  548,  548,  548,  548,  548,
			  548,  569,  573,  548, yy_Dummy>>,
			1, 64, 149)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  548,  548,  548,  548,  548,  574,  572,  565,  565,  565,
			  548,  548,  548,  548,  548,  548,  548,  548,  548,  548,
			  548,  548,  548,  548,  575,  573,  576, yy_Dummy>>,
			1, 27, 266)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  548,  548,  561,  548,  548,  577,  548,  548,  572,  565,
			  565,  565,  565,  548,  548,  548,  578,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  575,  548,  548,  548, yy_Dummy>>,
			1, 30, 345)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  548,  548,  579,  548,  548,  548,  577,  548,  548,  565,
			  565,  356,  548,  548,  548,  578,  548,  548,  548,  548,
			  548,  548,  548,  548, yy_Dummy>>,
			1, 24, 418)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  548,  548,  579,  548,  548,  577,  548,  548,  580,  548,
			  565,  565,  356,  548,  548,  578,  548,  548,  548,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  548,  548,  579,  548,  548,  580,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  560,  560,  548,  548,  580,  560,  560,  560,  560,
			  560,  560,    0, yy_Dummy>>,
			1, 73, 476)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (75, 127, 159)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (75, 173, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (75, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (75, 8203, 8229)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (75, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (75, 8288, 8657)
			an_array.put (71, 8658)
			an_array.area.fill_with (75, 8659, 8703)
			yy_ec_template_4 (an_array)
			an_array.area.fill_with (75, 8708, 8742)
			yy_ec_template_5 (an_array)
			an_array.area.fill_with (75, 8745, 8890)
			an_array.put (71, 8891)
			an_array.area.fill_with (75, 8892, 10225)
			an_array.area.fill_with (71, 10226, 10227)
			an_array.area.fill_with (75, 10228, 12287)
			yy_ec_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   75,   75,   75,   75,   75,   75,   75,   75,    1,
			    2,    1,    1,    3,   75,   75,   75,   75,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,    1,    4,    5,    6,    7,    8,    6,    9,
			   10,   10,    4,   11,    7,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    7,
			   20,   21,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,
			   40,   41,   42,   43,   44,   45,   46,   47,   48,   49,
			   50,    7,   51,   52,    4,   53,   54,   55,   56,   57,

			   58,   29,   59,   31,   60,   33,   34,   35,   61,   37,
			   62,   39,   40,   63,   64,   65,   66,   67,   68,   47,
			   48,   49,   50,   69,    6,   52,   70, yy_Dummy>>,
			1, 127, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   75,   75,   75,   75,   75,   71,   75,   75,   75,
			   75,   75,   71, yy_Dummy>>,
			1, 13, 160)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   72,   75,   75,   75,   75,   75,   75,   75,   75,    1, yy_Dummy>>,
			1, 10, 8230)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   71,   75,   75,   71, yy_Dummy>>,
			1, 4, 8704)
		end

	yy_ec_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   73,   74, yy_Dummy>>,
			1, 2, 8743)
		end

	yy_ec_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   75,   75, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,   13,    3,   13,    4,    5,    6,
			    6,   13,   13,    7,    5,    8,    8,    8,    8,    4,
			    5,    4,    5,    4,   13,    9,    9,    9,    9,    8,
			    9,   10,   11,   10,   10,   10,   11,   10,   11,   10,
			   10,   11,   11,   11,   11,   11,   11,   10,   10,   10,
			   10,   13,    4,   12,   13,    8,    8,    8,    8,    8,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,    4,
			   13,   13,   13,   13,   13,   13, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 549)
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
			   46,   49,   52,   55,   60,   63,   66,   69,   72,   75,
			   78,   81,   84,   87,   90,   93,   96,   99,  102,  105,
			  108,  111,  114,  117,  119,  123,  127,  129,  131,  133,
			  135,  137,  139,  141,  144,  146,  148,  150,  152,  154,
			  156,  158,  160,  162,  164,  167,  169,  171,  173,  175,
			  176,  176,  176,  176,  177,  177,  178,  180,  180,  182,
			  184,  185,  186,  187,  188,  189,  189,  191,  192,  193,

			  194,  196,  198,  198,  199,  199,  199,  199,  200,  201,
			  202,  203,  204,  206,  207,  208,  209,  210,  211,  212,
			  213,  215,  216,  217,  218,  219,  220,  221,  223,  224,
			  225,  227,  228,  229,  230,  231,  232,  233,  235,  236,
			  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,
			  247,  247,  248,  249,  249,  250,  251,  252,  254,  256,
			  258,  258,  259,  260,  260,  261,  261,  262,  262,  263,
			  263,  264,  264,  264,  264,  266,  266,  268,  268,  269,
			  269,  271,  272,  273,  274,  274,  275,  276,  276,  277,
			  278,  279,  281,  283,  285,  286,  288,  290,  291,  292, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  293,  294,  294,  294,  295,  297,  297,  298,  298,  299,
			  299,  300,  300,  301,  302,  303,  305,  307,  308,  309,
			  310,  311,  312,  313,  314,  315,  316,  317,  318,  320,
			  321,  322,  323,  324,  325,  326,  327,  328,  329,  330,
			  331,  332,  333,  334,  336,  337,  339,  340,  341,  342,
			  343,  344,  345,  346,  347,  348,  349,  350,  351,  352,
			  353,  354,  355,  356,  357,  358,  360,  360,  360,  361,
			  362,  363,  363,  365,  365,  365,  365,  366,  367,  368,
			  368,  370,  371,  371,  371,  371,  373,  374,  375,  376,
			  377,  378,  379,  379,  380,  381,  382,  383,  384,  385,

			  386,  387,  388,  389,  390,  391,  392,  394,  395,  396,
			  397,  398,  399,  400,  402,  403,  404,  405,  406,  407,
			  408,  410,  411,  413,  415,  416,  418,  419,  420,  421,
			  422,  423,  424,  425,  426,  427,  428,  429,  431,  433,
			  434,  435,  436,  437,  439,  441,  441,  441,  443,  443,
			  443,  443,  443,  443,  444,  444,  444,  444,  444,  445,
			  445,  445,  445,  445,  445,  445,  445,  449,  450,  450,
			  451,  452,  453,  454,  455,  455,  457,  459,  460,  461,
			  462,  464,  466,  467,  468,  469,  471,  472,  473,  474,
			  475,  476,  477,  478,  480,  481,  482,  483,  484,  485, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  486,  487,  489,  490,  491,  492,  493,  494,  495,  496,
			  497,  499,  500,  501,  503,  504,  505,  507,  508,  508,
			  508,  508,  508,  509,  510,  511,  511,  511,  511,  511,
			  511,  512,  513,  514,  515,  516,  516,  517,  517,  517,
			  518,  518,  519,  521,  522,  523,  524,  526,  527,  528,
			  529,  530,  532,  534,  535,  537,  538,  539,  541,  542,
			  543,  544,  545,  546,  547,  548,  549,  550,  552,  553,
			  555,  557,  559,  560,  561,  563,  564,  564,  564,  564,
			  564,  564,  564,  564,  564,  564,  564,  564,  564,  564,
			  564,  564,  564,  566,  566,  568,  569,  570,  572,  573,

			  575,  576,  577,  578,  579,  581,  583,  584,  586,  588,
			  589,  590,  591,  592,  593,  595,  596,  597,  599,  599,
			  599,  599,  599,  599,  599,  601,  602,  604,  606,  607,
			  609,  611,  613,  614,  616,  617,  619,  620,  622,  624,
			  624,  624,  624,  626,  627,  629,  631,  633,  635,  635, yy_Dummy>>,
			1, 150, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 634)
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
			  127,  128,    2,  127,  128,    2,   70,   71,  127,  128,
			   69,  127,  128,   69,  127,  128,   69,  127,  128,   69,
			  127,  128,   69,  127,  128,   69,  127,  128,   69,  127,
			  128,   69,  127,  128,   69,  127,  128,   69,  127,  128,
			   69,  127,  128,   69,  127,  128,   69,  127,  128,   69,

			  127,  128,   69,  127,  128,   69,  127,  128,   69,  127,
			  128,   69,  127,  128,   71,  127,  128,  127,  128,    2,
			   71,  127,  128,    2,   71,  127,  128,   98,  128,  102,
			  128,   99,  128,  101,  128,  107,  128,  107,  128,  106,
			  128,  105,  107,  128,  104,  128,  104,  128,  103,  128,
			   82,  128,   82,  128,   81,  128,   87,  128,   87,  128,
			   86,  128,   87,  128,   84,   87,  128,   87,  128,   90,
			  128,   89,  128,   90,  128,   71,    1,   92,   79,   91,
			   92, -208,   70,   71,   70,   70,   70,   70,   78,   77,
			   78,   71,    1,    3,  123,  126,    3,   71,  108,  111, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   69,   69,   69,   69,    8,   69,   69,   69,   69,   69,
			   69,   69,   69,   17,   69,   69,   69,   69,   69,   69,
			   69,   29,   69,   69,   69,   35,   69,   69,   69,   69,
			   69,   69,   69,   43,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,  110,   98,   99,  100,
			  100,   93,   98,  100,   96,  100,   97,  100,  106,  105,
			  103,   81,   86,   84,   85,   86,   83,   84,   89,   88,
			   89,   71,   71,   71,   92,   92, -208,   92,  -80,   70,
			   71,   70,   71,   70,   71,   70,   70,   71,   70,   71,
			   72,   78,   76,    1,  121,  123,  126,  118,  115,  112,

			  109,   69,   69,    6,   69,    7,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   20,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   39,   69,   69,   41,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   62,   69,
			   95,   95,   91,   92, -208,   73,   75,   75,  123,  126,
			  126,  122,  125,  120,  119,  117,  116,  114,  113,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   18,   69,   69,   69,   69,   69,   69,   69, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   27,   69,   69,   69,   69,   69,   69,   69,   36,   69,
			   69,   38,   69,   67,   69,   69,   42,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   54,
			   69,   55,   69,   69,   69,   69,   69,   60,   69,   61,
			   69,   94,   98,   92,   78,  122,  123,  125,  126,  126,
			  118,  115,  112,  124,  126,    4,   69,    5,   69,   69,
			   69,   69,   10,   69,   63,   69,   69,   69,   69,   15,
			   69,   69,   69,   69,   69,   69,   69,   69,   25,   69,
			   69,   69,   69,   69,   69,   69,   69,   37,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   50,   69,   69,

			   69,   53,   69,   69,   69,   58,   69,   69,   95,   95,
			   95,   74,   75,   75,   75,  126,  126,  125,  125,    9,
			   69,   69,   69,   69,   12,   69,   69,   69,   69,   69,
			   19,   69,   21,   69,   69,   23,   69,   69,   69,   28,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   46,   69,   69,   48,   69,   49,   69,   51,   69,   69,
			   69,   57,   69,   69,  125,  126,  125,  126,   69,   69,
			   11,   69,   69,   14,   69,   69,   69,   69,   69,   26,
			   69,   30,   69,   69,   32,   69,   33,   69,   69,   69,
			   69,   69,   69,   47,   69,   69,   69,   59,   69,   64, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   69,   69,   13,   69,   16,   69,   69,   22,   69,   24,
			   69,   31,   69,   69,   40,   69,   69,   45,   69,   69,
			   52,   69,   56,   69,   65,   69,   69,   34,   69,   44,
			   69,   68,   69,   66,   69, yy_Dummy>>,
			1, 35, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1757
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 548
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 549
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 75
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
