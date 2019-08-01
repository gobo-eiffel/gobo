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
--|#line 64 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 64")
end
-- Separator or comment.
when 2 then
--|#line 65 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 65")
end
line_nb := line_nb + 1
when 3 then
--|#line 66 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 66")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
when 4 then
--|#line 70 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 70")
end
set_start_condition (SCNAME)
when 5 then
--|#line 71 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 71")
end
set_start_condition (XSCNAME)
when 6 then
--|#line 72 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 72")
end
set_start_condition (OPTION)
when 7 then
--|#line 73 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 73")
end

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
when 8 then
--|#line 78 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 78")
end

					last_token := ENDSECT
					set_start_condition (SECT2)
				
when 9 then
--|#line 82 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 82")
end

					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				
when 10 then
--|#line 86 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 86")
end

					report_directive_expected_error
					set_start_condition (RECOVER1)
				
when 11 then
--|#line 93 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 93")
end
more
when 12 then
--|#line 94 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 94")
end
more
when 13 then
--|#line 95 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 95")
end
more
when 14 then
--|#line 96 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 96")
end
more
when 15 then
--|#line 97 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 97")
end
more
when 16 then
--|#line 98 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 98")
end

					check attached text_substring (1, text_count - 2) as l_last_string then
						line_nb := line_nb + l_last_string.occurrences ('%N')
						description.eiffel_header.force_last (l_last_string)
						set_start_condition (INITIAL)
					end
				
when 17 then
--|#line 108 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 108")
end
-- Separator or comment.
when 18 then
--|#line 109 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 109")
end
add_new_start_condition (text, start_condition = XSCNAME)
when 19 then
--|#line 110 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 110")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 20 then
--|#line 114 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 114")
end

					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				
when 21 then
--|#line 121 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 121")
end
-- Separator or comment.
when 22 then
--|#line 122 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 122")
end
description.set_backing_up_report (True)
when 23 then
--|#line 123 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 123")
end
description.set_backing_up_report (False)
when 24 then
--|#line 124 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 124")
end

					description.set_case_insensitive (False)
				
when 25 then
--|#line 127 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 127")
end

					description.set_case_insensitive (True)
				
when 26 then
--|#line 130 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 130")
end
description.set_debug_mode (True)
when 27 then
--|#line 131 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 131")
end
description.set_debug_mode (False)
when 28 then
--|#line 132 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 132")
end
description.set_no_default_rule (False)
when 29 then
--|#line 133 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 133")
end
description.set_no_default_rule (True)
when 30 then
--|#line 134 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 134")
end
description.set_equiv_classes_used (True)
when 31 then
--|#line 135 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 135")
end
description.set_equiv_classes_used (False)
when 32 then
--|#line 136 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 136")
end
description.set_full_table (True)
when 33 then
--|#line 137 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 137")
end
description.set_full_table (False)
when 34 then
--|#line 138 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 138")
end
description.set_meta_equiv_classes_used (True)
when 35 then
--|#line 139 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 139")
end
description.set_meta_equiv_classes_used (False)
when 36 then
--|#line 140 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 140")
end
description.set_reject_used (True)
when 37 then
--|#line 141 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 141")
end
description.set_reject_used (False)
when 38 then
--|#line 142 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 142")
end
description.set_line_used (True)
when 39 then
--|#line 143 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 143")
end
description.set_line_used (False)
when 40 then
--|#line 144 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 144")
end
description.set_position_used (True)
when 41 then
--|#line 145 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 145")
end
description.set_position_used (False)
when 42 then
--|#line 146 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 146")
end
description.set_pre_action_used (True)
when 43 then
--|#line 147 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 147")
end
description.set_pre_action_used (False)
when 44 then
--|#line 148 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 148")
end
description.set_post_action_used (True)
when 45 then
--|#line 149 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 149")
end
description.set_post_action_used (False)
when 46 then
--|#line 150 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 150")
end
description.set_pre_eof_action_used (True)
when 47 then
--|#line 151 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 151")
end
description.set_pre_eof_action_used (False)
when 48 then
--|#line 152 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 152")
end
description.set_post_eof_action_used (True)
when 49 then
--|#line 153 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 153")
end
description.set_post_eof_action_used (False)
when 50 then
--|#line 154 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 154")
end

					description.set_unicode_mode (True)
				
when 51 then
--|#line 157 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 157")
end

					description.set_no_warning (False)
				
when 52 then
--|#line 160 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 160")
end

					description.set_no_warning (True)
				
when 53 then
--|#line 164 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 164")
end
set_start_condition (OUTFILE)
when 54 then
--|#line 174 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 174")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 55 then
--|#line 178 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 178")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 56 then
--|#line 185 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 185")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 57 then
--|#line 189 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 189")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 58 then
--|#line 197 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 197")
end
-- Separates name and definition.
when 59 then
--|#line 198 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 198")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 60 then
--|#line 205 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 205")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 61 then
--|#line 213 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 213")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 62 then
--|#line 217 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 217")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 63 then
--|#line 230 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 230")
end
-- Separator or comment.
when 64 then
--|#line 231 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 231")
end
line_nb := line_nb + 1
when 65 then
--|#line 232 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 232")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 66 then
--|#line 236 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 236")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 67 then
--|#line 245 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 245")
end
last_token := Left_brace_code
when 68 then
--|#line 246 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 246")
end
last_token := Right_brace_code
when 69 then
--|#line 247 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 247")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 70 then
--|#line 251 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 251")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 71 then
--|#line 263 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 263")
end

					last_token := UNICODE_MODE_START
				
when 72 then
--|#line 266 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 266")
end

					last_token := BYTE_MODE_START
				
when 73 then
--|#line 269 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 269")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 74 then
	yy_end := yy_start + yy_more_len + 1
--|#line 273 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 273")
end
last_token := Dollar_code
when 75 then
--|#line 274 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 274")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 76 then
--|#line 283 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 283")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 77 then
--|#line 287 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 287")
end

					last_token := CCL_PLUS
				
when 78 then
--|#line 290 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 290")
end

					last_token := CCL_MINUS
				
when 79 then
--|#line 293 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 293")
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
--|#line 304 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 304")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 81 then
--|#line 309 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 309")
end
last_token := EOF_OP
when 82 then
--|#line 310 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 310")
end
last_token := text_item (1).code
when 83 then
--|#line 311 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 311")
end

					set_start_condition (ACTION_TEXT)
				
when 84 then
--|#line 314 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 314")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 85 then
--|#line 319 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 319")
end

					last_token := CHAR
					process_utf8_character
				
when 86 then
--|#line 326 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 326")
end
-- Separator or comment.
when 87 then
--|#line 327 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 327")
end
line_nb := line_nb + 1
when 88 then
--|#line 328 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 328")
end
last_token := Comma_code
when 89 then
--|#line 329 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 329")
end
last_token := Star_code
when 90 then
--|#line 330 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 330")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 91 then
--|#line 334 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 334")
end

					last_token := NAME
					last_string_value := text
				
when 92 then
--|#line 338 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 338")
end

					report_bad_start_condition_error (text)
				
when 93 then
--|#line 344 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 344")
end
-- Separator.
when 94 then
--|#line 345 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 345")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 95 then
--|#line 353 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 353")
end
last_token := Comma_code
when 96 then
--|#line 354 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 354")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 97 then
--|#line 358 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 358")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 98 then
--|#line 363 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 363")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 99 then
--|#line 372 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 372")
end

					last_token := CHAR
					process_utf8_character
				
when 100 then
--|#line 376 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 376")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 101 then
--|#line 380 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 380")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 102 then
--|#line 389 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 389")
end

					last_token := CHAR
					process_escaped_character
				
when 103 then
--|#line 393 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 393")
end

					last_token := CHAR
					process_octal_character
				
when 104 then
--|#line 397 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 397")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 105 then
--|#line 401 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 401")
end

					last_token := CHAR
					process_unicode_character
				
when 106 then
--|#line 408 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 408")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 107 then
--|#line 413 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 413")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 108 then
--|#line 418 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 418")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 109 then
--|#line 423 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 423")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 110 then
	yy_end := yy_start + yy_more_len + 1
--|#line 428 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 428")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 111 then
	yy_end := yy_start + yy_more_len + 1
--|#line 432 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 432")
end
last_token := Caret_code
when 112 then
--|#line 433 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 433")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 113 then
--|#line 438 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 438")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 114 then
	yy_end := yy_start + yy_more_len + 1
--|#line 447 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 447")
end
last_token := Minus_code
when 115 then
--|#line 448 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 448")
end

					last_token := CHAR
					process_utf8_character
				
when 116 then
--|#line 452 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 452")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 117 then
--|#line 456 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 456")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 118 then
--|#line 465 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 465")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 119 then
--|#line 469 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 469")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 120 then
--|#line 474 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 474")
end
set_start_condition (EIFFEL_BLOCK2)
when 121 then
--|#line 475 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 475")
end

					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				
when 122 then
--|#line 483 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 483")
end
more
when 123 then
--|#line 484 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 484")
end
more
when 124 then
--|#line 485 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 485")
end
more
when 125 then
--|#line 486 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 486")
end
more
when 126 then
--|#line 487 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 487")
end
more
when 127 then
--|#line 488 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 488")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 128 then
--|#line 492 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 492")
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
--|#line 511 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 511")
end

					last_token := EIF_CODE
					last_string_value := text
				
when 130 then
--|#line 517 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 517")
end

					report_bad_character_error (text)
				
when 131 then
--|#line 520 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 520")
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
			create an_array.make_filled (0, 0, 4505)
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
			  214,  223,  226,   41,   39,   40,   39, 1208,  277,   42,
			  277,  296,  306,  296,  306, 1236,   41,  307,  307,  326,
			  359,  326,  359, 1249,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   45,   46,   45,
			   45,   46,   45,  238,  238,   52,  228,  228,  228,   47,
			  239,  239,   47,  420,   48,  272,  272,   48,  110,  111,
			  110,  273,  273,  110,  111,  110,  216, 1254,  289,  112,
			  290,  421,  113,  113,  112,  302,  302,  113,  113,  237,

			  237,  237,  418,   49,  418,   50,   49,   51,   50, 1253,
			   51,   54,  240,  240,  240,  218,  303,  303,  219,  242,
			  242,  242, 1252,  220,  271,  271,  271,  547,  114,  221,
			  251,  548,  252,  114,  229,  230,  231,  232,  233,  234,
			  235,  229,  230,  231,  232,  233,  234,  235,  243,  244,
			  245,  246,  247,  248,  249,  261,  274,  274,  274,  322,
			  322,   55,   55,   55,   55,   56,   57,   58,   59,   60,
			   61,   62,   54,  243,  244,  245,  246,  247,  248,  249,
			  323,  323,  253,  254,  255,  256,  257,  258,  259,  299,
			  299,  299,  301,  301,  301,  304,  304,  304,  319,  319, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  319,  321,  321,  321, 1251,  262,  263,  264,  265,  266,
			  267,  268,  324,  324,  324,  330,  331,  332,  333,  334,
			  335,  336,   55,   55,   55,   55,   56,   57,   58,   59,
			   60,   61,   62,   64,  432,   65,  433,   66,   67,  329,
			  329,  329,  347,  347,   68,  338,  339,  340,  341,  342,
			  343,  344,  346,  346,  346,  348,  348,  349,  349,  349,
			  352,  353,  354,  355,  356,  357,  358,  360,  351,  351,
			  351,  362,  362,  362,  363,  363,  364,  364,  365,  365,
			  365,  390,  390,   55,   55,   55,   55,   69,   70,   71,
			   72,   73,   74,   75,   64,  214,   65,  214,   76,   67,

			  387,  387,  387,  391,  391,   68,  389,  389,  389, 1250,
			  352,  353,  354,  355,  356,  357,  358,  392,  392,  392,
			  395,  396,  397,  398,  399,  400,  401,  402,  402,  402,
			  404,  404,  404,  405,  405,  406,  406,  407,  407,  407,
			  419,  419,  419, 1249,   55,   55,   55,   55,   69,   70,
			   71,   72,   73,   74,   75,   78,   79,   78,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   80,   77,   81,
			   81,   77,   77,   77,   77,   81,   82,   83,   84,   85,
			   86,   81,   81,   81,   81,   81,   87,   88,   89,   90,
			   91,   92,   81,   81,   93,   81,   94,   81,   77,   77, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,   77,   77,   98,   99,
			   98,   97,   97,   97,   97,   97,   97,   97,   97,   97,
			  100,   97,   97,   97,   97,   97,   97,   97,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,   97,   97,   97,   97,   97,   97,   97,   97,   55,
			   55,   55,   55,  102,  103,  104,  105,  106,  107,  108,
			   97,  116, 1248,  117,  424,  435,  435,  435,  437,  437,
			  437,  438,  438,  410, 1247,  425,  426,  427,  428,  429,

			  430,  431,  439,  439,  440,  440,  440,  442,  442,  442,
			  379,  443,  444,  445,  446,  447,  448,  449,  451, 1246,
			  452,  471,  471,  471,  118,  472,  472,  461,  473,  473,
			 1245,   55,   55,   55,   55,  119,  120,  121,  122,  123,
			  124,  125,  116,  379,  117,  411,  412,  413,  414,  415,
			  416,  417, 1244,  380,  381,  382,  383,  384,  385,  386,
			  443,  444,  445,  446,  447,  448,  449,  474,  474,  474,
			  453,  454,  455,  456,  457,  458,  459,  462,  463,  464,
			  465,  466,  467,  468,  223,  118,  223,  228,  228,  228,
			  238,  238,   55,   55,   55,   55,  119,  120,  121,  122, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  123,  124,  125,  127,  128,  127,  126,  126,  126,  126,
			  126,  126,  129,  126,  130,  131,  126,  126,  126,  126,
			  126,  126,  132,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  135,  476,  477,  478,
			  479,  480,  481,  482,  221,  484,  221,  486,  487,  488,
			  489,  490,  491,  492, 1243, 1255,  485, 1255, 1255,  277,
			  227,  277,  227,  237,  237,  237,  239,  239, 1242, 1255,

			  226,  226,  493,  229,  230,  231,  232,  233,  234,  235,
			  240,  240,  240,  136,  137, 1241,   55,   55,   55,   55,
			  138,  139,  140,  141,  142,  143,  144,  135, 1255,  483,
			 1255, 1255, 1240,  226,  272,  272,  225,  228,  228,  228,
			  273,  273, 1255,  228,  228,  228,  228,  228,  228,  494,
			  494,  494,  495,  495,  495,  496,  496,  496,  243,  244,
			  245,  246,  247,  248,  249,  242,  242,  242,  271,  271,
			  271,  274,  274,  274,  136,  137, 1239,   55,   55,   55,
			   55,  138,  139,  140,  141,  142,  143,  144,  146,  147,
			  146,  250,  250,  250,  507,  507,  507,  508,  508, 1238, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  148,  251, 1237,  252,  509,  509,  510,  510,  510,  497,
			  260,  260,  260,  522,  522,  522,  523,  523,  524,  524,
			 1236,  498,  260,  525,  525,  525,  242,  242,  242,  513,
			  527,  528,  529,  530,  531,  532,  533,  307,  307,   55,
			   55,   55,   55,  149,  150,  151,  152,  153,  154,  155,
			  146,  147,  146,  253,  254,  255,  256,  257,  258,  259,
			  586,  586,  148,  499,  500,  501,  502,  503,  504,  505,
			 1235,  514,  515,  516,  517,  518,  519,  520,  242,  242,
			  242,  242,  242,  242,  534,  534,  534,  535,  535,  535,
			  536,  536,  536,  296, 1234,  296,  299,  299,  299,  587,

			  587,   55,   55,   55,   55,  149,  150,  151,  152,  153,
			  154,  155,  157,  569,  570,  571,  572,  573,  574,  575,
			  299,  299,  299,  299,  299,  299,  576,  576,  576,  577,
			  577,  577,  578,  578,  578,  306,  326,  306,  326, 1233,
			  580,  580,  308,  308,  308, 1232,  580,  580,  580,  580,
			  580,  580,  585,  585,  585,  158, 1231,  159,  588,  588,
			  588, 1230,   55,   55,   55,   55,  160,  161,  162,  163,
			  164,  165,  166,  157,  581,  582,  582,  319,  319,  319,
			 1229,  582,  582,  582,  582,  582,  582,  319,  319,  319,
			  319,  319,  319,  590,  590,  590,  591,  591,  591,  592, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  592,  592,  593,  594,  595,  596,  597,  598,  599,  583,
			  329,  329,  329,  601,  601,  601,  158, 1228,  159,  602,
			  602,  603,  603,   55,   55,   55,   55,  160,  161,  162,
			  163,  164,  165,  166,  168,  330,  331,  332,  333,  334,
			  335,  336,  604,  604,  604,  169,  338,  339,  340,  341,
			  342,  343,  344,  337,  337,  337,  607,  607,  607,  608,
			  608,  609,  609,  610,  610,  610,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  617,  617,  170,  171,  612,
			  612,  612,  618,  618,   55,   55,   55,   55,  172,  173,
			  174,  175,  176,  177,  178,  168,  613,  613,  613,  614,

			  614,  614,  351,  351,  351, 1227,  169,  352,  353,  354,
			  355,  356,  357,  358,  616,  616,  616,  619,  619,  619,
			  359, 1226,  359,  351,  351,  351,  351,  351,  351,  351,
			  351,  351,  629,  629,  629,  630,  630,  630,  170,  171,
			  631,  631,  631,  639,  639,   55,   55,   55,   55,  172,
			  173,  174,  175,  176,  177,  178,  183,  184,  183,  185,
			  186,  182,  182,  187,  188,  188,  188,  182,  182,  188,
			  182,  182,  182,  189,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  190, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  191,  182,  182,  182,  192,  188,  182,   55,   55,   55,
			   55,  193,  194,  195,  196,  197,  198,  199,  182,  201,
			 1225,  202,  640,  640,  203,  633,  633,  367,  367,  367,
			  204,  633,  633,  633,  633,  633,  633,  645,  645,  621,
			  638,  638,  638,  641,  641,  641, 1224,  635,  635,  378,
			  378,  378, 1223,  635,  635,  635,  635,  635,  635,  634,
			  644,  644,  644,  646,  646,  418,  205,  418,  206,   55,
			   55,   55,   55,  207,  208,  209,  210,  211,  212,  213,
			  201,  636,  202,  654,  654,  203,  647,  647,  647,  655,
			  655,  204,  622,  623,  624,  625,  626,  627,  628,  387,

			  387,  387,  387,  387,  387,  387,  387,  387,  649,  649,
			  649,  650,  650,  650,  651,  651,  651,  394,  394,  394,
			  653,  653,  653,  656,  656,  656,  803,  205,  804,  206,
			   55,   55,   55,   55,  207,  208,  209,  210,  211,  212,
			  213,  309,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  658,  658,  658,  659,  659,  659,  660,  660,  660,
			  409,  409,  409,  662,  662,  662,  310,  410, 1255,  311,
			  663,  663,  664,  664,  665,  665,  665,  691,  691,  670,
			  671, 1222,  312,  313,  314,  315,  316,  317,  318,  368,
			  672,  673,  674,  675,  676,  677,  678,  423,  423,  423, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  690,  690,  690,  692,  692,  693,  693,  693, 1255, 1055,
			 1255, 1255,  434,  434,  369,  472,  472,  370, 1056,  411,
			  412,  413,  414,  415,  416,  417,  435,  435,  435, 1221,
			  371,  372,  373,  374,  375,  376,  377,  309,  435,  435,
			  435,  435,  435,  435, 1220,  434,  473,  473,  697,  698,
			  698,  698,  699,  699,  699,  700,  700,  700,  442,  442,
			  442, 1219,  310, 1218,  701,  311,  443,  444,  445,  446,
			  447,  448,  449,  471,  471,  471,  702, 1217,  312,  313,
			  314,  315,  316,  317,  318,  309,  474,  474,  474,  450,
			  450,  450,  711,  711,  711,  712,  712,  713,  713,  714,

			  714,  714,  460,  460,  460,  726,  726,  726,  727,  727,
			  310,  728,  728,  311,  729,  729,  729, 1216,  703,  704,
			  705,  706,  707,  708,  709, 1138,  312,  313,  314,  315,
			  316,  317,  318,  537, 1139,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  278,  537,  278,  278,  537,
			  537,  537,  537,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  537,  537,  537,  537,
			  537,  537,  537,  537,  442,  442,  442, 1213,  538,  539,
			  540,  541,  542,  543,  544,  537,  553,  554,  555,  556, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  557,  460,  442,  442,  442,  971,  558,  559,  717,  972,
			  560,  561, 1212,  451, 1211,  452,  562,  679,  731,  732,
			  733,  734,  735,  736,  737,  442,  442,  442,  738,  738,
			  738,  739,  739,  739,  740,  740,  740,  215,  215,  215,
			  743,  743,  680,  744,  744,  681,  742,  742,  742, 1255,
			  718,  719,  720,  721,  722,  723,  724, 1210,  682,  683,
			  684,  685,  686,  687,  688,  453,  454,  455,  456,  457,
			  458,  459,  745,  745,  745,  224,  224,  224,  750,  750,
			  750, 1209,  747,  751,  751,  752,  752,  753,  753,  753,
			  757,  757, 1255,  228,  228,  228,  228,  228,  228,  228,

			  228,  228,  250,  250,  250,  759,  759,  759,  760,  760,
			  761,  761,  762,  762,  762,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  764,  764,  764,  765,  765,  765,
			  766,  766,  766,  767,  767,  260,  260,  260,  769,  769,
			  769,  770,  770,  771,  771,  772,  772,  772,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  774,  774,  774,
			  775,  775,  775,  776,  776,  776,  269,  269,  269,  778,
			  778,  778,  779,  779,  780,  780,  781,  781,  781,  242,
			  242,  242,  242,  242,  242,  242,  242,  242,  538,  539,
			  540,  541,  542,  543,  544,  537,  537,  537,  784,  784, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  784,  785,  785,  786,  786,  787,  787,  787,  808,  297,
			  297,  297,  815,  815,  815,  816,  816, 1207,  809,  817,
			  817,  818,  818,  818,  299,  299,  299,  299,  299,  299,
			  299,  299,  299,  821,  821,  308,  308,  308, 1206,  821,
			  821,  821,  821,  821,  821,  822,  822,  308,  308,  308,
			 1205,  822,  822,  822,  822,  822,  822,  823,  823,  308,
			  308,  308, 1204,  823,  823,  823,  823,  823,  823,  824,
			  824,  825,  825,  825, 1203,  824,  824,  824,  824,  824,
			  824,  826,  826,  826,  827,  827,  827,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  327,  327,  327,  829,

			  829,  829,  830,  830,  831,  831,  832,  832,  832,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  834,  834,
			  834,  835,  835,  835,  836,  836,  836,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  837,  837,  837,  838,
			  838,  838,  839,  839,  839,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  351,  351,  351,  351,  351,  351,
			  351,  351,  351,  840,  840,  840,  841,  841,  841,  842,
			  842,  842,  843,  844,  845,  846,  847,  848,  849,  360,
			  360,  360,  851,  851,  851,  852,  852,  853,  853,  854,
			  854,  854,  351,  351,  351,  351,  351,  351,  351,  351, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  351,  857,  857,  367,  367,  367,  859,  857,  857,  857,
			  857,  857,  857,  858,  858,  367,  367,  367, 1009,  858,
			  858,  858,  858,  858,  858,  859,  859,  367,  367,  367,
			  823,  859,  859,  859,  859,  859,  859,  860,  860,  861,
			  861,  861,  993,  860,  860,  860,  860,  860,  860,  862,
			  862,  862,  863,  863,  863,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  864,  864,  864,  865,  865,  865,
			  866,  866,  866,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  867,  867,  867,  868,  868,  868,  869,  869,  869,

			  402,  402,  402,  402,  402,  402,  402,  402,  402,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  870,  870,
			  870,  871,  871,  871,  872,  872,  872,  874,  423,  423,
			  423,  885,  885,  885,  886,  886,  887,  887,  888,  888,
			  888,  423,  423,  423,  896,  896,  896,  897,  897, 1198,
			  893,  893,  875,  898,  898,  876,  893,  893,  893,  893,
			  893,  893,  899,  899,  899,  423,  423,  423,  877,  878,
			  879,  880,  881,  882,  883,  890,  423,  423,  423,  423,
			  423,  423,  905,  905,  894,  901,  901,  901,  902,  902,
			  902,  903,  903,  903,  435,  435,  435,  435,  435,  435, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  435,  435,  435,  908,  908,  670,  671,  450,  450,  450,
			  907,  907,  907,  909,  909, 1197,  672,  673,  674,  675,
			  676,  677,  678,  891,  891,  910,  910,  910, 1196,  891,
			  891,  891,  891,  891,  891,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  912,  912,  912,  913,  913,  913,
			  914,  914,  914,  670,  671,  915,  915,  892,  460,  460,
			  460,  917,  917,  917,  672,  673,  674,  675,  676,  677,
			  678,  918,  918,  919,  919,  920,  920,  920,  460,  460,
			  460,  460,  460,  460,  460,  460,  460,  922,  922,  922,
			  923,  923,  923,  924,  924,  924,  469,  469,  469,  926,

			  926,  926,  927,  927,  928,  928,  929,  929,  929,  442,
			  442,  442,  442,  442,  442,  442,  442,  442,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  931,  931,  931,
			  932,  932,  932,  933,  933,  933, 1255,  484,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  942,  942,  942,
			  943,  943,  943,  944,  944,  944,  250,  757,  757,  934,
			  945,  946,  947,  948,  949,  950,  951,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  952,  952,  952, 1255,
			  953,  953,  953,  954,  954,  954,  250,  250,  250, 1000,
			 1000,  935,  936,  937,  938,  939,  940,  941,  250,  250, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  250,  250,  250,  250,  260,  767,  767,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  955,  955,  955,  956,
			  956,  956,  957,  957,  957,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  958,  958,  958,  959,  959,  959,  960,
			  960,  960,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  961,  961,  961,  962,  962,  962,  963,  963,  963,
			  984,  297,  297,  297,  985,  297,  297,  297,  297,  297,
			  297,  988,  988,  988,  989,  989,  989,  990,  990,  990,
			  991,  991,  308,  308,  308, 1195,  991,  991,  991,  991,

			  991,  991,  992,  992,  308,  308,  308, 1194,  992,  992,
			  992,  992,  992,  992,  994,  994,  308,  308,  308, 1193,
			  994,  994,  994,  994,  994,  994,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  995,  995,  995,  993,  996,
			  996,  996,  997,  997,  997,  329,  329,  329, 1001, 1001,
			  823,  329,  329,  329,  329,  329,  329,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  351,  351,  351,  351,
			  351,  351,  351,  351,  351,  621,  621,  621,  999,  999,
			  999, 1002, 1002, 1002,  360,  360,  360,  360,  360,  360,
			  360,  360,  360, 1004, 1004, 1004, 1005, 1005, 1005, 1006, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1006, 1006, 1007, 1007,  367,  367,  367, 1192, 1007, 1007,
			 1007, 1007, 1007, 1007, 1008, 1008,  367,  367,  367, 1191,
			 1008, 1008, 1008, 1008, 1008, 1008, 1010, 1010,  367,  367,
			  367, 1190, 1010, 1010, 1010, 1010, 1010, 1010,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  394,  394,  394,
			 1009,  394,  394,  394,  394,  394,  394,  409,  409,  409,
			 1019, 1019,  859,  409,  409,  409,  409,  409,  409, 1012,
			  423,  423,  423,  423, 1189,  423,  423,  423,  423,  423,
			  423, 1013, 1013, 1018, 1018, 1018, 1188, 1013, 1013, 1013,
			 1013, 1013, 1013, 1020, 1020, 1021, 1021, 1021, 1015, 1015,

			  423,  423,  423,  423, 1015, 1015, 1015, 1015, 1015, 1015,
			  423,  423,  423, 1044, 1044, 1014,  423,  423,  423, 1023,
			 1023, 1023, 1024, 1024, 1024, 1025, 1025, 1025,  423,  423,
			 1045, 1045, 1016, 1187,  423,  423,  423,  423,  423,  423,
			 1026, 1026,  423,  423,  423, 1186, 1026, 1026, 1026, 1026,
			 1026, 1026,  423,  423,  423, 1050, 1050, 1027, 1027,  423,
			  423,  423,  423, 1027, 1027, 1027, 1027, 1027, 1027,  423,
			  423, 1029, 1029, 1029,  423,  423,  423,  423,  423,  423,
			  423, 1030, 1030, 1030, 1051, 1051, 1028, 1028, 1031, 1031,
			 1031,  423, 1028, 1028, 1028, 1028, 1028, 1028,  423,  423, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  423, 1185, 1176,  423,  423,  423,  423,  423,  423,  423,
			  450,  905,  905,  450,  450,  450,  450,  450,  450, 1175,
			  423,  450,  450,  450, 1032, 1032, 1032, 1033, 1033, 1033,
			 1034, 1034, 1034,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  460,  915,  915,  460,  460,  460,  460,  460,
			  460,  460,  460,  460, 1035, 1035, 1035, 1036, 1036, 1036,
			 1037, 1037, 1037,  460,  460,  460,  460,  460,  460,  460,
			  460,  460,  469,  469,  469,  469,  469,  469,  469,  469,
			  469, 1038, 1038, 1038, 1039, 1039, 1039, 1040, 1040, 1040,
			  215,  215,  215,  215,  215,  215,  215,  215,  215, 1255,

			  748,  748,  748, 1043, 1043, 1043, 1046, 1046, 1046,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  755,  755,
			  755, 1049, 1049, 1049, 1052, 1052, 1052, 1174, 1041,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  260,  260,
			  260, 1173, 1255,  260,  260,  260,  260,  260,  260,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  537,  537,
			  537,  537,  537,  537,  537,  537,  537, 1066, 1073,  297,
			  297,  297, 1074,  297,  297,  297, 1172, 1067,  297,  297,
			  297,  993,  993,  327,  327,  327, 1171,  993,  993,  993,
			  993,  993,  993, 1079, 1079,  327,  327,  327, 1170, 1079, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1079, 1079, 1079, 1079, 1079, 1080, 1080,  327,  327,  327,
			 1169, 1080, 1080, 1080, 1080, 1080, 1080,  621,  621,  621,
			  621,  621,  621,  621,  621,  621, 1081, 1081, 1081,  993,
			 1082, 1082, 1082, 1083, 1083, 1083,  360,  360,  360, 1168,
			 1167,  823,  360,  360,  360,  360,  360,  360, 1009, 1009,
			  423,  423,  423, 1166, 1009, 1009, 1009, 1009, 1009, 1009,
			 1084, 1084,  423,  423,  423, 1165, 1084, 1084, 1084, 1084,
			 1084, 1084, 1085, 1085,  423,  423,  423, 1164, 1085, 1085,
			 1085, 1085, 1085, 1085,  423,  423, 1090, 1090, 1090, 1163,
			  423,  423,  423,  423,  423,  423, 1009, 1091, 1091, 1091,

			 1092, 1092, 1092, 1087, 1087,  423,  423,  423,  859, 1087,
			 1087, 1087, 1087, 1087, 1087, 1088, 1088, 1162,  423, 1153,
			 1152, 1088, 1088, 1088, 1088, 1088, 1088,  423,  423,  423,
			 1151, 1150,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423, 1089, 1089,  423,  423,  423,  423,
			 1089, 1089, 1089, 1089, 1089, 1089,  423,  423,  423, 1149,
			 1148, 1093, 1093,  423,  423,  423,  423, 1093, 1093, 1093,
			 1093, 1093, 1093, 1094, 1094,  450,  450,  450,  423, 1094,
			 1094, 1094, 1094, 1094, 1094,  450,  450,  450, 1147, 1146,
			 1095, 1095,  450,  450,  450,  423, 1095, 1095, 1095, 1095, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1095, 1095,  460,  460,  460, 1255, 1145,  423,  460,  460,
			  460,  460,  460,  460,  469,  469,  469,  469,  469,  469,
			  469,  469,  469, 1142,  423,  748,  748,  748,  748,  748,
			  748, 1141, 1140, 1096,  748,  748,  748, 1097, 1097, 1097,
			 1098, 1098, 1098, 1099, 1099, 1099, 1137, 1136, 1255,  755,
			  755,  755,  755,  755,  755,  755,  755,  755, 1100, 1100,
			 1100, 1101, 1101, 1101, 1102, 1102, 1102, 1114, 1124, 1124,
			 1135, 1115, 1134, 1128, 1124, 1124, 1124, 1124, 1124, 1124,
			 1125, 1125,  621,  621,  621, 1123, 1125, 1125, 1125, 1125,
			 1125, 1125,  621,  621,  621,  621,  621,  621, 1122, 1126,

			 1126,  423,  423,  423,  993, 1126, 1126, 1126, 1126, 1126,
			 1126, 1127, 1127,  423,  423,  423,  823, 1127, 1127, 1127,
			 1127, 1127, 1127, 1129, 1129,  423,  423,  423, 1121, 1129,
			 1129, 1129, 1129, 1129, 1129, 1009,  748,  748,  748,  748,
			  748,  748, 1130, 1130,  748,  748,  748,  859, 1130, 1130,
			 1130, 1130, 1130, 1130, 1131, 1131, 1120,  423, 1119, 1118,
			 1131, 1131, 1131, 1131, 1131, 1131,  755,  755,  755, 1117,
			 1116,  423,  423,  755,  755,  755,  423,  423,  423,  423,
			  423,  423,  423, 1132, 1132,  755,  755,  755,  423, 1132,
			 1132, 1132, 1132, 1132, 1132, 1143,  279,  279,  279, 1144, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1133, 1133, 1113, 1112, 1111,  423, 1133, 1133, 1133, 1133,
			 1133, 1133, 1154, 1154, 1110, 1109, 1108,  423, 1154, 1154,
			 1154, 1154, 1154, 1154,  222,  222, 1107,  222, 1106, 1155,
			 1155, 1105, 1104, 1103,  423, 1155, 1155, 1155, 1155, 1155,
			 1155, 1086, 1078, 1156, 1156, 1077, 1076, 1075,  993, 1156,
			 1156, 1156, 1156, 1156, 1156,  298,  298, 1072,  298, 1071,
			 1157, 1157, 1070, 1069, 1068,  823, 1157, 1157, 1157, 1157,
			 1157, 1157, 1065, 1064,  423,  423, 1063, 1062, 1061, 1009,
			  423,  423,  423,  423,  423,  423,  328,  328, 1060,  328,
			 1059, 1158, 1158, 1058, 1057, 1054,  859, 1158, 1158, 1158,

			 1158, 1158, 1158, 1159, 1159, 1053, 1048, 1047,  423, 1159,
			 1159, 1159, 1159, 1159, 1159,  434,  434, 1042,  434,  450,
			 1160, 1160, 1022, 1017, 1011,  423, 1160, 1160, 1160, 1160,
			 1160, 1160, 1161, 1161, 1003,  998,  987,  423, 1161, 1161,
			 1161, 1161, 1161, 1161,  986,  983,  982,  981,  980, 1177,
			 1177,  979,  978,  977,  423, 1177, 1177, 1177, 1177, 1177,
			 1177, 1178, 1178,  976,  975,  974,  423, 1178, 1178, 1178,
			 1178, 1178, 1178, 1179, 1179,  973,  970,  969,  968, 1179,
			 1179, 1179, 1179, 1179, 1179,  993,  217,  967,  966,  965,
			  964,  217, 1180, 1180,  217,  250,  930,  823, 1180, 1180, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1180, 1180, 1180, 1180, 1181, 1181,  925,  921,  916, 1009,
			 1181, 1181, 1181, 1181, 1181, 1181, 1182, 1182,  911,  906,
			  904,  900, 1182, 1182, 1182, 1182, 1182, 1182,  859,  895,
			  889,  884,  873, 1183, 1183,  856,  855,  850,  423, 1183,
			 1183, 1183, 1183, 1183, 1183, 1184, 1184,  833,  828,  820,
			  423, 1184, 1184, 1184, 1184, 1184, 1184,  819,  814,  813,
			  812,  811, 1199, 1199,  810,  807,  806,  423, 1199, 1199,
			 1199, 1199, 1199, 1199, 1200, 1200,  805,  802,  801,  423,
			 1200, 1200, 1200, 1200, 1200, 1200,  800,  799,  798,  797,
			  796, 1201, 1201,  795,  794,  793,  423, 1201, 1201, 1201,

			 1201, 1201, 1201, 1202, 1202,  792,  791,  790,  423, 1202,
			 1202, 1202, 1202, 1202, 1202,  789,  788,  783,  782,  777,
			 1214, 1214,  773,  768,  763,  423, 1214, 1214, 1214, 1214,
			 1214, 1214, 1215, 1215,  758,  756,  755,  423, 1215, 1215,
			 1215, 1215, 1215, 1215,  754,  749,  748,  746,  741,  423,
			  423,  730,  725,  716,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  715,  710,  475,  423,  423,  423,  423,
			  423,  423,  423,  470,  696,  695,  694,  689,  423,  423,
			  669,  668,  667,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  666,  661,  657,  423,  423,  423,  423,  423, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  423,  423,  652,  648,  643,  642,  442,  442,  637,  442,
			  632,  442,  423,  442,  442,  442,  442,  620,  615,  611,
			  442,  606,  605,  600,  423,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,

			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  179,  179,  179,  179,  179,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  589,  228,  242,  242,  584,  579,  295,
			  242,  568,  242,  242,  242,  242,  242,  242,  567,  242,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  566,  250,  260,  260,  260,  565,  260,  260,
			  260,  260,  260,  260,  260,  260,  564,  260,  294,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  308,  308,  308,  308,  308,  308,  308,

			  308,  308,  308,  308,  308,  563,  308,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  552,
			  329,  337,  337,  337,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  551,  337,  351,  351,  351,  351,  351,
			  351,  351,  351,  351,  351,  351,  550,  351,  367,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  549,  367,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  546,  378,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  545,  394,  394,  394,
			  526,  394,  409,  409,  409,  409,  409,  409,  409,  409, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  409,  409,  409,  409,  521,  409,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  512,  423,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  450,  511,  450,  460,  460,  460,  506,  460,  460,
			  460,  460,  460,  460,  460,  460,  275,  460,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  270,  215,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  241,  224,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  236,  269,
			  297,  297,  297,  297,  297,  297,  297,  297,  297,  297,

			  297,  297,  475,  297,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  470,  327,  360,  360,
			  360,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  469,  360,  469,  469,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  441,  469,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  436,  537,
			  621,  621,  621,  621,  621,  621,  621,  621,  621,  621,
			  621,  621,  422,  621,  748,  748,  748,  748,  748,  748,
			  748,  748,  748,  748,  748,  748,  748,  408,  748,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  755,  403,  755,  393,  388,  366,  361,  350,  345,  327,
			  325,  320,  305,  300,  297,  295,  293,  292,  291,  288,
			  287,  286,  285,  284,  283,  282,  281,  280,  278,  276,
			  275,  270,  269,  241,  236,  227,  225,  224,  215, 1255,
			   96,   96,   37, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,

			 1255, 1255, 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 106, 4400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4505)
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
			   39,   45, 1271,    1,    2,    2,    2, 1192,   78,    2,
			   78,   98,  110,   98,  110, 1253,    2,  113,  113,  127,
			  146,  127,  146, 1245,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    3,    3,    3,
			    4,    4,    4,   59,   59,    4,   56,   56,   56,    3,
			   60,   60,    4,  187,    3,   72,   72,    4,   17,   17,
			   17,   73,   73,   18,   18,   18,   42, 1251,   91,   17,
			   91,  187,   17,   17,   18,  105,  105,   18,   18,   58,

			   58,   58,  183,    3,  183,    3,    4,    3,    4, 1250,
			    4,    5,   61,   61,   61,   42,  106,  106,   42,   69,
			   69,   69, 1247,   42,   71,   71,   71,  282,   17,   42,
			   65,  282,   65,   18,   53,   53,   53,   53,   53,   53,
			   53,   54,   54,   54,   54,   54,   54,   54,   63,   63,
			   63,   63,   63,   63,   63,   67,   74,   74,   74,  122,
			  122,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    6,   64,   64,   64,   64,   64,   64,   64,
			  123,  123,   65,   65,   65,   65,   65,   65,   65,  102,
			  102,  102,  104,  104,  104,  107,  107,  107,  119,  119, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  119,  121,  121,  121, 1246,   67,   67,   67,   67,   67,
			   67,   67,  124,  124,  124,  134,  134,  134,  134,  134,
			  134,  134,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    7,  192,    7,  192,    7,    7,  138,
			  138,  138,  141,  141,    7,  137,  137,  137,  137,  137,
			  137,  137,  140,  140,  140,  142,  142,  143,  143,  143,
			  145,  145,  145,  145,  145,  145,  145,  148,  149,  149,
			  149,  151,  151,  151,  152,  152,  153,  153,  154,  154,
			  154,  163,  163,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    8,  214,    8,  214,    8,    8,

			  160,  160,  160,  164,  164,    8,  162,  162,  162, 1244,
			  148,  148,  148,  148,  148,  148,  148,  165,  165,  165,
			  169,  169,  169,  169,  169,  169,  169,  172,  172,  172,
			  174,  174,  174,  175,  175,  176,  176,  177,  177,  177,
			  186,  186,  186, 1243,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
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
			    9,    9,    9,    9,    9,    9,    9,    9,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   19, 1241,   19,  190,  193,  193,  193,  195,  195,
			  195,  196,  196,  181, 1240,  190,  190,  190,  190,  190,

			  190,  190,  197,  197,  198,  198,  198,  207,  207,  207,
			  159,  200,  200,  200,  200,  200,  200,  200,  202, 1239,
			  202,  209,  209,  209,   19,  210,  210,  203,  211,  211,
			 1238,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   20,  159,   20,  181,  181,  181,  181,  181,
			  181,  181, 1237,  159,  159,  159,  159,  159,  159,  159,
			  201,  201,  201,  201,  201,  201,  201,  212,  212,  212,
			  202,  202,  202,  202,  202,  202,  202,  203,  203,  203,
			  203,  203,  203,  203,  223,   20,  223,  229,  229,  229,
			  232,  232,   20,   20,   20,   20,   20,   20,   20,   20, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   20,   20,   20,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   23,  215,  215,  215,
			  215,  215,  215,  215,  221,  221,  221,  224,  224,  224,
			  224,  224,  224,  224, 1235,  217,  221,  219,  220,  277,
			  227,  277,  227,  231,  231,  231,  233,  233, 1234,  218,

			  226,  226,  227,  228,  228,  228,  228,  228,  228,  228,
			  234,  234,  234,   23,   23, 1233,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   24,  217,  218,
			  219,  220, 1232,  226,  246,  246,  226,  236,  236,  236,
			  247,  247,  218,  237,  237,  237,  238,  238,  238,  239,
			  239,  239,  240,  240,  240,  241,  241,  241,  242,  242,
			  242,  242,  242,  242,  242,  243,  243,  243,  245,  245,
			  245,  248,  248,  248,   24,   24, 1231,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   25,   25,
			   25,  253,  253,  253,  255,  255,  255,  256,  256, 1229, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   25,  250, 1228,  250,  257,  257,  258,  258,  258,  252,
			  262,  262,  262,  264,  264,  264,  265,  265,  266,  266,
			 1227,  252,  261,  267,  267,  267,  270,  270,  270,  261,
			  269,  269,  269,  269,  269,  269,  269,  307,  307,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   26,   26,   26,  250,  250,  250,  250,  250,  250,  250,
			  315,  315,   26,  252,  252,  252,  252,  252,  252,  252,
			 1226,  261,  261,  261,  261,  261,  261,  261,  271,  271,
			  271,  272,  272,  272,  273,  273,  273,  274,  274,  274,
			  275,  275,  275,  296, 1225,  296,  300,  300,  300,  316,

			  316,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   27,  297,  297,  297,  297,  297,  297,  297,
			  301,  301,  301,  302,  302,  302,  303,  303,  303,  304,
			  304,  304,  305,  305,  305,  306,  326,  306,  326, 1224,
			  310,  310,  312,  312,  312, 1223,  310,  310,  310,  310,
			  310,  310,  314,  314,  314,   27, 1221,   27,  317,  317,
			  317, 1220,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   28,  310,  311,  311,  320,  320,  320,
			 1219,  311,  311,  311,  311,  311,  311,  321,  321,  321,
			  322,  322,  322,  323,  323,  323,  324,  324,  324,  325, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  325,  325,  327,  327,  327,  327,  327,  327,  327,  311,
			  330,  330,  330,  332,  332,  332,   28, 1218,   28,  333,
			  333,  334,  334,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   29,  329,  329,  329,  329,  329,
			  329,  329,  335,  335,  335,   29,  337,  337,  337,  337,
			  337,  337,  337,  338,  338,  338,  340,  340,  340,  341,
			  341,  342,  342,  343,  343,  343,  345,  345,  345,  346,
			  346,  346,  347,  347,  347,  355,  355,   29,   29,  348,
			  348,  348,  356,  356,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   30,  349,  349,  349,  350,

			  350,  350,  352,  352,  352, 1217,   30,  351,  351,  351,
			  351,  351,  351,  351,  354,  354,  354,  357,  357,  357,
			  359, 1216,  359,  361,  361,  361,  362,  362,  362,  363,
			  363,  363,  364,  364,  364,  365,  365,  365,   30,   30,
			  366,  366,  366,  374,  374,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   30,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   35,
			 1213,   35,  375,  375,   35,  369,  369,  371,  371,  371,
			   35,  369,  369,  369,  369,  369,  369,  383,  383,  360,
			  373,  373,  373,  376,  376,  376, 1212,  370,  370,  380,
			  380,  380, 1210,  370,  370,  370,  370,  370,  370,  369,
			  382,  382,  382,  384,  384,  418,   35,  418,   35,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,
			   36,  370,   36,  398,  398,   36,  385,  385,  385,  399,
			  399,   36,  360,  360,  360,  360,  360,  360,  360,  388,

			  388,  388,  389,  389,  389,  390,  390,  390,  391,  391,
			  391,  392,  392,  392,  393,  393,  393,  395,  395,  395,
			  397,  397,  397,  400,  400,  400,  560,   36,  560,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,  118,  403,  403,  403,  404,  404,  404,  405,  405,
			  405,  406,  406,  406,  407,  407,  407,  408,  408,  408,
			  411,  411,  411,  413,  413,  413,  118,  409, 1096,  118,
			  414,  414,  415,  415,  416,  416,  416,  428,  428,  423,
			  423, 1209,  118,  118,  118,  118,  118,  118,  118,  158,
			  423,  423,  423,  423,  423,  423,  423,  425,  425,  425, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  427,  427,  427,  429,  429,  430,  430,  430,  434,  965,
			  434, 1096,  434,  434,  158,  446,  446,  158,  965,  409,
			  409,  409,  409,  409,  409,  409,  436,  436,  436, 1208,
			  158,  158,  158,  158,  158,  158,  158,  170,  437,  437,
			  437,  438,  438,  438, 1207,  434,  447,  447,  434,  439,
			  439,  439,  440,  440,  440,  441,  441,  441,  443,  443,
			  443, 1206,  170, 1205,  452,  170,  442,  442,  442,  442,
			  442,  442,  442,  445,  445,  445,  452, 1204,  170,  170,
			  170,  170,  170,  170,  170,  191,  448,  448,  448,  453,
			  453,  453,  455,  455,  455,  456,  456,  457,  457,  458,

			  458,  458,  462,  462,  462,  464,  464,  464,  465,  465,
			  191,  466,  466,  191,  467,  467,  467, 1203,  452,  452,
			  452,  452,  452,  452,  452, 1108,  191,  191,  191,  191,
			  191,  191,  191,  278, 1108,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  470,  470,  470, 1198,  278,  278,
			  278,  278,  278,  278,  278,  278,  287,  287,  287,  287, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  287,  461,  471,  471,  471,  798,  287,  287,  461,  798,
			  287,  287, 1196,  450, 1195,  450,  287,  424,  469,  469,
			  469,  469,  469,  469,  469,  472,  472,  472,  473,  473,
			  473,  474,  474,  474,  475,  475,  475,  476,  476,  476,
			  479,  479,  424,  480,  480,  424,  478,  478,  478,  483,
			  461,  461,  461,  461,  461,  461,  461, 1194,  424,  424,
			  424,  424,  424,  424,  424,  450,  450,  450,  450,  450,
			  450,  450,  481,  481,  481,  486,  486,  486,  488,  488,
			  488, 1193,  483,  489,  489,  490,  490,  491,  491,  491,
			  498,  498,  483,  494,  494,  494,  495,  495,  495,  496,

			  496,  496,  499,  499,  499,  501,  501,  501,  502,  502,
			  503,  503,  504,  504,  504,  506,  506,  506,  507,  507,
			  507,  508,  508,  508,  509,  509,  509,  510,  510,  510,
			  511,  511,  511,  513,  513,  514,  514,  514,  516,  516,
			  516,  517,  517,  518,  518,  519,  519,  519,  521,  521,
			  521,  522,  522,  522,  523,  523,  523,  524,  524,  524,
			  525,  525,  525,  526,  526,  526,  527,  527,  527,  529,
			  529,  529,  530,  530,  531,  531,  532,  532,  532,  534,
			  534,  534,  535,  535,  535,  536,  536,  536,  537,  537,
			  537,  537,  537,  537,  537,  538,  538,  538,  540,  540, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  540,  541,  541,  542,  542,  543,  543,  543,  564,  569,
			  569,  569,  571,  571,  571,  572,  572, 1191,  564,  573,
			  573,  574,  574,  574,  576,  576,  576,  577,  577,  577,
			  578,  578,  578,  580,  580,  584,  584,  584, 1188,  580,
			  580,  580,  580,  580,  580,  581,  581,  585,  585,  585,
			 1187,  581,  581,  581,  581,  581,  581,  582,  582,  586,
			  586,  586, 1186,  582,  582,  582,  582,  582,  582,  583,
			  583,  587,  587,  587, 1185,  583,  583,  583,  583,  583,
			  583,  588,  588,  588,  589,  589,  589,  590,  590,  590,
			  591,  591,  591,  592,  592,  592,  593,  593,  593,  595,

			  595,  595,  596,  596,  597,  597,  598,  598,  598,  600,
			  600,  600,  601,  601,  601,  602,  602,  602,  603,  603,
			  603,  604,  604,  604,  605,  605,  605,  606,  606,  606,
			  607,  607,  607,  608,  608,  608,  609,  609,  609,  610,
			  610,  610,  611,  611,  611,  612,  612,  612,  613,  613,
			  613,  614,  614,  614,  615,  615,  615,  616,  616,  616,
			  617,  617,  617,  618,  618,  618,  619,  619,  619,  620,
			  620,  620,  621,  621,  621,  621,  621,  621,  621,  622,
			  622,  622,  624,  624,  624,  625,  625,  626,  626,  627,
			  627,  627,  629,  629,  629,  630,  630,  630,  631,  631, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  631,  633,  633,  637,  637,  637, 1180,  633,  633,  633,
			  633,  633,  633,  634,  634,  638,  638,  638, 1179,  634,
			  634,  634,  634,  634,  634,  635,  635,  639,  639,  639,
			 1178,  635,  635,  635,  635,  635,  635,  636,  636,  640,
			  640,  640, 1177,  636,  636,  636,  636,  636,  636,  641,
			  641,  641,  642,  642,  642,  643,  643,  643,  644,  644,
			  644,  645,  645,  645,  646,  646,  646,  647,  647,  647,
			  648,  648,  648,  649,  649,  649,  650,  650,  650,  651,
			  651,  651,  652,  652,  652,  653,  653,  653,  654,  654,
			  654,  655,  655,  655,  656,  656,  656,  657,  657,  657,

			  658,  658,  658,  659,  659,  659,  660,  660,  660,  661,
			  661,  661,  662,  662,  662,  663,  663,  663,  664,  664,
			  664,  665,  665,  665,  666,  666,  666,  670,  672,  672,
			  672,  674,  674,  674,  675,  675,  676,  676,  677,  677,
			  677,  682,  682,  682,  684,  684,  684,  685,  685, 1176,
			  681,  681,  670,  686,  686,  670,  681,  681,  681,  681,
			  681,  681,  687,  687,  687,  689,  689,  689,  670,  670,
			  670,  670,  670,  670,  670,  679,  690,  690,  690,  691,
			  691,  691,  702,  702,  681,  692,  692,  692,  693,  693,
			  693,  694,  694,  694,  698,  698,  698,  699,  699,  699, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  700,  700,  700,  706,  706,  679,  679,  703,  703,  703,
			  705,  705,  705,  707,  707, 1175,  679,  679,  679,  679,
			  679,  679,  679,  680,  680,  708,  708,  708, 1174,  680,
			  680,  680,  680,  680,  680,  710,  710,  710,  711,  711,
			  711,  712,  712,  712,  713,  713,  713,  714,  714,  714,
			  715,  715,  715,  680,  680,  717,  717,  680,  718,  718,
			  718,  720,  720,  720,  680,  680,  680,  680,  680,  680,
			  680,  721,  721,  722,  722,  723,  723,  723,  725,  725,
			  725,  726,  726,  726,  727,  727,  727,  728,  728,  728,
			  729,  729,  729,  730,  730,  730,  731,  731,  731,  733,

			  733,  733,  734,  734,  735,  735,  736,  736,  736,  738,
			  738,  738,  739,  739,  739,  740,  740,  740,  741,  741,
			  741,  742,  742,  742,  743,  743,  743,  744,  744,  744,
			  745,  745,  745,  746,  746,  746,  747,  748,  749,  749,
			  749,  750,  750,  750,  751,  751,  751,  752,  752,  752,
			  753,  753,  753,  754,  754,  754,  757,  757,  757,  747,
			  755,  755,  755,  755,  755,  755,  755,  758,  758,  758,
			  759,  759,  759,  760,  760,  760,  761,  761,  761,  747,
			  762,  762,  762,  763,  763,  763,  764,  764,  764,  846,
			  846,  748,  748,  748,  748,  748,  748,  748,  765,  765, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  765,  766,  766,  766,  767,  767,  767,  768,  768,  768,
			  769,  769,  769,  770,  770,  770,  771,  771,  771,  772,
			  772,  772,  773,  773,  773,  774,  774,  774,  775,  775,
			  775,  776,  776,  776,  777,  777,  777,  778,  778,  778,
			  779,  779,  779,  780,  780,  780,  781,  781,  781,  782,
			  782,  782,  783,  783,  783,  784,  784,  784,  785,  785,
			  785,  786,  786,  786,  787,  787,  787,  788,  788,  788,
			  810,  814,  814,  814,  810,  815,  815,  815,  816,  816,
			  816,  817,  817,  817,  818,  818,  818,  819,  819,  819,
			  821,  821,  825,  825,  825, 1173,  821,  821,  821,  821,

			  821,  821,  822,  822,  826,  826,  826, 1172,  822,  822,
			  822,  822,  822,  822,  824,  824,  827,  827,  827, 1171,
			  824,  824,  824,  824,  824,  824,  828,  828,  828,  829,
			  829,  829,  830,  830,  830,  831,  831,  831,  822,  832,
			  832,  832,  833,  833,  833,  834,  834,  834,  847,  847,
			  824,  835,  835,  835,  836,  836,  836,  837,  837,  837,
			  838,  838,  838,  839,  839,  839,  840,  840,  840,  841,
			  841,  841,  842,  842,  842,  843,  843,  843,  845,  845,
			  845,  848,  848,  848,  850,  850,  850,  851,  851,  851,
			  852,  852,  852,  853,  853,  853,  854,  854,  854,  855, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  855,  855,  857,  857,  861,  861,  861, 1170,  857,  857,
			  857,  857,  857,  857,  858,  858,  862,  862,  862, 1169,
			  858,  858,  858,  858,  858,  858,  860,  860,  863,  863,
			  863, 1168,  860,  860,  860,  860,  860,  860,  864,  864,
			  864,  865,  865,  865,  866,  866,  866,  867,  867,  867,
			  858,  868,  868,  868,  869,  869,  869,  870,  870,  870,
			  880,  880,  860,  871,  871,  871,  872,  872,  872,  874,
			  874,  877,  877,  877, 1167,  874,  874,  874,  874,  874,
			  874,  875,  875,  879,  879,  879, 1165,  875,  875,  875,
			  875,  875,  875,  881,  881,  882,  882,  882,  876,  876,

			  884,  884,  884,  874,  876,  876,  876,  876,  876,  876,
			  885,  885,  885,  938,  938,  875,  886,  886,  886,  887,
			  887,  887,  888,  888,  888,  889,  889,  889,  890,  890,
			  939,  939,  876, 1164,  890,  890,  890,  890,  890,  890,
			  891,  891,  895,  895,  895, 1163,  891,  891,  891,  891,
			  891,  891,  896,  896,  896,  948,  948,  892,  892,  897,
			  897,  897,  890,  892,  892,  892,  892,  892,  892,  893,
			  893,  898,  898,  898,  891,  893,  893,  893,  893,  893,
			  893,  899,  899,  899,  949,  949,  894,  894,  900,  900,
			  900,  892,  894,  894,  894,  894,  894,  894,  901,  901, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  901, 1162, 1153,  893,  902,  902,  902,  903,  903,  903,
			  905,  905,  905,  906,  906,  906,  907,  907,  907, 1152,
			  894,  908,  908,  908,  909,  909,  909,  910,  910,  910,
			  911,  911,  911,  912,  912,  912,  913,  913,  913,  914,
			  914,  914,  915,  915,  915,  916,  916,  916,  917,  917,
			  917,  918,  918,  918,  919,  919,  919,  920,  920,  920,
			  921,  921,  921,  922,  922,  922,  923,  923,  923,  924,
			  924,  924,  925,  925,  925,  926,  926,  926,  927,  927,
			  927,  928,  928,  928,  929,  929,  929,  930,  930,  930,
			  931,  931,  931,  932,  932,  932,  933,  933,  933,  934,

			  935,  935,  935,  937,  937,  937,  940,  940,  940,  942,
			  942,  942,  943,  943,  943,  944,  944,  944,  945,  945,
			  945,  947,  947,  947,  950,  950,  950, 1151,  934,  952,
			  952,  952,  953,  953,  953,  954,  954,  954,  955,  955,
			  955, 1150,  934,  956,  956,  956,  957,  957,  957,  958,
			  958,  958,  959,  959,  959,  960,  960,  960,  961,  961,
			  961,  962,  962,  962,  963,  963,  963,  977,  983,  988,
			  988,  988,  983,  989,  989,  989, 1146,  977,  990,  990,
			  990,  991,  991,  995,  995,  995, 1145,  991,  991,  991,
			  991,  991,  991,  992,  992,  996,  996,  996, 1144,  992, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  992,  992,  992,  992,  992,  994,  994,  997,  997,  997,
			 1143,  994,  994,  994,  994,  994,  994,  998,  998,  998,
			  999,  999,  999, 1000, 1000, 1000, 1001, 1001, 1001,  992,
			 1002, 1002, 1002, 1003, 1003, 1003, 1004, 1004, 1004, 1142,
			 1141,  994, 1005, 1005, 1005, 1006, 1006, 1006, 1007, 1007,
			 1017, 1017, 1017, 1140, 1007, 1007, 1007, 1007, 1007, 1007,
			 1008, 1008, 1018, 1018, 1018, 1139, 1008, 1008, 1008, 1008,
			 1008, 1008, 1010, 1010, 1019, 1019, 1019, 1138, 1010, 1010,
			 1010, 1010, 1010, 1010, 1012, 1012, 1020, 1020, 1020, 1135,
			 1012, 1012, 1012, 1012, 1012, 1012, 1008, 1021, 1021, 1021,

			 1022, 1022, 1022, 1013, 1013, 1023, 1023, 1023, 1010, 1013,
			 1013, 1013, 1013, 1013, 1013, 1014, 1014, 1134, 1012, 1122,
			 1121, 1014, 1014, 1014, 1014, 1014, 1014, 1024, 1024, 1024,
			 1120, 1119, 1015, 1015, 1025, 1025, 1025, 1013, 1015, 1015,
			 1015, 1015, 1015, 1015, 1016, 1016, 1029, 1029, 1029, 1014,
			 1016, 1016, 1016, 1016, 1016, 1016, 1030, 1030, 1030, 1118,
			 1117, 1026, 1026, 1031, 1031, 1031, 1015, 1026, 1026, 1026,
			 1026, 1026, 1026, 1027, 1027, 1032, 1032, 1032, 1016, 1027,
			 1027, 1027, 1027, 1027, 1027, 1033, 1033, 1033, 1116, 1115,
			 1028, 1028, 1034, 1034, 1034, 1026, 1028, 1028, 1028, 1028, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1028, 1028, 1035, 1035, 1035, 1041, 1114, 1027, 1036, 1036,
			 1036, 1037, 1037, 1037, 1038, 1038, 1038, 1039, 1039, 1039,
			 1040, 1040, 1040, 1112, 1028, 1042, 1042, 1042, 1043, 1043,
			 1043, 1111, 1110, 1041, 1044, 1044, 1044, 1045, 1045, 1045,
			 1046, 1046, 1046, 1047, 1047, 1047, 1107, 1106, 1041, 1048,
			 1048, 1048, 1049, 1049, 1049, 1050, 1050, 1050, 1051, 1051,
			 1051, 1052, 1052, 1052, 1053, 1053, 1053, 1068, 1079, 1079,
			 1104, 1068, 1103, 1086, 1079, 1079, 1079, 1079, 1079, 1079,
			 1080, 1080, 1081, 1081, 1081, 1078, 1080, 1080, 1080, 1080,
			 1080, 1080, 1082, 1082, 1082, 1083, 1083, 1083, 1076, 1084,

			 1084, 1090, 1090, 1090, 1079, 1084, 1084, 1084, 1084, 1084,
			 1084, 1085, 1085, 1091, 1091, 1091, 1080, 1085, 1085, 1085,
			 1085, 1085, 1085, 1087, 1087, 1092, 1092, 1092, 1075, 1087,
			 1087, 1087, 1087, 1087, 1087, 1084, 1097, 1097, 1097, 1098,
			 1098, 1098, 1088, 1088, 1099, 1099, 1099, 1085, 1088, 1088,
			 1088, 1088, 1088, 1088, 1089, 1089, 1074, 1087, 1073, 1072,
			 1089, 1089, 1089, 1089, 1089, 1089, 1100, 1100, 1100, 1071,
			 1069, 1093, 1093, 1101, 1101, 1101, 1088, 1093, 1093, 1093,
			 1093, 1093, 1093, 1094, 1094, 1102, 1102, 1102, 1089, 1094,
			 1094, 1094, 1094, 1094, 1094, 1113, 1276, 1276, 1276, 1113, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1095, 1095, 1067, 1066, 1065, 1093, 1095, 1095, 1095, 1095,
			 1095, 1095, 1124, 1124, 1062, 1061, 1060, 1094, 1124, 1124,
			 1124, 1124, 1124, 1124, 1270, 1270, 1059, 1270, 1058, 1125,
			 1125, 1057, 1056, 1055, 1095, 1125, 1125, 1125, 1125, 1125,
			 1125, 1011,  987, 1126, 1126,  986,  985,  984, 1124, 1126,
			 1126, 1126, 1126, 1126, 1126, 1278, 1278,  982, 1278,  981,
			 1127, 1127,  980,  979,  978, 1125, 1127, 1127, 1127, 1127,
			 1127, 1127,  976,  975, 1129, 1129,  974,  972,  971, 1126,
			 1129, 1129, 1129, 1129, 1129, 1129, 1280, 1280,  970, 1280,
			  969, 1130, 1130,  968,  967,  964, 1127, 1130, 1130, 1130,

			 1130, 1130, 1130, 1131, 1131,  951,  946,  941, 1129, 1131,
			 1131, 1131, 1131, 1131, 1131, 1289, 1289,  936, 1289,  904,
			 1132, 1132,  883,  878,  873, 1130, 1132, 1132, 1132, 1132,
			 1132, 1132, 1133, 1133,  849,  844,  812, 1131, 1133, 1133,
			 1133, 1133, 1133, 1133,  811,  809,  808,  807,  806, 1154,
			 1154,  805,  804,  803, 1132, 1154, 1154, 1154, 1154, 1154,
			 1154, 1155, 1155,  802,  801,  800, 1133, 1155, 1155, 1155,
			 1155, 1155, 1155, 1156, 1156,  799,  797,  796,  795, 1156,
			 1156, 1156, 1156, 1156, 1156, 1154, 1269,  792,  791,  790,
			  789, 1269, 1157, 1157, 1269,  756,  737, 1155, 1157, 1157, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1157, 1157, 1157, 1157, 1158, 1158,  732,  724,  719, 1156,
			 1158, 1158, 1158, 1158, 1158, 1158, 1159, 1159,  709,  704,
			  701,  688, 1159, 1159, 1159, 1159, 1159, 1159, 1157,  683,
			  678,  673,  669, 1160, 1160,  632,  628,  623, 1158, 1160,
			 1160, 1160, 1160, 1160, 1160, 1161, 1161,  599,  594,  579,
			 1159, 1161, 1161, 1161, 1161, 1161, 1161,  575,  570,  568,
			  567,  566, 1181, 1181,  565,  563,  562, 1160, 1181, 1181,
			 1181, 1181, 1181, 1181, 1182, 1182,  561,  559,  558, 1161,
			 1182, 1182, 1182, 1182, 1182, 1182,  557,  556,  555,  554,
			  553, 1183, 1183,  552,  551,  550, 1181, 1183, 1183, 1183,

			 1183, 1183, 1183, 1184, 1184,  548,  547,  546, 1182, 1184,
			 1184, 1184, 1184, 1184, 1184,  545,  544,  539,  533,  528,
			 1199, 1199,  520,  515,  505, 1183, 1199, 1199, 1199, 1199,
			 1199, 1199, 1200, 1200,  500,  497,  493, 1184, 1200, 1200,
			 1200, 1200, 1200, 1200,  492,  487,  485,  482,  477, 1201,
			 1201,  468,  463,  460, 1199, 1201, 1201, 1201, 1201, 1201,
			 1201, 1202, 1202,  459,  454,  449, 1200, 1202, 1202, 1202,
			 1202, 1202, 1202,  444,  433,  432,  431,  426, 1214, 1214,
			  422,  421,  420, 1201, 1214, 1214, 1214, 1214, 1214, 1214,
			 1215, 1215,  417,  412,  401, 1202, 1215, 1215, 1215, 1215, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1215, 1215,  396,  386,  381,  377, 1290, 1290,  372, 1290,
			  368, 1290, 1214, 1290, 1290, 1290, 1290,  358,  353,  344,
			 1290,  339,  336,  331, 1215, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257,
			 1257, 1257, 1257, 1257, 1257, 1258, 1258, 1258, 1258, 1258,
			 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258,
			 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259,
			 1259, 1259, 1259, 1259, 1259, 1260, 1260, 1260, 1260, 1260,
			 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260,

			 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261,
			 1261, 1261, 1261, 1261, 1261, 1262, 1262, 1262, 1262, 1262,
			 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262,
			 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263,
			 1263, 1263, 1263, 1263, 1263, 1264, 1264, 1264, 1264, 1264,
			 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264,
			 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265,
			 1265, 1265, 1265, 1265, 1265, 1266, 1266, 1266, 1266, 1266,
			 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266,
			 1267, 1267, 1267, 1267, 1267, 1267, 1267, 1267, 1267, 1267, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1267, 1267, 1267, 1267, 1267, 1268, 1268, 1268, 1268, 1268,
			 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268,
			 1272, 1272, 1272, 1272, 1272, 1272, 1272, 1272, 1272, 1272,
			 1272, 1272, 1272,  318, 1272, 1273, 1273,  313,  309,  294,
			 1273,  293, 1273, 1273, 1273, 1273, 1273, 1273,  292, 1273,
			 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274,
			 1274, 1274,  291, 1274, 1275, 1275, 1275,  290, 1275, 1275,
			 1275, 1275, 1275, 1275, 1275, 1275,  289, 1275, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1279, 1279, 1279, 1279, 1279, 1279, 1279,

			 1279, 1279, 1279, 1279, 1279,  288, 1279, 1281, 1281, 1281,
			 1281, 1281, 1281, 1281, 1281, 1281, 1281, 1281, 1281,  286,
			 1281, 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282,
			 1282, 1282, 1282,  285, 1282, 1283, 1283, 1283, 1283, 1283,
			 1283, 1283, 1283, 1283, 1283, 1283,  284, 1283, 1284, 1284,
			 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284,
			  283, 1284, 1285, 1285, 1285, 1285, 1285, 1285, 1285, 1285,
			 1285, 1285, 1285, 1285, 1285,  281, 1285, 1286, 1286, 1286,
			 1286, 1286, 1286, 1286, 1286, 1286,  280, 1286, 1286, 1286,
			  268, 1286, 1287, 1287, 1287, 1287, 1287, 1287, 1287, 1287, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1287, 1287, 1287, 1287,  263, 1287, 1288, 1288, 1288, 1288,
			 1288, 1288, 1288, 1288, 1288, 1288, 1288, 1288,  260, 1288,
			 1291, 1291, 1291, 1291, 1291, 1291, 1291, 1291, 1291, 1291,
			 1291, 1291,  259, 1291, 1292, 1292, 1292,  254, 1292, 1292,
			 1292, 1292, 1292, 1292, 1292, 1292,  249, 1292, 1293, 1293,
			 1293, 1293, 1293, 1293, 1293, 1293, 1293, 1293, 1293, 1293,
			  244, 1293, 1294, 1294, 1294, 1294, 1294, 1294, 1294, 1294,
			 1294, 1294, 1294, 1294,  235, 1294, 1295, 1295, 1295, 1295,
			 1295, 1295, 1295, 1295, 1295, 1295, 1295, 1295,  230, 1295,
			 1296, 1296, 1296, 1296, 1296, 1296, 1296, 1296, 1296, 1296,

			 1296, 1296,  213, 1296, 1297, 1297, 1297, 1297, 1297, 1297,
			 1297, 1297, 1297, 1297, 1297, 1297,  208, 1297, 1298, 1298,
			 1298, 1298, 1298, 1298, 1298, 1298, 1298, 1298, 1298, 1298,
			  204, 1298, 1299, 1299, 1299, 1299, 1299, 1299, 1299, 1299,
			 1299, 1299, 1299, 1299,  199, 1299, 1300, 1300, 1300, 1300,
			 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300,  194, 1300,
			 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301,
			 1301, 1301,  189, 1301, 1302, 1302, 1302, 1302, 1302, 1302,
			 1302, 1302, 1302, 1302, 1302, 1302, 1302,  178, 1302, 1303,
			 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, 1303, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1303,  173, 1303,  166,  161,  155,  150,  144,  139,  131,
			  125,  120,  108,  103,  100,   95,   94,   93,   92,   90,
			   89,   88,   87,   86,   85,   84,   83,   82,   80,   76,
			   75,   70,   68,   62,   57,   52,   48,   47,   41,   37,
			   12,   11, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,

			 1255, 1255, 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 106, 4400)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1303)
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
			    0,    0,   13,   56,   59,  109,  170,  231,  292,  354,
			    0, 4439, 4438,  417,    0,    0,    0,   77,   82,  479,
			  540,  602,    0,  664,  725,  787,  849,  910,  971, 1032,
			 1093,    2,    3, 1155,    0, 1217, 1278, 4439, 4442,    7,
			 4442, 4425,   80,    0, 4442,    8, 4442, 4424, 4418, 4442,
			    0, 4442, 4429,   78,   85, 4442,   14, 4380,   47,   11,
			   17,   60, 4381,   92,  117,  126, 4442,  149, 4419,   67,
			 4377,   72,   23,   28,  104, 4378, 4378, 4442,   17, 4442,
			 4415,    0, 4406, 4405, 4400, 4401, 4383, 4393, 4396, 4385,
			 4379,   53, 4393, 4383, 4395, 4413, 4442, 4442,   20, 4442,

			 4401,    0,  137, 4359,  140,   43,   63,  143, 4360, 4442,
			   21, 4442, 4442,   12, 4442, 4442, 4442, 4442, 1326,  146,
			 4357,  149,  107,  127,  160, 4358, 4442,   28, 4442, 4442,
			 4442, 4396, 4442,    0,  159, 4442, 4442,  189,  187, 4354,
			  200,  190,  202,  205, 4355,  204,   29, 4442,  254,  216,
			 4352,  219,  222,  223,  226, 4353, 4442, 4442, 1374,  497,
			  248, 4350,  254,  229,  250,  265, 4351, 4442, 4442,  264,
			 1422, 4442,  275, 4347,  278,  281,  282,  285, 4335, 4442,
			 4442,  489, 4442,  101, 4442, 4442,  339,   51, 4442, 4354,
			  439, 1470,  223,  433, 4304,  436,  439,  449,  452, 4292, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  455,  504,  514,  521, 4317, 4442, 4442,  455, 4262,  469,
			  473,  475,  515, 4250,  294,  611, 4442,  679,  693,  681,
			  682,  673,    0,  583,  621, 4442,  685,  689,  647,  535,
			 4234,  641,  538,  643,  658, 4222,  685,  691,  694,  697,
			  700,  703,  702,  713, 4206,  716,  682,  687,  719, 4194,
			  797, 4442,  807,  739, 4183,  742,  745,  751,  754, 4180,
			 4211,  815,  758, 4150,  761,  764,  765,  771, 4138,  774,
			  774,  826,  829,  832,  835,  838, 4442,  688, 1532,    0,
			 4163, 4137,  105, 4122, 4114, 4099, 4080, 1574, 4066, 4038,
			 4042, 4032, 4019, 4004, 4037, 4442,  892,  857,    0, 4442,

			  844,  868,  871,  874,  877,  880,  934,  822, 4442, 4023,
			  925,  960,  890, 3983,  900,  808,  846,  906, 3981, 4442,
			  925,  935,  938,  941,  944,  947,  935,  946,    0,  979,
			  958, 3769,  961,  967,  968,  990, 3770,  990, 1001, 3767,
			 1004, 1007, 1008, 1011, 3767, 1014, 1017, 1020, 1027, 1044,
			 1047, 1051, 1050, 3764, 1062, 1023, 1029, 1065, 3765, 1119,
			 1236, 1071, 1074, 1077, 1080, 1083, 1088, 4442, 3795, 1210,
			 1232, 1175, 3754, 1188, 1091, 1169, 1191, 3753, 4442, 4442,
			 1197, 3750, 1208, 1185, 1210, 1234, 3751, 4442, 1247, 1250,
			 1253, 1256, 1259, 1262, 4442, 1265, 3748, 1268, 1231, 1236, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1271, 3742, 4442, 1290, 1293, 1296, 1299, 1302, 1305, 1363,
			 4442, 1308, 3739, 1311, 1318, 1319, 1322, 3740, 1264, 4442,
			 3765, 3764, 3755, 1334, 1602, 1345, 3723, 1348, 1325, 1350,
			 1353, 3724, 3724, 3723, 1397, 4442, 1374, 1386, 1389, 1397,
			 1400, 1403, 1410, 1406, 3719, 1421, 1363, 1393, 1434, 3713,
			 1609, 4442, 1462, 1437, 3710, 1440, 1443, 1444, 1447, 3711,
			 3746, 1594, 1450, 3698, 1453, 1456, 1458, 1462, 3699, 1562,
			 1532, 1550, 1573, 1576, 1579, 1582, 1585, 3694, 1594, 1588,
			 1590, 1620, 3695, 1643, 4442, 3733, 1623, 3691, 1626, 1631,
			 1632, 1635, 3692, 3723, 1641, 1644, 1647, 3734, 1675, 1650,

			 3680, 1653, 1656, 1657, 1660, 3672, 1663, 1666, 1669, 1672,
			 1675, 1678, 4442, 1718, 1683, 3669, 1686, 1689, 1690, 1693,
			 3670, 1696, 1699, 1702, 1705, 1708, 1711, 1714, 3665, 1717,
			 1720, 1721, 1724, 3666, 1727, 1730, 1733, 1732, 1743, 3663,
			 1746, 1749, 1750, 1753, 3664, 3684, 3682, 3666, 3684,    0,
			 3663, 3669, 3672, 3669, 3668, 3663, 3664, 3646, 3649, 3652,
			 1291, 3651, 3645, 3639, 1779, 3651, 3636, 3637, 3625, 1757,
			 3604, 1760, 1763, 1766, 1769, 3605, 1772, 1775, 1778, 3634,
			 1818, 1830, 1842, 1854, 1783, 1795, 1807, 1819, 1829, 1832,
			 1835, 1838, 1841, 1844, 3594, 1847, 1850, 1851, 1854, 3595, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1857, 1860, 1863, 1866, 1869, 1872, 1875, 1878, 1881, 1884,
			 1887, 1890, 1893, 1896, 1899, 1902, 1905, 1908, 1911, 1914,
			 1917, 1916, 1927, 3583, 1930, 1933, 1934, 1937, 3584, 1940,
			 1943, 1946, 3620, 1986, 1998, 2010, 2022, 1951, 1963, 1975,
			 1987, 1997, 2000, 2003, 2006, 2009, 2012, 2015, 2018, 2021,
			 2024, 2027, 2030, 2033, 2036, 2039, 2042, 2045, 2048, 2051,
			 2054, 2057, 2060, 2063, 2066, 2069, 2072, 4442, 4442, 3597,
			 2112, 4442, 2076, 3577, 2079, 2082, 2083, 2086, 3578, 2160,
			 2208, 2135, 2089, 3575, 2092, 2095, 2100, 2110, 3569, 2113,
			 2124, 2127, 2133, 2136, 2139, 4442, 4442, 4442, 2142, 2145,

			 2148, 3619, 2167, 2155, 3565, 2158, 2151, 2160, 2173, 3566,
			 2183, 2186, 2189, 2192, 2195, 2198, 4442, 2240, 2206, 3554,
			 2209, 2219, 2220, 2223, 3555, 2226, 2229, 2232, 2235, 2238,
			 2241, 2244, 3552, 2247, 2250, 2251, 2254, 3544, 2257, 2260,
			 2263, 2266, 2269, 2272, 2275, 2278, 2281, 2330, 2335, 2286,
			 2289, 2292, 2295, 2298, 2301, 2304, 3589, 2342, 2315, 2318,
			 2321, 2324, 2328, 2331, 2334, 2346, 2349, 2390, 2355, 2358,
			 2361, 2364, 2367, 2370, 2373, 2376, 2379, 2382, 2385, 2388,
			 2391, 2394, 2397, 2400, 2403, 2406, 2409, 2412, 2415, 3550,
			 3576, 3561, 3547,    0,    0, 3565, 3554, 3538, 1583, 3537, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3533, 3530, 3524, 3515, 3527, 3521, 3511, 3518, 3507, 3532,
			 2449, 3521, 3501,    0, 2419, 2423, 2426, 2429, 2432, 2435,
			 4442, 2475, 2487, 4442, 2499, 2440, 2452, 2464, 2474, 2477,
			 2480, 2483, 2487, 2490, 2493, 2499, 2502, 2505, 2508, 2511,
			 2514, 2517, 2520, 2523, 3481, 2526, 2337, 2495, 2529, 3482,
			 2532, 2535, 2538, 2541, 2544, 2547, 4442, 2587, 2599, 4442,
			 2611, 2552, 2564, 2576, 2586, 2589, 2592, 2595, 2599, 2602,
			 2605, 2611, 2614, 3498, 2654, 2666, 2683, 2619, 3469, 2631,
			 2608, 2640, 2643, 3470, 2648, 2658, 2664, 2667, 2670, 2673,
			 2713, 2725, 2742, 2754, 2771, 2690, 2700, 2707, 2719, 2729,

			 2736, 2746, 2752, 2755, 3513, 2796, 2761, 2764, 2769, 2772,
			 2775, 2778, 2781, 2784, 2787, 2828, 2793, 2796, 2799, 2802,
			 2805, 2808, 2811, 2814, 2817, 2820, 2823, 2826, 2829, 2832,
			 2835, 2838, 2841, 2844, 2893, 2848, 3463, 2851, 2661, 2677,
			 2854, 3455, 2857, 2860, 2863, 2866, 3452, 2869, 2703, 2731,
			 2872, 3453, 2877, 2880, 2883, 2886, 2891, 2894, 2897, 2900,
			 2903, 2906, 2909, 2912, 3459, 1380,    0, 3462, 3468, 3459,
			 3463, 3438, 3456,    0, 3444, 3448, 3451, 2938, 3451, 3438,
			 3428, 3427, 3428, 2947, 3424, 3411, 3406, 3418, 2917, 2921,
			 2926, 2966, 2978, 4442, 2990, 2931, 2943, 2955, 2965, 2968, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2971, 2974, 2978, 2981, 2984, 2990, 2993, 3033, 3045, 4442,
			 3057, 3421, 3069, 3088, 3100, 3117, 3129, 2998, 3010, 3022,
			 3034, 3045, 3048, 3053, 3075, 3082, 3146, 3158, 3175, 3094,
			 3104, 3111, 3123, 3133, 3140, 3150, 3156, 3159, 3162, 3165,
			 3168, 3199, 3173, 3176, 3182, 3185, 3188, 3191, 3197, 3200,
			 3203, 3206, 3209, 3212,    0, 3399, 3407, 3392, 3405, 3386,
			 3403, 3388, 3374,    0,    0, 3391, 3364, 3389, 3246, 3347,
			    0, 3344, 3324, 3335, 3321, 3289, 3272,    0, 3260, 3253,
			 3265, 3230, 3240, 3243, 3284, 3296, 3253, 3308, 3327, 3339,
			 3249, 3261, 3273, 3356, 3368, 3385, 1362, 3284, 3287, 3292,

			 3314, 3321, 3333, 3234, 3236,    0, 3209, 3210, 1496,    0,
			 3200, 3206, 3194, 3374, 3183, 3154, 3149, 3141, 3125, 3092,
			 3104, 3091, 3106,    0, 3397, 3414, 3428, 3445, 4442, 3459,
			 3476, 3488, 3505, 3517, 3092, 3051,    0,    0, 3043, 3040,
			 3014, 3017, 3004, 2987, 2963, 2947, 2950,    0, 4442,    0,
			 2912, 2914, 2784, 2781, 3534, 3546, 3558, 3577, 3589, 3601,
			 3618, 3630, 2767, 2716, 2695, 2652,    0, 2636, 2597, 2580,
			 2581, 2490, 2494, 2460, 2207, 2181, 2126, 1991, 1979, 1967,
			 1955, 3647, 3659, 3676, 3688, 1836, 1823, 1825, 1800,    0,
			    0, 1788,    4, 1646, 1636, 1580, 1589,    0, 1548, 3705, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_base_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3717, 3734, 3746, 1488, 1448, 1429, 1432, 1409, 1408, 1347,
			 1229,    0, 1207, 1191, 3763, 3775, 1082, 1064,  979,  941,
			  927,  933,    0,  906,  910,  859,  841,  795,  773,  770,
			    0,  737,  703,  680,  664,  643,    0,  513,  489,  490,
			  459,  448,    0,  318,  280,    8,  169,   88,    0,    0,
			   68,   53,    0,    0,    0, 4442, 3824, 3839, 3854, 3869,
			 3884, 3899, 3914, 3929, 3944, 3959, 3974, 3989, 4004, 3582,
			 3416,    3, 4019, 4034, 4048, 4062, 3389, 4077, 3447, 4091,
			 3478, 4105, 4119, 4132, 4146, 4161, 4176, 4190, 4204, 3509,
			 3805, 4218, 4232, 4246, 4260, 4274, 4288, 4302, 4316, 4330,

			 4344, 4358, 4373, 4387, yy_Dummy>>,
			1, 104, 1200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1303)
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
			    0, 1256, 1256, 1257, 1257, 1258, 1258, 1259, 1259, 1255,
			    9, 1260, 1260, 1255,   13,   13,   13, 1261, 1261, 1262,
			 1262, 1255,   21, 1263, 1263, 1264, 1264, 1265, 1265, 1266,
			 1266, 1267, 1267, 1255,   33, 1268, 1268, 1255, 1255, 1255,
			 1255, 1255, 1269, 1270, 1255, 1255, 1255, 1255, 1255, 1255,
			 1271, 1255, 1255, 1272, 1272, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1273, 1273, 1274, 1255, 1275, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1277, 1255, 1255, 1255, 1255,

			 1255, 1278, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1279, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1280, 1281, 1255, 1255, 1282, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1283, 1255, 1255, 1283, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1284, 1285,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1286,
			 1279, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1287, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1288, 1279, 1289, 1255, 1255, 1255, 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1290, 1290, 1291, 1292, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1293, 1255, 1269, 1269, 1269,
			 1269, 1255, 1270, 1255, 1294, 1255, 1271, 1255, 1272, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1273, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1274, 1255, 1274, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1275, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1295,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1277, 1255, 1255, 1296, 1278, 1255,

			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1297, 1280, 1281,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1282, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1283, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1298, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1287,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1288, 1288, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1289, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1290, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1291, 1255, 1291, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1292, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1299,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1269, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,

			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1300, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1301, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1288, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1288,
			 1288,  680, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,

			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1269, 1302, 1255,
			 1255, 1255, 1255, 1255, 1255, 1303, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255,  680,  680,  680, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			  680,  680,  680,  680,  680, 1255, 1255, 1255, 1255, 1255,

			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1269, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 200, 800)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255,  680,  680,  680,  680,  680, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255,  680,  680,  680, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1269, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255,  680,  680,  680,
			 1255, 1255, 1255,  680,  680,  680, 1269, 1255, 1255, 1255,

			 1255, 1255, 1255, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1255, 1255, 1255, 1255, 1255,  680,
			  680,  680,  680,  680, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1255, 1276,
			 1276, 1276, 1276, 1276, 1255, 1255, 1255, 1255,  680,  680,
			  680,  680, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1255, 1255, 1255,
			 1255,  680,  680,  680,  680, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,  680, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_def_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  680,  680,  680, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276,  680,  680, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276,    0, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,

			 1255, 1255, 1255, 1255, yy_Dummy>>,
			1, 104, 1200)
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
			    0,   63,   63,   63,   63,   63,   63,   63,   63,    1,
			    2,   63,   63,    3,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,    1,   63,    4,   63,    5,    6,   63,    7,
			    8,    9,   10,   11,   12,   13,    9,   14,   15,   15,
			   15,   15,   15,   15,   15,   15,   16,   16,   17,   63,
			   18,   19,   20,    9,   63,   21,   22,   23,   24,   25,
			   26,   27,   28,   29,   30,   31,   32,   33,   34,   35,
			   36,   28,   37,   38,   39,   40,   41,   42,   43,   28,
			   28,   44,   45,   46,   47,   48,   63,   21,   22,   23,

			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   35,   36,   28,   37,   38,   39,   40,   41,   42,
			   43,   28,   28,   49,   50,   51,   63,   63,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   55,   55,   56,   56,   56,   56,   56,   56, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   57,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58,   59,   58,   58,
			   60,   61,   61,   61,   62,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   63, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,   15,    1,    2,    3,   15,    4,    5,   15,   15,
			   15,    6,   15,    7,   15,    8,    8,   15,   15,   15,
			   15,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,   15,   15,   10,   15,   11,   12,
			   15,   13,   14,   14,   14,   14,   15,   15,   15,   15,
			   15,   15,   15,   15, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1255)
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
			   55,   55,   55,   51,    0,    0,    0,    0,    0,    0,
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
			   55,   55,   55,   55,   55,   55,   55,   55,    0,    0,
			    0,  105,    0,  105,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 800)
		end

	yy_accept_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,  109,    0,  109,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    9,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   22,   55,   55,   55,   55,   55,
			   55,   55,   55,   33,   39,   55,   55,   55,   55,   55,
			   52,   55,   55,   55,   55,   55,   55,   36,   55,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    6,    0,    0,    0,

			    0,    0,    0,   55,   55,   28,   55,   55,   55,   27,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   50,    0,    0,    0,    0,   81,    0,
			    0,    0,    0,    0,   55,   55,   34,   23,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   37,   53,   40,
			   55,   55,   55,   55,    0,    0,    0,    0,    0,    0,
			    0,    0,   55,   55,   55,   55,   29,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,    0,    0,    0,
			    0,    0,    0,    0,    0,   55,   55,   55,   55,   35,
			   41,   55,   55,   55,   55,   55,   55,   42,   55,    0, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_accept_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   55,   55,   55,   55,   55,   55,   55,
			   55,   44,   55,   55,    0,    0,   55,   55,   55,   55,
			   55,   55,   43,   55,   55,   55,   55,   55,   55,   55,
			   45,   55,   55,   55,   55,   55,   24,   55,   55,   55,
			   55,   55,   46,   55,   55,   55,   55,   55,   48,   25,
			   55,   55,   47,   55,   49,    0, yy_Dummy>>,
			1, 56, 1200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4442
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1255
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1256
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 63
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

	last_lx_symbol_class_value: LX_SYMBOL_CLASS
			-- Last semantic value of type LX_SYMBOL_CLASS

end
