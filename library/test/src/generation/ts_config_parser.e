note

	description:

		"Test config parsers"

	library: "Gobo Eiffel Test Library"
	copyright: "Copyright (c) 2000-2016, Eric Bezault and others"
	license: "MIT License"

class TS_CONFIG_PARSER

inherit

	TS_CONFIG_PARSER_SKELETON
		undefine
			make_config_scanner
		end

	TS_CONFIG_SCANNER
		rename
			make as make_config_scanner
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
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
			yyvs4.keep_head (0)
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
				yyspecial_routines2.force (yyvs2, last_et_identifier_value, yyvsp2)
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
			yyval4: DS_ARRAYED_LIST [TS_CLUSTER]
			yyval3: TS_CLUSTER
			yyval2: ET_IDENTIFIER
		do
				inspect yy_act
when 1 then
--|#line 47 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 47")
end

				check
						-- Defaults set (see call to `set_defaults' above).
					compile_not_void: attached compile as l_compile
					execute_not_void: attached execute as l_execute
				then
					last_config := new_config (yyvs2.item (yyvsp2).name, testgen, l_compile, l_execute, yyvs4.item (yyvsp4))
				end
			
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp2 := yyvsp2 -1
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 47 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 47")
end

set_defaults (yyvs2.item (yyvsp2).name) 
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
--|#line 61 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 61")
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
--|#line 62 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 62")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 63 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 63")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 66 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 66")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 67 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 67")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 70 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 70")
end

			class_regexp := new_regexp (yyvs2.item (yyvsp2))
			if class_regexp = Void then
				class_regexp := Default_class_regexp
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 77 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 77")
end

			feature_regexp := new_regexp (yyvs2.item (yyvsp2))
			if feature_regexp = Void then
				feature_regexp := Default_feature_regexp
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 84 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 84")
end

class_prefix := yyvs2.item (yyvsp2).name 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 86 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 86")
end

compile := yyvs2.item (yyvsp2).name 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 88 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 88")
end

execute := yyvs2.item (yyvsp2).name 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 90 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 90")
end

testgen := yyvs2.item (yyvsp2).name 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 94 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 94")
end

			create {DS_ARRAYED_LIST [TS_CLUSTER]} yyval4.make (1)
			yyval4.put_last (default_cluster)
		
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
when 15 then
--|#line 99 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 99")
end

			create {DS_ARRAYED_LIST [TS_CLUSTER]} yyval4.make (1)
			yyval4.put_last (default_cluster)
		
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
when 16 then
--|#line 104 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 104")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 17 then
--|#line 108 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 108")
end

			create {DS_ARRAYED_LIST [TS_CLUSTER]} yyval4.make (5)
			yyval4.put_last (yyvs3.item (yyvsp3))
		
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
when 18 then
--|#line 113 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 113")
end

yyval4 := yyvs4.item (yyvsp4); yyval4.force_last (yyvs3.item (yyvsp3)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 19 then
--|#line 117 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 117")
end

yyval3 := new_cluster (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 + 1
	yyvsp2 := yyvsp2 -2
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
when 20 then
--|#line 121 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 121")
end

yyval2 := yyvs2.item (yyvsp2) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines2.force (yyvs2, yyval2, yyvsp2)
end
when 21 then
--|#line 123 "ts_config_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'ts_config_parser.y' at line 123")
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
			when 44 then
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
			create an_array.make_filled (0, 0, 270)
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
			   16,   17,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   18,    2,
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
			   15, yyDummy>>,
			1, 71, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   23,   25,   24,   24,   24,   26,   26,   27,   27,
			   27,   27,   27,   27,   21,   21,   21,   20,   20,   19,
			   22,   22, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    2,    2,    2,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    4,    2,    2,    2,    2,    2,
			    2,    3,    4,    2,    1,    1,    1,    1,    1,    1,
			    1,    3,    1,    2,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    2,    2,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    0,    0,   21,   20,    3,    4,    2,    0,    0,    0,
			    0,    0,    0,    5,    6,   14,    0,    0,    0,    0,
			    0,    0,    7,   15,    0,    0,    0,    0,    0,    0,
			    0,   17,   16,    0,    1,   13,   10,    9,   12,   11,
			    8,   18,    0,   19,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   31,   32,   24,   33,   44,    6,   15,   13,   14, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   22,  -10, -32768, -32768,   26,   -2, -32768,   15,   14,   13,
			   12,   11,   10,   -2, -32768,   21,  -10,  -10,  -10,  -10,
			  -10,  -10, -32768,  -10,   17,    6,    5,    4,   -3,   -4,
			   -5, -32768,  -10,   -7, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,  -10, -32768,    9,    2, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			    3, -32768, -32768,   -1, -32768, -32768, -32768, -32768,   23, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			    4,   12,   46,   11,    3,    2,   10,    9,    8,   45,
			    7,   42,   40,   39,   38,   25,   26,   27,   28,   29,
			   30,   37,   36,   35,   34,   23,   21,   20,   19,   18,
			   17,   16,    5,    1,    0,   41,   22,    0,    0,    0,
			    0,   43, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    1,    3,    0,    5,   14,   15,    8,    9,   10,    0,
			   12,   18,   17,   17,   17,   16,   17,   18,   19,   20,
			   21,   17,   17,   17,    7,    4,   16,   16,   16,   16,
			   16,   16,    6,   11,   -1,   32,   13,   -1,   -1,   -1,
			   -1,   42, yyDummy>>)
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

	yyvs2: SPECIAL [ET_IDENTIFIER]
			-- Stack for semantic values of type ET_IDENTIFIER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [ET_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [ET_IDENTIFIER]

	yyvs3: SPECIAL [TS_CLUSTER]
			-- Stack for semantic values of type TS_CLUSTER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [TS_CLUSTER]
			-- Routines that ought to be in SPECIAL [TS_CLUSTER]

	yyvs4: SPECIAL [DS_ARRAYED_LIST [TS_CLUSTER]]
			-- Stack for semantic values of type DS_ARRAYED_LIST [TS_CLUSTER]

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [DS_ARRAYED_LIST [TS_CLUSTER]]
			-- Routines that ought to be in SPECIAL [DS_ARRAYED_LIST [TS_CLUSTER]]

feature {NONE} -- Constants

	yyFinal: INTEGER = 46
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 19
			-- Number of tokens

	yyLast: INTEGER = 41
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 270
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 28
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



end
