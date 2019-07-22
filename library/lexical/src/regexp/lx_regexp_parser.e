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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_REGEXP_SCANNER
		rename
			make as make_lex_scanner,
			make_from_description as make_lex_scanner_from_description,
			reset as reset_lex_scanner
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
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
			create yyspecial_routines6
			yyvsc6 := yyInitial_yyvs_size
			yyvs6 := yyspecial_routines6.make (yyvsc6)
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
			when 5 then
				yyvsp5 := yyvsp5 + 1
				if yyvsp5 >= yyvsc5 then
					debug ("GEYACC")
						std.error.put_line ("Resize yyvs5")
					end
					yyvsc5 := yyvsc5 + yyInitial_yyvs_size
					yyvs5 := yyspecial_routines5.aliased_resized_area (yyvs5, yyvsc5)
				end
				yyspecial_routines5.force (yyvs5, last_lx_unicode_character_class_value, yyvsp5)
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
			yyval6: LX_NFA
			yyval4: LX_SYMBOL_CLASS
			yyval5: LX_UNICODE_CHARACTER_CLASS
			yyval3: INTEGER
		do
				inspect yy_act
when 1 then
--|#line 61 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 61")
end

			if description.equiv_classes /= Void then
				build_equiv_classes
			end
			check_options
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 2 then
--|#line 70 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 70")
end

			if description.equiv_classes_used then
				description.create_equiv_classes
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
			process_rule (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 4 then
--|#line 86 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 86")
end

			has_bol_context := False
			process_rule (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp1 := yyvsp1 + 1
	yyvsp6 := yyvsp6 -1
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

			yyval6 := yyvs6.item (yyvsp6)
			has_trail_context := False
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			trail_count := 0
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
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
			yyval6 := append_eol_to_regexp (yyvs6.item (yyvsp6))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 8 then
--|#line 115 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 115")
end

			has_trail_context := True
			trail_count := regexp_count
			yyval6 := append_trail_context_to_regexp (yyvs6.item (yyvsp6), yyvs6.item (yyvsp6 - 1))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 9 then
--|#line 121 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 121")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval6 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 10 then
--|#line 128 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 128")
end

			report_trailing_context_used_twice_error
			has_trail_context := True
			trail_count := regexp_count
			yyval6 := new_epsilon_nfa
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp6 := yyvsp6 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 11 then
--|#line 137 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 137")
end

			yyval6 := yyvs6.item (yyvsp6)
			regexp_count := series_count
			regexp_line := series_line
			regexp_column := series_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 12 then
--|#line 144 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 144")
end

			regexp_line := old_regexp_lines.item
			old_regexp_lines.remove
			regexp_column := old_regexp_columns.item
			old_regexp_columns.remove
			regexp_count := old_regexp_counts.item
			old_regexp_counts.remove
			yyval6 := yyvs6.item (yyvsp6 - 2)
			yyval6.build_union (yyvs6.item (yyvsp6))
			process_regexp_or_series
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp6 := yyvsp6 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 13 then
--|#line 144 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 144")
end

			yyval6 := yyvs6.item (yyvsp6)
			old_regexp_lines.force (regexp_line)
			old_regexp_columns.force (regexp_column)
			old_regexp_counts.force (regexp_count)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 14 then
--|#line 165 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 165")
end

			yyval6 := yyvs6.item (yyvsp6)
				-- This rule is written separately so the reduction
				-- will occur before the trailing series is parsed.
			head_count := regexp_count
			head_line := regexp_line
			head_column := regexp_column
			in_trail_context := True
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 15 then
--|#line 177 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 177")
end

			old_singleton_lines.remove
			old_singleton_columns.remove
			old_singleton_counts.remove
			yyval6 := yyvs6.item (yyvsp6)
			series_count := singleton_count
			series_line := singleton_line
			series_column := singleton_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 16 then
--|#line 187 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 187")
end

			singleton_line := old_singleton_lines.item
			old_singleton_lines.remove
			singleton_column := old_singleton_columns.item
			old_singleton_columns.remove
			singleton_count := old_singleton_counts.item
			old_singleton_counts.remove
			yyval6 := yyvs6.item (yyvsp6 - 1)
			yyval6.build_concatenation (yyvs6.item (yyvsp6))
			process_singleton_series
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp6 := yyvsp6 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 17 then
--|#line 201 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 201")
end

			old_singleton_lines.force (singleton_line)
			old_singleton_columns.force (singleton_column)
			old_singleton_counts.force (singleton_count)
			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 18 then
--|#line 210 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 210")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval6 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
				process_singleton_char (yyvs3.item (yyvsp3))
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
when 19 then
--|#line 227 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 227")
end

			yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
			process_singleton_char (yyvs3.item (yyvsp3))
		
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
when 20 then
--|#line 232 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 232")
end

			if yyvs3.item (yyvsp3) <= {CHARACTER_8}.max_ascii_value then
				yyval6 := new_nfa_from_character (yyvs3.item (yyvsp3))
				process_singleton_char (yyvs3.item (yyvsp3))
			else
				yyval6 := new_epsilon_nfa
				process_singleton_empty_string
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
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
when 21 then
--|#line 249 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 249")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_closure
			process_singleton_star
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 22 then
--|#line 255 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 255")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_positive_closure
			process_singleton_plus
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 23 then
--|#line 261 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 261")
end

			yyval6 := yyvs6.item (yyvsp6)
			yyval6.build_optional
			process_singleton_optional
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 24 then
--|#line 267 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 267")
end

			yyval6 := new_bounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
			process_singleton_bounded_iteration (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 6
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 25 then
--|#line 272 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 272")
end

			yyval6 := new_unbounded_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3))
			process_singleton_unbounded_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 5
	yyvsp1 := yyvsp1 -3
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 26 then
--|#line 277 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 277")
end

			yyval6 := new_iteration_nfa (yyvs6.item (yyvsp6), yyvs3.item (yyvsp3))
			process_singleton_fixed_iteration (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp1 := yyvsp1 -2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 27 then
--|#line 282 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 282")
end

			if unicode_mode.item then
				yyval6 := new_nfa_from_unicode_character_class (dot_unicode_character_class)
			else
				yyval6 := new_symbol_class_nfa (dot_character_class)
			end
			process_singleton_dot
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp1 := yyvsp1 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 28 then
--|#line 291 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 291")
end

			yyval6 := new_symbol_class_nfa (yyvs4.item (yyvsp4))
			process_singleton_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
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
when 29 then
--|#line 296 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 296")
end

			yyval6 := new_nfa_from_character_class (yyvs4.item (yyvsp4))
			process_singleton_symbol_class (yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
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
when 30 then
--|#line 301 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 301")
end

			yyval6 := new_nfa_from_unicode_character_class (yyvs5.item (yyvsp5))
			process_singleton_unicode_character_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 31 then
--|#line 306 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 306")
end

			yyval6 := new_nfa_from_unicode_character_class (yyvs5.item (yyvsp5))
			process_singleton_unicode_character_class (yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyvsp6 := yyvsp6 + 1
	yyvsp5 := yyvsp5 -1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 32 then
--|#line 311 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 311")
end

			yyval6 := yyvs6.item (yyvsp6)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 33 then
--|#line 315 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 315")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 34 then
--|#line 322 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 322")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			unicode_mode.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 35 then
--|#line 330 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 330")
end

			yyval6 := yyvs6.item (yyvsp6)
			singleton_count := regexp_count
			singleton_line := regexp_line
			singleton_column := regexp_column
			unicode_mode.remove
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp1 := yyvsp1 -2
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 36 then
--|#line 340 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 340")
end

			unicode_mode.force (True)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 37 then
--|#line 346 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 346")
end

			unicode_mode.force (False)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines1.force (yyvs1, yyval1, yyvsp1)
end
when 38 then
--|#line 352 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 352")
end

			yyval4 := yyvs4.item (yyvsp4)
			character_classes.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 39 then
--|#line 357 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 357")
end

			yyval4 := yyvs4.item (yyvsp4)
			yyval4.set_negated (True)
			character_classes.force (yyval4, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 40 then
--|#line 365 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 365")
end

			yyval5 := yyvs5.item (yyvsp5)
			unicode_character_classes.force (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 41 then
--|#line 370 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 370")
end

			yyval5 := yyvs5.item (yyvsp5)
			yyval5.set_negated (True)
			unicode_character_classes.force (yyval5, yyvs2.item (yyvsp2))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp2 := yyvsp2 -1
	yyvsp1 := yyvsp1 -2
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 42 then
--|#line 378 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 378")
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
when 43 then
--|#line 382 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 382")
end

			yyval4 := append_character_to_character_class (yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 44 then
--|#line 386 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 386")
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
when 45 then
--|#line 390 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 390")
end

			yyval4 := append_character_set_to_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs4.item (yyvsp4))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines4.force (yyvs4, yyval4, yyvsp4)
end
when 46 then
--|#line 396 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 396")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 47 then
--|#line 400 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 400")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 48 then
--|#line 406 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 406")
end

			yyval5 := append_character_to_unicode_character_class (yyvs3.item (yyvsp3), new_unicode_character_class)
		
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
when 49 then
--|#line 410 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 410")
end

			yyval5 := append_character_to_unicode_character_class (yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 50 then
--|#line 414 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 414")
end

			yyval5 := append_character_set_to_unicode_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), new_unicode_character_class)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 3
	yyvsp5 := yyvsp5 + 1
	yyvsp3 := yyvsp3 -2
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
when 51 then
--|#line 418 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 418")
end

			yyval5 := append_character_set_to_unicode_character_class (yyvs3.item (yyvsp3 - 1), yyvs3.item (yyvsp3), yyvs5.item (yyvsp5))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 4
	yyvsp3 := yyvsp3 -2
	yyvsp1 := yyvsp1 -1
	yyspecial_routines5.force (yyvs5, yyval5, yyvsp5)
end
when 52 then
--|#line 424 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 424")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 53 then
--|#line 428 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 428")
end

			yyval3 := yyvs3.item (yyvsp3)
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 1
	yyspecial_routines3.force (yyvs3, yyval3, yyvsp3)
end
when 54 then
--|#line 434 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 434")
end

			yyval6 := new_epsilon_nfa
			process_singleton_empty_string
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 0
	yyvsp6 := yyvsp6 + 1
	if yyvsp6 >= yyvsc6 then
		debug ("GEYACC")
			std.error.put_line ("Resize yyvs6")
		end
		yyvsc6 := yyvsc6 + yyInitial_yyvs_size
		yyvs6 := yyspecial_routines6.aliased_resized_area (yyvs6, yyvsc6)
	end
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 55 then
--|#line 439 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 439")
end

			if unicode_mode.item and yyvs3.item (yyvsp3) > {CHARACTER_8}.max_ascii_value then
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			else
				yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
				process_singleton_string (yyvs3.item (yyvsp3))
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 56 then
--|#line 455 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 455")
end

			yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
			process_singleton_string (yyvs3.item (yyvsp3))
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
end
when 57 then
--|#line 460 "lx_regexp_parser.y"
debug ("GEYACC")
	std.error.put_line ("Executing parser user-code from file 'lx_regexp_parser.y' at line 460")
end

			if yyvs3.item (yyvsp3) <= {CHARACTER_8}.max_ascii_value then
				yyval6 := append_character_to_string (yyvs3.item (yyvsp3), yyvs6.item (yyvsp6))
				process_singleton_string (yyvs3.item (yyvsp3))
			else
				yyval6 := yyvs6.item (yyvsp6)
				buffer.wipe_out
				{UC_UTF8_ROUTINES}.append_code_to_utf8 (buffer, yyvs3.item (yyvsp3))
				from i_ := 1 until i_ > buffer.count loop
					yyval6 := append_character_to_string (buffer.item_code (i_), yyval6)
					process_singleton_string (buffer.item_code (i_))
					i_ := i_ + 1
				end
			end
		
if yy_parsing_status >= yyContinue then
	yyssp := yyssp - 2
	yyvsp3 := yyvsp3 -1
	yyspecial_routines6.force (yyvs6, yyval6, yyvsp6)
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
			when 84 then
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
			create an_array.make_filled (0, 0, 267)
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
			    2,    2,    2,    2,   24,    2,   14,    2,    2,    2,
			   25,   26,   17,   18,   21,   28,   23,   16,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   19,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   27,   13,    2,    2,    2,    2,    2,

			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,   20,   15,   22,    2,    2,    2,    2,
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
			    5,    6,    7,    8,    9,   10,   11,   12, yyDummy>>,
			1, 68, 200)
		end

	yyr1_template: SPECIAL [INTEGER]
			-- Template for `yyr1'
		once
			Result := yyfixed_array (<<
			    0,   42,   43,   44,   44,   44,   31,   31,   31,   31,
			   31,   32,   32,   45,   33,   34,   34,   35,   36,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,   36,   36,   36,   46,   47,   39,   39,
			   41,   41,   38,   38,   38,   38,   29,   29,   40,   40,
			   40,   40,   30,   30,   37,   37,   37,   37, yyDummy>>)
		end

	yytypes1_template: SPECIAL [INTEGER]
			-- Template for `yytypes1'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    1,    5,    4,    3,    3,
			    3,    2,    2,    1,    1,    1,    6,    6,    6,    6,
			    6,    6,    4,    5,    1,    1,    1,    6,    6,    6,
			    1,    3,    3,    3,    5,    1,    3,    3,    3,    4,
			    1,    1,    1,    6,    6,    6,    1,    1,    1,    1,
			    6,    6,    1,    1,    3,    3,    3,    5,    1,    1,
			    3,    4,    1,    1,    3,    6,    1,    3,    1,    1,
			    1,    3,    1,    1,    3,    1,    6,    1,    1,    3,
			    3,    1,    3,    1,    1,    1,    1, yyDummy>>)
		end

	yytypes2_template: SPECIAL [INTEGER]
			-- Template for `yytypes2'
		once
			Result := yyfixed_array (<<
			    1,    1,    1,    1,    1,    2,    2,    3,    3,    3,
			    3,    4,    5,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1, yyDummy>>)
		end

	yydefact_template: SPECIAL [INTEGER]
			-- Template for `yydefact'
		once
			Result := yyfixed_array (<<
			    2,    0,    0,   54,   27,    0,   30,   28,   20,   19,
			   18,    0,    0,   37,   36,    5,    4,    6,    0,   11,
			   15,   17,   29,   31,    1,    0,    0,    0,    0,    3,
			    0,   53,   52,   48,    0,    0,   47,   46,   42,    0,
			   14,   13,    7,    8,    9,   16,    0,   23,   22,   21,
			    0,    0,   33,   32,   57,   56,   55,    0,    0,   40,
			   49,    0,    0,   38,   43,    0,   10,    0,   34,   35,
			   41,   50,    0,   39,   44,    0,   12,   26,    0,   51,
			   45,   25,    0,   24,    0,    0,    0, yyDummy>>)
		end

	yydefgoto_template: SPECIAL [INTEGER]
			-- Template for `yydefgoto'
		once
			Result := yyfixed_array (<<
			   38,   33,   16,   17,   18,   19,   20,   21,   28,   39,
			   22,   34,   23,   84,    1,   24,   65,   25,   26, yyDummy>>)
		end

	yypact_template: SPECIAL [INTEGER]
			-- Template for `yypact'
		once
			Result := yyfixed_array (<<
			 -32768,    5,   43, -32768, -32768,   43, -32768, -32768, -32768, -32768,
			 -32768,   68,   56, -32768, -32768, -32768, -32768,   72,   43, -32768,
			   43,   65, -32768, -32768, -32768,   43,   43,   47,   50, -32768,
			   -2, -32768, -32768,   66,   29,   82, -32768, -32768,   48,   26,
			 -32768, -32768, -32768,   64, -32768, -32768,   60, -32768, -32768, -32768,
			   46,   45, -32768, -32768, -32768, -32768, -32768,   14,   -2, -32768,
			   37,   -5,   82, -32768,    9,   43, -32768,   70, -32768, -32768,
			 -32768, -32768,   -2, -32768, -32768,   82, -32768, -32768,   10, -32768,
			 -32768, -32768,   22, -32768,   31,   15, -32768, yyDummy>>)
		end

	yypgoto_template: SPECIAL [INTEGER]
			-- Template for `yypgoto'
		once
			Result := yyfixed_array (<<
			  -35,  -33,   92,   17,   77,  -20, -32768, -32768, -32768,   61,
			 -32768,   63, -32768, -32768, -32768, -32768, -32768, -32768, -32768, yyDummy>>)
		end

	yytable_template: SPECIAL [INTEGER]
			-- Template for `yytable'
		once
			Result := yyfixed_array (<<
			   45,   60,   37,   36,   64,   32,   15,   31,   14,   13,
			   12,   11,   10,    9,    8,   86,    7,    6,    5,   27,
			   82,   32,   73,   31,   60,   71,   64,   74,    4,    3,
			    2,   85,   81,   37,   36,   43,   32,   75,   31,   79,
			   80,   70,   50,   51,   83,   76,   14,   13,   12,   11,
			   10,    9,    8,   63,    7,    6,   59,   56,   55,   54,
			   41,   41,   41,   37,   36,   72,    4,    3,    2,   35,
			   67,   69,   68,   52,   53,   32,   62,   31,   66,   41,
			   40,   30,   49,   48,   47,   46,   42,   41,   40,   37,
			   36,   78,   77,   57,   58,   44,   61,   29, yyDummy>>)
		end

	yycheck_template: SPECIAL [INTEGER]
			-- Template for `yycheck'
		once
			Result := yyfixed_array (<<
			   20,   34,    7,    8,   39,    7,    1,    9,    3,    4,
			    5,    6,    7,    8,    9,    0,   11,   12,   13,    2,
			   10,    7,   27,    9,   57,   58,   61,   62,   23,   24,
			   25,    0,   22,    7,    8,   18,    7,   28,    9,   72,
			   75,   27,   25,   26,   22,   65,    3,    4,    5,    6,
			    7,    8,    9,   27,   11,   12,   27,    7,    8,    9,
			   15,   15,   15,    7,    8,   28,   23,   24,   25,   13,
			   10,   26,   26,   26,   24,    7,   28,    9,   14,   15,
			   16,   13,   17,   18,   19,   20,   14,   15,   16,    7,
			    8,   21,   22,   30,   28,   18,   35,    5, yyDummy>>)
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

	yyvs5: SPECIAL [LX_UNICODE_CHARACTER_CLASS]
			-- Stack for semantic values of type LX_UNICODE_CHARACTER_CLASS

	yyvsc5: INTEGER
			-- Capacity of semantic value stack `yyvs5'

	yyvsp5: INTEGER
			-- Top of semantic value stack `yyvs5'

	yyspecial_routines5: KL_SPECIAL_ROUTINES [LX_UNICODE_CHARACTER_CLASS]
			-- Routines that ought to be in SPECIAL [LX_UNICODE_CHARACTER_CLASS]

	yyvs6: SPECIAL [LX_NFA]
			-- Stack for semantic values of type LX_NFA

	yyvsc6: INTEGER
			-- Capacity of semantic value stack `yyvs6'

	yyvsp6: INTEGER
			-- Top of semantic value stack `yyvs6'

	yyspecial_routines6: KL_SPECIAL_ROUTINES [LX_NFA]
			-- Routines that ought to be in SPECIAL [LX_NFA]

feature {NONE} -- Constants

	yyFinal: INTEGER = 86
			-- Termination state id

	yyFlag: INTEGER = -32768
			-- Most negative INTEGER

	yyNtbase: INTEGER = 29
			-- Number of tokens

	yyLast: INTEGER = 97
			-- Upper bound of `yytable' and `yycheck'

	yyMax_token: INTEGER = 267
			-- Maximum token id
			-- (upper bound of `yytranslate'.)

	yyNsyms: INTEGER = 48
			-- Number of symbols
			-- (terminal and nonterminal)

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

end
