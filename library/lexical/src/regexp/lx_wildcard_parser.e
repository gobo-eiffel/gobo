note

	description:

		"Parsers for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"

class LX_WILDCARD_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_WILDCARD_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner,
			push_start_condition as lex_push_start_condition
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
			yyval5: LX_NFA
			yyval4: LX_SYMBOL_CLASS
		do
				inspect yy_act
when 1 then
--|#line 59 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 59")
end

			set_maximum_symbol_equivalence_class
			if description.equiv_classes_used then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 69 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 69")
end

				-- Initialize for a parse of one pattern.
			in_trail_context := False
			create rule.make_default (1)
		
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
when 3 then
--|#line 77 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 77")
end

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
when 4 then
--|#line 81 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 81")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 87 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 87")
end

			yyval5 := yyvs5.item (yyvsp5)
			has_trail_context := False
			head_count := Zero_or_more
			head_line := Zero_or_more
			head_column := Zero_or_more
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 6 then
--|#line 98 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 98")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 7 then
--|#line 102 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 102")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.build_union (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 8 then
--|#line 109 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 109")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 9 then
--|#line 113 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 113")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.build_concatenation (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 10 then
--|#line 120 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 120")
end

			if utf8_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval5 := new_epsilon_nfa
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval5 := append_character_to_string (buffer.item_code (i_), yyval5)
					i_ := i_ + 1
				end
			else
				yyval5 := new_nfa_from_character (yyvs3.item (yyvsp3))
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
when 11 then
--|#line 134 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 134")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 12 then
--|#line 139 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 139")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_positive_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 13 then
--|#line 144 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 144")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 14 then
--|#line 149 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 149")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 15 then
--|#line 153 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 153")
end

			yyval5 := new_nfa_from_character_class (question_character_class)
			yyval5.build_closure
		
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
when 16 then
--|#line 158 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 158")
end

			yyval5 := new_nfa_from_character_class (question_character_class)
		
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
when 17 then
--|#line 162 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 162")
end

			yyval5 := new_nfa_from_character_class (question_character_class)
			yyval5.build_positive_closure
			yyval5.build_concatenation (new_nfa_from_character (Slash_code))
			yyval5.build_closure
		
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
when 18 then
--|#line 169 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 169")
end

			yyval5 := new_nfa_from_character_class (yyvs4.item (yyvsp4))
		
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
when 19 then
--|#line 173 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 173")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 20 then
--|#line 179 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 179")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 21 then
--|#line 181 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 181")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 22 then
--|#line 183 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 183")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 23 then
--|#line 187 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 187")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 24 then
--|#line 189 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 189")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 25 then
--|#line 191 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 191")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 26 then
--|#line 195 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 195")
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
when 27 then
--|#line 206 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 206")
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
when 28 then
--|#line 220 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 220")
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
when 29 then
--|#line 224 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 224")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 30 then
--|#line 228 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 228")
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
when 31 then
--|#line 232 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 232")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 32 then
--|#line 238 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 238")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
			yyval4.add_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 33 then
--|#line 243 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 243")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
			yyval4.remove_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 34 then
--|#line 250 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 250")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 35 then
--|#line 252 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 252")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 36 then
--|#line 256 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 256")
end

yyval4 := yyvs4.item (yyvsp4).twin 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 37 then
--|#line 258 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 258")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 38 then
--|#line 260 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 260")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 39 then
--|#line 264 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 264")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 40 then
--|#line 266 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 266")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 41 then
--|#line 270 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 270")
end

			yyval5 := new_epsilon_nfa
		
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
when 42 then
--|#line 274 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 274")
end

			if utf8_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval5 := yyvs5.item (yyvsp5)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval5 := append_character_to_string (buffer.item_code (i_), yyval5)
					i_ := i_ + 1
				end
			else
				yyval5 := append_character_to_string (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
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
			when 65 then
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
			create an_array.make_filled (0, 0, 264)
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
			    2,    2,    2,    2,   17,    2,    2,    2,    2,    2,
			   13,   11,   16,   12,    2,   20,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   14,   15,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   18,   19,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   10,    2,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9, yyDummy>>,
			1, 65, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   34,   35,   36,   36,   21,   22,   22,   23,   23,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   26,   26,   26,   27,   27,   27,   28,   28,   29,   29,
			   29,   29,   30,   30,   31,   31,   32,   32,   32,   33,
			   33,   25,   25, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    4,    3,
			    2,    1,    1,    1,    5,    5,    5,    4,    4,    4,
			    4,    4,    4,    1,    5,    1,    1,    4,    4,    4,
			    1,    1,    3,    4,    5,    5,    5,    1,    1,    1,
			    3,    5,    5,    1,    1,    1,    5,    4,    1,    1,
			    3,    1,    1,    4,    4,    4,    4,    1,    1,    1,
			    1,    3,    1,    5,    3,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    3,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,   41,   15,    0,   16,    0,    0,   23,   10,
			    0,    0,   17,    4,    3,    5,    8,   18,   36,   24,
			   37,   38,    0,    1,    0,    0,    0,   36,   37,   38,
			    0,    0,   28,    0,    0,    6,    9,    0,    0,   19,
			   42,    0,    0,   25,   34,   35,    0,    0,    0,   26,
			   29,   11,    0,   39,   40,   33,   32,   14,   13,   12,
			   27,   30,    0,    7,   31,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   14,   34,   35,   16,   24,   17,   18,   19,   33,   20,
			   21,   22,   55,   65,    1,   23, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,   25, -32768, -32768,  102,  101,   96,   98, -32768, -32768,
			    5,   83, -32768, -32768, -32768,   83, -32768, -32768,   68, -32768,
			   50,    3,   85, -32768,    6,   83,   83,   99,   97,   91,
			   83,  100,   32,   41,   94,   83, -32768,   96,   96, -32768,
			 -32768,   81,   66, -32768, -32768, -32768,   59,   40,   39, -32768,
			  -15, -32768,   83, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   19,   83, -32768,   27,   22, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768,   18,   -1,  -14, -32768, -32768,   -2, -32768,   82,  106,
			   -4, -32768,   69, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   15,   36,   29,  -22,   27,   62,  -22,  -22,  -22,  -22,
			  -22,   32,   40,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			  -22,   36,   67,   39,   31,   64,   13,   66,   12,   11,
			   10,    9,    8,   54,   54,   53,   53,    7,    6,    5,
			    4,    3,    2,   41,   42,   61,   50,   50,   46,   36,
			  -21,   63,   48,  -21,  -21,  -21,  -21,  -21,   60,   49,
			  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -20,   52,
			   59,  -20,  -20,  -20,  -20,  -20,   52,   58,  -20,  -20,
			  -20,  -20,  -20,  -20,  -20,  -20,   12,   11,   10,    9,
			    8,   52,   57,   38,   37,    7,    6,    5,    4,    3,

			    2,   10,   45,    8,   52,   51,   32,   56,   44,    6,
			   43,   30,   28,   47,   26,   25, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,   15,    6,    0,    6,   20,    3,    4,    5,    6,
			    7,    6,    6,   10,   11,   12,   13,   14,   15,   16,
			   17,   35,    0,   17,   19,    6,    1,    0,    3,    4,
			    5,    6,    7,   37,   38,   37,   38,   12,   13,   14,
			   15,   16,   17,   25,   26,    6,    6,    6,   30,   63,
			    0,   52,   20,    3,    4,    5,    6,    7,   18,   18,
			   10,   11,   12,   13,   14,   15,   16,   17,    0,   10,
			   11,    3,    4,    5,    6,    7,   10,   11,   10,   11,
			   12,   13,   14,   15,   16,   17,    3,    4,    5,    6,
			    7,   10,   11,    8,    9,   12,   13,   14,   15,   16,

			   17,    5,   11,    7,   10,   11,    6,   38,   11,   13,
			   11,   13,    6,   31,   13,   13, yyDummy>>)
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

	yyFinal: INTEGER = 67
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 21
			-- Number of tokens

	yyLast: INTEGER = 115
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 264
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 37
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

feature {NONE} -- Implementation

	question_character_class: LX_SYMBOL_CLASS
			-- "?" character class (i.e. all characters except /)
		local
			question_string: STRING_32
			l_character_classes_by_name: like character_classes_by_name
		do
			create question_string.make (1)
			question_string.append_character ({CHARACTER_32} '?')
			if utf8_mode.item then
				l_character_classes_by_name := utf8_character_classes_by_name
			else
				l_character_classes_by_name := character_classes_by_name
			end
			l_character_classes_by_name.search (question_string)
			if l_character_classes_by_name.found then
				Result := l_character_classes_by_name.found_item
			else
				Result := new_character_class 
				Result.add_symbol (Slash_code)
				Result.set_negated (True)
				character_classes.search (Result)
				if character_classes.found then
					Result := character_classes.found_item
				else
					character_classes.force_new (Result)
				end
				l_character_classes_by_name.force_new (Result, question_string)
			end
		ensure
			question_character_class_not_void: Result /= Void
		end
		
end
