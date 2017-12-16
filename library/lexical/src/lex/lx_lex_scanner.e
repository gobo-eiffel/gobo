note

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2013, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_LEX_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

	LX_LEX_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value
		end

create

	make, make_from_description

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= EIFFEL_BLOCK2)
		end

feature {NONE} -- Implementation

	yy_build_tables
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_template
			yy_chk := yy_chk_template
			yy_base := yy_base_template
			yy_def := yy_def_template
			yy_ec := yy_ec_template
			yy_meta := yy_meta_template
			yy_accept := yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
--|#line 61 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 61")
end
-- Separator or comment.
when 2 then
--|#line 62 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 62")
end
line_nb := line_nb + 1
when 3 then
--|#line 63 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 63")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
when 4 then
--|#line 67 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 67")
end
set_start_condition (SCNAME)
when 5 then
--|#line 68 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 68")
end
set_start_condition (XSCNAME)
when 6 then
--|#line 69 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 69")
end
set_start_condition (OPTION)
when 7 then
--|#line 70 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 70")
end

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
when 8 then
--|#line 75 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 75")
end

					last_token := ENDSECT
					set_start_condition (SECT2)
				
when 9 then
--|#line 79 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 79")
end

					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				
when 10 then
--|#line 83 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 83")
end

					report_directive_expected_error
					set_start_condition (RECOVER1)
				
when 11 then
--|#line 90 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 90")
end
more
when 12 then
--|#line 91 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 91")
end
more
when 13 then
--|#line 92 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 92")
end
more
when 14 then
--|#line 93 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 93")
end
more
when 15 then
--|#line 94 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 94")
end
more
when 16 then
--|#line 95 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 95")
end

					check attached text_substring (1, text_count - 2) as l_last_string then
						line_nb := line_nb + l_last_string.occurrences ('%N')
						description.eiffel_header.force_last (l_last_string)
						set_start_condition (INITIAL)
					end
				
when 17 then
--|#line 105 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 105")
end
-- Separator or comment.
when 18 then
--|#line 106 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 106")
end
add_new_start_condition (text, start_condition = XSCNAME)
when 19 then
--|#line 107 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 107")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 20 then
--|#line 111 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 111")
end

					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				
when 21 then
--|#line 118 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 118")
end
-- Separator or comment.
when 22 then
--|#line 119 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 119")
end
description.set_backing_up_report (True)
when 23 then
--|#line 120 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 120")
end
description.set_backing_up_report (False)
when 24 then
--|#line 121 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 121")
end

					description.set_case_insensitive (False)
				
when 25 then
--|#line 124 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 124")
end

					description.set_case_insensitive (True)
				
when 26 then
--|#line 127 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 127")
end
description.set_debug_mode (True)
when 27 then
--|#line 128 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 128")
end
description.set_debug_mode (False)
when 28 then
--|#line 129 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 129")
end
description.set_no_default_rule (False)
when 29 then
--|#line 130 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 130")
end
description.set_no_default_rule (True)
when 30 then
--|#line 131 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 131")
end
description.set_equiv_classes_used (True)
when 31 then
--|#line 132 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 132")
end
description.set_equiv_classes_used (False)
when 32 then
--|#line 133 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 133")
end
description.set_full_table (True)
when 33 then
--|#line 134 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 134")
end
description.set_full_table (False)
when 34 then
--|#line 135 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 135")
end
description.set_meta_equiv_classes_used (True)
when 35 then
--|#line 136 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 136")
end
description.set_meta_equiv_classes_used (False)
when 36 then
--|#line 137 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 137")
end
description.set_reject_used (True)
when 37 then
--|#line 138 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 138")
end
description.set_reject_used (False)
when 38 then
--|#line 139 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 139")
end
description.set_line_used (True)
when 39 then
--|#line 140 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 140")
end
description.set_line_used (False)
when 40 then
--|#line 141 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 141")
end
description.set_position_used (True)
when 41 then
--|#line 142 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 142")
end
description.set_position_used (False)
when 42 then
--|#line 143 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 143")
end
description.set_pre_action_used (True)
when 43 then
--|#line 144 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 144")
end
description.set_pre_action_used (False)
when 44 then
--|#line 145 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 145")
end
description.set_post_action_used (True)
when 45 then
--|#line 146 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 146")
end
description.set_post_action_used (False)
when 46 then
--|#line 147 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 147")
end
description.set_pre_eof_action_used (True)
when 47 then
--|#line 148 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 148")
end
description.set_pre_eof_action_used (False)
when 48 then
--|#line 149 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 149")
end
description.set_post_eof_action_used (True)
when 49 then
--|#line 150 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 150")
end
description.set_post_eof_action_used (False)
when 50 then
--|#line 151 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 151")
end

					description.set_no_warning (False)
				
when 51 then
--|#line 154 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 154")
end

					description.set_no_warning (True)
				
when 52 then
--|#line 158 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 158")
end
set_start_condition (OUTFILE)
when 53 then
--|#line 168 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 168")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 54 then
--|#line 172 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 172")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 55 then
--|#line 179 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 179")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 56 then
--|#line 183 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 183")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 57 then
--|#line 191 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 191")
end
-- Separates name and definition.
when 58 then
--|#line 192 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 192")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 59 then
--|#line 199 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 199")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 60 then
--|#line 207 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 207")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 61 then
--|#line 211 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 211")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 62 then
--|#line 224 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 224")
end
-- Separator or comment.
when 63 then
--|#line 225 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 225")
end
line_nb := line_nb + 1
when 64 then
--|#line 226 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 226")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 65 then
--|#line 230 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 230")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 66 then
--|#line 239 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 239")
end
last_token := Left_brace_code
when 67 then
--|#line 240 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 240")
end
last_token := Right_brace_code
when 68 then
--|#line 241 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 241")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 69 then
--|#line 245 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 245")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 70 then
--|#line 257 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 257")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 71 then
	yy_end := yy_end - 1
--|#line 261 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 261")
end
last_token := Dollar_code
when 72 then
--|#line 262 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 262")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 73 then
--|#line 271 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 271")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 74 then
--|#line 275 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 275")
end

					check attached text as l_last_string then
						if character_classes.has (l_last_string) then
							last_token := CCL_OP
							last_lx_symbol_class_value := character_classes.item (l_last_string)
						else
							last_token := Left_bracket_code
							last_string_value := l_last_string
							less (1)
							set_start_condition (FIRSTCCL)
						end
					end
				
when 75 then
--|#line 288 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 288")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 76 then
--|#line 293 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 293")
end
last_token := EOF_OP
when 77 then
--|#line 294 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 294")
end
last_token := text_item (1).code
when 78 then
--|#line 295 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 295")
end

					set_start_condition (ACTION_TEXT)
				
when 79 then
--|#line 298 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 298")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 80 then
--|#line 303 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 303")
end

					last_token := CHAR
					process_character (text_item (1).code)
				
when 81 then
--|#line 310 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 310")
end
-- Separator or comment.
when 82 then
--|#line 311 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 311")
end
line_nb := line_nb + 1
when 83 then
--|#line 312 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 312")
end
last_token := Comma_code
when 84 then
--|#line 313 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 313")
end
last_token := Star_code
when 85 then
--|#line 314 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 314")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 86 then
--|#line 318 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 318")
end

					last_token := NAME
					last_string_value := text
				
when 87 then
--|#line 322 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 322")
end

					report_bad_start_condition_error (text)
				
when 88 then
--|#line 328 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 328")
end
-- Separator.
when 89 then
--|#line 329 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 329")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 90 then
--|#line 337 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 337")
end
last_token := Comma_code
when 91 then
--|#line 338 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 338")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 92 then
--|#line 342 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 342")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 93 then
--|#line 347 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 347")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 94 then
--|#line 356 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 356")
end

					process_character (text_item (1).code)
					last_token := CHAR
				
when 95 then
--|#line 360 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 360")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 96 then
--|#line 364 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 364")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 97 then
--|#line 372 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 372")
end

					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				
when 98 then
	yy_end := yy_end - 1
--|#line 381 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 381")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 99 then
	yy_end := yy_end - 1
--|#line 385 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 385")
end
last_token := Caret_code
when 100 then
--|#line 386 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 386")
end

					last_token := CHAR
					process_character (text_item (1).code)
					set_start_condition (CCL)
				
when 101 then
--|#line 391 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 391")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 102 then
	yy_end := yy_end - 1
--|#line 400 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 400")
end
last_token := Minus_code
when 103 then
--|#line 401 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 401")
end

					last_token := CHAR
					process_character (text_item (1).code)
				
when 104 then
--|#line 405 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 405")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 105 then
--|#line 409 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 409")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 106 then
--|#line 418 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 418")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 107 then
--|#line 422 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 422")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 108 then
--|#line 427 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 427")
end
set_start_condition (EIFFEL_BLOCK2)
when 109 then
--|#line 428 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 428")
end

					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				
when 110 then
--|#line 436 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 436")
end
more
when 111 then
--|#line 437 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 437")
end
more
when 112 then
--|#line 438 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 438")
end
more
when 113 then
--|#line 439 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 439")
end
more
when 114 then
--|#line 440 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 440")
end
more
when 115 then
--|#line 441 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 441")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 116 then
--|#line 445 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 445")
end

					if nb_open_brackets = 0 then
						check attached text_substring (1, text_count - 1) as l_last_string then
							last_token := EIF_CODE
							line_nb := line_nb + l_last_string.occurrences ('%N')
							last_string_value := l_last_string
							set_start_condition (SECT2)
						end
					else
						nb_open_brackets := nb_open_brackets - 1
						more
					end
				
when 117 then
--|#line 464 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 464")
end

					last_token := EIF_CODE
					last_string_value := text
				
when 118 then
--|#line 469 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 469")
end

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (text)
					end
				
when 119 then
--|#line 0 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1702)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,  470,   39,   40,   39,  120,  120,  121,  121,  138,
			  470,  138,   41,   38,   39,   40,   39,   38,   38,   42,
			   38,   38,   38,   38,   41,   38,   38,   38,   38,   38,
			   38,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   38,   38,   38,   38,   38,   38,
			   38,   38,   45,   46,   45,  147,   55,  147,   56,   57,
			  183,  183,   47,   58,  103,   55,   48,   59,   57,   85,
			   86,   85,   58,  111,   85,   86,   85,   91,   87,   92,
			  103,   88,   88,   87,  185,  185,   88,   88,   91,  155,

			   92,  156,  161,  217,  161,   49,  111,   50,  325,   51,
			   45,   46,   45,  218,  173,   52,  174,  326,  104,  105,
			   47,  186,  186,  112,   48,  113,   89,   93,  179,  224,
			  179,   89,  157,  225,  104,  105,  451,  220,   93,  107,
			  108,  107,  107,  108,  107,  182,  112,  182,  113,  109,
			  183,  183,  109,   49,  187,   50,  187,   51,   60,   61,
			   62,   61,   60,   60,   60,   60,   60,   60,   60,   63,
			   60,   64,   64,   60,   60,   60,   64,   65,   66,   67,
			   68,   69,   64,   64,   64,   64,   64,   70,   71,   72,
			   73,   74,   75,   64,   64,   64,   64,   76,   64,   60, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   60,   60,   60,   60,   60,   60,   60,   79,   80,   81,
			   80,   79,   79,   79,   79,   79,   79,   79,   82,   79,
			   79,   79,   79,   79,   79,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   79,   79,
			   79,   79,   79,   79,   79,   79,   94,   95,   96,   95,
			   94,   94,   94,   94,   94,   97,   98,   99,   94,   94,
			   94,   94,   94,  100,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,   94,   94,   94,

			   94,   94,   94,   94,   94,  115,  193,  115,  193,  196,
			  185,  200,  185,  200,  116,  470,  116,  133,  210,  208,
			  134,  209,  133,  257,  135,  134,  201,  201,  201,  135,
			  138,  470,  138,  470,  470,  469,  140,  186,  147,  186,
			  147,  196,  468,  150,  150,  117,  118,  117,  118,  123,
			  124,  123,  125,  126,  467,  470,  127,  127,  213,  136,
			  127,  137,  142,  128,  136,  143,  137,  145,  214,  145,
			  144,  470,  466,  470,  470,  150,  145,  215,  149,  375,
			  155,  151,  156,  151,  161,  179,  161,  179,  376,  129,
			  130,  216,  249,  250,  131,  127,  123,  124,  123,  125, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  126,  251,  289,  127,  127,  470,  182,  127,  182,  187,
			  128,  187,  193,  200,  193,  200,  208,  254,  209,  262,
			  262,  263,  263,  278,  283,  279,  464,  255,  252,  290,
			  294,  294,  295,  295,  284,  258,  129,  130,  154,  262,
			  262,  131,  127,  221,  221,  470,  221,  221,  221,  221,
			  221,  221,  221,  221,  162,  221,  162,  162,  221,  221,
			  221,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  221,  221,  221,  221,  221,  221,
			  221,  221,  230,  231,  232,  233,  234,  205,  205,  249,

			  250,  291,  235,  236,  470,  465,  237,  238,  157,  263,
			  263,  304,  239,  317,  464,  305,  321,  318,  249,  250,
			  207,  294,  294,  463,  296,  210,  295,  295,  470,  205,
			  249,  250,  253,  292,  292,  249,  250,  336,  292,  292,
			  292,  292,  292,  292,  470,  249,  250,  337,  343,  249,
			  250,  470,  344,  361,  323,  470,  380,  362,  462,  461,
			  381,  460,  249,  250,  322,  322,  459,  458,  470,  322,
			  322,  322,  322,  322,  322,  457,  349,  150,  150,  150,
			  150,  150,  150,  150,  205,  205,  205,  205,  205,  205,
			  205,  470,  246,  246,  246,  470,   38,   38,   38,   38, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   84,   84,   84,   84,

			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   90,   90,   90,
			   90,   90,   90,   90,   90,   90,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  106,  106,  106,  106,
			  106,  106,  106,  106,  106,  106,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  110,  110,  110,  110,
			  110,  110,  110,  110,  110,  110,  114,  114,  114,  114, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  114,  114,  114,  114,  114,  114,  114,  114,  114,  114,
			  114,  114,  114,  114,  114,  114,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  119,  119,  119,  119,
			  119,  119,  119,  119,  119,  119,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  122,  122,  122,  122,  122,
			  122,  122,  122,  122,  122,  122,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  141,  184,  184,  184,
			  456,  141,  141,  141,  141,  141,  141,  141,  455,  454,
			  141,  146,  146,  146,  146,  146,  146,  146,  146,  146,

			  453,  146,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  153,  153,  153,  452,  451,  450,  449,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  154,  448,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  157,  447,  157,  157,  157,  446,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  163,  163,  163,  163,  163,  163,  163,  163,
			  163,  163,  177,  177,  177,  177,  177,  177,  177,  177, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  177,
			  177,  177,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  445,  181,  184,  444,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  189,  189,  189,  189,  189,  189,  189,
			  189,  189,  443,  189,  190,  442,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  191,  441,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  192,  440,  439,  192,  192,  192,

			  192,  192,  192,  192,  192,  192,  192,  192,  192,  192,
			  192,  192,  192,  192,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  197,  197,  197,  197,  197,  197,
			  197,  197,  197,  197,  197,  197,  197,  197,  197,  197,
			  438,  197,  197,  197,  198,  437,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  198,  198,  198,  203,  436,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  206,  206,  206,  435,  206,  434, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  433,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  207,  432,  207,  207,  207,  207,  207,  207,
			  207,  207,  207,  207,  207,  207,  207,  207,  207,  207,
			  207,  207,  210,  431,  210,  210,  210,  430,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  210,
			  210,  210,  139,  429,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  148,  428,  148,  148,  148,  148,  148,  148,
			  148,  148,  148,  148,  148,  148,  148,  148,  148,  148,
			  148,  148,  159,  427,  159,  159,  159,  159,  159,  159,

			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  180,  426,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  188,  425,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  194,  424,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  212,  423,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  221,  422,  221,  221,  221,  221,  221,  221, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  221,  247,  421,  247,  247,  247,  247,  247,  247,
			  247,  247,  247,  247,  247,  247,  247,  247,  247,  247,
			  247,  247,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  259,  259,  259,  259,  259,  259,  259,  259,
			  259,  259,  260,  420,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  419,  418,  417,  416,  415,  414,  413,  412,
			  411,  410,  409,  408,  407,  406,  405,  404,  403,  402,
			  401,  400,  399,  398,  397,  396,  395,  394,  393,  392,

			  391,  390,  389,  388,  387,  386,  385,  384,  383,  382,
			  379,  378,  377,  374,  373,  372,  371,  370,  369,  368,
			  367,  366,  365,  364,  363,  360,  359,  358,  357,  356,
			  355,  354,  353,  352,  351,  350,  348,  347,  346,  345,
			  342,  341,  340,  339,  338,  335,  334,  333,  332,  331,
			  330,  329,  328,  327,  324,  207,  320,  319,  316,  315,
			  314,  313,  312,  311,  310,  309,  308,  307,  306,  303,
			  302,  301,  300,  299,  298,  297,  154,  214,  293,  288,
			  184,  287,  286,  285,  282,  281,  280,  277,  276,  275,
			  274,  273,  272,  271,  270,  269,  268,  267,  266,  265, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  264,  261,  260,  259,  256,  248,  199,  247,  245,  178,
			  244,  243,  242,  241,  240,  229,  228,  227,  226,  223,
			  222,  219,  212,  211,  204,  202,  199,  194,  188,  180,
			  178,  176,  175,  172,  171,  170,  169,  168,  167,  166,
			  165,  164,  162,  160,  159,  158,  151,  149,  148,  139,
			  470,   78,   78,   37,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,

			  470,  470,  470, yy_Dummy>>,
			1, 103, 1600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1702)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    1,    1,    1,   31,   32,   31,   32,   39,
			    0,   39,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    3,    3,    3,   45,    7,   45,    7,    7,
			   88,   88,    3,    7,   23,    8,    3,    8,    8,   17,
			   17,   17,    8,   27,   18,   18,   18,   19,   17,   19,
			   24,   17,   17,   18,   93,  112,   18,   18,   20,   55,

			   20,   55,   61,  156,   61,    3,   28,    3,  298,    3,
			    4,    4,    4,  156,   74,    4,   74,  298,   23,   23,
			    4,   93,  112,   27,    4,   27,   17,   19,   80,  166,
			   80,   18,  158,  166,   24,   24,  468,  158,   20,   25,
			   25,   25,   26,   26,   26,   85,   28,   85,   28,   25,
			  183,  183,   26,    4,   95,    4,   95,    4,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    9,    9,    9,    9,    9,    9,    9,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,

			   21,   21,   21,   21,   21,   29,  107,   30,  107,  113,
			  117,  123,  130,  123,   29,  141,   30,   35,  211,  133,
			   35,  133,   36,  211,   35,   36,  126,  126,  126,   36,
			  138,  142,  138,  143,  144,  466,   42,  117,  147,  130,
			  147,  113,  465,  150,  150,   29,   29,   30,   30,   33,
			   33,   33,   33,   33,  462,  141,   33,   33,  142,   35,
			   33,   35,   42,   33,   36,   42,   36,  145,  145,  145,
			   42,  142,  461,  143,  144,  150,   42,  145,  150,  355,
			  154,  151,  154,  151,  161,  179,  161,  179,  355,   33,
			   33,  151,  203,  203,   33,   33,   34,   34,   34,   34, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   34,  204,  249,   34,   34,  213,  182,   34,  182,  187,
			   34,  187,  193,  200,  193,  200,  207,  209,  207,  218,
			  218,  220,  220,  237,  241,  237,  460,  209,  204,  249,
			  255,  255,  257,  257,  241,  213,   34,   34,  262,  262,
			  262,   34,   34,  162,  162,  213,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  171,  171,  171,  171,  171,  205,  205,  291,

			  291,  251,  171,  171,  258,  459,  171,  171,  263,  263,
			  263,  273,  171,  285,  458,  273,  289,  285,  292,  292,
			  294,  294,  294,  456,  258,  295,  295,  295,  296,  205,
			  251,  251,  205,  252,  252,  321,  321,  310,  252,  252,
			  252,  252,  252,  252,  258,  289,  289,  310,  316,  322,
			  322,  323,  316,  338,  296,  349,  360,  338,  455,  454,
			  360,  453,  252,  252,  290,  290,  452,  450,  296,  290,
			  290,  290,  290,  290,  290,  449,  323,  487,  487,  487,
			  487,  487,  487,  487,  504,  504,  504,  504,  504,  504,
			  504,  323,  512,  512,  512,  349,  471,  471,  471,  471, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  471,  471,  471,  471,  471,  471,  471,  471,  471,  471,
			  471,  471,  471,  471,  471,  471,  472,  472,  472,  472,
			  472,  472,  472,  472,  472,  472,  472,  472,  472,  472,
			  472,  472,  472,  472,  472,  472,  473,  473,  473,  473,
			  473,  473,  473,  473,  473,  473,  473,  473,  473,  473,
			  473,  473,  473,  473,  473,  473,  474,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  474,  474,  474,  474,
			  474,  474,  474,  474,  474,  474,  475,  475,  475,  475,
			  475,  475,  475,  475,  475,  475,  475,  475,  475,  475,
			  475,  475,  475,  475,  475,  475,  476,  476,  476,  476,

			  476,  476,  476,  476,  476,  476,  476,  476,  476,  476,
			  476,  476,  476,  476,  476,  476,  477,  477,  477,  477,
			  477,  477,  477,  477,  477,  477,  477,  477,  477,  477,
			  477,  477,  477,  477,  477,  477,  478,  478,  478,  478,
			  478,  478,  478,  478,  478,  478,  478,  478,  478,  478,
			  478,  478,  478,  478,  478,  478,  479,  479,  479,  479,
			  479,  479,  479,  479,  479,  479,  479,  479,  479,  479,
			  479,  479,  479,  479,  479,  479,  480,  480,  480,  480,
			  480,  480,  480,  480,  480,  480,  480,  480,  480,  480,
			  480,  480,  480,  480,  480,  480,  481,  481,  481,  481, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  481,  481,  481,  481,  481,  481,  481,  481,  481,  481,
			  481,  481,  481,  481,  481,  481,  482,  482,  482,  482,
			  482,  482,  482,  482,  482,  482,  482,  482,  482,  482,
			  482,  482,  482,  482,  482,  482,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  483,  483,  483,  483,
			  483,  483,  483,  483,  483,  483,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  484,  484,  484,  484,
			  484,  484,  484,  484,  484,  484,  485,  517,  517,  517,
			  448,  485,  485,  485,  485,  485,  485,  485,  447,  446,
			  485,  486,  486,  486,  486,  486,  486,  486,  486,  486,

			  444,  486,  488,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  488,  488,  488,  488,  488,  488,  488,  488,
			  488,  488,  489,  489,  489,  443,  442,  441,  440,  489,
			  489,  489,  489,  489,  489,  489,  489,  489,  489,  489,
			  489,  489,  490,  439,  490,  490,  490,  490,  490,  490,
			  490,  490,  490,  490,  490,  490,  490,  490,  490,  490,
			  490,  490,  491,  438,  491,  491,  491,  436,  491,  491,
			  491,  491,  491,  491,  491,  491,  491,  491,  491,  491,
			  491,  491,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  493,  493,  493,  493,  493,  493,  493,  493, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  493,  493,  493,  493,  493,  493,  493,  493,  493,  493,
			  493,  493,  494,  494,  494,  494,  494,  494,  494,  494,
			  494,  435,  494,  495,  434,  495,  495,  495,  495,  495,
			  495,  495,  495,  495,  495,  495,  495,  495,  495,  495,
			  495,  495,  495,  496,  496,  496,  496,  496,  496,  496,
			  496,  496,  433,  496,  497,  432,  497,  497,  497,  497,
			  497,  497,  497,  497,  497,  497,  497,  497,  497,  497,
			  497,  497,  497,  497,  498,  431,  498,  498,  498,  498,
			  498,  498,  498,  498,  498,  498,  498,  498,  498,  498,
			  498,  498,  498,  498,  499,  430,  429,  499,  499,  499,

			  499,  499,  499,  499,  499,  499,  499,  499,  499,  499,
			  499,  499,  499,  499,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  500,  500,  500,  500,  500,  500,
			  500,  500,  500,  500,  501,  501,  501,  501,  501,  501,
			  501,  501,  501,  501,  501,  501,  501,  501,  501,  501,
			  427,  501,  501,  501,  502,  426,  502,  502,  502,  502,
			  502,  502,  502,  502,  502,  502,  502,  502,  502,  502,
			  502,  502,  502,  502,  503,  425,  503,  503,  503,  503,
			  503,  503,  503,  503,  503,  503,  503,  503,  503,  503,
			  503,  503,  503,  503,  505,  505,  505,  424,  505,  423, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  422,  505,  505,  505,  505,  505,  505,  505,  505,  505,
			  505,  505,  506,  421,  506,  506,  506,  506,  506,  506,
			  506,  506,  506,  506,  506,  506,  506,  506,  506,  506,
			  506,  506,  507,  420,  507,  507,  507,  419,  507,  507,
			  507,  507,  507,  507,  507,  507,  507,  507,  507,  507,
			  507,  507,  508,  417,  508,  508,  508,  508,  508,  508,
			  508,  508,  508,  508,  508,  508,  508,  508,  508,  508,
			  508,  508,  509,  416,  509,  509,  509,  509,  509,  509,
			  509,  509,  509,  509,  509,  509,  509,  509,  509,  509,
			  509,  509,  510,  415,  510,  510,  510,  510,  510,  510,

			  510,  510,  510,  510,  510,  510,  510,  510,  510,  510,
			  510,  510,  511,  414,  511,  511,  511,  511,  511,  511,
			  511,  511,  511,  511,  511,  511,  511,  511,  511,  511,
			  511,  511,  513,  413,  513,  513,  513,  513,  513,  513,
			  513,  513,  513,  513,  513,  513,  513,  513,  513,  513,
			  513,  513,  514,  412,  514,  514,  514,  514,  514,  514,
			  514,  514,  514,  514,  514,  514,  514,  514,  514,  514,
			  514,  514,  515,  409,  515,  515,  515,  515,  515,  515,
			  515,  515,  515,  515,  515,  515,  515,  515,  515,  515,
			  515,  515,  516,  408,  516,  516,  516,  516,  516,  516, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  516,  516,  516,  516,  516,  516,  516,  516,  516,  516,
			  516,  516,  518,  407,  518,  518,  518,  518,  518,  518,
			  518,  518,  518,  518,  518,  518,  518,  518,  518,  518,
			  518,  518,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  519,  519,  519,  519,  519,  519,  519,  519,  519,
			  519,  519,  520,  406,  520,  520,  520,  520,  520,  520,
			  520,  520,  520,  520,  520,  520,  520,  520,  520,  520,
			  520,  520,  405,  404,  403,  402,  401,  400,  399,  398,
			  397,  396,  394,  393,  392,  391,  390,  389,  388,  387,
			  383,  382,  381,  380,  379,  378,  377,  376,  375,  372,

			  371,  369,  368,  367,  366,  365,  364,  363,  362,  361,
			  359,  358,  357,  354,  353,  351,  350,  348,  346,  345,
			  344,  343,  342,  341,  339,  337,  336,  335,  332,  331,
			  330,  329,  328,  327,  326,  325,  320,  319,  318,  317,
			  315,  314,  313,  312,  311,  309,  308,  307,  305,  304,
			  303,  302,  301,  300,  297,  293,  288,  286,  284,  283,
			  282,  281,  280,  279,  278,  277,  276,  275,  274,  272,
			  271,  270,  267,  266,  265,  264,  261,  259,  254,  248,
			  245,  244,  243,  242,  240,  239,  238,  236,  235,  234,
			  233,  232,  231,  230,  229,  228,  227,  225,  224,  223, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  222,  217,  216,  215,  210,  202,  198,  194,  185,  177,
			  176,  175,  174,  173,  172,  170,  169,  168,  167,  165,
			  164,  157,  135,  134,  129,  128,  121,  109,   99,   82,
			   77,   76,   75,   73,   72,   71,   70,   69,   68,   67,
			   66,   65,   63,   59,   58,   57,   52,   48,   47,   41,
			   37,   12,   11,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,

			  470,  470,  470, yy_Dummy>>,
			1, 103, 1600)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 520)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   12,   60,  108,    0,    0,   61,   70,  157,
			    0, 1649, 1648,  206,    0,    0,    0,   77,   82,   84,
			   95,  255,    0,   71,   87,  137,  140,   80,  103,  302,
			  304,    2,    3,  347,  394,  312,  317, 1650, 1653,    7,
			 1653, 1637,  329,    0, 1653,   63, 1653, 1636, 1631, 1653,
			    0, 1653, 1639,    0,    0,   94, 1653, 1638, 1632, 1594,
			 1653,  100, 1653, 1630,    0, 1622, 1621, 1616, 1617, 1599,
			 1609, 1612, 1601, 1595,   81, 1609, 1612, 1627, 1653, 1653,
			  126, 1653, 1617,    0, 1653,  143, 1653, 1653,   56, 1653,
			 1653, 1653, 1653,   80, 1653,  152, 1653, 1653, 1653, 1616,

			 1653,    0,    0, 1653, 1653,    0,    0,  304, 1653, 1615,
			 1653, 1653,   81,  297, 1653, 1653,    0,  296, 1653, 1653,
			 1653, 1621, 1653,  309, 1653, 1653,  324, 1653, 1609, 1581,
			  298,    0,    0,  314, 1616, 1610, 1653, 1653,  328,    0,
			 1653,  308,  324,  326,  327,  365,    0,  336,    0, 1653,
			  329,  379,    0,    0,  375, 1653,  100, 1613,  124,    0,
			 1653,  382,  442,    0, 1599, 1583,  109, 1582, 1587, 1584,
			 1578,  472, 1577, 1577, 1589, 1583, 1575, 1606, 1653,  383,
			    0,    0,  404,  136, 1653, 1594,    0,  407,    0,    0,
			    0,    0,    0,  410, 1603, 1653, 1653, 1653, 1601, 1653, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  411, 1653, 1582,  349,  387,  483,    0,  411, 1653,  414,
			 1596,  310,    0,  398, 1653, 1591, 1590, 1599,  405, 1653,
			  407,    0, 1571, 1576, 1560, 1578,    0, 1566, 1572, 1575,
			 1574, 1573, 1568, 1569, 1551, 1561, 1564,  390, 1563, 1566,
			 1560,  397, 1571, 1559, 1549, 1566,    0,    0, 1546,  388,
			 1653,  487,  519, 1653, 1576,  416, 1653,  418,  497, 1574,
			    0, 1569,  425,  495, 1537, 1562, 1548, 1534,    0,    0,
			 1559, 1549, 1533,  491, 1532, 1537, 1534, 1528, 1528, 1540,
			 1534, 1526, 1533, 1522, 1546,  494, 1536,    0, 1532,  502,
			  550,  456,  475, 1548,  507,  512,  521, 1520,   81,    0,

			 1523, 1529, 1522, 1527, 1511, 1529,    0, 1517, 1523, 1526,
			  510, 1532, 1520, 1510, 1511, 1513,  529, 1518, 1505, 1500,
			 1518,  492,  506,  544,    0, 1503, 1511, 1496, 1511, 1493,
			 1518, 1504, 1490,    0,    0, 1515, 1489, 1513,  534, 1503,
			    0, 1500, 1489, 1500, 1487, 1482, 1494,    0, 1499,  548,
			 1480, 1483,    0, 1478, 1479,  352,    0, 1482, 1488, 1483,
			  537, 1488, 1475, 1470, 1489, 1473, 1467, 1479, 1475, 1489,
			 1653, 1477, 1463,    0,    0, 1466, 1474, 1459, 1474, 1461,
			 1472, 1459, 1454, 1466,    0, 1653,    0, 1462, 1476, 1454,
			 1467, 1453, 1457, 1447, 1450,    0, 1445, 1448, 1442, 1454, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1450, 1464, 1442, 1455, 1441, 1451, 1417, 1376, 1370, 1337,
			    0,    0, 1326, 1321, 1280, 1274, 1241, 1232,    0, 1200,
			 1206, 1186, 1168, 1172, 1164, 1156, 1123, 1129,    0, 1059,
			 1068, 1038, 1016, 1016,  987,  989,  946,    0,  926,  916,
			  895,  900,  903,  898,  873,    0,  852,  861,  847,  543,
			  528,    0,  529,  522,  532,  525,  491,    0,  491,  478,
			  403,  339,  322,    0,    0,  303,  303,    0,  113,    0,
			 1653,  595,  615,  635,  655,  675,  695,  715,  735,  755,
			  775,  795,  815,  835,  855,  871,  883,  567,  901,  921,
			  941,  961,  975,  991, 1004, 1022, 1035, 1053, 1073, 1093,

			 1113, 1133, 1153, 1173,  574, 1193, 1211, 1231, 1251, 1271,
			 1291, 1311,  584, 1331, 1351, 1371, 1391,  869, 1411, 1431,
			 1451, yy_Dummy>>,
			1, 121, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 520)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  471,  470,  472,  472,  473,  473,  474,  474,  470,
			    9,  475,  475,  470,   13,   13,   13,  476,  476,  477,
			  477,  470,   21,  478,  478,  479,  479,  480,  480,  481,
			  481,  482,  482,  483,  483,  484,  484,  470,  470,  470,
			  470,  470,  485,  486,  470,  470,  470,  470,  470,  470,
			  487,  470,  470,  488,  489,  490,  470,  491,  470,  470,
			  470,  470,  470,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  493,  470,  470,
			  470,  470,  470,  494,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  495,  470,  470,  470,  470,  470,  470,

			  470,  496,  497,  470,  470,  498,  499,  470,  470,  499,
			  470,  470,  495,  500,  470,  470,  501,  495,  470,  470,
			  470,  502,  470,  470,  470,  470,  470,  470,  470,  503,
			  495,  504,  505,  506,  507,  470,  470,  470,  470,  508,
			  470,  485,  485,  485,  485,  470,  486,  470,  509,  470,
			  487,  470,  488,  489,  490,  470,  490,  470,  491,  510,
			  470,  470,  470,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  493,  470,  470,
			  511,  494,  470,  470,  470,  470,  512,  470,  513,  496,
			  497,  498,  499,  470,  514,  470,  470,  470,  502,  470, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  470,  470,  470,  503,  503,  504,  505,  506,  470,  506,
			  470,  507,  515,  485,  470,  470,  470,  470,  470,  470,
			  470,  516,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  470,  517,  518,  470,  503,
			  470,  503,  503,  470,  470,  470,  470,  470,  485,  519,
			  520,  470,  470,  470,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  470,  503,
			  252,  503,  503,  470,  470,  470,  485,  492,  492,  492,

			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  470,  503,  503,  485,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  470,  485,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  470,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  470,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			  492,  492,  492,  492,  492,  492,  492,  492,  492,  492,
			    0,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,

			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470,  470,  470,  470,  470,  470,  470,  470,  470,  470,
			  470, yy_Dummy>>,
			1, 121, 400)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 256)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    6,    7,    1,    8,
			    9,    9,   10,    9,   11,   12,    9,   13,   14,   14,
			   14,   14,   14,   14,   14,   14,   15,   15,    1,    1,
			   16,   17,   18,    9,    1,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   26,   35,   36,   37,   38,   39,   40,   41,   26,
			   26,   42,   43,   44,   45,   46,    1,   19,   20,   21,

			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   26,   35,   36,   37,   38,   39,   40,
			   41,   26,   26,   47,   48,   49,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    4,    1,    5,    6,    1,
			    1,    1,    7,    1,    8,    9,    1,    1,    1,   10,
			   10,   10,   10,   10,   10,   11,   12,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   13,   14,
			   15,   16,    1,    1,   17,    1,   18,   19,    1,   20, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 470)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,   11,   11,    0,
			    0,   60,   60,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  110,  110,  120,   10,    1,
			    2,   10,    9,    7,   69,   62,   63,   69,   68,   65,
			   66,   67,   69,  117,   11,   15,   15,   15,   15,   15,
			   54,   21,   53,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   60,   61,   20,
			   17,   19,   20,   18,   92,   88,   93,   90,   89,   91,
			   94,   96,   95,   94,   87,   81,   82,   84,   83,   87,

			   85,   86,  109,  107,  108,  106,   58,   57,   59,   58,
			  100,  101,  100,  100,  103,  105,  103,  103,  104,   56,
			  118,   56,   80,   78,   79,   70,   80,   77,   80,   75,
			   80,   73,  110,  114,  114,  114,  115,  116,    1,    1,
			    8,    9,    9,    4,    5,    0,    7,   62,   62,   69,
			    0,   64,  117,   11,    0,   12,    0,    0,    0,   14,
			   16,   21,   21,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   60,   61,   17,
			   17,   18,   88,   89,   97,   97,   97,   81,   81,   86,
			  109,  106,   58,   57,   57,   98,   99,  102,    0,   55, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   78,   71,    0,    0,    0,    0,  110,    0,  111,    0,
			    0,    0,  113,    9,    3,    0,    0,    0,    0,   13,
			    0,   21,   54,   54,   54,   54,   30,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   97,   97,   57,    0,    0,
			   74,    0,    0,   72,    0,    0,  112,    0,    9,    0,
			   64,    0,    0,    0,   54,   54,   54,   54,   32,   38,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   50,    0,    0,
			    0,    0,    0,    0,    0,    0,    9,   54,   54,   26,

			   54,   54,   54,   54,   54,   54,   31,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			    0,    0,    0,    9,   22,   54,   54,   54,   54,   54,
			   54,   54,   54,   33,   39,   54,   54,   54,   54,   54,
			   51,   54,   54,   54,   54,   54,   54,   36,    0,    6,
			   54,   54,   28,   54,   54,   54,   27,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   76,   54,   54,   34,   23,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   37,   52,   40,   54,   54,   54,
			   54,   54,   54,   54,   54,   29,   54,   54,   54,   54, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   35,   41,   54,   54,   54,   54,   54,   54,   42,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   44,   54,
			   54,   54,   54,   54,   54,   54,   54,   43,   54,   54,
			   54,   54,   54,   54,   54,   45,   54,   54,   54,   54,
			   54,   24,   54,   54,   54,   54,   54,   46,   54,   54,
			   54,   54,   54,   48,   25,   54,   54,   47,   54,   49,
			    0, yy_Dummy>>,
			1, 71, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1653
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 470
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 471
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 119
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 120
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	SECT2: INTEGER = 1
	SECT3: INTEGER = 2
	EIFFEL_BLOCK: INTEGER = 3
	OPTION: INTEGER = 4
	RECOVER1: INTEGER = 5
	SCNAME: INTEGER = 6
	XSCNAME: INTEGER = 7
	NUM: INTEGER = 8
	QUOTE: INTEGER = 9
	SCOND: INTEGER = 10
	ACTION_TEXT: INTEGER = 11
	DEFINITION: INTEGER = 12
	FIRSTCCL: INTEGER = 13
	CCL: INTEGER = 14
	OUTFILE: INTEGER = 15
	REGEXP: INTEGER = 16
	EIFFEL_BLOCK2: INTEGER = 17
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Access

	last_integer_value: INTEGER
			-- Last semantic value of type INTEGER

	last_string_value: STRING
			-- Last semantic value of type STRING

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
