-- a simple calculator
deferred class CALC_PARSER inherit

	LALR1_PARSER[INTEGER]
		redefine
			print_item
	end

feature {ANY}

-- Created by ibyacc V1.6 from "calc_parser.y"

	Token_NUMBER: INTEGER is 257
		-- id of token NUMBER

	Token_EOL: INTEGER is 258
		-- id of token EOL

	Token_UMINUS: INTEGER is 259
		-- id of token UMINUS

feature {NONE}

	yyreds: ARRAY[STRING] is
		once
			Result := <<
				"calculate :",
				"calculate : calculate expr_eol",
				"expr_eol : expr EOL",
				"expr_eol : error EOL",
				"expr_eol : EOL",
				"expr : NUMBER",
				"expr : - NUMBER",
				"expr : expr + expr",
				"expr : expr - expr",
				"expr : expr * expr",
				"expr : expr / expr",
				"expr : ( expr )" >>
		end -- yyreds

	yytoks: ARRAY[STRING] is
		once
			Result := <<
				"$end",
				"error",
				"NUMBER",
				"EOL",
				"+",
				"-",
				"*",
				"/",
				"UMINUS",
				"(",
				")",
				"-unknown-" >>
		end -- yytoks

	yytokv: ARRAY[INTEGER] is
		once
			Result := <<
				0,256,257,258,43,45,42,47,259,40,
				41,-1 >>
		end -- yytokv

	yyexca_m: ARRAY[INTEGER] is
		once
			Result := <<
				-1, 1,
					0, -1,
					-2, 0,
				0 >>
		end -- yyexca_m

	yylast: INTEGER is 222

	yyact_m: ARRAY[INTEGER] is
		once
			Result := << 
				  12,  10,   8,  11,   8,  13,  14,   7,  15,   7,
				  21,  12,  10,  12,  11,   3,  13,   2,  13,   1,
				   0,   0,   0,   0,  16,   0,  17,  18,  19,  20,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   0,   0,   0,   0,
				   0,   0,   0,   0,   0,   0,   9,   0,   4,   6,
				   5,   6 >>
		end -- yyact_m

	yypact_m: ARRAY[INTEGER] is
		once
			Result := << 
				-1000, -38,-1000, -42,-252,-1000,-1000,-249, -36,-1000,
				 -36, -36, -36, -36,-1000,-1000, -31, -29, -29,-1000,
				-1000,-1000 >>
		end -- yypact_m

	yypgo_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,  19,  17,  15 >>
		end -- yypgo_m

	yyr1_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   1,   1,   2,   2,   2,   3,   3,   3,   3,
				   3,   3,   3 >>
		end -- yyr1_m

	yyr2_m: ARRAY[INTEGER] is
		once
			Result := << 
				   0,   1,   5,   5,   5,   3,   2,   5,   7,   7,
				   7,   7,   7 >>
		end -- yyr2_m

	yychk_m: ARRAY[INTEGER] is
		once
			Result := << 
				-1000,  -1,  -2,  -3, 256, 258, 257,  45,  40, 258,
				  43,  45,  42,  47, 258, 257,  -3,  -3,  -3,  -3,
				  -3,  41 >>
		end -- yychk_m

	yydef_m: ARRAY[INTEGER] is
		once
			Result := << 
				   1,  -2,   2,   0,   0,   5,   6,   0,   0,   3,
				   0,   0,   0,   0,   4,   7,   0,   8,   9,  10,
				  11,  12 >>
		end -- yydef_m

	yy_do_action (yy_a, yy_n: INTEGER) is
			-- execute user action 'yy_a'
		do
			inspect
				yy_a

			when 1 then
				yy_do_default_action(yy_n)

-- line 27
	io.putstring("Enter expression:%N") 
			when 2 then
				yy_do_default_action(yy_n)

-- line 29
	io.putstring("Enter another expression:%N") 
			when 3 then
				yy_do_default_action(yy_n)

-- line 34
	io.putint(yyvstack.item(-1))
		io.new_line
	  
			when 4 then
				yy_do_default_action(yy_n)

-- line 38
	clear_error 
			when 5 then
				yy_do_default_action(yy_n)

-- line 40
	set_accepted 
			when 7 then
				yy_do_default_action(yy_n)

-- line 46
	yyval := yyvstack.item(-0) * -1 
			when 8 then
				yy_do_default_action(yy_n)

-- line 48
	yyval := yyvstack.item(-2) + yyvstack.item(-0) 
			when 9 then
				yy_do_default_action(yy_n)

-- line 50
	yyval := yyvstack.item(-2) - yyvstack.item(-0) 
			when 10 then
				yy_do_default_action(yy_n)

-- line 52
	yyval := yyvstack.item(-2) * yyvstack.item(-0) 
			when 11 then
				yy_do_default_action(yy_n)

-- line 54
	yyval := yyvstack.item(-2) // yyvstack.item(-0) 
			when 12 then
				yy_do_default_action(yy_n)

-- line 56
	yyval := yyvstack.item(-1) 
			else
			-- empty action
			end -- inspect action
		end -- yy_do_action

-- line 59

feature {NONE} -- debuging

	print_item (v: INTEGER) is
			-- print item 'v'
		do
			io.putint(v)
			io.putchar(' ')
		end -- print_item

feature {ANY} -- creation

	make is
			-- start calculator
		do
			reset
			parse
		end -- make

end -- class CALC_PARSER
