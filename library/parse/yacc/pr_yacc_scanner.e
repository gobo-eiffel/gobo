indexing

	description:

		"Scanners for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
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
--|#line 39
last_token := T_TOKEN
else
--|#line 40
last_token := T_LEFT
end
else
if yy_act = 3 then
--|#line 41
last_token := T_RIGHT
else
--|#line 42
last_token := T_NONASSOC
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 43
last_token := T_TYPE
else
--|#line 44
last_token := T_START
end
else
--|#line 45
last_token := T_EXPECT
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 46
last_token := Comma_code
else
--|#line 47
last_token := Less_than_code
end
else
if yy_act = 10 then
--|#line 48
last_token := Greater_than_code
else
--|#line 49
last_token := Left_bracket_code
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 50
last_token := Right_bracket_code
else
--|#line 51

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_CODE)
					
end
else
--|#line 55

						set_start_condition (EIFFEL_CODE)
					
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
--|#line 58

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
else
--|#line 62
last_token := T_UNKNOWN
end
else
if yy_act = 17 then
--|#line 66
-- Separator or comment.
else
--|#line 67
line_nb := line_nb + 1
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 69

						last_token := T_INTEGER
						last_value := text
					
else
--|#line 73

						last_token := T_BOOLEAN
						last_value := text
					
end
else
--|#line 77

						last_token := T_REAL
						last_value := text
					
end
end
else
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 81

						last_token := T_DOUBLE
						last_value := text
					
else
--|#line 85

						last_token := T_CHARACTER
						last_value := text
					
end
else
if yy_act = 24 then
--|#line 89

						last_token := T_POINTER
						last_value := text
					
else
--|#line 93

						last_token := T_IDENTIFIER
						last_value := text
					
end
end
else
if yy_act <= 27 then
if yy_act = 26 then
--|#line 97

						last_token := T_NUMBER
						last_value := text.to_integer
						if last_value.is_equal (0) then
							report_null_integer_error
						end
					
else
--|#line 104

						last_token := T_CHAR
						last_value := text
					
end
else
--|#line 108

						last_token := T_STR
						last_value := text
						if text_count < 4 then
							report_invalid_string_token_error (text)
						end
					
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
--|#line 118
last_token := T_PREC
else
--|#line 119

						last_token := Colon_code
						last_value := line_nb
					
end
else
if yy_act = 31 then
--|#line 123

						last_token := Bar_code
						last_value := line_nb
					
else
--|#line 127
last_token := Semicolon_code
end
end
else
if yy_act <= 34 then
if yy_act = 33 then
--|#line 128

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					
else
--|#line 132

						set_start_condition (EIFFEL_ACTION)
					
end
else
--|#line 135

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
end
end
else
if yy_act <= 39 then
if yy_act <= 37 then
if yy_act = 36 then
--|#line 142

						last_token := T_USER_CODE
						last_value := text
					
else
--|#line 149
more
end
else
if yy_act = 38 then
--|#line 150
more
else
--|#line 151
more
end
end
else
if yy_act <= 41 then
if yy_act = 40 then
--|#line 152
more
else
--|#line 153
more
end
else
--|#line 154

					line_nb := line_nb + 1
					more
				
end
end
end
else
if yy_act <= 49 then
if yy_act <= 46 then
if yy_act <= 44 then
if yy_act = 43 then
--|#line 158

					last_token := T_EIFFEL
					last_value := text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
else
--|#line 172

					action_buffer.append_string (text)
				
end
else
if yy_act = 45 then
--|#line 173

					action_buffer.append_string (text)
				
else
--|#line 174

					action_buffer.append_string (text)
				
end
end
else
if yy_act <= 48 then
if yy_act = 47 then
--|#line 175

					action_buffer.append_string (text)
				
else
--|#line 176

					action_buffer.append_string (text)
				
end
else
--|#line 179

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
end
end
else
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 183

					process_dollar_dollar (rule)
				
else
--|#line 186

					check is_integer: STRING_.is_integer (text_substring (2, text_count)) end
					process_dollar_n (text_substring (2, text_count).to_integer, rule)
				
end
else
if yy_act = 52 then
--|#line 190

					check is_integer: STRING_.is_integer (text_substring (3, text_count)) end
					process_dollar_n (- text_substring (3, text_count).to_integer, rule)
				
else
--|#line 194

					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 198

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
--|#line 218

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
			    0,   12,   13,   14,   13,   15,   12,   16,   17,   18,
			   19,   12,   20,   20,   12,   12,   21,   22,   23,   24,
			   25,   26,   23,   23,   23,   23,   27,   23,   23,   23,
			   23,   23,   28,   29,   23,   23,   23,   23,   23,   30,
			   12,   31,   12,   12,   12,   12,   32,   52,   12,   52,
			   66,   66,   74,   33,   34,   12,   12,   39,   81,   40,
			   82,   41,   42,   39,   43,   40,   84,   41,   42,  118,
			   43,   76,   77,   76,   81,  175,   82,   75,   12,   90,
			   12,   91,   35,   36,   45,  103,   46,   47,   46,   48,
			   92,   49,  104,   52,   93,   52,   94,   94,   62,  105,

			   62,   66,   66,  176,   63,   76,   77,   76,  107,   81,
			  116,   82,  176,   81,   83,   82,   90,  174,   91,  119,
			  120,  120,   94,   94,   50,   95,   51,   45,  122,   46,
			   47,   46,   48,  108,   49,  106,  139,  139,  173,  130,
			  140,  140,  141,  141,  120,  120,  142,  142,  106,   80,
			  139,  139,   63,   84,  140,  140,   89,  141,  141,   95,
			  142,  142,  131,  172,  131,  131,  171,   50,  170,   51,
			   55,   63,  169,   63,   63,  168,  167,  166,  165,  164,
			  163,  162,  161,  160,  159,   56,  158,  157,  156,  155,
			  154,  153,   57,   58,  152,  151,   59,   60,   61,  150,

			  106,  149,  148,  147,  146,  145,   62,   37,   37,   37,
			   37,   37,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   37,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   53,  144,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   63,
			  143,   63,   63,   63,  138,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   67,   67,   67,

			   67,   67,   67,   67,   67,   67,   67,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   79,  137,  136,   79,  135,
			  134,  133,   79,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   80,  132,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   84,  106,   84,   84,   84,  129,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   87,
			  128,  127,  126,  125,  124,  123,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   89,  121,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   95,   88,   95,   95,   95,  117,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   65,  115,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   86,  114,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   97,  113,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   97,   97,   97,   97,  112,  111,  110,  109,
			  106,  102,  101,  100,   99,   98,   54,   97,   96,   88,

			   86,   85,   73,   72,   71,   70,   69,   68,   65,   64,
			   54,  176,   11,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176>>)
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
			   20,   20,   32,    3,    3,    3,    3,    7,   40,    7,
			   40,    7,    7,    8,    7,    8,   85,    8,    8,   85,
			    8,   35,   35,   35,   41,  173,   41,   32,    3,   46,
			    3,   46,    3,    3,    9,   61,    9,    9,    9,    9,
			   47,    9,   61,   52,   47,   52,   47,   47,   62,   62,

			   62,   66,   66,   82,   64,   76,   76,   76,   64,   80,
			   82,   80,   91,   83,   41,   83,   89,  172,   89,   91,
			   93,   93,   94,   94,    9,   96,    9,   10,   96,   10,
			   10,   10,   10,   64,   10,  107,  116,  116,  169,  107,
			  118,  118,  119,  119,  120,  120,  122,  122,  130,  139,
			  139,  139,  130,  140,  140,  140,  141,  141,  141,  142,
			  142,  142,  193,  167,  193,  193,  165,   10,  164,   10,
			   16,  194,  162,  194,  194,  161,  157,  156,  154,  153,
			  152,  151,  150,  148,  147,   16,  146,  145,  143,  138,
			  136,  135,   16,   16,  134,  133,   16,   16,   16,  132,

			  131,  129,  128,  127,  126,  125,   16,  177,  177,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,  177,  178,  178,  178,  178,  178,
			  178,  178,  178,  178,  178,  178,  178,  178,  178,  178,
			  178,  178,  178,  179,  179,  179,  179,  179,  179,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179,
			  179,  180,  124,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  181,
			  123,  181,  181,  181,  115,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  182,  182,  182,

			  182,  182,  182,  182,  182,  182,  182,  183,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  183,  183,  183,  183,  184,  114,  113,  184,  112,
			  111,  110,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  185,  109,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  185,
			  185,  186,  108,  186,  186,  186,  104,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  187,
			  103,  102,  101,  100,   99,   98,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  188,   95,  188,  188,

			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  189,   88,  189,  189,  189,   84,
			  189,  189,  189,  189,  189,  189,  189,  189,  189,  189,
			  189,  189,  190,   75,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  191,   73,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  192,   72,
			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  192,  192,   71,   70,   69,   68,
			   63,   60,   59,   58,   57,   56,   53,   49,   48,   45,

			   43,   42,   29,   28,   27,   26,   25,   24,   19,   17,
			   15,   11,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   39,    0,    0,    0,   54,   60,   81,
			  124,  511,  512,   45,  512,  505,  163,  469,  512,  498,
			   38,  512,  512,    0,  476,  481,  474,  474,  472,  480,
			  512,  512,   45,  512,  512,   69,  512,    0,    0,  512,
			   53,   69,  494,  490,    0,  496,   74,   84,  491,  487,
			  512,  512,   91,  491,  512,  512,  458,  472,  462,  466,
			  456,   54,   96,  482,   96,    0,   89,    0,  458,  470,
			  451,  451,  443,  433,  512,  400,  103,  512,    0,    0,
			  104,  512,   99,  108,  411,   58,    0,    0,  412,  111,
			  512,  108,  512,  108,  110,  389,  117,    0,  353,  361,

			  353,  358,  363,  352,  334,  512,  512,  127,  354,  315,
			  298,  311,  307,  297,  297,  262,  124,  512,  128,  130,
			  132,  512,  134,  258,  227,  187,  179,  170,  180,  179,
			  140,  192,  177,  177,  165,  167,  155,    0,  169,  138,
			  142,  145,  148,  168,  512,  153,  151,  149,  153,  512,
			  164,  161,  158,  157,  156,  512,  142,  142,  512,  512,
			  512,  145,  137,    0,  135,  133,  512,  132,    0,  116,
			    0,    0,   97,   42,  512,    0,  512,  206,  224,  242,
			  260,  278,  289,  306,  324,  342,  360,  378,  395,  413,
			  431,  449,  467,  156,  165>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  176,    1,    1,    3,  177,  177,  178,  178,  179,
			  179,  176,  176,  176,  176,  180,  176,  181,  176,  176,
			  176,  176,  176,  182,  182,  182,  182,  182,  182,  182,
			  176,  176,  176,  176,  176,  176,  176,  183,  184,  176,
			  185,  185,  186,  176,  187,  176,  188,  176,  189,  176,
			  176,  176,  176,  180,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  181,  190,  176,  182,  182,  182,
			  182,  182,  182,  182,  176,  176,  176,  176,  183,  184,
			  185,  176,  185,  185,  176,  186,  191,  187,  176,  188,
			  176,  188,  176,  176,  176,  176,  189,  192,  176,  176,

			  176,  176,  176,  176,  176,  176,  176,  176,  193,  182,
			  182,  182,  182,  182,  182,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  194,  182,  182,  182,  182,  182,  182,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  182,  182,  182,  182,  182,  176,  176,  176,  176,  176,
			  176,  182,  182,  182,  182,  182,  176,  176,  182,  182,
			  182,  182,  176,  182,  176,  182,    0,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176>>)
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
			    0,    0,    0,    0,    0,    0,    0,   37,   37,   44,
			   44,   57,   55,   17,   18,   55,   16,   55,    8,   55,
			   26,    9,   10,   25,   25,   25,   25,   25,   25,   25,
			   11,   12,   55,   30,   32,   34,   31,   36,   37,   42,
			   41,   41,   41,   41,   44,   49,   48,   48,   48,   48,
			   53,   54,   17,    0,   28,   15,    0,    0,    0,    0,
			    0,    0,   14,    0,    0,   17,   26,   25,   25,   25,
			   25,   25,   25,   25,   35,    0,   34,   33,   36,   37,
			    0,   38,   38,   43,    0,    0,   40,   44,   49,    0,
			   45,   45,   50,    0,   51,    0,    0,   47,    0,    0,

			    0,    0,    0,    0,    0,   13,   27,    0,    0,   25,
			   25,   25,   25,   25,   25,    0,    0,   39,    0,    0,
			   52,   46,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   25,   25,   25,   25,   25,   21,    0,    0,
			    0,    0,    0,    0,    2,    0,    0,    0,    0,    5,
			   25,   25,   25,   25,   25,   29,    0,    0,    3,    6,
			    1,   25,   25,   22,   25,   25,    7,    0,   20,   25,
			   19,   24,    0,   25,    4,   23,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 512
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 176
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 177
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

	yyNb_rules: INTEGER is 56
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 57
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECTION2: INTEGER is 1
	SECTION3: INTEGER is 2
	EIFFEL_CODE: INTEGER is 3
	EIFFEL_ACTION: INTEGER is 4
			-- Start condition codes

feature -- User-defined features



end -- class PR_YACC_SCANNER
