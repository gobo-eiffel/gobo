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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_LEX_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
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
				yyspecial_routines2.force (yyvs2, last_string_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_integer_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_lx_symbol_class_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_lx_unicode_character_class_value, yyvsp5)
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
			yyval3: INTEGER
			yyval6: LX_NFA
			yyval4: LX_SYMBOL_CLASS
			yyval5: LX_UNICODE_CHARACTER_CLASS
		do
				inspect yy_act
when 1 then
--|#line 63 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 63")
end

			process_default_rule
			if description.equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 73 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 73")
end

			override_options
			if description.equiv_classes_used then
				description.create_equiv_classes
			end
			unicode_mode.force (description.unicode_mode)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 83 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 83")
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
--|#line 84 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 84")
end

			start_condition_stack.keep_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 88 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 88")
end

			start_condition_stack.keep_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 94 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 94")
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
--|#line 95 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 95")
end

			set_action (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 99 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 99")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 100 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 100")
end

			set_action ("")
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 106 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 106")
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
--|#line 114 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 114")
end

			yyval3 := start_condition_stack.count
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp3 := yyvsp3 + 1
	if yyvsp3 >= yyvsc3 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs3")
		end
		yyvsc3 := yyvsc3 + yyInitial_yyvs_size
		yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
	end
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 12 then
--|#line 118 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 118")
end

			yyval3 := yyvs3.item (yyvsp3)
			start_condition_stack.append_start_conditions (description.start_conditions)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 13 then
--|#line 123 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 123")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 14 then
--|#line 127 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 127")
end

			yyval3 := start_condition_stack.count
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp3 := yyvsp3 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp3 >= yyvsc3 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs3")
		end
		yyvsc3 := yyvsc3 + yyInitial_yyvs_size
		yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
	end
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 15 then
--|#line 133 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 133")
end

			push_start_condition (yyvs2.item (yyvsp2), start_condition_stack)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 137 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 137")
end

			push_start_condition (yyvs2.item (yyvsp2), start_condition_stack)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 141 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 141")
end

			report_bad_start_condition_list_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 147 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 147")
end

			has_bol_context := True
			process_rule (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 152 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 152")
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
--|#line 157 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 157")
end

			process_eof_rule
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 161 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 161")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 167 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 167")
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
--|#line 176 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 176")
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
--|#line 185 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 185")
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
--|#line 191 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 191")
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
--|#line 198 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 198")
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
--|#line 207 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 207")
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
--|#line 214 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 214")
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
when 29 then
--|#line 214 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 214")
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
when 30 then
--|#line 235 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 235")
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
when 31 then
--|#line 247 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 247")
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
when 32 then
--|#line 257 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 257")
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
when 33 then
--|#line 271 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 271")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 34 then
--|#line 280 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 280")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval6 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
				process_singleton_char (yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 35 then
--|#line 297 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 297")
end

			yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
			process_singleton_char (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 36 then
--|#line 302 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 302")
end

			if yyvs3.item (yyvsp3) <= {CHARACTER_8}.max_ascii_value then
				yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
				process_singleton_char (yyvs3.item (yyvsp3))
			else
				yyval6 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 37 then
--|#line 319 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 319")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_closure
			process_singleton_star
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 38 then
--|#line 325 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 325")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 39 then
--|#line 331 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 331")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_optional
			process_singleton_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 40 then
--|#line 337 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 337")
end

			yyval6 := new_bounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
			process_singleton_bounded_iteration (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 41 then
--|#line 342 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 342")
end

			yyval6 := new_unbounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3))
			process_singleton_unbounded_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 42 then
--|#line 347 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 347")
end

			yyval6 := new_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3))
			process_singleton_fixed_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 43 then
--|#line 352 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 352")
end

			if unicode_mode.item then
				yyval6 := new_nfa_from_unicode_character_class (dot_unicode_character_class)
			else
				yyval6 := new_symbol_class_nfa (dot_character_class)
			end
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
when 44 then
--|#line 361 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 361")
end

			yyval6 := new_symbol_class_nfa (yyvs4.item (yyvsp4))
			process_singleton_symbol_class (yyvs4.item (yyvsp4))
		
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
when 45 then
--|#line 366 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 366")
end

			yyval6 := new_nfa_from_character_class (yyvs4.item (yyvsp4))
			process_singleton_symbol_class (yyvs4.item (yyvsp4))
		
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
when 46 then
--|#line 371 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 371")
end

			yyval6 := new_nfa_from_unicode_character_class (yyvs5.item (yyvsp5))
			process_singleton_unicode_character_class (yyvs5.item (yyvsp5))
		
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
when 47 then
--|#line 376 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 376")
end

			yyval6 := new_nfa_from_unicode_character_class (yyvs5.item (yyvsp5))
			process_singleton_unicode_character_class (yyvs5.item (yyvsp5))
		
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
when 48 then
--|#line 381 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 381")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 49 then
--|#line 385 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 385")
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
when 50 then
--|#line 392 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 392")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			unicode_mode.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 51 then
--|#line 400 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 400")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			unicode_mode.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 52 then
--|#line 410 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 410")
end

			unicode_mode.force (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 53 then
--|#line 416 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 416")
end

			unicode_mode.force (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 422 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 422")
end

			yyval4 := yyvs4.item (yyvsp4)
			character_classes.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 55 then
--|#line 427 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 427")
end

			yyval4 := yyvs4.item (yyvsp4)
			yyval4.set_negated (True)
			character_classes.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 56 then
--|#line 435 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 435")
end

			yyval5 := yyvs5.item (yyvsp5)
			unicode_character_classes.force (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 57 then
--|#line 440 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 440")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.set_negated (True)
			unicode_character_classes.force (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 58 then
--|#line 448 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 448")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), new_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 59 then
--|#line 452 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 452")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 60 then
--|#line 456 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 456")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), new_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 + 1
	yyvsp3 := yyvsp3 -2
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
when 61 then
--|#line 460 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 460")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 62 then
--|#line 466 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 466")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 63 then
--|#line 470 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 470")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 64 then
--|#line 476 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 476")
end

			yyval5 := append_character_to_unicode_character_class (yyvs3.item (yyvsp3), new_unicode_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 65 then
--|#line 480 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 480")
end

			yyval5 := append_character_to_unicode_character_class (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 66 then
--|#line 484 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 484")
end

			yyval5 := append_character_set_to_unicode_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), new_unicode_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -2
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
when 67 then
--|#line 488 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 488")
end

			yyval5 := append_character_set_to_unicode_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 68 then
--|#line 494 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 494")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 69 then
--|#line 498 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 498")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 70 then
--|#line 504 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 504")
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
when 71 then
--|#line 509 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 509")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
				process_singleton_string (yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 72 then
--|#line 525 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 525")
end

			yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
			process_singleton_string (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 73 then
--|#line 530 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 530")
end

			if yyvs3.item (yyvsp3) <= {CHARACTER_8}.max_ascii_value then
				yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
				process_singleton_string (yyvs3.item (yyvsp3))
			else
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 74 then
--|#line 548 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 548")
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
when 75 then
--|#line 549 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 549")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 76 then
--|#line 550 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 550")
end

			description.set_eiffel_code (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
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
			when 110 then
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
			create an_array.make_filled (0, 0, 273)
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
			    2,    2,    2,    2,   32,    2,   26,    2,    2,    2,
			   33,   34,   21,   29,   24,   36,   31,   28,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   23,    2,   22,   30,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   35,   25,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   19,   27,   20,    2,    2,    2,    2,
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
			   15,   16,   17,   18, yyDummy>>,
			1, 74, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   52,   53,   54,   54,   54,   58,   58,   58,   58,
			   55,   37,   37,   37,   38,   59,   59,   59,   57,   57,
			   57,   57,   41,   41,   41,   41,   41,   42,   42,   60,
			   43,   44,   44,   45,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   61,   62,   49,   49,   51,   51,   48,   48,
			   48,   48,   39,   39,   50,   50,   50,   50,   40,   40,
			   47,   47,   47,   47,   56,   56,   56, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    3,    3,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    5,    4,    3,    3,    3,    2,    2,    1,    1,
			    1,    1,    6,    6,    6,    6,    6,    6,    4,    5,
			    1,    1,    1,    1,    1,    1,    2,    1,    6,    6,
			    6,    1,    3,    3,    3,    5,    1,    3,    3,    3,
			    4,    1,    1,    1,    6,    6,    6,    1,    1,    1,
			    1,    2,    1,    1,    1,    6,    6,    2,    1,    1,
			    3,    3,    3,    5,    1,    1,    3,    4,    1,    1,
			    3,    6,    1,    3,    1,    1,    1,    3,    1,    1,

			    3,    1,    6,    1,    1,    3,    3,    1,    3,    1,
			    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    2,    2,    3,    3,    3,    3,    4,    5,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    2,    3,   11,   14,   10,    0,   74,    3,    0,
			    0,   15,   17,    0,   75,    1,   11,    0,   70,   43,
			    0,   46,   44,   36,   35,   34,    0,    0,   53,   52,
			   20,   21,   19,   22,    0,   27,   31,   33,   45,   47,
			    6,    0,    0,   12,    0,   13,   76,    5,    0,    0,
			   18,    0,   69,   68,   64,    0,    0,   63,   62,   58,
			    0,   30,   29,   23,   24,   25,   32,   39,   38,   37,
			    0,    7,    9,    8,    4,    0,    0,   16,   49,   48,
			   73,   72,   71,    0,    0,   56,   65,    0,    0,   54,
			   59,    0,   26,    0,   50,   51,   57,   66,    0,   55,

			   60,    0,   28,    0,   42,   67,   61,   41,    0,   40,
			    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    5,    6,   59,   54,   32,   33,   34,   35,   36,   37,
			   49,   60,   38,   55,   39,  110,    2,    3,    7,   15,
			   40,   74,   13,   91,   41,   42, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  110, -32768, -32768,    5, -32768,   93,    1,   97, -32768,    2,
			   71, -32768, -32768,   87,   77, -32768,   -2,   35, -32768, -32768,
			   35, -32768, -32768, -32768, -32768, -32768,   59,   11, -32768, -32768,
			 -32768, -32768, -32768,   79,   35, -32768,   35,   61, -32768, -32768,
			   92,   35,   35, -32768,   82, -32768, -32768, -32768,   62,   56,
			 -32768,   95, -32768, -32768,   39,   44,   27, -32768, -32768,   29,
			   50, -32768, -32768, -32768,   76, -32768, -32768, -32768, -32768, -32768,
			   65, -32768, -32768, -32768, -32768,   60,   49, -32768, -32768, -32768,
			 -32768, -32768, -32768,   43,   95, -32768,   15,   25,   27, -32768,
			  -10,   35, -32768,   75, -32768, -32768, -32768, -32768,   95, -32768,

			 -32768,   27, -32768,   57, -32768, -32768, -32768, -32768,    3, -32768,
			   12,    7, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  -56,  -54,   96,   20,   84,  -36, -32768, -32768,
			 -32768,   63, -32768,   66, -32768, -32768, -32768,  107,  109, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   66,   86,   12,   31,   90,  -10,   30,  112,  -10,   29,
			   28,   11,  111,   27,   26,   25,   24,   23,   47,   22,
			   21,    4,   10,  109,   58,   57,  101,   20,    4,   86,
			   97,   90,  100,   19,   18,   17,   56,   48,   58,   57,
			   58,   57,   29,   28,  105,  106,   27,   26,   25,   24,
			   23,   98,   22,   21,   64,  102,   53,   53,   52,   52,
			   99,   75,   76,   58,   57,   88,   19,   18,   17,   82,
			   81,   80,   53,  108,   52,   84,   62,  107,   96,   85,
			   70,   93,   69,   95,   51,   89,   46,   62,   79,   62,
			   68,   67,   77,   43,   94,  104,   78,   73,   72,  103,

			   14,   71,   92,   62,   61,   63,   62,   61,   53,   45,
			   52,   44,    8,    1,    9,   16,   50,   83,   65,   87, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   36,   55,    1,    1,   60,    0,    4,    0,    3,    7,
			    8,   10,    0,   11,   12,   13,   14,   15,   20,   17,
			   18,   23,   21,   20,   13,   14,   36,   25,   23,   83,
			   84,   87,   88,   31,   32,   33,   25,   17,   13,   14,
			   13,   14,    7,    8,   98,  101,   11,   12,   13,   14,
			   15,   36,   17,   18,   34,   91,   13,   13,   15,   15,
			   35,   41,   42,   13,   14,   36,   31,   32,   33,   13,
			   14,   15,   13,   16,   15,   36,   27,   20,   35,   35,
			   19,   16,   21,   34,   25,   35,    9,   27,   32,   27,
			   29,   30,   10,   22,   34,   20,   34,    5,    6,   24,

			    3,    9,   26,   27,   28,   26,   27,   28,   13,   22,
			   15,   24,   19,    3,    5,    8,   20,   51,   34,   56, yyDummy>>)
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

	yyvs2: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

	yyvs3: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs4: SPECIAL [LX_SYMBOL_CLASS]
			-- Stack for semantic values of type LX_SYMBOL_CLASS

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS]
			-- Routines that ought to be in SPECIAL [LX_SYMBOL_CLASS]

	yyvs5: SPECIAL [LX_UNICODE_CHARACTER_CLASS]
			-- Stack for semantic values of type LX_UNICODE_CHARACTER_CLASS

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LX_UNICODE_CHARACTER_CLASS]
			-- Routines that ought to be in SPECIAL [LX_UNICODE_CHARACTER_CLASS]

	yyvs6: SPECIAL [LX_NFA]
			-- Stack for semantic values of type LX_NFA

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [LX_NFA]
			-- Routines that ought to be in SPECIAL [LX_NFA]

feature {NONE} -- Constants

	yyFinal: INTEGER = 112
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 37
			-- Number of tokens

	yyLast: INTEGER = 119
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 273
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 63
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

end
