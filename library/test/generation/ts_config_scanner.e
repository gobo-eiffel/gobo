indexing

	description:

		"Scanners for test config parsers"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TS_CONFIG_SCANNER

inherit

	TS_CONFIG_SCANNER_SKELETON

creation

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
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 26 then
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 33
-- Ignore separators
else
yy_set_line (0)
--|#line 34
-- Ignore new-lines
end
else
if yy_act = 3 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 39
-- Ignore comments
else
yy_set_column (1)
--|#line 40
-- Ignire comments
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
	yy_column := yy_column + 1
--|#line 45
last_token := Colon_code
else
	yy_column := yy_column + 1
--|#line 46
last_token := Left_parenthesis_code
end
else
	yy_column := yy_column + 1
--|#line 47
last_token := Right_parenthesis_code
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
	yy_column := yy_column + 5
--|#line 52
last_token := T_CLASS
else
	yy_column := yy_column + 7
--|#line 53
last_token := T_CLUSTER
end
else
	yy_column := yy_column + 7
--|#line 54
last_token := T_COMPILE
end
else
if yy_act <= 12 then
if yy_act = 11 then
	yy_column := yy_column + 7
--|#line 55
last_token := T_DEFAULT
else
	yy_column := yy_column + 3
--|#line 56
last_token := T_END
end
else
	yy_column := yy_column + 7
--|#line 57
last_token := T_EXECUTE
end
end
end
else
if yy_act <= 20 then
if yy_act <= 17 then
if yy_act <= 15 then
if yy_act = 14 then
	yy_column := yy_column + 7
--|#line 58
last_token := T_FEATURE
else
	yy_column := yy_column + 6
--|#line 59
last_token := T_PREFIX
end
else
if yy_act = 16 then
	yy_column := yy_column + 4
--|#line 60
last_token := T_TEST
else
	yy_column := yy_column + 7
--|#line 61
last_token := T_TESTGEN
end
end
else
if yy_act <= 19 then
if yy_act = 18 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 66

				last_token := T_IDENTIFIER
				last_value := new_identifier (text)
			
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 74

				last_token := T_STRING
				last_value := new_identifier (text_substring (2, text_count - 1))
			
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 78

				if text_count > 1 then
					buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
else
if yy_act <= 23 then
if yy_act <= 22 then
if yy_act = 21 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 84
buffer.append_string (text)
else
	yy_column := yy_column + 2
--|#line 85
buffer.append_character ('%A')
end
else
	yy_column := yy_column + 2
--|#line 86
buffer.append_character ('%B')
end
else
if yy_act <= 25 then
if yy_act = 24 then
	yy_column := yy_column + 2
--|#line 87
buffer.append_character ('%C')
else
	yy_column := yy_column + 2
--|#line 88
buffer.append_character ('%D')
end
else
	yy_column := yy_column + 2
--|#line 89
buffer.append_character ('%F')
end
end
end
end
else
if yy_act <= 39 then
if yy_act <= 33 then
if yy_act <= 30 then
if yy_act <= 28 then
if yy_act = 27 then
	yy_column := yy_column + 2
--|#line 90
buffer.append_character ('%H')
else
	yy_column := yy_column + 2
--|#line 91
buffer.append_character ('%L')
end
else
if yy_act = 29 then
	yy_column := yy_column + 2
--|#line 92
buffer.append_character ('%N')
else
	yy_column := yy_column + 2
--|#line 93
buffer.append_character ('%Q')
end
end
else
if yy_act <= 32 then
if yy_act = 31 then
	yy_column := yy_column + 2
--|#line 94
buffer.append_character ('%R')
else
	yy_column := yy_column + 2
--|#line 95
buffer.append_character ('%S')
end
else
	yy_column := yy_column + 2
--|#line 96
buffer.append_character ('%T')
end
end
else
if yy_act <= 36 then
if yy_act <= 35 then
if yy_act = 34 then
	yy_column := yy_column + 2
--|#line 97
buffer.append_character ('%U')
else
	yy_column := yy_column + 2
--|#line 98
buffer.append_character ('%V')
end
else
	yy_column := yy_column + 2
--|#line 99
buffer.append_character ('%%')
end
else
if yy_act <= 38 then
if yy_act = 37 then
	yy_column := yy_column + 2
--|#line 100
buffer.append_character ('%'')
else
	yy_column := yy_column + 2
--|#line 101
buffer.append_character ('%"')
end
else
	yy_column := yy_column + 2
--|#line 102
buffer.append_character ('%(')
end
end
end
else
if yy_act <= 45 then
if yy_act <= 42 then
if yy_act <= 41 then
if yy_act = 40 then
	yy_column := yy_column + 2
--|#line 103
buffer.append_character ('%)')
else
	yy_column := yy_column + 2
--|#line 104
buffer.append_character ('%<')
end
else
	yy_column := yy_column + 2
--|#line 105
buffer.append_character ('%>')
end
else
if yy_act <= 44 then
if yy_act = 43 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 106

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := T_STRERR
				set_start_condition (INITIAL)
			else
				buffer.append_character (INTEGER_.to_character (code_))
			end
		
else
yy_set_column (1)
--|#line 119
-- Ignore new-line
end
else
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 120

			last_token := T_STRING
			if text_count > 1 then
				buffer.append_string (text_substring (1, text_count - 1))
			end
			str_ := STRING_.make (buffer.count)
			str_.append_string (buffer)
			buffer.wipe_out
			last_value := new_identifier (str_)
			set_start_condition (INITIAL)
		
end
end
else
if yy_act <= 48 then
if yy_act <= 47 then
if yy_act = 46 then
	yy_column := yy_column + 2
--|#line 133
buffer.append_character (text_item (2))
else
yy_set_line_column
--|#line 135
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
end
else
yy_set_column (1)
--|#line 136
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
end
else
if yy_act <= 50 then
if yy_act = 49 then
	yy_column := yy_column + yy_end - yy_start - yy_more_len
--|#line 137
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
else
	yy_column := yy_column + 1
--|#line 147
last_token := text_item (1).code
end
else
yy_set_line_column
--|#line 0
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
--|#line 0
terminate
when 1 then
--|#line 0
	-- Catch-all rules (no backing up)
							last_token := T_STRERR
							set_start_condition (INITIAL)
						
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    6,    7,    8,    9,    6,    6,   10,   11,   12,
			    6,    6,   13,    6,    6,   14,   14,   15,   16,   17,
			   18,   14,   14,   14,   14,   14,   14,   14,   14,   19,
			   14,   14,   14,   20,   14,   14,   14,    6,   14,   15,
			   16,   18,   14,   14,   14,   14,   20,   14,   22,   23,
			   24,   22,   23,   24,   31,   37,   34,   32,   76,   43,
			   43,   76,   43,   77,   30,   35,   87,   78,   37,  107,
			  106,   31,   34,   41,   42,   43,   44,   45,   46,   47,
			   48,   41,   49,   41,   41,   50,   51,   52,   53,   54,
			   55,   41,   56,   41,   57,   41,   41,   58,   41,   59,

			   41,   41,   60,   61,   62,   63,   64,   65,   41,   41,
			   41,   41,   41,   41,   41,   41,   41,   41,   41,   41,
			   67,   70,   71,   73,   75,   79,   82,   80,   83,   27,
			   85,   27,   84,  104,   86,   88,  102,   75,   79,   68,
			   80,   89,   70,   67,   71,   84,   73,   86,   88,   82,
			   83,   85,   68,   91,   89,   92,   93,   97,   98,   99,
			  100,  101,  108,  103,  105,   39,   91,   39,   92,   93,
			   96,   95,   99,  100,   97,   98,  103,  105,  108,   21,
			   21,   21,   29,   29,   29,   94,   90,   81,   66,   78,
			   40,   74,   72,   69,   66,   28,   26,   25,   40,   38,

			   36,   33,   29,   28,   26,   25,  109,    5,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    3,    3,
			    3,    4,    4,    4,   15,   19,   17,   15,   42,   42,
			   43,   76,   76,   43,  112,   17,   78,   78,   19,  100,
			   99,   15,   17,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,

			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   31,   33,   34,   36,   38,   67,   70,   68,   72,  111,
			   74,  111,   73,   97,   75,   79,   95,   38,   67,   31,
			   68,   80,   33,   31,   34,   73,   36,   75,   79,   70,
			   72,   74,   31,   82,   80,   83,   84,   90,   91,   92,
			   93,   94,  102,   96,   98,  113,   82,  113,   83,   84,
			   89,   86,   92,   93,   90,   91,   96,   98,  102,  110,
			  110,  110,  114,  114,  114,   85,   81,   69,   66,   49,
			   39,   37,   35,   32,   29,   27,   26,   25,   21,   20,

			   18,   16,   12,    9,    8,    7,    5,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   45,   48,  206,  207,  203,  201,  199,
			  207,  207,  193,  207,    0,   29,  182,   29,  181,   24,
			  180,  194,  207,  207,   72,  195,  193,  191,  207,  191,
			    0,  105,  167,  101,  104,  173,  108,  172,   92,  186,
			  207,  207,   56,   58,  207,  207,  207,  207,  207,  178,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  186,   93,   95,  158,
			  111,    0,  111,   99,  110,  101,   59,  207,   56,  103,
			  108,  163,  119,  121,  122,  162,  150,  207,    0,  151,
			  132,  133,  126,  129,  125,  117,  132,  114,  131,   51,

			   50,    0,  135,    0,    0,    0,    0,    0,    0,  207,
			  178,  128,   61,  164,  181>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
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
			  109,  109,  109,  109,  109>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    1,    1,    5,    1,    6,
			    7,    8,    1,    1,    1,    9,    1,   10,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   12,    1,
			   13,    1,   14,    1,    1,   15,   16,   17,   18,   19,
			   20,   21,   22,   23,   24,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   24,   36,   24,
			   24,    1,    1,    1,    1,   37,    1,   38,   24,   39,

			   40,   19,   41,   21,   24,   23,   24,   24,   42,   26,
			   43,   28,   29,   24,   44,   45,   46,   47,   24,   24,
			   36,   24,   24,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    2,    1,    1,    1,    1,
			    1,    3,    1,    1,    1,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
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

			   18,   15,   18,    9,   10,   11,   13,   14,   17,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 207
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 109
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 110
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

	yyNb_rules: INTEGER is 51
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 52
			-- End of buffer rule code

	yyLine_used: BOOLEAN is true
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Implementation

	code_: INTEGER
	str_: STRING
			-- Used in semantic actions

end -- class TS_CONFIG_SCANNER
