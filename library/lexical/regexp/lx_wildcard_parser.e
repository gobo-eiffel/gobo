indexing

	description:

		"Parsers for wildcards"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_WILDCARD_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value
		end

	LX_WILDCARD_SCANNER
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
--|#line 50 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 50")
end

			if description.equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 59 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 59")
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
--|#line 70 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 70")
end

			process_rule (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
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
when 4 then
--|#line 74 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 74")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 80 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 80")
end

			yyval5 := yyvs5.item (yyvsp5)
			has_trail_context := False
			head_count := Zero_or_more
			head_line := Zero_or_more
			head_column := Zero_or_more
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 6 then
--|#line 91 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 91")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 7 then
--|#line 95 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 95")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.build_union (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 8 then
--|#line 102 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 102")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs5.put (yyval5, yyvsp5)
end
when 9 then
--|#line 106 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 106")
end

			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.build_concatenation (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs5.put (yyval5, yyvsp5)
end
when 10 then
--|#line 113 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 113")
end

			yyval5 := new_nfa_from_character (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
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
when 11 then
--|#line 117 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 117")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs5.put (yyval5, yyvsp5)
end
when 12 then
--|#line 122 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 122")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_positive_closure
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs5.put (yyval5, yyvsp5)
end
when 13 then
--|#line 127 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 127")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs5.put (yyval5, yyvsp5)
end
when 14 then
--|#line 132 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 132")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs5.put (yyval5, yyvsp5)
end
when 15 then
--|#line 136 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 136")
end

			yyval5 := new_symbol_class_nfa (question_character_class)
			yyval5.build_closure
		
if yy_parsing_status >= yyContinue then
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
when 16 then
--|#line 141 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 141")
end

			yyval5 := new_symbol_class_nfa (question_character_class)
		
if yy_parsing_status >= yyContinue then
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
when 17 then
--|#line 145 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 145")
end

			yyval5 := new_symbol_class_nfa (question_character_class)
			yyval5.build_positive_closure
			yyval5.build_concatenation (new_nfa_from_character (Slash_code))
			yyval5.build_closure
		
if yy_parsing_status >= yyContinue then
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
when 18 then
--|#line 152 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 152")
end

			yyval5 := new_symbol_class_nfa (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
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
when 19 then
--|#line 156 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 156")
end

			yyval5 := new_nfa_from_character_class (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
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
when 20 then
--|#line 160 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 160")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs5.put (yyval5, yyvsp5)
end
when 21 then
--|#line 166 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 166")
end

			yyval3 := yyvs3.item (yyvsp3)
			character_classes.force (yyval3, yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 22 then
--|#line 171 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 171")
end

			yyval3 := yyvs3.item (yyvsp3)
			yyval3.set_negated (True)
			character_classes.force (yyval3, yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -2
	yyvs3.put (yyval3, yyvsp3)
end
when 23 then
--|#line 179 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 179")
end

			yyval3 := append_character_to_character_class (yyvs2.item (yyvsp2), new_character_class)
		
if yy_parsing_status >= yyContinue then
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
when 24 then
--|#line 183 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 183")
end

			yyval3 := append_character_to_character_class (yyvs2.item (yyvsp2), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 25 then
--|#line 187 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 187")
end

			yyval3 := append_character_set_to_character_class
				(yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), new_character_class)
		
if yy_parsing_status >= yyContinue then
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
when 26 then
--|#line 192 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 192")
end

			yyval3 := append_character_set_to_character_class (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 27 then
--|#line 198 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 198")
end

			yyval5 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
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
when 28 then
--|#line 202 "lx_wildcard_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_wildcard_parser.y' at line 202")
end

			yyval5 := append_character_to_string (yyvs2.item (yyvsp2), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
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
			when 47 then
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
			    2,    2,    2,    2,   15,    2,    2,    2,    2,    2,
			   11,    9,   14,   10,    2,   18,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   12,   13,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    7,    2,   16,   17,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    8,    2,    2,    2,    2,    2,
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
			    5,    6, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   26,   27,   28,   28,   19,   20,   20,   21,   21,
			   22,   22,   22,   22,   22,   22,   22,   22,   22,   22,
			   22,   25,   25,   24,   24,   24,   24,   23,   23, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    4,    3,    2,
			    1,    1,    1,    5,    5,    5,    3,    1,    5,    1,
			    1,    1,    1,    2,    3,    5,    5,    5,    1,    2,
			    5,    5,    5,    3,    1,    1,    2,    1,    1,    1,
			    1,    1,    1,    2,    1,    5,    2,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    3,    4,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,   27,   15,    0,   16,    0,    0,   18,   10,
			    0,   17,    4,    3,    5,    8,   19,    1,    0,    0,
			    0,    0,    0,   23,    0,    0,    6,    9,   20,   28,
			    0,    0,    0,    0,    0,   21,   24,   11,    0,   14,
			   13,   12,   22,   25,    0,    7,   26,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   13,   25,   26,   15,   18,   24,   16,   47,    1,   17, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,    2, -32768, -32768,   43,   42,   41,    6, -32768, -32768,
			   15, -32768, -32768, -32768,   15, -32768, -32768, -32768,   21,   15,
			   15,   15,   46,   32,   26,   39,   15, -32768, -32768, -32768,
			   37,   35,   25,   19,   33, -32768,   31, -32768,   15, -32768,
			 -32768, -32768, -32768, -32768,   -3,   15, -32768,   10,    4, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768,   20,   -1,  -13, -32768,   34, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   14,   27,   46,   12,   49,   11,   10,    9,    8,    7,
			   48,   23,    6,   27,    5,    4,    3,    2,   11,   10,
			    9,    8,    7,   22,   36,    6,   29,    5,    4,    3,
			    2,   36,   27,   38,   41,   42,   28,   45,   43,   30,
			   31,   32,   35,   38,   40,   38,   39,   38,   37,   44,
			   34,   23,   21,   20,   19,    0,   33, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,   14,    5,    1,    0,    3,    4,    5,    6,    7,
			    0,    5,   10,   26,   12,   13,   14,   15,    3,    4,
			    5,    6,    7,   17,    5,   10,    5,   12,   13,   14,
			   15,    5,   45,    8,    9,   16,   15,   38,    5,   19,
			   20,   21,   16,    8,    9,    8,    9,    8,    9,   18,
			   18,    5,   11,   11,   11,   -1,   22, yyDummy>>)
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

	yyFinal: INTEGER is 49
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 19
			-- Number of tokens

	yyLast: INTEGER is 56
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 261
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 29
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

feature {NONE} -- Implementation

	question_character_class: LX_SYMBOL_CLASS is
			-- "?" character class (i.e. all characters except /)
		local
			question_string: STRING
			equiv_classes: LX_EQUIVALENCE_CLASSES
		do
			question_string := "?"
			if character_classes.has (question_string) then
				Result := character_classes.item (question_string)
			else
				create Result.make (1)
				Result.put (Slash_code)
				Result.set_negated (True)
				equiv_classes := description.equiv_classes
				if equiv_classes /= Void then
					equiv_classes.add (Result)
				end
				character_classes.force (Result, question_string)
			end
		ensure
			question_character_class_not_void: Result /= Void
		end

end
