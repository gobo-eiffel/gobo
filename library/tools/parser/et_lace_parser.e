indexing

	description:

		"Lace parsers"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_LACE_PARSER

inherit

	ET_LACE_PARSER_SKELETON

	ET_LACE_SCANNER
		rename
			make as make_lace_scanner
		end

creation

	make


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
			yyval1: ET_IDENTIFIER
			yyval2: ET_CLUSTER
			yyval3: ET_CLUSTERS
		do
			inspect yy_act
when 1 then
--|#line 45
			yyval := yyval_default;
last_universe := new_universe (yytype3 (yyvs.item (yyvsp - 2))) 

when 18 then
--|#line 82

yyval3 := yytype3 (yyvs.item (yyvsp)) 
			yyval := yyval3
when 19 then
--|#line 86

yyval3 := new_clusters (yytype2 (yyvs.item (yyvsp - 1))) 
			yyval := yyval3
when 20 then
--|#line 88

yyval3 := yytype3 (yyvs.item (yyvsp)); yyval3.put_first (yytype2 (yyvs.item (yyvsp - 2))) 
			yyval := yyval3
when 21 then
--|#line 92

yyval2 := new_cluster (yytype1 (yyvs.item (yyvsp - 3)), yytype1 (yyvs.item (yyvsp - 1))) 
			yyval := yyval2
when 50 then
--|#line 152

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 51 then
--|#line 154

yyval1 := yytype1 (yyvs.item (yyvsp)) 
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
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   13,   14,    2,    2,   17,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   15,   16,
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
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   22,   23,   23,   24,   24,   25,   25,   25,   27,
			   27,   28,   29,   29,   30,   30,   20,   20,   20,   19,
			   19,   18,   31,   31,   32,   32,   33,   33,   33,   34,
			   34,   35,   38,   38,   36,   36,   37,   37,   26,   26,
			   26,   39,   39,   40,   43,   43,   41,   41,   42,   42,
			   21,   21>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   10,    0,    3,    0,    2,    0,    1,    2,    2,
			    3,    4,    0,    1,    0,    1,    0,    1,    2,    2,
			    3,    4,    0,    1,    0,    1,    0,    2,    3,    2,
			    3,    6,    1,    3,    0,    1,    0,    1,    0,    1,
			    2,    2,    3,    3,    1,    3,    0,    1,    0,    1,
			    1,    1>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    0,   51,   50,    0,    0,    2,    0,    4,    0,
			    0,    6,    3,    5,    7,   16,    0,    8,   14,   17,
			   38,    0,   15,    9,    0,   24,   18,    0,   39,    0,
			    0,   10,   25,   19,    0,    0,    0,   40,   48,    1,
			   11,   20,   26,    0,   49,   41,    0,    0,   21,   44,
			   43,   42,   27,    0,    0,   36,    0,    0,   28,   37,
			   29,    0,   45,    0,   30,    0,    0,   32,   31,    0,
			   33,    0,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   25,   26,   20,   16,   71,    8,   11,   15,   29,   17,
			   18,   23,   24,   33,   34,   48,   54,   55,   60,   61,
			   68,   37,   38,   45,   46,   50>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   55,    4, -32768, -32768,   53,    4,   41,    4,   38,   37,
			    4,   45, -32768, -32768,    4,   44,   36, -32768,   -3,    4,
			   40,    4,   20, -32768,    4,    3, -32768,   29,    4,   35,
			   33, -32768,   24, -32768,    4,    4,   26, -32768,    5, -32768,
			 -32768, -32768,   34,    4,   32, -32768,    4,   12, -32768, -32768,
			   22, -32768, -32768,   25,   31,   -4,    4,    4, -32768,   30,
			 -32768,    4, -32768,   17, -32768,    9,    4, -32768,   13,    4,
			 -32768,   16,    7, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768,   28, -32768,   -1, -32768, -32768, -32768, -32768, -32768,   39,
			 -32768, -32768, -32768, -32768, -32768, -32768,   -2, -32768, -32768, -32768,
			 -32768,   15, -32768, -32768, -32768, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    4,  -34,  -12,  -12,    6,  -12,    9,   73,  -22,   13,
			  -46,  -22,   59,   22,    3,    2,   72,   52,   27,   32,
			   30,   44,    3,    2,   66,  -13,  -13,   36,  -13,  -23,
			   69,   65,  -23,   27,   42,  -35,   58,  -47,   57,   56,
			   39,   43,   49,   47,   35,   36,   53,   40,   28,   21,
			   19,   12,   14,   10,    7,   62,   63,    5,    1,   64,
			   53,   51,   41,   31,    0,   67,    0,    0,   70>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    1,    5,    5,    6,    5,    8,    7,    0,    5,   10,
			    5,    8,   16,   16,   10,   11,    0,    5,   19,   16,
			   21,   16,   10,   11,   15,    5,    6,   28,    8,    5,
			   17,   14,    8,   34,   35,    5,    5,    5,   13,   17,
			    5,   15,   43,    9,   15,   46,   47,   14,    8,   13,
			    6,   14,    7,   15,   13,   56,   57,    4,    3,   61,
			   61,   46,   34,   24,   -1,   66,   -1,   -1,   69>>)
		end

feature {NONE} -- Conversion

	yytype1 (v: ANY): ET_IDENTIFIER is
		require
			valid_type: yyis_type1 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type1 (v: ANY): BOOLEAN is
		local
			u: ET_IDENTIFIER
		do
			u ?= v
			Result := (u = v)
		end

	yytype2 (v: ANY): ET_CLUSTER is
		require
			valid_type: yyis_type2 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: ET_CLUSTER
		do
			u ?= v
			Result := (u = v)
		end

	yytype3 (v: ANY): ET_CLUSTERS is
		require
			valid_type: yyis_type3 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type3 (v: ANY): BOOLEAN is
		local
			u: ET_CLUSTERS
		do
			u ?= v
			Result := (u = v)
		end


feature {NONE} -- Constants

	yyFinal: INTEGER is 73
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 18
			-- Number of tokens

	yyLast: INTEGER is 68
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 267
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 44
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class ET_LACE_PARSER
