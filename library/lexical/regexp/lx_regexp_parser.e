indexing

	description:

		"Parsers for regular expressions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_REGEXP_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value
		end

	LX_REGEXP_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value
		end

create

	make, make_from_description


feature {NONE} -- Implementation

	yy_build_parser_tables is
			-- Build parser tables.
		do
			yytranslate := yytranslate_template
			yyr1 := yyr1_template
			yytypes1 := yytypes1_template
			yytypes2 := yytypes2_template
			yydefact := yydefact_template
			yydefgoto := yydefgoto_template
			yypact := yypact_template
			yypgoto := yypgoto_template
			yytable := yytable_template
			yycheck := yycheck_template
		end

	yy_create_value_stacks is
			-- Create value stacks.
		do
		end

	yy_init_value_stacks is
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
		end

	yy_clear_value_stacks is
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			if yyvs1 /= Void then
				yyvs1.clear_all
			end
			if yyvs2 /= Void then
				yyvs2.clear_all
			end
			if yyvs3 /= Void then
				yyvs3.clear_all
			end
			if yyvs4 /= Void then
				yyvs4.clear_all
			end
			if yyvs5 /= Void then
				yyvs5.clear_all
			end
		end

	yy_push_last_value (yychar1: INTEGER) is
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					if yyvs1 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs1")
						end
						create yyspecial_routines1
						yyvsc1 := yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.make (yyvsc1)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs1")
						end
						yyvsc1 := yyvsc1 + yyInitial_yyvs_size
						yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
					end
				end
				yyvs1.put (last_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					if yyvs2 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs2")
						end
						create yyspecial_routines2
						yyvsc2 := yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.make (yyvsc2)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs2")
						end
						yyvsc2 := yyvsc2 + yyInitial_yyvs_size
						yyvs2 := yyspecial_routines2.resize (yyvs2, yyvsc2)
					end
				end
				yyvs2.put (last_integer_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					if yyvs3 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs3")
						end
						create yyspecial_routines3
						yyvsc3 := yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.make (yyvsc3)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs3")
						end
						yyvsc3 := yyvsc3 + yyInitial_yyvs_size
						yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
					end
				end
				yyvs3.put (last_lx_symbol_class_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					if yyvs4 = Void then
						debug ("GEYACC")
							std.error.put_line ("Create yyvs4")
						end
						create yyspecial_routines4
						yyvsc4 := yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.make (yyvsc4)
					else
						debug ("GEYACC")
							std.error.put_line ("Resize yyvs4")
						end
						yyvsc4 := yyvsc4 + yyInitial_yyvs_size
						yyvs4 := yyspecial_routines4.resize (yyvs4, yyvsc4)
					end
				end
				yyvs4.put (last_string_value, yyvsp4)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value is
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				if yyvs1 = Void then
					debug ("GEYACC")
						std.error.put_line ("Create yyvs1")
					end
					create yyspecial_routines1
					yyvsc1 := yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.make (yyvsc1)
				else
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
				end
			end
			yyvs1.put (yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER) is
			-- Pop semantic value from stack when in state `yystate'.
		local
			yy_type_id: INTEGER
		do
			yy_type_id := yytypes1.item (yystate)
			inspect yy_type_id
			when 1 then
				yyvsp1 := yyvsp1 - 1
			when 2 then
				yyvsp2 := yyvsp2 - 1
			when 3 then
				yyvsp3 := yyvsp3 - 1
			when 4 then
				yyvsp4 := yyvsp4 - 1
			when 5 then
				yyvsp5 := yyvsp5 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		local
			yyval1: ANY
			yyval5: LX_NFA
			yyval3: LX_SYMBOL_CLASS
		do
			inspect yy_act
when 1 then
--|#line 49 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 49")
end

			if description.equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 58 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 58")
end

			if description.equiv_classes_used then
				description.create_equiv_classes
			end
				-- Initialize for a parse of one pattern.
			in_trail_context := False
			create rule.make_default (1)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 69 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 69")
end

			process_bol_rule (yyvs5.item (yyvsp5))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 73 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 73")
end

			process_rule (yyvs5.item (yyvsp5))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		if yyvs1 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs1")
			end
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs1")
			end
			yyvsc1 := yyvsc1 + yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.resize (yyvs1, yyvsc1)
		end
	end
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 77 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 77")
end

			report_unrecognized_rule_error
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 83 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 83")
end

			has_trail_context := True
			trail_count := regexp_count
			yyval5 := append_trail_context_to_regexp (yyvs5.item (yyvsp5), yyvs5.item (yyvsp5 - 1))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 7 then
--|#line 89 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 89")
end

			has_trail_context := True
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 1
			yyval5 := append_eol_to_regexp (yyvs5.item (yyvsp5))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 8 then
--|#line 98 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 98")
end

			yyval5 := yyvs5.item (yyvsp5)
			has_trail_context := False
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 0
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 9 then
--|#line 107 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 107")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval5 := new_epsilon_nfa
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 10 then
--|#line 114 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 114")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval5 := new_epsilon_nfa
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 11 then
--|#line 123 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 123")
end

			yyval5 := yyvs5.item (yyvsp5)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 12 then
--|#line 130 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 130")
end

			regexp_line := old_regexp_lines.item
			old_regexp_lines.remove
			regexp_column := old_regexp_columns.item
			old_regexp_columns.remove
			regexp_count := old_regexp_counts.item
			old_regexp_counts.remove
			yyval5 := yyvs5.item (yyvsp5 - 2)
			yyval5.build_union (yyvs5.item (yyvsp5))
			process_regexp_or_series
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 13 then
--|#line 130 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 130")
end

			old_regexp_lines.force (regexp_line)
			old_regexp_columns.force (regexp_column)
			old_regexp_counts.force (regexp_count)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp5 := yyvsp5 + 1
	if yyvsp5 >= yyvsc5 then
		if yyvs5 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs5")
			end
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs5")
			end
			yyvsc5 := yyvsc5 + yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
		end
	end
	yyvs5.put (yyval5, yyvsp5)
end
when 14 then
--|#line 150 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 150")
end

			yyval5 := yyvs5.item (yyvsp5)
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			in_trail_context := True
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 15 then
--|#line 162 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 162")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 16 then
--|#line 172 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 172")
end

			singleton_line := old_singleton_lines.item
			old_singleton_lines.remove
			singleton_column := old_singleton_columns.item
			old_singleton_columns.remove
			singleton_count := old_singleton_counts.item
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.build_concatenation (yyvs5.item (yyvsp5))
			process_singleton_series
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 17 then
--|#line 186 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 186")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 18 then
--|#line 195 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 195")
end

			yyval5 := new_nfa_from_character (yyvs2.item (yyvsp2))
			process_singleton_char (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		if yyvs5 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs5")
			end
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs5")
			end
			yyvsc5 := yyvsc5 + yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
		end
	end
	yyvs5.put (yyval5, yyvsp5)
end
when 19 then
--|#line 200 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 200")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_closure
			process_singleton_star
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 20 then
--|#line 206 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 206")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 21 then
--|#line 212 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 212")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_optional
			process_singleton_optional
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 22 then
--|#line 218 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 218")
end

			yyval5 := new_bounded_iteration_nfa (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
			process_singleton_bounded_iteration (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -2
	yyvs5.put (yyval5, yyvsp5)
end
when 23 then
--|#line 223 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 223")
end

			yyval5 := new_unbounded_iteration_nfa (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2))
			process_singleton_unbounded_iteration (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 24 then
--|#line 228 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 228")
end

			yyval5 := new_iteration_nfa (yyvs5.item (yyvsp5), yyvs2.item (yyvsp2))
			process_singleton_fixed_iteration (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 25 then
--|#line 233 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 233")
end

			yyval5 := new_symbol_class_nfa (dot_character_class)
			process_singleton_dot
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp5 >= yyvsc5 then
		if yyvs5 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs5")
			end
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs5")
			end
			yyvsc5 := yyvsc5 + yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
		end
	end
	yyvs5.put (yyval5, yyvsp5)
end
when 26 then
--|#line 238 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 238")
end

			yyval5 := new_symbol_class_nfa (yyvs3.item (yyvsp3))
			process_singleton_symbol_class (yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp5 >= yyvsc5 then
		if yyvs5 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs5")
			end
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs5")
			end
			yyvsc5 := yyvsc5 + yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
		end
	end
	yyvs5.put (yyval5, yyvsp5)
end
when 27 then
--|#line 243 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 243")
end

			yyval5 := new_nfa_from_character_class (yyvs3.item (yyvsp3))
			process_singleton_symbol_class (yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp5 >= yyvsc5 then
		if yyvs5 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs5")
			end
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs5")
			end
			yyvsc5 := yyvsc5 + yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
		end
	end
	yyvs5.put (yyval5, yyvsp5)
end
when 28 then
--|#line 248 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 248")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs5.put (yyval5, yyvsp5)
end
when 29 then
--|#line 252 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 252")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs5.put (yyval5, yyvsp5)
end
when 30 then
--|#line 261 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 261")
end

			yyval3 := yyvs3.item (yyvsp3)
			character_classes.force (yyval3, yyvs4.item (yyvsp4))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 31 then
--|#line 266 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 266")
end

			yyval3 := yyvs3.item (yyvsp3)
			yyval3.set_negated (True)
			character_classes.force (yyval3, yyvs4.item (yyvsp4))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	yyvs3.put (yyval3, yyvsp3)
end
when 32 then
--|#line 274 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 274")
end

			yyval3 := append_character_to_character_class (yyvs2.item (yyvsp2), new_character_class)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp3 := yyvsp3 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp3 >= yyvsc3 then
		if yyvs3 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs3")
			end
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs3")
			end
			yyvsc3 := yyvsc3 + yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
		end
	end
	yyvs3.put (yyval3, yyvsp3)
end
when 33 then
--|#line 278 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 278")
end

			yyval3 := append_character_to_character_class (yyvs2.item (yyvsp2), yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 34 then
--|#line 282 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 282")
end

			yyval3 := append_character_set_to_character_class
				(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), new_character_class)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp3 >= yyvsc3 then
		if yyvs3 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs3")
			end
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs3")
			end
			yyvsc3 := yyvsc3 + yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.resize (yyvs3, yyvsc3)
		end
	end
	yyvs3.put (yyval3, yyvsp3)
end
when 35 then
--|#line 287 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 287")
end

			yyval3 := append_character_set_to_character_class (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 36 then
--|#line 293 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 293")
end

			yyval5 := new_epsilon_nfa
			process_singleton_empty_string
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp5 := yyvsp5 + 1
	if yyvsp5 >= yyvsc5 then
		if yyvs5 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs5")
			end
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs5")
			end
			yyvsc5 := yyvsc5 + yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.resize (yyvs5, yyvsc5)
		end
	end
	yyvs5.put (yyval5, yyvsp5)
end
when 37 then
--|#line 298 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 298")
end

			yyval5 := append_character_to_string (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5))
			process_singleton_string (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs5.put (yyval5, yyvsp5)
end
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_error_action (yy_act: INTEGER) is
			-- Execute error action.
		do
			inspect yy_act
			when 54 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER] is
			-- Template for `yytranslate'
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
			    5, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   32,   33,   34,   34,   34,   23,   23,   23,   23,
			   23,   24,   24,   35,   25,   26,   26,   27,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   31,   31,   30,   30,   30,   30,   29,   29, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    4,    3,    2,    1,
			    5,    5,    5,    5,    5,    5,    3,    1,    5,    5,
			    5,    1,    2,    3,    1,    1,    1,    5,    5,    5,
			    1,    1,    1,    1,    1,    1,    2,    3,    1,    1,
			    2,    5,    1,    2,    1,    2,    1,    5,    1,    1,
			    2,    1,    2,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    3,    4,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,    0,   36,   25,    0,    0,   26,   18,    5,
			    4,    8,    0,   11,   15,   17,   27,    1,    0,    0,
			    3,    0,   32,    0,   14,   13,    7,    6,    9,   16,
			    0,   21,   20,   19,   29,   28,   37,    0,    0,   30,
			   33,    0,   10,    0,   31,   34,    0,   12,   24,    0,
			   35,   23,    0,   22,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   10,   11,   12,   13,   14,   15,   19,   23,   16,   54,
			    1,   17,   41, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,    0,    6, -32768, -32768,    6,    7, -32768, -32768, -32768,
			 -32768,   33,    6, -32768,    6,   23, -32768, -32768,   20,   10,
			 -32768,   47,   27,    1, -32768, -32768, -32768,   22, -32768, -32768,
			   44, -32768, -32768, -32768, -32768, -32768, -32768,   -1,   36, -32768,
			   25,    6, -32768,   29, -32768, -32768,   35, -32768, -32768,   17,
			 -32768, -32768,   30, -32768,   15,    8, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   48,   14,   39,  -14, -32768, -32768, -32768,   31, -32768, -32768,
			 -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   29,    9,   40,    8,   40,    7,    6,    5,   56,    8,
			   22,    7,    6,   36,   21,   55,   18,    4,    3,    2,
			   44,   52,   39,    4,    3,    2,   27,   47,   35,   25,
			   42,   25,   24,   51,   33,   32,   31,   30,   50,   45,
			   34,   26,   25,   24,   49,   48,   53,   46,   43,   38,
			   22,   28,   37,   20, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   14,    1,    3,    3,    3,    5,    6,    7,    0,    3,
			    3,    5,    6,    3,    7,    0,    2,   17,   18,   19,
			   21,    4,   21,   17,   18,   19,   12,   41,   18,    9,
			    8,    9,   10,   16,   11,   12,   13,   14,    3,    3,
			   20,    8,    9,   10,   15,   16,   16,   22,    4,   22,
			    3,   12,   21,    5, yyDummy>>)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [ANY]
			-- Stack for semantic values of type ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [ANY]
			-- Routines that ought to be in SPECIAL [ANY]

	yyvs2: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs3: SPECIAL [LX_SYMBOL_CLASS]
			-- Stack for semantic values of type LX_SYMBOL_CLASS

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS]
			-- Routines that ought to be in SPECIAL [LX_SYMBOL_CLASS]

	yyvs4: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs5: SPECIAL [LX_NFA]
			-- Stack for semantic values of type LX_NFA

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LX_NFA]
			-- Routines that ought to be in SPECIAL [LX_NFA]

feature {NONE} -- Constants

	yyFinal: INTEGER is 56
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 23
			-- Number of tokens

	yyLast: INTEGER is 53
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 260
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 36
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

end
