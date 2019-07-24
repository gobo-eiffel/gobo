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
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
		end

	LX_LEX_TOKENS
		export
			{NONE} all
		redefine
			last_integer_value,
			last_string_value,
			last_lx_symbol_class_value,
			last_lx_unicode_character_class_value
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
--|#line 65 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 65")
end
-- Separator or comment.
when 2 then
--|#line 66 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 66")
end
line_nb := line_nb + 1
when 3 then
--|#line 67 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 67")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
when 4 then
--|#line 71 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 71")
end
set_start_condition (SCNAME)
when 5 then
--|#line 72 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 72")
end
set_start_condition (XSCNAME)
when 6 then
--|#line 73 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 73")
end
set_start_condition (OPTION)
when 7 then
--|#line 74 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 74")
end

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
when 8 then
--|#line 79 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 79")
end

					last_token := ENDSECT
					set_start_condition (SECT2)
				
when 9 then
--|#line 83 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 83")
end

					report_unrecognized_directive_error
					set_start_condition (RECOVER1)
				
when 10 then
--|#line 87 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 87")
end

					report_directive_expected_error
					set_start_condition (RECOVER1)
				
when 11 then
--|#line 94 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 94")
end
more
when 12 then
--|#line 95 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 95")
end
more
when 13 then
--|#line 96 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 96")
end
more
when 14 then
--|#line 97 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 97")
end
more
when 15 then
--|#line 98 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 98")
end
more
when 16 then
--|#line 99 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 99")
end

					check attached text_substring (1, text_count - 2) as l_last_string then
						line_nb := line_nb + l_last_string.occurrences ('%N')
						description.eiffel_header.force_last (l_last_string)
						set_start_condition (INITIAL)
					end
				
when 17 then
--|#line 109 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 109")
end
-- Separator or comment.
when 18 then
--|#line 110 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 110")
end
add_new_start_condition (text, start_condition = XSCNAME)
when 19 then
--|#line 111 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 111")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 20 then
--|#line 115 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 115")
end

					report_start_condition_expected_error
					set_start_condition (RECOVER1)
				
when 21 then
--|#line 122 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 122")
end
-- Separator or comment.
when 22 then
--|#line 123 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 123")
end
description.set_backing_up_report (True)
when 23 then
--|#line 124 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 124")
end
description.set_backing_up_report (False)
when 24 then
--|#line 125 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 125")
end

					description.set_case_insensitive (False)
				
when 25 then
--|#line 128 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 128")
end

					description.set_case_insensitive (True)
				
when 26 then
--|#line 131 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 131")
end
description.set_debug_mode (True)
when 27 then
--|#line 132 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 132")
end
description.set_debug_mode (False)
when 28 then
--|#line 133 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 133")
end
description.set_no_default_rule (False)
when 29 then
--|#line 134 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 134")
end
description.set_no_default_rule (True)
when 30 then
--|#line 135 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 135")
end
description.set_equiv_classes_used (True)
when 31 then
--|#line 136 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 136")
end
description.set_equiv_classes_used (False)
when 32 then
--|#line 137 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 137")
end
description.set_full_table (True)
when 33 then
--|#line 138 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 138")
end
description.set_full_table (False)
when 34 then
--|#line 139 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 139")
end
description.set_meta_equiv_classes_used (True)
when 35 then
--|#line 140 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 140")
end
description.set_meta_equiv_classes_used (False)
when 36 then
--|#line 141 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 141")
end
description.set_reject_used (True)
when 37 then
--|#line 142 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 142")
end
description.set_reject_used (False)
when 38 then
--|#line 143 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 143")
end
description.set_line_used (True)
when 39 then
--|#line 144 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 144")
end
description.set_line_used (False)
when 40 then
--|#line 145 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 145")
end
description.set_position_used (True)
when 41 then
--|#line 146 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 146")
end
description.set_position_used (False)
when 42 then
--|#line 147 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 147")
end
description.set_pre_action_used (True)
when 43 then
--|#line 148 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 148")
end
description.set_pre_action_used (False)
when 44 then
--|#line 149 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 149")
end
description.set_post_action_used (True)
when 45 then
--|#line 150 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 150")
end
description.set_post_action_used (False)
when 46 then
--|#line 151 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 151")
end
description.set_pre_eof_action_used (True)
when 47 then
--|#line 152 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 152")
end
description.set_pre_eof_action_used (False)
when 48 then
--|#line 153 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 153")
end
description.set_post_eof_action_used (True)
when 49 then
--|#line 154 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 154")
end
description.set_post_eof_action_used (False)
when 50 then
--|#line 155 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 155")
end

					description.set_unicode_mode (True)
				
when 51 then
--|#line 158 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 158")
end

					description.set_no_warning (False)
				
when 52 then
--|#line 161 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 161")
end

					description.set_no_warning (True)
				
when 53 then
--|#line 165 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 165")
end
set_start_condition (OUTFILE)
when 54 then
--|#line 175 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 175")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 55 then
--|#line 179 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 179")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 56 then
--|#line 186 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 186")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 57 then
--|#line 190 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 190")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 58 then
--|#line 198 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 198")
end
-- Separates name and definition.
when 59 then
--|#line 199 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 199")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 60 then
--|#line 206 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 206")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 61 then
--|#line 214 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 214")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 62 then
--|#line 218 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 218")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 63 then
--|#line 231 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 231")
end
-- Separator or comment.
when 64 then
--|#line 232 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 232")
end
line_nb := line_nb + 1
when 65 then
--|#line 233 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 233")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 66 then
--|#line 237 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 237")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 67 then
--|#line 246 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 246")
end
last_token := Left_brace_code
when 68 then
--|#line 247 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 247")
end
last_token := Right_brace_code
when 69 then
--|#line 248 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 248")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 70 then
--|#line 252 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 252")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 71 then
--|#line 264 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 264")
end

					last_token := UNICODE_MODE_START
				
when 72 then
--|#line 267 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 267")
end

					last_token := BYTE_MODE_START
				
when 73 then
--|#line 270 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 270")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 74 then
	yy_end := yy_start + yy_more_len + 1
--|#line 274 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 274")
end
last_token := Dollar_code
when 75 then
--|#line 275 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 275")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 76 then
--|#line 284 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 284")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 77 then
--|#line 288 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 288")
end

					check attached text as l_last_string then
						if unicode_mode.item then
							if unicode_character_classes.has (l_last_string) then
								last_token := UCCL_OP
								last_lx_unicode_character_class_value := unicode_character_classes.item (l_last_string)
							else
								last_token := UCCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						else
							if character_classes.has (l_last_string) then
								last_token := CCL_OP
								last_lx_symbol_class_value := character_classes.item (l_last_string)
							else
								last_token := CCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						end
					end
				
when 78 then
--|#line 313 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 313")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 79 then
--|#line 318 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 318")
end
last_token := EOF_OP
when 80 then
--|#line 319 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 319")
end
last_token := text_item (1).code
when 81 then
--|#line 320 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 320")
end

					set_start_condition (ACTION_TEXT)
				
when 82 then
--|#line 323 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 323")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 83 then
--|#line 328 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 328")
end

					last_token := CHAR
					process_utf8_character
				
when 84 then
--|#line 335 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 335")
end
-- Separator or comment.
when 85 then
--|#line 336 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 336")
end
line_nb := line_nb + 1
when 86 then
--|#line 337 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 337")
end
last_token := Comma_code
when 87 then
--|#line 338 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 338")
end
last_token := Star_code
when 88 then
--|#line 339 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 339")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 89 then
--|#line 343 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 343")
end

					last_token := NAME
					last_string_value := text
				
when 90 then
--|#line 347 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 347")
end

					report_bad_start_condition_error (text)
				
when 91 then
--|#line 353 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 353")
end
-- Separator.
when 92 then
--|#line 354 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 354")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 93 then
--|#line 362 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 362")
end
last_token := Comma_code
when 94 then
--|#line 363 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 363")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 95 then
--|#line 367 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 367")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 96 then
--|#line 372 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 372")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 97 then
--|#line 381 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 381")
end

					last_token := CHAR
					process_utf8_character
				
when 98 then
--|#line 385 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 385")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 99 then
--|#line 389 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 389")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 100 then
--|#line 398 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 398")
end

					last_token := CHAR
					process_escaped_character
				
when 101 then
--|#line 402 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 402")
end

					last_token := BCHAR
					process_byte_character
				
when 102 then
--|#line 406 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 406")
end

					last_token := UCHAR
					process_unicode_character
				
when 103 then
--|#line 413 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 413")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 104 then
--|#line 418 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 418")
end

					last_token := BCHAR
					process_byte_character
					set_start_condition (CCL)
				
when 105 then
--|#line 423 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 423")
end

					last_token := UCHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 106 then
	yy_end := yy_start + yy_more_len + 1
--|#line 428 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 428")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 107 then
	yy_end := yy_start + yy_more_len + 1
--|#line 432 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 432")
end
last_token := Caret_code
when 108 then
--|#line 433 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 433")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 109 then
--|#line 438 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 438")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 110 then
	yy_end := yy_start + yy_more_len + 1
--|#line 447 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 447")
end
last_token := Minus_code
when 111 then
--|#line 448 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 448")
end

					last_token := CHAR
					process_utf8_character
				
when 112 then
--|#line 452 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 452")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 113 then
--|#line 456 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 456")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 114 then
--|#line 465 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 465")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 115 then
--|#line 469 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 469")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 116 then
--|#line 474 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 474")
end
set_start_condition (EIFFEL_BLOCK2)
when 117 then
--|#line 475 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 475")
end

					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				
when 118 then
--|#line 483 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 483")
end
more
when 119 then
--|#line 484 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 484")
end
more
when 120 then
--|#line 485 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 485")
end
more
when 121 then
--|#line 486 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 486")
end
more
when 122 then
--|#line 487 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 487")
end
more
when 123 then
--|#line 488 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 488")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 124 then
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
				
when 125 then
--|#line 511 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 511")
end

					last_token := EIF_CODE
					last_string_value := text
				
when 126 then
--|#line 517 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 517")
end

					report_bad_character_error (text)
				
when 127 then
--|#line 520 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 520")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 128 then
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
			create an_array.make_filled (0, 0, 4282)
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
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   39,   40,   39,  180,  180,  181,  181,  214,  223,
			  214,  223,   41,   39,   40,   39,  432,  277,   42,  277,
			  296,  306,  296,  306,   41,  307,  307,  326,  359,  326,
			  359,  226,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   45,   46,   45,   45,   46,
			   45,  238,  238,   52,  239,  239,   47,  272,  272,   47,
			  216,   48,  273,  273,   48,  110,  111,  110,  302,  302,
			  110,  111,  110,  545,  289,  112,  290,  546,  113,  113,
			  112,  303,  303,  113,  113,  228,  228,  228,  218, 1210,

			   49,  219,   50,   49,   51,   50,  220,   51,   54,  237,
			  237,  237,  221,  229,  230,  231,  232,  233,  234,  235,
			  240,  240,  240,  251,  114,  252,  242,  242,  242,  114,
			  229,  230,  231,  232,  233,  234,  235,  243,  244,  245,
			  246,  247,  248,  249,  243,  244,  245,  246,  247,  248,
			  249,  261,  271,  271,  271,  322,  322,   55,   55,   55,
			   55,   56,   57,   58,   59,   60,   61,   62,   54,  274,
			  274,  274,  323,  323,  253,  254,  255,  256,  257,  258,
			  259,  299,  299,  299,  301,  301,  301,  304,  304,  304,
			  319,  319,  319,  321,  321,  321,  324,  324,  324, 1228, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  262,  263,  264,  265,  266,  267,  268,  330,  331,  332,
			  333,  334,  335,  336,  329,  329,  329,   55,   55,   55,
			   55,   56,   57,   58,   59,   60,   61,   62,   64,  418,
			   65,  418,   66,   67,  346,  346,  346, 1227,   68,  338,
			  339,  340,  341,  342,  343,  344,  347,  347,  348,  348,
			  349,  349,  349,  352,  353,  354,  355,  356,  357,  358,
			  360,  351,  351,  351,  362,  362,  362,  363,  363,  364,
			  364,  365,  365,  365,  387,  387,  387,   55,   55,   55,
			   55,   69,   70,   71,   72,   73,   74,   75,   64,  214,
			   65,  214,   76,   67,  389,  389,  389, 1226,   68,  390,

			  390,  391,  391,  352,  353,  354,  355,  356,  357,  358,
			  392,  392,  392,  395,  396,  397,  398,  399,  400,  401,
			  402,  402,  402,  404,  404,  404,  405,  405,  406,  406,
			  407,  407,  407,  419,  419,  419, 1225,   55,   55,   55,
			   55,   69,   70,   71,   72,   73,   74,   75,   78,   79,
			   78,   77,   77,   77,   77,   77,   77,   77,   77,   80,
			   77,   81,   81,   77,   77,   77,   77,   81,   82,   83,
			   84,   85,   86,   81,   81,   81,   81,   81,   87,   88,
			   89,   90,   91,   92,   81,   81,   93,   81,   94,   81,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   98,   99,   98,   97,   97,   97,   97,   97,   97,   97,
			   97,  100,   97,   97,   97,   97,   97,   97,   97,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,   97,   97,   97,   97,   97,   97,   97,   97,
			   55,   55,   55,   55,  102,  103,  104,  105,  106,  107,
			  108,   97,  116,  420,  117,  433,  433,  433,  435,  435,
			  435,  424,  436,  436,  410,  437,  437,  438,  438,  438,
			 1223,  421,  425,  426,  427,  428,  429,  430,  431,  802,

			  379,  441,  442,  443,  444,  445,  446,  447,  449,  803,
			  450,  440,  440,  440,  118,  470,  470,  459,  469,  469,
			  469,   55,   55,   55,   55,  119,  120,  121,  122,  123,
			  124,  125,  116,  379,  117,  411,  412,  413,  414,  415,
			  416,  417, 1224,  380,  381,  382,  383,  384,  385,  386,
			  441,  442,  443,  444,  445,  446,  447,  471,  471,  451,
			  452,  453,  454,  455,  456,  457,  460,  461,  462,  463,
			  464,  465,  466, 1223,  118,  472,  472,  472,  223, 1222,
			  223,   55,   55,   55,   55,  119,  120,  121,  122,  123,
			  124,  125,  127,  128,  127,  126,  126,  126,  126,  126, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  126,  129,  130,  131,  126,  126,  126,  126,  126,  126,
			  132,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  135,  474,  475,  476,  477,  478,
			  479,  480, 1221,  221,  482,  221,  484,  485,  486,  487,
			  488,  489,  490, 1229,  483, 1229, 1229,  238,  238,  227,
			 1220,  227,  228,  228,  228,  239,  239, 1229,  226,  226,
			  491,  229,  230,  231,  232,  233,  234,  235,  272,  272,

			  136,  137, 1219,   55,   55,   55,   55,  138,  139,  140,
			  141,  142,  143,  144,  135, 1229,  481, 1229, 1229,  273,
			  273,  226,  506,  506,  225,  237,  237,  237, 1218, 1229,
			  240,  240,  240,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  492,  492,  492,  493,  493,  493,  494,  494,
			  494,  243,  244,  245,  246,  247,  248,  249,  507,  507,
			  136,  137, 1217,   55,   55,   55,   55,  138,  139,  140,
			  141,  142,  143,  144,  146,  147,  146,  242,  242,  242,
			  271,  271,  271,  521,  521,  148,  274,  274,  274,  250,
			  250,  250,  505,  505,  505,  277,  251,  277,  252,  522, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  522,  495,  508,  508,  508,  260,  260,  260,  520,  520,
			  520, 1216,  496,  260,  523,  523,  523,  307,  307,  511,
			  242,  242,  242, 1215,   55,   55,   55,   55,  149,  150,
			  151,  152,  153,  154,  155,  146,  147,  146,  525,  526,
			  527,  528,  529,  530,  531, 1214,  148,  253,  254,  255,
			  256,  257,  258,  259,  497,  498,  499,  500,  501,  502,
			  503,  512,  513,  514,  515,  516,  517,  518,  242,  242,
			  242,  242,  242,  242,  532,  532,  532,  533,  533,  533,
			  534,  534,  534,  583,  583,   55,   55,   55,   55,  149,
			  150,  151,  152,  153,  154,  155,  157,  296, 1213,  296,

			  567,  568,  569,  570,  571,  572,  573,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  574,  574,  574,  575,
			  575,  575,  576,  576,  576,  306, 1051,  306,  308,  308,
			  308,  582,  582,  582,  584,  584, 1052,  326,  158,  326,
			  159,  585,  585,  585, 1212,   55,   55,   55,   55,  160,
			  161,  162,  163,  164,  165,  166,  157,  578,  578,  319,
			  319,  319, 1229,  578,  578,  578,  578,  578,  578,  580,
			  580,  319,  319,  319, 1211,  580,  580,  580,  580,  580,
			  580,  319,  319,  319,  587,  587,  587,  588,  588,  588,
			 1026,  579,  589,  589,  589,  329,  329,  329,  158, 1210, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  159,  598,  598,  598, 1229,   55,   55,   55,   55,  160,
			  161,  162,  163,  164,  165,  166,  168,  590,  591,  592,
			  593,  594,  595,  596,  599,  599,  169,  330,  331,  332,
			  333,  334,  335,  336,  600,  600,  601,  601,  601,  338,
			  339,  340,  341,  342,  343,  344,  337,  337,  337,  604,
			  604,  604,  605,  605,  606,  606,  614,  614,  170,  171,
			  607,  607,  607,  615,  615,   55,   55,   55,   55,  172,
			  173,  174,  175,  176,  177,  178,  168,  329,  329,  329,
			  329,  329,  329,  329,  329,  329,  169,  609,  609,  609,
			  610,  610,  610,  611,  611,  611,  352,  353,  354,  355,

			  356,  357,  358,  351,  351,  351,  613,  613,  613,  616,
			  616,  616,  359, 1209,  359,  351,  351,  351,  170,  171,
			  351,  351,  351,  635,  635,   55,   55,   55,   55,  172,
			  173,  174,  175,  176,  177,  178,  183,  184,  183,  185,
			  186,  182,  182,  187,  188,  188,  182,  182,  188,  182,
			  182,  182,  189,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  182,  182,
			  182,  182,  182,  182,  182,  182,  182,  182,  190,  191,
			  182,  182,  182,  192,  188,  182,   55,   55,   55,   55,
			  193,  194,  195,  196,  197,  198,  199,  182,  201, 1208, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  202,  636,  636,  203,  351,  351,  351, 1207,  204,  626,
			  626,  626,  627,  627,  627,  641,  641,  618,  628,  628,
			  628,  367,  367,  367, 1206,  630,  630,  634,  634,  634,
			 1205,  630,  630,  630,  630,  630,  630,  637,  637,  637,
			  378,  378,  378,  418,  205,  418,  206,   55,   55,   55,
			   55,  207,  208,  209,  210,  211,  212,  213,  201,  631,
			  202,  642,  642,  203,  640,  640,  640, 1204,  204,  619,
			  620,  621,  622,  623,  624,  625,  632,  632,  643,  643,
			  643, 1203,  632,  632,  632,  632,  632,  632,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  645,  645,  645,

			  646,  646,  646,  797,  205,  798,  206,   55,   55,   55,
			   55,  207,  208,  209,  210,  211,  212,  213,  309,  647,
			  647,  647,  394,  394,  394,  649,  649,  649,  650,  650,
			  651,  651,  652,  652,  652,  402,  402,  402,  402,  402,
			  402,  659,  659,  310,  410, 1202,  311,  402,  402,  402,
			  654,  654,  654,  655,  655,  655,  656,  656,  656,  312,
			  313,  314,  315,  316,  317,  318,  368,  409,  409,  409,
			  658,  658,  658,  660,  660,  661,  661,  661,  423,  423,
			  423,  686,  686,  686,  687,  687,  688,  688,  689,  689,
			  689,  369,  432,  432,  370,  411,  412,  413,  414,  415, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  416,  417,  470,  470,  666,  667, 1201,  371,  372,  373,
			  374,  375,  376,  377,  309,  668,  669,  670,  671,  672,
			  673,  674,  433,  433,  433,  432,  471,  471,  691,  433,
			  433,  433,  433,  433,  433,  692,  692,  692, 1200,  310,
			  706,  706,  311,  693,  693,  693,  694,  694,  694,  440,
			  440,  440,  469,  469,  469,  312,  313,  314,  315,  316,
			  317,  318,  309,  441,  442,  443,  444,  445,  446,  447,
			  472,  472,  472,  448,  448,  448,  705,  705,  705,  707,
			  707,  708,  708,  708,  458,  458,  458,  310,  721,  721,
			  311,  720,  720,  720,  722,  722,  723,  723,  723,  440,

			  440,  440, 1040,  312,  313,  314,  315,  316,  317,  318,
			  535, 1041,  535,  535,  535,  535,  535,  535,  535,  535,
			  535,  278,  535,  278,  278,  535,  535,  535,  535,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  535,  535,  535,  535,  535,  535,  535,  535,
			  449, 1199,  450, 1198,  536,  537,  538,  539,  540,  541,
			  542,  535,  551,  552,  553,  554,  555, 1197,  458,  440,
			  440,  440,  556,  557,  711, 1196,  558,  559,  695,  440,
			  440,  440,  560,  675,  732,  732,  732,  737,  737,  696, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  725,  726,  727,  728,  729,  730,  731,  733,  733,  733,
			 1195,  451,  452,  453,  454,  455,  456,  457,  676,  738,
			  738,  677,  734,  734,  734, 1229,  712,  713,  714,  715,
			  716,  717,  718, 1194,  678,  679,  680,  681,  682,  683,
			  684,  697,  698,  699,  700,  701,  702,  703,  215,  215,
			  215,  736,  736,  736,  739,  739,  739,  741,  224,  224,
			  224,  744,  744,  744,  745,  745, 1193, 1229,  746,  746,
			  747,  747,  747,  228,  228,  228,  228,  228,  228,  228,
			  228,  228,  751,  751,  250,  250,  250,  753,  753,  753,
			  754,  754,  755,  755,  756,  756,  756,  250,  250,  250,

			  250,  250,  250,  250,  250,  250,  758,  758,  758,  759,
			  759,  759,  760,  760,  760,  761,  761,  260,  260,  260,
			  763,  763,  763,  764,  764,  765,  765,  766,  766,  766,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  768,
			  768,  768,  769,  769,  769,  770,  770,  770,  269,  269,
			  269,  772,  772,  772,  773,  773,  774,  774,  775,  775,
			  775,  242,  242,  242,  242,  242,  242,  242,  242,  242,
			  536,  537,  538,  539,  540,  541,  542,  535,  535,  535,
			  778,  778,  778,  779,  779,  780,  780,  781,  781,  781,
			  297,  297,  297,  809,  809,  809,  810,  810,  811,  811, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  812,  812,  812,  299,  299,  299,  299,  299,  299,  299,
			  299,  299,  815,  815,  308,  308,  308, 1192,  815,  815,
			  815,  815,  815,  815,  816,  816,  308,  308,  308, 1191,
			  816,  816,  816,  816,  816,  816,  814,  814,  308,  308,
			  308, 1190,  814,  814,  814,  814,  814,  814,  817,  817,
			  817,  818,  818,  818,  819,  819,  819,  319,  319,  319,
			  319,  319,  319,  319,  319,  319,  327,  327,  327,  821,
			  821,  821,  822,  822,  823,  823,  824,  824,  824,  329,
			  329,  329,  329,  329,  329,  329,  329,  329,  826,  826,
			  826,  827,  827,  827,  828,  828,  828,  337,  337,  337,

			  337,  337,  337,  337,  337,  337,  829,  829,  829,  830,
			  830,  830,  831,  831,  831,  329,  329,  329,  329,  329,
			  329,  329,  329,  329,  351,  351,  351,  351,  351,  351,
			  351,  351,  351,  832,  832,  832,  833,  833,  833,  834,
			  834,  834,  835,  836,  837,  838,  839,  840,  841,  360,
			  360,  360,  843,  843,  843,  844,  844,  845,  845,  846,
			  846,  846,  351,  351,  351,  351,  351,  351,  351,  351,
			  351,  849,  849,  367,  367,  367, 1188,  849,  849,  849,
			  849,  849,  849,  850,  850,  367,  367,  367, 1187,  850,
			  850,  850,  850,  850,  850,  848,  848,  367,  367,  367, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1186,  848,  848,  848,  848,  848,  848,  851,  851,  851,
			  852,  852,  852,  853,  853,  853,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  854,  854,  854,  855,  855,
			  855,  856,  856,  856,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  857,  857,  857,  858,  858,  858,  859,  859,
			  859,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  860,
			  860,  860,  861,  861,  861,  862,  862,  862,  864,  423,
			  423,  423,  875,  875,  875,  876,  876,  877,  877,  878,

			  878,  878,  423,  423,  423,  885,  885,  885,  886,  886,
			 1185,  883,  883,  865,  887,  887,  866,  883,  883,  883,
			  883,  883,  883,  888,  888,  888,  423,  423,  423,  867,
			  868,  869,  870,  871,  872,  873,  880,  423,  423,  423,
			  423,  423,  423,  894,  894,  423,  890,  890,  890,  891,
			  891,  891,  892,  892,  892,  433,  433,  433,  433,  433,
			  433,  433,  433,  433,  897,  897,  666,  667,  448,  448,
			  448,  896,  896,  896,  898,  898, 1184,  668,  669,  670,
			  671,  672,  673,  674,  881,  881,  899,  899,  899, 1183,
			  881,  881,  881,  881,  881,  881,  448,  448,  448,  448, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  448,  448,  448,  448,  448,  901,  901,  901,  902,  902,
			  902,  903,  903,  903,  666,  667,  904,  904,  882,  458,
			  458,  458,  906,  906,  906,  668,  669,  670,  671,  672,
			  673,  674,  907,  907,  908,  908,  909,  909,  909,  458,
			  458,  458,  458,  458,  458,  458,  458,  458,  911,  911,
			  911,  912,  912,  912,  913,  913,  913,  467,  467,  467,
			  915,  915,  915,  916,  916,  917,  917,  918,  918,  918,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  920,  920,
			  920,  921,  921,  921,  922,  922,  922, 1229,  482,  224,

			  224,  224,  224,  224,  224,  224,  224,  224,  931,  931,
			  931,  932,  932,  932,  933,  933,  933,  988,  988,  923,
			  934,  935,  936,  937,  938,  939,  940,  250,  751,  751,
			  250,  250,  250,  250,  250,  250,  250,  250,  250, 1229,
			  941,  941,  941,  942,  942,  942,  943,  943,  943,  989,
			  989,  924,  925,  926,  927,  928,  929,  930,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  260,  761,  761,
			  260,  260,  260,  260,  260,  260,  260,  260,  260,  944,
			  944,  944,  945,  945,  945,  946,  946,  946,  260,  260,
			  260,  260,  260,  260,  260,  260,  260,  269,  269,  269, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  269,  269,  269,  269,  269,  269,  947,  947,  947,  948,
			  948,  948,  949,  949,  949,  535,  535,  535,  535,  535,
			  535,  535,  535,  535,  950,  950,  950,  951,  951,  951,
			  952,  952,  952,  960,  973, 1005, 1005,  961,  974,  297,
			  297,  297,  297,  297,  297,  297,  297,  297,  977,  977,
			  977,  978,  978,  978,  979,  979,  979,  980,  980,  308,
			  308,  308, 1182,  980,  980,  980,  980,  980,  980,  981,
			  981,  308,  308,  308, 1181,  981,  981,  981,  981,  981,
			  981,  308,  308,  308,  327,  327,  327,  327,  327,  327,
			  327,  327,  327,  983,  983,  983,  984,  984,  984,  985,

			  985,  985,  329,  329,  329,  982,  329,  329,  329,  329,
			  329,  329,  337,  337,  337,  337,  337,  337,  337,  337,
			  337,  351,  351,  351,  351,  351,  351,  351,  351,  351,
			  618,  618,  618,  987,  987,  987,  990,  990,  990,  360,
			  360,  360,  360,  360,  360,  360,  360,  360,  992,  992,
			  992,  993,  993,  993,  994,  994,  994,  995,  995,  367,
			  367,  367, 1180,  995,  995,  995,  995,  995,  995,  996,
			  996,  367,  367,  367, 1179,  996,  996,  996,  996,  996,
			  996,  367,  367,  367,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  394,  394,  394,  394,  394,  394,  394, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  394,  394,  409,  409,  409,  997,  409,  409,  409,  409,
			  409,  409,  999,  423,  423,  423,  423, 1178,  423,  423,
			  423,  423,  423,  423, 1000, 1000, 1004, 1004, 1004,  997,
			 1000, 1000, 1000, 1000, 1000, 1000, 1006, 1006, 1007, 1007,
			 1007, 1002, 1002,  423,  423,  423,  423, 1002, 1002, 1002,
			 1002, 1002, 1002,  423,  423,  423, 1029, 1029, 1001,  423,
			  423,  423, 1009, 1009, 1009, 1010, 1010, 1010, 1011, 1011,
			 1011,  423,  423, 1030, 1030,  423,  982,  423,  423,  423,
			  423,  423,  423, 1012, 1012,  423,  423,  423, 1175, 1012,
			 1012, 1012, 1012, 1012, 1012,  423,  423,  423, 1035, 1035,

			 1013, 1013,  423,  423,  423,  423, 1013, 1013, 1013, 1013,
			 1013, 1013,  423,  423, 1014, 1014, 1014,  423,  423,  423,
			  423,  423,  423,  423, 1015, 1015, 1015, 1016, 1016, 1016,
			  423,  423,  423, 1174,  423,  423,  423,  423,  423,  423,
			  423,  448,  894,  894, 1036, 1036,  423,  448,  448,  448,
			  448,  448,  448,  448,  448,  448, 1017, 1017, 1017, 1018,
			 1018, 1018, 1019, 1019, 1019,  448,  448,  448,  448,  448,
			  448,  448,  448,  448,  458,  904,  904,  458,  458,  458,
			  458,  458,  458,  458,  458,  458, 1020, 1020, 1020, 1021,
			 1021, 1021, 1022, 1022, 1022,  458,  458,  458,  458,  458, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  458,  458,  458,  458,  467,  467,  467,  467,  467,  467,
			  467,  467,  467, 1023, 1023, 1023, 1024, 1024, 1024, 1025,
			 1025, 1025,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  742,  742,  742, 1028, 1028, 1028, 1031, 1031, 1031,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  749,
			  749,  749, 1034, 1034, 1034, 1037, 1037, 1037,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  269,  269,  269,  269,
			  269,  269,  269,  269,  269,  535,  535,  535,  535,  535,
			  535,  535,  535,  535, 1058,  297,  297,  297, 1059,  297,

			  297,  297,  297,  297,  297, 1064, 1064,  327,  327,  327,
			 1173, 1064, 1064, 1064, 1064, 1064, 1064, 1065, 1065,  327,
			  327,  327, 1172, 1065, 1065, 1065, 1065, 1065, 1065,  327,
			  327,  327,  618,  618,  618,  618,  618,  618,  618,  618,
			  618, 1066, 1066, 1066, 1067, 1067, 1067, 1068, 1068, 1068,
			  360,  360,  360,  982,  360,  360,  360,  360,  360,  360,
			 1069, 1069,  423,  423,  423, 1171, 1069, 1069, 1069, 1069,
			 1069, 1069, 1070, 1070,  423,  423,  423, 1170, 1070, 1070,
			 1070, 1070, 1070, 1070,  423,  423,  423,  423,  423, 1169,
			  423,  423,  423,  423,  423,  423, 1072, 1072, 1074, 1074, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1074, 1168, 1072, 1072, 1072, 1072, 1072, 1072,  997, 1075,
			 1075, 1075, 1167, 1073, 1073, 1076, 1076, 1076,  423, 1073,
			 1073, 1073, 1073, 1073, 1073,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423, 1077, 1077, 1166, 1229,  423, 1120, 1077,
			 1077, 1077, 1077, 1077, 1077, 1078, 1078, 1121, 1165,  423,
			 1164, 1078, 1078, 1078, 1078, 1078, 1078,  423,  423,  423,
			  423,  423,  423,  423,  423,  423, 1163,  423,  448,  448,
			  448,  448,  448,  448,  448,  448,  448, 1229, 1229,  423,
			  458,  458,  458,  458,  458,  458,  458,  458,  458,  467,

			  467,  467,  467,  467,  467,  467,  467,  467,  742,  742,
			  742,  742,  742,  742, 1079,  742,  742,  742, 1080, 1080,
			 1080, 1081, 1081, 1081, 1082, 1082, 1082, 1162, 1156, 1229,
			  749,  749,  749,  749,  749,  749,  749,  749,  749, 1083,
			 1083, 1083, 1084, 1084, 1084, 1085, 1085, 1085, 1097, 1107,
			 1107, 1155, 1098, 1154, 1153, 1107, 1107, 1107, 1107, 1107,
			 1107, 1108, 1108,  618,  618,  618, 1152, 1108, 1108, 1108,
			 1108, 1108, 1108,  618,  618,  618,  618,  618,  618, 1109,
			 1109,  423,  423,  423, 1151, 1109, 1109, 1109, 1109, 1109,
			 1109, 1150, 1110, 1110,  423,  423,  423,  982, 1110, 1110, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1110, 1110, 1110, 1110, 1112, 1112,  423,  423,  423, 1149,
			 1112, 1112, 1112, 1112, 1112, 1112, 1113, 1113,  742,  742,
			  742, 1148, 1113, 1113, 1113, 1113, 1113, 1113,  997,  742,
			  742,  742, 1147, 1114, 1114,  742,  742,  742,  423, 1114,
			 1114, 1114, 1114, 1114, 1114, 1115, 1115,  749,  749,  749,
			  423, 1115, 1115, 1115, 1115, 1115, 1115,  749,  749,  749,
			  749,  749,  749, 1146, 1125,  982,  982,  423, 1126, 1145,
			 1144,  982,  982,  982,  982,  982,  982, 1136, 1136,  423,
			  279,  279,  279, 1136, 1136, 1136, 1136, 1136, 1136,  997,
			  997,  222,  222, 1143,  222,  997,  997,  997,  997,  997,

			  997, 1137, 1137,  298,  298, 1142,  298, 1137, 1137, 1137,
			 1137, 1137, 1137,  982, 1138, 1138,  328,  328, 1135,  328,
			 1138, 1138, 1138, 1138, 1138, 1138, 1134,  217, 1133, 1132,
			 1131,  217, 1139, 1139,  217, 1130, 1129,  997, 1139, 1139,
			 1139, 1139, 1139, 1139, 1140, 1140, 1128, 1127,  423, 1124,
			 1140, 1140, 1140, 1140, 1140, 1140, 1123, 1122, 1119, 1118,
			 1117, 1141, 1141, 1116, 1111, 1106,  423, 1141, 1141, 1141,
			 1141, 1141, 1141, 1157, 1157, 1105, 1104, 1103,  423, 1157,
			 1157, 1157, 1157, 1157, 1157, 1102, 1101, 1100, 1099, 1096,
			 1158, 1158, 1095, 1094, 1093,  423, 1158, 1158, 1158, 1158, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1158, 1158, 1092, 1091, 1159, 1159, 1090, 1089, 1088,  982,
			 1159, 1159, 1159, 1159, 1159, 1159, 1087, 1086, 1071, 1063,
			 1062, 1160, 1160, 1061, 1060, 1057,  997, 1160, 1160, 1160,
			 1160, 1160, 1160,  423,  423, 1056, 1055, 1054,  423,  423,
			  423,  423,  423,  423,  423, 1053, 1050, 1049, 1048, 1047,
			 1161, 1161, 1046, 1045, 1044,  423, 1161, 1161, 1161, 1161,
			 1161, 1161,  423,  423, 1043, 1042, 1039,  423,  423,  423,
			  423,  423,  423,  423, 1038, 1033, 1032, 1027,  448, 1176,
			 1176, 1008, 1003,  998,  423, 1176, 1176, 1176, 1176, 1176,
			 1176, 1177, 1177,  991,  986,  976,  423, 1177, 1177, 1177,

			 1177, 1177, 1177,  975,  972,  971,  970,  969, 1189, 1189,
			  968,  967,  966,  423, 1189, 1189, 1189, 1189, 1189, 1189,
			  423,  423,  965,  964,  963,  423,  423,  423,  423,  423,
			  423,  423,  962,  959,  958,  957,  956,  423,  423,  955,
			  954,  953,  423,  423,  423,  423,  423,  423,  423,  242,
			  242,  250,  919,  914,  423,  242,  242,  242,  242,  242,
			  242,  910,  242,  905,  900,  895,  893,  889,  884,  879,
			  874,  423,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  115,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  156,  156,

			  156,  156,  156,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  167,  167,  167,  179,  179,  179,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  179,  179,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  200,  228,  228,  228,  228,  228,  228,
			  228,  228,  228,  228,  228,  228,  863,  228,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  848,
			  250,  260,  260,  260,  847,  260,  260,  260,  260,  260,
			  260,  260,  842,  260,  294,  294,  294,  294,  294,  294, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  294,  294,  294,  294,  294,  294,  294,  294,  308,  308,
			  308,  308,  308,  308,  308,  308,  308,  308,  308,  825,
			  308,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  820,  329,  337,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  814,  337,  351,  351,  351,
			  351,  351,  351,  351,  351,  351,  351,  813,  351,  367,
			  367,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  808,  367,  378,  378,  378,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  807,  378,  394,  394,  394,  394,
			  394,  394,  394,  394,  806,  394,  394,  394,  805,  394,

			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  804,  409,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  801,  423,  440,  440,  800,  440,
			  799,  796,  440,  440,  440,  440,  795,  794,  793,  440,
			  448,  448,  448,  448,  448,  448,  448,  448,  448,  448,
			  448,  792,  448,  458,  458,  458,  791,  458,  458,  458,
			  458,  458,  458,  458,  790,  458,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  789,  215,  224,
			  224,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  788,  224,  269,  269,  269,  269,  269,  269,  269,  269, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  269,  269,  269,  787,  269,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,  297,  786,  297,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  785,
			  327,  360,  360,  360,  360,  360,  360,  360,  360,  360,
			  360,  360,  784,  360,  467,  467,  467,  467,  467,  467,
			  467,  467,  467,  467,  467,  783,  467,  535,  535,  535,
			  535,  535,  535,  535,  535,  535,  535,  535,  782,  535,
			  618,  618,  618,  618,  618,  618,  618,  618,  618,  618,
			  618,  777,  618,  742,  742,  742,  742,  742,  742,  742,
			  742,  742,  742,  742,  742,  776,  742,  749,  749,  749,

			  749,  749,  749,  749,  749,  749,  749,  749,  771,  749,
			  767,  762,  757,  752,  750,  749,  748,  743,  742,  740,
			  735,  724,  719,  710,  709,  704,  473,  468,  690,  685,
			  665,  664,  663,  662,  657,  653,  648,  644,  639,  638,
			  633,  629,  617,  612,  608,  603,  602,  597,  586,  581,
			  577,  295,  566,  565,  564,  563,  562,  561,  550,  549,
			  548,  547,  544,  543,  524,  519,  510,  509,  504,  275,
			  270,  241,  236,  473,  468,  467,  439,  434,  422,  408,
			  403,  393,  388,  366,  361,  350,  345,  327,  325,  320,
			  305,  300,  297,  295,  293,  292,  291,  288,  287,  286, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  285,  284,  283,  282,  281,  280,  278,  276,  275,  270,
			  269,  241,  236,  227,  225,  224,  215, 1229,   96,   96,
			   37, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, yy_Dummy>>,
			1, 83, 4200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4282)
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
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,   31,   32,   31,   32,   39,   45,
			   39,   45,    1,    2,    2,    2, 1263,   78,    2,   78,
			   98,  110,   98,  110,    2,  113,  113,  127,  146,  127,
			  146, 1245,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    3,    3,    3,    4,    4,
			    4,   59,   59,    4,   60,   60,    3,   72,   72,    4,
			   42,    3,   73,   73,    4,   17,   17,   17,  105,  105,
			   18,   18,   18,  282,   91,   17,   91,  282,   17,   17,
			   18,  106,  106,   18,   18,   56,   56,   56,   42, 1227,

			    3,   42,    3,    4,    3,    4,   42,    4,    5,   58,
			   58,   58,   42,   53,   53,   53,   53,   53,   53,   53,
			   61,   61,   61,   65,   17,   65,   69,   69,   69,   18,
			   54,   54,   54,   54,   54,   54,   54,   63,   63,   63,
			   63,   63,   63,   63,   64,   64,   64,   64,   64,   64,
			   64,   67,   71,   71,   71,  122,  122,    5,    5,    5,
			    5,    5,    5,    5,    5,    5,    5,    5,    6,   74,
			   74,   74,  123,  123,   65,   65,   65,   65,   65,   65,
			   65,  102,  102,  102,  104,  104,  104,  107,  107,  107,
			  119,  119,  119,  121,  121,  121,  124,  124,  124, 1225, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   67,   67,   67,   67,   67,   67,   67,  134,  134,  134,
			  134,  134,  134,  134,  138,  138,  138,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    7,  183,
			    7,  183,    7,    7,  140,  140,  140, 1224,    7,  137,
			  137,  137,  137,  137,  137,  137,  141,  141,  142,  142,
			  143,  143,  143,  145,  145,  145,  145,  145,  145,  145,
			  148,  149,  149,  149,  151,  151,  151,  152,  152,  153,
			  153,  154,  154,  154,  160,  160,  160,    7,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    8,  214,
			    8,  214,    8,    8,  162,  162,  162, 1221,    8,  163,

			  163,  164,  164,  148,  148,  148,  148,  148,  148,  148,
			  165,  165,  165,  169,  169,  169,  169,  169,  169,  169,
			  172,  172,  172,  174,  174,  174,  175,  175,  176,  176,
			  177,  177,  177,  186,  186,  186, 1220,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
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
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   19,  187,   19,  193,  193,  193,  195,  195,
			  195,  190,  196,  196,  181,  197,  197,  198,  198,  198,
			 1219,  187,  190,  190,  190,  190,  190,  190,  190,  562,

			  159,  200,  200,  200,  200,  200,  200,  200,  202,  562,
			  202,  207,  207,  207,   19,  210,  210,  203,  209,  209,
			  209,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   20,  159,   20,  181,  181,  181,  181,  181,
			  181,  181, 1218,  159,  159,  159,  159,  159,  159,  159,
			  201,  201,  201,  201,  201,  201,  201,  211,  211,  202,
			  202,  202,  202,  202,  202,  202,  203,  203,  203,  203,
			  203,  203,  203, 1217,   20,  212,  212,  212,  223, 1215,
			  223,   20,   20,   20,   20,   20,   20,   20,   20,   20,
			   20,   20,   21,   21,   21,   21,   21,   21,   21,   21, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   23,  215,  215,  215,  215,  215,
			  215,  215, 1214,  221,  221,  221,  224,  224,  224,  224,
			  224,  224,  224,  217,  221,  219,  220,  232,  232,  227,
			 1213,  227,  229,  229,  229,  233,  233,  218,  226,  226,
			  227,  228,  228,  228,  228,  228,  228,  228,  246,  246,

			   23,   23, 1212,   23,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   23,   24,  217,  218,  219,  220,  247,
			  247,  226,  256,  256,  226,  231,  231,  231, 1211,  218,
			  234,  234,  234,  236,  236,  236,  237,  237,  237,  238,
			  238,  238,  239,  239,  239,  240,  240,  240,  241,  241,
			  241,  242,  242,  242,  242,  242,  242,  242,  257,  257,
			   24,   24, 1209,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   25,   25,   25,  243,  243,  243,
			  245,  245,  245,  265,  265,   25,  248,  248,  248,  253,
			  253,  253,  255,  255,  255,  277,  250,  277,  250,  266, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  266,  252,  258,  258,  258,  262,  262,  262,  264,  264,
			  264, 1208,  252,  261,  267,  267,  267,  307,  307,  261,
			  270,  270,  270, 1207,   25,   25,   25,   25,   25,   25,
			   25,   25,   25,   25,   25,   26,   26,   26,  269,  269,
			  269,  269,  269,  269,  269, 1206,   26,  250,  250,  250,
			  250,  250,  250,  250,  252,  252,  252,  252,  252,  252,
			  252,  261,  261,  261,  261,  261,  261,  261,  271,  271,
			  271,  272,  272,  272,  273,  273,  273,  274,  274,  274,
			  275,  275,  275,  315,  315,   26,   26,   26,   26,   26,
			   26,   26,   26,   26,   26,   26,   27,  296, 1205,  296,

			  297,  297,  297,  297,  297,  297,  297,  300,  300,  300,
			  301,  301,  301,  302,  302,  302,  303,  303,  303,  304,
			  304,  304,  305,  305,  305,  306,  966,  306,  312,  312,
			  312,  314,  314,  314,  316,  316,  966,  326,   27,  326,
			   27,  317,  317,  317, 1203,   27,   27,   27,   27,   27,
			   27,   27,   27,   27,   27,   27,   28,  310,  310,  320,
			  320,  320,  923,  310,  310,  310,  310,  310,  310,  311,
			  311,  321,  321,  321, 1202,  311,  311,  311,  311,  311,
			  311,  322,  322,  322,  323,  323,  323,  324,  324,  324,
			  923,  310,  325,  325,  325,  330,  330,  330,   28, 1201, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   28,  332,  332,  332,  923,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   29,  327,  327,  327,
			  327,  327,  327,  327,  333,  333,   29,  329,  329,  329,
			  329,  329,  329,  329,  334,  334,  335,  335,  335,  337,
			  337,  337,  337,  337,  337,  337,  338,  338,  338,  340,
			  340,  340,  341,  341,  342,  342,  355,  355,   29,   29,
			  343,  343,  343,  356,  356,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   30,  345,  345,  345,
			  346,  346,  346,  347,  347,  347,   30,  348,  348,  348,
			  349,  349,  349,  350,  350,  350,  351,  351,  351,  351,

			  351,  351,  351,  352,  352,  352,  354,  354,  354,  357,
			  357,  357,  359, 1200,  359,  361,  361,  361,   30,   30,
			  362,  362,  362,  374,  374,   30,   30,   30,   30,   30,
			   30,   30,   30,   30,   30,   30,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   33,   33,
			   33,   33,   33,   33,   33,   33,   33,   33,   35, 1199, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   35,  375,  375,   35,  363,  363,  363, 1198,   35,  364,
			  364,  364,  365,  365,  365,  383,  383,  360,  366,  366,
			  366,  371,  371,  371, 1197,  369,  369,  373,  373,  373,
			 1195,  369,  369,  369,  369,  369,  369,  376,  376,  376,
			  380,  380,  380,  418,   35,  418,   35,   35,   35,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   36,  369,
			   36,  384,  384,   36,  382,  382,  382, 1194,   36,  360,
			  360,  360,  360,  360,  360,  360,  370,  370,  385,  385,
			  385, 1193,  370,  370,  370,  370,  370,  370,  388,  388,
			  388,  389,  389,  389,  390,  390,  390,  391,  391,  391,

			  392,  392,  392,  558,   36,  558,   36,   36,   36,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,  118,  393,
			  393,  393,  395,  395,  395,  397,  397,  397,  398,  398,
			  399,  399,  400,  400,  400,  403,  403,  403,  404,  404,
			  404,  414,  414,  118,  409, 1192,  118,  405,  405,  405,
			  406,  406,  406,  407,  407,  407,  408,  408,  408,  118,
			  118,  118,  118,  118,  118,  118,  158,  411,  411,  411,
			  413,  413,  413,  415,  415,  416,  416,  416,  425,  425,
			  425,  427,  427,  427,  428,  428,  429,  429,  430,  430,
			  430,  158,  432,  432,  158,  409,  409,  409,  409,  409, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  409,  409,  444,  444,  423,  423, 1191,  158,  158,  158,
			  158,  158,  158,  158,  170,  423,  423,  423,  423,  423,
			  423,  423,  434,  434,  434,  432,  445,  445,  432,  435,
			  435,  435,  436,  436,  436,  437,  437,  437, 1190,  170,
			  454,  454,  170,  438,  438,  438,  439,  439,  439,  441,
			  441,  441,  443,  443,  443,  170,  170,  170,  170,  170,
			  170,  170,  191,  440,  440,  440,  440,  440,  440,  440,
			  446,  446,  446,  451,  451,  451,  453,  453,  453,  455,
			  455,  456,  456,  456,  460,  460,  460,  191,  463,  463,
			  191,  462,  462,  462,  464,  464,  465,  465,  465,  468,

			  468,  468,  954,  191,  191,  191,  191,  191,  191,  191,
			  278,  954,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  448, 1188,  448, 1187,  278,  278,  278,  278,  278,  278,
			  278,  278,  287,  287,  287,  287,  287, 1185,  459,  469,
			  469,  469,  287,  287,  459, 1184,  287,  287,  450,  470,
			  470,  470,  287,  424,  471,  471,  471,  477,  477,  450, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  467,  467,  467,  467,  467,  467,  467,  472,  472,  472,
			 1183,  448,  448,  448,  448,  448,  448,  448,  424,  478,
			  478,  424,  473,  473,  473,  481,  459,  459,  459,  459,
			  459,  459,  459, 1182,  424,  424,  424,  424,  424,  424,
			  424,  450,  450,  450,  450,  450,  450,  450,  474,  474,
			  474,  476,  476,  476,  479,  479,  479,  481,  484,  484,
			  484,  486,  486,  486,  487,  487, 1181,  481,  488,  488,
			  489,  489,  489,  492,  492,  492,  493,  493,  493,  494,
			  494,  494,  496,  496,  497,  497,  497,  499,  499,  499,
			  500,  500,  501,  501,  502,  502,  502,  504,  504,  504,

			  505,  505,  505,  506,  506,  506,  507,  507,  507,  508,
			  508,  508,  509,  509,  509,  511,  511,  512,  512,  512,
			  514,  514,  514,  515,  515,  516,  516,  517,  517,  517,
			  519,  519,  519,  520,  520,  520,  521,  521,  521,  522,
			  522,  522,  523,  523,  523,  524,  524,  524,  525,  525,
			  525,  527,  527,  527,  528,  528,  529,  529,  530,  530,
			  530,  532,  532,  532,  533,  533,  533,  534,  534,  534,
			  535,  535,  535,  535,  535,  535,  535,  536,  536,  536,
			  538,  538,  538,  539,  539,  540,  540,  541,  541,  541,
			  567,  567,  567,  569,  569,  569,  570,  570,  571,  571, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  572,  572,  572,  574,  574,  574,  575,  575,  575,  576,
			  576,  576,  578,  578,  581,  581,  581, 1180,  578,  578,
			  578,  578,  578,  578,  579,  579,  582,  582,  582, 1179,
			  579,  579,  579,  579,  579,  579,  580,  580,  583,  583,
			  583, 1178,  580,  580,  580,  580,  580,  580,  584,  584,
			  584,  585,  585,  585,  586,  586,  586,  587,  587,  587,
			  588,  588,  588,  589,  589,  589,  590,  590,  590,  592,
			  592,  592,  593,  593,  594,  594,  595,  595,  595,  597,
			  597,  597,  598,  598,  598,  599,  599,  599,  600,  600,
			  600,  601,  601,  601,  602,  602,  602,  603,  603,  603,

			  604,  604,  604,  605,  605,  605,  606,  606,  606,  607,
			  607,  607,  608,  608,  608,  609,  609,  609,  610,  610,
			  610,  611,  611,  611,  612,  612,  612,  613,  613,  613,
			  614,  614,  614,  615,  615,  615,  616,  616,  616,  617,
			  617,  617,  618,  618,  618,  618,  618,  618,  618,  619,
			  619,  619,  621,  621,  621,  622,  622,  623,  623,  624,
			  624,  624,  626,  626,  626,  627,  627,  627,  628,  628,
			  628,  630,  630,  633,  633,  633, 1175,  630,  630,  630,
			  630,  630,  630,  631,  631,  634,  634,  634, 1173,  631,
			  631,  631,  631,  631,  631,  632,  632,  635,  635,  635, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1172,  632,  632,  632,  632,  632,  632,  636,  636,  636,
			  637,  637,  637,  638,  638,  638,  639,  639,  639,  640,
			  640,  640,  641,  641,  641,  642,  642,  642,  643,  643,
			  643,  644,  644,  644,  645,  645,  645,  646,  646,  646,
			  647,  647,  647,  648,  648,  648,  649,  649,  649,  650,
			  650,  650,  651,  651,  651,  652,  652,  652,  653,  653,
			  653,  654,  654,  654,  655,  655,  655,  656,  656,  656,
			  657,  657,  657,  658,  658,  658,  659,  659,  659,  660,
			  660,  660,  661,  661,  661,  662,  662,  662,  666,  668,
			  668,  668,  670,  670,  670,  671,  671,  672,  672,  673,

			  673,  673,  678,  678,  678,  680,  680,  680,  681,  681,
			 1171,  677,  677,  666,  682,  682,  666,  677,  677,  677,
			  677,  677,  677,  683,  683,  683,  685,  685,  685,  666,
			  666,  666,  666,  666,  666,  666,  675,  686,  686,  686,
			  687,  687,  687,  696,  696,  677,  688,  688,  688,  689,
			  689,  689,  690,  690,  690,  692,  692,  692,  693,  693,
			  693,  694,  694,  694,  700,  700,  675,  675,  697,  697,
			  697,  699,  699,  699,  701,  701, 1170,  675,  675,  675,
			  675,  675,  675,  675,  676,  676,  702,  702,  702, 1169,
			  676,  676,  676,  676,  676,  676,  704,  704,  704,  705, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  705,  705,  706,  706,  706,  707,  707,  707,  708,  708,
			  708,  709,  709,  709,  676,  676,  711,  711,  676,  712,
			  712,  712,  714,  714,  714,  676,  676,  676,  676,  676,
			  676,  676,  715,  715,  716,  716,  717,  717,  717,  719,
			  719,  719,  720,  720,  720,  721,  721,  721,  722,  722,
			  722,  723,  723,  723,  724,  724,  724,  725,  725,  725,
			  727,  727,  727,  728,  728,  729,  729,  730,  730,  730,
			  732,  732,  732,  733,  733,  733,  734,  734,  734,  735,
			  735,  735,  736,  736,  736,  737,  737,  737,  738,  738,
			  738,  739,  739,  739,  740,  740,  740,  741,  742,  743,

			  743,  743,  744,  744,  744,  745,  745,  745,  746,  746,
			  746,  747,  747,  747,  748,  748,  748,  838,  838,  741,
			  749,  749,  749,  749,  749,  749,  749,  751,  751,  751,
			  752,  752,  752,  753,  753,  753,  754,  754,  754,  741,
			  755,  755,  755,  756,  756,  756,  757,  757,  757,  839,
			  839,  742,  742,  742,  742,  742,  742,  742,  758,  758,
			  758,  759,  759,  759,  760,  760,  760,  761,  761,  761,
			  762,  762,  762,  763,  763,  763,  764,  764,  764,  765,
			  765,  765,  766,  766,  766,  767,  767,  767,  768,  768,
			  768,  769,  769,  769,  770,  770,  770,  771,  771,  771, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  772,  772,  772,  773,  773,  773,  774,  774,  774,  775,
			  775,  775,  776,  776,  776,  777,  777,  777,  778,  778,
			  778,  779,  779,  779,  780,  780,  780,  781,  781,  781,
			  782,  782,  782,  792,  804,  870,  870,  792,  804,  808,
			  808,  808,  809,  809,  809,  810,  810,  810,  811,  811,
			  811,  812,  812,  812,  813,  813,  813,  815,  815,  817,
			  817,  817, 1168,  815,  815,  815,  815,  815,  815,  816,
			  816,  818,  818,  818, 1165,  816,  816,  816,  816,  816,
			  816,  819,  819,  819,  820,  820,  820,  821,  821,  821,
			  822,  822,  822,  823,  823,  823,  824,  824,  824,  825,

			  825,  825,  826,  826,  826,  816,  827,  827,  827,  828,
			  828,  828,  829,  829,  829,  830,  830,  830,  831,  831,
			  831,  832,  832,  832,  833,  833,  833,  834,  834,  834,
			  835,  835,  835,  837,  837,  837,  840,  840,  840,  842,
			  842,  842,  843,  843,  843,  844,  844,  844,  845,  845,
			  845,  846,  846,  846,  847,  847,  847,  849,  849,  851,
			  851,  851, 1164,  849,  849,  849,  849,  849,  849,  850,
			  850,  852,  852,  852, 1163,  850,  850,  850,  850,  850,
			  850,  853,  853,  853,  854,  854,  854,  855,  855,  855,
			  856,  856,  856,  857,  857,  857,  858,  858,  858,  859, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  859,  859,  860,  860,  860,  850,  861,  861,  861,  862,
			  862,  862,  864,  864,  867,  867,  867, 1162,  864,  864,
			  864,  864,  864,  864,  865,  865,  869,  869,  869, 1158,
			  865,  865,  865,  865,  865,  865,  871,  871,  872,  872,
			  872,  866,  866,  874,  874,  874,  864,  866,  866,  866,
			  866,  866,  866,  875,  875,  875,  927,  927,  865,  876,
			  876,  876,  877,  877,  877,  878,  878,  878,  879,  879,
			  879,  880,  880,  928,  928,  866, 1157,  880,  880,  880,
			  880,  880,  880,  881,  881,  884,  884,  884, 1156,  881,
			  881,  881,  881,  881,  881,  885,  885,  885,  937,  937,

			  882,  882,  886,  886,  886,  880,  882,  882,  882,  882,
			  882,  882,  883,  883,  887,  887,  887,  881,  883,  883,
			  883,  883,  883,  883,  888,  888,  888,  889,  889,  889,
			  890,  890,  890, 1155,  882,  891,  891,  891,  892,  892,
			  892,  894,  894,  894,  938,  938,  883,  895,  895,  895,
			  896,  896,  896,  897,  897,  897,  898,  898,  898,  899,
			  899,  899,  900,  900,  900,  901,  901,  901,  902,  902,
			  902,  903,  903,  903,  904,  904,  904,  905,  905,  905,
			  906,  906,  906,  907,  907,  907,  908,  908,  908,  909,
			  909,  909,  910,  910,  910,  911,  911,  911,  912,  912, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  912,  913,  913,  913,  914,  914,  914,  915,  915,  915,
			  916,  916,  916,  917,  917,  917,  918,  918,  918,  919,
			  919,  919,  920,  920,  920,  921,  921,  921,  922,  922,
			  922,  924,  924,  924,  926,  926,  926,  929,  929,  929,
			  931,  931,  931,  932,  932,  932,  933,  933,  933,  934,
			  934,  934,  936,  936,  936,  939,  939,  939,  941,  941,
			  941,  942,  942,  942,  943,  943,  943,  944,  944,  944,
			  945,  945,  945,  946,  946,  946,  947,  947,  947,  948,
			  948,  948,  949,  949,  949,  950,  950,  950,  951,  951,
			  951,  952,  952,  952,  972,  977,  977,  977,  972,  978,

			  978,  978,  979,  979,  979,  980,  980,  983,  983,  983,
			 1154,  980,  980,  980,  980,  980,  980,  981,  981,  984,
			  984,  984, 1153,  981,  981,  981,  981,  981,  981,  985,
			  985,  985,  986,  986,  986,  987,  987,  987,  988,  988,
			  988,  989,  989,  989,  990,  990,  990,  991,  991,  991,
			  992,  992,  992,  981,  993,  993,  993,  994,  994,  994,
			  995,  995, 1003, 1003, 1003, 1152,  995,  995,  995,  995,
			  995,  995,  996,  996, 1004, 1004, 1004, 1151,  996,  996,
			  996,  996,  996,  996,  999,  999, 1005, 1005, 1005, 1150,
			  999,  999,  999,  999,  999,  999, 1000, 1000, 1006, 1006, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1006, 1149, 1000, 1000, 1000, 1000, 1000, 1000,  996, 1007,
			 1007, 1007, 1148, 1001, 1001, 1008, 1008, 1008,  999, 1001,
			 1001, 1001, 1001, 1001, 1001, 1002, 1002, 1009, 1009, 1009,
			 1000, 1002, 1002, 1002, 1002, 1002, 1002, 1010, 1010, 1010,
			 1011, 1011, 1011, 1012, 1012, 1147, 1079, 1001, 1091, 1012,
			 1012, 1012, 1012, 1012, 1012, 1013, 1013, 1091, 1145, 1002,
			 1144, 1013, 1013, 1013, 1013, 1013, 1013, 1014, 1014, 1014,
			 1015, 1015, 1015, 1016, 1016, 1016, 1143, 1012, 1017, 1017,
			 1017, 1018, 1018, 1018, 1019, 1019, 1019, 1026, 1079, 1013,
			 1020, 1020, 1020, 1021, 1021, 1021, 1022, 1022, 1022, 1023,

			 1023, 1023, 1024, 1024, 1024, 1025, 1025, 1025, 1027, 1027,
			 1027, 1028, 1028, 1028, 1026, 1029, 1029, 1029, 1030, 1030,
			 1030, 1031, 1031, 1031, 1032, 1032, 1032, 1142, 1135, 1026,
			 1033, 1033, 1033, 1034, 1034, 1034, 1035, 1035, 1035, 1036,
			 1036, 1036, 1037, 1037, 1037, 1038, 1038, 1038, 1053, 1064,
			 1064, 1134, 1053, 1133, 1132, 1064, 1064, 1064, 1064, 1064,
			 1064, 1065, 1065, 1066, 1066, 1066, 1128, 1065, 1065, 1065,
			 1065, 1065, 1065, 1067, 1067, 1067, 1068, 1068, 1068, 1069,
			 1069, 1074, 1074, 1074, 1127, 1069, 1069, 1069, 1069, 1069,
			 1069, 1126, 1070, 1070, 1075, 1075, 1075, 1065, 1070, 1070, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1070, 1070, 1070, 1070, 1072, 1072, 1076, 1076, 1076, 1125,
			 1072, 1072, 1072, 1072, 1072, 1072, 1073, 1073, 1080, 1080,
			 1080, 1124, 1073, 1073, 1073, 1073, 1073, 1073, 1070, 1081,
			 1081, 1081, 1123, 1077, 1077, 1082, 1082, 1082, 1072, 1077,
			 1077, 1077, 1077, 1077, 1077, 1078, 1078, 1083, 1083, 1083,
			 1073, 1078, 1078, 1078, 1078, 1078, 1078, 1084, 1084, 1084,
			 1085, 1085, 1085, 1122, 1096, 1107, 1107, 1077, 1096, 1121,
			 1120, 1107, 1107, 1107, 1107, 1107, 1107, 1108, 1108, 1078,
			 1250, 1250, 1250, 1108, 1108, 1108, 1108, 1108, 1108, 1109,
			 1109, 1244, 1244, 1117, 1244, 1109, 1109, 1109, 1109, 1109,

			 1109, 1110, 1110, 1252, 1252, 1116, 1252, 1110, 1110, 1110,
			 1110, 1110, 1110, 1108, 1112, 1112, 1254, 1254, 1105, 1254,
			 1112, 1112, 1112, 1112, 1112, 1112, 1104, 1243, 1103, 1102,
			 1101, 1243, 1113, 1113, 1243, 1100, 1099, 1110, 1113, 1113,
			 1113, 1113, 1113, 1113, 1114, 1114, 1098, 1097, 1112, 1095,
			 1114, 1114, 1114, 1114, 1114, 1114, 1094, 1093, 1090, 1089,
			 1087, 1115, 1115, 1086, 1071, 1063, 1113, 1115, 1115, 1115,
			 1115, 1115, 1115, 1136, 1136, 1061, 1060, 1059, 1114, 1136,
			 1136, 1136, 1136, 1136, 1136, 1058, 1057, 1056, 1054, 1052,
			 1137, 1137, 1051, 1050, 1047, 1115, 1137, 1137, 1137, 1137, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1137, 1137, 1046, 1045, 1138, 1138, 1044, 1043, 1042, 1136,
			 1138, 1138, 1138, 1138, 1138, 1138, 1041, 1040,  998,  976,
			  975, 1139, 1139,  974,  973,  971, 1137, 1139, 1139, 1139,
			 1139, 1139, 1139, 1140, 1140,  970,  969,  968, 1138, 1140,
			 1140, 1140, 1140, 1140, 1140,  967,  965,  964,  963,  961,
			 1141, 1141,  960,  959,  958, 1139, 1141, 1141, 1141, 1141,
			 1141, 1141, 1159, 1159,  957,  956,  953, 1140, 1159, 1159,
			 1159, 1159, 1159, 1159,  940,  935,  930,  925,  893, 1160,
			 1160,  873,  868,  863, 1141, 1160, 1160, 1160, 1160, 1160,
			 1160, 1161, 1161,  841,  836,  806, 1159, 1161, 1161, 1161,

			 1161, 1161, 1161,  805,  803,  802,  801,  800, 1176, 1176,
			  799,  798,  797, 1160, 1176, 1176, 1176, 1176, 1176, 1176,
			 1177, 1177,  796,  795,  794, 1161, 1177, 1177, 1177, 1177,
			 1177, 1177,  793,  791,  790,  789,  786, 1189, 1189,  785,
			  784,  783, 1176, 1189, 1189, 1189, 1189, 1189, 1189, 1247,
			 1247,  750,  731,  726, 1177, 1247, 1247, 1247, 1247, 1247,
			 1247,  718, 1247,  713,  703,  698,  695,  684,  679,  674,
			  669, 1189, 1230, 1230, 1230, 1230, 1230, 1230, 1230, 1230,
			 1230, 1230, 1230, 1230, 1230, 1230, 1231, 1231, 1231, 1231,
			 1231, 1231, 1231, 1231, 1231, 1231, 1231, 1231, 1231, 1231, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232, 1232,
			 1232, 1232, 1232, 1232, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1234, 1234,
			 1234, 1234, 1234, 1234, 1234, 1234, 1234, 1234, 1234, 1234,
			 1234, 1234, 1235, 1235, 1235, 1235, 1235, 1235, 1235, 1235,
			 1235, 1235, 1235, 1235, 1235, 1235, 1236, 1236, 1236, 1236,
			 1236, 1236, 1236, 1236, 1236, 1236, 1236, 1236, 1236, 1236,
			 1237, 1237, 1237, 1237, 1237, 1237, 1237, 1237, 1237, 1237,
			 1237, 1237, 1237, 1237, 1238, 1238, 1238, 1238, 1238, 1238,
			 1238, 1238, 1238, 1238, 1238, 1238, 1238, 1238, 1239, 1239,

			 1239, 1239, 1239, 1239, 1239, 1239, 1239, 1239, 1239, 1239,
			 1239, 1239, 1240, 1240, 1240, 1240, 1240, 1240, 1240, 1240,
			 1240, 1240, 1240, 1240, 1240, 1240, 1241, 1241, 1241, 1241,
			 1241, 1241, 1241, 1241, 1241, 1241, 1241, 1241, 1241, 1241,
			 1242, 1242, 1242, 1242, 1242, 1242, 1242, 1242, 1242, 1242,
			 1242, 1242, 1242, 1242, 1246, 1246, 1246, 1246, 1246, 1246,
			 1246, 1246, 1246, 1246, 1246, 1246,  665, 1246, 1248, 1248,
			 1248, 1248, 1248, 1248, 1248, 1248, 1248, 1248, 1248,  629,
			 1248, 1249, 1249, 1249,  625, 1249, 1249, 1249, 1249, 1249,
			 1249, 1249,  620, 1249, 1251, 1251, 1251, 1251, 1251, 1251, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1251, 1251, 1251, 1251, 1251, 1251, 1251, 1251, 1253, 1253,
			 1253, 1253, 1253, 1253, 1253, 1253, 1253, 1253, 1253,  596,
			 1253, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255,  591, 1255, 1256, 1256, 1256, 1256, 1256, 1256,
			 1256, 1256, 1256, 1256, 1256,  577, 1256, 1257, 1257, 1257,
			 1257, 1257, 1257, 1257, 1257, 1257, 1257,  573, 1257, 1258,
			 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258, 1258,
			  568, 1258, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259,
			 1259, 1259, 1259, 1259,  566, 1259, 1260, 1260, 1260, 1260,
			 1260, 1260, 1260, 1260,  565, 1260, 1260, 1260,  564, 1260,

			 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261,
			 1261,  563, 1261, 1262, 1262, 1262, 1262, 1262, 1262, 1262,
			 1262, 1262, 1262, 1262,  561, 1262, 1264, 1264,  560, 1264,
			  559,  557, 1264, 1264, 1264, 1264,  556,  555,  554, 1264,
			 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265, 1265,
			 1265,  553, 1265, 1266, 1266, 1266,  552, 1266, 1266, 1266,
			 1266, 1266, 1266, 1266,  551, 1266, 1267, 1267, 1267, 1267,
			 1267, 1267, 1267, 1267, 1267, 1267, 1267,  550, 1267, 1268,
			 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268, 1268,
			  549, 1268, 1269, 1269, 1269, 1269, 1269, 1269, 1269, 1269, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1269, 1269, 1269,  548, 1269, 1270, 1270, 1270, 1270, 1270,
			 1270, 1270, 1270, 1270, 1270, 1270,  546, 1270, 1271, 1271,
			 1271, 1271, 1271, 1271, 1271, 1271, 1271, 1271, 1271,  545,
			 1271, 1272, 1272, 1272, 1272, 1272, 1272, 1272, 1272, 1272,
			 1272, 1272,  544, 1272, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273, 1273, 1273, 1273, 1273,  543, 1273, 1274, 1274, 1274,
			 1274, 1274, 1274, 1274, 1274, 1274, 1274, 1274,  542, 1274,
			 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275,
			 1275,  537, 1275, 1276, 1276, 1276, 1276, 1276, 1276, 1276,
			 1276, 1276, 1276, 1276, 1276,  531, 1276, 1277, 1277, 1277,

			 1277, 1277, 1277, 1277, 1277, 1277, 1277, 1277,  526, 1277,
			  518,  513,  503,  498,  495,  491,  490,  485,  483,  480,
			  475,  466,  461,  458,  457,  452,  447,  442,  431,  426,
			  422,  421,  420,  417,  412,  401,  396,  386,  381,  377,
			  372,  368,  358,  353,  344,  339,  336,  331,  318,  313,
			  309,  294,  293,  292,  291,  290,  289,  288,  286,  285,
			  284,  283,  281,  280,  268,  263,  260,  259,  254,  249,
			  244,  235,  230,  213,  208,  204,  199,  194,  189,  178,
			  173,  166,  161,  155,  150,  144,  139,  131,  125,  120,
			  108,  103,  100,   95,   94,   93,   92,   90,   89,   88, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   87,   86,   85,   84,   83,   82,   80,   76,   75,   70,
			   68,   62,   57,   52,   48,   47,   41,   37,   12,   11,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, yy_Dummy>>,
			1, 83, 4200)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1277)
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
			    0,    0,   12,   54,   57,  106,  166,  226,  286,  347,
			    0, 4217, 4216,  409,    0,    0,    0,   74,   79,  470,
			  530,  591,    0,  652,  712,  773,  834,  894,  954, 1014,
			 1074,    2,    3, 1135,    0, 1196, 1256, 4217, 4220,    7,
			 4220, 4204,   64,    0, 4220,    8, 4220, 4203, 4197, 4220,
			    0, 4220, 4207,   58,   75, 4220,   44, 4159,   58,   10,
			   12,   69, 4160,   82,   89,  119, 4220,  145, 4198,   75,
			 4156,  101,   16,   20,  118, 4157, 4157, 4220,   16, 4220,
			 4194,    0, 4185, 4184, 4179, 4180, 4162, 4172, 4175, 4164,
			 4158,   50, 4172, 4162, 4174, 4191, 4220, 4220,   19, 4220,

			 4180,    0,  130, 4138,  133,   27,   39,  136, 4139, 4220,
			   20, 4220, 4220,   11, 4220, 4220, 4220, 4220, 1304,  139,
			 4136,  142,  104,  120,  145, 4137, 4220,   26, 4220, 4220,
			 4220, 4175, 4220,    0,  152, 4220, 4220,  184,  163, 4133,
			  183,  195,  196,  199, 4134,  198,   27, 4220,  248,  210,
			 4131,  213,  216,  217,  220, 4132, 4220, 4220, 1352,  488,
			  223, 4129,  243,  248,  249,  259, 4130, 4220, 4220,  258,
			 1400, 4220,  269, 4127,  272,  275,  276,  279, 4128, 4220,
			 4220,  480, 4220,  228, 4220, 4220,  332,  452, 4220, 4161,
			  437, 1448,    0,  424, 4124,  427,  431,  433,  436, 4125, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  446,  495,  504,  511, 4163, 4220, 4220,  460, 4121,  467,
			  464,  505,  524, 4122,  288,  600, 4220,  667,  681,  669,
			  670,  662,    0,  577,  611, 4220,  674,  678,  636,  631,
			 4119,  674,  626,  633,  679, 4120,  682,  685,  688,  691,
			  694,  697,  696,  726, 4117,  729,  647,  667,  735, 4118,
			  792, 4220,  799,  738, 4115,  741,  671,  706,  751, 4116,
			 4159,  806,  754, 4112,  757,  732,  747,  763, 4113,  783,
			  769,  817,  820,  823,  826,  829, 4220,  794, 1509,    0,
			 4141, 4125,   62, 4124, 4129, 4126, 4120, 1551, 4119, 4119,
			 4131, 4125, 4125, 4116, 4149, 4220,  896,  845,    0, 4220,

			  856,  859,  862,  865,  868,  871,  924,  803, 4220, 4136,
			  943,  955,  877, 4096,  880,  832,  882,  890, 4097, 4220,
			  908,  920,  930,  933,  936,  941,  936,  962,    0,  972,
			  944, 4094,  950,  973,  982,  985, 4095,  984,  995, 4092,
			  998, 1001, 1002, 1009, 4093, 1026, 1029, 1032, 1036, 1039,
			 1042, 1041, 1052, 4090, 1055, 1005, 1011, 1058, 4091, 1111,
			 1214, 1064, 1069, 1153, 1158, 1161, 1167, 4220, 4127, 1211,
			 1262, 1170, 4087, 1176, 1072, 1149, 1186, 4088, 4220, 4220,
			 1189, 4085, 1213, 1164, 1209, 1227, 4086, 4220, 1237, 1240,
			 1243, 1246, 1249, 1268, 4220, 1271, 4083, 1274, 1277, 1278, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1281, 4084, 4220, 1284, 1287, 1296, 1299, 1302, 1305, 1340,
			 4220, 1316, 4081, 1319, 1290, 1321, 1324, 4082, 1242, 4220,
			 4116, 4115, 4106, 1360, 1579, 1327, 4076, 1330, 1333, 1334,
			 1337, 4077, 1378, 4220, 1371, 1378, 1381, 1384, 1392, 1395,
			 1408, 1398, 4074, 1401, 1351, 1374, 1419, 4075, 1556, 4220,
			 1586, 1422, 4072, 1425, 1389, 1427, 1430, 4073, 4116, 1571,
			 1433, 4069, 1440, 1437, 1442, 1445, 4070, 1545, 1448, 1528,
			 1538, 1543, 1556, 1571, 1597, 4067, 1600, 1546, 1567, 1603,
			 4068, 1619, 4220, 4106, 1607, 4064, 1610, 1613, 1616, 1619,
			 4065, 4103, 1622, 1625, 1628, 4113, 1668, 1633, 4060, 1636,

			 1639, 1640, 1643, 4061, 1646, 1649, 1652, 1655, 1658, 1661,
			 4220, 1701, 1666, 4058, 1669, 1672, 1673, 1676, 4059, 1679,
			 1682, 1685, 1688, 1691, 1694, 1697, 4055, 1700, 1703, 1704,
			 1707, 4044, 1710, 1713, 1716, 1715, 1726, 4028, 1729, 1732,
			 1733, 1736, 4017, 4025, 4018, 3990, 3996,    0, 3972, 3966,
			 3957, 3944, 3936, 3927, 3916, 3898, 3908, 3907, 1269, 3906,
			 3908, 3899,  471, 3899, 3874, 3872, 3851, 1739, 3817, 1742,
			 1745, 1746, 1749, 3806, 1752, 1755, 1758, 3831, 1798, 1810,
			 1822, 1763, 1775, 1787, 1797, 1800, 1803, 1806, 1809, 1812,
			 1815, 3779, 1818, 1821, 1822, 1825, 3768, 1828, 1831, 1834, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1837, 1840, 1843, 1846, 1849, 1852, 1855, 1858, 1861, 1864,
			 1867, 1870, 1873, 1876, 1879, 1882, 1885, 1888, 1887, 1898,
			 3739, 1901, 1904, 1905, 1908, 3733, 1911, 1914, 1917, 3765,
			 1957, 1969, 1981, 1922, 1934, 1946, 1956, 1959, 1962, 1965,
			 1968, 1971, 1974, 1977, 1980, 1983, 1986, 1989, 1992, 1995,
			 1998, 2001, 2004, 2007, 2010, 2013, 2016, 2019, 2022, 2025,
			 2028, 2031, 2034, 4220, 4220, 3732, 2074, 4220, 2038, 3517,
			 2041, 2044, 2045, 2048, 3518, 2122, 2170, 2097, 2051, 3515,
			 2054, 2057, 2062, 2072, 3516, 2075, 2086, 2089, 2095, 2098,
			 2101, 4220, 2104, 2107, 2110, 3565, 2129, 2117, 3512, 2120,

			 2113, 2122, 2135, 3513, 2145, 2148, 2151, 2154, 2157, 2160,
			 4220, 2202, 2168, 3510, 2171, 2181, 2182, 2185, 3510, 2188,
			 2191, 2194, 2197, 2200, 2203, 2206, 3500, 2209, 2212, 2213,
			 2216, 3501, 2219, 2222, 2225, 2228, 2231, 2234, 2237, 2240,
			 2243, 2291, 2296, 2248, 2251, 2254, 2257, 2260, 2263, 2265,
			 3545, 2314, 2279, 2282, 2285, 2289, 2292, 2295, 2307, 2310,
			 2313, 2354, 2319, 2322, 2325, 2328, 2331, 2334, 2337, 2340,
			 2343, 2346, 2349, 2352, 2355, 2358, 2361, 2364, 2367, 2370,
			 2373, 2376, 2379, 3502, 3528, 3513, 3497,    0,    0, 3523,
			 3512, 3496, 2412, 3495, 3493, 3490, 3484, 3475, 3487, 3481, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3471, 3478, 3467, 3492, 2414, 3481, 3461,    0, 2388, 2391,
			 2394, 2397, 2400, 2403, 4220, 2443, 2455, 2408, 2420, 2430,
			 2433, 2436, 2439, 2442, 2445, 2448, 2451, 2455, 2458, 2461,
			 2464, 2467, 2470, 2473, 2476, 2479, 3441, 2482, 2266, 2297,
			 2485, 3442, 2488, 2491, 2494, 2497, 2500, 2503, 4220, 2543,
			 2555, 2508, 2520, 2530, 2533, 2536, 2539, 2542, 2545, 2548,
			 2551, 2555, 2558, 3458, 2598, 2610, 2627, 2563, 3429, 2575,
			 2384, 2584, 2587, 3430, 2592, 2602, 2608, 2611, 2614, 2617,
			 2657, 2669, 2686, 2698, 2634, 2644, 2651, 2663, 2673, 2676,
			 2679, 2684, 2687, 3472, 2728, 2696, 2699, 2702, 2705, 2708,

			 2711, 2714, 2717, 2720, 2761, 2726, 2729, 2732, 2735, 2738,
			 2741, 2744, 2747, 2750, 2753, 2756, 2759, 2762, 2765, 2768,
			 2771, 2774, 2777,  956, 2780, 3424, 2783, 2605, 2621, 2786,
			 3425, 2789, 2792, 2795, 2798, 3422, 2801, 2647, 2692, 2804,
			 3423, 2807, 2810, 2813, 2816, 2819, 2822, 2825, 2828, 2831,
			 2834, 2837, 2840, 3431, 1474,    0, 3434, 3440, 3424, 3429,
			 3413, 3429,    0, 3417, 3423, 3426,  898, 3433, 3413, 3403,
			 3404, 3397, 2874, 3402, 3389, 3382, 3396, 2844, 2848, 2851,
			 2891, 2903, 4220, 2856, 2868, 2878, 2881, 2884, 2887, 2890,
			 2893, 2896, 2899, 2903, 2906, 2946, 2958, 4220, 3399, 2970, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2982, 2999, 3011, 2911, 2923, 2935, 2947, 2958, 2964, 2976,
			 2986, 2989, 3029, 3041, 3016, 3019, 3022, 3027, 3030, 3033,
			 3039, 3042, 3045, 3048, 3051, 3054, 3081, 3057, 3060, 3064,
			 3067, 3070, 3073, 3079, 3082, 3085, 3088, 3091, 3094,    0,
			 3384, 3392, 3370, 3385, 3367, 3391, 3376, 3355,    0,    0,
			 3381, 3354, 3377, 3128, 3366,    0, 3363, 3352, 3363, 3343,
			 3338, 3350,    0, 3341, 3135, 3147, 3112, 3122, 3125, 3165,
			 3178, 3345, 3190, 3202, 3130, 3143, 3155, 3219, 3231, 3040,
			 3167, 3178, 3184, 3196, 3206, 3209, 3326, 3327,    0, 3322,
			 3323, 3020,    0, 3326, 3332, 3321, 3244, 3325, 3312, 3298,

			 3317, 3297, 3291, 3303, 3298, 3306,    0, 3251, 3263, 3275,
			 3287, 4220, 3300, 3318, 3330, 3347, 3281, 3256,    0,    0,
			 3237, 3245, 3225, 3210, 3187, 3187, 3157, 3146, 3141,    0,
			 4220,    0, 3126, 3141, 3117, 3108, 3359, 3376, 3390, 3407,
			 3419, 3436, 3094, 3048, 3023, 3025,    0, 3008, 2979, 2963,
			 2964, 2949, 2953, 2888, 2890, 2700, 2666, 2626, 2579, 3448,
			 3465, 3477, 2580, 2536, 2538, 2437,    0,    0, 2434, 2177,
			 2142, 2090, 1967, 1966,    0, 1938, 3494, 3506, 1813, 1801,
			 1784, 1638, 1599, 1590, 1552, 1555,    0, 1525, 1533, 3523,
			 1400, 1366, 1308, 1243, 1234, 1208,    0, 1186, 1179, 1165, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_base_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1085,  975,  946,  916,    0,  860,  817,  789,  778,  722,
			    0,  690,  662,  652,  628,  546,    0,  549,  514,  466,
			  302,  264,    0,    0,  197,  166,    0,   75,    0, 4220,
			 3571, 3585, 3599, 3613, 3627, 3641, 3655, 3669, 3683, 3697,
			 3711, 3725, 3739, 3323, 3284,   23, 3753, 3548, 3766, 3779,
			 3274, 3793, 3296, 3806, 3309, 3819, 3832, 3844, 3857, 3871,
			 3885, 3898, 3911,    8, 3925, 3938, 3951, 3964, 3977, 3990,
			 4003, 4016, 4029, 4042, 4055, 4068, 4082, 4095, yy_Dummy>>,
			1, 78, 1200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1277)
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
			    0, 1230, 1230, 1231, 1231, 1232, 1232, 1233, 1233, 1229,
			    9, 1234, 1234, 1229,   13,   13,   13, 1235, 1235, 1236,
			 1236, 1229,   21, 1237, 1237, 1238, 1238, 1239, 1239, 1240,
			 1240, 1241, 1241, 1229,   33, 1242, 1242, 1229, 1229, 1229,
			 1229, 1229, 1243, 1244, 1229, 1229, 1229, 1229, 1229, 1229,
			 1245, 1229, 1229, 1246, 1246, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1247, 1247, 1248, 1229, 1249, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1251, 1229, 1229, 1229, 1229,

			 1229, 1252, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1253, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1254, 1255, 1229, 1229, 1256, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1257, 1229, 1229, 1257, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1258, 1259,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1260,
			 1253, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1261, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1262, 1253, 1263, 1229, 1229, 1229, 1229, 1229, 1229, 1229, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1264, 1264, 1265, 1266, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1267, 1229, 1243, 1243, 1243,
			 1243, 1229, 1244, 1229, 1268, 1229, 1245, 1229, 1246, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1247, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1248, 1229, 1248, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1249, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1269,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1251, 1229, 1229, 1270, 1252, 1229,

			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1271, 1254, 1255,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1256, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1257, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1272, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1261,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1262, 1262, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1263, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1264, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1265, 1229,
			 1265, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1266,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1273, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1243, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,

			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1274, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1275, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1262, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1262, 1262,  676, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,

			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1243, 1276, 1229, 1229, 1229, 1229, 1229, 1229, 1277,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229,  676,  676,  676, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			  676,  676,  676,  676, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,

			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1243, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,  676, yy_Dummy>>,
			1, 200, 800)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  676,  676,  676, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229,  676,  676, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1243, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229,  676,  676, 1229, 1229, 1229,  676,  676, 1243,
			 1229, 1229, 1229, 1229, 1229, 1229, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,

			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1229, 1229, 1229,
			 1229, 1229,  676,  676,  676,  676, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1229, 1250, 1250, 1250, 1250, 1250, 1229, 1229,  676,  676,
			  676,  676, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1229, 1229,  676,
			  676,  676, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250,  676,  676, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,  676,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_def_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,
			 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250, 1250,    0,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229,
			 1229, 1229, 1229, 1229, 1229, 1229, 1229, 1229, yy_Dummy>>,
			1, 78, 1200)
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
			    0,   62,   62,   62,   62,   62,   62,   62,   62,    1,
			    2,   62,   62,    3,   62,   62,   62,   62,   62,   62,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,
			   62,   62,    1,   62,    4,   62,    5,    6,   62,    7,
			    8,    9,   10,    9,   11,   12,    9,   13,   14,   14,
			   14,   14,   14,   14,   14,   14,   15,   15,   16,   62,
			   17,   18,   19,    9,   62,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   27,   36,   37,   38,   39,   40,   41,   42,   27,
			   27,   43,   44,   45,   46,   47,   62,   20,   21,   22,

			   23,   24,   25,   26,   27,   28,   29,   30,   31,   32,
			   33,   34,   35,   27,   36,   37,   38,   39,   40,   41,
			   42,   27,   27,   48,   49,   50,   62,   62,   51,   51,
			   51,   51,   51,   51,   51,   51,   51,   51,   51,   51,
			   51,   51,   51,   51,   52,   52,   52,   52,   52,   52,
			   52,   52,   52,   52,   52,   52,   52,   52,   52,   52,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   54,   54,   55,   55,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   56,   57,   57,   57,   57,   57,
			   57,   57,   57,   57,   57,   57,   57,   58,   57,   57,
			   59,   60,   60,   60,   61,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   62, yy_Dummy>>,
			1, 57, 200)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,   14,    1,    2,    3,   14,    4,    5,   14,   14,
			   14,   14,    6,   14,    7,    7,   14,   14,   14,   14,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,   14,   14,    9,   14,   10,   11,   14,
			   12,   13,   13,   13,   13,   14,   14,   14,   14,   14,
			   14,   14,   14, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1229)
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
			    0,    0,    0,    0,    0,  118,  118,  129,   10,    1,
			    2,   10,    9,    7,   70,   63,   64,   70,   69,   66,
			   67,   68,   70,  125,  125,  126,  126,  126,  126,  126,
			  126,  126,  126,   11,   11,   15,   15,   15,   15,  126,
			  126,  126,  126,  126,  126,  126,   15,   55,   21,   54,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   61,   62,   20,   17,   19,

			   20,   18,  126,  126,  126,  126,  126,  126,  126,   95,
			   91,   96,   93,   92,   94,   97,   99,   98,   97,  126,
			  126,  126,  126,  126,  126,  126,   90,   84,   85,   87,
			   86,   90,   88,   89,  117,  115,  116,  114,  126,  126,
			  126,  126,  126,  126,  126,   59,   58,   60,   59,  126,
			  126,  126,  126,  126,  126,  126,  108,  109,  108,  108,
			  126,  126,  126,  126,  126,  126,  126,  111,  113,  111,
			  111,  112,  126,  126,  126,  126,  126,  126,  126,   57,
			  127,   57,   83,   81,   82,   73,   83,   80,   80,   83,
			   78,   83,   76,  126,  126,  126,  126,  126,  126,  126, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  118,  118,  122,  122,  122,  123,  124,  126,  126,  126,
			  126,  126,  126,  126,    1,    1,    8,    9,    9,    4,
			    5,    0,    7,   63,   63,   70,    0,   65,  125,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   11,    0,    0,    0,    0,    0,    0,    0,
			    0,   12,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   14,
			    0,    0,    0,    0,    0,    0,   16,   21,   21,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   61,   62,   17,   17,   18,   20,

			    0,    0,    0,    0,    0,    0,   91,   92,  100,  100,
			  100,  100,    0,    0,    0,    0,    0,    0,    0,   97,
			    0,    0,    0,    0,    0,    0,   84,   84,   89,  117,
			    0,    0,    0,    0,    0,    0,    0,  114,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   59,    0,    0,    0,    0,    0,    0,    0,   58,
			   58,    0,    0,    0,    0,    0,    0,  103,  103,  103,
			  103,    0,    0,    0,    0,    0,    0,    0,  106,  107,
			    0,    0,    0,    0,    0,    0,    0,  108,    0,    0,
			    0,    0,    0,    0,  110,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  111,    0,    0,    0,    0,    0,    0,    0,
			   56,    0,    0,    0,    0,    0,    0,    0,   81,   74,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   83,    0,    0,    0,    0,    0,    0,
			  118,    0,    0,    0,    0,    0,    0,    0,    0,  119,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  121,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    9,    3,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   13,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   21,    0,    0,    0,    0,
			    0,    0,    0,   55,   55,   55,   55,   30,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,  101,  102,    0,
			  101,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,   58,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  104,
			  105,    0,  104,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   72,   71,    0,    0,   77,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   75,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  120,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    9,    0,    0,    0,    0,    0,    0,    0,   65,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   55,   55,   55,   55,   32,   38,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 600)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   51,    0,    0,
			    0,    0,    0,    0,  101,  102,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  104,  105,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    9,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   55,   55,   26,   55,   55,   55,   55,
			   55,   55,   31,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,    0,    0,    0,
			  102,    0,  102,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  105,    0,  105,    0,    0, yy_Dummy>>,
			1, 200, 800)
		end

	yy_accept_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    9,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   22,
			   55,   55,   55,   55,   55,   55,   55,   55,   33,   39,
			   55,   55,   55,   55,   55,   52,   55,   55,   55,   55,
			   55,   55,   36,   55,  102,    0,    0,    0,    0,  105,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    6,
			    0,    0,    0,    0,    0,    0,   55,   55,   28,   55,
			   55,   55,   27,   55,   55,   55,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   50,  102,    0,  105,
			    0,   79,    0,    0,    0,    0,   55,   55,   34,   23,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   37,
			   53,   40,   55,   55,   55,   55,    0,    0,    0,    0,
			    0,    0,   55,   55,   55,   55,   29,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,    0,    0,    0,
			    0,    0,   55,   55,   55,   55,   35,   41,   55,   55,
			   55,   55,   55,   55,   42,   55,    0,    0,   55,   55,
			   55,   55,   55,   55,   55,   55,   44,   55,   55,    0,
			   55,   55,   55,   55,   55,   55,   43,   55,   55,   55, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_accept_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   45,   55,   55,   55,   55,   55,
			   24,   55,   55,   55,   55,   55,   46,   55,   55,   55,
			   55,   55,   48,   25,   55,   55,   47,   55,   49,    0, yy_Dummy>>,
			1, 30, 1200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4220
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1229
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1230
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 62
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

	yyNb_rules: INTEGER = 128
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 129
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

	last_lx_unicode_character_class_value: LX_UNICODE_CHARACTER_CLASS
			-- Last semantic value of type LX_UNICODE_CHARACTER_CLASS

end
