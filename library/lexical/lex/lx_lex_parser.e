indexing

	description:

		"Parsers for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_PARSER

inherit

	LX_LEX_PARSER_SKELETON

	LX_LEX_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		end

creation

	make, make_from_description


feature {NONE} -- Implementation

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

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
--|#line 41
			process_default_rule
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
when 2 then
--|#line 51
			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
			end
		
when 4 then
--|#line 60
			start_condition_stack.keep_first (dollar_integer (yyvs.item (yyvsp - 3)))
		
when 5 then
--|#line 64
			start_condition_stack.keep_first (dollar_integer (yyvs.item (yyvsp - 3)))
		
when 7 then
--|#line 71
			set_action (dollar_string (yyvs.item (yyvsp)))
		
when 9 then
--|#line 76
			set_action ("")
		
when 10 then
--|#line 82
				-- Initialize for a parse of one rule.
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			!! rule.make_default (rules.count + 1)
		
when 11 then
--|#line 95
			yyval := start_condition_stack.count
		
when 12 then
--|#line 99
			start_condition_stack.append_start_conditions (start_conditions)
		
when 14 then
--|#line 106
			yyval := start_condition_stack.count
		
when 15 then
--|#line 112
			push_start_condition (dollar_string (yyvs.item (yyvsp)), start_condition_stack)
		
when 16 then
--|#line 116
			push_start_condition (dollar_string (yyvs.item (yyvsp)), start_condition_stack)
		
when 17 then
--|#line 120
			report_bad_start_condition_list_error
		
when 18 then
--|#line 126
			process_bol_rule (dollar_nfa (yyvs.item (yyvsp)))
		
when 19 then
--|#line 130
			process_rule (dollar_nfa (yyvs.item (yyvsp)))
		
when 20 then
--|#line 134
			process_eof_rule
		
when 21 then
--|#line 138
			report_unrecognized_rule_error
		
when 22 then
--|#line 144
			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		
when 23 then
--|#line 149
			yyval := append_eol_to_regexp (dollar_nfa (yyvs.item (yyvsp - 1)))
		
when 24 then
--|#line 153
			-- $$ := $1
		
when 25 then
--|#line 157
			report_trailing_context_used_twice_error
		
when 26 then
--|#line 161
			report_trailing_context_used_twice_error
		
when 28 then
--|#line 168
			variable_length := True
			yyval := dollar_nfa (yyvs.item (yyvsp - 2)) | dollar_nfa (yyvs.item (yyvsp))
		
when 29 then
--|#line 175
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			if variable_length then
					-- We hope the trailing context is fixed-length.
				variable_length := False
			else
				head_count := rule_length
			end
			rule_length := 0
			in_trail_context := True
		
when 31 then
--|#line 191
			yyval := dollar_nfa (yyvs.item (yyvsp - 1)) & dollar_nfa (yyvs.item (yyvsp))
		
when 32 then
--|#line 197
			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvs.item (yyvsp)))
		
when 33 then
--|#line 202
			variable_length := True
			yyval := |*| dollar_nfa (yyvs.item (yyvsp - 1))
		
when 34 then
--|#line 207
			variable_length := True
			yyval := |+| dollar_nfa (yyvs.item (yyvsp - 1))
		
when 35 then
--|#line 212
			variable_length := True
			yyval := |?| dollar_nfa (yyvs.item (yyvsp - 1))
		
when 36 then
--|#line 217
			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 5)), dollar_integer (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		
when 37 then
--|#line 223
			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 4)), dollar_integer (yyvs.item (yyvsp - 2)))
		
when 38 then
--|#line 229
				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		
when 39 then
--|#line 237
			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		
when 40 then
--|#line 242
			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvs.item (yyvsp)))
		
when 41 then
--|#line 247
			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvs.item (yyvsp)))
		
when 42 then
--|#line 252
			yyval := yyvs.item (yyvsp - 1)
		
when 43 then
--|#line 256
			yyval := yyvs.item (yyvsp - 1)
		
when 44 then
--|#line 262
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 2)))
			yyval := yyvs.item (yyvsp - 1)
		
when 45 then
--|#line 268
			dollar_symbol_class (yyvs.item (yyvsp - 1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 3)))
			yyval := yyvs.item (yyvsp - 1)
		
when 46 then
--|#line 277
			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), new_character_class)
		
when 47 then
--|#line 282
			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), dollar_symbol_class (yyvs.item (yyvsp - 1)))
		
when 48 then
--|#line 287
			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				new_character_class)
		
when 49 then
--|#line 293
			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				dollar_symbol_class (yyvs.item (yyvsp - 3)))
		
when 50 then
--|#line 301
			yyval := new_epsilon_nfa
		
when 51 then
--|#line 305
			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		
when 54 then
--|#line 315
			eiffel_code := dollar_string (yyvs.item (yyvsp))
		
			else
				-- No action
			end
		end

feature {NONE} -- Tables

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   25,    2,   19,    2,    2,    2,
			   26,   27,   14,   22,   17,   30,   24,   21,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   16,    2,   15,   23,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   28,    2,   29,   18,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   12,   20,   13,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10,   11>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,   31,   32,   33,   33,   33,   38,   38,   38,   38,
			   34,   36,   36,   36,   39,   40,   40,   40,   37,   37,
			   37,   37,   41,   41,   41,   41,   41,   43,   43,   42,
			   44,   44,   45,   45,   45,   45,   45,   45,   45,   45,
			   45,   45,   45,   45,   46,   46,   48,   48,   48,   48,
			   47,   47,   35,   35,   35>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    4,    1,    0,    5,    5,    0,    1,    1,    1,
			    0,    0,    3,    3,    1,    1,    3,    1,    2,    1,
			    1,    1,    2,    2,    1,    2,    3,    1,    3,    2,
			    1,    2,    1,    2,    2,    2,    6,    5,    4,    1,
			    1,    1,    3,    3,    3,    4,    1,    2,    3,    4,
			    0,    2,    0,    1,    2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    2,    3,   11,   14,   52,   10,    0,   53,    1,
			    3,    0,    0,   15,   17,    0,   54,   11,    0,    0,
			   50,   39,    0,   40,   20,   32,   21,    6,   19,    0,
			   24,   27,   30,   41,   12,    0,   13,    5,    0,   46,
			    0,    0,    0,   18,    9,    8,    7,    4,   25,   22,
			   29,    0,   23,   31,   35,   34,   33,    0,   16,    0,
			    0,   44,   47,   43,   42,   51,   26,   28,    0,   45,
			   48,    0,    0,   38,   49,   37,    0,   36,    0,    0,
			    0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   78,    2,    3,    5,    9,    6,   27,   47,    7,   15,
			   28,   29,   30,   31,   32,   33,   42,   40>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   65, -32768, -32768,    6, -32768,   64,   56,   37,   57, -32768,
			 -32768,    0,   52, -32768, -32768,   31, -32768,   29,   11,    9,
			 -32768, -32768,    9, -32768, -32768, -32768, -32768,   51, -32768,    9,
			   38,    9,   27, -32768, -32768,   59, -32768, -32768,   61,   33,
			    2,   -7,    7, -32768, -32768, -32768, -32768, -32768, -32768,   35,
			 -32768,    9, -32768,   27, -32768, -32768, -32768,   36, -32768,    1,
			   49, -32768,   17, -32768, -32768, -32768, -32768,    9,   10, -32768,
			 -32768,   18,   40, -32768, -32768, -32768,  -11, -32768,   16,   15,
			 -32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			 -32768, -32768,   66,   68, -32768, -32768, -32768, -32768, -32768, -32768,
			   53,   44,  -10,   20,  -31, -32768, -32768,   34>>, 0)
		end

	yytable_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   53,   26,   77,   25,   62,   62,  -10,   24,   23,   41,
			   65,  -10,   25,   51,   39,   80,   79,   23,   22,   49,
			   63,   74,    4,   73,   21,   20,   19,   72,   18,   38,
			   69,   61,   64,   21,   20,   19,   53,   18,   14,   57,
			   68,   56,   37,   13,   76,    4,   36,   71,   35,   55,
			   54,   12,   70,   75,   66,   51,   50,   52,   51,   50,
			   46,   45,   44,   60,   39,   58,   16,   34,   10,    8,
			    1,   67,   59,   48,   11,   43,   17>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   31,    1,   13,    3,    3,    3,    0,    7,    8,   19,
			    3,    5,    3,   20,    3,    0,    0,    8,   18,   29,
			   27,    3,   16,   13,   24,   25,   26,   17,   28,   18,
			   29,   29,   25,   24,   25,   26,   67,   28,    1,   12,
			    4,   14,   13,    6,    4,   16,   15,   30,   17,   22,
			   23,   14,    3,   13,   19,   20,   21,   19,   20,   21,
			    9,   10,   11,   30,    3,    6,    9,   15,   12,    5,
			    5,   51,   38,   29,    6,   22,   10>>, 0)
		end

feature {NONE} -- Constants

	yyFinal: INTEGER is 80
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 31
			-- Number of tokens

	yyLast: INTEGER is 76
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 266
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 49
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class LX_LEX_PARSER
