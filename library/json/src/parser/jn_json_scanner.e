note

	description:

		"Scanners for JSON parsers"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_JSON_SCANNER

inherit

	JN_JSON_SCANNER_SKELETON

create

	make,
	make_with_error_handler

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
	yy_set_line_column
--|#line 30 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 30")
end
-- Ignored
when 2 then
	yy_column := yy_column + 1
--|#line 34 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 34")
end

				last_token := text_item (1).code
			
when 3 then
	yy_column := yy_column + 4
--|#line 40 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 40")
end

				last_token := T_TRUE
				create last_detachable_jn_boolean_value.make_true
			
when 4 then
	yy_column := yy_column + 5
--|#line 45 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 45")
end

				last_token := T_FALSE
				create last_detachable_jn_boolean_value.make_false
			
when 5 then
	yy_column := yy_column + 4
--|#line 50 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 50")
end

				last_token := T_NULL
				create last_detachable_jn_null_value.make
			
when 6 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 57 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 57")
end

				last_token := T_NUMBER
				create last_detachable_jn_number_value.make (utf8_text)
			
when 7 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 64 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 64")
end

				last_token := T_STRING
				create last_detachable_jn_string_value.make_from_escaped (utf8_text_substring (2, text_count - 1))
			
when 8 then
	yy_column := yy_column + 1
--|#line 72 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 72")
end

				last_token := T_UNKNOWN
			
when 9 then
	yy_set_line_column
--|#line 0 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 0")
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
--|#line 71 "jn_json_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'jn_json_scanner.l' at line 71")
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
			    0,    5,    6,    5,    4,    7,    4,    8,    9,    4,
			    4,   10,   11,    4,    4,    4,    4,    4,    4,   12,
			    4,   13,    4,    4,   14,    4,    4,   16,   18,   19,
			   20,   16,   26,   26,   15,   21,   15,   17,   37,   21,
			   20,   17,   19,   19,   35,   21,   20,   28,   28,   21,
			   34,   21,   28,   28,   33,   21,   27,   31,   27,   32,
			   32,   28,   28,   26,   26,   30,   21,   36,   36,   29,
			   21,   15,   15,   15,   15,   38,   38,   15,   15,   25,
			   24,   23,   22,   39,    3,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    7,    9,    9,
			   10,   15,   20,   20,   41,   10,   41,    7,   33,   10,
			   11,   15,   11,   11,   31,   11,   18,   27,   27,   11,
			   30,   18,   28,   28,   29,   18,   21,   24,   21,   42,
			   42,   21,   21,   26,   26,   23,   26,   43,   43,   22,
			   26,   40,   40,   40,   40,   44,   44,   45,   45,   17,
			   14,   13,   12,    3,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,

			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   83,   84,   84,   84,   22,   84,   17,
			   21,   31,   66,   56,   58,   26,   84,   54,   37,    0,
			   21,   50,   49,   45,   32,    0,   52,   36,   41,   31,
			   30,   26,    0,   20,   84,   84,    0,   84,    0,   84,
			   70,   32,   56,   64,   72,   74, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   39,    1,   39,   39,   39,   39,   40,   39,   39,
			   39,   39,   39,   39,   39,   40,   39,   41,   39,   11,
			   39,   39,   39,   39,   39,   42,   39,   39,   39,   39,
			   39,   39,   43,   39,   39,   39,   44,   39,   45,    0,
			   39,   39,   39,   39,   39,   39, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 5762)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (4, 126, 5760)
			an_array.area.fill_with (26, 5761, 5762)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   26,   26,   26,   26,   26,   26,   26,   26,    1,
			    2,   26,   26,    1,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,    3,    4,    5,    4,    4,    4,    4,    4,
			    4,    4,    4,    6,    7,    8,    9,   10,   11,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,    7,    4,
			    4,    4,    4,    4,    4,   13,   13,   13,   13,   14,
			   13,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    7,   15,    7,    4,    4,    4,   16,   17,   13,

			   13,   18,   19,    4,    4,    4,    4,    4,   20,    4,
			   21,    4,    4,    4,   22,   23,   24,   25,    4,    4,
			    4,    4,    4,    7,    4,    7, yy_Dummy>>,
			1, 126, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    5,    5,    1,    1,    2,    1,    1,    1,    1,
			    2,    3,    3,    3,    3,    2,    3,    4,    3,    4,
			    1,    2,    2,    1,    2,    2,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   10,    8,    1,    1,    8,    2,    8,
			    6,    6,    8,    8,    8,    0,    7,    0,    6,    6,
			    0,    0,    0,    0,    0,    0,    6,    0,    6,    0,
			    0,    0,    0,    0,    5,    3,    0,    4,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 84
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 39
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 40
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 26
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 5761
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

	yyNb_rules: INTEGER = 9
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 10
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
			-- Start condition codes

feature -- User-defined features



end
