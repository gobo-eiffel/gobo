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


feature {NONE} -- Tables

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

	yyFinal: INTEGER is 80

	yyFlag: INTEGER is -32768

	yyNtbase: INTEGER is 31

	yyMax_token: INTEGER is 266
	yyNsyms: INTEGER is 49

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    25,     2,    19,     2,     2,     2,    26,
    27,    14,    22,    17,    30,    24,    21,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,    16,
     2,    15,    23,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    28,     2,    29,    18,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    12,    20,    13,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5,
     6,     7,     8,     9,    10,    11>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
    31,    32,    33,    33,    33,    34,    34,    34,    34,    35,
    36,    36,    36,    37,    38,    38,    38,    39,    39,    39,
    39,    40,    40,    40,    40,    40,    41,    41,    42,    43,
    43,    44,    44,    44,    44,    44,    44,    44,    44,    44,
    44,    44,    44,    45,    45,    46,    46,    46,    46,    47,
    47,    48,    48,    48>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
     4,     1,     0,     5,     5,     0,     1,     1,     1,     0,
     0,     3,     3,     1,     1,     3,     1,     2,     1,     1,
     1,     2,     2,     1,     2,     3,     1,     3,     2,     1,
     2,     1,     2,     2,     2,     6,     5,     4,     1,     1,
     1,     3,     3,     3,     4,     1,     2,     3,     4,     0,
     2,     0,     1,     2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<     0,
     2,     3,    11,    14,    52,    10,     0,    53,     1,     3,
     0,    17,    15,     0,     0,    54,    11,    21,    32,    20,
    40,     0,    39,    50,     0,     0,     6,    19,    24,     0,
    27,    30,    41,    12,    13,     0,     5,    18,     0,     0,
    46,     0,     0,     7,     8,     9,     4,    23,     0,    29,
    22,    25,    31,     0,    33,    34,    35,    16,    51,    42,
    43,     0,     0,    47,    44,    28,    26,     0,    48,    45,
     0,    38,     0,    49,     0,    37,    36,     0,     0,     0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    78,
     2,     3,    47,     5,     6,     7,    15,    27,    28,    29,
    30,    31,    32,    33,    43,    39,     9>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<     4,
-32768,-32768,    22,-32768,    14,    17,    38,    39,-32768,-32768,
     0,-32768,-32768,    36,    26,-32768,    34,-32768,-32768,-32768,
-32768,     8,-32768,-32768,     8,    -1,    44,-32768,    37,     8,
     8,    -2,-32768,-32768,-32768,    43,-32768,-32768,    12,   -14,
    32,    60,     1,-32768,-32768,-32768,-32768,-32768,     8,-32768,
    40,-32768,    -2,    61,-32768,-32768,-32768,-32768,-32768,-32768,
-32768,    63,     2,    41,-32768,     8,-32768,    29,-32768,-32768,
    64,-32768,    10,-32768,    51,-32768,-32768,    68,    69,-32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<-32768,
-32768,    62,-32768,    67,-32768,-32768,-32768,-32768,    48,    15,
    45,    25,   -31,-32768,    35,-32768,-32768>>, 0)
		end

	yyLast: INTEGER is 77

	yytable_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    53,
    18,    41,    19,    64,    64,    49,    20,    21,     1,    54,
    19,    55,    61,    75,    59,    21,    42,    22,     8,    56,
    57,   -10,    76,    23,    24,    25,   -10,    26,    10,    65,
    70,    23,    24,    25,    53,    26,    60,     4,    12,    40,
    35,    72,    36,    13,    51,    73,    37,    16,    58,     4,
    34,    14,    44,    45,    46,    48,    49,    50,    67,    49,
    50,    62,    41,    77,    68,    69,    74,    79,    80,    38,
    71,    17,    11,    66,    52,     0,    63>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    31,
     1,     3,     3,     3,     3,    20,     7,     8,     5,    12,
     3,    14,    27,     4,     3,     8,    18,    18,     5,    22,
    23,     0,    13,    24,    25,    26,     5,    28,    12,    29,
    29,    24,    25,    26,    66,    28,    25,    16,     1,    25,
    15,    13,    17,     6,    30,    17,    13,     9,     6,    16,
    15,    14,     9,    10,    11,    19,    20,    21,    19,    20,
    21,    30,     3,    13,     4,     3,     3,     0,     0,    22,
    30,    10,     6,    49,    30,    -1,    42>>, 0)
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
		do
			inspect yy_act

when 1 then
--#line 41 "lx_lex_parser.y"

			process_default_rule
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		

when 2 then
--#line 51 "lx_lex_parser.y"

			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
				!! transitions.make (Initial_max_transitions)
			end
		

when 4 then
--#line 61 "lx_lex_parser.y"

			start_condition_stack.keep_first (dollar_integer (yyvs.item (yyvsp - 3)))
		

when 5 then
--#line 65 "lx_lex_parser.y"

			start_condition_stack.keep_first (dollar_integer (yyvs.item (yyvsp - 3)))
		

when 7 then
--#line 72 "lx_lex_parser.y"

			set_action (dollar_string (yyvs.item (yyvsp)))
		

when 9 then
--#line 77 "lx_lex_parser.y"

			set_action ("")
		

when 10 then
--#line 83 "lx_lex_parser.y"

				-- Initialize for a parse of one rule.
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			!! rule.make_default (rules.count + 1)
		

when 11 then
--#line 96 "lx_lex_parser.y"

			yyval := start_condition_stack.count
		

when 12 then
--#line 100 "lx_lex_parser.y"

			start_condition_stack.append_start_conditions (start_conditions)
		

when 14 then
--#line 107 "lx_lex_parser.y"

			yyval := start_condition_stack.count
		

when 15 then
--#line 113 "lx_lex_parser.y"

			push_start_condition (dollar_string (yyvs.item (yyvsp)), start_condition_stack)
		

when 16 then
--#line 117 "lx_lex_parser.y"

			push_start_condition (dollar_string (yyvs.item (yyvsp)), start_condition_stack)
		

when 17 then
--#line 121 "lx_lex_parser.y"

			report_bad_start_condition_list_error
		

when 18 then
--#line 127 "lx_lex_parser.y"

			process_bol_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 19 then
--#line 131 "lx_lex_parser.y"

			process_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 20 then
--#line 135 "lx_lex_parser.y"

			process_eof_rule
		

when 21 then
--#line 139 "lx_lex_parser.y"

			report_unrecognized_rule_error
		

when 22 then
--#line 145 "lx_lex_parser.y"

			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 23 then
--#line 150 "lx_lex_parser.y"

			yyval := append_eol_to_regexp (dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 24 then
--#line 154 "lx_lex_parser.y"

			-- $$ := $1
		

when 25 then
--#line 158 "lx_lex_parser.y"

			report_trailing_context_used_twice_error
		

when 26 then
--#line 162 "lx_lex_parser.y"

			report_trailing_context_used_twice_error
		

when 28 then
--#line 169 "lx_lex_parser.y"

			variable_length := True
			yyval := dollar_nfa (yyvs.item (yyvsp - 2)) | dollar_nfa (yyvs.item (yyvsp))
		

when 29 then
--#line 176 "lx_lex_parser.y"

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
--#line 192 "lx_lex_parser.y"

			yyval := dollar_nfa (yyvs.item (yyvsp - 1)) & dollar_nfa (yyvs.item (yyvsp))
		

when 32 then
--#line 198 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvs.item (yyvsp)))
		

when 33 then
--#line 203 "lx_lex_parser.y"

			variable_length := True
			yyval := |*| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 34 then
--#line 208 "lx_lex_parser.y"

			variable_length := True
			yyval := |+| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 35 then
--#line 213 "lx_lex_parser.y"

			variable_length := True
			yyval := |?| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 36 then
--#line 218 "lx_lex_parser.y"

			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 5)), dollar_integer (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 37 then
--#line 224 "lx_lex_parser.y"

			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 4)), dollar_integer (yyvs.item (yyvsp - 2)))
		

when 38 then
--#line 230 "lx_lex_parser.y"

				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 39 then
--#line 238 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		

when 40 then
--#line 243 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 41 then
--#line 248 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 42 then
--#line 253 "lx_lex_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 43 then
--#line 257 "lx_lex_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 44 then
--#line 263 "lx_lex_parser.y"

			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 2)))
			yyval := yyvs.item (yyvsp - 1)
		

when 45 then
--#line 269 "lx_lex_parser.y"

			dollar_symbol_class (yyvs.item (yyvsp - 1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 3)))
			yyval := yyvs.item (yyvsp - 1)
		

when 46 then
--#line 278 "lx_lex_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), new_character_class)
		

when 47 then
--#line 283 "lx_lex_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), dollar_symbol_class (yyvs.item (yyvsp - 1)))
		

when 48 then
--#line 288 "lx_lex_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				new_character_class)
		

when 49 then
--#line 294 "lx_lex_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				dollar_symbol_class (yyvs.item (yyvsp - 3)))
		

when 50 then
--#line 302 "lx_lex_parser.y"

			yyval := new_epsilon_nfa
		

when 51 then
--#line 306 "lx_lex_parser.y"

			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 54 then
--#line 316 "lx_lex_parser.y"

			eiffel_code := dollar_string (yyvs.item (yyvsp))
		

			else
				-- No action
			end
		end



end -- class LX_LEX_PARSER
