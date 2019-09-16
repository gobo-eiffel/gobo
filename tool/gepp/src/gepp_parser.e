note

	description:

		"Parsers for 'gepp' preprocessors"

	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEPP_PARSER

inherit

	YY_PARSER_SKELETON
		rename
			make as make_parser_skeleton
		redefine
			report_error
		end

	GEPP_SCANNER
		rename
			make as make_gepp_scanner,
			reset as reset_gepp_scanner
		redefine
			echo, 
			fatal_error,
			report_invalid_unicode_character_error
		end

	KL_SHARED_EXECUTION_ENVIRONMENT

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
		end

	yy_init_value_stacks
			-- Initialize value stacks.
		do
			yyvsp1 := -1
			yyvsp2 := -1
			yyvsp3 := -1
		end

	yy_clear_value_stacks
			-- Clear objects in semantic value stacks so that
			-- they can be collected by the garbage collector.
		do
			yyvs1.keep_head (0)
			yyvs2.keep_head (0)
			yyvs3.keep_head (0)
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
			yyval3: BOOLEAN
		do
				inspect yy_act
when 1 then
--|#line 57 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 57")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 60 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 60")
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
when 3 then
--|#line 61 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 61")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 62 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 62")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 5 then
--|#line 66 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 66")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 67 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 67")
end


if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -4
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 7 then
--|#line 68 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 68")
end

			if not ignored then
				define_value ("", yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 8 then
--|#line 74 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 74")
end

			if not ignored then
				undefine_value (yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 9 then
--|#line 80 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 80")
end

			if not ignored then
				process_include (yyvs2.item (yyvsp2))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp2 := yyvsp2 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 10 then
--|#line 88 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 88")
end

			if_level := if_level + 1
			if not ignored and not yyvs3.item (yyvsp3) then
				ignored_level := if_level
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 11 then
--|#line 95 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 95")
end

			if_level := if_level + 1
			if not ignored and yyvs3.item (yyvsp3) then
				ignored_level := if_level
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -1
	yyvsp3 := yyvsp3 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 12 then
--|#line 104 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 104")
end

			yyval3 := is_defined (yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp3 := yyvsp3 + 1
	yyvsp2 := yyvsp2 -1
	if yyvsp3 >= yyvsc3 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs3")
		end
		yyvsc3 := yyvsc3 + yyInitial_yyvs_size
		yyvs3 := yyspecial_routines3.aliased_resized_area (yyvs3, yyvsc3)
	end
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 13 then
--|#line 108 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 108")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 14 then
--|#line 112 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 112")
end

			yyval3 := yyvs3.item (yyvsp3 - 1) and yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 15 then
--|#line 116 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 116")
end

			yyval3 := yyvs3.item (yyvsp3 - 1) or yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp3 := yyvsp3 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 16 then
--|#line 120 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 120")
end

			yyval3 := not yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 17 then
--|#line 126 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 126")
end

			if ignored_level = if_level then
				ignored_level := 0
			end
			if_level := if_level - 1
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 18 then
--|#line 135 "gepp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'gepp_parser.y' at line 135")
end

			if not ignored then
				ignored_level := if_level
			elseif ignored_level = if_level then
				ignored_level := 0
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
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
			when 39 then
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
			create an_array.make_filled (0, 0, 269)
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
			    2,    2,    2,   15,    2,    2,    2,    2,    2,    2,
			   16,   17,    2,    2,    2,    2,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10,   11,   12,   13,   14, yyDummy>>,
			1, 70, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   19,   20,   20,   20,   21,   21,   21,   21,   21,
			   22,   22,   18,   18,   18,   18,   18,   23,   24, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    2,    2,    1,    1,    2,    3,    3,    1,    1,    1,
			    1,    1,    3,    3,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    3,    3,    1,    1,    1,    1,    1,
			    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    2,    2,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,    0,    0,    0,    0,    1,    3,    2,    0,
			    0,    0,    0,    0,   12,    0,    0,    4,    0,    8,
			    7,    9,    0,   16,    0,    0,   11,   10,    0,    0,
			    5,    2,   13,   14,   15,   17,   18,    0,    6,    0,
			    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   15,   39,    6,    7,    8,   30,   31, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			   30,   40,   39,   28,   -8,   -8,   30, -32768,   30,   38,
			   15,   13,   -8,   -8, -32768,   33,   31, -32768,   10, -32768,
			 -32768, -32768,   25, -32768,   -8,   -8, -32768, -32768,    1,   -4,
			 -32768,   30, -32768, -32768,    6, -32768, -32768,   23, -32768,    5,
			    4, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			   -3, -32768,   -7,   -6, -32768,   12, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   17,   18,   16,   14,   41,   40,   36,   13,   12,   22,
			   23,   35,   17,    5,    4,    3,    2,    1,   29,   28,
			   24,   33,   34,   21,   37,   20,    5,    4,    3,    2,
			    1,   17,   28,    5,    4,    3,    2,    1,   25,   24,
			   11,   27,   32,   26,   25,   24,   25,   24,   19,   38,
			   10,    9, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    6,    8,    5,   11,    0,    0,   10,   15,   16,   12,
			   13,   10,   18,    3,    4,    5,    6,    7,    8,    9,
			   14,   24,   25,   10,   31,   10,    3,    4,    5,    6,
			    7,   37,    9,    3,    4,    5,    6,    7,   13,   14,
			   12,   10,   17,   10,   13,   14,   13,   14,   10,   37,
			   11,   11, yyDummy>>)
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

	yyvs3: SPECIAL [BOOLEAN]
			-- Stack for semantic values of type BOOLEAN

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [BOOLEAN]
			-- Routines that ought to be in SPECIAL [BOOLEAN]

feature {NONE} -- Constants

	yyFinal: INTEGER = 41
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 18
			-- Number of tokens

	yyLast: INTEGER = 51
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 269
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 25
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Initialization

	make (a_handler: like error_handler)
			-- Create a new parser.
		require
			a_handler_not_void: a_handler /= Void
		do
			make_gepp_scanner
			make_parser_skeleton
			error_handler := a_handler
			create defined_values.make (10)
			create line_nb_stack.make (Max_include_depth)
			create include_stack.make (Max_include_depth)
			last_string_value := ""
		ensure
			error_handler_set: error_handler = a_handler
		end

feature -- Initialization

	reset
			-- Reset parser before parsing next input.
		do
			reset_gepp_scanner
			if_level := 0
			ignored_level := 0
			defined_values.wipe_out
			line_nb_stack.wipe_out
			include_stack.wipe_out
		end

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse preprocessing instructions from `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			set_input_buffer (new_file_buffer (a_file))
			parse
			if makefile_dependencies then
				output ("%N")
			end
		end

	parse_string (a_string: STRING)
			-- Parse preprocessing instructions from `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			set_input_buffer (new_string_buffer (a_string))
			parse
		end

feature -- Processing

	process_include (a_filename: STRING)
			-- Parse include file `a_filename'.
			-- Do not allow more than 10 nested include files.
		require
			a_filname_not_void: a_filename /= Void
			a_filename_not_empty: a_filename.count > 0
		local
			a_file: KL_TEXT_INPUT_FILE
			cannot_read: UT_CANNOT_READ_FILE_ERROR
			too_many_includes: GEPP_TOO_MANY_INCLUDES_ERROR
		do
			if not include_stack.is_full then
				if makefile_dependencies then
					output (" \%N%T")
					output (a_filename)
				end
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
					abort
				end
			else
				create too_many_includes.make (include_stack.count + 1)
				error_handler.report_error (too_many_includes)
				abort
			end
		end

feature -- Error handling

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	report_error (a_message: STRING)
			-- Report a syntax error.
		local
			an_error: UT_SYNTAX_ERROR
			filename: STRING
		do
			if attached {YY_FILE_BUFFER} input_buffer as file_buffer then
				filename := file_buffer.file.name
			else
				filename := "string"
			end
			create an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
		end

	fatal_error (a_message: STRING)
			-- A fatal error occurred.
			-- Print `a_message'.
		local
			l_error: UT_MESSAGE
		do
			create l_error.make (a_message)
			error_handler.report_error (l_error)
		end

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read and caused the scanner
			-- to fail.
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("Surrogate or invalid Unicode character '\u{" + a_code.to_hex_string + "}'")
			error_handler.report_error (l_error)
		end
		
feature -- Status report

	ignored: BOOLEAN
			-- Is current line ignored?
		do
			Result := ignored_level /= 0
		end

	is_defined (a_name: STRING): BOOLEAN
			-- Is `a_name' defined?
		require
			a_name_not_void: a_name/= Void
		do
			Result := defined_values.has (a_name)
		end

	makefile_dependencies: BOOLEAN
			-- Should Makefile dependencies be generated to
			-- `output_file' instead of the preprocessed output?

feature -- Element change

	define_value (a_value: STRING; a_name: STRING)
			-- Define `a_name' with `a_value'.
		require
			a_value_not_void: a_value /= Void
			a_name_not_void: a_name /= Void
		do
			defined_values.force (a_value, a_name)
		ensure
			a_name_defined: is_defined (a_name)
		end

	undefine_value (a_name: STRING)
			-- Undefine `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			defined_values.remove (a_name)
		ensure
			a_name_undefined: not is_defined (a_name)
		end

	set_makefile_dependencies (b: BOOLEAN)
			-- Set `makefile_dependencies' to `b'.
		do
			makefile_dependencies := b
		ensure
			makefile_dependencies_set: makefile_dependencies = b
		end

feature -- Output

	echo
			-- Output `text' using feature `output'.
			-- Do not echo if option -M has been 
			-- specified on the command-line.
		do
			if not makefile_dependencies then
				output (text)
			end
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

	Max_include_depth: INTEGER = 10
			-- Maximum number of nested include files

invariant

	error_handler_not_void: error_handler /= Void
	defined_values_not_void: defined_values /= Void
	no_void_defined_value: not defined_values.has_void_item

end
