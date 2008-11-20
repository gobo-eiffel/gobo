indexing

	description:

		"Eiffel parsers"

	copyright: "Copyright (c) 1999-2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
				yyvs2.put (last_character_value, yyvsp2)
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
				yyvs4.put (last_double_value, yyvsp4)
			when 5 then
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
				yyvs5.put (last_string_value, yyvsp5)
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
		do
			inspect yy_act
when 1 then
--|#line 75 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 75")
end


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
when 2 then
--|#line 76 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 76")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 3 then
--|#line 79 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 79")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 8
	yyvsp1 := yyvsp1 -7
	yyvs1.put (yyval1, yyvsp1)
end
when 4 then
--|#line 81 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 81")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 5 then
--|#line 84 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 84")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 6 then
--|#line 89 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 89")
end


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
when 7 then
--|#line 90 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 90")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 8 then
--|#line 93 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 93")
end


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
when 9 then
--|#line 94 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 94")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 10 then
--|#line 95 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 95")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 11 then
--|#line 98 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 98")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 12 then
--|#line 99 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 99")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 13 then
--|#line 100 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 100")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 14 then
--|#line 101 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 101")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 15 then
--|#line 104 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 104")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 16 then
--|#line 105 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 105")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 17 then
--|#line 108 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 108")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 18 then
--|#line 109 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 109")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 19 then
--|#line 112 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 112")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 20 then
--|#line 113 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 113")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 21 then
--|#line 116 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 116")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 22 then
--|#line 117 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 117")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 23 then
--|#line 122 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 122")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 24 then
--|#line 125 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 125")
end


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
when 25 then
--|#line 126 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 126")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 26 then
--|#line 127 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 127")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 27 then
--|#line 128 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 128")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 28 then
--|#line 133 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 133")
end


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
when 29 then
--|#line 134 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 134")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 30 then
--|#line 137 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 137")
end


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
when 31 then
--|#line 138 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 138")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 32 then
--|#line 139 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 139")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 33 then
--|#line 142 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 142")
end


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
when 34 then
--|#line 143 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 143")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 35 then
--|#line 145 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 145")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 36 then
--|#line 148 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 148")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 37 then
--|#line 153 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 153")
end


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
when 38 then
--|#line 154 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 154")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 39 then
--|#line 159 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 159")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 40 then
--|#line 162 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 162")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 41 then
--|#line 163 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 163")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 42 then
--|#line 164 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 164")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 43 then
--|#line 165 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 165")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 44 then
--|#line 167 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 167")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 45 then
--|#line 168 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 168")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 46 then
--|#line 179 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 179")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 47 then
--|#line 180 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 180")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 48 then
--|#line 181 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 181")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 49 then
--|#line 182 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 182")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 50 then
--|#line 183 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 183")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 51 then
--|#line 186 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 186")
end


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
when 52 then
--|#line 187 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 187")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 53 then
--|#line 190 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 190")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 54 then
--|#line 192 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 192")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 55 then
--|#line 193 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 193")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 56 then
--|#line 194 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 194")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 57 then
--|#line 195 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 195")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 58 then
--|#line 201 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 201")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -5
	yyvs1.put (yyval1, yyvsp1)
end
when 59 then
--|#line 205 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 205")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 60 then
--|#line 209 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 209")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 61 then
--|#line 212 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 212")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 62 then
--|#line 215 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 215")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 63 then
--|#line 220 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 220")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 64 then
--|#line 221 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 221")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 65 then
--|#line 224 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 224")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 66 then
--|#line 225 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 225")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 67 then
--|#line 230 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 230")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 68 then
--|#line 233 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 233")
end


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
when 69 then
--|#line 234 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 234")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 70 then
--|#line 237 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 237")
end


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
when 71 then
--|#line 238 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 238")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 72 then
--|#line 239 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 239")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 73 then
--|#line 242 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 242")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 74 then
--|#line 243 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 243")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 75 then
--|#line 244 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 244")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 76 then
--|#line 247 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 247")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 77 then
--|#line 250 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 250")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 78 then
--|#line 251 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 251")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 79 then
--|#line 254 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 254")
end


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
when 80 then
--|#line 255 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 255")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 81 then
--|#line 256 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 256")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 82 then
--|#line 261 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 261")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 83 then
--|#line 264 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 264")
end


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
when 84 then
--|#line 265 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 265")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 85 then
--|#line 268 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 268")
end


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
when 86 then
--|#line 269 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 269")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 87 then
--|#line 270 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 270")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 88 then
--|#line 275 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 275")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 89 then
--|#line 278 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 278")
end


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
when 90 then
--|#line 279 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 279")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 91 then
--|#line 282 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 282")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 92 then
--|#line 285 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 285")
end


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
when 93 then
--|#line 286 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 286")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 94 then
--|#line 289 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 289")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 95 then
--|#line 292 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 292")
end


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
when 96 then
--|#line 293 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 293")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 97 then
--|#line 298 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 298")
end


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
when 98 then
--|#line 299 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 299")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 99 then
--|#line 302 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 302")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 100 then
--|#line 303 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 303")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 101 then
--|#line 306 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 306")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 102 then
--|#line 308 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 308")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 103 then
--|#line 313 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 313")
end


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
when 104 then
--|#line 314 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 314")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 105 then
--|#line 315 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 315")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 106 then
--|#line 320 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 320")
end


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
when 107 then
--|#line 321 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 321")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 108 then
--|#line 324 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 324")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 109 then
--|#line 325 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 325")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 110 then
--|#line 328 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 328")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 111 then
--|#line 333 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 333")
end


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
when 112 then
--|#line 334 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 334")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 113 then
--|#line 335 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 335")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 114 then
--|#line 338 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 338")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 115 then
--|#line 339 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 339")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 116 then
--|#line 340 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 340")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 117 then
--|#line 345 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 345")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 118 then
--|#line 348 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 348")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 119 then
--|#line 351 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 351")
end


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
when 120 then
--|#line 352 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 352")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 121 then
--|#line 355 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 355")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 122 then
--|#line 356 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 356")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 123 then
--|#line 357 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 357")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 124 then
--|#line 362 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 362")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 125 then
--|#line 363 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 363")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 126 then
--|#line 366 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 366")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 127 then
--|#line 367 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 367")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 128 then
--|#line 372 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 372")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 129 then
--|#line 373 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 373")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 130 then
--|#line 374 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 374")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 131 then
--|#line 377 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 377")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 132 then
--|#line 378 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 378")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 133 then
--|#line 379 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 379")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 134 then
--|#line 380 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 380")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 135 then
--|#line 383 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 383")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 136 then
--|#line 384 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 384")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 137 then
--|#line 385 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 385")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 138 then
--|#line 386 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 386")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 139 then
--|#line 387 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 387")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 140 then
--|#line 388 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 388")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 141 then
--|#line 389 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 389")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 142 then
--|#line 390 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 390")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 143 then
--|#line 391 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 391")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 144 then
--|#line 392 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 392")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 145 then
--|#line 393 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 393")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 146 then
--|#line 394 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 394")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 147 then
--|#line 395 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 395")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 148 then
--|#line 396 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 396")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 149 then
--|#line 397 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 397")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 150 then
--|#line 398 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 398")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 151 then
--|#line 399 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 399")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 152 then
--|#line 400 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 400")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 153 then
--|#line 405 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 405")
end


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
when 154 then
--|#line 406 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 406")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 155 then
--|#line 409 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 409")
end


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
when 156 then
--|#line 410 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 410")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 157 then
--|#line 411 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 411")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 158 then
--|#line 414 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 414")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 159 then
--|#line 415 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 415")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 160 then
--|#line 416 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 416")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 161 then
--|#line 419 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 419")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 162 then
--|#line 422 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 422")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 163 then
--|#line 423 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 423")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 164 then
--|#line 426 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 426")
end


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
when 165 then
--|#line 427 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 427")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 166 then
--|#line 432 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 432")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyvs1.put (yyval1, yyvsp1)
end
when 167 then
--|#line 440 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 440")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 168 then
--|#line 441 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 441")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 169 then
--|#line 442 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 442")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 170 then
--|#line 443 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 443")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 171 then
--|#line 446 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 446")
end


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
when 172 then
--|#line 447 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 447")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 173 then
--|#line 452 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 452")
end


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
when 174 then
--|#line 453 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 453")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 175 then
--|#line 458 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 458")
end


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
when 176 then
--|#line 459 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 459")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 177 then
--|#line 460 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 460")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 178 then
--|#line 463 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 463")
end


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
when 179 then
--|#line 464 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 464")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 180 then
--|#line 465 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 465")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 181 then
--|#line 468 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 468")
end


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
when 182 then
--|#line 469 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 469")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 183 then
--|#line 472 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 472")
end


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
when 184 then
--|#line 473 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 473")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 185 then
--|#line 474 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 474")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 186 then
--|#line 477 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 477")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 187 then
--|#line 478 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 478")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 188 then
--|#line 479 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 479")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 189 then
--|#line 482 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 482")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 190 then
--|#line 486 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 486")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 191 then
--|#line 492 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 492")
end


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
when 192 then
--|#line 493 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 493")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 193 then
--|#line 498 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 498")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 194 then
--|#line 499 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 499")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 195 then
--|#line 500 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 500")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 196 then
--|#line 501 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 501")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 197 then
--|#line 502 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 502")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 198 then
--|#line 503 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 503")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 199 then
--|#line 504 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 504")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 200 then
--|#line 507 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 507")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 201 then
--|#line 510 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 510")
end


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
when 202 then
--|#line 513 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 513")
end


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
when 203 then
--|#line 514 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 514")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 204 then
--|#line 517 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 517")
end


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
when 205 then
--|#line 518 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 518")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 206 then
--|#line 519 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 519")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 207 then
--|#line 524 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 524")
end


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
when 208 then
--|#line 525 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 525")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 209 then
--|#line 528 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 528")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 210 then
--|#line 529 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 529")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 211 then
--|#line 532 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 532")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 212 then
--|#line 533 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 533")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 213 then
--|#line 534 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 534")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 214 then
--|#line 535 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 535")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 215 then
--|#line 536 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 536")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 216 then
--|#line 537 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 537")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 217 then
--|#line 538 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 538")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 218 then
--|#line 539 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 539")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 219 then
--|#line 540 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 540")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 220 then
--|#line 541 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 541")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 221 then
--|#line 543 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 543")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 222 then
--|#line 548 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 548")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 223 then
--|#line 549 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 549")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 224 then
--|#line 552 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 552")
end


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
when 225 then
--|#line 553 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 553")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 226 then
--|#line 558 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 558")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -5
	yyvs1.put (yyval1, yyvsp1)
end
when 227 then
--|#line 559 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 559")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 228 then
--|#line 562 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 562")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 229 then
--|#line 567 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 567")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 230 then
--|#line 570 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 570")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 231 then
--|#line 571 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 571")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 232 then
--|#line 576 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 576")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyvs1.put (yyval1, yyvsp1)
end
when 233 then
--|#line 579 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 579")
end


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
when 234 then
--|#line 580 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 580")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 235 then
--|#line 583 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 583")
end


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
when 236 then
--|#line 584 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 584")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 237 then
--|#line 585 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 585")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 238 then
--|#line 590 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 590")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 239 then
--|#line 593 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 593")
end


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
when 240 then
--|#line 594 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 594")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 241 then
--|#line 595 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 595")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 242 then
--|#line 598 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 598")
end


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
when 243 then
--|#line 599 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 599")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 244 then
--|#line 600 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 600")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 245 then
--|#line 603 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 603")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 246 then
--|#line 604 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 604")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 247 then
--|#line 607 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 607")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 248 then
--|#line 608 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 608")
end


if yy_parsing_status >= yyContinue then
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
when 249 then
--|#line 609 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 609")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 250 then
--|#line 614 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 614")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 9
	yyvsp1 := yyvsp1 -8
	yyvs1.put (yyval1, yyvsp1)
end
when 251 then
--|#line 618 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 618")
end


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
when 252 then
--|#line 619 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 619")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 253 then
--|#line 620 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 620")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 254 then
--|#line 621 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 621")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 255 then
--|#line 626 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 626")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 256 then
--|#line 629 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 629")
end


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
when 257 then
--|#line 630 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 630")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 258 then
--|#line 633 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 633")
end


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
when 259 then
--|#line 634 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 634")
end


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
when 260 then
--|#line 635 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 635")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 261 then
--|#line 640 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 640")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 262 then
--|#line 645 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 645")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 263 then
--|#line 646 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 646")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 264 then
--|#line 647 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 647")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 265 then
--|#line 648 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 648")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 266 then
--|#line 649 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 649")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 267 then
--|#line 650 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 650")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 268 then
--|#line 653 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 653")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 269 then
--|#line 654 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 654")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyvs1.put (yyval1, yyvsp1)
end
when 270 then
--|#line 656 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 656")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyvs1.put (yyval1, yyvsp1)
end
when 271 then
--|#line 657 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 657")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 7
	yyvsp1 := yyvsp1 -6
	yyvs1.put (yyval1, yyvsp1)
end
when 272 then
--|#line 666 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 666")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 273 then
--|#line 667 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 667")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 274 then
--|#line 672 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 672")
end


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
when 275 then
--|#line 673 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 673")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 276 then
--|#line 676 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 676")
end


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
when 277 then
--|#line 677 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 677")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 278 then
--|#line 678 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 678")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 279 then
--|#line 681 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 681")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 280 then
--|#line 682 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 682")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 281 then
--|#line 685 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 685")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 282 then
--|#line 686 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 686")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 283 then
--|#line 687 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 687")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 284 then
--|#line 691 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 691")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 285 then
--|#line 694 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 694")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 286 then
--|#line 695 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 695")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 287 then
--|#line 700 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 700")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 288 then
--|#line 701 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 701")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 289 then
--|#line 702 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 702")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 290 then
--|#line 703 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 703")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 291 then
--|#line 704 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 704")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 292 then
--|#line 705 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 705")
end


if yy_parsing_status >= yyContinue then
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
when 293 then
--|#line 706 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 706")
end


if yy_parsing_status >= yyContinue then
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
when 294 then
--|#line 707 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 707")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
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
when 295 then
--|#line 708 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 708")
end


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
when 296 then
--|#line 709 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 709")
end


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
when 297 then
--|#line 710 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 710")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 298 then
--|#line 711 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 711")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 299 then
--|#line 712 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 712")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 300 then
--|#line 713 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 713")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 301 then
--|#line 714 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 714")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 302 then
--|#line 715 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 715")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp5 := yyvsp5 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 303 then
--|#line 716 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 716")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 304 then
--|#line 717 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 717")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 305 then
--|#line 718 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 718")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 306 then
--|#line 719 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 719")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 307 then
--|#line 720 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 720")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 308 then
--|#line 721 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 721")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 309 then
--|#line 722 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 722")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 310 then
--|#line 723 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 723")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 311 then
--|#line 724 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 724")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 312 then
--|#line 725 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 725")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 313 then
--|#line 726 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 726")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 314 then
--|#line 727 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 727")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 315 then
--|#line 728 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 728")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 316 then
--|#line 729 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 729")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 317 then
--|#line 730 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 730")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 318 then
--|#line 731 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 731")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 319 then
--|#line 732 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 732")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 320 then
--|#line 733 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 733")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 321 then
--|#line 734 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 734")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 322 then
--|#line 735 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 735")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 323 then
--|#line 736 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 736")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 324 then
--|#line 738 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 738")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 325 then
--|#line 739 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 739")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 326 then
--|#line 740 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 740")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 327 then
--|#line 747 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 747")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 328 then
--|#line 748 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 748")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 329 then
--|#line 749 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 749")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 330 then
--|#line 750 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 750")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 331 then
--|#line 751 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 751")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -3
	yyvs1.put (yyval1, yyvsp1)
end
when 332 then
--|#line 752 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 752")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 333 then
--|#line 753 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 753")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 334 then
--|#line 756 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 756")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 335 then
--|#line 759 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 759")
end


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
when 336 then
--|#line 760 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 760")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 337 then
--|#line 763 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 763")
end


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
when 338 then
--|#line 764 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 764")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 339 then
--|#line 765 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 765")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 340 then
--|#line 768 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 768")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 341 then
--|#line 769 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 769")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 342 then
--|#line 770 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 770")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 343 then
--|#line 775 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 775")
end


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
when 344 then
--|#line 776 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 776")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 345 then
--|#line 777 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 777")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 346 then
--|#line 780 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 780")
end


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
when 347 then
--|#line 781 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 781")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 348 then
--|#line 782 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 782")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyvs1.put (yyval1, yyvsp1)
end
when 349 then
--|#line 785 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 785")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 350 then
--|#line 786 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 786")
end


if yy_parsing_status >= yyContinue then
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
when 351 then
--|#line 787 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 787")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 352 then
--|#line 788 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 788")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 353 then
--|#line 789 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 789")
end


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
when 354 then
--|#line 790 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 790")
end


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
when 355 then
--|#line 793 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 793")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 356 then
--|#line 794 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 794")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvs1.put (yyval1, yyvsp1)
end
when 357 then
--|#line 797 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 797")
end


if yy_parsing_status >= yyContinue then
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
when 358 then
--|#line 798 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 798")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 359 then
--|#line 799 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 799")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 360 then
--|#line 802 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 802")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp4 := yyvsp4 -1
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
when 361 then
--|#line 803 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 803")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 362 then
--|#line 804 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 804")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp4 := yyvsp4 -1
	yyvs1.put (yyval1, yyvsp1)
end
when 363 then
--|#line 807 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 807")
end


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
when 364 then
--|#line 808 "eiffel_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'eiffel_parser.y' at line 808")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
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
			when 573 then
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
			    2,    2,    2,  123,    2,    2,  125,    2,    2,    2,
			  121,  122,  107,  105,  116,  106,  124,  108,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,  115,  114,
			  101,   99,  102,  126,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,  117,    2,  118,  111,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,  119,    2,  120,  127,    2,    2,    2,
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
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   38,   39,   40,   41,   42,   43,   44,

			   45,   46,   47,   48,   49,   50,   51,   52,   53,   54,
			   55,   56,   57,   58,   59,   60,   61,   62,   63,   64,
			   65,   66,   67,   68,   69,   70,   71,   72,   73,   74,
			   75,   76,   77,   78,   79,   80,   81,   82,   83,   84,
			   85,   86,   87,   88,   89,   90,   91,   92,   93,   94,
			   95,   96,   97,   98,  100,  103,  104,  109,  110,  112,
			  113, yyDummy>>)
		end

	yyr1_template: SPECIAL [INTEGER] is
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,  128,  128,  129,  129,  138,  130,  130,  139,  139,
			  139,  140,  140,  140,  140,  142,  142,  143,  143,  145,
			  145,  141,  141,  131,  147,  147,  147,  147,  132,  132,
			  148,  148,  148,  149,  149,  149,  151,  133,  133,  137,
			  153,  153,  153,  153,  153,  153,  154,  154,  154,  154,
			  154,  155,  155,  156,  156,  156,  156,  156,  157,  158,
			  159,  160,  161,  162,  162,  171,  171,  167,  163,  163,
			  173,  173,  173,  174,  174,  174,  175,  177,  177,  178,
			  178,  178,  176,  180,  180,  179,  179,  179,  169,  165,
			  165,  168,  164,  164,  170,  166,  166,  134,  134,  181,

			  181,  182,  182,  152,  152,  152,  135,  135,  183,  183,
			  184,  185,  185,  185,  186,  186,  186,  187,  189,  192,
			  192,  193,  193,  193,  188,  188,  195,  195,  172,  172,
			  172,  196,  196,  196,  196,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  190,  190,  198,  198,  198,  199,  199,
			  199,  200,  201,  201,  191,  191,  194,  205,  205,  205,
			  205,  209,  209,  204,  204,  203,  203,  203,  206,  206,
			  206,  136,  136,  210,  210,  210,  211,  211,  211,  212,
			  212,  207,  207,  202,  202,  202,  202,  202,  202,  202,

			  150,  215,  216,  216,  217,  217,  217,  208,  208,  218,
			  218,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  220,  220,  230,  230,  228,  228,  232,  222,
			  233,  233,  223,  235,  235,  234,  234,  234,  224,  236,
			  236,  236,  237,  237,  237,  238,  238,  239,  239,  239,
			  225,  240,  240,  240,  240,  226,  241,  241,  242,  242,
			  242,  227,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  243,  243,  231,  231,  244,  244,  244,  245,
			  245,  246,  246,  246,  246,  229,  229,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  213,  213,  250,  250,  250,
			  250,  250,  250,  250,  251,  252,  252,  253,  253,  253,
			  254,  254,  254,  249,  249,  249,  248,  248,  248,  146,
			  146,  146,  146,  146,  146,  247,  247,  214,  214,  214,
			  255,  255,  255,  144,  144, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER] is
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    5,    5,    5,    4,    3,    2,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    4,    3,    4,    3,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    5,    1,    1,    1,    1,    1,    1,    1,    5,    1,
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
			    1,    1,    5,    5,    5,    4,    3,    2,    1,    1,
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

			    1,    1,    1,    1,    1,    1,    5,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    5,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    1,    1,    1,    1,    1,    5,    1,
			    1,    1,    1,    1,    2,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    5,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER] is
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
			    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER] is
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    1,    6,    8,    2,   24,    0,    0,  355,  356,  364,
			  354,  353,  363,  360,  357,  350,    7,    9,   11,   15,
			   19,   17,   20,  351,  349,  352,   27,   26,   25,   28,
			    0,  361,  358,  362,  359,   21,   10,   12,    0,    0,
			   30,   37,    0,   21,    0,   13,   22,   19,   18,   16,
			   33,    0,    0,   97,   23,   14,    0,   31,   29,    0,
			   38,   83,   97,   83,  106,    4,   98,   99,  201,   34,
			  202,   33,   85,   84,  103,  106,    0,   46,   39,   51,
			  103,   83,  181,  107,  108,  100,  103,   35,  204,  200,
			   32,   86,    0,  104,  102,  181,   40,   79,   79,   64,

			   79,   70,   97,   97,   52,   53,   54,   55,   56,   57,
			   68,   92,   89,   95,    0,  101,  111,  183,    0,  109,
			    0,    0,    0,    0,    0,  193,  205,    0,   82,    0,
			    0,    5,    0,    0,  128,   80,   91,   94,   63,    0,
			   88,   67,   71,   73,   79,   97,    0,   49,   97,    0,
			   47,   92,   69,   89,   93,   95,   90,    0,   96,   62,
			    0,  126,  110,  112,  114,  153,  124,    0,    0,    0,
			    0,  346,    0,    0,    0,    0,    0,  274,  288,  289,
			    0,  346,    0,  296,  295,  294,  293,  292,  274,  182,
			  184,  186,  189,  287,  324,  262,  291,  325,  333,    3,

			   36,  195,  196,  197,  194,    0,    0,  199,  198,  203,
			    0,   87,  105,  131,  134,  133,  132,  129,  152,  150,
			  149,  147,  151,  148,  146,  145,  144,  143,  142,  141,
			  140,  139,  138,  137,  136,  135,  130,    0,    0,    0,
			   72,   74,   78,   76,   77,    0,   50,   42,    0,   48,
			   41,   89,   95,    0,   61,  127,  113,  115,  155,    0,
			  117,  164,  335,  332,  274,    0,    0,  347,    0,  322,
			  300,  299,  298,    0,  276,    0,  266,    0,  329,    0,
			  328,  343,    0,  301,  190,  272,  327,  185,  187,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,  206,   81,
			    0,   65,   75,   45,   44,   95,    0,   60,  116,  162,
			    0,  156,  158,    0,  125,    0,  119,  337,  334,  290,
			    0,  326,    0,    0,    0,  279,    0,  277,    0,    0,
			  274,  263,  264,  344,    0,  297,  188,  307,  309,  308,
			  306,  305,  304,  303,  315,  314,  313,  312,  311,  310,
			    0,  316,  318,    0,  317,  321,  302,  274,    0,    0,
			   59,  154,  157,  159,    0,    0,  165,   37,  118,  342,
			    0,  340,    0,  338,    0,  330,  274,  331,  348,  224,
			    0,  283,  282,  281,  280,  275,    0,  274,  267,  323,

			    0,  319,  320,  273,   66,   58,  160,  163,  161,  122,
			  175,  121,  120,  123,    0,  336,    0,  265,  268,    0,
			  228,    0,  278,  270,  345,  183,  173,  341,  339,    0,
			  274,  284,    0,  183,  176,  155,    0,  269,  225,  271,
			  177,  174,  207,    0,  207,  167,  178,    0,    0,    0,
			  220,    0,  286,    0,  219,    0,    0,  207,  256,  183,
			    0,  285,  169,  208,  209,  211,  212,  213,  214,  215,
			  216,  217,  218,  221,    0,  171,  168,  183,  191,    0,
			    0,    0,    0,  286,  285,  224,  239,    0,  181,  258,
			  207,    0,  224,  210,  231,  230,    0,    0,  170,  183,

			  179,  207,    0,    0,    0,    0,    0,  227,  242,  233,
			  207,  251,  259,    0,    0,  261,  223,  229,  172,  180,
			  192,  166,  224,    0,  248,  249,  247,    0,  243,  245,
			  242,  207,    0,  235,  252,    0,  257,    0,  255,  222,
			  224,    0,  207,    0,    0,  234,  238,    0,  233,  274,
			  253,    0,  260,  226,  244,  240,  246,  207,    0,    0,
			    0,    0,    0,  241,  207,    0,  232,  254,  207,  236,
			  207,    0,  237,  250,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER] is
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			    1,    3,    4,   29,   41,   53,   75,   82,  118,   65,
			   76,   16,   17,   36,   18,   19,  264,   21,   22,   30,
			   51,   57,  125,   87,   94,   78,   79,  103,  104,  105,
			  106,  107,  108,  109,  110,  151,  153,  155,  157,  111,
			  154,  156,  158,  138,  135,  141,  142,  143,   73,  243,
			  136,   92,   74,   66,   67,   83,   84,  162,  163,  164,
			  165,  260,  261,  326,  378,  412,  413,  166,  217,  236,
			  320,  321,  322,  323,  126,  426,  436,  446,  478,  502,
			  462,  498,  189,  190,  191,  192,   23,   70,   89,  127,
			  463,  464,  465,  193,  467,  468,  469,  470,  471,  472,

			  473,  474,  420,  285,  194,  496,  548,  532,  509,  527,
			  528,  529,  535,  490,  513,  195,  336,  381,  394,  196,
			  268,  344,  197,  198,  328,  382,  383,   25, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER] is
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,   16,  980, -32768,   77,  363,  357, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  732, -32768,  399,
			  408, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,  405,
			  495, -32768, -32768, -32768, -32768,  619,  402, -32768,  980,  980,
			   55,  470,   55, -32768,  459, -32768, -32768, -32768, -32768,  399,
			  493,  165,  507,  171, -32768, -32768,  490, -32768, -32768,   55,
			 -32768,  353,   76,  353,  468, -32768,   54, -32768, -32768,  443,
			  394,  493,   55, -32768,   55,  468,  480, -32768, -32768,  352,
			   55,  353,  354,  468, -32768, -32768,   55, -32768,  300, -32768,
			 -32768, -32768,  182, -32768,  386,  354, -32768,  183,  183,  183,

			  183,  353,  186,   12, -32768, -32768, -32768, -32768, -32768, -32768,
			  466,  428,  417,  395,  475,  386,  346,  933,  471, -32768,
			  -12,  490,  141,  490,   97, -32768, -32768,  108, -32768,   55,
			   55, -32768,  235, 1313, -32768, -32768,  358,  358,  379,  474,
			  358, -32768,  246, -32768,  329,   76,  463, -32768,   76,  462,
			 -32768,  428, -32768,  417, -32768,  395, -32768,  448, -32768, -32768,
			  183, -32768, -32768,  181, -32768,  -28, -32768,  183,  311,  933,
			  300,  933,  933,  933,  933,  933,  359,   94,  278,  227,
			  366,  933,  933, -32768, -32768, -32768, -32768, -32768,  155, -32768,
			  849, -32768, 1205, -32768, -32768,  302, -32768, -32768, -32768, -32768,

			 -32768, -32768, -32768, -32768, -32768,  472,  469, -32768, -32768, -32768,
			  300, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  183,  183,  183,
			  353, -32768, -32768, -32768,  358,  442, -32768, -32768,  441, -32768,
			 -32768,  417,  395,  431, -32768, -32768,  346, -32768,   55,  346,
			 -32768,  344,  335, -32768,  209, 1067,  333, 1205,   48, -32768,
			 -32768, -32768, -32768,  300,  683,  300,  330,   55, -32768,   55,
			 -32768,   55,   -4, -32768, -32768, -32768, -32768,  933, -32768,  933,
			  933,  933,  933,  933,  933,  933,  933,  933,  933,  933,

			  933,  933,  808,  933,  767,  933,  933,   55, -32768, -32768,
			  432, -32768, -32768, -32768, -32768,  395,  419, -32768, -32768, -32768,
			  328,   -1, -32768,  225, -32768,  300,  403,  642, -32768,  189,
			  -41, -32768,  933,  326,   69, 1205,  187, -32768,  323,   55,
			  303,  302,  302, -32768,  168, -32768, -32768,    5,    5,    5,
			    5,    5,   30,   30,  283,  283,  283,  283,  283,  283,
			  933, 1277, 1258,  933, 1258, 1244, -32768,  303,  183,  412,
			 -32768, -32768,   55, -32768,   55,  300, -32768,  339, -32768,  311,
			  300, -32768,  164, -32768,   55, -32768,  303, -32768, 1205,  -34,
			  933, -32768, -32768, -32768, -32768, -32768,  683,  303,  302, -32768,

			   55, 1277, 1258, -32768, -32768, -32768, -32768, -32768, -32768, -32768,
			  383, -32768, -32768, -32768,  315, -32768,  642,  302,  310,   55,
			 -32768, 1038, -32768,  308, -32768,  601,  382,  -41, -32768,   55,
			  303, -32768,   55,  933, -32768,   55,  240,  302, -32768,  302,
			 -32768, -32768, 1006,  415, 1006, -32768,  391,  300,  933,  300,
			 -32768,    2,  295,  292, -32768,  933,  933, 1006,  293,  933,
			   20,  968, -32768, 1006, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768,  255,  393, -32768,  476,  356,  286,
			  999,  280,  300, -32768, -32768,  -34, 1225, 1174,  354,  373,
			 1006,  349,  -34, -32768, -32768, -32768,  933,  369, -32768,  933,

			 -32768, 1006,  334,   20,  199,  282,  195, -32768,   19,   67,
			 1006,  237, -32768,  100,  262, -32768, -32768, 1205, -32768, -32768,
			 -32768, -32768,  -34,   20, -32768, -32768, -32768,   15, -32768,  229,
			   19, 1006,  205,  169,  933,  122, -32768,  126, -32768, -32768,
			  -34,   19, 1006,   19,  -11, -32768, -32768,  933,  232,   28,
			 1205,  933, -32768, -32768, -32768, -32768, -32768, 1006, 1121,  933,
			   51,  933, 1141, -32768, 1006, 1102, -32768, 1205, 1006, -32768,
			 1006,   34, -32768, -32768,   32, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER] is
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			 -32768, -32768, -32768, -32768, -32768,  190,  508,  485,  -93, -32768,
			  159, -32768, -32768,  523,   41,  520,   -2,  519,  174, -32768,
			 -32768,  479,  451, -32768,  273, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768, -32768, -32768, -32768, -32768,  398, -133, -152,  438,
			  477,  473,  467, -32768,  -10, -32768, -32768,  -86,  -80, -32768,
			  106, -32768,   81, -32768,  481, -32768,  454, -32768, -32768, -139,
			 -32768, -32768, -32768, -32768, -32768, -32768, -32768,  279, -32768, -32768,
			   95, -32768, -280, -32768, -127, -32768, -32768, -32768, -32768, -32768,
			 -193, -32768, -181, -32768, -177, -122, -123, -32768, -32768, -32768,
			 -32768,   70, -32768, -243, -32768, -32768, -32768, -32768, -32768, -32768,

			 -32768, -432, -253, -167, -32768, -32768, -32768,  -17, -32768,   -3,
			  -15,  -18, -32768, -32768, -32768, -273, -32768, -267, -32768,   29,
			  343, -32768, -32768, -134, -32768, -32768,  104, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER] is
			-- Template for `yytable'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1406)
			yytable_template_1 (an_array)
			yytable_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yytable_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			   20,  208,  131,  253,  341,   12,  342,  337,   12,    9,
			  276,  345,    9,  288,  306,   20,  574,  200,   68,  485,
			  252,  144,  524,   14,  257,   12,   12,  386,  492,    9,
			    9,   24,  575,   20,  263,   63,   47,   47,   50,  306,
			   54,  373,   20,  266,  278,  280,   24,  265,  557,  267,
			  269,  270,  271,  272,  286,    2,  241,   71,   37,  267,
			  283,   12,  144,  573,   24,    9,  398,   24,   24,  483,
			   91,  522,   93,   24,  542,   12,   45,   63,   93,    9,
			  566,   61,   68,  308,   93,   55,  167,  483,  259,  139,
			  419,  540,  406,  258,  531,  134,  134,  134,  134,   63,

			  316,   14,   28,   12,  130,  541,  161,    9,   27,  133,
			  346,  417,  332,  372,  134,  188,  289,  318,  315,  132,
			  203,  482,  207,   61,  206,  205,  148,  211,  212,  422,
			  286,  541,  530,  552,   26,  392,  391,  293,  292,  291,
			  290,  289,  134,  561,   80,   61,  333,   12,  338,  274,
			  255,    9,  335,  161,  312,  167,  437,  262,  134,  439,
			  144,  134,  116,  369,  332,  134,  331,  347,  348,  349,
			  350,  351,  352,  353,  354,  355,  356,  357,  358,  359,
			  361,  362,  364,  365,  366,  551,  -43,   12,  188,   12,
			  390,    9,   68,    9,   63,  385,  387,  547,  376,  466,

			  403,  466,  206,  205,  137,  335,  140,  202,  -43,   63,
			  388,  -43,   62,  275,  466,  274,  537,  -43,  160,  418,
			  466,  133,  536,  133,  210,  -43,  209,  309,  310,  311,
			  423,  132,  507,  132,  546,  134,  134,  134,  401,  516,
			   61,  402,  543,  -43,  434,  263,  161,  466,  408,  161,
			  244,  476,  440,  414,  134,   61,  319,  134,  466,  531,
			  559,  146,  149,  438,  488,  445,  444,  466,  421,  539,
			  284,  495,  494,  443,  335,  340,  274,  340,  491,  343,
			  416,   59,  167,   58,  400,  188,  415,  553,  466,  442,
			  399,  538,  306,  387,  335,  256,  500,  514,  129,  466,

			  145,  534,  128,  396,  245,  367,   68,  248,  520,  395,
			  124,  216,  215,  384,  466,  523,  167,  533,  519,  319,
			  479,  466,  481,  384,  393,  466,  480,  466,  214,  213,
			  274,  123,  134,  486,  487,   12,  167,  340,  545,    9,
			  375,  374,   15,   14,   13,  122,   11,   10,  242,  555,
			  386,  279,   12,  115,  167,  506,    9,  121,  404,  120,
			  240,   34,   33,  521,  563,   72,  134,   32,   31,  133,
			  319,  569,  407,    8,  517,  571,  518,  572,  515,  132,
			  512,  102,  340,  160,  101,  526,  133,   52,  295,  294,
			  293,  292,  291,  290,  289,  511,  132,  117,  424,    7,

			  505,  409,  277,  100,   99,  167,   24,  526,   98,  503,
			  501,  497,  550,   97,  489,  286,  279,  430,  526,  277,
			  526,  477,  475,  188,  274,  558,  307,  340,  435,  562,
			  340,  188,  432,  319,  429,  427,  425,  565,  167,  567,
			  461,  405,  461,  397,    6,    5,  389,  377,  370,  484,
			  371,   98,  368,  330,  339,  461,  327,  188,  484,  325,
			  317,  461,   15,   14,   13,   12,   11,   10,  100,    9,
			  314,  313,   72,   34,  237,  188,   32,  254,  273,  187,
			  186,  185,   12,  184,  183,  182,    9,  281,  461,   97,
			  181,  250,  247,    8,  239,  238,   68,  188,  101,  461,

			  199,  484,  130,   81,  159,   56,  525,   69,  461,   96,
			    8,   88,   86,   77,   60,   38,   46,   42,   52,    7,
			  428,  484,   40,   39,  282,  556,  554,  544,  525,  461,
			  441,  560,  549,  493,  180,  499,    7,  119,  324,  525,
			  461,  525,  179,  178,  177,  176,  114,   85,  152,  251,
			   90,  411,  113,  147,  150,  461,  112,   48,   44,   49,
			   95,   64,  461,    0,    6,    5,  461,  410,  461,    0,
			    0,    0,  201,   46,  204,    0,    0,    0,    0,    0,
			    0,  175,  174,    0,    0,    0,    0,    0,  173,  172,
			    0,    0,    0,  171,    0,  170,  246,  169,    0,  249,

			    0,    0,  168,  167,  187,  186,  185,   12,  184,  183,
			  182,    9,    0,    0,    0,  181,    0,    0,    0,    0,
			    0,    0,   15,   14,   13,   12,   11,   10,  433,    9,
			    0,    0,    0,    0,    0,    8,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  187,  186,  185,   12,  184,
			  183,  182,    9,    8,    0,    0,  181,    0,    0,  180,
			    0,    7,    0,    0,    0,    0,    0,  179,  178,  177,
			  176,    0,    0,    0,    0,    0,    8,    0,    0,    7,
			    0,    0,    0,    0,    0,    0,  187,  186,  185,   12,
			  184,  183,  182,    9,    0,    0,    0,  181,    0,    0,

			  180,    0,    7,    0,    0,    0,  175,  174,  179,  178,
			  177,  176,    0,  173,  172,    0,    0,    8,  171,    0,
			  170,    0,  169,    0,    6,    5,    0,  168,  167,    0,
			    0,    0,    0,   43,    0,   15,   14,   13,   12,   11,
			   10,  180,    9,    7,    0,    0,    0,  175,  174,  179,
			  178,  177,  176,    0,  173,  172,    0,    0,    0,  171,
			    0,  380,    0,  169,    0,    0,    8,  334,  379,  167,
			  187,  186,  185,   12,  184,  183,  182,    9,    0,    0,
			    0,  181,    0,    0,    0,    0,    0,    0,  175,  174,
			    0,    0,    7,    0,  363,  173,  172,    0,    0,    0,

			  171,    8,  170,    0,  169,    0,    0,    0,  334,  168,
			  167,  187,  186,  185,   12,  184,  183,  182,    9,    0,
			    0,    0,  181,    0,    0,  180,    0,    7,    0,    0,
			    0,    0,    0,  179,  178,  177,  176,    6,    5,    0,
			    0,    0,    8,    0,    0,    0,   35,    0,    0,    0,
			    0,    0,  187,  186,  185,   12,  184,  183,  182,    9,
			    0,    0,    0,  181,    0,    0,  180,  360,    7,    0,
			    0,    0,  175,  174,  179,  178,  177,  176,    0,  173,
			  172,    0,    0,    8,  171,    0,  170,    0,  169,    0,
			    0,    0,    0,  168,  167,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,  180,    0,    7,
			    0,    0,    0,  175,  174,  179,  178,  177,  176,    0,
			  173,  172,    0,    0,    0,  171,    0,  170,    0,  169,
			    0,    0,    0,    0,  168,  167,  187,  186,  185,   12,
			  184,  183,  182,    9,    0,    0,    0,  181,    0,    0,
			    0,    0,    0,    0,  175,  174,    0,    0,    0,    0,
			    0,  173,  172,  287,    0,    0,  171,    8,  170,    0,
			  169,    0,    0,    0, -274,  168,  167,    0, -274, -274,
			    0,    0,    0,   15,   14,   13,   12,   11,   10, -274,
			    9,  180, -274,    7,    0, -274, -274, -274, -274,  179, yyDummy>>,
			1, 1000, 0)
		end

	yytable_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yytable'.
		do
			yyarray_subcopy (an_array, <<
			  178,  177,  176,    0, -274,    0, -274,    0,  306,    0,
			 -274, -274,   12,    0,    8,    0,    9,  460,    0,    0,
			    0,    0, -274, -274,    0,    0,    0,  459,    0,    0,
			  458, -274, -274, -274, -274, -274, -274, -274,  175,  174,
			    7,    0,  457,    0,  456,  173,  172,  306,  455,    0,
			  171,    0,  170,    0,  169,    0,    0,    0,    0,  168,
			  167,  454,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  453,  452,  177,  451,  306,    0,    0,    0,
			    0,    0, -274,    0,    0,    6,    5, -274,    0,  274,
			    0, -274, -274,    0,  305,  304,  303,  302,  301,  300,

			  299,  298,  297,  296,  295,  294,  293,  292,  291,  290,
			  289,  306,    0,    0,    0,    0,    0,    0,    0,    0,
			  450,  504,    0,    0,    0,  449,    0,  448,    0,  447,
			  306,    0,    0,  305,  304,  303,  302,  301,  300,  299,
			  298,  297,  296,  295,  294,  293,  292,  291,  290,  289,
			  306,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  431,  570,  305,  304,  303,  302,  301,  300,  299,  298,
			  297,  296,  295,  294,  293,  292,  291,  290,  289,    0,
			  564,    0,    0,  306,    0,    0,    0,    0,  568,  329,
			    0,    0,    0,    0,    0,    0,    0,  305,  304,  303,

			  302,  301,  300,  299,  298,  297,  296,  295,  294,  293,
			  292,  291,  290,  289,  306,    0,  305,  304,  303,  302,
			  301,  300,  299,  298,  297,  296,  295,  294,  293,  292,
			  291,  290,  289,  510,  306,    0,  305,  304,  303,  302,
			  301,  300,  299,  298,  297,  296,  295,  294,  293,  292,
			  291,  290,  289,  306,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  306,    0,  305,
			  304,  303,  302,  301,  300,  299,  298,  297,  296,  295,
			  294,  293,  292,  291,  290,  289,  306,    0,    0,    0,
			  508,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			  305,  304,  303,  302,  301,  300,  299,  298,  297,  296,
			  295,  294,  293,  292,  291,  290,  289,    0,    0,    0,
			  305,  304,  303,  302,  301,  300,  299,  298,  297,  296,
			  295,  294,  293,  292,  291,  290,  289,    0,    0,    0,
			  304,  303,  302,  301,  300,  299,  298,  297,  296,  295,
			  294,  293,  292,  291,  290,  289,  302,  301,  300,  299,
			  298,  297,  296,  295,  294,  293,  292,  291,  290,  289,
			    0,    0,    0,    0,    0,    0,  301,  300,  299,  298,
			  297,  296,  295,  294,  293,  292,  291,  290,  289,  235,
			  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,

			  224,  223,  222,  221,  220,  219,  218, yyDummy>>,
			1, 407, 1000)
		end

	yycheck_template: SPECIAL [INTEGER] is
			-- Template for `yycheck'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make (0, 1406)
			yycheck_template_1 (an_array)
			yycheck_template_2 (an_array)
			Result := yyfixed_array (an_array)
		end

	yycheck_template_1 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #1 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			    2,  124,   95,  155,  277,    6,  279,  274,    6,   10,
			  177,   15,   10,  190,    9,   17,    0,   29,    6,  451,
			  153,  101,    3,    4,  163,    6,    6,   68,  460,   10,
			   10,    2,    0,   35,  168,   23,   38,   39,   40,    9,
			   42,  321,   44,  170,  178,  179,   17,  169,   59,  171,
			  172,  173,  174,  175,  188,   39,  142,   59,   17,  181,
			  182,    6,  142,   29,   35,   10,  339,   38,   39,   67,
			   72,  503,   74,   44,   59,    6,   35,   23,   80,   10,
			   29,   69,    6,  210,   86,   44,  127,   67,  116,   99,
			  124,  523,  372,  121,   27,   97,   98,   99,  100,   23,

			  252,    4,   25,    6,  116,  116,  116,   10,   31,   40,
			  287,  384,  116,  114,  116,  117,  111,  256,  251,   50,
			  122,  119,  124,   69,  105,  106,  114,  129,  130,  396,
			  264,  116,   65,    7,   57,   66,   67,  107,  108,  109,
			  110,  111,  144,  115,   63,   69,  273,    6,  275,  121,
			  160,   10,  274,  163,  240,  127,  429,  167,  160,  432,
			  240,  163,   81,  315,  116,  167,  118,  289,  290,  291,
			  292,  293,  294,  295,  296,  297,  298,  299,  300,  301,
			  302,  303,  304,  305,  306,   63,    0,    6,  190,    6,
			  121,   10,    6,   10,   23,  329,  330,   28,  325,  442,

			  367,  444,  105,  106,   98,  327,  100,   66,   22,   23,
			  332,   25,   41,  119,  457,  121,  116,   31,   37,  386,
			  463,   40,  122,   40,  116,   39,  118,  237,  238,  239,
			  397,   50,  485,   50,   29,  237,  238,  239,  360,  492,
			   69,  363,   13,   57,  425,  379,  256,  490,  375,  259,
			  144,  444,  433,  380,  256,   69,  258,  259,  501,   27,
			   28,  102,  103,  430,  457,   25,   26,  510,  390,  522,
			  115,   16,   17,   33,  396,  277,  121,  279,  459,  281,
			  116,  116,  127,  118,  116,  287,  122,  540,  531,   49,
			  122,   29,    9,  427,  416,  114,  477,  490,  116,  542,

			  114,   64,  120,  116,  145,  307,    6,  148,  501,  122,
			   10,   76,   77,  124,  557,  120,  127,  510,  499,  321,
			  447,  564,  449,  124,  334,  568,  448,  570,   93,   94,
			  121,   31,  334,  455,  456,    6,  127,  339,  531,   10,
			  115,  116,    3,    4,    5,   45,    7,    8,   19,  542,
			   68,  124,    6,   80,  127,  482,   10,   57,  368,   86,
			  114,    4,    5,   29,  557,  119,  368,    4,    5,   40,
			  372,  564,  374,   34,  496,  568,    7,  570,   29,   50,
			    7,   29,  384,   37,   32,  508,   40,   48,  105,  106,
			  107,  108,  109,  110,  111,  488,   50,   43,  400,   60,

			  120,   62,  124,   51,   52,  127,  377,  530,   56,  123,
			   54,   18,  534,   61,  121,  549,  124,  419,  541,  124,
			  543,   30,    7,  425,  121,  547,  124,  429,   46,  551,
			  432,  433,  124,  435,  124,  120,   53,  559,  127,  561,
			  442,   29,  444,  120,  105,  106,  120,   44,   29,  451,
			  122,   56,   20,  120,  124,  457,  121,  459,  460,  115,
			   29,  463,    3,    4,    5,    6,    7,    8,   51,   10,
			   29,   29,  119,    4,  116,  477,    4,   29,  119,    3,
			    4,    5,    6,    7,    8,    9,   10,  121,  490,   61,
			   14,   29,   29,   34,   20,  116,    6,  499,   32,  501,

			   29,  503,  116,   35,   29,   12,  508,   56,  510,   29,
			   34,  117,   69,   62,    7,  116,  114,   22,   48,   60,
			  416,  523,  117,  115,  181,  543,  541,  530,  530,  531,
			  435,  548,  534,  463,   58,   59,   60,   83,  259,  541,
			  542,  543,   66,   67,   68,   69,   79,   66,  110,  151,
			   71,  377,   79,  102,  103,  557,   79,   38,   35,   39,
			   75,   53,  564,   -1,  105,  106,  568,  377,  570,   -1,
			   -1,   -1,  121,  114,  123,   -1,   -1,   -1,   -1,   -1,
			   -1,  105,  106,   -1,   -1,   -1,   -1,   -1,  112,  113,
			   -1,   -1,   -1,  117,   -1,  119,  145,  121,   -1,  148,

			   -1,   -1,  126,  127,    3,    4,    5,    6,    7,    8,
			    9,   10,   -1,   -1,   -1,   14,   -1,   -1,   -1,   -1,
			   -1,   -1,    3,    4,    5,    6,    7,    8,   27,   10,
			   -1,   -1,   -1,   -1,   -1,   34,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,    3,    4,    5,    6,    7,
			    8,    9,   10,   34,   -1,   -1,   14,   -1,   -1,   58,
			   -1,   60,   -1,   -1,   -1,   -1,   -1,   66,   67,   68,
			   69,   -1,   -1,   -1,   -1,   -1,   34,   -1,   -1,   60,
			   -1,   -1,   -1,   -1,   -1,   -1,    3,    4,    5,    6,
			    7,    8,    9,   10,   -1,   -1,   -1,   14,   -1,   -1,

			   58,   -1,   60,   -1,   -1,   -1,  105,  106,   66,   67,
			   68,   69,   -1,  112,  113,   -1,   -1,   34,  117,   -1,
			  119,   -1,  121,   -1,  105,  106,   -1,  126,  127,   -1,
			   -1,   -1,   -1,  114,   -1,    3,    4,    5,    6,    7,
			    8,   58,   10,   60,   -1,   -1,   -1,  105,  106,   66,
			   67,   68,   69,   -1,  112,  113,   -1,   -1,   -1,  117,
			   -1,  119,   -1,  121,   -1,   -1,   34,  125,  126,  127,
			    3,    4,    5,    6,    7,    8,    9,   10,   -1,   -1,
			   -1,   14,   -1,   -1,   -1,   -1,   -1,   -1,  105,  106,
			   -1,   -1,   60,   -1,   27,  112,  113,   -1,   -1,   -1,

			  117,   34,  119,   -1,  121,   -1,   -1,   -1,  125,  126,
			  127,    3,    4,    5,    6,    7,    8,    9,   10,   -1,
			   -1,   -1,   14,   -1,   -1,   58,   -1,   60,   -1,   -1,
			   -1,   -1,   -1,   66,   67,   68,   69,  105,  106,   -1,
			   -1,   -1,   34,   -1,   -1,   -1,  114,   -1,   -1,   -1,
			   -1,   -1,    3,    4,    5,    6,    7,    8,    9,   10,
			   -1,   -1,   -1,   14,   -1,   -1,   58,   59,   60,   -1,
			   -1,   -1,  105,  106,   66,   67,   68,   69,   -1,  112,
			  113,   -1,   -1,   34,  117,   -1,  119,   -1,  121,   -1,
			   -1,   -1,   -1,  126,  127,   -1,   -1,   -1,   -1,   -1,

			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   58,   -1,   60,
			   -1,   -1,   -1,  105,  106,   66,   67,   68,   69,   -1,
			  112,  113,   -1,   -1,   -1,  117,   -1,  119,   -1,  121,
			   -1,   -1,   -1,   -1,  126,  127,    3,    4,    5,    6,
			    7,    8,    9,   10,   -1,   -1,   -1,   14,   -1,   -1,
			   -1,   -1,   -1,   -1,  105,  106,   -1,   -1,   -1,   -1,
			   -1,  112,  113,  114,   -1,   -1,  117,   34,  119,   -1,
			  121,   -1,   -1,   -1,    6,  126,  127,   -1,   10,   11,
			   -1,   -1,   -1,    3,    4,    5,    6,    7,    8,   21,
			   10,   58,   24,   60,   -1,   27,   28,   29,   30,   66, yyDummy>>,
			1, 1000, 0)
		end

	yycheck_template_2 (an_array: ARRAY [INTEGER]) is
			-- Fill chunk #2 of template for `yycheck'.
		do
			yyarray_subcopy (an_array, <<
			   67,   68,   69,   -1,   36,   -1,   38,   -1,    9,   -1,
			   42,   43,    6,   -1,   34,   -1,   10,   11,   -1,   -1,
			   -1,   -1,   54,   55,   -1,   -1,   -1,   21,   -1,   -1,
			   24,   63,   64,   65,   66,   67,   68,   69,  105,  106,
			   60,   -1,   36,   -1,   38,  112,  113,    9,   42,   -1,
			  117,   -1,  119,   -1,  121,   -1,   -1,   -1,   -1,  126,
			  127,   55,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   66,   67,   68,   69,    9,   -1,   -1,   -1,
			   -1,   -1,  114,   -1,   -1,  105,  106,  119,   -1,  121,
			   -1,  123,  124,   -1,   95,   96,   97,   98,   99,  100,

			  101,  102,  103,  104,  105,  106,  107,  108,  109,  110,
			  111,    9,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  114,  122,   -1,   -1,   -1,  119,   -1,  121,   -1,  123,
			    9,   -1,   -1,   95,   96,   97,   98,   99,  100,  101,
			  102,  103,  104,  105,  106,  107,  108,  109,  110,  111,
			    9,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,
			  122,   59,   95,   96,   97,   98,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,  109,  110,  111,   -1,
			   59,   -1,   -1,    9,   -1,   -1,   -1,   -1,   47,  122,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,   95,   96,   97,

			   98,   99,  100,  101,  102,  103,  104,  105,  106,  107,
			  108,  109,  110,  111,    9,   -1,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
			  109,  110,  111,   59,    9,   -1,   95,   96,   97,   98,
			   99,  100,  101,  102,  103,  104,  105,  106,  107,  108,
			  109,  110,  111,    9,   -1,   -1,   -1,   -1,   -1,   -1,
			   -1,   -1,   -1,   -1,   -1,   -1,   -1,    9,   -1,   95,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,  109,  110,  111,    9,   -1,   -1,   -1,
			   65,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,   -1,

			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108,  109,  110,  111,   -1,   -1,   -1,
			   95,   96,   97,   98,   99,  100,  101,  102,  103,  104,
			  105,  106,  107,  108,  109,  110,  111,   -1,   -1,   -1,
			   96,   97,   98,   99,  100,  101,  102,  103,  104,  105,
			  106,  107,  108,  109,  110,  111,   98,   99,  100,  101,
			  102,  103,  104,  105,  106,  107,  108,  109,  110,  111,
			   -1,   -1,   -1,   -1,   -1,   -1,   99,  100,  101,  102,
			  103,  104,  105,  106,  107,  108,  109,  110,  111,   76,
			   77,   78,   79,   80,   81,   82,   83,   84,   85,   86,

			   87,   88,   89,   90,   91,   92,   93, yyDummy>>,
			1, 407, 1000)
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

	yyvs5: SPECIAL [STRING]
			-- Stack for semantic values of type STRING

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [STRING]
			-- Routines that ought to be in SPECIAL [STRING]

feature {NONE} -- Constants

	yyFinal: INTEGER is 575
			-- Termination state id

	yyFlag: INTEGER is -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER is 128
			-- Number of tokens

	yyLast: INTEGER is 1406
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER is 360
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER is 256
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel parser.
		do
			make_eiffel_scanner
			make_parser_skeleton
		end

	execute is
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

	benchmark is
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

	report_error (a_message: STRING) is
			-- Print error message.
		local
			f_buffer: YY_FILE_BUFFER
		do
			f_buffer ?= input_buffer
			if f_buffer /= Void then
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
