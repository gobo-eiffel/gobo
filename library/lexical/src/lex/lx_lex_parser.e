note

	description:

		"Parsers for lexical analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_LEX_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_LEX_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description


feature {NONE} -- Implementation

	yy_build_parser_tables
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

	yy_create_value_stacks
			-- Create value stacks.
		do
			create yyspecial_routines1
			yyvsc1 := yyInitial_yyvs_size
			yyvs1 := yyspecial_routines1.make (yyvsc1)
			create yyspecial_routines2
			yyvsc2 := yyInitial_yyvs_size
			yyvs2 := yyspecial_routines2.make (yyvsc2)
			create yyspecial_routines3
			yyvsc3 := yyInitial_yyvs_size
			yyvs3 := yyspecial_routines3.make (yyvsc3)
			create yyspecial_routines4
			yyvsc4 := yyInitial_yyvs_size
			yyvs4 := yyspecial_routines4.make (yyvsc4)
			create yyspecial_routines5
			yyvsc5 := yyInitial_yyvs_size
			yyvs5 := yyspecial_routines5.make (yyvsc5)
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
			yyvsp6 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
			yyvs5.keep_head (0)
			yyvs6.keep_head (0)
		end

	yy_push_last_value (yychar1: INTEGER)
			-- Push semantic value associated with token `last_token'
			-- (with internal id `yychar1') on top of corresponding
			-- value stack.
		do
			inspect yytypes2.item (yychar1)
			when 1 then
				yyvsp1 := yyvsp1 + 1
				if yyvsp1 >= yyvsc1 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs1")
					end
					yyvsc1 := yyvsc1 + yyInitial_yyvs_size
					yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
				end
				yyspecial_routines1.force (yyvs1, last_detachable_any_value, yyvsp1)
			when 2 then
				yyvsp2 := yyvsp2 + 1
				if yyvsp2 >= yyvsc2 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs2")
					end
					yyvsc2 := yyvsc2 + yyInitial_yyvs_size
					yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
				end
				yyspecial_routines2.force (yyvs2, last_string_32_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_string_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_integer_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_lx_symbol_class_value, yyvsp5)
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: not a token type: ")
					std.error.put_integer (yytypes2.item (yychar1))
					std.error.put_new_line
				end
				abort
			end
		end

	yy_push_error_value
			-- Push semantic value associated with token 'error'
			-- on top of corresponding value stack.
		local
			yyval1: detachable ANY
		do
			yyvsp1 := yyvsp1 + 1
			if yyvsp1 >= yyvsc1 then
				debug ("GEYACC")
					std.error.put_line ("Resize yyvs1")
				end
				yyvsc1 := yyvsc1 + yyInitial_yyvs_size
				yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
			end
			yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
		end

	yy_pop_last_value (yystate: INTEGER)
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
			when 6 then
				yyvsp6 := yyvsp6 - 1
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown type id: ")
					std.error.put_integer (yy_type_id)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_run_geyacc
			-- You must run geyacc to regenerate this class.
		do
		end

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER)
			-- Execute semantic action.
		local
			yyval1: detachable ANY
			yyval4: INTEGER
			yyval6: LX_NFA
			yyval5: LX_SYMBOL_CLASS
		do
				inspect yy_act
when 1 then
--|#line 66 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 66")
end

			process_default_rule
			set_maximum_symbol_equivalence_class
			if description.equiv_classes_used then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 77 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 77")
end

			override_options
			utf8_mode.force (description.utf8_mode)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 84 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 84")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 85 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 85")
end

			start_condition_stack.keep_first (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 89 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 89")
end

			start_condition_stack.keep_first (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 95 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 95")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 96 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 96")
end

			set_action (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 100 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 100")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 101 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 101")
end

			set_action ("")
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 107 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 107")
end

				-- Initialize for a parse of one rule.
			in_trail_context := False
			create rule.make_default (description.rules.count + 1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 115 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 115")
end

			yyval4 := start_condition_stack.count
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp4 := yyvsp4 + 1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 12 then
--|#line 119 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 119")
end

			yyval4 := yyvs4.item (yyvsp4)
			start_condition_stack.append_start_conditions (description.start_conditions)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 13 then
--|#line 124 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 124")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 14 then
--|#line 128 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 128")
end

			yyval4 := start_condition_stack.count
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 15 then
--|#line 134 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 134")
end

			push_start_condition (yyvs3.item (yyvsp3), start_condition_stack)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 138 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 138")
end

			push_start_condition (yyvs3.item (yyvsp3), start_condition_stack)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 142 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 142")
end

			report_bad_start_condition_list_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 148 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 148")
end

			has_bol_context := True
			process_rule (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 153 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 153")
end

			has_bol_context := False
			process_rule (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 158 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 158")
end

			process_eof_rule
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 162 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 162")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 168 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 168")
end

			yyval6 := yyvs6.item (yyvsp6)
			has_trail_context := False
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 23 then
--|#line 177 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 177")
end

			has_trail_context := True
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 1
			yyval6 := append_eol_to_regexp (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 24 then
--|#line 186 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 186")
end

			has_trail_context := True
			trail_count := regexp_count
			yyval6 := append_trail_context_to_regexp (yyvs6.item (yyvsp6), yyvs6.item (yyvsp6 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 25 then
--|#line 192 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 192")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval6 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 26 then
--|#line 199 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 199")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval6 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 27 then
--|#line 208 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 208")
end

			yyval6 := yyvs6.item (yyvsp6)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 28 then
--|#line 215 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 215")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 29 then
--|#line 219 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 219")
end

			yyval6 := yyvs6.item (yyvsp6)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 30 then
--|#line 226 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 226")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 31 then
--|#line 230 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 230")
end

			yyval6 := yyvs6.item (yyvsp6)
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			in_trail_context := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 32 then
--|#line 242 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 242")
end

			regexp_line := old_regexp_lines.item
			old_regexp_lines.remove
			regexp_column := old_regexp_columns.item
			old_regexp_columns.remove
			regexp_count := old_regexp_counts.item
			old_regexp_counts.remove
			yyval6 := yyvs6.item (yyvsp6 - 2)
			yyval6.build_union (yyvs6.item (yyvsp6))
			process_regexp_or_series
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 33 then
--|#line 242 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 242")
end

			yyval6 := yyvs6.item (yyvsp6)
			old_regexp_lines.force (regexp_line)
			old_regexp_columns.force (regexp_column)
			old_regexp_counts.force (regexp_count)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 34 then
--|#line 263 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 263")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval6 := yyvs6.item (yyvsp6)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 35 then
--|#line 273 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 273")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 36 then
--|#line 277 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 277")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval6 := yyvs6.item (yyvsp6)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 37 then
--|#line 287 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 287")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 38 then
--|#line 291 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 291")
end

			singleton_line := old_singleton_lines.item
			old_singleton_lines.remove
			singleton_column := old_singleton_columns.item
			old_singleton_columns.remove
			singleton_count := old_singleton_counts.item
			old_singleton_counts.remove
			yyval6 := yyvs6.item (yyvsp6 - 1)
			yyval6.build_concatenation (yyvs6.item (yyvsp6))
			process_singleton_series
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 39 then
--|#line 305 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 305")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 40 then
--|#line 314 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 314")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 41 then
--|#line 323 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 323")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 42 then
--|#line 325 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 325")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 43 then
--|#line 329 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 329")
end

			if utf8_mode.item and yyvs4.item (yyvsp4) > {CHARACTER_8}.max_ascii_value then
				yyval6 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs4.item (yyvsp4))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval6 := new_nfa_from_character (yyvs4.item (yyvsp4))
				process_singleton_char (yyvs4.item (yyvsp4))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 44 then
--|#line 346 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 346")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_closure
			process_singleton_star
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 45 then
--|#line 352 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 352")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 46 then
--|#line 358 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 358")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_optional
			process_singleton_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 47 then
--|#line 364 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 364")
end

			yyval6 := new_bounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
			process_singleton_bounded_iteration (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 48 then
--|#line 369 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 369")
end

			yyval6 := new_unbounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs4.item (yyvsp4))
			process_singleton_unbounded_iteration (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp4 := yyvsp4 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 49 then
--|#line 374 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 374")
end

			yyval6 := new_iteration_nfa (yyvs6.item (yyvsp6), yyvs4.item (yyvsp4))
			process_singleton_fixed_iteration (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 50 then
--|#line 379 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 379")
end

			yyval6 := new_nfa_from_character_class (dot_character_class)
			process_singleton_dot
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 51 then
--|#line 384 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 384")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 52 then
--|#line 388 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 388")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 53 then
--|#line 395 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 395")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			if description.utf8_mode then
				utf8_mode.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 54 then
--|#line 405 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 405")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			if description.utf8_mode then
				utf8_mode.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 55 then
--|#line 417 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 417")
end

			yyval6 := new_nfa_from_character_class (yyvs5.item (yyvsp5))
			process_singleton_symbol_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 56 then
--|#line 424 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 424")
end

			if description.utf8_mode then
				utf8_mode.force (True)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 432 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 432")
end

			if description.utf8_mode then
				utf8_mode.force (False)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 58 then
--|#line 440 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 440")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 59 then
--|#line 442 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 442")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 60 then
--|#line 444 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 444")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 61 then
--|#line 448 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 448")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 62 then
--|#line 450 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 450")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 63 then
--|#line 452 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 452")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 64 then
--|#line 456 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 456")
end

			yyval5 := yyvs5.item (yyvsp5)
			character_classes.search (yyval5)
			if character_classes.found then
				yyval5 := character_classes.found_item
			else
				character_classes.force_new (yyval5)
			end
			character_classes_by_name.force (yyval5, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 65 then
--|#line 467 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 467")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.set_negated (True)
			character_classes.search (yyval5)
			if character_classes.found then
				yyval5 := character_classes.found_item
			else
				character_classes.force_new (yyval5)
			end
			character_classes_by_name.force (yyval5, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 66 then
--|#line 481 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 481")
end

			yyval5 := append_character_to_character_class (yyvs4.item (yyvsp4), new_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 67 then
--|#line 485 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 485")
end

			yyval5 := append_character_to_character_class (yyvs4.item (yyvsp4), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 68 then
--|#line 489 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 489")
end

			yyval5 := append_character_set_to_character_class (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), new_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 69 then
--|#line 493 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 493")
end

			yyval5 := append_character_set_to_character_class (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 70 then
--|#line 499 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 499")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.add_symbol_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 71 then
--|#line 504 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 504")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.remove_symbol_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 72 then
--|#line 511 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 511")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 73 then
--|#line 513 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 513")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 74 then
--|#line 517 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 517")
end

yyval5 := yyvs5.item (yyvsp5).twin 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 75 then
--|#line 519 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 519")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 76 then
--|#line 521 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 521")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 77 then
--|#line 525 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 525")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 78 then
--|#line 527 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 527")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 79 then
--|#line 531 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 531")
end

			yyval6 := new_epsilon_nfa
			process_singleton_empty_string
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 80 then
--|#line 536 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 536")
end

			if utf8_mode.item and yyvs4.item (yyvsp4) > {CHARACTER_8}.max_ascii_value then
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs4.item (yyvsp4))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval6 := append_character_to_string (yyvs4.item (yyvsp4), yyvs6.item (yyvsp6))
				process_singleton_string (yyvs4.item (yyvsp4))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 81 then
--|#line 554 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 554")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp1 := yyvsp1 + 1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 82 then
--|#line 555 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 555")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 83 then
--|#line 556 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 556")
end

			description.set_eiffel_code (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
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

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 119 then
					-- End-of-file expected action.
				report_eof_expected_error
			else
					-- Default action.
				report_error ("parse error")
			end
		end

feature {NONE} -- Table templates

	yytranslate_template: SPECIAL [INTEGER]
			-- Template for `yytranslate'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 272)
			yytranslate_template_1 (an_array)
			yytranslate_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytranslate_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   31,    2,   25,    2,    2,    2,
			   32,   33,   20,   28,   23,   35,   30,   26,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   22,    2,   21,   29,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   34,   24,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   18,   27,   19,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2, yyDummy>>,
			1, 200, 0)
		end

	yytranslate_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytranslate'.
		do
			yyarray_subcopy (an_array, <<
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    1,    2,    3,    4,
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17, yyDummy>>,
			1, 73, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   60,   61,   62,   62,   62,   66,   66,   66,   66,
			   63,   36,   36,   36,   37,   67,   67,   67,   65,   65,
			   65,   65,   38,   38,   38,   38,   38,   39,   39,   40,
			   40,   41,   42,   68,   43,   43,   44,   44,   45,   46,
			   47,   48,   48,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   50,   69,   70,   52,   52,
			   52,   53,   53,   53,   54,   54,   55,   55,   55,   55,
			   56,   56,   57,   57,   58,   58,   58,   59,   59,   51,
			   51,   64,   64,   64, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    4,    4,    1,    1,    1,
			    1,    3,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    5,    4,    3,    1,    1,    1,    1,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    5,    5,
			    5,    5,    5,    5,    1,    1,    1,    1,    1,    1,
			    3,    1,    6,    6,    6,    6,    6,    6,    6,    5,
			    5,    5,    6,    6,    1,    4,    5,    1,    1,    1,
			    6,    6,    6,    1,    1,    1,    1,    1,    1,    3,
			    1,    1,    1,    6,    6,    3,    1,    1,    1,    1,
			    1,    4,    5,    1,    1,    4,    6,    1,    4,    1,

			    5,    5,    5,    5,    1,    1,    1,    4,    1,    6,
			    1,    1,    5,    5,    5,    4,    1,    4,    1,    1,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    3,    3,    4,    4,    5,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    2,    3,   11,   14,   10,    0,   81,    3,    0,
			    0,   15,   17,    0,   82,    1,   11,    0,   79,   50,
			    0,   61,   43,    0,   57,   56,   20,   21,   19,   22,
			    0,   28,   27,   35,   34,   39,   41,   42,   55,   74,
			   62,   75,   76,    0,    6,    0,    0,   12,    0,   13,
			   83,    5,    0,    0,   30,   29,   37,   36,   41,   74,
			   75,   76,    0,   18,    0,   66,    0,   33,   31,   23,
			   24,   25,   38,   46,   45,   44,    0,    0,    0,    7,
			    9,    8,    4,    0,    0,   16,   52,   63,   72,   73,
			   51,   80,    0,    0,   64,   67,    0,   26,    0,    0,

			   77,   78,   71,   70,   53,   54,   65,   68,    0,   32,
			    0,   49,   74,   75,   76,   69,   48,    0,   47,    0,
			    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    5,    6,   28,   29,   53,   30,   31,   32,   55,   33,
			   34,   57,   35,   36,   37,   62,   38,   39,   40,   66,
			   41,   42,   43,  102,  119,    2,    3,    7,   15,   44,
			   82,   13,   96,   45,   46, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  187, -32768, -32768,   18, -32768,  171,   57,  169, -32768,   40,
			  166, -32768, -32768,   73,  159, -32768,   59,  209, -32768, -32768,
			  209, -32768, -32768,   30, -32768, -32768, -32768, -32768, -32768,  157,
			  209, -32768, -32768, -32768,  209,  142, -32768, -32768, -32768,  119,
			 -32768,   85,    4,  151,   96,  209,  209, -32768,  152, -32768,
			 -32768, -32768,  115,  132,  113, -32768,  109, -32768,  102,  200,
			  173,  146,   43, -32768,  117,   98,   12, -32768, -32768, -32768,
			  130, -32768, -32768, -32768, -32768, -32768,  114,   27,   27, -32768,
			 -32768, -32768, -32768,   46,   42, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   -7,   95, -32768,   86,  209, -32768,   26,   27,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   63, -32768,
			    1, -32768,   66,   54,   47, -32768, -32768,   38, -32768,   50,
			   13, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  190,   21, -32768,  179,  182,  -31, -32768,  181,
			 -32768, -32768, -32768,  180, -32768, -32768, -32768,  -15, -32768,  131,
			  -16,  -17, -32768,  118, -32768, -32768,  184,  189, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 241)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   61,   60,   59,   72,  -60,  -60,   95,  -60,  -60,  -60,
			  -60,  -60,  -60,  121,  -60,  117,  -60,  -60,  -10,  -60,
			  116,  -10,  -60,  -60,  -60,   95,  -60,  106,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -60,   52,   23,
			    4,   27,   21,   65,   26,  111,   94,   25,   24,  110,
			  120,   70,   23,   22,   64,   21,   91,  118,   12,   99,
			  101,  101,  100,  100,   20,  109,   83,   84,   11,   67,
			   19,   18,   17,   67,   90,  105,  115,   10,   51,  104,
			   89,    4,  114,  113,  112,  -59,  -59,   88,  -59,  -59,
			  -59,  -59,  -59,  -59,   49,  -59,   48,  -59,  -59,   87,

			  -59,   81,   80,  -59,  -59,  -59,   79,  -59,  107,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -58,
			  -58,  108,  -58,  -58,  -58,  -58,  -58,  -58,   98,  -58,
			   65,  -58,  -58,   93,  -58,  -40,  -35,  -58,  -58,  -58,
			  -28,  -58,   67,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -58,  -58,  -60,  -60,   97,   68,   67,  -60,  -60,
			   76,  -60,   75,   85,  -60,   86,  -60,   78,   77,   50,
			   74,   73,   14,  -60,  -60,  -60,  -60,  -60,  -60,   89,
			  -59,  -59,   69,   68,   67,  -59,  -59,   47,  -59,    8,
			    1,  -59,   16,  -59,    9,   92,  103,   58,   56,   54, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  -59,  -59,  -59,  -59,  -59,  -59,   88,  -58,  -58,   71,
			   63,    0,  -58,  -58,    0,  -58,   25,   24,  -58,    0,
			  -58,   23,   22,    0,   21,    0,    0,  -58,  -58,  -58,
			  -58,  -58,  -58,   87,    0,    0,    0,    0,    0,   19,
			   18,   17, yyDummy>>,
			1, 42, 200)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 241)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   17,   17,   17,   34,    0,    1,   13,    3,    4,    5,
			    6,    7,    8,    0,   10,   14,   12,   13,    0,   15,
			   19,    3,   18,   19,   20,   13,   22,   34,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   17,   12,
			   22,    1,   15,   13,    4,   19,   34,    7,    8,   23,
			    0,   30,   12,   13,   24,   15,   13,   19,    1,   32,
			   77,   78,   77,   78,   24,   96,   45,   46,   11,   27,
			   30,   31,   32,   27,   31,   33,   13,   20,   19,   33,
			   33,   22,   99,   99,   99,    0,    1,   33,    3,    4,
			    5,    6,    7,    8,   21,   10,   23,   12,   13,   33,

			   15,    5,    6,   18,   19,   20,   10,   22,   13,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,    0,
			    1,   35,    3,    4,    5,    6,    7,    8,   14,   10,
			   13,   12,   13,   35,   15,   33,   27,   18,   19,   20,
			   27,   22,   27,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,    7,    8,   25,   26,   27,   12,   13,
			   18,   15,   20,   11,   18,   33,   20,   16,   17,   10,
			   28,   29,    3,   27,   28,   29,   30,   31,   32,   33,
			    7,    8,   25,   26,   27,   12,   13,   21,   15,   18,
			    3,   18,    8,   20,    5,   64,   78,   17,   17,   17, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   27,   28,   29,   30,   31,   32,   33,    7,    8,   30,
			   20,   -1,   12,   13,   -1,   15,    7,    8,   18,   -1,
			   20,   12,   13,   -1,   15,   -1,   -1,   27,   28,   29,
			   30,   31,   32,   33,   -1,   -1,   -1,   -1,   -1,   30,
			   31,   32, yyDummy>>,
			1, 42, 200)
		end

feature {NONE} -- Semantic value stacks

	yyvs1: SPECIAL [detachable ANY]
			-- Stack for semantic values of type detachable ANY

	yyvsc1: INTEGER
			-- Capacity of semantic value stack `yyvs1'

	yyvsp1: INTEGER
			-- Top of semantic value stack `yyvs1'

	yyspecial_routines1: KL_SPECIAL_ROUTINES [detachable ANY]
			-- Routines that ought to be in SPECIAL [detachable ANY]

	yyvs2: SPECIAL [STRING_32]
			-- Stack for semantic values of type STRING_32

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING_32]
			-- Routines that ought to be in SPECIAL [STRING_32]

	yyvs3: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs4: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs5: SPECIAL [LX_SYMBOL_CLASS]
			-- Stack for semantic values of type LX_SYMBOL_CLASS

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS]
			-- Routines that ought to be in SPECIAL [LX_SYMBOL_CLASS]

	yyvs6: SPECIAL [LX_NFA]
			-- Stack for semantic values of type LX_NFA

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [LX_NFA]
			-- Routines that ought to be in SPECIAL [LX_NFA]

feature {NONE} -- Constants

	yyFinal: INTEGER = 121
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 36
			-- Number of tokens

	yyLast: INTEGER = 241
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 272
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 71
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
