note

	description:

		"Scanners for Eiffel type parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_TYPE_SCANNER

inherit

	ET_TYPE_SCANNER_SKELETON

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
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
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
	yy_column := yy_column + 1
--|#line 32 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 32")
end

				process_one_char_symbol (unicode_text_item (1))
			
when 2 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 39 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 39")
end

				process_identifier (text_count)
			
when 3 then
	yy_set_line_column
--|#line 46 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 46")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
			
when 4 then
	yy_set_line_column
--|#line 52 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 52")
end

				last_literal_start := 1
				last_literal_end := 0
				last_text_count := 0
			
when 5 then
	yy_column := yy_column + 1
--|#line 62 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 62")
end

				last_token := E_UNKNOWN
				last_detachable_et_position_value := current_position
			
when 6 then
	yy_set_line_column
--|#line 0 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 0")
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
--|#line 61 "et_type_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_type_scanner.l' at line 61")
end
terminate
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,    5,    6,    7,    8,    4,    9,    4,   14,   14,
			   15,   14,   13,   15,   12,   12,   12,   10,   11,   12,
			   12,   11,   11,   16,    3,   16,   16,   16,   16,   16,
			   16,   16, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,   12,   20,
			   12,   15,   18,   15,   19,   19,   19,   17,   14,   11,
			    8,    6,    5,    3,   16,   16,   16,   16,   16,   16,
			   16,   16, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   23,   24,   18,   17,   24,   16,    0,
			    0,   15,    6,    0,   14,    9,   24,   16,   10,   13,
			    8, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   16,    1,   16,   16,   17,   17,   16,   16,   18,
			    6,   16,   19,   18,   20,   19,    0,   16,   16,   16,
			   16, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (6, 65, 90)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (6, 97, 122)
			yy_ec_template_3 (an_array)
			an_array.area.fill_with (7, 126, 159)
			an_array.put (1, 160)
			an_array.area.fill_with (7, 161, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (7, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (7, 8203, 8238)
			an_array.put (1, 8239)
			an_array.area.fill_with (7, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (7, 8288, 12287)
			yy_ec_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,    7,    7,    7,    7,    7,    7,    7,    7,    1,
			    2,    1,    1,    1,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    1,    3,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    3,    4,    3,    7,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    3,    3,
			    7,    7,    7,    3,    7, yy_Dummy>>,
			1, 65, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    3,    7,    3,    7,    5,    7, yy_Dummy>>,
			1, 6, 91)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    3,    7,    3, yy_Dummy>>,
			1, 3, 123)
		end

	yy_ec_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    7,    7, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    3,    1,    2,    2,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    7,    5,    3,    3,    1,    5,    2,
			    3,    0,    4,    2,    4,    4,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 24
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 16
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 17
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 7
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 12289
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 6
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 7
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
			-- Start condition codes

feature -- User-defined features



end
