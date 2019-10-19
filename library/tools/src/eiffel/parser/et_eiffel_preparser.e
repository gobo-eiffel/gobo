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
			create an_array.make_filled (0, 0, 1866)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			an_array.area.fill_with (545, 1796, 1866)
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
			   22,   16,   54,   54,   83,   55,   55,   84,   56,   56,
			   58,   59,   58,   58,   59,   58,  544,   60,   74,   75,
			   60,   62,   63,   62,   62,   63,   62,   65,   66,   65,

			   65,   66,   65,   68,   69,   70,  538,   71,   68,   69,
			   70,   77,   71,   74,   75,   80,   80,   80,  543,   78,
			   77,   79,   80,   80,   80,   95,   81,   98,   78,  144,
			   79,   92,   93,   81,   96,   96,   96,   85,   97,   97,
			   97,   97,   99,  135,  100,  100,  100,  100,   96,   96,
			   96,   96,  116,   72,  128,  175,  176,  144,   72,   86,
			  129,   86,  117,   76,  539,  135,   86,   88,  121,   86,
			  141,  149,  122,  218,  150,   89,  118,   90,  119,  106,
			  137,  104,   98,  111,  107,  123,  108,  112,  120,  142,
			  113,  109,  110,  114,  141,  138,  115,  218,  121,  177, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  176,  118,  119,  143,  517,   86,  139,  123,   86,  107,
			  108,  111,  112,  109,  110,  114,  140,  138,  115,  142,
			  160,  161,  160,   80,   86,  535,   76,   99,  124,  100,
			  100,  100,  100,  197,  139,  125,  126,  131,  140,  101,
			  102,  127,  146,  146,  146,  146,  213,  132,  217,  133,
			  162,  163,  162,  134,  178,  165,  166,  124,  167,  534,
			  126,  103,  179,  127,  180,  149,  104,  131,  150,  101,
			  102,  149,  132,  133,  150,  134,  213,  532,  217,  147,
			  152,  153,  152,  151,  154,  151,  151,  154,  154,  154,
			  151,  151,  151,  155,  151,  151,  151,  151,  151,  154,

			  151,  154,  151,  154,  154,  154,  154,  151,  154,  151,
			  154,  151,  151,  151,  154,  151,  154,  151,  151,  154,
			  154,  154,  154,  154,  154,  151,  151,  151,  151,  151,
			  151,  151,  151,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  151,  151,  151,
			  151,  157,  158,  157,  214,  168,  165,  169,  159,  167,
			  168,  171,  169,  531,  167,  165,  172,   94,  173,   94,
			   83,   94,  267,   84,   94,  268,  214,   94,   80,   80,
			   80,  203,  203,   94,  186,  187,  186,  215,   83,   81,
			  545,   84,  220,  224,  191,  201,  201,  201,  201,   97, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   97,   97,   97,  211,  229,  170,  212,   80,  202,  215,
			  170,  530,  198,   94,  220,  224,   94,  197,  204,   99,
			  240,  100,  100,  100,  100,  205,  205,  205,  528,  229,
			  310,  212,   94,   85,   94,  182,  199,  227,  183,  183,
			  183,  228,  240,  311,  184,  209,  209,  209,  209,  230,
			  183,   85,  183,  545,  183,  183,  183,  183,  104,  183,
			  221,  183,  206,  228,  222,  183,  241,  183,  175,  176,
			  183,  183,  183,  183,  183,  183,  177,  176,  223,  230,
			  238,  225,  104,  242,  243,  344,  149,  251,  241,  150,
			  221,  252,  239,  222,  253,  291,  226,  488,  185,   86,

			  223,   86,  255,   76,  233,  259,   86,  188,  234,   86,
			  238,  225,  251,  242,  243,  189,  253,  190,  226,  235,
			  262,  256,  236,  478,  255,  291,  257,  259,  146,  146,
			  146,  146,  165,  166,  233,  167,  234,  258,  264,  153,
			  264,  235,  262,  545,  236,   86,  171,  166,   86,  167,
			  485,  256,  146,  146,  146,  146,  160,  161,  160,  258,
			  265,  266,  266,  266,   86,  147,   76,  192,  545,  192,
			  267,   94,  545,   84,  192,  545,  478,  192,  157,  158,
			  157,  165,  172,  192,  173,  159,  162,  163,  162,  147,
			  168,  165,  169,  290,  167,  440,  168,  171,  169,  295, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  167,  171,  172,  312,  173,   94,  185,   94,  296,   94,
			  203,  203,   94,  192,  545,   94,  192,  290,  272,  187,
			  272,   94,  545,  440,  270,  271,  271,  271,  312,  295,
			  296,  545,  192,  269,   94,  192,  511,  192,  501,   94,
			  170,  298,  192,  193,  302,  192,  170,  283,  186,  187,
			  186,   94,   83,  192,   94,   84,  274,  275,  275,  275,
			  276,  276,  284,  284,  277,  277,  277,  277,  297,  443,
			   94,  298,   94,  444,  302,   76,  299,  185,  499,  300,
			  497,  192,  334,   76,  192,  185,  278,  278,  278,  278,
			  297,  201,  201,  201,  201,  205,  205,  205,  299,  204,

			  192,  300,   94,  192,  279,  192,  334,   94,  304,  316,
			  192,  193,  293,  192,  495,   85,  286,  286,  286,  192,
			  281,  281,  308,  199,  282,  282,  282,  282,  280,  294,
			  304,  305,  285,  289,  309,  209,  209,  209,  209,  316,
			  327,  330,  293,  337,  308,  306,  318,  323,  326,  192,
			  332,  294,  192,  206,  183,  340,  309,  372,  492,  341,
			  471,  305,  327,  330,  328,  337,  366,  366,  192,  355,
			   94,  245,  104,  246,  284,  284,  318,  323,  326,  372,
			  332,  247,  329,  341,  248,  340,  249,  250,  342,  343,
			  343,  343,  485,  373,  328,  264,  153,  264,  367,  367, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  367,  245,  246,  283,  329,  247,  248,  488,  249,  250,
			  192,  204,  192,  375,   94,  373,  378,  192,  545,  470,
			  192,  277,  277,  277,  277,  466,  192,  344,  266,  266,
			  266,  266,  350,  187,  350,  285,  267,  545,  378,   84,
			  272,  187,  272,  375,  545,  401,  183,  271,  271,  271,
			  271,  355,  275,  275,  275,  275,  192,  384,  398,  192,
			  277,  277,  277,  277,  464,  348,  278,  278,  278,  278,
			  282,  282,  282,  282,  401,  192,  380,   94,  192,  361,
			  192,  399,   94,  398,  354,  192,  193,  384,  192,  359,
			  463,  364,  364,  364,  364,  383,  192,  360,  380,  269,

			  185,  386,  387,  199,  362,  362,  399,  185,  363,  363,
			  363,  363,  282,  282,  282,  282,  388,  383,  286,  286,
			  286,  408,  389,  386,  192,  391,  387,  192,  280,  370,
			  370,  370,  370,  419,  419,  395,  397,  400,  388,  402,
			  406,  405,  371,  192,  389,   94,  192,  391,  192,  365,
			   94,  408,  409,  192,  193,  206,  192,  395,  397,  400,
			  411,  402,  192,  405,  412,  406,  413,  414,  148,  343,
			  343,  343,  343,  462,  409,  420,  420,  420,  266,  266,
			  266,  266,  422,  423,  423,  423,  412,  428,  428,  411,
			  442,  413,  192,  545,  460,  192,  439,  414,  350,  187, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  350,  441,  267,  424,  424,   84,  418,  429,  429,  429,
			  459,  192,  442,   94,   86,  348,   86,  545,   76,  445,
			  439,   86,   88,  446,   86,  545,  447,  425,  425,  425,
			   89,  441,   90,  366,  366,  271,  271,  271,  271,  275,
			  275,  275,  275,  445,  448,  446,  431,  431,  431,  431,
			  363,  363,  363,  363,  447,  450,  185,  458,  473,  473,
			   86,  518,  518,   86,  457,  269,  363,  363,  363,  363,
			  283,  456,  354,  448,  469,  451,  359,  453,  148,   86,
			  185,   76,   86,  360,   86,  450,   76,  458,  185,   86,
			   77,  452,   86,  436,  436,  436,  436,  451,   89,  453,

			   90,  432,  432,  434,  469,  433,  433,  433,  433,  364,
			  364,  364,  364,  461,  455,  452,  517,  454,  367,  367,
			  367,  465,  435,  370,  370,  370,  370,  449,   86,  287,
			  365,   86,  472,  437,  437,  461,  435,  438,  438,  438,
			  438,  454,  467,  465,  468,  493,  280,   86,  427,   76,
			  344,  266,  266,  266,  266,  285,  472,  474,  474,  474,
			  280,  345,  346,  410,  467,  494,  468,  493,  421,  421,
			  343,  343,  343,  343,  344,  419,  419,  344,  420,  420,
			  420,  430,  430,  347,  355,  428,  428,  494,  348,  496,
			  545,  345,  346,  545,  182,  423,  423,  423,  423,  183, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  424,  424,  183,  271,  271,  271,  271,  418,  545,  498,
			  503,  496,  476,  351,  352,  477,  502,  183,  425,  425,
			  425,  407,  486,  404,  355,  429,  429,  429,  431,  431,
			  431,  431,  482,  500,  503,  353,  403,  483,  502,  498,
			  354,  182,  504,  351,  352,  433,  433,  433,  433,  433,
			  433,  433,  433,  185,  506,  484,  185,  355,  275,  275,
			  275,  275,  487,  500,  504,  360,  505,  507,  356,  357,
			   94,  185,  489,  489,  489,  489,  490,  490,   94,  538,
			  491,  491,  491,  491,  506,  396,  360,  394,  505,  507,
			  358,  436,  436,  436,  436,  359,  508,  509,  356,  357,

			  148,  343,  343,  343,  343,  438,  438,  438,  438,  434,
			  510,  415,  416,  438,  438,  438,  438,  512,  508,  393,
			  513,  509,  392,  514,  419,  419,  475,  475,  365,  390,
			  148,  473,  473,  417,  510,  420,  420,  420,  418,  512,
			  521,  415,  416,  545,  513,  514,  148,  474,  474,  474,
			  365,  428,  428,  426,  426,  426,  426,  519,  519,  519,
			  522,  476,  426,  426,  426,  426,  426,  426,  515,  545,
			  521,  385,  477,  382,  524,  423,  423,  423,  423,  424,
			  424,  523,  522,  525,  516,  526,  381,  545,  486,  429,
			  429,  429,  426,  426,  426,  426,  426,  425,  425,  425, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  489,  489,  489,  489,  524,  523,  185,  182,  423,  423,
			  423,  423,  482,  525,  527,  526,  483,  529,  479,  480,
			  491,  491,  491,  491,  533,  541,  487,  491,  491,  491,
			  491,  379,  185,  377,  484,  473,  473,  434,  540,  527,
			  481,  529,  474,  474,  474,  482,  542,  541,  479,  480,
			  185,  182,  518,  518,  533,  182,  519,  519,  519,  518,
			  518,  520,  520,  540,  434,  519,  519,  519,  542,  376,
			  374,  208,  515,  105,  105,  105,  105,  105,  195,  516,
			  195,  195,  287,  349,  195,  339,  195,  207,  207,  536,
			  338,  207,  148,  537,  148,  148,  536,  336,  148,  335,

			  148,  333,  537,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   82,  331,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   87,   87,   87,   87,   87,   87, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   87,   87,   87,   87,   91,  325,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,  148,  324,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  170,  170,  170,  170,  170,  170,  170,
			  170,  170,  170,  170,  170,  170,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  181,
			  322,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,  200,  200,  200,  200,  200,

			  200,  321,  200,  200,  200,  200,  200,  200,  182,  320,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  183,  319,  183,  183,  183,  183,  183,  183,  183,
			  183,  183,  183,  183,  288,  288,  317,  182,  288,  182,
			  182,  315,  314,  182,  313,  182,  368,  368,  307,  303,
			  368,  369,  369,  369,  369,  369,  369,  301,  369,  369,
			  369,  369,  369,  369,  292,  208,  287,  273,  545,  545,
			  263,  261,  260,  254,  244,  237,  232,  231,  219,  216,
			  210,  208,  194,  196,  194,   95,  545,  545,   98,  145,
			  136,  130,   96,   96,  545,   15, yy_Dummy>>,
			1, 196, 1600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1866)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 71)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (56, 280, 350)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			an_array.area.fill_with (545, 1795, 1866)
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
			   37,   48,  517,   21,   46,   38,   21,   33,   33,   35,
			   35,   33,   33,   35,   46,   45,   35,   48,   62,   62,
			   62,   95,   21,  513,   21,   27,   39,   27,   27,   27,
			   27,   95,   46,   39,   39,   42,   46,   27,   27,   39,
			   52,   52,   52,   52,  108,   42,  112,   42,   65,   65,
			   65,   42,   76,   67,   67,   39,   67,  512,   39,   27,
			   76,   39,   76,  148,   27,   42,  148,   27,   27,  154, yy_Dummy>>,
			1, 200, 72)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   42,   42,  154,   42,  108,  509,  112,   52, yy_Dummy>>,
			1, 8, 272)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   58,   58,   58,  109,   68,   68,   68,   58,   68,   70,
			   70,   70,  508,   70,   72,   72,   77,   72,   77,   82,
			   77,  182,   82,   77,  182,  109,   77,   80,   80,   80,
			  101,  101,   77,   85,   85,   85,  110,   85,   80,   87,
			   85,  115,  118,   87,   99,   99,   99,   99,   97,   97,
			   97,   97,  107,  121,   68,  107,  197,   99,  110,   70,
			  507,   97,   77,  115,  118,   77,  197,  101,  100,  130,
			  100,  100,  100,  100,  102,  102,  102,  503,  121,  231,
			  107,   77,   82,   77,   84,   97,  120,   84,   84,   84,
			  120,  130,  231,   84,  104,  104,  104,  104,  122,   84,

			   85,   84,   87,   84,   84,   84,   84,  100,   84,  116,
			   84,  102,  120,  116,   84,  131,   84,  174,  174,   84,
			   84,   84,   84,   84,   84,  176,  176,  116,  122,  129,
			  119,  104,  132,  133,  421,  344,  137,  131,  344,  116,
			  137,  129,  116,  138,  211,  119,  488,   84,   86,  116,
			   86,  140,   86,  126,  142,   86,   86,  126,   86,  129,
			  119,  137,  132,  133,   86,  138,   86,  119,  126,  145,
			  141,  126,  421,  140,  211,  141,  142,  146,  146,  146,
			  146,  164,  164,  126,  164,  126,  141,  152,  152,  152,
			  126,  145,  181,  126,   86,  166,  166,   86,  166,  485, yy_Dummy>>,
			1, 200, 351)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  141,  147,  147,  147,  147,  160,  160,  160,  141,  155,
			  155,  155,  155,   86,  146,   86,   88,  191,   88,  183,
			   88,  191,  183,   88,   88,  478,   88,  157,  157,  157,
			  170,  170,   88,  170,  157,  162,  162,  162,  147,  168,
			  168,  168,  210,  168,  375,  169,  169,  169,  216,  169,
			  172,  172,  232,  172,  178,  181,  178,  217,  178,  203,
			  203,  178,   88,  184,  178,   88,  210,  185,  185,  185,
			  178,  185,  375,  184,  184,  184,  184,  232,  216,  217,
			  191,   88,  183,   88,   89,  465,   89,  453,   89,  168,
			  219,   89,   89,  223,   89,  169,  203,  186,  186,  186,

			  178,  186,   89,  178,  186,  196,  196,  196,  196,  198,
			  198,  204,  204,  198,  198,  198,  198,  218,  380,  178,
			  219,  178,  380,  223,  552,  220,  184,  450,  221,  446,
			   89,  254,  552,   89,  185,  199,  199,  199,  199,  218,
			  201,  201,  201,  201,  205,  205,  205,  220,  204,   89,
			  221,   89,   90,  201,   90,  254,   90,  226,  236,   90,
			   90,  215,   90,  444,  186,  206,  206,  206,   90,  202,
			  202,  229,  199,  202,  202,  202,  202,  201,  215,  226,
			  227,  205,  209,  230,  209,  209,  209,  209,  236,  248,
			  250,  215,  257,  229,  227,  238,  244,  247,   90,  252, yy_Dummy>>,
			1, 200, 551)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  215,   90,  206,  426,  260,  230,  290,  440,  261,  412,
			  227,  248,  250,  249,  257,  283,  283,   90,  430,   90,
			  136,  209,  136,  284,  284,  238,  244,  247,  290,  252,
			  136,  249,  261,  136,  260,  136,  136,  263,  263,  263,
			  263,  426,  291,  249,  264,  264,  264,  285,  285,  285,
			  136,  136,  283,  249,  136,  136,  430,  136,  136,  188,
			  284,  188,  293,  188,  291,  296,  188,  188,  411,  188,
			  276,  276,  276,  276,  405,  188,  266,  266,  266,  266,
			  266,  269,  269,  269,  285,  269,  271,  296,  269,  272,
			  272,  272,  293,  272,  324,  271,  271,  271,  271,  271,

			  275,  275,  275,  275,  275,  188,  302,  318,  188,  277,
			  277,  277,  277,  403,  266,  278,  278,  278,  278,  281,
			  281,  281,  281,  324,  188,  298,  188,  189,  278,  189,
			  321,  189,  318,  271,  189,  189,  302,  189,  275,  402,
			  280,  280,  280,  280,  301,  189,  277,  298,  269,  271,
			  304,  305,  278,  279,  279,  321,  272,  279,  279,  279,
			  279,  282,  282,  282,  282,  306,  301,  286,  286,  286,
			  331,  307,  304,  189,  309,  305,  189,  280,  289,  289,
			  289,  289,  345,  345,  314,  316,  323,  306,  325,  329,
			  328,  289,  189,  307,  189,  190,  309,  190,  282,  190, yy_Dummy>>,
			1, 200, 751)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  331,  332,  190,  190,  286,  190,  314,  316,  323,  336,
			  325,  190,  328,  337,  329,  338,  339,  343,  343,  343,
			  343,  343,  401,  332,  346,  346,  346,  348,  348,  348,
			  348,  349,  349,  349,  349,  337,  356,  356,  336,  379,
			  338,  190,  351,  399,  190,  374,  339,  350,  350,  350,
			  376,  350,  351,  351,  350,  343,  357,  357,  357,  397,
			  190,  379,  190,  192,  348,  192,  352,  192,  381,  374,
			  192,  192,  383,  192,  354,  384,  352,  352,  352,  192,
			  376,  192,  366,  366,  354,  354,  354,  354,  359,  359,
			  359,  359,  381,  385,  383,  360,  360,  360,  360,  362,

			  362,  362,  362,  384,  387,  351,  396,  415,  415,  192,
			  479,  479,  192,  395,  350,  363,  363,  363,  363,  366,
			  394,  354,  385,  409,  388,  359,  391,  475,  192,  352,
			  192,  193,  360,  193,  387,  193,  396,  354,  193,  193,
			  389,  193,  365,  365,  365,  365,  388,  193,  391,  193,
			  361,  361,  363,  409,  361,  361,  361,  361,  364,  364,
			  364,  364,  400,  393,  389,  475,  392,  367,  367,  367,
			  404,  364,  370,  370,  370,  370,  386,  193,  368,  365,
			  193,  414,  371,  371,  400,  370,  371,  371,  371,  371,
			  392,  406,  404,  408,  441,  364,  193,  355,  193,  265, yy_Dummy>>,
			1, 200, 951)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  265,  265,  265,  265,  367,  414,  416,  416,  416,  370,
			  265,  265,  333,  406,  442,  408,  441,  574,  574,  418,
			  418,  418,  418,  419,  419,  419,  420,  420,  420,  420,
			  575,  575,  265,  428,  428,  428,  442,  265,  445,  424,
			  265,  265,  270,  423,  423,  423,  423,  423,  424,  424,
			  424,  270,  270,  270,  270,  270,  418,  425,  447,  456,
			  445,  419,  270,  270,  420,  455,  425,  425,  425,  425,
			  330,  428,  327,  429,  429,  429,  429,  431,  431,  431,
			  431,  423,  452,  456,  270,  326,  424,  455,  447,  270,
			  520,  457,  270,  270,  432,  432,  432,  432,  433,  433,

			  433,  433,  424,  459,  425,  270,  274,  274,  274,  274,
			  274,  429,  452,  457,  431,  458,  460,  274,  274,  556,
			  425,  434,  434,  434,  434,  435,  435,  556,  520,  435,
			  435,  435,  435,  459,  315,  433,  313,  458,  460,  274,
			  436,  436,  436,  436,  274,  461,  462,  274,  274,  342,
			  342,  342,  342,  342,  437,  437,  437,  437,  434,  463,
			  342,  342,  438,  438,  438,  438,  469,  461,  312,  470,
			  462,  311,  472,  476,  476,  576,  576,  436,  308,  473,
			  473,  473,  342,  463,  477,  477,  477,  342,  469,  492,
			  342,  342,  353,  470,  472,  474,  474,  474,  474,  438, yy_Dummy>>,
			1, 200, 1151)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  486,  486,  353,  353,  353,  353,  480,  480,  480,  493,
			  476,  353,  353,  353,  353,  353,  353,  473,  483,  492,
			  303,  477,  300,  497,  482,  482,  482,  482,  483,  483,
			  495,  493,  498,  474,  499,  299,  484,  486,  487,  487,
			  487,  353,  353,  353,  353,  353,  484,  484,  484,  489,
			  489,  489,  489,  497,  495,  353,  422,  422,  422,  422,
			  422,  482,  498,  500,  499,  483,  506,  422,  422,  490,
			  490,  490,  490,  510,  529,  487,  491,  491,  491,  491,
			  297,  483,  295,  484,  515,  515,  489,  525,  500,  422,
			  506,  516,  516,  516,  422,  531,  529,  422,  422,  484,

			  518,  518,  518,  510,  519,  519,  519,  519,  536,  536,
			  577,  577,  525,  491,  537,  537,  537,  531,  294,  292,
			  288,  515,  557,  557,  557,  557,  557,  563,  516,  563,
			  563,  287,  268,  563,  259,  563,  566,  566,  518,  258,
			  566,  567,  519,  567,  567,  536,  256,  567,  255,  567,
			  253,  537,  546,  546,  546,  546,  546,  546,  546,  546,
			  546,  546,  546,  546,  546,  547,  547,  547,  547,  547,
			  547,  547,  547,  547,  547,  547,  547,  547,  548,  548,
			  548,  548,  548,  548,  548,  548,  548,  548,  548,  548,
			  548,  549,  549,  549,  549,  549,  549,  549,  549,  549, yy_Dummy>>,
			1, 200, 1351)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  549,  549,  549,  549,  550,  550,  550,  550,  550,  550,
			  550,  550,  550,  550,  550,  550,  550,  551,  551,  551,
			  551,  551,  551,  551,  551,  551,  551,  551,  551,  551,
			  553,  251,  553,  553,  553,  553,  553,  553,  553,  553,
			  553,  553,  553,  554,  554,  554,  554,  554,  554,  554,
			  554,  554,  554,  555,  246,  555,  555,  555,  555,  555,
			  555,  555,  555,  555,  555,  555,  558,  245,  558,  558,
			  558,  558,  558,  558,  558,  558,  558,  558,  558,  559,
			  559,  559,  559,  559,  559,  559,  559,  559,  559,  559,
			  559,  559,  560,  560,  560,  560,  560,  560,  560,  560,

			  560,  560,  560,  560,  560,  561,  561,  561,  561,  561,
			  561,  561,  561,  561,  561,  561,  561,  561,  562,  243,
			  562,  562,  562,  562,  562,  562,  562,  562,  562,  562,
			  562,  564,  564,  564,  564,  564,  564,  564,  564,  564,
			  564,  564,  564,  564,  565,  565,  565,  565,  565,  565,
			  241,  565,  565,  565,  565,  565,  565,  568,  240,  568,
			  568,  568,  568,  568,  568,  568,  568,  568,  568,  568,
			  569,  239,  569,  569,  569,  569,  569,  569,  569,  569,
			  569,  569,  569,  570,  570,  237,  571,  570,  571,  571,
			  235,  234,  571,  233,  571,  572,  572,  228,  224,  572, yy_Dummy>>,
			1, 200, 1551)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  573,  573,  573,  573,  573,  573,  222,  573,  573,  573,
			  573,  573,  573,  214,  208,  207,  195,  180,  179,  150,
			  144,  143,  139,  135,  128,  125,  123,  114,  111,  106,
			  103,   93,   92,   91,   81,   79,   78,   51,   50,   44,
			   41,   32,   29,   15, yy_Dummy>>,
			1, 44, 1751)
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
			    0,    0,    0,   70,   71,   79,   82,   90,   93,   96,
			   99,  102,  107,   86,  111, 1794,   99,  114,  121,  108,
			   69,  155, 1795,  123,  113,  123,  113,  214,  129, 1772,
			  128,  129, 1771,  149,    0,  152,  124,  141,  144,  199,
			  122, 1753,  212,  102, 1762,  152,  175,  133,  165,   98,
			 1751, 1738,  227,  166, 1795, 1795,  279, 1795,  350, 1795,
			 1795, 1795,  219, 1795, 1795,  249, 1795,  253,  354, 1795,
			  359, 1795,  363,  153, 1795,  197,  242,  363, 1767, 1764,
			  377, 1773,  365, 1795,  430,  383,  495,  382,  563,  631,
			  699, 1775, 1769, 1773,    0,  221, 1795,  384,    0,  380,

			  406,  366,  410, 1729,  430,    0, 1752,  371,  219,  312,
			  344, 1751,  224,  136, 1750,  351,  435,    0,  351,  454,
			  398,  369,  425, 1739,    0, 1737,  477,    0, 1741,  454,
			  377,  424,  456,  458,    0, 1746,  744,  452,  453, 1745,
			  458,  494,  464, 1740, 1743,  479,  513,  537,  260, 1795,
			 1756, 1795,  537, 1795,  266,  545, 1795,  577, 1795, 1795,
			  555, 1795,  585, 1795,  530, 1795,  544, 1795,  589,  595,
			  579, 1795,  599, 1795,  466, 1795,  474, 1795,  601, 1749,
			 1746,  538,  367,  565,  609,  617,  647, 1795,  806,  874,
			  942,  560, 1010, 1078, 1795, 1758,  641,  405,  649,  671, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1795,  676,  709,  595,  647,  680,  701, 1714, 1713,  720,
			  556,  471,    0,    0, 1732,  688,  573,  566,  623,  617,
			  635,  635, 1729,  620, 1721,    0,  664,  707, 1720,  680,
			  691,  394,  568, 1716, 1714, 1702,  685, 1708,  722, 1683,
			 1681, 1663,    0, 1642,  721, 1590, 1577,  724,  696,  738,
			  700, 1554,  726, 1469,  645, 1471, 1469,  703, 1458, 1453,
			  728,  722,    0,  773,  794, 1136,  813, 1795, 1469,  831,
			 1188,  832,  839, 1795, 1243,  837,  806,  845,  851,  893,
			  876,  855,  897,  751,  759,  783,  903, 1430, 1419,  914,
			  714,  751, 1440,  787, 1437, 1399,  774, 1403,  833, 1358,

			 1343,  854,  831, 1339,  860,  865,  875,  881, 1301,  881,
			    0, 1294, 1287, 1240,  894, 1257,  895,    0,  823,    0,
			    0,  846,    0,  893,  816,  898, 1200, 1191,  897,  905,
			 1173,  895,  911, 1124,    0,    0,  931,  920,  931,  943,
			    0,    0, 1286,  954,  481,  918,  960,    0,  963,  967,
			  997,  988, 1012, 1338, 1020, 1139,  972,  992,    0, 1024,
			 1031, 1090, 1035, 1051, 1094, 1078, 1018, 1103, 1077, 1795,
			 1108, 1122,    0,    0,  959,  564,  976,    0,    0,  949,
			  641,  982,    0,  982,  995, 1015, 1099, 1028, 1032, 1054,
			    0, 1036, 1080, 1086, 1039, 1032, 1031,  978,    0,  966, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1072,  941,  862,  836, 1080,  797, 1099,    0, 1101, 1050,
			    0,  787,  732,    0, 1095, 1043, 1142,    0, 1155, 1160,
			 1163,  471, 1393, 1180, 1185, 1203,  740, 1795, 1170, 1210,
			  755, 1213, 1230, 1234, 1257, 1265, 1276, 1290, 1298,    0,
			  730, 1101, 1122,    0,  676, 1146,  652, 1185,    0,    0,
			  650,    0, 1209,  610,    0, 1174, 1173, 1199, 1223, 1230,
			 1224, 1254, 1260, 1273,    0,  608,    0,    0,    0, 1274,
			 1283,    0, 1280, 1316, 1332, 1064, 1309, 1320,  524, 1046,
			 1342,    0, 1360, 1364, 1382,  498, 1336, 1374,  445, 1385,
			 1405, 1412, 1313, 1317,    0, 1344,    0, 1347, 1358, 1358,

			 1379,    0,    0,  398,    0,    0, 1380,  383,  325,  249,
			 1398,    0,  231,  197,    0, 1420, 1427,  152, 1437, 1441,
			 1227,    0,  136,    0,    0, 1403,    0,    0,    0, 1382,
			    0, 1405,    0,   90,    0,    0, 1444, 1450,   54,    0,
			   58,    0,    0,    0,    0, 1795, 1502, 1515, 1528, 1541,
			 1554, 1567,  670, 1580, 1590, 1603, 1265, 1465, 1616, 1629,
			 1642, 1655, 1668, 1475, 1681, 1694, 1479, 1489, 1707, 1720,
			 1726, 1734, 1738, 1750, 1160, 1173, 1318, 1453, yy_Dummy>>,
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
			an_array.area.fill_with (71, 127, 159)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (71, 167, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (71, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (71, 8203, 8238)
			an_array.put (1, 8239)
			an_array.area.fill_with (71, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (71, 8288, 8703)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (71, 8708, 10225)
			an_array.area.fill_with (70, 10226, 10227)
			an_array.area.fill_with (71, 10228, 12287)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   71,   71,   71,   71,   71,   71,   71,   71,    1,
			    2,    1,    1,    3,   71,   71,   71,   71,   71,   71,
			   71,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			   71,   71,    1,    4,    5,    6,    7,    8,    6,    9,
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
			    1,   71,   71,   71,   71,   71,   70, yy_Dummy>>,
			1, 7, 160)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   70,   71,   71,   70, yy_Dummy>>,
			1, 4, 8704)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,   71,   71, yy_Dummy>>,
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
			    1,   13, yy_Dummy>>)
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

	yyJam_base: INTEGER = 1795
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 545
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 546
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 71
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
