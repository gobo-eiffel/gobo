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

	yyFinal: INTEGER is 54

	yyFlag: INTEGER is -32768

	yyNtbase: INTEGER is 23

	yyMax_token: INTEGER is 260
	yyNsyms: INTEGER is 34

	yytranslate_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,    17,     2,     7,     2,     2,     2,    18,
    19,    10,    11,    14,    22,    16,     9,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    12,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
    20,     2,    21,     6,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
     2,     2,    13,     8,    15,     2,     2,     2,     2,     2,
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
     2,     2,     2,     2,     2,     1,     2,     3,     4,     5>>, 0)
		end

	yyr1_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
    23,    24,    25,    25,    25,    26,    26,    26,    26,    26,
    27,    27,    28,    29,    29,    30,    30,    30,    30,    30,
    30,    30,    30,    30,    30,    30,    30,    31,    31,    32,
    32,    32,    32,    33,    33>>, 0)
		end

	yyr2_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<0,
     2,     0,     2,     1,     1,     2,     2,     1,     2,     3,
     1,     3,     2,     1,     2,     1,     2,     2,     2,     6,
     5,     4,     1,     1,     1,     3,     3,     3,     4,     1,
     2,     3,     4,     0,     2>>, 0)
		end

	yydefact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<     2,
     0,     5,    16,    24,     0,    23,    34,     0,     0,     1,
     4,     8,     0,    11,    14,    25,     3,     0,     0,    30,
     0,     0,     7,     0,    13,     6,     9,    15,    17,    18,
    19,     0,    35,    26,    27,     0,     0,    31,    28,    12,
    10,     0,    32,    29,     0,     0,    22,    33,     0,    21,
    20,     0,     0,     0>>, 0)
		end

	yydefgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    52,
     1,    10,    11,    12,    13,    14,    15,    16,    22,    18>>, 0)
		end

	yypact_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<-32768,
     0,-32768,-32768,-32768,    16,-32768,-32768,    16,     5,-32768,
-32768,    30,    16,    16,    17,-32768,-32768,     6,    -6,   -10,
    11,     1,-32768,    16,-32768,    33,-32768,    17,-32768,-32768,
-32768,    27,-32768,-32768,-32768,    42,     4,    24,-32768,    16,
-32768,    29,-32768,-32768,    44,    20,-32768,-32768,    34,-32768,
-32768,    48,    50,-32768>>, 0)
		end

	yypgoto_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<-32768,
-32768,-32768,    46,     2,    39,    31,   -14,-32768,    32,-32768>>, 0)
		end

	yyLast: INTEGER is 55

	yytable_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    28,
     2,    24,     3,    38,     4,     5,    38,    20,    33,    19,
    21,    36,    35,    20,    26,     6,     7,     8,     3,     9,
     4,    39,    34,    49,    44,    28,    29,    30,    31,    32,
    42,     6,     7,     8,    50,     9,    23,    24,    25,    41,
    24,    25,    46,    47,    43,    45,    48,    53,    51,    54,
    17,    27,    37,     0,    40>>, 0)
		end

	yycheck_: ARRAY [INTEGER] is
		once
			Result := INTEGER_ARRAY_.make_from_array (<<    14,
     1,     8,     3,     3,     5,     6,     3,     3,     3,     8,
     6,    22,    19,     3,    13,    16,    17,    18,     3,    20,
     5,    21,    17,     4,    21,    40,    10,    11,    12,    13,
     4,    16,    17,    18,    15,    20,     7,     8,     9,     7,
     8,     9,    14,    15,     3,    22,     3,     0,    15,     0,
     5,    13,    21,    -1,    24>>, 0)
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
		do
			inspect yy_act

when 1 then
--#line 41 "lx_regexp_parser.y"

			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		

when 2 then
--#line 50 "lx_regexp_parser.y"

			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
				!! transitions.make (Initial_max_transitions)
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
--#line 67 "lx_regexp_parser.y"

			process_bol_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 4 then
--#line 71 "lx_regexp_parser.y"

			process_rule (dollar_nfa (yyvs.item (yyvsp)))
		

when 5 then
--#line 75 "lx_regexp_parser.y"

			report_unrecognized_rule_error
		

when 6 then
--#line 81 "lx_regexp_parser.y"

			yyval := append_trail_context_to_regexp
				(dollar_nfa (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 7 then
--#line 86 "lx_regexp_parser.y"

			yyval := append_eol_to_regexp (dollar_nfa (yyvs.item (yyvsp - 1)))
		

when 8 then
--#line 90 "lx_regexp_parser.y"

			-- $$ := $1
		

when 9 then
--#line 94 "lx_regexp_parser.y"

			report_trailing_context_used_twice_error
		

when 10 then
--#line 98 "lx_regexp_parser.y"

			report_trailing_context_used_twice_error
		

when 12 then
--#line 105 "lx_regexp_parser.y"

			variable_length := True
			yyval := dollar_nfa (yyvs.item (yyvsp - 2)) | dollar_nfa (yyvs.item (yyvsp))
		

when 13 then
--#line 112 "lx_regexp_parser.y"

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
--#line 128 "lx_regexp_parser.y"

			yyval := dollar_nfa (yyvs.item (yyvsp - 1)) & dollar_nfa (yyvs.item (yyvsp))
		

when 16 then
--#line 134 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character (dollar_integer (yyvs.item (yyvsp)))
		

when 17 then
--#line 139 "lx_regexp_parser.y"

			variable_length := True
			yyval := |*| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 18 then
--#line 144 "lx_regexp_parser.y"

			variable_length := True
			yyval := |+| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 19 then
--#line 149 "lx_regexp_parser.y"

			variable_length := True
			yyval := |?| dollar_nfa (yyvs.item (yyvsp - 1))
		

when 20 then
--#line 154 "lx_regexp_parser.y"

			variable_length := True
			yyval := new_bounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 5)), dollar_integer (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 21 then
--#line 160 "lx_regexp_parser.y"

			variable_length := True
			yyval := new_unbounded_iteration_nfa
				(dollar_nfa (yyvs.item (yyvsp - 4)), dollar_integer (yyvs.item (yyvsp - 2)))
		

when 22 then
--#line 166 "lx_regexp_parser.y"

				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval := new_iteration_nfa (dollar_nfa (yyvs.item (yyvsp - 3)), dollar_integer (yyvs.item (yyvsp - 1)))
		

when 23 then
--#line 174 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dot_character_class)
		

when 24 then
--#line 179 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_symbol_class_nfa (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 25 then
--#line 184 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := new_nfa_from_character_class (dollar_symbol_class (yyvs.item (yyvsp)))
		

when 26 then
--#line 189 "lx_regexp_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 27 then
--#line 193 "lx_regexp_parser.y"

			yyval := yyvs.item (yyvsp - 1)
		

when 28 then
--#line 199 "lx_regexp_parser.y"

			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 2)))
			yyval := yyvs.item (yyvsp - 1)
		

when 29 then
--#line 205 "lx_regexp_parser.y"

			dollar_symbol_class (yyvs.item (yyvsp - 1)).set_negated (True)
			character_classes.force
				(dollar_symbol_class (yyvs.item (yyvsp - 1)), dollar_string (yyvs.item (yyvsp - 3)))
			yyval := yyvs.item (yyvsp - 1)
		

when 30 then
--#line 214 "lx_regexp_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), new_character_class)
		

when 31 then
--#line 219 "lx_regexp_parser.y"

			yyval := append_character_to_character_class
				(dollar_integer (yyvs.item (yyvsp)), dollar_symbol_class (yyvs.item (yyvsp - 1)))
		

when 32 then
--#line 224 "lx_regexp_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				new_character_class)
		

when 33 then
--#line 230 "lx_regexp_parser.y"

			yyval := append_character_set_to_character_class
				(dollar_integer (yyvs.item (yyvsp - 2)), dollar_integer (yyvs.item (yyvsp)),
				dollar_symbol_class (yyvs.item (yyvsp - 3)))
		

when 34 then
--#line 238 "lx_regexp_parser.y"

			yyval := new_epsilon_nfa
		

when 35 then
--#line 242 "lx_regexp_parser.y"

			rule_length := rule_length + 1
			yyval := append_character_to_string
				(dollar_integer (yyvs.item (yyvsp)), dollar_nfa (yyvs.item (yyvsp - 1)))
		

			else
				-- No action
			end
		end



end -- class LX_REGEXP_PARSER
