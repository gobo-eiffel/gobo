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
--|#line 68 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 68")
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
--|#line 78 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 78")
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
--|#line 88 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 88")
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
--|#line 89 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 89")
end

			start_condition_stack.keep_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 93 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 93")
end

			start_condition_stack.keep_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 99 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 99")
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
--|#line 100 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 100")
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
--|#line 104 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 104")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 105 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 105")
end

			set_action ("")
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 111 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 111")
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
--|#line 119 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 119")
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
--|#line 123 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 123")
end

			yyval3 := yyvs3.item (yyvsp3)
			start_condition_stack.append_start_conditions (description.start_conditions)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 13 then
--|#line 128 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 128")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 14 then
--|#line 132 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 132")
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
--|#line 138 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 138")
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
--|#line 142 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 142")
end

			push_start_condition (yyvs2.item (yyvsp2), start_condition_stack)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 146 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 146")
end

			report_bad_start_condition_list_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 152 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 152")
end

			has_bol_context := True
			process_rule (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 157 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 157")
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
--|#line 162 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 162")
end

			process_eof_rule
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 166 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 166")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 172 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 172")
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
--|#line 181 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 181")
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
--|#line 190 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 190")
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
--|#line 196 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 196")
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
--|#line 203 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 203")
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
--|#line 212 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 212")
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
--|#line 219 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 219")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 29 then
--|#line 223 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 223")
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
--|#line 230 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 230")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 31 then
--|#line 234 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 234")
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
--|#line 246 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 246")
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
--|#line 246 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 246")
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
--|#line 267 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 267")
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
--|#line 277 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 277")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 36 then
--|#line 281 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 281")
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
--|#line 291 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 291")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 38 then
--|#line 295 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 295")
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
--|#line 309 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 309")
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
--|#line 318 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 318")
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
--|#line 327 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 327")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 42 then
--|#line 329 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 329")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 43 then
--|#line 333 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 333")
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
when 44 then
--|#line 350 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 350")
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
when 45 then
--|#line 355 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 355")
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
when 46 then
--|#line 372 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 372")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_closure
			process_singleton_star
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 47 then
--|#line 378 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 378")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 48 then
--|#line 384 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 384")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_optional
			process_singleton_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 49 then
--|#line 390 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 390")
end

			yyval6 := new_bounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
			process_singleton_bounded_iteration (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 50 then
--|#line 395 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 395")
end

			yyval6 := new_unbounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3))
			process_singleton_unbounded_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 51 then
--|#line 400 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 400")
end

			yyval6 := new_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3))
			process_singleton_fixed_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 52 then
--|#line 405 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 405")
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
when 53 then
--|#line 414 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 414")
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
when 54 then
--|#line 419 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 419")
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
when 55 then
--|#line 424 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 424")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 56 then
--|#line 428 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 428")
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
when 57 then
--|#line 435 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 435")
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
when 58 then
--|#line 443 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 443")
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
when 59 then
--|#line 453 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 453")
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
when 60 then
--|#line 460 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 460")
end

			unicode_mode.force (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 61 then
--|#line 466 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 466")
end

			unicode_mode.force (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 472 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 472")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 63 then
--|#line 474 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 474")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 64 then
--|#line 476 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 476")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 65 then
--|#line 480 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 480")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 66 then
--|#line 482 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 482")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 67 then
--|#line 484 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 484")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 68 then
--|#line 488 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 488")
end

			yyval4 := yyvs4.item (yyvsp4)
			character_classes.search (yyval4)
			if character_classes.found then
				yyval4 := character_classes.found_item
			else
				character_classes.force_new (yyval4)
			end
			character_classes_by_name.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 69 then
--|#line 499 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 499")
end

			yyval4 := yyvs4.item (yyvsp4)
			yyval4.set_negated (True)
			character_classes.search (yyval4)
			if character_classes.found then
				yyval4 := character_classes.found_item
			else
				character_classes.force_new (yyval4)
			end
			character_classes_by_name.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 70 then
--|#line 513 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 513")
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
when 71 then
--|#line 517 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 517")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 72 then
--|#line 521 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 521")
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
when 73 then
--|#line 525 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 525")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 74 then
--|#line 531 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 531")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 75 then
--|#line 535 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 535")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 76 then
--|#line 541 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 541")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 77 then
--|#line 545 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 545")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 78 then
--|#line 551 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 551")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 79 then
--|#line 553 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 553")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 80 then
--|#line 557 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 557")
end

yyval4 := yyvs4.item (yyvsp4).twin 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 81 then
--|#line 559 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 559")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 82 then
--|#line 561 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 561")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 83 then
--|#line 565 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 565")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 84 then
--|#line 567 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 567")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 85 then
--|#line 571 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 571")
end

			yyval5 := yyvs5.item (yyvsp5)
			unicode_character_classes.force (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 86 then
--|#line 576 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 576")
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
when 87 then
--|#line 584 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 584")
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
when 88 then
--|#line 588 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 588")
end

			yyval5 := append_character_to_unicode_character_class (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 89 then
--|#line 592 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 592")
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
when 90 then
--|#line 596 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 596")
end

			yyval5 := append_character_set_to_unicode_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 91 then
--|#line 602 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 602")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 92 then
--|#line 606 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 606")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 93 then
--|#line 612 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 612")
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
when 94 then
--|#line 617 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 617")
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
when 95 then
--|#line 633 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 633")
end

			yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
			process_singleton_string (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 96 then
--|#line 638 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 638")
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
when 97 then
--|#line 656 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 656")
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
when 98 then
--|#line 657 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 657")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 99 then
--|#line 658 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 658")
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
			when 141 then
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
			create an_array.make_filled (0, 0, 275)
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
			    2,    2,    2,    2,   34,    2,   28,    2,    2,    2,
			   35,   36,   23,   31,   26,   38,   33,   29,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   25,    2,   24,   32,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   37,   27,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   21,   30,   22,    2,    2,    2,    2,
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
			   15,   16,   17,   18,   19,   20, yyDummy>>,
			1, 76, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   67,   68,   69,   69,   69,   73,   73,   73,   73,
			   70,   39,   39,   39,   40,   74,   74,   74,   72,   72,
			   72,   72,   43,   43,   43,   43,   43,   44,   44,   45,
			   45,   46,   47,   75,   48,   48,   49,   49,   50,   51,
			   52,   53,   53,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   55,
			   76,   77,   57,   57,   57,   58,   58,   58,   59,   59,
			   60,   60,   60,   60,   41,   41,   61,   61,   62,   62,
			   63,   63,   63,   64,   64,   66,   66,   65,   65,   65,
			   65,   42,   42,   56,   56,   56,   56,   71,   71,   71, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    3,    3,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    5,    4,    3,    3,    3,    2,    2,    1,    1,
			    1,    1,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    4,    4,    4,    4,    4,    4,    5,    1,
			    1,    1,    1,    1,    1,    2,    1,    6,    6,    6,
			    6,    6,    6,    6,    4,    4,    4,    6,    6,    1,
			    3,    3,    3,    5,    1,    3,    3,    3,    4,    1,
			    1,    1,    6,    6,    6,    1,    1,    1,    1,    1,
			    1,    2,    1,    1,    1,    6,    6,    2,    1,    1,

			    1,    1,    1,    3,    3,    3,    5,    1,    1,    3,
			    4,    1,    1,    3,    6,    1,    3,    1,    4,    4,
			    4,    4,    1,    1,    1,    3,    1,    1,    3,    1,
			    6,    1,    1,    4,    4,    4,    3,    3,    1,    3,
			    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    2,    2,    3,    3,    3,    3,    4,    5,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    2,    3,   11,   14,   10,    0,   97,    3,    0,
			    0,   15,   17,    0,   98,    1,   11,    0,   93,   52,
			    0,   53,   65,   45,   44,   43,    0,    0,   61,   60,
			   20,   21,   19,   22,    0,   28,   27,   35,   34,   39,
			   41,   42,   59,   80,   66,   81,   82,    0,   54,    6,
			    0,    0,   12,    0,   13,   99,    5,    0,    0,   30,
			   29,   37,   36,   41,   80,   81,   82,    0,   18,    0,
			   92,   91,   87,    0,    0,   75,   74,   70,    0,   33,
			   31,   23,   24,   25,   38,   48,   47,   46,    0,    0,
			    0,    7,    9,    8,    4,    0,    0,   16,   56,   67,

			   78,   79,   55,   96,   95,   94,    0,    0,   85,   88,
			    0,    0,   68,   71,    0,   26,    0,    0,   83,   84,
			   77,   76,   57,   58,   86,   89,    0,   69,   72,    0,
			   32,    0,   51,   80,   81,   82,   90,   73,   50,    0,
			   49,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    5,    6,   77,   72,   32,   33,   58,   34,   35,   36,
			   60,   37,   38,   62,   39,   40,   41,   67,   42,   43,
			   44,   78,   45,   46,   47,  120,   73,   48,  141,    2,
			    3,    7,   15,   49,   94,   13,  114,   50,   51, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			  200, -32768, -32768,    5, -32768,  180,   76,  194, -32768,    8,
			  172, -32768, -32768,  203,  178, -32768,    7,   48, -32768, -32768,
			   48, -32768, -32768, -32768, -32768, -32768,   21,    4, -32768, -32768,
			 -32768, -32768, -32768,  233,   48, -32768, -32768, -32768,   48,   57,
			 -32768, -32768, -32768,  177, -32768,  140,  103,  197, -32768,   44,
			   48,   48, -32768,  183, -32768, -32768, -32768,  136,  143,  134,
			 -32768,  130, -32768,  123,  267,  237,  207,  219, -32768,   72,
			 -32768, -32768,  118,   56,  109, -32768, -32768,  112,   54, -32768,
			 -32768, -32768,   66, -32768, -32768, -32768, -32768, -32768,  126,   16,
			   16, -32768, -32768, -32768, -32768,   83,   62, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768, -32768,   39,   72, -32768,   91,
			   33,  109, -32768,   89,   48, -32768,  -12,   16, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,   72, -32768, -32768,  109,
			 -32768,   68, -32768,   69,   61,   28, -32768, -32768, -32768,    2,
			 -32768,   13,    6, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  -71,  -69,  244,   -6, -32768,  225,  239,  -35,
			 -32768,  230, -32768, -32768, -32768,  229, -32768, -32768, -32768,  -15,
			 -32768,  162,  -16,  -17, -32768,  145,  157, -32768, -32768, -32768,
			  223,  218, -32768, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 303)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   66,   65,   64,   84,  109,  -10,  143,  113,  -10,   31,
			  132,   57,   30,  142,  131,   29,   28,   76,   75,   27,
			   26,   25,   24,   23,  140,   22,   21,   27,   82,   56,
			    4,   74,    4,   22,   71,   20,   70,  109,  125,  113,
			  128,   19,   18,   17,   95,   96,   76,   75,   69,   93,
			   92,  117,   71,   91,   70,   29,   28,  136,  137,   27,
			   26,   25,   24,   23,  101,   22,   21,   76,   75,   71,
			  127,   70,  119,  119,  118,  118,  124,   12,   88,  130,
			   87,   19,   18,   17,  139,   71,   11,   70,   86,   85,
			  138,  112,   79,  108,  115,   80,   79,  100,  123,   10,

			  135,  134,  133,  -64,  -64,   99,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,   79,  -64,  -64,  -64,  -64,  -64,  122,
			  -64,  -64,   76,   75,  -64,  -64,  -64,  129,  -64,  126,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -63,  -63,  116,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  111,  -63,  -63,  -63,  -63,  -63,  107,  -63,  -63,  -40,
			  -35,  -63,  -63,  -63,  -28,  -63,   79,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -62,  -62,   98,
			  -62,  -62,  -62,  -62,  -62,  -62,  -62,   55,  -62,  -62,
			  -62,  -62,  -62,   97,  -62,  -62,   52,   14,  -62,  -62, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  -62,    8,  -62,    1,  -62,  -62,  -62,  -62,  -62,  -62,
			  -62,  -62,  -62,  -62,  -64,  -64,   90,   89,  -64,  -64,
			  -64,  -64,  -64,    9,  -64,  -64,  106,   54,  -64,   53,
			  -64,   16,  105,  104,  103,  121,  110,  -64,  -64,  -64,
			  -64,  -64,  -64,  101,  -63,  -63,   63,   61,  -63,  -63,
			  -63,  -63,  -63,  102,  -63,  -63,   59,    0,  -63,   83,
			  -63,   81,   80,   79,   68,    0,    0,  -63,  -63,  -63,
			  -63,  -63,  -63,  100,  -62,  -62,    0,    0,  -62,  -62,
			  -62,  -62,  -62,    0,  -62,  -62,    0,    0,  -62,    0,
			  -62,    0,    0,    0,    0,    0,    0,  -62,  -62,  -62,

			  -62,  -62,  -62,   99, yyDummy>>,
			1, 104, 200)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 303)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   17,   17,   17,   38,   73,    0,    0,   78,    3,    1,
			   22,   17,    4,    0,   26,    7,    8,   13,   14,   11,
			   12,   13,   14,   15,   22,   17,   18,   11,   34,   22,
			   25,   27,   25,   17,   13,   27,   15,  106,  107,  110,
			  111,   33,   34,   35,   50,   51,   13,   14,   27,    5,
			    6,   35,   13,    9,   15,    7,    8,  126,  129,   11,
			   12,   13,   14,   15,   36,   17,   18,   13,   14,   13,
			   37,   15,   89,   90,   89,   90,   37,    1,   21,  114,
			   23,   33,   34,   35,   16,   13,   10,   15,   31,   32,
			   22,   37,   30,   37,   28,   29,   30,   36,   36,   23,

			  117,  117,  117,    0,    1,   36,    3,    4,    5,    6,
			    7,    8,    9,   30,   11,   12,   13,   14,   15,   36,
			   17,   18,   13,   14,   21,   22,   23,   38,   25,   38,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			    0,    1,   16,    3,    4,    5,    6,    7,    8,    9,
			   38,   11,   12,   13,   14,   15,   38,   17,   18,   36,
			   30,   21,   22,   23,   30,   25,   30,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,    0,    1,   36,
			    3,    4,    5,    6,    7,    8,    9,    9,   11,   12,
			   13,   14,   15,   10,   17,   18,   24,    3,   21,   22, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   23,   21,   25,    3,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,    7,    8,   19,   20,   11,   12,
			   13,   14,   15,    5,   17,   18,   69,   24,   21,   26,
			   23,    8,   13,   14,   15,   90,   74,   30,   31,   32,
			   33,   34,   35,   36,    7,    8,   17,   17,   11,   12,
			   13,   14,   15,   34,   17,   18,   17,   -1,   21,   34,
			   23,   28,   29,   30,   20,   -1,   -1,   30,   31,   32,
			   33,   34,   35,   36,    7,    8,   -1,   -1,   11,   12,
			   13,   14,   15,   -1,   17,   18,   -1,   -1,   21,   -1,
			   23,   -1,   -1,   -1,   -1,   -1,   -1,   30,   31,   32,

			   33,   34,   35,   36, yyDummy>>,
			1, 104, 200)
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

	yyFinal: INTEGER = 143
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 39
			-- Number of tokens

	yyLast: INTEGER = 303
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 275
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 78
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
