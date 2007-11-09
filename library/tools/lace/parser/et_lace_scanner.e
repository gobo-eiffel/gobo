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
if yy_act <= 30 then
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
if yy_act <= 23 then
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
if yy_act = 22 then
--|#line 68 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 68")
end
last_token := L_ROOT
else
--|#line 69 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 69")
end
last_token := L_SYSTEM
end
end
end
else
if yy_act <= 27 then
if yy_act <= 25 then
if yy_act = 24 then
--|#line 70 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 70")
end
last_token := L_VISIBLE
else
--|#line 75 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 75")
end

				last_token := L_IDENTIFIER
				last_et_identifier_value := new_identifier (text)
			
end
else
if yy_act = 26 then
--|#line 83 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 83")
end

				last_token := L_STRERR
			
else
--|#line 86 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 86")
end

				last_token := L_STRING
				last_et_identifier_value := new_identifier (text_substring (2, text_count - 1))
			
end
end
else
if yy_act <= 29 then
if yy_act = 28 then
--|#line 90 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 90")
end

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
else
--|#line 96 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 96")
end
eif_buffer.append_string (text)
end
else
--|#line 97 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 97")
end
eif_buffer.append_character ('%A')
end
end
end
end
else
if yy_act <= 45 then
if yy_act <= 38 then
if yy_act <= 34 then
if yy_act <= 32 then
if yy_act = 31 then
--|#line 98 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 98")
end
eif_buffer.append_character ('%B')
else
--|#line 99 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 99")
end
eif_buffer.append_character ('%C')
end
else
if yy_act = 33 then
--|#line 100 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 100")
end
eif_buffer.append_character ('%D')
else
--|#line 101 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 101")
end
eif_buffer.append_character ('%F')
end
end
else
if yy_act <= 36 then
if yy_act = 35 then
--|#line 102 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 102")
end
eif_buffer.append_character ('%H')
else
--|#line 103 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 103")
end
eif_buffer.append_character ('%L')
end
else
if yy_act = 37 then
--|#line 104 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 104")
end
eif_buffer.append_character ('%N')
else
--|#line 105 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 105")
end
eif_buffer.append_character ('%Q')
end
end
end
else
if yy_act <= 42 then
if yy_act <= 40 then
if yy_act = 39 then
--|#line 106 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 106")
end
eif_buffer.append_character ('%R')
else
--|#line 107 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 107")
end
eif_buffer.append_character ('%S')
end
else
if yy_act = 41 then
--|#line 108 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 108")
end
eif_buffer.append_character ('%T')
else
--|#line 109 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 109")
end
eif_buffer.append_character ('%U')
end
end
else
if yy_act <= 44 then
if yy_act = 43 then
--|#line 110 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 110")
end
eif_buffer.append_character ('%V')
else
--|#line 111 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 111")
end
eif_buffer.append_character ('%%')
end
else
--|#line 112 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 112")
end
eif_buffer.append_character ('%'')
end
end
end
else
if yy_act <= 52 then
if yy_act <= 49 then
if yy_act <= 47 then
if yy_act = 46 then
--|#line 113 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 113")
end
eif_buffer.append_character ('%"')
else
--|#line 114 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 114")
end
eif_buffer.append_character ('%(')
end
else
if yy_act = 48 then
--|#line 115 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 115")
end
eif_buffer.append_character ('%)')
else
--|#line 116 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 116")
end
eif_buffer.append_character ('%<')
end
end
else
if yy_act <= 51 then
if yy_act = 50 then
--|#line 117 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 117")
end
eif_buffer.append_character ('%>')
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
else
--|#line 131 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 131")
end
eif_lineno := eif_lineno + 1
end
end
else
if yy_act <= 56 then
if yy_act <= 54 then
if yy_act = 53 then
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
		
else
--|#line 149 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 149")
end
eif_buffer.append_character (text_item (2))
end
else
if yy_act = 55 then
--|#line 151 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 151")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 152 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 152")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
end
end
else
if yy_act <= 58 then
if yy_act = 57 then
--|#line 153 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 153")
end
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 163 "et_lace_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'et_lace_scanner.l' at line 163")
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
			   41,   48,   43,   81,   86,   82,   83,   84,   39,   37,
			   91,   44,   96,   56,   94,   40,   48,  149,   81,   41,
			   43,   83,   84,   38,   82,   91,  147,   39,   86,   94,
			   40,   54,   55,   56,   57,   58,   59,   60,   61,   54,

			   54,   62,   54,   54,   54,   63,   64,   65,   66,   67,
			   68,   54,   69,   54,   70,   54,   54,   71,   54,   72,
			   54,   54,   73,   74,   75,   76,   77,   78,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   85,   87,   89,   90,   95,   56,   99,
			  101,   97,  102,  103,  106,  108,  109,  145,  110,  113,
			   88,  144,   95,   89,   99,  101,   85,  120,   87,  106,
			   90,  109,  103,  110,  113,   88,  102,  115,  108,   96,
			   56,  112,   98,  116,  117,  118,  119,  124,  125,  126,
			  128,  120,  115,  129,  131,  132,  130,  133,  116,  117,

			  118,  119,  136,  137,  138,  139,  142,  140,  141,  128,
			  132,  124,  125,  126,  130,  133,  143,  129,  131,  146,
			  139,  136,  140,  138,  148,  135,   34,  137,   34,  134,
			  142,  143,  127,  123,  146,   28,   28,   28,   52,  122,
			   52,  121,  114,  148,   36,   36,   36,  111,  107,  105,
			  104,  100,   80,   98,   53,   93,   92,   80,   79,   33,
			   32,   53,   51,   50,   49,   47,   46,   45,   42,   36,
			   35,   33,   32,  150,    5,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,

			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150, yy_Dummy>>)
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
			   18,   24,   20,   38,   43,   39,   40,   41,   16,  153,
			   47,   20,   55,   55,   50,   16,   24,  143,   38,   18,
			   20,   40,   41,   16,   39,   47,  138,   16,   43,   50,
			   16,   31,   31,   31,   31,   31,   31,   31,   31,   31,

			   31,   31,   31,   31,   31,   31,   31,   31,   31,   31,
			   31,   31,   31,   31,   31,   31,   31,   31,   31,   31,
			   31,   31,   31,   31,   31,   31,   31,   31,   31,   31,
			   31,   31,   31,   31,   31,   31,   31,   31,   31,   31,
			   31,   31,   31,   42,   44,   45,   46,   51,   56,   81,
			   84,   56,   85,   87,   90,   92,   93,  136,   94,   99,
			   44,  132,   51,   45,   81,   84,   42,  106,   44,   90,
			   46,   93,   87,   94,   99,   44,   85,  101,   92,   96,
			   96,   98,   98,  102,  103,  104,  105,  111,  113,  114,
			  116,  106,  101,  117,  119,  120,  118,  121,  102,  103,

			  104,  105,  124,  125,  126,  127,  130,  128,  129,  116,
			  120,  111,  113,  114,  118,  121,  131,  117,  119,  137,
			  127,  124,  128,  126,  142,  123,  152,  125,  152,  122,
			  130,  131,  115,  110,  137,  151,  151,  151,  154,  108,
			  154,  107,  100,  142,  155,  155,  155,   95,   91,   89,
			   88,   83,   80,   62,   52,   49,   48,   36,   34,   33,
			   32,   28,   27,   26,   25,   23,   22,   21,   19,   13,
			    9,    8,    7,    5,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,

			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   50,   53,  273,  274,  270,  268,  266,
			  274,  274,  274,  259,  274,  274,   41,    0,   33,  247,
			   33,  246,  241,  234,   28,  234,  224,  237,  257,  274,
			  274,   90,  258,  256,  254,  274,  254,    0,   29,   38,
			   32,   31,  121,   44,  125,  116,  128,   35,  235,  225,
			   40,  113,  250,  274,  274,   70,  146,  274,  274,  274,
			  274,  274,  241,  274,  274,  274,  274,  274,  274,  274,
			  274,  274,  274,  274,  274,  274,  274,  274,  274,  274,
			  250,  114,    0,  230,  116,  135,    0,  126,  229,  228,
			  121,  223,  133,  121,  123,  222,  177,  274,  170,  126,

			  214,  142,  147,  148,  152,  153,  150,  211,  214,    0,
			  212,  169,  274,  171,  171,  211,  163,  173,  167,  177,
			  162,  168,  191,  197,  175,  184,  177,  172,  172,  187,
			  189,  181,  122,    0,    0,    0,  136,  184,   47,    0,
			    0,    0,  197,   56,    0,    0,    0,    0,    0,    0,
			  274,  234,  225,   66,  237,  243, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  150,    1,  151,  151,  150,  150,  150,  150,  152,
			  150,  150,  150,  150,  150,  150,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  154,  150,
			  150,  150,  150,  150,  152,  150,  155,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  154,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  150,  150,  150,  153,

			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  150,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			    0,  150,  150,  150,  150,  150, yy_Dummy>>)
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
			    0,    0,    0,    0,    0,   60,   58,    1,    2,   28,
			    8,    9,    7,   58,    6,    5,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   29,   55,
			   53,   55,    1,    2,   28,   26,    3,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   29,   53,   54,   54,   56,   46,   44,   45,
			   47,   48,   54,   49,   50,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   27,
			    4,   25,   11,   25,   25,   25,   15,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,    0,   52,   57,   25,

			   25,   25,   25,   25,   25,   25,   25,   25,   25,   22,
			   25,   25,   51,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   20,   21,   23,   25,   25,   25,   13,
			   14,   16,   25,   25,   19,   24,   10,   12,   17,   18,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 274
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 150
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 151
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

	yyNb_rules: INTEGER is 59
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 60
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
