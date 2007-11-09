indexing

	description:

		"Parsers for config files made up of name/value pairs and preprocessor instructions"

	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UT_CONFIG_PARSER

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	UT_CONFIG_SCANNER
		rename
			make as make_scanner,
			reset as reset_scanner
		redefine
			fatal_error
		end

	KL_SHARED_STRING_EQUALITY_TESTER

	KL_SHARED_EXECUTION_ENVIRONMENT

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
			yyval3: BOOLEAN
		do
			inspect yy_act
when 1 then
--|#line 57 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 57")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 2 then
--|#line 60 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 60")
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
when 3 then
--|#line 61 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 61")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 62 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 62")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 66 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 66")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 67 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 67")
end


if yy_parsing_status = yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 7 then
--|#line 68 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 68")
end

			if not ignored then
				define_value ("", yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 74 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 74")
end

			if not ignored then
				undefine_value (yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 9 then
--|#line 80 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 80")
end

			if not ignored then
				process_include (yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 86 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 86")
end

			if not ignored then
				config_values.force (yyvs2.item (yyvsp2), yyvs2.item (yyvsp2 - 1))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 92 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 92")
end

			if not ignored then
				config_values.force ("", yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 98 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 98")
end

			-- Empty lines are skipped.
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 104 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 104")
end

			if_level := if_level + 1
			if not ignored and not yyvs3.item (yyvsp3) then
				ignored_level := if_level
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 111 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 111")
end

			if_level := if_level + 1
			if not ignored and yyvs3.item (yyvsp3) then
				ignored_level := if_level
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 120 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 120")
end

			yyval3 := is_defined (yyvs2.item (yyvsp2))
		
if yy_parsing_status = yyContinue then
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
when 16 then
--|#line 124 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 124")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs3.put (yyval3, yyvsp3)
end
when 17 then
--|#line 128 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 128")
end

			yyval3 := yyvs3.item (yyvsp3 - 1) and yyvs3.item (yyvsp3)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 18 then
--|#line 132 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 132")
end

			yyval3 := yyvs3.item (yyvsp3 - 1) or yyvs3.item (yyvsp3)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 19 then
--|#line 136 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 136")
end

			yyval3 := not yyvs3.item (yyvsp3)
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs3.put (yyval3, yyvsp3)
end
when 20 then
--|#line 142 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 142")
end

			if ignored_level = if_level then
				ignored_level := 0
			end
			if_level := if_level - 1
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 151 "ut_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ut_config_parser.y' at line 151")
end

			if not ignored then
				ignored_level := if_level
			elseif ignored_level = if_level then
				ignored_level := 0
			end
		
if yy_parsing_status = yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
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
			when 45 then
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
			    2,    2,    2,   17,    2,    2,    2,    2,    2,    2,
			   18,   19,    2,    2,    2,    2,    2,    2,    2,    2,
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
			   15,   16, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   21,   22,   22,   22,   23,   23,   23,   23,   23,
			   23,   23,   23,   24,   24,   20,   20,   20,   20,   20,
			   25,   26, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    2,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    2,    2,    1,    1,    2,    3,    3,
			    1,    1,    2,    1,    1,    1,    1,    3,    3,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    3,
			    3,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    2,    2,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,   12,    0,    0,    0,    0,    0,    1,    3,
			    2,    0,    0,    0,    0,    0,    0,   15,    0,    0,
			    4,    0,    0,   11,    8,    7,    9,    0,   19,    0,
			    0,   14,   13,    0,    0,    5,    2,   10,   16,   17,
			   18,   20,   21,    0,    6,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   18,   45,    8,    9,   10,   35,   36, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   37,   49, -32768,   46,   45,   39,   33,   33,   37, -32768,
			   37,   12,   36,   28,   19,   33,   33, -32768,   38,   -7,
			 -32768,   11,   18, -32768, -32768, -32768, -32768,   40, -32768,   33,
			   33, -32768, -32768,    2,   -3, -32768,   37, -32768, -32768, -32768,
			  -10, -32768, -32768,   27, -32768,    5,    4, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -5, -32768,   -9,   -8, -32768,   20, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   20,   21,   19,   32,   47,   46,   29,   42,   30,   29,
			   27,   28,   41,   20,    7,    6,    5,    4,    3,   34,
			   33,    2,   23,    1,   39,   40,   22,   43,   37,   26,
			    7,    6,    5,    4,    3,   20,   33,    2,   25,    1,
			    7,    6,    5,    4,    3,   17,   24,    2,   31,    1,
			   16,   15,   14,   30,   29,   30,   29,   13,   12,   38,
			   11,    0,    0,   44, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    8,   10,    7,   10,    0,    0,   16,   10,   15,   16,
			   15,   16,   10,   21,    3,    4,    5,    6,    7,    8,
			    9,   10,   10,   12,   29,   30,   14,   36,   10,   10,
			    3,    4,    5,    6,    7,   43,    9,   10,   10,   12,
			    3,    4,    5,    6,    7,   12,   10,   10,   10,   12,
			   17,   18,   13,   15,   16,   15,   16,   12,   12,   19,
			   11,   -1,   -1,   43, yyDummy>>)
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

	yyvs3: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

feature {NONE} -- Constants

	yyFinal: INTEGER is 47
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 20
			-- Number of tokens

	yyLast: INTEGER is 63
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 271
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 27
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make (a_handler: like error_handler) is
			-- Create a new parser.
		require
			a_handler_not_void: a_handler /= Void
		do
			make_scanner
			make_parser_skeleton
			error_handler := a_handler
			create defined_values.make_map (10)
			defined_values.set_key_equality_tester (string_equality_tester)
			create config_values.make_map (10)
			config_values.set_key_equality_tester (string_equality_tester)
			create include_stack.make (Max_include_depth)
			create line_nb_stack.make (Max_include_depth)
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Initialization

	reset is
			-- Reset parser before parsing next input.
		do
			reset_scanner
			if_level := 0
			ignored_level := 0
			defined_values.wipe_out
			line_nb_stack.wipe_out
			include_stack.wipe_out
			config_values.wipe_out
			has_error := False
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse config from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
		end

	parse_string (a_string: STRING) is
			-- Parse config from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_string_buffer (a_string))
			parse
		end

feature -- Processing

	process_include (a_filename: STRING) is
			-- Parse include file `a_filename'.
			-- Do not allow more than 10 nested include files.
		require
			a_filname_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		local
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			too_many_includes: UT_TOO_MANY_INCLUDES_ERROR
		do
			if not include_stack.is_full then
				create a_file.make (Execution_environment.interpreted_string (a_filename))
				a_file.open_read
				if a_file.is_open_read then
					line_nb_stack.put (line_nb)
					include_stack.put (input_buffer)
					set_input_buffer (new_file_buffer (a_file))
					line_nb := 1
				else
					create cannot_read.make (a_filename)
					error_handler.report_error (cannot_read)
					has_error := True
					abort
				end
			else
				create too_many_includes.make (include_stack.count + 1)
				error_handler.report_error (too_many_includes)
				has_error := True
				abort
			end
		end

feature -- Error handling

	has_error: BOOLEAN
			-- Has an error occurred?

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_error (a_message: STRING) is
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
			file_buffer: YY_FILE_BUFFER
			filename: STRING
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				filename := file_buffer.file.name
			else
				filename := "string"
			end
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			has_error := True
		end

	fatal_error (a_message: STRING) is
			-- A fatal error occurred.
			-- Print `a_message'.
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_message)
			error_handler.report_error (l_error)
			has_error := True
		end

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		do
			Result := ignored_level /= 0
		end

	is_defined (a_name: STRING): BOOLEAN is
			-- Is `a_name' defined?
		require
			a_name_not_void: a_name/= Void
		do
			Result := defined_values.has (a_name)
		end

feature -- Access

	config_values: DS_HASH_TABLE [STRING, STRING]
			-- Name/value pairs read from the config file so far

feature -- Element change

	define_value (a_value: STRING; a_name: STRING) is
			-- Define `a_name' with `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			defined_values.force (a_value, a_name)
		ensure
			a_name_defined: is_defined (a_name)
		end

	undefine_value (a_name: STRING) is
			-- Undefine `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			defined_values.remove (a_name)
		ensure
			a_name_undefined: not is_defined (a_name)
		end

feature {NONE} -- Implementation

	defined_values: DS_HASH_TABLE [STRING, STRING]
			-- Defined values

	if_level: INTEGER
			-- Number of nested #ifdef and #ifndef

	ignored_level: INTEGER
			-- Level of #ifdef or #ifndef which specified
			-- that subsequent lines should be ignored;
			-- 0 if lines should not be ignored

	include_stack: DS_ARRAYED_STACK [YY_BUFFER]
			-- Input buffers not completely parsed yet

	line_nb_stack: DS_ARRAYED_STACK [INTEGER]
			-- Line numbers in the corresponding input buffers in `include_stack'

	Max_include_depth: INTEGER is 10
			-- Maximum number of nested include files

invariant

	error_handler_not_void: error_handler /= Void
	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_item (Void)
	config_values_not_void: config_values /= Void
	no_void_config_value: not config_values.has_item (Void)

end
