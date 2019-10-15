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
			create an_array.make_filled (0, 0, 1863)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			an_array.area.fill_with (545, 1794, 1863)
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
			   59,   58,   58,   59,   58,  544,   60,   74,   75,   60,
			   62,   63,   62,   62,   63,   62,   65,   66,   65,   65,

			   66,   65,   68,   69,   70,  538,   71,   68,   69,   70,
			   77,   71,   74,   75,   80,   80,   80,  543,   78,   77,
			   79,   80,   80,   80,   95,   81,   98,   78,  144,   79,
			   92,   93,   81,   96,   96,   96,   85,   97,   97,   97,
			   97,   99,  135,  100,  100,  100,  100,   96,   96,   96,
			   96,  116,   72,  128,  175,  176,  144,   72,   86,  129,
			   86,  117,   76,  539,  135,   86,   88,  121,   86,  141,
			  149,  122,  218,  150,   89,  118,   90,  119,  106,  137,
			  104,   98,  111,  107,  123,  108,  112,  120,  142,  113,
			  109,  110,  114,  141,  138,  115,  218,  121,  177,  176, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  118,  119,  143,  545,   86,   80,  123,   86,  107,  108,
			  111,  112,  109,  110,  114,  197,  138,  115,  142,  165,
			  166,  139,  167,   86,   76,   99,  124,  100,  100,  100,
			  100,  140,  213,  125,  126,  131,  178,  101,  102,  127,
			  146,  146,  146,  146,  179,  132,  180,  133,  443,  139,
			  214,  134,  444,  140,  149,  124,  310,  150,  126,  103,
			  149,  127,  213,  150,  104,  131,  185,  101,  102,  311,
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
			   80,   80,  545,  401,   94,   76,  191,  203,  203,  217,
			   81,  215,  230,  186,  187,  186,  220,   83,  267,  212, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   84,  268,   97,   97,   97,   97,  170,  201,  201,  201,
			  201,  170,  401,  215,   94,  198,  224,   94,  220,  517,
			  202,  240,  230,   99,  204,  100,  100,  100,  100,  205,
			  205,  205,  149,   94,   94,  150,   85,  182,  224,  199,
			  183,  183,  183,  240,  545,  344,  184,  209,  209,  209,
			  209,  242,  183,  229,  183,  225,  183,  183,  183,  183,
			   85,  183,  104,  183,  221,  241,  206,  183,  222,  183,
			  226,   94,  183,  183,  183,  183,  183,  183,  229,   94,
			  253,  242,  223,  478,  104,  225,  227,  241,  535,  251,
			  228,  243,  226,  252,  221,  233,  291,  222,  255,  234,

			  185,   86,  253,   86,  223,   76,  238,  259,   86,  188,
			  235,   86,  228,  236,  251,  262,  296,  189,  239,  190,
			  255,  243,  295,  256,  534,  233,  291,  234,  257,  259,
			  165,  166,  235,  167,  532,  236,  238,  262,  296,  258,
			  146,  146,  146,  146,  264,  153,  264,   86,  171,  166,
			   86,  167,  295,  256,  146,  146,  146,  146,  160,  161,
			  160,  258,  265,  266,  266,  266,   86,   76,  192,  531,
			  192,  183,   94,  175,  176,  192,  545,  147,  192,  157,
			  158,  157,  165,  172,  192,  173,  159,  162,  163,  162,
			  298,  147,  177,  176,  168,  165,  169,  290,  167,  168, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  171,  169,  530,  167,  171,  172,   94,  173,   94,  485,
			   94,  293,  267,   94,  192,   84,   94,  192,  528,  545,
			  298,  290,   94,  272,  187,  272,  297,  545,  294,  270,
			  271,  271,  271,  192,   94,  192,  545,  192,  302,   94,
			  545,  293,  192,  193,  170,  192,  203,  203,  297,  170,
			  294,  488,   94,  192,  299,   94,  186,  187,  186,  485,
			   83,  419,  419,   84,  274,  275,  275,  275,  302,  300,
			  411,   94,   94,  276,  276,  269,  299,  277,  277,  277,
			  277,  192,  185,  283,  192,  278,  278,  278,  278,  304,
			  185,  300,  201,  201,  201,  201,  284,  284,  545,  411,

			  192,   94,  192,  312,  192,  279,   94,  428,  428,  192,
			  193,  304,  192,  205,  205,  205,  305,  308,  192,  316,
			  281,  281,  199,   85,  282,  282,  282,  282,  312,  280,
			  306,  309,  318,  204,  323,  286,  286,  286,  289,  308,
			  209,  209,  209,  209,  326,  440,  305,  478,  192,  316,
			  285,  192,  511,  309,  327,  501,  330,  328,  332,  334,
			  340,  375,  318,  499,  323,  341,  497,  192,   94,  245,
			  337,  246,  206,  440,  326,  329,  327,  104,  330,  247,
			  366,  366,  248,  334,  249,  250,  398,  328,  332,  341,
			  340,  375,  337,  342,  343,  343,  343,  329,  387,  245, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  246,  372,  495,  247,  248,  384,  249,  250,  192,  492,
			  192,  398,   94,  284,  284,  192,  545,  283,  192,  264,
			  153,  264,  387,  372,  192,  344,  266,  266,  266,  266,
			  350,  187,  350,  545,  267,  384,  471,   84,  277,  277,
			  277,  277,  183,  271,  271,  271,  271,  272,  187,  272,
			  204,  545,  473,  473,  192,  470,  373,  192,  277,  277,
			  277,  277,  378,  348,  355,  275,  275,  275,  275,  282,
			  282,  282,  282,  192,   94,  192,  380,  192,  373,   94,
			  354,  383,  192,  193,  378,  192,  278,  278,  278,  278,
			  367,  367,  367,  192,  447,  360,  185,  269,  380,  361,

			  362,  362,  359,  383,  363,  363,  363,  363,  364,  364,
			  364,  364,  518,  518,  185,  466,  282,  282,  282,  282,
			  464,  192,  447,  199,  192,  463,  386,  285,  286,  286,
			  286,  399,  388,  389,  370,  370,  370,  370,  391,  395,
			  192,   94,  192,  406,  192,  280,   94,  371,  386,  192,
			  193,  397,  192,  365,  388,  389,  399,  400,  192,  402,
			  391,  395,  405,  408,  409,  206,  414,  412,  406,  413,
			  420,  420,  420,  397,  148,  343,  343,  343,  343,  400,
			  462,  402,  439,  442,  405,  441,  409,  460,  192,  412,
			  445,  192,  459,  408,  413,  457,  414,  266,  266,  266, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  266,  422,  423,  423,  423,  442,  439,  192,   94,   86,
			  545,   86,  418,   76,  445,  441,   86,   88,  448,   86,
			  424,  424,  350,  187,  350,   89,  267,   90,  545,   84,
			  446,  527,  545,  452,  348,  429,  429,  429,  425,  425,
			  425,  450,  271,  271,  271,  271,  456,  448,  275,  275,
			  275,  275,  446,  366,  366,   86,  527,  452,   86,  431,
			  431,  431,  431,  432,  432,  451,  453,  433,  433,  433,
			  433,  450,  455,  185,   86,   76,   86,  458,   86,  354,
			   76,  454,  472,   86,   77,  359,   86,  451,  453,  269,
			  283,  185,   89,  469,   90,  185,  360,  363,  363,  363,

			  363,  363,  363,  363,  363,  454,  472,  458,  449,  503,
			  461,  364,  364,  364,  364,  436,  436,  436,  436,  367,
			  367,  367,   86,  469,  435,   86,  370,  370,  370,  370,
			  437,  437,  461,  503,  438,  438,  438,  438,  434,  435,
			  465,   86,   76,  344,  266,  266,  266,  266,  280,  467,
			  468,  287,  365,  427,  345,  346,  285,  474,  474,  474,
			  493,  410,  465,  280,  343,  343,  343,  343,  519,  519,
			  519,  467,  468,  344,  419,  419,  347,  344,  420,  420,
			  420,  348,  493,  545,  345,  346,  545,  182,  423,  423,
			  423,  423,  183,  424,  424,  183,  271,  271,  271,  271, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  355,  418,  355,  428,  428,  494,  351,  352,  545,  496,
			  502,  476,  504,  505,  540,  477,  407,  183,  425,  425,
			  425,  355,  429,  429,  429,  482,  498,  494,  353,  404,
			  483,  496,  502,  354,  504,  505,  351,  352,  488,  540,
			  486,  431,  431,  431,  431,  403,  185,  500,  396,  185,
			  355,  275,  275,  275,  275,  484,  498,  421,  421,  487,
			  506,  356,  357,  433,  433,  433,  433,  438,  438,  438,
			  438,  185,  433,  433,  433,  433,  507,  500,  360,  489,
			  489,  489,  489,  358,  436,  436,  436,  436,  359,  394,
			  506,  356,  357,  148,  343,  343,  343,  343,  507,  509,

			  438,  438,  438,  438,  415,  416,  490,  490,  508,  360,
			  491,  491,  491,  491,  510,  148,  434,  512,  513,  514,
			  521,  365,  524,  509,  419,  419,  417,  148,  473,  473,
			  508,  418,  522,  525,  415,  416,  545,  365,  510,  512,
			  523,  514,  513,  420,  420,  420,  426,  426,  426,  426,
			  521,  529,  524,  517,  522,  426,  426,  426,  426,  426,
			  426,  476,  393,  525,  523,  515,  545,  148,  474,  474,
			  474,  423,  423,  423,  423,  529,  424,  424,  428,  428,
			  477,  545,  429,  429,  429,  426,  426,  426,  426,  426,
			  392,  425,  425,  425,  489,  489,  489,  489,  390,  185, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  182,  423,  423,  423,  423,  516,  526,  533,  482,  473,
			  473,  479,  480,  483,  182,  486,  474,  474,  474,  487,
			  491,  491,  491,  491,  491,  491,  491,  491,  484,  185,
			  385,  434,  382,  481,  518,  518,  526,  533,  482,  381,
			  541,  479,  480,  542,  185,  379,  515,  182,  518,  518,
			  430,  430,  538,  516,  182,  519,  519,  519,  519,  519,
			  519,  434,  541,  475,  475,  542,  105,  105,  105,  105,
			  105,  536,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,  207,  207,  377,  536,  207,  288,  288,  368,
			  368,  288,  537,  368,  376,  537,   53,   53,   53,   53,

			   53,   53,   53,   53,   53,   53,   53,   53,   53,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   82,  374,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   91,  208,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  148,  287,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  170,  170,  170,  170,
			  170,  170,  170,  170,  170,  170,  170,  170,  170,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  181,  349,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  195,  339,  195,  195,  520,
			  520,  195,  338,  195,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,  200,  200,  200,
			  200,  200,  200,  336,  200,  200,  200,  200,  200,  200,

			  148,  335,  148,  148,  333,  331,  148,  325,  148,  182,
			  324,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  183,  322,  183,  183,  183,  183,  183,  183,
			  183,  183,  183,  183,  183,  182,  321,  182,  182,  320,
			  319,  182,  317,  182,  369,  369,  369,  369,  369,  369,
			  315,  369,  369,  369,  369,  369,  369,  314,  313,  307,
			  303,  301,  292,  208,  287,  273,  545,  545,  263,  261,
			  260,  254,  244,  237,  232,  231,  219,  216,  210,  208,
			  194,  196,  194,   95,  545,  545,   98,  145,  136,  130,
			   96,   96,  545,   15, yy_Dummy>>,
			1, 194, 1600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1863)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 70)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (56, 278, 347)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			an_array.area.fill_with (545, 1793, 1863)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    4,   20,    3,    4,   20,    3,    4,    5,    5,
			    5,    6,    6,    6,  540,    5,   13,   13,    6,    7,
			    7,    7,    8,    8,    8,    9,    9,    9,   10,   10,
			   10,   11,   11,   11,  538,   11,   12,   12,   12,   16,
			   12,   14,   14,   17,   17,   17,  533,   16,   19,   16,
			   18,   18,   18,   24,   17,   26,   19,   49,   19,   23,
			   23,   18,   26,   24,   25,   20,   25,   25,   25,   25,
			   28,   43,   28,   28,   28,   28,   30,   30,   31,   31,
			   36,   11,   40,   73,   73,   49,   12,   21,   40,   21,
			   36,   21,  522,   43,   21,   21,   38,   21,   47,   53,

			   38,  113,   53,   21,   37,   21,   37,   33,   45,   28,
			   26,   35,   33,   38,   33,   35,   37,   48,   35,   33,
			   33,   35,   47,   45,   35,  113,   38,   75,   75,   37,
			   37,   48,  181,   21,   95,   38,   21,   33,   33,   35,
			   35,   33,   33,   35,   95,   45,   35,   48,   67,   67,
			   46,   67,   21,   21,   27,   39,   27,   27,   27,   27,
			   46,  108,   39,   39,   42,   76,   27,   27,   39,   52,
			   52,   52,   52,   76,   42,   76,   42,  380,   46,  109,
			   42,  380,   46,  148,   39,  231,  148,   39,   27,  154,
			   39,  108,  154,   27,   42,  181,   27,   27,  231,   42, yy_Dummy>>,
			1, 200, 71)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   42,  109,   42,   62,   62,   62,   52, yy_Dummy>>,
			1, 7, 271)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   58,   58,   58,   65,   65,   65,  197,   58,   68,   68,
			   68,  112,   68,   70,   70,   70,  197,   70,   72,   72,
			   77,   72,   77,  107,   77,   82,  107,   77,   82,  552,
			   77,   80,   80,   80,   87,  324,   77,  552,   87,  101,
			  101,  112,   80,  110,  122,   85,   85,   85,  115,   85,
			  182,  107,   85,  182,   97,   97,   97,   97,   68,   99,
			   99,   99,   99,   70,  324,  110,   77,   97,  118,   77,
			  115,  517,   99,  130,  122,  100,  101,  100,  100,  100,
			  100,  102,  102,  102,  344,   77,   77,  344,   82,   84,
			  118,   97,   84,   84,   84,  130,   87,  421,   84,  104,

			  104,  104,  104,  132,   84,  121,   84,  119,   84,   84,
			   84,   84,   85,   84,  100,   84,  116,  131,  102,   84,
			  116,   84,  119,  556,   84,   84,   84,   84,   84,   84,
			  121,  556,  138,  132,  116,  421,  104,  119,  120,  131,
			  513,  137,  120,  133,  119,  137,  116,  126,  211,  116,
			  140,  126,   84,   86,  138,   86,  116,   86,  129,  142,
			   86,   86,  126,   86,  120,  126,  137,  145,  217,   86,
			  129,   86,  140,  133,  216,  141,  512,  126,  211,  126,
			  141,  142,  164,  164,  126,  164,  509,  126,  129,  145,
			  217,  141,  146,  146,  146,  146,  152,  152,  152,   86, yy_Dummy>>,
			1, 200, 348)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  166,  166,   86,  166,  216,  141,  147,  147,  147,  147,
			  160,  160,  160,  141,  155,  155,  155,  155,   86,   86,
			   88,  508,   88,  426,   88,  174,  174,   88,   88,  146,
			   88,  157,  157,  157,  170,  170,   88,  170,  157,  162,
			  162,  162,  219,  147,  176,  176,  168,  168,  168,  210,
			  168,  169,  169,  169,  507,  169,  172,  172,  178,  172,
			  178,  426,  178,  215,  183,  178,   88,  183,  178,   88,
			  503,  184,  219,  210,  178,  185,  185,  185,  218,  185,
			  215,  184,  184,  184,  184,   88,   88,   89,  191,   89,
			  223,   89,  191,  215,   89,   89,  168,   89,  203,  203,

			  218,  169,  215,  488,  178,   89,  220,  178,  186,  186,
			  186,  485,  186,  345,  345,  186,  196,  196,  196,  196,
			  223,  221,  336,  178,  178,  198,  198,  183,  220,  198,
			  198,  198,  198,   89,  184,  203,   89,  199,  199,  199,
			  199,  226,  185,  221,  201,  201,  201,  201,  204,  204,
			  191,  336,   89,   89,   90,  232,   90,  201,   90,  356,
			  356,   90,   90,  226,   90,  205,  205,  205,  227,  229,
			   90,  236,  202,  202,  199,  186,  202,  202,  202,  202,
			  232,  201,  227,  230,  238,  204,  244,  206,  206,  206,
			  209,  229,  209,  209,  209,  209,  247,  375,  227,  478, yy_Dummy>>,
			1, 200, 548)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   90,  236,  205,   90,  465,  230,  248,  453,  250,  249,
			  252,  254,  260,  293,  238,  450,  244,  261,  446,   90,
			   90,  136,  257,  136,  206,  375,  247,  249,  248,  209,
			  250,  136,  283,  283,  136,  254,  136,  136,  318,  249,
			  252,  261,  260,  293,  257,  263,  263,  263,  263,  249,
			  305,  136,  136,  290,  444,  136,  136,  302,  136,  136,
			  188,  440,  188,  318,  188,  284,  284,  188,  188,  283,
			  188,  264,  264,  264,  305,  290,  188,  266,  266,  266,
			  266,  266,  269,  269,  269,  271,  269,  302,  412,  269,
			  276,  276,  276,  276,  271,  271,  271,  271,  271,  272,

			  272,  272,  284,  272,  415,  415,  188,  411,  291,  188,
			  277,  277,  277,  277,  296,  266,  275,  275,  275,  275,
			  275,  281,  281,  281,  281,  188,  188,  189,  298,  189,
			  291,  189,  271,  301,  189,  189,  296,  189,  278,  278,
			  278,  278,  285,  285,  285,  189,  384,  277,  271,  269,
			  298,  278,  279,  279,  275,  301,  279,  279,  279,  279,
			  280,  280,  280,  280,  479,  479,  272,  405,  282,  282,
			  282,  282,  403,  189,  384,  278,  189,  402,  304,  285,
			  286,  286,  286,  321,  306,  307,  289,  289,  289,  289,
			  309,  314,  189,  189,  190,  329,  190,  280,  190,  289, yy_Dummy>>,
			1, 200, 748)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  304,  190,  190,  316,  190,  282,  306,  307,  321,  323,
			  190,  325,  309,  314,  328,  331,  332,  286,  339,  337,
			  329,  338,  346,  346,  346,  316,  343,  343,  343,  343,
			  343,  323,  401,  325,  374,  379,  328,  376,  332,  399,
			  190,  337,  381,  190,  397,  331,  338,  395,  339,  348,
			  348,  348,  348,  349,  349,  349,  349,  379,  374,  190,
			  190,  192,  351,  192,  343,  192,  381,  376,  192,  192,
			  385,  192,  351,  351,  350,  350,  350,  192,  350,  192,
			  352,  350,  383,  500,  354,  389,  348,  357,  357,  357,
			  352,  352,  352,  387,  354,  354,  354,  354,  394,  385,

			  359,  359,  359,  359,  383,  366,  366,  192,  500,  389,
			  192,  360,  360,  360,  360,  361,  361,  388,  391,  361,
			  361,  361,  361,  387,  393,  351,  192,  192,  193,  396,
			  193,  354,  193,  392,  414,  193,  193,  359,  193,  388,
			  391,  350,  366,  352,  193,  409,  193,  354,  360,  362,
			  362,  362,  362,  363,  363,  363,  363,  392,  414,  396,
			  386,  456,  400,  364,  364,  364,  364,  365,  365,  365,
			  365,  367,  367,  367,  193,  409,  364,  193,  370,  370,
			  370,  370,  371,  371,  400,  456,  371,  371,  371,  371,
			  363,  370,  404,  193,  193,  265,  265,  265,  265,  265, yy_Dummy>>,
			1, 200, 948)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  364,  406,  408,  368,  365,  355,  265,  265,  367,  416,
			  416,  416,  441,  333,  404,  370,  418,  418,  418,  418,
			  480,  480,  480,  406,  408,  419,  419,  419,  265,  420,
			  420,  420,  420,  265,  441,  424,  265,  265,  270,  423,
			  423,  423,  423,  423,  424,  424,  424,  270,  270,  270,
			  270,  270,  430,  418,  428,  428,  428,  442,  270,  270,
			  425,  445,  455,  419,  457,  458,  525,  420,  330,  425,
			  425,  425,  425,  429,  429,  429,  429,  423,  447,  442,
			  270,  327,  424,  445,  455,  270,  457,  458,  270,  270,
			  430,  525,  428,  431,  431,  431,  431,  326,  424,  452,

			  315,  270,  274,  274,  274,  274,  274,  425,  447,  574,
			  574,  429,  459,  274,  274,  432,  432,  432,  432,  437,
			  437,  437,  437,  425,  433,  433,  433,  433,  460,  452,
			  431,  434,  434,  434,  434,  274,  436,  436,  436,  436,
			  274,  313,  459,  274,  274,  342,  342,  342,  342,  342,
			  460,  462,  438,  438,  438,  438,  342,  342,  435,  435,
			  461,  433,  435,  435,  435,  435,  463,  475,  434,  469,
			  470,  472,  492,  436,  497,  462,  476,  476,  342,  473,
			  473,  473,  461,  342,  493,  498,  342,  342,  353,  438,
			  463,  469,  495,  472,  470,  477,  477,  477,  353,  353, yy_Dummy>>,
			1, 200, 1148)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  353,  353,  492,  506,  497,  475,  493,  353,  353,  353,
			  353,  353,  353,  476,  312,  498,  495,  473,  483,  474,
			  474,  474,  474,  482,  482,  482,  482,  506,  483,  483,
			  486,  486,  477,  484,  487,  487,  487,  353,  353,  353,
			  353,  353,  311,  484,  484,  484,  489,  489,  489,  489,
			  308,  353,  422,  422,  422,  422,  422,  474,  499,  510,
			  482,  515,  515,  422,  422,  483,  520,  486,  516,  516,
			  516,  487,  490,  490,  490,  490,  491,  491,  491,  491,
			  484,  483,  303,  489,  300,  422,  536,  536,  499,  510,
			  422,  299,  529,  422,  422,  531,  484,  297,  515,  518,

			  518,  518,  575,  575,  520,  516,  519,  519,  519,  519,
			  537,  537,  537,  491,  529,  576,  576,  531,  557,  557,
			  557,  557,  557,  536,  554,  554,  554,  554,  554,  554,
			  554,  554,  554,  554,  566,  566,  295,  518,  566,  570,
			  570,  572,  572,  570,  519,  572,  294,  537,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  547,  547,  547,  547,  547,  547,  547,  547,  547,
			  547,  547,  547,  547,  548,  548,  548,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  548,  549,  549,  549,
			  549,  549,  549,  549,  549,  549,  549,  549,  549,  549, yy_Dummy>>,
			1, 200, 1348)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  550,  550,  550,  550,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  553,  292,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  553,  555,
			  288,  555,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  555,  558,  287,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  558,  558,  559,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  560,  561,  561,  561,  561,  561,  561,  561,  561,  561,

			  561,  561,  561,  561,  562,  268,  562,  562,  562,  562,
			  562,  562,  562,  562,  562,  562,  562,  563,  259,  563,
			  563,  577,  577,  563,  258,  563,  564,  564,  564,  564,
			  564,  564,  564,  564,  564,  564,  564,  564,  564,  565,
			  565,  565,  565,  565,  565,  256,  565,  565,  565,  565,
			  565,  565,  567,  255,  567,  567,  253,  251,  567,  246,
			  567,  568,  245,  568,  568,  568,  568,  568,  568,  568,
			  568,  568,  568,  568,  569,  243,  569,  569,  569,  569,
			  569,  569,  569,  569,  569,  569,  569,  571,  241,  571,
			  571,  240,  239,  571,  237,  571,  573,  573,  573,  573, yy_Dummy>>,
			1, 200, 1548)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  573,  573,  235,  573,  573,  573,  573,  573,  573,  234,
			  233,  228,  224,  222,  214,  208,  207,  195,  180,  179,
			  150,  144,  143,  139,  135,  128,  125,  123,  114,  111,
			  106,  103,   93,   92,   91,   81,   79,   78,   51,   50,
			   44,   41,   32,   29,   15, yy_Dummy>>,
			1, 45, 1748)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 577)
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
			   98,  101,  106,   85,  110, 1792,   98,  113,  120,  107,
			   68,  154, 1793,  122,  112,  122,  112,  212,  128, 1770,
			  127,  128, 1769,  148,    0,  151,  123,  140,  143,  197,
			  121, 1751,  210,  101, 1760,  151,  190,  132,  164,   97,
			 1749, 1736,  225,  165, 1793, 1793,  277, 1793,  347, 1793,
			 1793, 1793,  273, 1793, 1793,  350, 1793,  217,  355, 1793,
			  360, 1793,  364,  152, 1793,  196,  224,  364, 1765, 1762,
			  378, 1771,  368, 1793,  432,  392,  497,  374,  564,  631,
			  698, 1773, 1767, 1771,    0,  203, 1793,  387,    0,  392,

			  410,  372,  414, 1727,  432,    0, 1750,  339,  205,  208,
			  348, 1749,  335,  135, 1748,  355,  439,    0,  374,  428,
			  447,  418,  368, 1737,    0, 1735,  468,    0, 1739,  480,
			  378,  423,  424,  465,    0, 1744,  742,  454,  439, 1743,
			  454,  496,  466, 1738, 1741,  474,  525,  539,  249, 1793,
			 1754, 1793,  543, 1793,  255,  547, 1793,  578, 1793, 1793,
			  557, 1793,  586, 1793,  528, 1793,  546, 1793,  593,  598,
			  580, 1793,  602, 1793,  571, 1793,  590, 1793,  602, 1747,
			 1744,  198,  393,  607,  614,  622,  655, 1793,  804,  871,
			  938,  628, 1005, 1072, 1793, 1756,  649,  352,  662,  670, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1793,  677,  709,  631,  681,  698,  720, 1712, 1711,  725,
			  560,  472,    0,    0, 1730,  587,  496,  474,  581,  566,
			  613,  625, 1733,  614, 1732,    0,  645,  692, 1731,  675,
			  688,  220,  668, 1730, 1729, 1711,  695, 1714,  708, 1701,
			 1711, 1698,    0, 1695,  708, 1682, 1679,  720,  710,  731,
			  715, 1677,  734, 1672,  722, 1673, 1665,  730, 1640, 1634,
			  733,  728,    0,  778,  818, 1129,  811, 1793, 1639,  829,
			 1181,  828,  846, 1793, 1236,  850,  823,  843,  871,  889,
			  893,  854,  901,  765,  798,  875,  913, 1549, 1536,  919,
			  758,  814, 1545,  735, 1462, 1450,  820, 1417,  833, 1411,

			 1402,  840,  779, 1398,  885,  761,  891,  892, 1370,  894,
			    0, 1362, 1330, 1242,  898, 1220,  910,    0,  751,    0,
			    0,  896,    0,  913,  354,  918, 1209, 1197,  918,  908,
			 1168,  937,  923, 1122,    0,    0,  641,  923,  934,  942,
			    0,    0, 1279,  960,  427,  646,  955,    0,  982,  986,
			 1021, 1005, 1023, 1331, 1027, 1144,  692, 1020,    0, 1033,
			 1044, 1052, 1082, 1086, 1096, 1100, 1038, 1104, 1099, 1793,
			 1111, 1119,    0,    0,  945,  714,  960,    0,    0,  942,
			  220,  953,    0,  989,  863,  989, 1080, 1014, 1022,  996,
			    0, 1025, 1044, 1044, 1014,  963, 1051,  960,    0,  959, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1069,  948,  897,  892, 1099,  887, 1106,    0, 1107, 1069,
			    0,  823,  808,    0, 1045,  837, 1142,    0, 1149, 1159,
			 1163,  431, 1386, 1173, 1178, 1203,  557, 1793, 1188, 1207,
			 1186, 1226, 1248, 1257, 1264, 1295, 1269, 1252, 1285,    0,
			  781, 1116, 1162,    0,  764, 1166,  738, 1202,    0,    0,
			  735,    0, 1223,  727,    0, 1168, 1072, 1169, 1170, 1236,
			 1233, 1266, 1262, 1277,    0,  724,    0,    0,    0, 1274,
			 1281,    0, 1276, 1313, 1353, 1301, 1309, 1328,  695,  897,
			 1153,    0, 1356, 1361, 1376,  607, 1363, 1367,  599, 1379,
			 1405, 1409, 1293, 1289,    0, 1303,    0, 1295, 1308, 1379,

			  996,    0,    0,  588,    0,    0, 1314,  574,  531,  506,
			 1381,    0,  496,  460,    0, 1394, 1401,  367, 1433, 1440,
			 1400,    0,  135,    0,    0, 1179,    0,    0,    0, 1397,
			    0, 1402,    0,   89,    0,    0, 1419, 1443,   53,    0,
			   57,    0,    0,    0,    0, 1793, 1495, 1508, 1521, 1534,
			 1547, 1560,  372, 1573, 1468, 1586,  466, 1458, 1599, 1612,
			 1625, 1638, 1651, 1662, 1673, 1686, 1474, 1697, 1708, 1721,
			 1479, 1732, 1481, 1743, 1249, 1442, 1455, 1661, yy_Dummy>>,
			1, 178, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 577)
			yy_def_template_1 (an_array)
			an_array.area.fill_with (557, 105, 145)
			yy_def_template_2 (an_array)
			an_array.area.fill_with (557, 210, 262)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (557, 290, 341)
			yy_def_template_4 (an_array)
			an_array.area.fill_with (557, 372, 414)
			yy_def_template_5 (an_array)
			an_array.area.fill_with (557, 439, 472)
			yy_def_template_6 (an_array)
			an_array.area.fill_with (545, 546, 577)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  545,    1,  546,  546,  547,  547,  548,  548,  549,
			  549,  550,  550,  551,  551,  545,  552,  545,  545,  552,
			  553,  554,  545,  555,  556,  545,   19,  545,  545,  545,
			  556,  556,  545,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,   19,  545,  558,  545,  545,  545,  545,  545,  545,
			  545,  545,  545,  545,  545,  545,  545,  559,  559,  545,
			  559,  545,  560,  561,  545,  561,   19,  545,  556,  556,
			  545,  545,  553,  545,  562,  553,  554,  554,  554,  554,
			  554,  545,  563,  545,   19,  564,  545,  545,   76,  565,

			  545,  545,  545,  566,  545, yy_Dummy>>,
			1, 105, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  545,  545,  558,  545,  567,  545,  545,  545,  558,  545,
			  545,  545,  545,  545,  545,  545,  545,  545,  559,  545,
			  559,  545,  559,  559,  560,  545,  560,  545,  561,  545,
			  561,  545,  545,  556,  556,  562,  568,  569,  562,  562,
			  553,  545,  554,  554,  554,  554,  554,  554,  545,  545,
			  545,  564,  545,  545,  545,  545,  545,  545,  545,  545,
			  545,  566,  570,  545, yy_Dummy>>,
			1, 64, 146)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  545,  545,  545,  545,  545,  571,  569,  562,  562,  562,
			  545,  545,  545,  545,  545,  545,  545,  545,  545,  545,
			  545,  545,  545,  545,  572,  570,  573, yy_Dummy>>,
			1, 27, 263)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  545,  545,  558,  545,  545,  574,  545,  545,  569,  562,
			  562,  562,  562,  545,  545,  545,  575,  545,  545,  545,
			  545,  545,  545,  545,  545,  545,  572,  545,  545,  545, yy_Dummy>>,
			1, 30, 342)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  545,  545,  576,  545,  545,  545,  574,  545,  545,  562,
			  562,  353,  545,  545,  545,  575,  545,  545,  545,  545,
			  545,  545,  545,  545, yy_Dummy>>,
			1, 24, 415)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  545,  545,  576,  545,  545,  574,  545,  545,  577,  545,
			  562,  562,  353,  545,  545,  575,  545,  545,  545,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  545,  545,  576,  545,  545,  577,  557,  557,
			  557,  557,  557,  557,  557,  557,  557,  557,  557,  557,
			  557,  557,  557,  545,  545,  577,  557,  557,  557,  557,
			  557,  557,    0, yy_Dummy>>,
			1, 73, 473)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (70, 127, 159)
			an_array.put (1, 160)
			an_array.area.fill_with (70, 161, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (70, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (70, 8203, 8238)
			an_array.put (1, 8239)
			an_array.area.fill_with (70, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (70, 8288, 12287)
			yy_ec_template_2 (an_array)
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
			   47,   48,   49,   68,    6,   51,   69, yy_Dummy>>,
			1, 127, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
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
			create an_array.make_filled (0, 0, 546)
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
			  321,  323,  324,  326,  327,  328,  329,  330,  331,  332,
			  333,  334,  335,  336,  337,  338,  339,  340,  341,  342,
			  343,  344,  345,  347,  347,  347,  348,  349,  350,  350,
			  352,  352,  352,  352,  353,  354,  355,  355,  357,  358,
			  358,  358,  358,  360,  361,  362,  363,  364,  365,  366,
			  366,  367,  368,  369,  370,  371,  372,  373,  374,  375,

			  376,  377,  378,  379,  381,  382,  383,  384,  385,  386,
			  387,  389,  390,  391,  392,  393,  394,  395,  397,  398,
			  400,  402,  403,  405,  406,  407,  408,  409,  410,  411,
			  412,  413,  414,  415,  416,  418,  420,  421,  422,  423,
			  424,  426,  428,  428,  428,  430,  430,  430,  430,  430,
			  430,  431,  431,  431,  431,  431,  432,  432,  432,  432,
			  432,  432,  432,  432,  436,  437,  437,  438,  439,  440,
			  441,  442,  442,  444,  446,  447,  448,  449,  451,  453,
			  454,  455,  456,  458,  459,  460,  461,  462,  463,  464,
			  465,  467,  468,  469,  470,  471,  472,  473,  474,  476, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  477,  478,  479,  480,  481,  482,  483,  484,  486,  487,
			  488,  490,  491,  492,  494,  495,  495,  495,  495,  495,
			  496,  497,  498,  498,  498,  498,  498,  498,  499,  500,
			  501,  502,  503,  503,  504,  504,  504,  505,  505,  506,
			  508,  509,  510,  511,  513,  514,  515,  516,  517,  519,
			  521,  522,  524,  525,  526,  528,  529,  530,  531,  532,
			  533,  534,  535,  536,  537,  539,  540,  542,  544,  546,
			  547,  548,  550,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  553,  553,  555,  556,  557,  559,  560,  562,  563,  564,

			  565,  566,  568,  570,  571,  573,  575,  576,  577,  578,
			  579,  580,  582,  583,  584,  586,  586,  586,  586,  586,
			  586,  586,  588,  589,  591,  593,  594,  596,  598,  600,
			  601,  603,  604,  606,  607,  609,  611,  611,  611,  611,
			  613,  614,  616,  618,  620,  622,  622, yy_Dummy>>,
			1, 147, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 621)
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
			  127,  128,  127,  128,   98,  128,  102,  128,   99,  128,
			  101,  128,  107,  128,  107,  128,  106,  128,  105,  107,
			  128,  104,  128,  104,  128,  103,  128,   82,  128,   82,
			  128,   81,  128,   87,  128,   87,  128,   86,  128,   87,
			  128,   84,   87,  128,   87,  128,   90,  128,   89,  128,
			   90,  128,   71,    1,   92,   79,   91,   92, -208,   70,
			   71,   70,   70,   70,   70,   78,   77,   78,   71,    1,
			    3,  123,  126,    3,   71,  108,  111,   69,   69,   69,
			   69,    8,   69,   69,   69,   69,   69,   69,   69,   69, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   17,   69,   69,   69,   69,   69,   69,   69,   29,   69,
			   69,   69,   35,   69,   69,   69,   69,   69,   69,   69,
			   43,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,  110,   98,   99,  100,  100,   93,   98,
			  100,   96,  100,   97,  100,  106,  105,  103,   81,   86,
			   84,   85,   86,   83,   84,   89,   88,   89,   71,   71,
			   71,   92,   92, -208,   92,  -80,   70,   71,   70,   71,
			   70,   71,   70,   70,   71,   70,   71,   72,   78,   76,
			    1,  121,  123,  126,  118,  115,  112,  109,   69,   69,
			    6,   69,    7,   69,   69,   69,   69,   69,   69,   69,

			   69,   69,   69,   69,   69,   20,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   39,   69,   69,   41,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   62,   69,   95,   95,   91,
			   92, -208,   73,   75,   75,  123,  126,  126,  122,  125,
			  120,  119,  117,  116,  114,  113,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   18,
			   69,   69,   69,   69,   69,   69,   69,   27,   69,   69,
			   69,   69,   69,   69,   69,   36,   69,   69,   38,   69, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   67,   69,   69,   42,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   54,   69,   55,   69,
			   69,   69,   69,   69,   60,   69,   61,   69,   94,   98,
			   92,   78,  122,  123,  125,  126,  126,  118,  115,  112,
			  124,  126,    4,   69,    5,   69,   69,   69,   69,   10,
			   69,   63,   69,   69,   69,   69,   15,   69,   69,   69,
			   69,   69,   69,   69,   69,   25,   69,   69,   69,   69,
			   69,   69,   69,   69,   37,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   50,   69,   69,   69,   53,   69,
			   69,   69,   58,   69,   69,   95,   95,   95,   74,   75,

			   75,   75,  126,  126,  125,  125,    9,   69,   69,   69,
			   69,   12,   69,   69,   69,   69,   69,   19,   69,   21,
			   69,   69,   23,   69,   69,   69,   28,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   46,   69,   69,
			   48,   69,   49,   69,   51,   69,   69,   69,   57,   69,
			   69,  125,  126,  125,  126,   69,   69,   11,   69,   69,
			   14,   69,   69,   69,   69,   69,   26,   69,   30,   69,
			   69,   32,   69,   33,   69,   69,   69,   69,   69,   69,
			   47,   69,   69,   69,   59,   69,   64,   69,   69,   13,
			   69,   16,   69,   69,   22,   69,   24,   69,   31,   69, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   69,   40,   69,   69,   45,   69,   69,   52,   69,   56,
			   69,   65,   69,   69,   34,   69,   44,   69,   68,   69,
			   66,   69, yy_Dummy>>,
			1, 22, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1793
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 545
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 546
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
