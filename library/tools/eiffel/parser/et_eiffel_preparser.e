indexing

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PREPARSER

inherit

	ET_EIFFEL_PREPARSER_SKELETON

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
if yy_act <= 66 then
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
yy_set_line_column
--|#line 32 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 32")
end

			
else
	yy_column := yy_column + 1
--|#line 33 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 33")
end

			
end
else
	yy_column := yy_column + 2
--|#line 34 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 34")
end

			
end
else
if yy_act = 4 then
	yy_column := yy_column + 5
--|#line 39 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 39")
end

			
else
	yy_column := yy_column + 5
--|#line 40 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 40")
end

			
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
	yy_column := yy_column + 3
--|#line 41 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 41")
end

			
else
	yy_column := yy_column + 3
--|#line 42 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 42")
end

			
end
else
if yy_act = 8 then
	yy_column := yy_column + 2
--|#line 43 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 43")
end

			
else
	yy_column := yy_column + 6
--|#line 44 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 44")
end

			
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
	yy_column := yy_column + 5
--|#line 45 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 45")
end

			
else
	yy_column := yy_column + 7
--|#line 46 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 46")
end

			
end
else
if yy_act = 12 then
	yy_column := yy_column + 6
--|#line 47 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 47")
end

			
else
	yy_column := yy_column + 8
--|#line 48 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 48")
end

			
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
	yy_column := yy_column + 7
--|#line 49 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 49")
end

			
else
	yy_column := yy_column + 5
--|#line 50 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 50")
end

			
end
else
if yy_act = 16 then
	yy_column := yy_column + 8
--|#line 51 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 51")
end

			
else
	yy_column := yy_column + 2
--|#line 52 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 52")
end

			
end
end
end
end
else
if yy_act <= 25 then
if yy_act <= 21 then
if yy_act <= 19 then
if yy_act = 18 then
	yy_column := yy_column + 4
--|#line 53 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 53")
end

			
else
	yy_column := yy_column + 6
--|#line 54 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 54")
end

			
end
else
if yy_act = 20 then
	yy_column := yy_column + 3
--|#line 55 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 55")
end

			
else
	yy_column := yy_column + 6
--|#line 56 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 56")
end

			
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
	yy_column := yy_column + 8
--|#line 57 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 57")
end

			
else
	yy_column := yy_column + 6
--|#line 58 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 58")
end

			
end
else
if yy_act = 24 then
	yy_column := yy_column + 8
--|#line 59 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 59")
end

			
else
	yy_column := yy_column + 5
--|#line 60 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 60")
end

			
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
	yy_column := yy_column + 7
--|#line 61 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 61")
end

			
else
	yy_column := yy_column + 4
--|#line 62 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 62")
end

			
end
else
if yy_act = 28 then
	yy_column := yy_column + 6
--|#line 63 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 63")
end

			
else
	yy_column := yy_column + 2
--|#line 64 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 64")
end

			
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
	yy_column := yy_column + 7
--|#line 65 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 65")
end

			
else
	yy_column := yy_column + 8
--|#line 66 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 66")
end

			
end
else
if yy_act = 32 then
	yy_column := yy_column + 5
--|#line 67 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 67")
end

			
else
	yy_column := yy_column + 7
--|#line 68 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 68")
end

			
end
end
end
end
end
else
if yy_act <= 50 then
if yy_act <= 42 then
if yy_act <= 38 then
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
	yy_column := yy_column + 7
--|#line 69 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 69")
end

			
else
	yy_column := yy_column + 9
--|#line 70 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 70")
end

			
end
else
	yy_column := yy_column + 2
--|#line 71 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 71")
end

			
end
else
if yy_act = 37 then
	yy_column := yy_column + 4
--|#line 72 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 72")
end

			
else
	yy_column := yy_column + 5
--|#line 73 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 73")
end

			
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
	yy_column := yy_column + 4
--|#line 74 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 74")
end

			
else
	yy_column := yy_column + 3
--|#line 75 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 75")
end

			
end
else
if yy_act = 41 then
	yy_column := yy_column + 8
--|#line 76 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 76")
end

			
else
	yy_column := yy_column + 3
--|#line 77 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 77")
end

			
end
end
end
else
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
	yy_column := yy_column + 4
--|#line 78 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 78")
end

			
else
	yy_column := yy_column + 2
--|#line 79 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 79")
end

			
end
else
if yy_act = 45 then
	yy_column := yy_column + 9
--|#line 80 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 80")
end

			
else
	yy_column := yy_column + 6
--|#line 81 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 81")
end

			
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
	yy_column := yy_column + 8
--|#line 82 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 82")
end

			
else
	yy_column := yy_column + 6
--|#line 83 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 83")
end

			
end
else
if yy_act = 49 then
	yy_column := yy_column + 7
--|#line 84 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 84")
end

			
else
	yy_column := yy_column + 6
--|#line 85 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 85")
end

			
end
end
end
end
else
if yy_act <= 58 then
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
	yy_column := yy_column + 6
--|#line 86 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 86")
end

			
else
	yy_column := yy_column + 5
--|#line 87 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 87")
end

			
end
else
if yy_act = 53 then
	yy_column := yy_column + 6
--|#line 88 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 88")
end

			
else
	yy_column := yy_column + 8
--|#line 89 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 89")
end

			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
	yy_column := yy_column + 5
--|#line 90 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 90")
end

			
else
	yy_column := yy_column + 4
--|#line 91 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 91")
end

			
end
else
if yy_act = 57 then
	yy_column := yy_column + 4
--|#line 92 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 92")
end

			
else
	yy_column := yy_column + 8
--|#line 93 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 93")
end

			
end
end
end
else
if yy_act <= 62 then
if yy_act <= 60 then
if yy_act = 59 then
	yy_column := yy_column + 6
--|#line 94 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 94")
end

			
else
	yy_column := yy_column + 5
--|#line 95 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 95")
end

			
end
else
if yy_act = 61 then
	yy_column := yy_column + 7
--|#line 96 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 96")
end

			
else
	yy_column := yy_column + 4
--|#line 97 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 97")
end

			
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
	yy_column := yy_column + 4
--|#line 98 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 98")
end

			
else
	yy_column := yy_column + 3
--|#line 99 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 99")
end

			
end
else
if yy_act = 65 then
	yy_column := yy_column + 5
--|#line 101 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 101")
end

				class_keyword_found := True
			
else
	yy_column := yy_column + 9
--|#line 104 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 104")
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
			
end
end
end
end
end
end
else
if yy_act <= 99 then
if yy_act <= 83 then
if yy_act <= 75 then
if yy_act <= 71 then
if yy_act <= 69 then
if yy_act <= 68 then
if yy_act = 67 then
	yy_column := yy_column + 9
--|#line 116 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 116")
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
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 132 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 132")
end

				if class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := text_count
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 146 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 146")
end

			
end
else
if yy_act = 70 then
	yy_column := yy_column + 3
--|#line 155 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 155")
end

			
else
	yy_column := yy_column + 4
--|#line 156 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 156")
end

			
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 157 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 157")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 160 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 160")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
end
else
if yy_act = 74 then
	yy_column := yy_column + 3
--|#line 169 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 169")
end

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				column := column - 3
				last_token := E_CHARERR
			
else
	yy_column := yy_column + 2
--|#line 178 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 178")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				column := column - 1
				last_token := E_CHARERR
			
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 186 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 186")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 199 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 199")
end

			
end
else
if yy_act = 78 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 202 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 202")
end

					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 210 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 210")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
	yy_column := yy_column + 1
--|#line 215 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 215")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 231 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 231")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
end
else
if yy_act = 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 240 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 240")
end

				more
				set_start_condition (VS3)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 244 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 244")
end

				more
				last_literal_end := text_count - 2
			
end
end
end
end
else
if yy_act <= 91 then
if yy_act <= 87 then
if yy_act <= 85 then
if yy_act = 84 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 248 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 248")
end

				more
				last_literal_end := text_count - 1
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 252 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 252")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
else
if yy_act = 86 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 268 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 268")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 273 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 273")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 278 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 278")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 292 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 292")
end

					-- Left aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			
end
else
if yy_act = 90 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 300 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 300")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
else
	yy_column := yy_column + 1
--|#line 305 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 305")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 321 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 321")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 330 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 330")
end

				more
				set_start_condition (LAVS3)
			
end
else
if yy_act = 94 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 334 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 334")
end

				more
				last_literal_end := text_count - 2
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 338 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 338")
end

				more
				last_literal_end := text_count - 1
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 342 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 342")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 358 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 358")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
end
else
if yy_act = 98 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 363 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 363")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 368 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 368")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
end
end
end
end
else
if yy_act <= 115 then
if yy_act <= 107 then
if yy_act <= 103 then
if yy_act <= 101 then
if yy_act = 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 382 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 382")
end

					-- Manifest string with special characters.
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 385 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 385")
end

					-- Manifest string with special characters which may be made
					-- up of several lines or may include invalid characters.
					-- Keep track of current line and column.
				ms_line := line
				ms_column := column
				more
				set_start_condition (MS)
			
end
else
if yy_act = 102 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 396 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 396")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
else
	yy_end := yy_start + yy_more_len + 2
	yy_column := yy_column + 2
--|#line 401 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 401")
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
			
end
end
else
if yy_act <= 105 then
if yy_act = 104 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 416 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 416")
end

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 419 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 419")
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
			
end
else
if yy_act = 106 then
	yy_column := yy_column + 2
--|#line 431 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 431")
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
			
else
	yy_column := yy_column + 2
--|#line 443 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 443")
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
			
end
end
end
else
if yy_act <= 111 then
if yy_act <= 109 then
if yy_act = 108 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 456 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 456")
end

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 459 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 459")
end

				set_start_condition (INITIAL)
			
end
else
if yy_act = 110 then
	yy_column := yy_column + 2
--|#line 462 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 462")
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
			
else
	yy_column := yy_column + 1
--|#line 474 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 474")
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
			
end
end
else
if yy_act <= 113 then
if yy_act = 112 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 487 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 487")
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
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 515 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 515")
end

				more
				set_start_condition (MSN)
			
end
else
if yy_act = 114 then
	yy_column := yy_column + 1
--|#line 519 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 519")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 534 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 534")
end

				more
				set_start_condition (MS)
			
end
end
end
end
else
if yy_act <= 123 then
if yy_act <= 119 then
if yy_act <= 117 then
if yy_act = 116 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 538 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 538")
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
			
else
	yy_column := yy_column + 1
--|#line 550 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 550")
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
			
end
else
if yy_act = 118 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 581 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 581")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 587 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 587")
end

			
end
end
else
if yy_act <= 121 then
if yy_act = 120 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 589 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 589")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 591 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 591")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)

				last_token := E_INTERR
			
end
else
if yy_act = 122 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 599 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 599")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)

				last_token := E_INTERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 607 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 607")
end

			
end
end
end
else
if yy_act <= 127 then
if yy_act <= 125 then
if yy_act = 124 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 613 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 613")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 614 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 614")
end

			
end
else
if yy_act = 126 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 615 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 615")
end

			
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 617 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 617")
end

			
end
end
else
if yy_act <= 129 then
if yy_act = 128 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 618 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 618")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 619 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 619")
end

			
end
else
if yy_act = 130 then
	yy_column := yy_column + 1
--|#line 629 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 629")
end

				last_token := E_UNKNOWN
			
else
yy_set_line_column
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
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
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 0 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end
terminate
when 1 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
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
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
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
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 4 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 5 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 6 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 7 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 8 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
when 9 then
--|#line 0 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 0")
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

	yy_nxt_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1774)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,   22,   23,   24,   23,   25,   26,   27,   22,   28,
			   25,   25,   29,   30,   31,   32,   33,   34,   35,   36,
			   25,   37,   38,   39,   40,   41,   42,   43,   44,   40,
			   40,   45,   40,   40,   46,   40,   47,   48,   49,   40,
			   50,   51,   52,   53,   54,   55,   56,   40,   40,   25,
			   57,   25,   58,   39,   40,   41,   42,   44,   40,   46,
			   47,   40,   50,   51,   52,   53,   54,   25,   25,   25,
			   60,   60,  224,   61,   61,   62,   62,   64,   65,   64,
			   64,   65,   64,   66,   80,   81,   66,   68,   69,   68,
			   68,   69,   68,   71,   72,   71,   71,   72,   71,   74,

			   75,   76,  224,   77,   74,   75,   76,  311,   77,   80,
			   81,   83,   84,   83,   83,   84,   83,   86,   87,   88,
			  312,   89,   86,   87,   88,  482,   89,   92,   93,   92,
			   93,   94,   94,   94,   94,   94,   94,   97,  105,   98,
			  150,   95,  103,  104,   95,  106,  106,  106,  107,  107,
			  107,  106,  108,  137,  109,  109,  110,  144,  108,  138,
			  109,  109,  110,  111,  150,   78,   90,  106,  106,  111,
			   78,   90,  108,  125,  110,  110,  110,  106,  106,  144,
			   99,  479,  115,  126,  127,  112,  128,  116,  146,  117,
			  158,  113,  159,  111,  118,  119,  129,  113,  100,  111,

			  106,  153,  130,  147,  175,  176,  131,  177,  478,  127,
			  128,  113,  116,  117,  120,  133,  118,  119,  121,  132,
			  148,  122,  134,  135,  123,  147,  151,  124,  136,  153,
			  149,  477,  130,  155,  155,  155,  170,  171,  170,  475,
			  152,  132,  120,  121,  133,  140,  123,  135,  148,  124,
			  136,  474,  149,  185,  186,  141,  151,  142,  167,  168,
			  167,  143,  187,  186,  169,  172,  173,  172,  175,  182,
			  156,  183,  158,  174,  159,  140,  188,  189,  188,  473,
			  141,  142,  471,  143,  160,  161,  162,  163,  160,  164,
			  160,  164,  164,  164,  160,  160,  160,  165,  160,  160,

			  160,  160,  164,  160,  164,  160,  164,  164,  164,  164,
			  160,  164,  160,  164,  160,  160,  160,  164,  160,  164,
			  160,  160,  164,  164,  164,  164,  164,  164,  160,  160,
			  160,  160,  160,  160,  160,  160,  166,  166,  166,  166,
			  166,  166,  166,  166,  166,  166,  166,  166,  166,  166,
			  160,  160,  160,  178,  175,  179,   94,  177,  178,  181,
			  179,  462,  177,  191,  192,  213,  193,  194,  191,  195,
			  239,  193,  194,  197,  195,  452,  193,  191,  198,   97,
			  199,   98,  190,  201,  202,  203,  202,   94,   94,   94,
			  206,  207,  206,  313,   97,  239,   98,   95,  208,  209,

			  208,  450,   97,  228,   98,  107,  107,  107,  217,  217,
			  217,  108,  449,  110,  110,  110,  196,  214,  313,  180,
			  218,  196,   99,  108,  180,  109,  109,  110,  220,  220,
			  220,  225,  222,  228,  111,  223,  226,   99,  447,  231,
			  100,  235,  215,  229,  232,   99,  234,  237,  233,  240,
			  113,  238,  440,  225,  251,  100,  236,  249,  226,  252,
			  223,  231,  113,  100,  111,  113,  253,  229,  234,  250,
			  254,  235,  264,  238,  232,  266,  251,  233,  236,  240,
			  243,  252,  244,  270,  245,  273,  267,  249,  262,  185,
			  186,  268,  263,  386,  264,  246,  253,  266,  247,  158,

			  254,  159,  269,  175,  176,  270,  177,  273,  187,  186,
			  243,  244,  245,  262,  201,  202,  267,  246,  203,  202,
			  247,  256,  386,  257,  269,  155,  155,  155,  155,  155,
			  155,  258,  181,  176,  259,  177,  260,  261,  276,  277,
			  276,  276,  278,  276,  279,  279,  279,  167,  168,  167,
			  382,  256,  257,  169,  439,  258,  259,  435,  260,  261,
			  191,  192,  274,  193,  433,  156,  170,  171,  170,  172,
			  173,  172,  178,  175,  179,  382,  177,  178,  181,  179,
			  293,  177,  175,  182,  280,  183,   98,  174,  181,  182,
			   94,  183,  396,  174,  188,  189,  188,  197,  192,  213,

			  193,  194,  191,  195,  293,  193,  194,  197,  195,  296,
			  193,  191,  198,  432,  199,  294,  190,  197,  198,  297,
			  199,  396,  190,  281,  281,  281,  206,  207,  206,  298,
			   97,  296,   98,  208,  209,  208,  431,   97,  180,   98,
			  282,  430,  300,  180,  428,  294,  283,  283,  283,  297,
			  196,  298,  284,  284,  299,  196,  285,  285,  285,  286,
			  286,  286,  217,  217,  217,  289,  289,  301,  302,  290,
			  290,  290,  300,   99,  287,  291,  299,  220,  220,  220,
			   99,  305,  309,  306,  310,  318,  320,  328,  329,  301,
			  302,  100,  324,  330,  336,  325,  215,  307,  100,  288,

			  334,  342,  343,  305,  309,  332,  310,  339,  370,  427,
			  329,  331,  425,  306,  292,  318,  320,  328,  336,  344,
			  344,  344,  324,  330,  325,  393,  343,  332,  424,  339,
			  334,  342,  370,  331,  345,  345,  345,  276,  277,  276,
			  346,  279,  279,  279,  204,  281,  281,  281,  347,  283,
			  283,  283,  285,  285,  285,  393,  274,  285,  285,  285,
			  286,  286,  286,  350,  350,  423,  417,  351,  351,  351,
			  357,  358,  349,  352,  352,  352,  290,  290,  290,  290,
			  290,  290,  362,  355,  355,  355,  220,  220,  220,  364,
			  367,  369,  357,  358,  348,  356,  371,  215,  372,  374,

			  379,  383,  381,  384,  362,  387,  390,  391,  394,  397,
			  288,  364,  367,  369,  398,  399,  353,  158,  371,  159,
			  372,  374,  379,  292,  381,  384,  383,  387,  390,  400,
			  394,  397,  391,  344,  344,  344,  401,  401,  401,  398,
			  157,  345,  345,  345,  409,  399,  402,  402,  414,  395,
			  403,  403,  403,  351,  351,  351,  351,  351,  351,  352,
			  352,  352,  406,  406,  406,  355,  355,  355,  409,  411,
			  274,  405,  414,  348,  407,  407,  410,  405,  408,  408,
			  408,  412,  415,  416,  418,  413,  419,  420,  421,  422,
			  426,  411,  392,  404,  429,  434,  288,  436,  438,  353,

			  437,  441,  288,  389,  415,  445,  410,  388,  419,  385,
			  421,  420,  416,  422,  418,  380,  429,  434,  378,  436,
			  426,  446,  437,  377,  376,  441,  375,  445,  438,  401,
			  401,  401,  403,  403,  403,  403,  403,  403,  442,  442,
			  442,  443,  443,  446,  451,  444,  444,  444,  406,  406,
			  406,  408,  408,  408,  408,  408,  408,  448,  453,  454,
			  455,  373,  456,  457,  458,  459,  348,  463,  460,  368,
			  461,  464,  348,  467,  451,  404,  465,  366,  468,  448,
			  453,  469,  455,  454,  456,  353,  458,  459,  466,  463,
			  470,  353,  460,  457,  461,  464,  472,  467,  465,  442, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  442,  442,  444,  444,  444,  444,  444,  444,  468,  476,
			  466,  469,  480,  481,  365,  470,  363,  219,  219,  361,
			  472,  219,  219,  219,  360,  359,  341,  340,  338,  337,
			  335,  333,  327,  326,  480,  481,  404,  323,  322,  476,
			  321,  319,  404,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   67,   67,   67,   67,   67,   67,   67,

			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   82,   82,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   96,   96,
			  317,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,  101,  316,  315,  314,  308,  304,  101,

			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  102,  102,
			  303,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  114,  114,  295,  282,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  157,
			  157,  275,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,

			  174,  174,  174,  174,  174,  174,  174,  174,  174,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,

			  196,  196,  196,  196,  196,  196,  196,  196,  196,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  204,  204,  204,  204,  272,  271,
			  265,  204,  204,  204,  204,  204,  255,  204,  204,  204,
			  204,  204,  211,  211,  248,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  105,  105,  216,  216,  216,  216,  216,  216,  216,  216,
			  242,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  157,  157,  157,
			  157,  241,  230,  227,  157,  157,  157,  157,  157,  221,
			  157,  157,  157,  157,  157,  204,  204,  210,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  354,  354,  354,  354,  354,  354,  354,  354,  212,  354,
			  354,  354,  354,  354,  354,  354,  354,  354,  354,  354,
			  354,  354,  354,  354,  354,  210,  205,  105,  106,  154,

			  145,  139,  106,  106,  483,   21,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483, yy_Dummy>>,
			1, 775, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1774)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    4,  117,    3,    4,    3,    4,    5,    5,    5,
			    6,    6,    6,    5,   13,   13,    6,    7,    7,    7,
			    8,    8,    8,    9,    9,    9,   10,   10,   10,   11,

			   11,   11,  117,   11,   12,   12,   12,  241,   12,   14,
			   14,   15,   15,   15,   16,   16,   16,   17,   17,   17,
			  241,   17,   18,   18,   18,  476,   18,   19,   19,   20,
			   20,   23,   23,   23,   24,   24,   24,   26,   29,   26,
			   53,   23,   28,   28,   24,   31,   30,   29,   30,   30,
			   30,   31,   32,   46,   32,   32,   32,   49,   33,   46,
			   33,   33,   33,   32,   53,   11,   17,   36,   36,   33,
			   12,   18,   34,   42,   34,   34,   34,   37,   37,   49,
			   26,  466,   39,   42,   43,   32,   43,   39,   51,   39,
			   59,   32,   59,   32,   39,   39,   43,   33,   26,   33,

			   31,   55,   44,   51,   73,   73,   44,   73,  464,   43,
			   43,   34,   39,   39,   41,   45,   39,   39,   41,   44,
			   52,   41,   45,   45,   41,   51,   54,   41,   45,   55,
			   52,  463,   44,   58,   58,   58,   68,   68,   68,  460,
			   54,   44,   41,   41,   45,   48,   41,   45,   52,   41,
			   45,  459,   52,   79,   79,   48,   54,   48,   64,   64,
			   64,   48,   81,   81,   64,   71,   71,   71,   78,   78,
			   58,   78,  157,   78,  157,   48,   83,   83,   83,  458,
			   48,   48,  454,   48,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,

			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   74,   74,   74,  105,   74,   76,   76,
			   76,  434,   76,   85,   85,  105,   85,   86,   86,   86,
			  130,   86,   88,   88,   88,  421,   88,   90,   90,   96,
			   90,   96,   90,   91,   91,   93,   93,   94,   94,   94,
			   99,   99,   99,  242,   99,  130,   99,   94,  100,  100,

			  100,  418,  100,  121,  100,  107,  107,  107,  108,  108,
			  108,  110,  415,  110,  110,  110,   86,  107,  242,   74,
			  108,   88,   96,  109,   76,  109,  109,  109,  113,  113,
			  113,  118,  116,  121,  109,  116,  119,   99,  413,  124,
			   96,  128,  107,  122,  125,  100,  127,  129,  125,  131,
			  110,  129,  397,  118,  139,   99,  128,  138,  119,  140,
			  116,  124,  109,  100,  109,  113,  141,  122,  127,  138,
			  142,  128,  147,  129,  125,  149,  139,  125,  128,  131,
			  135,  140,  135,  151,  135,  154,  150,  138,  146,  184,
			  184,  150,  146,  326,  147,  135,  141,  149,  135,  164,

			  142,  164,  150,  174,  174,  151,  174,  154,  186,  186,
			  135,  135,  135,  146,  200,  200,  150,  135,  202,  202,
			  135,  145,  326,  145,  150,  155,  155,  155,  156,  156,
			  156,  145,  176,  176,  145,  176,  145,  145,  161,  161,
			  161,  163,  163,  163,  165,  165,  165,  167,  167,  167,
			  320,  145,  145,  167,  396,  145,  145,  390,  145,  145,
			  190,  190,  155,  190,  388,  156,  170,  170,  170,  172,
			  172,  172,  178,  178,  178,  320,  178,  179,  179,  179,
			  221,  179,  180,  180,  204,  180,  204,  180,  182,  182,
			  213,  182,  338,  182,  188,  188,  188,  192,  192,  213,

			  192,  194,  194,  194,  221,  194,  195,  195,  195,  226,
			  195,  196,  196,  387,  196,  222,  196,  198,  198,  227,
			  198,  338,  198,  205,  205,  205,  206,  206,  206,  228,
			  206,  226,  206,  208,  208,  208,  386,  208,  178,  208,
			  212,  385,  230,  179,  383,  222,  212,  212,  212,  227,
			  194,  228,  214,  214,  229,  195,  214,  214,  214,  215,
			  215,  215,  217,  217,  217,  218,  218,  231,  232,  218,
			  218,  218,  230,  206,  217,  220,  229,  220,  220,  220,
			  208,  236,  239,  237,  240,  247,  249,  258,  259,  231,
			  232,  206,  255,  260,  265,  255,  215,  237,  208,  217,

			  263,  271,  272,  236,  239,  261,  240,  268,  306,  381,
			  259,  260,  379,  237,  220,  247,  249,  258,  265,  274,
			  274,  274,  255,  260,  255,  333,  272,  261,  377,  268,
			  263,  271,  306,  260,  275,  275,  275,  276,  276,  276,
			  279,  279,  279,  279,  281,  281,  281,  281,  283,  283,
			  283,  283,  284,  284,  284,  333,  274,  285,  285,  285,
			  286,  286,  286,  287,  287,  376,  369,  287,  287,  287,
			  293,  294,  286,  288,  288,  288,  289,  289,  289,  290,
			  290,  290,  298,  291,  291,  291,  292,  292,  292,  300,
			  303,  305,  293,  294,  285,  291,  307,  286,  308,  310,

			  316,  322,  318,  324,  298,  327,  330,  331,  334,  339,
			  288,  300,  303,  305,  340,  341,  290,  346,  307,  346,
			  308,  310,  316,  292,  318,  324,  322,  327,  330,  347,
			  334,  339,  331,  344,  344,  344,  348,  348,  348,  340,
			  345,  345,  345,  345,  359,  341,  349,  349,  365,  335,
			  349,  349,  349,  350,  350,  350,  351,  351,  351,  352,
			  352,  352,  353,  353,  353,  355,  355,  355,  359,  363,
			  344,  352,  365,  348,  356,  356,  360,  355,  356,  356,
			  356,  364,  367,  368,  370,  364,  371,  372,  374,  375,
			  380,  363,  332,  351,  384,  389,  352,  391,  394,  353,

			  393,  399,  355,  329,  367,  410,  360,  328,  371,  325,
			  374,  372,  368,  375,  370,  317,  384,  389,  315,  391,
			  380,  411,  393,  314,  313,  399,  312,  410,  394,  401,
			  401,  401,  402,  402,  402,  403,  403,  403,  404,  404,
			  404,  405,  405,  411,  420,  405,  405,  405,  406,  406,
			  406,  407,  407,  407,  408,  408,  408,  414,  423,  424,
			  425,  309,  426,  427,  428,  429,  401,  438,  431,  304,
			  432,  439,  403,  447,  420,  404,  441,  302,  449,  414,
			  423,  450,  425,  424,  426,  406,  428,  429,  445,  438,
			  451,  408,  431,  427,  432,  439,  457,  447,  441,  442, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  442,  442,  443,  443,  443,  444,  444,  444,  449,  461,
			  445,  450,  472,  474,  301,  451,  299,  508,  508,  297,
			  457,  508,  508,  508,  296,  295,  270,  269,  267,  266,
			  264,  262,  257,  256,  472,  474,  442,  254,  252,  461,
			  250,  248,  444,  484,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,  484,  485,  485,
			  485,  485,  485,  485,  485,  485,  485,  485,  485,  485,
			  485,  485,  485,  485,  485,  485,  485,  485,  485,  485,
			  485,  485,  485,  486,  486,  486,  486,  486,  486,  486,

			  486,  486,  486,  486,  486,  486,  486,  486,  486,  486,
			  486,  486,  486,  486,  486,  486,  486,  486,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  489,  489,
			  489,  489,  489,  489,  489,  489,  489,  489,  489,  489,
			  489,  489,  489,  489,  489,  489,  489,  489,  489,  489,
			  489,  489,  489,  490,  490,  490,  490,  490,  490,  490,

			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  491,  491,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  491,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  493,  493,
			  246,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  493,  494,  245,  244,  243,  238,  234,  494,

			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  495,  495,
			  233,  495,  495,  495,  495,  495,  495,  495,  495,  495,
			  495,  495,  495,  495,  495,  495,  495,  495,  495,  495,
			  495,  495,  495,  496,  496,  225,  211,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  497,
			  497,  159,  497,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  498,  498,  498,  498,  498,  498,
			  498,  498,  498,  498,  498,  498,  498,  498,  498,  498,

			  498,  498,  498,  498,  498,  498,  498,  498,  498,  499,
			  499,  499,  499,  499,  499,  499,  499,  499,  499,  499,
			  499,  499,  499,  499,  499,  499,  499,  499,  499,  499,
			  499,  499,  499,  499,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  502,  502,  502,  502,  502,  502,
			  502,  502,  502,  502,  502,  502,  502,  502,  502,  502,

			  502,  502,  502,  502,  502,  502,  502,  502,  502,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  504,  504,  504,  504,  153,  152,
			  148,  504,  504,  504,  504,  504,  144,  504,  504,  504,
			  504,  504,  505,  505,  137,  505,  505,  505,  505,  505,
			  505,  505,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  505,  505,  505,  505,  506,  506,  506,
			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,
			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,

			  506,  506,  507,  507,  507,  507,  507,  507,  507,  507,
			  134,  507,  507,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  507,  507,  507,  507,  509,  509,  509,
			  509,  132,  123,  120,  509,  509,  509,  509,  509,  115,
			  509,  509,  509,  509,  509,  510,  510,  104,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  511,  511,  511,  511,  511,  511,  511,  511,  103,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  102,   98,   95,   57,   56,

			   50,   47,   38,   35,   21,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483, yy_Dummy>>,
			1, 775, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   67,   68,   75,   78,   85,   88,   91,
			   94,   97,  102,   81,  106,  109,  112,  115,  120,  124,
			  126, 1704, 1705,  129,  132, 1705,  131,    0,  134,  126,
			  133,  131,  139,  145,  159, 1683,  148,  157, 1682,  153,
			    0,  184,  146,  150,  179,  187,  122, 1664,  221,  117,
			 1673,  161,  190,  104,  203,  171, 1662, 1648,  218,  184,
			 1705, 1705,  283, 1705,  256, 1705, 1705, 1705,  234, 1705,
			 1705,  263, 1705,  201,  351, 1705,  356, 1705,  265,  250,
			 1705,  259, 1705,  274, 1705,  360,  365, 1705,  370, 1705,
			  374,  380, 1705,  382,  385, 1685,  373, 1705, 1682,  388,

			  396,    0, 1686, 1664, 1638,  353, 1705,  390,  393,  410,
			  398, 1705,    0,  413,    0, 1612,  401,   46,  390,  394,
			 1606,  380,  407, 1605,  399,  420,    0,  405,  415,  409,
			  336,  426, 1594,    0, 1572,  454,    0, 1521,  432,  412,
			  418,  440,  445,    0, 1519,  495,  454,  432, 1513,  432,
			  460,  443, 1508, 1511,  445,  510,  513,  266, 1705, 1347,
			 1705,  536, 1705,  539,  493,  529, 1705,  545, 1705, 1705,
			  564, 1705,  567, 1705,  500, 1705,  529, 1705,  570,  575,
			  579, 1705,  585, 1705,  486, 1705,  505, 1705,  592, 1705,
			  557, 1705,  594, 1705,  599,  604,  608, 1705,  614, 1705,

			  511, 1705,  515, 1705,  578,  608,  624, 1705,  631, 1705,
			 1705, 1337,  631,  587,  641,  644, 1705,  647,  654,    0,
			  662,  544,  592,    0,    0, 1314,  569,  594,  588,  610,
			  619,  627,  625, 1293, 1271,    0,  638,  660, 1270,  641,
			  642,   72,  359, 1269, 1264, 1267, 1232,  662, 1014,  663,
			 1002,    0, 1001,    0, 1010,  667, 1006, 1005,  664,  645,
			  668,  665, 1004,  677,  999,  658, 1002, 1001,  668,  996,
			  995,  675,  666,    0,  704,  719,  735, 1705, 1705,  726,
			 1705,  730, 1705,  734,  737,  742,  745,  752,  758,  761,
			  764,  768,  771,  728,  730,  996,  993,  986,  741,  989,

			  747,  987,  948,  750,  938,  751,  672,  756,  758,  934,
			  756,    0,  899,  893,  877,  872,  760,  888,  762,    0,
			  516,    0,  767,    0,  760,  878,  465,  765,  872,  872,
			  763,  773,  845,  700,  768,  811,    0,    0,  564,  766,
			  780,  792,    0,    0,  818,  826,  811,  820,  821,  835,
			  838,  841,  844,  847, 1705,  850,  863,    0,    0,  808,
			  852,    0,    0,  829,  854,  812,    0,  842,  855,  739,
			  858,  844,  851,    0,  848,  853,  738,  697,    0,  681,
			  865,  678,    0,  617,  854,  595,  605,  586,  537,  855,
			  530,  855,    0,  858,  875,    0,  523,  425,    0,  865,

			 1705,  914,  917,  920,  923,  930,  933,  936,  939,    0,
			  862,  879,    0,  401,  915,  385,    0,    0,  374,    0,
			  921,  348,    0,  917,  923,  918,  920,  940,  922,  924,
			    0,  932,  934,    0,  334,    0,    0,    0,  925,  935,
			    0,  934,  984,  987,  990,  946,    0,  937,    0,  952,
			  955,  956,    0,    0,  253,    0,    0,  960,  252,  214,
			  212,  984,    0,  204,  181,    0,  154,    0,    0,    0,
			    0,    0,  970,    0,  973,    0,   98,    0,    0,    0,
			    0,    0,    0, 1705, 1042, 1067, 1092, 1117, 1142, 1167,
			 1192, 1217, 1242, 1267, 1292, 1317, 1333, 1358, 1383, 1408,

			 1433, 1458, 1483, 1508, 1529, 1551, 1576, 1601, 1007, 1622,
			 1644, 1669, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  483,    1,  484,  484,  485,  485,  486,  486,  487,
			  487,  488,  488,  489,  489,  490,  490,  491,  491,  492,
			  492,  483,  483,  483,  483,  483,  493,  494,  495,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  483,  483,  497,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  498,  498,  483,  498,  483,  499,  500,
			  483,  500,  483,  483,  483,  501,  501,  483,  501,  483,
			  502,  503,  483,  503,  483,  483,  493,  483,  504,  493,

			  493,  494,  483,  505,  483,  506,  483,  483,  507,  483,
			  483,  483,  508,  483,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  483,  483,  497,  483,  509,
			  483,  483,  483,  483,  497,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  498,  483,  498,  483,  498,  498,
			  499,  483,  499,  483,  500,  483,  500,  483,  483,  483,
			  501,  483,  501,  483,  501,  501,  502,  483,  502,  483,

			  503,  483,  503,  483,  510,  483,  493,  483,  493,  483,
			  483,  483,  483,  506,  483,  483,  483,  483,  483,  508,
			  483,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  511,  483,  496,  496,  496,  496,  496,  496,  496,

			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  483,  483,  497,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,

			  483,  483,  483,  483,  483,  483,  483,  483,  483,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  483,  483,  483,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,    0,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,

			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    5,    6,    7,    5,    8,    7,    9,
			   10,   10,    5,   11,    5,   12,   13,   14,   15,   16,
			   17,   17,   17,   17,   17,   17,   17,   17,   18,    5,
			   19,   20,   21,   22,    7,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   43,   44,   45,   46,   47,
			   48,   49,   50,   51,    5,   52,    1,   53,   54,   55,

			   56,   27,   57,   29,   58,   31,   32,   33,   59,   35,
			   60,   37,   38,   61,   62,   63,   64,   65,   66,   45,
			   46,   47,   48,   67,    7,   68,   69,    1,    1,    1,
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
			    0,    1,    2,    3,    4,    1,    5,    1,    6,    7,
			    8,    1,    1,    9,    7,   10,   10,   11,    1,   12,
			    1,   13,    1,   14,   14,   14,   15,   10,   16,   17,
			   18,   17,   17,   17,   19,   17,   20,   17,   17,   21,
			   21,   21,   21,   21,   22,   17,   17,   17,   23,    1,
			    1,    1,   24,   10,   10,   10,   10,   10,   17,   17,
			   17,   17,   17,   17,   17,   17,   25,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    4,    5,    5,    5,    6,    7,
			    8,    9,   10,   12,   15,   17,   20,   23,   26,   29,
			   32,   35,   38,   41,   44,   47,   50,   53,   56,   59,
			   62,   65,   68,   71,   74,   77,   80,   83,   86,   89,
			   92,   95,   98,  101,  104,  107,  110,  113,  115,  117,
			  119,  121,  123,  125,  127,  129,  131,  134,  136,  138,
			  140,  142,  144,  146,  148,  150,  152,  154,  156,  158,
			  160,  162,  164,  166,  168,  170,  172,  174,  176,  178,
			  180,  182,  184,  186,  188,  189,  189,  190,  192,  192,

			  194,  196,  197,  198,  199,  201,  202,  203,  205,  205,
			  206,  207,  208,  208,  208,  209,  210,  211,  212,  214,
			  215,  216,  217,  218,  219,  220,  221,  223,  224,  225,
			  226,  227,  228,  229,  231,  232,  233,  235,  236,  237,
			  238,  239,  240,  241,  243,  244,  245,  246,  247,  248,
			  249,  250,  251,  252,  253,  254,  254,  254,  255,  256,
			  256,  257,  258,  259,  260,  262,  264,  266,  266,  267,
			  268,  268,  269,  269,  270,  271,  272,  273,  274,  275,
			  276,  277,  279,  280,  282,  283,  284,  285,  287,  287,
			  288,  289,  290,  291,  292,  293,  294,  295,  297,  298,

			  300,  301,  302,  303,  305,  306,  306,  307,  308,  309,
			  310,  311,  312,  314,  315,  315,  315,  316,  318,  319,
			  320,  321,  322,  323,  325,  327,  328,  329,  330,  331,
			  332,  333,  334,  335,  336,  337,  339,  340,  341,  342,
			  343,  344,  345,  346,  347,  348,  349,  350,  351,  352,
			  353,  354,  356,  357,  359,  360,  361,  362,  363,  364,
			  365,  366,  367,  368,  369,  370,  371,  372,  373,  374,
			  375,  376,  377,  378,  380,  380,  380,  380,  381,  383,
			  384,  385,  385,  386,  387,  387,  389,  390,  390,  390,
			  390,  392,  392,  393,  394,  395,  396,  397,  398,  399,

			  400,  401,  402,  403,  404,  406,  407,  408,  409,  410,
			  411,  412,  414,  415,  416,  417,  418,  419,  420,  421,
			  423,  424,  426,  427,  429,  430,  431,  432,  433,  434,
			  435,  436,  437,  438,  439,  440,  441,  443,  445,  446,
			  447,  448,  449,  451,  453,  454,  454,  456,  457,  457,
			  457,  457,  461,  462,  462,  463,  464,  465,  467,  469,
			  470,  471,  473,  475,  476,  477,  478,  480,  481,  482,
			  483,  484,  485,  486,  488,  489,  490,  491,  492,  494,
			  495,  496,  497,  499,  500,  501,  502,  503,  504,  505,
			  506,  507,  508,  510,  511,  512,  514,  515,  516,  518,

			  519,  520,  521,  521,  522,  522,  522,  523,  523,  524,
			  526,  527,  528,  530,  531,  532,  533,  535,  537,  538,
			  540,  541,  542,  544,  545,  546,  547,  548,  549,  550,
			  551,  553,  554,  555,  557,  558,  560,  562,  564,  565,
			  566,  568,  569,  571,  571,  573,  574,  576,  577,  579,
			  580,  581,  582,  584,  586,  587,  589,  591,  592,  593,
			  594,  595,  596,  598,  599,  600,  602,  603,  605,  607,
			  609,  611,  613,  614,  616,  617,  619,  620,  622,  624,
			  626,  628,  630,  632,  632, yy_Dummy>>)
		end

	yy_acclist_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   85,   85,   88,   88,   96,   96,   99,   99,  132,
			  130,  131,    1,  130,  131,    1,  131,    2,  130,  131,
			  101,  130,  131,   69,  130,  131,   76,  130,  131,    2,
			  130,  131,    2,  130,  131,    2,  130,  131,  119,  130,
			  131,  119,  130,  131,  119,  130,  131,    2,  130,  131,
			    2,  130,  131,    2,  130,  131,    2,  130,  131,   68,
			  130,  131,   68,  130,  131,   68,  130,  131,   68,  130,
			  131,   68,  130,  131,   68,  130,  131,   68,  130,  131,
			   68,  130,  131,   68,  130,  131,   68,  130,  131,   68,
			  130,  131,   68,  130,  131,   68,  130,  131,   68,  130,

			  131,   68,  130,  131,   68,  130,  131,   68,  130,  131,
			   68,  130,  131,  130,  131,  130,  131,  108,  131,  112,
			  131,  109,  131,  111,  131,  117,  131,  117,  131,  116,
			  131,  115,  117,  131,  114,  131,  114,  131,  113,  131,
			   80,  131,   80,  131,   79,  131,   85,  131,   85,  131,
			   84,  131,   85,  131,   82,  131,   85,  131,   88,  131,
			   87,  131,   88,  131,   91,  131,   91,  131,   90,  131,
			   96,  131,   96,  131,   95,  131,   96,  131,   93,  131,
			   96,  131,   99,  131,   98,  131,   99,  131,    1,  101,
			   77,  100,  101, -220,  101, -209,   69,   76,   76,   75,

			   76,    1,    3,  126,  129,  119,  119,  118,   68,   68,
			   68,   68,    8,   68,   68,   68,   68,   68,   68,   68,
			   68,   17,   68,   68,   68,   68,   68,   68,   68,   29,
			   68,   68,   68,   36,   68,   68,   68,   68,   68,   68,
			   68,   44,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,  108,  109,  110,  110,  102,  110,
			  108,  110,  106,  110,  107,  110,  116,  115,  113,   79,
			   85,   84,   85,   82,   85,   85,   85,   83,   84,   85,
			   81,   82,   88,   87,   88,   86,   87,   90,   96,   95,
			   96,   93,   96,   96,   96,   94,   95,   96,   92,   93,

			   99,   98,   99,   97,   98,  101,  101,  -89,  101,  -78,
			   70,   76,   74,   76,    1,  124,  126,  129,  124,  123,
			  120,   68,   68,    6,   68,    7,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   20,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   40,   68,   68,   42,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   64,   68,
			  103,  102,  103,  105,  100,   71,   73,  126,  129,  129,
			  125,  128,  122,   68,   68,   68,   68,   68,   68,   68,

			   68,   68,   68,   68,   18,   68,   68,   68,   68,   68,
			   68,   68,   27,   68,   68,   68,   68,   68,   68,   68,
			   68,   37,   68,   68,   39,   68,   68,   43,   68,   68,
			   68,   68,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   56,   68,   57,   68,   68,   68,   68,   68,   62,
			   68,   63,   68,  121,  104,  108,   76,  125,  126,  128,
			  129,  129,  127,  129,  127,    4,   68,    5,   68,   68,
			   68,   10,   68,   65,   68,   68,   68,   68,   15,   68,
			   68,   68,   68,   68,   68,   68,   25,   68,   68,   68,
			   68,   68,   32,   68,   68,   68,   68,   38,   68,   68,

			   68,   68,   68,   68,   68,   68,   68,   68,   52,   68,
			   68,   68,   55,   68,   68,   68,   60,   68,   68,   72,
			  129,  129,  128,  128,    9,   68,   68,   68,   12,   68,
			   68,   68,   68,   19,   68,   21,   68,   68,   23,   68,
			   68,   68,   28,   68,   68,   68,   68,   68,   68,   68,
			   68,   46,   68,   68,   68,   48,   68,   68,   50,   68,
			   51,   68,   53,   68,   68,   68,   59,   68,   68,  128,
			  129,  128,  129,   68,   11,   68,   68,   14,   68,   68,
			   68,   68,   26,   68,   30,   68,   68,   33,   68,   34,
			   68,   68,   68,   68,   68,   68,   49,   68,   68,   68,

			   61,   68,   68,   13,   68,   16,   68,   22,   68,   24,
			   68,   31,   68,   68,   41,   68,   68,   47,   68,   68,
			   54,   68,   58,   68,   66,   68,   35,   68,   45,   68,
			   67,   68, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1705
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 483
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 484
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

	yyNb_rules: INTEGER is 131
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 132
			-- End of buffer rule code

	yyLine_used: BOOLEAN is true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	MS: INTEGER is 1
	MSN: INTEGER is 2
	MSN1: INTEGER is 3
	VS1: INTEGER is 4
	VS2: INTEGER is 5
	VS3: INTEGER is 6
	LAVS1: INTEGER is 7
	LAVS2: INTEGER is 8
	LAVS3: INTEGER is 9
			-- Start condition codes

feature -- User-defined features



end
