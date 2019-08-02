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

					description.set_unicode2_mode (True)
				
when 52 then
--|#line 160 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 160")
end

					description.set_no_warning (False)
				
when 53 then
--|#line 163 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 163")
end

					description.set_no_warning (True)
				
when 54 then
--|#line 167 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 167")
end
set_start_condition (OUTFILE)
when 55 then
--|#line 177 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 177")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 56 then
--|#line 181 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 181")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 57 then
--|#line 188 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 188")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 58 then
--|#line 192 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 192")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 59 then
--|#line 200 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 200")
end
-- Separates name and definition.
when 60 then
--|#line 201 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 201")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 61 then
--|#line 208 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 208")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 62 then
--|#line 216 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 216")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 63 then
--|#line 220 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 220")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 64 then
--|#line 233 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 233")
end
-- Separator or comment.
when 65 then
--|#line 234 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 234")
end
line_nb := line_nb + 1
when 66 then
--|#line 235 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 235")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 67 then
--|#line 239 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 239")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 68 then
--|#line 248 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 248")
end
last_token := Left_brace_code
when 69 then
--|#line 249 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 249")
end
last_token := Right_brace_code
when 70 then
--|#line 250 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 250")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 71 then
--|#line 254 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 254")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 72 then
--|#line 266 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 266")
end

					last_token := UNICODE_MODE_START
				
when 73 then
--|#line 269 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 269")
end

					last_token := BYTE_MODE_START
				
when 74 then
--|#line 272 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 272")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 75 then
	yy_end := yy_start + yy_more_len + 1
--|#line 276 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 276")
end
last_token := Dollar_code
when 76 then
--|#line 277 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 277")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 77 then
--|#line 286 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 286")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 78 then
--|#line 290 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 290")
end

					last_token := CCL_PLUS
				
when 79 then
--|#line 293 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 293")
end

					last_token := CCL_MINUS
				
when 80 then
--|#line 296 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 296")
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
				
when 81 then
--|#line 307 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 307")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 82 then
--|#line 312 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 312")
end
last_token := EOF_OP
when 83 then
--|#line 313 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 313")
end
last_token := text_item (1).code
when 84 then
--|#line 314 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 314")
end

					set_start_condition (ACTION_TEXT)
				
when 85 then
--|#line 317 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 317")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 86 then
--|#line 322 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 322")
end

					last_token := CHAR
					process_utf8_character
				
when 87 then
--|#line 329 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 329")
end
-- Separator or comment.
when 88 then
--|#line 330 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 330")
end
line_nb := line_nb + 1
when 89 then
--|#line 331 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 331")
end
last_token := Comma_code
when 90 then
--|#line 332 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 332")
end
last_token := Star_code
when 91 then
--|#line 333 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 333")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 92 then
--|#line 337 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 337")
end

					last_token := NAME
					last_string_value := text
				
when 93 then
--|#line 341 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 341")
end

					report_bad_start_condition_error (text)
				
when 94 then
--|#line 347 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 347")
end
-- Separator.
when 95 then
--|#line 348 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 348")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 96 then
--|#line 356 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 356")
end
last_token := Comma_code
when 97 then
--|#line 357 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 357")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 98 then
--|#line 361 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 361")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 99 then
--|#line 366 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 366")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 100 then
--|#line 375 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 375")
end

					last_token := CHAR
					process_utf8_character
				
when 101 then
--|#line 379 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 379")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 102 then
--|#line 383 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 383")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 103 then
--|#line 392 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 392")
end

					last_token := CHAR
					process_escaped_character
				
when 104 then
--|#line 396 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 396")
end

					last_token := CHAR
					process_octal_character
				
when 105 then
--|#line 400 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 400")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 106 then
--|#line 404 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 404")
end

					last_token := CHAR
					process_unicode_character
				
when 107 then
--|#line 411 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 411")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 108 then
--|#line 416 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 416")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 109 then
--|#line 421 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 421")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 110 then
--|#line 426 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 426")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 111 then
	yy_end := yy_start + yy_more_len + 1
--|#line 431 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 431")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 112 then
	yy_end := yy_start + yy_more_len + 1
--|#line 435 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 435")
end
last_token := Caret_code
when 113 then
--|#line 436 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 436")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 114 then
--|#line 441 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 441")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 115 then
	yy_end := yy_start + yy_more_len + 1
--|#line 450 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 450")
end
last_token := Minus_code
when 116 then
--|#line 451 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 451")
end

					last_token := CHAR
					process_utf8_character
				
when 117 then
--|#line 455 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 455")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 118 then
--|#line 459 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 459")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 119 then
--|#line 468 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 468")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 120 then
--|#line 472 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 472")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 121 then
--|#line 477 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 477")
end
set_start_condition (EIFFEL_BLOCK2)
when 122 then
--|#line 478 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 478")
end

					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				
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
more
when 128 then
--|#line 491 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 491")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 129 then
--|#line 495 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 495")
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
				
when 130 then
--|#line 514 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 514")
end

					last_token := EIF_CODE
					last_string_value := text
				
when 131 then
--|#line 520 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 520")
end

					report_bad_character_error (text)
				
when 132 then
--|#line 523 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 523")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 133 then
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
			create an_array.make_filled (0, 0, 4617)
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
			an_array.area.fill_with (1256, 4600, 4617)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   39,   40,   39,  180,  180,  181,  181,  214,  223,
			  214,  223,  450,   41,   39,   40,   39, 1209,  277,   42,
			  277,  296,  306,  296,  306, 1232,   41,  307,  307,  307,
			  326,  359,  326,  359, 1237,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   45,   46,
			   45,   45,   46,   45,  238,  238,   52,  110,  111,  110,
			   47,  239,  239,   47,  272,  272,   48, 1255,  112,   48,
			 1256,  113,  113,  113,  110,  111,  110,  216,  229,  230,
			  231,  232,  233,  234,  235,  112,  273,  273,  113,  113,

			  113,  228,  228,  228,  251,   49,  252,   50,   49,   51,
			   50, 1254,   51,   54,  237,  237,  237,  218,  114, 1253,
			  219,  240,  240,  240, 1256,  220,  261,  242,  242,  242,
			 1252,  221,  271,  271,  271,  114,  229,  230,  231,  232,
			  233,  234,  235,  243,  244,  245,  246,  247,  248,  249,
			  243,  244,  245,  246,  247,  248,  249,  253,  254,  255,
			  256,  257,  258,  259,   55,   55,   55,   55,   56,   57,
			   58,   59,   60,   61,   62,   54, 1250,  262,  263,  264,
			  265,  266,  267,  268,  274,  274,  274,  289, 1251,  290,
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
			   68, 1250,  352,  353,  354,  355,  356,  357,  358,  379,
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

			  438,  410,  437,  437,  437,  439,  439, 1249,  421,  425,
			  426,  427,  428,  429,  430,  431,  440,  440,  440,  443,
			  444,  445,  446,  447,  448,  449,  443,  444,  445,  446,
			  447,  448,  449,  118,  451, 1248,  452,  442,  442,  442,
			   55,   55,   55,   55,  119,  120,  121,  122,  123,  124,
			  125,  116, 1256,  117,  411,  412,  413,  414,  415,  416,
			  417,  471,  471,  471,  472,  472,  473,  473,  474,  474,
			  474,  214, 1055,  214,  476,  477,  478,  479,  480,  481,
			  482, 1056,  223,  483,  223,  238,  238,  453,  454,  455,
			  456,  457,  458,  459, 1247,  118, 1256,  228,  228,  228, yy_Dummy>>,
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
			  126,  126,  126,  126,  126,  126,  126,  135, 1256, 1256,
			  221,  484,  221,  226,  226,  226,  272,  272,  227,  461,
			  227, 1246,  485,  486,  487,  488,  489,  490,  491,  492,

			  493,  229,  230,  231,  232,  233,  234,  235,  237,  237,
			  237,  240,  240,  240,  228,  228,  228,  226,  273,  273,
			  225, 1245, 1256, 1256, 1244,  136,  137, 1243,   55,   55,
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
			  510, 1242,  497,  148,  260,  260,  260,  522,  522,  522,
			  523,  523,  524,  524,  498,  525,  525,  525,  242,  242,
			  242,  253,  254,  255,  256,  257,  258,  259,  260,  242,
			  242,  242,  242,  242,  242,  513,  527,  528,  529,  530,
			  531,  532,  533,   55,   55,   55,   55,  149,  150,  151,
			  152,  153,  154,  155,  146,  147,  146,  499,  500,  501,
			  502,  503,  504,  505,  579,  579,  148,  534,  534,  534,
			  535,  535,  535,  536,  536,  536,  586,  586,  514,  515,
			  516,  517,  518,  519,  520,  277,  547,  277, 1241,  296,

			  548,  296,  569,  570,  571,  572,  573,  574,  575,  299,
			  299,  299,  299,  299,  299, 1240,   55,   55,   55,   55,
			  149,  150,  151,  152,  153,  154,  155,  157,  299,  299,
			  299,  576,  576,  576,  577,  577,  577,  578,  578,  578,
			  306, 1239,  306,  307,  307,  307,  308,  308,  308,  585,
			  585,  585,  587,  587,  588,  588,  588,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  590,  590,  590, 1238,
			  326,  158,  326,  159,  591,  591,  591, 1237,   55,   55,
			   55,   55,  160,  161,  162,  163,  164,  165,  166,  157,
			  592,  592,  592,  593,  594,  595,  596,  597,  598,  599, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  330,  331,  332,  333,  334,  335,  336,  329,  329,  329,
			  601,  601,  601,  602,  602,  603,  603,  604,  604,  604,
			  338,  339,  340,  341,  342,  343,  344,  337,  337,  337,
			  607,  607,  607,  158, 1236,  159,  608,  608,  609,  609,
			   55,   55,   55,   55,  160,  161,  162,  163,  164,  165,
			  166,  168,  610,  610,  610,  329,  329,  329,  329,  329,
			  329,  621,  169,  329,  329,  329,  612,  612,  612,  613,
			  613,  613,  614,  614,  614,  352,  353,  354,  355,  356,
			  357,  358,  351,  351,  351,  616,  616,  616,  617,  617,
			  618,  618,  619,  619,  619,  170,  171,  359, 1235,  359,

			  632,  632,   55,   55,   55,   55,  172,  173,  174,  175,
			  176,  177,  178,  168, 1234,  622,  623,  624,  625,  626,
			  627,  628,  639,  639,  169,  351,  351,  351,  351,  351,
			  351,  351,  351,  351,  629,  629,  629,  630,  630,  630,
			  631,  631,  631,  367,  367,  367,  638,  638,  638,  640,
			  640,  641,  641,  641,  378,  378,  378,  170,  171,  644,
			  644,  644,  645,  645,   55,   55,   55,   55,  172,  173,
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
			 1233,  202,  646,  646,  203,  647,  647,  647,  654,  654,
			  204,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  649,  649,  649,  650,  650,  650,  651,  651,  651,  394,
			  394,  394,  653,  653,  653,  655,  655,  656,  656,  656,
			  402,  402,  402,  402,  402,  402,  410,  205, 1256,  206,
			   55,   55,   55,   55,  207,  208,  209,  210,  211,  212,

			  213,  201, 1231,  202,  663,  663,  203,  402,  402,  402,
			  664,  664,  204,  658,  658,  658,  659,  659,  659,  660,
			  660,  660,  409,  409,  409,  662,  662,  662,  665,  665,
			  665,  418, 1256,  418,  423,  423,  423,  691,  691,  411,
			  412,  413,  414,  415,  416,  417,  690,  690,  690,  205,
			 1230,  206,   55,   55,   55,   55,  207,  208,  209,  210,
			  211,  212,  213,  309,  309,  670,  671,  692,  692,  693,
			  693,  693,  435,  435,  435, 1229,  672,  673,  674,  675,
			  676,  677,  678,  435,  435,  435,  435,  435,  435,  310,
			  971, 1256,  311, 1256,  972,  434,  434,  434,  698,  698, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  698,  699,  699,  699, 1228,  312,  313,  314,  315,  316,
			  317,  318,  368,  368,  700,  700,  700,  443,  444,  445,
			  446,  447,  448,  449,  442,  442,  442,  472,  472,  434,
			  473,  473,  697,  471,  471,  471,  701, 1227,  369,  712,
			  712,  370,  474,  474,  474,  450,  450,  450,  702,  711,
			  711,  711,  713,  713,  371,  372,  373,  374,  375,  376,
			  377,  309,  309,  451, 1226,  452,  714,  714,  714,  460,
			  460,  460, 1225,  460,  726,  726,  726,  727,  727, 1224,
			  717,  728,  728,  729,  729,  729, 1223,  310,  743,  743,
			  311,  703,  704,  705,  706,  707,  708,  709,  442,  442,

			  442,  744,  744,  312,  313,  314,  315,  316,  317,  318,
			  309,  309,  442,  442,  442, 1222,  453,  454,  455,  456,
			  457,  458,  459,  718,  719,  720,  721,  722,  723,  724,
			  442,  442,  442,  738,  738,  738,  310,  751,  751,  311,
			  731,  732,  733,  734,  735,  736,  737,  739,  739,  739,
			  752,  752,  312,  313,  314,  315,  316,  317,  318,  537,
			 1221,  537,  537,  537,  537,  537,  537,  537,  537,  537,
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
			  537,  740,  740,  740, 1220,  538,  539,  540,  541,  542,
			  543,  544,  537,  553,  554,  555,  556,  557,  215,  215,
			  215, 1256, 1066,  558,  559,  760,  760,  560,  561,  742,
			  742,  742, 1067,  562,  679,  679,  745,  745,  745,  224,
			  224,  224,  750,  750,  750,  753,  753,  753,  228,  228,
			  228,  228,  228,  228, 1219,  747,  228,  228,  228, 1218,
			  680,  761,  761,  681, 1217, 1256,  757,  757,  757,  250,
			  250,  250,  759,  759,  759, 1214,  682,  683,  684,  685,
			  686,  687,  688,  762,  762,  762,  250,  250,  250,  250,

			  250,  250,  250,  250,  250,  764,  764,  764,  765,  765,
			  765,  766,  766,  766,  767,  767,  767,  260,  260,  260,
			  769,  769,  769,  770,  770,  771,  771,  772,  772,  772,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  774,
			  774,  774,  775,  775,  775,  776,  776,  776,  269,  269,
			  269,  778,  778,  778,  779,  779,  780,  780,  781,  781,
			  781,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  538,  539,  540,  541,  542,  543,  544,  537,  537,  537,
			  784,  784,  784,  785,  785,  786,  786,  787,  787,  787,
			  803, 1213,  804,  297,  297,  297,  815,  815,  815,  816, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  816,  817,  817,  818,  818,  818,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  820,  820,  821,  821,  821,
			  308,  308,  308, 1212,  821,  821,  821,  821,  821,  821,
			  822,  822,  822,  308,  308,  308, 1211,  822,  822,  822,
			  822,  822,  822,  823,  823,  823,  308,  308,  308, 1210,
			  823,  823,  823,  823,  823,  823,  824,  824,  824,  825,
			  825,  825, 1208,  824,  824,  824,  824,  824,  824,  826,
			  826,  826,  827,  827,  827,  319,  319,  319,  319,  319,
			  319,  319,  319,  319,  327,  327,  327,  829,  829,  829,
			  830,  830,  831,  831,  832,  832,  832,  329,  329,  329,

			  329,  329,  329,  329,  329,  329,  834,  834,  834,  835,
			  835,  835,  836,  836,  836,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  837,  837,  837,  838,  838,  838,
			  839,  839,  839,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  351,  351,  351,  351,  351,  351,  351,  351,
			  351,  840,  840,  840,  841,  841,  841,  842,  842,  842,
			  843,  844,  845,  846,  847,  848,  849,  360,  360,  360,
			  851,  851,  851,  852,  852,  853,  853,  854,  854,  854,
			  351,  351,  351,  351,  351,  351,  351,  351,  351,  856,
			  856,  857,  857,  857,  367,  367,  367, 1207,  857,  857, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  857,  857,  857,  857,  858,  858,  858,  367,  367,  367,
			 1206,  858,  858,  858,  858,  858,  858,  859,  859,  859,
			  367,  367,  367, 1205,  859,  859,  859,  859,  859,  859,
			  860,  860,  860,  861,  861,  861, 1204,  860,  860,  860,
			  860,  860,  860,  862,  862,  862,  863,  863,  863,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  864,  864,
			  864,  865,  865,  865,  866,  866,  866,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  867,  867,  867,  868,  868,
			  868,  869,  869,  869,  402,  402,  402,  402,  402,  402,

			  402,  402,  402,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  870,  870,  870,  871,  871,  871,  872,  872,
			  872,  874,  874,  423,  423,  423,  885,  885,  885,  886,
			  886,  887,  887,  888,  888,  888,  423,  423,  423,  896,
			  896,  896,  897,  897,  898,  898,  859,  875,  908,  908,
			  876,  899,  899,  899,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  877,  878,  879,  880,  881,  882,  883,
			  890,  890,  901,  901,  901,  902,  902,  902,  903,  903,
			  903,  435,  435,  435,  435,  435,  435,  435,  435,  435,
			  905,  905,  905,  450,  450,  450,  907,  907,  907,  909, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  909,  670,  671,  910,  910,  910,  450,  450,  450,  450,
			  450,  450,  672,  673,  674,  675,  676,  677,  678,  891,
			  891,  891,  450,  450,  450, 1009,  891,  891,  891,  891,
			  891,  891,  912,  912,  912,  913,  913,  913,  914,  914,
			  914,  915,  915,  915,  460,  460,  460,  917,  917,  917,
			  670,  671,  918,  918,  892,  919,  919,  920,  920,  920,
			  823,  672,  673,  674,  675,  676,  677,  678,  893,  893,
			  893,  460,  460,  460,  993,  893,  893,  893,  893,  893,
			  893,  460,  460,  460,  460,  460,  460,  922,  922,  922,
			  923,  923,  923,  924,  924,  924,  469,  469,  469,  926,

			  926,  926, 1199,  894,  927,  927,  928,  928,  929,  929,
			  929,  442,  442,  442,  442,  442,  442,  442,  442,  442,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  931,
			  931,  931,  932,  932,  932,  933,  933,  933, 1256,  484,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  942,
			  942,  942,  943,  943,  943,  944,  944,  944,  250,  757,
			  757,  757,  934,  945,  946,  947,  948,  949,  950,  951,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  952,
			  952,  952, 1256,  953,  953,  953,  954,  954,  954,  250,
			  250,  250, 1000, 1000,  935,  936,  937,  938,  939,  940, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  941,  250,  250,  250,  250,  250,  250,  260,  767,  767,
			  767,  260,  260,  260,  260,  260,  260,  260,  260,  260,
			  955,  955,  955,  956,  956,  956,  957,  957,  957,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  958,  958,  958,
			  959,  959,  959,  960,  960,  960,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  961,  961,  961,  962,  962,
			  962,  963,  963,  963,  984,  297,  297,  297,  985,  297,
			  297,  297,  297,  297,  297,  988,  988,  988,  989,  989,
			  989,  990,  990,  990,  991,  991,  991,  308,  308,  308,

			 1198,  991,  991,  991,  991,  991,  991,  308,  308,  308,
			  308,  308,  308,  327,  327,  327,  327,  327,  327,  327,
			  327,  327,  995,  995,  995,  996,  996,  996,  997,  997,
			  997,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  337,  337,  337,  337,  337,  337,  337,  337,  337,  351,
			  351,  351,  351,  351,  351,  351,  351,  351,  621,  621,
			  621,  999,  999,  999, 1001, 1001, 1002, 1002, 1002,  360,
			  360,  360,  360,  360,  360,  360,  360,  360, 1004, 1004,
			 1004, 1005, 1005, 1005, 1006, 1006, 1006, 1007, 1007, 1007,
			  367,  367,  367, 1197, 1007, 1007, 1007, 1007, 1007, 1007, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  367,  367,  367,  367,  367,  367,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  409,  409,  409,  409,  409,  409,
			  409,  409,  409, 1012, 1012,  423,  423,  423,  423, 1196,
			  423,  423,  423,  423,  423,  423, 1018, 1018, 1018, 1019,
			 1019, 1020, 1020, 1021, 1021, 1021,  423,  423,  423,  423,
			  423,  423,  423,  423,  423, 1023, 1023, 1023,  423, 1013,
			 1013, 1013, 1024, 1024, 1024, 1195, 1013, 1013, 1013, 1013,
			 1013, 1013, 1025, 1025, 1025,  670,  671,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  672,  673,  674,  675,

			  676,  677,  678, 1194, 1014, 1015, 1015, 1015,  670,  671,
			 1044, 1044, 1015, 1015, 1015, 1015, 1015, 1015, 1193,  672,
			  673,  674,  675,  676,  677,  678, 1029, 1029, 1029, 1030,
			 1030, 1030, 1031, 1031, 1031,  423,  423,  423, 1045, 1045,
			 1016, 1026, 1026, 1026,  423,  423,  423, 1192, 1026, 1026,
			 1026, 1026, 1026, 1026,  423,  423,  423,  450,  905,  905,
			  905,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			 1032, 1032, 1032, 1033, 1033, 1033,  423, 1027, 1027, 1027,
			 1034, 1034, 1034, 1191, 1027, 1027, 1027, 1027, 1027, 1027,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  460, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  915,  915,  915,  460,  460,  460,  460,  460,  460,  460,
			  460,  460,  423, 1028, 1028, 1028, 1035, 1035, 1035, 1190,
			 1028, 1028, 1028, 1028, 1028, 1028, 1036, 1036, 1036, 1037,
			 1037, 1037,  460,  460,  460,  460,  460,  460,  460,  460,
			  460,  469,  469,  469,  469,  469,  469, 1256,  423,  469,
			  469,  469, 1038, 1038, 1038, 1039, 1039, 1039, 1040, 1040,
			 1040,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  748,  748,  748, 1043, 1043, 1043, 1189, 1041, 1046, 1046,
			 1046,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			 1188, 1256,  755,  755,  755, 1049, 1049, 1049, 1050, 1050,

			 1051, 1051, 1052, 1052, 1052,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  260,  260,  260,  260,  260,  260,
			  260,  260,  260,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  537,  537,  537,  537,  537,  537,  537,  537,
			  537, 1073,  297,  297,  297, 1074,  297,  297,  297,  297,
			  297,  297,  993,  993,  993,  327,  327,  327, 1187,  993,
			  993,  993,  993,  993,  993,  327,  327,  327,  327,  327,
			  327,  621,  621,  621,  621,  621,  621,  621,  621,  621,
			 1081, 1081, 1081, 1082, 1082, 1082, 1083, 1083, 1083,  360,
			  360,  360,  360,  360,  360,  360,  360,  360, 1009, 1009, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1009,  670,  671,  226,  226, 1009, 1009, 1009, 1009, 1009,
			 1009, 1186,  672,  673,  674,  675,  676,  677,  678, 1087,
			 1087, 1087,  670,  671,  859, 1009, 1087, 1087, 1087, 1087,
			 1087, 1087,  823,  672,  673,  674,  675,  676,  677,  678,
			  423,  423,  423,  423,  423,  423,  423,  423,  423, 1090,
			 1090, 1090, 1138,  993,  423, 1088, 1088, 1088, 1091, 1091,
			 1091, 1139, 1088, 1088, 1088, 1088, 1088, 1088, 1092, 1092,
			 1092,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423, 1177,
			  423, 1089, 1089, 1089,  450,  450,  450, 1176, 1089, 1089,

			 1089, 1089, 1089, 1089,  450,  450,  450,  450,  450,  450,
			  460,  460,  460,  460,  460,  460,  460,  460,  460,  469,
			  469,  469,  469,  469,  469, 1256,  423, 1093, 1093, 1093,
			  469,  469,  469, 1175, 1093, 1093, 1093, 1093, 1093, 1093,
			  748,  748,  748,  748,  748,  748,  748,  748,  748, 1097,
			 1097, 1097, 1174, 1173, 1096, 1098, 1098, 1098, 1099, 1099,
			 1099, 1172,  423, 1094, 1094, 1094,  755,  755,  755, 1256,
			 1094, 1094, 1094, 1094, 1094, 1094,  755,  755,  755,  755,
			  755,  755, 1100, 1100, 1100, 1101, 1101, 1101, 1102, 1102,
			 1102, 1114,  621,  621,  621, 1115, 1171, 1170,  423, 1095, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1095, 1095,  621,  621,  621, 1169, 1095, 1095, 1095, 1095,
			 1095, 1095,  621,  621,  621,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  748,  748,  748,  748,  748,  748,
			  748,  748,  748, 1168,  423, 1129, 1129, 1129,  670,  671,
			 1167, 1166, 1129, 1129, 1129, 1129, 1129, 1129, 1165,  672,
			  673,  674,  675,  676,  677,  678,  755,  755,  755,  755,
			  755,  755,  755,  755,  755, 1143, 1164, 1163,  859, 1144,
			  423, 1130, 1130, 1130,  670,  671, 1009,  823, 1130, 1130,
			 1130, 1130, 1130, 1130,  993,  672,  673,  674,  675,  676,
			  677,  678,  217,  279,  279,  279,  279,  217,  217,  434,

			  434,  217,  434,  434, 1154, 1153,  423, 1131, 1131, 1131,
			  670,  671, 1152, 1151, 1131, 1131, 1131, 1131, 1131, 1131,
			 1150,  672,  673,  674,  675,  676,  677,  678,  222,  222,
			  222, 1149,  222,  298,  298,  298, 1148,  298, 1147, 1146,
			 1145, 1142,  423, 1132, 1132, 1132,  670,  671, 1141, 1140,
			 1132, 1132, 1132, 1132, 1132, 1132, 1137,  672,  673,  674,
			  675,  676,  677,  678,  328,  328,  328, 1136,  328,  580,
			  580,  582,  582, 1135,  580, 1134,  582, 1128,  423, 1133,
			 1133, 1133,  670,  671,  859, 1009, 1133, 1133, 1133, 1133,
			 1133, 1133,  823,  672,  673,  674,  675,  676,  677,  678, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  633,  633,  635,  635,  993,  633, 1123,  635, 1122, 1121,
			 1120, 1119, 1118, 1117,  423, 1159, 1159, 1159,  670,  671,
			 1116, 1113, 1159, 1159, 1159, 1159, 1159, 1159, 1112,  672,
			  673,  674,  675,  676,  677,  678,  992,  992,  994,  994,
			 1008, 1008,  992, 1111,  994, 1110, 1008, 1109, 1010, 1010,
			  423, 1160, 1160, 1160, 1010, 1108, 1107, 1106, 1160, 1160,
			 1160, 1160, 1160, 1160, 1079, 1079, 1080, 1080, 1084, 1084,
			 1079, 1105, 1080, 1104, 1084, 1085, 1085, 1124, 1124, 1125,
			 1125, 1085, 1103, 1124, 1086, 1125,  423, 1161, 1161, 1161,
			  859, 1009,  823,  993, 1161, 1161, 1161, 1161, 1161, 1161,

			 1126, 1126, 1127, 1127, 1155, 1155, 1126, 1078, 1127, 1077,
			 1155, 1156, 1156, 1157, 1157, 1158, 1158, 1156, 1076, 1157,
			 1075, 1158,  423, 1162, 1162, 1162, 1072, 1071, 1070, 1069,
			 1162, 1162, 1162, 1162, 1162, 1162, 1178, 1178, 1179, 1179,
			 1180, 1180, 1178, 1068, 1179, 1065, 1180, 1181, 1181, 1064,
			 1063, 1062, 1061, 1181, 1060, 1059, 1058, 1057,  423, 1182,
			 1182, 1182, 1054, 1053, 1048, 1047, 1182, 1182, 1182, 1182,
			 1182, 1182, 1042, 1022, 1017, 1011,  859, 1009, 1003,  998,
			  823,  993,  987,  986,  983,  982,  981,  980,  979,  978,
			  977,  976,  975,  974,  423, 1183, 1183, 1183,  973,  970, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  969,  968, 1183, 1183, 1183, 1183, 1183, 1183,  967,  966,
			  965,  964,  250,  930,  925,  921,  916,  911,  906,  904,
			  900,  895,  889,  884,  873,  855,  850,  833,  828,  819,
			  423, 1184, 1184, 1184,  814,  813,  812,  811, 1184, 1184,
			 1184, 1184, 1184, 1184,  810,  807,  806,  805,  802,  801,
			  800,  799,  798,  797,  796,  795,  794,  793,  792,  791,
			  790,  789,  788,  783,  782,  777,  423, 1185, 1185, 1185,
			  773,  768,  763,  758, 1185, 1185, 1185, 1185, 1185, 1185,
			  756,  755,  754,  749,  748,  746,  741,  730,  725,  716,
			  715,  710,  475,  470,  696,  695,  694,  689,  669,  668,

			  667,  666,  423, 1200, 1200, 1200,  661,  657,  652,  648,
			 1200, 1200, 1200, 1200, 1200, 1200,  643,  642,  637,  636,
			  634,  620,  615,  611,  606,  605,  600,  589,  584,  583,
			  581,  295,  568,  567,  566,  565,  564,  563,  423, 1201,
			 1201, 1201,  552,  551,  550,  549, 1201, 1201, 1201, 1201,
			 1201, 1201,  546,  545,  526,  521,  512,  511,  506,  275,
			  270,  241,  236,  475,  470,  469,  441,  436,  422,  408,
			  403,  393,  388,  366,  423, 1202, 1202, 1202,  361,  350,
			  345,  327, 1202, 1202, 1202, 1202, 1202, 1202,  325,  320,
			  305,  300,  297,  295,  293,  292,  291,  288,  287,  286, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  285,  284,  283,  282,  281,  280,  278,  276,  275,  270,
			  423, 1203, 1203, 1203,  269,  241,  236,  227, 1203, 1203,
			 1203, 1203, 1203, 1203,  225,  224,  215, 1256,   96,   96,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256,  423, 1215, 1215, 1215,
			 1256, 1256, 1256, 1256, 1215, 1215, 1215, 1215, 1215, 1215,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256,  423, 1216, 1216, 1216, 1256, 1256, 1256, 1256,
			 1216, 1216, 1216, 1216, 1216, 1216, 1256, 1256, 1256, 1256,

			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,  423,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,  109, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  115,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  156,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  179,  179,  179,  179,  179,

			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179,
			  179,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228, 1256,  228,  242,  242, 1256, 1256, 1256,  242, 1256,
			  242,  242,  242,  242,  242,  242,  242, 1256,  242,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250, 1256,  250,  260,  260,  260, 1256,  260,  260,
			  260,  260,  260,  260,  260,  260,  260, 1256,  260,  294,
			  294,  294,  294,  294,  294,  294,  294,  294,  294,  294, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  294,  294,  294,  294,  294,  308,  308,  308,  308,  308,
			  308,  308,  308,  308,  308,  308,  308,  308, 1256,  308,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  329, 1256,  329,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  337,  337,  337, 1256,  337,
			  351,  351,  351,  351,  351,  351,  351,  351,  351,  351,
			  351,  351, 1256,  351,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  367,  367,  367,  367, 1256,  367,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378, 1256,  378,  394,  394,  394,  394,  394,

			  394,  394,  394,  394,  394, 1256,  394,  394,  394, 1256,
			  394,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409, 1256,  409,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423, 1256,
			  423,  442,  442, 1256,  442, 1256,  442, 1256,  442,  442,
			  442,  442,  442, 1256, 1256, 1256,  442,  450,  450,  450,
			  450,  450,  450,  450,  450,  450,  450,  450,  450,  450,
			 1256,  450,  460,  460,  460, 1256,  460,  460,  460,  460,
			  460,  460,  460,  460,  460, 1256,  460,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  215,  215, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_nxt_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1256,  215,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224, 1256,  224,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			 1256,  269,  297,  297,  297,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  297, 1256,  297,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  327,
			 1256,  327,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360,  360,  360,  360, 1256,  360,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			 1256,  469,  537,  537,  537,  537,  537,  537,  537,  537,

			  537,  537,  537,  537,  537, 1256,  537,  621,  621,  621,
			  621,  621,  621,  621,  621,  621,  621,  621,  621,  621,
			 1256,  621,  748,  748,  748,  748,  748,  748,  748,  748,
			  748,  748,  748,  748,  748,  748, 1256,  748,  755,  755,
			  755,  755,  755,  755,  755,  755,  755,  755,  755,  755,
			  755, 1256,  755,   37, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4617)
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
			an_array.area.fill_with (1256, 4600, 4617)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,   31,   32,   31,   32,   39,   45,
			   39,   45,  904,    1,    2,    2,    2, 1193,   78,    2,
			   78,   98,  110,   98,  110, 1222,    2,  113,  113,  113,
			  127,  146,  127,  146, 1254,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    3,    3,
			    3,    4,    4,    4,   59,   59,    4,   17,   17,   17,
			    3,   60,   60,    4,   72,   72,    3, 1252,   17,    4,
			  217,   17,   17,   17,   18,   18,   18,   42,   53,   53,
			   53,   53,   53,   53,   53,   18,   73,   73,   18,   18,

			   18,   56,   56,   56,   65,    3,   65,    3,    4,    3,
			    4, 1251,    4,    5,   58,   58,   58,   42,   17, 1248,
			   42,   61,   61,   61,  217,   42,   67,   69,   69,   69,
			 1247,   42,   71,   71,   71,   18,   54,   54,   54,   54,
			   54,   54,   54,   63,   63,   63,   63,   63,   63,   63,
			   64,   64,   64,   64,   64,   64,   64,   65,   65,   65,
			   65,   65,   65,   65,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    6, 1246,   67,   67,   67,
			   67,   67,   67,   67,   74,   74,   74,   91, 1245,   91,
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
			    8, 1244,  148,  148,  148,  148,  148,  148,  148,  159,
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

			  196,  181,  195,  195,  195,  197,  197, 1242,  187,  190,
			  190,  190,  190,  190,  190,  190,  198,  198,  198,  200,
			  200,  200,  200,  200,  200,  200,  201,  201,  201,  201,
			  201,  201,  201,   19,  202, 1241,  202,  207,  207,  207,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   20,  218,   20,  181,  181,  181,  181,  181,  181,
			  181,  209,  209,  209,  210,  210,  211,  211,  212,  212,
			  212,  214,  965,  214,  215,  215,  215,  215,  215,  215,
			  215,  965,  223,  218,  223,  232,  232,  202,  202,  202,
			  202,  202,  202,  202, 1240,   20,  218,  229,  229,  229, yy_Dummy>>,
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
			  227, 1239,  221,  224,  224,  224,  224,  224,  224,  224,

			  227,  228,  228,  228,  228,  228,  228,  228,  231,  231,
			  231,  234,  234,  234,  236,  236,  236,  226,  247,  247,
			  226, 1238,  219,  220, 1236,   23,   23, 1235,   23,   23,
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
			  258, 1234,  252,   25,  262,  262,  262,  264,  264,  264,
			  265,  265,  266,  266,  252,  267,  267,  267,  270,  270,
			  270,  250,  250,  250,  250,  250,  250,  250,  261,  271,
			  271,  271,  272,  272,  272,  261,  269,  269,  269,  269,
			  269,  269,  269,   25,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   26,   26,   26,  252,  252,  252,
			  252,  252,  252,  252,  309,  309,   26,  273,  273,  273,
			  274,  274,  274,  275,  275,  275,  315,  315,  261,  261,
			  261,  261,  261,  261,  261,  277,  282,  277, 1233,  296,

			  282,  296,  297,  297,  297,  297,  297,  297,  297,  300,
			  300,  300,  301,  301,  301, 1232,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   27,  302,  302,
			  302,  303,  303,  303,  304,  304,  304,  305,  305,  305,
			  306, 1230,  306,  307,  307,  307,  312,  312,  312,  314,
			  314,  314,  316,  316,  317,  317,  317,  320,  320,  320,
			  321,  321,  321,  322,  322,  322,  323,  323,  323, 1229,
			  326,   27,  326,   27,  324,  324,  324, 1228,   27,   27,
			   27,   27,   27,   27,   27,   27,   27,   27,   27,   28,
			  325,  325,  325,  327,  327,  327,  327,  327,  327,  327, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  329,  329,  329,  329,  329,  329,  329,  330,  330,  330,
			  332,  332,  332,  333,  333,  334,  334,  335,  335,  335,
			  337,  337,  337,  337,  337,  337,  337,  338,  338,  338,
			  340,  340,  340,   28, 1227,   28,  341,  341,  342,  342,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   29,  343,  343,  343,  345,  345,  345,  346,  346,
			  346,  360,   29,  347,  347,  347,  348,  348,  348,  349,
			  349,  349,  350,  350,  350,  351,  351,  351,  351,  351,
			  351,  351,  352,  352,  352,  354,  354,  354,  355,  355,
			  356,  356,  357,  357,  357,   29,   29,  359, 1226,  359,

			  368,  368,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   30, 1225,  360,  360,  360,  360,  360,
			  360,  360,  374,  374,   30,  361,  361,  361,  362,  362,
			  362,  363,  363,  363,  364,  364,  364,  365,  365,  365,
			  366,  366,  366,  371,  371,  371,  373,  373,  373,  375,
			  375,  376,  376,  376,  380,  380,  380,   30,   30,  382,
			  382,  382,  383,  383,   30,   30,   30,   30,   30,   30,
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
			 1224,   35,  384,  384,   35,  385,  385,  385,  398,  398,
			   35,  388,  388,  388,  389,  389,  389,  390,  390,  390,
			  391,  391,  391,  392,  392,  392,  393,  393,  393,  395,
			  395,  395,  397,  397,  397,  399,  399,  400,  400,  400,
			  403,  403,  403,  404,  404,  404,  409,   35, 1096,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,

			   35,   36, 1221,   36,  414,  414,   36,  405,  405,  405,
			  415,  415,   36,  406,  406,  406,  407,  407,  407,  408,
			  408,  408,  411,  411,  411,  413,  413,  413,  416,  416,
			  416,  418, 1096,  418,  425,  425,  425,  428,  428,  409,
			  409,  409,  409,  409,  409,  409,  427,  427,  427,   36,
			 1220,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,   36,   36,  118,  118,  423,  423,  429,  429,  430,
			  430,  430,  436,  436,  436, 1219,  423,  423,  423,  423,
			  423,  423,  423,  437,  437,  437,  438,  438,  438,  118,
			  798,  434,  118,  434,  798,  434,  434,  434,  439,  439, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  439,  440,  440,  440, 1218,  118,  118,  118,  118,  118,
			  118,  118,  158,  158,  441,  441,  441,  442,  442,  442,
			  442,  442,  442,  442,  443,  443,  443,  446,  446,  434,
			  447,  447,  434,  445,  445,  445,  452, 1217,  158,  456,
			  456,  158,  448,  448,  448,  453,  453,  453,  452,  455,
			  455,  455,  457,  457,  158,  158,  158,  158,  158,  158,
			  158,  170,  170,  450, 1214,  450,  458,  458,  458,  462,
			  462,  462, 1213,  461,  464,  464,  464,  465,  465, 1211,
			  461,  466,  466,  467,  467,  467, 1210,  170,  479,  479,
			  170,  452,  452,  452,  452,  452,  452,  452,  470,  470,

			  470,  480,  480,  170,  170,  170,  170,  170,  170,  170,
			  191,  191,  471,  471,  471, 1209,  450,  450,  450,  450,
			  450,  450,  450,  461,  461,  461,  461,  461,  461,  461,
			  472,  472,  472,  473,  473,  473,  191,  489,  489,  191,
			  469,  469,  469,  469,  469,  469,  469,  474,  474,  474,
			  490,  490,  191,  191,  191,  191,  191,  191,  191,  278,
			 1208,  278,  278,  278,  278,  278,  278,  278,  278,  278,
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
			  278,  475,  475,  475, 1207,  278,  278,  278,  278,  278,
			  278,  278,  278,  287,  287,  287,  287,  287,  476,  476,
			  476,  483,  977,  287,  287,  502,  502,  287,  287,  478,
			  478,  478,  977,  287,  424,  424,  481,  481,  481,  486,
			  486,  486,  488,  488,  488,  491,  491,  491,  494,  494,
			  494,  495,  495,  495, 1206,  483,  496,  496,  496, 1205,
			  424,  503,  503,  424, 1204,  483,  498,  498,  498,  499,
			  499,  499,  501,  501,  501, 1199,  424,  424,  424,  424,
			  424,  424,  424,  504,  504,  504,  506,  506,  506,  507,

			  507,  507,  508,  508,  508,  509,  509,  509,  510,  510,
			  510,  511,  511,  511,  513,  513,  513,  514,  514,  514,
			  516,  516,  516,  517,  517,  518,  518,  519,  519,  519,
			  521,  521,  521,  522,  522,  522,  523,  523,  523,  524,
			  524,  524,  525,  525,  525,  526,  526,  526,  527,  527,
			  527,  529,  529,  529,  530,  530,  531,  531,  532,  532,
			  532,  534,  534,  534,  535,  535,  535,  536,  536,  536,
			  537,  537,  537,  537,  537,  537,  537,  538,  538,  538,
			  540,  540,  540,  541,  541,  542,  542,  543,  543,  543,
			  560, 1197,  560,  569,  569,  569,  571,  571,  571,  572, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  572,  573,  573,  574,  574,  574,  576,  576,  576,  577,
			  577,  577,  578,  578,  578,  579,  579,  580,  580,  580,
			  584,  584,  584, 1196,  580,  580,  580,  580,  580,  580,
			  581,  581,  581,  585,  585,  585, 1195,  581,  581,  581,
			  581,  581,  581,  582,  582,  582,  586,  586,  586, 1194,
			  582,  582,  582,  582,  582,  582,  583,  583,  583,  587,
			  587,  587, 1192,  583,  583,  583,  583,  583,  583,  588,
			  588,  588,  589,  589,  589,  590,  590,  590,  591,  591,
			  591,  592,  592,  592,  593,  593,  593,  595,  595,  595,
			  596,  596,  597,  597,  598,  598,  598,  600,  600,  600,

			  601,  601,  601,  602,  602,  602,  603,  603,  603,  604,
			  604,  604,  605,  605,  605,  606,  606,  606,  607,  607,
			  607,  608,  608,  608,  609,  609,  609,  610,  610,  610,
			  611,  611,  611,  612,  612,  612,  613,  613,  613,  614,
			  614,  614,  615,  615,  615,  616,  616,  616,  617,  617,
			  617,  618,  618,  618,  619,  619,  619,  620,  620,  620,
			  621,  621,  621,  621,  621,  621,  621,  622,  622,  622,
			  624,  624,  624,  625,  625,  626,  626,  627,  627,  627,
			  629,  629,  629,  630,  630,  630,  631,  631,  631,  632,
			  632,  633,  633,  633,  637,  637,  637, 1189,  633,  633, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  633,  633,  633,  633,  634,  634,  634,  638,  638,  638,
			 1188,  634,  634,  634,  634,  634,  634,  635,  635,  635,
			  639,  639,  639, 1187,  635,  635,  635,  635,  635,  635,
			  636,  636,  636,  640,  640,  640, 1186,  636,  636,  636,
			  636,  636,  636,  641,  641,  641,  642,  642,  642,  643,
			  643,  643,  644,  644,  644,  645,  645,  645,  646,  646,
			  646,  647,  647,  647,  648,  648,  648,  649,  649,  649,
			  650,  650,  650,  651,  651,  651,  652,  652,  652,  653,
			  653,  653,  654,  654,  654,  655,  655,  655,  656,  656,
			  656,  657,  657,  657,  658,  658,  658,  659,  659,  659,

			  660,  660,  660,  661,  661,  661,  662,  662,  662,  663,
			  663,  663,  664,  664,  664,  665,  665,  665,  666,  666,
			  666,  670,  670,  672,  672,  672,  674,  674,  674,  675,
			  675,  676,  676,  677,  677,  677,  682,  682,  682,  684,
			  684,  684,  685,  685,  686,  686, 1181,  670,  706,  706,
			  670,  687,  687,  687,  689,  689,  689,  690,  690,  690,
			  691,  691,  691,  670,  670,  670,  670,  670,  670,  670,
			  679,  679,  692,  692,  692,  693,  693,  693,  694,  694,
			  694,  698,  698,  698,  699,  699,  699,  700,  700,  700,
			  702,  702,  702,  703,  703,  703,  705,  705,  705,  707, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  707,  679,  679,  708,  708,  708,  710,  710,  710,  711,
			  711,  711,  679,  679,  679,  679,  679,  679,  679,  680,
			  680,  680,  712,  712,  712, 1180,  680,  680,  680,  680,
			  680,  680,  713,  713,  713,  714,  714,  714,  715,  715,
			  715,  717,  717,  717,  718,  718,  718,  720,  720,  720,
			  680,  680,  721,  721,  680,  722,  722,  723,  723,  723,
			 1179,  680,  680,  680,  680,  680,  680,  680,  681,  681,
			  681,  725,  725,  725, 1178,  681,  681,  681,  681,  681,
			  681,  726,  726,  726,  727,  727,  727,  728,  728,  728,
			  729,  729,  729,  730,  730,  730,  731,  731,  731,  733,

			  733,  733, 1177,  681,  734,  734,  735,  735,  736,  736,
			  736,  738,  738,  738,  739,  739,  739,  740,  740,  740,
			  741,  741,  741,  742,  742,  742,  743,  743,  743,  744,
			  744,  744,  745,  745,  745,  746,  746,  746,  747,  748,
			  749,  749,  749,  750,  750,  750,  751,  751,  751,  752,
			  752,  752,  753,  753,  753,  754,  754,  754,  757,  757,
			  757,  757,  747,  755,  755,  755,  755,  755,  755,  755,
			  758,  758,  758,  759,  759,  759,  760,  760,  760,  761,
			  761,  761,  747,  762,  762,  762,  763,  763,  763,  764,
			  764,  764,  846,  846,  748,  748,  748,  748,  748,  748, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  748,  765,  765,  765,  766,  766,  766,  767,  767,  767,
			  767,  768,  768,  768,  769,  769,  769,  770,  770,  770,
			  771,  771,  771,  772,  772,  772,  773,  773,  773,  774,
			  774,  774,  775,  775,  775,  776,  776,  776,  777,  777,
			  777,  778,  778,  778,  779,  779,  779,  780,  780,  780,
			  781,  781,  781,  782,  782,  782,  783,  783,  783,  784,
			  784,  784,  785,  785,  785,  786,  786,  786,  787,  787,
			  787,  788,  788,  788,  810,  814,  814,  814,  810,  815,
			  815,  815,  816,  816,  816,  817,  817,  817,  818,  818,
			  818,  819,  819,  819,  821,  821,  821,  825,  825,  825,

			 1176,  821,  821,  821,  821,  821,  821,  826,  826,  826,
			  827,  827,  827,  828,  828,  828,  829,  829,  829,  830,
			  830,  830,  831,  831,  831,  832,  832,  832,  833,  833,
			  833,  834,  834,  834,  835,  835,  835,  836,  836,  836,
			  837,  837,  837,  838,  838,  838,  839,  839,  839,  840,
			  840,  840,  841,  841,  841,  842,  842,  842,  843,  843,
			  843,  845,  845,  845,  847,  847,  848,  848,  848,  850,
			  850,  850,  851,  851,  851,  852,  852,  852,  853,  853,
			  853,  854,  854,  854,  855,  855,  855,  857,  857,  857,
			  861,  861,  861, 1175,  857,  857,  857,  857,  857,  857, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  862,  862,  862,  863,  863,  863,  864,  864,  864,  865,
			  865,  865,  866,  866,  866,  867,  867,  867,  868,  868,
			  868,  869,  869,  869,  870,  870,  870,  871,  871,  871,
			  872,  872,  872,  874,  874,  874,  877,  877,  877, 1174,
			  874,  874,  874,  874,  874,  874,  879,  879,  879,  880,
			  880,  881,  881,  882,  882,  882,  884,  884,  884,  885,
			  885,  885,  886,  886,  886,  887,  887,  887,  874,  875,
			  875,  875,  888,  888,  888, 1173,  875,  875,  875,  875,
			  875,  875,  889,  889,  889,  890,  890,  895,  895,  895,
			  896,  896,  896,  897,  897,  897,  890,  890,  890,  890,

			  890,  890,  890, 1172,  875,  876,  876,  876,  893,  893,
			  938,  938,  876,  876,  876,  876,  876,  876, 1171,  893,
			  893,  893,  893,  893,  893,  893,  898,  898,  898,  899,
			  899,  899,  900,  900,  900,  901,  901,  901,  939,  939,
			  876,  891,  891,  891,  902,  902,  902, 1170,  891,  891,
			  891,  891,  891,  891,  903,  903,  903,  905,  905,  905,
			  905,  906,  906,  906,  907,  907,  907,  908,  908,  908,
			  909,  909,  909,  910,  910,  910,  891,  892,  892,  892,
			  911,  911,  911, 1169,  892,  892,  892,  892,  892,  892,
			  912,  912,  912,  913,  913,  913,  914,  914,  914,  915, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  915,  915,  915,  916,  916,  916,  917,  917,  917,  918,
			  918,  918,  892,  894,  894,  894,  919,  919,  919, 1168,
			  894,  894,  894,  894,  894,  894,  920,  920,  920,  921,
			  921,  921,  922,  922,  922,  923,  923,  923,  924,  924,
			  924,  925,  925,  925,  926,  926,  926,  934,  894,  927,
			  927,  927,  928,  928,  928,  929,  929,  929,  930,  930,
			  930,  931,  931,  931,  932,  932,  932,  933,  933,  933,
			  935,  935,  935,  937,  937,  937, 1166,  934,  940,  940,
			  940,  942,  942,  942,  943,  943,  943,  944,  944,  944,
			 1165,  934,  945,  945,  945,  947,  947,  947,  948,  948,

			  949,  949,  950,  950,  950,  952,  952,  952,  953,  953,
			  953,  954,  954,  954,  955,  955,  955,  956,  956,  956,
			  957,  957,  957,  958,  958,  958,  959,  959,  959,  960,
			  960,  960,  961,  961,  961,  962,  962,  962,  963,  963,
			  963,  983,  988,  988,  988,  983,  989,  989,  989,  990,
			  990,  990,  991,  991,  991,  995,  995,  995, 1164,  991,
			  991,  991,  991,  991,  991,  996,  996,  996,  997,  997,
			  997,  998,  998,  998,  999,  999,  999, 1000, 1000, 1000,
			 1001, 1001, 1001, 1002, 1002, 1002, 1003, 1003, 1003, 1004,
			 1004, 1004, 1005, 1005, 1005, 1006, 1006, 1006, 1007, 1007, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1007, 1012, 1012, 1272, 1272, 1007, 1007, 1007, 1007, 1007,
			 1007, 1163, 1012, 1012, 1012, 1012, 1012, 1012, 1012, 1013,
			 1013, 1013, 1015, 1015, 1158, 1157, 1013, 1013, 1013, 1013,
			 1013, 1013, 1156, 1015, 1015, 1015, 1015, 1015, 1015, 1015,
			 1017, 1017, 1017, 1018, 1018, 1018, 1019, 1019, 1019, 1020,
			 1020, 1020, 1108, 1155, 1013, 1014, 1014, 1014, 1021, 1021,
			 1021, 1108, 1014, 1014, 1014, 1014, 1014, 1014, 1022, 1022,
			 1022, 1023, 1023, 1023, 1024, 1024, 1024, 1025, 1025, 1025,
			 1029, 1029, 1029, 1030, 1030, 1030, 1031, 1031, 1031, 1153,
			 1014, 1016, 1016, 1016, 1032, 1032, 1032, 1152, 1016, 1016,

			 1016, 1016, 1016, 1016, 1033, 1033, 1033, 1034, 1034, 1034,
			 1035, 1035, 1035, 1036, 1036, 1036, 1037, 1037, 1037, 1038,
			 1038, 1038, 1039, 1039, 1039, 1041, 1016, 1026, 1026, 1026,
			 1040, 1040, 1040, 1151, 1026, 1026, 1026, 1026, 1026, 1026,
			 1042, 1042, 1042, 1043, 1043, 1043, 1044, 1044, 1044, 1045,
			 1045, 1045, 1150, 1146, 1041, 1046, 1046, 1046, 1047, 1047,
			 1047, 1145, 1026, 1027, 1027, 1027, 1048, 1048, 1048, 1041,
			 1027, 1027, 1027, 1027, 1027, 1027, 1049, 1049, 1049, 1050,
			 1050, 1050, 1051, 1051, 1051, 1052, 1052, 1052, 1053, 1053,
			 1053, 1068, 1081, 1081, 1081, 1068, 1144, 1143, 1027, 1028, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1028, 1028, 1082, 1082, 1082, 1142, 1028, 1028, 1028, 1028,
			 1028, 1028, 1083, 1083, 1083, 1090, 1090, 1090, 1091, 1091,
			 1091, 1092, 1092, 1092, 1097, 1097, 1097, 1098, 1098, 1098,
			 1099, 1099, 1099, 1141, 1028, 1087, 1087, 1087, 1093, 1093,
			 1140, 1139, 1087, 1087, 1087, 1087, 1087, 1087, 1138, 1093,
			 1093, 1093, 1093, 1093, 1093, 1093, 1100, 1100, 1100, 1101,
			 1101, 1101, 1102, 1102, 1102, 1113, 1135, 1134, 1127, 1113,
			 1087, 1088, 1088, 1088, 1129, 1129, 1126, 1125, 1088, 1088,
			 1088, 1088, 1088, 1088, 1124, 1129, 1129, 1129, 1129, 1129,
			 1129, 1129, 1270, 1277, 1277, 1277, 1277, 1270, 1270, 1290,

			 1290, 1270, 1290, 1290, 1123, 1122, 1088, 1089, 1089, 1089,
			 1202, 1202, 1121, 1120, 1089, 1089, 1089, 1089, 1089, 1089,
			 1119, 1202, 1202, 1202, 1202, 1202, 1202, 1202, 1271, 1271,
			 1271, 1118, 1271, 1279, 1279, 1279, 1117, 1279, 1116, 1115,
			 1114, 1112, 1089, 1094, 1094, 1094, 1203, 1203, 1111, 1110,
			 1094, 1094, 1094, 1094, 1094, 1094, 1107, 1203, 1203, 1203,
			 1203, 1203, 1203, 1203, 1281, 1281, 1281, 1106, 1281, 1298,
			 1298, 1299, 1299, 1104, 1298, 1103, 1299, 1086, 1094, 1095,
			 1095, 1095, 1215, 1215, 1085, 1084, 1095, 1095, 1095, 1095,
			 1095, 1095, 1080, 1215, 1215, 1215, 1215, 1215, 1215, 1215, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1302, 1302, 1303, 1303, 1079, 1302, 1078, 1303, 1076, 1075,
			 1074, 1073, 1072, 1071, 1095, 1130, 1130, 1130, 1216, 1216,
			 1069, 1067, 1130, 1130, 1130, 1130, 1130, 1130, 1066, 1216,
			 1216, 1216, 1216, 1216, 1216, 1216, 1309, 1309, 1310, 1310,
			 1311, 1311, 1309, 1065, 1310, 1062, 1311, 1061, 1312, 1312,
			 1130, 1131, 1131, 1131, 1312, 1060, 1059, 1058, 1131, 1131,
			 1131, 1131, 1131, 1131, 1313, 1313, 1314, 1314, 1315, 1315,
			 1313, 1057, 1314, 1056, 1315, 1316, 1316, 1317, 1317, 1318,
			 1318, 1316, 1055, 1317, 1011, 1318, 1131, 1132, 1132, 1132,
			 1010, 1008,  994,  992, 1132, 1132, 1132, 1132, 1132, 1132,

			 1319, 1319, 1320, 1320, 1321, 1321, 1319,  987, 1320,  986,
			 1321, 1322, 1322, 1323, 1323, 1324, 1324, 1322,  985, 1323,
			  984, 1324, 1132, 1133, 1133, 1133,  982,  981,  980,  979,
			 1133, 1133, 1133, 1133, 1133, 1133, 1325, 1325, 1326, 1326,
			 1327, 1327, 1325,  978, 1326,  976, 1327, 1328, 1328,  975,
			  974,  972,  971, 1328,  970,  969,  968,  967, 1133, 1159,
			 1159, 1159,  964,  951,  946,  941, 1159, 1159, 1159, 1159,
			 1159, 1159,  936,  883,  878,  873,  860,  858,  849,  844,
			  824,  822,  812,  811,  809,  808,  807,  806,  805,  804,
			  803,  802,  801,  800, 1159, 1160, 1160, 1160,  799,  797, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  796,  795, 1160, 1160, 1160, 1160, 1160, 1160,  792,  791,
			  790,  789,  756,  737,  732,  724,  719,  709,  704,  701,
			  688,  683,  678,  673,  669,  628,  623,  599,  594,  575,
			 1160, 1161, 1161, 1161,  570,  568,  567,  566, 1161, 1161,
			 1161, 1161, 1161, 1161,  565,  563,  562,  561,  559,  558,
			  557,  556,  555,  554,  553,  552,  551,  550,  548,  547,
			  546,  545,  544,  539,  533,  528, 1161, 1162, 1162, 1162,
			  520,  515,  505,  500, 1162, 1162, 1162, 1162, 1162, 1162,
			  497,  493,  492,  487,  485,  482,  477,  468,  463,  460,
			  459,  454,  449,  444,  433,  432,  431,  426,  422,  421,

			  420,  417, 1162, 1182, 1182, 1182,  412,  401,  396,  386,
			 1182, 1182, 1182, 1182, 1182, 1182,  381,  377,  372,  370,
			  369,  358,  353,  344,  339,  336,  331,  318,  313,  311,
			  310,  294,  293,  292,  291,  290,  289,  288, 1182, 1183,
			 1183, 1183,  286,  285,  284,  283, 1183, 1183, 1183, 1183,
			 1183, 1183,  281,  280,  268,  263,  260,  259,  254,  249,
			  244,  235,  230,  213,  208,  204,  199,  194,  189,  178,
			  173,  166,  161,  155, 1183, 1184, 1184, 1184,  150,  144,
			  139,  131, 1184, 1184, 1184, 1184, 1184, 1184,  125,  120,
			  108,  103,  100,   95,   94,   93,   92,   90,   89,   88, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   87,   86,   85,   84,   83,   82,   80,   76,   75,   70,
			 1184, 1185, 1185, 1185,   68,   62,   57,   52, 1185, 1185,
			 1185, 1185, 1185, 1185,   48,   47,   41,   37,   12,   11,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0, 1185, 1200, 1200, 1200,
			    0,    0,    0,    0, 1200, 1200, 1200, 1200, 1200, 1200,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0, 1200, 1201, 1201, 1201,    0,    0,    0,    0,
			 1201, 1201, 1201, 1201, 1201, 1201,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0, 1201, 1257,
			 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257,
			 1257, 1257, 1257, 1257, 1257, 1258, 1258, 1258, 1258, 1258,
			 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258,
			 1258, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259,
			 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1260, 1260, 1260,
			 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260, 1260,
			 1260, 1260, 1260, 1261, 1261, 1261, 1261, 1261, 1261, 1261,
			 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1262, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262,
			 1262, 1262, 1262, 1262, 1262, 1263, 1263, 1263, 1263, 1263,
			 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263,
			 1263, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264,
			 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1265, 1265, 1265,
			 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265,
			 1265, 1265, 1265, 1266, 1266, 1266, 1266, 1266, 1266, 1266,
			 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1267,
			 1267, 1267, 1267, 1267, 1267, 1267, 1267, 1267, 1267, 1267,
			 1267, 1267, 1267, 1267, 1267, 1268, 1268, 1268, 1268, 1268,

			 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268,
			 1268, 1269, 1269, 1269, 1269, 1269, 1269, 1269, 1269, 1269,
			 1269, 1269, 1269, 1269, 1269, 1269, 1269, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273,    0, 1273, 1274, 1274,    0,    0,    0, 1274,    0,
			 1274, 1274, 1274, 1274, 1274, 1274, 1274,    0, 1274, 1275,
			 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275,
			 1275, 1275,    0, 1275, 1276, 1276, 1276,    0, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276, 1276, 1276,    0, 1276, 1278,
			 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1278, 1278, 1278, 1278, 1278, 1280, 1280, 1280, 1280, 1280,
			 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,    0, 1280,
			 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282, 1282,
			 1282, 1282, 1282,    0, 1282, 1283, 1283, 1283, 1283, 1283,
			 1283, 1283, 1283, 1283, 1283, 1283, 1283, 1283,    0, 1283,
			 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284, 1284,
			 1284, 1284,    0, 1284, 1285, 1285, 1285, 1285, 1285, 1285,
			 1285, 1285, 1285, 1285, 1285, 1285, 1285,    0, 1285, 1286,
			 1286, 1286, 1286, 1286, 1286, 1286, 1286, 1286, 1286, 1286,
			 1286, 1286, 1286,    0, 1286, 1287, 1287, 1287, 1287, 1287,

			 1287, 1287, 1287, 1287, 1287,    0, 1287, 1287, 1287,    0,
			 1287, 1288, 1288, 1288, 1288, 1288, 1288, 1288, 1288, 1288,
			 1288, 1288, 1288, 1288,    0, 1288, 1289, 1289, 1289, 1289,
			 1289, 1289, 1289, 1289, 1289, 1289, 1289, 1289, 1289,    0,
			 1289, 1291, 1291,    0, 1291,    0, 1291,    0, 1291, 1291,
			 1291, 1291, 1291,    0,    0,    0, 1291, 1292, 1292, 1292,
			 1292, 1292, 1292, 1292, 1292, 1292, 1292, 1292, 1292, 1292,
			    0, 1292, 1293, 1293, 1293,    0, 1293, 1293, 1293, 1293,
			 1293, 1293, 1293, 1293, 1293,    0, 1293, 1294, 1294, 1294,
			 1294, 1294, 1294, 1294, 1294, 1294, 1294, 1294, 1294, 1294, yy_Dummy>>,
			1, 200, 4200)
		end

	yy_chk_template_23 (an_array: ARRAY [INTEGER])
			-- Fill chunk #23 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0, 1294, 1295, 1295, 1295, 1295, 1295, 1295, 1295, 1295,
			 1295, 1295, 1295, 1295, 1295,    0, 1295, 1296, 1296, 1296,
			 1296, 1296, 1296, 1296, 1296, 1296, 1296, 1296, 1296, 1296,
			    0, 1296, 1297, 1297, 1297, 1297, 1297, 1297, 1297, 1297,
			 1297, 1297, 1297, 1297, 1297,    0, 1297, 1300, 1300, 1300,
			 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300, 1300,
			    0, 1300, 1301, 1301, 1301, 1301, 1301, 1301, 1301, 1301,
			 1301, 1301, 1301, 1301, 1301,    0, 1301, 1304, 1304, 1304,
			 1304, 1304, 1304, 1304, 1304, 1304, 1304, 1304, 1304, 1304,
			    0, 1304, 1305, 1305, 1305, 1305, 1305, 1305, 1305, 1305,

			 1305, 1305, 1305, 1305, 1305,    0, 1305, 1306, 1306, 1306,
			 1306, 1306, 1306, 1306, 1306, 1306, 1306, 1306, 1306, 1306,
			    0, 1306, 1307, 1307, 1307, 1307, 1307, 1307, 1307, 1307,
			 1307, 1307, 1307, 1307, 1307, 1307,    0, 1307, 1308, 1308,
			 1308, 1308, 1308, 1308, 1308, 1308, 1308, 1308, 1308, 1308,
			 1308,    0, 1308, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 200, 4400)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1328)
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
			    0, 3827, 3826,  424,    0,    0,    0,   66,   83,  487,
			  549,  612,    0,  675,  737,  800,  863,  925,  987, 1049,
			 1111,    2,    3, 1174,    0, 1237, 1299, 3827, 4553,    7,
			 4553, 3813,   81,    0, 4553,    8, 4553, 3812, 3805, 4553,
			    0, 4553, 3811,   31,   79, 4553,   48, 3761,   61,   11,
			   17,   68, 3762,   86,   93,  100, 4553,  120, 3801,   74,
			 3754,   79,   21,   42,  131, 3755, 3755, 4553,   17, 4553,
			 3793,    0, 3783, 3782, 3777, 3778, 3760, 3770, 3773, 3762,
			 3756,  151, 3770, 3760, 3772, 3791, 4553, 4553,   20, 4553,

			 3779,    0,  137, 3736,  140,  143,  144,  147, 3737, 4553,
			   21, 4553, 4553,   12, 4553, 4553, 4553, 4553, 1348,  150,
			 3734,  153,  156,  157,  160, 3735, 4553,   29, 4553, 4553,
			 4553, 3768, 4553,    0,  159, 4553, 4553,  192,  170, 3725,
			  190,  193,  202,  205, 3726,  204,   30, 4553,  255,  216,
			 3723,  219,  222,  223,  226, 3720, 4553, 4553, 1397,  272,
			  229, 3717,  252,  233,  254,  267, 3718, 4553, 4553,  279,
			 1446, 4553,  270, 3715,  273,  290,  291,  294, 3716, 4553,
			 4553,  497, 4553,  237, 4553, 4553,  491,  467, 4553, 3749,
			  452, 1495,  289,  442, 3712,  449,  446,  451,  463, 3713, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  462,  469,  530,  683, 3752, 4553, 4553,  484, 3709,  508,
			  511,  512,  515, 3710,  570,  517, 4553,   74,  546,  672,
			  673,  679,    0,  581,  636, 4553,  668,  687,  644,  544,
			 3707,  655,  532,  546,  658, 3708,  661,  694,  697,  700,
			  703,  706,  705,  716, 3705,  719,  633,  664,  722, 3706,
			  774, 4553,  810,  728, 3703,  731,  751,  752,  755, 3704,
			 3749,  831,  761, 3700,  764,  767,  768,  772, 3701,  789,
			  775,  786,  789,  824,  827,  830, 4553,  894, 1558,    0,
			 3729, 3713,  873, 3706, 3711, 3708, 3702, 1600, 3697, 3697,
			 3709, 3703, 3703, 3694, 3729, 4553,  898,  845,    0, 4553,

			  856,  859,  875,  878,  881,  884,  939,  928, 4553,  859,
			 3680, 3679,  893, 3673,  896,  833,  898,  901, 3674, 4553,
			  904,  907,  910,  913,  921,  937,  969,  936,    0,  943,
			  954, 3671,  957,  960,  961,  964, 3672,  963,  974, 3669,
			  977,  983,  984,  999, 3670, 1002, 1005, 1010, 1013, 1016,
			 1019, 1018, 1029, 3667, 1032, 1035, 1036, 1039, 3668, 1096,
			 1058, 1072, 1075, 1078, 1081, 1084, 1087, 4553, 1085, 3670,
			 3669, 1090, 3663, 1093, 1069, 1095, 1098, 3664, 4553, 4553,
			 1101, 3661, 1106, 1109, 1188, 1192, 3656, 4553, 1198, 1201,
			 1204, 1207, 1210, 1213, 4553, 1216, 3653, 1219, 1195, 1221, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1224, 3654, 4553, 1227, 1230, 1254, 1260, 1263, 1266, 1282,
			 4553, 1269, 3651, 1272, 1251, 1256, 1275, 3648, 1330, 4553,
			 3682, 3681, 3672, 1319, 1629, 1281, 3642, 1293, 1284, 1313,
			 1316, 3643, 3643, 3642, 1380, 4553, 1319, 1330, 1333, 1345,
			 1348, 1361, 1360, 1371, 3638, 1380, 1374, 1376, 1389, 3639,
			 1459, 4553, 1434, 1392, 3636, 1396, 1386, 1398, 1413, 3637,
			 3682, 1466, 1416, 3633, 1421, 1424, 1427, 1430, 3634, 1483,
			 1445, 1459, 1477, 1480, 1494, 1558, 1575, 3631, 1586, 1435,
			 1447, 1593, 3632, 1625, 4553, 3671, 1596, 3628, 1599, 1484,
			 1496, 1602, 3629, 3668, 1605, 1608, 1613, 3679, 1661, 1626,

			 3618, 1629, 1582, 1617, 1640, 3619, 1643, 1646, 1649, 1652,
			 1655, 1658, 4553, 1699, 1664, 3616, 1667, 1670, 1671, 1674,
			 3617, 1677, 1680, 1683, 1686, 1689, 1692, 1695, 3610, 1698,
			 1701, 1702, 1705, 3611, 1708, 1711, 1714, 1713, 1724, 3608,
			 1727, 1730, 1731, 1734, 3609, 3629, 3634, 3618, 3636,    0,
			 3624, 3630, 3633, 3632, 3631, 3626, 3627, 3609, 3619, 3622,
			 1754, 3621, 3624, 3618,  749, 3631, 3611, 3612, 3600, 1740,
			 3579, 1743, 1746, 1747, 1750, 3576, 1753, 1756, 1759, 1800,
			 1802, 1815, 1828, 1841, 1767, 1780, 1793, 1806, 1816, 1819,
			 1822, 1825, 1828, 1831, 3573, 1834, 1837, 1838, 1841, 3574, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1844, 1847, 1850, 1853, 1856, 1859, 1862, 1865, 1868, 1871,
			 1874, 1877, 1880, 1883, 1886, 1889, 1892, 1895, 1898, 1901,
			 1904, 1903, 1914, 3571, 1917, 1920, 1921, 1924, 3572, 1927,
			 1930, 1933, 1974, 1976, 1989, 2002, 2015, 1941, 1954, 1967,
			 1980, 1990, 1993, 1996, 1999, 2002, 2005, 2008, 2011, 2014,
			 2017, 2020, 2023, 2026, 2029, 2032, 2035, 2038, 2041, 2044,
			 2047, 2050, 2053, 2056, 2059, 2062, 2065, 4553, 4553, 3588,
			 2106, 4553, 2070, 3568, 2073, 2076, 2077, 2080, 3569, 2155,
			 2204, 2253, 2083, 3566, 2086, 2089, 2090, 2098, 3567, 2101,
			 2104, 2107, 2119, 2122, 2125, 4553, 4553, 4553, 2128, 2131,

			 2134, 3618, 2175, 2140, 3563, 2143, 2095, 2145, 2150, 3564,
			 2153, 2156, 2169, 2179, 2182, 2185, 4553, 2226, 2191, 3561,
			 2194, 2199, 2201, 2204, 3562, 2218, 2228, 2231, 2234, 2237,
			 2240, 2243, 3559, 2246, 2251, 2252, 2255, 3560, 2258, 2261,
			 2264, 2267, 2270, 2273, 2276, 2279, 2282, 2332, 2337, 2287,
			 2290, 2293, 2296, 2299, 2302, 2306, 3606, 2344, 2317, 2320,
			 2323, 2326, 2330, 2333, 2336, 2348, 2351, 2393, 2358, 2361,
			 2364, 2367, 2370, 2373, 2376, 2379, 2382, 2385, 2388, 2391,
			 2394, 2397, 2400, 2403, 2406, 2409, 2412, 2415, 2418, 3570,
			 3597, 3581, 3567,    0,    0, 3588, 3576, 3560, 1367, 3559, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3560, 3557, 3551, 3551, 3563, 3557, 3549, 3556, 3545, 3571,
			 2452, 3559, 3546,    0, 2422, 2426, 2429, 2432, 2435, 2438,
			 4553, 2479, 3529, 4553, 3528, 2444, 2454, 2457, 2460, 2463,
			 2466, 2469, 2472, 2475, 2478, 2481, 2484, 2487, 2490, 2493,
			 2496, 2499, 2502, 2505, 3524, 2508, 2339, 2510, 2513, 3525,
			 2516, 2519, 2522, 2525, 2528, 2531, 4553, 2572, 3525, 4553,
			 3524, 2537, 2547, 2550, 2553, 2556, 2559, 2562, 2565, 2568,
			 2571, 2574, 2577, 3548, 2618, 2654, 2690, 2583, 3519, 2593,
			 2596, 2597, 2600, 3520, 2603, 2606, 2609, 2612, 2619, 2629,
			 2639, 2726, 2762, 2662, 2798, 2634, 2637, 2640, 2673, 2676,

			 2679, 2682, 2691, 2701,    6, 2743, 2708, 2711, 2714, 2717,
			 2720, 2727, 2737, 2740, 2743, 2785, 2750, 2753, 2756, 2763,
			 2773, 2776, 2779, 2782, 2785, 2788, 2791, 2796, 2799, 2802,
			 2805, 2808, 2811, 2814, 2841, 2817, 3517, 2820, 2657, 2684,
			 2825, 3512, 2828, 2831, 2834, 2839, 3509, 2842, 2845, 2846,
			 2849, 3510, 2852, 2855, 2858, 2861, 2864, 2867, 2870, 2873,
			 2876, 2879, 2882, 2885, 3525,  542,    0, 3524, 3530, 3523,
			 3528, 3511, 3529,    0, 3517, 3523, 3523, 1602, 3530, 3503,
			 3493, 3494, 3496, 2919, 3496, 3482, 3469, 3482, 2889, 2893,
			 2896, 2937, 3441, 4553, 3440, 2902, 2912, 2915, 2918, 2921, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2924, 2927, 2930, 2933, 2936, 2939, 2942, 2983, 3439, 4553,
			 3438, 3463, 2955, 3004, 3040, 2976, 3076, 2987, 2990, 2993,
			 2996, 3005, 3015, 3018, 3021, 3024, 3112, 3148, 3184, 3027,
			 3030, 3033, 3041, 3051, 3054, 3057, 3060, 3063, 3066, 3069,
			 3077, 3119, 3087, 3090, 3093, 3096, 3102, 3105, 3113, 3123,
			 3126, 3129, 3132, 3135,    0, 3447, 3447, 3431, 3433, 3415,
			 3442, 3419, 3404,    0,    0, 3430, 3388, 3408, 3169, 3396,
			    0, 3387, 3376, 3387, 3374, 3369, 3381,    0, 3380, 3352,
			 3340, 3139, 3149, 3159, 3333, 3332, 3356, 3220, 3256, 3292,
			 3162, 3165, 3168, 3192, 3328, 3364, 1282, 3171, 3174, 3177,

			 3203, 3206, 3209, 3336, 3338,    0, 3328, 3319, 3022,    0,
			 3316, 3322, 3311, 3243, 3316, 3303, 3298, 3316, 3296, 3280,
			 3286, 3282, 3292, 3288, 3232, 3225, 3224, 3216, 4553, 3228,
			 3400, 3436, 3472, 3508, 3241, 3227,    0,    0, 3213, 3215,
			 3200, 3209, 3169, 3173, 3160, 3121, 3126,    0, 4553,    0,
			 3122, 3120, 3061, 3067,    0, 3001, 2980, 2973, 2972, 3544,
			 3580, 3616, 3652, 2976, 2928, 2851, 2841,    0, 2780, 2748,
			 2707, 2691, 2673, 2662, 2603, 2571, 2465, 2278, 2222, 2208,
			 2173, 2094, 3688, 3724, 3760, 3796, 1997, 1983, 1984, 1958,
			    0,    0, 1832,    4, 1813, 1814, 1788, 1767,    0, 1645, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_base_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3832, 3868, 3264, 3300, 1644, 1639, 1629, 1584, 1524, 1493,
			 1451, 1455,    0, 1432, 1434, 3336, 3372, 1397, 1362, 1336,
			 1310, 1267,    1,    0, 1200, 1084, 1062, 1004,  951,  939,
			  911,    0,  875,  868,  775,  692,  682,    0,  681,  649,
			  564,  499,  472,    0,  285,  158,  150,   94,   84,    0,
			    0,   69,   42,    0,    8,    0, 4553, 3918, 3934, 3950,
			 3966, 3982, 3998, 4014, 4030, 4046, 4062, 4078, 4094, 4110,
			 3288, 3320, 2994, 4126, 4142, 4157, 4172, 3286, 4188, 3325,
			 4203, 3356, 4218, 4233, 4247, 4262, 4278, 4294, 4309, 4324,
			 3293, 4340, 4355, 4370, 4385, 4400, 4415, 4430, 3361, 3363,

			 4445, 4460, 3392, 3394, 4475, 4490, 4505, 4521, 4536, 3428,
			 3430, 3432, 3440, 3456, 3458, 3460, 3467, 3469, 3471, 3492,
			 3494, 3496, 3503, 3505, 3507, 3528, 3530, 3532, 3539, yy_Dummy>>,
			1, 129, 1200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1328)
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
			    0, 1257, 1257, 1258, 1258, 1259, 1259, 1260, 1260, 1256,
			    9, 1261, 1261, 1256,   13,   13,   13, 1262, 1262, 1263,
			 1263, 1256,   21, 1264, 1264, 1265, 1265, 1266, 1266, 1267,
			 1267, 1268, 1268, 1256,   33, 1269, 1269, 1256, 1256, 1256,
			 1256, 1256, 1270, 1271, 1256, 1256, 1256, 1256, 1256, 1256,
			 1272, 1256, 1256, 1273, 1273, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1274, 1274, 1275, 1256, 1276, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1278, 1256, 1256, 1256, 1256,

			 1256, 1279, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1280, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1281, 1282, 1256, 1256, 1283, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1284, 1256, 1256, 1284, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1285, 1286,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1287,
			 1280, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1288, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1289, 1280, 1290, 1256, 1256, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1291, 1291, 1292, 1293, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1294, 1256, 1270, 1270, 1270,
			 1270, 1256, 1271, 1256, 1295, 1256, 1272, 1256, 1273, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1274, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1275, 1256, 1275, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1276, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1296,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1278, 1256, 1256, 1297, 1279, 1256,

			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1298, 1299, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1300, 1281, 1282,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1283, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1284, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1301, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1302,
			 1303, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1288,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1289, 1289, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1290, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1291, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1292, 1256, 1292, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1293, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1304,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1270, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,

			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1305, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1306, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1289, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1289,
			 1289,  680, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,

			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1270, 1307, 1256,
			 1256, 1256, 1256, 1256, 1256, 1308, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1309, 1256, 1310, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1311, 1256,
			 1312, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256,  680,  680,  680, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1289,  680,  680, 1289,  680, 1256, 1256, 1256, 1256, 1256,

			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1270, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1256, 1256,
			 1256, 1256, 1313, 1256, 1314, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 200, 800)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1315, 1256,
			 1316, 1256, 1289,  680,  680, 1289,  680, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256,  680,  680,  680, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1270, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1317,
			 1318, 1256, 1256, 1256, 1319, 1320, 1256,  680,  680,  680,
			 1256, 1256, 1256, 1289,  680,  680, 1270, 1256, 1256, 1256,

			 1256, 1256, 1256, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1321, 1322, 1323, 1324, 1256, 1289,
			  680,  680,  680,  680, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1256, 1277,
			 1277, 1277, 1277, 1277, 1277, 1325, 1326, 1327, 1328,  680,
			  680,  680,  680, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1256, 1256,
			 1256, 1256,  680,  680,  680,  680, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_def_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  680,  680, 1289, 1289, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1289, 1289, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277,    0, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,

			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, 1256, yy_Dummy>>,
			1, 129, 1200)
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
			    0,   64,   64,   64,   64,   64,   64,   64,   64,    1,
			    2,   64,   64,    3,   64,   64,   64,   64,   64,   64,
			   64,   64,   64,   64,   64,   64,   64,   64,   64,   64,
			   64,   64,    1,   64,    4,   64,    5,    6,   64,    7,
			    8,    9,   10,   11,   12,   13,    9,   14,   15,   15,
			   16,   15,   15,   15,   15,   15,   17,   17,   18,   64,
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
			   56,   56,   56,   56,   56,   56,   64, yy_Dummy>>,
			1, 57, 200)
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
			create an_array.make_filled (0, 0, 1256)
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
			    0,   62,   62,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  123,  123,  134,   10,    1,
			    2,   10,    9,    7,   71,   64,   65,   71,   70,   67,
			   68,   69,   71,  130,  130,  131,  131,  131,  131,  131,
			  131,  131,  131,   11,   11,   15,   15,   15,   15,  131,
			  131,  131,  131,  131,  131,  131,   15,   56,   21,   55,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   62,   63,   20,   17,   19,

			   20,   18,  131,  131,  131,  131,  131,  131,  131,   98,
			   94,   99,   96,   95,   97,  100,  102,  101,  100,  131,
			  131,  131,  131,  131,  131,  131,   93,   87,   88,   90,
			   89,   93,   91,   92,  122,  120,  121,  119,  131,  131,
			  131,  131,  131,  131,  131,   60,   59,   61,   60,  131,
			  131,  131,  131,  131,  131,  131,  113,  114,  113,  113,
			  131,  131,  131,  131,  131,  131,  131,  116,  118,  116,
			  116,  117,  131,  131,  131,  131,  131,  131,  131,   58,
			  132,   58,   86,   84,   85,   74,   86,   83,   83,   86,
			   81,   86,   77,  131,  131,  131,  131,  131,  131,  131, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  123,  123,  127,  127,  127,  128,  129,  131,  131,  131,
			  131,  131,  131,  131,    1,    1,    8,    9,    9,    4,
			    5,    0,    7,   64,   64,   71,    0,   66,  130,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   11,    0,    0,    0,    0,    0,    0,    0,
			    0,   12,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   14,
			    0,    0,    0,    0,    0,    0,   16,   21,   21,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   62,   63,   17,   17,   18,   20,

			    0,    0,    0,    0,    0,    0,   94,   95,  103,  103,
			  103,  103,    0,    0,    0,    0,    0,    0,    0,  100,
			    0,    0,    0,    0,    0,    0,   87,   87,   92,  122,
			    0,    0,    0,    0,    0,    0,    0,  119,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   60,    0,    0,    0,    0,    0,    0,    0,   59,
			   59,    0,    0,    0,    0,    0,    0,  107,  107,  107,
			  107,    0,    0,    0,    0,    0,    0,    0,  111,  112,
			    0,    0,    0,    0,    0,    0,    0,  113,    0,    0,
			    0,    0,    0,    0,  115,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  116,    0,    0,    0,    0,    0,    0,    0,
			   57,    0,    0,    0,    0,    0,    0,    0,   84,   75,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   86,    0,    0,    0,    0,
			    0,    0,  123,    0,    0,    0,    0,    0,    0,    0,
			    0,  124,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  126,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    9,    3,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   13,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   21,    0,    0,
			    0,    0,    0,    0,    0,   56,   56,   56,   56,   30,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  104,
			  106,    0,  105,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   59,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  108,  110,    0,  109,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   73,   72,    0,
			    0,   80,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   78,   79,   76,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  125,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    9,    0,    0,
			    0,    0,    0,    0,    0,   66,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   56,
			   56,   56,   56,   32,   38,   56,   56,   56,   56,   56, yy_Dummy>>,
			1, 200, 600)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   52,    0,    0,    0,    0,    0,    0,
			  104,  106,    0,  105,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  108,  110,    0,  109,
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
			    0,    0,    0,    0,   56,   56,   26,   56,   56,   56,
			   56,   56,   56,   31,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,    0,    0,
			    0,  106,    0,  106,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 800)
		end

	yy_accept_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,  110,    0,  110,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    9,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,   22,   56,   56,   56,   56,   56,
			   56,   56,   56,   33,   39,   56,   56,   56,   56,   56,
			   53,   56,   56,   56,   56,   56,   56,   36,   56,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    6,    0,    0,    0,

			    0,    0,    0,   56,   56,   28,   56,   56,   56,   27,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   50,    0,    0,    0,    0,   82,    0,
			    0,    0,    0,    0,   56,   56,   34,   23,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   37,   54,   40,
			   56,   56,   56,   56,   51,    0,    0,    0,    0,    0,
			    0,    0,    0,   56,   56,   56,   56,   29,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,    0,    0,
			    0,    0,    0,    0,    0,    0,   56,   56,   56,   56,
			   35,   41,   56,   56,   56,   56,   56,   56,   42,   56, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_accept_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,   56,   56,   56,   56,   56,   56,
			   56,   56,   44,   56,   56,    0,    0,   56,   56,   56,
			   56,   56,   56,   43,   56,   56,   56,   56,   56,   56,
			   56,   45,   56,   56,   56,   56,   56,   24,   56,   56,
			   56,   56,   56,   46,   56,   56,   56,   56,   56,   48,
			   25,   56,   56,   47,   56,   49,    0, yy_Dummy>>,
			1, 57, 1200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4553
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1256
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1257
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 64
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

	yyNb_rules: INTEGER = 133
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 134
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
