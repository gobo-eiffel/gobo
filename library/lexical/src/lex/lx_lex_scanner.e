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

					last_token := CCL_PLUS
				
when 78 then
--|#line 291 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 291")
end

					last_token := CCL_MINUS
				
when 79 then
--|#line 294 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 294")
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
							if character_classes_by_name.has (l_last_string) then
								last_token := CCL_OP
								last_lx_symbol_class_value := character_classes_by_name.item (l_last_string)
							else
								last_token := CCL_BRACKET
								last_string_value := l_last_string
								less (1)
								set_start_condition (FIRSTCCL)
							end
						end
					end
				
when 80 then
--|#line 319 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 319")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 81 then
--|#line 324 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 324")
end
last_token := EOF_OP
when 82 then
--|#line 325 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 325")
end
last_token := text_item (1).code
when 83 then
--|#line 326 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 326")
end

					set_start_condition (ACTION_TEXT)
				
when 84 then
--|#line 329 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 329")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 85 then
--|#line 334 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 334")
end

					last_token := CHAR
					process_utf8_character
				
when 86 then
--|#line 341 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 341")
end
-- Separator or comment.
when 87 then
--|#line 342 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 342")
end
line_nb := line_nb + 1
when 88 then
--|#line 343 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 343")
end
last_token := Comma_code
when 89 then
--|#line 344 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 344")
end
last_token := Star_code
when 90 then
--|#line 345 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 345")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 91 then
--|#line 349 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 349")
end

					last_token := NAME
					last_string_value := text
				
when 92 then
--|#line 353 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 353")
end

					report_bad_start_condition_error (text)
				
when 93 then
--|#line 359 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 359")
end
-- Separator.
when 94 then
--|#line 360 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 360")
end

					if text.is_integer then
						last_token := NUMBER
						last_integer_value := text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 95 then
--|#line 368 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 368")
end
last_token := Comma_code
when 96 then
--|#line 369 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 369")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 97 then
--|#line 373 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 373")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 98 then
--|#line 378 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 378")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 99 then
--|#line 387 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 387")
end

					last_token := CHAR
					process_utf8_character
				
when 100 then
--|#line 391 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 391")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 101 then
--|#line 395 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 395")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 102 then
--|#line 404 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 404")
end

					last_token := CHAR
					process_escaped_character
				
when 103 then
--|#line 408 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 408")
end

					last_token := BCHAR
					process_byte_character
				
when 104 then
--|#line 412 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 412")
end

					last_token := UCHAR
					process_unicode_character
				
when 105 then
--|#line 419 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 419")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 106 then
--|#line 424 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 424")
end

					last_token := BCHAR
					process_byte_character
					set_start_condition (CCL)
				
when 107 then
--|#line 429 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 429")
end

					last_token := UCHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 108 then
	yy_end := yy_start + yy_more_len + 1
--|#line 434 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 434")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 109 then
	yy_end := yy_start + yy_more_len + 1
--|#line 438 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 438")
end
last_token := Caret_code
when 110 then
--|#line 439 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 439")
end

					last_token := CHAR
					process_utf8_character
					set_start_condition (CCL)
				
when 111 then
--|#line 444 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 444")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 112 then
	yy_end := yy_start + yy_more_len + 1
--|#line 453 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 453")
end
last_token := Minus_code
when 113 then
--|#line 454 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 454")
end

					last_token := CHAR
					process_utf8_character
				
when 114 then
--|#line 458 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 458")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 115 then
--|#line 462 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 462")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 116 then
--|#line 471 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 471")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 117 then
--|#line 475 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 475")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 118 then
--|#line 480 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 480")
end
set_start_condition (EIFFEL_BLOCK2)
when 119 then
--|#line 481 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 481")
end

					last_token := EIF_CODE
					last_string_value := text
					set_start_condition (SECT2)
				
when 120 then
--|#line 489 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 489")
end
more
when 121 then
--|#line 490 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 490")
end
more
when 122 then
--|#line 491 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 491")
end
more
when 123 then
--|#line 492 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 492")
end
more
when 124 then
--|#line 493 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 493")
end
more
when 125 then
--|#line 494 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 494")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 126 then
--|#line 498 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 498")
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
				
when 127 then
--|#line 517 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 517")
end

					last_token := EIF_CODE
					last_string_value := text
				
when 128 then
--|#line 523 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 523")
end

					report_bad_character_error (text)
				
when 129 then
--|#line 526 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 526")
end

					report_bad_character_error ("%%N")
					line_nb := line_nb + 1
				
when 130 then
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
			create an_array.make_filled (0, 0, 4337)
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
			  214,  223,  226,   41,   39,   40,   39, 1187,  277,   42,
			  277,  296,  306,  296,  306, 1214,   41,  307,  307,  326,
			  359,  326,  359, 1227,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   45,   46,   45,
			   45,   46,   45,  238,  238,   52,  228,  228,  228,   47,
			  239,  239,   47,  420,   48,  272,  272,   48,  110,  111,
			  110,  273,  273,  110,  111,  110,  216, 1232,  289,  112,
			  290,  421,  113,  113,  112,  302,  302,  113,  113,  237,

			  237,  237,  418,   49,  418,   50,   49,   51,   50, 1231,
			   51,   54,  240,  240,  240,  218,  303,  303,  219,  242,
			  242,  242, 1230,  220,  271,  271,  271,  547,  114,  221,
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
			  319,  321,  321,  321, 1229,  262,  263,  264,  265,  266,
			  267,  268,  324,  324,  324,  330,  331,  332,  333,  334,
			  335,  336,   55,   55,   55,   55,   56,   57,   58,   59,
			   60,   61,   62,   64,  432,   65,  433,   66,   67,  329,
			  329,  329,  347,  347,   68,  338,  339,  340,  341,  342,
			  343,  344,  346,  346,  346,  348,  348,  349,  349,  349,
			  352,  353,  354,  355,  356,  357,  358,  360,  351,  351,
			  351,  362,  362,  362,  363,  363,  364,  364,  365,  365,
			  365,  390,  390,   55,   55,   55,   55,   69,   70,   71,
			   72,   73,   74,   75,   64,  214,   65,  214,   76,   67,

			  387,  387,  387,  391,  391,   68,  389,  389,  389, 1228,
			  352,  353,  354,  355,  356,  357,  358,  392,  392,  392,
			  395,  396,  397,  398,  399,  400,  401,  402,  402,  402,
			  404,  404,  404,  405,  405,  406,  406,  407,  407,  407,
			  419,  419,  419, 1227,   55,   55,   55,   55,   69,   70,
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
			   97,  116, 1226,  117,  424,  435,  435,  435,  437,  437,
			  437,  438,  438,  410, 1225,  425,  426,  427,  428,  429,

			  430,  431,  439,  439,  440,  440,  440,  442,  442,  442,
			  379,  443,  444,  445,  446,  447,  448,  449,  451, 1224,
			  452,  471,  471,  471,  118,  472,  472,  461,  473,  473,
			 1223,   55,   55,   55,   55,  119,  120,  121,  122,  123,
			  124,  125,  116,  379,  117,  411,  412,  413,  414,  415,
			  416,  417, 1222,  380,  381,  382,  383,  384,  385,  386,
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
			  489,  490,  491,  492, 1221, 1233,  485, 1233, 1233,  277,
			  227,  277,  227,  237,  237,  237,  239,  239, 1220, 1233,

			  226,  226,  493,  229,  230,  231,  232,  233,  234,  235,
			  240,  240,  240,  136,  137, 1219,   55,   55,   55,   55,
			  138,  139,  140,  141,  142,  143,  144,  135, 1233,  483,
			 1233, 1233, 1218,  226,  272,  272,  225,  228,  228,  228,
			  273,  273, 1233,  228,  228,  228,  228,  228,  228,  494,
			  494,  494,  495,  495,  495,  496,  496,  496,  243,  244,
			  245,  246,  247,  248,  249,  242,  242,  242,  271,  271,
			  271,  274,  274,  274,  136,  137, 1217,   55,   55,   55,
			   55,  138,  139,  140,  141,  142,  143,  144,  146,  147,
			  146,  250,  250,  250,  507,  507,  507,  508,  508, 1216, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  148,  251, 1215,  252,  509,  509,  510,  510,  510,  497,
			  260,  260,  260,  522,  522,  522,  523,  523,  524,  524,
			 1214,  498,  260,  525,  525,  525,  242,  242,  242,  513,
			  527,  528,  529,  530,  531,  532,  533,  307,  307,   55,
			   55,   55,   55,  149,  150,  151,  152,  153,  154,  155,
			  146,  147,  146,  253,  254,  255,  256,  257,  258,  259,
			  585,  585,  148,  499,  500,  501,  502,  503,  504,  505,
			 1213,  514,  515,  516,  517,  518,  519,  520,  242,  242,
			  242,  242,  242,  242,  534,  534,  534,  535,  535,  535,
			  536,  536,  536,  296, 1212,  296,  299,  299,  299,  586,

			  586,   55,   55,   55,   55,  149,  150,  151,  152,  153,
			  154,  155,  157,  569,  570,  571,  572,  573,  574,  575,
			  299,  299,  299,  299,  299,  299,  576,  576,  576,  577,
			  577,  577,  578,  578,  578,  306,  326,  306,  326, 1211,
			  580,  580,  308,  308,  308, 1210,  580,  580,  580,  580,
			  580,  580,  584,  584,  584,  158, 1209,  159,  587,  587,
			  587, 1208,   55,   55,   55,   55,  160,  161,  162,  163,
			  164,  165,  166,  157,  581,  582,  582,  319,  319,  319,
			 1207,  582,  582,  582,  582,  582,  582,  319,  319,  319,
			  319,  319,  319,  589,  589,  589,  590,  590,  590,  591, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  591,  591,  592,  593,  594,  595,  596,  597,  598,  330,
			  331,  332,  333,  334,  335,  336,  158, 1206,  159,  329,
			  329,  329, 1205,   55,   55,   55,   55,  160,  161,  162,
			  163,  164,  165,  166,  168,  600,  600,  600,  601,  601,
			  602,  602,  603,  603,  603,  169,  338,  339,  340,  341,
			  342,  343,  344,  337,  337,  337,  606,  606,  606,  607,
			  607,  608,  608,  609,  609,  609,  329,  329,  329,  329,
			  329,  329,  329,  329,  329,  616,  616,  170,  171,  611,
			  611,  611,  617,  617,   55,   55,   55,   55,  172,  173,
			  174,  175,  176,  177,  178,  168,  612,  612,  612,  613,

			  613,  613,  351,  351,  351, 1204,  169,  352,  353,  354,
			  355,  356,  357,  358,  615,  615,  615,  618,  618,  618,
			  359, 1203,  359,  351,  351,  351,  351,  351,  351,  351,
			  351,  351,  628,  628,  628,  629,  629,  629,  170,  171,
			  630,  630,  630,  637,  637,   55,   55,   55,   55,  172,
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
			 1202,  202,  638,  638,  203,  632,  632,  367,  367,  367,
			  204,  632,  632,  632,  632,  632,  632,  634,  634,  620,
			  636,  636,  636,  634,  634,  634,  634,  634,  634,  639,
			  639,  639,  378,  378,  378,  642,  642,  642, 1044,  633,
			  643,  643,  644,  644,  652,  652,  205, 1045,  206,   55,
			   55,   55,   55,  207,  208,  209,  210,  211,  212,  213,
			  201, 1201,  202,  653,  653,  203,  645,  645,  645,  661,
			  661,  204,  621,  622,  623,  624,  625,  626,  627,  387,

			  387,  387,  387,  387,  387,  387,  387,  387,  647,  647,
			  647,  648,  648,  648,  649,  649,  649,  394,  394,  394,
			  651,  651,  651,  654,  654,  654,  418,  205,  418,  206,
			   55,   55,   55,   55,  207,  208,  209,  210,  211,  212,
			  213,  309,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  656,  656,  656,  657,  657,  657,  658,  658,  658,
			  409,  409,  409,  660,  660,  660,  310,  410,  806,  311,
			  662,  662,  663,  663,  663,  423,  423,  423,  807,  668,
			  669, 1200,  312,  313,  314,  315,  316,  317,  318,  368,
			  670,  671,  672,  673,  674,  675,  676,  688,  688,  688, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  689,  689,  690,  690,  691,  691,  691, 1233,  801, 1233,
			  802,  434,  434, 1199,  369,  472,  472,  370, 1198,  411,
			  412,  413,  414,  415,  416,  417,  435,  435,  435, 1197,
			  371,  372,  373,  374,  375,  376,  377,  309,  435,  435,
			  435,  435,  435,  435,  434,  473,  473,  695,  696,  696,
			  696,  697,  697,  697,  698,  698,  698,  442,  442,  442,
			  710,  710,  310, 1196,  699,  311,  443,  444,  445,  446,
			  447,  448,  449,  471,  471,  471,  700, 1195,  312,  313,
			  314,  315,  316,  317,  318,  309,  474,  474,  474,  450,
			  450,  450,  709,  709,  709,  711,  711,  712,  712,  712,

			  460,  460,  460,  724,  724,  724,  725,  725,  726,  726,
			  310,  741,  741,  311,  727,  727,  727, 1194,  701,  702,
			  703,  704,  705,  706,  707, 1124,  312,  313,  314,  315,
			  316,  317,  318,  537, 1125,  537,  537,  537,  537,  537,
			  537,  537,  537,  537,  537,  278,  537,  278,  278,  537,
			  537,  537,  537,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  537,  537,  537,  537,
			  537,  537,  537,  537,  442,  442,  442, 1192,  538,  539,
			  540,  541,  542,  543,  544,  537,  553,  554,  555,  556, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  557,  460,  442,  442,  442,  964,  558,  559,  715,  965,
			  560,  561, 1191,  451, 1233,  452,  562,  677,  729,  730,
			  731,  732,  733,  734,  735,  442,  442,  442,  736,  736,
			  736,  737,  737,  737,  738,  738,  738,  215,  215,  215,
			  742,  742,  678, 1233, 1190,  679,  740,  740,  740, 1189,
			  716,  717,  718,  719,  720,  721,  722, 1233,  680,  681,
			  682,  683,  684,  685,  686,  453,  454,  455,  456,  457,
			  458,  459,  743,  743,  743, 1055,  745,  224,  224,  224,
			  748,  748,  748,  749,  749, 1056, 1233,  750,  750,  751,
			  751,  751,  228,  228,  228,  228,  228,  228,  228,  228,

			  228,  755,  755,  250,  250,  250,  757,  757,  757,  758,
			  758,  759,  759,  760,  760,  760,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  762,  762,  762,  763,  763,
			  763,  764,  764,  764,  765,  765,  260,  260,  260,  767,
			  767,  767,  768,  768,  769,  769,  770,  770,  770,  260,
			  260,  260,  260,  260,  260,  260,  260,  260,  772,  772,
			  772,  773,  773,  773,  774,  774,  774,  269,  269,  269,
			  776,  776,  776,  777,  777,  778,  778,  779,  779,  779,
			  242,  242,  242,  242,  242,  242,  242,  242,  242,  538,
			  539,  540,  541,  542,  543,  544,  537,  537,  537,  782, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  782,  782,  783,  783,  784,  784,  785,  785,  785,  297,
			  297,  297,  813,  813,  813,  814,  814,  815,  815,  816,
			  816,  816,  299,  299,  299,  299,  299,  299,  299,  299,
			  299,  819,  819,  308,  308,  308, 1188,  819,  819,  819,
			  819,  819,  819,  820,  820,  308,  308,  308, 1186,  820,
			  820,  820,  820,  820,  820,  818,  818,  308,  308,  308,
			 1185,  818,  818,  818,  818,  818,  818,  821,  821,  821,
			  822,  822,  822,  823,  823,  823,  319,  319,  319,  319,
			  319,  319,  319,  319,  319,  327,  327,  327,  825,  825,
			  825,  826,  826,  827,  827,  828,  828,  828,  329,  329,

			  329,  329,  329,  329,  329,  329,  329,  830,  830,  830,
			  831,  831,  831,  832,  832,  832,  337,  337,  337,  337,
			  337,  337,  337,  337,  337,  833,  833,  833,  834,  834,
			  834,  835,  835,  835,  329,  329,  329,  329,  329,  329,
			  329,  329,  329,  351,  351,  351,  351,  351,  351,  351,
			  351,  351,  836,  836,  836,  837,  837,  837,  838,  838,
			  838,  839,  840,  841,  842,  843,  844,  845,  360,  360,
			  360,  847,  847,  847,  848,  848,  849,  849,  850,  850,
			  850,  351,  351,  351,  351,  351,  351,  351,  351,  351,
			  853,  853,  367,  367,  367, 1184,  853,  853,  853,  853, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  853,  853,  854,  854,  367,  367,  367, 1183,  854,  854,
			  854,  854,  854,  854,  852,  852,  367,  367,  367, 1182,
			  852,  852,  852,  852,  852,  852,  855,  855,  855,  856,
			  856,  856,  857,  857,  857,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  858,  858,  858,  859,  859,  859,
			  860,  860,  860,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  861,  861,  861,  862,  862,  862,  863,  863,  863,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  864,  864,

			  864,  865,  865,  865,  866,  866,  866,  868,  423,  423,
			  423,  879,  879,  879,  880,  880,  881,  881,  882,  882,
			  882,  423,  423,  423,  889,  889,  889,  890,  890, 1001,
			  887,  887,  869,  891,  891,  870,  887,  887,  887,  887,
			  887,  887,  892,  892,  892,  423,  423,  423,  871,  872,
			  873,  874,  875,  876,  877,  884,  423,  423,  423,  423,
			  423,  423,  898,  898,  423,  894,  894,  894,  895,  895,
			  895,  896,  896,  896,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  901,  901,  668,  669,  450,  450,  450,
			  900,  900,  900,  902,  902,  986,  670,  671,  672,  673, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  674,  675,  676,  885,  885,  903,  903,  903, 1179,  885,
			  885,  885,  885,  885,  885,  450,  450,  450,  450,  450,
			  450,  450,  450,  450,  905,  905,  905,  906,  906,  906,
			  907,  907,  907,  668,  669,  908,  908,  886,  460,  460,
			  460,  910,  910,  910,  670,  671,  672,  673,  674,  675,
			  676,  911,  911,  912,  912,  913,  913,  913,  460,  460,
			  460,  460,  460,  460,  460,  460,  460,  915,  915,  915,
			  916,  916,  916,  917,  917,  917,  469,  469,  469,  919,
			  919,  919,  920,  920,  921,  921,  922,  922,  922,  442,
			  442,  442,  442,  442,  442,  442,  442,  442,  215,  215,

			  215,  215,  215,  215,  215,  215,  215,  924,  924,  924,
			  925,  925,  925,  926,  926,  926, 1233,  484,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  935,  935,  935,
			  936,  936,  936,  937,  937,  937,  250,  755,  755,  927,
			  938,  939,  940,  941,  942,  943,  944,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  945,  945,  945, 1233,
			  946,  946,  946,  947,  947,  947,  250,  250,  250,  992,
			  992,  928,  929,  930,  931,  932,  933,  934,  250,  250,
			  250,  250,  250,  250,  260,  765,  765,  260,  260,  260,
			  260,  260,  260,  260,  260,  260,  948,  948,  948,  949, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_nxt_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  949,  949,  950,  950,  950,  260,  260,  260,  260,  260,
			  260,  260,  260,  260,  269,  269,  269,  269,  269,  269,
			  269,  269,  269,  951,  951,  951,  952,  952,  952,  953,
			  953,  953,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  954,  954,  954,  955,  955,  955,  956,  956,  956,
			  977,  297,  297,  297,  978,  297,  297,  297,  297,  297,
			  297,  981,  981,  981,  982,  982,  982,  983,  983,  983,
			  984,  984,  308,  308,  308, 1178,  984,  984,  984,  984,
			  984,  984,  985,  985,  308,  308,  308, 1177,  985,  985,
			  985,  985,  985,  985,  308,  308,  308,  327,  327,  327,

			  327,  327,  327,  327,  327,  327,  987,  987,  987,  988,
			  988,  988,  989,  989,  989,  329,  329,  329,  986,  329,
			  329,  329,  329,  329,  329,  337,  337,  337,  337,  337,
			  337,  337,  337,  337,  351,  351,  351,  351,  351,  351,
			  351,  351,  351,  620,  620,  620,  991,  991,  991,  993,
			  993,  994,  994,  994,  360,  360,  360,  360,  360,  360,
			  360,  360,  360,  996,  996,  996,  997,  997,  997,  998,
			  998,  998,  999,  999,  367,  367,  367, 1176,  999,  999,
			  999,  999,  999,  999, 1000, 1000,  367,  367,  367, 1175,
			 1000, 1000, 1000, 1000, 1000, 1000,  367,  367,  367,  378, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_nxt_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  378,  378,  378,  378,  378,  378,  378,  378,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  409,  409,  409,
			 1001,  409,  409,  409,  409,  409,  409, 1003,  423,  423,
			  423,  423, 1174,  423,  423,  423,  423,  423,  423, 1004,
			 1004, 1008, 1008, 1008, 1173, 1004, 1004, 1004, 1004, 1004,
			 1004, 1009, 1009, 1010, 1010, 1172, 1006, 1006, 1011, 1011,
			 1011,  423, 1006, 1006, 1006, 1006, 1006, 1006,  423,  423,
			  423, 1033, 1033, 1005,  423,  423,  423,  423,  423,  423,
			 1013, 1013, 1013, 1014, 1014, 1014, 1015, 1015, 1015, 1171,
			  423,  423,  423,  423,  423,  423, 1170,  423,  423,  423,

			  423,  423,  423, 1016, 1016,  423,  423,  423, 1169, 1016,
			 1016, 1016, 1016, 1016, 1016,  423,  423,  423, 1034, 1034,
			 1017, 1017, 1018, 1018, 1018,  423, 1017, 1017, 1017, 1017,
			 1017, 1017,  423,  423, 1019, 1019, 1019,  423,  423,  423,
			  423,  423,  423,  423, 1020, 1020, 1020,  423,  423,  423,
			  423,  423,  423, 1168,  423,  423,  423,  423,  450,  898,
			  898,  450,  450,  450, 1039, 1039,  423,  450,  450,  450,
			  450,  450,  450, 1021, 1021, 1021, 1022, 1022, 1022, 1023,
			 1023, 1023,  450,  450,  450,  450,  450,  450,  450,  450,
			  450,  460,  908,  908,  460,  460,  460,  460,  460,  460, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_nxt_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  460,  460,  460, 1024, 1024, 1024, 1025, 1025, 1025, 1026,
			 1026, 1026,  460,  460,  460,  460,  460,  460,  460,  460,
			  460,  469,  469,  469,  469,  469,  469,  469,  469,  469,
			 1027, 1027, 1027, 1028, 1028, 1028, 1029, 1029, 1029,  215,
			  215,  215,  215,  215,  215,  215,  215,  215, 1233,  746,
			  746,  746, 1032, 1032, 1032, 1035, 1035, 1035,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  753,  753,  753,
			 1038, 1038, 1038, 1040, 1040, 1167, 1166, 1030, 1041, 1041,
			 1041,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			 1160, 1233,  260,  260,  260,  260,  260,  260,  260,  260,

			  260,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  537,  537,  537,  537,  537,  537,  537,  537,  537, 1062,
			  297,  297,  297, 1063,  297,  297,  297,  297,  297,  297,
			 1068, 1068,  327,  327,  327, 1159, 1068, 1068, 1068, 1068,
			 1068, 1068, 1069, 1069,  327,  327,  327, 1158, 1069, 1069,
			 1069, 1069, 1069, 1069,  327,  327,  327,  620,  620,  620,
			  620,  620,  620,  620,  620,  620, 1070, 1070, 1070, 1071,
			 1071, 1071, 1072, 1072, 1072,  360,  360,  360,  986,  360,
			  360,  360,  360,  360,  360, 1073, 1073,  423,  423,  423,
			 1157, 1073, 1073, 1073, 1073, 1073, 1073, 1074, 1074,  423, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_nxt_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  423,  423, 1156, 1074, 1074, 1074, 1074, 1074, 1074,  423,
			  423,  423,  423,  423, 1155,  423,  423,  423,  423,  423,
			  423, 1076, 1076, 1078, 1078, 1078, 1154, 1076, 1076, 1076,
			 1076, 1076, 1076, 1001, 1079, 1079, 1079, 1153, 1077, 1077,
			 1080, 1080, 1080,  423, 1077, 1077, 1077, 1077, 1077, 1077,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423, 1081, 1081,
			  222,  222,  423,  222, 1081, 1081, 1081, 1081, 1081, 1081,
			 1082, 1082,  298,  298,  423,  298, 1082, 1082, 1082, 1082,
			 1082, 1082,  423,  423,  423,  423,  423,  423,  423,  423,

			  423, 1152,  423,  450,  450,  450,  450,  450,  450,  450,
			  450,  450, 1233, 1151,  423,  460,  460,  460,  460,  460,
			  460,  460,  460,  460,  469,  469,  469,  469,  469,  469,
			  469,  469,  469,  746,  746,  746,  746,  746,  746, 1150,
			 1083,  746,  746,  746, 1084, 1084, 1084, 1085, 1085, 1085,
			 1086, 1086, 1086, 1149, 1148, 1233,  753,  753,  753,  753,
			  753,  753,  753,  753,  753, 1087, 1087, 1087, 1088, 1088,
			 1088, 1089, 1089, 1089, 1101, 1111, 1111, 1147, 1102, 1146,
			 1139, 1111, 1111, 1111, 1111, 1111, 1111, 1112, 1112,  620,
			  620,  620, 1138, 1112, 1112, 1112, 1112, 1112, 1112,  620, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_nxt_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  620,  620,  620,  620,  620, 1113, 1113,  423,  423,  423,
			 1137, 1113, 1113, 1113, 1113, 1113, 1113, 1136, 1114, 1114,
			  423,  423,  423,  986, 1114, 1114, 1114, 1114, 1114, 1114,
			 1116, 1116,  423,  423,  423, 1135, 1116, 1116, 1116, 1116,
			 1116, 1116, 1117, 1117,  746,  746,  746, 1134, 1117, 1117,
			 1117, 1117, 1117, 1117, 1001,  746,  746,  746, 1133, 1118,
			 1118,  746,  746,  746,  423, 1118, 1118, 1118, 1118, 1118,
			 1118, 1119, 1119,  753,  753,  753,  423, 1119, 1119, 1119,
			 1119, 1119, 1119,  753,  753,  753,  753,  753,  753, 1132,
			 1129,  986,  986,  423, 1130, 1131, 1128,  986,  986,  986,

			  986,  986,  986, 1140, 1140,  423,  279,  279,  279, 1140,
			 1140, 1140, 1140, 1140, 1140, 1001, 1001,  328,  328, 1127,
			  328, 1001, 1001, 1001, 1001, 1001, 1001, 1141, 1141,  434,
			  434, 1126,  434, 1141, 1141, 1141, 1141, 1141, 1141,  986,
			 1142, 1142, 1123, 1122, 1121, 1120, 1142, 1142, 1142, 1142,
			 1142, 1142,  217, 1115, 1110, 1109, 1108,  217, 1143, 1143,
			  217, 1107, 1106, 1001, 1143, 1143, 1143, 1143, 1143, 1143,
			 1144, 1144, 1105, 1104,  423, 1103, 1144, 1144, 1144, 1144,
			 1144, 1144, 1100, 1099, 1098, 1097, 1096, 1145, 1145, 1095,
			 1094, 1093,  423, 1145, 1145, 1145, 1145, 1145, 1145, 1161, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_nxt_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			 1161, 1092, 1091, 1090,  423, 1161, 1161, 1161, 1161, 1161,
			 1161, 1075, 1067, 1066, 1065, 1064, 1162, 1162, 1061, 1060,
			 1059,  423, 1162, 1162, 1162, 1162, 1162, 1162, 1058, 1057,
			 1163, 1163, 1054, 1053, 1052,  986, 1163, 1163, 1163, 1163,
			 1163, 1163, 1051, 1050, 1049, 1048, 1047, 1164, 1164, 1046,
			 1043, 1042, 1001, 1164, 1164, 1164, 1164, 1164, 1164,  423,
			  423, 1037, 1036, 1031,  423,  423,  423,  423,  423,  423,
			  423,  450, 1012, 1007, 1002,  995, 1165, 1165,  990,  980,
			  979,  423, 1165, 1165, 1165, 1165, 1165, 1165,  423,  423,
			  976,  975,  974,  423,  423,  423,  423,  423,  423,  423,

			  973,  972,  971,  970,  969, 1180, 1180,  968,  967,  966,
			  423, 1180, 1180, 1180, 1180, 1180, 1180, 1181, 1181,  963,
			  962,  961,  423, 1181, 1181, 1181, 1181, 1181, 1181,  960,
			  959,  958,  957,  250, 1193, 1193,  923,  918,  914,  423,
			 1193, 1193, 1193, 1193, 1193, 1193,  423,  423,  909,  904,
			  899,  423,  423,  423,  423,  423,  423,  423,  897,  893,
			  888,  883,  878,  423,  423,  867,  852,  851,  423,  423,
			  423,  423,  423,  423,  423,  846,  442,  442,  829,  442,
			  423,  442,  824,  442,  442,  442,  442,  818,  817,  812,
			  442,  811,  810,  809,  808,  805,  804,  423,   38,   38, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_nxt_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   95,   95,
			   95,   95,   95,   95,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,

			  115,  115,  115,  134,  134,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  145,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  167,  167,
			  167,  167,  167,  167,  167,  167,  167,  167,  167,  167,
			  167,  167,  167,  179,  179,  179,  179,  179,  179,  179,
			  179,  179,  179,  179,  179,  179,  179,  179,  200,  200,
			  200,  200,  200,  200,  200,  200,  200,  200,  200,  200,
			  200,  200,  200,  228,  228,  228,  228,  228,  228,  228, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_nxt_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  228,  228,  228,  228,  228,  228,  803,  228,  242,  242,
			  800,  799,  798,  242,  797,  242,  242,  242,  242,  242,
			  242,  796,  242,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  795,  250,  260,  260,  260,
			  794,  260,  260,  260,  260,  260,  260,  260,  260,  793,
			  260,  294,  294,  294,  294,  294,  294,  294,  294,  294,
			  294,  294,  294,  294,  294,  294,  308,  308,  308,  308,
			  308,  308,  308,  308,  308,  308,  308,  308,  792,  308,
			  329,  329,  329,  329,  329,  329,  329,  329,  329,  329,
			  329,  329,  791,  329,  337,  337,  337,  337,  337,  337,

			  337,  337,  337,  337,  337,  337,  790,  337,  351,  351,
			  351,  351,  351,  351,  351,  351,  351,  351,  351,  789,
			  351,  367,  367,  367,  367,  367,  367,  367,  367,  367,
			  367,  367,  367,  788,  367,  378,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  378,  787,  378,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  786,
			  394,  394,  394,  781,  394,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  780,  409,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  775,  423,  450,  450,  450,  450,  450,  450,  450, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_nxt_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  450,  450,  450,  450,  450,  771,  450,  460,  460,  460,
			  766,  460,  460,  460,  460,  460,  460,  460,  460,  761,
			  460,  215,  215,  215,  215,  215,  215,  215,  215,  215,
			  215,  215,  215,  756,  215,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  224,  754,  224,  269,
			  269,  269,  269,  269,  269,  269,  269,  269,  269,  269,
			  269,  753,  269,  297,  297,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  297,  752,  297,  327,  327,  327,
			  327,  327,  327,  327,  327,  327,  327,  327,  327,  747,
			  327,  360,  360,  360,  360,  360,  360,  360,  360,  360,

			  360,  360,  360,  746,  360,  469,  469,  469,  469,  469,
			  469,  469,  469,  469,  469,  469,  469,  744,  469,  537,
			  537,  537,  537,  537,  537,  537,  537,  537,  537,  537,
			  537,  739,  537,  620,  620,  620,  620,  620,  620,  620,
			  620,  620,  620,  620,  620,  728,  620,  746,  746,  746,
			  746,  746,  746,  746,  746,  746,  746,  746,  746,  746,
			  723,  746,  753,  753,  753,  753,  753,  753,  753,  753,
			  753,  753,  753,  753,  714,  753,  713,  708,  475,  470,
			  694,  693,  692,  687,  667,  666,  665,  664,  659,  655,
			  650,  646,  641,  640,  635,  631,  619,  614,  610,  605, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_nxt_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  604,  599,  588,  583,  579,  295,  568,  567,  566,  565,
			  564,  563,  552,  551,  550,  549,  546,  545,  526,  521,
			  512,  511,  506,  275,  270,  241,  236,  475,  470,  469,
			  441,  436,  422,  408,  403,  393,  388,  366,  361,  350,
			  345,  327,  325,  320,  305,  300,  297,  295,  293,  292,
			  291,  288,  287,  286,  285,  284,  283,  282,  281,  280,
			  278,  276,  275,  270,  269,  241,  236,  227,  225,  224,
			  215, 1233,   96,   96,   37, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,

			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, yy_Dummy>>,
			1, 138, 4200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 4337)
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
			   39,   45, 1249,    1,    2,    2,    2, 1173,   78,    2,
			   78,   98,  110,   98,  110, 1231,    2,  113,  113,  127,
			  146,  127,  146, 1223,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    3,    3,    3,
			    4,    4,    4,   59,   59,    4,   56,   56,   56,    3,
			   60,   60,    4,  187,    3,   72,   72,    4,   17,   17,
			   17,   73,   73,   18,   18,   18,   42, 1229,   91,   17,
			   91,  187,   17,   17,   18,  105,  105,   18,   18,   58,

			   58,   58,  183,    3,  183,    3,    4,    3,    4, 1228,
			    4,    5,   61,   61,   61,   42,  106,  106,   42,   69,
			   69,   69, 1225,   42,   71,   71,   71,  282,   17,   42,
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
			  119,  121,  121,  121, 1224,   67,   67,   67,   67,   67,
			   67,   67,  124,  124,  124,  134,  134,  134,  134,  134,
			  134,  134,    6,    6,    6,    6,    6,    6,    6,    6,
			    6,    6,    6,    7,  192,    7,  192,    7,    7,  138,
			  138,  138,  141,  141,    7,  137,  137,  137,  137,  137,
			  137,  137,  140,  140,  140,  142,  142,  143,  143,  143,
			  145,  145,  145,  145,  145,  145,  145,  148,  149,  149,
			  149,  151,  151,  151,  152,  152,  153,  153,  154,  154,
			  154,  163,  163,    7,    7,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    8,  214,    8,  214,    8,    8,

			  160,  160,  160,  164,  164,    8,  162,  162,  162, 1222,
			  148,  148,  148,  148,  148,  148,  148,  165,  165,  165,
			  169,  169,  169,  169,  169,  169,  169,  172,  172,  172,
			  174,  174,  174,  175,  175,  176,  176,  177,  177,  177,
			  186,  186,  186, 1221,    8,    8,    8,    8,    8,    8,
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
			   13,   19, 1219,   19,  190,  193,  193,  193,  195,  195,
			  195,  196,  196,  181, 1218,  190,  190,  190,  190,  190,

			  190,  190,  197,  197,  198,  198,  198,  207,  207,  207,
			  159,  200,  200,  200,  200,  200,  200,  200,  202, 1217,
			  202,  209,  209,  209,   19,  210,  210,  203,  211,  211,
			 1216,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   20,  159,   20,  181,  181,  181,  181,  181,
			  181,  181, 1215,  159,  159,  159,  159,  159,  159,  159,
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
			  224,  224,  224,  224, 1213,  217,  221,  219,  220,  277,
			  227,  277,  227,  231,  231,  231,  233,  233, 1212,  218,

			  226,  226,  227,  228,  228,  228,  228,  228,  228,  228,
			  234,  234,  234,   23,   23, 1211,   23,   23,   23,   23,
			   23,   23,   23,   23,   23,   23,   23,   24,  217,  218,
			  219,  220, 1210,  226,  246,  246,  226,  236,  236,  236,
			  247,  247,  218,  237,  237,  237,  238,  238,  238,  239,
			  239,  239,  240,  240,  240,  241,  241,  241,  242,  242,
			  242,  242,  242,  242,  242,  243,  243,  243,  245,  245,
			  245,  248,  248,  248,   24,   24, 1209,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   25,   25,
			   25,  253,  253,  253,  255,  255,  255,  256,  256, 1207, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   25,  250, 1206,  250,  257,  257,  258,  258,  258,  252,
			  262,  262,  262,  264,  264,  264,  265,  265,  266,  266,
			 1205,  252,  261,  267,  267,  267,  270,  270,  270,  261,
			  269,  269,  269,  269,  269,  269,  269,  307,  307,   25,
			   25,   25,   25,   25,   25,   25,   25,   25,   25,   25,
			   26,   26,   26,  250,  250,  250,  250,  250,  250,  250,
			  315,  315,   26,  252,  252,  252,  252,  252,  252,  252,
			 1204,  261,  261,  261,  261,  261,  261,  261,  271,  271,
			  271,  272,  272,  272,  273,  273,  273,  274,  274,  274,
			  275,  275,  275,  296, 1203,  296,  300,  300,  300,  316,

			  316,   26,   26,   26,   26,   26,   26,   26,   26,   26,
			   26,   26,   27,  297,  297,  297,  297,  297,  297,  297,
			  301,  301,  301,  302,  302,  302,  303,  303,  303,  304,
			  304,  304,  305,  305,  305,  306,  326,  306,  326, 1202,
			  310,  310,  312,  312,  312, 1201,  310,  310,  310,  310,
			  310,  310,  314,  314,  314,   27, 1199,   27,  317,  317,
			  317, 1198,   27,   27,   27,   27,   27,   27,   27,   27,
			   27,   27,   27,   28,  310,  311,  311,  320,  320,  320,
			 1197,  311,  311,  311,  311,  311,  311,  321,  321,  321,
			  322,  322,  322,  323,  323,  323,  324,  324,  324,  325, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  325,  325,  327,  327,  327,  327,  327,  327,  327,  329,
			  329,  329,  329,  329,  329,  329,   28, 1196,   28,  330,
			  330,  330, 1195,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   29,  332,  332,  332,  333,  333,
			  334,  334,  335,  335,  335,   29,  337,  337,  337,  337,
			  337,  337,  337,  338,  338,  338,  340,  340,  340,  341,
			  341,  342,  342,  343,  343,  343,  345,  345,  345,  346,
			  346,  346,  347,  347,  347,  355,  355,   29,   29,  348,
			  348,  348,  356,  356,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   30,  349,  349,  349,  350,

			  350,  350,  352,  352,  352, 1194,   30,  351,  351,  351,
			  351,  351,  351,  351,  354,  354,  354,  357,  357,  357,
			  359, 1192,  359,  361,  361,  361,  362,  362,  362,  363,
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
			 1191,   35,  375,  375,   35,  369,  369,  371,  371,  371,
			   35,  369,  369,  369,  369,  369,  369,  370,  370,  360,
			  373,  373,  373,  370,  370,  370,  370,  370,  370,  376,
			  376,  376,  380,  380,  380,  382,  382,  382,  958,  369,
			  383,  383,  384,  384,  398,  398,   35,  958,   35,   35,
			   35,   35,   35,   35,   35,   35,   35,   35,   35,   35,
			   36, 1189,   36,  399,  399,   36,  385,  385,  385,  414,
			  414,   36,  360,  360,  360,  360,  360,  360,  360,  388,

			  388,  388,  389,  389,  389,  390,  390,  390,  391,  391,
			  391,  392,  392,  392,  393,  393,  393,  395,  395,  395,
			  397,  397,  397,  400,  400,  400,  418,   36,  418,   36,
			   36,   36,   36,   36,   36,   36,   36,   36,   36,   36,
			   36,  118,  403,  403,  403,  404,  404,  404,  405,  405,
			  405,  406,  406,  406,  407,  407,  407,  408,  408,  408,
			  411,  411,  411,  413,  413,  413,  118,  409,  564,  118,
			  415,  415,  416,  416,  416,  425,  425,  425,  564,  423,
			  423, 1188,  118,  118,  118,  118,  118,  118,  118,  158,
			  423,  423,  423,  423,  423,  423,  423,  427,  427,  427, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  428,  428,  429,  429,  430,  430,  430,  434,  560,  434,
			  560,  434,  434, 1187,  158,  446,  446,  158, 1186,  409,
			  409,  409,  409,  409,  409,  409,  436,  436,  436, 1185,
			  158,  158,  158,  158,  158,  158,  158,  170,  437,  437,
			  437,  438,  438,  438,  434,  447,  447,  434,  439,  439,
			  439,  440,  440,  440,  441,  441,  441,  443,  443,  443,
			  456,  456,  170, 1184,  452,  170,  442,  442,  442,  442,
			  442,  442,  442,  445,  445,  445,  452, 1183,  170,  170,
			  170,  170,  170,  170,  170,  191,  448,  448,  448,  453,
			  453,  453,  455,  455,  455,  457,  457,  458,  458,  458,

			  462,  462,  462,  464,  464,  464,  465,  465,  466,  466,
			  191,  479,  479,  191,  467,  467,  467, 1182,  452,  452,
			  452,  452,  452,  452,  452, 1095,  191,  191,  191,  191,
			  191,  191,  191,  278, 1095,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  278,  278,  278,  278,  278,  278,
			  278,  278,  278,  278,  470,  470,  470, 1179,  278,  278,
			  278,  278,  278,  278,  278,  278,  287,  287,  287,  287, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  287,  461,  471,  471,  471,  796,  287,  287,  461,  796,
			  287,  287, 1177,  450, 1083,  450,  287,  424,  469,  469,
			  469,  469,  469,  469,  469,  472,  472,  472,  473,  473,
			  473,  474,  474,  474,  475,  475,  475,  476,  476,  476,
			  480,  480,  424,  483, 1176,  424,  478,  478,  478, 1175,
			  461,  461,  461,  461,  461,  461,  461, 1083,  424,  424,
			  424,  424,  424,  424,  424,  450,  450,  450,  450,  450,
			  450,  450,  481,  481,  481,  970,  483,  486,  486,  486,
			  488,  488,  488,  489,  489,  970,  483,  490,  490,  491,
			  491,  491,  494,  494,  494,  495,  495,  495,  496,  496,

			  496,  498,  498,  499,  499,  499,  501,  501,  501,  502,
			  502,  503,  503,  504,  504,  504,  506,  506,  506,  507,
			  507,  507,  508,  508,  508,  509,  509,  509,  510,  510,
			  510,  511,  511,  511,  513,  513,  514,  514,  514,  516,
			  516,  516,  517,  517,  518,  518,  519,  519,  519,  521,
			  521,  521,  522,  522,  522,  523,  523,  523,  524,  524,
			  524,  525,  525,  525,  526,  526,  526,  527,  527,  527,
			  529,  529,  529,  530,  530,  531,  531,  532,  532,  532,
			  534,  534,  534,  535,  535,  535,  536,  536,  536,  537,
			  537,  537,  537,  537,  537,  537,  538,  538,  538,  540, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  540,  540,  541,  541,  542,  542,  543,  543,  543,  569,
			  569,  569,  571,  571,  571,  572,  572,  573,  573,  574,
			  574,  574,  576,  576,  576,  577,  577,  577,  578,  578,
			  578,  580,  580,  583,  583,  583, 1174,  580,  580,  580,
			  580,  580,  580,  581,  581,  584,  584,  584, 1172,  581,
			  581,  581,  581,  581,  581,  582,  582,  585,  585,  585,
			 1169,  582,  582,  582,  582,  582,  582,  586,  586,  586,
			  587,  587,  587,  588,  588,  588,  589,  589,  589,  590,
			  590,  590,  591,  591,  591,  592,  592,  592,  594,  594,
			  594,  595,  595,  596,  596,  597,  597,  597,  599,  599,

			  599,  600,  600,  600,  601,  601,  601,  602,  602,  602,
			  603,  603,  603,  604,  604,  604,  605,  605,  605,  606,
			  606,  606,  607,  607,  607,  608,  608,  608,  609,  609,
			  609,  610,  610,  610,  611,  611,  611,  612,  612,  612,
			  613,  613,  613,  614,  614,  614,  615,  615,  615,  616,
			  616,  616,  617,  617,  617,  618,  618,  618,  619,  619,
			  619,  620,  620,  620,  620,  620,  620,  620,  621,  621,
			  621,  623,  623,  623,  624,  624,  625,  625,  626,  626,
			  626,  628,  628,  628,  629,  629,  629,  630,  630,  630,
			  632,  632,  635,  635,  635, 1168,  632,  632,  632,  632, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  632,  632,  633,  633,  636,  636,  636, 1167,  633,  633,
			  633,  633,  633,  633,  634,  634,  637,  637,  637, 1166,
			  634,  634,  634,  634,  634,  634,  638,  638,  638,  639,
			  639,  639,  640,  640,  640,  641,  641,  641,  642,  642,
			  642,  643,  643,  643,  644,  644,  644,  645,  645,  645,
			  646,  646,  646,  647,  647,  647,  648,  648,  648,  649,
			  649,  649,  650,  650,  650,  651,  651,  651,  652,  652,
			  652,  653,  653,  653,  654,  654,  654,  655,  655,  655,
			  656,  656,  656,  657,  657,  657,  658,  658,  658,  659,
			  659,  659,  660,  660,  660,  661,  661,  661,  662,  662,

			  662,  663,  663,  663,  664,  664,  664,  668,  670,  670,
			  670,  672,  672,  672,  673,  673,  674,  674,  675,  675,
			  675,  680,  680,  680,  682,  682,  682,  683,  683, 1162,
			  679,  679,  668,  684,  684,  668,  679,  679,  679,  679,
			  679,  679,  685,  685,  685,  687,  687,  687,  668,  668,
			  668,  668,  668,  668,  668,  677,  688,  688,  688,  689,
			  689,  689,  700,  700,  679,  690,  690,  690,  691,  691,
			  691,  692,  692,  692,  696,  696,  696,  697,  697,  697,
			  698,  698,  698,  704,  704,  677,  677,  701,  701,  701,
			  703,  703,  703,  705,  705, 1161,  677,  677,  677,  677, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  677,  677,  677,  678,  678,  706,  706,  706, 1160,  678,
			  678,  678,  678,  678,  678,  708,  708,  708,  709,  709,
			  709,  710,  710,  710,  711,  711,  711,  712,  712,  712,
			  713,  713,  713,  678,  678,  715,  715,  678,  716,  716,
			  716,  718,  718,  718,  678,  678,  678,  678,  678,  678,
			  678,  719,  719,  720,  720,  721,  721,  721,  723,  723,
			  723,  724,  724,  724,  725,  725,  725,  726,  726,  726,
			  727,  727,  727,  728,  728,  728,  729,  729,  729,  731,
			  731,  731,  732,  732,  733,  733,  734,  734,  734,  736,
			  736,  736,  737,  737,  737,  738,  738,  738,  739,  739,

			  739,  740,  740,  740,  741,  741,  741,  742,  742,  742,
			  743,  743,  743,  744,  744,  744,  745,  746,  747,  747,
			  747,  748,  748,  748,  749,  749,  749,  750,  750,  750,
			  751,  751,  751,  752,  752,  752,  755,  755,  755,  745,
			  753,  753,  753,  753,  753,  753,  753,  756,  756,  756,
			  757,  757,  757,  758,  758,  758,  759,  759,  759,  745,
			  760,  760,  760,  761,  761,  761,  762,  762,  762,  842,
			  842,  746,  746,  746,  746,  746,  746,  746,  763,  763,
			  763,  764,  764,  764,  765,  765,  765,  766,  766,  766,
			  767,  767,  767,  768,  768,  768,  769,  769,  769,  770, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template_13 (an_array: ARRAY [INTEGER])
			-- Fill chunk #13 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  770,  770,  771,  771,  771,  772,  772,  772,  773,  773,
			  773,  774,  774,  774,  775,  775,  775,  776,  776,  776,
			  777,  777,  777,  778,  778,  778,  779,  779,  779,  780,
			  780,  780,  781,  781,  781,  782,  782,  782,  783,  783,
			  783,  784,  784,  784,  785,  785,  785,  786,  786,  786,
			  808,  812,  812,  812,  808,  813,  813,  813,  814,  814,
			  814,  815,  815,  815,  816,  816,  816,  817,  817,  817,
			  819,  819,  821,  821,  821, 1159,  819,  819,  819,  819,
			  819,  819,  820,  820,  822,  822,  822, 1158,  820,  820,
			  820,  820,  820,  820,  823,  823,  823,  824,  824,  824,

			  825,  825,  825,  826,  826,  826,  827,  827,  827,  828,
			  828,  828,  829,  829,  829,  830,  830,  830,  820,  831,
			  831,  831,  832,  832,  832,  833,  833,  833,  834,  834,
			  834,  835,  835,  835,  836,  836,  836,  837,  837,  837,
			  838,  838,  838,  839,  839,  839,  841,  841,  841,  843,
			  843,  844,  844,  844,  846,  846,  846,  847,  847,  847,
			  848,  848,  848,  849,  849,  849,  850,  850,  850,  851,
			  851,  851,  853,  853,  855,  855,  855, 1157,  853,  853,
			  853,  853,  853,  853,  854,  854,  856,  856,  856, 1156,
			  854,  854,  854,  854,  854,  854,  857,  857,  857,  858, yy_Dummy>>,
			1, 200, 2400)
		end

	yy_chk_template_14 (an_array: ARRAY [INTEGER])
			-- Fill chunk #14 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  858,  858,  859,  859,  859,  860,  860,  860,  861,  861,
			  861,  862,  862,  862,  863,  863,  863,  864,  864,  864,
			  854,  865,  865,  865,  866,  866,  866,  868,  868,  871,
			  871,  871, 1155,  868,  868,  868,  868,  868,  868,  869,
			  869,  873,  873,  873, 1154,  869,  869,  869,  869,  869,
			  869,  874,  874,  875,  875, 1153,  870,  870,  876,  876,
			  876,  868,  870,  870,  870,  870,  870,  870,  878,  878,
			  878,  931,  931,  869,  879,  879,  879,  880,  880,  880,
			  881,  881,  881,  882,  882,  882,  883,  883,  883, 1152,
			  870,  884,  884,  888,  888,  888, 1151,  884,  884,  884,

			  884,  884,  884,  885,  885,  889,  889,  889, 1149,  885,
			  885,  885,  885,  885,  885,  890,  890,  890,  932,  932,
			  886,  886,  891,  891,  891,  884,  886,  886,  886,  886,
			  886,  886,  887,  887,  892,  892,  892,  885,  887,  887,
			  887,  887,  887,  887,  893,  893,  893,  894,  894,  894,
			  895,  895,  895, 1148,  886,  896,  896,  896,  898,  898,
			  898,  899,  899,  899,  941,  941,  887,  900,  900,  900,
			  901,  901,  901,  902,  902,  902,  903,  903,  903,  904,
			  904,  904,  905,  905,  905,  906,  906,  906,  907,  907,
			  907,  908,  908,  908,  909,  909,  909,  910,  910,  910, yy_Dummy>>,
			1, 200, 2600)
		end

	yy_chk_template_15 (an_array: ARRAY [INTEGER])
			-- Fill chunk #15 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  911,  911,  911,  912,  912,  912,  913,  913,  913,  914,
			  914,  914,  915,  915,  915,  916,  916,  916,  917,  917,
			  917,  918,  918,  918,  919,  919,  919,  920,  920,  920,
			  921,  921,  921,  922,  922,  922,  923,  923,  923,  924,
			  924,  924,  925,  925,  925,  926,  926,  926,  927,  928,
			  928,  928,  930,  930,  930,  933,  933,  933,  935,  935,
			  935,  936,  936,  936,  937,  937,  937,  938,  938,  938,
			  940,  940,  940,  942,  942, 1147, 1146,  927,  943,  943,
			  943,  945,  945,  945,  946,  946,  946,  947,  947,  947,
			 1139,  927,  948,  948,  948,  949,  949,  949,  950,  950,

			  950,  951,  951,  951,  952,  952,  952,  953,  953,  953,
			  954,  954,  954,  955,  955,  955,  956,  956,  956,  976,
			  981,  981,  981,  976,  982,  982,  982,  983,  983,  983,
			  984,  984,  987,  987,  987, 1138,  984,  984,  984,  984,
			  984,  984,  985,  985,  988,  988,  988, 1137,  985,  985,
			  985,  985,  985,  985,  989,  989,  989,  990,  990,  990,
			  991,  991,  991,  992,  992,  992,  993,  993,  993,  994,
			  994,  994,  995,  995,  995,  996,  996,  996,  985,  997,
			  997,  997,  998,  998,  998,  999,  999, 1007, 1007, 1007,
			 1136,  999,  999,  999,  999,  999,  999, 1000, 1000, 1008, yy_Dummy>>,
			1, 200, 2800)
		end

	yy_chk_template_16 (an_array: ARRAY [INTEGER])
			-- Fill chunk #16 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1008, 1008, 1132, 1000, 1000, 1000, 1000, 1000, 1000, 1003,
			 1003, 1009, 1009, 1009, 1131, 1003, 1003, 1003, 1003, 1003,
			 1003, 1004, 1004, 1010, 1010, 1010, 1130, 1004, 1004, 1004,
			 1004, 1004, 1004, 1000, 1011, 1011, 1011, 1129, 1005, 1005,
			 1012, 1012, 1012, 1003, 1005, 1005, 1005, 1005, 1005, 1005,
			 1006, 1006, 1013, 1013, 1013, 1004, 1006, 1006, 1006, 1006,
			 1006, 1006, 1014, 1014, 1014, 1015, 1015, 1015, 1016, 1016,
			 1248, 1248, 1005, 1248, 1016, 1016, 1016, 1016, 1016, 1016,
			 1017, 1017, 1256, 1256, 1006, 1256, 1017, 1017, 1017, 1017,
			 1017, 1017, 1018, 1018, 1018, 1019, 1019, 1019, 1020, 1020,

			 1020, 1128, 1016, 1021, 1021, 1021, 1022, 1022, 1022, 1023,
			 1023, 1023, 1030, 1127, 1017, 1024, 1024, 1024, 1025, 1025,
			 1025, 1026, 1026, 1026, 1027, 1027, 1027, 1028, 1028, 1028,
			 1029, 1029, 1029, 1031, 1031, 1031, 1032, 1032, 1032, 1126,
			 1030, 1033, 1033, 1033, 1034, 1034, 1034, 1035, 1035, 1035,
			 1036, 1036, 1036, 1125, 1124, 1030, 1037, 1037, 1037, 1038,
			 1038, 1038, 1039, 1039, 1039, 1040, 1040, 1040, 1041, 1041,
			 1041, 1042, 1042, 1042, 1057, 1068, 1068, 1121, 1057, 1120,
			 1109, 1068, 1068, 1068, 1068, 1068, 1068, 1069, 1069, 1070,
			 1070, 1070, 1108, 1069, 1069, 1069, 1069, 1069, 1069, 1071, yy_Dummy>>,
			1, 200, 3000)
		end

	yy_chk_template_17 (an_array: ARRAY [INTEGER])
			-- Fill chunk #17 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1071, 1071, 1072, 1072, 1072, 1073, 1073, 1078, 1078, 1078,
			 1107, 1073, 1073, 1073, 1073, 1073, 1073, 1106, 1074, 1074,
			 1079, 1079, 1079, 1069, 1074, 1074, 1074, 1074, 1074, 1074,
			 1076, 1076, 1080, 1080, 1080, 1105, 1076, 1076, 1076, 1076,
			 1076, 1076, 1077, 1077, 1084, 1084, 1084, 1104, 1077, 1077,
			 1077, 1077, 1077, 1077, 1074, 1085, 1085, 1085, 1103, 1081,
			 1081, 1086, 1086, 1086, 1076, 1081, 1081, 1081, 1081, 1081,
			 1081, 1082, 1082, 1087, 1087, 1087, 1077, 1082, 1082, 1082,
			 1082, 1082, 1082, 1088, 1088, 1088, 1089, 1089, 1089, 1102,
			 1100, 1111, 1111, 1081, 1100, 1101, 1099, 1111, 1111, 1111,

			 1111, 1111, 1111, 1112, 1112, 1082, 1254, 1254, 1254, 1112,
			 1112, 1112, 1112, 1112, 1112, 1113, 1113, 1258, 1258, 1098,
			 1258, 1113, 1113, 1113, 1113, 1113, 1113, 1114, 1114, 1267,
			 1267, 1097, 1267, 1114, 1114, 1114, 1114, 1114, 1114, 1112,
			 1116, 1116, 1094, 1093, 1091, 1090, 1116, 1116, 1116, 1116,
			 1116, 1116, 1247, 1075, 1067, 1065, 1064, 1247, 1117, 1117,
			 1247, 1063, 1062, 1114, 1117, 1117, 1117, 1117, 1117, 1117,
			 1118, 1118, 1061, 1060, 1116, 1058, 1118, 1118, 1118, 1118,
			 1118, 1118, 1056, 1055, 1054, 1051, 1050, 1119, 1119, 1049,
			 1048, 1047, 1117, 1119, 1119, 1119, 1119, 1119, 1119, 1140, yy_Dummy>>,
			1, 200, 3200)
		end

	yy_chk_template_18 (an_array: ARRAY [INTEGER])
			-- Fill chunk #18 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1140, 1046, 1045, 1044, 1118, 1140, 1140, 1140, 1140, 1140,
			 1140, 1002,  980,  979,  978,  977, 1141, 1141,  975,  974,
			  973, 1119, 1141, 1141, 1141, 1141, 1141, 1141,  972,  971,
			 1142, 1142,  969,  968,  967, 1140, 1142, 1142, 1142, 1142,
			 1142, 1142,  965,  964,  963,  962,  961, 1143, 1143,  960,
			  957,  944, 1141, 1143, 1143, 1143, 1143, 1143, 1143, 1144,
			 1144,  939,  934,  929, 1142, 1144, 1144, 1144, 1144, 1144,
			 1144,  897,  877,  872,  867,  845, 1145, 1145,  840,  810,
			  809, 1143, 1145, 1145, 1145, 1145, 1145, 1145, 1163, 1163,
			  807,  806,  805, 1144, 1163, 1163, 1163, 1163, 1163, 1163,

			  804,  803,  802,  801,  800, 1164, 1164,  799,  798,  797,
			 1145, 1164, 1164, 1164, 1164, 1164, 1164, 1165, 1165,  795,
			  794,  793, 1163, 1165, 1165, 1165, 1165, 1165, 1165,  790,
			  789,  788,  787,  754, 1180, 1180,  735,  730,  722, 1164,
			 1180, 1180, 1180, 1180, 1180, 1180, 1181, 1181,  717,  707,
			  702, 1165, 1181, 1181, 1181, 1181, 1181, 1181,  699,  686,
			  681,  676,  671, 1193, 1193,  667,  631,  627, 1180, 1193,
			 1193, 1193, 1193, 1193, 1193,  622, 1268, 1268,  598, 1268,
			 1181, 1268,  593, 1268, 1268, 1268, 1268,  579,  575,  570,
			 1268,  568,  567,  566,  565,  563,  562, 1193, 1234, 1234, yy_Dummy>>,
			1, 200, 3400)
		end

	yy_chk_template_19 (an_array: ARRAY [INTEGER])
			-- Fill chunk #19 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1234, 1234, 1234, 1234, 1234, 1234, 1234, 1234, 1234, 1234,
			 1234, 1234, 1234, 1235, 1235, 1235, 1235, 1235, 1235, 1235,
			 1235, 1235, 1235, 1235, 1235, 1235, 1235, 1235, 1236, 1236,
			 1236, 1236, 1236, 1236, 1236, 1236, 1236, 1236, 1236, 1236,
			 1236, 1236, 1236, 1237, 1237, 1237, 1237, 1237, 1237, 1237,
			 1237, 1237, 1237, 1237, 1237, 1237, 1237, 1237, 1238, 1238,
			 1238, 1238, 1238, 1238, 1238, 1238, 1238, 1238, 1238, 1238,
			 1238, 1238, 1238, 1239, 1239, 1239, 1239, 1239, 1239, 1239,
			 1239, 1239, 1239, 1239, 1239, 1239, 1239, 1239, 1240, 1240,
			 1240, 1240, 1240, 1240, 1240, 1240, 1240, 1240, 1240, 1240,

			 1240, 1240, 1240, 1241, 1241, 1241, 1241, 1241, 1241, 1241,
			 1241, 1241, 1241, 1241, 1241, 1241, 1241, 1241, 1242, 1242,
			 1242, 1242, 1242, 1242, 1242, 1242, 1242, 1242, 1242, 1242,
			 1242, 1242, 1242, 1243, 1243, 1243, 1243, 1243, 1243, 1243,
			 1243, 1243, 1243, 1243, 1243, 1243, 1243, 1243, 1244, 1244,
			 1244, 1244, 1244, 1244, 1244, 1244, 1244, 1244, 1244, 1244,
			 1244, 1244, 1244, 1245, 1245, 1245, 1245, 1245, 1245, 1245,
			 1245, 1245, 1245, 1245, 1245, 1245, 1245, 1245, 1246, 1246,
			 1246, 1246, 1246, 1246, 1246, 1246, 1246, 1246, 1246, 1246,
			 1246, 1246, 1246, 1250, 1250, 1250, 1250, 1250, 1250, 1250, yy_Dummy>>,
			1, 200, 3600)
		end

	yy_chk_template_20 (an_array: ARRAY [INTEGER])
			-- Fill chunk #20 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1250, 1250, 1250, 1250, 1250, 1250,  561, 1250, 1251, 1251,
			  559,  558,  557, 1251,  556, 1251, 1251, 1251, 1251, 1251,
			 1251,  555, 1251, 1252, 1252, 1252, 1252, 1252, 1252, 1252,
			 1252, 1252, 1252, 1252, 1252,  554, 1252, 1253, 1253, 1253,
			  553, 1253, 1253, 1253, 1253, 1253, 1253, 1253, 1253,  552,
			 1253, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255, 1255,
			 1255, 1255, 1255, 1255, 1255, 1255, 1257, 1257, 1257, 1257,
			 1257, 1257, 1257, 1257, 1257, 1257, 1257, 1257,  551, 1257,
			 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259, 1259,
			 1259, 1259,  550, 1259, 1260, 1260, 1260, 1260, 1260, 1260,

			 1260, 1260, 1260, 1260, 1260, 1260,  548, 1260, 1261, 1261,
			 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261, 1261,  547,
			 1261, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262, 1262,
			 1262, 1262, 1262,  546, 1262, 1263, 1263, 1263, 1263, 1263,
			 1263, 1263, 1263, 1263, 1263, 1263, 1263, 1263,  545, 1263,
			 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264, 1264,  544,
			 1264, 1264, 1264,  539, 1264, 1265, 1265, 1265, 1265, 1265,
			 1265, 1265, 1265, 1265, 1265, 1265, 1265,  533, 1265, 1266,
			 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266, 1266,
			 1266,  528, 1266, 1269, 1269, 1269, 1269, 1269, 1269, 1269, yy_Dummy>>,
			1, 200, 3800)
		end

	yy_chk_template_21 (an_array: ARRAY [INTEGER])
			-- Fill chunk #21 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			 1269, 1269, 1269, 1269, 1269,  520, 1269, 1270, 1270, 1270,
			  515, 1270, 1270, 1270, 1270, 1270, 1270, 1270, 1270,  505,
			 1270, 1271, 1271, 1271, 1271, 1271, 1271, 1271, 1271, 1271,
			 1271, 1271, 1271,  500, 1271, 1272, 1272, 1272, 1272, 1272,
			 1272, 1272, 1272, 1272, 1272, 1272, 1272,  497, 1272, 1273,
			 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273, 1273,
			 1273,  493, 1273, 1274, 1274, 1274, 1274, 1274, 1274, 1274,
			 1274, 1274, 1274, 1274, 1274,  492, 1274, 1275, 1275, 1275,
			 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275, 1275,  487,
			 1275, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276, 1276,

			 1276, 1276, 1276,  485, 1276, 1277, 1277, 1277, 1277, 1277,
			 1277, 1277, 1277, 1277, 1277, 1277, 1277,  482, 1277, 1278,
			 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278, 1278,
			 1278,  477, 1278, 1279, 1279, 1279, 1279, 1279, 1279, 1279,
			 1279, 1279, 1279, 1279, 1279,  468, 1279, 1280, 1280, 1280,
			 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280, 1280,
			  463, 1280, 1281, 1281, 1281, 1281, 1281, 1281, 1281, 1281,
			 1281, 1281, 1281, 1281,  460, 1281,  459,  454,  449,  444,
			  433,  432,  431,  426,  422,  421,  420,  417,  412,  401,
			  396,  386,  381,  377,  372,  368,  358,  353,  344,  339, yy_Dummy>>,
			1, 200, 4000)
		end

	yy_chk_template_22 (an_array: ARRAY [INTEGER])
			-- Fill chunk #22 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  336,  331,  318,  313,  309,  294,  293,  292,  291,  290,
			  289,  288,  286,  285,  284,  283,  281,  280,  268,  263,
			  260,  259,  254,  249,  244,  235,  230,  213,  208,  204,
			  199,  194,  189,  178,  173,  166,  161,  155,  150,  144,
			  139,  131,  125,  120,  108,  103,  100,   95,   94,   93,
			   92,   90,   89,   88,   87,   86,   85,   84,   83,   82,
			   80,   76,   75,   70,   68,   62,   57,   52,   48,   47,
			   41,   37,   12,   11, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,

			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, yy_Dummy>>,
			1, 138, 4200)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1281)
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
			    0, 4271, 4270,  417,    0,    0,    0,   77,   82,  479,
			  540,  602,    0,  664,  725,  787,  849,  910,  971, 1032,
			 1093,    2,    3, 1155,    0, 1217, 1278, 4271, 4274,    7,
			 4274, 4257,   80,    0, 4274,    8, 4274, 4256, 4250, 4274,
			    0, 4274, 4261,   78,   85, 4274,   14, 4212,   47,   11,
			   17,   60, 4213,   92,  117,  126, 4274,  149, 4251,   67,
			 4209,   72,   23,   28,  104, 4210, 4210, 4274,   17, 4274,
			 4247,    0, 4238, 4237, 4232, 4233, 4215, 4225, 4228, 4217,
			 4211,   53, 4225, 4215, 4227, 4245, 4274, 4274,   20, 4274,

			 4233,    0,  137, 4191,  140,   43,   63,  143, 4192, 4274,
			   21, 4274, 4274,   12, 4274, 4274, 4274, 4274, 1326,  146,
			 4189,  149,  107,  127,  160, 4190, 4274,   28, 4274, 4274,
			 4274, 4228, 4274,    0,  159, 4274, 4274,  189,  187, 4186,
			  200,  190,  202,  205, 4187,  204,   29, 4274,  254,  216,
			 4184,  219,  222,  223,  226, 4185, 4274, 4274, 1374,  497,
			  248, 4182,  254,  229,  250,  265, 4183, 4274, 4274,  264,
			 1422, 4274,  275, 4180,  278,  281,  282,  285, 4181, 4274,
			 4274,  489, 4274,  101, 4274, 4274,  339,   51, 4274, 4214,
			  439, 1470,  223,  433, 4177,  436,  439,  449,  452, 4178, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  455,  504,  514,  521, 4216, 4274, 4274,  455, 4174,  469,
			  473,  475,  515, 4175,  294,  611, 4274,  679,  693,  681,
			  682,  673,    0,  583,  621, 4274,  685,  689,  647,  535,
			 4172,  641,  538,  643,  658, 4173,  685,  691,  694,  697,
			  700,  703,  702,  713, 4170,  716,  682,  687,  719, 4171,
			  797, 4274,  807,  739, 4168,  742,  745,  751,  754, 4169,
			 4213,  815,  758, 4165,  761,  764,  765,  771, 4166,  774,
			  774,  826,  829,  832,  835,  838, 4274,  688, 1532,    0,
			 4194, 4178,  105, 4177, 4182, 4179, 4173, 1574, 4172, 4172,
			 4184, 4178, 4178, 4169, 4203, 4274,  892,  857,    0, 4274,

			  844,  868,  871,  874,  877,  880,  934,  822, 4274, 4189,
			  925,  960,  890, 4149,  900,  808,  846,  906, 4150, 4274,
			  925,  935,  938,  941,  944,  947,  935,  946,    0,  953,
			  967, 4147,  983,  986,  987,  990, 4148,  990, 1001, 4145,
			 1004, 1007, 1008, 1011, 4146, 1014, 1017, 1020, 1027, 1044,
			 1047, 1051, 1050, 4143, 1062, 1023, 1029, 1065, 4144, 1119,
			 1236, 1071, 1074, 1077, 1080, 1083, 1088, 4274, 4180, 1210,
			 1222, 1175, 4140, 1188, 1091, 1169, 1197, 4141, 4274, 4274,
			 1200, 4138, 1203, 1208, 1209, 1234, 4139, 4274, 1247, 1250,
			 1253, 1256, 1259, 1262, 4274, 1265, 4136, 1268, 1212, 1230, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1271, 4137, 4274, 1290, 1293, 1296, 1299, 1302, 1305, 1363,
			 4274, 1308, 4134, 1311, 1237, 1317, 1320, 4135, 1325, 4274,
			 4169, 4168, 4159, 1334, 1602, 1323, 4129, 1345, 1348, 1349,
			 1352, 4130, 4130, 4129, 1396, 4274, 1374, 1386, 1389, 1396,
			 1399, 1402, 1410, 1405, 4125, 1421, 1363, 1392, 1434, 4126,
			 1609, 4274, 1462, 1437, 4123, 1440, 1408, 1442, 1445, 4124,
			 4167, 1594, 1448, 4106, 1451, 1454, 1455, 1462, 4093, 1562,
			 1532, 1550, 1573, 1576, 1579, 1582, 1585, 4077, 1594, 1459,
			 1587, 1620, 4065, 1637, 4274, 4090, 1625, 4035, 1628, 1631,
			 1634, 1637, 4023, 4048, 1640, 1643, 1646, 4046, 1686, 1651,

			 3979, 1654, 1657, 1658, 1661, 3967, 1664, 1667, 1670, 1673,
			 1676, 1679, 4274, 1719, 1684, 3956, 1687, 1690, 1691, 1694,
			 3953, 1697, 1700, 1703, 1706, 1709, 1712, 1715, 3937, 1718,
			 1721, 1722, 1725, 3925, 1728, 1731, 1734, 1733, 1744, 3909,
			 1747, 1750, 1751, 1754, 3907, 3917, 3908, 3879, 3885,    0,
			 3860, 3853, 3828, 3819, 3814, 3796, 3791, 3772, 3782, 3785,
			 1373, 3781, 3575, 3569, 1339, 3581, 3568, 3569, 3557, 1757,
			 3535, 1760, 1763, 1764, 1767, 3536, 1770, 1773, 1776, 3572,
			 1816, 1828, 1840, 1781, 1793, 1805, 1815, 1818, 1821, 1824,
			 1827, 1830, 1833, 3528, 1836, 1839, 1840, 1843, 3526, 1846, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1849, 1852, 1855, 1858, 1861, 1864, 1867, 1870, 1873, 1876,
			 1879, 1882, 1885, 1888, 1891, 1894, 1897, 1900, 1903, 1906,
			 1905, 1916, 3521, 1919, 1922, 1923, 1926, 3515, 1929, 1932,
			 1935, 3551, 1975, 1987, 1999, 1940, 1952, 1964, 1974, 1977,
			 1980, 1983, 1986, 1989, 1992, 1995, 1998, 2001, 2004, 2007,
			 2010, 2013, 2016, 2019, 2022, 2025, 2028, 2031, 2034, 2037,
			 2040, 2043, 2046, 2049, 2052, 4274, 4274, 3530, 2092, 4274,
			 2056, 3508, 2059, 2062, 2063, 2066, 3509, 2140, 2188, 2115,
			 2069, 3506, 2072, 2075, 2080, 2090, 3507, 2093, 2104, 2107,
			 2113, 2116, 2119, 4274, 4274, 4274, 2122, 2125, 2128, 3557,

			 2147, 2135, 3496, 2138, 2131, 2140, 2153, 3497, 2163, 2166,
			 2169, 2172, 2175, 2178, 4274, 2220, 2186, 3494, 2189, 2199,
			 2200, 2203, 3486, 2206, 2209, 2212, 2215, 2218, 2221, 2224,
			 3483, 2227, 2230, 2231, 2234, 3484, 2237, 2240, 2243, 2246,
			 2249, 2252, 2255, 2258, 2261, 2310, 2315, 2266, 2269, 2272,
			 2275, 2278, 2281, 2284, 3527, 2322, 2295, 2298, 2301, 2304,
			 2308, 2311, 2314, 2326, 2329, 2370, 2335, 2338, 2341, 2344,
			 2347, 2350, 2353, 2356, 2359, 2362, 2365, 2368, 2371, 2374,
			 2377, 2380, 2383, 2386, 2389, 2392, 2395, 3492, 3518, 3503,
			 3489,    0,    0, 3508, 3497, 3481, 1583, 3471, 3476, 3473, yy_Dummy>>,
			1, 200, 600)
		end

	yy_base_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 3465, 3465, 3477, 3471, 3463, 3463, 3452, 3477, 2429, 3457,
			 3444,    0, 2399, 2403, 2406, 2409, 2412, 2415, 4274, 2455,
			 2467, 2420, 2432, 2442, 2445, 2448, 2451, 2454, 2457, 2460,
			 2463, 2467, 2470, 2473, 2476, 2479, 2482, 2485, 2488, 2491,
			 3424, 2494, 2317, 2496, 2499, 3423, 2502, 2505, 2508, 2511,
			 2514, 2517, 4274, 2557, 2569, 2522, 2534, 2544, 2547, 2550,
			 2553, 2556, 2559, 2562, 2565, 2569, 2572, 3448, 2612, 2624,
			 2641, 2577, 3419, 2589, 2599, 2600, 2606, 3420, 2616, 2622,
			 2625, 2628, 2631, 2634, 2676, 2688, 2705, 2717, 2641, 2653,
			 2663, 2670, 2682, 2692, 2695, 2698, 2703, 3465, 2744, 2709,

			 2715, 2718, 2721, 2724, 2727, 2730, 2733, 2736, 2777, 2742,
			 2745, 2748, 2751, 2754, 2757, 2760, 2763, 2766, 2769, 2772,
			 2775, 2778, 2781, 2784, 2787, 2790, 2793, 2842, 2797, 3409,
			 2800, 2619, 2665, 2803, 3410, 2806, 2809, 2812, 2815, 3407,
			 2818, 2712, 2820, 2826, 3399, 2829, 2832, 2835, 2840, 2843,
			 2846, 2849, 2852, 2855, 2858, 2861, 2864, 3414, 1229,    0,
			 3417, 3421, 3414, 3419, 3403, 3421,    0, 3402, 3408, 3411,
			 1646, 3416, 3403, 3386, 3387, 3389, 2898, 3392, 3379, 3374,
			 3388, 2868, 2872, 2875, 2915, 2927, 4274, 2880, 2892, 2902,
			 2905, 2908, 2911, 2914, 2917, 2920, 2923, 2927, 2930, 2970, yy_Dummy>>,
			1, 200, 800)
		end

	yy_base_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2982, 4274, 3391, 2994, 3006, 3023, 3035, 2935, 2947, 2959,
			 2971, 2982, 2988, 3000, 3010, 3013, 3053, 3065, 3040, 3043,
			 3046, 3051, 3054, 3057, 3063, 3066, 3069, 3072, 3075, 3078,
			 3106, 3081, 3084, 3089, 3092, 3095, 3098, 3104, 3107, 3110,
			 3113, 3116, 3119,    0, 3369, 3377, 3362, 3368, 3350, 3376,
			 3359, 3345,    0,    0, 3371, 3344, 3369, 3153, 3352,    0,
			 3348, 3337, 3339, 3326, 3317, 3329,    0, 3329, 3160, 3172,
			 3137, 3147, 3150, 3190, 3203, 3333, 3215, 3227, 3155, 3168,
			 3180, 3244, 3256, 1608, 3192, 3203, 3209, 3221, 3231, 3234,
			 3307, 3310,    0, 3305, 3306, 1496,    0, 3299, 3294, 3267,

			 3269, 3272, 3254, 3219, 3228, 3201, 3178, 3184, 3163, 3167,
			    0, 3276, 3288, 3300, 3312, 4274, 3325, 3343, 3355, 3372,
			 3154, 3139,    0,    0, 3120, 3128, 3100, 3090, 3066, 3014,
			 2991, 2975, 2976,    0, 4274,    0, 2961, 2934, 2900, 2869,
			 3384, 3401, 3415, 3432, 3444, 3461, 2842, 2846, 2715, 2674,
			    0, 2658, 2655, 2616, 2618, 2603, 2576, 2542, 2466, 2441,
			 2185, 2144, 2078, 3473, 3490, 3502, 1981, 1968, 1970, 1822,
			    0,    0, 1819,    4, 1801, 1628, 1610, 1589,    0, 1548,
			 3519, 3531, 1488, 1448, 1429, 1400, 1383, 1392, 1347, 1258,
			    0, 1181, 1092, 3548, 1066,  981,  979,  941,  927,  933, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_base_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,  906,  910,  859,  841,  795,  773,  770,    0,  737,
			  703,  680,  664,  643,    0,  513,  489,  490,  459,  448,
			    0,  318,  280,    8,  169,   88,    0,    0,   68,   53,
			    0,    0,    0, 4274, 3597, 3612, 3627, 3642, 3657, 3672,
			 3687, 3702, 3717, 3732, 3747, 3762, 3777, 3348, 3062,    3,
			 3792, 3807, 3821, 3835, 3299, 3850, 3074, 3864, 3309, 3878,
			 3892, 3905, 3919, 3934, 3949, 3963, 3977, 3323, 3575, 3991,
			 4005, 4019, 4033, 4047, 4061, 4075, 4089, 4103, 4117, 4131,
			 4146, 4160, yy_Dummy>>,
			1, 82, 1200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1281)
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
			    0, 1234, 1234, 1235, 1235, 1236, 1236, 1237, 1237, 1233,
			    9, 1238, 1238, 1233,   13,   13,   13, 1239, 1239, 1240,
			 1240, 1233,   21, 1241, 1241, 1242, 1242, 1243, 1243, 1244,
			 1244, 1245, 1245, 1233,   33, 1246, 1246, 1233, 1233, 1233,
			 1233, 1233, 1247, 1248, 1233, 1233, 1233, 1233, 1233, 1233,
			 1249, 1233, 1233, 1250, 1250, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1251, 1251, 1252, 1233, 1253, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1255, 1233, 1233, 1233, 1233,

			 1233, 1256, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1257, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1258, 1259, 1233, 1233, 1260, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1261, 1233, 1233, 1261, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1262, 1263,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1264,
			 1257, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1265, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1266, 1257, 1267, 1233, 1233, 1233, 1233, 1233, 1233, 1233, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1268, 1268, 1269, 1270, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1271, 1233, 1247, 1247, 1247,
			 1247, 1233, 1248, 1233, 1272, 1233, 1249, 1233, 1250, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1251, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1252, 1233, 1252, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1253, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1273,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1255, 1233, 1233, 1274, 1256, 1233,

			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1275, 1258, 1259,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1260, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1261, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1276, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1265,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1266, 1266, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1267, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1268, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1269, 1233, 1269, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1270, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1277,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1247, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,

			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1278, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, yy_Dummy>>,
			1, 200, 400)
		end

	yy_def_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1279, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1266, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1266, 1266,  678,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,

			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1247, 1280, 1233, 1233, 1233,
			 1233, 1233, 1233, 1281, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, yy_Dummy>>,
			1, 200, 600)
		end

	yy_def_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,  678,  678,
			  678, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233,  678,  678,  678,  678, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,

			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1247, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, yy_Dummy>>,
			1, 200, 800)
		end

	yy_def_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1233, 1233, 1233,  678,  678,  678,  678, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233,  678,  678, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1247, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233,  678,  678, 1233, 1233,
			 1233,  678,  678, 1247, 1233, 1233, 1233, 1233, 1233, 1233,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,

			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1233, 1233, 1233, 1233, 1233,  678,  678,  678,  678,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1233, 1254, 1254, 1254, 1254, 1254,
			 1233, 1233,  678,  678,  678,  678, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1233, 1233,  678,  678,  678, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			  678,  678, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254,  678, 1254, 1254, 1254, 1254, 1254, 1254, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_def_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254, 1254,
			 1254, 1254, 1254,    0, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233, 1233,
			 1233, 1233, yy_Dummy>>,
			1, 82, 1200)
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
			create an_array.make_filled (0, 0, 1233)
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
			    0,    0,    0,    0,    0,  120,  120,  131,   10,    1,
			    2,   10,    9,    7,   70,   63,   64,   70,   69,   66,
			   67,   68,   70,  127,  127,  128,  128,  128,  128,  128,
			  128,  128,  128,   11,   11,   15,   15,   15,   15,  128,
			  128,  128,  128,  128,  128,  128,   15,   55,   21,   54,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   61,   62,   20,   17,   19,

			   20,   18,  128,  128,  128,  128,  128,  128,  128,   97,
			   93,   98,   95,   94,   96,   99,  101,  100,   99,  128,
			  128,  128,  128,  128,  128,  128,   92,   86,   87,   89,
			   88,   92,   90,   91,  119,  117,  118,  116,  128,  128,
			  128,  128,  128,  128,  128,   59,   58,   60,   59,  128,
			  128,  128,  128,  128,  128,  128,  110,  111,  110,  110,
			  128,  128,  128,  128,  128,  128,  128,  113,  115,  113,
			  113,  114,  128,  128,  128,  128,  128,  128,  128,   57,
			  129,   57,   85,   83,   84,   73,   85,   82,   82,   85,
			   80,   85,   76,  128,  128,  128,  128,  128,  128,  128, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  120,  120,  124,  124,  124,  125,  126,  128,  128,  128,
			  128,  128,  128,  128,    1,    1,    8,    9,    9,    4,
			    5,    0,    7,   63,   63,   70,    0,   65,  127,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,   11,    0,    0,    0,    0,    0,    0,    0,
			    0,   12,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,   14,
			    0,    0,    0,    0,    0,    0,   16,   21,   21,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   61,   62,   17,   17,   18,   20,

			    0,    0,    0,    0,    0,    0,   93,   94,  102,  102,
			  102,  102,    0,    0,    0,    0,    0,    0,    0,   99,
			    0,    0,    0,    0,    0,    0,   86,   86,   91,  119,
			    0,    0,    0,    0,    0,    0,    0,  116,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   59,    0,    0,    0,    0,    0,    0,    0,   58,
			   58,    0,    0,    0,    0,    0,    0,  105,  105,  105,
			  105,    0,    0,    0,    0,    0,    0,    0,  108,  109,
			    0,    0,    0,    0,    0,    0,    0,  110,    0,    0,
			    0,    0,    0,    0,  112,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  113,    0,    0,    0,    0,    0,    0,    0,
			   56,    0,    0,    0,    0,    0,    0,    0,   83,   74,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   85,    0,    0,    0,    0,
			    0,    0,  120,    0,    0,    0,    0,    0,    0,    0,
			    0,  121,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  123,
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
			  104,    0,  103,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 400)
		end

	yy_accept_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			   58,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,  106,  107,    0,  106,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   72,   71,    0,    0,   79,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   77,   78,   75,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  122,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    9,    0,    0,    0,    0,
			    0,    0,    0,   65,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   55,   55,   55,
			   55,   32,   38,   55,   55,   55,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 600)
		end

	yy_accept_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   51,    0,    0,    0,    0,    0,    0,  103,  104,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  106,  107,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    9,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,   55,   55,   26,
			   55,   55,   55,   55,   55,   55,   31,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,    0,    0,    0,  104,    0,  104,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,  107, yy_Dummy>>,
			1, 200, 800)
		end

	yy_accept_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,  107,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    9,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   22,   55,   55,   55,   55,   55,   55,
			   55,   55,   33,   39,   55,   55,   55,   55,   55,   52,
			   55,   55,   55,   55,   55,   55,   36,   55,  104,    0,
			    0,    0,    0,  107,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    6,    0,    0,    0,    0,    0,    0,
			   55,   55,   28,   55,   55,   55,   27,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   50,  104,    0,  107,    0,   81,    0,    0,    0,    0,
			   55,   55,   34,   23,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   37,   53,   40,   55,   55,   55,   55,
			    0,    0,    0,    0,    0,    0,   55,   55,   55,   55,
			   29,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,    0,    0,    0,    0,    0,   55,   55,   55,   55,
			   35,   41,   55,   55,   55,   55,   55,   55,   42,   55,
			    0,    0,   55,   55,   55,   55,   55,   55,   55,   55,
			   44,   55,   55,    0,   55,   55,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_accept_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   43,   55,   55,   55,   55,   55,   55,   55,   45,   55,
			   55,   55,   55,   55,   24,   55,   55,   55,   55,   55,
			   46,   55,   55,   55,   55,   55,   48,   25,   55,   55,
			   47,   55,   49,    0, yy_Dummy>>,
			1, 34, 1200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 4274
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 1233
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 1234
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

	yyNb_rules: INTEGER = 130
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 131
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
