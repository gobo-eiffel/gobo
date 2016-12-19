note

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2016, Eric Bezault and others"
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
	yy_column := yy_column + 3
--|#line 34 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 34")
end

				-- Ignore byte order mark (BOM).
				-- See http://en.wikipedia.org/wiki/Byte_order_mark
			
when 2 then
yy_set_line_column
--|#line 42 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 42")
end

			
when 3 then
	yy_column := yy_column + 1
--|#line 43 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 43")
end

			
when 4 then
	yy_column := yy_column + 2
--|#line 44 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 44")
end

			
when 5 then
	yy_column := yy_column + 5
--|#line 49 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 49")
end

			
when 6 then
	yy_column := yy_column + 5
--|#line 50 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 50")
end

			
when 7 then
	yy_column := yy_column + 3
--|#line 51 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 51")
end

			
when 8 then
	yy_column := yy_column + 3
--|#line 52 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 52")
end

			
when 9 then
	yy_column := yy_column + 2
--|#line 53 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 53")
end

			
when 10 then
	yy_column := yy_column + 6
--|#line 54 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 54")
end

			
when 11 then
	yy_column := yy_column + 5
--|#line 55 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 55")
end

			
when 12 then
	yy_column := yy_column + 7
--|#line 56 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 56")
end

			
when 13 then
	yy_column := yy_column + 6
--|#line 57 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 57")
end

			
when 14 then
	yy_column := yy_column + 8
--|#line 58 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 58")
end

			
when 15 then
	yy_column := yy_column + 7
--|#line 59 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 59")
end

			
when 16 then
	yy_column := yy_column + 5
--|#line 60 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 60")
end

			
when 17 then
	yy_column := yy_column + 8
--|#line 61 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 61")
end

			
when 18 then
	yy_column := yy_column + 2
--|#line 62 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 62")
end

			
when 19 then
	yy_column := yy_column + 4
--|#line 63 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 63")
end

			
when 20 then
	yy_column := yy_column + 6
--|#line 64 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 64")
end

			
when 21 then
	yy_column := yy_column + 3
--|#line 65 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 65")
end

			
when 22 then
	yy_column := yy_column + 6
--|#line 66 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 66")
end

			
when 23 then
	yy_column := yy_column + 8
--|#line 67 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 67")
end

			
when 24 then
	yy_column := yy_column + 6
--|#line 68 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 68")
end

			
when 25 then
	yy_column := yy_column + 8
--|#line 69 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 69")
end

			
when 26 then
	yy_column := yy_column + 5
--|#line 70 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 70")
end

			
when 27 then
	yy_column := yy_column + 7
--|#line 71 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 71")
end

			
when 28 then
	yy_column := yy_column + 4
--|#line 72 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 72")
end

			
when 29 then
	yy_column := yy_column + 6
--|#line 73 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 73")
end

			
when 30 then
	yy_column := yy_column + 2
--|#line 74 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 74")
end

			
when 31 then
	yy_column := yy_column + 7
--|#line 75 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 75")
end

			
when 32 then
	yy_column := yy_column + 8
--|#line 76 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 76")
end

			
when 33 then
	yy_column := yy_column + 5
--|#line 77 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 77")
end

			
when 34 then
	yy_column := yy_column + 7
--|#line 78 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 78")
end

			
when 35 then
	yy_column := yy_column + 7
--|#line 79 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 79")
end

			
when 36 then
	yy_column := yy_column + 9
--|#line 80 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 80")
end

			
when 37 then
	yy_column := yy_column + 2
--|#line 81 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 81")
end

			
when 38 then
	yy_column := yy_column + 4
--|#line 82 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 82")
end

			
when 39 then
	yy_column := yy_column + 5
--|#line 83 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 83")
end

			
when 40 then
	yy_column := yy_column + 4
--|#line 84 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 84")
end

			
when 41 then
	yy_column := yy_column + 3
--|#line 85 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 85")
end

			
when 42 then
	yy_column := yy_column + 8
--|#line 86 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 86")
end

			
when 43 then
	yy_column := yy_column + 3
--|#line 87 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 87")
end

			
when 44 then
	yy_column := yy_column + 4
--|#line 88 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 88")
end

			
when 45 then
	yy_column := yy_column + 2
--|#line 89 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 89")
end

			
when 46 then
	yy_column := yy_column + 9
--|#line 90 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 90")
end

			
when 47 then
	yy_column := yy_column + 6
--|#line 91 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 91")
end

			
when 48 then
	yy_column := yy_column + 8
--|#line 92 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 92")
end

			
when 49 then
	yy_column := yy_column + 6
--|#line 93 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 93")
end

			
when 50 then
	yy_column := yy_column + 7
--|#line 94 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 94")
end

			
when 51 then
	yy_column := yy_column + 6
--|#line 95 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 95")
end

			
when 52 then
	yy_column := yy_column + 6
--|#line 96 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 96")
end

			
when 53 then
	yy_column := yy_column + 5
--|#line 97 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 97")
end

			
when 54 then
	yy_column := yy_column + 6
--|#line 98 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 98")
end

			
when 55 then
	yy_column := yy_column + 8
--|#line 99 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 99")
end

			
when 56 then
	yy_column := yy_column + 5
--|#line 100 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 100")
end

			
when 57 then
	yy_column := yy_column + 4
--|#line 101 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 101")
end

			
when 58 then
	yy_column := yy_column + 4
--|#line 102 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 102")
end

			
when 59 then
	yy_column := yy_column + 8
--|#line 103 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 103")
end

			
when 60 then
	yy_column := yy_column + 6
--|#line 104 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 104")
end

			
when 61 then
	yy_column := yy_column + 5
--|#line 105 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 105")
end

			
when 62 then
	yy_column := yy_column + 7
--|#line 106 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 106")
end

			
when 63 then
	yy_column := yy_column + 4
--|#line 107 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 107")
end

			
when 64 then
	yy_column := yy_column + 4
--|#line 108 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 108")
end

			
when 65 then
	yy_column := yy_column + 3
--|#line 109 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 109")
end

			
when 66 then
	yy_column := yy_column + 5
--|#line 111 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 111")
end

				class_keyword_found := True
			
when 67 then
	yy_column := yy_column + 8
--|#line 114 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 114")
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
			
when 68 then
	yy_column := yy_column + 9
--|#line 126 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 126")
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
			
when 69 then
	yy_column := yy_column + 10
--|#line 138 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 138")
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
			
when 70 then
	yy_column := yy_column + 4
--|#line 150 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 150")
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
			
when 71 then
	yy_column := yy_column + 9
--|#line 162 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 162")
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
			
when 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 178 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 178")
end

				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := text_count
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
when 73 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 192 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 192")
end

			
when 74 then
	yy_column := yy_column + 3
--|#line 201 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 201")
end

			
when 75 then
	yy_column := yy_column + 4
--|#line 202 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 202")
end

			
when 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 203 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 203")
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

					-- Syntax error: missing ASCII code in
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
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			
when 83 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 256 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 256")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
when 84 then
	yy_column := yy_column + 1
--|#line 261 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 261")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 85 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 277 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 277")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
when 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 286 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 286")
end

				more
				set_start_condition (VS3)
			
when 87 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 290 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 290")
end

				more
				last_literal_end := text_count - 2
			
when 88 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 294 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 294")
end

				more
				last_literal_end := text_count - 1
			
when 89 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 298 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 298")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 90 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 314 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 314")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
when 91 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 319 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 319")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
when 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 324 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 324")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 93 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 338 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 338")
end

					-- Left aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			
when 94 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 346 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 346")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
when 95 then
	yy_column := yy_column + 1
--|#line 351 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 351")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 367 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 367")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := no_verbatim_marker
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
when 97 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 376 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 376")
end

				more
				set_start_condition (LAVS3)
			
when 98 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 380 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 380")
end

				more
				last_literal_end := text_count - 2
			
when 99 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 384 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 384")
end

				more
				last_literal_end := text_count - 1
			
when 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 388 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 388")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 101 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 404 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 404")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
when 102 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 409 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 409")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
when 103 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 414 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 414")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 428 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 428")
end

					-- Manifest string with special characters.
			
when 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 431 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 431")
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
--|#line 442 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 442")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
when 107 then
	yy_end := yy_start + yy_more_len + 2
	yy_column := yy_column + 2
--|#line 447 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 447")
end

					-- Multi-line manifest string.

					-- Syntax error: no space allowed after character
					-- % at end of line in multi-line manifest strings.
				column := yy_column - 1
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSNS_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
				set_start_condition (MSN1)
			
when 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 462 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 462")
end

				more
			
when 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 465 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 465")
end

					-- Syntax error: missing character / at end of special
					-- character specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSAS_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
			
when 110 then
	yy_column := yy_column + 2
--|#line 477 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 477")
end

					-- Syntax error: missing ASCII code in special character
					-- specification %/code/ in manifest string.
				column := yy_column
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSAC_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
			
when 111 then
	yy_column := yy_column + 2
--|#line 489 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 489")
end

					-- Syntax error: special character specification
					-- %l where l is a letter code should be in
					-- upper-case in manifest strings.
				column := yy_column - 1
				line := yy_line
--				set_syntax_error
--				error_handler.report_SSCU_error (filename, current_position)
				column := ms_column
				line := ms_line

				more
			
when 112 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 502 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 502")
end

				more
			
when 113 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 505 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 505")
end

				set_start_condition (INITIAL)
			
when 114 then
	yy_column := yy_column + 2
--|#line 508 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 508")
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
			
when 115 then
	yy_column := yy_column + 1
--|#line 520 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 520")
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
			
when 116 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 533 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 533")
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
			
when 117 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 561 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 561")
end

				more
				set_start_condition (MSN)
			
when 118 then
	yy_column := yy_column + 1
--|#line 565 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 565")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 580 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 580")
end

				more
				set_start_condition (MS)
			
when 120 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 584 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 584")
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
			
when 121 then
	yy_column := yy_column + 1
--|#line 596 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 596")
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
			
when 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 627 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 627")
end

			
when 123 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 629 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 629")
end

			
when 124 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 631 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 631")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 125 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 638 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 638")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 126 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 645 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 645")
end

			
when 127 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 647 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 647")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 128 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 654 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 654")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 129 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 661 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 661")
end

			
when 130 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 663 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 663")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 131 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 670 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 670")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 132 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 677 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 677")
end

			
when 133 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 679 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 679")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)
				last_token := E_INTEGER
			
when 134 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 686 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 686")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)
				last_token := E_INTEGER
			
when 135 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 697 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 697")
end

			
when 136 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 698 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 698")
end

			
when 137 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 699 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 699")
end

			
when 138 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 701 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 701")
end

			
when 139 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 702 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 702")
end

			
when 140 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 703 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 703")
end

			
when 141 then
	yy_column := yy_column + 1
--|#line 713 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 713")
end

				last_token := E_UNKNOWN
			
when 142 then
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
--|#line 712 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 712")
end
terminate
when 1 then
--|#line 545 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 545")
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
--|#line 609 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 609")
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
--|#line 571 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 571")
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
--|#line 304 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 304")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 330 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 330")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 7 then
--|#line 357 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 357")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 8 then
--|#line 394 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 394")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 9 then
--|#line 420 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 420")
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
			create an_array.make_filled (0, 0, 1872)
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
			    0,   22,   23,   24,   23,   25,   26,   27,   22,   28,
			   25,   25,   29,   30,   31,   32,   33,   33,   33,   34,
			   35,   25,   36,   37,   38,   39,   40,   41,   42,   43,
			   39,   39,   44,   39,   39,   45,   39,   46,   47,   48,
			   39,   49,   50,   51,   52,   53,   54,   55,   39,   39,
			   25,   56,   25,   57,   38,   39,   40,   41,   43,   39,
			   45,   46,   39,   49,   50,   51,   52,   53,   25,   25,
			   25,   22,   22,   58,   60,   60,  230,   61,   61,   62,
			   62,   64,   65,   64,   64,   65,   64,   66,   80,   81,
			   66,   68,   69,   68,   68,   69,   68,   71,   72,   71,

			   71,   72,   71,   74,   75,   76,  230,   77,   74,   75,
			   76,  325,   77,   80,   81,   83,   84,   83,   83,   84,
			   83,   86,   87,   88,  326,   89,   86,   87,   88,  509,
			   89,   92,   93,   92,   93,   94,   94,   94,   94,   94,
			   94,   97,  105,   98,  508,   95,  103,  104,   95,  125,
			  106,  106,  106,  107,  107,  107,  107,  106,  108,  126,
			  109,  109,  109,  109,  106,  106,  106,  106,  137,  130,
			   78,   90,  144,  131,  138,   78,   90,  150,  146,  127,
			  159,  128,  160,  115,  504,   99,  132,  159,  116,  160,
			  117,  129,  503,  147,  144,  118,  119,  153,  113,  130, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  159,  150,  160,  100,  127,  128,  106,  108,  132,  109,
			  109,  109,  109,  116,  117,  147,  148,  118,  119,  110,
			  111,  186,  187,  120,  133,  153,  149,  121,  188,  187,
			  122,  134,  135,  123,  202,  203,  124,  136,  171,  172,
			  171,  112,  234,  151,  148,  204,  203,  113,  149,  110,
			  111,  120,  121,  133,  140,  123,  135,  152,  124,  136,
			  155,  155,  155,  155,  141,  502,  142,  173,  174,  173,
			  143,  246,  234,  151,  168,  169,  168,   94,  176,  177,
			  170,  178,  176,  183,  140,  184,  214,  175,   94,  141,
			  142,  500,  143,  189,  190,  189,  246,  214,  156,  161,

			  162,  163,  164,  161,  165,  161,  165,  165,  165,  161,
			  161,  161,  166,  161,  161,  161,  161,  161,  165,  161,
			  165,  161,  165,  165,  165,  165,  161,  165,  161,  165,
			  161,  161,  161,  165,  161,  165,  161,  161,  165,  165,
			  165,  165,  165,  165,  161,  161,  161,  161,  161,  161,
			  161,  161,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  161,  161,  161,  161,
			  161,  161,  179,  176,  180,  499,  178,  179,  182,  180,
			  247,  178,  192,  193,  235,  194,  195,  192,  196,  498,
			  194,  195,  198,  196,  231,  194,  192,  199,   97,  200, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   98,  191,   94,   94,   94,  207,  208,  207,  235,   97,
			  247,   98,   95,  209,  210,  209,  231,   97,  232,   98,
			  107,  107,  107,  107,  218,  218,  218,  218,  220,  220,
			  222,  222,  222,  215,  237,  228,  197,  219,  229,  181,
			  232,  197,   99,  108,  181,  109,  109,  109,  109,  226,
			  226,  226,  226,   99,  241,  238,  237,  496,  216,  239,
			  100,   99,  242,  229,  258,  244,  221,  259,  223,  245,
			  260,  100,  256,  240,  261,  485,  241,  243,  250,  100,
			  251,  271,  252,  113,  257,  238,  258,  113,  239,  259,
			  273,  245,  242,  253,  277,  240,  254,  269,  280,  243,

			  260,  270,  256,  271,  261,  283,  284,  283,  250,  251,
			  252,  475,  273,  186,  187,  253,  277,  473,  254,  263,
			  280,  264,  269,  188,  187,  274,  283,  285,  283,  265,
			  275,  287,  266,   98,  267,  268,  155,  155,  155,  155,
			  311,  276,  155,  155,  155,  155,  168,  169,  168,  263,
			  264,  429,  170,  265,  266,  274,  267,  268,  286,  286,
			  286,  286,  311,  276,  171,  172,  171,  173,  174,  173,
			  176,  177,  471,  178,  156,  182,  177,  305,  178,  429,
			  156,  179,  176,  180,  351,  178,  179,  182,  180,  432,
			  178,  176,  183,  433,  184,  312,  175,  182,  183,  469, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  184,  305,  175,  189,  190,  189,  192,  193,  351,  194,
			  198,  193,  314,  194,  195,  192,  196,  312,  194,  195,
			  198,  196,  306,  194,  192,  199,  466,  200,  315,  191,
			  198,  199,  310,  200,  314,  191,  202,  203,  204,  203,
			  288,  288,  288,  288,  461,  207,  208,  207,  181,   97,
			  315,   98,  306,  181,  209,  210,  209,  460,   97,  289,
			   98,  159,  310,  160,  197,  290,  290,  290,  290,  197,
			  291,  291,  220,  220,  292,  292,  292,  292,  293,  293,
			  293,  293,  313,  218,  218,  218,  218,  299,  299,  222,
			  222,  222,  317,   99,  296,  296,  294,  319,  297,  297,

			  297,  297,   99,  301,  301,  301,  308,  456,  327,  332,
			  298,  100,  313,  323,  334,  324,  216,  343,  320,  319,
			  100,  295,  317,  309,  344,  221,  304,  300,  226,  226,
			  226,  226,  321,  327,  345,  323,  308,  324,  347,  332,
			  339,  223,  401,  340,  334,  309,  344,  343,  320,  349,
			  357,  354,  346,  358,  359,  359,  359,  359,  454,  453,
			  347,  283,  284,  283,  345,  452,  113,  401,  451,  449,
			  339,  448,  340,  354,  346,  446,  445,  358,  444,  349,
			  357,  360,  286,  286,  286,  286,  205,  288,  288,  288,
			  288,  361,  290,  290,  290,  290,  292,  292,  292,  292, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  292,  292,  292,  292,  293,  293,  293,  293,  364,  364,
			  368,  368,  365,  365,  365,  365,  438,  363,  366,  366,
			  366,  366,  297,  297,  297,  297,  297,  297,  297,  297,
			  299,  299,  369,  369,  369,  301,  301,  301,  362,  374,
			  375,  377,  216,  380,  372,  372,  372,  372,  298,  386,
			  382,  402,  385,  388,  389,  390,  295,  373,  391,  393,
			  398,  374,  375,  400,  367,  380,  403,  405,  221,  406,
			  300,  377,  382,  223,  385,  388,  402,  390,  389,  386,
			  391,  393,  398,  409,  410,  400,  412,  417,  403,  413,
			  415,  406,  416,  418,  302,  419,  405,  158,  359,  359,

			  359,  359,  414,  411,  408,  409,  428,  407,  404,  410,
			  399,  413,  417,  397,  416,  396,  412,  368,  368,  415,
			  369,  369,  369,  418,  420,  420,  420,  420,  421,  421,
			  428,  430,  422,  422,  422,  422,  365,  365,  365,  365,
			  365,  365,  365,  365,  366,  366,  366,  366,  425,  425,
			  425,  425,  395,  431,  437,  298,  434,  424,  300,  435,
			  436,  430,  362,  372,  372,  372,  372,  426,  426,  439,
			  440,  427,  427,  427,  427,  431,  424,  447,  423,  441,
			  434,  435,  295,  437,  442,  443,  367,  459,  436,  450,
			  455,  457,  440,  458,  462,  420,  420,  420,  420,  439, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  394,  295,  392,  441,  387,  384,  442,  447,  383,  443,
			  381,  450,  455,  457,  379,  458,  378,  459,  462,  422,
			  422,  422,  422,  422,  422,  422,  422,  463,  463,  463,
			  463,  464,  464,  362,  467,  465,  465,  465,  465,  425,
			  425,  425,  425,  427,  427,  427,  427,  427,  427,  427,
			  427,  468,  470,  472,  474,  495,  467,  476,  477,  478,
			  480,  362,  376,  483,  479,  423,  481,  482,  484,  486,
			  487,  488,  225,  468,  470,  302,  356,  367,  489,  476,
			  495,  478,  477,  472,  474,  367,  479,  483,  481,  482,
			  480,  486,  484,  488,  487,  463,  463,  463,  463,  465,

			  465,  465,  465,  465,  465,  465,  465,  490,  489,  492,
			  491,  497,  493,  494,  501,  505,  506,  355,  353,  352,
			  224,  224,  350,  507,  224,  224,  224,  348,  342,  490,
			  341,  338,  337,  423,  491,  497,  336,  335,  506,  492,
			  505,  423,  493,  494,  501,  507,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   67,   67,   67,   67,   67,   67, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   96,   96,  333,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,  101,  331,  330,  329,
			  328,  322,  101,  101,  101,  101,  101,  101,  101,  101, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  102,  102,  318,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  114,  114,  316,  307,  114,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  158,
			  158,  225,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  181,  181,  181,

			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  191,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  201,  201,  201,  201,  201,  201,  201, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  205,  205,  205,
			  205,  302,  289,  282,  205,  205,  205,  205,  205,  281,
			  205,  205,  205,  205,  205,  212,  212,  279,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  217,  217,  217,  217,  217,  217,  217,
			  217,  278,  217,  217,  217,  217,  217,  217,  217,  217,

			  217,  217,  217,  217,  217,  217,  217,  158,  158,  158,
			  158,  272,  262,  255,  158,  158,  158,  158,  158,  249,
			  158,  158,  158,  158,  158,  205,  205,  248,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  303,
			  303,  236,  233,  303,  303,  303,  370,  370,  227,  225,
			  370,  370,  370,  371,  371,  371,  371,  371,  371,  371,
			  371,  211,  371,  371,  371,  371,  371,  371,  371,  371,
			  371,  371,  371,  371,  371,  371,  371,  213,  211,  206,
			  105,  157,  106,  154,  145,  139,  106,  106,  510,   21, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510, yy_Dummy>>,
			1, 73, 1800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1872)
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
			    1,    1,    1,    1,    3,    4,  117,    3,    4,    3,
			    4,    5,    5,    5,    6,    6,    6,    5,   13,   13,
			    6,    7,    7,    7,    8,    8,    8,    9,    9,    9,

			   10,   10,   10,   11,   11,   11,  117,   11,   12,   12,
			   12,  248,   12,   14,   14,   15,   15,   15,   16,   16,
			   16,   17,   17,   17,  248,   17,   18,   18,   18,  505,
			   18,   19,   19,   20,   20,   23,   23,   23,   24,   24,
			   24,   26,   29,   26,  501,   23,   28,   28,   24,   41,
			   31,   30,   29,   30,   30,   30,   30,   31,   33,   41,
			   33,   33,   33,   33,   35,   35,   36,   36,   45,   43,
			   11,   17,   48,   43,   45,   12,   18,   52,   50,   42,
			   59,   42,   59,   38,  490,   26,   43,  158,   38,  158,
			   38,   42,  487,   50,   48,   38,   38,   54,   33,   43, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  165,   52,  165,   26,   42,   42,   31,   32,   43,   32,
			   32,   32,   32,   38,   38,   50,   51,   38,   38,   32,
			   32,   79,   79,   40,   44,   54,   51,   40,   81,   81,
			   40,   44,   44,   40,   91,   91,   40,   44,   68,   68,
			   68,   32,  121,   53,   51,   93,   93,   32,   51,   32,
			   32,   40,   40,   44,   47,   40,   44,   53,   40,   44,
			   57,   57,   57,   57,   47,  486,   47,   71,   71,   71,
			   47,  130,  121,   53,   64,   64,   64,  105,   73,   73,
			   64,   73,   78,   78,   47,   78,  105,   78,  214,   47,
			   47,  483,   47,   83,   83,   83,  130,  214,   57,   62,

			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   74,   74,   74,  482,   74,   76,   76,   76,
			  131,   76,   85,   85,  122,   85,   86,   86,   86,  481,
			   86,   88,   88,   88,  118,   88,   90,   90,   96,   90, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   96,   90,   94,   94,   94,   99,   99,   99,  122,   99,
			  131,   99,   94,  100,  100,  100,  118,  100,  119,  100,
			  107,  107,  107,  107,  108,  108,  108,  108,  110,  110,
			  111,  111,  111,  107,  124,  116,   86,  108,  116,   74,
			  119,   88,   96,  109,   76,  109,  109,  109,  109,  113,
			  113,  113,  113,   99,  127,  125,  124,  477,  107,  125,
			   96,  100,  128,  116,  139,  129,  110,  140,  111,  129,
			  141,   99,  138,  125,  142,  455,  127,  128,  135,  100,
			  135,  147,  135,  109,  138,  125,  139,  113,  125,  140,
			  149,  129,  128,  135,  151,  125,  135,  146,  154,  128,

			  141,  146,  138,  147,  142,  162,  162,  162,  135,  135,
			  135,  442,  149,  185,  185,  135,  151,  439,  135,  145,
			  154,  145,  146,  187,  187,  150,  164,  164,  164,  145,
			  150,  205,  145,  205,  145,  145,  155,  155,  155,  155,
			  234,  150,  156,  156,  156,  156,  168,  168,  168,  145,
			  145,  377,  168,  145,  145,  150,  145,  145,  166,  166,
			  166,  166,  234,  150,  171,  171,  171,  173,  173,  173,
			  175,  175,  435,  175,  155,  177,  177,  227,  177,  377,
			  156,  179,  179,  179,  272,  179,  180,  180,  180,  382,
			  180,  181,  181,  382,  181,  235,  181,  183,  183,  433, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  183,  227,  183,  189,  189,  189,  191,  191,  272,  191,
			  193,  193,  237,  193,  195,  195,  195,  235,  195,  196,
			  196,  196,  228,  196,  197,  197,  429,  197,  238,  197,
			  199,  199,  233,  199,  237,  199,  201,  201,  203,  203,
			  206,  206,  206,  206,  416,  207,  207,  207,  179,  207,
			  238,  207,  228,  180,  209,  209,  209,  415,  209,  213,
			  209,  360,  233,  360,  195,  213,  213,  213,  213,  196,
			  215,  215,  220,  220,  215,  215,  215,  215,  216,  216,
			  216,  216,  236,  218,  218,  218,  218,  221,  221,  222,
			  222,  222,  240,  207,  219,  219,  218,  243,  219,  219,

			  219,  219,  209,  223,  223,  223,  232,  409,  249,  254,
			  220,  207,  236,  246,  256,  247,  216,  265,  244,  243,
			  209,  218,  240,  232,  266,  221,  226,  222,  226,  226,
			  226,  226,  244,  249,  267,  246,  232,  247,  268,  254,
			  262,  223,  334,  262,  256,  232,  266,  265,  244,  270,
			  278,  275,  267,  279,  282,  282,  282,  282,  407,  406,
			  268,  283,  283,  283,  267,  405,  226,  334,  404,  402,
			  262,  400,  262,  275,  267,  398,  396,  279,  395,  270,
			  278,  286,  286,  286,  286,  286,  288,  288,  288,  288,
			  288,  290,  290,  290,  290,  290,  291,  291,  291,  291, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  292,  292,  292,  292,  293,  293,  293,  293,  294,  294,
			  298,  298,  294,  294,  294,  294,  388,  293,  295,  295,
			  295,  295,  296,  296,  296,  296,  297,  297,  297,  297,
			  299,  299,  300,  300,  300,  301,  301,  301,  292,  305,
			  306,  308,  293,  311,  304,  304,  304,  304,  298,  317,
			  313,  337,  316,  319,  320,  321,  295,  304,  322,  324,
			  330,  305,  306,  332,  297,  311,  339,  341,  299,  342,
			  300,  308,  313,  301,  316,  319,  337,  321,  320,  317,
			  322,  324,  330,  345,  346,  332,  348,  355,  339,  349,
			  353,  342,  354,  356,  370,  361,  341,  359,  359,  359,

			  359,  359,  350,  347,  344,  345,  376,  343,  340,  346,
			  331,  349,  355,  329,  354,  328,  348,  368,  368,  353,
			  369,  369,  369,  356,  362,  362,  362,  362,  363,  363,
			  376,  378,  363,  363,  363,  363,  364,  364,  364,  364,
			  365,  365,  365,  365,  366,  366,  366,  366,  367,  367,
			  367,  367,  327,  381,  387,  368,  383,  366,  369,  385,
			  386,  378,  362,  372,  372,  372,  372,  373,  373,  389,
			  390,  373,  373,  373,  373,  381,  372,  399,  365,  391,
			  383,  385,  366,  387,  393,  394,  367,  413,  386,  403,
			  408,  410,  390,  412,  418,  420,  420,  420,  420,  389, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  326,  372,  323,  391,  318,  315,  393,  399,  314,  394,
			  312,  403,  408,  410,  310,  412,  309,  413,  418,  421,
			  421,  421,  421,  422,  422,  422,  422,  423,  423,  423,
			  423,  424,  424,  420,  430,  424,  424,  424,  424,  425,
			  425,  425,  425,  426,  426,  426,  426,  427,  427,  427,
			  427,  431,  434,  436,  441,  474,  430,  444,  445,  446,
			  448,  422,  307,  452,  447,  423,  449,  450,  453,  459,
			  460,  462,  303,  431,  434,  302,  277,  425,  466,  444,
			  474,  446,  445,  436,  441,  427,  447,  452,  449,  450,
			  448,  459,  453,  462,  460,  463,  463,  463,  463,  464,

			  464,  464,  464,  465,  465,  465,  465,  467,  466,  471,
			  469,  480,  472,  473,  484,  493,  497,  276,  274,  273,
			  535,  535,  271,  499,  535,  535,  535,  269,  264,  467,
			  263,  261,  259,  463,  469,  480,  258,  257,  497,  471,
			  493,  465,  472,  473,  484,  499,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  512,  512,  512,  512,  512,  512,  512,  512,  512,  512,
			  512,  512,  512,  512,  512,  512,  512,  512,  512,  512,
			  512,  512,  512,  512,  513,  513,  513,  513,  513,  513, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  513,  513,  513,  513,  513,  513,  513,  513,  513,  513,
			  513,  513,  513,  513,  513,  513,  513,  513,  514,  514,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  516,
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  516,
			  517,  517,  517,  517,  517,  517,  517,  517,  517,  517,

			  517,  517,  517,  517,  517,  517,  517,  517,  517,  517,
			  517,  517,  517,  517,  518,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  518,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  518,  518,  518,  518,  519,  519,
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  519,  520,  520,  255,  520,  520,  520,  520,  520,
			  520,  520,  520,  520,  520,  520,  520,  520,  520,  520,
			  520,  520,  520,  520,  520,  520,  521,  253,  252,  251,
			  250,  245,  521,  521,  521,  521,  521,  521,  521,  521, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  521,  521,  521,  521,  521,  521,  521,  521,  521,  521,
			  522,  522,  241,  522,  522,  522,  522,  522,  522,  522,
			  522,  522,  522,  522,  522,  522,  522,  522,  522,  522,
			  522,  522,  522,  522,  523,  523,  239,  231,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  524,
			  524,  225,  524,  524,  524,  524,  524,  524,  524,  524,
			  524,  524,  524,  524,  524,  524,  524,  524,  524,  524,
			  524,  524,  524,  525,  525,  525,  525,  525,  525,  525,
			  525,  525,  525,  525,  525,  525,  525,  525,  525,  525,
			  525,  525,  525,  525,  525,  525,  525,  526,  526,  526,

			  526,  526,  526,  526,  526,  526,  526,  526,  526,  526,
			  526,  526,  526,  526,  526,  526,  526,  526,  526,  526,
			  526,  527,  527,  527,  527,  527,  527,  527,  527,  527,
			  527,  527,  527,  527,  527,  527,  527,  527,  527,  527,
			  527,  527,  527,  527,  527,  528,  528,  528,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  528,  528,  528,
			  528,  528,  528,  528,  528,  528,  528,  528,  528,  529,
			  529,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,  529,  529,  529,  529,  529,  529,  529,  529,  529,
			  529,  529,  529,  530,  530,  530,  530,  530,  530,  530, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  530,  530,  530,  530,  530,  530,  530,  530,  530,  530,
			  530,  530,  530,  530,  530,  530,  530,  531,  531,  531,
			  531,  224,  212,  160,  531,  531,  531,  531,  531,  157,
			  531,  531,  531,  531,  531,  532,  532,  153,  532,  532,
			  532,  532,  532,  532,  532,  532,  532,  532,  532,  532,
			  532,  532,  532,  532,  532,  532,  532,  532,  532,  533,
			  533,  533,  533,  533,  533,  533,  533,  533,  533,  533,
			  533,  533,  533,  533,  533,  533,  533,  533,  533,  533,
			  533,  533,  533,  534,  534,  534,  534,  534,  534,  534,
			  534,  152,  534,  534,  534,  534,  534,  534,  534,  534,

			  534,  534,  534,  534,  534,  534,  534,  536,  536,  536,
			  536,  148,  144,  137,  536,  536,  536,  536,  536,  134,
			  536,  536,  536,  536,  536,  537,  537,  132,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  538,
			  538,  123,  120,  538,  538,  538,  539,  539,  115,  112,
			  539,  539,  539,  540,  540,  540,  540,  540,  540,  540,
			  540,  104,  540,  540,  540,  540,  540,  540,  540,  540,
			  540,  540,  540,  540,  540,  540,  540,  103,  102,   98,
			   95,   58,   56,   55,   49,   46,   37,   34,   21,  510, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510, yy_Dummy>>,
			1, 73, 1800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 540)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   71,   72,   79,   82,   89,   92,   95,
			   98,  101,  106,   85,  110,  113,  116,  119,  124,  128,
			  130, 1798, 1799,  133,  136, 1799,  135,    0,  138,  130,
			  138,  136,  194,  145, 1776,  144,  145, 1775,  153,    0,
			  192,  121,  144,  145,  195,  136, 1757,  229,  131, 1766,
			  150,  185,  140,  219,  166, 1755, 1741,  245, 1720,  174,
			 1799, 1799,  298, 1799,  272, 1799, 1799, 1799,  236, 1799,
			 1799,  265, 1799,  275,  370, 1799,  375, 1799,  279,  218,
			 1799,  225, 1799,  291, 1799,  379,  384, 1799,  389, 1799,
			  393,  231, 1799,  242,  400, 1778,  392, 1799, 1775,  403,

			  411,    0, 1779, 1773, 1762,  274, 1799,  405,  409,  430,
			  413,  415, 1706,  434,    0, 1730,  403,   49,  352,  375,
			 1724,  218,  347, 1723,  393,  430,    0,  412,  435,  426,
			  236,  356, 1689,    0, 1680,  451,    0, 1679,  446,  421,
			  425,  443,  448,    0, 1684,  492,  462,  440, 1683,  446,
			  498,  453, 1659, 1609,  457,  521,  527, 1557,  181, 1799,
			 1609, 1799,  503, 1799,  524,  194,  543, 1799,  544, 1799,
			 1799,  562, 1799,  565, 1799,  567, 1799,  572, 1799,  579,
			  584,  588, 1799,  594, 1799,  510, 1799,  520, 1799,  601,
			 1799,  603, 1799,  607, 1799,  612,  617,  621, 1799,  627, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1799,  633, 1799,  635, 1799,  525,  625,  643, 1799,  652,
			 1799, 1799, 1613,  650,  285,  659,  663, 1799,  668,  683,
			  657,  672,  674,  688, 1568, 1398,  713,  540,  598,    0,
			    0, 1405,  682,  606,  498,  550,  658,  571,  584, 1408,
			  668, 1384,    0,  653,  694, 1363,  671,  672,   75,  673,
			 1362, 1357, 1360, 1348,  685, 1336,  690, 1098, 1108, 1094,
			    0, 1103,  714, 1102, 1100,  693,  680,  708,  697, 1099,
			  725, 1090,  547, 1091, 1090,  711, 1085, 1044,  723,  716,
			    0, 1799,  739,  759, 1799, 1799,  767, 1799,  772, 1799,
			  777,  781,  785,  789,  797,  803,  807,  811,  795,  815,

			  817,  820, 1022, 1019,  829,  796,  798, 1032,  815,  984,
			  980,  801,  982,  807,  980,  975,  811,  823,  972,  812,
			  817,  814,  817,  974,  815,    0,  972,  920,  868,  866,
			  819,  882,  822,    0,  707,    0,    0,  816,    0,  822,
			  876,  838,  828,  871,  872,  839,  849,  855,  860,  848,
			  863,    0,    0,  861,  848,  852,  869,    0,    0,  883,
			  655,  886,  909,  917,  921,  925,  929,  933,  902,  905,
			  841, 1799,  948,  956,    0,    0,  869,  520,  906,    0,
			    0,  912,  561,  919,    0,  918,  929,  925,  788,  942,
			  927,  942,    0,  943,  948,  750,  744,    0,  743,  951, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  739,    0,  741,  948,  721,  733,  731,  730,  949,  679,
			  948,    0,  950,  963,    0,  625,  616,    0,  957, 1799,
			  980, 1004, 1008, 1012, 1020, 1024, 1028, 1032,    0,  598,
			  990, 1008,    0,  561, 1009,  544, 1029,    0,    0,  489,
			    0, 1030,  483,    0, 1015, 1021, 1016, 1021, 1036, 1023,
			 1025,    0, 1026, 1031,    0,  447,    0,    0,    0, 1026,
			 1033,    0, 1028, 1080, 1084, 1088, 1051, 1064,    0, 1073,
			    0, 1082, 1087, 1086, 1020,    0,    0,  427,    0,    0,
			 1074,  361,  337,  263, 1088,    0,  237,  164,    0,    0,
			  156,    0,    0, 1080,    0,    0,    0, 1073,    0, 1082,

			    0,  116,    0,    0,    0,  101,    0,    0,    0,    0,
			 1799, 1145, 1169, 1193, 1217, 1241, 1265, 1289, 1313, 1337,
			 1361, 1385, 1409, 1424, 1448, 1472, 1496, 1520, 1544, 1568,
			 1592, 1612, 1634, 1658, 1682, 1110, 1702, 1724, 1739, 1746,
			 1762, yy_Dummy>>,
			1, 141, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 540)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  510,    1,  511,  511,  512,  512,  513,  513,  514,
			  514,  515,  515,  516,  516,  517,  517,  518,  518,  519,
			  519,  510,  510,  510,  510,  510,  520,  521,  522,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  510,  510,  510,  524,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  525,  525,  510,  525,  510,  526,  527,
			  510,  527,  510,  510,  510,  528,  528,  510,  528,  510,
			  529,  530,  510,  530,  510,  510,  520,  510,  531,  520,

			  520,  521,  510,  532,  510,  533,  510,  510,  534,  510,
			  510,  510,  535,  510,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  510,  510,  510,  524,  510,
			  536,  510,  510,  510,  510,  524,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  525,  510,  525,  510,  525,
			  525,  526,  510,  526,  510,  527,  510,  527,  510,  510,
			  510,  528,  510,  528,  510,  528,  528,  529,  510,  529, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  510,  530,  510,  530,  510,  537,  510,  520,  510,  520,
			  510,  510,  510,  510,  533,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  535,  538,  510,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,

			  510,  510,  539,  538,  540,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  510,
			  524,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  539,  510,  510,  510,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  510,  510,  510,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,

			  523,  523,  523,  523,  523,  523,  523,  523,  523,  523,
			    0,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510, yy_Dummy>>,
			1, 141, 400)
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
			    1,    1,    2,    5,    6,    7,    5,    8,    7,    9,
			   10,   10,    5,   11,    5,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   18,   18,   19,    5,
			   20,   21,   22,   23,    7,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,   44,   45,   46,   47,   48,
			   49,   50,   51,   52,    5,   53,    1,   54,   55,   56,

			   57,   28,   58,   30,   59,   32,   33,   34,   60,   36,
			   61,   38,   39,   62,   63,   64,   65,   66,   67,   46,
			   47,   48,   49,   68,    7,   69,   70,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,   71,    1,    1,
			    1,   72,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,   73,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    4,    1,    5,    1,    6,    7,
			    8,    1,    1,    9,    7,   10,   10,   10,   11,    1,
			   12,    1,   13,    1,   14,   14,   14,   15,   10,   16,
			   17,   18,   17,   17,   17,   19,   17,   20,   17,   17,
			   21,   21,   21,   21,   21,   22,   17,   17,   17,   23,
			    1,    1,    1,   10,   10,   10,   10,   10,   10,   17,
			   17,   17,   17,   17,   17,   17,   17,   24,    1,    1,
			    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 511)
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
			    8,    9,   10,   12,   15,   17,   20,   23,   26,   29,
			   32,   35,   38,   41,   44,   47,   50,   53,   56,   59,
			   62,   65,   68,   71,   74,   77,   80,   83,   86,   89,
			   92,   95,   98,  101,  104,  107,  110,  112,  114,  116,
			  118,  120,  122,  124,  126,  128,  130,  133,  135,  137,
			  139,  141,  143,  145,  147,  149,  151,  153,  155,  157,
			  159,  161,  163,  165,  167,  169,  171,  173,  175,  177,
			  179,  181,  183,  185,  187,  188,  188,  189,  191,  191,

			  193,  195,  196,  197,  198,  200,  201,  202,  204,  204,
			  205,  205,  205,  205,  206,  207,  208,  209,  210,  212,
			  213,  214,  215,  216,  217,  218,  219,  221,  222,  223,
			  224,  225,  226,  227,  229,  230,  231,  233,  234,  235,
			  236,  237,  238,  239,  241,  242,  243,  244,  245,  246,
			  247,  248,  249,  250,  251,  252,  253,  253,  253,  254,
			  255,  255,  256,  257,  258,  259,  261,  263,  265,  265,
			  266,  267,  267,  268,  268,  269,  270,  271,  272,  273,
			  274,  275,  276,  278,  279,  281,  282,  283,  284,  286,
			  286,  287,  288,  289,  290,  291,  292,  293,  294,  296, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  297,  299,  300,  301,  302,  304,  305,  305,  306,  307,
			  308,  309,  310,  311,  313,  314,  314,  314,  315,  317,
			  318,  319,  319,  320,  320,  321,  321,  322,  323,  324,
			  326,  328,  329,  330,  331,  332,  333,  334,  335,  336,
			  337,  338,  339,  341,  342,  343,  344,  345,  346,  347,
			  348,  349,  350,  351,  352,  353,  354,  355,  356,  358,
			  359,  361,  362,  363,  364,  365,  366,  367,  368,  369,
			  370,  371,  372,  373,  374,  375,  376,  377,  378,  379,
			  380,  382,  383,  383,  383,  384,  386,  387,  388,  388,
			  389,  390,  390,  392,  393,  393,  393,  393,  395,  396,

			  397,  398,  399,  400,  401,  401,  402,  403,  404,  405,
			  406,  407,  408,  409,  410,  411,  412,  413,  414,  416,
			  417,  418,  419,  420,  421,  422,  424,  425,  426,  427,
			  428,  429,  430,  431,  433,  434,  436,  438,  439,  441,
			  442,  443,  444,  445,  446,  447,  448,  449,  450,  451,
			  452,  453,  455,  457,  458,  459,  460,  461,  463,  465,
			  465,  467,  468,  468,  468,  468,  472,  473,  473,  474,
			  475,  476,  477,  478,  479,  481,  483,  484,  485,  486,
			  488,  490,  491,  492,  493,  495,  496,  497,  498,  499,
			  500,  501,  502,  504,  505,  506,  507,  508,  510,  511, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  512,  513,  515,  516,  517,  518,  519,  520,  521,  522,
			  523,  524,  526,  527,  528,  530,  531,  532,  534,  535,
			  536,  537,  537,  538,  538,  538,  539,  539,  540,  542,
			  543,  544,  545,  547,  548,  549,  550,  551,  553,  555,
			  556,  558,  559,  560,  562,  563,  564,  565,  566,  567,
			  568,  569,  571,  572,  573,  575,  576,  578,  580,  582,
			  583,  584,  586,  587,  589,  589,  591,  592,  593,  595,
			  596,  598,  599,  600,  601,  602,  604,  606,  607,  609,
			  611,  612,  613,  614,  615,  616,  618,  619,  620,  622,
			  624,  625,  627,  629,  630,  632,  634,  636,  637,  639,

			  640,  642,  643,  645,  647,  649,  650,  652,  654,  656,
			  658,  658, yy_Dummy>>,
			1, 112, 400)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 657)
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
			    0,   89,   89,   92,   92,  100,  100,  103,  103,  143,
			  141,  142,    2,  141,  142,    2,  142,    3,  141,  142,
			  105,  141,  142,   73,  141,  142,   80,  141,  142,    3,
			  141,  142,    3,  141,  142,    3,  141,  142,  122,  141,
			  142,  122,  141,  142,    3,  141,  142,    3,  141,  142,
			    3,  141,  142,    3,  141,  142,   72,  141,  142,   72,
			  141,  142,   72,  141,  142,   72,  141,  142,   72,  141,
			  142,   72,  141,  142,   72,  141,  142,   72,  141,  142,
			   72,  141,  142,   72,  141,  142,   72,  141,  142,   72,
			  141,  142,   72,  141,  142,   72,  141,  142,   72,  141,

			  142,   72,  141,  142,   72,  141,  142,   72,  141,  142,
			  141,  142,  141,  142,  141,  142,  112,  142,  116,  142,
			  113,  142,  115,  142,  121,  142,  121,  142,  120,  142,
			  119,  121,  142,  118,  142,  118,  142,  117,  142,   84,
			  142,   84,  142,   83,  142,   89,  142,   89,  142,   88,
			  142,   89,  142,   86,  142,   89,  142,   92,  142,   91,
			  142,   92,  142,   95,  142,   95,  142,   94,  142,  100,
			  142,  100,  142,   99,  142,  100,  142,   97,  142,  100,
			  142,  103,  142,  102,  142,  103,  142,    2,  105,   81,
			  104,  105, -235,  105, -224,   73,   80,   80,   79,   80, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    2,    4,  137,  140,  122,  125,   72,   72,   72,   72,
			    9,   72,   72,   72,   72,   72,   72,   72,   72,   18,
			   72,   72,   72,   72,   72,   72,   72,   30,   72,   72,
			   72,   37,   72,   72,   72,   72,   72,   72,   72,   45,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,  124,  112,  113,  114,  114,  106,  114,  112,
			  114,  110,  114,  111,  114,  120,  119,  117,   83,   89,
			   88,   89,   86,   89,   89,   89,   87,   88,   89,   85,
			   86,   92,   91,   92,   90,   91,   94,  100,   99,  100,
			   97,  100,  100,  100,   98,   99,  100,   96,   97,  103,

			  102,  103,  101,  102,  105,  105,  -93,  105,  -82,   74,
			   80,   78,   80,    2,  135,  137,  140,  135,  132,  129,
			  126,  123,   72,   72,    7,   72,    8,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   21,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   41,   72,   72,   43,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   65,   72,    1,  107,  106,  107,  109,  104,   75,   77,
			  137,  140,  140,  136,  139,  134,  133,  131,  130,  128, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			  127,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   19,   72,   72,   72,   72,   72,
			   72,   72,   28,   72,   72,   72,   72,   72,   72,   72,
			   72,   38,   72,   72,   40,   72,   70,   72,   72,   44,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   57,   72,   58,   72,   72,   72,   72,
			   72,   63,   72,   64,   72,  108,  112,   80,  136,  137,
			  139,  140,  140,  132,  129,  126,  138,  140,  138,    5,
			   72,    6,   72,   72,   72,   72,   11,   72,   66,   72,
			   72,   72,   72,   16,   72,   72,   72,   72,   72,   72,

			   72,   72,   26,   72,   72,   72,   72,   72,   33,   72,
			   72,   72,   72,   39,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   53,   72,   72,   72,   56,   72,
			   72,   72,   61,   72,   72,   76,  140,  140,  139,  139,
			   10,   72,   72,   72,   72,   13,   72,   72,   72,   72,
			   72,   20,   72,   22,   72,   72,   24,   72,   72,   72,
			   29,   72,   72,   72,   72,   72,   72,   72,   72,   47,
			   72,   72,   72,   49,   72,   72,   51,   72,   52,   72,
			   54,   72,   72,   72,   60,   72,   72,  139,  140,  139,
			  140,   72,   72,   12,   72,   72,   15,   72,   72,   72, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   72,   72,   27,   72,   31,   72,   72,   34,   72,   35,
			   72,   72,   72,   72,   72,   72,   50,   72,   72,   72,
			   62,   72,   67,   72,   72,   14,   72,   17,   72,   72,
			   23,   72,   25,   72,   32,   72,   72,   42,   72,   72,
			   48,   72,   72,   55,   72,   59,   72,   68,   72,   72,
			   36,   72,   46,   72,   71,   72,   69,   72, yy_Dummy>>,
			1, 58, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1799
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 510
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 511
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

	yyNb_rules: INTEGER = 142
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 143
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
