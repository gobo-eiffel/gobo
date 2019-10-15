note

	description:

		"Scanners for Lace parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_SCANNER

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ET_LACE_SCANNER_SKELETON

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
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
--|#line 36 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 36")
end
-- Ignore separators
when 2 then
--|#line 37 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 37")
end
eif_lineno := eif_lineno + text_count
when 3 then
--|#line 42 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 42")
end
-- Ignore comments
when 4 then
--|#line 43 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 43")
end
eif_lineno := eif_lineno + 1
when 5 then
--|#line 48 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 48")
end
last_token := Semicolon_code
when 6 then
--|#line 49 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 49")
end
last_token := Colon_code
when 7 then
--|#line 50 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 50")
end
last_token := Comma_code
when 8 then
--|#line 51 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 51")
end
last_token := Left_parenthesis_code
when 9 then
--|#line 52 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 52")
end
last_token := Right_parenthesis_code
when 10 then
--|#line 57 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 57")
end
last_token := L_ABSTRACT
when 11 then
--|#line 58 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 58")
end

										last_token := L_ALL
										last_et_identifier_value := new_identifier (text)
									
when 12 then
--|#line 62 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 62")
end
last_token := L_ASSEMBLY
when 13 then
--|#line 63 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 63")
end
last_token := L_CLUSTER
when 14 then
--|#line 64 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 64")
end
last_token := L_DEFAULT
when 15 then
--|#line 65 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 65")
end
last_token := L_END
when 16 then
--|#line 66 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 66")
end
last_token := L_EXCLUDE
when 17 then
--|#line 67 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 67")
end
last_token := L_EXTERNAL
when 18 then
--|#line 68 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 68")
end
last_token := L_GENERATE
when 19 then
--|#line 69 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 69")
end
last_token := L_LIBRARY
when 20 then
--|#line 70 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 70")
end
last_token := L_OPTION
when 21 then
--|#line 71 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 71")
end
last_token := L_PREFIX
when 22 then
--|#line 72 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 72")
end
last_token := L_ROOT
when 23 then
--|#line 73 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 73")
end
last_token := L_SYSTEM
when 24 then
--|#line 74 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 74")
end
last_token := L_VISIBLE
when 25 then
--|#line 79 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 79")
end

				last_token := L_IDENTIFIER
				last_et_identifier_value := new_identifier (text)
			
when 26 then
--|#line 87 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 87")
end

				last_token := L_STRERR
			
when 27 then
--|#line 90 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 90")
end

				last_token := L_STRING
				last_et_identifier_value := new_identifier (text_substring (2, text_count - 1))
			
when 28 then
--|#line 94 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 94")
end

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 29 then
--|#line 100 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 100")
end
eif_buffer.append_string (text)
when 30 then
--|#line 101 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 101")
end
eif_buffer.append_character ('%A')
when 31 then
--|#line 102 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 102")
end
eif_buffer.append_character ('%B')
when 32 then
--|#line 103 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 103")
end
eif_buffer.append_character ('%C')
when 33 then
--|#line 104 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 104")
end
eif_buffer.append_character ('%D')
when 34 then
--|#line 105 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 105")
end
eif_buffer.append_character ('%F')
when 35 then
--|#line 106 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 106")
end
eif_buffer.append_character ('%H')
when 36 then
--|#line 107 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 107")
end
eif_buffer.append_character ('%L')
when 37 then
--|#line 108 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 108")
end
eif_buffer.append_character ('%N')
when 38 then
--|#line 109 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 109")
end
eif_buffer.append_character ('%Q')
when 39 then
--|#line 110 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 110")
end
eif_buffer.append_character ('%R')
when 40 then
--|#line 111 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 111")
end
eif_buffer.append_character ('%S')
when 41 then
--|#line 112 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 112")
end
eif_buffer.append_character ('%T')
when 42 then
--|#line 113 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 113")
end
eif_buffer.append_character ('%U')
when 43 then
--|#line 114 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 114")
end
eif_buffer.append_character ('%V')
when 44 then
--|#line 115 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 115")
end
eif_buffer.append_character ('%%')
when 45 then
--|#line 116 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 116")
end
eif_buffer.append_character ('%'')
when 46 then
--|#line 117 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 117")
end
eif_buffer.append_character ('%"')
when 47 then
--|#line 118 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 118")
end
eif_buffer.append_character ('%(')
when 48 then
--|#line 119 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 119")
end
eif_buffer.append_character ('%)')
when 49 then
--|#line 120 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 120")
end
eif_buffer.append_character ('%<')
when 50 then
--|#line 121 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 121")
end
eif_buffer.append_character ('%>')
when 51 then
--|#line 122 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 122")
end

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := L_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
when 52 then
--|#line 135 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 135")
end
eif_lineno := eif_lineno + 1
when 53 then
--|#line 136 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 136")
end

			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			if eif_buffer.count > 0 then
				last_token := L_STRING
				last_et_identifier_value := new_identifier_from_buffer (eif_buffer)
				STRING_.wipe_out (eif_buffer)
			else
				last_token := L_STRERR
			end
			set_start_condition (INITIAL)
		
when 54, 55, 56 then
--|#line 150 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 150")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
when 57 then
--|#line 162 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 162")
end
last_token := text_item (1).code
when 58 then
--|#line 0 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 0")
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
			inspect yy_sc
when 0 then
--|#line 161 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 161")
end
terminate
when 1 then
--|#line 153 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 153")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 296)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			an_array.area.fill_with (148, 245, 296)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,    7,    8,    9,    6,    6,   10,   11,   12,   13,
			    6,    6,   14,   15,    6,    6,   16,   17,   18,   19,
			   20,   17,   21,   17,   17,   17,   22,   17,   17,   23,
			   24,   17,   25,   26,   17,   17,   27,   17,   17,    6,
			   16,   17,   18,   19,   17,   22,   17,   25,   26,   17,
			   17,   27,    6,   29,   30,   31,   29,   30,   31,   38,
			   41,   48,   43,   80,   85,   81,   82,   83,   39,   54,
			   55,   44,  110,   96,   89,   40,   48,  100,   80,   41,
			   43,   82,   83,   38,   81,   88,   86,   39,   85,   84,
			   40,   54,   55,   56,   57,   58,   59,   60,   89,   90,

			   61,  100,   87,   88,   62,   63,   64,   65,   66,   67,
			   86,   68,   84,   69,   90,   93,   70,   87,   71,   94,
			   97,   72,   73,   74,   75,   76,   77,   99,   55,  101,
			   93,   95,  104,  106,   94,   97,  107,  108,  111,  113,
			  114,  118,   99,  115,  116,  117,  122,  104,  101,  123,
			  124,  107,  108,  111,  113,  114,  106,  126,  115,  116,
			  117,  127,  128,  129,  130,  118,  131,  134,  135,  136,
			  122,  140,  146,  123,  124,  137,  126,   37,  138,  130,
			  128,  141,  144,  147,  131,  127,  134,  129,  136,  145,
			  137,  146,  135,  138,  143,  140,  141,  144,   28,   28, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   28,   34,   34,   52,   52,   36,   36,   36,  142,  139,
			  133,  132,  125,  121,  120,  119,  112,  109,  105,  103,
			  102,   98,   79,   96,   53,   92,   91,   79,   78,   33,
			   32,   53,   51,   50,   49,   47,   46,   45,   42,   36,
			   35,   33,   32,  148,    5, yy_Dummy>>,
			1, 45, 200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 296)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 52)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (148, 244, 296)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    3,    3,    4,    4,    4,   16,   18,   24,   20,
			   38,   43,   39,   40,   41,   16,   54,   54,   20,   96,
			   96,   46,   16,   24,   84,   38,   18,   20,   40,   41,
			   16,   39,   45,   44,   16,   43,   42,   16,   31,   31,
			   31,   31,   31,   31,   31,   46,   47,   31,   84,   44,
			   45,   31,   31,   31,   31,   31,   31,   44,   31,   42,
			   31,   47,   50,   31,   44,   31,   51,   80,   31,   31,
			   31,   31,   31,   31,   83,   55,   86,   50,   55,   89,
			   91,   51,   80,   92,   93,   97,   99,  100,  104,   83,
			  101,  102,  103,  109,   89,   86,  111,  112,   92,   93,

			   97,   99,  100,   91,  114,  101,  102,  103,  115,  116,
			  117,  118,  104,  119,  122,  123,  124,  109,  128,  140,
			  111,  112,  125,  114,  151,  126,  118,  116,  129,  135,
			  141,  119,  115,  122,  117,  124,  136,  125,  140,  123,
			  126,  134,  128,  129,  135,  149,  149,  149,  150,  150,
			  152,  152,  153,  153,  153,  130,  127,  121,  120,  113,
			  108,  106,  105,   98,   94,   90,   88,   87,   82,   79,
			   61,   52,   49,   48,   36,   34,   33,   32,   28,   27,
			   26,   25,   23,   22,   21,   19,   13,    9,    8,    7,
			    5, yy_Dummy>>,
			1, 191, 53)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   51,   54,  243,  244,  241,  239,  237,
			  244,  244,  244,  230,  244,  244,   42,    0,   34,  218,
			   34,  217,  212,  205,   29,  205,  195,  208,  228,  244,
			  244,   90,  229,  227,  225,  244,  225,    0,   30,   39,
			   33,   32,   68,   45,   68,   57,   57,   65,  206,  196,
			   82,   86,  221,  244,   68,  127,  244,  244,  244,  244,
			  244,  212,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  221,
			   86,    0,  201,   94,   61,    0,  103,  200,  199,  100,
			  194,  112,  102,  103,  193,  244,   62,  106,  189,  105,

			  105,  108,  112,  113,  125,  186,  190,    0,  193,  129,
			  244,  133,  133,  192,  131,  142,  134,  147,  132,  138,
			  174,  183,  141,  150,  143,  143,  144,  189,  155,  147,
			  170,    0,    0,    0,  174,  148,  151,    0,    0,    0,
			  146,  163,    0,    0,    0,    0,    0,    0,  244,  197,
			  199,  175,  201,  204, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  148,    1,  149,  149,  148,  148,  148,  148,  150,
			  148,  148,  148,  148,  148,  148,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  152,  148,
			  148,  148,  148,  148,  150,  148,  153,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  152,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  148,  148,  151,  151,  151,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  148,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,    0,  148,
			  148,  148,  148,  148, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (52, 123, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   52,   52,   52,   52,   52,   52,   52,   52,    1,
			    2,   52,   52,    1,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,    1,   52,    3,   52,   52,    4,   52,    5,
			    6,    7,   52,   52,    8,    9,   52,   10,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   12,   13,
			   14,   52,   15,   52,   52,   16,   17,   18,   19,   20,
			   21,   22,   23,   24,   25,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   25,   37,   38,
			   25,   52,   52,   52,   52,   39,   52,   40,   41,   42,

			   43,   20,   44,   22,   25,   24,   25,   25,   45,   27,
			   46,   29,   30,   25,   47,   48,   49,   50,   51,   25,
			   37,   38,   25, yy_Dummy>>,
			1, 123, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    3,    1,    3,    1,    3,    3,    3,    3,    3,
			    3,    2,    3,    3,    3,    3,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   59,   57,    1,    2,   28,
			    8,    9,    7,   57,    6,    5,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   29,   54,
			   53,   54,    1,    2,   28,   26,    3,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   29,   53,    0,   55,   46,   44,   45,   47,
			   48,   56,   49,   50,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   41,   42,   43,   27,    4,
			   25,   11,   25,   25,   25,   15,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   52,   56,   25,   25,   25,

			   25,   25,   25,   25,   25,   25,   25,   22,   25,   25,
			   51,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   20,   21,   23,   25,   25,   25,   13,   14,   16,
			   25,   25,   19,   24,   10,   12,   17,   18,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 244
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 148
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 149
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 52
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

	yyNb_rules: INTEGER = 58
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 59
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
			-- Start condition codes

feature -- User-defined features



end
