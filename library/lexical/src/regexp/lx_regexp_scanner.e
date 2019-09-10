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
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_REGEXP_TOKENS
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

					if description.utf8_mode then
						last_token := UNICODE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				
when 4 then
--|#line 74 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 74")
end

					if description.utf8_mode then
						last_token := BYTE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				
when 5 then
--|#line 82 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 82")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 6 then
	yy_end := yy_end - 1
--|#line 86 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 86")
end
last_token := Dollar_code
when 7 then
--|#line 87 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 87")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 8 then
--|#line 91 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 91")
end

					last_token := CCL_PLUS
				
when 9 then
--|#line 94 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 94")
end

					last_token := CCL_MINUS
				
when 10 then
--|#line 97 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 97")
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
				
when 11 then
--|#line 108 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 108")
end
last_token := text_item (1).code
when 12 then
--|#line 109 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 109")
end

					last_token := CHAR
					process_single_character
				
when 13 then
--|#line 116 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 116")
end
-- Separator.
when 14 then
--|#line 117 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 117")
end

					if attached text as l_text and then l_text.is_integer then
						last_token := NUMBER
						last_integer_value := l_text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 15 then
--|#line 125 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 125")
end
last_token := Comma_code
when 16 then
--|#line 126 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 126")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 17 then
--|#line 130 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 130")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 18 then
--|#line 135 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 135")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 19 then
--|#line 144 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 144")
end

					last_token := CHAR
					process_single_character
				
when 20 then
--|#line 148 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 148")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 21 then
--|#line 152 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 152")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 22 then
--|#line 161 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 161")
end

					last_token := CHAR
					process_escaped_character
				
when 23 then
--|#line 165 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 165")
end

					last_token := CHAR
					process_octal_character
				
when 24 then
--|#line 169 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 169")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 25 then
--|#line 173 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 173")
end

					last_token := CHAR
					process_unicode_character
				
when 26 then
--|#line 180 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 180")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 27 then
--|#line 185 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 185")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 28 then
--|#line 190 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 190")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 29 then
--|#line 195 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 195")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 30 then
	yy_end := yy_end - 1
--|#line 200 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 200")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 31 then
	yy_end := yy_end - 1
--|#line 204 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 204")
end
last_token := Caret_code
when 32 then
--|#line 205 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 205")
end

					last_token := CHAR
					process_single_character
					set_start_condition (CCL)
				
when 33 then
--|#line 210 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 210")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 34 then
	yy_end := yy_end - 1
--|#line 219 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 219")
end
last_token := Minus_code
when 35 then
--|#line 220 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 220")
end

					last_token := CHAR
					process_single_character
				
when 36 then
--|#line 224 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 224")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 37 then
--|#line 228 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 228")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 38 then
--|#line 237 "lx_regexp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_regexp_scanner.l' at line 237")
end

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (character_text)
					end
				
when 39 then
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
			create an_array.make_filled (0, 0, 433)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   44,   15,   15,   57,   57,  107,  103,   24,   25,
			   24,   25,   28,   45,   45,   55,  105,   28,   58,   59,
			   16,   16,   18,   19,   26,   55,   26,  101,   29,   20,
			   30,   21,   21,   29,   47,   30,   51,   45,   45,   48,
			   49,   52,   53,   22,   18,   19,   62,   65,   63,   65,
			   47,   20,   47,   21,   21,   48,   49,   48,   49,   76,
			   77,   92,   78,   96,   93,   22,   32,   79,   80,   94,
			   95,   76,   77,   33,   76,   77,   91,  109,   76,   77,
			   76,   77,   34,   35,   32,   76,   77,   76,   77,   76,
			   77,   33,   76,   77,   76,   77,   76,   77,   76,   77,

			   34,   35,   15,   37,   38,   39,   40,   40,   76,   77,
			   67,   70,   67,   70,   72,   90,   72,   41,   42,   89,
			   87,   43,   15,   37,   38,   39,   40,   40,  102,  104,
			  106,  102,  104,  106,   86,   85,  108,   41,   42,  108,
			   84,   43,   97,   97,  117,   97,   97,  117,   91,  118,
			   76,   77,  118,   98,   99,   99,  119,   99,   99,  119,
			  120,  127,  107,  120,  127,  100,  110,  110,  128,  110,
			  110,  128,  129,  130,   86,  129,  130,  111,  112,  112,
			  136,  112,  112,  136,  137,  138,  103,  137,  138,  113,
			  114,  114,  139,  114,  114,  139,  144,  145,   91,  144, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  145,   60,  115,  115,  107,  115,  115,  116,  116,   86,
			  116,  116,  121,  121,  103,  121,  121,  122,  122,   91,
			  122,  122,  123,  123,  107,  123,  123,  124,  124,   86,
			  124,  124,  125,  125,  103,  125,  125,  126,  126,   91,
			  126,  126,  131,  131,  107,  131,  131,  132,  132,   86,
			  132,  132,  133,  133,  103,  133,  133,  134,  134,   91,
			  134,  134,  135,  135,  107,  135,  135,  140,  140,   86,
			  140,  140,  141,  141,  103,  141,  141,  142,  142,   91,
			  142,  142,  143,  143,  107,  143,  143,  148,  148,   86,
			  148,  148,  149,  149,  103,  149,  149,  150,  150,   88,

			  150,  150,  151,  151,   83,  151,  151,  152,  152,   82,
			  152,  152,  153,  153,   81,  153,  153,  154,  154,   75,
			  154,  154,  155,  155,   74,  155,  155,  156,  156,   73,
			  156,  156,  157,  157,   71,  157,  157,   14,   14,   14,
			   14,   14,   14,   17,   17,   17,   17,   17,   17,   23,
			   23,   23,   23,   23,   23,   27,   27,   27,   27,   27,
			   27,   31,   31,   31,   31,   31,   31,   36,   36,   36,
			   36,   36,   36,   46,   46,   46,   46,   46,   50,   50,
			   50,   50,   50,   54,   54,   54,   54,   54,   54,   56,
			   56,   69,   56,   56,   56,   60,   60,   60,   60,   60, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  146,  147,   68,  146,  147,   66,   64,   61,   44,  158,
			   13,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158, yy_Dummy>>,
			1, 34, 400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 433)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,   44,    1,    2,   38,   38,  191,  188,    5,    5,
			    6,    6,    7,   21,   21,   30,  185,    8,   39,   39,
			    1,    2,    3,    3,    5,   30,    6,  182,    7,    3,
			    7,    3,    3,    8,   26,    8,   29,   45,   45,   26,
			   26,   29,   29,    3,    4,    4,   43,  170,   43,  170,
			   34,    4,   42,    4,    4,   34,   34,   42,   42,   60,
			   60,  181,   61,   78,   76,    4,    9,   61,   61,   76,
			   76,   78,   78,    9,   96,   96,  180,   93,   99,   99,
			  109,  109,    9,    9,   10,   93,   93,  112,  112,  124,
			  124,   10,  131,  131,  154,  154,  155,  155,  156,  156,

			   10,   10,   11,   11,   11,   11,   11,   11,  157,  157,
			  171,  172,  171,  172,  173,  179,  173,   11,   11,  178,
			  177,   11,   12,   12,   12,   12,   12,   12,  183,  184,
			  186,  183,  184,  186,  176,  175,  187,   12,   12,  187,
			  174,   12,   79,   79,  189,   79,   79,  189,  147,  190,
			   79,   79,  190,   79,   80,   80,  192,   80,   80,  192,
			  193,  194,  146,  193,  194,   80,   94,   94,  195,   94,
			   94,  195,  196,  197,  145,  196,  197,   94,   95,   95,
			  198,   95,   95,  198,  199,  200,  144,  199,  200,   95,
			   97,   97,  201,   97,   97,  201,  202,  203,  139,  202, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  203,   97,   98,   98,  138,   98,   98,  100,  100,  137,
			  100,  100,  110,  110,  136,  110,  110,  111,  111,  130,
			  111,  111,  113,  113,  129,  113,  113,  114,  114,  128,
			  114,  114,  115,  115,  127,  115,  115,  116,  116,  120,
			  116,  116,  121,  121,  119,  121,  121,  122,  122,  118,
			  122,  122,  123,  123,  117,  123,  123,  125,  125,  108,
			  125,  125,  126,  126,  106,  126,  126,  132,  132,  104,
			  132,  132,  133,  133,  102,  133,  133,  134,  134,   92,
			  134,  134,  135,  135,   90,  135,  135,  140,  140,   87,
			  140,  140,  141,  141,   85,  141,  141,  142,  142,   69,

			  142,  142,  143,  143,   64,  143,  143,  148,  148,   63,
			  148,  148,  149,  149,   62,  149,  149,  150,  150,   59,
			  150,  150,  151,  151,   58,  151,  151,  152,  152,   53,
			  152,  152,  153,  153,   52,  153,  153,  159,  159,  159,
			  159,  159,  159,  160,  160,  160,  160,  160,  160,  161,
			  161,  161,  161,  161,  161,  162,  162,  162,  162,  162,
			  162,  163,  163,  163,  163,  163,  163,  164,  164,  164,
			  164,  164,  164,  165,  165,  165,  165,  165,  166,  166,
			  166,  166,  166,  167,  167,  167,  167,  167,  167,  168,
			  168,   51,  168,  168,  168,  169,  169,  169,  169,  169, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  204,  205,   49,  204,  205,   48,   47,   41,   18,   13,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158, yy_Dummy>>,
			1, 34, 400)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 205)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    1,   21,   43,    6,    8,   10,   15,   64,
			   82,  100,  120,  409,  410,  410,  410,  410,  407,  410,
			  410,    3,  410,  410,  410,  410,   24,  410,  410,   26,
			    6,  410,  410,    0,   40,  410,  410,  410,    3,    4,
			  410,  389,   42,   39,    0,   27,  410,  396,  384,  381,
			  410,  381,  313,  308,  410,  410,  410,  410,  312,  307,
			   41,   52,  292,  287,  294,    0,    0,    0,    0,  289,
			    0,    0,    0,    0,  410,  410,   54,  410,   53,  132,
			  144,  410,  410,  410,    0,  272,  410,  267,  410,    0,
			  262,  410,  257,   67,  156,  168,   56,  180,  192,   60,

			  197,    0,  252,  410,  247,    0,  242,  410,  237,   62,
			  202,  207,   69,  212,  217,  222,  227,  232,  227,  222,
			  217,  232,  237,  242,   71,  247,  252,  212,  207,  202,
			  197,   74,  257,  262,  267,  272,  192,  187,  182,  176,
			  277,  282,  287,  292,  164,  152,  140,  126,  297,  302,
			  307,  312,  317,  322,   76,   78,   80,   90,  410,  336,
			  342,  348,  354,  360,  366,  371,  376,  382,  388,  393,
			   45,  108,  109,  112,  138,  133,  132,  118,  117,  113,
			   74,   59,   25,  126,  127,   14,  128,  134,    5,  142,
			  147,    4,  154,  158,  159,  166,  170,  171,  178,  182, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  183,  190,  194,  195,  398,  399, yy_Dummy>>,
			1, 6, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 205)
			yy_def_template_1 (an_array)
			an_array.area.fill_with (158, 200, 205)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  159,  159,  160,  160,  161,  161,  162,  162,  163,
			  163,  164,  164,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  165,  158,  158,  166,
			  167,  158,  158,  168,  165,  158,  158,  158,  158,  158,
			  158,  169,  165,  158,  158,  158,  158,  158,  170,  171,
			  158,  158,  172,  173,  158,  158,  158,  158,  158,  158,
			  169,  169,  158,  158,  158,  174,  175,  176,  177,  158,
			  178,  179,  180,  181,  158,  158,  169,  158,  169,  169,
			   79,  158,  158,  158,  182,  183,  158,  184,  158,  185,
			  186,  158,  187,  169,   80,   94,  169,   95,   97,  169,

			   97,  188,  189,  158,  190,  191,  192,  158,  193,  169,
			   97,   97,  169,   97,   97,   97,   97,  194,  195,  196,
			  197,   97,   97,   97,  169,   97,   97,  198,  199,  200,
			  201,  169,   97,   97,   97,   97,  202,  203,  204,  205,
			   97,   97,   97,   97,  158,  158,  158,  158,   97,   97,
			   97,   97,   97,   97,  169,  169,  169,  169,    0,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158,
			  158,  158,  158,  158,  158,  158,  158,  158,  158,  158, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (23, 200, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   23,   23,   23,   23,   23,   23,   23,   23,    1,
			    2,   23,   23,    1,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,    1,   23,    3,   23,    4,   23,   23,   23,
			    5,    6,    6,    7,    8,    9,    6,    6,   10,   10,
			   10,   10,   10,   10,   10,   10,   11,   11,   12,   23,
			   23,   23,   23,    6,   23,   13,   14,   13,   13,   13,
			   13,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   15,   23,   23,   16,   23,
			   23,   17,   18,   19,   20,   23,   23,   13,   14,   13,

			   13,   13,   13,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   15,   23,   23,
			   16,   23,   23,   21,    6,   22,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   23, yy_Dummy>>,
			1, 200, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    6,    1,    6,    6,    6,    6,    6,    6,    6,
			    2,    2,    6,    2,    2,    6,    6,    6,    6,    3,
			    6,    4,    5,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   40,    2,   38,    1,   17,   13,   18,
			   15,   14,   16,   19,   21,   20,   19,   32,   33,   32,
			   32,   35,   37,   35,   35,   36,   12,    5,   12,   11,
			   11,   12,   12,    7,   13,   14,   22,   22,   22,   22,
			   26,   26,   26,   26,   30,   31,   34,    6,    0,    0,
			    0,    0,    0,    0,   23,   25,    0,   24,    0,   27,
			   29,    0,   28,    0,    4,    3,    0,   10,    0,    0,
			    0,    8,    9,   23,   25,    0,   24,    0,   27,   29,
			    0,   28,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,   25,    0,   25,    0,   29,    0,   29,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 410
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 158
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 159
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 23
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

	yyNb_rules: INTEGER = 39
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 40
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

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32
			
	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
