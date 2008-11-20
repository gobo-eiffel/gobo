indexing

	description:

		"Scanners for Lace parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_LACE_SCANNER

inherit

	ET_LACE_SCANNER_SKELETON

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= IN_STR)
		end

feature {NONE} -- Implementation

	yy_build_tables is
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

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 29 then
if yy_act <= 15 then
if yy_act <= 8 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 32 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 32")
end
-- Ignore separators
else
--|#line 33 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 33")
end
eif_lineno := eif_lineno + text_count
end
else
if yy_act = 3 then
--|#line 38 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 38")
end
-- Ignore comments
else
--|#line 39 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 39")
end
eif_lineno := eif_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 44 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 44")
end
last_token := Semicolon_code
else
--|#line 45 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 45")
end
last_token := Colon_code
end
else
if yy_act = 7 then
--|#line 46 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 46")
end
last_token := Comma_code
else
--|#line 47 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 47")
end
last_token := Left_parenthesis_code
end
end
end
else
if yy_act <= 12 then
if yy_act <= 10 then
if yy_act = 9 then
--|#line 48 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 48")
end
last_token := Right_parenthesis_code
else
--|#line 53 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 53")
end
last_token := L_ABSTRACT
end
else
if yy_act = 11 then
--|#line 54 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 54")
end

										last_token := L_ALL
										last_et_identifier_value := new_identifier (text)
									
else
--|#line 58 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 58")
end
last_token := L_ASSEMBLY
end
end
else
if yy_act <= 14 then
if yy_act = 13 then
--|#line 59 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 59")
end
last_token := L_CLUSTER
else
--|#line 60 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 60")
end
last_token := L_DEFAULT
end
else
--|#line 61 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 61")
end
last_token := L_END
end
end
end
else
if yy_act <= 22 then
if yy_act <= 19 then
if yy_act <= 17 then
if yy_act = 16 then
--|#line 62 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 62")
end
last_token := L_EXCLUDE
else
--|#line 63 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 63")
end
last_token := L_EXTERNAL
end
else
if yy_act = 18 then
--|#line 64 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 64")
end
last_token := L_GENERATE
else
--|#line 65 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 65")
end
last_token := L_LIBRARY
end
end
else
if yy_act <= 21 then
if yy_act = 20 then
--|#line 66 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 66")
end
last_token := L_OPTION
else
--|#line 67 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 67")
end
last_token := L_PREFIX
end
else
--|#line 68 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 68")
end
last_token := L_ROOT
end
end
else
if yy_act <= 26 then
if yy_act <= 24 then
if yy_act = 23 then
--|#line 69 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 69")
end
last_token := L_SYSTEM
else
--|#line 70 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 70")
end
last_token := L_VISIBLE
end
else
if yy_act = 25 then
--|#line 75 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 75")
end

				last_token := L_IDENTIFIER
				last_et_identifier_value := new_identifier (text)
			
else
--|#line 83 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 83")
end

				last_token := L_STRERR
			
end
end
else
if yy_act <= 28 then
if yy_act = 27 then
--|#line 86 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 86")
end

				last_token := L_STRING
				last_et_identifier_value := new_identifier (text_substring (2, text_count - 1))
			
else
--|#line 90 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 90")
end

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
else
--|#line 96 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 96")
end
eif_buffer.append_string (text)
end
end
end
end
else
if yy_act <= 44 then
if yy_act <= 37 then
if yy_act <= 33 then
if yy_act <= 31 then
if yy_act = 30 then
--|#line 97 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 97")
end
eif_buffer.append_character ('%A')
else
--|#line 98 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 98")
end
eif_buffer.append_character ('%B')
end
else
if yy_act = 32 then
--|#line 99 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 99")
end
eif_buffer.append_character ('%C')
else
--|#line 100 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 100")
end
eif_buffer.append_character ('%D')
end
end
else
if yy_act <= 35 then
if yy_act = 34 then
--|#line 101 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 101")
end
eif_buffer.append_character ('%F')
else
--|#line 102 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 102")
end
eif_buffer.append_character ('%H')
end
else
if yy_act = 36 then
--|#line 103 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 103")
end
eif_buffer.append_character ('%L')
else
--|#line 104 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 104")
end
eif_buffer.append_character ('%N')
end
end
end
else
if yy_act <= 41 then
if yy_act <= 39 then
if yy_act = 38 then
--|#line 105 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 105")
end
eif_buffer.append_character ('%Q')
else
--|#line 106 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 106")
end
eif_buffer.append_character ('%R')
end
else
if yy_act = 40 then
--|#line 107 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 107")
end
eif_buffer.append_character ('%S')
else
--|#line 108 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 108")
end
eif_buffer.append_character ('%T')
end
end
else
if yy_act <= 43 then
if yy_act = 42 then
--|#line 109 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 109")
end
eif_buffer.append_character ('%U')
else
--|#line 110 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 110")
end
eif_buffer.append_character ('%V')
end
else
--|#line 111 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 111")
end
eif_buffer.append_character ('%%')
end
end
end
else
if yy_act <= 51 then
if yy_act <= 48 then
if yy_act <= 46 then
if yy_act = 45 then
--|#line 112 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 112")
end
eif_buffer.append_character ('%'')
else
--|#line 113 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 113")
end
eif_buffer.append_character ('%"')
end
else
if yy_act = 47 then
--|#line 114 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 114")
end
eif_buffer.append_character ('%(')
else
--|#line 115 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 115")
end
eif_buffer.append_character ('%)')
end
end
else
if yy_act <= 50 then
if yy_act = 49 then
--|#line 116 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 116")
end
eif_buffer.append_character ('%<')
else
--|#line 117 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 117")
end
eif_buffer.append_character ('%>')
end
else
--|#line 118 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 118")
end

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := L_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
end
end
else
if yy_act <= 55 then
if yy_act <= 53 then
if yy_act = 52 then
--|#line 131 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 131")
end
eif_lineno := eif_lineno + 1
else
--|#line 132 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 132")
end

			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			if eif_buffer.count > 0 then
				last_token := L_STRING
				create str_.make (eif_buffer.count)
				str_.append_string (eif_buffer)
				STRING_.wipe_out (eif_buffer)
				last_et_identifier_value := new_identifier (str_)
			else
				last_token := L_STRERR
			end
			set_start_condition (INITIAL)
		
end
else
if yy_act = 54 then
--|#line 148 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 148")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 149 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 149")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
end
end
else
if yy_act <= 57 then
if yy_act = 56 then
--|#line 150 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 150")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 160 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 160")
end
last_token := text_item (1).code
end
else
--|#line 0 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 0")
end
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
when 0 then
--|#line 0 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 0")
end
terminate
when 1 then
--|#line 0 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 0")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    6,    7,    8,    9,    6,    6,   10,   11,   12,
			   13,    6,    6,   14,   15,    6,    6,   16,   17,   18,
			   19,   20,   17,   21,   17,   17,   17,   22,   17,   17,
			   23,   24,   17,   25,   26,   17,   17,   27,   17,   17,
			    6,   16,   17,   18,   19,   17,   22,   17,   25,   26,
			   17,   17,   27,   29,   30,   31,   29,   30,   31,   38,
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
			  137,  146,  135,  138,  143,  140,  141,  144,   28,   28,

			   28,   34,   52,   34,   52,   36,   36,   36,  142,  139,
			  133,  132,  125,  121,  120,  119,  112,  109,  105,  103,
			  102,   98,   79,   96,   53,   92,   91,   79,   78,   33,
			   32,   53,   51,   50,   49,   47,   46,   45,   42,   36,
			   35,   33,   32,  148,    5,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    3,    3,    3,    4,    4,    4,   16,
			   18,   24,   20,   38,   43,   39,   40,   41,   16,   54,
			   54,   20,   96,   96,   46,   16,   24,   84,   38,   18,
			   20,   40,   41,   16,   39,   45,   44,   16,   43,   42,
			   16,   31,   31,   31,   31,   31,   31,   31,   46,   47,

			   31,   84,   44,   45,   31,   31,   31,   31,   31,   31,
			   44,   31,   42,   31,   47,   50,   31,   44,   31,   51,
			   80,   31,   31,   31,   31,   31,   31,   83,   55,   86,
			   50,   55,   89,   91,   51,   80,   92,   93,   97,   99,
			  100,  104,   83,  101,  102,  103,  109,   89,   86,  111,
			  112,   92,   93,   97,   99,  100,   91,  114,  101,  102,
			  103,  115,  116,  117,  118,  104,  119,  122,  123,  124,
			  109,  128,  140,  111,  112,  125,  114,  151,  126,  118,
			  116,  129,  135,  141,  119,  115,  122,  117,  124,  136,
			  125,  140,  123,  126,  134,  128,  129,  135,  149,  149,

			  149,  150,  152,  150,  152,  153,  153,  153,  130,  127,
			  121,  120,  113,  108,  106,  105,   98,   94,   90,   88,
			   87,   82,   79,   61,   52,   49,   48,   36,   34,   33,
			   32,   28,   27,   26,   25,   23,   22,   21,   19,   13,
			    9,    8,    7,    5,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   50,   53,  243,  244,  240,  238,  236,
			  244,  244,  244,  229,  244,  244,   41,    0,   33,  217,
			   33,  216,  211,  204,   28,  204,  194,  207,  227,  244,
			  244,   89,  228,  226,  224,  244,  224,    0,   29,   38,
			   32,   31,   67,   44,   67,   56,   56,   64,  205,  195,
			   81,   85,  220,  244,   67,  126,  244,  244,  244,  244,
			  244,  211,  244,  244,  244,  244,  244,  244,  244,  244,
			  244,  244,  244,  244,  244,  244,  244,  244,  244,  220,
			   85,    0,  200,   93,   60,    0,  102,  199,  198,   99,
			  193,  111,  101,  102,  192,  244,   61,  105,  188,  104,

			  104,  107,  111,  112,  124,  185,  189,    0,  192,  128,
			  244,  132,  132,  191,  130,  141,  133,  146,  131,  137,
			  173,  182,  140,  149,  142,  142,  143,  188,  154,  146,
			  169,    0,    0,    0,  173,  147,  150,    0,    0,    0,
			  145,  162,    0,    0,    0,    0,    0,    0,  244,  197,
			  200,  174,  201,  204, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
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

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    1,    1,    5,    1,    6,
			    7,    8,    1,    1,    9,   10,    1,   11,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   13,   14,
			   15,    1,   16,    1,    1,   17,   18,   19,   20,   21,
			   22,   23,   24,   25,   26,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   26,   38,   39,
			   26,    1,    1,    1,    1,   40,    1,   41,   42,   43,

			   44,   21,   45,   23,   26,   25,   26,   26,   46,   28,
			   47,   30,   31,   26,   48,   49,   50,   51,   52,   26,
			   38,   39,   26,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    2,    1,    1,    1,    1,
			    1,    1,    3,    1,    1,    1,    1,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
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

	yyJam_base: INTEGER is 244
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 148
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 149
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

	yyNb_rules: INTEGER is 58
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 59
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



end
