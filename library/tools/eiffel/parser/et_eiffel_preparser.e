indexing

	description:

		"Eiffel preparsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_EIFFEL_PREPARSER

inherit

	ET_EIFFEL_PREPARSER_SKELETON

create

	make, make_with_factory

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
	yy_column := yy_column + 5
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
	yy_column := yy_column + 8
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
	yy_column := yy_column + 5
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
	yy_column := yy_column + 2
--|#line 49 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 49")
end

			
else
	yy_column := yy_column + 4
--|#line 50 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 50")
end

			
end
else
if yy_act = 16 then
	yy_column := yy_column + 6
--|#line 51 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 51")
end

			
else
	yy_column := yy_column + 3
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
	yy_column := yy_column + 6
--|#line 53 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 53")
end

			
else
	yy_column := yy_column + 8
--|#line 54 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 54")
end

			
end
else
if yy_act = 20 then
	yy_column := yy_column + 6
--|#line 55 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 55")
end

			
else
	yy_column := yy_column + 8
--|#line 56 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 56")
end

			
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
	yy_column := yy_column + 5
--|#line 57 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 57")
end

			
else
	yy_column := yy_column + 7
--|#line 58 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 58")
end

			
end
else
if yy_act = 24 then
	yy_column := yy_column + 4
--|#line 59 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 59")
end

			
else
	yy_column := yy_column + 6
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
	yy_column := yy_column + 2
--|#line 61 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 61")
end

			
else
	yy_column := yy_column + 7
--|#line 62 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 62")
end

			
end
else
if yy_act = 28 then
	yy_column := yy_column + 8
--|#line 63 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 63")
end

			
else
	yy_column := yy_column + 5
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
	yy_column := yy_column + 7
--|#line 66 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 66")
end

			
end
else
if yy_act = 32 then
	yy_column := yy_column + 9
--|#line 67 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 67")
end

			
else
	yy_column := yy_column + 2
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
	yy_column := yy_column + 4
--|#line 69 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 69")
end

			
else
	yy_column := yy_column + 5
--|#line 70 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 70")
end

			
end
else
	yy_column := yy_column + 4
--|#line 71 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 71")
end

			
end
else
if yy_act = 37 then
	yy_column := yy_column + 3
--|#line 72 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 72")
end

			
else
	yy_column := yy_column + 8
--|#line 73 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 73")
end

			
end
end
else
if yy_act <= 40 then
if yy_act = 39 then
	yy_column := yy_column + 3
--|#line 74 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 74")
end

			
else
	yy_column := yy_column + 4
--|#line 75 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 75")
end

			
end
else
if yy_act = 41 then
	yy_column := yy_column + 2
--|#line 76 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 76")
end

			
else
	yy_column := yy_column + 9
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
	yy_column := yy_column + 6
--|#line 78 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 78")
end

			
else
	yy_column := yy_column + 8
--|#line 79 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 79")
end

			
end
else
if yy_act = 45 then
	yy_column := yy_column + 6
--|#line 80 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 80")
end

			
else
	yy_column := yy_column + 7
--|#line 81 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 81")
end

			
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
	yy_column := yy_column + 6
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
	yy_column := yy_column + 5
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
	yy_column := yy_column + 8
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
	yy_column := yy_column + 4
--|#line 88 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 88")
end

			
else
	yy_column := yy_column + 4
--|#line 89 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 89")
end

			
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
	yy_column := yy_column + 8
--|#line 90 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 90")
end

			
else
	yy_column := yy_column + 6
--|#line 91 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 91")
end

			
end
else
if yy_act = 57 then
	yy_column := yy_column + 5
--|#line 92 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 92")
end

			
else
	yy_column := yy_column + 7
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
	yy_column := yy_column + 4
--|#line 94 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 94")
end

			
else
	yy_column := yy_column + 3
--|#line 95 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 95")
end

			
end
else
if yy_act = 61 then
	yy_column := yy_column + 5
--|#line 97 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 97")
end

				class_keyword_found := True
			
else
	yy_column := yy_column + 6
--|#line 100 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 100")
end

				if use_assign_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 6
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
end
end
else
if yy_act <= 64 then
if yy_act = 63 then
	yy_column := yy_column + 9
--|#line 112 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 112")
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
			
else
	yy_column := yy_column + 7
--|#line 124 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 124")
end

				if use_convert_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 7
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
end
else
if yy_act = 65 then
	yy_column := yy_column + 6
--|#line 136 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 136")
end

				if use_create_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 6
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
else
	yy_column := yy_column + 6
--|#line 148 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 148")
end

				if use_recast_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 6
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
--|#line 160 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 160")
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
	yy_column := yy_column + 4
--|#line 172 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 172")
end

				if use_void_keyword then
					-- Do nothing.
				elseif class_keyword_found then
					last_token := E_IDENTIFIER
					last_literal_start := 1
					last_literal_end := 4
					last_break_end := 0
					last_comment_end := 0
					last_classname := ast_factory.new_identifier (Current)
				end
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 188 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 188")
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
if yy_act = 70 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 202 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 202")
end

			
else
	yy_column := yy_column + 3
--|#line 211 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 211")
end

			
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
	yy_column := yy_column + 4
--|#line 212 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 212")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 213 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 213")
end

			
end
else
if yy_act = 74 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 216 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 216")
end

					-- Syntax error: missing character / at end
					-- of special character specification %/code/.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCAS_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
else
	yy_column := yy_column + 3
--|#line 225 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 225")
end

					-- Syntax error: missing ASCII code in
					-- special character specification %/code/.
				column := column + 3
				set_syntax_error
				error_handler.report_SCAC_error (filename, current_position)
				column := column - 3
				last_token := E_CHARERR
			
end
end
end
else
if yy_act <= 79 then
if yy_act <= 77 then
if yy_act = 76 then
	yy_column := yy_column + 2
--|#line 234 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 234")
end

					-- Syntax error: missing character between quotes.
				column := column + 1
				set_syntax_error
				error_handler.report_SCQQ_error (filename, current_position)
				column := column - 1
				last_token := E_CHARERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 242 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 242")
end

					-- Syntax error: missing quote at
					-- end of character constant.
				column := column + text_count
				set_syntax_error
				error_handler.report_SCEQ_error (filename, current_position)
				column := column - text_count
				last_token := E_CHARERR
			
end
else
if yy_act = 78 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 255 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 255")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 258 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 258")
end

					-- Verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (VS1)
			
end
end
else
if yy_act <= 81 then
if yy_act = 80 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 266 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 266")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (VS2)
			
else
	yy_column := yy_column + 1
--|#line 271 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 271")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
else
if yy_act = 82 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 287 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 287")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (VS3)
				end
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 296 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 296")
end

				more
				set_start_condition (VS3)
			
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
--|#line 300 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 300")
end

				more
				last_literal_end := text_count - 2
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 304 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 304")
end

				more
				last_literal_end := text_count - 1
			
end
else
if yy_act = 86 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 308 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 308")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 324 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 324")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (VS2)
			
end
end
else
if yy_act <= 89 then
if yy_act = 88 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 329 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 329")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (VS2)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 334 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 334")
end

					-- No final brace-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
else
if yy_act = 90 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 348 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 348")
end

					-- Left aligned verbatim string.
				verbatim_marker := text_substring (2, text_count - 1)
				set_start_condition (LAVS1)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 356 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 356")
end

				last_literal_start := 1
				last_literal_end := 0
				set_start_condition (LAVS2)
			
end
end
end
else
if yy_act <= 95 then
if yy_act <= 93 then
if yy_act = 92 then
	yy_column := yy_column + 1
--|#line 361 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 361")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 377 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 377")
end

				if is_verbatim_string_closer (last_literal_end + 1, text_count - 1) then
					verbatim_marker := Void
					set_start_condition (INITIAL)
				else
					more
					set_start_condition (LAVS3)
				end
			
end
else
if yy_act = 94 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 386 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 386")
end

				more
				set_start_condition (LAVS3)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 390 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 390")
end

				more
				last_literal_end := text_count - 2
			
end
end
else
if yy_act <= 97 then
if yy_act = 96 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 394 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 394")
end

				more
				last_literal_end := text_count - 1
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 398 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 398")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
end
else
if yy_act = 98 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 414 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 414")
end

				more
				last_literal_end := text_count - 2
				set_start_condition (LAVS2)
			
else
	yy_line := yy_line + 1
	yy_column := 1
--|#line 419 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 419")
end

				more
				last_literal_end := text_count - 1
				set_start_condition (LAVS2)
			
end
end
end
end
end
else
if yy_act <= 116 then
if yy_act <= 108 then
if yy_act <= 104 then
if yy_act <= 102 then
if yy_act <= 101 then
if yy_act = 100 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 424 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 424")
end

					-- No final bracket-double-quote.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 438 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 438")
end

					-- Manifest string with special characters.
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 441 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 441")
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
if yy_act = 103 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 452 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 452")
end

					-- Multi-line manifest string.
				more
				set_start_condition (MSN)
			
else
	yy_end := yy_start + yy_more_len + 2
	yy_column := yy_column + 2
--|#line 457 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 457")
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
if yy_act <= 106 then
if yy_act = 105 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 472 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 472")
end

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 475 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 475")
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
if yy_act = 107 then
	yy_column := yy_column + 2
--|#line 487 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 487")
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
--|#line 499 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 499")
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
if yy_act <= 112 then
if yy_act <= 110 then
if yy_act = 109 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 512 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 512")
end

				more
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 515 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 515")
end

				set_start_condition (INITIAL)
			
end
else
if yy_act = 111 then
	yy_column := yy_column + 2
--|#line 518 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 518")
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
--|#line 530 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 530")
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
if yy_act <= 114 then
if yy_act = 113 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 543 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 543")
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
--|#line 571 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 571")
end

				more
				set_start_condition (MSN)
			
end
else
if yy_act = 115 then
	yy_column := yy_column + 1
--|#line 575 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 575")
end

					-- Should never happen.
				last_token := E_STRERR
				report_syntax_error (current_position)
				set_start_condition (INITIAL)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 590 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 590")
end

				more
				set_start_condition (MS)
			
end
end
end
end
else
if yy_act <= 124 then
if yy_act <= 120 then
if yy_act <= 118 then
if yy_act = 117 then
	yy_line := yy_line + 1
	yy_column := 1
--|#line 594 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 594")
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
--|#line 606 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 606")
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
if yy_act = 119 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 637 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 637")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 643 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 643")
end

			
end
end
else
if yy_act <= 122 then
if yy_act = 121 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 645 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 645")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 647 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 647")
end

					-- Syntax error: an underscore may not be
					-- the first character of an integer.
				set_syntax_error
				error_handler.report_SIFU_error (filename, current_position)

				last_token := E_INTERR
			
end
else
if yy_act = 123 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 655 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 655")
end

					-- Syntax error: an underscore may not be
					-- the last character of an integer.
				set_syntax_error
				error_handler.report_SILU_error (filename, current_position)

				last_token := E_INTERR
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 663 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 663")
end

			
end
end
end
else
if yy_act <= 128 then
if yy_act <= 126 then
if yy_act = 125 then
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 669 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 669")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 670 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 670")
end

			
end
else
if yy_act = 127 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 671 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 671")
end

			
else
	yy_end := yy_end - 1
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 673 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 673")
end

			
end
end
else
if yy_act <= 130 then
if yy_act = 129 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 674 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 674")
end

			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 675 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 675")
end

			
end
else
if yy_act = 131 then
	yy_column := yy_column + 1
--|#line 685 "et_eiffel_preparser.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_eiffel_preparser.l' at line 685")
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
			create an_array.make (0, 1778)
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
			   47,   40,   50,   51,   52,   53,   54,   25,   25,   60,
			   60,  224,   61,   61,   62,   62,   64,   65,   64,   64,
			   65,   64,   66,   80,   81,   66,   68,   69,   68,   68,
			   69,   68,   71,   72,   71,   71,   72,   71,   74,   75,

			   76,  224,   77,   74,   75,   76,  312,   77,   80,   81,
			   83,   84,   83,   83,   84,   83,   86,   87,   88,  313,
			   89,   86,   87,   88,  486,   89,   92,   93,   92,   93,
			   94,   94,   94,   94,   94,   94,   97,  105,   98,  150,
			   95,  103,  104,   95,  106,  106,  106,  107,  107,  107,
			  106,  108,  137,  109,  109,  110,  144,  108,  138,  109,
			  109,  110,  111,  150,   78,   90,  106,  106,  111,   78,
			   90,  108,  125,  110,  110,  110,  106,  106,  144,   99,
			  483,  115,  126,  130,  112,  389,  116,  131,  117,  153,
			  113,  399,  111,  118,  119,  120,  113,  100,  111,  121,

			  132,  158,  122,  159,  228,  123,  146,  127,  124,  128,
			  113,  116,  117,  130,  389,  118,  119,  153,  133,  129,
			  399,  147,  132,  120,  121,  134,  135,  123,  140,  148,
			  124,  136,  127,  128,  228,  151,  185,  186,  141,  149,
			  142,  187,  186,  147,  143,  175,  176,  133,  177,  152,
			  135,  201,  202,  136,  155,  155,  155,  148,  140,  191,
			  192,  149,  193,  141,  142,  151,  143,  167,  168,  167,
			  170,  171,  170,  169,  172,  173,  172,  175,  182,   94,
			  183,  482,  174,  188,  189,  188,  203,  202,  213,  185,
			  186,  156,  160,  161,  162,  163,  160,  164,  160,  164,

			  164,  164,  160,  160,  160,  165,  160,  160,  160,  160,
			  164,  160,  164,  160,  164,  164,  164,  164,  160,  164,
			  160,  164,  160,  160,  160,  164,  160,  164,  160,  160,
			  164,  164,  164,  164,  164,  164,  160,  160,  160,  160,
			  160,  160,  160,  160,  166,  166,  166,  166,  166,  166,
			  166,  166,  166,  166,  166,  166,  166,  166,  160,  160,
			  178,  175,  179,  481,  177,  178,  181,  179,  229,  177,
			  194,  191,  195,  419,  193,  194,  197,  195,  225,  193,
			  191,  198,   97,  199,   98,  190,   94,   94,   94,  206,
			  207,  206,  229,   97,  479,   98,   95,  208,  209,  208,

			  225,   97,  419,   98,  107,  107,  107,  478,  217,  217,
			  217,  108,  239,  109,  109,  110,  214,  226,  222,  196,
			  218,  223,  111,  231,  196,   99,  180,  220,  220,  220,
			  108,  180,  110,  110,  110,  234,   99,  239,  232,  226,
			  235,  215,  233,  100,   99,  231,  223,  237,  240,  477,
			  113,  238,  111,  251,  100,  236,  253,  234,  252,  254,
			  249,  243,  100,  244,  113,  245,  265,  475,  232,  113,
			  235,  233,  250,  238,  267,  251,  246,  236,  240,  247,
			  252,  263,  271,  187,  186,  264,  253,  466,  265,  254,
			  249,  243,  244,  245,  456,  274,  267,  158,  246,  159,

			  454,  247,  256,  257,  271,  258,  263,  201,  202,  268,
			  277,  278,  277,  259,  269,  453,  260,  274,  261,  262,
			  155,  155,  155,  203,  202,  270,  155,  155,  155,  277,
			  279,  277,  256,  257,  258,  451,  444,  259,  260,  268,
			  261,  262,  158,  281,  159,   98,   94,  270,  280,  280,
			  280,  297,  167,  168,  167,  213,  299,  275,  169,  170,
			  171,  170,  314,  156,  172,  173,  172,  175,  176,  294,
			  177,  181,  176,  297,  177,  178,  175,  179,  299,  177,
			  178,  181,  179,  443,  177,  175,  182,  314,  183,  300,
			  174,  181,  182,  294,  183,  384,  174,  188,  189,  188,

			  191,  192,  338,  193,  197,  192,  295,  193,  194,  191,
			  195,  300,  193,  194,  197,  195,  302,  193,  191,  198,
			  384,  199,  439,  190,  197,  198,  338,  199,  298,  190,
			  282,  282,  282,  206,  207,  206,  295,   97,  302,   98,
			  437,  180,  301,  208,  209,  208,  180,   97,  283,   98,
			  287,  287,  287,  436,  284,  284,  284,  196,  298,  285,
			  285,  319,  196,  286,  286,  286,  217,  217,  217,  290,
			  290,  303,  301,  291,  291,  291,  435,  306,  288,  292,
			   99,  220,  220,  220,  310,  311,  307,  215,  331,  321,
			   99,  319,  325,  303,  433,  326,  327,  330,  100,  306,

			  308,  334,  332,  289,  336,  344,  310,  311,  100,  341,
			  331,  359,  345,  346,  346,  346,  307,  372,  293,  321,
			  333,  415,  325,  334,  326,  416,  327,  330,  347,  347,
			  347,  341,  332,  359,  336,  344,  345,  277,  278,  277,
			  431,  372,  333,  348,  280,  280,  280,  286,  286,  286,
			  275,  204,  282,  282,  282,  349,  284,  284,  284,  286,
			  286,  286,  287,  287,  287,  352,  352,  430,  428,  353,
			  353,  353,  360,  364,  351,  354,  354,  354,  291,  291,
			  291,  291,  291,  291,  366,  357,  357,  357,  220,  220,
			  220,  369,  371,  373,  360,  364,  350,  358,  374,  215,

			  376,  381,  383,  385,  386,  388,  366,  390,  393,  394,
			  396,  397,  289,  369,  371,  373,  400,  401,  355,  402,
			  374,  427,  376,  381,  383,  293,  386,  388,  385,  390,
			  393,  412,  426,  397,  394,  346,  346,  346,  400,  158,
			  396,  159,  401,  157,  347,  347,  347,  420,  403,  402,
			  404,  404,  404,  405,  405,  412,  413,  406,  406,  406,
			  353,  353,  353,  353,  353,  353,  354,  354,  354,  409,
			  409,  409,  275,  357,  357,  357,  410,  410,  408,  414,
			  411,  411,  411,  417,  421,  408,  413,  350,  429,  418,
			  422,  423,  442,  425,  424,  455,  398,  432,  434,  438,

			  407,  414,  440,  289,  441,  445,  355,  417,  395,  392,
			  289,  418,  422,  391,  421,  423,  424,  425,  429,  432,
			  434,  438,  442,  449,  440,  455,  441,  387,  382,  445,
			  404,  404,  404,  406,  406,  406,  406,  406,  406,  446,
			  446,  446,  447,  447,  450,  449,  448,  448,  448,  409,
			  409,  409,  411,  411,  411,  411,  411,  411,  452,  457,
			  458,  459,  380,  460,  461,  462,  450,  350,  463,  464,
			  379,  465,  474,  350,  467,  468,  407,  378,  469,  377,
			  452,  457,  472,  459,  458,  460,  355,  462,  470,  471,
			  463,  473,  355,  464,  461,  465,  467,  474,  476,  468, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  469,  446,  446,  446,  448,  448,  448,  448,  448,  448,
			  470,  480,  472,  471,  484,  485,  375,  370,  368,  219,
			  219,  473,  476,  219,  219,  219,  367,  365,  363,  362,
			  361,  343,  342,  340,  339,  337,  484,  485,  407,  335,
			  329,  480,  328,  324,  407,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   67,   67,   67,   67,   67,

			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   73,   73,   73,   73,   73,   73,   73,   73,   73,   73,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   79,   79,   82,   82,   82,   82,   82,

			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   85,   85,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   96,   96,  323,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,   96,   96,   96,   96,   96,
			   96,   96,   96,   96,   96,  101,  322,  320,  318,  317,

			  316,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  102,  102,  315,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  114,  114,  309,  305,  114,
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  157,  157,  304,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,

			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,

			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  204,  204,  204,  204,
			  296,  283,  276,  204,  204,  204,  204,  204,  273,  204,
			  204,  204,  204,  204,  211,  211,  272,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  211,  211,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,

			  105,  105,  105,  105,  216,  216,  216,  216,  216,  216,
			  216,  216,  266,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  157,
			  157,  157,  157,  255,  248,  242,  157,  157,  157,  157,
			  157,  241,  157,  157,  157,  157,  157,  204,  204,  230,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  356,  356,  356,  356,  356,  356,  356,  356,
			  227,  356,  356,  356,  356,  356,  356,  356,  356,  356,
			  356,  356,  356,  356,  356,  356,  356,  221,  210,  212,

			  210,  205,  105,  106,  154,  145,  139,  106,  106,  487,
			   21,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487, yy_Dummy>>,
			1, 779, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1778)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    4,  117,    3,    4,    3,    4,    5,    5,    5,    6,
			    6,    6,    5,   13,   13,    6,    7,    7,    7,    8,
			    8,    8,    9,    9,    9,   10,   10,   10,   11,   11,

			   11,  117,   11,   12,   12,   12,  241,   12,   14,   14,
			   15,   15,   15,   16,   16,   16,   17,   17,   17,  241,
			   17,   18,   18,   18,  480,   18,   19,   19,   20,   20,
			   23,   23,   23,   24,   24,   24,   26,   29,   26,   53,
			   23,   28,   28,   24,   31,   30,   29,   30,   30,   30,
			   31,   32,   46,   32,   32,   32,   49,   33,   46,   33,
			   33,   33,   32,   53,   11,   17,   36,   36,   33,   12,
			   18,   34,   42,   34,   34,   34,   37,   37,   49,   26,
			  470,   39,   42,   44,   32,  328,   39,   44,   39,   55,
			   32,  340,   32,   39,   39,   41,   33,   26,   33,   41,

			   44,   59,   41,   59,  121,   41,   51,   43,   41,   43,
			   34,   39,   39,   44,  328,   39,   39,   55,   45,   43,
			  340,   51,   44,   41,   41,   45,   45,   41,   48,   52,
			   41,   45,   43,   43,  121,   54,   79,   79,   48,   52,
			   48,   81,   81,   51,   48,   73,   73,   45,   73,   54,
			   45,   91,   91,   45,   58,   58,   58,   52,   48,   85,
			   85,   52,   85,   48,   48,   54,   48,   64,   64,   64,
			   68,   68,   68,   64,   71,   71,   71,   78,   78,  105,
			   78,  468,   78,   83,   83,   83,   93,   93,  105,  184,
			  184,   58,   62,   62,   62,   62,   62,   62,   62,   62,

			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   74,   74,   74,  467,   74,   76,   76,   76,  122,   76,
			   86,   86,   86,  370,   86,   88,   88,   88,  118,   88,
			   90,   90,   96,   90,   96,   90,   94,   94,   94,   99,
			   99,   99,  122,   99,  464,   99,   94,  100,  100,  100,

			  118,  100,  370,  100,  107,  107,  107,  463,  108,  108,
			  108,  109,  130,  109,  109,  109,  107,  119,  116,   86,
			  108,  116,  109,  124,   88,   96,   74,  113,  113,  113,
			  110,   76,  110,  110,  110,  127,   99,  130,  125,  119,
			  128,  107,  125,   96,  100,  124,  116,  129,  131,  462,
			  109,  129,  109,  139,   99,  128,  141,  127,  140,  142,
			  138,  135,  100,  135,  113,  135,  147,  458,  125,  110,
			  128,  125,  138,  129,  149,  139,  135,  128,  131,  135,
			  140,  146,  151,  186,  186,  146,  141,  438,  147,  142,
			  138,  135,  135,  135,  424,  154,  149,  157,  135,  157,

			  421,  135,  145,  145,  151,  145,  146,  200,  200,  150,
			  161,  161,  161,  145,  150,  418,  145,  154,  145,  145,
			  155,  155,  155,  202,  202,  150,  156,  156,  156,  163,
			  163,  163,  145,  145,  145,  416,  400,  145,  145,  150,
			  145,  145,  164,  204,  164,  204,  213,  150,  165,  165,
			  165,  226,  167,  167,  167,  213,  228,  155,  167,  170,
			  170,  170,  242,  156,  172,  172,  172,  174,  174,  221,
			  174,  176,  176,  226,  176,  178,  178,  178,  228,  178,
			  179,  179,  179,  399,  179,  180,  180,  242,  180,  229,
			  180,  182,  182,  221,  182,  321,  182,  188,  188,  188,

			  190,  190,  266,  190,  192,  192,  222,  192,  194,  194,
			  194,  229,  194,  195,  195,  195,  231,  195,  196,  196,
			  321,  196,  393,  196,  198,  198,  266,  198,  227,  198,
			  205,  205,  205,  206,  206,  206,  222,  206,  231,  206,
			  391,  178,  230,  208,  208,  208,  179,  208,  212,  208,
			  215,  215,  215,  390,  212,  212,  212,  194,  227,  214,
			  214,  247,  195,  214,  214,  214,  217,  217,  217,  218,
			  218,  232,  230,  218,  218,  218,  389,  236,  217,  220,
			  206,  220,  220,  220,  239,  240,  237,  215,  260,  249,
			  208,  247,  255,  232,  387,  255,  256,  259,  206,  236,

			  237,  262,  261,  217,  264,  272,  239,  240,  208,  269,
			  260,  294,  273,  275,  275,  275,  237,  307,  220,  249,
			  261,  366,  255,  262,  255,  366,  256,  259,  276,  276,
			  276,  269,  261,  294,  264,  272,  273,  277,  277,  277,
			  385,  307,  261,  280,  280,  280,  280,  285,  285,  285,
			  275,  282,  282,  282,  282,  284,  284,  284,  284,  286,
			  286,  286,  287,  287,  287,  288,  288,  383,  381,  288,
			  288,  288,  295,  299,  287,  289,  289,  289,  290,  290,
			  290,  291,  291,  291,  301,  292,  292,  292,  293,  293,
			  293,  304,  306,  308,  295,  299,  286,  292,  309,  287,

			  311,  317,  319,  323,  325,  327,  301,  329,  332,  333,
			  335,  336,  289,  304,  306,  308,  341,  342,  291,  343,
			  309,  379,  311,  317,  319,  293,  325,  327,  323,  329,
			  332,  361,  378,  336,  333,  346,  346,  346,  341,  348,
			  335,  348,  342,  347,  347,  347,  347,  371,  349,  343,
			  350,  350,  350,  351,  351,  361,  362,  351,  351,  351,
			  352,  352,  352,  353,  353,  353,  354,  354,  354,  355,
			  355,  355,  346,  357,  357,  357,  358,  358,  354,  365,
			  358,  358,  358,  367,  372,  357,  362,  350,  382,  369,
			  373,  374,  397,  377,  376,  423,  337,  386,  388,  392,

			  353,  365,  394,  354,  396,  402,  355,  367,  334,  331,
			  357,  369,  373,  330,  372,  374,  376,  377,  382,  386,
			  388,  392,  397,  413,  394,  423,  396,  326,  318,  402,
			  404,  404,  404,  405,  405,  405,  406,  406,  406,  407,
			  407,  407,  408,  408,  414,  413,  408,  408,  408,  409,
			  409,  409,  410,  410,  410,  411,  411,  411,  417,  426,
			  427,  428,  316,  429,  430,  431,  414,  404,  432,  435,
			  315,  436,  455,  406,  442,  443,  407,  314,  445,  313,
			  417,  426,  453,  428,  427,  429,  409,  431,  449,  451,
			  432,  454,  411,  435,  430,  436,  442,  455,  461,  443, yy_Dummy>>,
			1, 1000, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER]) is
		do
			yy_array_subcopy (an_array, <<
			  445,  446,  446,  446,  447,  447,  447,  448,  448,  448,
			  449,  465,  453,  451,  476,  478,  310,  305,  303,  512,
			  512,  454,  461,  512,  512,  512,  302,  300,  298,  297,
			  296,  271,  270,  268,  267,  265,  476,  478,  446,  263,
			  258,  465,  257,  254,  448,  488,  488,  488,  488,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  488,  488,
			  489,  489,  489,  489,  489,  489,  489,  489,  489,  489,
			  489,  489,  489,  489,  489,  489,  489,  489,  489,  489,
			  489,  489,  489,  489,  489,  490,  490,  490,  490,  490,

			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  491,  491,  491,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  493,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  493,  493,  493,  494,  494,  494,  494,  494,

			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  494,  494,  494,  494,  494,  494,  494,  494,  494,
			  495,  495,  495,  495,  495,  495,  495,  495,  495,  495,
			  495,  495,  495,  495,  495,  495,  495,  495,  495,  495,
			  495,  495,  495,  495,  495,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  496,  496,  496,  496,  496,  496,  496,  496,
			  497,  497,  252,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  498,  250,  248,  246,  245,

			  244,  498,  498,  498,  498,  498,  498,  498,  498,  498,
			  498,  498,  498,  498,  498,  498,  498,  498,  498,  498,
			  499,  499,  243,  499,  499,  499,  499,  499,  499,  499,
			  499,  499,  499,  499,  499,  499,  499,  499,  499,  499,
			  499,  499,  499,  499,  499,  500,  500,  238,  234,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  501,  501,  233,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  502,  502,  502,  502,
			  502,  502,  502,  502,  502,  502,  502,  502,  502,  502,

			  502,  502,  502,  502,  502,  502,  502,  502,  502,  502,
			  502,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  504,  504,  504,  504,
			  504,  504,  504,  504,  504,  504,  504,  504,  504,  504,
			  504,  504,  504,  504,  504,  504,  504,  504,  504,  504,
			  504,  505,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  505,  505,  505,  505,  506,  506,  506,  506,
			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,

			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,
			  506,  507,  507,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  507,  507,  507,  507,  508,  508,  508,  508,
			  225,  211,  159,  508,  508,  508,  508,  508,  153,  508,
			  508,  508,  508,  508,  509,  509,  152,  509,  509,  509,
			  509,  509,  509,  509,  509,  509,  509,  509,  509,  509,
			  509,  509,  509,  509,  509,  509,  509,  509,  509,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,

			  510,  510,  510,  510,  511,  511,  511,  511,  511,  511,
			  511,  511,  148,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  513,
			  513,  513,  513,  144,  137,  134,  513,  513,  513,  513,
			  513,  132,  513,  513,  513,  513,  513,  514,  514,  123,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  515,  515,  515,  515,  515,  515,  515,  515,
			  120,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  515,  115,  104,  103,

			  102,   98,   95,   57,   56,   50,   47,   38,   35,   21,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487, yy_Dummy>>,
			1, 779, 1000)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   66,   67,   74,   77,   84,   87,   90,
			   93,   96,  101,   80,  105,  108,  111,  114,  119,  123,
			  125, 1709, 1710,  128,  131, 1710,  130,    0,  133,  125,
			  132,  130,  138,  144,  158, 1688,  147,  156, 1687,  152,
			    0,  165,  145,  173,  160,  190,  121, 1669,  204,  116,
			 1678,  179,  199,  103,  212,  159, 1667, 1653,  239,  195,
			 1710, 1710,  291, 1710,  265, 1710, 1710, 1710,  268, 1710,
			 1710,  272, 1710,  242,  358, 1710,  363, 1710,  274,  233,
			 1710,  238, 1710,  281, 1710,  256,  368, 1710,  373, 1710,
			  377,  248, 1710,  283,  384, 1690,  376, 1710, 1687,  387,

			  395,    0, 1691, 1685, 1689,  276, 1710,  389,  393,  398,
			  417, 1710,    0,  412,    0, 1670,  387,   45,  337,  375,
			 1653,  181,  332, 1622,  383,  414,    0,  394,  414,  409,
			  378,  425, 1604,    0, 1597,  435,    0, 1601,  435,  411,
			  417,  430,  434,    0, 1606,  477,  447,  426, 1585,  431,
			  483,  442, 1525, 1521,  455,  505,  511,  491, 1710, 1528,
			 1710,  508, 1710,  527,  536,  533, 1710,  550, 1710, 1710,
			  557, 1710,  562, 1710,  564, 1710,  568, 1710,  573,  578,
			  582, 1710,  588, 1710,  286, 1710,  480, 1710,  595, 1710,
			  597, 1710,  601, 1710,  606,  611,  615, 1710,  621, 1710,

			  504, 1710,  520, 1710,  537,  615,  631, 1710,  641, 1710,
			 1710, 1532,  639,  543,  648,  635, 1710,  651,  658,    0,
			  666,  533,  583,    0,    0, 1509,  511,  603,  515,  545,
			  619,  576,  628, 1336, 1321,    0,  634,  663, 1320,  643,
			  643,   71,  528, 1295, 1269, 1272, 1260,  638, 1270,  666,
			 1258,    0, 1235,    0, 1016,  667,  673, 1015, 1013,  674,
			  645,  677,  661, 1012,  681, 1004,  566, 1007, 1006,  670,
			 1001, 1000,  679,  676,    0,  698,  713,  735, 1710, 1710,
			  729, 1710,  737, 1710,  741,  732,  744,  747,  754,  760,
			  763,  766,  770,  773,  669,  731, 1001,  998,  995,  732,

			 1000,  742,  999,  989,  751,  986,  752,  681,  753,  758,
			  989,  757,    0,  952,  946,  924,  916,  761,  901,  762,
			    0,  561,    0,  769,    0,  761,  896,  764,  157,  767,
			  878,  878,  765,  775,  861,  785,  771,  858,    0,    0,
			  163,  773,  783,  796,    0,    0,  820,  829,  833,  839,
			  835,  842,  845,  848,  851,  854, 1710,  858,  865,    0,
			    0,  795,  832,    0,    0,  839,  694,  847,    0,  849,
			  345,  820,  858,  848,  855,    0,  854,  857,  805,  790,
			    0,  737,  863,  736,    0,  713,  857,  648,  856,  645,
			  626,  613,  859,  595,  860,    0,  862,  869,    0,  552,

			  509,    0,  869, 1710,  915,  918,  921,  924,  931,  934,
			  937,  940,    0,  880,  902,    0,  498,  916,  488,    0,
			    0,  473,    0,  872,  467,    0,  918,  924,  919,  921,
			  941,  923,  927,    0,    0,  933,  935,    0,  460,    0,
			    0,    0,  932,  939,    0,  936,  986,  989,  992,  946,
			    0,  953,    0,  956,  965,  938,    0,    0,  438,    0,
			    0,  962,  422,  370,  367,  986,    0,  336,  254,    0,
			  153,    0,    0,    0,    0,    0,  972,    0,  975,    0,
			   97,    0,    0,    0,    0,    0,    0, 1710, 1044, 1069,
			 1094, 1119, 1144, 1169, 1194, 1219, 1244, 1269, 1294, 1319,

			 1335, 1360, 1385, 1410, 1435, 1460, 1485, 1510, 1531, 1553,
			 1578, 1603, 1009, 1624, 1646, 1671, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  487,    1,  488,  488,  489,  489,  490,  490,  491,
			  491,  492,  492,  493,  493,  494,  494,  495,  495,  496,
			  496,  487,  487,  487,  487,  487,  497,  498,  499,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  487,  487,  501,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  502,  502,  487,  502,  487,  503,  504,
			  487,  504,  487,  487,  487,  505,  505,  487,  505,  487,
			  506,  507,  487,  507,  487,  487,  497,  487,  508,  497,

			  497,  498,  487,  509,  487,  510,  487,  487,  511,  487,
			  487,  487,  512,  487,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  487,  487,  501,  487,  513,
			  487,  487,  487,  487,  501,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  502,  487,  502,  487,  502,  502,
			  503,  487,  503,  487,  504,  487,  504,  487,  487,  487,
			  505,  487,  505,  487,  505,  505,  506,  487,  506,  487,

			  507,  487,  507,  487,  514,  487,  497,  487,  497,  487,
			  487,  487,  487,  510,  487,  487,  487,  487,  487,  512,
			  487,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  515,  487,  500,  500,  500,  500,  500,  500,

			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  487,  487,  501,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,

			  500,  500,  500,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  487,  487,  487,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,    0,  487,  487,
			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,

			  487,  487,  487,  487,  487,  487,  487,  487,  487,  487,
			  487,  487,  487,  487,  487,  487, yy_Dummy>>)
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
			   46,   47,   48,   67,    7,   68,    5,    1,    1,    1,
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
			   17,   17,   17,   17,   17,   17,   25,    1,    1, yy_Dummy>>)
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
			  375,  376,  377,  378,  379,  381,  381,  381,  381,  382,
			  384,  385,  386,  386,  387,  388,  388,  390,  391,  391,
			  391,  391,  393,  393,  394,  395,  396,  397,  398,  399,

			  400,  401,  402,  403,  404,  405,  407,  408,  409,  410,
			  411,  412,  413,  415,  416,  417,  418,  419,  420,  421,
			  422,  424,  425,  427,  428,  430,  431,  432,  433,  434,
			  435,  436,  437,  438,  439,  440,  441,  442,  443,  445,
			  447,  448,  449,  450,  451,  453,  455,  456,  456,  458,
			  459,  459,  459,  459,  463,  464,  464,  465,  466,  467,
			  469,  471,  472,  473,  475,  477,  478,  479,  480,  482,
			  483,  484,  485,  486,  487,  488,  490,  491,  492,  493,
			  494,  496,  497,  498,  499,  501,  502,  503,  504,  505,
			  506,  507,  508,  509,  510,  511,  513,  514,  515,  517,

			  518,  519,  521,  522,  523,  524,  524,  525,  525,  525,
			  526,  526,  527,  529,  530,  531,  533,  534,  535,  536,
			  538,  540,  541,  543,  544,  545,  547,  548,  549,  550,
			  551,  552,  553,  554,  556,  558,  559,  560,  562,  563,
			  565,  567,  569,  570,  571,  573,  574,  576,  576,  578,
			  579,  581,  582,  584,  585,  586,  587,  589,  591,  592,
			  594,  596,  597,  598,  599,  600,  601,  603,  604,  605,
			  607,  608,  610,  612,  614,  616,  618,  619,  621,  622,
			  624,  625,  627,  629,  631,  633,  635,  637,  637, yy_Dummy>>)
		end

	yy_acclist_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   86,   86,   89,   89,   97,   97,  100,  100,  133,
			  131,  132,    1,  131,  132,    1,  132,    2,  131,  132,
			  102,  131,  132,   70,  131,  132,   77,  131,  132,    2,
			  131,  132,    2,  131,  132,    2,  131,  132,  120,  131,
			  132,  120,  131,  132,  120,  131,  132,    2,  131,  132,
			    2,  131,  132,    2,  131,  132,    2,  131,  132,   69,
			  131,  132,   69,  131,  132,   69,  131,  132,   69,  131,
			  132,   69,  131,  132,   69,  131,  132,   69,  131,  132,
			   69,  131,  132,   69,  131,  132,   69,  131,  132,   69,
			  131,  132,   69,  131,  132,   69,  131,  132,   69,  131,

			  132,   69,  131,  132,   69,  131,  132,   69,  131,  132,
			   69,  131,  132,  131,  132,  131,  132,  109,  132,  113,
			  132,  110,  132,  112,  132,  118,  132,  118,  132,  117,
			  132,  116,  118,  132,  115,  132,  115,  132,  114,  132,
			   81,  132,   81,  132,   80,  132,   86,  132,   86,  132,
			   85,  132,   86,  132,   83,  132,   86,  132,   89,  132,
			   88,  132,   89,  132,   92,  132,   92,  132,   91,  132,
			   97,  132,   97,  132,   96,  132,   97,  132,   94,  132,
			   97,  132,  100,  132,   99,  132,  100,  132,    1,  102,
			   78,  101,  102, -222,  102, -211,   70,   77,   77,   76,

			   77,    1,    3,  127,  130,  120,  120,  119,   69,   69,
			   69,   69,    8,   69,   69,   69,   69,   69,   69,   69,
			   69,   14,   69,   69,   69,   69,   69,   69,   69,   26,
			   69,   69,   69,   33,   69,   69,   69,   69,   69,   69,
			   69,   41,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,  109,  110,  111,  111,  103,  111,
			  109,  111,  107,  111,  108,  111,  117,  116,  114,   80,
			   86,   85,   86,   83,   86,   86,   86,   84,   85,   86,
			   82,   83,   89,   88,   89,   87,   88,   91,   97,   96,
			   97,   94,   97,   97,   97,   95,   96,   97,   93,   94,

			  100,   99,  100,   98,   99,  102,  102,  -90,  102,  -79,
			   71,   77,   75,   77,    1,  125,  127,  130,  125,  124,
			  121,   69,   69,    6,   69,    7,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   17,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   37,   69,   69,   39,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   60,
			   69,  104,  103,  104,  106,  101,   72,   74,  127,  130,
			  130,  126,  129,  123,   69,   69,   69,   69,   69,   69,

			   69,   69,   69,   69,   69,   15,   69,   69,   69,   69,
			   69,   69,   69,   24,   69,   69,   69,   69,   69,   69,
			   69,   69,   34,   69,   69,   36,   69,   69,   40,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   53,   69,   54,   69,   69,   69,   69,
			   69,   68,   69,   59,   69,  122,  105,  109,   77,  126,
			  127,  129,  130,  130,  128,  130,  128,    4,   69,    5,
			   69,   69,   69,    9,   69,   61,   69,   69,   69,   69,
			   12,   69,   69,   69,   69,   69,   69,   69,   22,   69,
			   69,   69,   69,   69,   29,   69,   69,   69,   69,   35,

			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   49,   69,   69,   69,   52,   69,   69,   69,   57,
			   69,   69,   73,  130,  130,  129,  129,   62,   69,   69,
			   69,   65,   69,   69,   69,   69,   16,   69,   18,   69,
			   69,   20,   69,   69,   69,   25,   69,   69,   69,   69,
			   69,   69,   69,   69,   43,   69,   66,   69,   69,   69,
			   45,   69,   69,   47,   69,   48,   69,   50,   69,   69,
			   69,   56,   69,   69,  129,  130,  129,  130,   69,   64,
			   69,   69,   11,   69,   69,   69,   69,   23,   69,   27,
			   69,   69,   30,   69,   31,   69,   69,   69,   69,   69,

			   69,   46,   69,   69,   69,   58,   69,   69,   10,   69,
			   13,   69,   19,   69,   21,   69,   28,   69,   69,   38,
			   69,   69,   44,   69,   69,   51,   69,   55,   69,   63,
			   69,   32,   69,   42,   69,   67,   69, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1710
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 487
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 488
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

	yyNb_rules: INTEGER is 132
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 133
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
