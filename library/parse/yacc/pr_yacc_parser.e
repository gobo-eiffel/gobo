indexing

	description:

		"Parsers for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
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
--|#line 50
			yyval := yyval_default;
			if successful then
				set_start_symbol
				process_symbols
			end
		

when 2 then
--|#line 50
			yyval := yyval_default;
			initialize_grammar
		

when 3 then
--|#line 63
			yyval := yyval_default;
			precedence := 1
		

when 5 then
--|#line 70
			yyval := yyval_default;
			last_grammar.eiffel_header.force_last (yytype1 (yyvs.item (yyvsp)))
		

when 6 then
--|#line 74
			yyval := yyval_default;
			type := Void
		

when 7 then
--|#line 78
			yyval := yyval_default;
			type := Void
		

when 8 then
--|#line 82
			yyval := yyval_default;
			precedence := precedence + 1
		

when 9 then
--|#line 86
			yyval := yyval_default;
			precedence := precedence + 1
		

when 10 then
--|#line 90
			yyval := yyval_default;
			precedence := precedence + 1
		

when 11 then
--|#line 94
			yyval := yyval_default;
			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				!! start_symbol.make (yytype1 (yyvs.item (yyvsp)), line_nb)
			end
		

when 12 then
--|#line 102
			yyval := yyval_default;
			last_grammar.set_expected_conflicts (yytype2 (yyvs.item (yyvsp)))
		

when 13 then
--|#line 108
			yyval := yyval_default;
			type := No_type
		

when 14 then
--|#line 112
			yyval := yyval_default;
			type := yytype4 (yyvs.item (yyvsp - 1))
		

when 15 then
--|#line 118

			yyval4 := new_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 16 then
--|#line 122

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 17 then
--|#line 126

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 18 then
--|#line 130

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 19 then
--|#line 134

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 20 then
--|#line 138

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 21 then
--|#line 142

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 22 then
--|#line 146

			yyval4 := new_generic_type (yytype1 (yyvs.item (yyvsp - 1)), yytype5 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 23 then
--|#line 152

			yyval5 := yytype5 (yyvs.item (yyvsp - 1))
		
			yyval := yyval5
when 24 then
--|#line 158

			yyval5 := Void
		
			yyval := yyval5
when 25 then
--|#line 162

			!! yyval5.make (5)
			yyval5.force_last (yytype4 (yyvs.item (yyvsp)))
		
			yyval := yyval5
when 26 then
--|#line 167

			yyval5 := yytype5 (yyvs.item (yyvsp - 2))
			yyval5.force_last (yytype4 (yyvs.item (yyvsp)))
		
			yyval := yyval5
when 31 then
--|#line 180
			yyval := yyval_default;
			(yytype3 (yyvs.item (yyvsp - 1))).set_token_id (yytype2 (yyvs.item (yyvsp)))
		

when 32 then
--|#line 186

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp)), type)
		
			yyval := yyval3
when 33 then
--|#line 190

			yyval3 := new_char_terminal (yytype1 (yyvs.item (yyvsp)), type)
		
			yyval := yyval3
when 38 then
--|#line 202
			yyval := yyval_default;
			(yytype3 (yyvs.item (yyvsp - 1))).set_token_id (yytype2 (yyvs.item (yyvsp)))
		

when 39 then
--|#line 208

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 40 then
--|#line 212

			yyval3 := new_left_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 45 then
--|#line 224
			yyval := yyval_default;
			(yytype3 (yyvs.item (yyvsp - 1))).set_token_id (yytype2 (yyvs.item (yyvsp)))
		

when 46 then
--|#line 230

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 47 then
--|#line 234

			yyval3 := new_right_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 52 then
--|#line 246
			yyval := yyval_default;
			(yytype3 (yyvs.item (yyvsp - 1))).set_token_id (yytype2 (yyvs.item (yyvsp)))
		

when 53 then
--|#line 252

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 54 then
--|#line 256

			yyval3 := new_nonassoc_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 58 then
--|#line 267
			yyval := yyval_default;
			yyval := new_nonterminal (yytype1 (yyvs.item (yyvsp)), type)
		

when 59 then
--|#line 273
			yyval := yyval_default;
			report_no_rules_error
		

when 62 then
--|#line 281
			yyval := yyval_default;
			process_rule (rule)
			rule := Void
			precedence_token := Void
		

when 63 then
--|#line 289
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
		

when 64 then
--|#line 305
			yyval := yyval_default;
			rule.set_line_nb (yytype2 (yyvs.item (yyvsp)))
		

when 68 then
--|#line 316
			yyval := yyval_default;
			put_symbol (new_symbol (yytype1 (yyvs.item (yyvsp))), rule)
		

when 69 then
--|#line 320
			yyval := yyval_default;
			put_symbol (new_char_token (yytype1 (yyvs.item (yyvsp))), rule)
		

when 70 then
--|#line 324
			yyval := yyval_default;
			put_action (new_action (yytype1 (yyvs.item (yyvsp))), rule)
		

when 71 then
--|#line 328
			yyval := yyval_default;
			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := yytype3 (yyvs.item (yyvsp))
			end
		

when 72 then
--|#line 338

			if is_terminal (yytype1 (yyvs.item (yyvsp))) then
				yyval3 := new_token (yytype1 (yyvs.item (yyvsp)))
			else
				report_prec_not_token_error (yytype1 (yyvs.item (yyvsp)))
				yyval3 := new_char_token ("'a'")
			end
		
			yyval := yyval3
when 73 then
--|#line 347

			yyval3 := new_char_token (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 74 then
--|#line 353
			yyval := yyval_default;
			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb (yytype2 (yyvs.item (yyvsp)))
			put_rule (rule)
		

when 77 then
--|#line 365
			yyval := yyval_default;
			last_grammar.set_eiffel_code (yytype1 (yyvs.item (yyvsp)))
		

when 78 then
--|#line 371

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 79 then
--|#line 373

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 80 then
--|#line 375

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 81 then
--|#line 377

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 82 then
--|#line 379

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 83 then
--|#line 381

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 84 then
--|#line 383

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
			    2,    2,    2,    2,   31,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   26,   32,
			   27,    2,   28,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   29,    2,   30,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   25,    2,    2,    2,    2,    2,
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
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   42,   44,   43,   43,   47,   47,   47,   47,   47,
			   47,   47,   47,   48,   48,   39,   39,   39,   39,   39,
			   39,   39,   39,   41,   40,   40,   40,   49,   49,   49,
			   54,   54,   35,   35,   51,   51,   51,   55,   55,   36,
			   36,   52,   52,   52,   56,   56,   37,   37,   53,   53,
			   53,   57,   57,   38,   38,   50,   50,   50,   58,   45,
			   45,   45,   59,   60,   61,   62,   62,   63,   63,   63,
			   63,   63,   34,   34,   64,   46,   46,   46,   33,   33,
			   33,   33,   33,   33,   33>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    5,    0,    0,    2,    1,    3,    3,    2,    2,
			    2,    2,    2,    0,    3,    1,    1,    1,    1,    1,
			    1,    1,    2,    3,    0,    1,    3,    0,    2,    3,
			    1,    2,    1,    1,    0,    2,    3,    1,    2,    1,
			    1,    0,    2,    3,    1,    2,    1,    1,    0,    2,
			    3,    1,    2,    1,    1,    0,    2,    3,    1,    0,
			    1,    2,    4,    1,    1,    1,    3,    0,    2,    2,
			    2,    3,    1,    1,    1,    0,    1,    2,    1,    1,
			    1,    1,    1,    1,    1>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    3,    0,    5,   59,   13,    0,    0,   48,   41,
			   34,   13,    4,   84,   83,   82,   81,   80,   79,   78,
			   63,   75,   60,    0,    0,   55,   11,   12,   10,    9,
			    8,   27,   76,    1,   61,   64,   67,   21,   20,   19,
			   18,   17,   16,   15,    0,    7,    0,   54,   53,   51,
			   49,    0,   47,   46,   44,   42,    0,   40,   39,   37,
			   35,    6,   77,    0,   65,   24,   22,   14,    0,   58,
			   56,   50,   52,   43,   45,   36,   38,    0,   33,   32,
			   30,   28,   62,   74,   67,   69,   70,    0,   68,   25,
			    0,   57,   29,   31,   66,   73,   72,   71,    0,   23,

			   26,    0,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   20,   97,   80,   59,   54,   49,   44,   90,   66,  101,
			    2,    1,   21,   33,   12,   25,   61,   45,   30,   29,
			   28,   81,   60,   55,   50,   70,   22,   23,   36,   63,
			   64,   84>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768,   69, -32768,  188,    9,  188,   17, -32768, -32768,
			 -32768,    9, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  118, -32768,    6,  178, -32768, -32768, -32768,   87,   72,
			   46, -32768,    4, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768,  -11,    3,    7,  168, -32768, -32768,   -7,
			 -32768,  158, -32768, -32768,   -8, -32768,  148, -32768, -32768,   -9,
			 -32768,  -12, -32768,   10,  105,  178, -32768, -32768,  188, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  138, -32768, -32768,
			  -10, -32768, -32768, -32768, -32768, -32768, -32768,  128, -32768, -32768,
			  -27, -32768, -32768, -32768,  105, -32768, -32768, -32768,  178, -32768,

			 -32768,   13,   12, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   -6, -32768, -32768, -32768, -32768, -32768,  -64, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   37, -32768, -32768, -32768, -32768,
			 -32768,  -30,   -4,   -5,   -2,  -25,   16, -32768, -32768, -32768,
			  -51, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   26,   89,   19,   99,   98,   78,   18,   17,   16,   15,
			   14,   13,  103,  102,   93,   76,   74,   72,   65,   77,
			   62,   19,   48,   53,   58,   18,   17,   16,   15,   14,
			   13,   67,   35,   94,  100,   83,   24,   34,   68,   69,
			   48,   27,   82,   91,   71,   53,   73,   92,   31,    0,
			   58,    0,   75,    0,    0,   79,    0,    0,   88,    0,
			   19,    0,   69,   57,   18,   17,   16,   15,   14,   13,
			    0,   79,   11,   10,    9,    8,    7,   56,    6,    5,
			    4,   96,    3,    0,    0,    0,   19,    0,   88,   52,
			   18,   17,   16,   15,   14,   13,    0,    0,    0,    0,

			    0,   19,    0,   51,   47,   18,   17,   16,   15,   14,
			   13,    0,    0,   87,    0,    0,    0,    0,   46,   19,
			   86,    0,   85,   18,   17,   16,   15,   14,   13,   32,
			    0,    0,   19,    0,    0,    0,   18,   17,   16,   15,
			   14,   13,   19,    0,    0,   95,   18,   17,   16,   15,
			   14,   13,   19,    0,    0,   78,   18,   17,   16,   15,
			   14,   13,   19,    0,    0,   57,   18,   17,   16,   15,
			   14,   13,   19,    0,    0,   52,   18,   17,   16,   15,
			   14,   13,   19,    0,    0,   47,   18,   17,   16,   15,
			   14,   13,   43,    0,    0,    0,   42,   41,   40,   39,

			   38,   37,   19,    0,    0,    0,   18,   17,   16,   15,
			   14,   13>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    6,   65,   14,   30,   31,   17,   18,   19,   20,   21,
			   22,   23,    0,    0,   24,   24,   24,   24,   29,   31,
			   16,   14,   28,   29,   30,   18,   19,   20,   21,   22,
			   23,   28,   26,   84,   98,   25,   27,   21,   31,   45,
			   46,   24,   32,   68,   46,   51,   51,   77,   11,    0,
			   56,    0,   56,    0,    0,   61,    0,    0,   64,    0,
			   14,    0,   68,   17,   18,   19,   20,   21,   22,   23,
			    0,   77,    3,    4,    5,    6,    7,   31,    9,   10,
			   11,   87,   13,    0,    0,    0,   14,    0,   94,   17,
			   18,   19,   20,   21,   22,   23,    0,    0,    0,    0,

			    0,   14,    0,   31,   17,   18,   19,   20,   21,   22,
			   23,    0,    0,    8,    0,    0,    0,    0,   31,   14,
			   15,    0,   17,   18,   19,   20,   21,   22,   23,   11,
			    0,    0,   14,    0,    0,    0,   18,   19,   20,   21,
			   22,   23,   14,    0,    0,   17,   18,   19,   20,   21,
			   22,   23,   14,    0,    0,   17,   18,   19,   20,   21,
			   22,   23,   14,    0,    0,   17,   18,   19,   20,   21,
			   22,   23,   14,    0,    0,   17,   18,   19,   20,   21,
			   22,   23,   14,    0,    0,   17,   18,   19,   20,   21,
			   22,   23,   14,    0,    0,    0,   18,   19,   20,   21,

			   22,   23,   14,    0,    0,    0,   18,   19,   20,   21,
			   22,   23>>)
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

	yyFinal: INTEGER is 103
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 33
			-- Number of tokens

	yyLast: INTEGER is 211
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 279
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 65
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class PR_YACC_PARSER
