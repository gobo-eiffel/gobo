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

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= EIFFEL_ACTION)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 28 then
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 38
last_token := T_TOKEN
else
--|#line 39
last_token := T_LEFT
end
else
if yy_act = 3 then
--|#line 40
last_token := T_RIGHT
else
--|#line 41
last_token := T_NONASSOC
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 42
last_token := T_TYPE
else
--|#line 43
last_token := T_START
end
else
--|#line 44
last_token := T_EXPECT
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 45
last_token := Comma_code
else
--|#line 46
last_token := Less_than_code
end
else
if yy_act = 10 then
--|#line 47
last_token := Greater_than_code
else
--|#line 48
last_token := Left_bracket_code
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 49
last_token := Right_bracket_code
else
--|#line 50

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_CODE)
					
end
else
--|#line 54

						set_start_condition (EIFFEL_CODE)
					
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
--|#line 57

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
else
--|#line 61
last_token := T_UNKNOWN
end
else
if yy_act = 17 then
--|#line 65
-- Separator or comment.
else
--|#line 66
line_nb := line_nb + 1
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 68

						last_token := T_INTEGER
						last_value := text
					
else
--|#line 72

						last_token := T_BOOLEAN
						last_value := text
					
end
else
--|#line 76

						last_token := T_REAL
						last_value := text
					
end
end
else
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 80

						last_token := T_DOUBLE
						last_value := text
					
else
--|#line 84

						last_token := T_CHARACTER
						last_value := text
					
end
else
if yy_act = 24 then
--|#line 88

						last_token := T_POINTER
						last_value := text
					
else
--|#line 92

						last_token := T_IDENTIFIER
						last_value := text
					
end
end
else
if yy_act <= 27 then
if yy_act = 26 then
--|#line 96

						last_token := T_NUMBER
						last_value := text.to_integer
						if last_value.is_equal (0) then
							report_null_integer_error
						end
					
else
--|#line 103

						last_token := T_CHAR
						last_value := text
					
end
else
--|#line 110
last_token := T_PREC
end
end
end
end
else
if yy_act <= 42 then
if yy_act <= 35 then
if yy_act <= 32 then
if yy_act <= 30 then
if yy_act = 29 then
--|#line 111

						last_token := Colon_code
						last_value := line_nb
					
else
--|#line 115

						last_token := Bar_code
						last_value := line_nb
					
end
else
if yy_act = 31 then
--|#line 119
last_token := Semicolon_code
else
--|#line 120

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					
end
end
else
if yy_act <= 34 then
if yy_act = 33 then
--|#line 124

						set_start_condition (EIFFEL_ACTION)
					
else
--|#line 127

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
end
else
--|#line 134

						last_token := T_USER_CODE
						last_value := text
					
end
end
else
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act = 36 then
--|#line 141
more
else
--|#line 142
more
end
else
if yy_act = 38 then
--|#line 143
more
else
--|#line 144
more
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 145
more
else
--|#line 146

					line_nb := line_nb + 1
					more
				
end
else
--|#line 150

					last_token := T_EIFFEL
					last_value := text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
end
end
end
else
if yy_act <= 49 then
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 164

					action_buffer.append_string (text)
				
else
--|#line 165

					action_buffer.append_string (text)
				
end
else
if yy_act = 45 then
--|#line 166

					action_buffer.append_string (text)
				
else
--|#line 167

					action_buffer.append_string (text)
				
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 168

					action_buffer.append_string (text)
				
else
--|#line 171

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
end
else
--|#line 175

					process_dollar_dollar (rule)
				
end
end
else
if yy_act <= 52 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 178

					check is_integer: STRING_.is_integer (text_substring (2, text_count)) end
					process_dollar_n (text_substring (2, text_count).to_integer, rule)
				
else
--|#line 182

					check is_integer: STRING_.is_integer (text_substring (3, text_count)) end
					process_dollar_n (- text_substring (3, text_count).to_integer, rule)
				
end
else
--|#line 186

					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				
end
else
if yy_act <= 54 then
if yy_act = 53 then
--|#line 190

					if nb_open_brackets = 0 then
						last_token := T_ACTION
						last_value := cloned_string (action_buffer)
						action_buffer.wipe_out
						set_start_condition (SECTION2)
					else
						action_buffer.append_character ('}')
						nb_open_brackets := nb_open_brackets - 1
					end
				
else
--|#line 210

					last_token := text_item (1).code
				
end
else
--|#line 0
last_token := yyError_token
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

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   12,   13,   14,   13,   12,   12,   15,   16,   17,
			   18,   12,   19,   19,   12,   12,   20,   21,   22,   23,
			   24,   25,   22,   22,   22,   22,   26,   22,   22,   22,
			   22,   22,   27,   28,   22,   22,   22,   22,   22,   29,
			   12,   30,   12,   12,   12,   12,   31,   51,   12,   51,
			   63,   63,   71,   32,   33,   12,   12,   38,   78,   39,
			   79,   40,   41,   38,   42,   39,   81,   40,   41,  115,
			   42,   73,   74,   73,   78,  172,   79,   72,   12,   87,
			   12,   88,   34,   35,   44,  100,   45,   46,   45,   47,
			   89,   48,  101,   51,   90,   51,   91,   91,   59,  102,

			   59,   63,   63,  173,   60,   73,   74,   73,  104,   78,
			  113,   79,  173,   78,   80,   79,   87,  171,   88,  116,
			  117,  117,   91,   91,   49,   92,   50,   44,  119,   45,
			   46,   45,   47,  105,   48,  103,  136,  136,  170,  127,
			  137,  137,  138,  138,  117,  117,  139,  139,  103,   77,
			  136,  136,   60,   81,  137,  137,   86,  138,  138,   92,
			  139,  139,  128,  169,  128,  128,  168,   49,  167,   50,
			   52,   60,  166,   60,   60,  165,  164,  163,  162,  161,
			  160,  159,  158,  157,  156,   53,  155,  154,  153,  152,
			  151,  150,   54,   55,  149,  148,   56,   57,   58,  147,

			  103,  146,  145,  144,  143,  142,   59,   36,   36,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,   36,   36,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   60,  141,   60,   60,   60,  140,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   75,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   75,   75,   75,   75,   76,  135,  134,
			   76,  133,  132,  131,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   77,  130,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   81,  129,   81,   81,   81,  103,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   84,  126,  125,  124,  123,  122,  121,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   86,  120,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   92,  118,   92,   92,

			   92,   85,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   62,  114,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,   83,  112,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   94,  111,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,  110,  109,
			  108,  107,  106,  103,   99,   98,   97,   96,   95,   94,
			   93,   85,   83,   82,   70,   69,   68,   67,   66,   65,
			   62,   61,  173,   11,  173,  173,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    3,   13,    3,   13,
			   19,   19,   31,    3,    3,    3,    3,    7,   39,    7,
			   39,    7,    7,    8,    7,    8,   82,    8,    8,   82,
			    8,   34,   34,   34,   40,  170,   40,   31,    3,   45,
			    3,   45,    3,    3,    9,   58,    9,    9,    9,    9,
			   46,    9,   58,   51,   46,   51,   46,   46,   59,   59,

			   59,   63,   63,   79,   61,   73,   73,   73,   61,   77,
			   79,   77,   88,   80,   40,   80,   86,  169,   86,   88,
			   90,   90,   91,   91,    9,   93,    9,   10,   93,   10,
			   10,   10,   10,   61,   10,  104,  113,  113,  166,  104,
			  115,  115,  116,  116,  117,  117,  119,  119,  127,  136,
			  136,  136,  127,  137,  137,  137,  138,  138,  138,  139,
			  139,  139,  189,  164,  189,  189,  162,   10,  161,   10,
			   15,  190,  159,  190,  190,  158,  154,  153,  151,  150,
			  149,  148,  147,  145,  144,   15,  143,  142,  140,  135,
			  133,  132,   15,   15,  131,  130,   15,   15,   15,  129,

			  128,  126,  125,  124,  123,  122,   15,  174,  174,  174,
			  174,  174,  174,  174,  174,  174,  174,  174,  174,  174,
			  174,  174,  174,  174,  174,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  177,  121,  177,  177,  177,  120,  177,  177,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  178,
			  178,  178,  178,  178,  178,  178,  178,  178,  178,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179,

			  179,  179,  179,  179,  179,  179,  179,  180,  112,  111,
			  180,  110,  109,  108,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  181,  107,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  182,  106,  182,  182,  182,  105,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  183,  101,  100,   99,   98,   97,   96,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  184,   95,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  185,   92,  185,  185,

			  185,   85,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  186,   81,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  187,   72,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  187,
			  188,   70,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,   69,   68,
			   67,   66,   65,   60,   57,   56,   55,   54,   53,   48,
			   47,   44,   42,   41,   28,   27,   26,   25,   24,   23,
			   18,   16,   11,  173,  173,  173,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   39,    0,    0,    0,   54,   60,   81,
			  124,  492,  493,   45,  493,  163,  451,  493,  480,   38,
			  493,  493,    0,  458,  463,  456,  456,  454,  462,  493,
			  493,   45,  493,  493,   69,  493,    0,    0,  493,   53,
			   69,  476,  472,    0,  478,   74,   84,  473,  469,  493,
			  493,   91,  493,  441,  455,  445,  449,  439,   54,   96,
			  465,   96,    0,   89,    0,  441,  453,  434,  434,  442,
			  433,  493,  400,  103,  493,    0,    0,  104,  493,   99,
			  108,  407,   58,    0,    0,  398,  111,  493,  108,  493,
			  108,  110,  389,  117,    0,  347,  344,  336,  341,  346,

			  335,  330,  493,  493,  127,  340,  315,  293,  294,  290,
			  281,  280,  286,  124,  493,  128,  130,  132,  493,  134,
			  244,  227,  187,  179,  170,  180,  179,  140,  192,  177,
			  177,  165,  167,  155,    0,  169,  138,  142,  145,  148,
			  168,  493,  153,  151,  149,  153,  493,  164,  161,  158,
			  157,  156,  493,  142,  142,  493,  493,  493,  145,  137,
			    0,  135,  133,  493,  132,    0,  116,    0,    0,   97,
			   42,  493,    0,  493,  206,  224,  242,  260,  271,  288,
			  306,  324,  342,  360,  377,  395,  413,  431,  449,  156,
			  165>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  173,    1,    1,    3,  174,  174,  175,  175,  176,
			  176,  173,  173,  173,  173,  173,  177,  173,  173,  173,
			  173,  173,  178,  178,  178,  178,  178,  178,  178,  173,
			  173,  173,  173,  173,  173,  173,  179,  180,  173,  181,
			  181,  182,  173,  183,  173,  184,  173,  185,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  177,  186,  173,  178,  178,  178,  178,  178,  178,
			  178,  173,  173,  173,  173,  179,  180,  181,  173,  181,
			  181,  173,  182,  187,  183,  173,  184,  173,  184,  173,
			  173,  173,  173,  185,  188,  173,  173,  173,  173,  173,

			  173,  173,  173,  173,  173,  189,  178,  178,  178,  178,
			  178,  178,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  190,  178,
			  178,  178,  178,  178,  178,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  178,  178,  178,
			  178,  178,  173,  173,  173,  173,  173,  173,  178,  178,
			  178,  178,  178,  173,  173,  178,  178,  178,  178,  173,
			  178,  173,  178,    0,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    6,    7,    1,    8,
			    1,    1,    1,    1,    9,   10,    1,   11,   12,   12,
			   12,   12,   12,   12,   12,   12,   13,   13,   14,   15,
			   16,    1,   17,    1,    1,   18,   19,   20,   21,   22,
			   23,   24,   25,   26,   27,   28,   29,   27,   30,   31,
			   32,   27,   33,   34,   35,   36,   27,   27,   37,   38,
			   27,   39,   40,   41,    1,   42,    1,   18,   19,   20,

			   21,   22,   23,   24,   25,   26,   27,   28,   29,   27,
			   30,   31,   32,   27,   33,   34,   35,   36,   27,   27,
			   37,   38,   27,   43,   44,   45,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    3,    4,    5,    6,    1,
			    7,    1,    8,    9,    1,    1,    1,    1,    8,    8,
			    8,    8,    8,    8,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   11,   12,   13,   14,   15,   16,    1,
			    1,    1,   17,   18,    1,    4>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   36,   36,   43,
			   43,   56,   54,   17,   18,   16,   54,    8,   54,   26,
			    9,   10,   25,   25,   25,   25,   25,   25,   25,   11,
			   12,   54,   29,   31,   33,   30,   35,   36,   41,   40,
			   40,   40,   40,   43,   48,   47,   47,   47,   47,   52,
			   53,   17,   15,    0,    0,    0,    0,    0,    0,   14,
			    0,    0,   17,   26,   25,   25,   25,   25,   25,   25,
			   25,   34,    0,   33,   32,   35,   36,    0,   37,   37,
			   42,    0,    0,   39,   43,   48,    0,   44,   44,   49,
			    0,   50,    0,    0,   46,    0,    0,    0,    0,    0,

			    0,    0,   13,   27,    0,    0,   25,   25,   25,   25,
			   25,   25,    0,    0,   38,    0,    0,   51,   45,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   25,
			   25,   25,   25,   25,   21,    0,    0,    0,    0,    0,
			    0,    2,    0,    0,    0,    0,    5,   25,   25,   25,
			   25,   25,   28,    0,    0,    3,    6,    1,   25,   25,
			   22,   25,   25,    7,    0,   20,   25,   19,   24,    0,
			   25,    4,   23,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 493
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 173
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 174
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

	yyNb_rules: INTEGER is 55
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 56
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECTION2: INTEGER is 1
	SECTION3: INTEGER is 2
	EIFFEL_CODE: INTEGER is 3
	EIFFEL_ACTION: INTEGER is 4
			-- Start condition codes

feature -- User-defined features



end -- class PR_YACC_SCANNER
