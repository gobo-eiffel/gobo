note

	description:

		"Parsers for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_YACC_PARSER

inherit

	PR_YACC_PARSER_SKELETON

	PR_YACC_SCANNER
		rename
			make as make_yacc_scanner,
			reset as reset_yacc_scanner
		end

create

	make


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
			create yyspecial_routines7
			yyvsc7 := yyInitial_yyvs_size
			yyvs7 := yyspecial_routines7.make (yyvsc7)
			create yyspecial_routines8
			yyvsc8 := yyInitial_yyvs_size
			yyvs8 := yyspecial_routines8.make (yyvsc8)
			create yyspecial_routines9
			yyvsc9 := yyInitial_yyvs_size
			yyvs9 := yyspecial_routines9.make (yyvsc9)
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
			yyvsp7 := -1
			yyvsp8 := -1
			yyvsp9 := -1
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
			yyvs7.keep_head (0)
			yyvs8.keep_head (0)
			yyvs9.keep_head (0)
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
			when 7 then
				yyvsp7 := yyvsp7 - 1
			when 8 then
				yyvsp8 := yyvsp8 - 1
			when 9 then
				yyvsp9 := yyvsp9 - 1
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
			yyval6: PR_TYPE
			yyval2: STRING
			yyval4: detachable STRING
			yyval7: DS_ARRAYED_LIST [PR_TYPE]
			yyval8: DS_ARRAYED_LIST [PR_LABELED_TYPE]
			yyval9: PR_LABELED_TYPE
			yyval5: PR_TOKEN
		do
				inspect yy_act
when 1 then
--|#line 58 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 58")
end

			if successful then
				set_start_symbol
				process_symbols
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 58 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 58")
end

			initialize_grammar
		
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
--|#line 71 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 71")
end

			precedence := 1
		
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
--|#line 75 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 75")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 78 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 78")
end

			last_grammar.eiffel_header.force_last (yyvs2.item (yyvsp2))
		
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
when 6 then
--|#line 82 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 82")
end

			type := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 86 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 86")
end

			type := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 90 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 90")
end

			precedence := precedence + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 94 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 94")
end

			precedence := precedence + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 98 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 98")
end

			precedence := precedence + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 102 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 102")
end

			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				create start_symbol.make (yyvs2.item (yyvsp2), line_nb)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 110 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 110")
end

			last_grammar.set_expected_conflicts (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 116 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 116")
end

			type := No_type
		
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
when 14 then
--|#line 120 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 120")
end

			check attached yyvs6.item (yyvsp6) as l_type then
				type := l_type
				set_no_alias_name (l_type)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 127 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 127")
end

			check attached yyvs6.item (yyvsp6) as l_type then
				type := l_type
				set_alias_name (l_type, yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyvsp2 := yyvsp2 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 136 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 136")
end

			type := No_type
		
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
when 17 then
--|#line 140 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 140")
end

			type := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 146 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 146")
end

			yyval6 := new_type (Void, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 150 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 150")
end

			yyval6 := new_basic_type (Void, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 154 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 154")
end

			yyval6 := new_type (Void, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 158 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 158")
end

yyval6 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 22 then
--|#line 162 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 162")
end

			yyval6 := new_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
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
--|#line 166 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 166")
end

			yyval6 := new_basic_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
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
--|#line 170 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 170")
end

			yyval6 := new_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 25 then
--|#line 174 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 174")
end

			yyval6 := new_type (Void, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 26 then
--|#line 178 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 178")
end

			yyval6 := new_generic_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 27 then
--|#line 182 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 182")
end

			yyval6 := new_generic_type (Void, yyvs2.item (yyvsp2), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 28 then
--|#line 186 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 186")
end

			yyval6 := new_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 29 then
--|#line 190 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 190")
end

			yyval6 := new_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
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
--|#line 194 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 194")
end

			yyval6 := new_type (Void, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 31 then
--|#line 198 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 198")
end

			yyval6 := new_generic_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 32 then
--|#line 202 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 202")
end

			yyval6 := new_generic_type (Void, yyvs2.item (yyvsp2), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 33 then
--|#line 206 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 206")
end

			yyval6 := new_labeled_tuple_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
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
--|#line 210 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 210")
end

			yyval6 := new_labeled_tuple_type (Void, yyvs2.item (yyvsp2), yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
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
--|#line 214 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 214")
end

			yyval6 := new_anchored_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -2
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
--|#line 218 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 218")
end

			yyval6 := new_like_current_type (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -2
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
--|#line 222 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 222")
end

			yyval6 := new_anchored_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2 - 1) + yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -3
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 38 then
--|#line 226 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 226")
end

			yyval6 := new_anchored_type (yyvs4.item (yyvsp4), yyvs2.item (yyvsp2 - 1) + yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 + 1
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -3
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 39 then
--|#line 230 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 230")
end

			yyval6 := new_qualified_anchored_type (yyvs4.item (yyvsp4), yyvs6.item (yyvsp6), yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp4 := yyvsp4 -1
	yyvsp2 := yyvsp2 -2
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 40 then
--|#line 236 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 236")
end

			yyval2 := "." + yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 41 then
--|#line 240 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 240")
end

			yyval2 := yyvs2.item (yyvsp2 - 1) + "." + yyvs2.item (yyvsp2)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 42 then
--|#line 246 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 246")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 43 then
--|#line 248 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 248")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 44 then
--|#line 250 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 250")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 45 then
--|#line 252 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 252")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 46 then
--|#line 254 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 254")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 47 then
--|#line 256 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 256")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 48 then
--|#line 258 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 258")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 49 then
--|#line 260 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 260")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 50 then
--|#line 262 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 262")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 51 then
--|#line 264 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 264")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 52 then
--|#line 266 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 266")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 53 then
--|#line 268 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 268")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 54 then
--|#line 270 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 270")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 55 then
--|#line 272 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 272")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 56 then
--|#line 274 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 274")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 57 then
--|#line 276 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 276")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 58 then
--|#line 278 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 278")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 59 then
--|#line 280 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 280")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 60 then
--|#line 282 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 282")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 61 then
--|#line 286 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 286")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 62 then
--|#line 288 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 288")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 63 then
--|#line 290 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 290")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 64 then
--|#line 292 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 292")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 65 then
--|#line 294 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 294")
end

yyval4 := yyvs2.item (yyvsp2 - 1) + " " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 66 then
--|#line 296 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 296")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 298 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 298")
end

yyval4 := yyvs2.item (yyvsp2 - 1) + " " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 68 then
--|#line 300 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 300")
end

yyval4 := "!" 
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
when 69 then
--|#line 302 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 302")
end

yyval4 := "! " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 70 then
--|#line 304 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 304")
end

yyval4 := "?" 
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
when 71 then
--|#line 306 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 306")
end

yyval4 := "? " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 72 then
--|#line 310 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 310")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
--|#line 312 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 312")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 74 then
--|#line 314 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 314")
end

yyval4 := yyvs2.item (yyvsp2 - 1) + " " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 75 then
--|#line 316 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 316")
end

yyval4 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 76 then
--|#line 318 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 318")
end

yyval4 := yyvs2.item (yyvsp2 - 1) + " " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 77 then
--|#line 320 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 320")
end

yyval4 := "!" 
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
when 78 then
--|#line 322 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 322")
end

yyval4 := "! " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 79 then
--|#line 324 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 324")
end

yyval4 := "?" 
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
when 80 then
--|#line 326 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 326")
end

yyval4 := "? " + yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 81 then
--|#line 330 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 330")
end

yyval4 := Void 
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
when 82 then
--|#line 332 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 332")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 83 then
--|#line 336 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 336")
end

			yyval7 := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 84 then
--|#line 342 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 342")
end

			in_generics := in_generics + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 85 then
--|#line 348 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 348")
end

			in_generics := in_generics - 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 86 then
--|#line 354 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 354")
end

			create yyval7.make (5)
			yyval7.force_last (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 87 then
--|#line 359 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 359")
end

			yyval7 := yyvs7.item (yyvsp7)
			yyval7.force_first (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 88 then
--|#line 364 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 364")
end

			yyval7 := yyvs7.item (yyvsp7)
			yyval7.force_first (new_type (Void, yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 89 then
--|#line 369 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 369")
end

			yyval7 := yyvs7.item (yyvsp7)
			yyval7.force_first (new_basic_type (Void, yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 90 then
--|#line 374 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 374")
end

			yyval7 := yyvs7.item (yyvsp7)
			yyval7.force_first (new_type (Void, yyvs2.item (yyvsp2)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 91 then
--|#line 381 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 381")
end

			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 92 then
--|#line 387 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 387")
end

			create yyval8.make (5)
			yyval8.force_last (yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp9 := yyvsp9 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 93 then
--|#line 392 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 392")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.force_first (yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 94 then
--|#line 397 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 397")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.first.labels.force_first (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 95 then
--|#line 402 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 402")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.first.labels.force_first (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 96 then
--|#line 407 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 407")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.first.labels.force_first (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 97 then
--|#line 414 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 414")
end

			yyval9 := new_labeled_type (yyvs2.item (yyvsp2), yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp9 := yyvsp9 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp3 := yyvsp3 -1
	yyvsp6 := yyvsp6 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 98 then
--|#line 420 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 420")
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
when 99 then
--|#line 421 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 421")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 100 then
--|#line 422 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 422")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 101 then
--|#line 425 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 425")
end

			check type_not_void: attached type as l_type then
				yyval5 := new_terminal (yyvs2.item (yyvsp2), l_type)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 102 then
--|#line 431 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 431")
end

			check type_not_void: attached type as l_type then
				yyval5 := new_terminal (yyvs2.item (yyvsp2), l_type)
				set_token_id (yyval5, yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
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
when 103 then
--|#line 438 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 438")
end

			check type_not_void: attached type as l_type then
				yyval5 := new_terminal (yyvs2.item (yyvsp2 - 1), l_type)
				set_literal_string (yyval5, yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 104 then
--|#line 445 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 445")
end

			check type_not_void: attached type as l_type then
				yyval5 := new_terminal (yyvs2.item (yyvsp2 - 1), l_type)
				set_token_id (yyval5, yyvs3.item (yyvsp3))
				set_literal_string (yyval5, yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
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
when 105 then
--|#line 453 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 453")
end

			check type_not_void: attached type as l_type then
				yyval5 := new_char_terminal (yyvs2.item (yyvsp2), l_type)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 106 then
--|#line 461 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 461")
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
when 107 then
--|#line 462 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 462")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 108 then
--|#line 463 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 463")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 109 then
--|#line 466 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 466")
end

			yyval5 := new_left_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 110 then
--|#line 470 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 470")
end

			yyval5 := new_left_terminal (yyvs2.item (yyvsp2), precedence)
			set_token_id (yyval5, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
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
when 111 then
--|#line 475 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 475")
end

			yyval5 := new_left_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_literal_string (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 112 then
--|#line 480 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 480")
end

			yyval5 := new_left_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_token_id (yyval5, yyvs3.item (yyvsp3))
			set_literal_string (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
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
when 113 then
--|#line 486 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 486")
end

			yyval5 := new_left_char_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 114 then
--|#line 492 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 492")
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
when 115 then
--|#line 493 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 493")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 116 then
--|#line 494 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 494")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 117 then
--|#line 497 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 497")
end

			yyval5 := new_right_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 118 then
--|#line 501 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 501")
end

			yyval5 := new_right_terminal (yyvs2.item (yyvsp2), precedence)
			set_token_id (yyval5, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
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
when 119 then
--|#line 506 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 506")
end

			yyval5 := new_right_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_literal_string (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 120 then
--|#line 511 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 511")
end

			yyval5 := new_right_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_token_id (yyval5, yyvs3.item (yyvsp3))
			set_literal_string (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
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
when 121 then
--|#line 517 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 517")
end

			yyval5 := new_right_char_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 122 then
--|#line 523 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 523")
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
when 123 then
--|#line 524 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 524")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 124 then
--|#line 525 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 525")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 125 then
--|#line 528 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 528")
end

			yyval5 := new_nonassoc_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 126 then
--|#line 532 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 532")
end

			yyval5 := new_nonassoc_terminal (yyvs2.item (yyvsp2), precedence)
			set_token_id (yyval5, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
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
when 127 then
--|#line 537 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 537")
end

			yyval5 := new_nonassoc_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_literal_string (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 128 then
--|#line 542 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 542")
end

			yyval5 := new_nonassoc_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_token_id (yyval5, yyvs3.item (yyvsp3))
			set_literal_string (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
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
when 129 then
--|#line 548 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 548")
end

			yyval5 := new_nonassoc_char_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 130 then
--|#line 554 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 554")
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
when 131 then
--|#line 555 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 555")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 132 then
--|#line 556 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 556")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 133 then
--|#line 559 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 559")
end

			check type_not_void: attached type as l_type then
				yyval1 := new_nonterminal (yyvs2.item (yyvsp2), l_type)
			end
		
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
when 134 then
--|#line 567 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 567")
end

			report_no_rules_error
		
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
when 135 then
--|#line 571 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 571")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 136 then
--|#line 572 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 572")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 137 then
--|#line 575 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 575")
end

			check rule_not_void: attached rule as l_rule then
				process_rule (l_rule)
				rule := Void
				precedence_token := Void
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 138 then
--|#line 585 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 585")
end

			if is_terminal (yyvs2.item (yyvsp2)) then
				report_lhs_symbol_token_error (yyvs2.item (yyvsp2))
				check rule_not_void: attached new_rule (new_midrule_variable) as l_rule then
					rule := l_rule
					put_rule (l_rule)
				end
			else
				check rule_not_void: attached new_rule (new_variable (yyvs2.item (yyvsp2))) as l_rule then
					rule := l_rule
					if l_rule.lhs.rules.count > 1 then
						report_rule_declared_twice_warning (yyvs2.item (yyvsp2))
					end
					put_rule (l_rule)
				end
			end
			precedence_token := Void
		
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
when 139 then
--|#line 606 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 606")
end

			check rule_not_void: attached rule as l_rule then
				l_rule.set_line_nb (yyvs3.item (yyvsp3))
			end
		
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
when 140 then
--|#line 614 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 614")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 141 then
--|#line 615 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 615")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 142 then
--|#line 618 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 618")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 143 then
--|#line 619 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 619")
end

			check rule_not_void: attached rule as l_rule then
				if yyvs3.item (yyvsp3) < 1 or yyvs3.item (yyvsp3) > l_rule.error_actions.count then
					report_invalid_error_n_error (yyvs3.item (yyvsp3))
				else
					put_error_action (new_error_action (yyvs2.item (yyvsp2), yyvs3.item (yyvsp3 - 1)), yyvs3.item (yyvsp3), l_rule)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 144 then
--|#line 631 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 631")
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
when 145 then
--|#line 632 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 632")
end

			check rule_not_void: attached rule as l_rule then
				put_symbol (new_symbol (yyvs2.item (yyvsp2)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 146 then
--|#line 638 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 638")
end

			check rule_not_void: attached rule as l_rule then
				put_symbol (new_char_token (yyvs2.item (yyvsp2)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 147 then
--|#line 644 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 644")
end

			check rule_not_void: attached rule as l_rule then
				put_symbol (new_string_token (yyvs2.item (yyvsp2)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 148 then
--|#line 650 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 650")
end

			check rule_not_void: attached rule as l_rule then
				put_action (new_action (yyvs2.item (yyvsp2)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 149 then
--|#line 656 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 656")
end

			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := yyvs5.item (yyvsp5)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 150 then
--|#line 666 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 666")
end

			if is_terminal (yyvs2.item (yyvsp2)) then
				yyval5 := new_token (yyvs2.item (yyvsp2))
			else
				report_prec_not_token_error (yyvs2.item (yyvsp2))
				yyval5 := new_char_token ("'a'")
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 151 then
--|#line 675 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 675")
end

			yyval5 := new_char_token (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 152 then
--|#line 681 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 681")
end

			check rule_not_void: attached rule as l_rule then
				process_rule (l_rule)
				check new_rule_not_void: attached new_rule (l_rule.lhs) as l_new_rule then
					rule := l_new_rule
					precedence_token := Void
					l_new_rule.set_line_nb (yyvs3.item (yyvsp3))
					put_rule (l_new_rule)
				end
			end
		
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
when 153 then
--|#line 695 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 695")
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
when 154 then
--|#line 696 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 696")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 155 then
--|#line 697 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 697")
end

			last_grammar.set_eiffel_code (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 156 then
--|#line 703 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 703")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 157 then
--|#line 705 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 705")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 158 then
--|#line 707 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 707")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 159 then
--|#line 709 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 709")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 160 then
--|#line 711 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 711")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 161 then
--|#line 713 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 713")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 162 then
--|#line 715 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 715")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 163 then
--|#line 717 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 717")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 164 then
--|#line 719 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 719")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 165 then
--|#line 721 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 721")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 166 then
--|#line 723 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 723")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
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
			when 214 then
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
			create an_array.make_filled (0, 0, 303)
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
			    2,    2,    2,   56,    2,    2,    2,    2,    2,    2,
			   62,   63,    2,    2,   60,    2,   55,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   50,   61,
			   51,    2,   52,   57,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   58,    2,   59,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   53,   49,   54,    2,    2,    2,    2,
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
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,

			   45,   46,   47,   48, yyDummy>>,
			1, 104, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   82,   84,   83,   83,   87,   87,   87,   87,   87,
			   87,   87,   87,   88,   88,   88,   90,   90,   75,   75,
			   75,   75,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   66,   66,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   67,   67,   68,   68,   68,   68,   68,   68,   68,   68,
			   68,   69,   69,   78,   95,   96,   77,   77,   77,   77,
			   77,   80,   79,   79,   79,   79,   79,   81,   89,   89,

			   89,   71,   71,   71,   71,   71,   92,   92,   92,   72,
			   72,   72,   72,   72,   93,   93,   93,   73,   73,   73,
			   73,   73,   94,   94,   94,   74,   74,   74,   74,   74,
			   91,   91,   91,   97,   85,   85,   85,   98,   99,  100,
			  101,  101,  102,  102,  104,  104,  104,  104,  104,  104,
			   70,   70,  103,   86,   86,   86,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 216)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    4,    4,    4,    6,    6,    1,    1,    2,    2,
			    5,    1,    2,    2,    5,    1,    2,    2,    5,    6,
			    1,    2,    1,    1,    1,    2,    2,    2,    2,    1,

			    7,    8,    1,    7,    1,    2,    2,    2,    2,    1,
			    1,    2,    1,    5,    3,    2,    5,    3,    2,    5,
			    3,    2,    1,    2,    1,    2,    2,    5,    1,    3,
			    1,    3,    2,    2,    2,    1,    2,    1,    2,    2,
			    2,    6,    6,    7,    8,    9,    1,    2,    2,    2,
			    1,    7,    1,    7,    8,    1,    1,    2,    2,    1,
			    2,    2,    2,    2,    5,    3,    2,    1,    1,    2,
			    2,    5,    1,    1,    3,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    6,    1,    2,    2,    1,
			    2,    3,    7,    8,    7,    8,    6,    7,    8,    7, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    2,    2,    2,    8,    1,    2,    1,    1,    1,    1,
			    1,    2,    2,    2,    1,    1,    1, yyDummy>>,
			1, 17, 200)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    3,    3,    3,
			    3,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 216)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    2,    3,    0,    5,  134,   16,    0,    0,  122,  114,
			  106,   13,    4,  165,  164,  163,  162,  161,  160,  159,
			   55,   54,   53,   59,   58,   57,   56,   51,   50,   49,
			   48,   47,   46,   45,   44,   43,   42,  166,  158,   60,
			   52,  156,  138,  157,  153,  135,    0,   81,  130,   11,
			   12,   10,    9,    8,   81,   98,  154,    1,  136,  139,
			  144,   79,   77,   75,   73,   72,   62,   61,   20,   18,
			   19,    0,   82,    0,    0,   21,    7,    0,  129,  125,
			  123,    0,  121,  117,  115,    0,  113,  109,  107,    0,
			    6,  155,    0,  140,  142,   80,   78,   76,   74,   84,

			   32,   34,   81,   27,   81,   22,   23,   28,    0,   17,
			    0,  133,  131,  124,  126,  127,  116,  118,  119,  108,
			  110,  111,   14,    0,    0,  105,  101,   99,  137,  152,
			  144,    0,  147,  146,  148,    0,  145,   85,   20,   18,
			   19,   86,   21,    0,    0,   92,   30,   20,   18,   19,
			   25,   26,   81,   31,   33,   81,   81,   36,   35,  132,
			  128,  120,  112,    0,  100,  102,  103,  141,    0,  151,
			  150,  149,   81,   81,   81,   81,   81,   83,   91,    0,
			   81,   81,   81,   24,   29,    0,    0,   38,   37,   15,
			  104,    0,   90,   96,   88,   94,   97,   89,   95,   87, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,   93,    0,   40,    0,    0,    0,    0,
			    0,   39,   41,  143,    0,    0,    0, yyDummy>>,
			1, 17, 200)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   42,   43,  187,   71,   72,   73,  171,  127,   88,   84,
			   80,  141,  142,  143,  100,  144,  101,  145,  214,    2,
			    1,   44,   57,   12,   55,   90,   48,   76,   53,   52,
			   51,  102,  146,  112,   45,   46,   60,   92,   93,  130,
			   94, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 216)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768,   88, -32768,  794,   87,  794,   68, -32768, -32768,
			 -32768,   73, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  596, -32768,   61,  516, -32768, -32768,
			 -32768,  276,  234,  192,  516, -32768,   94, -32768, -32768, -32768,
			 -32768,  905,  879,  853,  827, 1087, -32768, -32768,   44,   44,
			 -32768, 1061,   86,   64,   51, -32768,  318,  761, -32768,   15,
			 -32768,  728, -32768,   14, -32768,  695, -32768,   -1, -32768,   -9,
			  150, -32768,  -41,   28,  560, 1035, 1009,  983,  957, -32768,

			 -32768, -32768,  356, -32768,  397,   44, -32768,   44,   -3, -32768,
			  794, -32768, -32768, -32768,   82, -32768, -32768,   70, -32768, -32768,
			   69, -32768, -32768,  794,  662, -32768,   -6, -32768, -32768, -32768,
			 -32768,   34, -32768, -32768, -32768,  629, -32768, -32768,    6,  -32,
			   29, -32768,   25,   23,   23,   18, -32768,    5,  -24,   24,
			 -32768, -32768,  397, -32768, -32768,  356,  516,  -25,  -25, -32768,
			 -32768, -32768, -32768,   26, -32768,   57, -32768,   28,   22, -32768,
			 -32768, -32768,  477,  477,  516,  477,  438, -32768, -32768,  931,
			  438,  438,  438, -32768, -32768,   16,   40,  -40,  -40, -32768,
			 -32768,  -12, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			    8,  -29,    7, -32768,  -25, -32768,    0,   20,  931,  931,
			  931,  -40, -32768, -32768,   27,   19, -32768, yyDummy>>,
			1, 17, 200)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -4,  -47, -152, -32768, -32768, -32768, -32768,   21,   59,   60,
			   66,  -38,  -44,  -59,  -65, -150,   35, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  -68,  -99,   30,   93, -32768, -32768, -32768,    9, -32768,
			 -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1126)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			yytable_template_3 (an_array)
			yytable_template_4 (an_array)
			yytable_template_5 (an_array)
			yytable_template_6 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   70,  104,   49,   75,  103,  150,  188,   70,  129,   74,
			   75,  158,  166,  123,  212,  206,   89,  121,  174,  216,
			  128,  174,  193,  195,  106,  198,   99,  215,  173,  203,
			  186,  209,  118,  115,   99,  213,  181,  152,  157,  155,
			  151,  165,  153,  122,  177,  178,  120,   79,   83,   87,
			  156,  207,  211,  183,  205,  140,  184,  149,  193,  195,
			  198,  117,  114,   99,   99,  180,  172,  210,  208,  191,
			  204,  104,  111,   79,  103,  190,  131,   83,  189,  179,
			  104,   87,  137,  103,  182,  176,  126,  162,  161,  175,
			  136,   11,   10,    9,    8,    7,  168,    6,    5,    4,

			  160,    3,   99,  109,  108,  149,  111,  107,  140,   70,
			   91,   59,   75,  192,  194,   50,  197,  199,  185,  163,
			  126,  192,  194,  197,   54,  140,  140,   70,  140,  149,
			   75,  170,  202,  149,  149,  149,  196,   58,   47,  167,
			  159,  116,  154,  113,  119,  164,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  202,  202,  202,   41,    0,    0,  125,    0,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,   31,   30,
			   29,   28,   27,   26,   25,   24,   23,   22,   21,   20,
			   19,   18,   17,   16,   15,   14,   13,    0,    0,    0, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,   41,    0,    0,   86,
			  124,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			   31,   30,   29,   28,   27,   26,   25,   24,   23,   22,
			   21,   20,   19,   18,   17,   16,   15,   14,   13,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   41,    0,
			    0,   82,   85,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,   31,   30,   29,   28,   27,   26,   25,   24,
			   23,   22,   21,   20,   19,   18,   17,   16,   15,   14,
			   13,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   41,    0,    0,   78,   81,   40,   39,   38,   37,   36,

			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26,
			   25,   24,   23,   22,   21,   20,   19,   18,   17,   16,
			   15,   14,   13,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   41,    0,    0,    0,   77,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,   31,   30,   29,   28,
			   27,   26,   25,   24,   23,   22,   21,   20,   19,   18,
			   17,   16,   15,   14,   13,    0,    0,    0,    0,    0,
			  139,    0,    0,    0,    0,   40,   39,  138,  110,   36,
			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26,
			   25,   24,   23,   22,   21,   20,    0,    0,   67,   66, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   65,   64,   63,    0,    0,    0,    0,    0,    0,    0,
			    0,  148,   62,   61,    0,  137,   40,   39,  147,    0,
			   36,   35,   34,   33,   32,   31,   30,   29,   28,   27,
			   26,   25,   24,   23,   22,   21,   20,    0,    0,   67,
			   66,   65,   64,   63,    0,    0,    0,    0,    0,    0,
			    0,    0,  148,   62,   61,    0,  137,   40,   39,  147,
			    0,   36,   35,   34,   33,   32,   31,   30,   29,   28,
			   27,   26,   25,   24,   23,   22,   21,   20,    0,    0,
			   67,   66,   65,   64,   63,    0,    0,    0,    0,    0,
			    0,  139,    0,    0,   62,   61,   40,   39,  138,    0,

			   36,   35,   34,   33,   32,   31,   30,   29,   28,   27,
			   26,   25,   24,   23,   22,   21,   20,    0,    0,   67,
			   66,   65,   64,   63,    0,    0,    0,    0,    0,    0,
			   69,    0,    0,   62,   61,   40,   39,   68,    0,   36,
			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26,
			   25,   24,   23,   22,   21,   20,    0,    0,   67,   66,
			   65,   64,   63,    0,    0,    0,    0,    0,  135,    0,
			    0,    0,   62,   61,   41,  134,    0,  133,  132,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,   31,   30,
			   29,   28,   27,   26,   25,   24,   23,   22,   21,   20, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   19,   18,   17,   16,   15,   14,   13,   56,    0,    0,
			   41,    0,    0,    0,    0,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26,
			   25,   24,   23,   22,   21,   20,   19,   18,   17,   16,
			   15,   14,   13,   41,    0,    0,  169,    0,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,   31,   30,   29,
			   28,   27,   26,   25,   24,   23,   22,   21,   20,   19,
			   18,   17,   16,   15,   14,   13,   41,    0,    0,  125,
			    0,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			   31,   30,   29,   28,   27,   26,   25,   24,   23,   22,

			   21,   20,   19,   18,   17,   16,   15,   14,   13,   41,
			    0,    0,   86,    0,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,   31,   30,   29,   28,   27,   26,   25,
			   24,   23,   22,   21,   20,   19,   18,   17,   16,   15,
			   14,   13,   41,    0,    0,   82,    0,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,   31,   30,   29,   28,
			   27,   26,   25,   24,   23,   22,   21,   20,   19,   18,
			   17,   16,   15,   14,   13,   41,    0,    0,   78,    0,
			   40,   39,   38,   37,   36,   35,   34,   33,   32,   31,
			   30,   29,   28,   27,   26,   25,   24,   23,   22,   21, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   20,   19,   18,   17,   16,   15,   14,   13,   41,    0,
			    0,    0,    0,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,   31,   30,   29,   28,   27,   26,   25,   24,
			   23,   22,   21,   20,   19,   18,   17,   16,   15,   14,
			   13,  -64,    0,    0,    0,    0,  -64,  -64,    0,    0,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -66,    0,    0,
			    0,   98,  -66,  -66,    0,    0,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -68,    0,    0,    0,   97,  -68,  -68,

			    0,    0,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -70,
			    0,    0,    0,   96,  -70,  -70,    0,    0,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  201,    0,    0,    0,   95,
			   40,   39,  200,    0,   36,   35,   34,   33,   32,   31,
			   30,   29,   28,   27,   26,   25,   24,   23,   22,   21,
			   20,  -65,    0,    0,    0,    0,  -65,  -65,    0,    0,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -67,    0,    0, yyDummy>>,
			1, 200, 800)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,  -67,  -67,    0,    0,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -69,    0,    0,    0,    0,  -69,  -69,
			    0,    0,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -71,
			    0,    0,    0,    0,  -71,  -71,    0,    0,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  105,    0,    0,    0,    0,
			   40,   39,    0,    0,   36,   35,   34,   33,   32,   31,
			   30,   29,   28,   27,   26,   25,   24,   23,   22,   21,

			   20,  -63,    0,    0,    0,    0,  -63,  -63,    0,    0,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63, yyDummy>>,
			1, 127, 1000)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1126)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			yycheck_template_3 (an_array)
			yycheck_template_4 (an_array)
			yycheck_template_5 (an_array)
			yycheck_template_6 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   47,   69,    6,   47,   69,  104,  158,   54,   49,   47,
			   54,   14,   18,   22,   14,   55,   54,   18,   50,    0,
			   61,   50,  172,  173,   71,  175,   58,    0,   60,  179,
			   55,   60,   18,   18,   58,   15,   60,  105,   41,  107,
			  105,   47,  107,   52,  143,  144,   47,   51,   52,   53,
			   53,   63,  204,  152,   14,  102,  155,  104,  208,  209,
			  210,   47,   47,   58,   58,   60,   60,   60,   60,   47,
			   54,  139,   76,   77,  139,   18,   48,   81,   52,   61,
			  148,   85,   59,  148,   60,   60,   90,   18,   18,   60,
			   94,    3,    4,    5,    6,    7,   62,    9,   10,   11,

			   18,   13,   58,   52,   40,  152,  110,   21,  155,  156,
			   16,   50,  156,  172,  173,   47,  175,  176,  156,  123,
			  124,  180,  181,  182,   51,  172,  173,  174,  175,  176,
			  174,  135,  179,  180,  181,  182,  174,   44,   51,  130,
			  110,   81,  107,   77,   85,  124,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,  208,  209,  210,   14,   -1,   -1,   17,   -1,   19,
			   20,   21,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,
			   40,   41,   42,   43,   44,   45,   46,   -1,   -1,   -1, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   -1,   14,   -1,   -1,   17,
			   60,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   43,   44,   45,   46,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   14,   -1,
			   -1,   17,   60,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,
			   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   14,   -1,   -1,   17,   60,   19,   20,   21,   22,   23,

			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,
			   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   14,   -1,   -1,   -1,   60,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   -1,   -1,   -1,   -1,   -1,
			   14,   -1,   -1,   -1,   -1,   19,   20,   21,   60,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   -1,   -1,   42,   43, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   14,   56,   57,   -1,   59,   19,   20,   21,   -1,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   -1,   -1,   42,
			   43,   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   14,   56,   57,   -1,   59,   19,   20,   21,
			   -1,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   -1,   -1,
			   42,   43,   44,   45,   46,   -1,   -1,   -1,   -1,   -1,
			   -1,   14,   -1,   -1,   56,   57,   19,   20,   21,   -1,

			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   -1,   -1,   42,
			   43,   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,
			   14,   -1,   -1,   56,   57,   19,   20,   21,   -1,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   -1,   -1,   42,   43,
			   44,   45,   46,   -1,   -1,   -1,   -1,   -1,    8,   -1,
			   -1,   -1,   56,   57,   14,   15,   -1,   17,   18,   19,
			   20,   21,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   37,   38,   39, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   40,   41,   42,   43,   44,   45,   46,   11,   -1,   -1,
			   14,   -1,   -1,   -1,   -1,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,
			   44,   45,   46,   14,   -1,   -1,   17,   -1,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   14,   -1,   -1,   17,
			   -1,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,

			   38,   39,   40,   41,   42,   43,   44,   45,   46,   14,
			   -1,   -1,   17,   -1,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,
			   45,   46,   14,   -1,   -1,   17,   -1,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   14,   -1,   -1,   17,   -1,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   39,   40,   41,   42,   43,   44,   45,   46,   14,   -1,
			   -1,   -1,   -1,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,
			   46,   14,   -1,   -1,   -1,   -1,   19,   20,   -1,   -1,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   14,   -1,   -1,
			   -1,   44,   19,   20,   -1,   -1,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   14,   -1,   -1,   -1,   44,   19,   20,

			   -1,   -1,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   14,
			   -1,   -1,   -1,   44,   19,   20,   -1,   -1,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   14,   -1,   -1,   -1,   44,
			   19,   20,   21,   -1,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   14,   -1,   -1,   -1,   -1,   19,   20,   -1,   -1,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   14,   -1,   -1, yyDummy>>,
			1, 200, 800)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   19,   20,   -1,   -1,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   14,   -1,   -1,   -1,   -1,   19,   20,
			   -1,   -1,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   14,
			   -1,   -1,   -1,   -1,   19,   20,   -1,   -1,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   14,   -1,   -1,   -1,   -1,
			   19,   20,   -1,   -1,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,

			   39,   14,   -1,   -1,   -1,   -1,   19,   20,   -1,   -1,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39, yyDummy>>,
			1, 127, 1000)
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

	yyvs4: SPECIAL [detachable STRING]
			-- Stack for semantic values of type detachable STRING

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [detachable STRING]
			-- Routines that ought to be in SPECIAL [detachable STRING]

	yyvs5: SPECIAL [PR_TOKEN]
			-- Stack for semantic values of type PR_TOKEN

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [PR_TOKEN]
			-- Routines that ought to be in SPECIAL [PR_TOKEN]

	yyvs6: SPECIAL [PR_TYPE]
			-- Stack for semantic values of type PR_TYPE

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [PR_TYPE]
			-- Routines that ought to be in SPECIAL [PR_TYPE]

	yyvs7: SPECIAL [DS_ARRAYED_LIST [PR_TYPE]]
			-- Stack for semantic values of type DS_ARRAYED_LIST [PR_TYPE]

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]]
			-- Routines that ought to be in SPECIAL [DS_ARRAYED_LIST [PR_TYPE]]

	yyvs8: SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]]
			-- Stack for semantic values of type DS_ARRAYED_LIST [PR_LABELED_TYPE]

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]]
			-- Routines that ought to be in SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]]

	yyvs9: SPECIAL [PR_LABELED_TYPE]
			-- Stack for semantic values of type PR_LABELED_TYPE

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [PR_LABELED_TYPE]
			-- Routines that ought to be in SPECIAL [PR_LABELED_TYPE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 216
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 64
			-- Number of tokens

	yyLast: INTEGER = 1126
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 303
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 105
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end
