indexing

	description:

		"Parsers for regular expressions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_REGEXP_PARSER

inherit

	LX_LEX_PARSER_SKELETON

	LX_REGEXP_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		end

creation

	make, make_from_description

feature

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
--|#line 40
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
when 2 then
--|#line 49
			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
			end
				-- Initialize for a parse of one pattern.
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			!! rule.make_default (1)
		
when 3 then
--|#line 65
			process_bol_rule (dollar_nfa (yyvs.item (yyvsp)))
		
when 4 then
--|#line 69
			process_rule (dollar_nfa (yyvs.item (yyvsp)))
		
when 5 then
--|#line 73
			report_unrecognized_rule_error
		
when 6 then
--|#line 79
			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		
when 7 then
--|#line 84
			yyval := append_eol_to_regexp (dollar_nfa (yyvs.item (yyvsp - 1)))
		
when 8 then
--|#line 88
			-- $$ := $1
		
when 9 then
--|#line 92
			report_trailing_context_used_twice_error
		
when 10 then
--|#line 96
			report_trailing_context_used_twice_error
		
when 12 then
--|#line 103
			variable_length := True
			yyval := dollar_nfa (yyvs.item (yyvsp - 2)) | dollar_nfa (yyvs.item (yyvsp))
		
when 13 then
--|#line 110
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
		
when 15 then
--|#line 126
			yyval := dollar_nfa (yyvs.item (yyvsp - 1)) & dollar_nfa (yyvs.item (yyvsp))
		
when 16 then
--|#line 132
			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvs.item (yyvsp)))
		
when 17 then
--|#line 137
			variable_length := True
			yyval := |*| dollar_nfa (yyvs.item (yyvsp - 1))
		
when 18 then
--|#line 142
			variable_length := True
			yyval := |+| dollar_nfa (yyvs.item (yyvsp - 1))
		
when 19 then
--|#line 147
			variable_length := True
			yyval := |?| dollar_nfa (yyvs.item (yyvsp - 1))
		
when 20 then
--|#line 152
			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 5)), dollar_integer (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		
when 21 then
--|#line 158
			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 4)), dollar_integer (yyvs.item (yyvsp - 2)))
		
when 22 then
--|#line 164
				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		
when 23 then
--|#line 172
			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		
when 24 then
--|#line 177
			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvs.item (yyvsp)))
		
when 25 then
--|#line 182
			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvs.item (yyvsp)))
		
when 26 then
--|#line 187
			yyval := yyvs.item (yyvsp - 1)
		
when 27 then
--|#line 191
			yyval := yyvs.item (yyvsp - 1)
		
when 28 then
--|#line 197
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 2)))
			yyval := yyvs.item (yyvsp - 1)
		
when 29 then
--|#line 203
			dollar_symbol_class (yyvs.item (yyvsp - 1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 3)))
			yyval := yyvs.item (yyvsp - 1)
		
when 30 then
--|#line 212
			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), new_character_class)
		
when 31 then
--|#line 217
			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), dollar_symbol_class (yyvs.item (yyvsp - 1)))
		
when 32 then
--|#line 222
			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				new_character_class)
		
when 33 then
--|#line 228
			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				dollar_symbol_class (yyvs.item (yyvsp - 3)))
		
when 34 then
--|#line 236
			yyval := new_epsilon_nfa
		
when 35 then
--|#line 240
			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		
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
			    2,    2,    2,    2,   17,    2,    7,    2,    2,    2,
			   18,   19,   10,   11,   14,   22,   16,    9,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   12,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   20,    2,   21,    6,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   13,    8,   15,    2,    2,    2,    2,
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
			    5>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,   23,   24,   25,   25,   25,   26,   26,   26,   26,
			   26,   28,   28,   27,   29,   29,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   30,   30,   30,   31,   31,
			   33,   33,   33,   33,   32,   32>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    0,    2,    0,    2,    1,    1,    2,    2,    1,    2,
			    3,    1,    3,    2,    1,    2,    1,    2,    2,    2,
			    6,    5,    4,    1,    1,    1,    3,    3,    3,    4,
			    1,    2,    3,    4,    0,    2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			    2,    0,    0,    0,   34,   23,    0,   24,   16,    5,
			    1,    4,    0,    8,   11,   14,   25,    0,   30,    0,
			    0,    0,    3,    9,    6,   13,    0,    7,   15,    0,
			   19,   18,   17,    0,    0,   28,   31,   27,   26,   35,
			   10,   12,    0,   29,   32,    0,   22,    0,   33,   21,
			    0,   20,    0,    0,    0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   52,    1,   10,   11,   12,   13,   14,   15,   16,   21,
			   19>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			 -32768,    0,    5,   16, -32768, -32768,   16, -32768, -32768, -32768,
			 -32768, -32768,   16,   35,   16,   28, -32768,   47,   26,    4,
			    7,    6, -32768, -32768,   22, -32768,   16, -32768,   28,   45,
			 -32768, -32768, -32768,    1,   44, -32768,   13, -32768, -32768, -32768,
			 -32768,   16,   31, -32768, -32768,   21, -32768,   -2, -32768, -32768,
			   -1, -32768,   12,   10, -32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			 -32768, -32768, -32768,   48,   40,   25,   27,  -14, -32768, -32768,
			   34>>, 0)
		end

	yytable_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   28,    9,   50,    8,   36,    7,    6,   36,   18,   39,
			   54,   17,   53,   49,   51,   26,    5,    4,    3,    8,
			    2,    7,   43,   38,   48,   35,   37,   28,   20,   40,
			   26,   25,    5,    4,    3,   45,    2,   24,   32,   31,
			   30,   29,   27,   26,   25,   47,   46,   44,   34,   42,
			   18,   33,   23,   41,   22>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<
			   14,    1,    4,    3,    3,    5,    6,    3,    3,    3,
			    0,    6,    0,   15,   15,    8,   16,   17,   18,    3,
			   20,    5,   21,   17,    3,   21,   19,   41,    3,    7,
			    8,    9,   16,   17,   18,   22,   20,   12,   10,   11,
			   12,   13,    7,    8,    9,   14,   15,    3,   22,    4,
			    3,   17,   12,   26,    6>>, 0)
		end

feature {NONE} -- Constants

	yyFinal: INTEGER is 54
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 23
			-- Number of tokens

	yyLast: INTEGER is 54
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 260
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 34
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class LX_REGEXP_PARSER
