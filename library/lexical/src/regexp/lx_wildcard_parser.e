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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_WILDCARD_SCANNER
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
			yyval6: LX_NFA
			yyval4: LX_SYMBOL_CLASS
			yyval5: LX_UNICODE_CHARACTER_CLASS
			yyval3: INTEGER
		do
				inspect yy_act
when 1 then
--|#line 60 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 60")
end

			if description.equiv_classes /= Void then
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

			if description.equiv_classes_used then
				description.create_equiv_classes
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
--|#line 80 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 80")
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
--|#line 84 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 84")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 90 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 90")
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
--|#line 101 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 101")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 7 then
--|#line 105 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 105")
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
--|#line 112 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 112")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 9 then
--|#line 116 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 116")
end

			yyval6 := yyvs6.item (yyvsp6 - 1)
			yyval6.build_concatenation (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 10 then
--|#line 123 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 123")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval6 := new_epsilon_nfa
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					i_ := i_ + 1
				end
			else
				yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
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
when 11 then
--|#line 137 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 137")
end

			yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
		
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
when 12 then
--|#line 141 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 141")
end

			if yyvs3.item (yyvsp3) <= {CHARACTER_8}.max_ascii_value then
				yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
			else
				yyval6 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
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
when 13 then
--|#line 156 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 156")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 14 then
--|#line 161 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 161")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_positive_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 15 then
--|#line 166 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 166")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 16 then
--|#line 171 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 171")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 17 then
--|#line 175 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 175")
end

			if unicode_mode.item then
				yyval6 := new_nfa_from_unicode_character_class (question_unicode_character_class)
			else
				yyval6 := new_symbol_class_nfa (question_character_class)
			end
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
--|#line 184 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 184")
end

			if unicode_mode.item then
				yyval6 := new_nfa_from_unicode_character_class (question_unicode_character_class)
			else
				yyval6 := new_symbol_class_nfa (question_character_class)
			end
		
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
when 19 then
--|#line 192 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 192")
end

			if unicode_mode.item then
				yyval6 := new_nfa_from_unicode_character_class (question_unicode_character_class)
			else
				yyval6 := new_symbol_class_nfa (question_character_class)
			end
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
when 20 then
--|#line 203 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 203")
end

			yyval6 := new_symbol_class_nfa (yyvs4.item (yyvsp4))
		
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
when 21 then
--|#line 207 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 207")
end

			yyval6 := new_nfa_from_character_class (yyvs4.item (yyvsp4))
		
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
when 22 then
--|#line 211 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 211")
end

			yyval6 := new_nfa_from_unicode_character_class (yyvs5.item (yyvsp5))
		
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
when 23 then
--|#line 215 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 215")
end

			yyval6 := new_nfa_from_unicode_character_class (yyvs5.item (yyvsp5))
		
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
when 24 then
--|#line 219 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 219")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 25 then
--|#line 225 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 225")
end

			yyval4 := yyvs4.item (yyvsp4)
			character_classes.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 26 then
--|#line 230 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 230")
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
when 27 then
--|#line 238 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 238")
end

			yyval5 := yyvs5.item (yyvsp5)
			unicode_character_classes.force (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 28 then
--|#line 243 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 243")
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
when 29 then
--|#line 251 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 251")
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
when 30 then
--|#line 255 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 255")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 31 then
--|#line 259 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 259")
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
when 32 then
--|#line 263 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 263")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 33 then
--|#line 269 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 269")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 34 then
--|#line 273 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 273")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 35 then
--|#line 279 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 279")
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
when 36 then
--|#line 283 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 283")
end

			yyval5 := append_character_to_unicode_character_class (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 37 then
--|#line 287 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 287")
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
when 38 then
--|#line 291 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 291")
end

			yyval5 := append_character_set_to_unicode_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 39 then
--|#line 297 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 297")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 40 then
--|#line 301 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 301")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 41 then
--|#line 307 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 307")
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
--|#line 311 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 311")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					i_ := i_ + 1
				end
			else
				yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 43 then
--|#line 325 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 325")
end

			yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 44 then
--|#line 329 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 329")
end

			if yyvs3.item (yyvsp3) <= {CHARACTER_8}.max_ascii_value then
				yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
			else
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					i_ := i_ + 1
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
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
			when 69 then
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
			create an_array.make_filled (0, 0, 266)
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
			    2,    2,    2,    2,   19,    2,    2,    2,    2,    2,
			   15,   13,   18,   14,    2,   22,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   16,   17,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   20,   21,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   12,    2,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10,   11, yyDummy>>,
			1, 67, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   34,   35,   36,   36,   25,   26,   26,   27,   27,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   31,   31,   33,   33,   30,
			   30,   30,   30,   23,   23,   32,   32,   32,   32,   24,
			   24,   29,   29,   29,   29, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    5,    4,    3,
			    3,    3,    2,    2,    1,    1,    1,    6,    6,    6,
			    4,    5,    1,    6,    1,    1,    1,    1,    3,    3,
			    3,    5,    1,    3,    3,    3,    4,    6,    6,    6,
			    1,    3,    3,    3,    6,    6,    6,    5,    1,    1,
			    3,    4,    1,    1,    3,    1,    1,    1,    1,    1,
			    1,    3,    1,    1,    3,    1,    6,    3,    3,    1,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    2,    3,    3,    3,
			    4,    5,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,   41,   17,    0,   18,    0,   22,   20,   12,
			   11,   10,    0,    0,    0,   19,    4,    3,    5,    8,
			   21,   23,    1,    0,    0,    0,    0,    0,   40,   39,
			   35,    0,    0,   34,   33,   29,    0,    0,    6,    9,
			   24,   44,   43,   42,    0,    0,    0,    0,    0,   27,
			   36,    0,    0,   25,   30,   13,    0,   16,   15,   14,
			   28,   37,    0,   26,   31,    0,    7,   38,   32,    0,
			    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   35,   30,   17,   37,   38,   19,   23,   36,   20,   31,
			   21,   69,    1,   22, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,   53, -32768, -32768,   51,   50,   11, -32768, -32768, -32768,
			 -32768, -32768,    4,   -4,   70, -32768, -32768, -32768,   70, -32768,
			 -32768, -32768, -32768,   27,   70,   70,   70,   31, -32768, -32768,
			   20,   23,   37, -32768, -32768,   17,   21,   78,   70, -32768,
			 -32768, -32768, -32768, -32768,   40,   38,   35,    7,   31, -32768,
			    9,    2,   37, -32768,   -2, -32768,   70, -32768, -32768, -32768,
			 -32768, -32768,   31, -32768, -32768,   37,   70, -32768, -32768,   15,
			   12, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  -28,  -29, -32768,  -19,   -1,  -17, -32768,   60, -32768,   41,
			 -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   18,   39,   50,   34,   33,   44,   45,   46,   54,   34,
			   33,   29,   71,   28,   29,   70,   28,   32,   50,   61,
			   65,   39,   63,   54,   64,   27,   26,   60,   34,   33,
			   29,   62,   28,   67,   43,   42,   41,   68,   29,   52,
			   28,   53,   48,   49,   34,   33,   40,   56,   59,   39,
			   56,   58,   56,   57,   16,   66,   15,   14,   13,   12,
			   11,   10,    9,    8,    7,   25,   24,    6,   47,    5,
			    4,    3,    2,   15,   14,   13,   12,   11,   10,    9,
			    8,    7,    0,    0,    6,    0,    5,    4,    3,    2,
			   56,   55,   51, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,   18,   31,    7,    8,   24,   25,   26,   36,    7,
			    8,    7,    0,    9,    7,    0,    9,   21,   47,   48,
			   22,   38,   20,   51,   52,   21,   15,   20,    7,    8,
			    7,   22,    9,   62,    7,    8,    9,   65,    7,   22,
			    9,   20,   22,   20,    7,    8,   19,   12,   13,   66,
			   12,   13,   12,   13,    1,   56,    3,    4,    5,    6,
			    7,    8,    9,   10,   11,   15,   15,   14,   27,   16,
			   17,   18,   19,    3,    4,    5,    6,    7,    8,    9,
			   10,   11,   -1,   -1,   14,   -1,   16,   17,   18,   19,
			   12,   13,   32, yyDummy>>)
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

	yyFinal: INTEGER = 71
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 23
			-- Number of tokens

	yyLast: INTEGER = 92
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 266
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

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

feature {NONE} -- Implementation

	question_character_class: LX_SYMBOL_CLASS
			-- "?" character class (i.e. all characters except /)
		local
			question_string: STRING
			equiv_classes: detachable LX_EQUIVALENCE_CLASSES
		do
			question_string := "?"
			character_classes.search (question_string)
			if character_classes.found then
				Result := character_classes.found_item
			else
				create Result.make_empty
				Result.add_character (Slash_code)
				Result.set_negated (True)
				equiv_classes := description.equiv_classes
				if equiv_classes /= Void then
					equiv_classes.add (Result)
				end
				character_classes.force_new (Result, question_string)
			end
		ensure
			question_character_class_not_void: Result /= Void
		end

	question_unicode_character_class: LX_UNICODE_CHARACTER_CLASS
			-- "?" Unicode character class (i.e. all Unicode characters except /)
		local
			question_string: STRING
		do
			question_string := "?"
			unicode_character_classes.search (question_string)
			if unicode_character_classes.found then
				Result := unicode_character_classes.found_item
			else
				create Result.make_empty
				Result.add_character (Slash_code)
				Result.set_negated (True)
				unicode_character_classes.force_new (Result, question_string)
			end
		ensure
			question_unicode_character_class_not_void: Result /= Void
		end
		
end
