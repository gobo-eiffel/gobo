note

	description:

		"Parsers for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			yyval6: LX_NFA
			yyval5: LX_SYMBOL_CLASS
		do
				inspect yy_act
when 1 then
--|#line 61 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 61")
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
--|#line 71 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 71")
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
--|#line 79 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 79")
end

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
when 4 then
--|#line 83 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 83")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 89 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 89")
end

			yyval6 := yyvs6.item (yyvsp6)
			has_trail_context := False
			head_count := Zero_or_more
			head_line := Zero_or_more
			head_column := Zero_or_more
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 6 then
--|#line 100 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 100")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 7 then
--|#line 104 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 104")
end

			yyval6 := yyvs6.item (yyvsp6 - 1)
			yyval6.build_union (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 8 then
--|#line 111 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 111")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 9 then
--|#line 115 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 115")
end

			yyval6 := yyvs6.item (yyvsp6 - 1)
			yyval6.build_concatenation (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 10 then
--|#line 122 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 122")
end

			if utf8_mode.item and yyvs4.item (yyvsp4) > {CHARACTER_8}.max_ascii_value then
				yyval6 := new_epsilon_nfa
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs4.item (yyvsp4))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					i_ := i_ + 1
				end
			else
				yyval6 := new_nfa_from_character (yyvs4.item (yyvsp4))
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
when 11 then
--|#line 136 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 136")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 12 then
--|#line 141 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 141")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_positive_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 13 then
--|#line 146 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 146")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 14 then
--|#line 151 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 151")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 15 then
--|#line 155 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 155")
end

			yyval6 := new_nfa_from_character_class (question_character_class)
			yyval6.build_closure
		
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
when 16 then
--|#line 160 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 160")
end

			yyval6 := new_nfa_from_character_class (question_character_class)
		
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
when 17 then
--|#line 164 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 164")
end

			yyval6 := new_nfa_from_character_class (question_character_class)
			yyval6.build_positive_closure
			yyval6.build_concatenation (new_nfa_from_character (Slash_code))
			yyval6.build_closure
		
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
when 18 then
--|#line 171 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 171")
end

			yyval6 := new_nfa_from_character_class (yyvs5.item (yyvsp5))
		
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
when 19 then
--|#line 175 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 175")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 20 then
--|#line 181 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 181")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 21 then
--|#line 183 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 183")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 22 then
--|#line 185 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 185")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 23 then
--|#line 189 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 189")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 24 then
--|#line 191 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 191")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 25 then
--|#line 193 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 193")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 26 then
--|#line 197 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 197")
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
when 27 then
--|#line 208 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 208")
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
when 28 then
--|#line 222 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 222")
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
when 29 then
--|#line 226 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 226")
end

			yyval5 := append_character_to_character_class (yyvs4.item (yyvsp4), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 30 then
--|#line 230 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 230")
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
when 31 then
--|#line 234 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 234")
end

			yyval5 := append_character_set_to_character_class (yyvs4.item (yyvsp4 - 1), yyvs4.item (yyvsp4), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp4 := yyvsp4 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 32 then
--|#line 240 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 240")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.add_symbol_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 33 then
--|#line 245 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 245")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.remove_symbol_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 34 then
--|#line 252 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 252")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 35 then
--|#line 254 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 254")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 36 then
--|#line 258 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 258")
end

yyval5 := yyvs5.item (yyvsp5).twin 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 37 then
--|#line 260 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 260")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 38 then
--|#line 262 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 262")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 39 then
--|#line 266 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 266")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 40 then
--|#line 268 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 268")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 41 then
--|#line 272 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 272")
end

			yyval6 := new_epsilon_nfa
		
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
when 42 then
--|#line 276 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 276")
end

			if utf8_mode.item and yyvs4.item (yyvsp4) > {CHARACTER_8}.max_ascii_value then
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs4.item (yyvsp4))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					i_ := i_ + 1
				end
			else
				yyval6 := append_character_to_string (yyvs4.item (yyvsp4), yyvs6.item (yyvsp6))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
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
			create an_array.make_filled (0, 0, 265)
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
			    2,    2,    2,    2,   18,    2,    2,    2,    2,    2,
			   14,   12,   17,   13,    2,   21,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   15,   16,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   19,   20,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   11,    2,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10, yyDummy>>,
			1, 66, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   35,   36,   37,   37,   22,   23,   23,   24,   24,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   27,   27,   27,   28,   28,   28,   29,   29,   30,   30,
			   30,   30,   31,   31,   32,   32,   33,   33,   33,   34,
			   34,   26,   26, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    5,    4,
			    3,    1,    1,    1,    6,    6,    6,    5,    5,    5,
			    5,    5,    5,    1,    6,    1,    1,    5,    5,    5,
			    1,    1,    4,    5,    6,    6,    6,    1,    1,    1,
			    4,    6,    6,    1,    1,    1,    6,    5,    1,    1,
			    4,    1,    1,    5,    5,    5,    5,    1,    1,    1,
			    1,    4,    1,    6,    4,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    3,    4,    5,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
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
			 -32768,   87, -32768, -32768,   78,   75,    2,   65, -32768, -32768,
			    0,  103, -32768, -32768, -32768,  103, -32768, -32768,   69, -32768,
			   50,   11,   61, -32768,   30,  103,  103,   66,   62,   43,
			  103,   45,   20,   24,   48,  103, -32768,    2,    2, -32768,
			 -32768,   34,    1, -32768, -32768, -32768,   -6,   23,   40, -32768,
			   17, -32768,  103, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   25,  103, -32768,    9,    3, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768,   14,   -1,  -14, -32768, -32768,   -2, -32768,   67,   91,
			   -4, -32768,   58, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   15,   36,   29,   67,   27,   52,   59,   32,   10,   66,
			    8,  -22,   52,   58,  -22,  -22,    6,  -22,  -22,  -22,
			   31,   36,  -22,  -22,  -22,  -22,  -22,  -22,  -22,  -22,
			   50,   50,   64,   54,   54,   53,   53,   40,   62,   41,
			   42,   48,   60,   49,   46,   52,   57,   61,   39,   36,
			  -21,   63,   32,  -21,  -21,   45,  -21,  -21,  -21,   52,
			   51,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -21,  -20,
			   38,   37,  -20,  -20,   44,  -20,  -20,  -20,   43,   30,
			  -20,  -20,  -20,  -20,  -20,  -20,  -20,  -20,   13,   26,
			   12,   11,   25,   10,    9,    8,   56,   28,   47,    0,

			    7,    6,    5,    4,    3,    2,   12,   11,    0,   10,
			    9,    8,    0,    0,    0,    0,    7,    6,    5,    4,
			    3,    2, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,   15,    6,    0,    6,   11,   12,    7,    6,    0,
			    8,    0,   11,   12,    3,    4,   14,    6,    7,    8,
			   20,   35,   11,   12,   13,   14,   15,   16,   17,   18,
			    7,    7,    7,   37,   38,   37,   38,    7,   21,   25,
			   26,   21,   19,   19,   30,   11,   12,    7,   18,   63,
			    0,   52,    7,    3,    4,   12,    6,    7,    8,   11,
			   12,   11,   12,   13,   14,   15,   16,   17,   18,    0,
			    9,   10,    3,    4,   12,    6,    7,    8,   12,   14,
			   11,   12,   13,   14,   15,   16,   17,   18,    1,   14,
			    3,    4,   14,    6,    7,    8,   38,    6,   31,   -1,

			   13,   14,   15,   16,   17,   18,    3,    4,   -1,    6,
			    7,    8,   -1,   -1,   -1,   -1,   13,   14,   15,   16,
			   17,   18, yyDummy>>)
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

	yyFinal: INTEGER = 67
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 22
			-- Number of tokens

	yyLast: INTEGER = 121
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 265
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 38
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
			question_string: STRING
			l_character_classes_by_name: like character_classes_by_name
		do
			question_string := "?"
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
