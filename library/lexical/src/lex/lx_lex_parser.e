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
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
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
			yyval5: LX_NFA
			yyval4: LX_SYMBOL_CLASS
		do
				inspect yy_act
when 1 then
--|#line 63 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 63")
end

			process_default_rule
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
--|#line 73 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 73")
end

			override_options
			unicode_mode.force (description.unicode_mode)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 80 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 80")
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
--|#line 81 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 81")
end

			start_condition_stack.keep_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 85 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 85")
end

			start_condition_stack.keep_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 91 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 91")
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
--|#line 92 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 92")
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
--|#line 96 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 96")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 97 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 97")
end

			set_action ("")
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 103 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 103")
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
--|#line 111 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 111")
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
--|#line 115 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 115")
end

			yyval3 := yyvs3.item (yyvsp3)
			start_condition_stack.append_start_conditions (description.start_conditions)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 13 then
--|#line 120 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 120")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 14 then
--|#line 124 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 124")
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
--|#line 130 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 130")
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
--|#line 134 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 134")
end

			push_start_condition (yyvs2.item (yyvsp2), start_condition_stack)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 138 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 138")
end

			report_bad_start_condition_list_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 144 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 144")
end

			has_bol_context := True
			process_rule (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 149 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 149")
end

			has_bol_context := False
			process_rule (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
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
--|#line 154 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 154")
end

			process_eof_rule
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 158 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 158")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 164 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 164")
end

			yyval5 := yyvs5.item (yyvsp5)
			has_trail_context := False
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 23 then
--|#line 173 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 173")
end

			has_trail_context := True
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 1
			yyval5 := append_eol_to_regexp (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 24 then
--|#line 182 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 182")
end

			has_trail_context := True
			trail_count := regexp_count
			yyval5 := append_trail_context_to_regexp (yyvs5.item (yyvsp5), yyvs5.item (yyvsp5 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 25 then
--|#line 188 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 188")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval5 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 26 then
--|#line 195 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 195")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval5 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 27 then
--|#line 204 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 204")
end

			yyval5 := yyvs5.item (yyvsp5)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 28 then
--|#line 211 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 211")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 29 then
--|#line 215 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 215")
end

			yyval5 := yyvs5.item (yyvsp5)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 30 then
--|#line 222 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 222")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 31 then
--|#line 226 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 226")
end

			yyval5 := yyvs5.item (yyvsp5)
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			in_trail_context := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 32 then
--|#line 238 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 238")
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
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 33 then
--|#line 238 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 238")
end

			yyval5 := yyvs5.item (yyvsp5)
			old_regexp_lines.force (regexp_line)
			old_regexp_columns.force (regexp_column)
			old_regexp_counts.force (regexp_count)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp5 := yyvsp5 + 1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 34 then
--|#line 259 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 259")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 35 then
--|#line 269 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 269")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 36 then
--|#line 273 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 273")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 37 then
--|#line 283 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 283")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 38 then
--|#line 287 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 287")
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
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 39 then
--|#line 301 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 301")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 40 then
--|#line 310 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 310")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 41 then
--|#line 319 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 319")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 42 then
--|#line 321 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 321")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 43 then
--|#line 325 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 325")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval5 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval5 := append_character_to_string (buffer.item_code (i_), yyval5)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval5 := new_nfa_from_character (yyvs3.item (yyvsp3))
				process_singleton_char (yyvs3.item (yyvsp3))
			end
		
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
when 44 then
--|#line 342 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 342")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_closure
			process_singleton_star
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 45 then
--|#line 348 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 348")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 46 then
--|#line 354 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 354")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_optional
			process_singleton_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 47 then
--|#line 360 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 360")
end

			yyval5 := new_bounded_iteration_nfa (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
			process_singleton_bounded_iteration (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 48 then
--|#line 365 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 365")
end

			yyval5 := new_unbounded_iteration_nfa (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
			process_singleton_unbounded_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 49 then
--|#line 370 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 370")
end

			yyval5 := new_iteration_nfa (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
			process_singleton_fixed_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 50 then
--|#line 375 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 375")
end

			yyval5 := new_nfa_from_character_class (dot_character_class)
			process_singleton_dot
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
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
when 51 then
--|#line 380 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 380")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 52 then
--|#line 384 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 384")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 53 then
--|#line 391 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 391")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			unicode_mode.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 54 then
--|#line 399 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 399")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			unicode_mode.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 55 then
--|#line 409 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 409")
end

			yyval5 := new_nfa_from_character_class (yyvs4.item (yyvsp4))
			process_singleton_symbol_class (yyvs4.item (yyvsp4))
		
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
when 56 then
--|#line 416 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 416")
end

			unicode_mode.force (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 422 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 422")
end

			unicode_mode.force (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 58 then
--|#line 428 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 428")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 59 then
--|#line 430 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 430")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 60 then
--|#line 432 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 432")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 61 then
--|#line 436 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 436")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 62 then
--|#line 438 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 438")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 63 then
--|#line 440 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 440")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 64 then
--|#line 444 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 444")
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
when 65 then
--|#line 455 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 455")
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
when 66 then
--|#line 469 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 469")
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
when 67 then
--|#line 473 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 473")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 68 then
--|#line 477 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 477")
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
when 69 then
--|#line 481 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 481")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 70 then
--|#line 487 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 487")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
			yyval4.add_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 71 then
--|#line 492 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 492")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
			yyval4.remove_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 72 then
--|#line 499 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 499")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 73 then
--|#line 501 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 501")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 74 then
--|#line 505 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 505")
end

yyval4 := yyvs4.item (yyvsp4).twin 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 75 then
--|#line 507 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 507")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 76 then
--|#line 509 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 509")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 77 then
--|#line 513 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 513")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 78 then
--|#line 515 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 515")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 79 then
--|#line 519 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 519")
end

			yyval5 := new_epsilon_nfa
			process_singleton_empty_string
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp5 := yyvsp5 + 1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 80 then
--|#line 524 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 524")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval5 := yyvs5.item (yyvsp5)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval5 := append_character_to_string (buffer.item_code (i_), yyval5)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval5 := append_character_to_string (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
				process_singleton_string (yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 81 then
--|#line 542 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 542")
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
--|#line 543 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 543")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 83 then
--|#line 544 "lx_lex_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_lex_parser.y' at line 544")
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
			create an_array.make_filled (0, 0, 271)
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
			    2,    2,    2,    2,   30,    2,   24,    2,    2,    2,
			   31,   32,   19,   27,   22,   34,   29,   25,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   21,    2,   20,   28,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   33,   23,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   17,   26,   18,    2,    2,    2,    2,
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
			   15,   16, yyDummy>>,
			1, 72, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   59,   60,   61,   61,   61,   65,   65,   65,   65,
			   62,   35,   35,   35,   36,   66,   66,   66,   64,   64,
			   64,   64,   37,   37,   37,   37,   37,   38,   38,   39,
			   39,   40,   41,   67,   42,   42,   43,   43,   44,   45,
			   46,   47,   47,   48,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   49,   68,   69,   51,   51,
			   51,   52,   52,   52,   53,   53,   54,   54,   54,   54,
			   55,   55,   56,   56,   57,   57,   57,   58,   58,   50,
			   50,   63,   63,   63, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    3,    3,    1,    1,    1,
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    4,    3,    2,    1,    1,    1,    1,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    4,    4,
			    4,    4,    4,    4,    1,    1,    1,    1,    1,    1,
			    2,    1,    5,    5,    5,    5,    5,    5,    5,    4,
			    4,    4,    5,    5,    1,    3,    4,    1,    1,    1,
			    5,    5,    5,    1,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    5,    5,    2,    1,    1,    1,    1,
			    1,    3,    4,    1,    1,    3,    5,    1,    3,    1,

			    4,    4,    4,    4,    1,    1,    1,    3,    1,    5,
			    1,    1,    4,    4,    4,    3,    1,    3,    1,    1,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    2,    3,    3,    4,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1, yyDummy>>)
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
			  185, -32768, -32768,   37, -32768,  169,   49,  182, -32768,   41,
			  163, -32768, -32768,   78,  171, -32768,   25,  222, -32768, -32768,
			  222, -32768, -32768,   57, -32768, -32768, -32768, -32768, -32768,  166,
			  222, -32768, -32768, -32768,  222,  140, -32768, -32768, -32768,  118,
			 -32768,   85,    4,  138,  160,  222,  222, -32768,  154, -32768,
			 -32768, -32768,  153,  130,  134, -32768,  114, -32768,  106,  196,
			  170,  144,   -6, -32768,  122,   97,   14, -32768, -32768, -32768,
			   51, -32768, -32768, -32768, -32768, -32768,  120,   43,   43, -32768,
			 -32768, -32768, -32768,   55,   47, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,    8,  116, -32768,   86,  222, -32768,   83,   43,

			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,   95, -32768,
			    1, -32768,   63,   46,   24, -32768, -32768,   26, -32768,   39,
			   17, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  197,   21, -32768,  184,  194,  -31, -32768,  192,
			 -32768, -32768, -32768,  189, -32768, -32768, -32768,  -15, -32768,  141,
			  -16,  -17, -32768,  117, -32768, -32768,  186,  188, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 253)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   61,   60,   59,   72,  -60,  -60,   91,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  117,  -60,  -60,  121,  -60,  116,
			   95,  -60,  -60,  -60,   90,  -60,   95,  -60,  -60,  -60,
			  -60,  -60,  -60,  -60,  -60,  -60,  -60,  -10,   52,  120,
			  -10,  106,   27,   51,  118,   26,    4,   94,   25,   24,
			   12,   70,   23,   22,   23,   21,   89,   21,    4,   11,
			  101,  101,  100,  100,   20,  109,   83,   84,   10,   65,
			   19,   18,   17,   67,   99,   97,   68,   67,   88,  105,
			   64,   67,  114,  113,  112,  -59,  -59,  104,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,   87,  -59,  -59,   49,  -59,

			   48,  111,  -59,  -59,  -59,  110,  -59,  115,  -59,  -59,
			  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -59,  -58,  -58,
			  108,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  107,  -58,
			  -58,   93,  -58,   98,   65,  -58,  -58,  -58,  -40,  -58,
			  -35,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,  -58,
			  -58,  -60,  -60,   78,   77,  -60,  -60,   76,  -60,   75,
			  -28,  -60,   86,  -60,   85,   81,   80,   74,   73,   79,
			  -60,  -60,  -60,  -60,  -60,  -60,   89,  -59,  -59,   67,
			   50,  -59,  -59,   47,  -59,   14,    8,  -59,    1,  -59,
			   69,   68,   67,    9,   16,  103,  -59,  -59,  -59,  -59, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  -59,  -59,   88,  -58,  -58,   92,   58,  -58,  -58,   56,
			  -58,   54,    0,  -58,   71,  -58,    0,   63,    0,    0,
			    0,    0,  -58,  -58,  -58,  -58,  -58,  -58,   87,   25,
			   24,    0,    0,   23,   22,    0,   21,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   19,   18,   17, yyDummy>>,
			1, 54, 200)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 253)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   17,   17,   17,   34,    0,    1,   12,    3,    4,    5,
			    6,    7,    8,    9,   13,   11,   12,    0,   14,   18,
			   12,   17,   18,   19,   30,   21,   12,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,    0,   17,    0,
			    3,   33,    1,   18,   18,    4,   21,   33,    7,    8,
			    1,   30,   11,   12,   11,   14,   32,   14,   21,   10,
			   77,   78,   77,   78,   23,   96,   45,   46,   19,   12,
			   29,   30,   31,   26,   31,   24,   25,   26,   32,   32,
			   23,   26,   99,   99,   99,    0,    1,   32,    3,    4,
			    5,    6,    7,    8,    9,   32,   11,   12,   20,   14,

			   22,   18,   17,   18,   19,   22,   21,   12,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,    0,    1,
			   34,    3,    4,    5,    6,    7,    8,    9,   12,   11,
			   12,   34,   14,   13,   12,   17,   18,   19,   32,   21,
			   26,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,    7,    8,   15,   16,   11,   12,   17,   14,   19,
			   26,   17,   32,   19,   10,    5,    6,   27,   28,    9,
			   26,   27,   28,   29,   30,   31,   32,    7,    8,   26,
			    9,   11,   12,   20,   14,    3,   17,   17,    3,   19,
			   24,   25,   26,    5,    8,   78,   26,   27,   28,   29, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   30,   31,   32,    7,    8,   64,   17,   11,   12,   17,
			   14,   17,   -1,   17,   30,   19,   -1,   20,   -1,   -1,
			   -1,   -1,   26,   27,   28,   29,   30,   31,   32,    7,
			    8,   -1,   -1,   11,   12,   -1,   14,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   29,   30,   31, yyDummy>>,
			1, 54, 200)
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

	yyvs5: SPECIAL [LX_NFA]
			-- Stack for semantic values of type LX_NFA

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LX_NFA]
			-- Routines that ought to be in SPECIAL [LX_NFA]

feature {NONE} -- Constants

	yyFinal: INTEGER = 121
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 35
			-- Number of tokens

	yyLast: INTEGER = 253
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 271
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 70
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

end
