indexing

	description:

		"Parsers for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class PR_YACC_PARSER

inherit

	PR_YACC_PARSER_SKELETON

	PR_YACC_SCANNER
		rename
			make as make_yacc_scanner,
			reset as reset_yacc_scanner
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
			yyval1: STRING
			yyval2: INTEGER
			yyval3: PR_TOKEN
			yyval4: PR_TYPE
			yyval5: DS_ARRAYED_LIST [PR_TYPE]
		do
			inspect yy_act
when 1 then
--|#line 51
			yyval := yyval_default;
			if successful then
				set_start_symbol
				process_symbols
			end
		

when 2 then
--|#line 51
			yyval := yyval_default;
			initialize_grammar
		

when 3 then
--|#line 64
			yyval := yyval_default;
			precedence := 1
		

when 5 then
--|#line 71
			yyval := yyval_default;
			last_grammar.eiffel_header.force_last (yytype1 (yyvs.item (yyvsp)))
		

when 6 then
--|#line 75
			yyval := yyval_default;
			type := Void
		

when 7 then
--|#line 79
			yyval := yyval_default;
			type := Void
		

when 8 then
--|#line 83
			yyval := yyval_default;
			precedence := precedence + 1
		

when 9 then
--|#line 87
			yyval := yyval_default;
			precedence := precedence + 1
		

when 10 then
--|#line 91
			yyval := yyval_default;
			precedence := precedence + 1
		

when 11 then
--|#line 95
			yyval := yyval_default;
			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				!! start_symbol.make (yytype1 (yyvs.item (yyvsp)), line_nb)
			end
		

when 12 then
--|#line 103
			yyval := yyval_default;
			last_grammar.set_expected_conflicts (yytype2 (yyvs.item (yyvsp)))
		

when 13 then
--|#line 109
			yyval := yyval_default;
			type := No_type
		

when 14 then
--|#line 113
			yyval := yyval_default;
			type := yytype4 (yyvs.item (yyvsp - 1))
		

when 15 then
--|#line 119

			yyval4 := new_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 16 then
--|#line 123

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 17 then
--|#line 127

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 18 then
--|#line 131

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 19 then
--|#line 135

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 20 then
--|#line 139

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 21 then
--|#line 143

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 22 then
--|#line 147

			yyval4 := new_generic_type (yytype1 (yyvs.item (yyvsp - 1)), yytype5 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 23 then
--|#line 153

			yyval5 := yytype5 (yyvs.item (yyvsp - 1))
		
			yyval := yyval5
when 24 then
--|#line 159

			yyval5 := Void
		
			yyval := yyval5
when 25 then
--|#line 163

			!! yyval5.make (5)
			yyval5.force_last (yytype4 (yyvs.item (yyvsp)))
		
			yyval := yyval5
when 26 then
--|#line 168

			yyval5 := yytype5 (yyvs.item (yyvsp - 2))
			yyval5.force_last (yytype4 (yyvs.item (yyvsp)))
		
			yyval := yyval5
when 30 then
--|#line 180

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp)), type)
		
			yyval := yyval3
when 31 then
--|#line 184

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp - 1)), type)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 32 then
--|#line 189

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp - 1)), type)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 33 then
--|#line 194

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp - 2)), type)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 34 then
--|#line 200

			yyval3 := new_char_terminal (yytype1 (yyvs.item (yyvsp)), type)
		
			yyval := yyval3
when 38 then
--|#line 211

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 39 then
--|#line 215

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 40 then
--|#line 220

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 41 then
--|#line 225

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp - 2)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 42 then
--|#line 231

			yyval3 := new_left_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 46 then
--|#line 242

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 47 then
--|#line 246

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 48 then
--|#line 251

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 49 then
--|#line 256

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp - 2)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 50 then
--|#line 262

			yyval3 := new_right_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 54 then
--|#line 273

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 55 then
--|#line 277

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 56 then
--|#line 282

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 57 then
--|#line 287

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp - 2)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 58 then
--|#line 293

			yyval3 := new_nonassoc_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 62 then
--|#line 304
			yyval := yyval_default;
			yyval := new_nonterminal (yytype1 (yyvs.item (yyvsp)), type)
		

when 63 then
--|#line 310
			yyval := yyval_default;
			report_no_rules_error
		

when 66 then
--|#line 318
			yyval := yyval_default;
			process_rule (rule)
			rule := Void
			precedence_token := Void
		

when 67 then
--|#line 326
			yyval := yyval_default;
			if is_terminal (yytype1 (yyvs.item (yyvsp))) then
				report_lhs_symbol_token_error (yytype1 (yyvs.item (yyvsp)))
				rule := new_rule (new_dummy_variable)
			else
				rule := new_rule (new_variable (yytype1 (yyvs.item (yyvsp))))
				if rule.lhs.rules.count > 1 then
					report_rule_declared_twice_warning (yytype1 (yyvs.item (yyvsp)))
				end
			end
			precedence_token := Void
			put_rule (rule)
		

when 68 then
--|#line 342
			yyval := yyval_default;
			rule.set_line_nb (yytype2 (yyvs.item (yyvsp)))
		

when 72 then
--|#line 353
			yyval := yyval_default;
			put_symbol (new_symbol (yytype1 (yyvs.item (yyvsp))), rule)
		

when 73 then
--|#line 357
			yyval := yyval_default;
			put_symbol (new_char_token (yytype1 (yyvs.item (yyvsp))), rule)
		

when 74 then
--|#line 361
			yyval := yyval_default;
			put_symbol (new_string_token (yytype1 (yyvs.item (yyvsp))), rule)
		

when 75 then
--|#line 365
			yyval := yyval_default;
			put_action (new_action (yytype1 (yyvs.item (yyvsp))), rule)
		

when 76 then
--|#line 369
			yyval := yyval_default;
			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := yytype3 (yyvs.item (yyvsp))
			end
		

when 77 then
--|#line 379

			if is_terminal (yytype1 (yyvs.item (yyvsp))) then
				yyval3 := new_token (yytype1 (yyvs.item (yyvsp)))
			else
				report_prec_not_token_error (yytype1 (yyvs.item (yyvsp)))
				yyval3 := new_char_token ("'a'")
			end
		
			yyval := yyval3
when 78 then
--|#line 388

			yyval3 := new_char_token (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 79 then
--|#line 394
			yyval := yyval_default;
			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb (yytype2 (yyvs.item (yyvsp)))
			put_rule (rule)
		

when 82 then
--|#line 406
			yyval := yyval_default;
			last_grammar.set_eiffel_code (yytype1 (yyvs.item (yyvsp)))
		

when 83 then
--|#line 412

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 84 then
--|#line 414

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 85 then
--|#line 416

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 86 then
--|#line 418

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 87 then
--|#line 420

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 88 then
--|#line 422

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 89 then
--|#line 424

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
			    2,    2,    2,    2,   32,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   27,   33,
			   28,    2,   29,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   30,    2,   31,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   26,    2,    2,    2,    2,    2,
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
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   43,   45,   44,   44,   48,   48,   48,   48,   48,
			   48,   48,   48,   49,   49,   40,   40,   40,   40,   40,
			   40,   40,   40,   42,   41,   41,   41,   50,   50,   50,
			   36,   36,   36,   36,   36,   52,   52,   52,   37,   37,
			   37,   37,   37,   53,   53,   53,   38,   38,   38,   38,
			   38,   54,   54,   54,   39,   39,   39,   39,   39,   51,
			   51,   51,   55,   46,   46,   46,   56,   57,   58,   59,
			   59,   60,   60,   60,   60,   60,   60,   35,   35,   61,
			   47,   47,   47,   34,   34,   34,   34,   34,   34,   34>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    5,    0,    0,    2,    1,    3,    3,    2,    2,
			    2,    2,    2,    0,    3,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    0,    1,    3,    0,    2,    3,
			    1,    2,    2,    3,    1,    0,    2,    3,    1,    2,
			    2,    3,    1,    0,    2,    3,    1,    2,    2,    3,
			    1,    0,    2,    3,    1,    2,    2,    3,    1,    0,
			    2,    3,    1,    0,    1,    2,    4,    1,    1,    1,
			    3,    0,    2,    2,    2,    2,    3,    1,    1,    1,
			    0,    1,    2,    1,    1,    1,    1,    1,    1,    1>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    3,    0,    5,   63,   13,    0,    0,   51,   43,
			   35,   13,    4,   89,   88,   87,   86,   85,   84,   83,
			   67,   80,   64,    0,    0,   59,   11,   12,   10,    9,
			    8,   27,   81,    1,   65,   68,   71,   21,   20,   19,
			   18,   17,   16,   15,    0,    7,    0,   58,   54,   52,
			    0,   50,   46,   44,    0,   42,   38,   36,    6,   82,
			    0,   69,   24,   22,   14,    0,   62,   60,   53,   55,
			   56,   45,   47,   48,   37,   39,   40,    0,   34,   30,
			   28,   66,   79,   71,   74,   73,   75,    0,   72,   25,
			    0,   61,   57,   49,   41,   29,   31,   32,   70,   78,

			   77,   76,    0,   23,   33,   26,    0,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   20,  101,   80,   57,   53,   49,   44,   90,   63,  106,
			    2,    1,   21,   33,   12,   25,   58,   45,   30,   29,
			   28,   67,   22,   23,   36,   60,   61,   83>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  132, -32768,  196,   22,  196,   26, -32768, -32768,
			 -32768,   22, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  110, -32768,   19,  185, -32768, -32768, -32768,   63,   43,
			   11, -32768,   13, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,   17,    8,   77,  174, -32768,   24, -32768,
			  163, -32768,   20, -32768,  152, -32768,    1, -32768,  -12, -32768,
			  -20,   96,  185, -32768, -32768,  196, -32768, -32768, -32768,   18,
			 -32768, -32768,    9, -32768, -32768,    0, -32768,  141, -32768,   -4,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  130, -32768, -32768,
			  -28, -32768, -32768, -32768, -32768, -32768,   -1, -32768,   96, -32768,

			 -32768, -32768,  185, -32768, -32768, -32768,   16,   15, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   -6, -32768,   -7,    7,   28,   23,  -61, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   47, -32768, -32768, -32768, -32768,
			 -32768,   -9,   33, -32768, -32768, -32768,  -30, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   26,   89,   19,  103,  102,   78,   82,   18,   17,   16,
			   15,   14,   13,   81,   97,  108,  107,  104,   94,   76,
			   77,   96,   48,   52,   56,   19,   75,   93,   55,   59,
			   18,   17,   16,   15,   14,   13,   92,   64,   73,   66,
			   48,  105,   70,   54,   52,   72,   35,   62,   56,   69,
			   24,   27,   79,   98,   34,   88,   91,   19,   31,   66,
			   51,   74,   18,   17,   16,   15,   14,   13,    0,   68,
			   95,   79,    0,    0,    0,   50,    0,   19,   71,    0,
			   47,  100,   18,   17,   16,   15,   14,   13,    0,    0,
			    0,   19,   88,    0,    0,   46,   18,   17,   16,   15,

			   14,   13,    0,    0,   87,    0,    0,    0,    0,   65,
			   19,   86,    0,   85,   84,   18,   17,   16,   15,   14,
			   13,   32,    0,    0,   19,    0,    0,    0,    0,   18,
			   17,   16,   15,   14,   13,   11,   10,    9,    8,    7,
			    0,    6,    5,    4,   19,    3,    0,   99,    0,   18,
			   17,   16,   15,   14,   13,   19,    0,    0,   78,    0,
			   18,   17,   16,   15,   14,   13,   19,    0,    0,   55,
			    0,   18,   17,   16,   15,   14,   13,   19,    0,    0,
			   51,    0,   18,   17,   16,   15,   14,   13,   19,    0,
			    0,   47,    0,   18,   17,   16,   15,   14,   13,   43,

			    0,    0,    0,    0,   42,   41,   40,   39,   38,   37,
			   19,    0,    0,    0,    0,   18,   17,   16,   15,   14,
			   13>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    6,   62,   14,   31,   32,   17,   26,   19,   20,   21,
			   22,   23,   24,   33,   18,    0,    0,   18,   18,   18,
			   32,   25,   28,   29,   30,   14,   25,   18,   17,   16,
			   19,   20,   21,   22,   23,   24,   18,   29,   18,   45,
			   46,  102,   18,   32,   50,   25,   27,   30,   54,   25,
			   28,   25,   58,   83,   21,   61,   65,   14,   11,   65,
			   17,   54,   19,   20,   21,   22,   23,   24,   -1,   46,
			   77,   77,   -1,   -1,   -1,   32,   -1,   14,   50,   -1,
			   17,   87,   19,   20,   21,   22,   23,   24,   -1,   -1,
			   -1,   14,   98,   -1,   -1,   32,   19,   20,   21,   22,

			   23,   24,   -1,   -1,    8,   -1,   -1,   -1,   -1,   32,
			   14,   15,   -1,   17,   18,   19,   20,   21,   22,   23,
			   24,   11,   -1,   -1,   14,   -1,   -1,   -1,   -1,   19,
			   20,   21,   22,   23,   24,    3,    4,    5,    6,    7,
			   -1,    9,   10,   11,   14,   13,   -1,   17,   -1,   19,
			   20,   21,   22,   23,   24,   14,   -1,   -1,   17,   -1,
			   19,   20,   21,   22,   23,   24,   14,   -1,   -1,   17,
			   -1,   19,   20,   21,   22,   23,   24,   14,   -1,   -1,
			   17,   -1,   19,   20,   21,   22,   23,   24,   14,   -1,
			   -1,   17,   -1,   19,   20,   21,   22,   23,   24,   14,

			   -1,   -1,   -1,   -1,   19,   20,   21,   22,   23,   24,
			   14,   -1,   -1,   -1,   -1,   19,   20,   21,   22,   23,
			   24>>)
		end

feature {NONE} -- Conversion

	yytype1 (v: ANY): STRING is
		require
			valid_type: yyis_type1 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type1 (v: ANY): BOOLEAN is
		local
			u: STRING
		do
			u ?= v
			Result := (u = v)
		end

	yytype2 (v: ANY): INTEGER is
		require
			valid_type: yyis_type2 (v)
		local
			ref: INTEGER_REF
		do
			ref ?= v
			Result := ref.item
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: INTEGER_REF
		do
			u ?= v
			Result := (u = v)
		end

	yytype3 (v: ANY): PR_TOKEN is
		require
			valid_type: yyis_type3 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type3 (v: ANY): BOOLEAN is
		local
			u: PR_TOKEN
		do
			u ?= v
			Result := (u = v)
		end

	yytype4 (v: ANY): PR_TYPE is
		require
			valid_type: yyis_type4 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type4 (v: ANY): BOOLEAN is
		local
			u: PR_TYPE
		do
			u ?= v
			Result := (u = v)
		end

	yytype5 (v: ANY): DS_ARRAYED_LIST [PR_TYPE] is
		require
			valid_type: yyis_type5 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type5 (v: ANY): BOOLEAN is
		local
			u: DS_ARRAYED_LIST [PR_TYPE]
		do
			u ?= v
			Result := (u = v)
		end


feature {NONE} -- Constants

	yyFinal: INTEGER is 108
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 34
			-- Number of tokens

	yyLast: INTEGER is 220
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 280
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 62
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class PR_YACC_PARSER
