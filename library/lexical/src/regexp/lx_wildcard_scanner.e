note

	description:

		"Scanners for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_WILDCARD_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_32_value,
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
--|#line 55 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 55")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 2 then
--|#line 59 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 59")
end

					last_token := CCL_PLUS
				
when 3 then
--|#line 62 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 62")
end

					last_token := CCL_MINUS
				
when 4 then
--|#line 65 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 65")
end

					last_string_32_value := unicode_text
					if attached character_class_with_name (last_string_32_value) as l_character_class then
						last_token := CCL_OP
						last_lx_symbol_class_value := l_character_class
					else
						last_token := CCL_BRACKET
						less (1)
						set_start_condition (FIRSTCCL)
					end
				
when 5 then
--|#line 76 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 76")
end
last_token := STAR_PAREN
when 6 then
--|#line 77 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 77")
end
last_token := STAR_STAR_SLASH
when 7 then
--|#line 78 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 78")
end
last_token := text_item (1).code
when 8 then
--|#line 79 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 79")
end

					last_token := CHAR
					process_single_character
				
when 9 then
--|#line 86 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 86")
end

					last_token := CHAR
					process_single_character
				
when 10 then
--|#line 90 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 90")
end

					last_token := Double_quote_code
					set_start_condition (INITIAL)
				
when 11 then
--|#line 94 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 94")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (INITIAL)
				
when 12 then
--|#line 103 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 103")
end

					last_token := CHAR
					process_escaped_character
				
when 13 then
--|#line 107 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 107")
end

					last_token := CHAR
					process_octal_character
				
when 14 then
--|#line 111 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 111")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 15 then
--|#line 115 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 115")
end

					last_token := CHAR
					process_unicode_character
				
when 16 then
--|#line 122 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 122")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 17 then
--|#line 127 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 127")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 18 then
--|#line 132 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 132")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 19 then
--|#line 137 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 137")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 20 then
	yy_end := yy_end - 1
--|#line 142 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 142")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 21 then
	yy_end := yy_end - 1
--|#line 146 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 146")
end
last_token := Caret_code
when 22 then
--|#line 147 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 147")
end

					last_token := CHAR
					process_single_character
					set_start_condition (CCL)
				
when 23 then
--|#line 152 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 152")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 24 then
	yy_end := yy_end - 1
--|#line 161 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 161")
end
last_token := Minus_code
when 25 then
--|#line 162 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 162")
end

					last_token := CHAR
					process_single_character
				
when 26 then
--|#line 166 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 166")
end

					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 27 then
--|#line 170 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 170")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 28 then
--|#line 179 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 179")
end

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (character_text)
					end
				
when 29 then
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
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 502)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   11,   12,   13,   13,   14,   13,   10,   10,   10,
			   10,   10,   10,   15,   16,   10,   10,   17,   10,   10,
			   19,   20,   31,   46,   32,   39,   40,   49,   50,   75,
			   75,   46,   82,   21,   19,   20,   76,   76,   77,   77,
			   78,   78,   80,   80,   81,   81,   98,   21,   23,   82,
			   82,   83,   83,   49,   50,   49,   50,   92,   92,   96,
			   96,   24,   77,   25,   23,   49,   50,   49,   50,   94,
			   94,   98,   98,   49,   50,   49,   50,   24,   94,   25,
			   27,   49,   50,   49,   50,   82,   28,   49,   50,   49,
			   50,   98,   77,   29,   30,   27,   55,   57,   55,   57,

			   62,   28,   62,   64,   93,   64,   94,   93,   29,   30,
			   36,   82,   37,   38,   36,   98,   37,   38,   42,   77,
			   43,   44,   36,   94,   37,   38,   51,   82,   52,   53,
			   66,   98,   67,   68,   69,   95,   77,   94,   95,   49,
			   50,   70,   70,   82,   98,   97,   49,   50,   97,   71,
			   72,   72,   99,  106,  107,   99,  106,  107,   73,   84,
			   33,  108,  109,  115,  108,  109,  115,   33,   85,   85,
			  116,  117,  118,  116,  117,  118,   86,   87,   87,  123,
			  124,  125,  123,  124,  125,   88,   89,   89,  126,  131,
			  132,  126,  131,  132,   33,   90,   90,  133,  134,   77, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  133,  134,   94,   33,   91,   91,   82,   98,   77,   94,
			   79,   74,   33,  100,  100,   65,   63,   61,   60,   59,
			   58,   33,  101,  101,   56,   54,   48,   34,  141,  141,
			   33,  102,  102,  141,  141,  141,  141,  141,  141,   33,
			  103,  103,  141,  141,  141,  141,  141,  141,   33,  104,
			  104,  141,  141,  141,  141,  141,  141,   33,  105,  105,
			  141,  141,  141,  141,  141,  141,   33,  110,  110,  141,
			  141,  141,  141,  141,  141,   33,  111,  111,  141,  141,
			  141,  141,  141,  141,   33,  112,  112,  141,  141,  141,
			  141,  141,  141,   33,  113,  113,  141,  141,  141,  141,

			  141,  141,   33,  114,  114,  141,  141,  141,  141,  141,
			  141,   33,  119,  119,  141,  141,  141,  141,  141,  141,
			   33,  120,  120,  141,  141,  141,  141,  141,  141,   33,
			  121,  121,  141,  141,  141,  141,  141,  141,   33,  122,
			  122,  141,  141,  141,  141,  141,  141,   33,  127,  127,
			  141,  141,  141,  141,  141,  141,   33,  128,  128,  141,
			  141,  141,  141,  141,  141,   33,  129,  129,  141,  141,
			  141,  141,  141,  141,   33,  130,  130,  141,  141,  141,
			  141,  141,  141,   33,  135,  135,  141,  141,  141,  141,
			  141,  141,   33,  136,  136,  141,  141,  141,  141,  141, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  141,   33,  137,  137,  141,  141,  141,  141,  141,  141,
			   33,  138,  138,  141,  141,  141,  141,  141,  141,   33,
			  139,  139,  141,  141,  141,  141,  141,  141,   33,  140,
			  140,  141,  141,  141,  141,  141,  141,   33,   18,   18,
			   18,   18,   18,   18,   22,   22,   22,   22,   22,   22,
			   26,   26,   26,   26,   26,   26,   33,   33,   33,   33,
			   33,   35,   35,   35,   35,   35,   41,   41,   41,   41,
			   41,   45,   45,   45,   45,   45,   45,   47,   47,  141,
			   47,   47,   47,    9,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,

			  141,  141,  141, yy_Dummy>>,
			1, 103, 400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 502)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    3,   14,   25,   14,   17,   17,   33,   33,   55,
			   55,   25,  134,    3,    4,    4,   56,   56,   57,   57,
			   58,   58,   62,   62,   63,   63,  133,    4,    5,   64,
			   64,   65,   65,   69,   69,   72,   72,   75,   75,   80,
			   80,    5,  132,    5,    6,   84,   84,   87,   87,   92,
			   92,   96,   96,  103,  103,  110,  110,    6,  131,    6,
			    7,  137,  137,  138,  138,  126,    7,  139,  139,  140,
			  140,  125,  124,    7,    7,    8,  150,  151,  150,  151,

			  152,    8,  152,  153,  154,  153,  123,  154,    8,    8,
			   16,  118,   16,   16,   21,  117,   21,   21,   24,  116,
			   24,   24,   29,  115,   29,   29,   34,  109,   34,   34,
			   49,  108,   49,   49,   51,  155,  107,  106,  155,   51,
			   51,   52,   52,   99,   97,  156,   52,   52,  156,   52,
			   53,   53,  157,  158,  159,  157,  158,  159,   53,   66,
			   66,  160,  161,  162,  160,  161,  162,   66,   67,   67,
			  163,  164,  165,  163,  164,  165,   67,   68,   68,  166,
			  167,  168,  166,  167,  168,   68,   70,   70,  169,  170,
			  171,  169,  170,  171,   70,   71,   71,  172,  173,   95, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  172,  173,   93,   71,   73,   73,   83,   81,   78,   76,
			   61,   54,   73,   85,   85,   44,   43,   42,   40,   39,
			   38,   85,   86,   86,   37,   36,   32,   15,    9,    0,
			   86,   88,   88,    0,    0,    0,    0,    0,    0,   88,
			   89,   89,    0,    0,    0,    0,    0,    0,   89,   90,
			   90,    0,    0,    0,    0,    0,    0,   90,   91,   91,
			    0,    0,    0,    0,    0,    0,   91,  100,  100,    0,
			    0,    0,    0,    0,    0,  100,  101,  101,    0,    0,
			    0,    0,    0,    0,  101,  102,  102,    0,    0,    0,
			    0,    0,    0,  102,  104,  104,    0,    0,    0,    0,

			    0,    0,  104,  105,  105,    0,    0,    0,    0,    0,
			    0,  105,  111,  111,    0,    0,    0,    0,    0,    0,
			  111,  112,  112,    0,    0,    0,    0,    0,    0,  112,
			  113,  113,    0,    0,    0,    0,    0,    0,  113,  114,
			  114,    0,    0,    0,    0,    0,    0,  114,  119,  119,
			    0,    0,    0,    0,    0,    0,  119,  120,  120,    0,
			    0,    0,    0,    0,    0,  120,  121,  121,    0,    0,
			    0,    0,    0,    0,  121,  122,  122,    0,    0,    0,
			    0,    0,    0,  122,  127,  127,    0,    0,    0,    0,
			    0,    0,  127,  128,  128,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,  128,  129,  129,    0,    0,    0,    0,    0,    0,
			  129,  130,  130,    0,    0,    0,    0,    0,    0,  130,
			  135,  135,    0,    0,    0,    0,    0,    0,  135,  136,
			  136,    0,    0,    0,    0,    0,    0,  136,  142,  142,
			  142,  142,  142,  142,  143,  143,  143,  143,  143,  143,
			  144,  144,  144,  144,  144,  144,  145,  145,  145,  145,
			  145,  146,  146,  146,  146,  146,  147,  147,  147,  147,
			  147,  148,  148,  148,  148,  148,  148,  149,  149,    0,
			  149,  149,  149,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,

			  141,  141,  141, yy_Dummy>>,
			1, 103, 400)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   19,   33,   47,   63,   79,   94,  228,
			  483,  483,  483,  483,   19,  213,  101,   19,  483,  483,
			  483,  105,  483,  483,  109,   16,  483,  483,    0,  113,
			  483,  483,  218,   13,  117,  483,  216,  207,  203,  201,
			  200,  483,  208,  199,  198,  483,  483,  483,  483,  121,
			  483,  125,  132,  141,  202,   20,   27,   29,   31,  483,
			  483,  201,   33,   35,   40,   42,  150,  159,  168,   39,
			  177,  186,   41,  195,  483,   48,  191,  483,  190,  483,
			   50,  189,  483,  188,   51,  204,  213,   53,  222,  231,
			  240,  249,   60,  184,  483,  181,   62,  126,  483,  125,

			  258,  267,  276,   59,  285,  294,  119,  118,  113,  109,
			   61,  303,  312,  321,  330,  105,  101,   97,   93,  339,
			  348,  357,  366,   88,   74,   73,   67,  375,  384,  393,
			  402,   60,   44,   28,   14,  411,  420,   67,   69,   73,
			   75,  483,  437,  443,  449,  454,  459,  464,  470,  476,
			   94,   95,   98,  101,  102,  133,  143,  150,  151,  152,
			  159,  160,  161,  168,  169,  170,  177,  178,  179,  186,
			  187,  188,  195,  196, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  141,    1,  142,  142,  143,  143,  144,  144,  141,
			  141,  141,  141,  141,  141,  145,  146,  141,  141,  141,
			  141,  146,  141,  141,  147,  148,  141,  141,  149,  146,
			  141,  141,  141,  145,  145,  141,  141,  150,  151,  141,
			  141,  141,  141,  152,  153,  141,  141,  141,  141,  145,
			  141,  145,  145,   52,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,   52,   52,   52,  145,
			   52,   52,  145,   52,  141,  141,  154,  141,  155,  141,
			  141,  156,  141,  157,  145,   52,   52,  145,   52,   52,
			   52,   52,  141,  158,  141,  159,  141,  160,  141,  161,

			   52,   52,   52,  145,   52,   52,  162,  163,  164,  165,
			  145,   52,   52,   52,   52,  166,  167,  168,  169,   52,
			   52,   52,   52,  170,  171,  172,  173,   52,   52,   52,
			   52,  141,  141,  141,  141,   52,   52,  145,  145,  145,
			  145,    0,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (19, 200, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			    1,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,    2,   19,   19,   19,   19,   19,
			    3,    4,    5,    6,   19,    7,   19,    8,    9,    9,
			    9,    9,    9,    9,    9,    9,   10,   10,   19,   19,
			   19,   19,   19,    4,    4,   10,   10,   10,   10,   10,
			   10,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   11,   19,   19,   12,   19,
			   19,   13,   14,   15,   16,   19,   19,   10,   10,   10,

			   10,   10,   10,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   11,   19,   19,
			   12,   19,   19,   17,    4,   18,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19, yy_Dummy>>,
			1, 200, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    6,    6,    6,    6,    6,    6,    6,    2,
			    2,    6,    6,    6,    6,    3,    6,    4,    5,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   30,
			    8,   28,    1,    7,    7,    8,    8,    8,    9,   11,
			   10,    9,   22,   23,   22,   22,   25,   27,   25,   25,
			   26,    5,    0,    0,    0,   12,   12,   12,   12,    0,
			    0,   16,   16,   16,   16,   20,   21,   24,    6,    0,
			    4,    0,    0,    0,   13,   15,    0,   14,    0,    2,
			    3,   17,   19,    0,   18,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   13,   15,    0,   14,    0,   17,
			   19,    0,   18,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   15,    0,   15,    0,   19,    0,   19,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 483
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 141
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 142
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 19
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
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

	yyNb_rules: INTEGER = 29
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 30
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

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
