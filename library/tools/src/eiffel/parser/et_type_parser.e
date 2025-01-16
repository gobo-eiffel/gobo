note

	description:

		"Eiffel type parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class ET_TYPE_PARSER

inherit

	ET_TYPE_PARSER_SKELETON
		undefine
			read_token
		redefine
			system_processor
		end

	ET_TYPE_SCANNER
		rename
			make as make_type_scanner
		undefine
			reset, set_syntax_error
		redefine
			system_processor
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
			create yyspecial_routines11
			yyvsc11 := yyInitial_yyvs_size
			yyvs11 := yyspecial_routines11.make (yyvsc11)
			create yyspecial_routines12
			yyvsc12 := yyInitial_yyvs_size
			yyvs12 := yyspecial_routines12.make (yyvsc12)
			create yyspecial_routines13
			yyvsc13 := yyInitial_yyvs_size
			yyvs13 := yyspecial_routines13.make (yyvsc13)
			create yyspecial_routines14
			yyvsc14 := yyInitial_yyvs_size
			yyvs14 := yyspecial_routines14.make (yyvsc14)
			create yyspecial_routines15
			yyvsc15 := yyInitial_yyvs_size
			yyvs15 := yyspecial_routines15.make (yyvsc15)
			create yyspecial_routines16
			yyvsc16 := yyInitial_yyvs_size
			yyvs16 := yyspecial_routines16.make (yyvsc16)
			create yyspecial_routines17
			yyvsc17 := yyInitial_yyvs_size
			yyvs17 := yyspecial_routines17.make (yyvsc17)
			create yyspecial_routines18
			yyvsc18 := yyInitial_yyvs_size
			yyvs18 := yyspecial_routines18.make (yyvsc18)
			create yyspecial_routines19
			yyvsc19 := yyInitial_yyvs_size
			yyvs19 := yyspecial_routines19.make (yyvsc19)
			create yyspecial_routines20
			yyvsc20 := yyInitial_yyvs_size
			yyvs20 := yyspecial_routines20.make (yyvsc20)
			create yyspecial_routines21
			yyvsc21 := yyInitial_yyvs_size
			yyvs21 := yyspecial_routines21.make (yyvsc21)
			create yyspecial_routines22
			yyvsc22 := yyInitial_yyvs_size
			yyvs22 := yyspecial_routines22.make (yyvsc22)
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
			yyvsp11 := -1
			yyvsp12 := -1
			yyvsp13 := -1
			yyvsp14 := -1
			yyvsp15 := -1
			yyvsp16 := -1
			yyvsp17 := -1
			yyvsp18 := -1
			yyvsp19 := -1
			yyvsp20 := -1
			yyvsp21 := -1
			yyvsp22 := -1
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
			yyvs11.keep_head (0)
			yyvs12.keep_head (0)
			yyvs13.keep_head (0)
			yyvs14.keep_head (0)
			yyvs15.keep_head (0)
			yyvs16.keep_head (0)
			yyvs17.keep_head (0)
			yyvs18.keep_head (0)
			yyvs19.keep_head (0)
			yyvs20.keep_head (0)
			yyvs21.keep_head (0)
			yyvs22.keep_head (0)
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
				yyspecial_routines2.force (yyvs2, last_detachable_et_keyword_value, yyvsp2)
			when 3 then
				yyvsp3 := yyvsp3 + 1
				if yyvsp3 >= yyvsc3 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs3")
					end
					yyvsc3 := yyvsc3 + yyInitial_yyvs_size
					yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
				end
				yyspecial_routines3.force (yyvs3, last_detachable_et_agent_keyword_value, yyvsp3)
			when 4 then
				yyvsp4 := yyvsp4 + 1
				if yyvsp4 >= yyvsc4 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs4")
					end
					yyvsc4 := yyvsc4 + yyInitial_yyvs_size
					yyvs4 := yyspecial_routines4.aliased_resized_area (yyvs4, yyvsc4)
				end
				yyspecial_routines4.force (yyvs4, last_detachable_et_invariant_keyword_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_detachable_et_precursor_keyword_value, yyvsp5)
			when 6 then
				yyvsp6 := yyvsp6 + 1
				if yyvsp6 >= yyvsc6 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs6")
					end
					yyvsc6 := yyvsc6 + yyInitial_yyvs_size
					yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
				end
				yyspecial_routines6.force (yyvs6, last_detachable_et_boolean_constant_value, yyvsp6)
			when 7 then
				yyvsp7 := yyvsp7 + 1
				if yyvsp7 >= yyvsc7 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs7")
					end
					yyvsc7 := yyvsc7 + yyInitial_yyvs_size
					yyvs7 := yyspecial_routines7.aliased_resized_area (yyvs7, yyvsc7)
				end
				yyspecial_routines7.force (yyvs7, last_detachable_et_current_value, yyvsp7)
			when 8 then
				yyvsp8 := yyvsp8 + 1
				if yyvsp8 >= yyvsc8 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs8")
					end
					yyvsc8 := yyvsc8 + yyInitial_yyvs_size
					yyvs8 := yyspecial_routines8.aliased_resized_area (yyvs8, yyvsc8)
				end
				yyspecial_routines8.force (yyvs8, last_detachable_et_identifier_value, yyvsp8)
			when 9 then
				yyvsp9 := yyvsp9 + 1
				if yyvsp9 >= yyvsc9 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs9")
					end
					yyvsc9 := yyvsc9 + yyInitial_yyvs_size
					yyvs9 := yyspecial_routines9.aliased_resized_area (yyvs9, yyvsc9)
				end
				yyspecial_routines9.force (yyvs9, last_detachable_et_keyword_operator_value, yyvsp9)
			when 10 then
				yyvsp10 := yyvsp10 + 1
				if yyvsp10 >= yyvsc10 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs10")
					end
					yyvsc10 := yyvsc10 + yyInitial_yyvs_size
					yyvs10 := yyspecial_routines10.aliased_resized_area (yyvs10, yyvsc10)
				end
				yyspecial_routines10.force (yyvs10, last_detachable_et_result_value, yyvsp10)
			when 11 then
				yyvsp11 := yyvsp11 + 1
				if yyvsp11 >= yyvsc11 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs11")
					end
					yyvsc11 := yyvsc11 + yyInitial_yyvs_size
					yyvs11 := yyspecial_routines11.aliased_resized_area (yyvs11, yyvsc11)
				end
				yyspecial_routines11.force (yyvs11, last_detachable_et_retry_instruction_value, yyvsp11)
			when 12 then
				yyvsp12 := yyvsp12 + 1
				if yyvsp12 >= yyvsc12 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs12")
					end
					yyvsc12 := yyvsc12 + yyInitial_yyvs_size
					yyvs12 := yyspecial_routines12.aliased_resized_area (yyvs12, yyvsc12)
				end
				yyspecial_routines12.force (yyvs12, last_detachable_et_void_value, yyvsp12)
			when 13 then
				yyvsp13 := yyvsp13 + 1
				if yyvsp13 >= yyvsc13 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs13")
					end
					yyvsc13 := yyvsc13 + yyInitial_yyvs_size
					yyvs13 := yyspecial_routines13.aliased_resized_area (yyvs13, yyvsc13)
				end
				yyspecial_routines13.force (yyvs13, last_detachable_et_position_value, yyvsp13)
			when 14 then
				yyvsp14 := yyvsp14 + 1
				if yyvsp14 >= yyvsc14 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs14")
					end
					yyvsc14 := yyvsc14 + yyInitial_yyvs_size
					yyvs14 := yyspecial_routines14.aliased_resized_area (yyvs14, yyvsc14)
				end
				yyspecial_routines14.force (yyvs14, last_detachable_et_symbol_value, yyvsp14)
			when 15 then
				yyvsp15 := yyvsp15 + 1
				if yyvsp15 >= yyvsc15 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs15")
					end
					yyvsc15 := yyvsc15 + yyInitial_yyvs_size
					yyvs15 := yyspecial_routines15.aliased_resized_area (yyvs15, yyvsc15)
				end
				yyspecial_routines15.force (yyvs15, last_detachable_et_semicolon_symbol_value, yyvsp15)
			when 16 then
				yyvsp16 := yyvsp16 + 1
				if yyvsp16 >= yyvsc16 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs16")
					end
					yyvsc16 := yyvsc16 + yyInitial_yyvs_size
					yyvs16 := yyspecial_routines16.aliased_resized_area (yyvs16, yyvsc16)
				end
				yyspecial_routines16.force (yyvs16, last_detachable_et_bracket_symbol_value, yyvsp16)
			when 17 then
				yyvsp17 := yyvsp17 + 1
				if yyvsp17 >= yyvsc17 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs17")
					end
					yyvsc17 := yyvsc17 + yyInitial_yyvs_size
					yyvs17 := yyspecial_routines17.aliased_resized_area (yyvs17, yyvsc17)
				end
				yyspecial_routines17.force (yyvs17, last_detachable_et_question_mark_symbol_value, yyvsp17)
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
			when 11 then
				yyvsp11 := yyvsp11 - 1
			when 12 then
				yyvsp12 := yyvsp12 - 1
			when 13 then
				yyvsp13 := yyvsp13 - 1
			when 14 then
				yyvsp14 := yyvsp14 - 1
			when 15 then
				yyvsp15 := yyvsp15 - 1
			when 16 then
				yyvsp16 := yyvsp16 - 1
			when 17 then
				yyvsp17 := yyvsp17 - 1
			when 18 then
				yyvsp18 := yyvsp18 - 1
			when 19 then
				yyvsp19 := yyvsp19 - 1
			when 20 then
				yyvsp20 := yyvsp20 - 1
			when 21 then
				yyvsp21 := yyvsp21 - 1
			when 22 then
				yyvsp22 := yyvsp22 - 1
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
					--|#line 87 "et_type_parser.y"
				yy_do_action_1
			when 2 then
					--|#line 91 "et_type_parser.y"
				yy_do_action_2
			when 3 then
					--|#line 93 "et_type_parser.y"
				yy_do_action_3
			when 4 then
					--|#line 97 "et_type_parser.y"
				yy_do_action_4
			when 5 then
					--|#line 99 "et_type_parser.y"
				yy_do_action_5
			when 6 then
					--|#line 101 "et_type_parser.y"
				yy_do_action_6
			when 7 then
					--|#line 103 "et_type_parser.y"
				yy_do_action_7
			when 8 then
					--|#line 105 "et_type_parser.y"
				yy_do_action_8
			when 9 then
					--|#line 107 "et_type_parser.y"
				yy_do_action_9
			when 10 then
					--|#line 109 "et_type_parser.y"
				yy_do_action_10
			when 11 then
					--|#line 111 "et_type_parser.y"
				yy_do_action_11
			when 12 then
					--|#line 113 "et_type_parser.y"
				yy_do_action_12
			when 13 then
					--|#line 115 "et_type_parser.y"
				yy_do_action_13
			when 14 then
					--|#line 117 "et_type_parser.y"
				yy_do_action_14
			when 15 then
					--|#line 119 "et_type_parser.y"
				yy_do_action_15
			when 16 then
					--|#line 121 "et_type_parser.y"
				yy_do_action_16
			when 17 then
					--|#line 123 "et_type_parser.y"
				yy_do_action_17
			when 18 then
					--|#line 125 "et_type_parser.y"
				yy_do_action_18
			when 19 then
					--|#line 127 "et_type_parser.y"
				yy_do_action_19
			when 20 then
					--|#line 129 "et_type_parser.y"
				yy_do_action_20
			when 21 then
					--|#line 131 "et_type_parser.y"
				yy_do_action_21
			when 22 then
					--|#line 133 "et_type_parser.y"
				yy_do_action_22
			when 23 then
					--|#line 135 "et_type_parser.y"
				yy_do_action_23
			when 24 then
					--|#line 137 "et_type_parser.y"
				yy_do_action_24
			when 25 then
					--|#line 139 "et_type_parser.y"
				yy_do_action_25
			when 26 then
					--|#line 143 "et_type_parser.y"
				yy_do_action_26
			when 27 then
					--|#line 145 "et_type_parser.y"
				yy_do_action_27
			when 28 then
					--|#line 147 "et_type_parser.y"
				yy_do_action_28
			when 29 then
					--|#line 149 "et_type_parser.y"
				yy_do_action_29
			when 30 then
					--|#line 151 "et_type_parser.y"
				yy_do_action_30
			when 31 then
					--|#line 153 "et_type_parser.y"
				yy_do_action_31
			when 32 then
					--|#line 155 "et_type_parser.y"
				yy_do_action_32
			when 33 then
					--|#line 157 "et_type_parser.y"
				yy_do_action_33
			when 34 then
					--|#line 159 "et_type_parser.y"
				yy_do_action_34
			when 35 then
					--|#line 161 "et_type_parser.y"
				yy_do_action_35
			when 36 then
					--|#line 163 "et_type_parser.y"
				yy_do_action_36
			when 37 then
					--|#line 165 "et_type_parser.y"
				yy_do_action_37
			when 38 then
					--|#line 167 "et_type_parser.y"
				yy_do_action_38
			when 39 then
					--|#line 169 "et_type_parser.y"
				yy_do_action_39
			when 40 then
					--|#line 171 "et_type_parser.y"
				yy_do_action_40
			when 41 then
					--|#line 173 "et_type_parser.y"
				yy_do_action_41
			when 42 then
					--|#line 175 "et_type_parser.y"
				yy_do_action_42
			when 43 then
					--|#line 177 "et_type_parser.y"
				yy_do_action_43
			when 44 then
					--|#line 179 "et_type_parser.y"
				yy_do_action_44
			when 45 then
					--|#line 181 "et_type_parser.y"
				yy_do_action_45
			when 46 then
					--|#line 183 "et_type_parser.y"
				yy_do_action_46
			when 47 then
					--|#line 185 "et_type_parser.y"
				yy_do_action_47
			when 48 then
					--|#line 189 "et_type_parser.y"
				yy_do_action_48
			when 49 then
					--|#line 191 "et_type_parser.y"
				yy_do_action_49
			when 50 then
					--|#line 195 "et_type_parser.y"
				yy_do_action_50
			when 51 then
					--|#line 198 "et_type_parser.y"
				yy_do_action_51
			when 52 then
					--|#line 206 "et_type_parser.y"
				yy_do_action_52
			when 53 then
					--|#line 213 "et_type_parser.y"
				yy_do_action_53
			when 54 then
					--|#line 224 "et_type_parser.y"
				yy_do_action_54
			when 55 then
					--|#line 229 "et_type_parser.y"
				yy_do_action_55
			when 56 then
					--|#line 234 "et_type_parser.y"
				yy_do_action_56
			when 57 then
					--|#line 239 "et_type_parser.y"
				yy_do_action_57
			when 58 then
					--|#line 246 "et_type_parser.y"
				yy_do_action_58
			when 59 then
					--|#line 255 "et_type_parser.y"
				yy_do_action_59
			when 60 then
					--|#line 257 "et_type_parser.y"
				yy_do_action_60
			when 61 then
					--|#line 261 "et_type_parser.y"
				yy_do_action_61
			when 62 then
					--|#line 264 "et_type_parser.y"
				yy_do_action_62
			when 63 then
					--|#line 274 "et_type_parser.y"
				yy_do_action_63
			when 64 then
					--|#line 280 "et_type_parser.y"
				yy_do_action_64
			when 65 then
					--|#line 286 "et_type_parser.y"
				yy_do_action_65
			when 66 then
					--|#line 297 "et_type_parser.y"
				yy_do_action_66
			when 67 then
					--|#line 302 "et_type_parser.y"
				yy_do_action_67
			when 68 then
					--|#line 307 "et_type_parser.y"
				yy_do_action_68
			when 69 then
					--|#line 312 "et_type_parser.y"
				yy_do_action_69
			when 70 then
					--|#line 317 "et_type_parser.y"
				yy_do_action_70
			when 71 then
					--|#line 328 "et_type_parser.y"
				yy_do_action_71
			when 72 then
					--|#line 339 "et_type_parser.y"
				yy_do_action_72
			when 73 then
					--|#line 352 "et_type_parser.y"
				yy_do_action_73
			when 74 then
					--|#line 361 "et_type_parser.y"
				yy_do_action_74
			when 75 then
					--|#line 370 "et_type_parser.y"
				yy_do_action_75
			when 76 then
					--|#line 372 "et_type_parser.y"
				yy_do_action_76
			when 77 then
					--|#line 374 "et_type_parser.y"
				yy_do_action_77
			when 78 then
					--|#line 378 "et_type_parser.y"
				yy_do_action_78
			when 79 then
					--|#line 380 "et_type_parser.y"
				yy_do_action_79
			when 80 then
					--|#line 382 "et_type_parser.y"
				yy_do_action_80
			when 81 then
					--|#line 384 "et_type_parser.y"
				yy_do_action_81
			when 82 then
					--|#line 386 "et_type_parser.y"
				yy_do_action_82
			when 83 then
					--|#line 388 "et_type_parser.y"
				yy_do_action_83
			when 84 then
					--|#line 390 "et_type_parser.y"
				yy_do_action_84
			when 85 then
					--|#line 392 "et_type_parser.y"
				yy_do_action_85
			when 86 then
					--|#line 394 "et_type_parser.y"
				yy_do_action_86
			when 87 then
					--|#line 396 "et_type_parser.y"
				yy_do_action_87
			when 88 then
					--|#line 398 "et_type_parser.y"
				yy_do_action_88
			when 89 then
					--|#line 400 "et_type_parser.y"
				yy_do_action_89
			when 90 then
					--|#line 402 "et_type_parser.y"
				yy_do_action_90
			when 91 then
					--|#line 404 "et_type_parser.y"
				yy_do_action_91
			when 92 then
					--|#line 406 "et_type_parser.y"
				yy_do_action_92
			when 93 then
					--|#line 408 "et_type_parser.y"
				yy_do_action_93
			when 94 then
					--|#line 410 "et_type_parser.y"
				yy_do_action_94
			when 95 then
					--|#line 412 "et_type_parser.y"
				yy_do_action_95
			when 96 then
					--|#line 414 "et_type_parser.y"
				yy_do_action_96
			when 97 then
					--|#line 416 "et_type_parser.y"
				yy_do_action_97
			when 98 then
					--|#line 418 "et_type_parser.y"
				yy_do_action_98
			when 99 then
					--|#line 422 "et_type_parser.y"
				yy_do_action_99
			when 100 then
					--|#line 424 "et_type_parser.y"
				yy_do_action_100
			when 101 then
					--|#line 428 "et_type_parser.y"
				yy_do_action_101
			when 102 then
					--|#line 430 "et_type_parser.y"
				yy_do_action_102
			when 103 then
					--|#line 432 "et_type_parser.y"
				yy_do_action_103
			when 104 then
					--|#line 434 "et_type_parser.y"
				yy_do_action_104
			when 105 then
					--|#line 436 "et_type_parser.y"
				yy_do_action_105
			when 106 then
					--|#line 438 "et_type_parser.y"
				yy_do_action_106
			when 107 then
					--|#line 440 "et_type_parser.y"
				yy_do_action_107
			when 108 then
					--|#line 448 "et_type_parser.y"
				yy_do_action_108
			when 109 then
					--|#line 456 "et_type_parser.y"
				yy_do_action_109
			when 110 then
					--|#line 464 "et_type_parser.y"
				yy_do_action_110
			when 111 then
					--|#line 472 "et_type_parser.y"
				yy_do_action_111
			when 112 then
					--|#line 474 "et_type_parser.y"
				yy_do_action_112
			when 113 then
					--|#line 476 "et_type_parser.y"
				yy_do_action_113
			when 114 then
					--|#line 478 "et_type_parser.y"
				yy_do_action_114
			when 115 then
					--|#line 480 "et_type_parser.y"
				yy_do_action_115
			when 116 then
					--|#line 482 "et_type_parser.y"
				yy_do_action_116
			when 117 then
					--|#line 484 "et_type_parser.y"
				yy_do_action_117
			when 118 then
					--|#line 486 "et_type_parser.y"
				yy_do_action_118
			when 119 then
					--|#line 488 "et_type_parser.y"
				yy_do_action_119
			when 120 then
					--|#line 494 "et_type_parser.y"
				yy_do_action_120
			when 121 then
					--|#line 496 "et_type_parser.y"
				yy_do_action_121
			when 122 then
					--|#line 500 "et_type_parser.y"
				yy_do_action_122
			when 123 then
					--|#line 502 "et_type_parser.y"
				yy_do_action_123
			when 124 then
					--|#line 504 "et_type_parser.y"
				yy_do_action_124
			when 125 then
					--|#line 508 "et_type_parser.y"
				yy_do_action_125
			when 126 then
					--|#line 510 "et_type_parser.y"
				yy_do_action_126
			when 127 then
					--|#line 523 "et_type_parser.y"
				yy_do_action_127
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
			--|#line 87 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 87 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 87")
end

last_type := yyvs22.item (yyvsp22) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_2
			--|#line 91 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 91 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 91")
end

yyval22 := new_named_type (Void, yyvs8.item (yyvsp8), Void) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp8 := yyvsp8 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_3
			--|#line 93 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 93 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 93")
end

yyval22 := yyvs22.item (yyvsp22) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_4
			--|#line 97 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 97 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 97")
end

yyval22 := new_named_type (Void, yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_5
			--|#line 99 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 99 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 99")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_6
			--|#line 101 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 101 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 101")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_7
			--|#line 103 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 103 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 103")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_8
			--|#line 105 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 105 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 105")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_9
			--|#line 107 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 107 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 107")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_10
			--|#line 109 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 109 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 109")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_11
			--|#line 111 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 111 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 111")
end

yyval22 := new_named_type (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_12
			--|#line 113 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 113 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 113")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_13
			--|#line 115 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 115 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 115")
end

yyval22 := new_named_type (yyvs17.item (yyvsp17), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_14
			--|#line 117 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 117 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 117")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_15
			--|#line 119 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 119 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 119")
end

yyval22 := yyvs20.item (yyvsp20) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_16
			--|#line 121 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 121 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 121")
end

yyval22 := new_tuple_type (Void, yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_17
			--|#line 123 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 123 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 123")
end

yyval22 := new_tuple_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_18
			--|#line 125 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 125 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 125")
end

yyval22 := new_tuple_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_19
			--|#line 127 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 127 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 127")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_20
			--|#line 129 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 129 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 129")
end

yyval22 := new_tuple_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_21
			--|#line 131 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 131 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 131")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_22
			--|#line 133 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 133 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 133")
end

yyval22 := new_tuple_type (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_23
			--|#line 135 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 135 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 135")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_24
			--|#line 137 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 137 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 137")
end

yyval22 := new_tuple_type (yyvs17.item (yyvsp17), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_25
			--|#line 139 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 139 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 139")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_26
			--|#line 143 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 143 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 143")
end

yyval22 := new_named_type (Void, yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_27
			--|#line 145 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 145 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 145")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_28
			--|#line 147 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 147 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 147")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_29
			--|#line 149 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 149 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 149")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_30
			--|#line 151 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 151 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 151")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_31
			--|#line 153 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 153 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 153")
end

yyval22 := new_named_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_32
			--|#line 155 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 155 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 155")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_33
			--|#line 157 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 157 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 157")
end

yyval22 := new_named_type (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_34
			--|#line 159 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 159 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 159")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_35
			--|#line 161 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 161 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 161")
end

yyval22 := new_named_type (yyvs17.item (yyvsp17), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_36
			--|#line 163 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 163 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 163")
end

yyval22 := new_named_type (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_37
			--|#line 165 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 165 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 165")
end

yyval22 := yyvs20.item (yyvsp20) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp22 := yyvsp22 + 1
	yyvsp20 := yyvsp20 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_38
			--|#line 167 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 167 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 167")
end

yyval22 := new_tuple_type (Void, yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp22 := yyvsp22 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_39
			--|#line 169 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 169 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 169")
end

yyval22 := new_tuple_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_40
			--|#line 171 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 171 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 171")
end

yyval22 := new_tuple_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_41
			--|#line 173 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 173 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 173")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_42
			--|#line 175 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 175 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 175")
end

yyval22 := new_tuple_type (yyvs2.item (yyvsp2), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_43
			--|#line 177 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 177 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 177")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_44
			--|#line 179 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 179 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 179")
end

yyval22 := new_tuple_type (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_45
			--|#line 181 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 181 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 181")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_46
			--|#line 183 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 183 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 183")
end

yyval22 := new_tuple_type (yyvs17.item (yyvsp17), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_47
			--|#line 185 "et_type_parser.y"
		local
			yyval22: detachable ET_TYPE
		do
--|#line 185 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 185")
end

yyval22 := new_tuple_type (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2)), yyvs8.item (yyvsp8), yyvs19.item (yyvsp19)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp22 := yyvsp22 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	yyvsp19 := yyvsp19 -1
	if yyvsp22 >= yyvsc22 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs22")
		end
		yyvsc22 := yyvsc22 + yyInitial_yyvs_size
		yyvs22 := yyspecial_routines22.aliased_resized_area (yyvs22, yyvsc22)
	end
	yyspecial_routines22.force (yyvs22, yyval22, yyvsp22)
end
		end

	yy_do_action_48
			--|#line 189 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 189 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 189")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp19 := yyvsp19 + 1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_49
			--|#line 191 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 191 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 191")
end

yyval19 := yyvs19.item (yyvsp19) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_50
			--|#line 195 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 195 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 195")
end

yyval19 := ast_factory.new_actual_parameters (yyvs16.item (yyvsp16), yyvs14.item (yyvsp14), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp16 := yyvsp16 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_51
			--|#line 198 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 198 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 198")
end

			yyval19 := yyvs19.item (yyvsp19)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_52
			--|#line 206 "et_type_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 206 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 206")
end

			add_symbol (yyvs16.item (yyvsp16))
			add_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp16 := yyvsp16 -1
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

	yy_do_action_53
			--|#line 213 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 213 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 213")
end

			if attached yyvs22.item (yyvsp22) as l_type then
				yyval19 := ast_factory.new_actual_parameters (last_symbol, yyvs14.item (yyvsp14), counter_value + 1)
				if yyval19 /= Void then
					yyval19.put_first (l_type)
				end
			else
				yyval19 := ast_factory.new_actual_parameters (last_symbol, yyvs14.item (yyvsp14), counter_value)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_54
			--|#line 224 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 224 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 224")
end

			yyval19 := yyvs19.item (yyvsp19)
			add_to_actual_parameter_list (yyvs18.item (yyvsp18), yyval19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_55
			--|#line 229 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 229 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 229")
end

			yyval19 := yyvs19.item (yyvsp19)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, yyvs8.item (yyvsp8), Void), yyvs14.item (yyvsp14)), yyval19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_56
			--|#line 234 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 234 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 234")
end

			yyval19 := yyvs19.item (yyvsp19)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_named_type (Void, yyvs8.item (yyvsp8), Void), yyvs14.item (yyvsp14)), yyval19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_57
			--|#line 239 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 239 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 239")
end

			yyval19 := yyvs19.item (yyvsp19)
			add_to_actual_parameter_list (ast_factory.new_actual_parameter_comma (new_tuple_type (Void, yyvs8.item (yyvsp8), Void), yyvs14.item (yyvsp14)), yyval19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_58
			--|#line 246 "et_type_parser.y"
		local
			yyval18: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 246 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 246")
end

			yyval18 := ast_factory.new_actual_parameter_comma (yyvs22.item (yyvsp22), yyvs14.item (yyvsp14))
			if yyval18 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 + 1
	yyvsp22 := yyvsp22 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
		end

	yy_do_action_59
			--|#line 255 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 255 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 255")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp19 := yyvsp19 + 1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_60
			--|#line 257 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 257 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 257")
end

yyval19 := yyvs19.item (yyvsp19) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_61
			--|#line 261 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 261 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 261")
end

yyval19 := ast_factory.new_actual_parameters (yyvs16.item (yyvsp16), yyvs14.item (yyvsp14), 0) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp19 := yyvsp19 + 1
	yyvsp16 := yyvsp16 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_62
			--|#line 264 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 264 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 264")
end

			yyval19 := ast_factory.new_actual_parameters (last_symbol, yyvs14.item (yyvsp14), 0)
			if yyval19 /= Void and attached ast_factory.new_first_semicolon (yyvs15.item (yyvsp15)) as l_semicolon then
				yyval19.set_first_symbol (l_semicolon)
			end
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp19 := yyvsp19 + 1
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyvsp14 := yyvsp14 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_63
			--|#line 274 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 274 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 274")
end

			yyval19 := yyvs19.item (yyvsp19)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_64
			--|#line 280 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 280 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 280")
end

			yyval19 := yyvs19.item (yyvsp19)
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_65
			--|#line 286 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 286 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 286")
end

			yyval19 := yyvs19.item (yyvsp19)
			if yyval19 /= Void and attached ast_factory.new_first_semicolon (yyvs15.item (yyvsp15)) as l_semicolon then
				yyval19.set_first_symbol (l_semicolon)
			end
			remove_symbol
			remove_counter
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp15 := yyvsp15 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_66
			--|#line 297 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 297 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 297")
end

			yyval19 := ast_factory.new_actual_parameters (last_symbol, yyvs14.item (yyvsp14), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter (yyvs8.item (yyvsp8), ast_factory.new_colon_type (yyvs14.item (yyvsp14 - 1), yyvs22.item (yyvsp22))), yyval19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp19 := yyvsp19 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -2
	yyvsp22 := yyvsp22 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_67
			--|#line 302 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 302 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 302")
end

			yyval19 := ast_factory.new_actual_parameters (last_symbol, yyvs14.item (yyvsp14), counter_value + 1)
			add_to_actual_parameter_list (ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs8.item (yyvsp8), ast_factory.new_colon_type (yyvs14.item (yyvsp14 - 1), yyvs22.item (yyvsp22))), yyvs15.item (yyvsp15)), yyval19)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp19 := yyvsp19 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -2
	yyvsp22 := yyvsp22 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp19 >= yyvsc19 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs19")
		end
		yyvsc19 := yyvsc19 + yyInitial_yyvs_size
		yyvs19 := yyspecial_routines19.aliased_resized_area (yyvs19, yyvsc19)
	end
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_68
			--|#line 307 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 307 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 307")
end

			yyval19 := yyvs19.item (yyvsp19)
			add_to_actual_parameter_list (yyvs18.item (yyvsp18), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_69
			--|#line 312 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 312 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 312")
end

			yyval19 := yyvs19.item (yyvsp19)
			add_to_actual_parameter_list (yyvs18.item (yyvsp18), yyvs19.item (yyvsp19))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp18 := yyvsp18 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_70
			--|#line 317 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 317 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 317")
end

			yyval19 := yyvs19.item (yyvsp19)
			if yyval19 /= Void then
				if not yyval19.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs8.item (yyvsp8), yyvs14.item (yyvsp14)), yyval19.first.type), yyval19)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs8.item (yyvsp8), yyvs14.item (yyvsp14)), Void), yyval19)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_71
			--|#line 328 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 328 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 328")
end

			yyval19 := yyvs19.item (yyvsp19)
			if yyval19 /= Void then
				if not yyval19.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs8.item (yyvsp8), yyvs14.item (yyvsp14)), yyval19.first.type), yyval19)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs8.item (yyvsp8), yyvs14.item (yyvsp14)), Void), yyval19)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_72
			--|#line 339 "et_type_parser.y"
		local
			yyval19: detachable ET_ACTUAL_PARAMETER_LIST
		do
--|#line 339 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 339")
end

			yyval19 := yyvs19.item (yyvsp19)
			if yyval19 /= Void then
				if not yyval19.is_empty then
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs8.item (yyvsp8), yyvs14.item (yyvsp14)), yyval19.first.type), yyval19)
				else
					add_to_actual_parameter_list (ast_factory.new_labeled_comma_actual_parameter (ast_factory.new_label_comma (yyvs8.item (yyvsp8), yyvs14.item (yyvsp14)), Void), yyval19)
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines19.force (yyvs19, yyval19, yyvsp19)
end
		end

	yy_do_action_73
			--|#line 352 "et_type_parser.y"
		local
			yyval18: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 352 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 352")
end

			yyval18 := ast_factory.new_labeled_actual_parameter (yyvs8.item (yyvsp8), ast_factory.new_colon_type (yyvs14.item (yyvsp14), yyvs22.item (yyvsp22)))
			if yyval18 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp18 := yyvsp18 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp22 := yyvsp22 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
		end

	yy_do_action_74
			--|#line 361 "et_type_parser.y"
		local
			yyval18: detachable ET_ACTUAL_PARAMETER_ITEM
		do
--|#line 361 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 361")
end

			yyval18 := ast_factory.new_labeled_actual_parameter_semicolon (ast_factory.new_labeled_actual_parameter (yyvs8.item (yyvsp8), ast_factory.new_colon_type (yyvs14.item (yyvsp14), yyvs22.item (yyvsp22))), yyvs15.item (yyvsp15))
			if yyval18 /= Void then
				increment_counter
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp18 := yyvsp18 + 1
	yyvsp8 := yyvsp8 -1
	yyvsp14 := yyvsp14 -1
	yyvsp22 := yyvsp22 -1
	yyvsp15 := yyvsp15 -1
	if yyvsp18 >= yyvsc18 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs18")
		end
		yyvsc18 := yyvsc18 + yyInitial_yyvs_size
		yyvs18 := yyspecial_routines18.aliased_resized_area (yyvs18, yyvsc18)
	end
	yyspecial_routines18.force (yyvs18, yyval18, yyvsp18)
end
		end

	yy_do_action_75
			--|#line 370 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 370 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 370")
end

yyval20 := new_like_feature (Void, yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_76
			--|#line 372 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 372 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 372")
end

yyval20 := ast_factory.new_like_current (tokens.implicit_attached_type_mark, yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_77
			--|#line 374 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 374 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 374")
end

yyval20 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_78
			--|#line 378 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 378 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 378")
end

yyval20 := new_like_feature (Void, yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_79
			--|#line 380 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 380 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 380")
end

yyval20 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_80
			--|#line 382 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 382 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 382")
end

yyval20 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_81
			--|#line 384 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 384 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 384")
end

yyval20 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_82
			--|#line 386 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 386 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 386")
end

yyval20 := new_like_feature (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_83
			--|#line 388 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 388 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 388")
end

yyval20 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_84
			--|#line 390 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 390 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 390")
end

yyval20 := new_like_feature (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_85
			--|#line 392 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 392 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 392")
end

yyval20 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_86
			--|#line 394 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 394 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 394")
end

yyval20 := new_like_feature (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_87
			--|#line 396 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 396 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 396")
end

yyval20 := new_like_feature (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs8.item (yyvsp8)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -2
	yyvsp8 := yyvsp8 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_88
			--|#line 398 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 398 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 398")
end

yyval20 := ast_factory.new_like_current (tokens.implicit_attached_type_mark, yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_89
			--|#line 400 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 400 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 400")
end

yyval20 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (tokens.implicit_attached_type_mark, yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_90
			--|#line 402 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 402 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 402")
end

yyval20 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_91
			--|#line 404 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 404 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 404")
end

yyval20 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_92
			--|#line 406 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 406 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 406")
end

yyval20 := ast_factory.new_like_current (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_93
			--|#line 408 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 408 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 408")
end

yyval20 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_94
			--|#line 410 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 410 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 410")
end

yyval20 := ast_factory.new_like_current (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_95
			--|#line 412 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 412 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 412")
end

yyval20 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp14 := yyvsp14 -1
	yyvsp2 := yyvsp2 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_96
			--|#line 414 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 414 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 414")
end

yyval20 := ast_factory.new_like_current (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp20 := yyvsp20 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_97
			--|#line 416 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 416 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 416")
end

yyval20 := ast_factory.new_like_current (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs7.item (yyvsp7)) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp20 := yyvsp20 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -2
	yyvsp7 := yyvsp7 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_98
			--|#line 418 "et_type_parser.y"
		local
			yyval20: detachable ET_LIKE_TYPE
		do
--|#line 418 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 418")
end

yyval20 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp20 := yyvsp20 + 1
	yyvsp21 := yyvsp21 -1
	if yyvsp20 >= yyvsc20 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs20")
		end
		yyvsc20 := yyvsc20 + yyInitial_yyvs_size
		yyvs20 := yyspecial_routines20.aliased_resized_area (yyvs20, yyvsc20)
	end
	yyspecial_routines20.force (yyvs20, yyval20, yyvsp20)
end
		end

	yy_do_action_99
			--|#line 422 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 422 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 422")
end

yyval21 := ast_factory.new_qualified_like_braced_type (Void, yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_100
			--|#line 424 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 424 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 424")
end

yyval21 := ast_factory.new_qualified_like_type (Void, yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp21 := yyvsp21 + 1
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_101
			--|#line 428 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 428 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 428")
end

yyval21 := yyvs21.item (yyvsp21) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_102
			--|#line 430 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 430 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 430")
end

yyval21 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_103
			--|#line 432 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 432 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 432")
end

yyval21 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_104
			--|#line 434 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 434 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 434")
end

yyval21 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_105
			--|#line 436 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 436 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 436")
end

yyval21 := ast_factory.new_qualified_like_braced_type (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_106
			--|#line 438 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 438 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 438")
end

yyval21 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 2), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -3
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_107
			--|#line 440 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 440 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 440")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval21 := ast_factory.new_qualified_like_braced_type (yyvs14.item (yyvsp14 - 3), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp21 := yyvsp21 + 1
	yyvsp14 := yyvsp14 -4
	yyvsp2 := yyvsp2 -1
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_108
			--|#line 448 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 448 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 448")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval21 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14 - 3), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp21 := yyvsp21 + 1
	yyvsp14 := yyvsp14 -4
	yyvsp2 := yyvsp2 -2
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_109
			--|#line 456 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 456 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 456")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval21 := ast_factory.new_qualified_like_braced_type (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp21 := yyvsp21 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_110
			--|#line 464 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 464 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 464")
end

			if system_processor.older_ise_version (ise_6_1_0) then
				raise_error
			else
				yyval21 := ast_factory.new_qualified_like_braced_type (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2 - 1)), yyvs2.item (yyvsp2), yyvs14.item (yyvsp14 - 2), yyvs22.item (yyvsp22), yyvs14.item (yyvsp14 - 1), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp21 := yyvsp21 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -2
	yyvsp14 := yyvsp14 -3
	yyvsp22 := yyvsp22 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_111
			--|#line 472 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 472 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 472")
end

yyval21 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_112
			--|#line 474 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 474 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 474")
end

yyval21 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_113
			--|#line 476 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 476 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 476")
end

yyval21 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_114
			--|#line 478 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 478 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 478")
end

yyval21 := ast_factory.new_qualified_like_type (yyvs2.item (yyvsp2), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -1
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_115
			--|#line 480 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 480 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 480")
end

yyval21 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs2.item (yyvsp2 - 1), yyvs2.item (yyvsp2)), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp2 := yyvsp2 -2
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_116
			--|#line 482 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 482 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 482")
end

yyval21 := ast_factory.new_qualified_like_type (yyvs14.item (yyvsp14 - 1), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp21 := yyvsp21 + 1
	yyvsp14 := yyvsp14 -2
	yyvsp20 := yyvsp20 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_117
			--|#line 484 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 484 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 484")
end

yyval21 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs14.item (yyvsp14 - 1), yyvs2.item (yyvsp2)), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp14 := yyvsp14 -2
	yyvsp2 := yyvsp2 -1
	yyvsp20 := yyvsp20 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_118
			--|#line 486 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 486 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 486")
end

yyval21 := ast_factory.new_qualified_like_type (yyvs17.item (yyvsp17), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp21 := yyvsp21 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_119
			--|#line 488 "et_type_parser.y"
		local
			yyval21: detachable ET_QUALIFIED_LIKE_IDENTIFIER
		do
--|#line 488 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 488")
end

yyval21 := ast_factory.new_qualified_like_type (ast_factory.new_attachment_mark_separate_keyword (yyvs17.item (yyvsp17), yyvs2.item (yyvsp2)), yyvs20.item (yyvsp20), new_dot_feature_name (yyvs14.item (yyvsp14), yyvs8.item (yyvsp8)), tokens.unknown_class)
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp21 := yyvsp21 + 1
	yyvsp17 := yyvsp17 -1
	yyvsp2 := yyvsp2 -1
	yyvsp20 := yyvsp20 -1
	yyvsp14 := yyvsp14 -1
	yyvsp8 := yyvsp8 -1
	if yyvsp21 >= yyvsc21 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs21")
		end
		yyvsc21 := yyvsc21 + yyInitial_yyvs_size
		yyvs21 := yyspecial_routines21.aliased_resized_area (yyvs21, yyvsc21)
	end
	yyspecial_routines21.force (yyvs21, yyval21, yyvsp21)
end
		end

	yy_do_action_120
			--|#line 494 "et_type_parser.y"
		local
			yyval8: detachable ET_IDENTIFIER
		do
--|#line 494 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 494")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
		end

	yy_do_action_121
			--|#line 496 "et_type_parser.y"
		local
			yyval8: detachable ET_IDENTIFIER
		do
--|#line 496 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 496")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
		end

	yy_do_action_122
			--|#line 500 "et_type_parser.y"
		local
			yyval8: detachable ET_IDENTIFIER
		do
--|#line 500 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 500")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
		end

	yy_do_action_123
			--|#line 502 "et_type_parser.y"
		local
			yyval8: detachable ET_IDENTIFIER
		do
--|#line 502 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 502")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
		end

	yy_do_action_124
			--|#line 504 "et_type_parser.y"
		local
			yyval8: detachable ET_IDENTIFIER
		do
--|#line 504 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 504")
end

yyval8 := yyvs8.item (yyvsp8) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines8.force (yyvs8, yyval8, yyvsp8)
end
		end

	yy_do_action_125
			--|#line 508 "et_type_parser.y"
		local
			yyval15: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 508 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 508")
end

yyval15 := yyvs15.item (yyvsp15) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_126
			--|#line 510 "et_type_parser.y"
		local
			yyval15: detachable ET_SEMICOLON_SYMBOL
		do
--|#line 510 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 510")
end

			if attached yyvs15.item (yyvsp15 - 1) as l_semicolon then
				if l_semicolon /= tokens.semicolon_symbol then
					l_semicolon.set_other (yyvs15.item (yyvsp15))
				end
				yyval15 := l_semicolon
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp15 := yyvsp15 -1
	yyspecial_routines15.force (yyvs15, yyval15, yyvsp15)
end
		end

	yy_do_action_127
			--|#line 523 "et_type_parser.y"
		local
			yyval1: detachable ANY
		do
--|#line 523 "et_type_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'et_type_parser.y' at line 523")
end

			increment_counter
		
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
		end

	yy_do_error_action (yy_act: INTEGER)
			-- Execute error action.
		do
			if yy_act <= 199 then
				yy_do_error_action_0_199 (yy_act)
			elseif yy_act <= 399 then
				yy_do_error_action_200_399 (yy_act)
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_0_199 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			else
					-- Default action.
				report_error ("parse error")
			end
		end

	yy_do_error_action_200_399 (yy_act: INTEGER)
			-- Execute error action.
		do
			inspect yy_act
			when 291 then
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
			create an_array.make_filled (0, 0, 329)
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
			    2,    2,    2,   83,    2,    2,    2,    2,    2,    2,
			   77,   78,    2,    2,   80,    2,   82,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,   79,   84,
			    2,    2,    2,   86,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,   85,    2,   81,    2,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   75,    2,   76,    2,    2,    2,    2,
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

			   45,   46,   47,   48,   49,   50,   51,   52,   53,   54,
			   55,   56,   57,   58,   59,   60,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74, yyDummy>>,
			1, 130, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  103,  104,  104,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,   90,   90,
			   92,   92,  107,   91,   91,   91,   91,   91,   87,   93,
			   93,   94,   94,   94,   94,   94,   95,   95,   95,   95,
			   95,   95,   95,   88,   89,   99,   99,   99,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,   98,   98,   98,   98,  101,

			  101,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			   97,   97,   96,   96,   96,  102,  102,  108, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 293)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			   22,   17,   14,    8,    8,    8,    2,    2,    2,    2,
			    2,    8,   20,   20,   21,   21,   22,   22,    8,    2,
			    2,    8,   20,   21,    8,    2,    2,    8,   20,   16,
			   19,   19,    1,    8,    2,    2,    8,   20,    8,    2,
			    2,    8,   20,    8,    2,    8,   20,    8,   14,    8,
			    8,    8,    7,    8,   16,   19,    1,   14,   19,    8,
			    2,    8,   20,   14,    7,    8,   19,   19,   14,   19,
			    8,    2,    8,   20,   14,    7,    8,   19,   14,   14,
			   17,   15,   14,    8,    8,    8,    2,    2,    2,    2,
			   18,   18,   18,   19,   19,    8,    8,   20,   15,   22,

			   22,   19,    8,    2,    8,   20,   14,    7,    8,   19,
			   14,   19,    8,    2,    8,   20,   14,    7,    8,   19,
			   14,   19,   14,    7,    8,   19,   14,   19,   22,   14,
			    8,    8,    8,   19,    8,   19,   14,    7,    8,   19,
			   14,   22,    8,   19,   14,    7,    8,   19,   14,   22,
			    8,    8,    2,    8,   15,    8,    2,    8,   14,   14,
			   19,   14,    8,    2,    8,    8,    2,    8,    8,    8,
			    8,   19,    8,    8,    8,   19,   19,   14,   19,   14,
			   19,   14,   14,   19,   14,    7,    8,   19,   14,   22,
			    8,   19,   14,    7,    8,   19,   14,   22,    8,   22, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    8,   14,   14,   14,   14,   22,    8,   14,   22,    8,
			   14,   19,    8,    8,   19,   19,    8,    8,   19,    1,
			    1,    1,   19,    8,    8,   19,   19,    8,    8,   19,
			   19,   19,   19,   14,   14,   14,   22,   22,    8,   14,
			   22,    8,   14,   14,   14,    1,    1,    1,   14,   14,
			   14,   14,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,    1,    1,    1,   14,
			   15,   14,   14,   14,   14,   14,    8,   14,    8,   14,
			    8,   14,   14,    8,   14,    8,    8,    8,    8,    8,
			    8,   22,    1,    1, yyDummy>>,
			1, 94, 200)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    3,    4,    5,    6,
			    6,    7,    8,    8,    8,    9,    9,    9,    9,    9,
			   10,   11,   12,    2,   13,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   15,   16,   17, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 293)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,  121,   59,  120,    0,    0,    0,    0,
			    0,    2,   15,    0,   98,  101,    1,    3,   59,    0,
			    0,   48,    0,   77,   59,    0,    0,   48,    0,   52,
			   16,   60,    0,   59,    0,    0,   48,    0,   59,    0,
			    0,   48,    0,   59,    0,   48,    0,   48,    0,  123,
			  124,  122,   88,   78,   52,    4,    0,    0,   24,   59,
			    0,   48,    0,    0,   96,   86,   13,   49,    0,   22,
			   59,    0,   48,    0,    0,   94,   84,   11,    0,   61,
			    0,  125,    0,  123,  124,  122,    0,    0,    0,    0,
			    0,    0,    0,   63,   64,    0,    2,   37,    0,    0,

			    0,   20,   59,    0,   48,    0,    0,   92,   82,    9,
			    0,   18,   59,    0,   48,    0,    0,   90,   80,    7,
			    0,   17,    0,   89,   79,    6,    0,    5,    0,   50,
			  121,   59,  120,   51,  100,   25,    0,   97,   87,   14,
			    0,    0,  118,   23,    0,   95,   85,   12,    0,    0,
			  116,   59,    0,   48,  126,   59,    0,   48,  127,  127,
			   60,  127,   59,    0,   48,   59,    0,   48,   59,   48,
			   48,   54,  123,  124,  122,   69,   68,    0,   26,   62,
			   65,   53,   58,   21,    0,   93,   83,   10,    0,    0,
			  114,   19,    0,   91,   81,    8,    0,    0,  112,    0, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  111,    0,  127,  127,  127,    0,  119,    0,    0,  117,
			    0,   46,   59,   48,   35,   44,   59,   48,   33,    0,
			    0,    0,   42,   59,   48,   31,   40,   59,   48,   29,
			   39,   28,   27,  127,  127,  127,   73,    0,  115,    0,
			    0,  113,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   47,   36,   45,   34,   56,   71,   57,   72,
			   55,   70,   43,   32,   41,   30,    0,    0,    0,   66,
			   74,    0,    0,    0,    0,    0,   99,    0,  109,    0,
			  107,   67,    0,  105,    0,  103,  102,  110,  108,  106,
			  104,    0,    0,    0, yyDummy>>,
			1, 94, 200)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   90,   91,   92,   66,  256,   67,   30,   31,  257,   95,
			   11,   12,   13,   14,   15,   98,  291,   99,   17,  100,
			   56,  219, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 293)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			  496,  231,  187, -32768,   44, -32768,  141,  133,  326,  -13,
			  509,   43, -32768,  196, -32768,  194, -32768, -32768,   44,  320,
			  505,   43,  193, -32768,   44,  307,  501,   43,  189,  185,
			 -32768, -32768,  419,   44,  295,  486,   43,  181,   44,  275,
			  450,   43,  179,   44,  386,   43,  176,   43,  496, -32768,
			 -32768, -32768,  108,  106,  172, -32768,  446,  -24, -32768,   44,
			  371,   43,  170,  496,  108,  106, -32768, -32768,  -24, -32768,
			   44,  356,   43,  163,  496,  108,  106, -32768,  -24, -32768,
			  120,  164,   88,   73,  -53,  -68,   79,   49,  242,  -13,
			  446,  112,  112, -32768, -32768,  165,   43,  161,  -55,  156,

			  152, -32768,   44,  332,   43,  158,  496,  108,  106, -32768,
			  -24, -32768,   44,  -40,   43,  154,  496,  108,  106, -32768,
			  -24, -32768,  496,  108,  106, -32768,  -24, -32768,  155, -32768,
			  150,  -65,  148, -32768, -32768, -32768,  496,  108,  106, -32768,
			  -24,  151,   19, -32768,  496,  108,  106, -32768,  -24,  145,
			   19,   44,  234,   43, -32768,   44,  144,   43, -32768, -32768,
			  142, -32768,   44,   20,   43,   44,   -7,   43,   44,   43,
			   43, -32768,  135,  134,  131, -32768, -32768,  496,  128, -32768,
			 -32768, -32768, -32768, -32768,  496,  108,  106, -32768,  -24,  126,
			   19, -32768,  496,  108,  106, -32768,  -24,  109,   19,  104, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			   19,   97, -32768, -32768, -32768,   96,   19,   89,   85,   19,
			   80,   76,   44,   43,   67,   66,   44,   43,   63,  491,
			  491,  491,   59,   44,   43,   56,   51,   44,   43,   38,
			   37,   28,   27, -32768, -32768, -32768,  -36,   10,   19,   24,
			   -4,   19,   16,   13,  -24,  446,  446,  446,    7,  -24,
			    6,  -24,   -1,   -3,   -5,   -8, -32768, -32768, -32768, -32768,
			 -32768, -32768,  -15,  -17,  -19,  -22,  112,  112,  112, -32768,
			  -67,  -30,  -24,  -51,  -24,  -24, -32768,  -24,  -64,  -24,
			  -64, -32768,  -24,  -64,  -24,  -64,  -64,  -64,  -64,  -64,
			  -64,    4,    3, -32768, yyDummy>>,
			1, 94, 200)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768,  273,  -27,   -9,  200,  -78,  -21,  -10,
			   35,   70,  372, -32768,  322,  -80, -32768,   33, -32768, -32768,
			   61,  -69, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 584)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			yytable_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   53,  154,   55,  293,  292,   93,  160,  174,  173,  172,
			   65,   94,  161, -120,  281,  203,   76, -120,  -99,  113,
			   29,  193,   51,   50,   49,  108,  179,  159,  -59,  133,
			  118,  284,   29,   16,  124,  192,   21,   27,   51,   50,
			   49,   36,   41,   45,   47,  269,  103,  134,   81,    5,
			  138,    3,  282,  160,   61,    5,  227,    3,  142,   -8,
			   72,  146,  -19,  171,  -10,   32,  -21,   96,  150,  104,
			  175,  176,  273,  -12,  114,   40,  -23,  180,  -14,   32,
			  -25,  128,    5,  223,    3,   32,  271,  178,  279,  277,
			  220,   96,  221,  186,   32,  275,  141,  166,  274,   32,

			  190, -100,   97,  194,   32,   35,  272,  149,   -5,   -6,
			  198,    5,  165,    3,   26,  153,  200,  157,  -17,   -7,
			   32,  164,  167,  169,  170,   96,   97,  163,   54,   29,
			  206,   32,  -18,  245,  246,  247,  156,   -9,  209,  189,
			  -20,    5,  162,    3,  -11,   32,   20,  -22,  -13,  197,
			    5,  155,    3,  158, -121,  199,  270,  -24, -121,   40,
			   97,  250,  251,   32,  266,  267,  268,   35,  152,  205,
			   71,  249,  248,   32,  174,  173,  172,  208,  238,  244,
			  243,   39,    5,  151,    3,  242,  241,  213,  -75,   34,
			  -76,  217,   32,  258,  260,    5,   38,    3,  224,  259, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  261,  228,  239,    5,   33,    3,    5,  216,    3,   -4,
			  236,  235,   32,   26,  234,  233,   32,  237,   58,  258,
			  260,  210,  -38,   32,   69,  240,   32,  207,  204,   32,
			  202,  201,  182,  101,  276,   25,  196,  181,  111,  278,
			  188,  280,  -15,  121,  177,  148,  259,  261,   81,    5,
			   24,    3,  140,  129,   96,   96,   96,   20,  126,  135,
			   60,  120,  283,  110,  285,  286,   79,  287,   44,  288,
			  143,   78,  289,   32,  290,   68,  -77,   32,   57,   19,
			   96,   96,   96,    0,   32,    0,    0,    0,   32,   97,
			   97,   97,    0,    5,   18,    3,    5,  212,    3,    0,

			   77,  113,  183,    0,    5,  168,    3,    0,    0,  109,
			    0,    0,  191,    0,  119,   97,   97,   97,  125,    0,
			  127,  103,    0,   23,   23,    0,    0,    0,   23,   23,
			   23,    0,    0,   71,  139,    0,    0,    5,  112,    3,
			    0,   23,    0,    0,    0,  147,   60,   23,    0,    0,
			    0,  211,   44,    0,    0,  215,   23,    5,  102,    3,
			    0,   23,  222,    0,    0,  226,    0,    0,  230,    5,
			   70,    3,    0,   22,   28,    0,    0,  187,   37,   42,
			   46,    0,    5,   59,    3,    0,    0,  195,    5,   43,
			    3,   62,    0,  185,   51,   50,   49,   73,    0,    0, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,   23,    0,   23,    0,  105,  184,   23,   23,
			   23,  115,  252,    0,    0,    0,  254,  145,   51,   50,
			   49,    0,    0,  262,    0,    0,  214,  264,    0,    0,
			  218,  144,  137,   51,   50,   49,    0,  225,    0,    0,
			  229,    0,  231,  232,    0,   10,  136,  123,   51,   50,
			   49,    0,   22,    0,   28,    0,    0,    0,   37,   42,
			   46,  122,    0,    0,    0,   89,    0,   88,   87,   86,
			    0,    0,   10,    0,   23,    0,    0,    0,   23,    0,
			    0,   85,   84,   83,    0,   23,  253,    0,   23,    0,
			  255,    0,   89,    0,   88,   87,   86,  263,    0,    0,

			    0,  265,   82,   81,    0,   80,    0,    0,  132,  131,
			  130,  117,   51,   50,   49,    0,    0,   10,    0,    0,
			    0,    0,   10,    0,   62,  116,    0,    0,   73,   82,
			    0,    0,   80,    0,    0,  105,    0,   89,  115,   88,
			   87,   86,    9,    0,    8,    7,    6,  107,   51,   50,
			   49,    0,    0,   85,   84,   83,    0,    0,    5,    4,
			    3,  106,   75,   51,   50,   49,   64,   51,   50,   49,
			   52,   51,   50,   49,   82,    0,   74,   80,    0,    2,
			   63,    0,    1,    0,   48, yyDummy>>,
			1, 185, 400)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 584)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			yycheck_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   10,   81,   11,    0,    0,   32,   84,   62,   63,   64,
			   20,   32,   80,   81,   81,   80,   26,   85,   82,   26,
			   85,   61,   62,   63,   64,   35,   81,   80,   81,   56,
			   40,   82,   85,    0,   44,   75,    1,    2,   62,   63,
			   64,    6,    7,    8,    9,   81,   26,   57,   84,   62,
			   60,   64,   82,  131,   19,   62,   63,   64,   68,   81,
			   25,   71,   81,   90,   81,    4,   81,   32,   78,   34,
			   91,   92,   76,   81,   39,   26,   81,   98,   81,   18,
			   81,   48,   62,   63,   64,   24,   76,   96,   82,   82,
			  159,   56,  161,  103,   33,   82,   63,   48,   82,   38,

			  110,   82,   32,  113,   43,   26,   82,   74,   81,   81,
			  120,   62,   63,   64,   26,   80,  126,   82,   81,   81,
			   59,   86,   87,   88,   89,   90,   56,   48,   85,   85,
			  140,   70,   81,  202,  203,  204,   48,   81,  148,  106,
			   81,   62,   63,   64,   81,   84,   26,   81,   81,  116,
			   62,   63,   64,   80,   81,  122,  236,   81,   85,   26,
			   90,   76,   82,  102,  233,  234,  235,   26,   48,  136,
			   26,   82,   76,  112,   62,   63,   64,  144,  188,   82,
			   76,   48,   62,   63,   64,   76,  196,  152,   82,   48,
			   82,  156,  131,  220,  221,   62,   63,   64,  163,  220, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  221,  166,   76,   62,   63,   64,   62,   63,   64,   81,
			  177,   80,  151,   26,   80,   80,  155,  184,   18,  246,
			  247,   76,   80,  162,   24,  192,  165,   76,   80,  168,
			   80,   76,   80,   33,  244,   48,   82,   81,   38,  249,
			   82,  251,   81,   43,   79,   82,  267,  268,   84,   62,
			   63,   64,   82,   81,  219,  220,  221,   26,   82,   59,
			   26,   82,  272,   82,  274,  275,   81,  277,   26,  279,
			   70,   82,  282,  212,  284,   82,   82,  216,   82,   48,
			  245,  246,  247,   -1,  223,   -1,   -1,   -1,  227,  219,
			  220,  221,   -1,   62,   63,   64,   62,   63,   64,   -1,

			   27,   26,  102,   -1,   62,   63,   64,   -1,   -1,   36,
			   -1,   -1,  112,   -1,   41,  245,  246,  247,   45,   -1,
			   47,   26,   -1,    1,    2,   -1,   -1,   -1,    6,    7,
			    8,   -1,   -1,   26,   61,   -1,   -1,   62,   63,   64,
			   -1,   19,   -1,   -1,   -1,   72,   26,   25,   -1,   -1,
			   -1,  151,   26,   -1,   -1,  155,   34,   62,   63,   64,
			   -1,   39,  162,   -1,   -1,  165,   -1,   -1,  168,   62,
			   63,   64,   -1,    1,    2,   -1,   -1,  104,    6,    7,
			    8,   -1,   62,   63,   64,   -1,   -1,  114,   62,   63,
			   64,   19,   -1,   61,   62,   63,   64,   25,   -1,   -1, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   80,   -1,   82,   -1,   34,   75,   86,   87,
			   88,   39,  212,   -1,   -1,   -1,  216,   61,   62,   63,
			   64,   -1,   -1,  223,   -1,   -1,  153,  227,   -1,   -1,
			  157,   75,   61,   62,   63,   64,   -1,  164,   -1,   -1,
			  167,   -1,  169,  170,   -1,   26,   75,   61,   62,   63,
			   64,   -1,   80,   -1,   82,   -1,   -1,   -1,   86,   87,
			   88,   75,   -1,   -1,   -1,   46,   -1,   48,   49,   50,
			   -1,   -1,   26,   -1,  152,   -1,   -1,   -1,  156,   -1,
			   -1,   62,   63,   64,   -1,  163,  213,   -1,  166,   -1,
			  217,   -1,   46,   -1,   48,   49,   50,  224,   -1,   -1,

			   -1,  228,   83,   84,   -1,   86,   -1,   -1,   62,   63,
			   64,   61,   62,   63,   64,   -1,   -1,   26,   -1,   -1,
			   -1,   -1,   26,   -1,  152,   75,   -1,   -1,  156,   83,
			   -1,   -1,   86,   -1,   -1,  163,   -1,   46,  166,   48,
			   49,   50,   46,   -1,   48,   49,   50,   61,   62,   63,
			   64,   -1,   -1,   62,   63,   64,   -1,   -1,   62,   63,
			   64,   75,   61,   62,   63,   64,   61,   62,   63,   64,
			   61,   62,   63,   64,   83,   -1,   75,   86,   -1,   83,
			   75,   -1,   86,   -1,   75, yyDummy>>,
			1, 185, 400)
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

	yyvs2: SPECIAL [detachable ET_KEYWORD]
			-- Stack for semantic values of type detachable ET_KEYWORD

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [detachable ET_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_KEYWORD]

	yyvs3: SPECIAL [detachable ET_AGENT_KEYWORD]
			-- Stack for semantic values of type detachable ET_AGENT_KEYWORD

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [detachable ET_AGENT_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_AGENT_KEYWORD]

	yyvs4: SPECIAL [detachable ET_INVARIANT_KEYWORD]
			-- Stack for semantic values of type detachable ET_INVARIANT_KEYWORD

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [detachable ET_INVARIANT_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_INVARIANT_KEYWORD]

	yyvs5: SPECIAL [detachable ET_PRECURSOR_KEYWORD]
			-- Stack for semantic values of type detachable ET_PRECURSOR_KEYWORD

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [detachable ET_PRECURSOR_KEYWORD]
			-- Routines that ought to be in SPECIAL [detachable ET_PRECURSOR_KEYWORD]

	yyvs6: SPECIAL [detachable ET_BOOLEAN_CONSTANT]
			-- Stack for semantic values of type detachable ET_BOOLEAN_CONSTANT

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [detachable ET_BOOLEAN_CONSTANT]
			-- Routines that ought to be in SPECIAL [detachable ET_BOOLEAN_CONSTANT]

	yyvs7: SPECIAL [detachable ET_CURRENT]
			-- Stack for semantic values of type detachable ET_CURRENT

	yyvsc7: INTEGER
			-- Capacity of semantic value stack `yyvs7'

	yyvsp7: INTEGER
			-- Top of semantic value stack `yyvs7'

	yyspecial_routines7: KL_SPECIAL_ROUTINES [detachable ET_CURRENT]
			-- Routines that ought to be in SPECIAL [detachable ET_CURRENT]

	yyvs8: SPECIAL [detachable ET_IDENTIFIER]
			-- Stack for semantic values of type detachable ET_IDENTIFIER

	yyvsc8: INTEGER
			-- Capacity of semantic value stack `yyvs8'

	yyvsp8: INTEGER
			-- Top of semantic value stack `yyvs8'

	yyspecial_routines8: KL_SPECIAL_ROUTINES [detachable ET_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [detachable ET_IDENTIFIER]

	yyvs9: SPECIAL [detachable ET_KEYWORD_OPERATOR]
			-- Stack for semantic values of type detachable ET_KEYWORD_OPERATOR

	yyvsc9: INTEGER
			-- Capacity of semantic value stack `yyvs9'

	yyvsp9: INTEGER
			-- Top of semantic value stack `yyvs9'

	yyspecial_routines9: KL_SPECIAL_ROUTINES [detachable ET_KEYWORD_OPERATOR]
			-- Routines that ought to be in SPECIAL [detachable ET_KEYWORD_OPERATOR]

	yyvs10: SPECIAL [detachable ET_RESULT]
			-- Stack for semantic values of type detachable ET_RESULT

	yyvsc10: INTEGER
			-- Capacity of semantic value stack `yyvs10'

	yyvsp10: INTEGER
			-- Top of semantic value stack `yyvs10'

	yyspecial_routines10: KL_SPECIAL_ROUTINES [detachable ET_RESULT]
			-- Routines that ought to be in SPECIAL [detachable ET_RESULT]

	yyvs11: SPECIAL [detachable ET_RETRY_INSTRUCTION]
			-- Stack for semantic values of type detachable ET_RETRY_INSTRUCTION

	yyvsc11: INTEGER
			-- Capacity of semantic value stack `yyvs11'

	yyvsp11: INTEGER
			-- Top of semantic value stack `yyvs11'

	yyspecial_routines11: KL_SPECIAL_ROUTINES [detachable ET_RETRY_INSTRUCTION]
			-- Routines that ought to be in SPECIAL [detachable ET_RETRY_INSTRUCTION]

	yyvs12: SPECIAL [detachable ET_VOID]
			-- Stack for semantic values of type detachable ET_VOID

	yyvsc12: INTEGER
			-- Capacity of semantic value stack `yyvs12'

	yyvsp12: INTEGER
			-- Top of semantic value stack `yyvs12'

	yyspecial_routines12: KL_SPECIAL_ROUTINES [detachable ET_VOID]
			-- Routines that ought to be in SPECIAL [detachable ET_VOID]

	yyvs13: SPECIAL [detachable ET_POSITION]
			-- Stack for semantic values of type detachable ET_POSITION

	yyvsc13: INTEGER
			-- Capacity of semantic value stack `yyvs13'

	yyvsp13: INTEGER
			-- Top of semantic value stack `yyvs13'

	yyspecial_routines13: KL_SPECIAL_ROUTINES [detachable ET_POSITION]
			-- Routines that ought to be in SPECIAL [detachable ET_POSITION]

	yyvs14: SPECIAL [detachable ET_SYMBOL]
			-- Stack for semantic values of type detachable ET_SYMBOL

	yyvsc14: INTEGER
			-- Capacity of semantic value stack `yyvs14'

	yyvsp14: INTEGER
			-- Top of semantic value stack `yyvs14'

	yyspecial_routines14: KL_SPECIAL_ROUTINES [detachable ET_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_SYMBOL]

	yyvs15: SPECIAL [detachable ET_SEMICOLON_SYMBOL]
			-- Stack for semantic values of type detachable ET_SEMICOLON_SYMBOL

	yyvsc15: INTEGER
			-- Capacity of semantic value stack `yyvs15'

	yyvsp15: INTEGER
			-- Top of semantic value stack `yyvs15'

	yyspecial_routines15: KL_SPECIAL_ROUTINES [detachable ET_SEMICOLON_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_SEMICOLON_SYMBOL]

	yyvs16: SPECIAL [detachable ET_BRACKET_SYMBOL]
			-- Stack for semantic values of type detachable ET_BRACKET_SYMBOL

	yyvsc16: INTEGER
			-- Capacity of semantic value stack `yyvs16'

	yyvsp16: INTEGER
			-- Top of semantic value stack `yyvs16'

	yyspecial_routines16: KL_SPECIAL_ROUTINES [detachable ET_BRACKET_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_BRACKET_SYMBOL]

	yyvs17: SPECIAL [detachable ET_QUESTION_MARK_SYMBOL]
			-- Stack for semantic values of type detachable ET_QUESTION_MARK_SYMBOL

	yyvsc17: INTEGER
			-- Capacity of semantic value stack `yyvs17'

	yyvsp17: INTEGER
			-- Top of semantic value stack `yyvs17'

	yyspecial_routines17: KL_SPECIAL_ROUTINES [detachable ET_QUESTION_MARK_SYMBOL]
			-- Routines that ought to be in SPECIAL [detachable ET_QUESTION_MARK_SYMBOL]

	yyvs18: SPECIAL [detachable ET_ACTUAL_PARAMETER_ITEM]
			-- Stack for semantic values of type detachable ET_ACTUAL_PARAMETER_ITEM

	yyvsc18: INTEGER
			-- Capacity of semantic value stack `yyvs18'

	yyvsp18: INTEGER
			-- Top of semantic value stack `yyvs18'

	yyspecial_routines18: KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_PARAMETER_ITEM]
			-- Routines that ought to be in SPECIAL [detachable ET_ACTUAL_PARAMETER_ITEM]

	yyvs19: SPECIAL [detachable ET_ACTUAL_PARAMETER_LIST]
			-- Stack for semantic values of type detachable ET_ACTUAL_PARAMETER_LIST

	yyvsc19: INTEGER
			-- Capacity of semantic value stack `yyvs19'

	yyvsp19: INTEGER
			-- Top of semantic value stack `yyvs19'

	yyspecial_routines19: KL_SPECIAL_ROUTINES [detachable ET_ACTUAL_PARAMETER_LIST]
			-- Routines that ought to be in SPECIAL [detachable ET_ACTUAL_PARAMETER_LIST]

	yyvs20: SPECIAL [detachable ET_LIKE_TYPE]
			-- Stack for semantic values of type detachable ET_LIKE_TYPE

	yyvsc20: INTEGER
			-- Capacity of semantic value stack `yyvs20'

	yyvsp20: INTEGER
			-- Top of semantic value stack `yyvs20'

	yyspecial_routines20: KL_SPECIAL_ROUTINES [detachable ET_LIKE_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_LIKE_TYPE]

	yyvs21: SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Stack for semantic values of type detachable ET_QUALIFIED_LIKE_IDENTIFIER

	yyvsc21: INTEGER
			-- Capacity of semantic value stack `yyvs21'

	yyvsp21: INTEGER
			-- Top of semantic value stack `yyvs21'

	yyspecial_routines21: KL_SPECIAL_ROUTINES [detachable ET_QUALIFIED_LIKE_IDENTIFIER]
			-- Routines that ought to be in SPECIAL [detachable ET_QUALIFIED_LIKE_IDENTIFIER]

	yyvs22: SPECIAL [detachable ET_TYPE]
			-- Stack for semantic values of type detachable ET_TYPE

	yyvsc22: INTEGER
			-- Capacity of semantic value stack `yyvs22'

	yyvsp22: INTEGER
			-- Top of semantic value stack `yyvs22'

	yyspecial_routines22: KL_SPECIAL_ROUTINES [detachable ET_TYPE]
			-- Routines that ought to be in SPECIAL [detachable ET_TYPE]

feature {NONE} -- Constants

	yyFinal: INTEGER = 293
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 87
			-- Number of tokens

	yyLast: INTEGER = 584
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 329
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 109
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature -- Access

	system_processor: ET_SYSTEM_PROCESSOR
			-- System processor currently used

end
