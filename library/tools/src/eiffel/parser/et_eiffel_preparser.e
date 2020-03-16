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
			create an_array.make_filled (0, 0, 1862)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			an_array.area.fill_with (545, 1792, 1862)
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
			   19,   16,   54,   54,   83,   55,   55,   84,   56,   56,
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
			  160,  161,  160,  545,   86,   76,   76,   99,  124,  100,
			  100,  100,  100,  545,  139,  125,  126,  131,  140,  101,
			  102,  127,  146,  146,  146,  146,  213,  132,  401,  133,
			  162,  163,  162,  134,  178,  165,  166,  124,  167,  535,
			  126,  103,  179,  127,  180,  534,  104,  131,   80,  101,
			  102,  149,  132,  133,  150,  134,  213,  401,  197,  147,
			  152,  153,  152,  151,  154,  151,  151,  154,  154,  154,
			  151,  151,  151,  155,  151,  151,  151,  151,  151,  154,

			  151,  154,  151,  154,  154,  154,  154,  151,  154,  151,
			  154,  151,  151,  151,  154,  151,  154,  151,  151,  154,
			  154,  154,  154,  154,  154,  151,  151,  151,  151,  151,
			  151,  151,  151,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  151,  151,  151,
			  151,  157,  158,  157,  532,  168,  165,  169,  159,  167,
			  168,  171,  169,  545,  167,  165,  172,  191,  173,   80,
			   80,   80,   83,  211,  214,   84,  212,  186,  187,  186,
			   81,   83,  203,  203,   84,   97,   97,   97,   97,  201,
			  201,  201,  201,  205,  205,  205,  214,  217,  198,  215, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  531,  212,  202,  229,   99,  170,  100,  100,  100,  100,
			  170,  209,  209,  209,  209,  220,  224,  225,  290,  204,
			  227,  215,  199,  545,  228,  545,  545,  217,  229,  230,
			  206,  149,  226,  545,  150,   85,  182,  220,  224,  183,
			  183,  183,  290,  104,   85,  184,  228,  225,  104,  530,
			  242,  183,  238,  183,  226,  183,  183,  183,  183,  230,
			  183,  221,  183,  240,  239,  222,  183,  241,  183,  175,
			  176,  183,  183,  183,  183,  183,  183,  177,  176,  223,
			  242,  243,  238,  267,  253,  240,  268,   80,  251,  241,
			  255,  221,  252,  259,  222,  262,  312,  197,  256,  185,

			   86,  223,   86,  257,   76,  233,  253,   86,  188,  234,
			   86,  243,  255,  251,  258,  259,  189,  262,  190,  528,
			  235,  312,  296,  236,  146,  146,  146,  146,  256,  264,
			  153,  264,  160,  161,  160,  233,  258,  234,  265,  266,
			  266,  266,  235,  545,  296,  236,   86,  297,  398,   86,
			  146,  146,  146,  146,  488,  157,  158,  157,  162,  163,
			  162,  147,  159,   76,  291,   86,   76,   76,  192,  297,
			  192,   76,   94,  398,  267,  192,  545,   84,  192,  165,
			  166,  485,  167,  295,  192,  171,  166,  147,  167,  168,
			  165,  169,  298,  167,  291,  168,  171,  169,  545,  167, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  165,  172,  302,  173,  171,  172,  185,  173,  270,  271,
			  271,  271,  545,  295,  192,  478,  545,  192,  334,  272,
			  187,  272,  298,  545,  186,  187,  186,  511,   83,  203,
			  203,   84,  302,  192,   94,   94,  192,  269,  192,  170,
			   94,  501,  334,  192,  193,  170,  192,  274,  275,  275,
			  275,  276,  276,  305,  192,  277,  277,  277,  277,  284,
			  284,  185,  278,  278,  278,  278,  283,  306,  201,  201,
			  201,  201,  281,  281,  545,  545,  282,  282,  282,  282,
			  293,  279,  192,  305,  499,  192,  185,  205,  205,  205,
			  497,   85,  286,  286,  286,  495,  204,  294,  316,  199,

			  299,  192,   94,   94,  192,  280,  192,  318,   94,  300,
			  293,  192,  193,  289,  192,  209,  209,  209,  209,  294,
			  192,  304,  299,  308,  285,  309,  310,  323,  316,  206,
			  326,  300,  327,  328,  330,  332,  337,  318,  340,  311,
			  341,  419,  419,  304,  372,  308,  149,  309,  492,  150,
			  192,  329,  104,  192,  327,  443,  330,  323,  337,  444,
			  326,  428,  428,  328,  341,  332,  372,  373,  340,  192,
			   94,   94,  245,  329,  246,  342,  343,  343,  343,  264,
			  153,  264,  247,  366,  366,  248,  375,  249,  250,  373,
			  344,  266,  266,  266,  266,  378,  471,  350,  187,  350, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  470,  267,  245,  246,   84,  466,  247,  248,  380,  249,
			  250,  192,  464,  192,  463,   94,  375,  378,  192,  545,
			  283,  192,  545,  277,  277,  277,  277,  192,  348,  384,
			  380,  183,  271,  271,  271,  271,  272,  187,  272,  383,
			  545,  386,  355,  275,  275,  275,  275,  277,  277,  277,
			  277,  284,  284,  278,  278,  278,  278,  192,  387,  384,
			  192,  383,  411,  386,  269,  462,  361,  362,  362,  354,
			  460,  363,  363,  363,  363,  459,  192,   94,   94,  192,
			  359,  192,  387,   94,  360,  185,  192,  193,  204,  192,
			  199,  411,  364,  364,  364,  364,  408,  192,  282,  282,

			  282,  282,  388,  185,  282,  282,  282,  282,  389,  457,
			  391,  367,  367,  367,  395,  286,  286,  286,  370,  370,
			  370,  370,  456,  414,  388,  192,  408,   94,  192,  280,
			  389,  371,  391,  399,  397,   94,  395,  400,  402,  405,
			  406,  365,  409,  413,  192,   94,   94,  192,  285,  192,
			  412,   94,  206,  414,  192,  193,  397,  192,  399,  400,
			  402,  405,  455,  192,  409,  406,  473,  473,  413,  420,
			  420,  420,  412,  148,  343,  343,  343,  343,  449,  266,
			  266,  266,  266,  422,  423,  423,  423,  350,  187,  350,
			  545,  267,  545,  192,   84,  545,  192,  429,  429,  429, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  424,  424,  425,  425,  425,  271,  271,  271,  271,  287,
			  440,  418,  192,   94,   94,   86,  348,   86,  427,   76,
			  366,  366,   86,   88,  447,   86,  275,  275,  275,  275,
			  441,   89,  439,   90,  431,  431,  431,  431,  440,  432,
			  432,  410,  354,  433,  433,  433,  433,  363,  363,  363,
			  363,  407,  447,  185,  269,  185,  439,  283,  185,  450,
			  441,   86,  442,  359,   86,  363,  363,  363,  363,  448,
			  446,  360,  404,  364,  364,  364,  364,  367,  367,  367,
			   86,   76,   76,   86,  442,   86,  435,   76,  445,  450,
			   86,   77,  446,   86,  436,  436,  436,  436,  448,   89,

			  344,   90,  434,  370,  370,  370,  370,  458,  451,  452,
			  280,  403,  445,  453,  285,  454,  435,  437,  437,  461,
			  465,  438,  438,  438,  438,  467,  396,  469,  394,   86,
			  451,  365,   86,  452,  468,  453,  472,  458,  478,  454,
			  280,  461,  465,  474,  474,  474,  493,  467,   86,   76,
			   76,  344,  266,  266,  266,  266,  468,  469,  183,  393,
			  472,  494,  345,  346,  343,  343,  343,  343,  493,  496,
			  344,  419,  419,  344,  420,  420,  420,  545,  182,  423,
			  423,  423,  423,  494,  347,  355,  183,  424,  424,  348,
			  392,  496,  345,  346,  545,  502,  485,  355,  428,  428, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  504,  418,  390,  183,  271,  271,  271,  271,  476,  545,
			  503,  477,  498,  500,  351,  352,  482,  502,  183,  425,
			  425,  425,  504,  488,  483,  355,  429,  429,  429,  431,
			  431,  431,  431,  505,  503,  486,  353,  506,  518,  518,
			  185,  354,  498,  500,  351,  352,  433,  433,  433,  433,
			  433,  433,  433,  433,  527,  505,  484,  185,  355,  275,
			  275,  275,  275,  487,  507,  509,  360,  506,  508,  356,
			  357,  385,  185,  489,  489,  489,  489,  490,  490,  527,
			  382,  491,  491,  491,  491,  381,  507,  360,  148,  509,
			  508,  358,  436,  436,  436,  436,  359,  510,  512,  356,

			  357,  148,  343,  343,  343,  343,  438,  438,  438,  438,
			  434,  513,  415,  416,  438,  438,  438,  438,  514,  522,
			  512,  510,  148,  473,  473,  379,  517,  540,  521,  365,
			  377,  524,  419,  419,  417,  513,  420,  420,  420,  418,
			  514,  522,  415,  416,  545,  148,  474,  474,  474,  428,
			  428,  365,  540,  541,  426,  426,  426,  426,  521,  542,
			  515,  524,  376,  426,  426,  426,  426,  426,  426,  476,
			  519,  519,  519,  477,  545,  541,  423,  423,  423,  423,
			  545,  542,  523,  516,  424,  424,  486,  429,  429,  429,
			  425,  425,  425,  426,  426,  426,  426,  426,  489,  489, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  489,  489,  491,  491,  491,  491,  523,  185,  182,  423,
			  423,  423,  423,  482,  491,  491,  491,  491,  525,  479,
			  480,  483,  526,  529,  487,  533,  182,  484,  473,  473,
			  474,  474,  474,  518,  518,  434,  374,  185,  182,  518,
			  518,  481,  208,  185,  421,  421,  482,  529,  525,  479,
			  480,  434,  526,  430,  430,  533,  182,  519,  519,  519,
			  519,  519,  519,  287,  538,  515,  349,  516,  475,  475,
			  536,  105,  105,  105,  105,  105,  536,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,  195,  339,  195,
			  195,  520,  520,  195,  537,  195,  338,  537,   53,   53,

			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   82,  336,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   91,
			  335,   91,   91,   91,   91,   91,   91,   91,   91,   91, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   91,   91,  148,  333,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  170,  170,
			  170,  170,  170,  170,  170,  170,  170,  170,  170,  170,
			  170,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  181,  331,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			  200,  200,  200,  200,  200,  200,  325,  200,  200,  200,
			  200,  200,  200,  207,  207,  324,  148,  207,  148,  148,

			  322,  321,  148,  320,  148,  182,  319,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  183,  317,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  288,  288,  315,  182,  288,  182,  182,  314,  313,
			  182,  307,  182,  368,  368,  303,  301,  368,  369,  369,
			  369,  369,  369,  369,  292,  369,  369,  369,  369,  369,
			  369,  208,  287,  273,  545,  545,  263,  261,  260,  254,
			  244,  237,  232,  231,  219,  216,  210,  208,  194,  196,
			  194,   95,  545,  545,   98,  145,  136,  130,   96,   96,
			  545,   15, yy_Dummy>>,
			1, 192, 1600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1862)
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
			an_array.area.fill_with (545, 1791, 1862)
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
			   62,   77,   21,   21,   21,   27,   39,   27,   27,   27,
			   27,   77,   46,   39,   39,   42,   46,   27,   27,   39,
			   52,   52,   52,   52,  108,   42,  324,   42,   65,   65,
			   65,   42,   76,   67,   67,   39,   67,  513,   39,   27,
			   76,   39,   76,  512,   27,   42,   95,   27,   27,  148, yy_Dummy>>,
			1, 200, 72)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   42,   42,  148,   42,  108,  324,   95,   52, yy_Dummy>>,
			1, 8, 272)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   58,   58,   58,  509,   68,   68,   68,   58,   68,   70,
			   70,   70,   87,   70,   72,   72,   87,   72,   80,   80,
			   80,   82,  107,  109,   82,  107,   85,   85,   85,   80,
			   85,  101,  101,   85,   97,   97,   97,   97,   99,   99,
			   99,   99,  102,  102,  102,  109,  112,   97,  110,  508,
			  107,   99,  121,  100,   68,  100,  100,  100,  100,   70,
			  104,  104,  104,  104,  115,  118,  119,  210,  101,  120,
			  110,   97,  178,  120,   87,   87,  112,  121,  122,  102,
			  154,  119,  178,  154,   82,   84,  115,  118,   84,   84,
			   84,  210,  100,   85,   84,  120,  119,  104,  507,  132,

			   84,  129,   84,  119,   84,   84,   84,   84,  122,   84,
			  116,   84,  130,  129,  116,   84,  131,   84,  174,  174,
			   84,   84,   84,   84,   84,   84,  176,  176,  116,  132,
			  133,  129,  182,  138,  130,  182,  197,  137,  131,  140,
			  116,  137,  142,  116,  145,  232,  197,  141,   84,   86,
			  116,   86,  141,   86,  126,  138,   86,   86,  126,   86,
			  133,  140,  137,  141,  142,   86,  145,   86,  503,  126,
			  232,  217,  126,  146,  146,  146,  146,  141,  152,  152,
			  152,  160,  160,  160,  126,  141,  126,  155,  155,  155,
			  155,  126,  181,  217,  126,   86,  218,  318,   86,  147, yy_Dummy>>,
			1, 200, 351)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  147,  147,  147,  488,  157,  157,  157,  162,  162,  162,
			  146,  157,  552,  211,   86,   86,   86,   88,  218,   88,
			  552,   88,  318,  183,   88,   88,  183,   88,  164,  164,
			  485,  164,  216,   88,  166,  166,  147,  166,  168,  168,
			  168,  219,  168,  211,  169,  169,  169,  184,  169,  170,
			  170,  223,  170,  172,  172,  181,  172,  184,  184,  184,
			  184,  191,  216,   88,  478,  191,   88,  254,  185,  185,
			  185,  219,  185,  186,  186,  186,  465,  186,  203,  203,
			  186,  223,   88,   88,   88,   89,  183,   89,  168,   89,
			  453,  254,   89,   89,  169,   89,  196,  196,  196,  196,

			  198,  198,  227,   89,  198,  198,  198,  198,  204,  204,
			  184,  199,  199,  199,  199,  203,  227,  201,  201,  201,
			  201,  202,  202,  191,  191,  202,  202,  202,  202,  215,
			  201,   89,  227,  450,   89,  185,  205,  205,  205,  446,
			  186,  206,  206,  206,  444,  204,  215,  236,  199,  220,
			   89,   89,   89,   90,  201,   90,  238,   90,  221,  215,
			   90,   90,  209,   90,  209,  209,  209,  209,  215,   90,
			  226,  220,  229,  205,  230,  231,  244,  236,  206,  247,
			  221,  248,  249,  250,  252,  257,  238,  260,  231,  261,
			  345,  345,  226,  290,  229,  344,  230,  440,  344,   90, yy_Dummy>>,
			1, 200, 551)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  249,  209,   90,  248,  380,  250,  244,  257,  380,  247,
			  356,  356,  249,  261,  252,  290,  291,  260,   90,   90,
			   90,  136,  249,  136,  263,  263,  263,  263,  264,  264,
			  264,  136,  283,  283,  136,  293,  136,  136,  291,  266,
			  266,  266,  266,  266,  296,  412,  269,  269,  269,  411,
			  269,  136,  136,  269,  405,  136,  136,  298,  136,  136,
			  188,  403,  188,  402,  188,  293,  296,  188,  188,  283,
			  188,  271,  276,  276,  276,  276,  188,  266,  302,  298,
			  271,  271,  271,  271,  271,  272,  272,  272,  301,  272,
			  304,  275,  275,  275,  275,  275,  277,  277,  277,  277,

			  284,  284,  278,  278,  278,  278,  188,  305,  302,  188,
			  301,  336,  304,  269,  401,  278,  279,  279,  271,  399,
			  279,  279,  279,  279,  397,  188,  188,  188,  189,  275,
			  189,  305,  189,  277,  271,  189,  189,  284,  189,  278,
			  336,  280,  280,  280,  280,  331,  189,  281,  281,  281,
			  281,  306,  272,  282,  282,  282,  282,  307,  395,  309,
			  285,  285,  285,  314,  286,  286,  286,  289,  289,  289,
			  289,  394,  339,  306,  189,  331,  556,  189,  280,  307,
			  289,  309,  321,  316,  556,  314,  323,  325,  328,  329,
			  282,  332,  338,  189,  189,  189,  190,  285,  190,  337, yy_Dummy>>,
			1, 200, 751)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  190,  286,  339,  190,  190,  316,  190,  321,  323,  325,
			  328,  393,  190,  332,  329,  415,  415,  338,  346,  346,
			  346,  337,  343,  343,  343,  343,  343,  386,  348,  348,
			  348,  348,  349,  349,  349,  349,  350,  350,  350,  351,
			  350,  352,  190,  350,  354,  190,  357,  357,  357,  351,
			  351,  352,  352,  352,  354,  354,  354,  354,  368,  375,
			  343,  190,  190,  190,  192,  348,  192,  355,  192,  366,
			  366,  192,  192,  384,  192,  359,  359,  359,  359,  376,
			  192,  374,  192,  360,  360,  360,  360,  375,  361,  361,
			  333,  354,  361,  361,  361,  361,  362,  362,  362,  362,

			  330,  384,  351,  350,  352,  374,  366,  354,  387,  376,
			  192,  379,  359,  192,  363,  363,  363,  363,  385,  383,
			  360,  327,  364,  364,  364,  364,  367,  367,  367,  192,
			  192,  192,  193,  379,  193,  364,  193,  381,  387,  193,
			  193,  383,  193,  365,  365,  365,  365,  385,  193,  421,
			  193,  363,  370,  370,  370,  370,  396,  388,  389,  364,
			  326,  381,  391,  367,  392,  370,  371,  371,  400,  404,
			  371,  371,  371,  371,  406,  315,  409,  313,  193,  388,
			  365,  193,  389,  408,  391,  414,  396,  421,  392,  370,
			  400,  404,  416,  416,  416,  441,  406,  193,  193,  193, yy_Dummy>>,
			1, 200, 951)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  265,  265,  265,  265,  265,  408,  409,  426,  312,  414,
			  442,  265,  265,  418,  418,  418,  418,  441,  445,  419,
			  419,  419,  420,  420,  420,  420,  424,  423,  423,  423,
			  423,  423,  442,  265,  430,  424,  424,  424,  265,  311,
			  445,  265,  265,  270,  455,  426,  428,  428,  428,  457,
			  418,  308,  270,  270,  270,  270,  270,  419,  425,  456,
			  420,  447,  452,  270,  270,  423,  455,  425,  425,  425,
			  425,  457,  430,  424,  429,  429,  429,  429,  431,  431,
			  431,  431,  458,  456,  428,  270,  459,  479,  479,  424,
			  270,  447,  452,  270,  270,  432,  432,  432,  432,  433,

			  433,  433,  433,  500,  458,  425,  270,  274,  274,  274,
			  274,  274,  429,  460,  462,  431,  459,  461,  274,  274,
			  303,  425,  434,  434,  434,  434,  435,  435,  500,  300,
			  435,  435,  435,  435,  299,  460,  433,  475,  462,  461,
			  274,  436,  436,  436,  436,  274,  463,  469,  274,  274,
			  342,  342,  342,  342,  342,  437,  437,  437,  437,  434,
			  470,  342,  342,  438,  438,  438,  438,  472,  493,  469,
			  463,  473,  473,  473,  297,  475,  525,  492,  436,  295,
			  497,  476,  476,  342,  470,  477,  477,  477,  342,  472,
			  493,  342,  342,  353,  474,  474,  474,  474,  486,  486, yy_Dummy>>,
			1, 200, 1151)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  438,  525,  529,  353,  353,  353,  353,  492,  531,  473,
			  497,  294,  353,  353,  353,  353,  353,  353,  476,  480,
			  480,  480,  477,  483,  529,  482,  482,  482,  482,  484,
			  531,  495,  474,  483,  483,  486,  487,  487,  487,  484,
			  484,  484,  353,  353,  353,  353,  353,  489,  489,  489,
			  489,  490,  490,  490,  490,  495,  353,  422,  422,  422,
			  422,  422,  482,  491,  491,  491,  491,  498,  422,  422,
			  483,  499,  506,  487,  510,  520,  484,  515,  515,  516,
			  516,  516,  536,  536,  489,  292,  483,  518,  518,  518,
			  422,  288,  484,  574,  574,  422,  506,  498,  422,  422,

			  491,  499,  575,  575,  510,  519,  519,  519,  519,  537,
			  537,  537,  287,  520,  515,  268,  516,  576,  576,  536,
			  557,  557,  557,  557,  557,  518,  554,  554,  554,  554,
			  554,  554,  554,  554,  554,  554,  563,  259,  563,  563,
			  577,  577,  563,  519,  563,  258,  537,  546,  546,  546,
			  546,  546,  546,  546,  546,  546,  546,  546,  546,  546,
			  547,  547,  547,  547,  547,  547,  547,  547,  547,  547,
			  547,  547,  547,  548,  548,  548,  548,  548,  548,  548,
			  548,  548,  548,  548,  548,  548,  549,  549,  549,  549,
			  549,  549,  549,  549,  549,  549,  549,  549,  549,  550, yy_Dummy>>,
			1, 200, 1351)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  550,  550,  550,  550,  550,  550,  550,  550,  550,  550,
			  550,  550,  551,  551,  551,  551,  551,  551,  551,  551,
			  551,  551,  551,  551,  551,  553,  256,  553,  553,  553,
			  553,  553,  553,  553,  553,  553,  553,  553,  555,  255,
			  555,  555,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  558,  253,  558,  558,  558,  558,  558,  558,  558,
			  558,  558,  558,  558,  559,  559,  559,  559,  559,  559,
			  559,  559,  559,  559,  559,  559,  559,  560,  560,  560,
			  560,  560,  560,  560,  560,  560,  560,  560,  560,  560,
			  561,  561,  561,  561,  561,  561,  561,  561,  561,  561,

			  561,  561,  561,  562,  251,  562,  562,  562,  562,  562,
			  562,  562,  562,  562,  562,  562,  564,  564,  564,  564,
			  564,  564,  564,  564,  564,  564,  564,  564,  564,  565,
			  565,  565,  565,  565,  565,  246,  565,  565,  565,  565,
			  565,  565,  566,  566,  245,  567,  566,  567,  567,  243,
			  241,  567,  240,  567,  568,  239,  568,  568,  568,  568,
			  568,  568,  568,  568,  568,  568,  568,  569,  237,  569,
			  569,  569,  569,  569,  569,  569,  569,  569,  569,  569,
			  570,  570,  235,  571,  570,  571,  571,  234,  233,  571,
			  228,  571,  572,  572,  224,  222,  572,  573,  573,  573, yy_Dummy>>,
			1, 200, 1551)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  573,  573,  573,  214,  573,  573,  573,  573,  573,  573,
			  208,  207,  195,  180,  179,  150,  144,  143,  139,  135,
			  128,  125,  123,  114,  111,  106,  103,   93,   92,   91,
			   81,   79,   78,   51,   50,   44,   41,   32,   29,   15, yy_Dummy>>,
			1, 40, 1751)
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
			   99,  102,  107,   86,  111, 1790,   99,  114,  121,  108,
			   69,  155, 1791,  123,  113,  123,  113,  214,  129, 1768,
			  128,  129, 1767,  149,    0,  152,  124,  141,  144,  199,
			  122, 1749,  212,  102, 1758,  152,  175,  133,  165,   98,
			 1747, 1734,  227,  166, 1791, 1791,  279, 1791,  350, 1791,
			 1791, 1791,  219, 1791, 1791,  249, 1791,  253,  354, 1791,
			  359, 1791,  363,  153, 1791,  197,  242,  211, 1763, 1760,
			  368, 1769,  367, 1791,  431,  376,  496,  355,  564,  632,
			  700, 1771, 1765, 1769,    0,  266, 1791,  370,    0,  374,

			  391,  367,  378, 1725,  396,    0, 1748,  341,  219,  332,
			  356, 1747,  373,  136, 1746,  374,  436,    0,  374,  390,
			  381,  368,  405, 1735,    0, 1733,  478,    0, 1737,  426,
			  420,  425,  423,  455,    0, 1742,  745,  453,  443, 1741,
			  446,  471,  452, 1736, 1739,  454,  509,  535,  266, 1791,
			 1752, 1791,  528, 1791,  426,  523, 1791,  554, 1791, 1791,
			  531, 1791,  557, 1791,  577, 1791,  583, 1791,  588,  594,
			  598, 1791,  602, 1791,  467, 1791,  475, 1791,  411, 1745,
			 1742,  538,  478,  569,  593,  618,  623, 1791,  807,  875,
			  943,  604, 1011, 1079, 1791, 1754,  632,  485,  640,  647, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1791,  653,  661,  614,  644,  672,  677, 1710, 1709,  700,
			  381,  540,    0,    0, 1722,  656,  557,  480,  502,  568,
			  659,  665, 1718,  578, 1717,    0,  677,  629, 1713,  681,
			  682,  690,  461, 1711, 1710, 1694,  674, 1691,  683, 1667,
			 1675, 1663,    0, 1672,  701, 1667, 1658,  706,  688,  707,
			  693, 1627,  711, 1571,  581, 1562, 1549,  696, 1464, 1456,
			  711,  703,    0,  760,  778, 1137,  776, 1791, 1452,  796,
			 1189,  817,  835, 1791, 1244,  828,  808,  832,  838,  856,
			  877,  883,  889,  768,  836,  896,  900, 1411, 1390,  903,
			  701,  725, 1406,  760, 1330, 1296,  753, 1297,  765, 1257,

			 1250,  798,  803, 1239,  800,  821,  861,  867, 1174,  866,
			    0, 1162, 1127, 1081,  873, 1098,  893,    0,  513,    0,
			    0,  898,    0,  893,  219,  897, 1075, 1040,  895,  905,
			 1003,  870,  901, 1002,    0,    0,  833,  906,  908,  899,
			    0,    0, 1287,  959,  741,  726,  954,    0,  964,  968,
			  986,  985,  987, 1339,  990, 1009,  746,  982,    0, 1011,
			 1019, 1028, 1032, 1050, 1058, 1079, 1005, 1062,  957, 1791,
			 1088, 1106,    0,    0,  995,  979, 1005,    0,    0, 1021,
			  727, 1051,    0, 1029,  993, 1040,  950, 1032, 1065, 1072,
			    0, 1072, 1078,  934,  890,  877, 1081,  843,    0,  842, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1078,  833,  786,  784, 1079,  777, 1082,    0, 1091, 1103,
			    0,  768,  768,    0, 1099,  951, 1128,    0, 1149, 1156,
			 1159, 1086, 1394, 1164, 1172, 1204, 1144, 1791, 1183, 1211,
			 1171, 1214, 1231, 1235, 1258, 1266, 1277, 1291, 1299,    0,
			  720, 1102, 1118,    0,  657, 1126,  662, 1188,    0,    0,
			  656,    0, 1189,  613,    0, 1153, 1173, 1157, 1190, 1213,
			 1221, 1226, 1228, 1260,    0,  599,    0,    0,    0, 1255,
			 1274,    0, 1275, 1308, 1331, 1274, 1317, 1321,  563, 1223,
			 1355,    0, 1361, 1369, 1375,  529, 1334, 1372,  502, 1383,
			 1387, 1399, 1301, 1276,    0, 1345,    0, 1304, 1393, 1395,

			 1219,    0,    0,  489,    0,    0, 1386,  421,  362,  326,
			 1399,    0,  237,  231,    0, 1413, 1415,  152, 1424, 1442,
			 1412,    0,  136,    0,    0, 1292,    0,    0,    0, 1310,
			    0, 1318,    0,   90,    0,    0, 1418, 1445,   54,    0,
			   58,    0,    0,    0,    0, 1791, 1497, 1510, 1523, 1536,
			 1549, 1562,  558, 1575, 1473, 1588,  922, 1463, 1601, 1614,
			 1627, 1640, 1653, 1484, 1666, 1679, 1685, 1693, 1704, 1717,
			 1723, 1731, 1735, 1747, 1436, 1445, 1460, 1483, yy_Dummy>>,
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
			  559,  545,  560,  561,  545,  561,   19,  556,  556,  556,
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
			  561,  545,  556,  556,  556,  562,  568,  569,  562,  562,
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
			   13,   13, yy_Dummy>>)
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

	yyJam_base: INTEGER = 1791
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
