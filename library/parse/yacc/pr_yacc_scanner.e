indexing

	description:

		"Scanners for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_YACC_SCANNER

inherit

	PR_YACC_SCANNER_SKELETON

creation

	make

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
			yy_base := yy_base_
			yy_def := yy_def_
			yy_ec := yy_ec_
			yy_meta := yy_meta_
			yy_accept := yy_accept_
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 22 then
if yy_act <= 11 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 38
last_token := T_TOKEN
else
--|#line 39
last_token := T_LEFT
end
else
--|#line 40
last_token := T_RIGHT
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 41
last_token := T_NONASSOC
else
--|#line 42
last_token := T_START
end
else
--|#line 43
last_token := T_EXPECT
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 44
last_token := Comma_code
else
--|#line 45

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_CODE)
					
end
else
--|#line 49

						set_start_condition (EIFFEL_CODE)
					
end
else
if yy_act = 10 then
--|#line 52

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
else
--|#line 56
last_token := T_UNKNOWN
end
end
end
else
if yy_act <= 17 then
if yy_act <= 14 then
if yy_act <= 13 then
if yy_act = 12 then
--|#line 60
-- Separator or comment.
else
--|#line 61
line_nb := line_nb + 1
end
else
--|#line 63

						last_token := T_IDENTIFIER
						last_value := text
					
end
else
if yy_act <= 16 then
if yy_act = 15 then
--|#line 67

						last_token := T_NUMBER
						last_value := text.to_integer
						if last_value.is_equal (0) then
							report_null_integer_error
						end
					
else
--|#line 74

						last_token := T_CHAR
						last_value := text
					
end
else
--|#line 81
last_token := T_PREC
end
end
else
if yy_act <= 20 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 82

						last_token := Colon_code
						last_value := line_nb
					
else
--|#line 86

						last_token := Bar_code
						last_value := line_nb
					
end
else
--|#line 90
last_token := Semicolon_code
end
else
if yy_act = 21 then
--|#line 91

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					
else
--|#line 95

						set_start_condition (EIFFEL_ACTION)
					
end
end
end
end
else
if yy_act <= 33 then
if yy_act <= 28 then
if yy_act <= 25 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 98

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
else
--|#line 105

						last_token := T_USER_CODE
						last_value := text
					
end
else
--|#line 112
more
end
else
if yy_act <= 27 then
if yy_act = 26 then
--|#line 113
more
else
--|#line 114
more
end
else
--|#line 115
more
end
end
else
if yy_act <= 31 then
if yy_act <= 30 then
if yy_act = 29 then
--|#line 116
more
else
--|#line 117

					line_nb := line_nb + 1
					more
				
end
else
--|#line 121

					last_token := T_EIFFEL
					last_value := text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
end
else
if yy_act = 32 then
--|#line 135

					action_buffer.append_string (text)
				
else
--|#line 136

					action_buffer.append_string (text)
				
end
end
end
else
if yy_act <= 38 then
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 137

					action_buffer.append_string (text)
				
else
--|#line 138

					action_buffer.append_string (text)
				
end
else
--|#line 139

					action_buffer.append_string (text)
				
end
else
if yy_act = 37 then
--|#line 142

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
else
--|#line 146

					process_dollar_dollar
				
end
end
else
if yy_act <= 41 then
if yy_act <= 40 then
if yy_act = 39 then
--|#line 149

					check is_integer: STRING_.is_integer (text_substring (2, text_count)) end
					process_dollar_n (text_substring (2, text_count).to_integer)
				
else
--|#line 153

					check is_integer: STRING_.is_integer (text_substring (3, text_count)) end
					process_dollar_n (- text_substring (3, text_count).to_integer)
				
end
else
--|#line 157

					last_token := T_ACTION
					last_value := cloned_string (action_buffer)
					action_buffer.wipe_out
					set_start_condition (SECTION2)
				
end
else
if yy_act = 42 then
--|#line 172

					last_token := text_item (1).code
				
else
--|#line 0
fatal_error ("scanner jammed")
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
when 3 then
--|#line 0

					report_missing_characters_error ("%%}")
					last_token := T_EIFFEL
					last_value := text_substring (1, text_count)
					set_start_condition (INITIAL)
				
when 4 then
--|#line 0

					report_missing_characters_error ("}")
					last_token := T_ACTION
					last_value := cloned_string (action_buffer)
					action_buffer.wipe_out
					set_start_condition (SECTION2)
				
			else
				terminate
			end
		end

feature {NONE} -- Tables

	yy_nxt_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,   12,   13,   14,   13,   12,   12,   15,   16,   17,
			   18,   12,   19,   19,   12,   12,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   12,   12,   12,   12,   12,   21,
			   40,   12,   40,   52,   52,   54,   22,   23,   28,   61,
			   29,   62,   30,   31,   28,   32,   29,   64,   30,   31,
			   91,   32,   56,   57,   56,   52,   52,   55,   24,   25,
			   21,   70,   12,   71,   61,   72,   62,   22,   23,   73,
			   85,   74,   74,   40,  102,   40,   48,   84,   48,   49,
			   56,   57,   56,   86,   61,  125,   62,   93,   93,   24,

			   25,   34,   89,   35,   36,   35,   37,   63,   38,   61,
			   70,   62,   71,  125,   87,   74,   74,  124,   75,  123,
			   92,   95,  105,  105,  106,  106,  107,  107,   93,   93,
			  108,  108,  122,  121,   85,  120,   39,   34,   49,   35,
			   36,   35,   37,  119,   38,   60,  105,  105,   64,  106,
			  106,   69,  107,  107,   75,  108,  108,  103,  118,  103,
			  103,   49,  117,   49,   49,  116,  115,   85,  114,  113,
			  112,  111,   39,   41,  110,  109,  104,   85,  101,  100,
			   99,   98,   97,   96,   94,   42,   68,   90,   88,   85,
			   83,   82,   43,   44,   81,   80,   45,   46,   47,   79,

			   78,   77,   48,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   49,   76,   49,   49,   49,   68,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   58,   59,   66,

			   65,   59,   51,   50,  125,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   60,  125,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,   64,  125,   64,   64,   64,  125,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   67,
			  125,  125,  125,  125,  125,  125,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   69,  125,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   75,  125,   75,   75,   75,  125,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   51,  125,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   66,  125,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   77,  125,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   11,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			   13,    3,   13,   19,   19,   21,    3,    3,    7,   29,
			    7,   29,    7,    7,    8,    7,    8,   65,    8,    8,
			   65,    8,   24,   24,   24,   52,   52,   21,    3,    3,
			    4,   35,    4,   35,   30,   36,   30,    4,    4,   36,
			   86,   36,   36,   40,   86,   40,   48,   48,   48,   50,
			   56,   56,   56,   50,   60,   62,   60,   73,   73,    4,

			    4,    9,   62,    9,    9,    9,    9,   30,    9,   63,
			   69,   63,   69,   71,   50,   74,   74,  123,   76,  122,
			   71,   76,   89,   89,   91,   91,   92,   92,   93,   93,
			   95,   95,  117,  116,  102,  114,    9,   10,  102,   10,
			   10,   10,   10,  113,   10,  105,  105,  105,  106,  106,
			  106,  107,  107,  107,  108,  108,  108,  141,  112,  141,
			  141,  142,  111,  142,  142,  109,  104,  103,  101,  100,
			   99,   98,   10,   15,   97,   96,   88,   87,   83,   82,
			   81,   80,   79,   78,   75,   15,   68,   64,   55,   49,
			   47,   46,   15,   15,   45,   44,   15,   15,   15,   43,

			   42,   38,   15,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  127,  127,  127,  127,  127,  127,  127,  127,  127,  127,
			  127,  127,  127,  127,  127,  127,  127,  128,  128,  128,
			  128,  128,  128,  128,  128,  128,  128,  128,  128,  128,
			  128,  128,  128,  128,  129,   37,  129,  129,  129,   34,
			  129,  129,  129,  129,  129,  129,  129,  129,  129,  129,
			  129,  130,  130,  130,  130,  130,  130,  130,  130,  130,
			  130,  131,  131,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  131,  131,  131,  131,  132,   32,

			   31,  132,   18,   16,   11,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  133,    0,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  134,    0,  134,  134,  134,    0,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  135,
			    0,    0,    0,    0,    0,    0,  135,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  136,    0,  136,  136,
			  136,  136,  136,  136,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  137,    0,  137,  137,  137,    0,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,

			  138,    0,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  138,  139,    0,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  140,    0,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    0,    0,   32,   63,    0,    0,   45,   51,   98,
			  134,  304,  451,   38,  451,  166,  269,  451,  292,   31,
			    0,   38,  451,  451,   60,  451,    0,    0,  451,   44,
			   69,  293,  289,    0,  256,   66,   69,  248,  191,  451,
			   81,  451,  167,  180,  167,  171,  159,  162,   84,  181,
			   81,    0,   53,    0,  451,  158,   88,  451,    0,    0,
			   89,  451,   91,  104,  179,   49,    0,    0,  183,  105,
			  451,  109,  451,   85,  103,  176,  110,    0,  154,  162,
			  154,  159,  163,  153,  451,  451,   72,  169,  157,  110,
			  451,  112,  114,  116,  451,  118,  156,  142,  155,  148,

			  139,  149,  126,  159,  148,  134,  137,  140,  143,  147,
			  451,  131,  126,  111,  108,  451,  101,  101,  451,  451,
			  451,  451,   91,   99,  451,  451,  202,  219,  236,  253,
			  263,  280,  297,  314,  331,  348,  365,  382,  399,  416,
			  433,  151,  155>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,  125,    1,    1,    1,  126,  126,  127,  127,  128,
			  128,  125,  125,  125,  125,  125,  129,  125,  125,  125,
			  130,  125,  125,  125,  125,  125,  131,  132,  125,  133,
			  133,  134,  125,  135,  125,  136,  125,  137,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  129,  138,  125,  130,  125,  125,  125,  125,  131,  132,
			  133,  125,  133,  133,  125,  134,  139,  135,  125,  136,
			  125,  136,  125,  125,  125,  125,  137,  140,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  141,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,

			  125,  125,  125,  142,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,    0,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  125,  125,  125>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    6,    7,    1,    8,
			    1,    1,    1,    1,    9,   10,    1,   11,   12,   12,
			   12,   12,   12,   12,   12,   12,   13,   13,   14,   15,
			    1,    1,    1,    1,    1,   16,   17,   18,   17,   19,
			   20,   21,   22,   23,   24,   25,   26,   24,   27,   28,
			   29,   24,   30,   31,   32,   24,   24,   24,   33,   24,
			   24,    1,   34,    1,    1,   35,    1,   16,   17,   18,

			   17,   19,   20,   21,   22,   23,   24,   25,   26,   24,
			   27,   28,   29,   24,   30,   31,   32,   24,   24,   24,
			   33,   24,   24,   36,   37,   38,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    1,    1,    2,    1,    3,    4,    5,    6,    1,
			    7,    1,    8,    9,    1,    1,    8,    8,    8,    8,
			    8,   10,   10,   10,   10,   10,   10,   10,   11,   12,
			   13,   14,   15,   16,    1,   17,    1,    1,    4>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    0,    0,    0,    0,    0,    0,   25,   25,   32,
			   32,   44,   42,   12,   13,   11,   42,    7,   42,   15,
			   14,   42,   18,   20,   22,   19,   24,   25,   30,   29,
			   29,   29,   29,   32,   37,   36,   36,   36,   36,   41,
			   12,   10,    0,    0,    0,    0,    0,    0,    9,    0,
			    0,   12,   15,   14,   23,    0,   22,   21,   24,   25,
			    0,   26,   26,   31,    0,    0,   28,   32,   37,    0,
			   33,   33,   38,    0,   39,    0,    0,   35,    0,    0,
			    0,    0,    0,    0,    8,   16,    0,    0,    0,    0,
			   27,    0,    0,   40,   34,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    2,    0,    0,    0,    0,   17,    0,    0,    3,    5,
			    1,    6,    0,    0,    4,    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 451
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 125
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 126
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 43
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 44
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECTION2: INTEGER is 1
	SECTION3: INTEGER is 2
	EIFFEL_CODE: INTEGER is 3
	EIFFEL_ACTION: INTEGER is 4
			-- Start condition codes

feature -- User-defined features



end -- class PR_YACC_SCANNER
