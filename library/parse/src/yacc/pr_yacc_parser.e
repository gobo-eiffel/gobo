note

	description:

		"Parsers for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
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
		undefine
			report_invalid_unicode_character_error
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
			create yyspecial_routines10
			yyvsc10 := yyInitial_yyvs_size
			yyvs10 := yyspecial_routines10.make (yyvsc10)
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
			yyvsp10 := -1
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
			yyvs10.keep_head (0)
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
			when 10 then
				yyvsp10 := yyvsp10 - 1
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
			yyval7: PR_TYPE
			yyval3: STRING
			yyval5: detachable STRING
			yyval8: DS_ARRAYED_LIST [PR_TYPE]
			yyval9: DS_ARRAYED_LIST [PR_LABELED_TYPE]
			yyval10: PR_LABELED_TYPE
			yyval6: PR_TOKEN
		do
				inspect yy_act
when 1 then
--|#line 61 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 61")
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
--|#line 61 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 61")
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
--|#line 74 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 74")
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
--|#line 78 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 78")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 81 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 81")
end

			last_grammar.eiffel_header.force_last (yyvs3.item (yyvsp3))
		
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
when 6 then
--|#line 85 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 85")
end

			type := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 89 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 89")
end

			type := Void
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 93 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 93")
end

			precedence := precedence + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 97 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 97")
end

			precedence := precedence + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 101 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 101")
end

			precedence := precedence + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 105 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 105")
end

			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				create start_symbol.make (yyvs3.item (yyvsp3), line_nb)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 113 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 113")
end

			last_grammar.set_expected_conflicts (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 119 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 119")
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
--|#line 123 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 123")
end

			check attached yyvs7.item (yyvsp7) as l_type then
				type := l_type
				set_no_alias_name (l_type)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 130 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 130")
end

			check attached yyvs7.item (yyvsp7) as l_type then
				type := l_type
				set_alias_name (l_type, yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyvsp3 := yyvsp3 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 139 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 139")
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
--|#line 143 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 143")
end

			type := yyvs7.item (yyvsp7)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp7 := yyvsp7 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 149 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 149")
end

			yyval7 := new_type (Void, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 19 then
--|#line 153 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 153")
end

			yyval7 := new_basic_type (Void, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 20 then
--|#line 157 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 157")
end

			yyval7 := new_type (Void, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 21 then
--|#line 161 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 161")
end

yyval7 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 22 then
--|#line 165 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 165")
end

			yyval7 := new_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 23 then
--|#line 169 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 169")
end

			yyval7 := new_basic_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 24 then
--|#line 173 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 173")
end

			yyval7 := new_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 25 then
--|#line 177 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 177")
end

			yyval7 := new_type (Void, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 26 then
--|#line 181 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 181")
end

			yyval7 := new_generic_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3), yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 27 then
--|#line 185 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 185")
end

			yyval7 := new_generic_type (Void, yyvs3.item (yyvsp3), yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 28 then
--|#line 189 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 189")
end

			yyval7 := new_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 29 then
--|#line 193 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 193")
end

			yyval7 := new_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 30 then
--|#line 197 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 197")
end

			yyval7 := new_type (Void, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 31 then
--|#line 201 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 201")
end

			yyval7 := new_generic_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3), yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 32 then
--|#line 205 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 205")
end

			yyval7 := new_generic_type (Void, yyvs3.item (yyvsp3), yyvs8.item (yyvsp8))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 33 then
--|#line 209 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 209")
end

			yyval7 := new_labeled_tuple_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3), yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -1
	yyvsp9 := yyvsp9 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 34 then
--|#line 213 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 213")
end

			yyval7 := new_labeled_tuple_type (Void, yyvs3.item (yyvsp3), yyvs9.item (yyvsp9))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp7 := yyvsp7 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp9 := yyvsp9 -1
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 35 then
--|#line 217 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 217")
end

			yyval7 := new_anchored_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 36 then
--|#line 221 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 221")
end

			yyval7 := new_like_current_type (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -2
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 37 then
--|#line 225 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 225")
end

			yyval7 := new_anchored_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3 - 1) + yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -3
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 38 then
--|#line 229 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 229")
end

			yyval7 := new_anchored_type (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3 - 1) + yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp7 := yyvsp7 + 1
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -3
	if yyvsp7 >= yyvsc7 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs7")
		end
		yyvsc7 := yyvsc7 + yyInitial_yyvs_size
		yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
	end
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 39 then
--|#line 233 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 233")
end

			yyval7 := new_qualified_anchored_type (yyvs5.item (yyvsp5), yyvs7.item (yyvsp7), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp5 := yyvsp5 -1
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -2
	yyspecial_routines7.force (yyvs7, yyval7, yyvsp7)
end
when 40 then
--|#line 239 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 239")
end

			yyval3 := "." + yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 41 then
--|#line 243 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 243")
end

			yyval3 := yyvs3.item (yyvsp3 - 1) + "." + yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 42 then
--|#line 249 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 249")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 43 then
--|#line 251 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 251")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 44 then
--|#line 253 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 253")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 45 then
--|#line 255 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 255")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 46 then
--|#line 257 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 257")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 47 then
--|#line 259 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 259")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 48 then
--|#line 261 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 261")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 49 then
--|#line 263 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 263")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 50 then
--|#line 265 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 265")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 51 then
--|#line 267 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 267")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 52 then
--|#line 269 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 269")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 53 then
--|#line 271 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 271")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 54 then
--|#line 273 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 273")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 55 then
--|#line 275 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 275")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 56 then
--|#line 277 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 277")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 57 then
--|#line 279 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 279")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 58 then
--|#line 281 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 281")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 59 then
--|#line 283 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 283")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 60 then
--|#line 285 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 285")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 61 then
--|#line 289 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 289")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 62 then
--|#line 291 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 291")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 63 then
--|#line 293 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 293")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 64 then
--|#line 295 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 295")
end

yyval5 := yyvs3.item (yyvsp3) 
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
--|#line 297 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 297")
end

yyval5 := yyvs3.item (yyvsp3 - 1) + " " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 66 then
--|#line 299 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 299")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 67 then
--|#line 301 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 301")
end

yyval5 := yyvs3.item (yyvsp3 - 1) + " " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 68 then
--|#line 303 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 303")
end

yyval5 := "!" 
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
when 69 then
--|#line 305 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 305")
end

yyval5 := "! " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp1 := yyvsp1 -1
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
when 70 then
--|#line 307 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 307")
end

yyval5 := "?" 
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
when 71 then
--|#line 309 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 309")
end

yyval5 := "? " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp1 := yyvsp1 -1
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
when 72 then
--|#line 313 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 313")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 73 then
--|#line 315 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 315")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 74 then
--|#line 317 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 317")
end

yyval5 := yyvs3.item (yyvsp3 - 1) + " " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 75 then
--|#line 319 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 319")
end

yyval5 := yyvs3.item (yyvsp3) 
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
when 76 then
--|#line 321 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 321")
end

yyval5 := yyvs3.item (yyvsp3 - 1) + " " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 77 then
--|#line 323 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 323")
end

yyval5 := "!" 
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
when 78 then
--|#line 325 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 325")
end

yyval5 := "! " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp1 := yyvsp1 -1
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
when 79 then
--|#line 327 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 327")
end

yyval5 := "?" 
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
when 80 then
--|#line 329 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 329")
end

yyval5 := "? " + yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp1 := yyvsp1 -1
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
when 81 then
--|#line 333 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 333")
end

yyval5 := Void 
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
when 82 then
--|#line 335 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 335")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 83 then
--|#line 339 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 339")
end

			yyval8 := yyvs8.item (yyvsp8)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 84 then
--|#line 345 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 345")
end

			in_generics := in_generics + 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 85 then
--|#line 351 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 351")
end

			in_generics := in_generics - 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 86 then
--|#line 357 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 357")
end

			create yyval8.make (5)
			yyval8.force_last (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp8 := yyvsp8 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp8 >= yyvsc8 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs8")
		end
		yyvsc8 := yyvsc8 + yyInitial_yyvs_size
		yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
	end
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 87 then
--|#line 362 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 362")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.force_first (yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp7 := yyvsp7 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 88 then
--|#line 367 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 367")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.force_first (new_type (Void, yyvs3.item (yyvsp3)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 89 then
--|#line 372 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 372")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.force_first (new_basic_type (Void, yyvs3.item (yyvsp3)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 90 then
--|#line 377 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 377")
end

			yyval8 := yyvs8.item (yyvsp8)
			yyval8.force_first (new_type (Void, yyvs3.item (yyvsp3)))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
when 91 then
--|#line 384 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 384")
end

			yyval9 := yyvs9.item (yyvsp9)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 92 then
--|#line 390 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 390")
end

			create yyval9.make (5)
			yyval9.force_last (yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp9 := yyvsp9 + 1
	yyvsp10 := yyvsp10 -1
	if yyvsp9 >= yyvsc9 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs9")
		end
		yyvsc9 := yyvsc9 + yyInitial_yyvs_size
		yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
	end
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 93 then
--|#line 395 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 395")
end

			yyval9 := yyvs9.item (yyvsp9)
			yyval9.force_first (yyvs10.item (yyvsp10))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 94 then
--|#line 400 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 400")
end

			yyval9 := yyvs9.item (yyvsp9)
			yyval9.first.labels.force_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 95 then
--|#line 405 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 405")
end

			yyval9 := yyvs9.item (yyvsp9)
			yyval9.first.labels.force_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 96 then
--|#line 410 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 410")
end

			yyval9 := yyvs9.item (yyvsp9)
			yyval9.first.labels.force_first (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines9.force (yyvs9, yyval9, yyvsp9)
end
when 97 then
--|#line 417 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 417")
end

			yyval10 := new_labeled_type (yyvs3.item (yyvsp3), yyvs7.item (yyvsp7))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp10 := yyvsp10 + 1
	yyvsp3 := yyvsp3 -1
	yyvsp4 := yyvsp4 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp10 >= yyvsc10 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs10")
		end
		yyvsc10 := yyvsc10 + yyInitial_yyvs_size
		yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
	end
	yyspecial_routines10.force (yyvs10, yyval10, yyvsp10)
end
when 98 then
--|#line 423 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 423")
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
--|#line 424 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 424")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 100 then
--|#line 425 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 425")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 101 then
--|#line 428 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 428")
end

			check type_not_void: attached type as l_type then
				yyval6 := new_terminal (yyvs3.item (yyvsp3), l_type)
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
when 102 then
--|#line 434 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 434")
end

			check type_not_void: attached type as l_type then
				yyval6 := new_terminal (yyvs3.item (yyvsp3), l_type)
				set_token_id (yyval6, yyvs4.item (yyvsp4))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
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
when 103 then
--|#line 441 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 441")
end

			check type_not_void: attached type as l_type then
				yyval6 := new_terminal (yyvs3.item (yyvsp3 - 1), l_type)
				set_literal_string (yyval6, yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 104 then
--|#line 448 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 448")
end

			check type_not_void: attached type as l_type then
				yyval6 := new_terminal (yyvs3.item (yyvsp3 - 1), l_type)
				set_token_id (yyval6, yyvs4.item (yyvsp4))
				set_literal_string (yyval6, yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
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
when 105 then
--|#line 456 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 456")
end

			check type_not_void: attached type as l_type then
				yyval6 := new_char_terminal (yyvs2.item (yyvsp2), l_type)
			end
		
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
when 106 then
--|#line 464 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 464")
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
--|#line 465 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 465")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 108 then
--|#line 466 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 466")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 109 then
--|#line 469 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 469")
end

			yyval6 := new_left_terminal (yyvs3.item (yyvsp3), precedence)
		
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
when 110 then
--|#line 473 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 473")
end

			yyval6 := new_left_terminal (yyvs3.item (yyvsp3), precedence)
			set_token_id (yyval6, yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
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
when 111 then
--|#line 478 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 478")
end

			yyval6 := new_left_terminal (yyvs3.item (yyvsp3 - 1), precedence)
			set_literal_string (yyval6, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 112 then
--|#line 483 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 483")
end

			yyval6 := new_left_terminal (yyvs3.item (yyvsp3 - 1), precedence)
			set_token_id (yyval6, yyvs4.item (yyvsp4))
			set_literal_string (yyval6, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
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
when 113 then
--|#line 489 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 489")
end

			yyval6 := new_left_char_terminal (yyvs2.item (yyvsp2), precedence)
		
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
when 114 then
--|#line 495 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 495")
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
--|#line 496 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 496")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 116 then
--|#line 497 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 497")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 117 then
--|#line 500 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 500")
end

			yyval6 := new_right_terminal (yyvs3.item (yyvsp3), precedence)
		
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
when 118 then
--|#line 504 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 504")
end

			yyval6 := new_right_terminal (yyvs3.item (yyvsp3), precedence)
			set_token_id (yyval6, yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
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
when 119 then
--|#line 509 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 509")
end

			yyval6 := new_right_terminal (yyvs3.item (yyvsp3 - 1), precedence)
			set_literal_string (yyval6, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 120 then
--|#line 514 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 514")
end

			yyval6 := new_right_terminal (yyvs3.item (yyvsp3 - 1), precedence)
			set_token_id (yyval6, yyvs4.item (yyvsp4))
			set_literal_string (yyval6, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
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
when 121 then
--|#line 520 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 520")
end

			yyval6 := new_right_char_terminal (yyvs2.item (yyvsp2), precedence)
		
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
when 122 then
--|#line 526 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 526")
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
--|#line 527 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 527")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 124 then
--|#line 528 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 528")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 125 then
--|#line 531 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 531")
end

			yyval6 := new_nonassoc_terminal (yyvs3.item (yyvsp3), precedence)
		
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
when 126 then
--|#line 535 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 535")
end

			yyval6 := new_nonassoc_terminal (yyvs3.item (yyvsp3), precedence)
			set_token_id (yyval6, yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -1
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
when 127 then
--|#line 540 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 540")
end

			yyval6 := new_nonassoc_terminal (yyvs3.item (yyvsp3 - 1), precedence)
			set_literal_string (yyval6, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 128 then
--|#line 545 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 545")
end

			yyval6 := new_nonassoc_terminal (yyvs3.item (yyvsp3 - 1), precedence)
			set_token_id (yyval6, yyvs4.item (yyvsp4))
			set_literal_string (yyval6, yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 + 1
	yyvsp3 := yyvsp3 -2
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
when 129 then
--|#line 551 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 551")
end

			yyval6 := new_nonassoc_char_terminal (yyvs2.item (yyvsp2), precedence)
		
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
when 130 then
--|#line 557 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 557")
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
--|#line 558 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 558")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 132 then
--|#line 559 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 559")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 133 then
--|#line 562 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 562")
end

			check type_not_void: attached type as l_type then
				yyval1 := new_nonterminal (yyvs3.item (yyvsp3), l_type)
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
when 134 then
--|#line 570 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 570")
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
--|#line 574 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 574")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 136 then
--|#line 575 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 575")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 137 then
--|#line 578 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 578")
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
--|#line 588 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 588")
end

			if is_terminal (yyvs3.item (yyvsp3)) then
				report_lhs_symbol_token_error (yyvs3.item (yyvsp3))
				check rule_not_void: attached new_rule (new_midrule_variable) as l_rule then
					rule := l_rule
					put_rule (l_rule)
				end
			else
				check rule_not_void: attached new_rule (new_variable (yyvs3.item (yyvsp3))) as l_rule then
					rule := l_rule
					if l_rule.lhs.rules.count > 1 then
						report_rule_declared_twice_warning (yyvs3.item (yyvsp3))
					end
					put_rule (l_rule)
				end
			end
			precedence_token := Void
		
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
when 139 then
--|#line 609 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 609")
end

			check rule_not_void: attached rule as l_rule then
				l_rule.set_line_nb (yyvs4.item (yyvsp4))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
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
--|#line 617 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 617")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 141 then
--|#line 618 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 618")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 142 then
--|#line 621 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 621")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 143 then
--|#line 622 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 622")
end

			check rule_not_void: attached rule as l_rule then
				if yyvs4.item (yyvsp4) < 1 or yyvs4.item (yyvsp4) > l_rule.error_actions.count then
					report_invalid_error_n_error (yyvs4.item (yyvsp4))
				else
					put_error_action (new_error_action (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4 - 1)), yyvs4.item (yyvsp4), l_rule)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -2
	yyvsp4 := yyvsp4 -2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 144 then
--|#line 634 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 634")
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
--|#line 635 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 635")
end

			check rule_not_void: attached rule as l_rule then
				put_symbol (new_symbol (yyvs3.item (yyvsp3)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 146 then
--|#line 641 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 641")
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
--|#line 647 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 647")
end

			check rule_not_void: attached rule as l_rule then
				put_symbol (new_string_token (yyvs3.item (yyvsp3)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 148 then
--|#line 653 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 653")
end

			check rule_not_void: attached rule as l_rule then
				put_action (new_action (yyvs3.item (yyvsp3)), l_rule)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 149 then
--|#line 659 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 659")
end

			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := yyvs6.item (yyvsp6)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 150 then
--|#line 669 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 669")
end

			if is_terminal (yyvs3.item (yyvsp3)) then
				yyval6 := new_token (yyvs3.item (yyvsp3))
			else
				report_prec_not_token_error (yyvs3.item (yyvsp3))
				yyval6 := new_char_token ("'a'")
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
when 151 then
--|#line 678 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 678")
end

			yyval6 := new_char_token (yyvs2.item (yyvsp2))
		
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
when 152 then
--|#line 684 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 684")
end

			check rule_not_void: attached rule as l_rule then
				process_rule (l_rule)
				check new_rule_not_void: attached new_rule (l_rule.lhs) as l_new_rule then
					rule := l_new_rule
					precedence_token := Void
					l_new_rule.set_line_nb (yyvs4.item (yyvsp4))
					put_rule (l_new_rule)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
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
--|#line 698 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 698")
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
--|#line 699 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 699")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 155 then
--|#line 700 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 700")
end

			last_grammar.set_eiffel_code (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 156 then
--|#line 706 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 706")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 157 then
--|#line 708 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 708")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 158 then
--|#line 710 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 710")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 159 then
--|#line 712 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 712")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 160 then
--|#line 714 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 714")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 161 then
--|#line 716 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 716")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 162 then
--|#line 718 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 718")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 163 then
--|#line 720 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 720")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 164 then
--|#line 722 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 722")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 165 then
--|#line 724 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 724")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 166 then
--|#line 726 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 726")
end

yyval3 := yyvs3.item (yyvsp3) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
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
			    1,    1,    1,    3,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    1,    1,    1,    1,    1,    3,
			    4,    1,    1,    1,    1,    1,    1,    1,    1,    4,
			    1,    1,    1,    3,    3,    3,    3,    3,    3,    3,
			    3,    5,    5,    5,    7,    7,    1,    1,    2,    3,
			    6,    1,    2,    3,    6,    1,    2,    3,    6,    7,
			    1,    3,    1,    1,    1,    3,    3,    3,    3,    1,

			    8,    9,    1,    8,    1,    3,    3,    3,    3,    1,
			    1,    3,    1,    6,    4,    3,    6,    4,    3,    6,
			    4,    3,    1,    3,    1,    2,    3,    6,    1,    4,
			    1,    4,    3,    3,    2,    1,    3,    1,    3,    3,
			    3,    7,    7,    8,    9,   10,    1,    3,    3,    3,
			    1,    8,    1,    8,    9,    1,    1,    3,    3,    1,
			    3,    3,    3,    3,    6,    4,    3,    1,    1,    2,
			    3,    6,    1,    1,    4,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    7,    1,    3,    3,    1,
			    3,    4,    8,    9,    8,    9,    7,    8,    9,    8, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    3,    3,    3,    9,    1,    3,    1,    1,    1,    1,
			    1,    3,    3,    3,    1,    1,    1, yyDummy>>,
			1, 17, 200)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    4,    4,    4,
			    4,    1,    1,    1,    1,    1,    1,    1,    1,    1,
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
			  144,    0,  147,  148,  146,    0,  145,   85,   20,   18,
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
			 -32768, -32768,   88, -32768,  798,   87,  798,   68, -32768, -32768,
			 -32768,   73, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  596, -32768,   61,  515, -32768, -32768,
			 -32768,  271,  229,  187,  515, -32768,   93, -32768, -32768, -32768,
			 -32768,  908,  882,  856,  830, 1084, -32768, -32768,   43,   43,
			 -32768, 1059,   86,   64,   51, -32768,  313,  766, -32768,   17,
			 -32768,  732, -32768,   15, -32768,  698, -32768,   14, -32768,  -11,
			  145, -32768,  -35,   28,  560, 1034, 1009,  984,  959, -32768,

			 -32768, -32768,  351, -32768,  394,   43, -32768,   43,   -7, -32768,
			  798, -32768, -32768, -32768,   82, -32768, -32768,   71, -32768, -32768,
			   69, -32768, -32768,  798,  664, -32768,    3, -32768, -32768, -32768,
			 -32768,   20, -32768, -32768, -32768,  630, -32768, -32768,    5,  -30,
			   36, -32768,   25,   29,   29,   23, -32768,  -22,  -45,   19,
			 -32768, -32768,  394, -32768, -32768,  351,  515,   -1,   -1, -32768,
			 -32768, -32768, -32768,   26, -32768,   52, -32768,   28,   22, -32768,
			 -32768, -32768,  476,  476,  515,  476,  437, -32768, -32768,  934,
			  437,  437,  437, -32768, -32768,   21,   53,  -36,  -36, -32768,
			 -32768,    4, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			    6,  -33,   -9, -32768,   -1, -32768,   16,   27,  934,  934,
			  934,  -36, -32768, -32768,   18,   12, -32768, yyDummy>>,
			1, 17, 200)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -4,  -47, -152, -32768, -32768, -32768, -32768,   24,   59,   62,
			   65,  -38,  -44,  -59,  -65, -150,   34, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  -68,  -99,   30,   95, -32768, -32768, -32768,    7, -32768,
			 -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1123)
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
			   70,  104,   49,   75,  103,  150,  188,   70,  158,   74,
			   75,  123,  216,   99,  129,  181,   89,  174,  215,  206,
			  174,  166,  193,  195,  106,  198,  128,  209,   99,  203,
			  173,  212,  121,  118,  157,  115,   99,  152,  180,  155,
			  151,  122,  153,  213,  177,  178,  156,   79,   83,   87,
			  165,  210,  211,  183,  186,  140,  184,  149,  193,  195,
			  198,  120,  117,   99,  114,  172,  208,  207,  205,  191,
			  190,  104,  111,   79,  103,  204,  131,   83,  189,  182,
			  104,   87,  168,  103,  179,  176,  126,  162,  137,  161,
			  136,   11,   10,    9,    8,    7,  175,    6,    5,    4,

			  160,   99,    3,  109,  108,  149,  111,  107,  140,   70,
			   91,   59,   75,  192,  194,   50,  197,  199,  185,  163,
			  126,  192,  194,  197,   54,  140,  140,   70,  140,  149,
			   75,  170,  202,  149,  149,  149,  196,  167,   47,   58,
			  159,  154,  113,  116,  119,    0,    0,    0,  164,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  125,    0,
			   41,  202,  202,  202,   40,   39,   38,   37,   36,   35,
			   34,   33,   32,   31,   30,   29,   28,   27,   26,   25,
			   24,   23,   22,   21,   20,   19,   18,   17,   16,   15,
			   14,   13,    0,    0,    0,    0,    0,    0,    0,    0, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   86,    0,   41,    0,    0,  124,   40,   39,   38,   37,
			   36,   35,   34,   33,   32,   31,   30,   29,   28,   27,
			   26,   25,   24,   23,   22,   21,   20,   19,   18,   17,
			   16,   15,   14,   13,    0,    0,    0,    0,    0,    0,
			    0,    0,   82,    0,   41,    0,    0,   85,   40,   39,
			   38,   37,   36,   35,   34,   33,   32,   31,   30,   29,
			   28,   27,   26,   25,   24,   23,   22,   21,   20,   19,
			   18,   17,   16,   15,   14,   13,    0,    0,    0,    0,
			    0,    0,    0,    0,   78,    0,   41,    0,    0,   81,
			   40,   39,   38,   37,   36,   35,   34,   33,   32,   31,

			   30,   29,   28,   27,   26,   25,   24,   23,   22,   21,
			   20,   19,   18,   17,   16,   15,   14,   13,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   41,    0,
			    0,   77,   40,   39,   38,   37,   36,   35,   34,   33,
			   32,   31,   30,   29,   28,   27,   26,   25,   24,   23,
			   22,   21,   20,   19,   18,   17,   16,   15,   14,   13,
			    0,    0,    0,    0,    0,    0,  139,    0,    0,    0,
			   40,   39,  138,  110,   36,   35,   34,   33,   32,   31,
			   30,   29,   28,   27,   26,   25,   24,   23,   22,   21,
			   20,    0,    0,   67,   66,   65,   64,   63,    0,    0, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,   62,   61,  148,
			  137,    0,    0,   40,   39,  147,    0,   36,   35,   34,
			   33,   32,   31,   30,   29,   28,   27,   26,   25,   24,
			   23,   22,   21,   20,    0,    0,   67,   66,   65,   64,
			   63,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   62,   61,  148,  137,    0,    0,   40,   39,  147,    0,
			   36,   35,   34,   33,   32,   31,   30,   29,   28,   27,
			   26,   25,   24,   23,   22,   21,   20,    0,    0,   67,
			   66,   65,   64,   63,    0,    0,    0,    0,    0,    0,
			    0,  139,    0,   62,   61,   40,   39,  138,    0,   36,

			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26,
			   25,   24,   23,   22,   21,   20,    0,    0,   67,   66,
			   65,   64,   63,    0,    0,    0,    0,    0,    0,    0,
			   69,    0,   62,   61,   40,   39,   68,    0,   36,   35,
			   34,   33,   32,   31,   30,   29,   28,   27,   26,   25,
			   24,   23,   22,   21,   20,    0,    0,   67,   66,   65,
			   64,   63,    0,    0,    0,    0,    0,    0,  135,    0,
			    0,   62,   61,  134,    0,   41,  133,    0,  132,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,   31,   30,
			   29,   28,   27,   26,   25,   24,   23,   22,   21,   20, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   19,   18,   17,   16,   15,   14,   13,   56,    0,    0,
			    0,   41,    0,    0,    0,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26,
			   25,   24,   23,   22,   21,   20,   19,   18,   17,   16,
			   15,   14,   13,  169,    0,   41,    0,    0,    0,   40,
			   39,   38,   37,   36,   35,   34,   33,   32,   31,   30,
			   29,   28,   27,   26,   25,   24,   23,   22,   21,   20,
			   19,   18,   17,   16,   15,   14,   13,  125,    0,   41,
			    0,    0,    0,   40,   39,   38,   37,   36,   35,   34,
			   33,   32,   31,   30,   29,   28,   27,   26,   25,   24,

			   23,   22,   21,   20,   19,   18,   17,   16,   15,   14,
			   13,   86,    0,   41,    0,    0,    0,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,   31,   30,   29,   28,
			   27,   26,   25,   24,   23,   22,   21,   20,   19,   18,
			   17,   16,   15,   14,   13,   82,    0,   41,    0,    0,
			    0,   40,   39,   38,   37,   36,   35,   34,   33,   32,
			   31,   30,   29,   28,   27,   26,   25,   24,   23,   22,
			   21,   20,   19,   18,   17,   16,   15,   14,   13,   78,
			    0,   41,    0,    0,    0,   40,   39,   38,   37,   36,
			   35,   34,   33,   32,   31,   30,   29,   28,   27,   26, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   25,   24,   23,   22,   21,   20,   19,   18,   17,   16,
			   15,   14,   13,   41,    0,    0,    0,   40,   39,   38,
			   37,   36,   35,   34,   33,   32,   31,   30,   29,   28,
			   27,   26,   25,   24,   23,   22,   21,   20,   19,   18,
			   17,   16,   15,   14,   13,  -64,    0,    0,    0,  -64,
			  -64,    0,    0,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,  -64,
			    0,  -66,    0,    0,   98,  -66,  -66,    0,    0,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,  -66,
			  -66,  -66,  -66,  -66,  -66,  -66,    0,  -68,    0,    0,

			   97,  -68,  -68,    0,    0,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,  -68,
			  -68,  -68,    0,  -70,    0,    0,   96,  -70,  -70,    0,
			    0,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,
			  -70,  -70,  -70,  -70,  -70,  -70,  -70,  -70,    0,  201,
			    0,    0,   95,   40,   39,  200,    0,   36,   35,   34,
			   33,   32,   31,   30,   29,   28,   27,   26,   25,   24,
			   23,   22,   21,   20,  -65,    0,    0,    0,  -65,  -65,
			    0,    0,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,
			  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -65,  -67, yyDummy>>,
			1, 200, 800)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,  -67,  -67,    0,    0,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,  -67,
			  -67,  -67,  -67,  -67,  -69,    0,    0,    0,  -69,  -69,
			    0,    0,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,
			  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -69,  -71,
			    0,    0,    0,  -71,  -71,    0,    0,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,  -71,
			  -71,  -71,  -71,  -71,  105,    0,    0,    0,   40,   39,
			    0,    0,   36,   35,   34,   33,   32,   31,   30,   29,
			   28,   27,   26,   25,   24,   23,   22,   21,   20,  -63,

			    0,    0,    0,  -63,  -63,    0,    0,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,  -63,
			  -63,  -63,  -63,  -63, yyDummy>>,
			1, 124, 1000)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1123)
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
			   47,   69,    6,   47,   69,  104,  158,   54,   15,   47,
			   54,   22,    0,   58,   49,   60,   54,   50,    0,   55,
			   50,   18,  172,  173,   71,  175,   61,   60,   58,  179,
			   60,   15,   18,   18,   41,   18,   58,  105,   60,  107,
			  105,   52,  107,   16,  143,  144,   53,   51,   52,   53,
			   47,   60,  204,  152,   55,  102,  155,  104,  208,  209,
			  210,   47,   47,   58,   47,   60,   60,   63,   15,   47,
			   18,  139,   76,   77,  139,   54,   48,   81,   52,   60,
			  148,   85,   62,  148,   61,   60,   90,   18,   59,   18,
			   94,    3,    4,    5,    6,    7,   60,    9,   10,   11,

			   18,   58,   14,   52,   40,  152,  110,   21,  155,  156,
			   17,   50,  156,  172,  173,   47,  175,  176,  156,  123,
			  124,  180,  181,  182,   51,  172,  173,  174,  175,  176,
			  174,  135,  179,  180,  181,  182,  174,  130,   51,   44,
			  110,  107,   77,   81,   85,   -1,   -1,   -1,  124,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   13,   -1,
			   15,  208,  209,  210,   19,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,
			   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   13,   -1,   15,   -1,   -1,   60,   19,   20,   21,   22,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   40,   41,   42,
			   43,   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   13,   -1,   15,   -1,   -1,   60,   19,   20,
			   21,   22,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   42,   43,   44,   45,   46,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   13,   -1,   15,   -1,   -1,   60,
			   19,   20,   21,   22,   23,   24,   25,   26,   27,   28,

			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   42,   43,   44,   45,   46,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   15,   -1,
			   -1,   60,   19,   20,   21,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   38,   39,   40,   41,   42,   43,   44,   45,   46,
			   -1,   -1,   -1,   -1,   -1,   -1,   15,   -1,   -1,   -1,
			   19,   20,   21,   60,   23,   24,   25,   26,   27,   28,
			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   -1,   -1,   42,   43,   44,   45,   46,   -1,   -1, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   56,   57,   15,
			   59,   -1,   -1,   19,   20,   21,   -1,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   -1,   -1,   42,   43,   44,   45,
			   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   56,   57,   15,   59,   -1,   -1,   19,   20,   21,   -1,
			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   36,   37,   38,   39,   -1,   -1,   42,
			   43,   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   15,   -1,   56,   57,   19,   20,   21,   -1,   23,

			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   -1,   -1,   42,   43,
			   44,   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   15,   -1,   56,   57,   19,   20,   21,   -1,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   -1,   -1,   42,   43,   44,
			   45,   46,   -1,   -1,   -1,   -1,   -1,   -1,    8,   -1,
			   -1,   56,   57,   13,   -1,   15,   16,   -1,   18,   19,
			   20,   21,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   37,   38,   39, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   40,   41,   42,   43,   44,   45,   46,   11,   -1,   -1,
			   -1,   15,   -1,   -1,   -1,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,
			   44,   45,   46,   13,   -1,   15,   -1,   -1,   -1,   19,
			   20,   21,   22,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,
			   40,   41,   42,   43,   44,   45,   46,   13,   -1,   15,
			   -1,   -1,   -1,   19,   20,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,

			   36,   37,   38,   39,   40,   41,   42,   43,   44,   45,
			   46,   13,   -1,   15,   -1,   -1,   -1,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   13,   -1,   15,   -1,   -1,
			   -1,   19,   20,   21,   22,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   40,   41,   42,   43,   44,   45,   46,   13,
			   -1,   15,   -1,   -1,   -1,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   34,   35,   36,   37,   38,   39,   40,   41,   42,   43,
			   44,   45,   46,   15,   -1,   -1,   -1,   19,   20,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   40,   41,
			   42,   43,   44,   45,   46,   15,   -1,   -1,   -1,   19,
			   20,   -1,   -1,   23,   24,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   37,   38,   39,
			   -1,   15,   -1,   -1,   44,   19,   20,   -1,   -1,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   37,   38,   39,   -1,   15,   -1,   -1,

			   44,   19,   20,   -1,   -1,   23,   24,   25,   26,   27,
			   28,   29,   30,   31,   32,   33,   34,   35,   36,   37,
			   38,   39,   -1,   15,   -1,   -1,   44,   19,   20,   -1,
			   -1,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   35,   36,   37,   38,   39,   -1,   15,
			   -1,   -1,   44,   19,   20,   21,   -1,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   15,   -1,   -1,   -1,   19,   20,
			   -1,   -1,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   15, yyDummy>>,
			1, 200, 800)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   19,   20,   -1,   -1,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   15,   -1,   -1,   -1,   19,   20,
			   -1,   -1,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   15,
			   -1,   -1,   -1,   19,   20,   -1,   -1,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39,   15,   -1,   -1,   -1,   19,   20,
			   -1,   -1,   23,   24,   25,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   15,

			   -1,   -1,   -1,   19,   20,   -1,   -1,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   37,   38,   39, yyDummy>>,
			1, 124, 1000)
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

	yyvs5: SPECIAL [detachable STRING]
			-- Stack for semantic values of type detachable STRING

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [detachable STRING]
			-- Routines that ought to be in SPECIAL [detachable STRING]

	yyvs6: SPECIAL [PR_TOKEN]
			-- Stack for semantic values of type PR_TOKEN

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [PR_TOKEN]
			-- Routines that ought to be in SPECIAL [PR_TOKEN]

	yyvs7: SPECIAL [PR_TYPE]
			-- Stack for semantic values of type PR_TYPE

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [PR_TYPE]
			-- Routines that ought to be in SPECIAL [PR_TYPE]

	yyvs8: SPECIAL [DS_ARRAYED_LIST [PR_TYPE]]
			-- Stack for semantic values of type DS_ARRAYED_LIST [PR_TYPE]

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]]
			-- Routines that ought to be in SPECIAL [DS_ARRAYED_LIST [PR_TYPE]]

	yyvs9: SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]]
			-- Stack for semantic values of type DS_ARRAYED_LIST [PR_LABELED_TYPE]

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_LABELED_TYPE]]
			-- Routines that ought to be in SPECIAL [DS_ARRAYED_LIST [PR_LABELED_TYPE]]

	yyvs10: SPECIAL [PR_LABELED_TYPE]
			-- Stack for semantic values of type PR_LABELED_TYPE

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [PR_LABELED_TYPE]
			-- Routines that ought to be in SPECIAL [PR_LABELED_TYPE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 216
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 64
			-- Number of tokens

	yyLast: INTEGER = 1123
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 303
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 105
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end
