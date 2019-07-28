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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_REGEXP_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
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
--|#line 56 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 56")
end

					last_token := Caret_code
					set_start_condition (REGEXP)
				
when 2 then
--|#line 60 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 60")
end

					less (0)
					set_start_condition (REGEXP)
				
when 3 then
--|#line 67 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 67")
end

					last_token := UNICODE_MODE_START
				
when 4 then
--|#line 70 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 70")
end

					last_token := BYTE_MODE_START
				
when 5 then
--|#line 73 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 73")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 6 then
	yy_end := yy_start + yy_more_len + 1
--|#line 77 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 77")
end
last_token := Dollar_code
when 7 then
--|#line 78 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 78")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 8 then
--|#line 82 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 82")
end

					check attached text as l_last_string then
						if unicode_mode.item then
							if unicode_character_classes.has (l_last_string) then
								last_token := UCCL_OP
								last_lx_unicode_character_class_value := unicode_character_classes.item (l_last_string)
							else
								last_token := UCCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						else
							if character_classes_by_name.has (l_last_string) then
								last_token := CCL_OP
								last_lx_symbol_class_value := character_classes_by_name.item (l_last_string)
							else
								last_token := CCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						end
					end
				
when 9 then
--|#line 107 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 107")
end
last_token := text_item (1).code
when 10 then
--|#line 108 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 108")
end

					last_token := CHAR
					process_utf8_character
				
when 11 then
--|#line 115 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 115")
end
-- Separator.
when 12 then
--|#line 116 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 116")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 13 then
--|#line 124 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 124")
end
last_token := Comma_code
when 14 then
--|#line 125 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 125")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 15 then
--|#line 129 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 129")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 16 then
--|#line 134 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 134")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 17 then
--|#line 143 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 143")
end

					last_token := CHAR
					process_utf8_character
				
when 18 then
--|#line 147 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 147")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 19 then
--|#line 151 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 151")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 20 then
--|#line 160 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 160")
end

					last_token := CHAR
					process_escaped_character
				
when 21 then
--|#line 164 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 164")
end

					last_token := BCHAR
					process_byte_character
				
when 22 then
--|#line 168 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 168")
end

					last_token := UCHAR
					process_unicode_character
				
when 23 then
--|#line 175 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 175")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 24 then
--|#line 180 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 180")
end

					last_token := BCHAR
					process_byte_character
					set_start_condition (CCL)
				
when 25 then
--|#line 185 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 185")
end

					last_token := UCHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 26 then
	yy_end := yy_start + yy_more_len + 1
--|#line 190 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 190")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 27 then
	yy_end := yy_start + yy_more_len + 1
--|#line 194 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 194")
end
last_token := Caret_code
when 28 then
--|#line 195 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 195")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 29 then
--|#line 200 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 200")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 30 then
	yy_end := yy_start + yy_more_len + 1
--|#line 209 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 209")
end
last_token := Minus_code
when 31 then
--|#line 210 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 210")
end

					last_token := CHAR
					process_utf8_character
				
when 32 then
--|#line 214 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 214")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 33 then
--|#line 218 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 218")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 34 then
--|#line 227 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 227")
end

					report_bad_character_error (text)
				
when 35 then
--|#line 230 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 230")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 36 then
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
			create an_array.make_filled (0, 0, 1037)
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
			    0,   73,   15,   15,  135,  135,  155,   73,  155,   74,
			   74,   74,   74,  136,  137,  168,  278,  168,  259,   16,
			   16,   18,   19,   86,   86,   86,  277,   20,  274,   21,
			   21,   88,   88,   88,   89,   89,   90,   90,   91,   91,
			   91,   22,   18,   19,  113,  113,  113,  277,   20,  274,
			   21,   21,  115,  115,  115,  116,  116,  117,  117,  118,
			  118,  118,   22,   23,   24,   25,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   26,
			   23,   23,   23,   23,   27,   27,   27,   27,   28,   29,
			   30,   31,   32,   33,   34,   23,   35,   36,   35,   35,

			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,
			   35,   35,   37,   35,   38,   35,   35,   27,   27,   27,
			   27,   39,   40,   41,   42,   43,   44,   45,   35,   46,
			   47,   46,   46,   46,   46,   46,   48,   46,   46,   46,
			   46,   46,   46,   46,   46,   49,   50,   46,   46,   46,
			   27,   27,   27,   27,   51,   52,   53,   54,   55,   56,
			   57,   46,   58,   15,   59,   60,   61,   62,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   63,   64,   58,
			   58,   65,   58,   27,   27,   27,   27,   66,   67,   68,
			   69,   70,   71,   72,   58,   76,  128,  128,  128,  277, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   77,   78,  130,  130,  130,  131,  131,  132,  132,  133,
			  133,  133,   79,   80,   81,   82,   83,   84,   85,   94,
			  147,  147,  147,  274,   95,   96,  149,  149,  149,  150,
			  150,  151,  151,  152,  152,  152,   97,   98,   99,  100,
			  101,  102,  103,  105,  157,  157,  277,  157,  157,   75,
			   75,   75,  274,  105,  159,  159,  159,  160,  160,  161,
			  161,  106,  107,  108,  109,  110,  111,  112,  121,  122,
			  123,  124,  125,  126,  127,   76,  162,  162,  162,  277,
			   77,   78,   86,   86,   86,   86,   86,   86,   86,   86,
			   86,  274,   79,   80,   81,   82,   83,   84,   85,  139,

			  164,  164,  164,  165,  165,  165,  173,  173,  140,  141,
			  142,  143,  144,  145,  146,  166,  166,  166,  170,  170,
			  287,  170,  170,   93,   93,   93,  172,  172,  172,  174,
			  174,  175,  175,  175,  104,  104,  104,  178,  178,  178,
			  179,  179,  180,  180,  181,  181,  181,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  183,  183,  183,  184,
			  184,  184,  185,  185,  185,  120,  120,  120,  187,  187,
			  187,  188,  188,  189,  189,  190,  190,  190,  128,  128,
			  128,  128,  128,  128,  128,  128,  128,  192,  192,  192,
			  193,  193,  193,  194,  194,  194,  197,  198,  138,  138, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  138,  217,  217,  217,  282,  199,  200,  201,  202,  203,
			  204,  205,  206,  218,  218,  219,  219,  207,  208,  220,
			  220,  220,  147,  147,  147,  147,  147,  147,  277,  209,
			  210,  211,  212,  213,  214,  215,  147,  147,  147,  222,
			  222,  222,  223,  223,  223,  224,  224,  224,  226,  226,
			  274,  226,  226,  227,  227,  268,  227,  227,  225,  225,
			  263,  225,  225,   75,   75,   75,   75,   75,   75,   75,
			   75,   75,  228,  228,  228,  229,  229,  229,  230,  230,
			  230,   86,   86,   86,   86,   86,   86,   86,   86,   86,
			  232,  232,  258,  232,  232,  233,  233,  253,  233,  233,

			  231,  231,  231,  231,  231,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,  234,  234,  234,  235,  235,  235,
			  236,  236,  236,  104,  104,  104,  104,  104,  104,  104,
			  104,  104,  237,  237,  237,  238,  238,  238,  239,  239,
			  239,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  240,
			  240,  240,  241,  241,  241,  242,  242,  242,  128,  128,
			  128,  128,  128,  128,  128,  128,  128,  243,  138,  138,
			  138,  225,  244,  245,  254,  254,  254,  255,  255,  256,
			  256,  257,  257,  257,  246,  247,  248,  249,  250,  251, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  252,  260,  260,  221,  260,  260,  262,  262,  273,  262,
			  262,  273,  261,  138,  138,  138,  264,  264,  264,  265,
			  265,  266,  266,  267,  267,  267,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  269,  269,  269,  270,  270,
			  270,  271,  271,  271,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  272,  272,  216,  272,  272,   75,   75,
			   75,   75,   75,   75,   75,   75,   75,  275,  275,  196,
			  275,  275,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  279,

			  279,  195,  279,  279,  281,  281,  276,  281,  281,  276,
			  280,  138,  138,  138,  283,  283,  283,  284,  284,  285,
			  285,  286,  286,  286,  138,  138,  138,  138,  138,  138,
			  138,  138,  138,  288,  288,  288,  289,  289,  289,  290,
			  290,  290,  291,  291,  191,  291,  291,  292,  292,  186,
			  292,  292,  138,  138,  138,  138,  138,  138,  138,  138,
			  138,  293,  293,  293,  294,  294,  294,  295,  295,  295,
			  138,  138,  138,  138,  138,  138,  138,  138,  138,  296,
			  296,  182,  296,  296,  298,  298,  177,  298,  298,  300,
			  300,  176,  300,  300,  301,  301,  171,  301,  301,  138, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  138,  138,  138,  138,  138,  138,  138,  138,  302,  302,
			  302,  303,  303,  303,  304,  304,  304,  138,  138,  138,
			  138,  138,  138,  138,  138,  138,  305,  305,  169,  305,
			  305,  306,  306,  167,  306,  306,  138,  138,  138,  138,
			  138,  138,  138,  138,  138,  307,  307,  163,  307,  307,
			  309,  309,  158,  309,  309,  311,  311,  156,  311,  311,
			  312,  312,  154,  312,  312,  138,  138,  138,  138,  138,
			  138,  138,  138,  138,  313,  313,  153,  313,  313,  314,
			  314,  148,  314,  314,  274,  274,  134,  274,  274,  277,
			  277,  129,  277,  277,  317,  317,  119,  317,  317,  318,

			  318,  114,  318,  318,  319,  319,   92,  319,  319,  320,
			  320,   87,  320,  320,  323,  323,  329,  323,  323,  324,
			  324,  329,  324,  324,  325,  325,  329,  325,  325,  326,
			  326,  329,  326,  326,  327,  327,  329,  327,  327,  328,
			  328,  329,  328,  328,   14,   14,   14,   14,   14,   14,
			   14,   17,   17,   17,   17,   17,   17,   17,   75,   75,
			   75,   75,  329,   75,   93,   93,   93,   93,  329,   93,
			  104,  104,  104,  104,  104,  329,  104,  120,  120,  297,
			  120,  120,  297,  120,  138,  138,  138,  138,  299,  138,
			  308,  299,  310,  308,  315,  310,  316,  315,  321,  316, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  322,  321,  329,  322,   13,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329, yy_Dummy>>,
			1, 38, 1000)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1037)
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
			    0,   73,    1,    2,   60,   60,  337,   18,  337,   21,
			   21,   74,   74,   61,   61,  338,  243,  338,  206,    1,
			    2,    3,    3,   28,   28,   28,  322,    3,  321,    3,
			    3,   30,   30,   30,   31,   31,   32,   32,   33,   33,
			   33,    3,    4,    4,   39,   39,   39,  316,    4,  315,
			    4,    4,   41,   41,   41,   42,   42,   43,   43,   44,
			   44,   44,    4,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   11,   11,
			   11,   11,   11,   11,   11,   26,   51,   51,   51,  310, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   26,   26,   53,   53,   53,   54,   54,   55,   55,   56,
			   56,   56,   26,   26,   26,   26,   26,   26,   26,   37,
			   66,   66,   66,  308,   37,   37,   68,   68,   68,   69,
			   69,   70,   70,   71,   71,   71,   37,   37,   37,   37,
			   37,   37,   37,   38,   78,   78,  299,   78,   78,   79,
			   79,   79,  297,   38,   81,   81,   81,   82,   82,   83,
			   83,   38,   38,   38,   38,   38,   38,   38,   48,   48,
			   48,   48,   48,   48,   48,   49,   84,   84,   84,  276,
			   49,   49,   87,   87,   87,   88,   88,   88,   89,   89,
			   89,  273,   49,   49,   49,   49,   49,   49,   49,   63,

			   90,   90,   90,   91,   91,   91,  100,  100,   63,   63,
			   63,   63,   63,   63,   63,   92,   92,   92,   96,   96,
			  252,   96,   96,   97,   97,   97,   99,   99,   99,  101,
			  101,  102,  102,  102,  106,  106,  106,  108,  108,  108,
			  109,  109,  110,  110,  111,  111,  111,  114,  114,  114,
			  115,  115,  115,  116,  116,  116,  117,  117,  117,  118,
			  118,  118,  119,  119,  119,  121,  121,  121,  123,  123,
			  123,  124,  124,  125,  125,  126,  126,  126,  129,  129,
			  129,  130,  130,  130,  131,  131,  131,  132,  132,  132,
			  133,  133,  133,  134,  134,  134,  138,  138,  140,  140, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  140,  142,  142,  142,  247,  138,  138,  138,  138,  138,
			  138,  138,  139,  143,  143,  144,  144,  139,  139,  145,
			  145,  145,  148,  148,  148,  149,  149,  149,  233,  139,
			  139,  139,  139,  139,  139,  139,  150,  150,  150,  151,
			  151,  151,  152,  152,  152,  153,  153,  153,  155,  155,
			  227,  155,  155,  156,  156,  215,  156,  156,  157,  157,
			  210,  157,  157,  158,  158,  158,  159,  159,  159,  160,
			  160,  160,  161,  161,  161,  162,  162,  162,  163,  163,
			  163,  164,  164,  164,  165,  165,  165,  166,  166,  166,
			  168,  168,  205,  168,  168,  169,  169,  200,  169,  169,

			  170,  170,  167,  170,  170,  171,  171,  171,  172,  172,
			  172,  173,  173,  173,  174,  174,  174,  175,  175,  175,
			  176,  176,  176,  177,  177,  177,  178,  178,  178,  179,
			  179,  179,  180,  180,  180,  181,  181,  181,  182,  182,
			  182,  183,  183,  183,  184,  184,  184,  185,  185,  185,
			  186,  186,  186,  187,  187,  187,  188,  188,  188,  189,
			  189,  189,  190,  190,  190,  191,  191,  191,  192,  192,
			  192,  193,  193,  193,  194,  194,  194,  197,  199,  199,
			  199,  154,  197,  197,  201,  201,  201,  202,  202,  203,
			  203,  204,  204,  204,  197,  197,  197,  197,  197,  197, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  197,  207,  207,  146,  207,  207,  208,  208,  339,  208,
			  208,  339,  207,  209,  209,  209,  211,  211,  211,  212,
			  212,  213,  213,  214,  214,  214,  216,  216,  216,  217,
			  217,  217,  218,  218,  218,  219,  219,  219,  220,  220,
			  220,  221,  221,  221,  222,  222,  222,  223,  223,  223,
			  224,  224,  224,  226,  226,  141,  226,  226,  228,  228,
			  228,  229,  229,  229,  230,  230,  230,  232,  232,  137,
			  232,  232,  234,  234,  234,  235,  235,  235,  236,  236,
			  236,  237,  237,  237,  238,  238,  238,  239,  239,  239,
			  240,  240,  240,  241,  241,  241,  242,  242,  242,  244,

			  244,  136,  244,  244,  245,  245,  340,  245,  245,  340,
			  244,  246,  246,  246,  248,  248,  248,  249,  249,  250,
			  250,  251,  251,  251,  253,  253,  253,  254,  254,  254,
			  255,  255,  255,  256,  256,  256,  257,  257,  257,  258,
			  258,  258,  260,  260,  127,  260,  260,  261,  261,  122,
			  261,  261,  263,  263,  263,  264,  264,  264,  265,  265,
			  265,  266,  266,  266,  267,  267,  267,  268,  268,  268,
			  269,  269,  269,  270,  270,  270,  271,  271,  271,  272,
			  272,  112,  272,  272,  275,  275,  107,  275,  275,  279,
			  279,  103,  279,  279,  280,  280,   98,  280,  280,  282, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  282,  282,  283,  283,  283,  284,  284,  284,  285,  285,
			  285,  286,  286,  286,  287,  287,  287,  288,  288,  288,
			  289,  289,  289,  290,  290,  290,  291,  291,   95,  291,
			  291,  292,  292,   94,  292,  292,  293,  293,  293,  294,
			  294,  294,  295,  295,  295,  296,  296,   85,  296,  296,
			  298,  298,   80,  298,  298,  300,  300,   77,  300,  300,
			  301,  301,   76,  301,  301,  302,  302,  302,  303,  303,
			  303,  304,  304,  304,  305,  305,   72,  305,  305,  306,
			  306,   67,  306,  306,  307,  307,   57,  307,  307,  309,
			  309,   52,  309,  309,  311,  311,   45,  311,  311,  312,

			  312,   40,  312,  312,  313,  313,   34,  313,  313,  314,
			  314,   29,  314,  314,  317,  317,   13,  317,  317,  318,
			  318,    0,  318,  318,  320,  320,    0,  320,  320,  324,
			  324,    0,  324,  324,  325,  325,    0,  325,  325,  326,
			  326,    0,  326,  326,  330,  330,  330,  330,  330,  330,
			  330,  331,  331,  331,  331,  331,  331,  331,  332,  332,
			  332,  332,    0,  332,  333,  333,  333,  333,    0,  333,
			  334,  334,  334,  334,  334,    0,  334,  335,  335,  341,
			  335,  335,  341,  335,  336,  336,  336,  336,  342,  336,
			  343,  342,  344,  343,  345,  344,  346,  345,  347,  346, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  348,  347,    0,  348,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329, yy_Dummy>>,
			1, 38, 1000)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 348)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    1,   20,   41,   62,    0,   95,    0,  128,
			    0,  161,    0,  916, 1004, 1004, 1004, 1004,    6, 1004,
			 1004,    0, 1004, 1004, 1004, 1004,  186, 1004,    1,  887,
			    9,   12,   13,   16,  884, 1004, 1004,  210,  235,   22,
			  877,   30,   33,   34,   37,  874, 1004, 1004,  242,  266,
			 1004,  174,  867,  180,  183,  184,  187,  864, 1004, 1004,
			    3,    0, 1004,  282,    0, 1004,  198,  857,  204,  207,
			  208,  211,  854,    0,    2, 1004,  853,  837,  235,  227,
			  828,  232,  235,  236,  254,  825, 1004,  260,  263,  266,
			  278,  281,  293, 1004,  824,  808,  309,  301,  772,  304,

			  284,  306,  309,  769, 1004, 1004,  312,  762,  315,  318,
			  319,  322,  759, 1004,  325,  328,  331,  334,  337,  340,
			 1004,  343,  725,  346,  349,  350,  353,  722, 1004,  356,
			  359,  362,  365,  368,  371, 1004,  690,  658,  379,  403,
			  376,  631,  379,  391,  392,  397,  581, 1004,  400,  403,
			  414,  417,  420,  423,  572,  439,  444,  449,  441,  444,
			  447,  450,  453,  456,  459,  462,  465,  493,  481,  486,
			  491,  483,  486,  489,  492,  495,  498,  501,  504,  507,
			  510,  513,  516,  519,  522,  525,  528,  531,  534,  537,
			  540,  543,  546,  549,  552, 1004, 1004,  568, 1004,  556, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  473,  562,  565,  566,  569,  470,    9,  592,  597,  591,
			  436,  594,  597,  598,  601,  433,  604,  607,  610,  613,
			  616,  619,  622,  625,  628, 1004,  644,  429,  636,  639,
			  642, 1004,  658,  407,  650,  653,  656,  659,  662,  665,
			  668,  671,  674,    7,  690,  695,  689,  380,  692,  695,
			  696,  699,  298,  702,  705,  708,  711,  714,  717,    0,
			  733,  738,    0,  730,  733,  736,  739,  742,  745,  748,
			  751,  754,  770,  270, 1004,  775,  258, 1004,    0,  780,
			  785,    0,  777,  780,  783,  786,  789,  792,  795,  798,
			  801,  817,  822,  814,  817,  820,  836,  231,  841,  225,

			  846,  851,  843,  846,  849,  865,  870,  875,  202,  880,
			  178,  885,  890,  895,  900,   28,   26,  905,  910,    0,
			  915,    7,    5,    0,  920,  925,  930,    0,    0, 1004,
			  943,  950,  956,  962,  969,  976,  982,    4,   13,  606,
			  704,  977,  986,  988,  990,  992,  994,  996,  998, yy_Dummy>>,
			1, 149, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 348)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  330,  330,  331,  331,  329,    5,  329,    7,  329,
			    9,  329,   11,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  332,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  333,  334,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  335,  332,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  336,   49,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  337,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  338,  329,  329,  329,  329,

			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  336,  336,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  139,  329,  329, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  329,  329,  329,  329,  329,  329,  138,  138,  138,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  339,  329,  329,
			  329,  329,  329,  340,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  138,  138,  138,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  138,
			  138,  138,  138,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  341,  329,  329,  342,  329,  138,  138,
			  138,  138,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  138,  138,  329,  329,  329,  329,  343,  329,  344,

			  138,  138,  329,  329,  329,  138,  138,  329,  345,  329,
			  346,  138,  138,  138,  138,  347,  348,  138,  138,  138,
			  138,  329,  329,  138,  138,  138,  138,  138,  138,    0,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329, yy_Dummy>>,
			1, 149, 200)
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
			    0,   33,   33,   33,   33,   33,   33,   33,   33,    1,
			    2,   33,   33,    1,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,    1,   33,    3,   33,    4,   33,   33,   33,
			    5,    6,    6,    6,    7,    8,    6,    6,    9,    9,
			    9,    9,    9,    9,    9,    9,   10,   10,   11,   33,
			   33,   33,   33,    6,   33,   12,   13,   12,   12,   12,
			   12,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   14,   33,   33,   15,   33,
			   33,   16,   17,   18,   19,   33,   33,   12,   13,   12,

			   12,   12,   12,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   14,   33,   33,
			   15,   33,   33,   20,    6,   21,   33,   33,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   25,   25,   26,   26,   26,   26,   26,   26, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   27,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   29,   28,   28,
			   30,   31,   31,   31,   32,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   33, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    7,    1,    7,    7,    7,    7,    7,    7,    2,
			    2,    7,    2,    2,    7,    7,    7,    7,    3,    7,
			    4,    5,    6,    6,    6,    6,    7,    7,    7,    7,
			    7,    7,    7,    7, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 329)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   37,    2,   35,    1,   15,   11,   16,
			   13,   12,   14,   17,   19,   18,   17,   34,   34,   34,
			   34,   34,   34,   34,   34,   28,   29,   28,   28,   34,
			   34,   34,   34,   34,   34,   34,   31,   33,   31,   31,
			   32,   34,   34,   34,   34,   34,   34,   34,   10,    5,
			   10,    9,    9,   10,   10,    7,   34,   34,   34,   34,
			   34,   34,   34,   11,   12,   20,   20,   20,   20,    0,
			    0,    0,    0,    0,    0,    0,   17,    0,    0,    0,
			    0,    0,    0,   23,   23,   23,   23,    0,    0,    0,

			    0,    0,    0,    0,   26,   27,    0,    0,    0,    0,
			    0,    0,    0,   28,    0,    0,    0,    0,    0,    0,
			   30,    0,    0,    0,    0,    0,    0,    0,   31,    0,
			    0,    0,    0,    0,    0,    6,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   10,    0,    0,
			    0,    0,    0,    0,   21,   22,    0,   21,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   24,   25,    0,
			   24,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    4,    3,    0,    8,    0, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   21,   22,    0,    0,    0,
			    0,   24,   25,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   22,    0,   22,   25,    0,   25,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,   22,    0,   25,    0,

			    0,    0,    0,    0,    0,    0,    0,   22,    0,   25,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 130, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1004
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 329
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 330
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 33
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

	yyNb_rules: INTEGER = 36
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 37
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

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

end
