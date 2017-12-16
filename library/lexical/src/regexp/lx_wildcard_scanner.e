note

	description:

		"Scanners for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

	LX_WILDCARD_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= CCL)
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
--|#line 52 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 52")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 2 then
--|#line 56 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 56")
end

					check attached text as l_last_string then
						if character_classes.has (l_last_string) then
							last_token := CCL_OP
							last_lx_symbol_class_value := character_classes.item (l_last_string)
						else
							last_token := Left_bracket_code
							last_string_value := l_last_string
							less (1)
							set_start_condition (FIRSTCCL)
						end
					end
				
when 3 then
--|#line 69 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 69")
end
last_token := STAR_PAREN
when 4 then
--|#line 70 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 70")
end
last_token := STAR_STAR_SLASH
when 5 then
--|#line 71 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 71")
end
last_token := text_item (1).code
when 6 then
--|#line 72 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 72")
end

					last_token := CHAR
					process_character (text_item (1).code)
				
when 7 then
--|#line 79 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 79")
end

					process_character (text_item (1).code)
					last_token := CHAR
				
when 8 then
--|#line 83 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 83")
end

					last_token := Double_quote_code
					set_start_condition (INITIAL)
				
when 9 then
--|#line 87 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 87")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (INITIAL)
				
when 10 then
--|#line 95 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 95")
end

					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				
when 11 then
	yy_end := yy_end - 1
--|#line 104 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 104")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 12 then
	yy_end := yy_end - 1
--|#line 108 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 108")
end
last_token := Caret_code
when 13 then
--|#line 109 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 109")
end

					last_token := CHAR
					process_character (text_item (1).code)
					set_start_condition (CCL)
				
when 14 then
--|#line 114 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 114")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 15 then
	yy_end := yy_end - 1
--|#line 123 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 123")
end
last_token := Minus_code
when 16 then
--|#line 124 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 124")
end

					last_token := CHAR
					process_character (text_item (1).code)
				
when 17 then
--|#line 128 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 128")
end

					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 18 then
--|#line 132 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 132")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 19 then
--|#line 140 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 140")
end

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (text)
					end
				
when 20 then
--|#line 0 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 0")
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
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,   10,   11,   12,   13,   13,   14,   10,   10,   10,
			   10,   10,   15,   16,   10,   10,   18,   19,   30,   35,
			   31,   36,   35,   35,   36,   36,   38,   20,   18,   19,
			   35,   32,   36,   38,   41,   42,   43,   32,   44,   20,
			   22,   46,   46,   47,   32,   48,   50,   50,   34,   34,
			   32,   23,   32,   24,   22,   52,   52,   34,   32,   34,
			   39,   39,   51,   34,   45,   23,   40,   24,   26,   33,
			   53,   53,   53,   27,   53,   53,   53,   53,   53,   28,
			   29,   26,   53,   53,   53,   53,   27,   53,   53,   53,
			   53,   53,   28,   29,   49,   53,   53,   53,   41,   42,

			   17,   17,   17,   21,   21,   21,   25,   25,   25,   37,
			   37,   37,    9,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    3,    3,   14,   16,
			   14,   16,   20,   23,   20,   23,   24,    3,    4,    4,
			   28,   52,   28,   24,   32,   32,   33,   51,   33,    4,
			    5,   36,   36,   41,   50,   41,   44,   44,   46,   46,
			   57,    5,   57,    5,    6,   48,   48,   58,   49,   58,
			   60,   60,   47,   45,   35,    6,   31,    6,    7,   15,
			    9,    0,    0,    7,    0,    0,    0,    0,    0,    7,
			    7,    8,    0,    0,    0,    0,    8,    0,    0,    0,
			    0,    0,    8,    8,   43,    0,    0,    0,   43,   43,

			   54,   54,   54,   55,   55,   55,   56,   56,   56,   59,
			   59,   59,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   14,   26,   38,   52,   66,   79,   70,
			  112,  112,  112,  112,   14,   56,   10,  112,  112,  112,
			   13,  112,  112,   14,   19,  112,  112,    0,   21,  112,
			  112,   58,   21,   27,  112,   55,   32,  112,  112,  112,
			  112,   34,  112,   85,   37,   54,   39,   53,   46,   49,
			   35,   28,   22,  112,   99,  102,  105,   49,   56,  108,
			   59, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   53,    1,   54,   54,   55,   55,   56,   56,   53,
			   53,   53,   53,   53,   53,   57,   58,   53,   53,   53,
			   58,   53,   53,   58,   59,   53,   53,   60,   58,   53,
			   53,   53,   57,   57,   53,   53,   53,   53,   53,   53,
			   53,   57,   53,   57,   43,   53,   53,   43,   43,   43,
			   43,   43,   43,    0,   53,   53,   53,   53,   53,   53,
			   53, yy_Dummy>>)
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
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    2,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    1,    1,    1,    1,    1,
			    4,    5,    6,    5,    1,    7,    1,    8,    9,    9,
			    9,    9,    9,    9,    9,    9,   10,   10,    1,    1,
			    1,    1,    1,    5,    5,   10,   10,   10,   10,   10,
			   10,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,   11,    1,
			    1,   12,   13,   14,   15,    1,    1,   10,   10,   10,

			   10,   10,   10,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			   11,    1,    1,    1,    5,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   21,
			    6,   19,    1,    5,    5,    6,    6,    7,    9,    8,
			    7,   13,   14,   13,   13,   16,   18,   16,   16,   17,
			    3,    0,    0,    0,   10,   10,   10,   11,   12,   15,
			    4,    0,    2,    0,    0,   10,   10,    0,    0,    0,
			    0,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 112
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 53
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 54
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

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

	yyNb_rules: INTEGER = 20
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 21
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	QUOTE: INTEGER = 1
	FIRSTCCL: INTEGER = 2
	CCL: INTEGER = 3
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS
			
end
