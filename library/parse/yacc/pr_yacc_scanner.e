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
if yy_act <= 39 then
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
if yy_act <= 38 then
if yy_act = 37 then
--|#line 142

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
else
--|#line 146

					process_dollar_dollar
				
end
else
--|#line 149

					check is_integer: STRING_.is_integer (text_substring (2, text_count)) end
					process_dollar_n (text_substring (2, text_count).to_integer)
				
end
end
else
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
--|#line 153

					check is_integer: STRING_.is_integer (text_substring (3, text_count)) end
					process_dollar_n (- text_substring (3, text_count).to_integer)
				
else
--|#line 157

					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				
end
else
--|#line 161

					if nb_open_brackets = 0 then
						last_token := T_ACTION
						last_value := cloned_string (action_buffer)
						action_buffer.wipe_out
						set_start_condition (SECTION2)
					else
						action_buffer.append_character ('}')
						nb_open_brackets := nb_open_brackets - 1
					end
				
end
else
if yy_act = 43 then
--|#line 181

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

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   12,   13,   14,   13,   12,   12,   15,   16,   17,
			   18,   12,   19,   19,   12,   12,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   12,   12,   12,   12,   12,   21,
			   41,   12,   41,   53,   53,   55,   22,   23,   28,   62,
			   29,   63,   30,   31,   28,   32,   29,   65,   30,   31,
			   92,   32,   57,   58,   57,   53,   53,   56,   24,   25,
			   21,   71,   12,   72,   62,   73,   63,   22,   23,   74,
			   86,   75,   75,   41,  103,   41,   49,   85,   49,   50,
			   57,   58,   57,   87,   62,  126,   63,   94,   94,   24,

			   25,   34,   90,   35,   36,   35,   37,   64,   38,   62,
			   71,   63,   72,  126,   88,   75,   75,  125,   76,  124,
			   93,   96,  106,  106,  107,  107,  108,  108,   94,   94,
			  109,  109,  123,  122,   39,  121,   40,   34,  120,   35,
			   36,   35,   37,   86,   38,  119,  118,   50,   61,  106,
			  106,   65,  107,  107,   70,  108,  108,   76,  109,  109,
			  104,  117,  104,  104,   50,  116,   50,   50,   86,  115,
			   39,  114,   40,   42,  113,  112,  111,  110,  105,   86,
			  102,  101,  100,   99,   98,   43,   97,   95,   69,   91,
			   89,   86,   44,   45,   84,   83,   46,   47,   48,   82,

			   81,   80,   49,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   50,   79,   50,
			   50,   50,   78,   50,   50,   50,   50,   50,   50,   50,
			   50,   50,   50,   50,   50,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   59,   59,   59,

			   59,   59,   59,   60,   77,   69,   60,   67,   66,   52,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   61,   51,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   65,
			  126,   65,   65,   65,  126,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   68,  126,  126,
			  126,  126,  126,  126,   68,   68,   68,   68,   68,   68,
			   68,   68,   68,   68,   70,  126,   70,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   76,  126,   76,   76,   76,  126,   76,   76,

			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   52,  126,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   67,  126,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   67,   67,   67,   67,   78,  126,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   11,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,

			  126,  126,  126>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			   13,    3,   13,   19,   19,   21,    3,    3,    7,   29,
			    7,   29,    7,    7,    8,    7,    8,   66,    8,    8,
			   66,    8,   24,   24,   24,   53,   53,   21,    3,    3,
			    4,   35,    4,   35,   30,   36,   30,    4,    4,   36,
			   87,   36,   36,   41,   87,   41,   49,   49,   49,   51,
			   57,   57,   57,   51,   61,   63,   61,   74,   74,    4,

			    4,    9,   63,    9,    9,    9,    9,   30,    9,   64,
			   70,   64,   70,   72,   51,   75,   75,  124,   77,  123,
			   72,   77,   90,   90,   92,   92,   93,   93,   94,   94,
			   96,   96,  118,  117,    9,  115,    9,   10,  114,   10,
			   10,   10,   10,  103,   10,  113,  112,  103,  106,  106,
			  106,  107,  107,  107,  108,  108,  108,  109,  109,  109,
			  142,  110,  142,  142,  143,  105,  143,  143,  104,  102,
			   10,  101,   10,   15,  100,   99,   98,   97,   89,   88,
			   84,   83,   82,   81,   80,   15,   79,   76,   69,   65,
			   56,   50,   15,   15,   48,   47,   15,   15,   15,   46,

			   45,   44,   15,  127,  127,  127,  127,  127,  127,  127,
			  127,  127,  127,  127,  127,  127,  127,  127,  127,  127,
			  127,  128,  128,  128,  128,  128,  128,  128,  128,  128,
			  128,  128,  128,  128,  128,  128,  128,  128,  128,  129,
			  129,  129,  129,  129,  129,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  129,  129,  129,  130,   43,  130,
			  130,  130,   38,  130,  130,  130,  130,  130,  130,  130,
			  130,  130,  130,  130,  130,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  131,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,

			  132,  132,  132,  133,   37,   34,  133,   32,   31,   18,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  134,   16,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  135,
			   11,  135,  135,  135,    0,  135,  135,  135,  135,  135,
			  135,  135,  135,  135,  135,  135,  135,  136,    0,    0,
			    0,    0,    0,    0,  136,  136,  136,  136,  136,  136,
			  136,  136,  136,  136,  137,    0,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  138,    0,  138,  138,  138,    0,  138,  138,

			  138,  138,  138,  138,  138,  138,  138,  138,  138,  138,
			  139,    0,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  140,    0,
			  140,  140,  140,  140,  140,  140,  140,  140,  140,  140,
			  140,  140,  140,  140,  140,  140,  141,    0,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,

			  126,  126,  126>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   32,   63,    0,    0,   45,   51,   98,
			  134,  340,  464,   38,  464,  166,  288,  464,  299,   31,
			    0,   38,  464,  464,   60,  464,    0,    0,  464,   44,
			   69,  301,  297,    0,  302,   66,   69,  297,  252,  464,
			  464,   81,  464,  225,  182,  172,  176,  163,  166,   84,
			  183,   81,    0,   53,    0,  464,  160,   88,  464,    0,
			    0,   89,  464,   91,  104,  181,   49,    0,    0,  185,
			  105,  464,  109,  464,   85,  103,  179,  110,    0,  157,
			  164,  156,  161,  165,  155,  464,  464,   72,  171,  159,
			  110,  464,  112,  114,  116,  464,  118,  158,  144,  159,

			  152,  141,  150,  135,  160,  147,  137,  140,  143,  146,
			  143,  464,  115,  113,  106,  108,  464,  101,  101,  464,
			  464,  464,  464,   91,   99,  464,  464,  202,  220,  238,
			  256,  267,  284,  302,  320,  338,  356,  373,  391,  409,
			  427,  445,  154,  158>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,  126,    1,    1,    1,  127,  127,  128,  128,  129,
			  129,  126,  126,  126,  126,  126,  130,  126,  126,  126,
			  131,  126,  126,  126,  126,  126,  132,  133,  126,  134,
			  134,  135,  126,  136,  126,  137,  126,  138,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  130,  139,  126,  131,  126,  126,  126,  126,  132,
			  133,  134,  126,  134,  134,  126,  135,  140,  136,  126,
			  137,  126,  137,  126,  126,  126,  126,  138,  141,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  142,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,

			  126,  126,  126,  126,  143,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,    0,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126>>)
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    3,    4,    5,    6,    1,
			    7,    1,    8,    9,    1,    1,    8,    8,    8,    8,
			    8,   10,   10,   10,   10,   10,   10,   10,   11,   12,
			   13,   14,   15,   16,    1,   17,   18,    1,    4>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   25,   25,   32,
			   32,   45,   43,   12,   13,   11,   43,    7,   43,   15,
			   14,   43,   18,   20,   22,   19,   24,   25,   30,   29,
			   29,   29,   29,   32,   37,   36,   36,   36,   36,   41,
			   42,   12,   10,    0,    0,    0,    0,    0,    0,    9,
			    0,    0,   12,   15,   14,   23,    0,   22,   21,   24,
			   25,    0,   26,   26,   31,    0,    0,   28,   32,   37,
			    0,   33,   33,   38,    0,   39,    0,    0,   35,    0,
			    0,    0,    0,    0,    0,    8,   16,    0,    0,    0,
			    0,   27,    0,    0,   40,   34,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    2,    0,    0,    0,    0,   17,    0,    0,    3,
			    5,    1,    6,    0,    0,    4,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 464
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 126
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 127
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

	yyNb_rules: INTEGER is 44
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 45
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECTION2: INTEGER is 1
	SECTION3: INTEGER is 2
	EIFFEL_CODE: INTEGER is 3
	EIFFEL_ACTION: INTEGER is 4
			-- Start condition codes

feature -- User-defined features



end -- class PR_YACC_SCANNER
