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
--|#line 52
			yyval := yyval_default;
			if successful then
				set_start_symbol
				process_symbols
			end
		

when 2 then
--|#line 52
			yyval := yyval_default;
			initialize_grammar
		

when 3 then
--|#line 65
			yyval := yyval_default;
			precedence := 1
		

when 5 then
--|#line 72
			yyval := yyval_default;
			last_grammar.eiffel_header.force_last (yytype1 (yyvs.item (yyvsp)))
		

when 6 then
--|#line 76
			yyval := yyval_default;
			type := Void
		

when 7 then
--|#line 80
			yyval := yyval_default;
			type := Void
		

when 8 then
--|#line 84
			yyval := yyval_default;
			precedence := precedence + 1
		

when 9 then
--|#line 88
			yyval := yyval_default;
			precedence := precedence + 1
		

when 10 then
--|#line 92
			yyval := yyval_default;
			precedence := precedence + 1
		

when 11 then
--|#line 96
			yyval := yyval_default;
			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				!! start_symbol.make (yytype1 (yyvs.item (yyvsp)), line_nb)
			end
		

when 12 then
--|#line 104
			yyval := yyval_default;
			last_grammar.set_expected_conflicts (yytype2 (yyvs.item (yyvsp)))
		

when 13 then
--|#line 110
			yyval := yyval_default;
			type := No_type
		

when 14 then
--|#line 114
			yyval := yyval_default;
			type := yytype4 (yyvs.item (yyvsp - 1))
		

when 15 then
--|#line 120

			yyval4 := new_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 16 then
--|#line 124

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 17 then
--|#line 128

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 18 then
--|#line 132

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 19 then
--|#line 136

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 20 then
--|#line 140

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 21 then
--|#line 144

			yyval4 := new_basic_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 22 then
--|#line 148

			yyval4 := new_generic_type (yytype1 (yyvs.item (yyvsp - 1)), yytype5 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 23 then
--|#line 152

			yyval4 := new_anchored_type (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 24 then
--|#line 158

			yyval5 := yytype5 (yyvs.item (yyvsp - 1))
		
			yyval := yyval5
when 25 then
--|#line 164

			yyval5 := Void
		
			yyval := yyval5
when 26 then
--|#line 168

			!! yyval5.make (5)
			yyval5.force_last (yytype4 (yyvs.item (yyvsp)))
		
			yyval := yyval5
when 27 then
--|#line 173

			yyval5 := yytype5 (yyvs.item (yyvsp - 2))
			yyval5.force_last (yytype4 (yyvs.item (yyvsp)))
		
			yyval := yyval5
when 31 then
--|#line 185

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp)), type)
		
			yyval := yyval3
when 32 then
--|#line 189

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp - 1)), type)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 33 then
--|#line 194

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp - 1)), type)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 34 then
--|#line 199

			yyval3 := new_terminal (yytype1 (yyvs.item (yyvsp - 2)), type)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 35 then
--|#line 205

			yyval3 := new_char_terminal (yytype1 (yyvs.item (yyvsp)), type)
		
			yyval := yyval3
when 39 then
--|#line 216

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 40 then
--|#line 220

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 41 then
--|#line 225

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 42 then
--|#line 230

			yyval3 := new_left_terminal (yytype1 (yyvs.item (yyvsp - 2)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 43 then
--|#line 236

			yyval3 := new_left_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 47 then
--|#line 247

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 48 then
--|#line 251

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 49 then
--|#line 256

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 50 then
--|#line 261

			yyval3 := new_right_terminal (yytype1 (yyvs.item (yyvsp - 2)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 51 then
--|#line 267

			yyval3 := new_right_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 55 then
--|#line 278

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 56 then
--|#line 282

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 57 then
--|#line 287

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp - 1)), precedence)
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 58 then
--|#line 292

			yyval3 := new_nonassoc_terminal (yytype1 (yyvs.item (yyvsp - 2)), precedence)
			set_token_id (yyval3, yytype2 (yyvs.item (yyvsp - 1)))
			set_literal_string (yyval3, yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 59 then
--|#line 298

			yyval3 := new_nonassoc_char_terminal (yytype1 (yyvs.item (yyvsp)), precedence)
		
			yyval := yyval3
when 63 then
--|#line 309
			yyval := yyval_default;
			yyval := new_nonterminal (yytype1 (yyvs.item (yyvsp)), type)
		

when 64 then
--|#line 315
			yyval := yyval_default;
			report_no_rules_error
		

when 67 then
--|#line 323
			yyval := yyval_default;
			process_rule (rule)
			rule := Void
			precedence_token := Void
		

when 68 then
--|#line 331
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
		

when 69 then
--|#line 347
			yyval := yyval_default;
			rule.set_line_nb (yytype2 (yyvs.item (yyvsp)))
		

when 73 then
--|#line 358
			yyval := yyval_default;
			put_symbol (new_symbol (yytype1 (yyvs.item (yyvsp))), rule)
		

when 74 then
--|#line 362
			yyval := yyval_default;
			put_symbol (new_char_token (yytype1 (yyvs.item (yyvsp))), rule)
		

when 75 then
--|#line 366
			yyval := yyval_default;
			put_symbol (new_string_token (yytype1 (yyvs.item (yyvsp))), rule)
		

when 76 then
--|#line 370
			yyval := yyval_default;
			put_action (new_action (yytype1 (yyvs.item (yyvsp))), rule)
		

when 77 then
--|#line 374
			yyval := yyval_default;
			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := yytype3 (yyvs.item (yyvsp))
			end
		

when 78 then
--|#line 384

			if is_terminal (yytype1 (yyvs.item (yyvsp))) then
				yyval3 := new_token (yytype1 (yyvs.item (yyvsp)))
			else
				report_prec_not_token_error (yytype1 (yyvs.item (yyvsp)))
				yyval3 := new_char_token ("'a'")
			end
		
			yyval := yyval3
when 79 then
--|#line 393

			yyval3 := new_char_token (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval3
when 80 then
--|#line 399
			yyval := yyval_default;
			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb (yytype2 (yyvs.item (yyvsp)))
			put_rule (rule)
		

when 83 then
--|#line 411
			yyval := yyval_default;
			last_grammar.set_eiffel_code (yytype1 (yyvs.item (yyvsp)))
		

when 84 then
--|#line 417

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 85 then
--|#line 419

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 86 then
--|#line 421

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 87 then
--|#line 423

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 88 then
--|#line 425

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 89 then
--|#line 427

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 90 then
--|#line 429

yyval1 := yytype1 (yyvs.item (yyvsp)) 
			yyval := yyval1
when 91 then
--|#line 431

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
			    2,    2,    2,    2,   33,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   28,   34,
			   29,    2,   30,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   31,    2,   32,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   27,    2,    2,    2,    2,    2,
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
			   25,   26>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   44,   46,   45,   45,   49,   49,   49,   49,   49,
			   49,   49,   49,   50,   50,   41,   41,   41,   41,   41,
			   41,   41,   41,   41,   43,   42,   42,   42,   51,   51,
			   51,   37,   37,   37,   37,   37,   53,   53,   53,   38,
			   38,   38,   38,   38,   54,   54,   54,   39,   39,   39,
			   39,   39,   55,   55,   55,   40,   40,   40,   40,   40,
			   52,   52,   52,   56,   47,   47,   47,   57,   58,   59,
			   60,   60,   61,   61,   61,   61,   61,   61,   36,   36,
			   62,   48,   48,   48,   35,   35,   35,   35,   35,   35,
			   35,   35>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    5,    0,    0,    2,    1,    3,    3,    2,    2,
			    2,    2,    2,    0,    3,    1,    1,    1,    1,    1,
			    1,    1,    2,    2,    3,    0,    1,    3,    0,    2,
			    3,    1,    2,    2,    3,    1,    0,    2,    3,    1,
			    2,    2,    3,    1,    0,    2,    3,    1,    2,    2,
			    3,    1,    0,    2,    3,    1,    2,    2,    3,    1,
			    0,    2,    3,    1,    0,    1,    2,    4,    1,    1,
			    1,    3,    0,    2,    2,    2,    2,    3,    1,    1,
			    1,    0,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    3,    0,    5,   64,   13,    0,    0,   52,   44,
			   36,   13,    4,   91,   90,   89,   88,   87,   86,   85,
			   84,   68,   81,   65,    0,    0,   60,   11,   12,   10,
			    9,    8,   28,   82,    1,   66,   69,   72,    0,   21,
			   20,   19,   18,   17,   16,   15,    0,    7,    0,   59,
			   55,   53,    0,   51,   47,   45,    0,   43,   39,   37,
			    6,   83,    0,   70,   23,   25,   22,   14,    0,   63,
			   61,   54,   56,   57,   46,   48,   49,   38,   40,   41,
			    0,   35,   31,   29,   67,   80,   72,   75,   74,   76,
			    0,   73,   26,    0,   62,   58,   50,   42,   30,   32,

			   33,   71,   79,   78,   77,    0,   24,   34,   27,    0,
			    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   21,  104,   83,   59,   55,   51,   46,   93,   66,  109,
			    2,    1,   22,   34,   12,   26,   60,   47,   31,   30,
			   29,   70,   23,   24,   37,   62,   63,   86>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  224, -32768,  201,   26,  201,   27, -32768, -32768,
			 -32768,   26, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  117, -32768,   24,  189, -32768, -32768, -32768,   66,
			   44,   12, -32768,   33, -32768, -32768, -32768, -32768,   16, -32768,
			 -32768, -32768, -32768, -32768, -32768,    9,   18,   82,  177, -32768,
			   21, -32768,  165, -32768,    1, -32768,  153, -32768,   -4, -32768,
			  -13, -32768,   17,  102, -32768,  189, -32768, -32768,  201, -32768,
			 -32768, -32768,   20, -32768, -32768,   10, -32768, -32768,    0, -32768,
			  141, -32768,   -5, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  129, -32768, -32768,  -17, -32768, -32768, -32768, -32768, -32768,   -1,

			 -32768,  102, -32768, -32768, -32768,  189, -32768, -32768, -32768,    5,
			    2, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   -6, -32768,   -7,   19,   29,   23,  -62, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   59, -32768, -32768, -32768, -32768,
			 -32768,   -8,   37, -32768, -32768, -32768,  -30, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   27,   20,  111,   92,   81,  110,   19,   18,   17,   16,
			   15,   14,   13,  100,   79,  106,  105,  107,   97,   76,
			   80,   99,   78,   50,   54,   58,   20,   75,   96,   57,
			   64,   19,   18,   17,   16,   15,   14,   13,   95,   73,
			   65,   69,   50,  108,   85,   56,   54,   72,   67,   61,
			   58,   84,   36,   28,   82,   25,  101,   91,   20,   35,
			   94,   53,   69,   19,   18,   17,   16,   15,   14,   13,
			   32,   71,    0,   98,   82,   77,    0,   52,    0,    0,
			   20,   74,    0,   49,  103,   19,   18,   17,   16,   15,
			   14,   13,    0,    0,    0,   91,   20,    0,    0,   48,

			    0,   19,   18,   17,   16,   15,   14,   13,    0,    0,
			   90,    0,    0,    0,    0,   68,   20,   89,    0,   88,
			   87,   19,   18,   17,   16,   15,   14,   13,   33,    0,
			    0,   20,    0,    0,    0,    0,   19,   18,   17,   16,
			   15,   14,   13,   20,    0,    0,  102,    0,   19,   18,
			   17,   16,   15,   14,   13,   20,    0,    0,   81,    0,
			   19,   18,   17,   16,   15,   14,   13,   20,    0,    0,
			   57,    0,   19,   18,   17,   16,   15,   14,   13,   20,
			    0,    0,   53,    0,   19,   18,   17,   16,   15,   14,
			   13,   20,    0,    0,   49,    0,   19,   18,   17,   16,

			   15,   14,   13,   45,    0,    0,    0,    0,   44,   43,
			   42,   41,   40,   39,   38,   20,    0,    0,    0,    0,
			   19,   18,   17,   16,   15,   14,   13,   11,   10,    9,
			    8,    7,    0,    6,    5,    4,    0,    3>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    6,   14,    0,   65,   17,    0,   19,   20,   21,   22,
			   23,   24,   25,   18,   18,   32,   33,   18,   18,   18,
			   33,   26,   26,   29,   30,   31,   14,   26,   18,   17,
			   14,   19,   20,   21,   22,   23,   24,   25,   18,   18,
			   31,   47,   48,  105,   27,   33,   52,   26,   30,   16,
			   56,   34,   28,   26,   60,   29,   86,   63,   14,   22,
			   68,   17,   68,   19,   20,   21,   22,   23,   24,   25,
			   11,   48,   -1,   80,   80,   56,   -1,   33,   -1,   -1,
			   14,   52,   -1,   17,   90,   19,   20,   21,   22,   23,
			   24,   25,   -1,   -1,   -1,  101,   14,   -1,   -1,   33,

			   -1,   19,   20,   21,   22,   23,   24,   25,   -1,   -1,
			    8,   -1,   -1,   -1,   -1,   33,   14,   15,   -1,   17,
			   18,   19,   20,   21,   22,   23,   24,   25,   11,   -1,
			   -1,   14,   -1,   -1,   -1,   -1,   19,   20,   21,   22,
			   23,   24,   25,   14,   -1,   -1,   17,   -1,   19,   20,
			   21,   22,   23,   24,   25,   14,   -1,   -1,   17,   -1,
			   19,   20,   21,   22,   23,   24,   25,   14,   -1,   -1,
			   17,   -1,   19,   20,   21,   22,   23,   24,   25,   14,
			   -1,   -1,   17,   -1,   19,   20,   21,   22,   23,   24,
			   25,   14,   -1,   -1,   17,   -1,   19,   20,   21,   22,

			   23,   24,   25,   14,   -1,   -1,   -1,   -1,   19,   20,
			   21,   22,   23,   24,   25,   14,   -1,   -1,   -1,   -1,
			   19,   20,   21,   22,   23,   24,   25,    3,    4,    5,
			    6,    7,   -1,    9,   10,   11,   -1,   13>>)
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

	yyFinal: INTEGER is 111
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 35
			-- Number of tokens

	yyLast: INTEGER is 237
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 281
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 63
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class PR_YACC_PARSER
