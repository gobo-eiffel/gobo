indexing

	description:

		"Test config parsers"

	library:    "Gobo Eiffel Test Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class TS_CONFIG_PARSER

inherit

	TS_CONFIG_PARSER_SKELETON

	TS_CONFIG_SCANNER
		rename
			make as make_config_scanner
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
			yyval2: TS_CLUSTER
			yyval3: DS_ARRAYED_LIST [TS_CLUSTER]
		do
			inspect yy_act
when 1 then
--|#line 47
			yyval := yyval_default;
last_config := new_config (yytype1 (yyvs.item (yyvsp - 4)).name, testgen, compile, execute, yytype3 (yyvs.item (yyvsp - 1))) 

when 2 then
--|#line 47
			yyval := yyval_default;
set_defaults (yytype1 (yyvs.item (yyvsp - 1)).name) 

when 8 then
--|#line 62
			yyval := yyval_default;
class_regexp := new_regexp (yytype1 (yyvs.item (yyvsp - 1))) 

when 9 then
--|#line 64
			yyval := yyval_default;
feature_regexp := new_regexp (yytype1 (yyvs.item (yyvsp - 1))) 

when 10 then
--|#line 66
			yyval := yyval_default;
class_prefix := yytype1 (yyvs.item (yyvsp - 1)).name 

when 11 then
--|#line 68
			yyval := yyval_default;
compile := yytype1 (yyvs.item (yyvsp - 1)).name 

when 12 then
--|#line 70
			yyval := yyval_default;
execute := yytype1 (yyvs.item (yyvsp - 1)).name 

when 13 then
--|#line 72
			yyval := yyval_default;
testgen := yytype1 (yyvs.item (yyvsp - 1)).name 

when 14 then
--|#line 76

			!DS_ARRAYED_LIST [TS_CLUSTER]! yyval3.make (1)
			yyval3.put_last (default_cluster)
		
			yyval := yyval3
when 15 then
--|#line 81

			!DS_ARRAYED_LIST [TS_CLUSTER]! yyval3.make (1)
			yyval3.put_last (default_cluster)
		
			yyval := yyval3
when 16 then
--|#line 86

yyval3 := yytype3 (yyvs.item (yyvsp)) 
			yyval := yyval3
when 17 then
--|#line 90

			!DS_ARRAYED_LIST [TS_CLUSTER]! yyval3.make (5)
			yyval3.put_last (yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 18 then
--|#line 95

yyval3 := yytype3 (yyvs.item (yyvsp - 1)); yyval3.force_last (yytype2 (yyvs.item (yyvsp))) 
			yyval := yyval3
when 19 then
--|#line 99

yyval2 := new_cluster (yytype1 (yyvs.item (yyvsp - 2)), yytype1 (yyvs.item (yyvsp))) 
			yyval := yyval2
when 20 then
--|#line 103

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 21 then
--|#line 105

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
			   16,   17,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   18,    2,
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
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   23,   25,   24,   24,   24,   26,   26,   27,   27,
			   27,   27,   27,   27,   21,   21,   21,   20,   20,   19,
			   22,   22>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    6,    0,    0,    1,    2,    1,    2,    4,    4,
			    4,    4,    4,    4,    0,    1,    2,    1,    2,    3,
			    1,    1>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    0,   21,   20,    3,    4,    2,    0,    0,    0,
			    0,    0,    0,    5,    6,   14,    0,    0,    0,    0,
			    0,    0,    7,   15,    0,    0,    0,    0,    0,    0,
			    0,   17,   16,    0,    1,   13,   10,    9,   12,   11,
			    8,   18,    0,   19,    0,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   31,   32,   24,   33,   44,    6,   15,   13,   14>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   22,  -10, -32768, -32768,   26,   -2, -32768,   15,   14,   13,
			   12,   11,   10,   -2, -32768,   21,  -10,  -10,  -10,  -10,
			  -10,  -10, -32768,  -10,   17,    6,    5,    4,   -3,   -4,
			   -5, -32768,  -10,   -7, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  -10, -32768,    9,    2, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    3, -32768, -32768,   -1, -32768, -32768, -32768, -32768,   23>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    4,   12,   46,   11,    3,    2,   10,    9,    8,   45,
			    7,   42,   40,   39,   38,   25,   26,   27,   28,   29,
			   30,   37,   36,   35,   34,   23,   21,   20,   19,   18,
			   17,   16,    5,    1,    0,   41,   22,    0,    0,    0,
			    0,   43>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    1,    3,    0,    5,   14,   15,    8,    9,   10,    0,
			   12,   18,   17,   17,   17,   16,   17,   18,   19,   20,
			   21,   17,   17,   17,    7,    4,   16,   16,   16,   16,
			   16,   16,    6,   11,   -1,   32,   13,   -1,   -1,   -1,
			   -1,   42>>)
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

	yytype2 (v: ANY): TS_CLUSTER is
		require
			valid_type: yyis_type2 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: TS_CLUSTER
		do
			u ?= v
			Result := (u = v)
		end

	yytype3 (v: ANY): DS_ARRAYED_LIST [TS_CLUSTER] is
		require
			valid_type: yyis_type3 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type3 (v: ANY): BOOLEAN is
		local
			u: DS_ARRAYED_LIST [TS_CLUSTER]
		do
			u ?= v
			Result := (u = v)
		end


feature {NONE} -- Constants

	yyFinal: INTEGER is 46
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 19
			-- Number of tokens

	yyLast: INTEGER is 41
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 270
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 28
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class TS_CONFIG_PARSER
