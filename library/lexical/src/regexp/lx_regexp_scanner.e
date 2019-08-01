note

	description:

		"Scanners for regular expressions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_REGEXP_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

	LX_REGEXP_TOKENS
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
			Result := (INITIAL <= sc and sc <= REGEXP)
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
--|#line 55 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 55")
end

					last_token := Caret_code
					set_start_condition (REGEXP)
				
when 2 then
--|#line 59 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 59")
end

					less (0)
					set_start_condition (REGEXP)
				
when 3 then
--|#line 66 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 66")
end

					last_token := UNICODE_MODE_START
				
when 4 then
--|#line 69 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 69")
end

					last_token := BYTE_MODE_START
				
when 5 then
--|#line 72 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 72")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 6 then
	yy_end := yy_start + yy_more_len + 1
--|#line 76 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 76")
end
last_token := Dollar_code
when 7 then
--|#line 77 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 77")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 8 then
--|#line 81 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 81")
end

					last_token := CCL_PLUS
				
when 9 then
--|#line 84 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 84")
end

					last_token := CCL_MINUS
				
when 10 then
--|#line 87 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 87")
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
				
when 11 then
--|#line 98 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 98")
end
last_token := text_item (1).code
when 12 then
--|#line 99 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 99")
end

					last_token := CHAR
					process_utf8_character
				
when 13 then
--|#line 106 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 106")
end
-- Separator.
when 14 then
--|#line 107 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 107")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 15 then
--|#line 115 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 115")
end
last_token := Comma_code
when 16 then
--|#line 116 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 116")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 17 then
--|#line 120 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 120")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 18 then
--|#line 125 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 125")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 19 then
--|#line 134 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 134")
end

					last_token := CHAR
					process_utf8_character
				
when 20 then
--|#line 138 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 138")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 21 then
--|#line 142 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 142")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 22 then
--|#line 151 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 151")
end

					last_token := CHAR
					process_escaped_character
				
when 23 then
--|#line 155 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 155")
end

					last_token := CHAR
					process_octal_character
				
when 24 then
--|#line 159 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 159")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 25 then
--|#line 163 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 163")
end

					last_token := CHAR
					process_unicode_character
				
when 26 then
--|#line 170 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 170")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 27 then
--|#line 175 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 175")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 28 then
--|#line 180 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 180")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 29 then
--|#line 185 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 185")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 30 then
	yy_end := yy_start + yy_more_len + 1
--|#line 190 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 190")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 31 then
	yy_end := yy_start + yy_more_len + 1
--|#line 194 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 194")
end
last_token := Caret_code
when 32 then
--|#line 195 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 195")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 33 then
--|#line 200 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 200")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 34 then
	yy_end := yy_start + yy_more_len + 1
--|#line 209 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 209")
end
last_token := Minus_code
when 35 then
--|#line 210 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 210")
end

					last_token := CHAR
					process_utf8_character
				
when 36 then
--|#line 214 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 214")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 37 then
--|#line 218 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 218")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 38 then
--|#line 227 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 227")
end

					report_bad_character_error (text)
				
when 39 then
--|#line 230 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 230")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 40 then
--|#line 0 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 0")
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
			create an_array.make_filled (0, 0, 1149)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   73,   15,   15,  135,  135,   75,  147,   75,  148,
			   74,   74,   74,   74,  136,  137,   14,   14,   14,   14,
			   16,   16,   18,   19,   86,   86,   86,   89,   89,   20,
			  242,   21,   21,   88,   88,   88,   90,   90,   91,   91,
			   91,  116,  116,   22,   18,   19,  113,  113,  113,  117,
			  117,   20,  289,   21,   21,  115,  115,  115,  118,  118,
			  118,  128,  128,  128,  234,   22,   23,   24,   25,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   26,   23,   23,   23,   23,   27,   27,
			   27,   27,   28,   29,   30,   31,   32,   33,   34,   23,

			   35,   36,   35,   35,   35,   35,   35,   35,   35,   35,
			   35,   35,   35,   35,   35,   35,   35,   37,   35,   38,
			   35,   35,   27,   27,   27,   27,   39,   40,   41,   42,
			   43,   44,   45,   35,   46,   47,   46,   46,   46,   46,
			   46,   46,   48,   46,   46,   46,   46,   46,   46,   46,
			   46,   49,   50,   46,   46,   46,   27,   27,   27,   27,
			   51,   52,   53,   54,   55,   56,   57,   46,   58,   15,
			   59,   60,   61,   62,   62,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   63,   64,   58,   58,   65,   58,
			   27,   27,   27,   27,   66,   67,   68,   69,   70,   71, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   72,   58,   76,  130,  130,  130,  285,   77,   78,  131,
			  131,  132,  132,  133,  133,  133,  149,  149,  149,   79,
			   80,   81,   82,   83,   84,   85,   94,  151,  151,  151,
			  301,   95,   96,  152,  152,  153,  153,  154,  154,  154,
			   75,   75,   75,   97,   98,   99,  100,  101,  102,  103,
			  105,  157,  157,  296,  157,  157,  162,  162,  162,   93,
			  105,   93,  158,  163,  163,  164,  164,  291,  106,  107,
			  108,  109,  110,  111,  112,  121,  122,  123,  124,  125,
			  126,  127,   76,  165,  165,  165,  279,   77,   78,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,  274,   79,

			   80,   81,   82,   83,   84,   85,  139,  167,  167,  167,
			  168,  168,  168,  177,  177,  140,  141,  142,  143,  144,
			  145,  146,  159,  159,  269,  159,  159,  169,  169,  169,
			  268,  171,  171,  160,  171,  171,  173,  173,  120,  173,
			  173,  120,  172,   93,   93,   93,  263,  174,  176,  176,
			  176,  178,  178,  179,  179,  179,  104,  104,  104,  182,
			  182,  182,  183,  183,  184,  184,  185,  185,  185,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  187,  187,
			  187,  188,  188,  188,  189,  189,  189,  120,  120,  120,
			  191,  191,  191,  192,  192,  193,  193,  194,  194,  194, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  128,  128,  128,  128,  128,  128,  128,  128,  128,  196,
			  196,  196,  197,  197,  197,  198,  198,  198,  201,  202,
			  138,  138,  138,  221,  221,  221,  239,  203,  204,  205,
			  206,  207,  208,  209,  210,  222,  222,  223,  223,  211,
			  212,  224,  224,  224,  149,  149,  149,  149,  149,  149,
			  231,  213,  214,  215,  216,  217,  218,  219,  149,  149,
			  149,  228,  228,  228,  229,  229,  229,  230,  230,  230,
			  232,  232,  227,  232,  232,  233,  233,  226,  233,  233,
			  234,  234,  225,  234,  234,  235,  235,  220,  235,  235,
			   75,   75,   75,   75,   75,   75,   75,   75,   75,  236,

			  236,  236,  237,  237,  237,  238,  238,  238,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,  240,  240,  200,
			  240,  240,  241,  241,  199,  241,  241,  242,  242,  195,
			  242,  242,  243,  243,  190,  243,  243,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,  244,  244,  244,  245,
			  245,  245,  246,  246,  246,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  247,  247,  247,  248,  248,  248,
			  249,  249,  249,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  250,  250,  250,  251,  251,  251,  252,  252,  252, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  128,  128,  128,  128,  128,  128,  128,  128,  128,  253,
			  138,  138,  138,  186,  254,  255,  264,  264,  264,  265,
			  265,  266,  266,  267,  267,  267,  256,  257,  258,  259,
			  260,  261,  262,  270,  270,  181,  270,  270,  272,  272,
			  180,  272,  272,  175,  271,  138,  138,  138,  170,  273,
			  275,  275,  275,  276,  276,  277,  277,  278,  278,  278,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  280,
			  280,  280,  281,  281,  281,  282,  282,  282,  149,  149,
			  149,  149,  149,  149,  149,  149,  149,  283,  283,  166,
			  283,  283,  284,  284,  161,  284,  284,  286,  286,  156,

			  286,  286,  298,  298,  285,   75,   75,   75,  155,  234,
			   75,   75,   75,   75,   75,   75,  287,  287,  150,  287,
			  287,  288,  288,  134,  288,  288,  290,  290,  129,  290,
			  290,  299,  299,  289,   93,   93,   93,  119,  242,   93,
			   93,   93,   93,   93,   93,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  292,  292,  114,  292,  292,  294,  294,
			   92,  294,  294,   87,  293,  138,  138,  138,   73,  295,
			  297,  297,  297,  300,  300,  300,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  302,  302,  302,  303,  303, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  303,  304,  304,  304,  305,  305,  355,  305,  305,  306,
			  306,  355,  306,  306,  307,  307,  355,  307,  307,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  308,  308,
			  308,  309,  309,  309,  310,  310,  310,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  285,  285,  355,  285,
			  285,  311,  311,  355,  311,  311,  312,  312,  355,  312,
			  312,  289,  289,  285,  289,  289,  313,  313,  234,  313,
			  313,  314,  314,  355,  314,  314,  315,  315,  289,  315,
			  315,  316,  316,  242,  316,  316,  317,  317,  355,  317,
			  317,  138,  138,  138,  138,  138,  138,  138,  138,  138,

			  318,  318,  318,  319,  319,  319,  320,  320,  320,  138,
			  138,  138,  138,  138,  138,  138,  138,  138,  321,  321,
			  355,  321,  321,  322,  322,  355,  322,  322,  323,  323,
			  355,  323,  323,  138,  138,  138,  138,  138,  138,  138,
			  138,  138,  324,  324,  355,  324,  324,  325,  325,  355,
			  325,  325,  326,  326,  285,  326,  326,  327,  327,  234,
			  327,  327,  328,  328,  289,  328,  328,  329,  329,  242,
			  329,  329,  330,  330,  355,  330,  330,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  331,  331,  355,  331,
			  331,  332,  332,  355,  332,  332,  333,  333,  355,  333, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  333,  334,  334,  355,  334,  334,  335,  335,  285,  335,
			  335,  336,  336,  234,  336,  336,  337,  337,  289,  337,
			  337,  338,  338,  242,  338,  338,  339,  339,  355,  339,
			  339,  340,  340,  355,  340,  340,  341,  341,  355,  341,
			  341,  342,  342,  355,  342,  342,  343,  343,  285,  343,
			  343,  344,  344,  234,  344,  344,  345,  345,  289,  345,
			  345,  346,  346,  242,  346,  346,  347,  347,  355,  347,
			  347,  348,  348,  355,  348,  348,  349,  349,  355,  349,
			  349,  350,  350,  355,  350,  350,  351,  351,  355,  351,
			  351,  352,  352,  355,  352,  352,  353,  353,  355,  353,

			  353,  354,  354,  355,  354,  354,   17,   17,   17,   17,
			  104,  104,  138,  104,  138,   13,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355, yy_Dummy>>,
			1, 150, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1149)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,   73,    1,    2,   60,   60,  358,   65,  358,   65,
			   21,   21,   74,   74,   61,   61,  356,  356,  356,  356,
			    1,    2,    3,    3,   28,   28,   28,   31,   31,    3,
			  344,    3,    3,   30,   30,   30,   32,   32,   33,   33,
			   33,   42,   42,    3,    4,    4,   39,   39,   39,   43,
			   43,    4,  343,    4,    4,   41,   41,   41,   44,   44,
			   44,   51,   51,   51,  342,    4,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   11,   11,   26,   53,   53,   53,  341,   26,   26,   54,
			   54,   55,   55,   56,   56,   56,   66,   66,   66,   26,
			   26,   26,   26,   26,   26,   26,   37,   68,   68,   68,
			  262,   37,   37,   69,   69,   70,   70,   71,   71,   71,
			   79,   79,   79,   37,   37,   37,   37,   37,   37,   37,
			   38,   77,   77,  257,   77,   77,   81,   81,   81,  359,
			   38,  359,   77,   82,   82,   83,   83,  253,   38,   38,
			   38,   38,   38,   38,   38,   48,   48,   48,   48,   48,
			   48,   48,   49,   84,   84,   84,  219,   49,   49,   87,
			   87,   87,   88,   88,   88,   89,   89,   89,  214,   49,

			   49,   49,   49,   49,   49,   49,   63,   90,   90,   90,
			   91,   91,   91,  100,  100,   63,   63,   63,   63,   63,
			   63,   63,   78,   78,  210,   78,   78,   92,   92,   92,
			  209,   95,   95,   78,   95,   95,   96,   96,  361,   96,
			   96,  361,   95,   97,   97,   97,  204,   96,   99,   99,
			   99,  101,  101,  102,  102,  102,  106,  106,  106,  108,
			  108,  108,  109,  109,  110,  110,  111,  111,  111,  114,
			  114,  114,  115,  115,  115,  116,  116,  116,  117,  117,
			  117,  118,  118,  118,  119,  119,  119,  121,  121,  121,
			  123,  123,  123,  124,  124,  125,  125,  126,  126,  126, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  129,  129,  129,  130,  130,  130,  131,  131,  131,  132,
			  132,  132,  133,  133,  133,  134,  134,  134,  138,  138,
			  140,  140,  140,  142,  142,  142,  170,  138,  138,  138,
			  138,  138,  138,  138,  139,  143,  143,  144,  144,  139,
			  139,  145,  145,  145,  150,  150,  150,  151,  151,  151,
			  156,  139,  139,  139,  139,  139,  139,  139,  152,  152,
			  152,  153,  153,  153,  154,  154,  154,  155,  155,  155,
			  157,  157,  148,  157,  157,  158,  158,  147,  158,  158,
			  159,  159,  146,  159,  159,  160,  160,  141,  160,  160,
			  161,  161,  161,  162,  162,  162,  163,  163,  163,  164,

			  164,  164,  165,  165,  165,  166,  166,  166,  167,  167,
			  167,  168,  168,  168,  169,  169,  169,  171,  171,  137,
			  171,  171,  172,  172,  136,  172,  172,  173,  173,  127,
			  173,  173,  174,  174,  122,  174,  174,  175,  175,  175,
			  176,  176,  176,  177,  177,  177,  178,  178,  178,  179,
			  179,  179,  180,  180,  180,  181,  181,  181,  182,  182,
			  182,  183,  183,  183,  184,  184,  184,  185,  185,  185,
			  186,  186,  186,  187,  187,  187,  188,  188,  188,  189,
			  189,  189,  190,  190,  190,  191,  191,  191,  192,  192,
			  192,  193,  193,  193,  194,  194,  194,  195,  195,  195, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  196,  196,  196,  197,  197,  197,  198,  198,  198,  201,
			  203,  203,  203,  112,  201,  201,  205,  205,  205,  206,
			  206,  207,  207,  208,  208,  208,  201,  201,  201,  201,
			  201,  201,  201,  211,  211,  107,  211,  211,  212,  212,
			  103,  212,  212,   98,  211,  213,  213,  213,   94,  212,
			  215,  215,  215,  216,  216,  217,  217,  218,  218,  218,
			  220,  220,  220,  221,  221,  221,  222,  222,  222,  223,
			  223,  223,  224,  224,  224,  225,  225,  225,  228,  228,
			  228,  229,  229,  229,  230,  230,  230,  232,  232,   85,
			  232,  232,  233,  233,   80,  233,  233,  235,  235,   76,

			  235,  235,  259,  259,  233,  236,  236,  236,   72,  235,
			  237,  237,  237,  238,  238,  238,  240,  240,   67,  240,
			  240,  241,  241,   57,  241,  241,  243,  243,   52,  243,
			  243,  260,  260,  241,  244,  244,  244,   45,  243,  245,
			  245,  245,  246,  246,  246,  247,  247,  247,  248,  248,
			  248,  249,  249,  249,  250,  250,  250,  251,  251,  251,
			  252,  252,  252,  254,  254,   40,  254,  254,  255,  255,
			   34,  255,  255,   29,  254,  256,  256,  256,   18,  255,
			  258,  258,  258,  261,  261,  261,  263,  263,  263,  264,
			  264,  264,  265,  265,  265,  266,  266,  266,  267,  267, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  267,  268,  268,  268,  270,  270,   13,  270,  270,  271,
			  271,    0,  271,  271,  273,  273,    0,  273,  273,  274,
			  274,  274,  275,  275,  275,  276,  276,  276,  277,  277,
			  277,  278,  278,  278,  279,  279,  279,  280,  280,  280,
			  281,  281,  281,  282,  282,  282,  283,  283,    0,  283,
			  283,  284,  284,    0,  284,  284,  286,  286,    0,  286,
			  286,  287,  287,  284,  287,  287,  288,  288,  286,  288,
			  288,  290,  290,    0,  290,  290,  292,  292,  288,  292,
			  292,  293,  293,  290,  293,  293,  295,  295,    0,  295,
			  295,  296,  296,  296,  297,  297,  297,  298,  298,  298,

			  299,  299,  299,  300,  300,  300,  301,  301,  301,  302,
			  302,  302,  303,  303,  303,  304,  304,  304,  305,  305,
			    0,  305,  305,  306,  306,    0,  306,  306,  307,  307,
			    0,  307,  307,  308,  308,  308,  309,  309,  309,  310,
			  310,  310,  311,  311,    0,  311,  311,  312,  312,    0,
			  312,  312,  313,  313,  311,  313,  313,  314,  314,  312,
			  314,  314,  315,  315,  313,  315,  315,  316,  316,  314,
			  316,  316,  317,  317,    0,  317,  317,  318,  318,  318,
			  319,  319,  319,  320,  320,  320,  322,  322,    0,  322,
			  322,  323,  323,    0,  323,  323,  324,  324,    0,  324, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  324,  325,  325,    0,  325,  325,  326,  326,  324,  326,
			  326,  327,  327,  325,  327,  327,  329,  329,  326,  329,
			  329,  330,  330,  327,  330,  330,  331,  331,    0,  331,
			  331,  332,  332,    0,  332,  332,  333,  333,    0,  333,
			  333,  334,  334,    0,  334,  334,  335,  335,  333,  335,
			  335,  336,  336,  334,  336,  336,  337,  337,  335,  337,
			  337,  338,  338,  336,  338,  338,  339,  339,    0,  339,
			  339,  340,  340,    0,  340,  340,  345,  345,    0,  345,
			  345,  346,  346,    0,  346,  346,  347,  347,    0,  347,
			  347,  348,  348,    0,  348,  348,  349,  349,    0,  349,

			  349,  350,  350,    0,  350,  350,  357,  357,  357,  357,
			  360,  360,  362,  360,  362,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355, yy_Dummy>>,
			1, 150, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 362)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    1,   21,   43,   65,    0,   99,    0,  133,
			    0,  167,    0,  806, 1115, 1115, 1115, 1115,  777, 1115,
			 1115,    0, 1115, 1115, 1115, 1115,  192, 1115,    1,  748,
			   10,    4,   12,   15,  747, 1115, 1115,  216,  241,   23,
			  740,   32,   18,   25,   35,  714, 1115, 1115,  248,  272,
			 1115,   38,  703,  180,  186,  187,  190,  700, 1115, 1115,
			    3,    0, 1115,  288,    0,    0,  193,  693,  204,  210,
			  211,  214,  685,    0,    2, 1115,  689,  241,  312,  217,
			  669,  233,  240,  241,  260,  666, 1115,  266,  269,  272,
			  284,  287,  304, 1115,  638,  321,  326,  320,  618,  325,

			  290,  327,  330,  617, 1115, 1115,  333,  610,  336,  339,
			  340,  343,  590, 1115,  346,  349,  352,  355,  358,  361,
			 1115,  364,  509,  367,  370,  371,  374,  506, 1115,  377,
			  380,  383,  386,  389,  392, 1115,  512,  507,  400,  424,
			  397,  462,  400,  412,  413,  418,  459,  455,  450, 1115,
			  421,  424,  435,  438,  441,  444,  440,  460,  465,  470,
			  475,  467,  470,  473,  476,  479,  482,  485,  488,  491,
			  416,  507,  512,  517,  522,  514,  517,  520,  523,  526,
			  529,  532,  535,  538,  541,  544,  547,  550,  553,  556,
			  559,  562,  565,  568,  571,  574,  577,  580,  583, 1115, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1115,  599, 1115,  587,  321,  593,  596,  597,  600,  307,
			  314,  623,  628,  622,  273,  627,  630,  631,  634,  263,
			  637,  640,  643,  646,  649,  652, 1115, 1115,  655,  658,
			  661, 1115,  677,  682, 1115,  687,  682,  687,  690, 1115,
			  706,  711, 1115,  716,  711,  716,  719,  722,  725,  728,
			  731,  734,  737,  257,  753,  758,  752,  228,  757,  679,
			  707,  760,  207,  763,  766,  769,  772,  775,  778,    0,
			  794,  799,    0,  804,  796,  799,  802,  805,  808,  811,
			  814,  817,  820,  836,  841, 1115,  846,  851,  856, 1115,
			  861,    0,  866,  871,    0,  876,  868,  871,  874,  877,

			  880,  883,  886,  889,  892,  908,  913,  918,  910,  913,
			  916,  932,  937,  942,  947,  952,  957,  962,  954,  957,
			  960,    0,  976,  981,  986,  991,  996, 1001,    0, 1006,
			 1011, 1016, 1021, 1026, 1031, 1036, 1041, 1046, 1051, 1056,
			 1061,  184,   42,   30,    8, 1066, 1071, 1076, 1081, 1086,
			 1091,    0,    0,    0,    0, 1115,   15, 1105,    4,  257,
			 1109,  337, 1110, yy_Dummy>>,
			1, 163, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 362)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  356,  356,  357,  357,  355,    5,  355,    7,  355,
			    9,  355,   11,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  358,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  359,  360,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  361,  358,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  362,   49,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,

			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  362,  362,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  355,  139,  355,  355,  355,  355,  355,  355,  355,  355,
			  138,  138,  138,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  138,  138,  138,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  138,
			  138,  138,  138,  138,  355,  355,  355,  355,  355,  355,
			  355,  355,  355,  355,  355,  355,  355,  355,  355,  355,
			  355,  138,  138,  138,  138,  138,  355,  355,  355,  355,

			  355,  355,  355,  355,  355,  138,  138,  138,  355,  355,
			  355,  355,  355,  355,  355,  138,  138,  138,  355,  355,
			  355,  138,  138,  138,  355,  355,  355,  355,  138,  138,
			  138,  138,  138,  355,  355,  355,  355,  138,  138,  138,
			  138,  355,  355,  355,  355,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,    0,  355,  355,  355,  355,
			  355,  355,  355, yy_Dummy>>,
			1, 163, 200)
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
			    0,   34,   34,   34,   34,   34,   34,   34,   34,    1,
			    2,   34,   34,    1,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   34,   34,   34,   34,   34,
			   34,   34,    1,   34,    3,   34,    4,   34,   34,   34,
			    5,    6,    6,    7,    8,    9,    6,    6,   10,   10,
			   10,   10,   10,   10,   10,   10,   11,   11,   12,   34,
			   34,   34,   34,    6,   34,   13,   14,   13,   13,   13,
			   13,   34,   34,   34,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   15,   34,   34,   16,   34,
			   34,   17,   18,   19,   20,   34,   34,   13,   14,   13,

			   13,   13,   13,   34,   34,   34,   34,   34,   34,   34,
			   34,   34,   34,   34,   34,   34,   34,   15,   34,   34,
			   16,   34,   34,   21,    6,   22,   34,   34,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   26,   26,   27,   27,   27,   27,   27,   27, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   28,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   30,   29,   29,
			   31,   32,   32,   32,   33,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   34, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    4,    1,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    2,
			    4,    4,    4,    3,    3,    3,    3,    4,    4,    4,
			    4,    4,    4,    4,    4, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 355)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   41,    2,   39,    1,   17,   13,   18,
			   15,   14,   16,   19,   21,   20,   19,   38,   38,   38,
			   38,   38,   38,   38,   38,   32,   33,   32,   32,   38,
			   38,   38,   38,   38,   38,   38,   35,   37,   35,   35,
			   36,   38,   38,   38,   38,   38,   38,   38,   12,    5,
			   12,   11,   11,   12,   12,    7,   38,   38,   38,   38,
			   38,   38,   38,   13,   14,   22,   22,   22,   22,    0,
			    0,    0,    0,    0,    0,    0,   19,    0,    0,    0,
			    0,    0,    0,   26,   26,   26,   26,    0,    0,    0,

			    0,    0,    0,    0,   30,   31,    0,    0,    0,    0,
			    0,    0,    0,   32,    0,    0,    0,    0,    0,    0,
			   34,    0,    0,    0,    0,    0,    0,    0,   35,    0,
			    0,    0,    0,    0,    0,    6,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   12,
			    0,    0,    0,    0,    0,    0,   23,   25,    0,   24,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   27,   29,    0,   28,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    4, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    3,    0,   10,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    8,    9,    0,    0,
			    0,   23,   25,    0,   24,    0,    0,    0,    0,   27,
			   29,    0,   28,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   25,    0,   25,    0,   29,    0,   29,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 156, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1115
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 355
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 356
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 34
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

	yyNb_rules: INTEGER = 40
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 41
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	NUM: INTEGER = 1
	QUOTE: INTEGER = 2
	FIRSTCCL: INTEGER = 3
	CCL: INTEGER = 4
	REGEXP: INTEGER = 5
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
