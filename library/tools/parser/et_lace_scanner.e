indexing

	description:

		"Scanners for Lace parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LACE_SCANNER

inherit

	ET_LACE_SCANNER_SKELETON

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
if yy_act <= 25 then
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 32
-- Ignore separators
else
--|#line 33
eif_lineno := eif_lineno + text_count
end
else
if yy_act = 3 then
--|#line 38
-- Ignore comments
else
--|#line 39
eif_lineno := eif_lineno + 1
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 44
last_token := Semicolon_code
else
--|#line 45
last_token := Colon_code
end
else
--|#line 46
last_token := Comma_code
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 47
last_token := Left_parenthesis_code
else
--|#line 48
last_token := Right_parenthesis_code
end
else
--|#line 53
last_token := L_CLUSTER
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 54
last_token := L_DEFAULT
else
--|#line 55
last_token := L_END
end
else
--|#line 56
last_token := L_EXTERNAL
end
end
end
else
if yy_act <= 19 then
if yy_act <= 16 then
if yy_act <= 15 then
if yy_act = 14 then
--|#line 57
last_token := L_OPTION
else
--|#line 58
last_token := L_ROOT
end
else
--|#line 59
last_token := L_SYSTEM
end
else
if yy_act <= 18 then
if yy_act = 17 then
--|#line 64

				last_token := L_IDENTIFIER
				last_value := new_identifier (text)
			
else
--|#line 72

				last_token := L_STRING
				last_value := new_identifier (text_substring (2, text_count - 1))
			
end
else
--|#line 76

				if text_count > 1 then
					eif_buffer.append_string (text_substring (2, text_count))
				end
				set_start_condition (IN_STR)
			
end
end
else
if yy_act <= 22 then
if yy_act <= 21 then
if yy_act = 20 then
--|#line 82
eif_buffer.append_string (text)
else
--|#line 83
eif_buffer.append_character ('%A')
end
else
--|#line 84
eif_buffer.append_character ('%B')
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 85
eif_buffer.append_character ('%C')
else
--|#line 86
eif_buffer.append_character ('%D')
end
else
--|#line 87
eif_buffer.append_character ('%F')
end
end
end
end
else
if yy_act <= 38 then
if yy_act <= 32 then
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 88
eif_buffer.append_character ('%H')
else
--|#line 89
eif_buffer.append_character ('%L')
end
else
if yy_act = 28 then
--|#line 90
eif_buffer.append_character ('%N')
else
--|#line 91
eif_buffer.append_character ('%Q')
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 92
eif_buffer.append_character ('%R')
else
--|#line 93
eif_buffer.append_character ('%S')
end
else
--|#line 94
eif_buffer.append_character ('%T')
end
end
else
if yy_act <= 35 then
if yy_act <= 34 then
if yy_act = 33 then
--|#line 95
eif_buffer.append_character ('%U')
else
--|#line 96
eif_buffer.append_character ('%V')
end
else
--|#line 97
eif_buffer.append_character ('%%')
end
else
if yy_act <= 37 then
if yy_act = 36 then
--|#line 98
eif_buffer.append_character ('%'')
else
--|#line 99
eif_buffer.append_character ('%"')
end
else
--|#line 100
eif_buffer.append_character ('%(')
end
end
end
else
if yy_act <= 44 then
if yy_act <= 41 then
if yy_act <= 40 then
if yy_act = 39 then
--|#line 101
eif_buffer.append_character ('%)')
else
--|#line 102
eif_buffer.append_character ('%<')
end
else
--|#line 103
eif_buffer.append_character ('%>')
end
else
if yy_act <= 43 then
if yy_act = 42 then
--|#line 104

			code_ := text_substring (3, text_count - 1).to_integer
			if (code_ > Platform.Maximum_character_code) then
				last_token := L_STRERR
				set_start_condition (INITIAL)
			else
				eif_buffer.append_character (INTEGER_.to_character (code_))
			end
		
else
--|#line 117
eif_lineno := eif_lineno + 1
end
else
--|#line 118

			last_token := L_STRING
			if text_count > 1 then
				eif_buffer.append_string (text_substring (1, text_count - 1))
			end
			str_ := STRING_.make (eif_buffer.count)
			str_.append_string (eif_buffer)
			eif_buffer.wipe_out
			last_value := new_identifier (str_)
			set_start_condition (INITIAL)
		
end
end
else
if yy_act <= 47 then
if yy_act <= 46 then
if yy_act = 45 then
--|#line 131
eif_buffer.append_character (text_item (2))
else
--|#line 133
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
end
else
--|#line 134
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
end
else
if yy_act <= 49 then
if yy_act = 48 then
--|#line 135
	-- Catch-all rules (no backing up)
							last_token := L_STRERR
							set_start_condition (INITIAL)
						
else
--|#line 145
last_token := text_item (1).code
end
else
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
							last_token := L_STRERR
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
			   13,    6,    6,   14,   15,    6,    6,   16,   16,   17,
			   18,   19,   16,   16,   16,   16,   16,   16,   16,   20,
			   16,   16,   21,   22,   16,   16,   16,   16,   16,    6,
			   16,   17,   18,   16,   16,   16,   21,   22,   16,   16,
			   24,   25,   26,   24,   25,   26,   33,   68,   35,   71,
			   75,   44,   44,   75,   44,   76,   32,   36,   84,   77,
			   29,   68,   29,   71,   33,   35,   42,   43,   44,   45,
			   46,   47,   48,   49,   42,   42,   50,   42,   42,   42,
			   51,   52,   53,   54,   55,   56,   42,   57,   42,   58,

			   42,   59,   42,   60,   42,   42,   61,   62,   63,   64,
			   65,   66,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   42,   42,   69,   70,   72,   74,   78,
			   79,   82,   94,   83,   91,   85,   86,   87,   92,   93,
			   95,   72,   74,   78,   96,   82,   69,   83,   70,   85,
			   86,   87,   91,   79,   95,   92,   93,   97,   96,   98,
			   23,   23,   23,   40,   90,   40,   31,   31,   31,   89,
			   88,   81,   80,   67,   77,   41,   73,   98,   67,   30,
			   97,   28,   27,   41,   39,   38,   37,   34,   31,   30,
			   28,   27,   99,    5,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99>>)
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    3,    3,    3,    4,    4,    4,   17,   33,   19,   36,
			   43,   43,   44,   75,   75,   44,  102,   19,   77,   77,
			  101,   33,  101,   36,   17,   19,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,

			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   34,   35,   37,   39,   68,
			   69,   73,   89,   74,   86,   78,   79,   80,   87,   88,
			   90,   37,   39,   68,   91,   73,   34,   74,   35,   78,
			   79,   80,   86,   69,   90,   87,   88,   92,   91,   97,
			  100,  100,  100,  103,   85,  103,  104,  104,  104,   83,
			   81,   72,   71,   67,   50,   40,   38,   97,   31,   29,
			   92,   28,   27,   23,   22,   21,   20,   18,   13,    9,
			    8,    7,    5,   99,   99,   99,   99,   99,   99,   99,

			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   47,   50,  192,  193,  189,  187,  185,
			  193,  193,  193,  178,  193,  193,    0,   30,  166,   30,
			  156,  156,  146,  179,  193,  193,   75,  180,  178,  175,
			  193,  175,    0,   22,  103,  106,   25,   93,  147,   95,
			  171,  193,  193,   58,   60,  193,  193,  193,  193,  193,
			  162,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  171,   96,  113,
			    0,  151,  146,   97,   99,   61,  193,   57,  101,  101,
			  105,  141,    0,  148,  193,  143,  108,  110,  111,  105,
			  108,  110,  140,    0,    0,    0,    0,  133,    0,  193,

			  159,   69,   63,  162,  165>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   99,    1,  100,  100,   99,   99,   99,   99,  101,
			   99,   99,   99,   99,   99,   99,  102,  102,  102,  102,
			  102,  102,  102,  103,   99,   99,   99,   99,   99,  101,
			   99,  104,  102,  102,  102,  102,  102,  102,  102,  102,
			  103,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,  102,  102,
			  102,  102,  102,  102,  102,   99,   99,   99,  102,  102,
			  102,  102,  102,  102,   99,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,    0,

			   99,   99,   99,   99,   99>>)
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
			    7,    8,    1,    1,    9,   10,    1,   11,   12,   12,
			   12,   12,   12,   12,   12,   12,   12,   12,   13,   14,
			   15,    1,   16,    1,    1,   17,   18,   19,   20,   21,
			   22,   23,   24,   25,   23,   23,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   23,   37,   38,
			   23,    1,    1,    1,    1,   39,    1,   40,   23,   41,

			   42,   21,   43,   23,   23,   25,   23,   23,   44,   27,
			   45,   29,   30,   23,   46,   47,   48,   49,   23,   23,
			   37,   38,   23,    1,    1,    1,    1,    1,    1,    1,
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
			    1,    1,    3,    1,    1,    1,    1,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   51,   49,    1,    2,   19,
			    8,    9,    7,   49,    6,    5,   17,   17,   17,   17,
			   17,   17,   17,   20,   46,   44,   46,    1,    2,   19,
			   18,    3,   17,   17,   17,   17,   17,   17,   17,   17,
			   20,   44,   45,   45,   47,   37,   35,   36,   38,   39,
			   45,   40,   41,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,    4,   17,   17,
			   12,   17,   17,   17,   17,    0,   43,   48,   17,   17,
			   17,   17,   15,   17,   42,   17,   17,   17,   17,   17,
			   17,   17,   17,   14,   16,   10,   11,   17,   13,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 193
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 99
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 100
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

	yyNb_rules: INTEGER is 50
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 51
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	IN_STR: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



end -- class ET_LACE_SCANNER
