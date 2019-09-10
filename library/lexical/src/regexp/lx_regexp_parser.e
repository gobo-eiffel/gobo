note

	description:

		"Parsers for regular expressions"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_REGEXP_PARSER

inherit

	LX_LEX_PARSER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_REGEXP_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description


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
				yyspecial_routines4.force (yyvs4, last_lx_symbol_class_value, yyvsp4)
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
			yyval5: LX_NFA
			yyval4: LX_SYMBOL_CLASS
		do
				inspect yy_act
when 1 then
--|#line 63 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 63")
end

			set_maximum_symbol_equivalence_class
			if description.equiv_classes_used then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 73 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 73")
end

				-- Initialize for a parse of one pattern.
			in_trail_context := False
			create rule.make_default (1)
		
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
--|#line 81 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 81")
end

			has_bol_context := True
			process_rule (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 86 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 86")
end

			has_bol_context := False
			process_rule (yyvs5.item (yyvsp5))
		
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
when 5 then
--|#line 91 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 91")
end

			report_unrecognized_rule_error
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 6 then
--|#line 97 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 97")
end

			yyval5 := yyvs5.item (yyvsp5)
			has_trail_context := False
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 7 then
--|#line 106 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 106")
end

			has_trail_context := True
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 1
			yyval5 := append_eol_to_regexp (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 8 then
--|#line 115 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 115")
end

			has_trail_context := True
			trail_count := regexp_count
			yyval5 := append_trail_context_to_regexp (yyvs5.item (yyvsp5), yyvs5.item (yyvsp5 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 9 then
--|#line 121 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 121")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval5 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 10 then
--|#line 128 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 128")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval5 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 11 then
--|#line 137 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 137")
end

			yyval5 := yyvs5.item (yyvsp5)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 12 then
--|#line 144 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 144")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 13 then
--|#line 148 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 148")
end

			yyval5 := yyvs5.item (yyvsp5)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 14 then
--|#line 155 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 155")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 15 then
--|#line 159 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 159")
end

			yyval5 := yyvs5.item (yyvsp5)
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			in_trail_context := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 16 then
--|#line 171 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 171")
end

			regexp_line := old_regexp_lines.item
			old_regexp_lines.remove
			regexp_column := old_regexp_columns.item
			old_regexp_columns.remove
			regexp_count := old_regexp_counts.item
			old_regexp_counts.remove
			yyval5 := yyvs5.item (yyvsp5 - 2)
			yyval5.build_union (yyvs5.item (yyvsp5))
			process_regexp_or_series
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp5 := yyvsp5 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 17 then
--|#line 171 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 171")
end

			yyval5 := yyvs5.item (yyvsp5)
			old_regexp_lines.force (regexp_line)
			old_regexp_columns.force (regexp_column)
			old_regexp_counts.force (regexp_count)
		
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
when 18 then
--|#line 192 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 192")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 19 then
--|#line 202 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 202")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 20 then
--|#line 206 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 206")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 21 then
--|#line 216 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 216")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 22 then
--|#line 220 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 220")
end

			singleton_line := old_singleton_lines.item
			old_singleton_lines.remove
			singleton_column := old_singleton_columns.item
			old_singleton_columns.remove
			singleton_count := old_singleton_counts.item
			old_singleton_counts.remove
			yyval5 := yyvs5.item (yyvsp5 - 1)
			yyval5.build_concatenation (yyvs5.item (yyvsp5))
			process_singleton_series
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp5 := yyvsp5 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 23 then
--|#line 234 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 234")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 24 then
--|#line 243 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 243")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 25 then
--|#line 252 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 252")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 26 then
--|#line 254 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 254")
end

yyval5 := yyvs5.item (yyvsp5) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 27 then
--|#line 258 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 258")
end

			if utf8_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval5 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval5 := append_character_to_string (buffer.item_code (i_), yyval5)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval5 := new_nfa_from_character (yyvs3.item (yyvsp3))
				process_singleton_char (yyvs3.item (yyvsp3))
			end
		
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
when 28 then
--|#line 275 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 275")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_closure
			process_singleton_star
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 29 then
--|#line 281 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 281")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 30 then
--|#line 287 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 287")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.build_optional
			process_singleton_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 31 then
--|#line 293 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 293")
end

			yyval5 := new_bounded_iteration_nfa (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
			process_singleton_bounded_iteration (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 32 then
--|#line 298 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 298")
end

			yyval5 := new_unbounded_iteration_nfa (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
			process_singleton_unbounded_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 33 then
--|#line 303 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 303")
end

			yyval5 := new_iteration_nfa (yyvs5.item (yyvsp5), yyvs3.item (yyvsp3))
			process_singleton_fixed_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 34 then
--|#line 308 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 308")
end

			yyval5 := new_nfa_from_character_class (dot_character_class)
			process_singleton_dot
		
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
when 35 then
--|#line 313 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 313")
end

			yyval5 := yyvs5.item (yyvsp5)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 36 then
--|#line 317 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 317")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 37 then
--|#line 324 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 324")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			if description.utf8_mode then
				utf8_mode.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 38 then
--|#line 334 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 334")
end

			yyval5 := yyvs5.item (yyvsp5)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			if description.utf8_mode then
				utf8_mode.remove
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 39 then
--|#line 346 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 346")
end

			yyval5 := new_nfa_from_character_class (yyvs4.item (yyvsp4))
			process_singleton_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp5 := yyvsp5 + 1
	yyvsp4 := yyvsp4 -1
	if yyvsp5 >= yyvsc5 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs5")
		end
		yyvsc5 := yyvsc5 + yyInitial_yyvs_size
		yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
	end
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 40 then
--|#line 353 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 353")
end

			if description.utf8_mode then
				utf8_mode.force (True)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 41 then
--|#line 361 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 361")
end

			if description.utf8_mode then
				utf8_mode.force (False)
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 42 then
--|#line 369 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 369")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 43 then
--|#line 371 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 371")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 44 then
--|#line 373 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 373")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 45 then
--|#line 377 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 377")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 46 then
--|#line 379 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 379")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 47 then
--|#line 381 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 381")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 48 then
--|#line 385 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 385")
end

			yyval4 := yyvs4.item (yyvsp4)
			character_classes.search (yyval4)
			if character_classes.found then
				yyval4 := character_classes.found_item
			else
				character_classes.force_new (yyval4)
			end
			character_classes_by_name.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 49 then
--|#line 396 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 396")
end

			yyval4 := yyvs4.item (yyvsp4)
			yyval4.set_negated (True)
			character_classes.search (yyval4)
			if character_classes.found then
				yyval4 := character_classes.found_item
			else
				character_classes.force_new (yyval4)
			end
			character_classes_by_name.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 50 then
--|#line 410 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 410")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), new_character_class)
		
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
when 51 then
--|#line 414 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 414")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 52 then
--|#line 418 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 418")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), new_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 + 1
	yyvsp3 := yyvsp3 -2
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
when 53 then
--|#line 422 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 422")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 54 then
--|#line 428 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 428")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
			yyval4.add_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 55 then
--|#line 433 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 433")
end

			yyval4 := yyvs4.item (yyvsp4 - 1)
			yyval4.remove_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp4 := yyvsp4 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 56 then
--|#line 440 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 440")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 57 then
--|#line 442 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 442")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 58 then
--|#line 446 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 446")
end

yyval4 := yyvs4.item (yyvsp4).twin 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 59 then
--|#line 448 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 448")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 60 then
--|#line 450 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 450")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 61 then
--|#line 454 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 454")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 62 then
--|#line 456 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 456")
end

yyval4 := yyvs4.item (yyvsp4) 
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 63 then
--|#line 460 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 460")
end

			yyval5 := new_epsilon_nfa
			process_singleton_empty_string
		
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
when 64 then
--|#line 465 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 465")
end

			if utf8_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval5 := yyvs5.item (yyvsp5)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval5 := append_character_to_string (buffer.item_code (i_), yyval5)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval5 := append_character_to_string (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
				process_singleton_string (yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
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
			when 93 then
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
			create an_array.make_filled (0, 0, 265)
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
			    2,    2,    2,    2,   22,    2,   12,    2,    2,    2,
			   23,   24,   15,   16,   19,   26,   21,   13,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   17,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   25,   11,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   18,   14,   20,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10, yyDummy>>,
			1, 66, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   49,   50,   51,   51,   51,   27,   27,   27,   27,
			   27,   28,   28,   29,   29,   30,   31,   52,   32,   32,
			   33,   33,   34,   35,   36,   37,   37,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   39,
			   53,   54,   41,   41,   41,   42,   42,   42,   43,   43,
			   44,   44,   44,   44,   45,   45,   46,   46,   47,   47,
			   47,   48,   48,   40,   40, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    4,    3,    2,    1,
			    1,    1,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    4,    4,    4,    4,    4,    4,    1,    1,
			    1,    5,    5,    5,    5,    5,    5,    5,    4,    4,
			    4,    5,    5,    1,    3,    4,    1,    1,    1,    5,
			    5,    5,    1,    1,    1,    1,    1,    1,    5,    5,
			    1,    1,    1,    1,    1,    3,    4,    1,    1,    3,
			    5,    1,    3,    1,    4,    4,    4,    4,    1,    1,
			    1,    3,    1,    5,    1,    1,    4,    4,    4,    3,
			    1,    3,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    3,    3,    4,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,    0,   63,   34,    0,   45,   27,    0,   41,
			   40,    5,    4,    6,    0,   12,   11,   19,   18,   23,
			   25,   26,   39,   58,   46,   59,   60,    0,    1,    0,
			    0,    0,    0,   14,   13,   21,   20,   25,   58,   59,
			   60,    0,    3,    0,   50,    0,   17,   15,    7,    8,
			    9,   22,    0,   30,   29,   28,    0,    0,    0,    0,
			   36,   47,   56,   57,   35,   64,    0,    0,   48,   51,
			    0,   10,    0,    0,   61,   62,   55,   54,   37,   38,
			   49,   52,    0,   16,   33,    0,   58,   59,   60,   53,
			   32,    0,   31,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   12,   13,   32,   14,   15,   16,   34,   17,   18,   36,
			   19,   20,   21,   41,   22,   23,   24,   45,   25,   26,
			   27,   76,   93,    1,   28,   70,   29,   30, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,   86,  162, -32768, -32768,  162, -32768, -32768,   58, -32768,
			 -32768, -32768, -32768,  161,  162, -32768, -32768, -32768,  162,  112,
			 -32768, -32768, -32768,   62, -32768,   29,    4,  106, -32768,  162,
			  162,  133,  114,  123, -32768,  117, -32768,  101,  140,  118,
			   96,   17, -32768,  100,   70,   57, -32768, -32768, -32768,  137,
			 -32768, -32768,   98, -32768, -32768, -32768,  164,  164,   79,   74,
			 -32768, -32768, -32768, -32768, -32768, -32768,   34,   89, -32768,   55,
			  162, -32768,   -6,  164, -32768, -32768, -32768, -32768, -32768, -32768,
			 -32768, -32768,   18, -32768, -32768,   41,   36,   25,   14, -32768,
			 -32768,   16, -32768,   11,    5, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  171,    1, -32768,  163,  169,  -12, -32768,  158, -32768, -32768,
			 -32768,  157, -32768, -32768, -32768,    0, -32768,  110,   -1,   -2,
			 -32768,   95, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   40,   39,   38,   31,  -44,   95,   51,  -44,  -44,  -44,
			  -44,   94,  -44,   85,   84,   49,  -44,  -44,  -44,  -44,
			  -44,  -44,  -44,   65,   89,  -44,  -44,  -44,  -44,  -43,
			   58,   59,  -43,  -43,  -43,  -43,   92,  -43,   63,   64,
			   69,  -43,  -43,  -43,  -43,  -43,  -43,  -43,   91,   62,
			  -43,  -43,  -43,  -43,   75,   75,   74,   74,   83,   80,
			   61,   90,  -42,   69,   44,  -42,  -42,  -42,  -42,   43,
			  -42,   88,   87,   86,  -42,  -42,  -42,  -42,  -42,  -42,
			  -42,   82,   68,  -42,  -42,  -42,  -42,   11,   46,   10,
			    9,    8,    7,   46,    6,   81,   67,    5,   79,  -44,

			  -44,  -44,  -44,   78,  -44,   72,   44,    4,    3,    2,
			  -44,  -44,  -44,  -44,  -44,   57,   56,  -44,  -44,  -44,
			   63,  -43,  -43,  -43,  -43,  -24,  -43,   55,   54,   53,
			   52,  -19,  -43,  -43,  -43,  -43,  -43,  -12,   60,  -43,
			  -43,  -43,   62,  -42,  -42,  -42,  -42,   46,  -42,   71,
			   47,   46,   77,   66,  -42,  -42,  -42,  -42,  -42,   37,
			   35,  -42,  -42,  -42,   61,   10,    9,    8,    7,    8,
			    6,   33,    6,   48,   47,   46,   42,   50,    0,    0,
			    0,    0,    0,    4,    3,    2,    0,   73, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			    2,    2,    2,    2,    0,    0,   18,    3,    4,    5,
			    6,    0,    8,   19,   20,   14,   12,   13,   14,   15,
			   16,   17,   18,    6,    6,   21,   22,   23,   24,    0,
			   29,   30,    3,    4,    5,    6,   20,    8,   24,   22,
			    6,   12,   13,   14,   15,   16,   17,   18,    7,   24,
			   21,   22,   23,   24,   56,   57,   56,   57,   70,   25,
			   24,   20,    0,    6,    6,    3,    4,    5,    6,   11,
			    8,   73,   73,   73,   12,   13,   14,   15,   16,   17,
			   18,   26,   25,   21,   22,   23,   24,    1,   14,    3,
			    4,    5,    6,   14,    8,    6,   26,   11,   24,    3,

			    4,    5,    6,   24,    8,    7,    6,   21,   22,   23,
			   14,   15,   16,   17,   18,    9,   10,   21,   22,   23,
			   24,    3,    4,    5,    6,   24,    8,   15,   16,   17,
			   18,   14,   14,   15,   16,   17,   18,   14,   24,   21,
			   22,   23,   24,    3,    4,    5,    6,   14,    8,   12,
			   13,   14,   57,   43,   14,   15,   16,   17,   18,    2,
			    2,   21,   22,   23,   24,    3,    4,    5,    6,    5,
			    8,    2,    8,   12,   13,   14,    5,   14,   -1,   -1,
			   -1,   -1,   -1,   21,   22,   23,   -1,   23, yyDummy>>)
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

	yyvs3: SPECIAL [INTEGER]
			-- Stack for semantic values of type INTEGER

	yyvsc3: INTEGER
			-- Capacity of semantic value stack `yyvs3'

	yyvsp3: INTEGER
			-- Top of semantic value stack `yyvs3'

	yyspecial_routines3: KL_SPECIAL_ROUTINES [INTEGER]
			-- Routines that ought to be in SPECIAL [INTEGER]

	yyvs4: SPECIAL [LX_SYMBOL_CLASS]
			-- Stack for semantic values of type LX_SYMBOL_CLASS

	yyvsc4: INTEGER
			-- Capacity of semantic value stack `yyvs4'

	yyvsp4: INTEGER
			-- Top of semantic value stack `yyvs4'

	yyspecial_routines4: KL_SPECIAL_ROUTINES [LX_SYMBOL_CLASS]
			-- Routines that ought to be in SPECIAL [LX_SYMBOL_CLASS]

	yyvs5: SPECIAL [LX_NFA]
			-- Stack for semantic values of type LX_NFA

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LX_NFA]
			-- Routines that ought to be in SPECIAL [LX_NFA]

feature {NONE} -- Constants

	yyFinal: INTEGER = 95
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 27
			-- Number of tokens

	yyLast: INTEGER = 187
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 265
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 55
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
