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

	KL_SHARED_STRING_ROUTINES

	KL_SHARED_INPUT_STREAM_ROUTINES

creation

	make, execute


feature {NONE} -- Tables

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate := yytranslate_
			yyr1 := yyr1_
			yyr2 := yyr2_
			yydefact := yydefact_
			yydefgoto := yydefgoto_
			yypact := yypact_
			yypgoto := yypgoto_
			yytable := yytable_
			yycheck := yycheck_
		end

	yyFinal: INTEGER is 23

	yyFlag: INTEGER is -32768

	yyNtbase: INTEGER is 13

	yyMax_token: INTEGER is 259
	yyNsyms: INTEGER is 16

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    10,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    11,
    12,     6,     5,     2,     4,     2,     7,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     9,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     8>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
    13,    13,    14,    14,    14,    15,    15,    15,    15,    15,
    15,    15>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
     0,     2,     1,     2,     2,     1,     3,     3,     3,     3,
     2,     3>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<     1,
     0,     0,     6,     0,     3,     0,     2,     0,     5,    11,
     0,     0,     0,     0,     0,     4,    12,     8,     7,     9,
    10,     0,     0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<     1,
     7,     8>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<-32768,
     0,    -8,-32768,    18,-32768,    18,-32768,    26,-32768,-32768,
    13,    18,    18,    18,    18,-32768,-32768,     2,     2,-32768,
-32768,     6,-32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<-32768,
-32768,     1>>, 0)
		end

	yyLast: INTEGER is 36

	yytable_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    22,
     2,     9,     3,     4,    10,    23,    11,    14,    15,     5,
     6,     0,    18,    19,    20,    21,    12,    13,    14,    15,
     3,     4,     0,     0,    17,     0,     0,     0,     6,    12,
    13,    14,    15,     0,     0,    16>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<     0,
     1,    10,     3,     4,     4,     0,     6,     6,     7,    10,
    11,    -1,    12,    13,    14,    15,     4,     5,     6,     7,
     3,     4,    -1,    -1,    12,    -1,    -1,    -1,    11,     4,
     5,     6,     7,    -1,    -1,    10>>, 0)
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
		do
			inspect yy_act

when 4 then
--#line 43 "calc.y"
 print (yyvs.item (yyvsp - 1)); print ('%N') 

when 5 then
--#line 44 "calc.y"
 recover 

when 7 then
--#line 49 "calc.y"
 yyval := yyvs.item (yyvsp - 2) + yyvs.item (yyvsp) 

when 8 then
--#line 50 "calc.y"
 yyval := yyvs.item (yyvsp - 2) - yyvs.item (yyvsp) 

when 9 then
--#line 51 "calc.y"
 yyval := yyvs.item (yyvsp - 2) * yyvs.item (yyvsp) 

when 10 then
--#line 52 "calc.y"
 yyval := yyvs.item (yyvsp - 2) / yyvs.item (yyvsp) 

when 11 then
--#line 53 "calc.y"
 yyval := -yyvs.item (yyvsp) 

when 12 then
--#line 54 "calc.y"
 yyval := yyvs.item (yyvsp - 1) 

			else
				-- No action
			end
		end

feature {NONE} -- Token codes

	NUM: INTEGER is 258
	NEG: INTEGER is 259


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
				else
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
			elseif c = '.' or (c >= '0' and c <= '9') then
					-- Process numbers
				last_token := NUM
				from
					buffer := STRING_.make (10)
					buffer.append_character (c)
					std.input.read_character
					c := std.input.last_character
				until
					INPUT_STREAM_.end_of_input (std.input) or else
					(c /= '.' and (c < '0' or c > '9'))
				loop
					buffer.append_character (c)
					std.input.read_character
					c := std.input.last_character
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
