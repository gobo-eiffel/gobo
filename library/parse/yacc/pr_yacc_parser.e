indexing

	description:

		"Parsers for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
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
			yyvsp6 := -1
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
			if yyvs6 /= Void then
				yyvs6.clear_all
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
				yyvs2.put (last_string_value, yyvsp2)
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
				yyvs3.put (last_integer_value, yyvsp3)
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

feature {NONE} -- Semantic actions

	yy_do_action (yy_act: INTEGER) is
			-- Execute semantic action.
		local
			yyval1: ANY
			yyval5: PR_TYPE
			yyval6: DS_ARRAYED_LIST [PR_TYPE]
			yyval4: PR_TOKEN
			yyval2: STRING
		do
			inspect yy_act
when 1 then
--|#line 51 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 51")
end

			if successful then
				set_start_symbol
				process_symbols
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 51 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 51")
end

			initialize_grammar
		
if yy_parsing_status = yyContinue then
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
--|#line 64 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 64")
end

			precedence := 1
		
if yy_parsing_status = yyContinue then
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
when 4 then
--|#line 68 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 68")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 71 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 71")
end

			last_grammar.eiffel_header.force_last (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
when 6 then
--|#line 75 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 75")
end

			type := Void
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 79 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 79")
end

			type := Void
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 83 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 83")
end

			precedence := precedence + 1
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 87 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 87")
end

			precedence := precedence + 1
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 91 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 91")
end

			precedence := precedence + 1
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 95 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 95")
end

			if start_symbol /= Void then
				report_multiple_start_declarations_error
			else
				create start_symbol.make (yyvs2.item (yyvsp2), line_nb)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 103 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 103")
end

			last_grammar.set_expected_conflicts (yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 109 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 109")
end

			type := No_type
		
if yy_parsing_status = yyContinue then
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
when 14 then
--|#line 113 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 113")
end

			type := yyvs5.item (yyvsp5)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 119 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 119")
end

			yyval5 := new_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 16 then
--|#line 123 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 123")
end

			yyval5 := new_basic_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 17 then
--|#line 127 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 127")
end

			yyval5 := new_basic_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 18 then
--|#line 131 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 131")
end

			yyval5 := new_basic_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 19 then
--|#line 135 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 135")
end

			yyval5 := new_basic_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 20 then
--|#line 139 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 139")
end

			yyval5 := new_basic_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 21 then
--|#line 143 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 143")
end

			yyval5 := new_basic_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 22 then
--|#line 147 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 147")
end

			yyval5 := new_generic_type (yyvs2.item (yyvsp2), yyvs6.item (yyvsp6))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp6 := yyvsp6 -1
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
when 23 then
--|#line 151 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 151")
end

			yyval5 := new_anchored_type (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 + 1
	yyvsp2 := yyvsp2 -2
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
when 24 then
--|#line 157 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 157")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs6.put (yyval6, yyvsp6)
end
when 25 then
--|#line 163 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 163")
end

			yyval6 := Void
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 26 then
--|#line 167 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 167")
end

			create yyval6.make (5)
			yyval6.force_last (yyvs5.item (yyvsp5))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp6 >= yyvsc6 then
		if yyvs6 = Void then
			debug ("GEYACC")
				std.error.put_line ("Create yyvs6")
			end
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
		else
			debug ("GEYACC")
				std.error.put_line ("Resize yyvs6")
			end
			yyvsc6 := yyvsc6 + yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.resize (yyvs6, yyvsc6)
		end
	end
	yyvs6.put (yyval6, yyvsp6)
end
when 27 then
--|#line 172 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 172")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.force_last (yyvs5.item (yyvsp5))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvs6.put (yyval6, yyvsp6)
end
when 28 then
--|#line 179 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 179")
end


if yy_parsing_status = yyContinue then
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
when 29 then
--|#line 180 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 180")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 30 then
--|#line 181 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 181")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 31 then
--|#line 184 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 184")
end

			yyval4 := new_terminal (yyvs2.item (yyvsp2), type)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 32 then
--|#line 188 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 188")
end

			yyval4 := new_terminal (yyvs2.item (yyvsp2), type)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 33 then
--|#line 193 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 193")
end

			yyval4 := new_terminal (yyvs2.item (yyvsp2 - 1), type)
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
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
	yyvs4.put (yyval4, yyvsp4)
end
when 34 then
--|#line 198 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 198")
end

			yyval4 := new_terminal (yyvs2.item (yyvsp2 - 1), type)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 35 then
--|#line 204 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 204")
end

			yyval4 := new_char_terminal (yyvs2.item (yyvsp2), type)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 36 then
--|#line 210 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 210")
end


if yy_parsing_status = yyContinue then
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
when 37 then
--|#line 211 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 211")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 38 then
--|#line 212 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 212")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 39 then
--|#line 215 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 215")
end

			yyval4 := new_left_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 40 then
--|#line 219 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 219")
end

			yyval4 := new_left_terminal (yyvs2.item (yyvsp2), precedence)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 41 then
--|#line 224 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 224")
end

			yyval4 := new_left_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
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
	yyvs4.put (yyval4, yyvsp4)
end
when 42 then
--|#line 229 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 229")
end

			yyval4 := new_left_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 43 then
--|#line 235 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 235")
end

			yyval4 := new_left_char_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 44 then
--|#line 241 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 241")
end


if yy_parsing_status = yyContinue then
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
when 45 then
--|#line 242 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 242")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 46 then
--|#line 243 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 243")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 47 then
--|#line 246 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 246")
end

			yyval4 := new_right_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 48 then
--|#line 250 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 250")
end

			yyval4 := new_right_terminal (yyvs2.item (yyvsp2), precedence)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 49 then
--|#line 255 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 255")
end

			yyval4 := new_right_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
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
	yyvs4.put (yyval4, yyvsp4)
end
when 50 then
--|#line 260 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 260")
end

			yyval4 := new_right_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 51 then
--|#line 266 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 266")
end

			yyval4 := new_right_char_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 52 then
--|#line 272 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 272")
end


if yy_parsing_status = yyContinue then
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
when 53 then
--|#line 273 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 273")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 54 then
--|#line 274 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 274")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 55 then
--|#line 277 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 277")
end

			yyval4 := new_nonassoc_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 56 then
--|#line 281 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 281")
end

			yyval4 := new_nonassoc_terminal (yyvs2.item (yyvsp2), precedence)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 57 then
--|#line 286 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 286")
end

			yyval4 := new_nonassoc_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
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
	yyvs4.put (yyval4, yyvsp4)
end
when 58 then
--|#line 291 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 291")
end

			yyval4 := new_nonassoc_terminal (yyvs2.item (yyvsp2 - 1), precedence)
			set_token_id (yyval4, yyvs3.item (yyvsp3))
			set_literal_string (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp3 := yyvsp3 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 59 then
--|#line 297 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 297")
end

			yyval4 := new_nonassoc_char_terminal (yyvs2.item (yyvsp2), precedence)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 60 then
--|#line 303 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 303")
end


if yy_parsing_status = yyContinue then
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
when 61 then
--|#line 304 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 304")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 62 then
--|#line 305 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 305")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 63 then
--|#line 308 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 308")
end

			yyval1 := new_nonterminal (yyvs2.item (yyvsp2), type)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
when 64 then
--|#line 314 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 314")
end

			report_no_rules_error
		
if yy_parsing_status = yyContinue then
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
when 65 then
--|#line 318 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 318")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 66 then
--|#line 319 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 319")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 67 then
--|#line 322 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 322")
end

			process_rule (rule)
			rule := Void
			precedence_token := Void
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 68 then
--|#line 330 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 330")
end

			if is_terminal (yyvs2.item (yyvsp2)) then
				report_lhs_symbol_token_error (yyvs2.item (yyvsp2))
				rule := new_rule (new_dummy_variable)
			else
				rule := new_rule (new_variable (yyvs2.item (yyvsp2)))
				if rule.lhs.rules.count > 1 then
					report_rule_declared_twice_warning (yyvs2.item (yyvsp2))
				end
			end
			precedence_token := Void
			put_rule (rule)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp2 := yyvsp2 -1
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
when 69 then
--|#line 346 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 346")
end

			rule.set_line_nb (yyvs3.item (yyvsp3))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
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
when 70 then
--|#line 352 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 352")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 71 then
--|#line 353 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 353")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 72 then
--|#line 356 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 356")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 73 then
--|#line 357 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 357")
end

			if yyvs3.item (yyvsp3) < 1 or yyvs3.item (yyvsp3) > rule.error_actions.count then
				report_invalid_error_n_error (yyvs3.item (yyvsp3))
			else
				put_error_action (new_error_action (yyvs2.item (yyvsp2), yyvs3.item (yyvsp3 - 1)), yyvs3.item (yyvsp3), rule)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 74 then
--|#line 367 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 367")
end


if yy_parsing_status = yyContinue then
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
when 75 then
--|#line 368 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 368")
end

			put_symbol (new_symbol (yyvs2.item (yyvsp2)), rule)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 76 then
--|#line 372 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 372")
end

			put_symbol (new_char_token (yyvs2.item (yyvsp2)), rule)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 77 then
--|#line 376 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 376")
end

			put_symbol (new_string_token (yyvs2.item (yyvsp2)), rule)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 78 then
--|#line 380 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 380")
end

			put_action (new_action (yyvs2.item (yyvsp2)), rule)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 79 then
--|#line 384 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 384")
end

			if precedence_token /= Void then
				report_prec_specified_twice_error
			else
				precedence_token := yyvs4.item (yyvsp4)
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 80 then
--|#line 394 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 394")
end

			if is_terminal (yyvs2.item (yyvsp2)) then
				yyval4 := new_token (yyvs2.item (yyvsp2))
			else
				report_prec_not_token_error (yyvs2.item (yyvsp2))
				yyval4 := new_char_token ("'a'")
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 81 then
--|#line 403 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 403")
end

			yyval4 := new_char_token (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp2 := yyvsp2 -1
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
	yyvs4.put (yyval4, yyvsp4)
end
when 82 then
--|#line 409 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 409")
end

			process_rule (rule)
			rule := new_rule (rule.lhs)
			precedence_token := Void
			rule.set_line_nb (yyvs3.item (yyvsp3))
			put_rule (rule)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp3 := yyvsp3 -1
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
when 83 then
--|#line 419 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 419")
end


if yy_parsing_status = yyContinue then
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
when 84 then
--|#line 420 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 420")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 85 then
--|#line 421 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 421")
end

			last_grammar.set_eiffel_code (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 86 then
--|#line 427 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 427")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 87 then
--|#line 429 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 429")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 88 then
--|#line 431 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 431")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 89 then
--|#line 433 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 433")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 90 then
--|#line 435 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 435")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 91 then
--|#line 437 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 437")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 92 then
--|#line 439 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 439")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
end
when 93 then
--|#line 441 "pr_yacc_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'pr_yacc_parser.y' at line 441")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs2.put (yyval2, yyvsp2)
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
			when 115 then
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
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			   36,   37,    2,    2,   34,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   29,   35,
			   30,    2,   31,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   32,    2,   33,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   28,    2,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14,
			   15,   16,   17,   18,   19,   20,   21,   22,   23,   24,
			   25,   26,   27, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   47,   49,   48,   48,   52,   52,   52,   52,   52,
			   52,   52,   52,   53,   53,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   46,   45,   45,   45,   54,   54,
			   54,   40,   40,   40,   40,   40,   56,   56,   56,   41,
			   41,   41,   41,   41,   57,   57,   57,   42,   42,   42,
			   42,   42,   58,   58,   58,   43,   43,   43,   43,   43,
			   55,   55,   55,   59,   50,   50,   50,   60,   61,   62,
			   63,   63,   64,   64,   66,   66,   66,   66,   66,   66,
			   39,   39,   65,   51,   51,   51,   38,   38,   38,   38,
			   38,   38,   38,   38, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    1,    1,    1,    1,    1,    2,    3,    1,
			    1,    1,    1,    1,    1,    1,    3,    1,    2,    2,
			    2,    2,    2,    2,    2,    2,    5,    1,    1,    2,
			    2,    4,    1,    2,    2,    4,    1,    2,    2,    4,
			    1,    2,    1,    1,    1,    2,    1,    6,    1,    1,
			    2,    1,    4,    3,    2,    4,    3,    2,    4,    3,
			    2,    1,    2,    2,    4,    1,    3,    1,    3,    2,
			    2,    2,    1,    2,    5,    6,    1,    2,    2,    2,

			    4,    3,    2,    1,    1,    2,    2,    4,    1,    1,
			    2,    3,    5,    1,    2,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    3,    3,    3,    3,
			    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    3,    0,    5,   64,   13,    0,    0,   52,   44,
			   36,   13,    4,   93,   92,   91,   90,   89,   88,   87,
			   86,   68,   83,   65,    0,    0,   60,   11,   12,   10,
			    9,    8,   28,   84,    1,   66,   69,   74,    0,   21,
			   20,   19,   18,   17,   16,   15,    0,    7,    0,   59,
			   55,   53,    0,   51,   47,   45,    0,   43,   39,   37,
			    6,   85,    0,   70,   72,   23,   25,   22,   14,    0,
			   63,   61,   54,   56,   57,   46,   48,   49,   38,   40,
			   41,    0,   35,   31,   29,   67,   82,   74,    0,   77,
			   76,   78,    0,   75,   26,    0,   62,   58,   50,   42,

			   30,   32,   33,   71,    0,   81,   80,   79,    0,   24,
			   34,    0,   27,    0,   73,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   21,  107,   84,   59,   55,   51,   46,   95,   67,  115,
			    2,    1,   22,   34,   12,   26,   60,   47,   31,   30,
			   29,   71,   23,   24,   37,   62,   63,   87,   64, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,  224, -32768,  201,   30,  201,   46, -32768, -32768,
			 -32768,   30, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  117, -32768,   32,  189, -32768, -32768, -32768,   68,
			   45,   13, -32768,   40, -32768, -32768, -32768, -32768,   39, -32768,
			 -32768, -32768, -32768, -32768, -32768,   25,   24,   84,  177, -32768,
			   22, -32768,  165, -32768,    3, -32768,  153, -32768,    2, -32768,
			  -12, -32768,   16,   -8,  102, -32768,  189, -32768, -32768,  201,
			 -32768, -32768, -32768,   34, -32768, -32768,   31, -32768, -32768,   27,
			 -32768,  141, -32768,    0, -32768, -32768, -32768, -32768,   -5, -32768,
			 -32768, -32768,  129, -32768, -32768,  -30, -32768, -32768, -32768, -32768,

			 -32768,   21, -32768,   -8,   -9, -32768, -32768, -32768,  189, -32768,
			 -32768,  -22, -32768,    1, -32768,   14,    6, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -6, -32768,   -1,   28,   26,   29,  -65, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768,   65, -32768, -32768, -32768, -32768,
			 -32768,    5,   51, -32768, -32768, -32768,  -16, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   27,   94,   20,  109,  108,   82,  117,   19,   18,   17,
			   16,   15,   14,   13,  116,  113,  114,  111,  102,   88,
			   80,   77,   81,   50,   54,   58,  101,   20,   79,   76,
			   57,  104,   19,   18,   17,   16,   15,   14,   13,  110,
			   74,   70,   50,  112,   86,   99,   54,   56,   73,   98,
			   58,   85,   97,   65,   83,   68,   61,   66,   93,   20,
			   25,   36,   53,   70,   19,   18,   17,   16,   15,   14,
			   13,  103,   28,   35,   96,   83,   32,   72,   75,   52,
			  100,    0,   20,    0,   78,   49,  106,   19,   18,   17,
			   16,   15,   14,   13,    0,    0,    0,    0,   20,    0,

			    0,    0,   48,   19,   18,   17,   16,   15,   14,   13,
			   92,    0,    0,    0,    0,    0,   20,   91,   69,   90,
			   89,   19,   18,   17,   16,   15,   14,   13,   33,    0,
			    0,   20,    0,    0,    0,    0,   19,   18,   17,   16,
			   15,   14,   13,   20,    0,    0,  105,    0,   19,   18,
			   17,   16,   15,   14,   13,   20,    0,    0,   82,    0,
			   19,   18,   17,   16,   15,   14,   13,   20,    0,    0,
			   57,    0,   19,   18,   17,   16,   15,   14,   13,   20,
			    0,    0,   53,    0,   19,   18,   17,   16,   15,   14,
			   13,   20,    0,    0,   49,    0,   19,   18,   17,   16,

			   15,   14,   13,   45,    0,    0,    0,    0,   44,   43,
			   42,   41,   40,   39,   38,   20,    0,    0,    0,    0,
			   19,   18,   17,   16,   15,   14,   13,   11,   10,    9,
			    8,    7,    0,    6,    5,    4,    0,    3, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    6,   66,   14,   33,   34,   17,    0,   19,   20,   21,
			   22,   23,   24,   25,    0,   37,   15,   26,   18,   27,
			   18,   18,   34,   29,   30,   31,   26,   14,   26,   26,
			   17,   36,   19,   20,   21,   22,   23,   24,   25,   18,
			   18,   47,   48,  108,   28,   18,   52,   34,   26,   18,
			   56,   35,   18,   14,   60,   31,   16,   32,   64,   14,
			   30,   29,   17,   69,   19,   20,   21,   22,   23,   24,
			   25,   87,   26,   22,   69,   81,   11,   48,   52,   34,
			   81,   -1,   14,   -1,   56,   17,   92,   19,   20,   21,
			   22,   23,   24,   25,   -1,   -1,   -1,   -1,   14,   -1,

			   -1,   -1,   34,   19,   20,   21,   22,   23,   24,   25,
			    8,   -1,   -1,   -1,   -1,   -1,   14,   15,   34,   17,
			   18,   19,   20,   21,   22,   23,   24,   25,   11,   -1,
			   -1,   14,   -1,   -1,   -1,   -1,   19,   20,   21,   22,
			   23,   24,   25,   14,   -1,   -1,   17,   -1,   19,   20,
			   21,   22,   23,   24,   25,   14,   -1,   -1,   17,   -1,
			   19,   20,   21,   22,   23,   24,   25,   14,   -1,   -1,
			   17,   -1,   19,   20,   21,   22,   23,   24,   25,   14,
			   -1,   -1,   17,   -1,   19,   20,   21,   22,   23,   24,
			   25,   14,   -1,   -1,   17,   -1,   19,   20,   21,   22,

			   23,   24,   25,   14,   -1,   -1,   -1,   -1,   19,   20,
			   21,   22,   23,   24,   25,   14,   -1,   -1,   -1,   -1,
			   19,   20,   21,   22,   23,   24,   25,    3,    4,    5,
			    6,    7,   -1,    9,   10,   11,   -1,   13, yyDummy>>)
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

	yyvs4: SPECIAL [PR_TOKEN]
			-- Stack for semantic values of type PR_TOKEN

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [PR_TOKEN]
			-- Routines that ought to be in SPECIAL [PR_TOKEN]

	yyvs5: SPECIAL [PR_TYPE]
			-- Stack for semantic values of type PR_TYPE

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [PR_TYPE]
			-- Routines that ought to be in SPECIAL [PR_TYPE]

	yyvs6: SPECIAL [DS_ARRAYED_LIST [PR_TYPE]]
			-- Stack for semantic values of type DS_ARRAYED_LIST [PR_TYPE]

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [PR_TYPE]]
			-- Routines that ought to be in SPECIAL [DS_ARRAYED_LIST [PR_TYPE]]

feature {NONE} -- Constants

	yyFinal: INTEGER is 117
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 38
			-- Number of tokens

	yyLast: INTEGER is 237
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 282
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 67
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end
