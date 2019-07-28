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
			    0,   11,   12,   13,   13,   14,   10,   10,   10,   10,
			   10,   10,   15,   16,   10,   10,   10,   10,   17,   17,
			   17,   17,   18,   19,   20,   21,   22,   23,   24,   10,
			   26,   27,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   28,   25,   25,   25,   25,   17,   17,   17,
			   17,   29,   30,   31,   32,   33,   34,   35,   25,   37,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   38,   36,   39,   36,   36,   17,   17,   17,   17,
			   40,   41,   42,   43,   44,   45,   46,   36,   48,   47,
			   47,   47,   47,   49,   47,   47,   47,   47,   47,   47,

			   50,   51,   47,   47,   47,   17,   17,   17,   17,   52,
			   53,   54,   55,   56,   57,   58,   47,   59,  277,   60,
			   62,   81,   81,   81,   83,   83,   83,   84,   84,   63,
			   64,   65,   66,   67,   68,   69,   70,   70,   70,   70,
			   70,   70,   71,   70,   72,   73,   70,   70,   70,   70,
			   70,   70,   85,   85,   91,   91,   74,   75,   76,   77,
			   78,   79,   80,   70,   86,   86,   86,   88,   88,   88,
			   90,   90,   90,   92,   92,   93,   93,   93,   95,   95,
			   95,   95,   95,   95,   96,   95,   97,   98,   95,   95,
			   95,   95,   95,   95,  115,  115,  115,  274,   99,  100, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  101,  102,  103,  104,  105,   95,  107,  117,  117,  117,
			  118,  118,  119,  119,  107,  120,  120,  120,  130,  130,
			  130,  263,  108,  109,  110,  111,  112,  113,  114,  123,
			  124,  125,  126,  127,  128,  129,  132,  132,  132,  133,
			  133,  134,  134,  135,  135,  135,  138,  139,   61,   61,
			   61,  158,  158,  158,  258,  140,  141,  142,  143,  144,
			  145,  146,  147,  254,  148,  149,  159,  159,  160,  160,
			  161,  161,  161,  166,  166,  242,  150,  151,  152,  153,
			  154,  155,  156,  164,  164,   70,   70,   70,  168,  168,
			  168,  165,  169,  169,  170,  170,  171,  171,  171,   81,

			   81,   81,   81,   81,   81,   81,   81,   81,  173,  173,
			  173,  174,  174,  174,  175,  175,  175,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,  176,  176,  176,  177,
			  177,  177,  178,  178,  178,  180,  180,  182,  182,   95,
			   95,   95,  236,  181,  184,  184,  184,  185,  185,  186,
			  186,  187,  187,  187,  106,  106,  106,  190,  190,  190,
			  191,  191,  192,  192,  193,  193,  193,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  195,  195,  195,  196,
			  196,  196,  197,  197,  197,  122,  122,  122,  199,  199,
			  199,  200,  200,  201,  201,  202,  202,  202,  130,  130, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  130,  130,  130,  130,  130,  130,  130,  204,  204,  204,
			  205,  205,  205,  206,  206,  206,  207,  232,  208,  209,
			   61,   61,   61,  218,  218,  218,  219,  219,  220,  220,
			  210,  211,  212,  213,  214,  215,  216,  221,  221,  221,
			  224,  224,  226,  226,   61,   61,   61,  227,  225,  228,
			  228,  228,  229,  229,  230,  230,  231,  231,  231,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,  233,  233,
			  233,  234,  234,  234,  235,  235,  235,  237,  237,  238,
			  238,  236,  236,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,  239,  239,  239,  240,  240,  240,  241,  241,

			  241,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,  243,
			  243,  244,  244,  242,  242,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,  245,  245,  245,  246,  246,  246,
			  247,  247,  247,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  248,  248,  248,  249,  249,  249,  250,  250,
			  250,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  122,  122,  122,  122,  122,  122,  122,  122,  122,  251,
			  251,  251,  252,  252,  252,  253,  253,  253,  130,  130,
			  130,  130,  130,  130,  130,  130,  130,  255,  255,  257, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  257,   61,   61,   61,  223,  256,  259,  259,  259,  260,
			  260,  261,  261,  262,  262,  262,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,  264,  264,  264,  265,  265,
			  265,  266,  266,  266,  267,  267,  268,  268,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,  269,  269,  269,
			  270,  270,  270,  271,  271,  271,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,  272,  272,  273,  273,   70,
			   70,   70,   70,   70,   70,  222,  274,   70,   70,   70,
			  275,  275,  276,  276,   95,   95,   95,   95,   95,   95,
			  217,  277,   95,   95,   95,  106,  106,  106,  106,  106,

			  106,  106,  106,  106,  122,  122,  122,  122,  122,  122,
			  122,  122,  122,  278,  278,  279,  279,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,  280,  280,  280,  281,
			  281,  281,  282,  282,  282,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,  283,  283,  284,  284,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,  285,  285,  286,
			  286,  287,  287,  288,  288,  289,  289,  203,  274,  290,
			  290,  198,  277,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,  291,  291,  292,  292,  293,  293,  294,  294,
			  295,  295,  296,  296,  297,  297,  194,  274,  298,  298, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  189,  277,  299,  299,  300,  300,  274,  274,  301,  301,
			  277,  277,  302,  302,  303,  303,  188,  274,  304,  304,
			  183,  277,  305,  305,  306,  306,  307,  307,  308,  308,
			  309,  309,   61,  274,   61,  277,  310,  310,  106,  106,
			  122,  106,  179,  122,  172,  167,  163,  162,  157,  137,
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
			   15,   15,   15,   15,   15,   15,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   22,   22,   32,   32,   16,   16,   16,   16,
			   16,   16,   16,   16,   23,   23,   23,   29,   29,   29,
			   31,   31,   31,   33,   33,   34,   34,   34,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   40,   40,   40,  306,   38,   38, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   38,   38,   38,   38,   38,   38,   39,   42,   42,   42,
			   43,   43,   44,   44,   39,   45,   45,   45,   52,   52,
			   52,  216,   39,   39,   39,   39,   39,   39,   39,   49,
			   49,   49,   49,   49,   49,   49,   54,   54,   54,   55,
			   55,   56,   56,   57,   57,   57,   61,   61,   63,   63,
			   63,   65,   65,   65,  211,   61,   61,   61,   61,   61,
			   61,   61,   62,  207,   62,   62,   66,   66,   67,   67,
			   68,   68,   68,   73,   73,  179,   62,   62,   62,   62,
			   62,   62,   62,   72,   72,   74,   74,   74,   76,   76,
			   76,   72,   77,   77,   78,   78,   79,   79,   79,   82,

			   82,   82,   83,   83,   83,   84,   84,   84,   85,   85,
			   85,   86,   86,   86,   87,   87,   87,   89,   89,   89,
			   90,   90,   90,   91,   91,   91,   92,   92,   92,   93,
			   93,   93,   94,   94,   94,   97,   97,   98,   98,   99,
			   99,   99,  163,   97,  101,  101,  101,  102,  102,  103,
			  103,  104,  104,  104,  108,  108,  108,  110,  110,  110,
			  111,  111,  112,  112,  113,  113,  113,  116,  116,  116,
			  117,  117,  117,  118,  118,  118,  119,  119,  119,  120,
			  120,  120,  121,  121,  121,  123,  123,  123,  125,  125,
			  125,  126,  126,  127,  127,  128,  128,  128,  131,  131, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  131,  132,  132,  132,  133,  133,  133,  134,  134,  134,
			  135,  135,  135,  136,  136,  136,  138,  156,  138,  138,
			  140,  140,  140,  142,  142,  142,  143,  143,  144,  144,
			  138,  138,  138,  138,  138,  138,  138,  145,  145,  145,
			  148,  148,  149,  149,  150,  150,  150,  151,  148,  152,
			  152,  152,  153,  153,  154,  154,  155,  155,  155,  157,
			  157,  157,  158,  158,  158,  159,  159,  159,  160,  160,
			  160,  161,  161,  161,  162,  162,  162,  164,  164,  165,
			  165,  166,  166,  167,  167,  167,  168,  168,  168,  169,
			  169,  169,  170,  170,  170,  171,  171,  171,  172,  172,

			  172,  173,  173,  173,  174,  174,  174,  175,  175,  175,
			  176,  176,  176,  177,  177,  177,  178,  178,  178,  180,
			  180,  181,  181,  182,  182,  183,  183,  183,  184,  184,
			  184,  185,  185,  185,  186,  186,  186,  187,  187,  187,
			  188,  188,  188,  189,  189,  189,  190,  190,  190,  191,
			  191,  191,  192,  192,  192,  193,  193,  193,  194,  194,
			  194,  195,  195,  195,  196,  196,  196,  197,  197,  197,
			  198,  198,  198,  199,  199,  199,  200,  200,  200,  201,
			  201,  201,  202,  202,  202,  203,  203,  203,  204,  204,
			  204,  205,  205,  205,  206,  206,  206,  208,  208,  209, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  209,  210,  210,  210,  147,  208,  212,  212,  212,  213,
			  213,  214,  214,  215,  215,  215,  217,  217,  217,  218,
			  218,  218,  219,  219,  219,  220,  220,  220,  221,  221,
			  221,  222,  222,  222,  224,  224,  225,  225,  227,  227,
			  227,  228,  228,  228,  229,  229,  229,  230,  230,  230,
			  231,  231,  231,  232,  232,  232,  233,  233,  233,  234,
			  234,  234,  235,  235,  235,  237,  237,  238,  238,  239,
			  239,  239,  240,  240,  240,  146,  238,  241,  241,  241,
			  243,  243,  244,  244,  245,  245,  245,  246,  246,  246,
			  141,  244,  247,  247,  247,  248,  248,  248,  249,  249,

			  249,  250,  250,  250,  251,  251,  251,  252,  252,  252,
			  253,  253,  253,  255,  255,  256,  256,  258,  258,  258,
			  259,  259,  259,  260,  260,  260,  261,  261,  261,  262,
			  262,  262,  263,  263,  263,  264,  264,  264,  265,  265,
			  265,  266,  266,  266,  267,  267,  268,  268,  269,  269,
			  269,  270,  270,  270,  271,  271,  271,  272,  272,  273,
			  273,  275,  275,  276,  276,  278,  278,  129,  273,  279,
			  279,  124,  276,  280,  280,  280,  281,  281,  281,  282,
			  282,  282,  283,  283,  284,  284,  285,  285,  286,  286,
			  287,  287,  288,  288,  289,  289,  114,  286,  290,  290, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  109,  288,  291,  291,  292,  292,  293,  293,  294,  294,
			  295,  295,  296,  296,  297,  297,  105,  294,  298,  298,
			  100,  296,  300,  300,  301,  301,  302,  302,  304,  304,
			  305,  305,  312,  301,  312,  302,  308,  308,  313,  313,
			  314,  313,   96,  314,   80,   75,   71,   69,   64,   60,
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
			  859,  859,  859,  859,  114,  107,  134,  859,  103,  837,
			  106,  109,  133,  146,  838,  859,  859,  859,    0,  149,
			  835,  152,  136,  154,  157,  836,  859,  859,  176,  200,
			  176,  833,  189,  192,  193,  197,  834,  859,  859,  207,
			    0,  859,  200,  831,  218,  221,  222,  225,  832,  859,
			  842,  233,  254,  230,  828,  233,  248,  249,  252,  829,
			  859,  838,  275,  265,  267,  825,  270,  274,  275,  278,
			  826,  859,  281,  284,  287,  290,  293,  296,  859,  299,
			  302,  305,  308,  311,  314,  859,  834,  327,  329,  321,

			  800,  326,  329,  330,  333,  798,  859,  859,  336,  780,
			  339,  342,  343,  346,  778,  859,  349,  352,  355,  358,
			  361,  364,  859,  367,  751,  370,  373,  374,  377,  749,
			  859,  380,  383,  386,  389,  392,  395,  859,  408,  859,
			  402,  670,  405,  408,  409,  419,  657,  596,  432,  434,
			  426,  427,  431,  434,  435,  438,  399,  441,  444,  447,
			  450,  453,  456,  334,  469,  471,  473,  465,  468,  471,
			  474,  477,  480,  483,  486,  489,  492,  495,  498,  267,
			  511,  513,  515,  507,  510,  513,  516,  519,  522,  525,
			  528,  531,  534,  537,  540,  543,  546,  549,  552,  555, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  558,  561,  564,  567,  570,  573,  576,  255,  589,  591,
			  583,  234,  588,  591,  592,  595,  203,  598,  601,  604,
			  607,  610,  613,    0,  626,  628,    0,  620,  623,  626,
			  629,  632,  635,  638,  641,  644,  859,  657,  659,  651,
			  654,  659,  859,  672,  674,  666,  669,  674,  677,  680,
			  683,  686,  689,  692,    0,  705,  707,    0,  699,  702,
			  705,  708,  711,  714,  717,  720,  723,  736,  738,  730,
			  733,  736,  749,  751,  859,  753,  755,  859,  757,  761,
			  755,  758,  761,  774,  776,  778,  780,  782,  784,  786,
			  790,  794,  796,  798,  800,  802,  804,  806,  810,    0,

			  814,  816,  818,    0,  820,  822,  180,  101,  828,    0,
			    0,  859,  830,  837,  839, yy_Dummy>>,
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
			    0,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			    1,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,    2,   29,   29,   29,   29,   29,
			    3,    4,    5,    4,   29,    6,   29,    7,    8,    8,
			    8,    8,    8,    8,    8,    8,    9,    9,   29,   29,
			   29,   29,   29,    4,    4,    9,    9,    9,    9,    9,
			    9,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   10,   29,   29,   11,   29,
			   29,   12,   13,   14,   15,   29,   29,    9,    9,    9,

			    9,    9,    9,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   10,   29,   29,
			   11,   29,   29,   16,    4,   17,   29,   29,   18,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,
			   18,   18,   18,   18,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   21,   21,   22,   22,   22,   22,   22,   22, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   22,   22,   22,   23,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   25,   24,   24,
			   26,   27,   27,   27,   28,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   29, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    4,    2,    4,    4,    4,    3,    3,
			    3,    3,    4,    4,    4,    4,    4,    4,    4,    4, yy_Dummy>>)
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

	yyNull_equiv_class: INTEGER = 29
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
