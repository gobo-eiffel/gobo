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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_WILDCARD_TOKENS
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
--|#line 56 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 56")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 2 then
--|#line 60 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 60")
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
							if character_classes.has (l_last_string) then
								last_token := CCL_OP
								last_lx_symbol_class_value := character_classes.item (l_last_string)
							else
								last_token := CCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						end
					end
				
when 3 then
--|#line 85 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 85")
end
last_token := STAR_PAREN
when 4 then
--|#line 86 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 86")
end
last_token := STAR_STAR_SLASH
when 5 then
--|#line 87 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 87")
end
last_token := text_item (1).code
when 6 then
--|#line 88 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 88")
end

					last_token := CHAR
					process_utf8_character
				
when 7 then
--|#line 95 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 95")
end

					last_token := CHAR
					process_utf8_character
				
when 8 then
--|#line 99 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 99")
end

					last_token := Double_quote_code
					set_start_condition (INITIAL)
				
when 9 then
--|#line 103 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 103")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (INITIAL)
				
when 10 then
--|#line 112 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 112")
end

					last_token := CHAR
					process_escaped_character
				
when 11 then
--|#line 116 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 116")
end

					last_token := BCHAR
					process_byte_character
				
when 12 then
--|#line 120 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 120")
end

					last_token := UCHAR
					process_unicode_character
				
when 13 then
--|#line 127 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 127")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 14 then
--|#line 132 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 132")
end

					last_token := BCHAR
					process_byte_character
					set_start_condition (CCL)
				
when 15 then
--|#line 137 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 137")
end

					last_token := UCHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 16 then
	yy_end := yy_start + yy_more_len + 1
--|#line 142 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 142")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 17 then
	yy_end := yy_start + yy_more_len + 1
--|#line 146 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 146")
end
last_token := Caret_code
when 18 then
--|#line 147 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 147")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 19 then
--|#line 152 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 152")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 20 then
	yy_end := yy_start + yy_more_len + 1
--|#line 161 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 161")
end
last_token := Minus_code
when 21 then
--|#line 162 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 162")
end

					last_token := CHAR
					process_utf8_character
				
when 22 then
--|#line 166 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 166")
end

					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 23 then
--|#line 170 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 170")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (INITIAL)
				
when 24 then
--|#line 179 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 179")
end

					report_bad_character_error (text)
				
when 25 then
--|#line 182 "lx_wildcard_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_wildcard_scanner.l' at line 182")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 26 then
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
			create an_array.make_filled (0, 0, 888)
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
			    0,   10,   11,   12,   13,   13,   14,   10,   10,   10,
			   10,   10,   10,   15,   16,   10,   10,   10,   10,   17,
			   17,   17,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   28,   25,   25,   25,   25,   17,   17,
			   17,   17,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   38,   36,   39,   36,   36,   17,   17,   17,
			   17,   40,   41,   42,   43,   44,   45,   46,   47,   48,
			   47,   47,   47,   47,   49,   47,   47,   47,   47,   47,

			   47,   50,   51,   47,   47,   47,   17,   17,   17,   17,
			   52,   53,   54,   55,   56,   57,   58,   59,  277,   60,
			   62,   81,   81,   81,   83,   83,   83,   84,   84,   63,
			   64,   65,   66,   67,   68,   69,   70,  274,   70,   70,
			   70,   70,   70,   70,   71,   70,   72,   73,   70,   70,
			   70,   70,   70,   70,   85,   85,   91,   91,   74,   75,
			   76,   77,   78,   79,   80,   86,   86,   86,   88,   88,
			   88,   90,   90,   90,   92,   92,   93,   93,   93,   95,
			  263,   95,   95,   95,   95,   95,   95,   96,   95,   97,
			   98,   95,   95,   95,   95,   95,   95,  115,  115,  115, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  258,   99,  100,  101,  102,  103,  104,  105,  107,  117,
			  117,  117,  118,  118,  119,  119,  107,  120,  120,  120,
			  130,  130,  130,  254,  108,  109,  110,  111,  112,  113,
			  114,  123,  124,  125,  126,  127,  128,  129,  132,  132,
			  132,  133,  133,  134,  134,  135,  135,  135,  138,  139,
			   61,   61,   61,  158,  158,  158,  242,  140,  141,  142,
			  143,  144,  145,  146,  147,  236,  148,  149,  159,  159,
			  160,  160,  161,  161,  161,  166,  166,  232,  150,  151,
			  152,  153,  154,  155,  156,  164,  164,   70,   70,   70,
			  168,  168,  168,  165,  169,  169,  170,  170,  171,  171,

			  171,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			  173,  173,  173,  174,  174,  174,  175,  175,  175,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,  176,  176,
			  176,  177,  177,  177,  178,  178,  178,  180,  180,  182,
			  182,   95,   95,   95,  227,  181,  184,  184,  184,  185,
			  185,  186,  186,  187,  187,  187,  106,  106,  106,  190,
			  190,  190,  191,  191,  192,  192,  193,  193,  193,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  195,  195,
			  195,  196,  196,  196,  197,  197,  197,  122,  122,  122,
			  199,  199,  199,  200,  200,  201,  201,  202,  202,  202, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  204,
			  204,  204,  205,  205,  205,  206,  206,  206,  207,  223,
			  208,  209,   61,   61,   61,  218,  218,  218,  219,  219,
			  220,  220,  210,  211,  212,  213,  214,  215,  216,  221,
			  221,  221,  224,  224,  226,  226,   61,   61,   61,  222,
			  225,  228,  228,  228,  229,  229,  230,  230,  231,  231,
			  231,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			  233,  233,  233,  234,  234,  234,  235,  235,  235,  237,
			  237,  238,  238,  236,  236,   70,   70,   70,   70,   70,
			   70,   70,   70,   70,  239,  239,  239,  240,  240,  240,

			  241,  241,  241,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,  243,  243,  244,  244,  242,  242,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,  245,  245,  245,  246,
			  246,  246,  247,  247,  247,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  248,  248,  248,  249,  249,  249,
			  250,  250,  250,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  122,  122,  122,  122,  122,  122,  122,  122,
			  122,  251,  251,  251,  252,  252,  252,  253,  253,  253,
			  130,  130,  130,  130,  130,  130,  130,  130,  130,  255, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  255,  257,  257,   61,   61,   61,  217,  256,  259,  259,
			  259,  260,  260,  261,  261,  262,  262,  262,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,  264,  264,  264,
			  265,  265,  265,  266,  266,  266,  267,  267,  268,  268,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,  269,
			  269,  269,  270,  270,  270,  271,  271,  271,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,  272,  272,  273,
			  273,   70,   70,   70,   70,   70,   70,  203,  274,   70,
			   70,   70,  275,  275,  276,  276,   95,   95,   95,   95,
			   95,   95,  198,  277,   95,   95,   95,  106,  106,  106,

			  106,  106,  106,  106,  106,  106,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  278,  278,  279,  279,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,  280,  280,
			  280,  281,  281,  281,  282,  282,  282,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,  283,  283,  284,  284,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,  285,
			  285,  286,  286,  287,  287,  288,  288,  289,  289,  194,
			  274,  290,  290,  189,  277,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,  291,  291,  292,  292,  293,  293,
			  294,  294,  295,  295,  296,  296,  297,  297,  188,  274, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  298,  298,  183,  277,  299,  299,  300,  300,  274,  274,
			  301,  301,  277,  277,  302,  302,  303,  303,  179,  274,
			  304,  304,  172,  277,  305,  305,  306,  306,  307,  307,
			  308,  308,  309,  309,   61,  274,   61,  277,  310,  310,
			  106,  106,  106,  122,  122,  167,  163,  162,  157,  137,
			  136,  131,  121,  116,   94,   89,   87,   82,  311,    9,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311, yy_Dummy>>,
			1, 89, 800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 888)
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
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,

			    7,    7,    7,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,   14,  307,   14,
			   15,   18,   18,   18,   20,   20,   20,   21,   21,   15,
			   15,   15,   15,   15,   15,   15,   16,  306,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   22,   22,   32,   32,   16,   16,
			   16,   16,   16,   16,   16,   23,   23,   23,   29,   29,
			   29,   31,   31,   31,   33,   33,   34,   34,   34,   38,
			  216,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   40,   40,   40, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  211,   38,   38,   38,   38,   38,   38,   38,   39,   42,
			   42,   42,   43,   43,   44,   44,   39,   45,   45,   45,
			   52,   52,   52,  207,   39,   39,   39,   39,   39,   39,
			   39,   49,   49,   49,   49,   49,   49,   49,   54,   54,
			   54,   55,   55,   56,   56,   57,   57,   57,   61,   61,
			   63,   63,   63,   65,   65,   65,  179,   61,   61,   61,
			   61,   61,   61,   61,   62,  163,   62,   62,   66,   66,
			   67,   67,   68,   68,   68,   73,   73,  156,   62,   62,
			   62,   62,   62,   62,   62,   72,   72,   74,   74,   74,
			   76,   76,   76,   72,   77,   77,   78,   78,   79,   79,

			   79,   82,   82,   82,   83,   83,   83,   84,   84,   84,
			   85,   85,   85,   86,   86,   86,   87,   87,   87,   89,
			   89,   89,   90,   90,   90,   91,   91,   91,   92,   92,
			   92,   93,   93,   93,   94,   94,   94,   97,   97,   98,
			   98,   99,   99,   99,  151,   97,  101,  101,  101,  102,
			  102,  103,  103,  104,  104,  104,  108,  108,  108,  110,
			  110,  110,  111,  111,  112,  112,  113,  113,  113,  116,
			  116,  116,  117,  117,  117,  118,  118,  118,  119,  119,
			  119,  120,  120,  120,  121,  121,  121,  123,  123,  123,
			  125,  125,  125,  126,  126,  127,  127,  128,  128,  128, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  131,  131,  131,  132,  132,  132,  133,  133,  133,  134,
			  134,  134,  135,  135,  135,  136,  136,  136,  138,  147,
			  138,  138,  140,  140,  140,  142,  142,  142,  143,  143,
			  144,  144,  138,  138,  138,  138,  138,  138,  138,  145,
			  145,  145,  148,  148,  149,  149,  150,  150,  150,  146,
			  148,  152,  152,  152,  153,  153,  154,  154,  155,  155,
			  155,  157,  157,  157,  158,  158,  158,  159,  159,  159,
			  160,  160,  160,  161,  161,  161,  162,  162,  162,  164,
			  164,  165,  165,  166,  166,  167,  167,  167,  168,  168,
			  168,  169,  169,  169,  170,  170,  170,  171,  171,  171,

			  172,  172,  172,  173,  173,  173,  174,  174,  174,  175,
			  175,  175,  176,  176,  176,  177,  177,  177,  178,  178,
			  178,  180,  180,  181,  181,  182,  182,  183,  183,  183,
			  184,  184,  184,  185,  185,  185,  186,  186,  186,  187,
			  187,  187,  188,  188,  188,  189,  189,  189,  190,  190,
			  190,  191,  191,  191,  192,  192,  192,  193,  193,  193,
			  194,  194,  194,  195,  195,  195,  196,  196,  196,  197,
			  197,  197,  198,  198,  198,  199,  199,  199,  200,  200,
			  200,  201,  201,  201,  202,  202,  202,  203,  203,  203,
			  204,  204,  204,  205,  205,  205,  206,  206,  206,  208, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  208,  209,  209,  210,  210,  210,  141,  208,  212,  212,
			  212,  213,  213,  214,  214,  215,  215,  215,  217,  217,
			  217,  218,  218,  218,  219,  219,  219,  220,  220,  220,
			  221,  221,  221,  222,  222,  222,  224,  224,  225,  225,
			  227,  227,  227,  228,  228,  228,  229,  229,  229,  230,
			  230,  230,  231,  231,  231,  232,  232,  232,  233,  233,
			  233,  234,  234,  234,  235,  235,  235,  237,  237,  238,
			  238,  239,  239,  239,  240,  240,  240,  129,  238,  241,
			  241,  241,  243,  243,  244,  244,  245,  245,  245,  246,
			  246,  246,  124,  244,  247,  247,  247,  248,  248,  248,

			  249,  249,  249,  250,  250,  250,  251,  251,  251,  252,
			  252,  252,  253,  253,  253,  255,  255,  256,  256,  258,
			  258,  258,  259,  259,  259,  260,  260,  260,  261,  261,
			  261,  262,  262,  262,  263,  263,  263,  264,  264,  264,
			  265,  265,  265,  266,  266,  266,  267,  267,  268,  268,
			  269,  269,  269,  270,  270,  270,  271,  271,  271,  272,
			  272,  273,  273,  275,  275,  276,  276,  278,  278,  114,
			  273,  279,  279,  109,  276,  280,  280,  280,  281,  281,
			  281,  282,  282,  282,  283,  283,  284,  284,  285,  285,
			  286,  286,  287,  287,  288,  288,  289,  289,  105,  286, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  290,  290,  100,  288,  291,  291,  292,  292,  293,  293,
			  294,  294,  295,  295,  296,  296,  297,  297,   96,  294,
			  298,  298,   80,  296,  300,  300,  301,  301,  302,  302,
			  304,  304,  305,  305,  312,  301,  312,  302,  308,  308,
			  313,  313,  313,  314,  314,   75,   71,   69,   64,   60,
			   58,   53,   46,   41,   35,   30,   24,   19,    9,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311, yy_Dummy>>,
			1, 89, 800)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 314)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   29,    0,   58,    0,   87,    0,  858,
			  859,  859,  859,  859,  113,  106,  135,  859,  102,  836,
			  105,  108,  134,  146,  837,  859,  859,  859,    0,  149,
			  834,  152,  137,  154,  157,  835,  859,  859,  178,  201,
			  178,  832,  190,  193,  194,  198,  833,  859,  859,  208,
			    0,  859,  201,  830,  219,  222,  223,  226,  831,  859,
			  841,  234,  255,  231,  827,  234,  249,  250,  253,  828,
			  859,  837,  276,  266,  268,  824,  271,  275,  276,  279,
			  803,  859,  282,  285,  288,  291,  294,  297,  859,  300,
			  303,  306,  309,  312,  315,  859,  809,  328,  330,  322,

			  781,  327,  330,  331,  334,  779,  859,  859,  337,  752,
			  340,  343,  344,  347,  750,  859,  350,  353,  356,  359,
			  362,  365,  859,  368,  671,  371,  374,  375,  378,  658,
			  859,  381,  384,  387,  390,  393,  396,  859,  409,  859,
			  403,  585,  406,  409,  410,  420,  430,  410,  433,  435,
			  427,  323,  432,  435,  436,  439,  258,  442,  445,  448,
			  451,  454,  457,  256,  470,  472,  474,  466,  469,  472,
			  475,  478,  481,  484,  487,  490,  493,  496,  499,  247,
			  512,  514,  516,  508,  511,  514,  517,  520,  523,  526,
			  529,  532,  535,  538,  541,  544,  547,  550,  553,  556, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  559,  562,  565,  568,  571,  574,  577,  214,  590,  592,
			  584,  179,  589,  592,  593,  596,  161,  599,  602,  605,
			  608,  611,  614,    0,  627,  629,    0,  621,  624,  627,
			  630,  633,  636,  639,  642,  645,  859,  658,  660,  652,
			  655,  660,  859,  673,  675,  667,  670,  675,  678,  681,
			  684,  687,  690,  693,    0,  706,  708,    0,  700,  703,
			  706,  709,  712,  715,  718,  721,  724,  737,  739,  731,
			  734,  737,  750,  752,  859,  754,  756,  859,  758,  762,
			  756,  759,  762,  775,  777,  779,  781,  783,  785,  787,
			  791,  795,  797,  799,  801,  803,  805,  807,  811,    0,

			  815,  817,  819,    0,  821,  823,  119,  100,  829,    0,
			    0,  859,  833,  839,  842, yy_Dummy>>,
			1, 115, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 314)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  311,    1,  311,    3,  311,    5,  311,    7,  311,
			  311,  311,  311,  311,  311,  312,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,   16,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  313,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  314,
			   16,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  312,  312,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,

			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,   62,  311,
			  311,  311,  311,  311,  311,  311,  311,   61,   61,   61,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  311,  311,  311,  311,  311,  311,  311,   61,   61,   61,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,   61,   61,   61,   61,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,  311,  311,
			  311,  311,  311,  311,   61,   61,   61,   61,  311,  311,
			  311,  311,  311,  311,  311,  311,  311,   61,   61,  311,
			  311,  311,  311,  311,  311,  311,  311,  311,   61,   61,
			  311,  311,  311,   61,   61,  311,  311,  311,  311,   61,
			   61,   61,   61,  311,  311,  311,  311,   61,   61,   61,

			   61,  311,  311,   61,   61,   61,  311,  311,   61,   61,
			   61,    0,  311,  311,  311, yy_Dummy>>,
			1, 115, 200)
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
			    1,    1,    1,    1,    1,   11,    1,    1,   12,    1,
			    1,   13,   14,   15,   16,    1,    1,   10,   10,   10,

			   10,   10,   10,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,   11,    1,    1,
			   12,    1,    1,   17,    5,   18,    1,    1,   19,   19,
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
			   22,   22,   22,   22,   22,   22,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    3,    1,    1,    1,    4,
			    4,    4,    4,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 311)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   27,
			    6,   25,    1,    5,    5,    6,    6,   24,   24,   24,
			   24,   24,   24,   24,   24,    7,    9,    8,    7,   24,
			   24,   24,   24,   24,   24,   24,   18,   19,   18,   18,
			   24,   24,   24,   24,   24,   24,   24,   21,   23,   21,
			   21,   22,   24,   24,   24,   24,   24,   24,   24,    3,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   10,   10,   10,   10,    0,    0,    0,    0,    0,    0,
			    0,    6,    0,    0,    0,    0,    0,    0,    7,    0,
			    0,    0,    0,    0,    0,   13,   13,   13,   13,    0,

			    0,    0,    0,    0,    0,    0,   16,   17,    0,    0,
			    0,    0,    0,    0,    0,   18,    0,    0,    0,    0,
			    0,    0,   20,    0,    0,    0,    0,    0,    0,    0,
			   21,    0,    0,    0,    0,    0,    0,    4,    0,    2,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   11,   12,    0,   11,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   14,
			   15,    0,   14,    0,    0,    0,    0,    0,    0,    0,
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
			    0,    0,    0,    0,    0,    0,   11,   12,    0,    0,
			    0,    0,   14,   15,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   12,    0,   12,   15,    0,   15,    0,    0,
			    0,    0,    0,    0,    0,   12,    0,   15,    0,    0,
			    0,    0,    0,   12,    0,   15,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, yy_Dummy>>,
			1, 112, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 859
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 311
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 312
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

	yyNb_rules: INTEGER = 26
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 27
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

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

end
