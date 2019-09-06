note

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_LEX_SCANNER

inherit

	LX_LEX_SCANNER_SKELETON
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
			last_lx_symbol_class_value
		end

	LX_LEX_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_string_32_value,
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
--|#line 66 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 66")
end
-- Separator or comment.
when 2 then
--|#line 67 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 67")
end
line_nb := line_nb + 1
when 3 then
--|#line 68 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 68")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
when 4 then
--|#line 72 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 72")
end
set_start_condition (SCNAME)
when 5 then
--|#line 73 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 73")
end
set_start_condition (XSCNAME)
when 6 then
--|#line 74 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 74")
end
set_start_condition (OPTION)
when 7 then
--|#line 75 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 75")
end

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
when 8 then
--|#line 80 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 80")
end

					last_token := ENDSECT
					set_start_condition (SECT2)
				
when 9 then
--|#line 84 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 84")
end

					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				
when 10 then
--|#line 88 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 88")
end

					report_directive_expected_error
					set_start_condition (RECOVER1)
				
when 11 then
--|#line 95 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 95")
end
more
when 12 then
--|#line 96 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 96")
end
more
when 13 then
--|#line 97 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 97")
end
more
when 14 then
--|#line 98 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 98")
end
more
when 15 then
--|#line 99 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 99")
end
more
when 16 then
--|#line 100 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 100")
end

					check attached text_substring (1, text_count - 2) as l_last_string then
						line_nb := line_nb + l_last_string.occurrences ('%N')
						description.eiffel_header.force_last (l_last_string)
						set_start_condition (INITIAL)
					end
				
when 17 then
--|#line 110 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 110")
end
-- Separator or comment.
when 18 then
--|#line 111 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 111")
end
add_new_start_condition (text, start_condition = XSCNAME)
when 19 then
--|#line 112 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 112")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 20 then
--|#line 116 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 116")
end

					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				
when 21 then
--|#line 123 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 123")
end
-- Separator or comment.
when 22 then
--|#line 124 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 124")
end
description.set_backing_up_report (True)
when 23 then
--|#line 125 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 125")
end
description.set_backing_up_report (False)
when 24 then
--|#line 126 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 126")
end

					description.set_case_insensitive (False)
				
when 25 then
--|#line 129 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 129")
end

					description.set_case_insensitive (True)
				
when 26 then
--|#line 132 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 132")
end
description.set_debug_mode (True)
when 27 then
--|#line 133 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 133")
end
description.set_debug_mode (False)
when 28 then
--|#line 134 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 134")
end
description.set_no_default_rule (False)
when 29 then
--|#line 135 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 135")
end
description.set_no_default_rule (True)
when 30 then
--|#line 136 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 136")
end
description.set_equiv_classes_used (True)
when 31 then
--|#line 137 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 137")
end
description.set_equiv_classes_used (False)
when 32 then
--|#line 138 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 138")
end
description.set_full_table (True)
when 33 then
--|#line 139 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 139")
end
description.set_full_table (False)
when 34 then
--|#line 140 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 140")
end
description.set_meta_equiv_classes_used (True)
when 35 then
--|#line 141 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 141")
end
description.set_meta_equiv_classes_used (False)
when 36 then
--|#line 142 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 142")
end
description.set_reject_used (True)
when 37 then
--|#line 143 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 143")
end
description.set_reject_used (False)
when 38 then
--|#line 144 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 144")
end
description.set_line_used (True)
when 39 then
--|#line 145 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 145")
end
description.set_line_used (False)
when 40 then
--|#line 146 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 146")
end
description.set_position_used (True)
when 41 then
--|#line 147 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 147")
end
description.set_position_used (False)
when 42 then
--|#line 148 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 148")
end
description.set_pre_action_used (True)
when 43 then
--|#line 149 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 149")
end
description.set_pre_action_used (False)
when 44 then
--|#line 150 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 150")
end
description.set_post_action_used (True)
when 45 then
--|#line 151 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 151")
end
description.set_post_action_used (False)
when 46 then
--|#line 152 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 152")
end
description.set_pre_eof_action_used (True)
when 47 then
--|#line 153 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 153")
end
description.set_pre_eof_action_used (False)
when 48 then
--|#line 154 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 154")
end
description.set_post_eof_action_used (True)
when 49 then
--|#line 155 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 155")
end
description.set_post_eof_action_used (False)
when 50 then
--|#line 156 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 156")
end

					description.set_utf8_mode (True)
				
when 51 then
--|#line 159 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 159")
end

					description.set_no_warning (False)
				
when 52 then
--|#line 162 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 162")
end

					description.set_no_warning (True)
				
when 53 then
--|#line 166 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 166")
end
set_start_condition (OUTFILE)
when 54 then
--|#line 176 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 176")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 55 then
--|#line 180 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 180")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 56 then
--|#line 187 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 187")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 57 then
--|#line 191 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 191")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 58 then
--|#line 199 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 199")
end
-- Separates name and definition.
when 59 then
--|#line 200 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 200")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 60 then
--|#line 207 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 207")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 61 then
--|#line 215 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 215")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 62 then
--|#line 219 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 219")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 63 then
--|#line 232 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 232")
end
-- Separator or comment.
when 64 then
--|#line 233 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 233")
end
line_nb := line_nb + 1
when 65 then
--|#line 234 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 234")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 66 then
--|#line 238 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 238")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 67 then
--|#line 247 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 247")
end
last_token := Left_brace_code
when 68 then
--|#line 248 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 248")
end
last_token := Right_brace_code
when 69 then
--|#line 249 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 249")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 70 then
--|#line 253 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 253")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 71 then
--|#line 265 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 265")
end

					last_token := UNICODE_MODE_START
				
when 72 then
--|#line 268 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 268")
end

					last_token := BYTE_MODE_START
				
when 73 then
--|#line 271 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 271")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 74 then
	yy_end := yy_start + yy_more_len + 1
--|#line 275 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 275")
end
last_token := Dollar_code
when 75 then
--|#line 276 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 276")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 76 then
--|#line 285 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 285")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 77 then
--|#line 289 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 289")
end

					last_token := CCL_PLUS
				
when 78 then
--|#line 292 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 292")
end

					last_token := CCL_MINUS
				
when 79 then
--|#line 295 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 295")
end

					last_string_value := text
					if attached character_class_with_name (last_string_value) as l_character_class then
						last_token := CCL_OP
						last_lx_symbol_class_value := l_character_class
					else
						last_token := CCL_BRACKET
						less (1)
						set_start_condition (FIRSTCCL)
					end
				
when 80 then
--|#line 306 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 306")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 81 then
--|#line 311 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 311")
end
last_token := EOF_OP
when 82 then
--|#line 312 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 312")
end
last_token := text_item (1).code
when 83 then
--|#line 313 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 313")
end

					set_start_condition (ACTION_TEXT)
				
when 84 then
--|#line 316 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 316")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 85 then
--|#line 321 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 321")
end

					last_token := CHAR
					process_utf8_character
				
when 86 then
--|#line 328 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 328")
end
-- Separator or comment.
when 87 then
--|#line 329 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 329")
end
line_nb := line_nb + 1
when 88 then
--|#line 330 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 330")
end
last_token := Comma_code
when 89 then
--|#line 331 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 331")
end
last_token := Star_code
when 90 then
--|#line 332 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 332")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 91 then
--|#line 336 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 336")
end

					last_token := NAME
					last_string_value := text
				
when 92 then
--|#line 340 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 340")
end

					report_bad_start_condition_error (text)
				
when 93 then
--|#line 346 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 346")
end
-- Separator.
when 94 then
--|#line 347 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 347")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 95 then
--|#line 355 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 355")
end
last_token := Comma_code
when 96 then
--|#line 356 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 356")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 97 then
--|#line 360 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 360")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 98 then
--|#line 365 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 365")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 99 then
--|#line 374 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 374")
end

					last_token := CHAR
					process_utf8_character
				
when 100 then
--|#line 378 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 378")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 101 then
--|#line 382 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 382")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 102 then
--|#line 391 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 391")
end

					last_token := CHAR
					process_escaped_character
				
when 103 then
--|#line 395 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 395")
end

					last_token := CHAR
					process_octal_character
				
when 104 then
--|#line 399 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 399")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 105 then
--|#line 403 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 403")
end

					last_token := CHAR
					process_unicode_character
				
when 106 then
--|#line 410 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 410")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 107 then
--|#line 415 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 415")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 108 then
--|#line 420 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 420")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 109 then
--|#line 425 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 425")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 110 then
	yy_end := yy_start + yy_more_len + 1
--|#line 430 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 430")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 111 then
	yy_end := yy_start + yy_more_len + 1
--|#line 434 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 434")
end
last_token := Caret_code
when 112 then
--|#line 435 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 435")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 113 then
--|#line 440 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 440")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 114 then
	yy_end := yy_start + yy_more_len + 1
--|#line 449 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 449")
end
last_token := Minus_code
when 115 then
--|#line 450 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 450")
end

					last_token := CHAR
					process_utf8_character
				
when 116 then
--|#line 454 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 454")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 117 then
--|#line 458 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 458")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 118 then
--|#line 467 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 467")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 119 then
--|#line 471 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 471")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 120 then
--|#line 476 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 476")
end
set_start_condition (EIFFEL_BLOCK2)
when 121 then
--|#line 477 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 477")
end

					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				
when 122 then
--|#line 485 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 485")
end
more
when 123 then
--|#line 486 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 486")
end
more
when 124 then
--|#line 487 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 487")
end
more
when 125 then
--|#line 488 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 488")
end
more
when 126 then
--|#line 489 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 489")
end
more
when 127 then
--|#line 490 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 490")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 128 then
--|#line 494 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 494")
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
				
when 129 then
--|#line 513 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 513")
end

					last_token := EIF_CODE
					last_string_value := text
				
when 130 then
--|#line 519 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 519")
end

					report_bad_character_error (text)
				
when 131 then
--|#line 522 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 522")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 132 then
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
			create an_array.make_filled (0, 0, 4594)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			yy_nxt_template_8 (an_array)
			yy_nxt_template_9 (an_array)
			yy_nxt_template_10 (an_array)
			yy_nxt_template_11 (an_array)
			yy_nxt_template_12 (an_array)
			yy_nxt_template_13 (an_array)
			yy_nxt_template_14 (an_array)
			yy_nxt_template_15 (an_array)
			yy_nxt_template_16 (an_array)
			yy_nxt_template_17 (an_array)
			yy_nxt_template_18 (an_array)
			yy_nxt_template_19 (an_array)
			yy_nxt_template_20 (an_array)
			yy_nxt_template_21 (an_array)
			yy_nxt_template_22 (an_array)
			yy_nxt_template_23 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   39,   40,   39,  180,  180,  181,  181,  214,  223,
			  214,  223,  450,   41,   39,   40,   39, 1205,  277,   42,
			  277,  296,  306,  296,  306, 1228,   41,  307,  307,  307,
			  326,  359,  326,  359, 1233,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   45,   46,
			   45,   45,   46,   45,  238,  238,   52,  110,  111,  110,
			   47,  239,  239,   47,  272,  272,   48, 1251,  112,   48,
			 1252,  113,  113,  113,  110,  111,  110,  216,  229,  230,
			  231,  232,  233,  234,  235,  112,  273,  273,  113,  113,

			  113,  228,  228,  228,  251,   49,  252,   50,   49,   51,
			   50, 1250,   51,   54,  237,  237,  237,  218,  114, 1249,
			  219,  240,  240,  240, 1252,  220,  261,  242,  242,  242,
			 1248,  221,  271,  271,  271,  114,  229,  230,  231,  232,
			  233,  234,  235,  243,  244,  245,  246,  247,  248,  249,
			  243,  244,  245,  246,  247,  248,  249,  253,  254,  255,
			  256,  257,  258,  259,   55,   55,   55,   55,   56,   57,
			   58,   59,   60,   61,   62,   54, 1246,  262,  263,  264,
			  265,  266,  267,  268,  274,  274,  274,  289, 1247,  290,
			  299,  299,  299,  301,  301,  301,  302,  302,  303,  303, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  304,  304,  304,  319,  319,  319,  321,  321,  321,  322,
			  322,  323,  323,  324,  324,  324,  330,  331,  332,  333,
			  334,  335,  336,  329,  329,  329,   55,   55,   55,   55,
			   56,   57,   58,   59,   60,   61,   62,   64,  418,   65,
			  418,   66,   67,  346,  346,  346,  347,  347,   68,  338,
			  339,  340,  341,  342,  343,  344,  348,  348,  349,  349,
			  349,  352,  353,  354,  355,  356,  357,  358,  360,  351,
			  351,  351,  362,  362,  362,  363,  363,  364,  364,  365,
			  365,  365,  387,  387,  387,  379,  390,  390,   55,   55,
			   55,   55,   69,   70,   71,   72,   73,   74,   75,   64,

			  432,   65,  433,   76,   67,  389,  389,  389,  391,  391,
			   68, 1246,  352,  353,  354,  355,  356,  357,  358,  379,
			  392,  392,  392,  402,  402,  402,  404,  404,  404,  380,
			  381,  382,  383,  384,  385,  386,  395,  396,  397,  398,
			  399,  400,  401,  405,  405,  406,  406,  407,  407,  407,
			   55,   55,   55,   55,   69,   70,   71,   72,   73,   74,
			   75,   78,   79,   78,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   80,   77,   81,   81,   81,   77,   77,
			   77,   77,   81,   82,   83,   84,   85,   86,   81,   81,
			   81,   81,   81,   87,   88,   89,   90,   91,   92,   81, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   81,   93,   81,   94,   81,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   98,   99,   98,   97,   97,
			   97,   97,   97,   97,   97,   97,   97,  100,   97,   97,
			   97,   97,   97,   97,   97,   97,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,   97,
			   97,   97,   97,   97,   97,   97,   97,   55,   55,   55,
			   55,  102,  103,  104,  105,  106,  107,  108,   97,  116,
			  420,  117,  419,  419,  419,  435,  435,  435,  424,  438,

			  438,  410,  437,  437,  437,  439,  439, 1245,  421,  425,
			  426,  427,  428,  429,  430,  431,  440,  440,  440,  443,
			  444,  445,  446,  447,  448,  449,  443,  444,  445,  446,
			  447,  448,  449,  118,  451, 1244,  452,  442,  442,  442,
			   55,   55,   55,   55,  119,  120,  121,  122,  123,  124,
			  125,  116, 1252,  117,  411,  412,  413,  414,  415,  416,
			  417,  471,  471,  471,  472,  472,  473,  473,  474,  474,
			  474,  214, 1054,  214,  476,  477,  478,  479,  480,  481,
			  482, 1055,  223,  483,  223,  238,  238,  453,  454,  455,
			  456,  457,  458,  459, 1243,  118, 1252,  228,  228,  228, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  239,  239,   55,   55,   55,   55,  119,  120,  121,  122,
			  123,  124,  125,  127,  128,  127,  126,  126,  126,  126,
			  126,  126,  129,  126,  130,  131,  126,  126,  126,  126,
			  126,  126,  126,  132,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  135, 1252, 1252,
			  221,  484,  221,  226,  226,  226,  272,  272,  227,  461,
			  227, 1242,  485,  486,  487,  488,  489,  490,  491,  492,

			  493,  229,  230,  231,  232,  233,  234,  235,  237,  237,
			  237,  240,  240,  240,  228,  228,  228,  226,  273,  273,
			  225, 1241, 1252, 1252, 1240,  136,  137, 1239,   55,   55,
			   55,   55,  138,  139,  140,  141,  142,  143,  144,  135,
			  462,  463,  464,  465,  466,  467,  468,  228,  228,  228,
			  228,  228,  228,  494,  494,  494,  495,  495,  495,  496,
			  496,  496,  243,  244,  245,  246,  247,  248,  249,  242,
			  242,  242,  271,  271,  271,  274,  274,  274,  251,  808,
			  252,  250,  250,  250,  507,  507,  507,  136,  137,  809,
			   55,   55,   55,   55,  138,  139,  140,  141,  142,  143, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  144,  146,  147,  146,  508,  508,  509,  509,  510,  510,
			  510, 1238,  497,  148,  260,  260,  260,  522,  522,  522,
			  523,  523,  524,  524,  498,  525,  525,  525,  242,  242,
			  242,  253,  254,  255,  256,  257,  258,  259,  260,  242,
			  242,  242,  242,  242,  242,  513,  527,  528,  529,  530,
			  531,  532,  533,   55,   55,   55,   55,  149,  150,  151,
			  152,  153,  154,  155,  146,  147,  146,  499,  500,  501,
			  502,  503,  504,  505,  586,  586,  148,  534,  534,  534,
			  535,  535,  535,  536,  536,  536,  587,  587,  514,  515,
			  516,  517,  518,  519,  520,  277,  547,  277, 1237,  296,

			  548,  296,  569,  570,  571,  572,  573,  574,  575,  299,
			  299,  299,  299,  299,  299, 1236,   55,   55,   55,   55,
			  149,  150,  151,  152,  153,  154,  155,  157,  299,  299,
			  299,  576,  576,  576,  577,  577,  577,  578,  578,  578,
			  306, 1235,  306,  307,  307,  307,  308,  308,  308,  585,
			  585,  585,  588,  588,  588,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  590,  590,  590,  591,  591,  591,
			  326,  158,  326,  159,  592,  592,  592, 1234,   55,   55,
			   55,   55,  160,  161,  162,  163,  164,  165,  166,  157,
			  593,  594,  595,  596,  597,  598,  599,  330,  331,  332, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  333,  334,  335,  336,  329,  329,  329,  601,  601,  601,
			  602,  602,  603,  603,  604,  604,  604,  338,  339,  340,
			  341,  342,  343,  344,  337,  337,  337,  607,  607,  607,
			  608,  608,  359,  158,  359,  159,  609,  609,  617,  617,
			   55,   55,   55,   55,  160,  161,  162,  163,  164,  165,
			  166,  168,  610,  610,  610,  329,  329,  329,  329,  329,
			  329,  621,  169,  329,  329,  329,  612,  612,  612,  613,
			  613,  613,  614,  614,  614,  352,  353,  354,  355,  356,
			  357,  358,  351,  351,  351,  616,  616,  616,  618,  618,
			  619,  619,  619,  639,  639,  170,  171,  351,  351,  351,

			  640,  640,   55,   55,   55,   55,  172,  173,  174,  175,
			  176,  177,  178,  168, 1233,  622,  623,  624,  625,  626,
			  627,  628,  645,  645,  169,  351,  351,  351,  351,  351,
			  351,  629,  629,  629,  630,  630,  630,  631,  631,  631,
			  367,  367,  367,  638,  638,  638,  641,  641,  641,  378,
			  378,  378,  644,  644,  644,  646,  646,  170,  171,  647,
			  647,  647,  654,  654,   55,   55,   55,   55,  172,  173,
			  174,  175,  176,  177,  178,  183,  184,  183,  185,  186,
			  182,  182,  187,  188,  188,  188,  182,  182,  188,  182,
			  182,  182,  182,  189,  182,  182,  182,  182,  182,  182, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  190,
			  191,  182,  182,  182,  192,  188,  182,   55,   55,   55,
			   55,  193,  194,  195,  196,  197,  198,  199,  182,  201,
			 1232,  202,  655,  655,  203,  387,  387,  387,  663,  663,
			  204,  387,  387,  387,  387,  387,  387,  649,  649,  649,
			  650,  650,  650,  651,  651,  651,  394,  394,  394,  653,
			  653,  653,  656,  656,  656,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  658,  658,  658,  205,  410,  206,
			   55,   55,   55,   55,  207,  208,  209,  210,  211,  212,

			  213,  201, 1231,  202,  664,  664,  203,  659,  659,  659,
			  691,  691,  204,  660,  660,  660,  409,  409,  409,  662,
			  662,  662,  665,  665,  665,  418, 1230,  418,  423,  423,
			  423,  690,  690,  690,  692,  692,  693,  693,  693,  472,
			  472,  411,  412,  413,  414,  415,  416,  417,  803,  205,
			  804,  206,   55,   55,   55,   55,  207,  208,  209,  210,
			  211,  212,  213,  309,  670,  671,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  672,  673,  674,  675,  676,
			  677,  678, 1252, 1229, 1252, 1227,  434,  434,  434,  310,
			  473,  473,  311,  698,  698,  698,  699,  699,  699,  700, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  700,  700,  442,  442,  442,  312,  313,  314,  315,  316,
			  317,  318,  368,  443,  444,  445,  446,  447,  448,  449,
			  434,  701, 1226,  697,  471,  471,  471,  474,  474,  474,
			  450,  450,  450,  702,  711,  711,  711, 1225,  369, 1224,
			  451,  370,  452,  712,  712,  713,  713,  714,  714,  714,
			  460,  460,  460, 1223,  371,  372,  373,  374,  375,  376,
			  377,  309,  460,  726,  726,  726,  727,  727, 1222,  717,
			  728,  728,  729,  729,  729, 1221,  703,  704,  705,  706,
			  707,  708,  709,  442,  442,  442, 1220,  310,  743,  743,
			  311,  744,  744,  453,  454,  455,  456,  457,  458,  459,

			  442,  442,  442,  312,  313,  314,  315,  316,  317,  318,
			  309, 1219,  718,  719,  720,  721,  722,  723,  724,  731,
			  732,  733,  734,  735,  736,  737,  442,  442,  442,  738,
			  738,  738,  739,  739,  739, 1218,  310,  751,  751,  311,
			  740,  740,  740,  215,  215,  215,  742,  742,  742,  745,
			  745,  745,  312,  313,  314,  315,  316,  317,  318,  537,
			 1217,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  278,  537,  278,  278,  278,  537,  537,  537,  537,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  278,  278,  278,  537,  537,  537,  537,  537,  537,  537,
			  537, 1252,  224,  224,  224,  538,  539,  540,  541,  542,
			  543,  544,  537,  553,  554,  555,  556,  557,  750,  750,
			  750,  752,  752,  558,  559,  760,  760,  560,  561,  753,
			  753,  753, 1216,  562,  679,  747,  228,  228,  228,  228,
			  228,  228,  228,  228,  228, 1252,  757,  757,  757,  250,
			  250,  250,  759,  759,  759,  761,  761,  762,  762,  762,
			  680,  770,  770,  681,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  764,  764,  764,  682,  683,  684,  685,
			  686,  687,  688,  765,  765,  765,  766,  766,  766,  767,

			  767,  767,  260,  260,  260,  769,  769,  769,  771,  771,
			  772,  772,  772,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  774,  774,  774,  775,  775,  775,  776,  776,
			  776,  269,  269,  269,  778,  778,  778,  779,  779,  780,
			  780,  781,  781,  781,  242,  242,  242,  242,  242,  242,
			  242,  242,  242,  538,  539,  540,  541,  542,  543,  544,
			  537,  537,  537,  784,  784,  784,  785,  785,  786,  786,
			  787,  787,  787,  297,  297,  297,  815,  815,  815,  816,
			  816,  817,  817,  818,  818,  818,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  821,  821,  821,  308,  308, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  308, 1215,  821,  821,  821,  821,  821,  821,  822,  822,
			  822,  308,  308,  308, 1214,  822,  822,  822,  822,  822,
			  822,  823,  823,  823,  308,  308,  308, 1213,  823,  823,
			  823,  823,  823,  823,  824,  824,  824,  825,  825,  825,
			 1210,  824,  824,  824,  824,  824,  824,  826,  826,  826,
			  827,  827,  827,  319,  319,  319,  319,  319,  319,  319,
			  319,  319,  327,  327,  327,  829,  829,  829,  830,  830,
			  831,  831,  832,  832,  832,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  834,  834,  834,  835,  835,  835,
			  836,  836,  836,  337,  337,  337,  337,  337,  337,  337,

			  337,  337,  837,  837,  837,  838,  838,  838,  839,  839,
			  839,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  351,  351,  351,  351,  351,  351,  351,  351,  351,  840,
			  840,  840,  841,  841,  841,  842,  842,  842,  843,  844,
			  845,  846,  847,  848,  849,  360,  360,  360,  851,  851,
			  851,  852,  852,  853,  853,  854,  854,  854,  351,  351,
			  351,  351,  351,  351,  351,  351,  351,  857,  857,  857,
			  367,  367,  367, 1209,  857,  857,  857,  857,  857,  857,
			  858,  858,  858,  367,  367,  367, 1208,  858,  858,  858,
			  858,  858,  858,  859,  859,  859,  367,  367,  367, 1207, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  859,  859,  859,  859,  859,  859,  860,  860,  860,  861,
			  861,  861, 1206,  860,  860,  860,  860,  860,  860,  862,
			  862,  862,  863,  863,  863,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  864,  864,  864,  865,  865,  865,
			  866,  866,  866,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  867,  867,  867,  868,  868,  868,  869,  869,  869,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  870,  870,
			  870,  871,  871,  871,  872,  872,  872,  874,  423,  423,

			  423,  885,  885,  885,  886,  886,  887,  887,  888,  888,
			  888,  423,  423,  423,  896,  896,  896,  897,  897,  898,
			  898,  908,  908,  875,  909,  909,  876,  899,  899,  899,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  877,
			  878,  879,  880,  881,  882,  883,  890,  901,  901,  901,
			  902,  902,  902,  903,  903,  903,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  905,  905,  905,  450,  450,
			  450,  907,  907,  907,  910,  910,  910,  670,  671,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  672,  673,
			  674,  675,  676,  677,  678,  891,  891,  891,  912,  912, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  912, 1204,  891,  891,  891,  891,  891,  891,  913,  913,
			  913,  914,  914,  914,  915,  915,  915,  460,  460,  460,
			  917,  917,  917,  918,  918, 1203,  670,  671,  919,  919,
			  892,  920,  920,  920,  460,  460,  460,  672,  673,  674,
			  675,  676,  677,  678,  893,  893,  893,  460,  460,  460,
			 1202,  893,  893,  893,  893,  893,  893,  460,  460,  460,
			  922,  922,  922,  923,  923,  923,  924,  924,  924,  469,
			  469,  469,  926,  926,  926,  927,  927,  928,  928,  894,
			  929,  929,  929,  442,  442,  442,  442,  442,  442,  442,
			  442,  442,  215,  215,  215,  215,  215,  215,  215,  215,

			  215,  931,  931,  931,  932,  932,  932,  933,  933,  933,
			 1252,  484,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  942,  942,  942,  943,  943,  943,  944,  944,  944,
			  250,  757,  757,  757,  934,  945,  946,  947,  948,  949,
			  950,  951,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  952,  952,  952, 1252,  953,  953,  953,  954,  954,
			  954,  250,  250,  250,  999,  999,  935,  936,  937,  938,
			  939,  940,  941,  250,  250,  250,  250,  250,  250,  260,
			  767,  767,  767,  260,  260,  260,  260,  260,  260,  260,
			  260,  260,  955,  955,  955,  956,  956,  956,  957,  957, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  957,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  958,
			  958,  958,  959,  959,  959,  960,  960,  960,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  961,  961,  961,
			  962,  962,  962,  963,  963,  963,  971,  984, 1000, 1000,
			  972,  985,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  987,  987,  987,  988,  988,  988,  989,  989,  989,
			  990,  990,  990,  308,  308,  308, 1201,  990,  990,  990,
			  990,  990,  990,  308,  308,  308,  308,  308,  308,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  994,  994,

			  994,  995,  995,  995,  996,  996,  996,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  351,  351,  351,  351,  351,
			  351,  351,  351,  351,  621,  621,  621,  998,  998,  998,
			 1001, 1001, 1001,  360,  360,  360,  360,  360,  360,  360,
			  360,  360, 1003, 1003, 1003, 1004, 1004, 1004, 1005, 1005,
			 1005, 1006, 1006, 1006,  367,  367,  367, 1200, 1006, 1006,
			 1006, 1006, 1006, 1006,  367,  367,  367,  367,  367,  367,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  409,  409, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  409,  409,  409,  409,  409,  409,  409, 1011,  423,  423,
			  423,  423,  423,  859,  423,  423,  423,  423,  423,  423,
			 1017, 1017, 1017, 1018, 1018, 1019, 1019, 1020, 1020, 1020,
			  423,  423,  423,  423,  423,  423,  423,  423,  423, 1022,
			 1022, 1022,  423, 1012, 1012, 1012, 1023, 1023, 1023, 1008,
			 1012, 1012, 1012, 1012, 1012, 1012, 1024, 1024, 1024,  670,
			  671,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  672,  673,  674,  675,  676,  677,  678, 1252, 1013, 1014,
			 1014, 1014,  670,  671, 1043, 1043, 1014, 1014, 1014, 1014,
			 1014, 1014,  823,  672,  673,  674,  675,  676,  677,  678,

			 1028, 1028, 1028, 1029, 1029, 1029, 1030, 1030, 1030,  423,
			  423,  423, 1044, 1044, 1015, 1025, 1025, 1025,  423,  423,
			  423, 1252, 1025, 1025, 1025, 1025, 1025, 1025,  423,  423,
			  423,  450,  905,  905,  905,  450,  450,  450,  450,  450,
			  450,  450,  450,  450, 1031, 1031, 1031, 1032, 1032, 1032,
			  423, 1026, 1026, 1026, 1033, 1033, 1033,  992, 1026, 1026,
			 1026, 1026, 1026, 1026,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  460,  915,  915,  915,  460,  460,  460,
			  460,  460,  460,  460,  460,  460,  423, 1027, 1027, 1027,
			 1034, 1034, 1034, 1195, 1027, 1027, 1027, 1027, 1027, 1027, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1035, 1035, 1035, 1036, 1036, 1036,  460,  460,  460,  460,
			  460,  460,  460,  460,  460,  469,  469,  469,  469,  469,
			  469, 1252,  423,  469,  469,  469, 1037, 1037, 1037, 1038,
			 1038, 1038, 1039, 1039, 1039,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  748,  748,  748, 1042, 1042, 1042,
			 1194, 1040, 1045, 1045, 1045,  224,  224,  224,  224,  224,
			  224,  224,  224,  224, 1193, 1252,  755,  755,  755, 1048,
			 1048, 1048, 1049, 1049, 1050, 1050, 1051, 1051, 1051,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  269,  269,  269,

			  269,  269,  269,  269,  269,  269,  537,  537,  537,  537,
			  537,  537,  537,  537,  537, 1065, 1072,  297,  297,  297,
			 1073,  297,  297,  297, 1192, 1066,  297,  297,  297,  992,
			  992,  992,  327,  327,  327, 1191,  992,  992,  992,  992,
			  992,  992,  327,  327,  327,  327,  327,  327,  621,  621,
			  621,  621,  621,  621,  621,  621,  621, 1079, 1079, 1079,
			 1080, 1080, 1080, 1081, 1081, 1081,  360,  360,  360,  360,
			  360,  360,  360,  360,  360, 1008, 1008, 1008,  670,  671,
			  226,  226, 1008, 1008, 1008, 1008, 1008, 1008, 1190,  672,
			  673,  674,  675,  676,  677,  678, 1085, 1085, 1085,  670, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  671, 1189, 1188, 1085, 1085, 1085, 1085, 1085, 1085, 1187,
			  672,  673,  674,  675,  676,  677,  678,  423,  423,  423,
			  423,  423,  423,  423,  423,  423, 1088, 1088, 1088, 1135,
			 1186,  423, 1086, 1086, 1086, 1089, 1089, 1089, 1136, 1086,
			 1086, 1086, 1086, 1086, 1086, 1090, 1090, 1090,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423, 1185,  423, 1087, 1087,
			 1087,  450,  450,  450, 1184, 1087, 1087, 1087, 1087, 1087,
			 1087,  450,  450,  450,  450,  450,  450,  460,  460,  460,
			  460,  460,  460,  460,  460,  460,  469,  469,  469,  469,

			  469,  469, 1252,  423, 1091, 1091, 1091,  469,  469,  469,
			 1183, 1091, 1091, 1091, 1091, 1091, 1091,  748,  748,  748,
			  748,  748,  748,  748,  748,  748, 1095, 1095, 1095, 1182,
			  859, 1094, 1096, 1096, 1096, 1097, 1097, 1097, 1008,  423,
			 1092, 1092, 1092,  755,  755,  755, 1252, 1092, 1092, 1092,
			 1092, 1092, 1092,  755,  755,  755,  755,  755,  755, 1098,
			 1098, 1098, 1099, 1099, 1099, 1100, 1100, 1100, 1112,  621,
			  621,  621, 1113,  823,  992,  423, 1093, 1093, 1093,  621,
			  621,  621, 1173, 1093, 1093, 1093, 1093, 1093, 1093,  621,
			  621,  621,  423,  423,  423,  423,  423,  423,  423,  423, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  423,  748,  748,  748,  748,  748,  748,  748,  748,  748,
			 1172,  423, 1126, 1126, 1126,  670,  671, 1171, 1170, 1126,
			 1126, 1126, 1126, 1126, 1126, 1169,  672,  673,  674,  675,
			  676,  677,  678,  755,  755,  755,  755,  755,  755,  755,
			  755,  755, 1140, 1168, 1167, 1166, 1141,  423, 1127, 1127,
			 1127,  670,  671, 1165, 1164, 1127, 1127, 1127, 1127, 1127,
			 1127, 1163,  672,  673,  674,  675,  676,  677,  678,  217,
			  279,  279,  279,  279,  217,  217,  434,  434,  217,  434,
			  434, 1162, 1161,  423, 1128, 1128, 1128,  670,  671, 1160,
			 1159, 1128, 1128, 1128, 1128, 1128, 1128,  859,  672,  673,

			  674,  675,  676,  677,  678,  222,  222,  222, 1008,  222,
			  298,  298,  298,  823,  298,  992, 1150, 1149, 1148,  423,
			 1129, 1129, 1129,  670,  671, 1147, 1146, 1129, 1129, 1129,
			 1129, 1129, 1129, 1145,  672,  673,  674,  675,  676,  677,
			  678,  328,  328,  328, 1144,  328,  580,  580,  582,  582,
			 1143,  580, 1142,  582, 1139,  423, 1130, 1130, 1130,  670,
			  671, 1138, 1137, 1130, 1130, 1130, 1130, 1130, 1130, 1134,
			  672,  673,  674,  675,  676,  677,  678,  633,  633,  635,
			  635, 1133,  633, 1132,  635, 1131, 1125,  859, 1008,  823,
			  992,  423, 1155, 1155, 1155,  670,  671, 1120, 1119, 1155, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1155, 1155, 1155, 1155, 1155, 1118,  672,  673,  674,  675,
			  676,  677,  678,  991,  991,  993,  993, 1007, 1007,  991,
			 1117,  993, 1116, 1007, 1115, 1009, 1009,  423, 1156, 1156,
			 1156, 1009, 1114, 1111, 1110, 1156, 1156, 1156, 1156, 1156,
			 1156, 1077, 1077, 1078, 1078, 1082, 1082, 1077, 1109, 1078,
			 1108, 1082, 1083, 1083, 1121, 1121, 1122, 1122, 1083, 1107,
			 1121, 1106, 1122,  423, 1157, 1157, 1157, 1105, 1104, 1103,
			 1102, 1157, 1157, 1157, 1157, 1157, 1157, 1123, 1123, 1124,
			 1124, 1151, 1151, 1123, 1101, 1124, 1084, 1151, 1152, 1152,
			 1153, 1153, 1154, 1154, 1152,  859, 1153, 1008, 1154,  423,

			 1158, 1158, 1158,  823,  992, 1076, 1075, 1158, 1158, 1158,
			 1158, 1158, 1158, 1174, 1174, 1175, 1175, 1176, 1176, 1174,
			 1074, 1175, 1071, 1176, 1177, 1177, 1070, 1069, 1068, 1067,
			 1177, 1064, 1063, 1062, 1061,  423, 1178, 1178, 1178, 1060,
			 1059, 1058, 1057, 1178, 1178, 1178, 1178, 1178, 1178, 1056,
			 1053, 1052, 1047, 1046, 1041, 1021, 1016, 1010,  859, 1008,
			 1002,  997,  823,  992,  986,  983,  982,  981,  980,  979,
			  978,  423, 1179, 1179, 1179,  977,  976,  975,  974, 1179,
			 1179, 1179, 1179, 1179, 1179,  973,  970,  969,  968,  967,
			  966,  965,  964,  250,  930,  925,  921,  916,  911,  906, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  904,  900,  895,  889,  884,  873,  856,  423, 1180, 1180,
			 1180,  855,  850,  833,  828, 1180, 1180, 1180, 1180, 1180,
			 1180,  820,  819,  814,  813,  812,  811,  810,  807,  806,
			  805,  802,  801,  800,  799,  798,  797,  796,  795,  794,
			  793,  792,  791,  423, 1181, 1181, 1181,  790,  789,  788,
			  783, 1181, 1181, 1181, 1181, 1181, 1181,  782,  777,  773,
			  768,  763,  758,  756,  755,  754,  749,  748,  746,  741,
			  730,  725,  716,  715,  710,  475,  470,  696,  695,  423,
			 1196, 1196, 1196,  694,  689,  669,  668, 1196, 1196, 1196,
			 1196, 1196, 1196,  667,  666,  661,  657,  652,  648,  643,

			  642,  637,  636,  634,  632,  620,  615,  611,  606,  605,
			  600,  589,  584,  583,  581,  423, 1197, 1197, 1197,  579,
			  295,  568,  567, 1197, 1197, 1197, 1197, 1197, 1197,  566,
			  565,  564,  563,  552,  551,  550,  549,  546,  545,  526,
			  521,  512,  511,  506,  275,  270,  241,  236,  475,  470,
			  469,  423, 1198, 1198, 1198,  441,  436,  422,  408, 1198,
			 1198, 1198, 1198, 1198, 1198,  403,  393,  388,  366,  361,
			  350,  345,  327,  325,  320,  305,  300,  297,  295,  293,
			  292,  291,  288,  287,  286,  285,  284,  423, 1199, 1199,
			 1199,  283,  282,  281,  280, 1199, 1199, 1199, 1199, 1199, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1199,  278,  276,  275,  270,  269,  241,  236,  227,  225,
			  224,  215, 1252,   96,   96, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252,  423, 1211, 1211, 1211, 1252, 1252, 1252,
			 1252, 1211, 1211, 1211, 1211, 1211, 1211, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,  423,
			 1212, 1212, 1212, 1252, 1252, 1252, 1252, 1212, 1212, 1212,
			 1212, 1212, 1212, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252,  423,   38,   38,   38,   38,

			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  115,  115,  115,  115,  115,  115,  115,  115, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  115,  115,  115,  115,  115,  115,  115,  115,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  179,  179,  179,  179,  179,  179,  179,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,

			  200,  200,  200,  200,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228, 1252,  228,
			  242,  242, 1252, 1252, 1252,  242, 1252,  242,  242,  242,
			  242,  242,  242,  242, 1252,  242,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250, 1252,
			  250,  260,  260,  260, 1252,  260,  260,  260,  260,  260,
			  260,  260,  260,  260, 1252,  260,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  308,  308,  308,  308,  308,  308,  308,  308,
			  308,  308,  308,  308,  308, 1252,  308,  329,  329,  329, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			 1252,  329,  337,  337,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  337, 1252,  337,  351,  351,  351,
			  351,  351,  351,  351,  351,  351,  351,  351,  351, 1252,
			  351,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367, 1252,  367,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			 1252,  378,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394, 1252,  394,  394,  394, 1252,  394,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,

			  409, 1252,  409,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423, 1252,  423,  442,  442,
			 1252,  442, 1252,  442, 1252,  442,  442,  442,  442,  442,
			 1252, 1252, 1252,  442,  450,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450, 1252,  450,  460,
			  460,  460, 1252,  460,  460,  460,  460,  460,  460,  460,
			  460,  460, 1252,  460,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215, 1252,  215,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224, 1252,  224,  269,  269,  269,  269,  269,  269, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  269,  269,  269,  269,  269,  269,  269, 1252,  269,  297,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  297, 1252,  297,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327, 1252,  327,  360,
			  360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360, 1252,  360,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469, 1252,  469,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  537, 1252,  537,  621,  621,  621,  621,  621,  621,
			  621,  621,  621,  621,  621,  621,  621, 1252,  621,  748,

			  748,  748,  748,  748,  748,  748,  748,  748,  748,  748,
			  748,  748,  748, 1252,  748,  755,  755,  755,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755, 1252,  755,
			   37, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 195, 4400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4594)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			yy_chk_template_8 (an_array)
			yy_chk_template_9 (an_array)
			yy_chk_template_10 (an_array)
			yy_chk_template_11 (an_array)
			yy_chk_template_12 (an_array)
			yy_chk_template_13 (an_array)
			yy_chk_template_14 (an_array)
			yy_chk_template_15 (an_array)
			yy_chk_template_16 (an_array)
			yy_chk_template_17 (an_array)
			yy_chk_template_18 (an_array)
			yy_chk_template_19 (an_array)
			yy_chk_template_20 (an_array)
			yy_chk_template_21 (an_array)
			yy_chk_template_22 (an_array)
			yy_chk_template_23 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,   31,   32,   31,   32,   39,   45,
			   39,   45,  904,    1,    2,    2,    2, 1189,   78,    2,
			   78,   98,  110,   98,  110, 1218,    2,  113,  113,  113,
			  127,  146,  127,  146, 1250,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    3,    3,
			    3,    4,    4,    4,   59,   59,    4,   17,   17,   17,
			    3,   60,   60,    4,   72,   72,    3, 1248,   17,    4,
			  217,   17,   17,   17,   18,   18,   18,   42,   53,   53,
			   53,   53,   53,   53,   53,   18,   73,   73,   18,   18,

			   18,   56,   56,   56,   65,    3,   65,    3,    4,    3,
			    4, 1247,    4,    5,   58,   58,   58,   42,   17, 1244,
			   42,   61,   61,   61,  217,   42,   67,   69,   69,   69,
			 1243,   42,   71,   71,   71,   18,   54,   54,   54,   54,
			   54,   54,   54,   63,   63,   63,   63,   63,   63,   63,
			   64,   64,   64,   64,   64,   64,   64,   65,   65,   65,
			   65,   65,   65,   65,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    6, 1242,   67,   67,   67,
			   67,   67,   67,   67,   74,   74,   74,   91, 1241,   91,
			  102,  102,  102,  104,  104,  104,  105,  105,  106,  106, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  107,  107,  107,  119,  119,  119,  121,  121,  121,  122,
			  122,  123,  123,  124,  124,  124,  134,  134,  134,  134,
			  134,  134,  134,  138,  138,  138,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    7,  183,    7,
			  183,    7,    7,  140,  140,  140,  141,  141,    7,  137,
			  137,  137,  137,  137,  137,  137,  142,  142,  143,  143,
			  143,  145,  145,  145,  145,  145,  145,  145,  148,  149,
			  149,  149,  151,  151,  151,  152,  152,  153,  153,  154,
			  154,  154,  160,  160,  160,  159,  163,  163,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    7,    8,

			  192,    8,  192,    8,    8,  162,  162,  162,  164,  164,
			    8, 1240,  148,  148,  148,  148,  148,  148,  148,  159,
			  165,  165,  165,  172,  172,  172,  174,  174,  174,  159,
			  159,  159,  159,  159,  159,  159,  169,  169,  169,  169,
			  169,  169,  169,  175,  175,  176,  176,  177,  177,  177,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   19,
			  187,   19,  186,  186,  186,  193,  193,  193,  190,  196,

			  196,  181,  195,  195,  195,  197,  197, 1238,  187,  190,
			  190,  190,  190,  190,  190,  190,  198,  198,  198,  200,
			  200,  200,  200,  200,  200,  200,  201,  201,  201,  201,
			  201,  201,  201,   19,  202, 1237,  202,  207,  207,  207,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   20,  218,   20,  181,  181,  181,  181,  181,  181,
			  181,  209,  209,  209,  210,  210,  211,  211,  212,  212,
			  212,  214,  965,  214,  215,  215,  215,  215,  215,  215,
			  215,  965,  223,  218,  223,  232,  232,  202,  202,  202,
			  202,  202,  202,  202, 1236,   20,  218,  229,  229,  229, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  233,  233,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   20,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   23,  219,  220,
			  221,  221,  221,  226,  226,  226,  246,  246,  227,  203,
			  227, 1235,  221,  224,  224,  224,  224,  224,  224,  224,

			  227,  228,  228,  228,  228,  228,  228,  228,  231,  231,
			  231,  234,  234,  234,  236,  236,  236,  226,  247,  247,
			  226, 1234,  219,  220, 1232,   23,   23, 1231,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   23,   23,   24,
			  203,  203,  203,  203,  203,  203,  203,  237,  237,  237,
			  238,  238,  238,  239,  239,  239,  240,  240,  240,  241,
			  241,  241,  242,  242,  242,  242,  242,  242,  242,  243,
			  243,  243,  245,  245,  245,  248,  248,  248,  250,  564,
			  250,  253,  253,  253,  255,  255,  255,   24,   24,  564,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   24,   25,   25,   25,  256,  256,  257,  257,  258,  258,
			  258, 1230,  252,   25,  262,  262,  262,  264,  264,  264,
			  265,  265,  266,  266,  252,  267,  267,  267,  270,  270,
			  270,  250,  250,  250,  250,  250,  250,  250,  261,  271,
			  271,  271,  272,  272,  272,  261,  269,  269,  269,  269,
			  269,  269,  269,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   26,   26,   26,  252,  252,  252,
			  252,  252,  252,  252,  315,  315,   26,  273,  273,  273,
			  274,  274,  274,  275,  275,  275,  316,  316,  261,  261,
			  261,  261,  261,  261,  261,  277,  282,  277, 1229,  296,

			  282,  296,  297,  297,  297,  297,  297,  297,  297,  300,
			  300,  300,  301,  301,  301, 1228,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   27,  302,  302,
			  302,  303,  303,  303,  304,  304,  304,  305,  305,  305,
			  306, 1226,  306,  307,  307,  307,  312,  312,  312,  314,
			  314,  314,  317,  317,  317,  320,  320,  320,  321,  321,
			  321,  322,  322,  322,  323,  323,  323,  324,  324,  324,
			  326,   27,  326,   27,  325,  325,  325, 1225,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   28,
			  327,  327,  327,  327,  327,  327,  327,  329,  329,  329, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  329,  329,  329,  329,  330,  330,  330,  332,  332,  332,
			  333,  333,  334,  334,  335,  335,  335,  337,  337,  337,
			  337,  337,  337,  337,  338,  338,  338,  340,  340,  340,
			  341,  341,  359,   28,  359,   28,  342,  342,  355,  355,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   29,  343,  343,  343,  345,  345,  345,  346,  346,
			  346,  360,   29,  347,  347,  347,  348,  348,  348,  349,
			  349,  349,  350,  350,  350,  351,  351,  351,  351,  351,
			  351,  351,  352,  352,  352,  354,  354,  354,  356,  356,
			  357,  357,  357,  374,  374,   29,   29,  361,  361,  361,

			  375,  375,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   30, 1224,  360,  360,  360,  360,  360,
			  360,  360,  383,  383,   30,  362,  362,  362,  363,  363,
			  363,  364,  364,  364,  365,  365,  365,  366,  366,  366,
			  371,  371,  371,  373,  373,  373,  376,  376,  376,  380,
			  380,  380,  382,  382,  382,  384,  384,   30,   30,  385,
			  385,  385,  398,  398,   30,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   35,
			 1223,   35,  399,  399,   35,  388,  388,  388,  414,  414,
			   35,  389,  389,  389,  390,  390,  390,  391,  391,  391,
			  392,  392,  392,  393,  393,  393,  395,  395,  395,  397,
			  397,  397,  400,  400,  400,  403,  403,  403,  404,  404,
			  404,  405,  405,  405,  406,  406,  406,   35,  409,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,

			   35,   36, 1222,   36,  415,  415,   36,  407,  407,  407,
			  428,  428,   36,  408,  408,  408,  411,  411,  411,  413,
			  413,  413,  416,  416,  416,  418, 1221,  418,  425,  425,
			  425,  427,  427,  427,  429,  429,  430,  430,  430,  446,
			  446,  409,  409,  409,  409,  409,  409,  409,  560,   36,
			  560,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,  118,  423,  423,  436,  436,  436,  437,
			  437,  437,  438,  438,  438,  423,  423,  423,  423,  423,
			  423,  423,  434, 1220,  434, 1217,  434,  434,  434,  118,
			  447,  447,  118,  439,  439,  439,  440,  440,  440,  441, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  441,  441,  443,  443,  443,  118,  118,  118,  118,  118,
			  118,  118,  158,  442,  442,  442,  442,  442,  442,  442,
			  434,  452, 1216,  434,  445,  445,  445,  448,  448,  448,
			  453,  453,  453,  452,  455,  455,  455, 1215,  158, 1214,
			  450,  158,  450,  456,  456,  457,  457,  458,  458,  458,
			  462,  462,  462, 1213,  158,  158,  158,  158,  158,  158,
			  158,  170,  461,  464,  464,  464,  465,  465, 1210,  461,
			  466,  466,  467,  467,  467, 1209,  452,  452,  452,  452,
			  452,  452,  452,  470,  470,  470, 1207,  170,  479,  479,
			  170,  480,  480,  450,  450,  450,  450,  450,  450,  450,

			  471,  471,  471,  170,  170,  170,  170,  170,  170,  170,
			  191, 1206,  461,  461,  461,  461,  461,  461,  461,  469,
			  469,  469,  469,  469,  469,  469,  472,  472,  472,  473,
			  473,  473,  474,  474,  474, 1205,  191,  489,  489,  191,
			  475,  475,  475,  476,  476,  476,  478,  478,  478,  481,
			  481,  481,  191,  191,  191,  191,  191,  191,  191,  278,
			 1204,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  483,  486,  486,  486,  278,  278,  278,  278,  278,
			  278,  278,  278,  287,  287,  287,  287,  287,  488,  488,
			  488,  490,  490,  287,  287,  502,  502,  287,  287,  491,
			  491,  491, 1203,  287,  424,  483,  494,  494,  494,  495,
			  495,  495,  496,  496,  496,  483,  498,  498,  498,  499,
			  499,  499,  501,  501,  501,  503,  503,  504,  504,  504,
			  424,  517,  517,  424,  506,  506,  506,  507,  507,  507,
			  508,  508,  508,  509,  509,  509,  424,  424,  424,  424,
			  424,  424,  424,  510,  510,  510,  511,  511,  511,  513,

			  513,  513,  514,  514,  514,  516,  516,  516,  518,  518,
			  519,  519,  519,  521,  521,  521,  522,  522,  522,  523,
			  523,  523,  524,  524,  524,  525,  525,  525,  526,  526,
			  526,  527,  527,  527,  529,  529,  529,  530,  530,  531,
			  531,  532,  532,  532,  534,  534,  534,  535,  535,  535,
			  536,  536,  536,  537,  537,  537,  537,  537,  537,  537,
			  538,  538,  538,  540,  540,  540,  541,  541,  542,  542,
			  543,  543,  543,  569,  569,  569,  571,  571,  571,  572,
			  572,  573,  573,  574,  574,  574,  576,  576,  576,  577,
			  577,  577,  578,  578,  578,  580,  580,  580,  584,  584, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  584, 1202,  580,  580,  580,  580,  580,  580,  581,  581,
			  581,  585,  585,  585, 1201,  581,  581,  581,  581,  581,
			  581,  582,  582,  582,  586,  586,  586, 1200,  582,  582,
			  582,  582,  582,  582,  583,  583,  583,  587,  587,  587,
			 1195,  583,  583,  583,  583,  583,  583,  588,  588,  588,
			  589,  589,  589,  590,  590,  590,  591,  591,  591,  592,
			  592,  592,  593,  593,  593,  595,  595,  595,  596,  596,
			  597,  597,  598,  598,  598,  600,  600,  600,  601,  601,
			  601,  602,  602,  602,  603,  603,  603,  604,  604,  604,
			  605,  605,  605,  606,  606,  606,  607,  607,  607,  608,

			  608,  608,  609,  609,  609,  610,  610,  610,  611,  611,
			  611,  612,  612,  612,  613,  613,  613,  614,  614,  614,
			  615,  615,  615,  616,  616,  616,  617,  617,  617,  618,
			  618,  618,  619,  619,  619,  620,  620,  620,  621,  621,
			  621,  621,  621,  621,  621,  622,  622,  622,  624,  624,
			  624,  625,  625,  626,  626,  627,  627,  627,  629,  629,
			  629,  630,  630,  630,  631,  631,  631,  633,  633,  633,
			  637,  637,  637, 1193,  633,  633,  633,  633,  633,  633,
			  634,  634,  634,  638,  638,  638, 1192,  634,  634,  634,
			  634,  634,  634,  635,  635,  635,  639,  639,  639, 1191, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  635,  635,  635,  635,  635,  635,  636,  636,  636,  640,
			  640,  640, 1190,  636,  636,  636,  636,  636,  636,  641,
			  641,  641,  642,  642,  642,  643,  643,  643,  644,  644,
			  644,  645,  645,  645,  646,  646,  646,  647,  647,  647,
			  648,  648,  648,  649,  649,  649,  650,  650,  650,  651,
			  651,  651,  652,  652,  652,  653,  653,  653,  654,  654,
			  654,  655,  655,  655,  656,  656,  656,  657,  657,  657,
			  658,  658,  658,  659,  659,  659,  660,  660,  660,  661,
			  661,  661,  662,  662,  662,  663,  663,  663,  664,  664,
			  664,  665,  665,  665,  666,  666,  666,  670,  672,  672,

			  672,  674,  674,  674,  675,  675,  676,  676,  677,  677,
			  677,  682,  682,  682,  684,  684,  684,  685,  685,  686,
			  686,  706,  706,  670,  707,  707,  670,  687,  687,  687,
			  689,  689,  689,  690,  690,  690,  691,  691,  691,  670,
			  670,  670,  670,  670,  670,  670,  679,  692,  692,  692,
			  693,  693,  693,  694,  694,  694,  698,  698,  698,  699,
			  699,  699,  700,  700,  700,  702,  702,  702,  703,  703,
			  703,  705,  705,  705,  708,  708,  708,  679,  679,  710,
			  710,  710,  711,  711,  711,  712,  712,  712,  679,  679,
			  679,  679,  679,  679,  679,  680,  680,  680,  713,  713, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  713, 1188,  680,  680,  680,  680,  680,  680,  714,  714,
			  714,  715,  715,  715,  717,  717,  717,  718,  718,  718,
			  720,  720,  720,  721,  721, 1185,  680,  680,  722,  722,
			  680,  723,  723,  723,  725,  725,  725,  680,  680,  680,
			  680,  680,  680,  680,  681,  681,  681,  726,  726,  726,
			 1184,  681,  681,  681,  681,  681,  681,  727,  727,  727,
			  728,  728,  728,  729,  729,  729,  730,  730,  730,  731,
			  731,  731,  733,  733,  733,  734,  734,  735,  735,  681,
			  736,  736,  736,  738,  738,  738,  739,  739,  739,  740,
			  740,  740,  741,  741,  741,  742,  742,  742,  743,  743,

			  743,  744,  744,  744,  745,  745,  745,  746,  746,  746,
			  747,  748,  749,  749,  749,  750,  750,  750,  751,  751,
			  751,  752,  752,  752,  753,  753,  753,  754,  754,  754,
			  757,  757,  757,  757,  747,  755,  755,  755,  755,  755,
			  755,  755,  758,  758,  758,  759,  759,  759,  760,  760,
			  760,  761,  761,  761,  747,  762,  762,  762,  763,  763,
			  763,  764,  764,  764,  846,  846,  748,  748,  748,  748,
			  748,  748,  748,  765,  765,  765,  766,  766,  766,  767,
			  767,  767,  767,  768,  768,  768,  769,  769,  769,  770,
			  770,  770,  771,  771,  771,  772,  772,  772,  773,  773, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  773,  774,  774,  774,  775,  775,  775,  776,  776,  776,
			  777,  777,  777,  778,  778,  778,  779,  779,  779,  780,
			  780,  780,  781,  781,  781,  782,  782,  782,  783,  783,
			  783,  784,  784,  784,  785,  785,  785,  786,  786,  786,
			  787,  787,  787,  788,  788,  788,  798,  810,  847,  847,
			  798,  810,  814,  814,  814,  815,  815,  815,  816,  816,
			  816,  817,  817,  817,  818,  818,  818,  819,  819,  819,
			  821,  821,  821,  825,  825,  825, 1183,  821,  821,  821,
			  821,  821,  821,  826,  826,  826,  827,  827,  827,  828,
			  828,  828,  829,  829,  829,  830,  830,  830,  831,  831,

			  831,  832,  832,  832,  833,  833,  833,  834,  834,  834,
			  835,  835,  835,  836,  836,  836,  837,  837,  837,  838,
			  838,  838,  839,  839,  839,  840,  840,  840,  841,  841,
			  841,  842,  842,  842,  843,  843,  843,  845,  845,  845,
			  848,  848,  848,  850,  850,  850,  851,  851,  851,  852,
			  852,  852,  853,  853,  853,  854,  854,  854,  855,  855,
			  855,  857,  857,  857,  861,  861,  861, 1182,  857,  857,
			  857,  857,  857,  857,  862,  862,  862,  863,  863,  863,
			  864,  864,  864,  865,  865,  865,  866,  866,  866,  867,
			  867,  867,  868,  868,  868,  869,  869,  869,  870,  870, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  870,  871,  871,  871,  872,  872,  872,  874,  874,  874,
			  877,  877,  877, 1177,  874,  874,  874,  874,  874,  874,
			  879,  879,  879,  880,  880,  881,  881,  882,  882,  882,
			  884,  884,  884,  885,  885,  885,  886,  886,  886,  887,
			  887,  887,  874,  875,  875,  875,  888,  888,  888, 1176,
			  875,  875,  875,  875,  875,  875,  889,  889,  889,  890,
			  890,  895,  895,  895,  896,  896,  896,  897,  897,  897,
			  890,  890,  890,  890,  890,  890,  890, 1094,  875,  876,
			  876,  876,  893,  893,  938,  938,  876,  876,  876,  876,
			  876,  876, 1175,  893,  893,  893,  893,  893,  893,  893,

			  898,  898,  898,  899,  899,  899,  900,  900,  900,  901,
			  901,  901,  939,  939,  876,  891,  891,  891,  902,  902,
			  902, 1094,  891,  891,  891,  891,  891,  891,  903,  903,
			  903,  905,  905,  905,  905,  906,  906,  906,  907,  907,
			  907,  908,  908,  908,  909,  909,  909,  910,  910,  910,
			  891,  892,  892,  892,  911,  911,  911, 1174,  892,  892,
			  892,  892,  892,  892,  912,  912,  912,  913,  913,  913,
			  914,  914,  914,  915,  915,  915,  915,  916,  916,  916,
			  917,  917,  917,  918,  918,  918,  892,  894,  894,  894,
			  919,  919,  919, 1173,  894,  894,  894,  894,  894,  894, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  920,  920,  920,  921,  921,  921,  922,  922,  922,  923,
			  923,  923,  924,  924,  924,  925,  925,  925,  926,  926,
			  926,  934,  894,  927,  927,  927,  928,  928,  928,  929,
			  929,  929,  930,  930,  930,  931,  931,  931,  932,  932,
			  932,  933,  933,  933,  935,  935,  935,  937,  937,  937,
			 1172,  934,  940,  940,  940,  942,  942,  942,  943,  943,
			  943,  944,  944,  944, 1171,  934,  945,  945,  945,  947,
			  947,  947,  948,  948,  949,  949,  950,  950,  950,  952,
			  952,  952,  953,  953,  953,  954,  954,  954,  955,  955,
			  955,  956,  956,  956,  957,  957,  957,  958,  958,  958,

			  959,  959,  959,  960,  960,  960,  961,  961,  961,  962,
			  962,  962,  963,  963,  963,  977,  983,  987,  987,  987,
			  983,  988,  988,  988, 1170,  977,  989,  989,  989,  990,
			  990,  990,  994,  994,  994, 1169,  990,  990,  990,  990,
			  990,  990,  995,  995,  995,  996,  996,  996,  997,  997,
			  997,  998,  998,  998,  999,  999,  999, 1000, 1000, 1000,
			 1001, 1001, 1001, 1002, 1002, 1002, 1003, 1003, 1003, 1004,
			 1004, 1004, 1005, 1005, 1005, 1006, 1006, 1006, 1011, 1011,
			 1268, 1268, 1006, 1006, 1006, 1006, 1006, 1006, 1168, 1011,
			 1011, 1011, 1011, 1011, 1011, 1011, 1012, 1012, 1012, 1014, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1014, 1167, 1166, 1012, 1012, 1012, 1012, 1012, 1012, 1165,
			 1014, 1014, 1014, 1014, 1014, 1014, 1014, 1016, 1016, 1016,
			 1017, 1017, 1017, 1018, 1018, 1018, 1019, 1019, 1019, 1106,
			 1164, 1012, 1013, 1013, 1013, 1020, 1020, 1020, 1106, 1013,
			 1013, 1013, 1013, 1013, 1013, 1021, 1021, 1021, 1022, 1022,
			 1022, 1023, 1023, 1023, 1024, 1024, 1024, 1028, 1028, 1028,
			 1029, 1029, 1029, 1030, 1030, 1030, 1162, 1013, 1015, 1015,
			 1015, 1031, 1031, 1031, 1161, 1015, 1015, 1015, 1015, 1015,
			 1015, 1032, 1032, 1032, 1033, 1033, 1033, 1034, 1034, 1034,
			 1035, 1035, 1035, 1036, 1036, 1036, 1037, 1037, 1037, 1038,

			 1038, 1038, 1040, 1015, 1025, 1025, 1025, 1039, 1039, 1039,
			 1160, 1025, 1025, 1025, 1025, 1025, 1025, 1041, 1041, 1041,
			 1042, 1042, 1042, 1043, 1043, 1043, 1044, 1044, 1044, 1159,
			 1154, 1040, 1045, 1045, 1045, 1046, 1046, 1046, 1153, 1025,
			 1026, 1026, 1026, 1047, 1047, 1047, 1040, 1026, 1026, 1026,
			 1026, 1026, 1026, 1048, 1048, 1048, 1049, 1049, 1049, 1050,
			 1050, 1050, 1051, 1051, 1051, 1052, 1052, 1052, 1067, 1079,
			 1079, 1079, 1067, 1152, 1151, 1026, 1027, 1027, 1027, 1080,
			 1080, 1080, 1150, 1027, 1027, 1027, 1027, 1027, 1027, 1081,
			 1081, 1081, 1088, 1088, 1088, 1089, 1089, 1089, 1090, 1090, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1090, 1095, 1095, 1095, 1096, 1096, 1096, 1097, 1097, 1097,
			 1149, 1027, 1085, 1085, 1085, 1091, 1091, 1148, 1147, 1085,
			 1085, 1085, 1085, 1085, 1085, 1143, 1091, 1091, 1091, 1091,
			 1091, 1091, 1091, 1098, 1098, 1098, 1099, 1099, 1099, 1100,
			 1100, 1100, 1111, 1142, 1141, 1140, 1111, 1085, 1086, 1086,
			 1086, 1126, 1126, 1139, 1138, 1086, 1086, 1086, 1086, 1086,
			 1086, 1137, 1126, 1126, 1126, 1126, 1126, 1126, 1126, 1266,
			 1273, 1273, 1273, 1273, 1266, 1266, 1286, 1286, 1266, 1286,
			 1286, 1136, 1135, 1086, 1087, 1087, 1087, 1198, 1198, 1132,
			 1131, 1087, 1087, 1087, 1087, 1087, 1087, 1124, 1198, 1198,

			 1198, 1198, 1198, 1198, 1198, 1267, 1267, 1267, 1123, 1267,
			 1275, 1275, 1275, 1122, 1275, 1121, 1120, 1119, 1118, 1087,
			 1092, 1092, 1092, 1199, 1199, 1117, 1116, 1092, 1092, 1092,
			 1092, 1092, 1092, 1115, 1199, 1199, 1199, 1199, 1199, 1199,
			 1199, 1277, 1277, 1277, 1114, 1277, 1294, 1294, 1295, 1295,
			 1113, 1294, 1112, 1295, 1110, 1092, 1093, 1093, 1093, 1211,
			 1211, 1109, 1108, 1093, 1093, 1093, 1093, 1093, 1093, 1105,
			 1211, 1211, 1211, 1211, 1211, 1211, 1211, 1298, 1298, 1299,
			 1299, 1104, 1298, 1102, 1299, 1101, 1084, 1083, 1082, 1078,
			 1077, 1093, 1127, 1127, 1127, 1212, 1212, 1075, 1074, 1127, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1127, 1127, 1127, 1127, 1127, 1073, 1212, 1212, 1212, 1212,
			 1212, 1212, 1212, 1305, 1305, 1306, 1306, 1307, 1307, 1305,
			 1072, 1306, 1071, 1307, 1070, 1308, 1308, 1127, 1128, 1128,
			 1128, 1308, 1068, 1066, 1065, 1128, 1128, 1128, 1128, 1128,
			 1128, 1309, 1309, 1310, 1310, 1311, 1311, 1309, 1064, 1310,
			 1061, 1311, 1312, 1312, 1313, 1313, 1314, 1314, 1312, 1060,
			 1313, 1059, 1314, 1128, 1129, 1129, 1129, 1058, 1057, 1056,
			 1055, 1129, 1129, 1129, 1129, 1129, 1129, 1315, 1315, 1316,
			 1316, 1317, 1317, 1315, 1054, 1316, 1010, 1317, 1318, 1318,
			 1319, 1319, 1320, 1320, 1318, 1009, 1319, 1007, 1320, 1129,

			 1130, 1130, 1130,  993,  991,  986,  985, 1130, 1130, 1130,
			 1130, 1130, 1130, 1321, 1321, 1322, 1322, 1323, 1323, 1321,
			  984, 1322,  982, 1323, 1324, 1324,  981,  980,  979,  978,
			 1324,  976,  975,  974,  972, 1130, 1155, 1155, 1155,  971,
			  970,  969,  968, 1155, 1155, 1155, 1155, 1155, 1155,  967,
			  964,  951,  946,  941,  936,  883,  878,  873,  860,  858,
			  849,  844,  824,  822,  811,  809,  808,  807,  806,  805,
			  804, 1155, 1156, 1156, 1156,  803,  802,  801,  800, 1156,
			 1156, 1156, 1156, 1156, 1156,  799,  797,  796,  795,  792,
			  791,  790,  789,  756,  737,  732,  724,  719,  709,  704, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  701,  688,  683,  678,  673,  669,  632, 1156, 1157, 1157,
			 1157,  628,  623,  599,  594, 1157, 1157, 1157, 1157, 1157,
			 1157,  579,  575,  570,  568,  567,  566,  565,  563,  562,
			  561,  559,  558,  557,  556,  555,  554,  553,  552,  551,
			  550,  548,  547, 1157, 1158, 1158, 1158,  546,  545,  544,
			  539, 1158, 1158, 1158, 1158, 1158, 1158,  533,  528,  520,
			  515,  505,  500,  497,  493,  492,  487,  485,  482,  477,
			  468,  463,  460,  459,  454,  449,  444,  433,  432, 1158,
			 1178, 1178, 1178,  431,  426,  422,  421, 1178, 1178, 1178,
			 1178, 1178, 1178,  420,  417,  412,  401,  396,  386,  381,

			  377,  372,  370,  369,  368,  358,  353,  344,  339,  336,
			  331,  318,  313,  311,  310, 1178, 1179, 1179, 1179,  309,
			  294,  293,  292, 1179, 1179, 1179, 1179, 1179, 1179,  291,
			  290,  289,  288,  286,  285,  284,  283,  281,  280,  268,
			  263,  260,  259,  254,  249,  244,  235,  230,  213,  208,
			  204, 1179, 1180, 1180, 1180,  199,  194,  189,  178, 1180,
			 1180, 1180, 1180, 1180, 1180,  173,  166,  161,  155,  150,
			  144,  139,  131,  125,  120,  108,  103,  100,   95,   94,
			   93,   92,   90,   89,   88,   87,   86, 1180, 1181, 1181,
			 1181,   85,   84,   83,   82, 1181, 1181, 1181, 1181, 1181, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1181,   80,   76,   75,   70,   68,   62,   57,   52,   48,
			   47,   41,   37,   12,   11,    0,    0,    0,    0,    0,
			    0,    0,    0, 1181, 1196, 1196, 1196,    0,    0,    0,
			    0, 1196, 1196, 1196, 1196, 1196, 1196,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0, 1196,
			 1197, 1197, 1197,    0,    0,    0,    0, 1197, 1197, 1197,
			 1197, 1197, 1197,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0, 1197, 1253, 1253, 1253, 1253,

			 1253, 1253, 1253, 1253, 1253, 1253, 1253, 1253, 1253, 1253,
			 1253, 1253, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257,
			 1257, 1257, 1257, 1257, 1257, 1257, 1258, 1258, 1258, 1258,
			 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258,
			 1258, 1258, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1260, 1260,
			 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260,
			 1260, 1260, 1260, 1260, 1261, 1261, 1261, 1261, 1261, 1261,
			 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261,
			 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262,
			 1262, 1262, 1262, 1262, 1262, 1262, 1263, 1263, 1263, 1263,
			 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263,
			 1263, 1263, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264,
			 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1265, 1265,
			 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265,

			 1265, 1265, 1265, 1265, 1269, 1269, 1269, 1269, 1269, 1269,
			 1269, 1269, 1269, 1269, 1269, 1269, 1269, 1269,    0, 1269,
			 1270, 1270,    0,    0,    0, 1270,    0, 1270, 1270, 1270,
			 1270, 1270, 1270, 1270,    0, 1270, 1271, 1271, 1271, 1271,
			 1271, 1271, 1271, 1271, 1271, 1271, 1271, 1271, 1271,    0,
			 1271, 1272, 1272, 1272,    0, 1272, 1272, 1272, 1272, 1272,
			 1272, 1272, 1272, 1272,    0, 1272, 1274, 1274, 1274, 1274,
			 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274,
			 1274, 1274, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276,    0, 1276, 1278, 1278, 1278, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278,
			    0, 1278, 1279, 1279, 1279, 1279, 1279, 1279, 1279, 1279,
			 1279, 1279, 1279, 1279, 1279,    0, 1279, 1280, 1280, 1280,
			 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,    0,
			 1280, 1281, 1281, 1281, 1281, 1281, 1281, 1281, 1281, 1281,
			 1281, 1281, 1281, 1281,    0, 1281, 1282, 1282, 1282, 1282,
			 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282,
			    0, 1282, 1283, 1283, 1283, 1283, 1283, 1283, 1283, 1283,
			 1283, 1283,    0, 1283, 1283, 1283,    0, 1283, 1284, 1284,
			 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284,

			 1284,    0, 1284, 1285, 1285, 1285, 1285, 1285, 1285, 1285,
			 1285, 1285, 1285, 1285, 1285, 1285,    0, 1285, 1287, 1287,
			    0, 1287,    0, 1287,    0, 1287, 1287, 1287, 1287, 1287,
			    0,    0,    0, 1287, 1288, 1288, 1288, 1288, 1288, 1288,
			 1288, 1288, 1288, 1288, 1288, 1288, 1288,    0, 1288, 1289,
			 1289, 1289,    0, 1289, 1289, 1289, 1289, 1289, 1289, 1289,
			 1289, 1289,    0, 1289, 1290, 1290, 1290, 1290, 1290, 1290,
			 1290, 1290, 1290, 1290, 1290, 1290, 1290,    0, 1290, 1291,
			 1291, 1291, 1291, 1291, 1291, 1291, 1291, 1291, 1291, 1291,
			 1291, 1291,    0, 1291, 1292, 1292, 1292, 1292, 1292, 1292, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1292, 1292, 1292, 1292, 1292, 1292, 1292,    0, 1292, 1293,
			 1293, 1293, 1293, 1293, 1293, 1293, 1293, 1293, 1293, 1293,
			 1293, 1293,    0, 1293, 1296, 1296, 1296, 1296, 1296, 1296,
			 1296, 1296, 1296, 1296, 1296, 1296, 1296,    0, 1296, 1297,
			 1297, 1297, 1297, 1297, 1297, 1297, 1297, 1297, 1297, 1297,
			 1297, 1297,    0, 1297, 1300, 1300, 1300, 1300, 1300, 1300,
			 1300, 1300, 1300, 1300, 1300, 1300, 1300,    0, 1300, 1301,
			 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301,
			 1301, 1301,    0, 1301, 1302, 1302, 1302, 1302, 1302, 1302,
			 1302, 1302, 1302, 1302, 1302, 1302, 1302,    0, 1302, 1303,

			 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303,
			 1303, 1303, 1303,    0, 1303, 1304, 1304, 1304, 1304, 1304,
			 1304, 1304, 1304, 1304, 1304, 1304, 1304, 1304,    0, 1304,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 195, 4400)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1324)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			yy_base_template_5 (an_array)
			yy_base_template_6 (an_array)
			yy_base_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   13,   57,   60,  111,  173,  235,  297,  360,
			    0, 3812, 3811,  424,    0,    0,    0,   66,   83,  487,
			  549,  612,    0,  675,  737,  800,  863,  925,  987, 1049,
			 1111,    2,    3, 1174,    0, 1237, 1299, 3812, 4530,    7,
			 4530, 3798,   81,    0, 4530,    8, 4530, 3797, 3790, 4530,
			    0, 4530, 3802,   31,   79, 4530,   48, 3752,   61,   11,
			   17,   68, 3753,   86,   93,  100, 4530,  120, 3792,   74,
			 3749,   79,   21,   42,  131, 3750, 3750, 4530,   17, 4530,
			 3788,    0, 3772, 3771, 3766, 3767, 3745, 3755, 3758, 3747,
			 3741,  151, 3755, 3740, 3757, 3776, 4530, 4530,   20, 4530,

			 3764,    0,  137, 3721,  140,  143,  144,  147, 3722, 4530,
			   21, 4530, 4530,   12, 4530, 4530, 4530, 4530, 1348,  150,
			 3719,  153,  156,  157,  160, 3720, 4530,   29, 4530, 4530,
			 4530, 3759, 4530,    0,  159, 4530, 4530,  192,  170, 3716,
			  190,  193,  202,  205, 3717,  204,   30, 4530,  255,  216,
			 3714,  219,  222,  223,  226, 3715, 4530, 4530, 1397,  272,
			  229, 3712,  252,  233,  254,  267, 3713, 4530, 4530,  279,
			 1446, 4530,  270, 3710,  273,  290,  291,  294, 3705, 4530,
			 4530,  497, 4530,  237, 4530, 4530,  491,  467, 4530, 3738,
			  452, 1495,  289,  442, 3701,  449,  446,  451,  463, 3702, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  462,  469,  530,  683, 3737, 4530, 4530,  484, 3694,  508,
			  511,  512,  515, 3695,  570,  517, 4530,   74,  546,  672,
			  673,  679,    0,  581,  636, 4530,  668,  687,  644,  544,
			 3692,  655,  532,  546,  658, 3693,  661,  694,  697,  700,
			  703,  706,  705,  716, 3690,  719,  633,  664,  722, 3691,
			  774, 4530,  810,  728, 3688,  731,  751,  752,  755, 3689,
			 3734,  831,  761, 3685,  764,  767,  768,  772, 3686,  789,
			  775,  786,  789,  824,  827,  830, 4530,  894, 1558,    0,
			 3714, 3698,  873, 3697, 3702, 3699, 3693, 1600, 3692, 3692,
			 3704, 3698, 3695, 3683, 3718, 4530,  898,  845,    0, 4530,

			  856,  859,  875,  878,  881,  884,  939,  928, 4530, 3704,
			 3664, 3663,  893, 3657,  896,  821,  832,  899, 3658, 4530,
			  902,  905,  908,  911,  914,  921,  969,  933,    0,  940,
			  951, 3655,  954,  957,  958,  961, 3656,  960,  971, 3653,
			  974,  977,  982,  999, 3654, 1002, 1005, 1010, 1013, 1016,
			 1019, 1018, 1029, 3651, 1032,  985, 1034, 1037, 3652, 1031,
			 1058, 1044, 1072, 1075, 1078, 1081, 1084, 4530, 3689, 3653,
			 3652, 1087, 3646, 1090, 1040, 1046, 1093, 3647, 4530, 4530,
			 1096, 3644, 1099, 1069, 1101, 1106, 3645, 4530, 1192, 1198,
			 1201, 1204, 1207, 1210, 4530, 1213, 3642, 1216, 1109, 1188, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1219, 3643, 4530, 1222, 1225, 1228, 1231, 1254, 1260, 1284,
			 4530, 1263, 3640, 1266, 1195, 1250, 1269, 3641, 1324, 4530,
			 3675, 3668, 3659, 1318, 1629, 1275, 3629, 1278, 1257, 1280,
			 1283, 3630, 3626, 3625, 1371, 4530, 1313, 1316, 1319, 1340,
			 1343, 1346, 1356, 1349, 3621, 1371, 1286, 1336, 1374, 3622,
			 1436, 4530, 1419, 1377, 3619, 1381, 1390, 1391, 1394, 3620,
			 3665, 1455, 1397, 3616, 1410, 1413, 1416, 1419, 3617, 1462,
			 1430, 1447, 1473, 1476, 1479, 1487, 1490, 3614, 1493, 1435,
			 1437, 1496, 3615, 1605, 4530, 3654, 1559, 3611, 1575, 1484,
			 1577, 1586, 3612, 3651, 1593, 1596, 1599, 3662, 1641, 1606,

			 3607, 1609, 1582, 1611, 1614, 3608, 1621, 1624, 1627, 1630,
			 1640, 1643, 4530, 1684, 1649, 3605, 1652, 1618, 1654, 1657,
			 3606, 1660, 1663, 1666, 1669, 1672, 1675, 1678, 3603, 1681,
			 1684, 1685, 1688, 3604, 1691, 1694, 1697, 1696, 1707, 3595,
			 1710, 1713, 1714, 1717, 3596, 3616, 3621, 3601, 3619,    0,
			 3607, 3613, 3616, 3615, 3614, 3609, 3610, 3592, 3602, 3605,
			 1312, 3604, 3607, 3601,  749, 3614, 3600, 3609, 3589, 1720,
			 3568, 1723, 1726, 1727, 1730, 3569, 1733, 1736, 1739, 3606,
			 1780, 1793, 1806, 1819, 1745, 1758, 1771, 1784, 1794, 1797,
			 1800, 1803, 1806, 1809, 3559, 1812, 1815, 1816, 1819, 3560, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1822, 1825, 1828, 1831, 1834, 1837, 1840, 1843, 1846, 1849,
			 1852, 1855, 1858, 1861, 1864, 1867, 1870, 1873, 1876, 1879,
			 1882, 1881, 1892, 3557, 1895, 1898, 1899, 1902, 3558, 1905,
			 1908, 1911, 3591, 1952, 1965, 1978, 1991, 1917, 1930, 1943,
			 1956, 1966, 1969, 1972, 1975, 1978, 1981, 1984, 1987, 1990,
			 1993, 1996, 1999, 2002, 2005, 2008, 2011, 2014, 2017, 2020,
			 2023, 2026, 2029, 2032, 2035, 2038, 2041, 4530, 4530, 3569,
			 2082, 4530, 2045, 3549, 2048, 2051, 2052, 2055, 3550, 2131,
			 2180, 2229, 2058, 3547, 2061, 2064, 2065, 2074, 3548, 2077,
			 2080, 2083, 2094, 2097, 2100, 4530, 4530, 4530, 2103, 2106,

			 2109, 3599, 2150, 2115, 3544, 2118, 2068, 2070, 2121, 3545,
			 2126, 2129, 2132, 2145, 2155, 2158, 4530, 2199, 2164, 3542,
			 2167, 2170, 2174, 2178, 3543, 2181, 2194, 2204, 2207, 2210,
			 2213, 2216, 3540, 2219, 2222, 2223, 2227, 3541, 2230, 2233,
			 2236, 2239, 2242, 2245, 2248, 2251, 2254, 2304, 2309, 2259,
			 2262, 2265, 2268, 2271, 2274, 2278, 3587, 2316, 2289, 2292,
			 2295, 2298, 2302, 2305, 2308, 2320, 2323, 2365, 2330, 2333,
			 2336, 2339, 2342, 2345, 2348, 2351, 2354, 2357, 2360, 2363,
			 2366, 2369, 2372, 2375, 2378, 2381, 2384, 2387, 2390, 3551,
			 3578, 3562, 3548,    0,    0, 3575, 3563, 3547, 2423, 3546, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3545, 3542, 3536, 3536, 3544, 3538, 3530, 3537, 3526, 3552,
			 2425, 3540,    0,    0, 2399, 2402, 2405, 2408, 2411, 2414,
			 4530, 2455, 3511, 4530, 3510, 2420, 2430, 2433, 2436, 2439,
			 2442, 2445, 2448, 2451, 2454, 2457, 2460, 2463, 2466, 2469,
			 2472, 2475, 2478, 2481, 3506, 2484, 2311, 2394, 2487, 3507,
			 2490, 2493, 2496, 2499, 2502, 2505, 4530, 2546, 3507, 4530,
			 3506, 2511, 2521, 2524, 2527, 2530, 2533, 2536, 2539, 2542,
			 2545, 2548, 2551, 3530, 2592, 2628, 2664, 2557, 3501, 2567,
			 2570, 2571, 2574, 3502, 2577, 2580, 2583, 2586, 2593, 2603,
			 2613, 2700, 2736, 2636, 2772, 2608, 2611, 2614, 2647, 2650,

			 2653, 2656, 2665, 2675,    6, 2717, 2682, 2685, 2688, 2691,
			 2694, 2701, 2711, 2714, 2717, 2759, 2724, 2727, 2730, 2737,
			 2747, 2750, 2753, 2756, 2759, 2762, 2765, 2770, 2773, 2776,
			 2779, 2782, 2785, 2788, 2815, 2791, 3499, 2794, 2631, 2658,
			 2799, 3500, 2802, 2805, 2808, 2813, 3497, 2816, 2819, 2820,
			 2823, 3498, 2826, 2829, 2832, 2835, 2838, 2841, 2844, 2847,
			 2850, 2853, 2856, 2859, 3513,  542,    0, 3516, 3516, 3509,
			 3514, 3498, 3512,    0, 3500, 3506, 3509, 2885, 3516, 3502,
			 3492, 3493, 3492, 2894, 3496, 3470, 3465, 2864, 2868, 2873,
			 2914, 3452, 4530, 3451, 2879, 2889, 2892, 2895, 2898, 2901, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2904, 2907, 2910, 2913, 2916, 2919, 2960, 3445, 4530, 3443,
			 3465, 2932, 2981, 3017, 2953, 3053, 2964, 2967, 2970, 2973,
			 2982, 2992, 2995, 2998, 3001, 3089, 3125, 3161, 3004, 3007,
			 3010, 3018, 3028, 3031, 3034, 3037, 3040, 3043, 3046, 3054,
			 3096, 3064, 3067, 3070, 3073, 3079, 3082, 3090, 3100, 3103,
			 3106, 3109, 3112,    0, 3449, 3444, 3429, 3444, 3426, 3448,
			 3431, 3409,    0,    0, 3435, 3394, 3420, 3146, 3408,    0,
			 3398, 3386, 3396, 3369, 3358, 3370,    0, 3338, 3337, 3116,
			 3126, 3136, 3336, 3335, 3365, 3197, 3233, 3269, 3139, 3142,
			 3145, 3169, 3305, 3341, 2671, 3148, 3151, 3154, 3180, 3183,

			 3186, 3346, 3348,    0, 3342, 3332, 2999,    0, 3329, 3335,
			 3324, 3220, 3328, 3314, 3304, 3313, 3291, 3285, 3291, 3287,
			 3303, 3263, 3261, 3256, 3245, 4530, 3205, 3377, 3413, 3449,
			 3485, 3264, 3250,    0,    0, 3247, 3255, 3221, 3230, 3217,
			 3221, 3208, 3203, 3198,    0, 4530,    0, 3188, 3204, 3174,
			 3160, 3122, 3121, 3086, 3078, 3521, 3557, 3593, 3629, 3094,
			 3080, 3035, 3031,    0, 2991, 2974, 2962, 2974, 2958, 2922,
			 2888, 2842, 2815, 2769, 2705, 2640, 2597, 2561, 3665, 3701,
			 3737, 3773, 2528, 2436, 2224, 2186,    0,    0, 2171,    4,
			 1976, 1977, 1951, 1949,    0, 1800, 3809, 3845, 3241, 3277, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_base_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1797, 1784, 1766, 1612, 1524, 1513, 1476, 1462,    0, 1435,
			 1438, 3313, 3349, 1413, 1397, 1398, 1382, 1350,    1,    0,
			 1343, 1296, 1266, 1210, 1088,  947,  911,    0,  875,  868,
			  775,  692,  682,    0,  681,  649,  564,  499,  472,    0,
			  285,  158,  150,   94,   84,    0,    0,   69,   42,    0,
			    8,    0, 4530, 3895, 3911, 3927, 3943, 3959, 3975, 3991,
			 4007, 4023, 4039, 4055, 4071, 4087, 3265, 3297, 2971, 4103,
			 4119, 4134, 4149, 3263, 4165, 3302, 4180, 3333, 4195, 4210,
			 4224, 4239, 4255, 4271, 4286, 4301, 3270, 4317, 4332, 4347,
			 4362, 4377, 4392, 4407, 3338, 3340, 4422, 4437, 3369, 3371,

			 4452, 4467, 4482, 4498, 4513, 3405, 3407, 3409, 3417, 3433,
			 3435, 3437, 3444, 3446, 3448, 3469, 3471, 3473, 3480, 3482,
			 3484, 3505, 3507, 3509, 3516, yy_Dummy>>,
			1, 125, 1200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1324)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			yy_def_template_5 (an_array)
			yy_def_template_6 (an_array)
			yy_def_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0, 1253, 1253, 1254, 1254, 1255, 1255, 1256, 1256, 1252,
			    9, 1257, 1257, 1252,   13,   13,   13, 1258, 1258, 1259,
			 1259, 1252,   21, 1260, 1260, 1261, 1261, 1262, 1262, 1263,
			 1263, 1264, 1264, 1252,   33, 1265, 1265, 1252, 1252, 1252,
			 1252, 1252, 1266, 1267, 1252, 1252, 1252, 1252, 1252, 1252,
			 1268, 1252, 1252, 1269, 1269, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1270, 1270, 1271, 1252, 1272, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1274, 1252, 1252, 1252, 1252,

			 1252, 1275, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1276, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1277, 1278, 1252, 1252, 1279, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1280, 1252, 1252, 1280, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1281, 1282,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1283,
			 1276, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1284, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1285, 1276, 1286, 1252, 1252, 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1287, 1287, 1288, 1289, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1290, 1252, 1266, 1266, 1266,
			 1266, 1252, 1267, 1252, 1291, 1252, 1268, 1252, 1269, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1270, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1271, 1252, 1271, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1272, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1292,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1274, 1252, 1252, 1293, 1275, 1252,

			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1294, 1295, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1296, 1277, 1278,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1279, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1280, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1297, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1298,
			 1299, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1284,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1285, 1285, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1286, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1287, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1288, 1252, 1288, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1289, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1300,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1266, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,

			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1301, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1302, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1285, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1285,
			 1285,  680, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,

			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1266, 1303, 1252,
			 1252, 1252, 1252, 1252, 1252, 1304, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1305, 1252, 1306, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1307, 1252,
			 1308, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252,  680,  680,  680, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1285,  680,  680, 1285,  680, 1252, 1252, 1252, 1252, 1252,

			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1266, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1252, 1252, 1252,
			 1252, 1309, 1252, 1310, 1252, 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 200, 800)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1311, 1252, 1312,
			 1252, 1285,  680,  680, 1285,  680, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252,  680,  680,  680, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1266, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1313, 1314, 1252,
			 1252, 1252, 1315, 1316, 1252,  680,  680,  680, 1252, 1252,
			 1252, 1285,  680,  680, 1266, 1252, 1252, 1252, 1252, 1252,

			 1252, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1317, 1318, 1319, 1320, 1252, 1285,  680,  680,  680,
			  680, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1252, 1273, 1273, 1273, 1273,
			 1273, 1321, 1322, 1323, 1324,  680,  680,  680,  680, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1252, 1252, 1252, 1252,  680,  680,
			  680,  680, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273,  680,  680, 1285, 1285, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_def_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1285, 1285, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273,    0, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,

			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252, yy_Dummy>>,
			1, 125, 1200)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   64,   64,   64,   64,   64,   64,   64,   64,    1,
			    2,   64,   64,    3,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,    1,   64,    4,   64,    5,    6,   64,    7,
			    8,    9,   10,   11,   12,   13,    9,   14,   15,   15,
			   15,   15,   15,   15,   15,   15,   16,   17,   18,   64,
			   19,   20,   21,    9,   64,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   29,   38,   39,   40,   41,   42,   43,   44,   29,
			   29,   45,   46,   47,   48,   49,   64,   22,   23,   24,

			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   29,   38,   39,   40,   41,   42,   43,
			   44,   29,   29,   50,   51,   52,   64,   64,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   56,   56,   57,   57,   57,   57,   57,   57, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   58,   59,   59,   59,   59,   59,
			   59,   59,   59,   59,   59,   59,   59,   60,   59,   59,
			   61,   62,   62,   62,   63,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   64, yy_Dummy>>,
			1, 58, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,   16,    1,    2,    3,   16,    4,    5,   16,   16,
			   16,    6,   16,    7,   16,    8,    8,    8,   16,   16,
			   16,   16,    9,    9,    9,    9,    9,    9,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   16,   16,   11,   16,   12,
			   13,   16,   14,   15,   15,   15,   15,   16,   16,   16,
			   16,   16,   16,   16,   16, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1252)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			yy_accept_template_5 (an_array)
			yy_accept_template_6 (an_array)
			yy_accept_template_7 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,   11,   11,    0,
			    0,   61,   61,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  122,  122,  133,   10,    1,
			    2,   10,    9,    7,   70,   63,   64,   70,   69,   66,
			   67,   68,   70,  129,  129,  130,  130,  130,  130,  130,
			  130,  130,  130,   11,   11,   15,   15,   15,   15,  130,
			  130,  130,  130,  130,  130,  130,   15,   55,   21,   54,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   61,   62,   20,   17,   19,

			   20,   18,  130,  130,  130,  130,  130,  130,  130,   97,
			   93,   98,   95,   94,   96,   99,  101,  100,   99,  130,
			  130,  130,  130,  130,  130,  130,   92,   86,   87,   89,
			   88,   92,   90,   91,  121,  119,  120,  118,  130,  130,
			  130,  130,  130,  130,  130,   59,   58,   60,   59,  130,
			  130,  130,  130,  130,  130,  130,  112,  113,  112,  112,
			  130,  130,  130,  130,  130,  130,  130,  115,  117,  115,
			  115,  116,  130,  130,  130,  130,  130,  130,  130,   57,
			  131,   57,   85,   83,   84,   73,   85,   82,   82,   85,
			   80,   85,   76,  130,  130,  130,  130,  130,  130,  130, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  122,  122,  126,  126,  126,  127,  128,  130,  130,  130,
			  130,  130,  130,  130,    1,    1,    8,    9,    9,    4,
			    5,    0,    7,   63,   63,   70,    0,   65,  129,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   11,    0,    0,    0,    0,    0,    0,    0,
			    0,   12,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   14,
			    0,    0,    0,    0,    0,    0,   16,   21,   21,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   61,   62,   17,   17,   18,   20,

			    0,    0,    0,    0,    0,    0,   93,   94,  102,  102,
			  102,  102,    0,    0,    0,    0,    0,    0,    0,   99,
			    0,    0,    0,    0,    0,    0,   86,   86,   91,  121,
			    0,    0,    0,    0,    0,    0,    0,  118,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   59,    0,    0,    0,    0,    0,    0,    0,   58,
			   58,    0,    0,    0,    0,    0,    0,  106,  106,  106,
			  106,    0,    0,    0,    0,    0,    0,    0,  110,  111,
			    0,    0,    0,    0,    0,    0,    0,  112,    0,    0,
			    0,    0,    0,    0,  114,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  115,    0,    0,    0,    0,    0,    0,    0,
			   56,    0,    0,    0,    0,    0,    0,    0,   83,   74,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   85,    0,    0,    0,    0,
			    0,    0,  122,    0,    0,    0,    0,    0,    0,    0,
			    0,  123,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  125,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    9,    3,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   13,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   21,    0,    0,
			    0,    0,    0,    0,    0,   55,   55,   55,   55,   30,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  103,
			  105,    0,  104,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   58,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  107,  109,    0,  108,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   72,   71,    0,
			    0,   79,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   77,   78,   75,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  124,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    9,    0,    0,
			    0,    0,    0,    0,    0,   65,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   55,
			   55,   55,   55,   32,   38,   55,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 600)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   50,   51,    0,    0,    0,    0,    0,    0,
			  103,  105,    0,  104,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  107,  109,    0,  108,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    9,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   55,   55,   26,   55,   55,   55,
			   55,   55,   55,   31,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,    0,    0,    0,
			  105,    0,  105,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 800)
		end

	yy_accept_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,  109,    0,  109,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    9,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   22,   55,   55,   55,   55,   55,   55,
			   55,   55,   33,   39,   55,   55,   55,   55,   55,   52,
			   55,   55,   55,   55,   55,   55,   36,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    6,    0,    0,    0,    0,    0,

			    0,   55,   55,   28,   55,   55,   55,   27,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,    0,    0,    0,    0,   81,    0,    0,    0,    0,
			    0,   55,   55,   34,   23,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   37,   53,   40,   55,   55,   55,
			   55,    0,    0,    0,    0,    0,    0,    0,    0,   55,
			   55,   55,   55,   29,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,    0,    0,    0,    0,    0,    0,
			    0,    0,   55,   55,   55,   55,   35,   41,   55,   55,
			   55,   55,   55,   55,   42,   55,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_accept_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   55,   44,   55,
			   55,    0,    0,   55,   55,   55,   55,   55,   55,   43,
			   55,   55,   55,   55,   55,   55,   55,   45,   55,   55,
			   55,   55,   55,   24,   55,   55,   55,   55,   55,   46,
			   55,   55,   55,   55,   55,   48,   25,   55,   55,   47,
			   55,   49,    0, yy_Dummy>>,
			1, 53, 1200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4530
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1252
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1253
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 64
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 256
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

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

	yyNb_rules: INTEGER = 132
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 133
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

	last_string_32_value: STRING_32
			-- Last semantic value of type STRING_32
			
	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
