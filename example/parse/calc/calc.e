indexing

	description:

		"Infix notation calculator"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class CALC

inherit

	YY_PARSER_SKELETON [DOUBLE]

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make, execute


feature -- Token codes

	NUM: INTEGER is 258
	NEG: INTEGER is 259

feature {NONE} -- Implementation

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate ?= yytranslate_template
			yyr1 ?= yyr1_template
			yyr2 ?= yyr2_template
			yydefact ?= yydefact_template
			yydefgoto ?= yydefgoto_template
			yypact ?= yypact_template
			yypgoto ?= yypgoto_template
			yytable ?= yytable_template
			yycheck ?= yycheck_template
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 4 then
--|#line 42
			yyval := yyval_default;
print (yyvs.item (yyvsp - 1)); print ('%N') 

when 5 then
--|#line 43
			yyval := yyval_default;
recover 

when 6 then
--|#line 46
			yyval := yyval_default;
yyval := yyvs.item (yyvsp) 

when 7 then
--|#line 47
			yyval := yyval_default;
yyval := yyvs.item (yyvsp - 2) + yyvs.item (yyvsp) 

when 8 then
--|#line 48
			yyval := yyval_default;
yyval := yyvs.item (yyvsp - 2) - yyvs.item (yyvsp) 

when 9 then
--|#line 49
			yyval := yyval_default;
yyval := yyvs.item (yyvsp - 2) * yyvs.item (yyvsp) 

when 10 then
--|#line 50
			yyval := yyval_default;
yyval := yyvs.item (yyvsp - 2) / yyvs.item (yyvsp) 

when 11 then
--|#line 51
			yyval := yyval_default;
yyval := -yyvs.item (yyvsp) 

when 12 then
--|#line 52
			yyval := yyval_default;
yyval := yyvs.item (yyvsp - 1) 

			else
					-- No action
				yyval := yyval_default
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   10,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   11,   12,    6,    5,    2,    4,    2,    7,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    9,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    8>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   13,   13,   14,   14,   14,   15,   15,   15,   15,
			   15,   15,   15>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    0,    2,    1,    2,    2,    1,    3,    3,    3,
			    3,    2,    3>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    1,    0,    0,    3,    0,    6,    0,    2,    0,    0,
			   11,    5,    4,    0,    0,    0,    0,   12,   10,    9,
			    7,    8,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    1,    7,    8>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768,    5,   18, -32768,   18, -32768,    0, -32768,   26,   13,
			 -32768, -32768, -32768,   18,   18,   18,   18, -32768, -32768, -32768,
			   -3,   -3,    1, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768,   -2>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    9,   23,   10,   14,   13,   22,    6,    0,    5,    4,
			   11,   18,   19,   20,   21,    3,    2,   16,   15,   14,
			   13,    5,    4,    0,    0,   17,    0,    0,    0,    2,
			   16,   15,   14,   13,    0,    0,   12>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    0,    4,    6,    7,    0,    1,    0,    3,    4,
			   10,   13,   14,   15,   16,   10,   11,    4,    5,    6,
			    7,    3,    4,    0,    0,   12,    0,    0,    0,   11,
			    4,    5,    6,    7,    0,    0,   10>>)
		end

feature {NONE} -- Constants

	yyFinal: INTEGER is 23
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 13
			-- Number of tokens

	yyLast: INTEGER is 36
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 259
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 16
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	execute is
			-- Run calculator.
		do
			make
			parse
		end

feature {NONE} -- Scanner

	read_token is
			-- Lexical analyzer returns a double floating point
			-- number on the stack and the token NUM, or the ASCII
			-- character read if not a number. Skips all blanks
			-- and tabs, returns 0 for EOF.
		local
			c: CHARACTER
			buffer: STRING
		do
				-- Skip white space
			from
				if has_pending_character then
					c := pending_character
					has_pending_character := False
				elseif not INPUT_STREAM_.end_of_input (std.input) then
					std.input.read_character
					c := std.input.last_character
				end
			until
				INPUT_STREAM_.end_of_input (std.input) or else
				(c /= ' ' and c /= '%T')
			loop
				std.input.read_character
				c := std.input.last_character
			end
			if INPUT_STREAM_.end_of_input (std.input) then
					-- Return end-of-file
				last_token := 0
			elseif (c >= '0' and c <= '9') then
					-- Process numbers
				last_token := NUM
				from
					buffer := STRING_.make (10)
					buffer.append_character (c)
					std.input.read_character
					c := std.input.last_character
				until
					INPUT_STREAM_.end_of_input (std.input) or else
					(c < '0' or c > '9')
				loop
					buffer.append_character (c)
					std.input.read_character
					c := std.input.last_character
				end
				if not INPUT_STREAM_.end_of_input (std.input) and then c = '.' then
					from
						buffer.append_character ('.')
						std.input.read_character
						c := std.input.last_character
					until
						INPUT_STREAM_.end_of_input (std.input) or else
						(c < '0' or c > '9')
					loop
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					end
				end
				if not INPUT_STREAM_.end_of_input (std.input) then
					pending_character := c
					has_pending_character := True
				end
				last_value := buffer.to_double
			elseif c = '%R' then
					-- Bug in Visual Eiffel 2.1: when the Enter Key
					-- is pressed, `read_character' gets '%R' instead
					-- of '%N' or instead of the sequence '%R''%N'.
				last_token := ('%N').code
			else
					-- Return single character
				last_token := c.code
			end
		end

	last_token: INTEGER
			-- Last token read

	last_value: DOUBLE
			-- Semantic value of last token read

feature {NONE} -- Implementation

	pending_character: CHARACTER
	has_pending_character: BOOLEAN

end -- class CALC
