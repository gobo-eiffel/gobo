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
if yy_act <= 29 then
if yy_act <= 15 then
if yy_act <= 8 then
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
if yy_act = 7 then
--|#line 45
last_token := T_EXPECT
else
--|#line 46
last_token := Comma_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 47
last_token := Less_than_code
else
--|#line 48
last_token := Greater_than_code
end
else
if yy_act = 11 then
--|#line 49
last_token := Left_bracket_code
else
--|#line 50
last_token := Right_bracket_code
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 51
last_token := T_LIKE
else
--|#line 52

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_CODE)
					
end
else
--|#line 56

						set_start_condition (EIFFEL_CODE)
					
end
end
end
else
if yy_act <= 22 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 59

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
else
--|#line 63
last_token := T_UNKNOWN
end
else
if yy_act = 18 then
--|#line 67
-- Separator or comment.
else
--|#line 68
line_nb := line_nb + 1
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 70

						last_token := T_INTEGER
						last_value := text
					
else
--|#line 74

						last_token := T_BOOLEAN
						last_value := text
					
end
else
--|#line 78

						last_token := T_REAL
						last_value := text
					
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 82

						last_token := T_DOUBLE
						last_value := text
					
else
--|#line 86

						last_token := T_CHARACTER
						last_value := text
					
end
else
if yy_act = 25 then
--|#line 90

						last_token := T_POINTER
						last_value := text
					
else
--|#line 94

						last_token := T_IDENTIFIER
						last_value := text
					
end
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 98

						last_token := T_NUMBER
						last_value := text.to_integer
						if last_value.is_equal (0) then
							report_null_integer_error
						end
					
else
--|#line 105

						last_token := T_CHAR
						last_value := text
					
end
else
--|#line 109

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
if yy_act <= 43 then
if yy_act <= 36 then
if yy_act <= 33 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 119
last_token := T_PREC
else
--|#line 120

						last_token := Colon_code
						last_value := line_nb
					
end
else
if yy_act = 32 then
--|#line 124

						last_token := Bar_code
						last_value := line_nb
					
else
--|#line 128
last_token := Semicolon_code
end
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 129

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					
else
--|#line 133

						set_start_condition (EIFFEL_ACTION)
					
end
else
--|#line 136

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
end
end
else
if yy_act <= 40 then
if yy_act <= 38 then
if yy_act = 37 then
--|#line 143

						last_token := T_USER_CODE
						last_value := text
					
else
--|#line 150
more
end
else
if yy_act = 39 then
--|#line 151
more
else
--|#line 152
more
end
end
else
if yy_act <= 42 then
if yy_act = 41 then
--|#line 153
more
else
--|#line 154
more
end
else
--|#line 155

					line_nb := line_nb + 1
					more
				
end
end
end
else
if yy_act <= 50 then
if yy_act <= 47 then
if yy_act <= 45 then
if yy_act = 44 then
--|#line 159

					last_token := T_EIFFEL
					last_value := text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
else
--|#line 173

					action_buffer.append_string (text)
				
end
else
if yy_act = 46 then
--|#line 174

					action_buffer.append_string (text)
				
else
--|#line 175

					action_buffer.append_string (text)
				
end
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 176

					action_buffer.append_string (text)
				
else
--|#line 177

					action_buffer.append_string (text)
				
end
else
--|#line 180

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
end
end
else
if yy_act <= 54 then
if yy_act <= 52 then
if yy_act = 51 then
--|#line 184

					process_dollar_dollar (rule)
				
else
--|#line 187

					check is_integer: STRING_.is_integer (text_substring (2, text_count)) end
					process_dollar_n (text_substring (2, text_count).to_integer, rule)
				
end
else
if yy_act = 53 then
--|#line 191

					check is_integer: STRING_.is_integer (text_substring (3, text_count)) end
					process_dollar_n (- text_substring (3, text_count).to_integer, rule)
				
else
--|#line 195

					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				
end
end
else
if yy_act <= 56 then
if yy_act = 55 then
--|#line 199

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
--|#line 219

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
			   25,   26,   23,   23,   23,   23,   27,   23,   23,   28,
			   23,   23,   29,   30,   23,   23,   23,   23,   23,   31,
			   12,   32,   12,   12,   12,   12,   33,   53,   12,   53,
			   67,   67,   76,   34,   35,   12,   12,   40,   83,   41,
			   84,   42,   43,   86,   44,   40,  121,   41,   23,   42,
			   43,  179,   44,   78,   79,   78,  178,   77,   12,   83,
			   12,   84,   36,   37,   46,  177,   47,   48,   47,   49,
			   92,   50,   93,   94,   53,  105,   53,   95,   97,   96,

			   96,  125,  106,   63,  107,   63,   64,   67,   67,  176,
			  109,   78,   79,   78,   83,  180,   84,  175,   83,   85,
			   84,   92,  119,   93,   51,  174,   52,   46,  173,   47,
			   48,   47,   49,  180,   50,  110,  123,  123,   96,   96,
			  122,  108,  143,  143,  172,  133,  144,  144,  145,  145,
			  123,  123,  146,  146,  108,   82,  143,  143,   64,   86,
			  144,  144,   91,  145,  145,  171,  170,   51,  169,   52,
			   56,   97,  146,  146,  134,  168,  134,  134,   64,  167,
			   64,   64,  166,  165,  164,   57,  163,  162,  161,  160,
			  159,  158,   58,   59,  157,  156,   60,   61,   62,  155,

			  154,  108,  153,  152,  151,  150,   63,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   39,   39,   39,   39,   39,
			   39,   39,   39,   39,   39,   39,   39,   39,   39,   39,
			   39,   39,   39,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   54,  149,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   64,
			  148,   64,   64,   64,  147,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   68,   68,   68,

			   68,   68,   68,   68,   68,   68,   68,   80,   80,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   80,   80,   80,   80,   80,   81,  142,  141,   81,  140,
			  139,  138,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   82,  137,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   86,  136,   86,   86,   86,  135,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   89,
			  108,  132,  131,  130,  129,  128,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   91,  127,   91,   91,

			   91,   91,   91,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   97,  126,   97,   97,   97,  124,
			   97,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			   97,   97,   66,   90,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   88,  120,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   99,  118,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,  117,  116,  115,  114,
			  113,  112,  111,  108,  104,  103,  102,  101,  100,   55,

			   99,   98,   90,   88,   87,   75,   74,   73,   72,   71,
			   70,   69,   66,   65,   55,  180,   11,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180>>)
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
			   20,   20,   33,    3,    3,    3,    3,    7,   41,    7,
			   41,    7,    7,   87,    7,    8,   87,    8,    3,    8,
			    8,  177,    8,   36,   36,   36,  176,   33,    3,   42,
			    3,   42,    3,    3,    9,  173,    9,    9,    9,    9,
			   47,    9,   47,   48,   53,   62,   53,   48,   98,   48,

			   48,   98,   62,   63,   63,   63,   65,   67,   67,  171,
			   65,   78,   78,   78,   82,   84,   82,  169,   85,   42,
			   85,   91,   84,   91,    9,  168,    9,   10,  166,   10,
			   10,   10,   10,   93,   10,   65,   95,   95,   96,   96,
			   93,  109,  119,  119,  165,  109,  121,  121,  122,  122,
			  123,  123,  125,  125,  133,  143,  143,  143,  133,  144,
			  144,  144,  145,  145,  145,  161,  160,   10,  158,   10,
			   16,  146,  146,  146,  197,  157,  197,  197,  198,  156,
			  198,  198,  155,  154,  152,   16,  151,  150,  149,  147,
			  142,  140,   16,   16,  138,  137,   16,   16,   16,  136,

			  135,  134,  132,  131,  130,  129,   16,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  183,  183,  183,  183,  183,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  184,  128,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  185,
			  127,  185,  185,  185,  126,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  185,  185,  185,  186,  186,  186,

			  186,  186,  186,  186,  186,  186,  186,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  188,  118,  117,  188,  116,
			  115,  114,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  189,  113,  189,  189,  189,  189,  189,
			  189,  189,  189,  189,  189,  189,  189,  189,  189,  189,
			  189,  190,  112,  190,  190,  190,  111,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  191,
			  110,  106,  105,  104,  103,  102,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  192,  101,  192,  192,

			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  193,  100,  193,  193,  193,   97,
			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  194,   90,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  195,   86,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  196,   77,
			  196,  196,  196,  196,  196,  196,  196,  196,  196,  196,
			  196,  196,  196,  196,  196,  196,   75,   74,   73,   72,
			   71,   70,   69,   64,   61,   60,   59,   58,   57,   54,

			   50,   49,   46,   44,   43,   30,   29,   28,   27,   26,
			   25,   24,   19,   17,   15,   11,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   39,    0,    0,    0,   54,   62,   81,
			  124,  515,  516,   45,  516,  509,  163,  473,  516,  502,
			   38,  516,  516,    0,  480,  485,  478,  478,  481,  475,
			  483,  516,  516,   45,  516,  516,   71,  516,    0,    0,
			  516,   53,   74,  497,  493,    0,  499,   85,   87,  494,
			  490,  516,  516,   92,  494,  516,  516,  461,  475,  465,
			  469,  459,   64,  101,  485,   98,    0,   95,    0,  461,
			  473,  454,  454,  460,  461,  468,  516,  436,  109,  516,
			    0,    0,  109,  516,  111,  113,  443,   55,    0,    0,
			  430,  116,  516,  129,  516,  124,  126,  411,   90,    0,

			  383,  374,  355,  360,  365,  354,  349,  516,  516,  133,
			  372,  337,  329,  325,  309,  308,  299,  298,  304,  130,
			  516,  134,  136,  138,  516,  140,  262,  245,  244,  180,
			  171,  181,  180,  146,  193,  178,  181,  166,  170,    0,
			  156,    0,  170,  144,  148,  151,  160,  169,  516,  154,
			  152,  151,  154,  516,  165,  162,  157,  153,  146,  516,
			  131,  131,  516,  516,  516,  114,   93,    0,   92,   84,
			  516,   78,    0,   63,    0,    0,   56,   38,  516,    0,
			  516,  206,  224,  242,  260,  278,  289,  306,  324,  342,
			  360,  378,  395,  413,  431,  449,  467,  168,  172>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  180,    1,    1,    3,  181,  181,  182,  182,  183,
			  183,  180,  180,  180,  180,  184,  180,  185,  180,  180,
			  180,  180,  180,  186,  186,  186,  186,  186,  186,  186,
			  186,  180,  180,  180,  180,  180,  180,  180,  187,  188,
			  180,  189,  189,  190,  180,  191,  180,  192,  180,  193,
			  180,  180,  180,  180,  184,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  185,  194,  180,  186,  186,
			  186,  186,  186,  186,  186,  186,  180,  180,  180,  180,
			  187,  188,  189,  180,  189,  189,  180,  190,  195,  191,
			  180,  192,  180,  192,  180,  180,  180,  180,  193,  196,

			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  197,  186,  186,  186,  186,  186,  186,  186,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  198,  186,  186,  186,  186,  186,
			  186,  186,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  186,  186,  186,  186,  186,  180,
			  180,  180,  180,  180,  180,  186,  186,  186,  186,  186,
			  180,  180,  186,  186,  186,  186,  180,  186,  180,  186,
			    0,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180>>)
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
			    0,    0,    0,    0,    0,    0,    0,   38,   38,   45,
			   45,   58,   56,   18,   19,   56,   17,   56,    8,   56,
			   27,    9,   10,   26,   26,   26,   26,   26,   26,   26,
			   26,   11,   12,   56,   31,   33,   35,   32,   37,   38,
			   43,   42,   42,   42,   42,   45,   50,   49,   49,   49,
			   49,   54,   55,   18,    0,   29,   16,    0,    0,    0,
			    0,    0,    0,   15,    0,    0,   18,   27,   26,   26,
			   26,   26,   26,   26,   26,   26,   36,    0,   35,   34,
			   37,   38,    0,   39,   39,   44,    0,    0,   41,   45,
			   50,    0,   46,   46,   51,    0,   52,    0,    0,   48,

			    0,    0,    0,    0,    0,    0,    0,   14,   28,    0,
			    0,   26,   26,   26,   26,   26,   26,   26,    0,    0,
			   40,    0,    0,   53,   47,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   26,   26,   26,   26,   13,
			   26,   22,    0,    0,    0,    0,    0,    0,    2,    0,
			    0,    0,    0,    5,   26,   26,   26,   26,   26,   30,
			    0,    0,    3,    6,    1,   26,   26,   23,   26,   26,
			    7,    0,   21,   26,   20,   25,    0,   26,    4,   24,
			    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 516
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 180
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 181
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

	yyNb_rules: INTEGER is 57
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 58
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECTION2: INTEGER is 1
	SECTION3: INTEGER is 2
	EIFFEL_CODE: INTEGER is 3
	EIFFEL_ACTION: INTEGER is 4
			-- Start condition codes

feature -- User-defined features



end -- class PR_YACC_SCANNER
