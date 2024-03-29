﻿note

	description:

		"Eiffel parsers"

	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

class EIFFEL_PARSER

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	EIFFEL_SCANNER
		rename
			make as make_eiffel_scanner
		end

	KL_SHARED_EXCEPTIONS
	KL_SHARED_ARGUMENTS

create

	make, execute, benchmark


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
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
			yyvsp4 := -1
			yyvsp5 := -1
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
				yyspecial_routines2.force (yyvs2, last_character_value, yyvsp2)
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
				yyspecial_routines4.force (yyvs4, last_double_value, yyvsp4)
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_detachable_string_value, yyvsp5)
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
		do
				inspect yy_act
when 1 then
--|#line 73 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 73")
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
when 2 then
--|#line 74 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 74")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 3 then
--|#line 77 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 77")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 79 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 79")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 82 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 82")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 87 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 87")
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
when 7 then
--|#line 88 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 88")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 89 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 89")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 92 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 92")
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
when 10 then
--|#line 93 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 93")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 94 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 94")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 97 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 97")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 13 then
--|#line 98 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 98")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 14 then
--|#line 99 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 99")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 15 then
--|#line 100 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 100")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 16 then
--|#line 103 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 103")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 17 then
--|#line 104 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 104")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 107 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 107")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 19 then
--|#line 108 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 108")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 20 then
--|#line 111 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 111")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 21 then
--|#line 112 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 112")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 22 then
--|#line 115 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 115")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 23 then
--|#line 116 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 116")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 24 then
--|#line 121 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 121")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 25 then
--|#line 124 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 124")
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
when 26 then
--|#line 125 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 125")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 27 then
--|#line 126 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 126")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 28 then
--|#line 127 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 127")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 29 then
--|#line 132 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 132")
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
when 30 then
--|#line 133 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 133")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 31 then
--|#line 136 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 136")
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
when 32 then
--|#line 137 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 137")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 33 then
--|#line 138 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 138")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 34 then
--|#line 141 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 141")
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
when 35 then
--|#line 142 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 142")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 36 then
--|#line 144 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 144")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 147 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 147")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 152 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 152")
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
when 39 then
--|#line 153 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 153")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 40 then
--|#line 158 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 158")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 161 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 161")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 162 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 162")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 43 then
--|#line 163 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 163")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 44 then
--|#line 164 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 164")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 45 then
--|#line 166 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 166")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 46 then
--|#line 167 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 167")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 47 then
--|#line 178 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 178")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 48 then
--|#line 179 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 179")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 49 then
--|#line 180 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 180")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 50 then
--|#line 181 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 181")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 51 then
--|#line 182 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 182")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 52 then
--|#line 185 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 185")
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
when 53 then
--|#line 186 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 186")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 54 then
--|#line 189 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 189")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 55 then
--|#line 191 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 191")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 56 then
--|#line 192 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 192")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 57 then
--|#line 193 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 193")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 58 then
--|#line 194 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 194")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 59 then
--|#line 200 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 200")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -5
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 60 then
--|#line 204 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 204")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 61 then
--|#line 208 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 208")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 62 then
--|#line 211 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 211")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 63 then
--|#line 214 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 214")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 64 then
--|#line 219 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 219")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 65 then
--|#line 220 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 220")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 66 then
--|#line 223 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 223")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 67 then
--|#line 224 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 224")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 68 then
--|#line 229 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 229")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 69 then
--|#line 232 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 232")
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
when 70 then
--|#line 233 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 233")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 71 then
--|#line 236 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 236")
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
when 72 then
--|#line 237 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 237")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 73 then
--|#line 238 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 238")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 74 then
--|#line 241 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 241")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 75 then
--|#line 242 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 242")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 76 then
--|#line 243 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 243")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 77 then
--|#line 246 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 246")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 78 then
--|#line 249 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 249")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 79 then
--|#line 250 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 250")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 80 then
--|#line 253 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 253")
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
when 81 then
--|#line 254 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 254")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 82 then
--|#line 255 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 255")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 83 then
--|#line 260 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 260")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 84 then
--|#line 263 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 263")
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
when 85 then
--|#line 264 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 264")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 86 then
--|#line 267 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 267")
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
when 87 then
--|#line 268 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 268")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 88 then
--|#line 269 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 269")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 89 then
--|#line 274 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 274")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 90 then
--|#line 277 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 277")
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
when 91 then
--|#line 278 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 278")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 92 then
--|#line 281 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 281")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 93 then
--|#line 284 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 284")
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
when 94 then
--|#line 285 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 285")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 95 then
--|#line 288 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 288")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 96 then
--|#line 291 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 291")
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
when 97 then
--|#line 292 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 292")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 98 then
--|#line 297 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 297")
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
--|#line 298 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 298")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 100 then
--|#line 301 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 301")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 101 then
--|#line 302 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 302")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 102 then
--|#line 305 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 305")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 103 then
--|#line 307 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 307")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 104 then
--|#line 312 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 312")
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
when 105 then
--|#line 313 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 313")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 106 then
--|#line 314 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 314")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 107 then
--|#line 319 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 319")
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
when 108 then
--|#line 320 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 320")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 109 then
--|#line 323 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 323")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 110 then
--|#line 324 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 324")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 111 then
--|#line 327 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 327")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 112 then
--|#line 332 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 332")
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
when 113 then
--|#line 333 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 333")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 114 then
--|#line 334 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 334")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 115 then
--|#line 337 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 337")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 116 then
--|#line 338 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 338")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 117 then
--|#line 339 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 339")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 118 then
--|#line 344 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 344")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 119 then
--|#line 347 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 347")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 120 then
--|#line 350 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 350")
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
when 121 then
--|#line 351 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 351")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 122 then
--|#line 352 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 352")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 123 then
--|#line 353 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 353")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 124 then
--|#line 354 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 354")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 125 then
--|#line 355 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 355")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 126 then
--|#line 356 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 356")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 127 then
--|#line 361 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 361")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 128 then
--|#line 362 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 362")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 129 then
--|#line 365 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 365")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 130 then
--|#line 366 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 366")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 131 then
--|#line 371 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 371")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 132 then
--|#line 372 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 372")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 133 then
--|#line 373 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 373")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 134 then
--|#line 376 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 376")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 135 then
--|#line 377 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 377")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 136 then
--|#line 378 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 378")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 137 then
--|#line 379 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 379")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 138 then
--|#line 382 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 382")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 139 then
--|#line 383 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 383")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 140 then
--|#line 384 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 384")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 141 then
--|#line 385 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 385")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 142 then
--|#line 386 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 386")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 143 then
--|#line 387 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 387")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 144 then
--|#line 388 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 388")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 145 then
--|#line 389 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 389")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 146 then
--|#line 390 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 390")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 147 then
--|#line 391 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 391")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 148 then
--|#line 392 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 392")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 149 then
--|#line 393 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 393")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 150 then
--|#line 394 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 394")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 151 then
--|#line 395 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 395")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 152 then
--|#line 396 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 396")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 153 then
--|#line 397 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 397")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 154 then
--|#line 398 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 398")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 155 then
--|#line 399 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 399")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 156 then
--|#line 404 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 404")
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
when 157 then
--|#line 405 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 405")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 158 then
--|#line 408 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 408")
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
when 159 then
--|#line 409 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 409")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 160 then
--|#line 410 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 410")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 161 then
--|#line 413 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 413")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 162 then
--|#line 414 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 414")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 163 then
--|#line 415 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 415")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 164 then
--|#line 418 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 418")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 165 then
--|#line 421 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 421")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 166 then
--|#line 422 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 422")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 167 then
--|#line 425 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 425")
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
when 168 then
--|#line 426 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 426")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 169 then
--|#line 431 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 431")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 170 then
--|#line 439 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 439")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 171 then
--|#line 440 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 440")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 172 then
--|#line 441 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 441")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 173 then
--|#line 442 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 442")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 174 then
--|#line 445 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 445")
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
when 175 then
--|#line 446 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 446")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 176 then
--|#line 451 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 451")
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
when 177 then
--|#line 452 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 452")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 178 then
--|#line 457 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 457")
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
when 179 then
--|#line 458 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 458")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 180 then
--|#line 459 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 459")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 181 then
--|#line 462 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 462")
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
when 182 then
--|#line 463 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 463")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 183 then
--|#line 464 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 464")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 184 then
--|#line 467 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 467")
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
when 185 then
--|#line 468 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 468")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 186 then
--|#line 471 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 471")
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
when 187 then
--|#line 472 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 472")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 188 then
--|#line 473 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 473")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 189 then
--|#line 476 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 476")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 190 then
--|#line 477 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 477")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 191 then
--|#line 478 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 478")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 192 then
--|#line 481 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 481")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 193 then
--|#line 485 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 485")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 194 then
--|#line 491 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 491")
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
when 195 then
--|#line 492 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 492")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 196 then
--|#line 497 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 497")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 197 then
--|#line 498 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 498")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 198 then
--|#line 499 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 499")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 199 then
--|#line 500 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 500")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 200 then
--|#line 501 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 501")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 201 then
--|#line 502 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 502")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 202 then
--|#line 503 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 503")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 203 then
--|#line 506 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 506")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 204 then
--|#line 509 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 509")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 205 then
--|#line 512 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 512")
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
when 206 then
--|#line 513 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 513")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 207 then
--|#line 516 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 516")
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
when 208 then
--|#line 517 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 517")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 209 then
--|#line 518 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 518")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 210 then
--|#line 523 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 523")
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
when 211 then
--|#line 524 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 524")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 212 then
--|#line 527 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 527")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 213 then
--|#line 528 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 528")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 214 then
--|#line 531 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 531")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 215 then
--|#line 532 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 532")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 216 then
--|#line 533 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 533")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 217 then
--|#line 534 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 534")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 218 then
--|#line 535 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 535")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 219 then
--|#line 536 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 536")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 220 then
--|#line 537 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 537")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 221 then
--|#line 538 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 538")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 222 then
--|#line 539 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 539")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 223 then
--|#line 540 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 540")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 224 then
--|#line 542 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 542")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 225 then
--|#line 547 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 547")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 226 then
--|#line 548 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 548")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 227 then
--|#line 551 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 551")
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
when 228 then
--|#line 552 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 552")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 229 then
--|#line 557 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 557")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -5
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 230 then
--|#line 558 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 558")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 231 then
--|#line 561 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 561")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 232 then
--|#line 566 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 566")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 233 then
--|#line 569 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 569")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 234 then
--|#line 570 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 570")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 235 then
--|#line 575 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 575")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 236 then
--|#line 578 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 578")
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
when 237 then
--|#line 579 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 579")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 238 then
--|#line 582 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 582")
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
when 239 then
--|#line 583 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 583")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 240 then
--|#line 584 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 584")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 241 then
--|#line 589 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 589")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 242 then
--|#line 592 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 592")
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
when 243 then
--|#line 593 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 593")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 244 then
--|#line 594 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 594")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 245 then
--|#line 597 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 597")
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
when 246 then
--|#line 598 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 598")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 247 then
--|#line 599 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 599")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 248 then
--|#line 602 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 602")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 249 then
--|#line 603 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 603")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 250 then
--|#line 606 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 606")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 251 then
--|#line 607 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 607")
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
when 252 then
--|#line 608 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 608")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 253 then
--|#line 613 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 613")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 254 then
--|#line 617 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 617")
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
when 255 then
--|#line 618 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 618")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 256 then
--|#line 619 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 619")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 257 then
--|#line 620 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 620")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 258 then
--|#line 625 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 625")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 259 then
--|#line 628 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 628")
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
when 260 then
--|#line 629 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 629")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 261 then
--|#line 632 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 632")
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
when 262 then
--|#line 633 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 633")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 263 then
--|#line 634 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 634")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 264 then
--|#line 639 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 639")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 265 then
--|#line 644 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 644")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 266 then
--|#line 645 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 645")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 267 then
--|#line 646 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 646")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 268 then
--|#line 647 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 647")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 269 then
--|#line 648 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 648")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 270 then
--|#line 649 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 649")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 271 then
--|#line 652 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 652")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 272 then
--|#line 653 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 653")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 273 then
--|#line 655 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 655")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 274 then
--|#line 656 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 656")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 275 then
--|#line 665 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 665")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 276 then
--|#line 666 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 666")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 277 then
--|#line 671 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 671")
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
when 278 then
--|#line 672 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 672")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 279 then
--|#line 675 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 675")
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
when 280 then
--|#line 676 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 676")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 281 then
--|#line 677 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 677")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 282 then
--|#line 680 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 680")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 283 then
--|#line 681 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 681")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 284 then
--|#line 684 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 684")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 285 then
--|#line 685 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 685")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 286 then
--|#line 686 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 686")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 287 then
--|#line 690 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 690")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 288 then
--|#line 693 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 693")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 289 then
--|#line 694 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 694")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 290 then
--|#line 699 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 699")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 291 then
--|#line 700 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 700")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 292 then
--|#line 701 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 701")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 293 then
--|#line 702 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 702")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 294 then
--|#line 703 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 703")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 295 then
--|#line 704 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 704")
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
when 296 then
--|#line 705 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 705")
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
when 297 then
--|#line 706 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 706")
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
when 298 then
--|#line 707 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 707")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 299 then
--|#line 708 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 708")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 300 then
--|#line 709 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 709")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 301 then
--|#line 710 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 710")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 302 then
--|#line 711 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 711")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 303 then
--|#line 712 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 712")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 304 then
--|#line 713 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 713")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 305 then
--|#line 714 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 714")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 306 then
--|#line 715 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 715")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 307 then
--|#line 716 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 716")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 308 then
--|#line 717 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 717")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 309 then
--|#line 718 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 718")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 310 then
--|#line 719 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 719")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 311 then
--|#line 720 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 720")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 312 then
--|#line 721 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 721")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 313 then
--|#line 722 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 722")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 314 then
--|#line 723 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 723")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 315 then
--|#line 724 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 724")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 316 then
--|#line 725 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 725")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 317 then
--|#line 726 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 726")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 318 then
--|#line 727 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 727")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 319 then
--|#line 728 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 728")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 320 then
--|#line 729 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 729")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 321 then
--|#line 730 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 730")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 322 then
--|#line 731 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 731")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 323 then
--|#line 732 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 732")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 324 then
--|#line 733 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 733")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 325 then
--|#line 734 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 734")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 326 then
--|#line 735 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 735")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 327 then
--|#line 737 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 737")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 328 then
--|#line 738 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 738")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 329 then
--|#line 739 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 739")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 330 then
--|#line 746 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 746")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 331 then
--|#line 747 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 747")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 332 then
--|#line 748 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 748")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 333 then
--|#line 749 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 749")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 334 then
--|#line 750 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 750")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 335 then
--|#line 751 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 751")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 336 then
--|#line 752 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 752")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 337 then
--|#line 755 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 755")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 338 then
--|#line 758 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 758")
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
when 339 then
--|#line 759 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 759")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 340 then
--|#line 762 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 762")
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
when 341 then
--|#line 763 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 763")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 342 then
--|#line 764 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 764")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 343 then
--|#line 767 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 767")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 344 then
--|#line 768 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 768")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 345 then
--|#line 769 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 769")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 346 then
--|#line 774 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 774")
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
when 347 then
--|#line 775 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 775")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 348 then
--|#line 776 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 776")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 349 then
--|#line 779 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 779")
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
when 350 then
--|#line 780 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 780")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 351 then
--|#line 781 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 781")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 352 then
--|#line 784 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 784")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 353 then
--|#line 785 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 785")
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
when 354 then
--|#line 786 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 786")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 355 then
--|#line 787 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 787")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 356 then
--|#line 788 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 788")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 357 then
--|#line 789 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 789")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 358 then
--|#line 792 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 792")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 359 then
--|#line 793 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 793")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 360 then
--|#line 796 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 796")
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
when 361 then
--|#line 797 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 797")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 362 then
--|#line 798 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 798")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 363 then
--|#line 801 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 801")
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
when 364 then
--|#line 802 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 802")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 365 then
--|#line 803 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 803")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 366 then
--|#line 806 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 806")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp1 >= yyvsc1 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs1")
		end
		yyvsc1 := yyvsc1 + yyInitial_yyvs_size
		yyvs1 := yyspecial_routines1.aliased_resized_area (yyvs1, yyvsc1)
	end
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 367 then
--|#line 807 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 807")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
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
			when 578 then
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
			create an_array.make_filled (0, 0, 361)
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
			    2,    2,    2,  124,    2,    2,  126,    2,    2,    2,
			  122,  123,  108,  106,  117,  107,  125,  109,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  116,  115,
			  102,  100,  103,  127,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  118,    2,  119,  112,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  120,    2,  121,  128,    2,    2,    2,
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
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,   99,  101,  104,  105,  110,  111,
			  113,  114, yyDummy>>,
			1, 162, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 367)
			yyr1_template_1 (an_array)
			yyr1_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yyr1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			    0,  129,  129,  130,  130,  139,  131,  131,  131,  140,
			  140,  140,  141,  141,  141,  141,  143,  143,  144,  144,
			  146,  146,  142,  142,  132,  148,  148,  148,  148,  133,
			  133,  149,  149,  149,  150,  150,  150,  152,  134,  134,
			  138,  154,  154,  154,  154,  154,  154,  155,  155,  155,
			  155,  155,  156,  156,  157,  157,  157,  157,  157,  158,
			  159,  160,  161,  162,  163,  163,  172,  172,  168,  164,
			  164,  174,  174,  174,  175,  175,  175,  176,  178,  178,
			  179,  179,  179,  177,  181,  181,  180,  180,  180,  170,
			  166,  166,  169,  165,  165,  171,  167,  167,  135,  135,

			  182,  182,  183,  183,  153,  153,  153,  136,  136,  184,
			  184,  185,  186,  186,  186,  187,  187,  187,  188,  190,
			  193,  193,  193,  193,  193,  193,  193,  189,  189,  195,
			  195,  173,  173,  173,  196,  196,  196,  196,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  191,  191,  198,  198,
			  198,  199,  199,  199,  200,  201,  201,  192,  192,  194,
			  205,  205,  205,  205,  209,  209,  204,  204,  203,  203,
			  203,  206,  206,  206,  137,  137,  210,  210,  210,  211,
			  211,  211,  212,  212,  207,  207,  202,  202,  202,  202, yyDummy>>,
			1, 200, 0)
		end

	yyr1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yyr1'.
		do
			yyarray_subcopy (an_array, <<
			  202,  202,  202,  151,  215,  216,  216,  217,  217,  217,
			  208,  208,  218,  218,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  220,  220,  230,  230,  228,
			  228,  232,  222,  233,  233,  223,  235,  235,  234,  234,
			  234,  224,  236,  236,  236,  237,  237,  237,  238,  238,
			  239,  239,  239,  225,  240,  240,  240,  240,  226,  241,
			  241,  242,  242,  242,  227,  221,  221,  221,  221,  221,
			  221,  221,  221,  221,  221,  243,  243,  231,  231,  244,
			  244,  244,  245,  245,  246,  246,  246,  246,  229,  229,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  250,  250,  250,  250,  250,  250,  250,  251,  252,  252,
			  253,  253,  253,  254,  254,  254,  249,  249,  249,  248,
			  248,  248,  147,  147,  147,  147,  147,  147,  247,  247,
			  214,  214,  214,  255,  255,  255,  145,  145, yyDummy>>,
			1, 168, 200)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 580)
			yytypes1_template_1 (an_array)
			yytypes1_template_2 (an_array)
			yytypes1_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytypes1_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    5,    5,    5,    4,    3,    2,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    4,    3,    4,    3,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    1,    1,    1,    1,    1,    1,    1,
			    5,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    5,    5,    5,    4,    3,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 200, 0)
		end

	yytypes1_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    5,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>,
			1, 200, 200)
		end

	yytypes1_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytypes1'.
		do
			yyarray_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    5,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    5,    1,    1,
			    1,    1,    1,    5,    1,    1,    1,    1,    1,    2,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    5,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1, yyDummy>>,
			1, 181, 400)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    2,    3,    4,    5,    5,    5,    5,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 580)
			yydefact_template_1 (an_array)
			yydefact_template_2 (an_array)
			yydefact_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yydefact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			    1,    6,    9,    9,    2,   25,    0,    0,  358,  359,
			  367,  357,  356,  366,  363,  360,  353,    8,   10,   12,
			   16,   20,   18,   21,  354,  352,  355,    7,   28,   27,
			   26,   29,    0,  364,  361,  365,  362,   22,   11,   13,
			    0,    0,   31,   38,    0,   22,    0,   14,   23,   20,
			   19,   17,   34,    0,    0,   98,   24,   15,    0,   32,
			   30,    0,   39,   84,   98,   84,  107,    4,   99,  100,
			  204,   35,  205,   34,   86,   85,  104,  107,    0,   47,
			   40,   52,  104,   84,  184,  108,  109,  101,  104,   36,
			  207,  203,   33,   87,    0,  105,  103,  184,   41,   80,

			   80,   65,   80,   71,   98,   98,   53,   54,   55,   56,
			   57,   58,   69,   93,   90,   96,    0,  102,  112,  186,
			    0,  110,    0,    0,    0,    0,    0,  196,  208,    0,
			   83,    0,    0,    5,    0,    0,  131,   81,   92,   95,
			   64,    0,   89,   68,   72,   74,   80,   98,    0,   50,
			   98,    0,   48,   93,   70,   90,   94,   96,   91,    0,
			   97,   63,    0,  129,  111,  113,  115,  156,  127,    0,
			    0,    0,    0,  349,    0,    0,    0,    0,    0,  277,
			  291,  292,    0,  349,    0,  299,  298,  297,  296,  295,
			  277,  185,  187,  189,  192,  290,  327,  265,  294,  328, yyDummy>>,
			1, 200, 0)
		end

	yydefact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  336,    3,   37,  198,  199,  200,  197,    0,    0,  202,
			  201,  206,    0,   88,  106,  134,  137,  136,  135,  132,
			  155,  153,  152,  150,  154,  151,  149,  148,  147,  146,
			  145,  144,  143,  142,  141,  140,  139,  138,  133,    0,
			    0,    0,   73,   75,   79,   77,   78,    0,   51,   43,
			    0,   49,   42,   90,   96,    0,   62,  130,  114,  116,
			  158,    0,  118,  167,  338,  335,  277,    0,    0,  350,
			    0,  325,  303,  302,  301,    0,  279,    0,  269,    0,
			  332,    0,  331,  346,    0,  304,  193,  275,  330,  188,
			  190,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  209,   82,    0,   66,   76,   46,   45,   96,    0,   61,
			  117,  165,    0,  159,  161,    0,  128,    0,  120,  340,
			  337,  293,    0,  329,    0,    0,    0,  282,    0,  280,
			    0,    0,  277,  266,  267,  347,    0,  300,  191,  310,
			  312,  311,  309,  308,  307,  306,  318,  317,  316,  315,
			  314,  313,    0,  319,  321,    0,  320,  324,  305,  277,
			    0,    0,   60,  157,  160,  162,    0,    0,  168,    0,
			   38,  178,  119,  122,  345,    0,  343,    0,  341,    0,
			  333,  277,  334,  351,  227,    0,  286,  285,  284,  283, yyDummy>>,
			1, 200, 200)
		end

	yydefact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yydefact'.
		do
			yyarray_subcopy (an_array, <<
			  278,    0,  277,  270,  326,    0,  322,  323,  276,   67,
			   59,  163,  166,  164,  125,  123,  126,  124,  121,  186,
			  176,    0,  339,    0,  268,  271,    0,  231,    0,  281,
			  273,  348,  186,  179,  158,    0,  344,  342,    0,  277,
			  287,    0,  180,  177,  210,    0,  210,  170,  181,  272,
			  228,  274,    0,    0,    0,  223,    0,  289,    0,  222,
			    0,    0,  210,  259,  186,    0,  288,  172,  211,  212,
			  214,  215,  216,  217,  218,  219,  220,  221,  224,    0,
			  174,  171,  186,  194,    0,    0,    0,    0,  289,  288,
			  227,  242,    0,  184,  261,  210,    0,  227,  213,  234,

			  233,    0,    0,  173,  186,  182,  210,    0,    0,    0,
			    0,    0,  230,  245,  236,  210,  254,  262,    0,    0,
			  264,  226,  232,  175,  183,  195,  169,  227,    0,  251,
			  252,  250,    0,  246,  248,  245,  210,    0,  238,  255,
			    0,  260,    0,  258,  225,  227,    0,  210,    0,    0,
			  237,  241,    0,  236,  277,  256,    0,  263,  229,  247,
			  243,  249,  210,    0,    0,    0,    0,    0,  244,  210,
			    0,  235,  257,  210,  239,  210,    0,  240,  253,    0,
			    0, yyDummy>>,
			1, 181, 400)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    1,    4,    5,   31,   43,  381,   77,   84,  120,   67,
			   78,   17,   18,   38,   19,   20,  266,   22,   23,   32,
			   53,   59,  127,   89,   96,   80,   81,  105,  106,  107,
			  108,  109,  110,  111,  112,  153,  155,  157,  159,  113,
			  156,  158,  160,  140,  137,  143,  144,  145,   75,  245,
			  138,   94,   76,   68,   69,   85,   86,  164,  165,  166,
			  167,  262,  263,  328,  382,  383,  168,  219,  238,  322,
			  323,  324,  325,  128,  420,  435,  448,  483,  507,  467,
			  503,  191,  192,  193,  194,   24,   72,   91,  129,  468,
			  469,  470,  195,  472,  473,  474,  475,  476,  477,  478,

			  479,  427,  287,  196,  501,  553,  537,  514,  532,  533,
			  534,  540,  495,  518,  197,  338,  386,  399,  198,  270,
			  346,  199,  200,  330,  387,  388,   26, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 580)
			yypact_template_1 (an_array)
			yypact_template_2 (an_array)
			yypact_template_3 (an_array)
			Result := yyfixed_array (an_array)
		end

	yypact_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768,  156, 1096, 1096, -32768,  149,  410,  392, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, 1009, -32768,
			  455,  470, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768,  472,  561, -32768, -32768, -32768, -32768,  558,  467, -32768,
			 1096, 1096,  186,  521,  186, -32768,  403, -32768, -32768, -32768,
			 -32768,  455,  536,  248,  562,   34, -32768, -32768,  525, -32768,
			 -32768,  186, -32768,  385,   65,  385,  505, -32768,  102, -32768,
			 -32768,  486,  441,  536,  186, -32768,  186,  505,  518, -32768,
			 -32768,  446,  186,  385,  302,  505, -32768, -32768,  186, -32768,
			  278, -32768, -32768, -32768,  179, -32768,  419,  302, -32768,  225,

			  225,  225,  225,  385,  267,   44, -32768, -32768, -32768, -32768,
			 -32768, -32768,  507,  466,  443,  414,  509,  419,  421,  938,
			  506, -32768,    2,  525,  136,  525,   99, -32768, -32768,  214,
			 -32768,  186,  186, -32768,  299, 1337, -32768, -32768,  384,  384,
			  415,  510,  384, -32768,  126, -32768,  428,   65,  500, -32768,
			   65,  498, -32768,  466, -32768,  443, -32768,  414, -32768,  488,
			 -32768, -32768,  225, -32768, -32768,  289, -32768,  -62, -32768,  225,
			  327,  938,  278,  938,  938,  938,  938,  938,  394,  210,
			  146,  144,  393,  938,  938, -32768, -32768, -32768, -32768, -32768,
			  273, -32768,  868, -32768, 1272, -32768, -32768,  310, -32768, -32768, yyDummy>>,
			1, 200, 0)
		end

	yypact_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  508,  503, -32768,
			 -32768, -32768,  278, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  225,
			  225,  225,  385, -32768, -32768, -32768,  384,  471, -32768, -32768,
			  468, -32768, -32768,  443,  414,  465, -32768, -32768,  421, -32768,
			  186,  421, -32768,  367,  359, -32768,  129, 1081,  356, 1272,
			  174, -32768, -32768, -32768, -32768,  278,  711,  278,  351,  186,
			 -32768,  186, -32768,  186,   -7, -32768, -32768, -32768, -32768,  938,
			 -32768,  938,  938,  938,  938,  938,  938,  938,  938,  938,

			  938,  938,  938,  938,  851,  938,  781,  938,  938,  186,
			 -32768, -32768,  453, -32768, -32768, -32768, -32768,  414,  438, -32768,
			 -32768, -32768,  346,   19, -32768,  269, -32768,  278, 1313,  571,
			 -32768,  105,   43, -32768,  938,  344,   14, 1272,  125, -32768,
			  338,  186,  326,  310,  310, -32768,   66, -32768, -32768,   -4,
			   -4,   -4,   -4,   -4,   42,   42,  413,  413,  413,  413,
			  413,  413,  938, 1130,  627,  938,  627, 1300, -32768,  326,
			  225,  427, -32768, -32768,  186, -32768,  186,  278, -32768,  550,
			  339,  399, -32768, -32768,  327,  278, -32768,   64, -32768,  186,
			 -32768,  326, -32768, 1272,  -29,  938, -32768, -32768, -32768, -32768, yyDummy>>,
			1, 200, 200)
		end

	yypact_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yypact'.
		do
			yyarray_subcopy (an_array, <<
			 -32768,  711,  326,  310, -32768,  186, 1130,  627, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  641,
			  406,  330, -32768,  571,  310,  325,  186, -32768, 1044, -32768,
			  324, -32768,  938, -32768,  186,  285,   43, -32768,  186,  326,
			 -32768,  186, -32768, -32768, 1051,  436, 1051, -32768,  391,  310,
			 -32768,  310,  278,  938,  278, -32768,    1,  308,  303, -32768,
			  938,  938, 1051,  296,  938,   22, 1012, -32768, 1051, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  364,
			  398, -32768,  482,  350,  275,  252,  245,  278, -32768, -32768,
			  -29, 1196, 1220,  302,  320, 1051,  295,  -29, -32768, -32768,

			 -32768,  938,  313, -32768,  938, -32768, 1051,  288,   22,  169,
			  235,  164, -32768,   58,   91, 1051,  217, -32768,   45,  224,
			 -32768, -32768, 1272, -32768, -32768, -32768, -32768,  -29,   22, -32768,
			 -32768, -32768,   23, -32768,  219,   58, 1051,  153,  145,  938,
			   59, -32768,  106, -32768, -32768,  -29,   58, 1051,   58,   16,
			 -32768, -32768,  938,  342,  200, 1272,  938, -32768, -32768, -32768,
			 -32768, -32768, 1051, 1167,  938,   56,  938, 1149, -32768, 1051,
			 1114, -32768, 1272, 1051, -32768, 1051,  -17, -32768, -32768,   33,
			 -32768, yyDummy>>,
			1, 181, 400)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768,  586,  572,  549,  -95, -32768,
			  279,  622, -32768,  585,  140,  583,   -2,  581,   61, -32768,
			 -32768,  547,  529, -32768,  182, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  464, -133, -147,  511,
			  537,  535,  534, -32768,  -92, -32768, -32768, -131,  -99, -32768,
			  -59, -32768,  119, -32768,  546, -32768,  527, -32768, -32768, -117,
			 -32768, -32768, -32768, -32768, -32768,  227,  347, -32768, -32768,  172,
			 -32768, -296, -32768, -149, -32768, -32768, -32768, -32768, -32768, -261,
			 -32768, -398, -32768, -174,  -82, -123, -32768, -32768, -32768, -32768,
			  133, -32768, -307, -32768, -32768, -32768, -32768, -32768, -32768, -32768,

			 -265, -352, -142, -32768, -32768, -32768,   46, -32768,   68,   52,
			   49, -32768, -32768, -32768, -262, -32768, -270, -32768,   12,  411,
			 -32768, -32768, -134, -32768, -32768,  168, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1431)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			yytable_template_3 (an_array)
			yytable_template_4 (an_array)
			yytable_template_5 (an_array)
			yytable_template_6 (an_array)
			yytable_template_7 (an_array)
			yytable_template_8 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   21,   21,  133,  210,  146,  308,  339,   13,  347,  141,
			  255,   10,  578,  243,   25,   25,   21,  343,  290,  344,
			   13,  433,  254,  268,   10,   13,  163,  375,   13,   10,
			   25,  202,   10,  580,  442,   21,  265,  278,   49,   49,
			   52,  139,   56,  142,   21,  146,  280,  282,  259,   25,
			   70,  308,   25,   25,  135,  261,  288,   65,   25,   73,
			  260,  529,   15,  310,   13,  134,  496,   65,   10,  488,
			  257,   70,   93,  163,   95,   64,  562,  264,  411,  403,
			   95,  397,  396,  547,  505,  571,   95,  246,   65,  267,
			  488,  269,  271,  272,  273,  274,  426,  136,  136,  136,

			  136,  269,  285,   15,   63,   13,  524,  318,  291,   10,
			  334,  314,  391,  557,   63,  348,  136,  190,  536,  132,
			  317,  487,  205,  556,  209,   65,  335,  424,  340,  213,
			  214,  429,  288,  546,  374,   63,  395,  471,  512,  471,
			  546,  320,   13,  146,  136,  521,   10,  311,  312,  313,
			  295,  294,  293,  292,  291,  471,  579,  535,   39,  150,
			  136,  471,  542,  136,  208,  207,  163,  136,  541,  163,
			  371,  169,   63,  552,   30,  544,  449,   47,  378,  451,
			   29,  423,  551,  405,   82,  481,   57,  422,  471,  404,
			  190,  490,   13,  558,  337,    3,   10,  390,  392,  471, yyDummy>>,
			1, 200, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  497,  493,  118,  204,    2,  208,  207,   28,  471,  349,
			  350,  351,  352,  353,  354,  355,  356,  357,  358,  359,
			  360,  361,  363,  364,  366,  367,  368,  408,  413,  471,
			  389,   13,  548,  169,  519,   10,  421,  136,  136,  136,
			  471,  242,  401,  527,  398,  525,   74,  337,  400,  425,
			  265,  276,  393,  543,  538,  471,  136,  169,  321,  136,
			  430,  308,  471,  545,  117,  135,  471,  -44,  471,  281,
			  122,  279,  169,   70,  169,  550,  134,  342,  409,  342,
			  406,  345,  539,  407,   70,  528,  560,  190,  126,  -44,
			   65,  334,  -44,  333,  389,   13,  131,  450,  -44,   10,

			  130,  568,  392,  484,  391,  486,  -44,  369,  574,  125,
			  447,  446,  576,  428,  577,  -44,  566,  526,  445,  337,
			  523,  321,  276,  124,  520,  -44,  162,  517,  169,  135,
			  277,  212,  276,  211,  136,  444,  123,   63,  511,  342,
			  134,  337,   16,   15,   14,  119,   12,   11,  307,  306,
			  305,  304,  303,  302,  301,  300,  299,  298,  297,  296,
			  295,  294,  293,  292,  291,   61,  510,   60,  136,  536,
			  564,  485,  321,    9,  412,  509,  218,  217,  491,  492,
			  500,  499,  147,  148,  151,  377,  376,  342,   54,  286,
			  531,   25,   25,  216,  215,  276,   36,   35,  516,  508, yyDummy>>,
			1, 200, 200)
		end

	yytable_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    8,  169,  416,  431,  258,  506,   16,   15,   14,   13,
			   12,   11,  531,   10,   34,   33,  502,  190,  494,  522,
			  288,  482,  308,  531,  439,  531,  247,   13,  281,  250,
			  190,   10,  321,  279,   13,  309,  342,    9,   10,  342,
			  415,  417,  466,  480,  466,    7,    6,  244,  276,  441,
			  438,  436,  434,  419,  489,  169,  410,  555,  162,  402,
			  466,  135,  190,  489,    8,  394,  466,  372,  135,  373,
			  563,  100,  134,  370,  567,  104,  341,  332,  103,  134,
			  190,  329,  570,  327,  572,  189,  188,  187,   13,  186,
			  185,  184,   10,  466,  319,  102,  183,  316,  102,  101,

			  315,  239,  190,  100,  466,   74,  489,   36,   99,    7,
			    6,  530,   34,  466,  275,  283,    9,  256,   48,  297,
			  296,  295,  294,  293,  292,  291,  489,  252,   99,  249,
			  241,   70,  240,  530,  466,  201,  132,  554,  161,  103,
			   83,  182,  504,    8,  530,  466,  530,   98,   58,  181,
			  180,  179,  178,   16,   15,   14,   88,   12,   11,   90,
			  466,   16,   15,   14,   13,   12,   11,  466,   10,   62,
			   54,  466,   40,  466,  189,  188,  187,   13,  186,  185,
			  184,   10,   48,   44,    9,  183,   41,   71,  177,  176,
			   42,  437,    9,   79,  284,  175,  174,  561,  559,  565, yyDummy>>,
			1, 200, 400)
		end

	yytable_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  173,  498,  172,  549,  171,    9,  443,  418,  326,  170,
			  169,    8,  121,  414,   87,  116,  115,  253,  114,    8,
			   92,   50,   46,  154,   51,   27,   97,   66,    0,   55,
			  182,    0,    8,  149,  152,    0,  308,    0,  181,  180,
			  179,  178,    0,    0,  189,  188,  187,   13,  186,  185,
			  184,   10,  203,    0,  206,  183,    7,    6,    0,    0,
			    0,    0,    0,    0,    7,    6,    0,    0,  432,    0,
			    0,    0,    0,   45,    0,    9,  248,  177,  176,  251,
			    0,    0,    0,    0,  175,  174,    0,    0,    0,  173,
			    0,  385,    0,  171,    0,    0,    0,  336,  384,  169,

			  182,    0,    8,    0,    0,    0,    0,    0,  181,  180,
			  179,  178,    0,    0,  189,  188,  187,   13,  186,  185,
			  184,   10,    0,    0,    0,  183,  304,  303,  302,  301,
			  300,  299,  298,  297,  296,  295,  294,  293,  292,  291,
			    0,    0,    0,    0,    0,    9,    0,  177,  176,    0,
			    0,    0,    0,    0,  175,  174,    0,    0,    0,  173,
			    0,  172,    0,  171,    0,    0,    0,    0,  170,  169,
			  182,    0,    8,    0,    0,    0,    0,    0,  181,  180,
			  179,  178,    0,    0,  189,  188,  187,   13,  186,  185,
			  184,   10,    0,    0,    0,  183,    0,    0,    0,    0, yyDummy>>,
			1, 200, 600)
		end

	yytable_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,  365,    0,
			    0,    0,    0,    0,    0,    9,    0,  177,  176,    0,
			    0,    0,    0,    0,  175,  174,    0,    0,    0,  173,
			    0,  172,    0,  171,    0,    0,    0,  336,  170,  169,
			  182,    0,    8,    0,    0,    0,    0,    0,  181,  180,
			  179,  178,    0,    0,  189,  188,  187,   13,  186,  185,
			  184,   10,    0,    0,    0,  183,    0,    0,    0,    0,
			    0,  189,  188,  187,   13,  186,  185,  184,   10,    0,
			    0,    0,  183,    0,    0,    9,    0,  177,  176,    0,
			    0,    0,    0,    0,  175,  174,    0,    0,    0,  173,

			    0,  172,    9,  171,    0,    0,    0,    0,  170,  169,
			  182,  362,    8,    0,    0,    0,    0,    0,  181,  180,
			  179,  178,    0,    0,    0,    0,    0,  182,    0,    8,
			    0,    0,    0,    0,    0,  181,  180,  179,  178,    0,
			    0,  189,  188,  187,   13,  186,  185,  184,   10,    0,
			    0,    0,  183,    0,    0,    0,    0,  177,  176,    0,
			    0,    0,    0,    0,  175,  174,    0,    0,    0,  173,
			    0,  172,    9,  171,  177,  176,    0,    0,  170,  169,
			    0,  175,  174,  289,    0,    0,  173,    0,  172,    0,
			  171,    0,    0,    0,    0,  170,  169,  182,    0,    8, yyDummy>>,
			1, 200, 800)
		end

	yytable_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    0,    0,    0,  181,  180,  179,  178,    0,
			    0,    0,   16,   15,   14,   13,   12,   11, -277,   10,
			    0,    0, -277, -277,    0,    0,    0,    0,    0,    0,
			    0,    0,    0, -277,    0,    0, -277,    0,    0, -277,
			 -277, -277, -277,    9,  177,  176,    0,    0, -277,    0,
			 -277,  175,  174,  308, -277, -277,  173,   13,  172,    0,
			  171,   10,  465,    0,    0,  170,  169, -277, -277,    0,
			    8,    0,  464,    0,    0,  463, -277, -277, -277, -277,
			 -277, -277, -277,    0,    0,    0,    0,  462,    0,  461,
			  308,    0,    0,  460,    0,    0,    0,    0,    0,   16,

			   15,   14,   13,   12,   11,    0,   10,  459,    0,    0,
			    0,    0,    0,    0,    0,    7,    6,    0,  458,  457,
			  179,  456,    0,  308,   37,    0,    0, -277,    0,    0,
			    9,    0, -277,    0,  276,    0, -277, -277,    0,  308,
			  307,  306,  305,  304,  303,  302,  301,  300,  299,  298,
			  297,  296,  295,  294,  293,  292,  291,    8,  308,    0,
			    0,    0,    0,    0,    0,    0,  455,  440,    0,    0,
			    0,  454,    0,  453,  575,  452,  308,  307,  306,  305,
			  304,  303,  302,  301,  300,  299,  298,  297,  296,  295,
			  294,  293,  292,  291,    0,    0,  573,    0,    0,    0, yyDummy>>,
			1, 200, 1000)
		end

	yytable_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			    0,    0,    7,    6,  331,  308,    0,    0,    0,    0,
			  307,  306,  305,  304,  303,  302,  301,  300,  299,  298,
			  297,  296,  295,  294,  293,  292,  291,  569,    0,  308,
			  303,  302,  301,  300,  299,  298,  297,  296,  295,  294,
			  293,  292,  291,    0,    0,  307,  306,  305,  304,  303,
			  302,  301,  300,  299,  298,  297,  296,  295,  294,  293,
			  292,  291,  513,  307,  306,  305,  304,  303,  302,  301,
			  300,  299,  298,  297,  296,  295,  294,  293,  292,  291,
			  515,  308,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  307,  306,  305,  304,  303,  302,  301,  300,

			  299,  298,  297,  296,  295,  294,  293,  292,  291,  308,
			    0,    0,    0,    0,    0,    0,  307,  306,  305,  304,
			  303,  302,  301,  300,  299,  298,  297,  296,  295,  294,
			  293,  292,  291,    0,    0,    0,    0,    0,  -38,  -38,
			    0,    0,    0,    0,    0,    0,  -38,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  380,    0,  -38,
			    0,    0,   54,  -38,    0,    0,    0,  -38,  307,  306,
			  305,  304,  303,  302,  301,  300,  299,  298,  297,  296,
			  295,  294,  293,  292,  291,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  306,  305,  304, yyDummy>>,
			1, 200, 1200)
		end

	yytable_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  303,  302,  301,  300,  299,  298,  297,  296,  295,  294,
			  293,  292,  291,  379,  237,  236,  235,  234,  233,  232,
			  231,  230,  229,  228,  227,  226,  225,  224,  223,  222,
			  221,  220, yyDummy>>,
			1, 32, 1400)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1431)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			yycheck_template_3 (an_array)
			yycheck_template_4 (an_array)
			yycheck_template_5 (an_array)
			yycheck_template_6 (an_array)
			yycheck_template_7 (an_array)
			yycheck_template_8 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			    2,    3,   97,  126,  103,    9,  276,    6,   15,  101,
			  157,   10,   29,  144,    2,    3,   18,  279,  192,  281,
			    6,  419,  155,  172,   10,    6,  118,  323,    6,   10,
			   18,   29,   10,    0,  432,   37,  170,  179,   40,   41,
			   42,  100,   44,  102,   46,  144,  180,  181,  165,   37,
			    6,    9,   40,   41,   40,  117,  190,   23,   46,   61,
			  122,    3,    4,  212,    6,   51,  464,   23,   10,   68,
			  162,    6,   74,  165,   76,   41,   60,  169,  374,  341,
			   82,   67,   68,   60,  482,   29,   88,  146,   23,  171,
			   68,  173,  174,  175,  176,  177,  125,   99,  100,  101,

			  102,  183,  184,    4,   70,    6,  504,  254,  112,   10,
			  117,  242,   69,    7,   70,  289,  118,  119,   27,  117,
			  253,  120,  124,   64,  126,   23,  275,  389,  277,  131,
			  132,  401,  266,  117,  115,   70,  122,  444,  490,  446,
			  117,  258,    6,  242,  146,  497,   10,  239,  240,  241,
			  108,  109,  110,  111,  112,  462,    0,   66,   18,  115,
			  162,  468,  117,  165,  106,  107,  258,  169,  123,  261,
			  317,  128,   70,   28,   25,  527,  438,   37,  327,  441,
			   31,  117,   29,  117,   65,  446,   46,  123,  495,  123,
			  192,  456,    6,  545,  276,   39,   10,  331,  332,  506, yyDummy>>,
			1, 200, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  465,  462,   83,   67,   48,  106,  107,   58,  515,  291,
			  292,  293,  294,  295,  296,  297,  298,  299,  300,  301,
			  302,  303,  304,  305,  306,  307,  308,  369,  377,  536,
			  125,    6,   13,  128,  495,   10,  385,  239,  240,  241,
			  547,  115,  117,  508,  336,  506,  120,  329,  123,  391,
			  384,  122,  334,   29,  515,  562,  258,  128,  260,  261,
			  402,    9,  569,  528,   82,   40,  573,    0,  575,  125,
			   88,  125,  128,    6,  128,  536,   51,  279,  370,  281,
			  362,  283,   65,  365,    6,  121,  547,  289,   10,   22,
			   23,  117,   25,  119,  125,    6,  117,  439,   31,   10,

			  121,  562,  436,  452,   69,  454,   39,  309,  569,   31,
			   25,   26,  573,  395,  575,   48,  116,   29,   33,  401,
			    7,  323,  122,   45,   29,   58,   37,    7,  128,   40,
			  120,  117,  122,  119,  336,   50,   58,   70,  487,  341,
			   51,  423,    3,    4,    5,   43,    7,    8,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,  109,  110,  111,  112,  117,  121,  119,  370,   27,
			   28,  453,  374,   34,  376,  123,   77,   78,  460,  461,
			   16,   17,  115,  104,  105,  116,  117,  389,   49,  116,
			  513,  379,  380,   94,   95,  122,    4,    5,  493,  124, yyDummy>>,
			1, 200, 200)
		end

	yycheck_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   61,  128,   63,  405,  115,   55,    3,    4,    5,    6,
			    7,    8,  535,   10,    4,    5,   18,  419,  122,  501,
			  554,   30,    9,  546,  426,  548,  147,    6,  125,  150,
			  432,   10,  434,  125,    6,  125,  438,   34,   10,  441,
			  379,  380,  444,    7,  446,  106,  107,   19,  122,  125,
			  125,  121,   46,   54,  456,  128,   29,  539,   37,  121,
			  462,   40,  464,  465,   61,  121,  468,   29,   40,  123,
			  552,   57,   51,   20,  556,   29,  125,  121,   32,   51,
			  482,  122,  564,  116,  566,    3,    4,    5,    6,    7,
			    8,    9,   10,  495,   29,   52,   14,   29,   52,   53,

			   29,  117,  504,   57,  506,  120,  508,    4,   62,  106,
			  107,  513,    4,  515,  120,  122,   34,   29,  115,  106,
			  107,  108,  109,  110,  111,  112,  528,   29,   62,   29,
			   20,    6,  117,  535,  536,   29,  117,  539,   29,   32,
			   35,   59,   60,   61,  546,  547,  548,   29,   12,   67,
			   68,   69,   70,    3,    4,    5,   70,    7,    8,  118,
			  562,    3,    4,    5,    6,    7,    8,  569,   10,    7,
			   49,  573,  117,  575,    3,    4,    5,    6,    7,    8,
			    9,   10,  115,   22,   34,   14,  116,   58,  106,  107,
			  118,  423,   34,   64,  183,  113,  114,  548,  546,  553, yyDummy>>,
			1, 200, 400)
		end

	yycheck_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  118,  468,  120,  535,  122,   34,  434,  380,  261,  127,
			  128,   61,   85,   63,   68,   81,   81,  153,   81,   61,
			   73,   40,   37,  112,   41,    3,   77,   55,   -1,   43,
			   59,   -1,   61,  104,  105,   -1,    9,   -1,   67,   68,
			   69,   70,   -1,   -1,    3,    4,    5,    6,    7,    8,
			    9,   10,  123,   -1,  125,   14,  106,  107,   -1,   -1,
			   -1,   -1,   -1,   -1,  106,  107,   -1,   -1,   27,   -1,
			   -1,   -1,   -1,  115,   -1,   34,  147,  106,  107,  150,
			   -1,   -1,   -1,   -1,  113,  114,   -1,   -1,   -1,  118,
			   -1,  120,   -1,  122,   -1,   -1,   -1,  126,  127,  128,

			   59,   -1,   61,   -1,   -1,   -1,   -1,   -1,   67,   68,
			   69,   70,   -1,   -1,    3,    4,    5,    6,    7,    8,
			    9,   10,   -1,   -1,   -1,   14,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,  109,  110,  111,  112,
			   -1,   -1,   -1,   -1,   -1,   34,   -1,  106,  107,   -1,
			   -1,   -1,   -1,   -1,  113,  114,   -1,   -1,   -1,  118,
			   -1,  120,   -1,  122,   -1,   -1,   -1,   -1,  127,  128,
			   59,   -1,   61,   -1,   -1,   -1,   -1,   -1,   67,   68,
			   69,   70,   -1,   -1,    3,    4,    5,    6,    7,    8,
			    9,   10,   -1,   -1,   -1,   14,   -1,   -1,   -1,   -1, yyDummy>>,
			1, 200, 600)
		end

	yycheck_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   27,   -1,
			   -1,   -1,   -1,   -1,   -1,   34,   -1,  106,  107,   -1,
			   -1,   -1,   -1,   -1,  113,  114,   -1,   -1,   -1,  118,
			   -1,  120,   -1,  122,   -1,   -1,   -1,  126,  127,  128,
			   59,   -1,   61,   -1,   -1,   -1,   -1,   -1,   67,   68,
			   69,   70,   -1,   -1,    3,    4,    5,    6,    7,    8,
			    9,   10,   -1,   -1,   -1,   14,   -1,   -1,   -1,   -1,
			   -1,    3,    4,    5,    6,    7,    8,    9,   10,   -1,
			   -1,   -1,   14,   -1,   -1,   34,   -1,  106,  107,   -1,
			   -1,   -1,   -1,   -1,  113,  114,   -1,   -1,   -1,  118,

			   -1,  120,   34,  122,   -1,   -1,   -1,   -1,  127,  128,
			   59,   60,   61,   -1,   -1,   -1,   -1,   -1,   67,   68,
			   69,   70,   -1,   -1,   -1,   -1,   -1,   59,   -1,   61,
			   -1,   -1,   -1,   -1,   -1,   67,   68,   69,   70,   -1,
			   -1,    3,    4,    5,    6,    7,    8,    9,   10,   -1,
			   -1,   -1,   14,   -1,   -1,   -1,   -1,  106,  107,   -1,
			   -1,   -1,   -1,   -1,  113,  114,   -1,   -1,   -1,  118,
			   -1,  120,   34,  122,  106,  107,   -1,   -1,  127,  128,
			   -1,  113,  114,  115,   -1,   -1,  118,   -1,  120,   -1,
			  122,   -1,   -1,   -1,   -1,  127,  128,   59,   -1,   61, yyDummy>>,
			1, 200, 800)
		end

	yycheck_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,   -1,   -1,   -1,   67,   68,   69,   70,   -1,
			   -1,   -1,    3,    4,    5,    6,    7,    8,    6,   10,
			   -1,   -1,   10,   11,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   21,   -1,   -1,   24,   -1,   -1,   27,
			   28,   29,   30,   34,  106,  107,   -1,   -1,   36,   -1,
			   38,  113,  114,    9,   42,   43,  118,    6,  120,   -1,
			  122,   10,   11,   -1,   -1,  127,  128,   55,   56,   -1,
			   61,   -1,   21,   -1,   -1,   24,   64,   65,   66,   67,
			   68,   69,   70,   -1,   -1,   -1,   -1,   36,   -1,   38,
			    9,   -1,   -1,   42,   -1,   -1,   -1,   -1,   -1,    3,

			    4,    5,    6,    7,    8,   -1,   10,   56,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,  106,  107,   -1,   67,   68,
			   69,   70,   -1,    9,  115,   -1,   -1,  115,   -1,   -1,
			   34,   -1,  120,   -1,  122,   -1,  124,  125,   -1,    9,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,  109,  110,  111,  112,   61,    9,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,  115,  123,   -1,   -1,
			   -1,  120,   -1,  122,   60,  124,    9,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
			  109,  110,  111,  112,   -1,   -1,   47,   -1,   -1,   -1, yyDummy>>,
			1, 200, 1000)
		end

	yycheck_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   -1,   -1,  106,  107,  123,    9,   -1,   -1,   -1,   -1,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,  109,  110,  111,  112,   60,   -1,    9,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  112,   -1,   -1,   96,   97,   98,   99,  100,
			  101,  102,  103,  104,  105,  106,  107,  108,  109,  110,
			  111,  112,   66,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,  109,  110,  111,  112,
			   60,    9,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   96,   97,   98,   99,  100,  101,  102,  103,

			  104,  105,  106,  107,  108,  109,  110,  111,  112,    9,
			   -1,   -1,   -1,   -1,   -1,   -1,   96,   97,   98,   99,
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  112,   -1,   -1,   -1,   -1,   -1,   25,   26,
			   -1,   -1,   -1,   -1,   -1,   -1,   33,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   44,   -1,   46,
			   -1,   -1,   49,   50,   -1,   -1,   -1,   54,   96,   97,
			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,  109,  110,  111,  112,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   97,   98,   99, yyDummy>>,
			1, 200, 1200)
		end

	yycheck_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			  100,  101,  102,  103,  104,  105,  106,  107,  108,  109,
			  110,  111,  112,  100,   77,   78,   79,   80,   81,   82,
			   83,   84,   85,   86,   87,   88,   89,   90,   91,   92,
			   93,   94, yyDummy>>,
			1, 32, 1400)
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

	yyvs2: SPECIAL [CHARACTER]
			-- Stack for semantic values of type CHARACTER

	yyvsc2: INTEGER
			-- Capacity of semantic value stack `yyvs2'

	yyvsp2: INTEGER
			-- Top of semantic value stack `yyvs2'

	yyspecial_routines2: KL_SPECIAL_ROUTINES [CHARACTER]
			-- Routines that ought to be in SPECIAL [CHARACTER]

	yyvs3: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs4: SPECIAL [DOUBLE]
			-- Stack for semantic values of type DOUBLE

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [DOUBLE]
			-- Routines that ought to be in SPECIAL [DOUBLE]

	yyvs5: SPECIAL [detachable STRING]
			-- Stack for semantic values of type detachable STRING

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [detachable STRING]
			-- Routines that ought to be in SPECIAL [detachable STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER = 580
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 129
			-- Number of tokens

	yyLast: INTEGER = 1431
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 361
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 256
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute
			-- Parse Eiffel files `arguments (1..argument_count)'.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
		do
			make
			n := Arguments.argument_count
			if n = 0 then
				std.error.put_string ("usage: eiffel_parser filename ...%N")
				Exceptions.die (1)
			else
				from j := 1 until j > n loop
					a_filename := Arguments.argument (j)
					create a_file.make (a_filename)
					a_file.open_read
					if a_file.is_open_read then
						reset
						set_input_buffer (new_file_buffer (a_file))
						parse
						a_file.close
					else
						std.error.put_string ("eiffel_parser: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
					end
					j := j + 1
				end
			end
		end

	benchmark
			-- Parse Eiffel file `argument (2)' `argument (1)' times.
		local
			j, n: INTEGER
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
		do
			make
			if
				Arguments.argument_count < 2 or else
				not Arguments.argument (1).is_integer
			then
				std.error.put_string ("usage: eiffel_parser nb filename%N")
				Exceptions.die (1)
			else
				n := Arguments.argument (1).to_integer
				a_filename := Arguments.argument (2)
				from j := 1 until j > n loop
					create a_file.make (a_filename)
					a_file.open_read
					if a_file.is_open_read then
						reset
						set_input_buffer (new_file_buffer (a_file))
						parse
						a_file.close
					else
						std.error.put_string ("eiffel_parser: cannot read %'")
						std.error.put_string (a_filename)
						std.error.put_string ("%'%N")
						Exceptions.die (1)
					end
					j := j + 1
				end
			end
		end

feature -- Error handling

	report_error (a_message: STRING)
			-- Print error message.
		do
			if attached {YY_FILE_BUFFER} input_buffer as f_buffer then
				std.error.put_string (f_buffer.file.name)
				std.error.put_string (", line ")
			else
				std.error.put_string ("line ")
			end
			std.error.put_integer (eif_lineno)
			std.error.put_string (": ")
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

end
