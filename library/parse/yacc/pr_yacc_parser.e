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
		do
			inspect yy_act
when 1 then
--|#line 42
			if successful then
				set_start_symbol
				process_symbols
			end
		
when 2 then
--|#line 42
			initialize_grammar
		
when 3 then
--|#line 55
			precedence := 1
		
when 5 then
--|#line 62
			last_grammar.eiffel_header.force_last (dollar_string (yyvs.item (yyvsp)))
		
when 7 then
--|#line 67
			precedence := precedence + 1
		
when 8 then
--|#line 71
			precedence := precedence + 1
		
when 9 then
--|#line 75
			precedence := precedence + 1
		
when 10 then
--|#line 79
			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				!! start_symbol.make (dollar_string (yyvs.item (yyvsp)), line_nb)
			end
		
when 11 then
--|#line 87
			last_grammar.set_expected_conflicts (dollar_integer (yyvs.item (yyvsp)))
		
when 16 then
--|#line 99
			set_left_associative (dollar_token (yyvs.item (yyvsp)))
		
when 17 then
--|#line 103
			set_left_associative (dollar_token (yyvs.item (yyvsp)))
		
when 19 then
--|#line 110
			set_right_associative (dollar_token (yyvs.item (yyvsp)))
		
when 20 then
--|#line 114
			set_right_associative (dollar_token (yyvs.item (yyvsp)))
		
when 22 then
--|#line 121
			set_non_associative (dollar_token (yyvs.item (yyvsp)))
		
when 23 then
--|#line 125
			set_non_associative (dollar_token (yyvs.item (yyvsp)))
		
when 24 then
--|#line 131
			yyval := new_token (dollar_string (yyvs.item (yyvsp)))
		
when 25 then
--|#line 135
			yyval := new_char_token (dollar_string (yyvs.item (yyvsp)))
		
when 26 then
--|#line 139
			yyval := new_token_with_id (dollar_string (yyvs.item (yyvsp - 1)), dollar_integer (yyvs.item (yyvsp)))
		
when 27 then
--|#line 143
			yyval := new_char_token_with_id (dollar_string (yyvs.item (yyvsp - 1)), dollar_integer (yyvs.item (yyvsp)))
		
when 28 then
--|#line 149
			report_no_rules_error
		
when 31 then
--|#line 157
			process_rule (rule)
			rule := Void
			precedence_token := Void
		
when 32 then
--|#line 165
			if is_terminal (dollar_string (yyvs.item (yyvsp))) then
				report_lhs_symbol_token_error (dollar_string (yyvs.item (yyvsp)))
				rule := new_rule (new_dummy_variable)
			else
				rule := new_rule (new_variable (dollar_string (yyvs.item (yyvsp))))
				if rule.lhs.rules.count > 1 then
					report_rule_declared_twice_warning (dollar_string (yyvs.item (yyvsp)))
				end
			end
			precedence_token := Void
			put_rule (rule)
		
when 33 then
--|#line 181
			rule.set_line_nb (dollar_integer (yyvs.item (yyvsp)))
		
when 36 then
--|#line 191
			nb_rhs := 0
		
when 37 then
--|#line 195
			put_symbol (new_symbol (dollar_string (yyvs.item (yyvsp))), rule)
			nb_rhs := nb_rhs + 1
		
when 38 then
--|#line 200
			put_symbol (new_char_token (dollar_string (yyvs.item (yyvsp))), rule)
			nb_rhs := nb_rhs + 1
		
when 39 then
--|#line 205
			put_action (new_action (dollar_string (yyvs.item (yyvsp))), rule)
			nb_rhs := nb_rhs + 1
		
when 40 then
--|#line 210
			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := dollar_token (yyvs.item (yyvsp))
			end
		
when 41 then
--|#line 220
			if is_terminal (dollar_string (yyvs.item (yyvsp))) then
				yyval := new_token (dollar_string (yyvs.item (yyvsp)))
			else
				report_prec_not_token_error (dollar_string (yyvs.item (yyvsp)))
				yyval := new_char_token ("'a'")
			end
		
when 42 then
--|#line 229
			yyval := new_char_token (dollar_string (yyvs.item (yyvsp)))
		
when 43 then
--|#line 235
			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb (dollar_integer (yyvs.item (yyvsp)))
			put_rule (rule)
		
when 46 then
--|#line 247
			last_grammar.set_eiffel_code (dollar_string (yyvs.item (yyvsp)))
		
			else
				-- No action
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
			    2,    2,    2,    2,   18,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   20,   19,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   21,    2,    2,    2,    2,    2,
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
			   15,   16,   17>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   22,   24,   23,   23,   27,   27,   27,   27,   27,
			   27,   27,   28,   28,   28,   29,   29,   29,   30,   30,
			   30,   31,   31,   31,   32,   32,   32,   32,   25,   25,
			   25,   33,   34,   35,   36,   36,   37,   37,   37,   37,
			   37,   39,   39,   38,   26,   26,   26>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    5,    0,    0,    2,    1,    2,    2,    2,    2,
			    2,    2,    0,    2,    3,    0,    2,    3,    0,    2,
			    3,    0,    2,    3,    1,    1,    2,    2,    0,    1,
			    2,    4,    1,    1,    1,    3,    0,    2,    2,    2,
			    3,    1,    1,    1,    0,    1,    2>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    3,    0,   28,    5,    0,    0,   21,   18,   15,
			   12,    4,   32,   44,   29,    0,   10,   11,    9,    8,
			    7,    6,   45,    1,   30,   33,   36,    0,   25,   24,
			   22,    0,   19,    0,   16,    0,   13,   46,    0,   34,
			   23,   27,   26,   20,   17,   14,   43,   31,   36,   38,
			   39,   37,    0,   35,   42,   41,   40,    0,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   57,    2,    1,   13,   23,   11,   21,   20,   19,   18,
			   30,   14,   15,   26,   38,   39,   48,   56>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768,    0,   36, -32768,   21,   34, -32768, -32768, -32768,
			 -32768, -32768, -32768,   31, -32768,   26, -32768, -32768,   19,   14,
			   11,    6,   13, -32768, -32768, -32768, -32768,   24,   32,    7,
			 -32768,   24, -32768,   24, -32768,   24, -32768, -32768,   20,    5,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   22,    5, -32768, -32768, -32768,   25,   15, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  -19,   37, -32768, -32768, -32768,   -4, -32768, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   32,   34,   36,   10,    9,    8,    7,    6,   40,    5,
			    4,    3,   43,   52,   44,   59,   45,   51,   29,   50,
			   42,   49,   28,   29,   35,   58,   29,   28,   37,   33,
			   28,   29,   31,   16,   55,   28,   29,   27,   54,   47,
			   28,   46,   22,   12,   53,   41,   25,   17,   12,    0,
			   24>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   19,   20,   21,    3,    4,    5,    6,    7,   27,    9,
			   10,   11,   31,    8,   33,    0,   35,   12,   12,   14,
			   13,   16,   16,   12,   18,    0,   12,   16,   15,   18,
			   16,   12,   18,   12,   12,   16,   12,   18,   16,   19,
			   16,   21,   11,   12,   48,   13,   20,   13,   12,   -1,
			   13>>)
		end

feature {NONE} -- Constants

	yyFinal: INTEGER is 59
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 22
			-- Number of tokens

	yyLast: INTEGER is 50
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 272
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 40
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class PR_YACC_PARSER
