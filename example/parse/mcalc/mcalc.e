indexing

	description:

		"Calculator with memory"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1999, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class MCALC

inherit

	YY_PARSER_SKELETON [ANY]
		rename
			make as make_parser_skeleton
		end

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_INPUT_STREAM_ROUTINES

creation

	make, execute


feature -- Token codes

	NUM: INTEGER is 258
	VAR: INTEGER is 259
	ASSIGN: INTEGER is 260
	NEG: INTEGER is 261

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
		local
			yyval1: DOUBLE
			yyval2: STRING
		do
			inspect yy_act
when 4 then
--|#line 49
			yyval := yyval_default;
print (yytype1 (yyvs.item (yyvsp - 1))); print ('%N') 

when 5 then
--|#line 50
			yyval := yyval_default;
recover 

when 6 then
--|#line 53

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 7 then
--|#line 54

yyval1 := memory_value (yytype2 (yyvs.item (yyvsp))) 
			yyval := yyval1
when 8 then
--|#line 55

yyval1 := yytype1 (yyvs.item (yyvsp)); set_memory_value (yyval1, yytype2 (yyvs.item (yyvsp - 2))) 
			yyval := yyval1
when 9 then
--|#line 56

yyval1 := yytype1 (yyvs.item (yyvsp - 2)) + yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 10 then
--|#line 57

yyval1 := yytype1 (yyvs.item (yyvsp - 2)) - yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 11 then
--|#line 58

yyval1 := yytype1 (yyvs.item (yyvsp - 2)) * yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 12 then
--|#line 59

yyval1 := yytype1 (yyvs.item (yyvsp - 2)) / yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 13 then
--|#line 60

yyval1 := -yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 14 then
--|#line 61

yyval1 := yytype1 (yyvs.item (yyvsp - 1)) 
			yyval := yyval1
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
			   12,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   13,   14,    8,    7,    2,    6,    2,    9,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   11,    2,    2,    2,    2,    2,

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
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,   10>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   16,   16,   17,   17,   17,   15,   15,   15,   15,
			   15,   15,   15,   15,   15>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    0,    2,    1,    2,    2,    1,    1,    3,    3,
			    3,    3,    3,    2,    3>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    1,    0,    0,    3,    0,    7,    6,    0,    0,    2,
			    0,   13,    0,    5,    4,    0,    0,    0,    0,   14,
			    8,   12,   11,    9,   10,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    8,    1,    9>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768,    5,   16, -32768,   16,    2, -32768,    0,   26, -32768,
			   17, -32768,   16, -32768, -32768,   16,   16,   16,   16, -32768,
			   33, -32768, -32768,   -5,   -5,    1, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   -2, -32768, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   10,   26,   11,   16,   15,   25,    7,   12,    6,    5,
			   20,    4,   13,   21,   22,   23,   24,    3,    2,    6,
			    5,    0,    4,   18,   17,   16,   15,    0,    0,    2,
			    0,   19,   18,   17,   16,   15,    0,    0,   14,   18,
			   17,   16,   15>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    0,    4,    8,    9,    0,    1,    5,    3,    4,
			   12,    6,   12,   15,   16,   17,   18,   12,   13,    3,
			    4,    0,    6,    6,    7,    8,    9,    0,    0,   13,
			    0,   14,    6,    7,    8,    9,    0,    0,   12,    6,
			    7,    8,    9>>)
		end

feature {NONE} -- Conversion

	yytype1 (v: ANY): DOUBLE is
		require
			valid_type: yyis_type1 (v)
		local
			ref: DOUBLE_REF
		do
			ref ?= v
			Result := ref.item
		end

	yyis_type1 (v: ANY): BOOLEAN is
		local
			u: DOUBLE_REF
		do
			u ?= v
			Result := (u = v)
		end

	yytype2 (v: ANY): STRING is
		require
			valid_type: yyis_type2 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: STRING
		do
			u ?= v
			Result := (u = v)
		end


feature {NONE} -- Constants

	yyFinal: INTEGER is 26
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 15
			-- Number of tokens

	yyLast: INTEGER is 42
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 261
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 18
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make is
			-- Create a new calculator with memory.
		do
			make_parser_skeleton
			!! memory_values.make (10)
		end

	execute is
			-- Run calculator.
		do
			make
			parse
		end

feature -- Memory management

	memory_value (a_name: STRING): DOUBLE is
			-- Value associated with memory a_name;
			-- 0.0 if no value has been stored in a_name yet
		require
			a_name_not_void: a_name /= Void
		do
			if memory_values.has (a_name) then
				Result := memory_values.item (a_name)
			else
				Result := 0.0
			end
		end

	set_memory_value (a_value: DOUBLE; a_name: STRING) is
			-- Store a_value into a_name.
		require
			a_name_not_void: a_name /= Void
		do
			memory_values.force (a_value, a_name)
		ensure
			memory_value_set: memory_value (a_name) = a_value
		end

feature {NONE} -- Scanner

	read_token is
			-- Lexical analyzer returns a double floating point
			-- number on the stack and the token NUM, a STRING and
			-- and the token VAR, a token ASSIGN, or the ASCII
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
			else
				inspect c
				when '0'..'9' then
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
				when 'a'..'z', 'A'..'Z' then
						-- Process variables.
					last_token := VAR
					from
						!! buffer.make (10)
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					until
						INPUT_STREAM_.end_of_input (std.input) or else
						not (('a' <= c and c <= 'z') or
							('A' <= c and c <= 'Z') or
							('0' <= c and c <= '9'))
					loop
						buffer.append_character (c)
						std.input.read_character
						c := std.input.last_character
					end
					if not INPUT_STREAM_.end_of_input (std.input) then
						pending_character := c
						has_pending_character := True
					end
					last_value := buffer
				when ':' then
					std.input.read_character
					c := std.input.last_character
					if not INPUT_STREAM_.end_of_input (std.input) then
						if c = '=' then
								-- Found ":="
							last_token := ASSIGN
						else
								-- Return single character
							last_token := (':').code
							pending_character := c
							has_pending_character := True
						end
					else
							-- Return single character
						last_token := (':').code 
					end
				when '%R' then
						-- Bug in Visual Eiffel 2.1: when the Enter Key
						-- is pressed, `read_character' gets '%R' instead
						-- of '%N' or instead of the sequence '%R''%N'.
					last_token := ('%N').code
				else
						-- Return single character
					last_token := c.code
				end
			end
		end

	last_token: INTEGER
			-- Last token read

	last_value: ANY
			-- Semantic value of last token read

feature {NONE} -- Implementation

	pending_character: CHARACTER
	has_pending_character: BOOLEAN

	memory_values: DS_HASH_TABLE [DOUBLE, STRING]
			-- Values already stored so far

invariant

	memory_values_not_void: memory_values /= Void

end -- class MCALC
