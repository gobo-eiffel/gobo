indexing

	description:

		"Parsers for regular expressions"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
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
			yyval1: INTEGER
			yyval2: LX_SYMBOL_CLASS
			yyval3: STRING
			yyval4: LX_NFA
		do
			inspect yy_act
when 1 then
--|#line 47
			yyval := yyval_default;
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		

when 2 then
--|#line 56
			yyval := yyval_default;
			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
			end
				-- Initialize for a parse of one pattern.
			in_trail_context := False
			!! rule.make_default (1)
		

when 3 then
--|#line 67
			yyval := yyval_default;
			process_bol_rule (yytype4 (yyvs.item (yyvsp)))
		

when 4 then
--|#line 71
			yyval := yyval_default;
			process_rule (yytype4 (yyvs.item (yyvsp)))
		

when 5 then
--|#line 75
			yyval := yyval_default;
			report_unrecognized_rule_error
		

when 6 then
--|#line 81

			has_trail_context := True
			trail_count := regexp_count
			yyval4 := append_trail_context_to_regexp (yytype4 (yyvs.item (yyvsp)), yytype4 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 7 then
--|#line 87

			has_trail_context := True
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 1
			yyval4 := append_eol_to_regexp (yytype4 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 8 then
--|#line 96

			yyval4 := yytype4 (yyvs.item (yyvsp))
			has_trail_context := False
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
		
			yyval := yyval4
when 9 then
--|#line 104

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
		
			yyval := yyval4
when 10 then
--|#line 110

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
		
			yyval := yyval4
when 11 then
--|#line 118

			yyval4 := yytype4 (yyvs.item (yyvsp))
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
			yyval := yyval4
when 12 then
--|#line 125

			yyval4 := yytype4 (yyvs.item (yyvsp - 2)) | yytype4 (yyvs.item (yyvsp))
			process_regexp_or_series
		
			yyval := yyval4
when 13 then
--|#line 132

			yyval4 := yytype4 (yyvs.item (yyvsp - 1))
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			in_trail_context := True
		
			yyval := yyval4
when 14 then
--|#line 144

			yyval4 := yytype4 (yyvs.item (yyvsp))
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
			yyval := yyval4
when 15 then
--|#line 151

			yyval4 := yytype4 (yyvs.item (yyvsp - 1)) & yytype4 (yyvs.item (yyvsp))
			process_series_singleton
		
			yyval := yyval4
when 16 then
--|#line 158

			yyval4 := new_nfa_from_character (yytype1 (yyvs.item (yyvsp)))
			process_singleton_char (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 17 then
--|#line 163

			yyval4 := |*| yytype4 (yyvs.item (yyvsp - 1))
			process_singleton_star
		
			yyval := yyval4
when 18 then
--|#line 168

			yyval4 := |+| yytype4 (yyvs.item (yyvsp - 1))
			process_singleton_plus
		
			yyval := yyval4
when 19 then
--|#line 173

			yyval4 := |?| yytype4 (yyvs.item (yyvsp - 1))
			process_singleton_optional
		
			yyval := yyval4
when 20 then
--|#line 178

			yyval4 := new_bounded_iteration_nfa (yytype4 (yyvs.item (yyvsp - 5)), yytype1 (yyvs.item (yyvsp - 3)), yytype1 (yyvs.item (yyvsp - 1)))
			process_singleton_bounded_iteration (yytype1 (yyvs.item (yyvsp - 3)), yytype1 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 21 then
--|#line 183

			yyval4 := new_unbounded_iteration_nfa (yytype4 (yyvs.item (yyvsp - 4)), yytype1 (yyvs.item (yyvsp - 2)))
			process_singleton_unbounded_iteration (yytype1 (yyvs.item (yyvsp - 2)))
		
			yyval := yyval4
when 22 then
--|#line 188

			yyval4 := new_iteration_nfa (yytype4 (yyvs.item (yyvsp - 3)), yytype1 (yyvs.item (yyvsp - 1)))
			process_singleton_fixed_iteration (yytype1 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 23 then
--|#line 193

			yyval4 := new_symbol_class_nfa (dot_character_class)
			process_singleton_dot
		
			yyval := yyval4
when 24 then
--|#line 198

			yyval4 := new_symbol_class_nfa (yytype2 (yyvs.item (yyvsp)))
			process_singleton_symbol_class (yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 25 then
--|#line 203

			yyval4 := new_nfa_from_character_class (yytype2 (yyvs.item (yyvsp)))
			process_singleton_symbol_class (yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 26 then
--|#line 208

			yyval4 := yytype4 (yyvs.item (yyvsp - 1))
		
			yyval := yyval4
when 27 then
--|#line 212

			yyval4 := yytype4 (yyvs.item (yyvsp - 1))
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
		
			yyval := yyval4
when 28 then
--|#line 221

			yyval2 := yytype2 (yyvs.item (yyvsp - 1))
			character_classes.force (yyval2, yytype3 (yyvs.item (yyvsp - 2)))
		
			yyval := yyval2
when 29 then
--|#line 226

			yyval2 := yytype2 (yyvs.item (yyvsp - 1))
			yyval2.set_negated (True)
			character_classes.force (yyval2, yytype3 (yyvs.item (yyvsp - 3)))
		
			yyval := yyval2
when 30 then
--|#line 234

			yyval2 := append_character_to_character_class (yytype1 (yyvs.item (yyvsp)), new_character_class)
		
			yyval := yyval2
when 31 then
--|#line 238

			yyval2 := append_character_to_character_class (yytype1 (yyvs.item (yyvsp)), yytype2 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval2
when 32 then
--|#line 242

			yyval2 := append_character_set_to_character_class
				(yytype1 (yyvs.item (yyvsp - 2)), yytype1 (yyvs.item (yyvsp)), new_character_class)
		
			yyval := yyval2
when 33 then
--|#line 247

			yyval2 := append_character_set_to_character_class (yytype1 (yyvs.item (yyvsp - 2)), yytype1 (yyvs.item (yyvsp)), yytype2 (yyvs.item (yyvsp - 3)))
		
			yyval := yyval2
when 34 then
--|#line 253

			yyval4 := new_epsilon_nfa
			process_singleton_empty_string
		
			yyval := yyval4
when 35 then
--|#line 258

			yyval4 := append_character_to_string (yytype1 (yyvs.item (yyvsp)), yytype4 (yyvs.item (yyvsp - 1)))
			process_singleton_string (yytype1 (yyvs.item (yyvsp)))
		
			yyval := yyval4
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
			    2,    2,    2,    2,   18,    2,    8,    2,    2,    2,
			   19,   20,   11,   12,   15,   22,   17,   10,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   13,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    6,    2,   21,    7,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   14,    9,   16,    2,    2,    2,    2,
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
			    5>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   31,   32,   33,   33,   33,   23,   23,   23,   23,
			   23,   24,   24,   25,   26,   26,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   30,   30,
			   29,   29,   29,   29,   28,   28>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    2,    0,    2,    1,    1,    2,    2,    1,    2,
			    3,    1,    3,    2,    1,    2,    1,    2,    2,    2,
			    6,    5,    4,    1,    1,    1,    3,    3,    3,    4,
			    1,    2,    3,    4,    0,    2>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    2,    0,    0,   34,   23,    0,    0,   24,   16,    5,
			    4,    8,    0,   11,   14,   25,    1,    0,    0,    3,
			    0,   30,    0,   13,    0,    7,    6,    9,   15,    0,
			   19,   18,   17,   27,   26,   35,    0,    0,   28,   31,
			   12,   10,    0,   29,   32,    0,   22,    0,   33,   21,
			    0,   20,    0,    0,    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   10,   11,   12,   13,   14,   18,   22,   15,   52,    1,
			   16>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768,    0,    6, -32768, -32768,    6,    7, -32768, -32768, -32768,
			 -32768,   33,    6,    6,   23, -32768, -32768,   20,   10, -32768,
			   47,   27,    1, -32768,    6, -32768,   22, -32768,   23,   44,
			 -32768, -32768, -32768, -32768, -32768, -32768,   -1,   36, -32768,   25,
			    6, -32768,   29, -32768, -32768,   35, -32768,   17, -32768, -32768,
			   30, -32768,   15,    8, -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   49,   14,   41,   28,  -13, -32768,   31, -32768, -32768, -32768,
			 -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   28,    9,   39,    8,   39,    7,    6,    5,   54,    8,
			   21,    7,    6,   35,   20,   53,   17,    4,    3,    2,
			   43,   50,   38,    4,    3,    2,   26,   28,   34,   24,
			   41,   24,   23,   49,   32,   31,   30,   29,   48,   44,
			   33,   25,   24,   23,   47,   46,   51,   45,   42,   37,
			   21,   36,   40,   27,   19>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   13,    1,    3,    3,    3,    5,    6,    7,    0,    3,
			    3,    5,    6,    3,    7,    0,    2,   17,   18,   19,
			   21,    4,   21,   17,   18,   19,   12,   40,   18,    9,
			    8,    9,   10,   16,   11,   12,   13,   14,    3,    3,
			   20,    8,    9,   10,   15,   16,   16,   22,    4,   22,
			    3,   20,   24,   12,    5>>)
		end

feature {NONE} -- Conversion

	yytype1 (v: ANY): INTEGER is
		require
			valid_type: yyis_type1 (v)
		local
			ref: INTEGER_REF
		do
			ref ?= v
			Result := ref.item
		end

	yyis_type1 (v: ANY): BOOLEAN is
		local
			u: INTEGER_REF
		do
			u ?= v
			Result := (u = v)
		end

	yytype2 (v: ANY): LX_SYMBOL_CLASS is
		require
			valid_type: yyis_type2 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type2 (v: ANY): BOOLEAN is
		local
			u: LX_SYMBOL_CLASS
		do
			u ?= v
			Result := (u = v)
		end

	yytype3 (v: ANY): STRING is
		require
			valid_type: yyis_type3 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type3 (v: ANY): BOOLEAN is
		local
			u: STRING
		do
			u ?= v
			Result := (u = v)
		end

	yytype4 (v: ANY): LX_NFA is
		require
			valid_type: yyis_type4 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type4 (v: ANY): BOOLEAN is
		local
			u: LX_NFA
		do
			u ?= v
			Result := (u = v)
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
