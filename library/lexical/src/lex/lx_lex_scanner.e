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
			Result := (INITIAL <= sc and sc <= EIFFEL_VS3)
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
			yy_acclist := yy_acclist_template
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		do
			inspect yy_act
when 1 then
--|#line 69 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 69")
end
-- Separator or comment.
when 2 then
--|#line 70 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 70")
end
line_nb := line_nb + 1
when 3 then
--|#line 71 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 71")
end

					line_nb := line_nb + 1
					eiffel_text_count := 0
					set_start_condition (EIFFEL_BLOCK)
				
when 4 then
--|#line 76 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 76")
end
set_start_condition (SCNAME)
when 5 then
--|#line 77 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 77")
end
set_start_condition (XSCNAME)
when 6 then
--|#line 78 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 78")
end
set_start_condition (OPTION)
when 7 then
--|#line 79 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 79")
end

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
when 8 then
--|#line 84 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 84")
end

					last_token := ENDSECT
					set_start_condition (SECT2)
				
when 9 then
--|#line 88 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 88")
end

					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				
when 10 then
--|#line 92 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 92")
end

					report_directive_expected_error
					set_start_condition (RECOVER1)
				
when 11 then
--|#line 99 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 99")
end
eiffel_more
when 12 then
--|#line 100 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 100")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 13 then
--|#line 104 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 104")
end
eiffel_more
when 14 then
--|#line 105 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 105")
end

					description.eiffel_header.force_last (utf8_text_substring (1, text_count - 2))
					set_start_condition (INITIAL)
				
when 15 then
--|#line 112 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 112")
end
-- Separator or comment.
when 16 then
--|#line 113 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 113")
end
add_new_start_condition (text, start_condition = XSCNAME)
when 17 then
--|#line 114 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 114")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 18 then
--|#line 118 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 118")
end

					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				
when 19 then
--|#line 125 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 125")
end
-- Separator or comment.
when 20 then
--|#line 126 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 126")
end
description.set_backing_up_report (True)
when 21 then
--|#line 127 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 127")
end
description.set_backing_up_report (False)
when 22 then
--|#line 128 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 128")
end

					description.set_case_insensitive (False)
				
when 23 then
--|#line 131 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 131")
end

					description.set_case_insensitive (True)
				
when 24 then
--|#line 134 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 134")
end
description.set_debug_mode (True)
when 25 then
--|#line 135 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 135")
end
description.set_debug_mode (False)
when 26 then
--|#line 136 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 136")
end
description.set_no_default_rule (False)
when 27 then
--|#line 137 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 137")
end
description.set_no_default_rule (True)
when 28 then
--|#line 138 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 138")
end
description.set_equiv_classes_used (True)
when 29 then
--|#line 139 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 139")
end
description.set_equiv_classes_used (False)
when 30 then
--|#line 140 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 140")
end
description.set_full_table (True)
when 31 then
--|#line 141 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 141")
end
description.set_full_table (False)
when 32 then
--|#line 142 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 142")
end
description.set_meta_equiv_classes_used (True)
when 33 then
--|#line 143 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 143")
end
description.set_meta_equiv_classes_used (False)
when 34 then
--|#line 144 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 144")
end
description.set_reject_used (True)
when 35 then
--|#line 145 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 145")
end
description.set_reject_used (False)
when 36 then
--|#line 146 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 146")
end
description.set_line_used (True)
when 37 then
--|#line 147 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 147")
end
description.set_line_used (False)
when 38 then
--|#line 148 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 148")
end
description.set_position_used (True)
when 39 then
--|#line 149 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 149")
end
description.set_position_used (False)
when 40 then
--|#line 150 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 150")
end
description.set_pre_action_used (True)
when 41 then
--|#line 151 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 151")
end
description.set_pre_action_used (False)
when 42 then
--|#line 152 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 152")
end
description.set_post_action_used (True)
when 43 then
--|#line 153 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 153")
end
description.set_post_action_used (False)
when 44 then
--|#line 154 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 154")
end
description.set_pre_eof_action_used (True)
when 45 then
--|#line 155 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 155")
end
description.set_pre_eof_action_used (False)
when 46 then
--|#line 156 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 156")
end
description.set_post_eof_action_used (True)
when 47 then
--|#line 157 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 157")
end
description.set_post_eof_action_used (False)
when 48 then
--|#line 158 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 158")
end

					description.set_utf8_mode (True)
				
when 49 then
--|#line 161 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 161")
end

					description.set_no_warning (False)
				
when 50 then
--|#line 164 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 164")
end

					description.set_no_warning (True)
				
when 51 then
--|#line 167 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 167")
end
set_start_condition (OUTFILE)
when 52 then
--|#line 169 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 169")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 53 then
--|#line 173 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 173")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 54 then
--|#line 177 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 177")
end

					report_unrecognized_option_error (character_text)
					set_start_condition (RECOVER1)
			
when 55 then
--|#line 184 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 184")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 56 then
--|#line 188 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 188")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 57 then
--|#line 196 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 196")
end
-- Separates name and definition.
when 58 then
--|#line 197 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 197")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, unicode_text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 59 then
--|#line 204 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 204")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 60 then
--|#line 212 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 212")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 61 then
--|#line 216 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 216")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 62 then
--|#line 229 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 229")
end
-- Separator or comment.
when 63 then
--|#line 230 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 230")
end
line_nb := line_nb + 1
when 64 then
--|#line 231 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 231")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 65 then
--|#line 235 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 235")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 66 then
--|#line 244 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 244")
end
last_token := Left_brace_code
when 67 then
--|#line 245 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 245")
end
last_token := Right_brace_code
when 68 then
--|#line 246 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 246")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 69 then
--|#line 250 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 250")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 70 then
--|#line 262 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 262")
end

					if description.utf8_mode then
						last_token := UNICODE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				
when 71 then
--|#line 270 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 270")
end

					if description.utf8_mode then
						last_token := BYTE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				
when 72 then
--|#line 278 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 278")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 73 then
	yy_end := yy_end - 1
--|#line 282 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 282")
end
last_token := Dollar_code
when 74 then
--|#line 283 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 283")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 75 then
--|#line 292 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 292")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 76 then
--|#line 296 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 296")
end

					last_token := CCL_PLUS
				
when 77 then
--|#line 299 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 299")
end

					last_token := CCL_MINUS
				
when 78 then
--|#line 302 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 302")
end

					last_string_32_value := unicode_text
					if attached character_class_with_name (last_string_32_value) as l_character_class then
						last_token := CCL_OP
						last_lx_symbol_class_value := l_character_class
					else
						last_token := CCL_BRACKET
						less (1)
						set_start_condition (FIRSTCCL)
					end
				
when 79 then
--|#line 313 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 313")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 80 then
--|#line 318 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 318")
end
last_token := EOF_OP
when 81 then
--|#line 319 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 319")
end
last_token := text_item (1).code
when 82 then
--|#line 320 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 320")
end

					set_start_condition (ACTION_TEXT)
				
when 83 then
--|#line 323 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 323")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 84 then
--|#line 328 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 328")
end

					last_token := CHAR
					process_single_character
				
when 85 then
--|#line 335 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 335")
end
-- Separator or comment.
when 86 then
--|#line 336 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 336")
end
line_nb := line_nb + 1
when 87 then
--|#line 337 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 337")
end
last_token := Comma_code
when 88 then
--|#line 338 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 338")
end
last_token := Star_code
when 89 then
--|#line 339 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 339")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 90 then
--|#line 343 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 343")
end

					last_token := NAME
					last_string_value := text
				
when 91 then
--|#line 347 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 347")
end

					report_bad_start_condition_error (character_text)
				
when 92 then
--|#line 353 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 353")
end
-- Separator.
when 93 then
--|#line 354 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 354")
end

					if attached text as l_text and then l_text.is_integer then
						last_token := NUMBER
						last_integer_value := l_text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 94 then
--|#line 362 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 362")
end
last_token := Comma_code
when 95 then
--|#line 363 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 363")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 96 then
--|#line 367 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 367")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 97 then
--|#line 372 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 372")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 98 then
--|#line 381 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 381")
end

					last_token := CHAR
					process_single_character
				
when 99 then
--|#line 385 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 385")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 100 then
--|#line 389 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 389")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 101 then
--|#line 398 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 398")
end

					last_token := CHAR
					process_escaped_character
				
when 102 then
--|#line 402 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 402")
end

					last_token := CHAR
					process_octal_character
				
when 103 then
--|#line 406 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 406")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 104 then
--|#line 410 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 410")
end

					last_token := CHAR
					process_unicode_character
				
when 105 then
--|#line 417 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 417")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 106 then
--|#line 422 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 422")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 107 then
--|#line 427 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 427")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 108 then
--|#line 432 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 432")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 109 then
	yy_end := yy_end - 1
--|#line 437 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 437")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 110 then
	yy_end := yy_end - 1
--|#line 441 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 441")
end
last_token := Caret_code
when 111 then
--|#line 442 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 442")
end

					last_token := CHAR
					process_single_character
					set_start_condition (CCL)
				
when 112 then
--|#line 447 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 447")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 113 then
	yy_end := yy_end - 1
--|#line 456 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 456")
end
last_token := Minus_code
when 114 then
--|#line 457 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 457")
end

					last_token := CHAR
					process_single_character
				
when 115 then
--|#line 461 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 461")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 116 then
--|#line 465 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 465")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 117 then
--|#line 474 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 474")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 118 then
--|#line 478 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 478")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 119 then
--|#line 483 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 483")
end

					eiffel_text_count := 0
					set_start_condition (EIFFEL_BLOCK2)
				
when 120 then
--|#line 487 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 487")
end

					last_token := EIF_CODE
					last_string_value := utf8_text
					set_start_condition (SECT2)
				
when 121 then
--|#line 495 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 495")
end
eiffel_more
when 122 then
--|#line 496 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 496")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 123 then
--|#line 500 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 500")
end

					nb_open_brackets := nb_open_brackets + 1
					eiffel_more
				
when 124 then
--|#line 504 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 504")
end

					if nb_open_brackets = 0 then
						last_token := EIF_CODE
						last_string_value := utf8_text_substring (1, text_count - 1)
						set_start_condition (SECT2)
					else
						nb_open_brackets := nb_open_brackets - 1
						eiffel_more
					end
				
when 125 then
--|#line 517 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 517")
end
eiffel_more
when 126 then
--|#line 518 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 518")
end
eiffel_more
when 127 then
--|#line 519 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 519")
end
eiffel_more
when 128 then
--|#line 520 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 520")
end
eiffel_more
when 129 then
--|#line 521 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 521")
end

						-- Multi-line manifest string.
					line_nb := line_nb + 1
					push_start_condition (EIFFEL_MSN)
					eiffel_more
				
when 130 then
--|#line 527 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 527")
end

						-- Verbatim string.
					eiffel_verbatim_marker := unicode_text_substring (eiffel_text_count + 2, text_count - 1)
					eiffel_verbatim_opening_character := unicode_text_item (text_count)
					push_start_condition (EIFFEL_VS1)
					eiffel_more
			
when 131 then
--|#line 537 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 537")
end

					pop_start_condition
					eiffel_more
				
when 132 then
--|#line 541 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 541")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 133 then
--|#line 545 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 545")
end

						-- Syntax error: empty line in middle of
						-- multi-line manifest string.
					line_nb := line_nb + 1
					eiffel_more
				
when 134 then
--|#line 551 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 551")
end

						-- Syntax error: missing character % at beginning
						-- of line in multi-line manifest string.
					pop_start_condition
					eiffel_more
				
when 135 then
--|#line 567 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 567")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_VS2)
					eiffel_more
				
when 136 then
--|#line 572 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 572")
end

						-- Syntax error.
					pop_start_condition
					eiffel_more
				
when 137 then
--|#line 584 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 584")
end

					if is_eiffel_verbatim_string_closer (eiffel_text_count + 1, text_count - 1) then
						eiffel_verbatim_marker := eiffel_no_verbatim_marker
						pop_start_condition
					else
						set_start_condition (EIFFEL_VS3)
					end
					eiffel_more
				
when 138 then
--|#line 593 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 593")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 139 then
--|#line 597 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 597")
end

					set_start_condition (EIFFEL_VS3)
					eiffel_more
				
when 140 then
--|#line 608 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 608")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_VS2)
					eiffel_more
				
when 141 then
--|#line 613 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 613")
end

						-- Syntax error.
					pop_start_condition
					eiffel_more
				
when 142 then
--|#line 628 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 628")
end

					last_token := EIF_CODE
					last_string_value := utf8_text
				
when 143 then
--|#line 634 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 634")
end

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (character_text)
					end
				
when 144 then
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
			inspect yy_sc
when 18 then
--|#line 557 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 557")
end

						-- Syntax error: missing character % at beginning
						-- of line in multi-line manifest string.
					pop_start_condition
				
when 19 then
--|#line 577 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 577")
end

						-- Syntax error.
					pop_start_condition
				
when 20 then
--|#line 601 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 601")
end

						-- Syntax error.
					pop_start_condition
				
when 21 then
--|#line 618 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 618")
end

						-- Syntax error.
					pop_start_condition
				
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2939)
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
			an_array.area.fill_with (647, 2880, 2939)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   47,   48,  130,   47,   63,  131,  256,   64,  130,
			   65,   66,  131,  254,   49,   47,   48,   67,   47,   63,
			  113,   50,   64,  600,   68,   66,  113,  101,   49,  101,
			  102,   67,  102,  432,  432,  152,  153,  152,  152,  628,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   53,   54,  121,   53,  161,   53,
			   54,  161,   53,  114,  115,   60,  103,   55,  103,  114,
			  115,  197,   55,  198,  117,  118,   56,  117,  646,  117,
			  118,   56,  117,  152,  232,  170,  185,  119,  170,  185,

			  204,  207,  119,  204,  207,  208,  208,  208,  208,  208,
			  213,  219,  233,  213,  219,  122,   57,  123,   58,  230,
			   59,   57,  230,   58,  645,   59,   70,   71,   69,   70,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   72,
			   69,   69,   73,   73,   73,   73,   73,   69,   69,   69,
			   69,   73,   74,   75,   76,   77,   78,   73,   73,   73,
			   73,   73,   79,   80,   81,   82,   83,   84,   73,   73,
			   85,   73,   86,   73,   73,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   90,   91,   89,   90,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   92, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   93,
			   93,   93,   93,   93,   93,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   95,   96,  121,   95,
			  237,  178,  238,  179,  148,  149,  148,  148,   97,  125,
			  150,  125,   98,   98,   98,   98,   98,  226,  244,  644,
			  245,  126,  144,  126,  249,   64,  144,  252,   66,   64,
			  231,  231,   66,  231,   67,  210,  210,  210,   67,  148,
			  149,  148,  148,  643,  647,  150,  180,  122,  647,  123,

			  163,  180,   99,   95,   96,  226,   95,  647,  127,  128,
			  127,  128,  148,  211,  161,   97,  212,  161,  641,   98,
			   98,   98,   98,   98,  272,  145,  392,  146,  273,  145,
			  393,  146,  255,  165,  308,  309,  166,  168,  256,  642,
			  168,  167,  647,  294,  294,  294,  647,  148,  168,  170,
			  257,  185,  170,  204,  185,  647,  204,  308,  309,   99,
			  105,  106,  104,  105,  104,  104,  104,  104,  104,  104,
			  107,  104,  108,  109,  104,  104,  104,  104,  104,  104,
			  104,  104,  104,  104,  110,  111,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  104,
			  104,  104,  104,  104,  104,  104,  104,  104,  104,  104,
			  133,  134,  347,  133,  135,  136,  308,  309,  137,  138,
			  138,  138,  348,  641,  138,  138,  152,  153,  152,  152,
			  647,  244,  139,  245,  155,  156,  155,  155,  157,  640,
			  155,  156,  155,  155,  157,  174,  207,  213,  174,  207,
			  213,  222,  222,  222,  639,  210,  210,  210,  258,  140,
			  141,  300,  300,  300,  142,  138,  133,  134,  405,  133,
			  135,  136,  406,  638,  137,  138,  138,  138,  647,  223,
			  138,  138,  224,  211,  152,  158,  212,  178,  139,  322,

			  158,  158,  155,  178,  219,  179,  158,  219,  155,  210,
			  210,  210,  241,  242,  241,  241,  435,  435,  243,  246,
			  247,  246,  246,  647,  230,  140,  141,  230,  637,  439,
			  142,  138,  250,  249,  250,  250,  249,  211,  440,  252,
			  212,  173,  173,  173,  173,  173,  636,  342,  180,  343,
			  353,  353,  353,  180,  208,  208,  208,  208,  208,  450,
			  319,  323,  324,  324,  324,  324,  358,  358,  358,  451,
			  241,  647,  326,  327,  327,  327,  327,  246,  173,  308,
			  309,  172,  635,  251,  433,  433,  433,  634,  251,  633,
			  250,  260,  261,  260,  260,  262,  259,  177,  177,  177, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  177,  259,  259,  259,  259,  259,  263,  259,  259,  259,
			  259,  259,  259,  177,  259,  177,  177,  177,  177,  177,
			  259,  177,  259,  177,  259,  259,  259,  177,  259,  177,
			  259,  259,  177,  177,  177,  177,  177,  259,  259,  259,
			  264,  259,  259,  259,  259,  264,  259,  259,  259,  260,
			  259,  265,  266,  265,  265,  178,  647,  179,  310,  310,
			  310,  647,  632,  647,  308,  309,  239,  239,  239,  239,
			  239,  364,  364,  364,  372,  373,  373,  373,  373,  436,
			  436,  436,  631,  374,  457,  630,  311,  629,  458,  312,
			  430,  431,  431,  431,  431,  473,  473,  498,  628,  365,

			  180,  499,  366,  239,  647,  180,  315,  308,  309,  265,
			  269,  627,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  186,  269,  269,  186,  186,  186,  186,
			  186,  269,  269,  269,  269,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  278,  279,  280,  281,  282,  647,  241,  242,  241,  241,
			  283,  284,  243,  181,  285,  286,  316,  317,  316,  316,
			  287,  246,  247,  246,  246,  250,  249,  250,  250,  520, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  520,  318,  367,  367,  367,  626,  260,  261,  260,  260,
			  325,  266,  325,  325,  243,  527,  265,  266,  265,  265,
			  178,  486,  179,  647,  528,  316,  317,  316,  316,  625,
			  375,  261,  375,  375,  241,  624,  308,  309,  417,  417,
			  417,  474,  474,  474,  316,  376,  251,  308,  309,  246,
			  623,  251,  519,  250,  259,  647,  259,  259,  647,  622,
			  259,  259,  259,  259,  260,  180,  621,  532,  325,  259,
			  180,  533,  308,  309,  265,  620,  259,  619,  259,  259,
			  259,  259,  259,  316,  259,  618,  259,  617,  375,  616,
			  259,  615,  259,  308,  309,  259,  259,  259,  259,  259,

			  177,  324,  324,  324,  324,  324,  181,  327,  327,  327,
			  327,  327,  259,  368,  368,  368,  368,  368,  325,  266,
			  325,  325,  368,  368,  368,  368,  368,  368,  614,  243,
			  373,  373,  373,  373,  373,  647,  262,  613,  380,  375,
			  261,  375,  375,  612,  384,  308,  309,  308,  309,  611,
			  647,  369,  370,  370,  370,  370,  370,  521,  521,  521,
			  610,  370,  370,  370,  370,  370,  370,  428,  429,  324,
			  324,  324,  324,  324,  553,  609,  325,  327,  327,  327,
			  327,  327,  476,  647,  373,  373,  373,  373,  373,  608,
			  371,  177,  324,  324,  324,  324,  324,  375,  647,  177, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  432,  432,  377,  378,  308,  309,  380,  262,  431,  431,
			  431,  431,  431,  605,  384,  177,  433,  433,  433,  308,
			  309,  428,  604,  379,  603,  181,  435,  435,  602,  380,
			  181,  327,  327,  327,  327,  327,  601,  481,  243,  473,
			  473,  381,  382,  599,  598,  480,  181,  436,  436,  436,
			  354,  354,  354,  482,  243,  474,  474,  474,  432,  432,
			  435,  435,  383,  484,  433,  433,  433,  597,  384,  418,
			  418,  418,  418,  418,  596,  595,  517,  361,  418,  418,
			  418,  418,  418,  418,  485,  414,  431,  431,  431,  431,
			  431,  356,  518,  473,  473,  481,  410,  484,  436,  436,

			  436,  482,  474,  474,  474,  520,  520,  419,  420,  420,
			  420,  420,  420,  590,  262,  520,  520,  420,  420,  420,
			  420,  420,  420,  480,  262,  521,  521,  521,  589,  588,
			  517,  521,  521,  521,  587,  485,  295,  295,  295,  518,
			  586,  585,  551,  295,  584,  583,  421,  422,  422,  422,
			  422,  422,  551,  355,  355,  355,  422,  422,  422,  422,
			  422,  422,  552,  164,  173,  173,  173,  173,  552,  164,
			  164,  164,  164,  582,  581,  164,  169,  169,  169,  169,
			  169,  580,  169,  579,  578,  235,  423,  423,  423,  423,
			  423,  356,  356,  356,  577,  423,  423,  423,  423,  423, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  423,  424,  424,  424,  424,  424,  357,  357,  357,  553,
			  424,  424,  424,  424,  424,  424,  243,  373,  373,  373,
			  373,  373,  359,  359,  359,  361,  414,  425,  426,  187,
			  187,  187,  187,  187,  187,  206,  206,  206,  206,  206,
			  356,  206,  410,  215,  215,  215,  215,  215,  427,  215,
			  360,  360,  360,  568,  428,  434,  434,  434,  434,  434,
			  361,  361,  361,  567,  434,  434,  434,  434,  434,  434,
			  467,  467,  467,  467,  467,  362,  362,  362,  566,  467,
			  467,  467,  467,  467,  467,  468,  468,  468,  468,  468,
			  408,  408,  408,  565,  468,  468,  468,  468,  468,  468,

			  469,  469,  469,  469,  469,  412,  412,  412,  564,  469,
			  469,  469,  469,  469,  469,  470,  470,  470,  470,  470,
			  437,  437,  437,  563,  470,  470,  470,  470,  470,  470,
			  471,  471,  471,  471,  471,  410,  410,  410,  562,  471,
			  471,  471,  471,  471,  471,  472,  472,  472,  472,  472,
			  414,  414,  414,  561,  472,  472,  472,  472,  472,  472,
			  262,  431,  431,  431,  431,  431,  560,  559,  297,  297,
			  297,  477,  478,  239,  239,  297,  239,  239,  239,  239,
			  181,  181,  181,  181,  301,  301,  301,  181,  558,  557,
			  181,  301,  479,  475,  475,  475,  556,  555,  480,  177, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  434,  434,  434,  434,  434,  522,  522,  522,  554,  434,
			  434,  434,  434,  434,  434,  303,  303,  303,  409,  409,
			  409,  519,  303,  411,  411,  411,  409,  413,  413,  413,
			  361,  411,  414,  356,  410,  413,  542,  483,  512,  512,
			  512,  512,  512,  541,  540,  539,  538,  512,  512,  512,
			  512,  512,  512,  513,  513,  513,  513,  513,  537,  536,
			  535,  534,  513,  513,  513,  513,  513,  513,  514,  514,
			  514,  514,  514,  531,  530,  529,  526,  514,  514,  514,
			  514,  514,  514,  515,  515,  515,  515,  515,  525,  524,
			  523,  486,  515,  515,  515,  515,  515,  515,  516,  516,

			  516,  516,  516,  259,  511,  361,  414,  516,  516,  516,
			  516,  516,  516,  547,  547,  547,  547,  547,  356,  410,
			  506,  505,  547,  547,  547,  547,  547,  547,  548,  548,
			  548,  548,  548,  504,  503,  502,  501,  548,  548,  548,
			  548,  548,  548,  549,  549,  549,  549,  549,  500,  497,
			  496,  495,  549,  549,  549,  549,  549,  549,  550,  550,
			  550,  550,  550,  494,  493,  492,  491,  550,  550,  550,
			  550,  550,  550,  573,  573,  573,  573,  573,  490,  489,
			  488,  487,  573,  573,  573,  573,  573,  573,  574,  574,
			  574,  574,  574,  466,  361,  414,  356,  574,  574,  574, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  574,  574,  574,  575,  575,  575,  575,  575,  410,  461,
			  460,  459,  575,  575,  575,  575,  575,  575,  576,  576,
			  576,  576,  576,  456,  455,  454,  453,  576,  576,  576,
			  576,  576,  576,  591,  591,  591,  591,  591,  452,  449,
			  448,  447,  591,  591,  591,  591,  591,  591,  592,  592,
			  592,  592,  592,  446,  445,  444,  443,  592,  592,  592,
			  592,  592,  592,  593,  593,  593,  593,  593,  442,  441,
			  438,  416,  593,  593,  593,  593,  593,  593,  594,  594,
			  594,  594,  594,  361,  414,  356,  410,  594,  594,  594,
			  594,  594,  594,  606,  606,  606,  606,  606,  407,  404,

			  403,  402,  606,  606,  606,  606,  606,  606,  607,  607,
			  607,  607,  607,  401,  400,  399,  398,  607,  607,  607,
			  607,  607,  607,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   46,   46,   46,   46,   46,   46,
			   46,   46,   46,   46,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   61,   61,   61,   61,
			   61,   61,   61,   61,   61,   61,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   62,   62,   62,   62,   62,   62,   62,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   87,   87,
			   87,   87,   87,   87,   87,   87,   87,   87,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   94,   94,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  112,  112,  112,  112,  112,  112,  112,  112,  112,
			  112,  116,  116,  116,  116,  116,  116,  116,  116,  116,

			  116,  116,  116,  116,  116,  116,  116,  116,  116,  116,
			  116,  116,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  124,  124,  124,  124,  124,  124,  124,
			  124,  124,  124,  124,  124,  124,  124,  124,  124,  124,
			  124,  124,  124,  124,  129,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  129,  129,  129,  129,  129,  129,
			  129,  129,  129,  129,  129,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  132,  132,  132,  132,
			  132,  132,  132,  132,  132,  132,  143,  143,  143,  143, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  143,  143,  143,  143,  143,  143,  143,  143,  143,  143,
			  143,  143,  143,  143,  143,  143,  143,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  147,  147,
			  147,  147,  147,  147,  147,  147,  147,  147,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  159,  159,  159,  159,  159,  159,  159,

			  159,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  175,  175,  175,  175,  175,  175,  175,  175,
			  175,  175,  176,  397,  176,  396,  395,  394,  176,  176,
			  391,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  177,  390,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  177,
			  177,  177,  177,  177,  181,  389,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  181,  181,  181,  181,  181,
			  181,  181,  181,  181,  181,  202,  202,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  202,  202,  202,  202,  202,  202,  209,  388,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  216,  387,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  217,  386,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  218,
			  385,  363,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  221,  352,  221,  221,  221,  221,  221,  221,  221,  221,

			  221,  221,  221,  221,  221,  221,  221,  221,  221,  221,
			  221,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  225,  225,  225,  225,  225,  225,  225,  225,
			  225,  225,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  227,  227,  227,  227,  227,  351,  227,  227,  227,
			  227,  227,  227,  228,  350,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  228,  228,  228,
			  228,  349,  346,  228,  235,  345,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  235,  235,  235,  235,  235,
			  235,  235,  235,  235,  235,  240,  344,  240,  341,  240, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  340,  240,  240,  339,  240,  240,  240,  240,  240,  240,
			  240,  338,  337,  240,  240,  240,  243,  336,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  243,  243,  243,
			  243,  243,  243,  243,  243,  243,  243,  248,  248,  248,
			  335,  248,  248,  248,  248,  248,  248,  248,  248,  248,
			  248,  248,  248,  248,  248,  248,  248,  248,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,
			  253,  253,  253,  253,  253,  253,  253,  253,  253,  253,

			  162,  334,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  162,  162,  162,  162,  162,  162,  162,  162,  162,
			  162,  171,  333,  171,  171,  171,  171,  171,  171,  171,
			  171,  171,  171,  171,  171,  171,  171,  171,  171,  171,
			  171,  171,  183,  332,  183,  183,  183,  183,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  183,  183,  205,  331,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  214,  330,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  214,  214,  214,  214,  214,  220,  329,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  220,  220,  220,  220,
			  220,  220,  220,  220,  220,  220,  243,  243,  243,  243,
			  243,  243,  243,  415,  415,  415,  243,  328,  321,  243,
			  320,  415,  249,  314,  313,  243,  262,  307,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  262,  262,  262,
			  262,  262,  262,  262,  262,  262,  262,  269,  306,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  299,  305,
			  299,  299,  299,  299,  299,  299,  299,  299,  299,  299,

			  299,  299,  299,  299,  299,  299,  299,  299,  299,  320,
			  320,  320,  320,  320,  320,  320,  320,  320,  320,  320,
			  320,  320,  320,  320,  320,  320,  320,  320,  320,  320,
			  321,  229,  321,  321,  321,  321,  321,  321,  321,  321,
			  321,  321,  321,  321,  321,  321,  321,  321,  321,  321,
			  321,  262,  262,  262,  262,  262,  262,  262,  462,  462,
			  462,  262,  304,  302,  262,  299,  462,  463,  463,  463,
			  262,  464,  464,  464,  298,  463,  465,  465,  465,  464,
			  507,  507,  507,  296,  465,  508,  508,  508,  507,  509,
			  509,  509,  203,  508,  510,  510,  510,  509,  543,  543, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  543,  293,  510,  544,  544,  544,  543,  545,  545,  545,
			  292,  544,  546,  546,  546,  545,  569,  569,  569,  291,
			  546,  570,  570,  570,  569,  571,  571,  571,  290,  570,
			  572,  572,  572,  571,  289,  288,  277,  276,  572,  275,
			  274,  271,  270,  268,  267,  254,  249,  236,  234,  229,
			  220,  214,  205,  203,  201,  200,  199,  196,  195,  194,
			  193,  192,  191,  190,  189,  188,  186,  184,  183,  182,
			  174,  172,  171,  162,  647,  160,  160,   88,   88,   45, yy_Dummy>>,
			1, 80, 2800)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2939)
			yy_chk_template_1 (an_array)
			an_array.area.fill_with (9, 126, 185)
			an_array.area.fill_with (13, 186, 245)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (21, 360, 419)
			yy_chk_template_3 (an_array)
			an_array.area.fill_with (179, 591, 650)
			yy_chk_template_4 (an_array)
			an_array.area.fill_with (186, 712, 769)
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
			an_array.area.fill_with (647, 2879, 2939)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,   31,    1,    7,   31,  320,    7,   32,
			    7,    7,   32,  253,    1,    2,    2,    7,    2,    8,
			   23,    2,    8,  584,    8,    8,   24,   19,    2,   20,
			   19,    8,   20,  377,  377,   39,   39,   39,   39,  645,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    3,    3,   27,    3,   47,    4,
			    4,   47,    4,   23,   23,    4,   19,    3,   20,   24,
			   24,   83,    4,   83,   25,   25,    3,   25,  643,   26,
			   26,    4,   26,   39,  137,   53,   70,   25,   53,   70,

			   90,   95,   26,   90,   95,   98,   98,   98,   98,   98,
			  105,  117,  137,  105,  117,   27,    3,   27,    3,  133,
			    3,    4,  133,    4,  642,    4, yy_Dummy>>,
			1, 126, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   17,   17,   28,   17,  142,   64,  142,   64,   37,   37,
			   37,   37,   17,   29,   37,   30,   17,   17,   17,   17,
			   17,  123,  150,  639,  150,   29,   35,   30,  158,   35,
			   36,  158,   35,   36,  136,  136,   36,  136,   35,  103,
			  103,  103,   36,   38,   38,   38,   38,  638,  164,   38,
			   64,   28,  165,   28,   50,   64,   17,   18,   18,  123,
			   18,  166,   29,   29,   30,   30,   37,  103,  161,   18,
			  103,  161,  637,   18,   18,   18,   18,   18,  190,   35,
			  337,   35,  190,   36,  337,   36,  165,   50,  235,  235,
			   50,  168,  168,  636,  168,   50,  164,  210,  210,  210,

			  165,   38,   50,  170,  168,  185,  170,  204,  185,  166,
			  204,  367,  367,   18, yy_Dummy>>,
			1, 114, 246)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   33,   33,  289,   33,   33,   33,  370,  370,   33,   33,
			   33,   33,  289,  635,   33,   33,   40,   40,   40,   40,
			  167,  243,   33,  243,   41,   41,   41,   41,   41,  633,
			   42,   42,   42,   42,   42,  174,  207,  213,  174,  207,
			  213,  122,  122,  122,  632,  127,  127,  127,  174,   33,
			   33,  222,  222,  222,   33,   33,   34,   34,  349,   34,
			   34,   34,  349,  631,   34,   34,   34,   34,  167,  122,
			   34,   34,  122,  127,   40,   41,  127,  262,   34,  262,
			   41,   42,   41,  177,  219,  177,   42,  219,   42,  141,
			  141,  141,  148,  148,  148,  148,  381,  381,  148,  152,

			  152,  152,  152,  255,  230,   34,   34,  230,  630,  386,
			   34,   34,  155,  155,  155,  155,  251,  141,  386,  251,
			  141,  173,  173,  173,  173,  173,  629,  285,  177,  285,
			  294,  294,  294,  177,  208,  208,  208,  208,  208,  398,
			  255,  263,  263,  263,  263,  263,  300,  300,  300,  398,
			  148,  255,  268,  268,  268,  268,  268,  152,  173,  417,
			  417,  173,  627,  155,  378,  378,  378,  626,  155,  625,
			  155, yy_Dummy>>,
			1, 171, 420)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  180,  180,  180,  180,  180,  319,  180,  236,  236,  236,
			  239,  624,  239,  420,  420,  239,  239,  239,  239,  239,
			  308,  308,  308,  318,  318,  318,  318,  318,  382,  382,
			  382,  623,  319,  404,  621,  236,  620,  404,  236,  376,
			  376,  376,  376,  376,  425,  425,  452,  619,  308,  180,
			  452,  308,  239,  319,  180,  239,  470,  470,  180,  186,
			  618, yy_Dummy>>,
			1, 61, 651)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  195,  195,  195,  195,  195,  476,  241,  241,  241,  241,
			  195,  195,  241,  437,  195,  195,  245,  245,  245,  245,
			  195,  246,  246,  246,  246,  250,  250,  250,  250,  477,
			  477,  245,  310,  310,  310,  617,  260,  260,  260,  260,
			  264,  264,  264,  264,  475,  492,  265,  265,  265,  265,
			  265,  437,  265,  476,  492,  316,  316,  316,  316,  616,
			  322,  322,  322,  322,  241,  615,  310,  310,  364,  364,
			  364,  426,  426,  426,  245,  322,  250,  512,  512,  246,
			  613,  250,  475,  250,  259,  259,  259,  259,  259,  612,
			  259,  259,  259,  259,  260,  265,  611,  497,  264,  259,

			  265,  497,  364,  364,  265,  610,  259,  609,  259,  259,
			  259,  259,  259,  316,  259,  608,  259,  605,  322,  604,
			  259,  602,  259,  593,  593,  259,  259,  259,  259,  259,
			  324,  324,  324,  324,  324,  324,  327,  327,  327,  327,
			  327,  327,  259,  311,  311,  311,  311,  311,  325,  325,
			  325,  325,  311,  311,  311,  311,  311,  311,  601,  373,
			  373,  373,  373,  373,  373,  374,  522,  600,  324,  375,
			  375,  375,  375,  599,  327,  594,  594,  311,  311,  598,
			  429,  311,  312,  312,  312,  312,  312,  478,  478,  478,
			  597,  312,  312,  312,  312,  312,  312,  373,  374,  380, yy_Dummy>>,
			1, 200, 770)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  380,  380,  380,  380,  522,  596,  325,  384,  384,  384,
			  384,  384,  429,  374,  428,  428,  428,  428,  428,  595,
			  312,  323,  323,  323,  323,  323,  323,  375,  429,  432,
			  432,  432,  323,  323,  606,  606,  380,  431,  431,  431,
			  431,  431,  431,  590,  384,  433,  433,  433,  433,  607,
			  607,  428,  588,  323,  587,  435,  435,  435,  586,  323,
			  326,  326,  326,  326,  326,  326,  585,  432,  473,  473,
			  473,  326,  326,  583,  580,  431,  436,  436,  436,  436,
			  706,  706,  706,  433,  474,  474,  474,  474,  481,  481,
			  484,  484,  326,  435,  482,  482,  482,  579,  326,  365,

			  365,  365,  365,  365,  578,  577,  473,  572,  365,  365,
			  365,  365,  365,  365,  436,  571,  480,  480,  480,  480,
			  480,  570,  474,  517,  517,  481,  569,  484,  485,  485,
			  485,  482,  518,  518,  518,  551,  551,  365,  366,  366,
			  366,  366,  366,  568,  520,  520,  520,  366,  366,  366,
			  366,  366,  366,  480,  521,  521,  521,  521,  567,  566,
			  517,  552,  552,  552,  565,  485,  697,  697,  697,  518,
			  564,  563,  551,  697,  562,  561,  366,  368,  368,  368,
			  368,  368,  520,  707,  707,  707,  368,  368,  368,  368,
			  368,  368,  521,  666,  668,  668,  668,  668,  552,  666, yy_Dummy>>,
			1, 200, 970)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  666,  666,  666,  560,  559,  666,  667,  667,  667,  667,
			  667,  557,  667,  556,  555,  368,  369,  369,  369,  369,
			  369,  708,  708,  708,  554,  369,  369,  369,  369,  369,
			  369,  371,  371,  371,  371,  371,  709,  709,  709,  553,
			  371,  371,  371,  371,  371,  371,  372,  372,  372,  372,
			  372,  372,  711,  711,  711,  546,  545,  372,  372,  673,
			  673,  673,  673,  673,  673,  675,  675,  675,  675,  675,
			  544,  675,  543,  677,  677,  677,  677,  677,  372,  677,
			  712,  712,  712,  542,  372,  379,  379,  379,  379,  379,
			  713,  713,  713,  541,  379,  379,  379,  379,  379,  379,

			  418,  418,  418,  418,  418,  714,  714,  714,  540,  418,
			  418,  418,  418,  418,  418,  419,  419,  419,  419,  419,
			  718,  718,  718,  539,  419,  419,  419,  419,  419,  419,
			  421,  421,  421,  421,  421,  721,  721,  721,  535,  421,
			  421,  421,  421,  421,  421,  422,  422,  422,  422,  422,
			  724,  724,  724,  534,  422,  422,  422,  422,  422,  422,
			  423,  423,  423,  423,  423,  725,  725,  725,  533,  423,
			  423,  423,  423,  423,  423,  424,  424,  424,  424,  424,
			  728,  728,  728,  532,  424,  424,  424,  424,  424,  424,
			  430,  430,  430,  430,  430,  430,  531,  530,  698,  698, yy_Dummy>>,
			1, 200, 1170)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  698,  430,  430,  686,  686,  698,  686,  686,  686,  686,
			  694,  694,  694,  694,  701,  701,  701,  694,  529,  528,
			  694,  701,  430,  731,  731,  731,  527,  524,  430,  434,
			  434,  434,  434,  434,  434,  736,  736,  736,  523,  434,
			  434,  434,  434,  434,  434,  702,  702,  702,  719,  719,
			  719,  519,  702,  720,  720,  720,  719,  722,  722,  722,
			  510,  720,  509,  508,  507,  722,  506,  434,  467,  467,
			  467,  467,  467,  505,  504,  503,  502,  467,  467,  467,
			  467,  467,  467,  468,  468,  468,  468,  468,  501,  500,
			  499,  498,  468,  468,  468,  468,  468,  468,  469,  469,

			  469,  469,  469,  496,  495,  494,  491,  469,  469,  469,
			  469,  469,  469,  471,  471,  471,  471,  471,  490,  488,
			  487,  486,  471,  471,  471,  471,  471,  471,  472,  472,
			  472,  472,  472,  483,  466,  465,  464,  472,  472,  472,
			  472,  472,  472,  513,  513,  513,  513,  513,  463,  462,
			  460,  459,  513,  513,  513,  513,  513,  513,  514,  514,
			  514,  514,  514,  458,  457,  456,  455,  514,  514,  514,
			  514,  514,  514,  515,  515,  515,  515,  515,  453,  451,
			  450,  449,  515,  515,  515,  515,  515,  515,  516,  516,
			  516,  516,  516,  446,  445,  444,  443,  516,  516,  516, yy_Dummy>>,
			1, 200, 1370)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  516,  516,  516,  547,  547,  547,  547,  547,  442,  441,
			  440,  439,  547,  547,  547,  547,  547,  547,  548,  548,
			  548,  548,  548,  416,  415,  413,  411,  548,  548,  548,
			  548,  548,  548,  549,  549,  549,  549,  549,  409,  407,
			  406,  405,  549,  549,  549,  549,  549,  549,  550,  550,
			  550,  550,  550,  403,  402,  401,  400,  550,  550,  550,
			  550,  550,  550,  573,  573,  573,  573,  573,  399,  397,
			  396,  395,  573,  573,  573,  573,  573,  573,  574,  574,
			  574,  574,  574,  393,  392,  391,  390,  574,  574,  574,
			  574,  574,  574,  575,  575,  575,  575,  575,  389,  388,

			  385,  363,  575,  575,  575,  575,  575,  575,  576,  576,
			  576,  576,  576,  362,  360,  357,  355,  576,  576,  576,
			  576,  576,  576,  591,  591,  591,  591,  591,  350,  348,
			  347,  346,  591,  591,  591,  591,  591,  591,  592,  592,
			  592,  592,  592,  345,  344,  343,  342,  592,  592,  592,
			  592,  592,  592,  648,  648,  648,  648,  648,  648,  648,
			  648,  648,  648,  648,  648,  648,  648,  648,  648,  648,
			  648,  648,  648,  648,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  649,  649,  649,  649,  649,  649,  649,
			  649,  649,  649,  649,  649,  650,  650,  650,  650,  650, yy_Dummy>>,
			1, 200, 1570)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  650,  650,  650,  650,  650,  650,  650,  650,  650,  650,
			  650,  650,  650,  650,  650,  650,  651,  651,  651,  651,
			  651,  651,  651,  651,  651,  651,  651,  651,  651,  651,
			  651,  651,  651,  651,  651,  651,  651,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  652,  652,
			  652,  652,  652,  652,  652,  652,  652,  652,  653,  653,
			  653,  653,  653,  653,  653,  653,  653,  653,  653,  653,
			  653,  653,  653,  653,  653,  653,  653,  653,  653,  654,
			  654,  654,  654,  654,  654,  654,  654,  654,  654,  654,
			  654,  654,  654,  654,  654,  654,  654,  654,  654,  654,

			  655,  655,  655,  655,  655,  655,  655,  655,  655,  655,
			  655,  655,  655,  655,  655,  655,  655,  655,  655,  655,
			  655,  656,  656,  656,  656,  656,  656,  656,  656,  656,
			  656,  656,  656,  656,  656,  656,  656,  656,  656,  656,
			  656,  656,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  657,  657,  657,  657,  657,  657,  657,
			  657,  657,  657,  658,  658,  658,  658,  658,  658,  658,
			  658,  658,  658,  658,  658,  658,  658,  658,  658,  658,
			  658,  658,  658,  658,  659,  659,  659,  659,  659,  659,
			  659,  659,  659,  659,  659,  659,  659,  659,  659,  659, yy_Dummy>>,
			1, 200, 1770)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  659,  659,  659,  659,  659,  660,  660,  660,  660,  660,
			  660,  660,  660,  660,  660,  660,  660,  660,  660,  660,
			  660,  660,  660,  660,  660,  660,  661,  661,  661,  661,
			  661,  661,  661,  661,  661,  661,  661,  661,  661,  661,
			  661,  661,  661,  661,  661,  661,  661,  662,  662,  662,
			  662,  662,  662,  662,  662,  662,  662,  662,  662,  662,
			  662,  662,  662,  662,  662,  662,  662,  662,  663,  663,
			  663,  663,  663,  663,  663,  663,  663,  663,  663,  663,
			  663,  663,  663,  663,  663,  663,  663,  663,  663,  664,
			  664,  664,  664,  664,  664,  664,  664,  664,  664,  664,

			  664,  664,  664,  664,  664,  664,  664,  664,  664,  664,
			  665,  665,  665,  665,  665,  665,  665,  665,  665,  665,
			  665,  665,  665,  665,  665,  665,  665,  665,  665,  665,
			  665,  669,  669,  669,  669,  669,  669,  669,  669,  669,
			  669,  669,  669,  669,  669,  669,  669,  669,  669,  669,
			  669,  669,  670,  341,  670,  340,  339,  338,  670,  670,
			  336,  670,  670,  670,  670,  670,  670,  670,  670,  670,
			  670,  670,  670,  671,  335,  671,  671,  671,  671,  671,
			  671,  671,  671,  671,  671,  671,  671,  671,  671,  671,
			  671,  671,  671,  671,  672,  334,  672,  672,  672,  672, yy_Dummy>>,
			1, 200, 1970)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  672,  672,  672,  672,  672,  672,  672,  672,  672,  672,
			  672,  672,  672,  672,  672,  674,  674,  674,  674,  674,
			  674,  674,  674,  674,  674,  674,  674,  674,  674,  674,
			  674,  674,  674,  674,  674,  674,  676,  331,  676,  676,
			  676,  676,  676,  676,  676,  676,  676,  676,  676,  676,
			  676,  676,  676,  676,  676,  676,  676,  678,  330,  678,
			  678,  678,  678,  678,  678,  678,  678,  678,  678,  678,
			  678,  678,  678,  678,  678,  678,  678,  678,  679,  329,
			  679,  679,  679,  679,  679,  679,  679,  679,  679,  679,
			  679,  679,  679,  679,  679,  679,  679,  679,  679,  680,

			  328,  307,  680,  680,  680,  680,  680,  680,  680,  680,
			  680,  680,  680,  680,  680,  680,  680,  680,  680,  680,
			  681,  293,  681,  681,  681,  681,  681,  681,  681,  681,
			  681,  681,  681,  681,  681,  681,  681,  681,  681,  681,
			  681,  682,  682,  682,  682,  682,  682,  682,  682,  682,
			  682,  682,  682,  682,  682,  682,  682,  682,  682,  682,
			  682,  682,  683,  683,  683,  683,  683,  683,  683,  683,
			  683,  683,  683,  683,  683,  683,  292,  683,  683,  683,
			  683,  683,  683,  684,  291,  684,  684,  684,  684,  684,
			  684,  684,  684,  684,  684,  684,  684,  684,  684,  684, yy_Dummy>>,
			1, 200, 2170)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  684,  290,  288,  684,  685,  287,  685,  685,  685,  685,
			  685,  685,  685,  685,  685,  685,  685,  685,  685,  685,
			  685,  685,  685,  685,  685,  687,  286,  687,  284,  687,
			  283,  687,  687,  282,  687,  687,  687,  687,  687,  687,
			  687,  281,  280,  687,  687,  687,  688,  279,  688,  688,
			  688,  688,  688,  688,  688,  688,  688,  688,  688,  688,
			  688,  688,  688,  688,  688,  688,  688,  689,  689,  689,
			  278,  689,  689,  689,  689,  689,  689,  689,  689,  689,
			  689,  689,  689,  689,  689,  689,  689,  689,  690,  690,
			  690,  690,  690,  690,  690,  690,  690,  690,  690,  690,

			  690,  690,  690,  690,  690,  690,  690,  690,  690,  691,
			  691,  691,  691,  691,  691,  691,  691,  691,  691,  691,
			  691,  691,  691,  691,  691,  691,  691,  691,  691,  691,
			  692,  277,  692,  692,  692,  692,  692,  692,  692,  692,
			  692,  692,  692,  692,  692,  692,  692,  692,  692,  692,
			  692,  693,  276,  693,  693,  693,  693,  693,  693,  693,
			  693,  693,  693,  693,  693,  693,  693,  693,  693,  693,
			  693,  693,  695,  275,  695,  695,  695,  695,  695,  695,
			  695,  695,  695,  695,  695,  695,  695,  695,  695,  695,
			  695,  695,  695,  696,  273,  696,  696,  696,  696,  696, yy_Dummy>>,
			1, 200, 2370)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  696,  696,  696,  696,  696,  696,  696,  696,  696,  696,
			  696,  696,  696,  696,  699,  272,  699,  699,  699,  699,
			  699,  699,  699,  699,  699,  699,  699,  699,  699,  699,
			  699,  699,  699,  699,  699,  700,  271,  700,  700,  700,
			  700,  700,  700,  700,  700,  700,  700,  700,  700,  700,
			  700,  700,  700,  700,  700,  700,  703,  703,  703,  703,
			  703,  703,  703,  723,  723,  723,  703,  270,  258,  703,
			  257,  723,  248,  238,  237,  703,  704,  234,  704,  704,
			  704,  704,  704,  704,  704,  704,  704,  704,  704,  704,
			  704,  704,  704,  704,  704,  704,  704,  705,  233,  705,

			  705,  705,  705,  705,  705,  705,  705,  705,  705,  705,
			  705,  705,  705,  705,  705,  705,  705,  705,  710,  232,
			  710,  710,  710,  710,  710,  710,  710,  710,  710,  710,
			  710,  710,  710,  710,  710,  710,  710,  710,  710,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  715,  715,  715,  715,  715,  715,  715,  715,  715,  715,
			  716,  228,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  716,  716,  716,  716,  716,  716,  716,  716,  716,
			  716,  717,  717,  717,  717,  717,  717,  717,  726,  726,
			  726,  717,  224,  223,  717,  220,  726,  727,  727,  727, yy_Dummy>>,
			1, 200, 2570)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  717,  729,  729,  729,  212,  727,  730,  730,  730,  729,
			  732,  732,  732,  211,  730,  733,  733,  733,  732,  734,
			  734,  734,  202,  733,  735,  735,  735,  734,  737,  737,
			  737,  201,  735,  738,  738,  738,  737,  739,  739,  739,
			  200,  738,  740,  740,  740,  739,  741,  741,  741,  199,
			  740,  742,  742,  742,  741,  743,  743,  743,  198,  742,
			  744,  744,  744,  743,  197,  196,  194,  193,  744,  192,
			  191,  189,  188,  182,  181,  159,  154,  140,  139,  131,
			  119,  109,   92,   87,   86,   85,   84,   82,   81,   80,
			   79,   78,   77,   76,   75,   74,   72,   68,   67,   66,

			   60,   56,   55,   49,   45,   44,   43,   12,   11, yy_Dummy>>,
			1, 109, 2770)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 744)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			yy_base_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,   14,   63,   68,    0,    0,    3,   17,  125,
			    0, 2876, 2875,  185,    0,    0,    0,  245,  302,   25,
			   27,  359,    0,   18,   24,   83,   88,   64,  246,  257,
			  259,    1,    7,  419,  475,  270,  274,  253,  288,   34,
			  435,  443,  449, 2874, 2873, 2874, 2879,   67, 2879, 2859,
			  293,    0, 2879,   94, 2879, 2858, 2848, 2879,    0, 2879,
			 2863,    0,    0, 2879,  246, 2879, 2862, 2854, 2810, 2879,
			   95, 2879, 2852,    0, 2839, 2838, 2833, 2834, 2816, 2826,
			 2829, 2818, 2812,   41, 2826, 2811, 2828, 2851, 2879, 2879,
			   99, 2879, 2838,    0, 2879,  100, 2879, 2879,   88, 2879,

			 2879, 2879, 2879,  268, 2879,  109, 2879, 2879, 2879, 2837,
			 2879,    0,    0, 2879, 2879,    0,    0,  110, 2879, 2836,
			 2879, 2879,  444,  253, 2879, 2879,    0,  448, 2879, 2879,
			 2879, 2844, 2879,  118, 2879, 2879,  279,   67, 2879, 2825,
			 2796,  492,  238,    0, 2879, 2879, 2879, 2879,  511, 2879,
			  263, 2879,  518, 2879, 2844,  531, 2879, 2879,  272, 2843,
			 2879,  313,    0, 2879,  287,  291,  300,  433,  336,    0,
			  348,    0, 2879,  524,  454,    0,    0,  498, 2879,  590,
			  650, 2836, 2827,    0, 2879,  350,  709,    0, 2814, 2798,
			  297, 2797, 2802, 2798, 2792,  743, 2791, 2791, 2798, 2784, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2779, 2759, 2790, 2879,  352,    0,    0,  455,  537, 2879,
			  326, 2728, 2719,  456,    0,    0,    0,    0,    0,  503,
			 2761, 2879,  454, 2708, 2707, 2879, 2879, 2879, 2726, 2879,
			  523, 2879, 2667, 2646, 2617,  283,  641, 2587, 2586,  649,
			    0,  775, 2879,  436, 2879,  785,  790, 2879, 2640, 2879,
			  794,  534, 2879,   11, 2879,  516, 2879, 2626, 2624,  853,
			  805, 2879,  492,  544,  809,  815, 2879, 2879,  555,    0,
			 2601, 2576, 2540, 2538,    0, 2506, 2492, 2475, 2414, 2391,
			 2382, 2383, 2358, 2366, 2368,  507, 2366, 2349, 2341,  388,
			 2357, 2324, 2326, 2252,  533,    0,    0,    0,    0,    0,

			  549,    0,    0,    0,    0, 2879, 2879, 2231,  654, 2879,
			  785,  896,  935, 2879, 2879, 2879,  824, 2879,  657,  649,
			    5,    0,  829,  975,  884,  917, 1014,  890, 2225, 2235,
			 2196, 2162,    0,    0, 2151, 2116, 2087,  299, 2084, 2089,
			 2086, 2079, 1673, 1685, 1679, 1671, 1667, 1656, 1685,  452,
			 1670,    0,    0, 2879,    0, 1629, 2879, 1628, 2879,    0,
			 1627, 2879, 1626, 1640,  821, 1052, 1091,  306, 1130, 1169,
			  375, 1184, 1200,  913,  928,  938,  673,   16,  567, 1238,
			  952,  499,  662,    0,  960, 1629,  495,    0, 1632, 1638,
			 1620, 1625, 1609, 1627,    0, 1604, 1610, 1613,  525, 1624, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1596, 1586, 1587, 1589,  658, 1583, 1570, 1565,    0, 1551,
			 2879, 1539,    0, 1538, 2879, 1537, 1568,  528, 1253, 1268,
			  613, 1283, 1298, 1313, 1328,  678,  824,    0,  967,  943,
			 1344,  991,  983,  999, 1383, 1009, 1030,  767,    0, 1542,
			 1550, 1535, 1550, 1521, 1551, 1532, 1518,    0,    0, 1537,
			 1506, 1535,  671, 1520,    0, 1506, 1495, 1506, 1493, 1477,
			 1489,    0, 1462, 1461, 1449, 1448, 1479, 1421, 1436, 1451,
			  656, 1466, 1481, 1022, 1038,  798,  768,  782,  940,    0,
			 1069, 1041, 1047, 1487, 1043, 1081, 1437, 1447, 1450,    0,
			 1445, 1435,  781,    0, 1438, 1444, 1439,  841, 1433, 1420,

			 1415, 1434, 1407, 1401, 1413, 1409, 1422, 1377, 1376, 1375,
			 1373, 2879,  796, 1496, 1511, 1526, 1541, 1076, 1085, 1367,
			 1098, 1108,  920, 1378, 1354,    0,    0, 1357, 1359, 1344,
			 1339, 1326, 1325, 1298, 1279, 1277,    0, 2879,    0, 1259,
			 1264, 1223, 1227, 1185, 1183, 1169, 1168, 1556, 1571, 1586,
			 1601, 1088, 1114, 1155, 1155, 1150, 1140, 1142,    0, 1131,
			 1134, 1101, 1113, 1107, 1126, 1094, 1103, 1089, 1085, 1039,
			 1034, 1028, 1020, 1616, 1631, 1646, 1661, 1032, 1030, 1037,
			 1001,    0,    0, 1009,    9,  996, 1002,  985,  994,    0,
			  969, 1676, 1691,  842,  894,  955,  941,  921,  915,  903, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  911,  889,  863,    0,  845,  853,  953,  968,  841,  831,
			  832,  822,  820,  822,    0,  791,  795,  765,  677,  668,
			  653,  651,    0,  638,  628,  549,  548,  536,    0,  502,
			  482,  449,  424,  410,    0,  403,  305,  288,  253,  230,
			    0,    0,   78,   49,    0,    9,    0, 2879, 1722, 1743,
			 1764, 1785, 1806, 1827, 1848, 1869, 1890, 1911, 1932, 1953,
			 1974, 1995, 2016, 2037, 2058, 2079, 1158, 1166, 1153, 2100,
			 2121, 2142, 2163, 1220, 2184, 1225, 2205, 1233, 2226, 2247,
			 2268, 2289, 2310, 2331, 2352, 2373, 1365, 2394, 2415, 2436,
			 2457, 2478, 2499, 2520, 1376, 2541, 2562, 1126, 1358, 2583,

			 2604, 1374, 1405, 2625, 2645, 2666, 1040, 1143, 1181, 1196,
			 2687, 1212, 1240, 1250, 1265, 2708, 2729, 2750, 1280, 1408,
			 1413, 1295, 1417, 2623, 1310, 1325, 2748, 2757, 1340, 2761,
			 2766, 1383, 2770, 2775, 2779, 2784, 1395, 2788, 2793, 2797,
			 2802, 2806, 2811, 2815, 2820, yy_Dummy>>,
			1, 145, 600)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 744)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			an_array.area.fill_with (673, 328, 352)
			yy_def_template_3 (an_array)
			yy_def_template_4 (an_array)
			an_array.area.fill_with (673, 608, 646)
			an_array.put (0, 647)
			an_array.area.fill_with (647, 648, 744)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  648,  648,  649,  649,  650,  650,  651,  651,  647,
			    9,  652,  652,  647,   13,   13,   13,  653,  653,  654,
			  654,  647,   21,  655,  655,  656,  656,  657,  657,  658,
			  658,  659,  659,  660,  660,  661,  661,  662,  662,  663,
			  663,  664,  664,  665,  665,  647,  647,  647,  647,  647,
			  666,  667,  647,  647,  647,  647,  647,  647,  668,  647,
			  647,  669,  670,  647,  671,  647,  672,  647,  647,  647,
			  647,  647,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  674,  647,  647,
			  647,  647,  647,  675,  647,  647,  647,  647,  647,  647,

			  647,  647,  647,  676,  647,  647,  647,  647,  647,  647,
			  647,  677,  678,  647,  647,  679,  680,  647,  647,  680,
			  647,  647,  681,  682,  647,  647,  683,  676,  647,  647,
			  647,  684,  647,  647,  647,  647,  647,  647,  647,  647,
			  685,  676,  686,  687,  647,  647,  647,  647,  647,  647,
			  688,  647,  647,  647,  689,  689,  647,  647,  690,  691,
			  647,  647,  692,  647,  666,  666,  666,  666,  647,  667,
			  647,  693,  647,  668,  647,  669,  670,  671,  647,  647,
			  671,  647,  694,  695,  647,  647,  647,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  673,  673,  674,  647,  647,  696,  675,  647,  647,  647,
			  647,  697,  698,  647,  699,  677,  678,  679,  680,  647,
			  700,  647,  647,  701,  702,  647,  647,  647,  684,  647,
			  647,  647,  647,  647,  647,  685,  685,  647,  647,  686,
			  687,  647,  647,  688,  647,  703,  647,  647,  689,  647,
			  689,  690,  647,  691,  647,  666,  647,  647,  647,  179,
			  259,  647,  704,  259,  259,  671,  647,  647,  647,  705,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  647,  706,  707,  708,  709,  710,

			  647,  711,  712,  713,  714,  647,  647,  647,  685,  647,
			  685,  685,  311,  647,  647,  647,  647,  647,  647,  666,
			  715,  716,  717,  259,  259,  259,  647,  647, yy_Dummy>>,
			1, 128, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  647,  718,  719,  647,  720,  647,  721,  722,  647,  723,
			  647,  685,  312,  365,  685,  366,  368,  685,  368,  647,
			  647,  666,  647,  647,  259,  259,  259,  259,  647,  647,
			  724,  647,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  725,  726,  647,  727,  728,
			  729,  647,  730,  647,  685,  368,  368,  685,  368,  368,
			  368,  368,  647,  647,  731,  647,  666,  647,  647,  259,
			  259,  259,  647,  647,  724,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,

			  673,  673,  673,  673,  673,  673,  673,  673,  673,  732,
			  733,  734,  735,  647,  368,  368,  368,  685,  368,  368,
			  647,  647,  731,  666,  647,  647,  736,  647,  259,  259,
			  434,  647,  647,  724,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  737,  738,  739,  740,  647,  685,
			  368,  368,  368,  368,  647,  647,  731,  647,  647,  736,
			  673,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  647,  673,  673,  673,  673,  673,
			  741,  742,  743,  744,  368,  368,  368,  368,  647,  647, yy_Dummy>>,
			1, 200, 353)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  736,  673,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  647,  647,  647,  647,
			  368,  368,  368,  368,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  673,  673,  673,  673,  673,  368,  368,
			  685,  685,  673,  673,  673,  673,  673,  673,  673,  673,
			  673,  673,  673,  685,  685, yy_Dummy>>,
			1, 55, 553)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (60, 126, 159)
			an_array.put (3, 160)
			an_array.area.fill_with (60, 161, 255)
			an_array.area.fill_with (58, 256, 5759)
			an_array.put (59, 5760)
			an_array.area.fill_with (58, 5761, 8191)
			an_array.area.fill_with (59, 8192, 8202)
			an_array.area.fill_with (58, 8203, 8238)
			an_array.put (59, 8239)
			an_array.area.fill_with (58, 8240, 8286)
			an_array.put (59, 8287)
			an_array.area.fill_with (58, 8288, 12287)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   60,   60,   60,   60,   60,   60,   60,   60,    1,
			    2,    3,    3,    4,   60,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   60,   60,   60,   60,
			   60,   60,    1,   60,    5,   60,    6,    7,   60,    8,
			    9,   10,   11,   12,   13,   14,   15,   16,   17,   18,
			   19,   19,   19,   19,   19,   19,   20,   21,   22,   60,
			   23,   24,   25,   15,   60,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   38,   39,   40,
			   41,   33,   42,   43,   44,   45,   46,   47,   48,   49,
			   49,   50,   51,   52,   53,   54,   60,   26,   27,   28,

			   29,   30,   31,   32,   33,   34,   35,   36,   37,   38,
			   39,   40,   41,   33,   42,   43,   44,   45,   46,   47,
			   48,   49,   49,   55,   56,   57, yy_Dummy>>,
			1, 126, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   59,   58,   60, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,    3,    4,   21,    5,    6,    7,
			    7,   21,    8,   21,    9,   21,    7,   10,   10,   10,
			   10,   10,   21,    7,   21,    7,   11,   11,   11,   11,
			   12,   11,   13,   14,   13,   13,   13,   14,   13,   14,
			   13,   13,   14,   14,   14,   14,   14,   13,   13,   13,
			   21,   21,   15,   21,   16,   17,   21,   18,   19,   20,
			   21, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 648)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			yy_accept_template_3 (an_array)
			yy_accept_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    2,    3,
			    3,    3,    4,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    6,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    8,   11,   15,   18,
			   21,   25,   29,   32,   36,   39,   42,   46,   50,   54,
			   58,   61,   64,   67,   70,   73,   76,   79,   82,   85,
			   88,   92,   95,   99,  103,  107,  111,  115,  119,  123,
			  127,  131,  135,  139,  143,  147,  151,  155,  158,  161,
			  164,  168,  171,  174,  178,  181,  185,  188,  192,  196,

			  200,  203,  206,  209,  212,  215,  219,  222,  226,  230,
			  233,  237,  241,  244,  247,  250,  254,  257,  260,  263,
			  266,  269,  272,  275,  278,  281,  284,  287,  290,  293,
			  296,  298,  301,  304,  308,  311,  315,  318,  322,  326,
			  329,  333,  336,  340,  343,  346,  349,  352,  355,  358,
			  361,  364,  367,  370,  373,  376,  379,  382,  385,  388,
			  391,  394,  395,  396,  397,  398,  399,  401,  403,  403,
			  404,  405,  406,  407,  407,  408,  409,  410,  410,  411,
			  411,  412,  412,  412,  413,  414,  415,  417,  418,  419,
			  420,  421,  422,  423,  424,  425,  426,  427,  428,  429, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  430,  431,  432,  433,  434,  435,  436,  437,  438,  439,
			  440,  442,  443,  444,  445,  446,  447,  448,  450,  451,
			  452,  454,  455,  457,  458,  459,  460,  461,  462,  462,
			  463,  464,  465,  465,  465,  465,  465,  465,  465,  465,
			  465,  466,  466,  467,  467,  468,  468,  468,  469,  469,
			  470,  470,  470,  471,  471,  472,  473,  474,  474,  474,
			  474,  474,  475,  475,  475,  476,  476,  477,  478,  478,
			  479,  480,  481,  482,  483,  485,  486,  487,  488,  489,
			  490,  491,  492,  493,  494,  495,  496,  497,  498,  499,
			  500,  501,  502,  503,  504,  505,  506,  506,  507,  507,

			  508,  509,  510,  510,  511,  511,  512,  513,  513,  513,
			  514,  514,  514,  514,  515,  516,  517,  517,  518,  518,
			  519,  519,  520,  520,  520,  520,  520,  520,  520,  521,
			  522,  523,  524,  526,  528,  529,  530,  531,  532,  533,
			  534,  535,  536,  537,  538,  539,  540,  541,  542,  543,
			  544,  545,  547,  549,  550,  551,  551,  552,  552,  553,
			  554,  554,  555,  555,  555,  555,  555,  555,  555,  555,
			  555,  555,  555,  555,  555,  556,  556,  556,  556,  556,
			  556,  556,  556,  556,  556,  556,  557,  558,  560,  561,
			  562,  563,  564,  565,  566,  568,  569,  570,  571,  572, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  573,  574,  575,  576,  577,  578,  579,  580,  581,  582,
			  582,  583,  583,  584,  584,  585,  585,  585,  585,  585,
			  585,  585,  585,  585,  585,  585,  585,  585,  585,  585,
			  586,  586,  586,  586,  586,  586,  586,  586,  586,  588,
			  589,  590,  591,  592,  593,  594,  595,  596,  598,  600,
			  601,  602,  603,  604,  605,  607,  608,  609,  610,  611,
			  612,  613,  615,  615,  615,  615,  615,  615,  615,  615,
			  615,  615,  615,  615,  615,  615,  615,  617,  617,  617,
			  617,  617,  617,  617,  617,  617,  617,  617,  618,  619,
			  621,  622,  623,  624,  626,  627,  628,  629,  630,  631,

			  632,  633,  634,  635,  636,  637,  638,  639,  639,  639,
			  639,  639,  640,  640,  640,  640,  640,  640,  640,  640,
			  640,  640,  640,  640,  641,  642,  644,  646,  647,  648,
			  649,  650,  651,  652,  653,  654,  655,  657,  658,  660,
			  661,  662,  663,  664,  664,  664,  664,  664,  664,  664,
			  664,  664,  664,  664,  664,  665,  666,  667,  668,  670,
			  671,  672,  673,  674,  675,  676,  677,  678,  679,  680,
			  680,  680,  680,  680,  680,  680,  680,  680,  681,  682,
			  683,  684,  686,  688,  689,  690,  691,  692,  693,  694,
			  696,  697,  697,  697,  697,  697,  698,  699,  700,  701, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  702,  703,  704,  705,  707,  708,  709,  709,  709,  710,
			  711,  712,  713,  714,  715,  717,  718,  719,  720,  721,
			  722,  723,  724,  726,  727,  728,  729,  730,  731,  733,
			  734,  735,  736,  737,  738,  740,  741,  742,  743,  744,
			  745,  747,  749,  750,  751,  753,  754,  756,  756, yy_Dummy>>,
			1, 49, 600)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 755)
			yy_acclist_template_1 (an_array)
			yy_acclist_template_2 (an_array)
			yy_acclist_template_3 (an_array)
			yy_acclist_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_acclist_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    0,   11,   11,   60,   60,  121,  121,  145,   10,  143,
			  144,    1,   10,  143,  144,    2,  143,  144,   10,  143,
			  144,    9,   10,  143,  144,    7,   10,  143,  144,   69,
			  143,  144,   62,   69,  143,  144,   63,  143,  144,   69,
			  143,  144,   68,   69,  143,  144,   65,   69,  143,  144,
			   66,   69,  143,  144,   67,   69,  143,  144,   69,  143,
			  144,  142,  143,  144,   11,  143,  144,   12,  143,  144,
			  125,  143,  144,   13,  143,  144,  125,  143,  144,  125,
			  143,  144,   13,  143,  144,   54,  143,  144,   19,   54,
			  143,  144,   52,  143,  144,   53,   54,  143,  144,   53,

			   54,  143,  144,   53,   54,  143,  144,   53,   54,  143,
			  144,   53,   54,  143,  144,   53,   54,  143,  144,   53,
			   54,  143,  144,   53,   54,  143,  144,   53,   54,  143,
			  144,   53,   54,  143,  144,   53,   54,  143,  144,   53,
			   54,  143,  144,   53,   54,  143,  144,   53,   54,  143,
			  144,   53,   54,  143,  144,   60,  143,  144,   61,  143,
			  144,   18,  143,  144,   15,   18,  143,  144,   17,  143,
			  144,   18,  143,  144,   16,   18,  143,  144,   96,  143,
			  144,   92,   96,  143,  144,   97,  143,  144,   94,   96,
			  143,  144,   93,   96,  143,  144,   95,   96,  143,  144, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   98,  143,  144,  100,  143,  144,   99,  143,  144,   98,
			  143,  144,   91,  143,  144,   85,   91,  143,  144,   86,
			  143,  144,   88,   91,  143,  144,   87,   91,  143,  144,
			   91,  143,  144,   89,   91,  143,  144,   90,   91,  143,
			  144,  120,  143,  144,  118,  143,  144,  119,  143,  144,
			  117,  120,  143,  144,   58,  143,  144,   57,  143,  144,
			   59,  143,  144,   58,  143,  144,  111,  143,  144,  112,
			  143,  144,  111,  143,  144,  111,  143,  144,  114,  143,
			  144,  116,  143,  144,  114,  143,  144,  114,  143,  144,
			  115,  143,  144,   56,  143,  144,  143,  144,   56,  143,

			  144,   84,  143,  144,   82,   84,  143,  144,   83,  143,
			  144,   72,   84,  143,  144,   84,  143,  144,   81,   84,
			  143,  144,   81,   84,  143,  144,   84,  143,  144,   79,
			   84,  143,  144,   84,  143,  144,   75,   84,  143,  144,
			  121,  143,  144,  122,  143,  144,  123,  143,  144,  124,
			  143,  144,  134,  143,  144,  134,  143,  144,  133,  143,
			  144,  134,  143,  144,  136,  143,  144,  136,  143,  144,
			  135,  143,  144,  139,  143,  144,  139,  143,  144,  138,
			  143,  144,  139,  143,  144,  139,  143,  144,  141,  143,
			  144,  140,  143,  144,    1,    1,    8,    9,    9,    4, yy_Dummy>>,
			1, 200, 200)
		end

	yy_acclist_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    9,    5,    9,    7,   62,   62,   69,   64,  142,   11,
			  128, -274,  126,   14,   19,   19,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   60,   61,   15,   15,   16,   92,   93,  101,
			  101,  102,  101,  101,   85,   85,   90,  120,  117,  120,
			   58,   57,   57,   58,  105,  105,  106,  105,  105,  109,
			  110,  113,   55,   82,   73,  121,  133,  131,  135,  138,
			  137,  140,    9,    3,  129, -274, -130,  127,   19,   53,
			   53,   53,   53,   28,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,

			   53,   53,   53,   53,  102,  104,  103,   57,  106,  108,
			  107,   71,   70,   78,   76,   77,   74,  132,    9,   64,
			   53,   53,   53,   53,   30,   53,   36,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   48,   53,   49,   53,  102,
			  104,  103,  106,  108,  107,    9,   53,   53,   24,   53,
			   53,   53,   53,   53,   53,   53,   29,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,  104,  104,  108,  108,    9,   20,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   31,   53,   37,   53, yy_Dummy>>,
			1, 200, 400)
		end

	yy_acclist_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   53,   53,   53,   53,   53,   50,   53,   53,   53,   53,
			   53,   53,   53,   34,   53,    6,    9,   53,   53,   26,
			   53,   53,   53,   53,   25,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   80,
			   53,   53,   32,   53,   21,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   35,   53,   51,   38,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   27,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   33,   53,   39,   53,   53,   53,
			   53,   53,   53,   53,   40,   53,   53,   53,   53,   53,

			   53,   53,   53,   53,   53,   42,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   41,   53,   53,   53,   53,
			   53,   53,   53,   53,   43,   53,   53,   53,   53,   53,
			   53,   22,   53,   53,   53,   53,   53,   53,   44,   53,
			   53,   53,   53,   53,   53,   46,   53,   23,   53,   53,
			   53,   45,   53,   53,   47,   53, yy_Dummy>>,
			1, 156, 600)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2879
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 647
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 648
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 60
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 12289
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol

	yyReject_used: BOOLEAN = false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN = true
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN = true
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER = 144
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 145
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
	EIFFEL_MSN: INTEGER = 18
	EIFFEL_VS1: INTEGER = 19
	EIFFEL_VS2: INTEGER = 20
	EIFFEL_VS3: INTEGER = 21
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
