note

	description:

		"JSON parsers"

	library: "Gobo Eiffel JSON Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class JN_JSON_PARSER

inherit

	JN_JSON_PARSER_SKELETON
		undefine
			read_token
		end

	JN_JSON_SCANNER
		rename
			make as make_json_scanner,
			make_with_error_handler as make_json_scanner_with_error_handler
		undefine
			reset
		end

create

	make,
	make_with_error_handler


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
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_detachable_jn_boolean_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs6")
					end
					yyvsc6 := yyvsc6 + yyInitial_yyvs_size
					yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
				end
				yyspecial_routines6.force (yyvs6, last_detachable_jn_null_value, yyvsp6)
			when 7 then
				yyvsp7 := yyvsp7 + 1
				if yyvsp7 >= yyvsc7 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs7")
					end
					yyvsc7 := yyvsc7 + yyInitial_yyvs_size
					yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
				end
				yyspecial_routines7.force (yyvs7, last_detachable_jn_number_value, yyvsp7)
			when 8 then
				yyvsp8 := yyvsp8 + 1
				if yyvsp8 >= yyvsc8 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs8")
					end
					yyvsc8 := yyvsc8 + yyInitial_yyvs_size
					yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
				end
				yyspecial_routines8.force (yyvs8, last_detachable_jn_string_value, yyvsp8)
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
		do
			inspect yy_act
			when 1 then
					--|#line 50 "jn_json_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 56 "jn_json_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 58 "jn_json_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 60 "jn_json_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 62 "jn_json_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 64 "jn_json_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 66 "jn_json_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 68 "jn_json_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 72 "jn_json_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 76 "jn_json_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 83 "jn_json_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 89 "jn_json_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 96 "jn_json_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 105 "jn_json_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 109 "jn_json_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 116 "jn_json_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 122 "jn_json_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 130 "jn_json_parser.y"
				yy_do_action_18
			else
				debug ("GEYACC")
					std.error.put_string ("Error in parser: unknown rule id: ")
					std.error.put_integer (yy_act)
					std.error.put_new_line
				end
				abort
			end
		end

	yy_do_action_1
			--|#line 50 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 50 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 50")
end

			last_value := yyvs4.item (yyvsp4)
		
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
		end

	yy_do_action_2
			--|#line 56 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 56 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 56")
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
		end

	yy_do_action_3
			--|#line 58 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 58 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 58")
end

yyval4 := yyvs3.item (yyvsp3) 
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
		end

	yy_do_action_4
			--|#line 60 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 60 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 60")
end

yyval4 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
		end

	yy_do_action_5
			--|#line 62 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 62 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 62")
end

yyval4 := yyvs7.item (yyvsp7) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp7 := yyvsp7 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
		end

	yy_do_action_6
			--|#line 64 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 64 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 64")
end

yyval4 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
		end

	yy_do_action_7
			--|#line 66 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 66 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 66")
end

yyval4 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
		end

	yy_do_action_8
			--|#line 68 "jn_json_parser.y"
		local
			yyval4: detachable JN_VALUE
		do
--|#line 68 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 68")
end

yyval4 := yyvs6.item (yyvsp6) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp4 := yyvsp4 + 1
	yyvsp6 := yyvsp6 -1
	if yyvsp4 >= yyvsc4 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs4")
		end
		yyvsc4 := yyvsc4 + yyInitial_yyvs_size
		yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
	end
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
		end

	yy_do_action_9
			--|#line 72 "jn_json_parser.y"
		local
			yyval2: detachable JN_ARRAY
		do
--|#line 72 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 72")
end

			yyval2 := new_array (0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_10
			--|#line 76 "jn_json_parser.y"
		local
			yyval2: detachable JN_ARRAY
		do
--|#line 76 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 76")
end

			yyval2 := new_array (counter_value)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp2 >= yyvsc2 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs2")
		end
		yyvsc2 := yyvsc2 + yyInitial_yyvs_size
		yyvs2 := yyspecial_routines2.aliased_resized_area (yyvs2, yyvsc2)
	end
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
		end

	yy_do_action_11
			--|#line 83 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 83 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 83")
end

			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_12
			--|#line 89 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 89 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 89")
end

			if attached yyvs4.item (yyvsp4) as l_value then
				increment_counter
				array_values.force_last (l_value)
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
		end

	yy_do_action_13
			--|#line 96 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 96 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 96")
end

			if attached yyvs4.item (yyvsp4) as l_value then
				increment_counter
				array_values.force_last (l_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_14
			--|#line 105 "jn_json_parser.y"
		local
			yyval3: detachable JN_OBJECT
		do
--|#line 105 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 105")
end

			yyval3 := new_object (0)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 + 1
	yyvsp1 := yyvsp1 -2
	if yyvsp3 >= yyvsc3 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs3")
		end
		yyvsc3 := yyvsc3 + yyInitial_yyvs_size
		yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
	end
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
		end

	yy_do_action_15
			--|#line 109 "jn_json_parser.y"
		local
			yyval3: detachable JN_OBJECT
		do
--|#line 109 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 109")
end

			yyval3 := new_object (counter_value)
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 + 1
	yyvsp1 := yyvsp1 -3
	if yyvsp3 >= yyvsc3 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs3")
		end
		yyvsc3 := yyvsc3 + yyInitial_yyvs_size
		yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
	end
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
		end

	yy_do_action_16
			--|#line 116 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 116 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 116")
end

			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_17
			--|#line 122 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 122 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 122")
end

			if attached yyvs8.item (yyvsp8) as l_key and attached yyvs4.item (yyvsp4) as l_value then
				increment_counter
				object_keys.force_last (l_key)
				object_values.force_last (l_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp8 := yyvsp8 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_action_18
			--|#line 130 "jn_json_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 130 "jn_json_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'jn_json_parser.y' at line 130")
end

			if attached yyvs8.item (yyvsp8) as l_key and attached yyvs4.item (yyvsp4) as l_value then
				increment_counter
				object_keys.force_last (l_key)
				object_values.force_last (l_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -2
	yyvsp8 := yyvsp8 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 27 then
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
			create an_array.make_filled (0, 0, 263)
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
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,   11,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   14,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    9,    2,   10,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   12,    2,   13,    2,    2,    2,    2,
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
			    5,    6,    7,    8, yyDummy>>,
			1, 64, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   18,   17,   17,   17,   17,   17,   17,   17,   15,
			   15,   19,   20,   20,   16,   16,   21,   22,   22, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    8,    7,    6,    5,    5,    2,    3,
			    4,    1,    1,    1,    1,    4,    1,    8,    1,    1,
			    1,    1,    1,    1,    4,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    5,    5,    6,    7,    8,    1,    1,
			    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,   16,   11,    4,    5,    8,    7,    6,    2,    3,
			    1,    0,    0,   14,    9,   12,    0,    0,    0,    0,
			   10,    0,   15,   13,   17,    0,   18,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    8,    9,   15,   27,   11,   16,   12,   18, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   -2,    9,    5, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,   -2,    2, -32768, -32768,    7,    4,   -3,    3,   -2,
			 -32768,   -2, -32768, -32768,    1,    2, -32768,    8,    6, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768,    0, -32768, -32768,   10, -32768,  -12, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   10,    7,    6,    5,    4,    3,   29,    2,   28,   17,
			    1,   21,   25,   26,   20,   14,   22,    0,   19,    0,
			    0,   24,   13,    0,    0,    0,    0,    0,    0,   23, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    0,    3,    4,    5,    6,    7,    0,    9,    0,    7,
			   12,   14,   11,   25,   10,   10,   13,   -1,   11,   -1,
			   -1,   21,   13,   -1,   -1,   -1,   -1,   -1,   -1,   19, yyDummy>>)
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

	yyvs2: SPECIAL [detachable JN_ARRAY]
			-- Stack for semantic values of type detachable JN_ARRAY

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [detachable JN_ARRAY]
			-- Routines that ought to be in SPECIAL [detachable JN_ARRAY]

	yyvs3: SPECIAL [detachable JN_OBJECT]
			-- Stack for semantic values of type detachable JN_OBJECT

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [detachable JN_OBJECT]
			-- Routines that ought to be in SPECIAL [detachable JN_OBJECT]

	yyvs4: SPECIAL [detachable JN_VALUE]
			-- Stack for semantic values of type detachable JN_VALUE

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [detachable JN_VALUE]
			-- Routines that ought to be in SPECIAL [detachable JN_VALUE]

	yyvs5: SPECIAL [detachable JN_BOOLEAN]
			-- Stack for semantic values of type detachable JN_BOOLEAN

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [detachable JN_BOOLEAN]
			-- Routines that ought to be in SPECIAL [detachable JN_BOOLEAN]

	yyvs6: SPECIAL [detachable JN_NULL]
			-- Stack for semantic values of type detachable JN_NULL

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [detachable JN_NULL]
			-- Routines that ought to be in SPECIAL [detachable JN_NULL]

	yyvs7: SPECIAL [detachable JN_NUMBER]
			-- Stack for semantic values of type detachable JN_NUMBER

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [detachable JN_NUMBER]
			-- Routines that ought to be in SPECIAL [detachable JN_NUMBER]

	yyvs8: SPECIAL [detachable JN_STRING]
			-- Stack for semantic values of type detachable JN_STRING

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [detachable JN_STRING]
			-- Routines that ought to be in SPECIAL [detachable JN_STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER = 29
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 15
			-- Number of tokens

	yyLast: INTEGER = 29
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 263
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 23
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end
