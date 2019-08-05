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

					last_string_value := text
					if attached character_class_with_name (last_string_value) as l_character_class then
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
					process_utf8_character
				
when 9 then
--|#line 86 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 86")
end

					last_token := CHAR
					process_utf8_character
				
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
	yy_end := yy_start + yy_more_len + 1
--|#line 142 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 142")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 21 then
	yy_end := yy_start + yy_more_len + 1
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
					process_utf8_character
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
	yy_end := yy_start + yy_more_len + 1
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
					process_utf8_character
				
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

					report_bad_character_error (text)
				
when 29 then
--|#line 182 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 182")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 30 then
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
			create an_array.make_filled (0, 0, 931)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   11,   12,   13,   13,   14,   13,   10,   10,   10,
			   10,   10,   10,   15,   16,   10,   10,   17,   10,   18,
			   18,   18,   18,   19,   20,   21,   22,   23,   24,   25,
			   10,   27,   28,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   29,   26,   26,   26,   26,   18,
			   18,   18,   18,   30,   31,   32,   33,   34,   35,   36,
			   26,   38,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   39,   37,   40,   37,   37,   18,
			   18,   18,   18,   41,   42,   43,   44,   45,   46,   47,
			   37,   49,   48,   48,   48,   48,   48,   50,   48,   48,

			   48,   48,   48,   48,   51,   52,   48,   48,   48,   18,
			   18,   18,   18,   53,   54,   55,   56,   57,   58,   59,
			   48,   60,  255,   61,   63,   82,   83,   84,   84,   84,
			   86,   86,   86,   64,   65,   66,   67,   68,   69,   70,
			   72,  292,   73,   74,   87,   87,   88,   88,   89,   89,
			   89,   91,   91,   91,   75,   76,   77,   78,   79,   80,
			   81,   72,  247,   73,   74,   93,   93,   93,   94,   94,
			   95,   95,   96,   96,   96,   75,   76,   77,   78,   79,
			   80,   81,   99,  288,  100,  101,  118,  118,  118,  120,
			  120,  120,  121,  121,  122,  122,  102,  103,  104,  105, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  106,  107,  108,  110,  123,  123,  123,  133,  133,  133,
			  276,  110,  135,  135,  135,  136,  136,  137,  137,  111,
			  112,  113,  114,  115,  116,  117,  126,  127,  128,  129,
			  130,  131,  132,  138,  138,  138,  141,  142,   62,   62,
			   62,  161,  161,  161,  271,  143,  144,  145,  146,  147,
			  148,  149,  150,  266,  151,  152,  162,  162,  163,  163,
			  164,  164,  164,   71,   71,   71,  153,  154,  155,  156,
			  157,  158,  159,  167,  167,  169,  169,  172,  172,  172,
			   62,  168,   62,  170,  173,  173,  174,  174,  175,  175,
			  175,   84,   84,   84,   84,   84,   84,   84,   84,   84,

			  179,  179,  179,  180,  180,  180,  181,  181,  181,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,  182,  182,
			  182,  183,  183,  183,  184,  184,  184,  186,  186,  188,
			  188,   98,   98,   98,   71,  187,   71,  189,  191,  191,
			  191,  192,  192,  193,  193,  194,  194,  194,  109,  109,
			  109,  197,  197,  197,  198,  198,  199,  199,  200,  200,
			  200,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  202,  202,  202,  203,  203,  203,  204,  204,  204,  125,
			  125,  125,  206,  206,  206,  207,  207,  208,  208,  209,
			  209,  209,  133,  133,  133,  133,  133,  133,  133,  133, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  133,  211,  211,  211,  212,  212,  212,  213,  213,  213,
			  214,  252,  215,  216,   62,   62,   62,  225,  225,  225,
			  226,  226,  227,  227,  217,  218,  219,  220,  221,  222,
			  223,  228,  228,  228,  231,  231,  233,  233,   62,   62,
			   62,   98,  232,   98,  234,  236,  236,  236,  237,  237,
			  238,  238,  239,  239,  239,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,  241,  241,  241,  242,  242,  242,
			  243,  243,  243,  245,  245,  246,  246,  247,  247,  248,
			  248,   71,   71,   71,   71,   71,   71,   71,   71,   71,
			  249,  249,  249,  250,  250,  250,  251,  251,  251,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,  253,  253,  254,
			  254,  255,  255,  256,  256,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,  257,  257,  257,  258,  258,  258,
			  259,  259,  259,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  260,  260,  260,  261,  261,  261,  262,  262,
			  262,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  263,
			  263,  263,  264,  264,  264,  265,  265,  265,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  267,  267,  269, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  269,   62,   62,   62,  244,  268,  240,  270,  272,  272,
			  272,  273,  273,  274,  274,  275,  275,  275,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,  277,  277,  277,
			  278,  278,  278,  279,  279,  279,  280,  280,  281,  281,
			  282,  282,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,  283,  283,  283,  284,  284,  284,  285,  285,  285,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,  286,
			  286,  287,  287,  289,  289,   71,   71,   71,  290,  290,
			  288,  235,  247,   71,   71,   71,   71,   71,   71,  291,
			  291,  293,  293,   98,   98,   98,  294,  294,  292,  230,

			  255,   98,   98,   98,   98,   98,   98,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  125,  125,  125,  125,
			  125,  125,  125,  125,  125,  295,  295,  296,  296,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,  297,  297,
			  297,  298,  298,  298,  299,  299,  299,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,  300,  300,  301,  301,
			  302,  302,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,  288,  288,  303,  303,  304,  304,  292,  292,  305,
			  305,  229,  288,  224,  247,  306,  306,  210,  292,  307,
			  307,  308,  308,  205,  255,  309,  309,   62,   62,   62, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   62,   62,   62,   62,   62,   62,  310,  310,  311,  311,
			  312,  312,  313,  313,  314,  314,  315,  315,  201,  288,
			  196,  247,  195,  292,  190,  255,  316,  316,  317,  317,
			  318,  318,  319,  319,  320,  320,  321,  321,  322,  322,
			  323,  323,  185,  288,  178,  247,  177,  292,  176,  255,
			  324,  324,  325,  325,  326,  326,  327,  327,  328,  328,
			  329,  329,  330,  330,  331,  331,  171,  288,  166,  247,
			  165,  292,  160,  255,  332,  332,  333,  333,  334,  334,
			  335,  335,  336,  336,  337,  337,  109,  109,  125,  109,
			  140,  125,  139,  134,  124,  119,   97,   92,   90,   85,

			  338,    9,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338, yy_Dummy>>,
			1, 132, 800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 931)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,   14,  331,   14,   15,   17,   17,   19,   19,   19,
			   21,   21,   21,   15,   15,   15,   15,   15,   15,   15,
			   16,  330,   16,   16,   22,   22,   23,   23,   24,   24,
			   24,   30,   30,   30,   16,   16,   16,   16,   16,   16,
			   16,   29,  329,   29,   29,   32,   32,   32,   33,   33,
			   34,   34,   35,   35,   35,   29,   29,   29,   29,   29,
			   29,   29,   39,  328,   39,   39,   41,   41,   41,   43,
			   43,   43,   44,   44,   45,   45,   39,   39,   39,   39, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   39,   39,   39,   40,   46,   46,   46,   53,   53,   53,
			  223,   40,   55,   55,   55,   56,   56,   57,   57,   40,
			   40,   40,   40,   40,   40,   40,   50,   50,   50,   50,
			   50,   50,   50,   58,   58,   58,   62,   62,   64,   64,
			   64,   66,   66,   66,  218,   62,   62,   62,   62,   62,
			   62,   62,   63,  214,   63,   63,   67,   67,   68,   68,
			   69,   69,   69,   75,   75,   75,   63,   63,   63,   63,
			   63,   63,   63,   73,   73,   74,   74,   77,   77,   77,
			  339,   73,  339,   74,   78,   78,   79,   79,   80,   80,
			   80,   85,   85,   85,   86,   86,   86,   87,   87,   87,

			   88,   88,   88,   89,   89,   89,   90,   90,   90,   92,
			   92,   92,   93,   93,   93,   94,   94,   94,   95,   95,
			   95,   96,   96,   96,   97,   97,   97,  100,  100,  101,
			  101,  102,  102,  102,  340,  100,  340,  101,  104,  104,
			  104,  105,  105,  106,  106,  107,  107,  107,  111,  111,
			  111,  113,  113,  113,  114,  114,  115,  115,  116,  116,
			  116,  119,  119,  119,  120,  120,  120,  121,  121,  121,
			  122,  122,  122,  123,  123,  123,  124,  124,  124,  126,
			  126,  126,  128,  128,  128,  129,  129,  130,  130,  131,
			  131,  131,  134,  134,  134,  135,  135,  135,  136,  136, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  136,  137,  137,  137,  138,  138,  138,  139,  139,  139,
			  141,  185,  141,  141,  143,  143,  143,  145,  145,  145,
			  146,  146,  147,  147,  141,  141,  141,  141,  141,  141,
			  141,  148,  148,  148,  151,  151,  152,  152,  153,  153,
			  153,  341,  151,  341,  152,  155,  155,  155,  156,  156,
			  157,  157,  158,  158,  158,  160,  160,  160,  161,  161,
			  161,  162,  162,  162,  163,  163,  163,  164,  164,  164,
			  165,  165,  165,  167,  167,  168,  168,  169,  169,  170,
			  170,  171,  171,  171,  172,  172,  172,  173,  173,  173,
			  174,  174,  174,  175,  175,  175,  176,  176,  176,  179,

			  179,  179,  180,  180,  180,  181,  181,  181,  182,  182,
			  182,  183,  183,  183,  184,  184,  184,  186,  186,  187,
			  187,  188,  188,  189,  189,  190,  190,  190,  191,  191,
			  191,  192,  192,  192,  193,  193,  193,  194,  194,  194,
			  195,  195,  195,  196,  196,  196,  197,  197,  197,  198,
			  198,  198,  199,  199,  199,  200,  200,  200,  201,  201,
			  201,  202,  202,  202,  203,  203,  203,  204,  204,  204,
			  205,  205,  205,  206,  206,  206,  207,  207,  207,  208,
			  208,  208,  209,  209,  209,  210,  210,  210,  211,  211,
			  211,  212,  212,  212,  213,  213,  213,  215,  215,  216, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  216,  217,  217,  217,  166,  215,  159,  216,  219,  219,
			  219,  220,  220,  221,  221,  222,  222,  222,  224,  224,
			  224,  225,  225,  225,  226,  226,  226,  227,  227,  227,
			  228,  228,  228,  229,  229,  229,  231,  231,  232,  232,
			  234,  234,  235,  235,  235,  236,  236,  236,  237,  237,
			  237,  238,  238,  238,  239,  239,  239,  240,  240,  240,
			  241,  241,  241,  242,  242,  242,  243,  243,  243,  245,
			  245,  246,  246,  248,  248,  249,  249,  249,  253,  253,
			  246,  154,  248,  250,  250,  250,  251,  251,  251,  254,
			  254,  256,  256,  257,  257,  257,  267,  267,  254,  150,

			  256,  258,  258,  258,  259,  259,  259,  260,  260,  260,
			  261,  261,  261,  262,  262,  262,  263,  263,  263,  264,
			  264,  264,  265,  265,  265,  268,  268,  270,  270,  271,
			  271,  271,  272,  272,  272,  273,  273,  273,  274,  274,
			  274,  275,  275,  275,  276,  276,  276,  277,  277,  277,
			  278,  278,  278,  279,  279,  279,  280,  280,  281,  281,
			  282,  282,  283,  283,  283,  284,  284,  284,  285,  285,
			  285,  286,  286,  287,  287,  289,  289,  290,  290,  291,
			  291,  149,  287,  144,  289,  293,  293,  132,  291,  294,
			  294,  295,  295,  127,  293,  296,  296,  297,  297,  297, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  298,  298,  298,  299,  299,  299,  301,  301,  302,  302,
			  303,  303,  304,  304,  305,  305,  306,  306,  117,  303,
			  112,  304,  108,  305,  103,  306,  308,  308,  309,  309,
			  310,  310,  311,  311,  312,  312,  313,  313,  314,  314,
			  315,  315,   99,  312,   83,  313,   82,  314,   81,  315,
			  316,  316,  317,  317,  318,  318,  319,  319,  320,  320,
			  321,  321,  322,  322,  323,  323,   76,  320,   72,  321,
			   70,  322,   65,  323,  324,  324,  325,  325,  326,  326,
			  327,  327,  332,  332,  333,  333,  342,  342,  343,  342,
			   61,  343,   59,   54,   47,   42,   36,   31,   25,   20,

			    9,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338, yy_Dummy>>,
			1, 132, 800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 343)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   30,    0,   60,    0,   90,    0,  900,
			  901,  901,  901,  901,  118,  110,  131,  119,  901,  108,
			  878,  111,  125,  126,  129,  879,  901,  901,  901,  152,
			  132,  876,  146,  149,  150,  153,  877,  901,  901,  173,
			  196,  167,  874,  170,  173,  174,  185,  875,  901,  901,
			  203,    0,  901,  188,  872,  193,  196,  197,  214,  873,
			  901,  882,  222,  243,  219,  851,  222,  237,  238,  241,
			  851,  901,  859,  264,  266,  244,  845,  258,  265,  266,
			  269,  829,  828,  826,  901,  272,  275,  278,  281,  284,
			  287,  901,  290,  293,  296,  299,  302,  305,  901,  833,

			  318,  320,  312,  803,  319,  322,  323,  326,  803,  901,
			  901,  329,  799,  332,  335,  336,  339,  799,  901,  342,
			  345,  348,  351,  354,  357,  901,  360,  772,  363,  366,
			  367,  370,  768,  901,  373,  376,  379,  382,  385,  388,
			  901,  401,  901,  395,  762,  398,  401,  402,  412,  762,
			  690,  425,  427,  419,  660,  426,  429,  430,  433,  587,
			  436,  439,  442,  445,  448,  451,  595,  464,  466,  468,
			  470,  462,  465,  468,  471,  474,  477,  901,  901,  480,
			  483,  486,  489,  492,  495,  402,  508,  510,  512,  514,
			  506,  509,  512,  515,  518,  521,  524,  527,  530,  533, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  536,  539,  542,  545,  548,  551,  554,  557,  560,  563,
			  566,  569,  572,  575,  244,  588,  590,  582,  223,  589,
			  592,  593,  596,  191,  599,  602,  605,  608,  611,  614,
			    0,  627,  629,    0,  631,  623,  626,  629,  632,  635,
			  638,  641,  644,  647,  901,  660,  662,  901,  664,  656,
			  664,  667,  901,  669,  680,  901,  682,  674,  682,  685,
			  688,  691,  694,  697,  700,  703,    0,  687,  716,    0,
			  718,  710,  713,  716,  719,  722,  725,  728,  731,  734,
			  747,  749,  751,  743,  746,  749,  762,  764,  901,  766,
			  768,  770,  901,  776,  780,  782,  786,  778,  781,  784,

			    0,  797,  799,  801,  803,  805,  807,    0,  817,  819,
			  821,  823,  825,  827,  829,  831,  841,  843,  845,  847,
			  849,  851,  853,  855,  865,  867,  869,  871,  165,  144,
			  123,  104,  873,  875,    0,    0,    0,    0,  901,  278,
			  332,  439,  885,  887, yy_Dummy>>,
			1, 144, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 343)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  338,    1,  338,    3,  338,    5,  338,    7,  338,
			  338,  338,  338,  338,  338,  339,  340,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  340,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  341,
			  342,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  343,   29,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  339,  339,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,

			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,   63,  338,  338,  338,  338,  338,  338,  338,  338,
			   62,   62,   62,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,   62,   62,   62,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			   62,   62,   62,   62,   62,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,   62,   62,   62,   62,
			   62,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			   62,   62,   62,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,   62,   62,   62,  338,  338,  338,

			   62,   62,   62,  338,  338,  338,  338,   62,   62,   62,
			   62,   62,  338,  338,  338,  338,   62,   62,   62,   62,
			  338,  338,  338,  338,   62,   62,   62,   62,  338,  338,
			  338,  338,   62,   62,   62,   62,   62,   62,    0,  338,
			  338,  338,  338,  338, yy_Dummy>>,
			1, 144, 200)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   30,   30,   30,   30,   30,   30,   30,   30,   30,
			    1,   30,   30,   30,   30,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,    2,   30,   30,   30,   30,   30,
			    3,    4,    5,    6,   30,    7,   30,    8,    9,    9,
			    9,    9,    9,    9,    9,    9,   10,   10,   30,   30,
			   30,   30,   30,    4,    4,   10,   10,   10,   10,   10,
			   10,   30,   30,   30,   30,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   11,   30,   30,   12,   30,
			   30,   13,   14,   15,   16,   30,   30,   10,   10,   10,

			   10,   10,   10,   30,   30,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   30,   30,   11,   30,   30,
			   12,   30,   30,   17,    4,   18,   30,   30,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   22,   22,   23,   23,   23,   23,   23,   23, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   24,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   26,   25,   25,
			   27,   28,   28,   28,   29,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   30, yy_Dummy>>,
			1, 58, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    2,    4,    4,    4,    3,
			    3,    3,    3,    4,    4,    4,    4,    4,    4,    4,
			    4, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 338)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   31,
			    8,   29,    1,    7,    7,    8,    8,    8,   28,   28,
			   28,   28,   28,   28,   28,   28,    9,   11,   10,    9,
			   28,   28,   28,   28,   28,   28,   28,   22,   23,   22,
			   22,   28,   28,   28,   28,   28,   28,   28,   25,   27,
			   25,   25,   26,   28,   28,   28,   28,   28,   28,   28,
			    5,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   12,   12,   12,   12,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    8,    0,    0,    0,    0,    0,
			    0,    9,    0,    0,    0,    0,    0,    0,   16,   16,

			   16,   16,    0,    0,    0,    0,    0,    0,    0,   20,
			   21,    0,    0,    0,    0,    0,    0,    0,   22,    0,
			    0,    0,    0,    0,    0,   24,    0,    0,    0,    0,
			    0,    0,    0,   25,    0,    0,    0,    0,    0,    0,
			    6,    0,    4,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   13,   15,    0,   14,
			    0,    0,    0,    0,    0,    0,    0,    2,    3,    0,
			    0,    0,    0,    0,    0,   17,   19,    0,   18,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   13,   15,    0,   14,    0,    0,
			    0,    0,   17,   19,    0,   18,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   15,    0,   15,    0,
			   19,    0,   19,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 139, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 901
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 338
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 339
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 30
			-- Equivalence code for NULL character	yyMax_symbol_equiv_class: INTEGER = 256
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

	yyNb_rules: INTEGER = 30
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 31
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
