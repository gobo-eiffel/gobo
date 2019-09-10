note

	description:

		"Scanners for test config parsers"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TS_CONFIG_SCANNER

inherit

	TS_CONFIG_SCANNER_SKELETON
		redefine
			make
		end

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
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 35 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 35")
end
-- Ignore separators
when 2 then
yy_set_line (0)
--|#line 36 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 36")
end
-- Ignore new-lines
when 3 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 41 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 41")
end
-- Ignore comments
when 4 then
yy_set_column (1)
--|#line 42 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 42")
end
-- Ignire comments
when 5 then
	yy_column := yy_column + 1
--|#line 47 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 47")
end
last_token := Colon_code
when 6 then
	yy_column := yy_column + 1
--|#line 48 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 48")
end
last_token := Left_parenthesis_code
when 7 then
	yy_column := yy_column + 1
--|#line 49 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 49")
end
last_token := Right_parenthesis_code
when 8 then
	yy_column := yy_column + 5
--|#line 54 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 54")
end
last_token := T_CLASS
when 9 then
	yy_column := yy_column + 7
--|#line 55 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 55")
end
last_token := T_CLUSTER
when 10 then
	yy_column := yy_column + 7
--|#line 56 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 56")
end
last_token := T_COMPILE
when 11 then
	yy_column := yy_column + 7
--|#line 57 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 57")
end
last_token := T_DEFAULT
when 12 then
	yy_column := yy_column + 3
--|#line 58 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 58")
end
last_token := T_END
when 13 then
	yy_column := yy_column + 7
--|#line 59 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 59")
end
last_token := T_EXECUTE
when 14 then
	yy_column := yy_column + 7
--|#line 60 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 60")
end
last_token := T_FEATURE
when 15 then
	yy_column := yy_column + 6
--|#line 61 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 61")
end
last_token := T_PREFIX
when 16 then
	yy_column := yy_column + 4
--|#line 62 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 62")
end
last_token := T_TEST
when 17 then
	yy_column := yy_column + 7
--|#line 63 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 63")
end
last_token := T_TESTGEN
when 18 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 68 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 68")
end

				last_token := T_IDENTIFIER
				last_et_identifier_value := new_identifier (text)
			
when 19 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 76 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 76")
end

				last_token := T_STRING
				last_et_identifier_value := new_identifier (text_substring (2, text_count - 1))
			
when 20 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 80 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 80")
end

				if text_count > 1 then
					buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
when 21 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 86 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 86")
end
buffer.append_string (text)
when 22 then
	yy_column := yy_column + 2
--|#line 87 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 87")
end
buffer.append_character ('%A')
when 23 then
	yy_column := yy_column + 2
--|#line 88 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 88")
end
buffer.append_character ('%B')
when 24 then
	yy_column := yy_column + 2
--|#line 89 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 89")
end
buffer.append_character ('%C')
when 25 then
	yy_column := yy_column + 2
--|#line 90 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 90")
end
buffer.append_character ('%D')
when 26 then
	yy_column := yy_column + 2
--|#line 91 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 91")
end
buffer.append_character ('%F')
when 27 then
	yy_column := yy_column + 2
--|#line 92 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 92")
end
buffer.append_character ('%H')
when 28 then
	yy_column := yy_column + 2
--|#line 93 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 93")
end
buffer.append_character ('%L')
when 29 then
	yy_column := yy_column + 2
--|#line 94 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 94")
end
buffer.append_character ('%N')
when 30 then
	yy_column := yy_column + 2
--|#line 95 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 95")
end
buffer.append_character ('%Q')
when 31 then
	yy_column := yy_column + 2
--|#line 96 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 96")
end
buffer.append_character ('%R')
when 32 then
	yy_column := yy_column + 2
--|#line 97 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 97")
end
buffer.append_character ('%S')
when 33 then
	yy_column := yy_column + 2
--|#line 98 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 98")
end
buffer.append_character ('%T')
when 34 then
	yy_column := yy_column + 2
--|#line 99 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 99")
end
buffer.append_character ('%U')
when 35 then
	yy_column := yy_column + 2
--|#line 100 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 100")
end
buffer.append_character ('%V')
when 36 then
	yy_column := yy_column + 2
--|#line 101 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 101")
end
buffer.append_character ('%%')
when 37 then
	yy_column := yy_column + 2
--|#line 102 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 102")
end
buffer.append_character ('%'')
when 38 then
	yy_column := yy_column + 2
--|#line 103 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 103")
end
buffer.append_character ('%"')
when 39 then
	yy_column := yy_column + 2
--|#line 104 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 104")
end
buffer.append_character ('%(')
when 40 then
	yy_column := yy_column + 2
--|#line 105 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 105")
end
buffer.append_character ('%)')
when 41 then
	yy_column := yy_column + 2
--|#line 106 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 106")
end
buffer.append_character ('%<')
when 42 then
	yy_column := yy_column + 2
--|#line 107 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 107")
end
buffer.append_character ('%>')
when 43 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 108 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 108")
end

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := T_STRERR
				set_start_condition (INITIAL)
			else
				buffer.append_character (INTEGER_.to_character (code_))
			end
		
when 44 then
yy_set_column (1)
--|#line 121 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 121")
end
-- Ignore new-line
when 45 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 122 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 122")
end

			last_token := T_STRING
			if text_count > 1 then
				buffer.append_string (text_substring (1, text_count - 1))
			end
			create str_.make (buffer.count)
			str_.append_string (buffer)
			buffer.wipe_out
			last_et_identifier_value := new_identifier (str_)
			set_start_condition (INITIAL)
		
when 46 then
	yy_column := yy_column + 2
--|#line 135 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 135")
end
buffer.append_character (text_item (2))
when 47 then
yy_set_line_column
--|#line 137 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 137")
end
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
when 48 then
yy_set_column (1)
--|#line 138 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 138")
end
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
when 49 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 139 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 139")
end
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
when 50 then
	yy_column := yy_column + 1
--|#line 149 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 149")
end
last_token := text_item (1).code
when 51 then
yy_set_line_column
--|#line 0 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 0")
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
--|#line 148 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 148")
end
terminate
when 1 then
--|#line 140 "ts_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ts_config_scanner.l' at line 140")
end
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
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
			create an_array.make_filled (0, 0, 254)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,    7,    8,    9,    6,    6,   10,   11,   12,    6,
			    6,   13,    6,    6,   14,   14,   15,   16,   17,   18,
			   14,   14,   14,   14,   14,   14,   14,   14,   19,   14,
			   14,   14,   20,   14,   14,   14,    6,   14,   15,   16,
			   18,   14,   14,   14,   14,   20,   14,    6,   22,   23,
			   24,   22,   23,   24,   31,   37,   34,   32,   76,   43,
			   43,   76,   43,   77,   30,   35,   87,   78,   37,   27,
			   27,   31,   34,   42,   43,   44,   45,   46,   47,   48,
			   41,   49,   41,   41,   50,   51,   52,   53,   54,   55,
			   41,   56,   41,   57,   41,   41,   58,   41,   59,   41,

			   41,   60,   61,   62,   63,   64,   65,   41,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   67,   70,   71,   73,   75,   79,   82,   80,   83,  107,
			   85,  106,   84,  104,   86,   88,  102,   75,   79,   68,
			   80,   89,   70,   67,   71,   84,   73,   86,   88,   82,
			   83,   85,   68,   91,   89,   92,   93,   97,   98,   99,
			  100,  101,  108,  103,  105,   96,   91,   95,   92,   93,
			   39,   39,   99,  100,   97,   98,  103,  105,  108,   21,
			   21,   21,   29,   29,   29,   94,   90,   81,   66,   78,
			   40,   74,   72,   69,   66,   28,   26,   25,   40,   38, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   36,   33,   29,   28,   26,   25,  109,    5,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109, yy_Dummy>>,
			1, 55, 200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 254)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    3,    3,
			    3,    4,    4,    4,   15,   19,   17,   15,   42,   42,
			   43,   76,   76,   43,  112,   17,   78,   78,   19,  111,
			  111,   15,   17,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,

			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   31,   33,   34,   36,   38,   67,   70,   68,   72,  100,
			   74,   99,   73,   97,   75,   79,   95,   38,   67,   31,
			   68,   80,   33,   31,   34,   73,   36,   75,   79,   70,
			   72,   74,   31,   82,   80,   83,   84,   90,   91,   92,
			   93,   94,  102,   96,   98,   89,   82,   86,   83,   84,
			  113,  113,   92,   93,   90,   91,   96,   98,  102,  110,
			  110,  110,  114,  114,  114,   85,   81,   69,   66,   49,
			   39,   37,   35,   32,   29,   27,   26,   25,   21,   20, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   18,   16,   12,    9,    8,    7,    5,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109, yy_Dummy>>,
			1, 55, 200)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   46,   49,  206,  207,  204,  202,  200,
			  207,  207,  194,  207,    0,   30,  183,   30,  182,   25,
			  181,  195,  207,  207,   72,  196,  194,  192,  207,  192,
			    0,  106,  168,  102,  105,  174,  109,  173,   93,  187,
			  207,  207,   57,   59,  207,  207,  207,  207,  207,  179,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  187,   94,   96,  159,
			  112,    0,  112,  100,  111,  102,   60,  207,   57,  104,
			  109,  164,  120,  122,  123,  163,  147,  207,    0,  147,
			  133,  134,  127,  130,  126,  118,  133,  115,  132,  113,

			  111,    0,  136,    0,    0,    0,    0,    0,    0,  207,
			  178,   67,   62,  168,  181, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,  109,    1,  110,  110,  109,  109,  109,  109,  111,
			  109,  109,  109,  109,  112,  112,  112,  112,  112,  112,
			  112,  113,  109,  109,  109,  109,  109,  111,  109,  114,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  113,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  109,  109,  109,  112,
			  112,  112,  112,  112,  112,  112,  112,  109,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,

			  112,  112,  112,  112,  112,  112,  112,  112,  112,    0,
			  109,  109,  109,  109,  109, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (47, 200, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   47,   47,   47,   47,   47,   47,   47,   47,    1,
			    2,   47,   47,    1,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,    1,   47,    3,   47,   47,    4,   47,    5,
			    6,    7,   47,   47,   47,    8,   47,    9,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   11,   47,
			   12,   47,   13,   47,   47,   14,   15,   16,   17,   18,
			   19,   20,   21,   22,   23,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   23,   35,   23,
			   23,   47,   47,   47,   47,   36,   47,   37,   23,   38,

			   39,   18,   40,   20,   23,   22,   23,   23,   41,   25,
			   42,   27,   28,   23,   43,   44,   45,   46,   23,   23,
			   35,   23,   23,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47, yy_Dummy>>,
			1, 200, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    3,    1,    3,    1,    3,    3,    3,    3,    3,
			    2,    3,    3,    3,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   52,   50,    1,    2,   20,
			    6,    7,   50,    5,   18,   18,   18,   18,   18,   18,
			   18,   21,   47,   45,   47,    1,    2,   20,   19,    3,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   21,
			   45,   46,   46,   48,   38,   36,   37,   39,   40,   46,
			   41,   42,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,    4,   18,   18,   18,
			   18,   12,   18,   18,   18,   18,    0,   44,   49,   18,
			   18,   18,   18,   18,   18,   18,   16,   43,    8,   18,
			   18,   18,   18,   18,   18,   18,   18,   18,   18,   18,

			   18,   15,   18,    9,   10,   11,   13,   14,   17,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 207
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 109
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 110
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 47
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

	yyNb_rules: INTEGER = 51
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 52
			-- End of buffer rule code

	yyLine_used: BOOLEAN = true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	IN_STR: INTEGER = 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make (a_filename: STRING; an_error_handler: like error_handler)
			-- <Precursor>
		do
			str_ := ""
			last_et_identifier_value := new_identifier ("gobo")
			Precursor (a_filename, an_error_handler)
		end
		
feature {NONE} -- Implementation

	code_: INTEGER
	str_: STRING
			-- Used in semantic actions

end
