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
			yyval3: LX_SYMBOL_CLASS
			yyval4: LX_NFA
		do
			inspect yy_act
when 1 then
--|#line 49
			yyval := yyval_default;
			process_default_rule
			if equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		

when 2 then
--|#line 59
			yyval := yyval_default;
			if equiv_classes_used then
				!! equiv_classes.make (1, characters_count)
			end
		

when 4 then
--|#line 68
			yyval := yyval_default;
			start_condition_stack.keep_first (yytype2 (yyvs.item (yyvsp - 3)))
		

when 5 then
--|#line 72
			yyval := yyval_default;
			start_condition_stack.keep_first (yytype2 (yyvs.item (yyvsp - 3)))
		

when 7 then
--|#line 79
			yyval := yyval_default;
			set_action (yytype1 (yyvs.item (yyvsp)))
		

when 9 then
--|#line 84
			yyval := yyval_default;
			set_action ("")
		

when 10 then
--|#line 90
			yyval := yyval_default;
				-- Initialize for a parse of one rule.
			variable_trail_rule := False
			variable_length := False
			trail_count := 0
			head_count := 0
			rule_length := 0
			in_trail_context := False
			!! rule.make_default (rules.count + 1)
		

when 11 then
--|#line 103

			yyval2 := start_condition_stack.count
		
			yyval := yyval2
when 12 then
--|#line 107

			yyval2 := yytype2 (yyvs.item (yyvsp - 2))
			start_condition_stack.append_start_conditions (start_conditions)
		
			yyval := yyval2
when 13 then
--|#line 112

yyval2 := yytype2 (yyvs.item (yyvsp - 2)) 
			yyval := yyval2
when 14 then
--|#line 116

			yyval2 := start_condition_stack.count
		
			yyval := yyval2
when 15 then
--|#line 122
			yyval := yyval_default;
			push_start_condition (yytype1 (yyvs.item (yyvsp)), start_condition_stack)
		

when 16 then
--|#line 126
			yyval := yyval_default;
			push_start_condition (yytype1 (yyvs.item (yyvsp)), start_condition_stack)
		

when 17 then
--|#line 130
			yyval := yyval_default;
			report_bad_start_condition_list_error
		

when 18 then
--|#line 136
			yyval := yyval_default;
			process_bol_rule (yytype4 (yyvs.item (yyvsp)))
		

when 19 then
--|#line 140
			yyval := yyval_default;
			process_rule (yytype4 (yyvs.item (yyvsp)))
		

when 20 then
--|#line 144
			yyval := yyval_default;
			process_eof_rule
		

when 21 then
--|#line 148
			yyval := yyval_default;
			report_unrecognized_rule_error
		

when 22 then
--|#line 154

			yyval4 := append_trail_context_to_regexp (yytype4 (yyvs.item (yyvsp)), yytype4 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 23 then
--|#line 158

			yyval4 := append_eol_to_regexp (yytype4 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 24 then
--|#line 162

			yyval4 := yytype4 (yyvs.item (yyvsp))
		
			yyval := yyval4
when 25 then
--|#line 166

			report_trailing_context_used_twice_error
		
			yyval := yyval4
when 26 then
--|#line 170

			report_trailing_context_used_twice_error
		
			yyval := yyval4
when 27 then
--|#line 176

yyval4 := yytype4 (yyvs.item (yyvsp)) 
			yyval := yyval4
when 28 then
--|#line 178

			variable_length := True
			yyval4 := yytype4 (yyvs.item (yyvsp - 2)) | yytype4 (yyvs.item (yyvsp))
		
			yyval := yyval4
when 29 then
--|#line 185

			yyval4 := yytype4 (yyvs.item (yyvsp - 1))
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
		
			yyval := yyval4
when 30 then
--|#line 201

yyval4 := yytype4 (yyvs.item (yyvsp)) 
			yyval := yyval4
when 31 then
--|#line 203

			yyval4 := yytype4 (yyvs.item (yyvsp - 1)) & yytype4 (yyvs.item (yyvsp))
		
			yyval := yyval4
when 32 then
--|#line 209

			rule_length := rule_length + 1
			yyval4 := new_nfa_from_character (yytype2 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 33 then
--|#line 214

			variable_length := True
			yyval4 := |*| yytype4 (yyvs.item (yyvsp - 1))
		
			yyval := yyval4
when 34 then
--|#line 219

			variable_length := True
			yyval4 := |+| yytype4 (yyvs.item (yyvsp - 1))
		
			yyval := yyval4
when 35 then
--|#line 224

			variable_length := True
			yyval4 := |?| yytype4 (yyvs.item (yyvsp - 1))
		
			yyval := yyval4
when 36 then
--|#line 229

			variable_length := True
			yyval4 := new_bounded_iteration_nfa (yytype4 (yyvs.item (yyvsp - 5)), yytype2 (yyvs.item (yyvsp - 3)), yytype2 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 37 then
--|#line 234

			variable_length := True
			yyval4 := new_unbounded_iteration_nfa (yytype4 (yyvs.item (yyvsp - 4)), yytype2 (yyvs.item (yyvsp - 2)))
		
			yyval := yyval4
when 38 then
--|#line 239

				-- The singleton could be something like "(foo)",
				-- in which case we have no idea what its length
				-- is, so we punt here.
			variable_length := True
			yyval4 := new_iteration_nfa (yytype4 (yyvs.item (yyvsp - 3)), yytype2 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 39 then
--|#line 247

			rule_length := rule_length + 1
			yyval4 := new_symbol_class_nfa (dot_character_class)
		
			yyval := yyval4
when 40 then
--|#line 252

			rule_length := rule_length + 1
			yyval4 := new_symbol_class_nfa (yytype3 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 41 then
--|#line 257

			rule_length := rule_length + 1
			yyval4 := new_nfa_from_character_class (yytype3 (yyvs.item (yyvsp)))
		
			yyval := yyval4
when 42 then
--|#line 262

			yyval4 := yytype4 (yyvs.item (yyvsp - 1))
		
			yyval := yyval4
when 43 then
--|#line 266

			yyval4 := yytype4 (yyvs.item (yyvsp - 1))
		
			yyval := yyval4
when 44 then
--|#line 272

			yyval3 := yytype3 (yyvs.item (yyvsp - 1))
			character_classes.force (yyval3, yytype1 (yyvs.item (yyvsp - 2)))
		
			yyval := yyval3
when 45 then
--|#line 277

			yyval3 := yytype3 (yyvs.item (yyvsp - 1))
			yyval3.set_negated (True)
			character_classes.force (yyval3, yytype1 (yyvs.item (yyvsp - 3)))
		
			yyval := yyval3
when 46 then
--|#line 285

			yyval3 := append_character_to_character_class (yytype2 (yyvs.item (yyvsp)), new_character_class)
		
			yyval := yyval3
when 47 then
--|#line 289

			yyval3 := append_character_to_character_class (yytype2 (yyvs.item (yyvsp)), yytype3 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval3
when 48 then
--|#line 293

			yyval3 := append_character_set_to_character_class
				(yytype2 (yyvs.item (yyvsp - 2)), yytype2 (yyvs.item (yyvsp)), new_character_class)
		
			yyval := yyval3
when 49 then
--|#line 298

			yyval3 := append_character_set_to_character_class (yytype2 (yyvs.item (yyvsp - 2)), yytype2 (yyvs.item (yyvsp)), yytype3 (yyvs.item (yyvsp - 3)))
		
			yyval := yyval3
when 50 then
--|#line 304

			yyval4 := new_epsilon_nfa
		
			yyval := yyval4
when 51 then
--|#line 308

			rule_length := rule_length + 1
			yyval4 := append_character_to_string (yytype2 (yyvs.item (yyvsp)), yytype4 (yyvs.item (yyvsp - 1)))
		
			yyval := yyval4
when 54 then
--|#line 317
			yyval := yyval_default;
			eiffel_code := yytype1 (yyvs.item (yyvsp))
		

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
			    2,    2,    2,    2,   26,    2,   20,    2,    2,    2,
			   27,   28,   15,   23,   18,   30,   25,   22,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   17,    2,   16,   24,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    9,    2,   29,   19,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   13,   21,   14,    2,    2,    2,    2,
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
			    5,    6,    7,    8,   10,   11,   12>>)
		end

	yyr1_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,   41,   42,   43,   43,   43,   47,   47,   47,   47,
			   44,   31,   31,   31,   32,   48,   48,   48,   46,   46,
			   46,   46,   33,   33,   33,   33,   33,   34,   34,   35,
			   36,   36,   37,   37,   37,   37,   37,   37,   37,   37,
			   37,   37,   37,   37,   40,   40,   39,   39,   39,   39,
			   38,   38,   45,   45,   45>>)
		end

	yyr2_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    4,    1,    0,    5,    5,    0,    1,    1,    1,
			    0,    0,    3,    3,    1,    1,    3,    1,    2,    1,
			    1,    1,    2,    2,    1,    2,    3,    1,    3,    2,
			    1,    2,    1,    2,    2,    2,    6,    5,    4,    1,
			    1,    1,    3,    3,    3,    4,    1,    2,    3,    4,
			    0,    2,    0,    1,    2>>)
		end

	yydefact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    0,    2,    3,   11,   14,   10,    0,   52,    3,    0,
			    0,   15,   17,    0,   53,    1,   11,    0,   50,   39,
			    0,   40,   32,    0,   20,   21,   19,   24,    0,   27,
			   30,   41,    6,   12,    0,   13,   54,    5,    0,    0,
			   18,    0,   46,    0,   29,    0,   23,   22,   25,   31,
			   35,   34,   33,    0,    7,    9,    8,    4,   16,   43,
			   42,   51,    0,    0,   44,   47,   28,   26,    0,   45,
			   48,    0,    0,   38,   49,   37,    0,   36,    0,    0,
			    0>>)
		end

	yydefgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			    5,    6,   26,   27,   28,   29,   30,   39,   43,   31,
			   78,    2,    3,    7,   15,   32,   57,   13>>)
		end

	yypact_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   65, -32768, -32768,   15, -32768,   57,   27,   64, -32768,    0,
			   53, -32768, -32768,   39,   59, -32768,   24,    4, -32768, -32768,
			    4, -32768, -32768,    1, -32768, -32768, -32768,   32,    4,    4,
			   21, -32768,   44, -32768,   54, -32768, -32768, -32768,   12,   -3,
			 -32768,   55,   34,   -7, -32768,    4, -32768,   26, -32768,   21,
			 -32768, -32768, -32768,   52, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   -8,   51, -32768,   30,    4, -32768,   25, -32768,
			 -32768,   49,   -6, -32768, -32768, -32768,   10, -32768,   58,   56,
			 -32768>>)
		end

	yypgoto_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			 -32768, -32768,   60,  -11,   46,   28,  -29, -32768,   31, -32768,
			 -32768, -32768,   67,   66, -32768, -32768, -32768, -32768>>)
		end

	yytable_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   49,   25,   65,   65,   24,   76,   38,   61,   75,   23,
			   22,   42,   21,   23,   22,  -10,   21,   47,  -10,   20,
			   41,   69,   64,   60,   77,   19,   18,   17,   12,   19,
			   18,   17,    4,   45,   53,   11,   52,   49,   37,   73,
			   59,    4,   10,   72,   51,   50,   67,   45,   44,   56,
			   55,   54,   46,   45,   44,   35,   80,   34,   79,   74,
			   71,   70,   58,   68,   63,   42,   36,   14,    1,   33,
			    8,    9,   62,   66,   48,   16,    0,    0,    0,    0,
			   40>>)
		end

	yycheck_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yyfixed_array (<<
			   29,    1,   10,   10,    4,   11,   17,   10,   14,    9,
			   10,   10,   12,    9,   10,    0,   12,   28,    3,   19,
			   19,   29,   29,   26,   14,   25,   26,   27,    1,   25,
			   26,   27,   17,   21,   13,    8,   15,   66,   14,   14,
			   28,   17,   15,   18,   23,   24,   20,   21,   22,    5,
			    6,    7,   20,   21,   22,   16,    0,   18,    0,   10,
			   30,   10,    8,   11,   30,   10,    7,    3,    3,   16,
			   13,    5,   41,   45,   28,    8,   -1,   -1,   -1,   -1,
			   20>>)
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

	yytype3 (v: ANY): LX_SYMBOL_CLASS is
		require
			valid_type: yyis_type3 (v)
		do
			Result ?= v
		ensure
			definition: Result = v
		end

	yyis_type3 (v: ANY): BOOLEAN is
		local
			u: LX_SYMBOL_CLASS
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

	yyFinal: INTEGER is 80
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 31
			-- Number of tokens

	yyLast: INTEGER is 80
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 266
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 49
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end -- class LX_LEX_PARSER
