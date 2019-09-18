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

					check attached utf8_text_substring (1, text_count - 2) as l_last_string then
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
--|#line 165 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 165")
end
set_start_condition (OUTFILE)
when 54 then
--|#line 167 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 167")
end

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 55 then
--|#line 171 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 171")
end

					report_unrecognized_option_error (text)
					set_start_condition (RECOVER1)
			
when 56 then
--|#line 175 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 175")
end

					report_unrecognized_option_error (character_text)
					set_start_condition (RECOVER1)
			
when 57 then
--|#line 182 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 182")
end

					description.set_output_filename (text_substring (2, text_count - 1))
					set_start_condition (OPTION)
				
when 58 then
--|#line 186 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 186")
end

					description.set_output_filename (Void)
					report_missing_quote_error
					set_start_condition (RECOVER1)
				
when 59 then
--|#line 194 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 194")
end
-- Separates name and definition.
when 60 then
--|#line 195 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 195")
end

					check last_string_not_void: attached last_string as l_last_string then
						process_name_definition (l_last_string, unicode_text)
						last_string := Void
						set_start_condition (INITIAL)
					end
				
when 61 then
--|#line 202 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 202")
end

					line_nb := line_nb + 1
					report_incomplete_name_definition_error
					set_start_condition (INITIAL)
				
when 62 then
--|#line 210 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 210")
end

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 63 then
--|#line 214 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 214")
end

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 64 then
--|#line 227 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 227")
end
-- Separator or comment.
when 65 then
--|#line 228 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 228")
end
line_nb := line_nb + 1
when 66 then
--|#line 229 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 229")
end

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 67 then
--|#line 233 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 233")
end

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 68 then
--|#line 242 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 242")
end
last_token := Left_brace_code
when 69 then
--|#line 243 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 243")
end
last_token := Right_brace_code
when 70 then
--|#line 244 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 244")
end

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 71 then
--|#line 248 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 248")
end

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
when 72 then
--|#line 260 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 260")
end

					if description.utf8_mode then
						last_token := UNICODE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				
when 73 then
--|#line 268 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 268")
end

					if description.utf8_mode then
						last_token := BYTE_MODE_START
					else
						last_token := Left_parenthesis_code
						less (1)
					end
				
when 74 then
--|#line 276 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 276")
end

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 75 then
	yy_end := yy_end - 1
--|#line 280 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 280")
end
last_token := Dollar_code
when 76 then
--|#line 281 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 281")
end

					check attached text.as_lower as l_last_string then
						if name_definitions.has (l_last_string) then
							put_back_string (name_definitions.item (l_last_string))
						else
							report_undefined_definition_error (text)
						end
					end
				
when 77 then
--|#line 290 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 290")
end

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 78 then
--|#line 294 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 294")
end

					last_token := CCL_PLUS
				
when 79 then
--|#line 297 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 297")
end

					last_token := CCL_MINUS
				
when 80 then
--|#line 300 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 300")
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
				
when 81 then
--|#line 311 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 311")
end

					report_bad_character_class_error
					last_token := CHAR
					process_character (text_item (1).code)
				
when 82 then
--|#line 316 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 316")
end
last_token := EOF_OP
when 83 then
--|#line 317 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 317")
end
last_token := text_item (1).code
when 84 then
--|#line 318 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 318")
end

					set_start_condition (ACTION_TEXT)
				
when 85 then
--|#line 321 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 321")
end

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 86 then
--|#line 326 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 326")
end

					last_token := CHAR
					process_single_character
				
when 87 then
--|#line 333 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 333")
end
-- Separator or comment.
when 88 then
--|#line 334 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 334")
end
line_nb := line_nb + 1
when 89 then
--|#line 335 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 335")
end
last_token := Comma_code
when 90 then
--|#line 336 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 336")
end
last_token := Star_code
when 91 then
--|#line 337 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 337")
end

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 92 then
--|#line 341 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 341")
end

					last_token := NAME
					last_string_value := text
				
when 93 then
--|#line 345 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 345")
end

					report_bad_start_condition_error (character_text)
				
when 94 then
--|#line 351 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 351")
end
-- Separator.
when 95 then
--|#line 352 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 352")
end

					if attached text as l_text and then l_text.is_integer then
						last_token := NUMBER
						last_integer_value := l_text.to_integer
					else
						report_integer_too_large_error (text)
					end
				
when 96 then
--|#line 360 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 360")
end
last_token := Comma_code
when 97 then
--|#line 361 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 361")
end

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 98 then
--|#line 365 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 365")
end

					report_bad_character_in_brackets_error
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 99 then
--|#line 370 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 370")
end

					report_missing_bracket_error
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 100 then
--|#line 379 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 379")
end

					last_token := CHAR
					process_single_character
				
when 101 then
--|#line 383 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 383")
end

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 102 then
--|#line 387 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 387")
end

					report_missing_quote_error
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 103 then
--|#line 396 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 396")
end

					last_token := CHAR
					process_escaped_character
				
when 104 then
--|#line 400 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 400")
end

					last_token := CHAR
					process_octal_character
				
when 105 then
--|#line 404 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 404")
end

					last_token := CHAR
					process_hexadecimal_character
				
when 106 then
--|#line 408 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 408")
end

					last_token := CHAR
					process_unicode_character
				
when 107 then
--|#line 415 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 415")
end

					last_token := CHAR
					process_escaped_character
					set_start_condition (CCL)
				
when 108 then
--|#line 420 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 420")
end

					last_token := CHAR
					process_octal_character
					set_start_condition (CCL)
				
when 109 then
--|#line 425 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 425")
end

					last_token := CHAR
					process_hexadecimal_character
					set_start_condition (CCL)
				
when 110 then
--|#line 430 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 430")
end

					last_token := CHAR
					process_unicode_character
					set_start_condition (CCL)
				
when 111 then
	yy_end := yy_end - 1
--|#line 435 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 435")
end

					set_start_condition (CCL)
					last_token := Caret_code
				
when 112 then
	yy_end := yy_end - 1
--|#line 439 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 439")
end
last_token := Caret_code
when 113 then
--|#line 440 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 440")
end

					last_token := CHAR
					process_single_character
					set_start_condition (CCL)
				
when 114 then
--|#line 445 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 445")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 115 then
	yy_end := yy_end - 1
--|#line 454 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 454")
end
last_token := Minus_code
when 116 then
--|#line 455 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 455")
end

					last_token := CHAR
					process_single_character
				
when 117 then
--|#line 459 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 459")
end

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 118 then
--|#line 463 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 463")
end

					report_bad_character_class_error
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 119 then
--|#line 472 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 472")
end

					last_token := PIPED
					set_start_condition (SECT2)
				
when 120 then
--|#line 476 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 476")
end

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 121 then
--|#line 481 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 481")
end
set_start_condition (EIFFEL_BLOCK2)
when 122 then
--|#line 482 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 482")
end

					last_token := EIF_CODE
					last_string_value := utf8_text
					set_start_condition (SECT2)
				
when 123 then
--|#line 490 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 490")
end
more
when 124 then
--|#line 491 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 491")
end
more
when 125 then
--|#line 492 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 492")
end
more
when 126 then
--|#line 493 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 493")
end
more
when 127 then
--|#line 494 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 494")
end
more
when 128 then
--|#line 495 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 495")
end

					nb_open_brackets := nb_open_brackets + 1
					more
				
when 129 then
--|#line 499 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 499")
end

					if nb_open_brackets = 0 then
						check attached utf8_text_substring (1, text_count - 1) as l_last_string then
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
--|#line 518 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 518")
end

					last_token := EIF_CODE
					last_string_value := utf8_text
				
when 131 then
--|#line 524 "lx_lex_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'lx_lex_scanner.l' at line 524")
end

					if text_item (1) = '%N' then
						report_bad_character_error ("%%N")
						line_nb := line_nb + 1
					else
						report_bad_character_error (character_text)
					end
				
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
			create an_array.make_filled (0, 0, 2451)
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
			an_array.area.fill_with (566, 2400, 2451)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   39,   40,   39,  121,  121,  122,  122,  140,  149,
			  140,  149,  219,   41,   39,   40,   39,   38,   38,   42,
			   38,   38,   38,   38,   38,   38,   41,   38,   38,   38,
			   38,   38,   38,   38,   38,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   45,   46,
			   45,  157,   55,  158,   56,   57,   55,  547,   59,   57,
			   47,   58,   86,   87,   86,   58,   48,  566,   86,   87,
			   86,  112,   92,   88,   93,  104,   89,   89,   89,   88,

			  204,  112,   89,   89,   89,   92,  104,   93,  163,  566,
			  163,  108,  109,  108,  566,   49,  116,   50,  142,   51,
			   45,   46,   45,  110,  175,   52,  176,  117,  108,  109,
			  108,  566,   47,   90,  204,  113,   94,  114,   48,   90,
			  110,  565,  236,  105,  106,  113,  237,  114,  144,   94,
			  182,  145,  182,  566,  105,  106,  146,  185,  566,  185,
			  118,  119,  147,  186,  186,  186,  191,   49,  191,   50,
			  564,   51,   61,   62,   61,   60,   60,   60,   60,   60,
			   60,   60,   60,   60,   63,   60,   64,   64,   64,   60,
			   60,   60,   60,   64,   65,   66,   67,   68,   69,   64, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   64,   64,   64,   64,   70,   71,   72,   73,   74,   75,
			   64,   64,   76,   64,   77,   64,   60,   60,   60,   60,
			   60,   60,   60,   60,   60,   60,   81,   82,   81,   80,
			   80,   80,   80,   80,   80,   80,   80,   80,   83,   80,
			   80,   80,   80,   80,   80,   80,   80,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   84,   84,   84,   84,   84,   84,   84,   84,   84,   84,
			   80,   80,   80,   80,   80,   80,   80,   80,   80,   80,
			   96,   97,   96,   95,   95,   95,   95,   95,   95,   98,
			   95,   99,  100,   95,   95,   95,   95,   95,   95,   95,

			  101,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,  102,  102,  102,  102,  102,  102,
			  102,  102,  102,  102,   95,   95,   95,   95,   95,   95,
			   95,   95,   95,   95,  116,  188,  197,  200,  197,  188,
			  208,  210,  208,  188,  563,  117,  135,  566,  215,  136,
			  216,  135,  272,  273,  136,  137,  209,  209,  209,  211,
			  137,  189,  566,  201,  190,  189,  202,  562,  190,  189,
			  566,  220,  190,  221,  140,  149,  140,  149,  118,  119,
			  124,  125,  124,  126,  127,  272,  273,  128,  129,  129,
			  129,  566,  138,  129,  139,  229,  284,  138,  130,  139, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  153,  225,  153,  147,  226,  147,  566,  230,  152,  152,
			  152,  157,  228,  158,  566,  227,  159,  163,  182,  163,
			  182,  272,  273,  232,  131,  132,  185,  309,  185,  133,
			  129,  124,  125,  124,  126,  127,  274,  310,  128,  129,
			  129,  129,  152,  560,  129,  151,  186,  186,  186,  130,
			  191,  197,  191,  197,  208,  220,  208,  221,  280,  222,
			  345,  304,  275,  305,  346,  276,  283,  288,  288,  288,
			  281,  289,  289,  289,  380,  131,  132,  335,  335,  335,
			  133,  129,  233,  381,  233,  233,  233,  233,  233,  233,
			  233,  233,  233,  233,  164,  233,  164,  164,  164,  233,

			  233,  233,  233,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  242,  243,  244,  245,
			  246,  326,  329,  336,  336,  336,  247,  248,  566,  370,
			  249,  250,  561,  566,  560,  566,  251,  217,  217,  217,
			  156,  288,  288,  288,  358,  272,  273,  327,  359,  566,
			  328,  559,  337,  272,  273,  159,  289,  289,  289,  558,
			  272,  273,  219,  335,  335,  335,  222,  336,  336,  336,
			  391,  217,  566,  566,  279,  330,  330,  330,  557,  378, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  392,  556,  330,  330,  330,  330,  330,  330,  398,  272,
			  273,  426,  399,  566,  449,  427,  272,  273,  272,  273,
			  454,  555,  414,  450,  455,  554,  272,  273,  272,  273,
			  331,  332,  332,  332,  272,  273,  553,  566,  332,  332,
			  332,  332,  332,  332,  272,  273,  272,  273,  143,  152,
			  152,  259,  259,  143,  143,  552,  259,  143,  148,  148,
			  148,  551,  148,  316,  316,  550,  333,  371,  371,  371,
			  165,  165,  165,  165,  371,  371,  371,  371,  371,  371,
			  184,  184,  184,  549,  184,  193,  193,  193,  548,  193,
			  217,  217,  547,  217,  217,  261,  261,  317,  317,  546,

			  261,  545,  372,  373,  373,  373,  318,  318,  319,  319,
			  373,  373,  373,  373,  373,  373,  265,  265,  267,  267,
			  544,  265,  543,  267,  321,  321,  322,  322,  323,  323,
			  324,  324,  361,  361,  365,  365,  362,  362,  374,  375,
			  375,  375,  362,  363,  363,  542,  375,  375,  375,  375,
			  375,  375,  364,  364,  366,  366,  368,  368,  364,  541,
			  366,  540,  368,  403,  403,  404,  404,  367,  367,  403,
			  539,  404,  405,  405,  213,  376,  376,  376,  405,  538,
			  537,  536,  376,  376,  376,  376,  376,  376,  406,  406,
			  435,  435,  436,  436,  406,  535,  435,  534,  436,  437, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  437,  438,  438,  465,  465,  437,  533,  438,  532,  465,
			  213,  377,  377,  377,  531,  530,  529,  528,  377,  377,
			  377,  377,  377,  377,  466,  466,  467,  467,  468,  468,
			  466,  527,  467,  524,  468,  488,  488,  489,  489,  490,
			  490,  488,  523,  489,  522,  490,  213,  408,  408,  408,
			  521,  520,  519,  518,  408,  408,  408,  408,  408,  408,
			  491,  491,  517,  516,  515,  514,  491,  323,  367,  318,
			  363,  509,  508,  507,  506,  505,  504,  503,  502,  501,
			  500,  499,  213,  409,  409,  409,  498,  497,  496,  323,
			  409,  409,  409,  409,  409,  409,  367,  318,  363,  487,

			  486,  485,  484,  483,  482,  481,  480,  479,  478,  477,
			  476,  475,  474,  473,  323,  367,  318,  363,  213,  410,
			  410,  410,  464,  463,  462,  461,  410,  410,  410,  410,
			  410,  410,  460,  459,  458,  457,  456,  453,  452,  451,
			  448,  447,  446,  445,  439,  323,  367,  318,  363,  434,
			  433,  432,  431,  430,  213,  411,  411,  411,  429,  428,
			  425,  424,  411,  411,  411,  411,  411,  411,  423,  422,
			  421,  420,  419,  418,  417,  416,  415,  407,  323,  367,
			  318,  363,  402,  401,  400,  397,  396,  395,  394,  393,
			  213,  412,  412,  412,  390,  389,  388,  387,  412,  412, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  412,  412,  412,  412,  386,  385,  384,  383,  382,  379,
			  369,  323,  367,  318,  363,  360,  357,  356,  355,  354,
			  353,  352,  351,  350,  349,  348,  213,  413,  413,  413,
			  347,  344,  343,  342,  413,  413,  413,  413,  413,  413,
			  341,  340,  339,  338,  156,  226,  334,  325,  320,  315,
			  314,  313,  312,  311,  308,  307,  306,  303,  302,  301,
			  300,  299,  213,  440,  440,  440,  298,  297,  296,  295,
			  440,  440,  440,  440,  440,  440,  294,  293,  292,  291,
			  290,  287,  286,  285,  282,  278,  277,  271,  270,  269,
			  207,  268,  266,  264,  263,  262,  260,  258,  213,  441,

			  441,  441,  181,  257,  256,  255,  441,  441,  441,  441,
			  441,  441,  254,  253,  252,  241,  240,  239,  238,  235,
			  234,  231,  224,  223,  214,  212,  207,  198,  192,  183,
			  181,  179,  178,  177,  213,  442,  442,  442,  174,  173,
			  172,  171,  442,  442,  442,  442,  442,  442,  170,  169,
			  168,  167,  166,  164,  162,  161,  160,  153,  151,  150,
			  141,  566,   79,   79,  566,  566,  566,  566,  566,  566,
			  213,  443,  443,  443,  566,  566,  566,  566,  443,  443,
			  443,  443,  443,  443,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  566,  566,  566,  566,  566,  566,  213,  444,  444,  444,
			  566,  566,  566,  566,  444,  444,  444,  444,  444,  444,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  213,  469,  469,  469,  566,  566,  566,  566,
			  469,  469,  469,  469,  469,  469,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  213,  470,
			  470,  470,  566,  566,  566,  566,  470,  470,  470,  470,
			  470,  470,  566,  566,  566,  566,  566,  566,  566,  566,

			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  213,  471,  471,  471,  566,  566,
			  566,  566,  471,  471,  471,  471,  471,  471,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  213,  472,  472,  472,  566,  566,  566,  566,  472,  472,
			  472,  472,  472,  472,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  213,  492,  492,  492,
			  566,  566,  566,  566,  492,  492,  492,  492,  492,  492, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_nxt_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  213,  493,  493,  493,  566,  566,  566,  566,
			  493,  493,  493,  493,  493,  493,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  213,  494,
			  494,  494,  566,  566,  566,  566,  494,  494,  494,  494,
			  494,  494,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  213,  495,  495,  495,  566,  566,

			  566,  566,  495,  495,  495,  495,  495,  495,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  213,  510,  510,  510,  566,  566,  566,  566,  510,  510,
			  510,  510,  510,  510,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  213,  511,  511,  511,
			  566,  566,  566,  566,  511,  511,  511,  511,  511,  511,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_nxt_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  566,  566,  213,  512,  512,  512,  566,  566,  566,  566,
			  512,  512,  512,  512,  512,  512,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  213,  513,
			  513,  513,  566,  566,  566,  566,  513,  513,  513,  513,
			  513,  513,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  213,  525,  525,  525,  566,  566,
			  566,  566,  525,  525,  525,  525,  525,  525,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,

			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  213,  526,  526,  526,  566,  566,  566,  566,  526,  526,
			  526,  526,  526,  526,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  213,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   54,   54,   54,   54,   54, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_nxt_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   85,   85,   85,
			   85,   85,   85,   85,   85,   85,   85,   85,   85,   85,
			   85,   85,   85,   91,   91,   91,   91,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   91,   91,   91,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  107,  107,  107,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  107,  107,
			  107,  111,  111,  111,  111,  111,  111,  111,  111,  111,

			  111,  111,  111,  111,  111,  111,  111,  115,  115,  115,
			  115,  115,  115,  115,  115,  115,  115,  115,  115,  115,
			  115,  115,  115,  120,  120,  120,  120,  120,  120,  120,
			  120,  120,  120,  120,  120,  120,  120,  120,  120,  123,
			  123,  123,  123,  123,  123,  123,  123,  123,  123,  123,
			  123,  123,  123,  123,  123,  134,  134,  134,  134,  134,
			  134,  134,  134,  134,  134,  134,  134,  134,  134,  134,
			  134,  154,  154,  154,  154,  154,  154,  154,  154,  154,
			  154,  154,  154,  154,  154,  154,  154,  155,  155,  566,
			  566,  566,  155,  566,  155,  155,  155,  155,  155,  155, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_nxt_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  155,  155,  155,  156,  156,  156,  156,  156,  156,  156,
			  156,  156,  156,  156,  156,  156,  156,  156,  159,  159,
			  159,  566,  159,  159,  159,  159,  159,  159,  159,  159,
			  159,  159,  159,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  195,
			  195,  195,  195,  195,  195,  195,  195,  195,  195,  195,
			  195,  195,  195,  195,  196,  196,  196,  196,  196,  196,

			  196,  196,  196,  196,  196,  196,  196,  196,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  566,
			  205,  205,  205,  205,  205,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  566,  206,
			  213,  213,  213,  213,  213,  213,  213,  213,  213,  213,
			  213,  213,  213,  213,  213,  218,  218,  566,  218,  566,
			  218,  566,  218,  218,  218,  218,  218,  566,  566,  218, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_nxt_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  218,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  219,  219,  219,  219,  219,  219,  222,  222,  222,  566,
			  222,  222,  222,  222,  222,  222,  222,  222,  222,  222,
			  222,  141,  141,  141,  141,  141,  141,  141,  141,  141,
			  141,  141,  141,  141,  141,  141,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  161,  161,  161,  161,  161,  183,  183,  183,  183,
			  183,  183,  183,  183,  183,  183,  183,  183,  183,  183,
			  183,  192,  192,  192,  192,  192,  192,  192,  192,  192,

			  192,  192,  192,  192,  192,  192,  198,  198,  198,  198,
			  198,  198,  198,  198,  198,  198,  198,  198,  198,  198,
			  198,  224,  224,  224,  224,  224,  224,  224,  224,  224,
			  224,  224,  224,  224,  224,  224,  233,  233,  233,  233,
			  233,  233,  233,  233,  233,  233,  233,  233,  233,  233,
			  233,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  263,  263,  263,  263,  285,  285,  285,  285,
			  285,  285,  285,  285,  285,  285,  285,  285,  285,  285,
			  285,  285,  286,  286,  286,  286,  286,  286,  286,  286,
			  286,  286,  286,  286,  286,  286,  286,   37,  566,  566, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 2451)
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
			an_array.area.fill_with (566, 2400, 2451)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,   31,   32,   31,   32,   39,   45,
			   39,   45,  334,    1,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    3,    3,
			    3,   55,    7,   55,    7,    7,    8,  564,    8,    8,
			    3,    7,   17,   17,   17,    8,    3,  143,   18,   18,
			   18,   27,   19,   17,   19,   23,   17,   17,   17,   18,

			  114,   28,   18,   18,   18,   20,   24,   20,   61,  145,
			   61,   25,   25,   25,  146,    3,   29,    3,   42,    3,
			    4,    4,    4,   25,   74,    4,   74,   29,   26,   26,
			   26,  143,    4,   17,  114,   27,   19,   27,    4,   18,
			   26,  562,  168,   23,   23,   28,  168,   28,   42,   20,
			   81,   42,   81,  145,   24,   24,   42,   86,  146,   86,
			   29,   29,   42,   89,   89,   89,   96,    4,   96,    4,
			  561,    4,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,

			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   30,   94,  108,  113,  108,  118,
			  124,  128,  124,  132,  558,   30,   35,  414,  133,   35,
			  133,   36,  213,  213,   36,   35,  127,  127,  127,  128,
			   36,   94,  225,  113,   94,  118,  113,  557,  118,  132,
			  144,  135,  132,  135,  140,  149,  140,  149,   30,   30,
			   33,   33,   33,   33,   33,  329,  329,   33,   33,   33,
			   33,  414,   35,   33,   35,  158,  225,   36,   33,   36, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  153,  144,  153,  147,  147,  147,  225,  158,  152,  152,
			  152,  156,  153,  156,  144,  147,  160,  163,  182,  163,
			  182,  332,  332,  160,   33,   33,  185,  253,  185,   33,
			   33,   34,   34,   34,   34,   34,  214,  253,   34,   34,
			   34,   34,  152,  556,   34,  152,  186,  186,  186,   34,
			  191,  197,  191,  197,  208,  219,  208,  219,  221,  223,
			  299,  249,  214,  249,  299,  214,  223,  230,  230,  230,
			  221,  232,  232,  232,  339,   34,   34,  281,  281,  281,
			   34,   34,  164,  339,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,

			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  164,  164,  164,  164,
			  164,  164,  164,  164,  164,  164,  173,  173,  173,  173,
			  173,  272,  274,  283,  283,  283,  173,  173,  284,  326,
			  173,  173,  555,  217,  554,  217,  173,  217,  217,  217,
			  288,  288,  288,  288,  311,  370,  370,  272,  311,  337,
			  272,  552,  284,  274,  274,  289,  289,  289,  289,  551,
			  326,  326,  335,  335,  335,  335,  336,  336,  336,  336,
			  351,  217,  284,  378,  217,  275,  275,  275,  550,  337, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  351,  549,  275,  275,  275,  275,  275,  275,  357,  373,
			  373,  393,  357,  337,  420,  393,  411,  411,  440,  440,
			  425,  548,  378,  420,  425,  546,  275,  275,  512,  512,
			  275,  276,  276,  276,  513,  513,  545,  378,  276,  276,
			  276,  276,  276,  276,  525,  525,  526,  526,  581,  583,
			  583,  609,  609,  581,  581,  544,  609,  581,  582,  582,
			  582,  543,  582,  617,  617,  542,  276,  327,  327,  327,
			  588,  588,  588,  588,  327,  327,  327,  327,  327,  327,
			  590,  590,  590,  540,  590,  592,  592,  592,  539,  592,
			  601,  601,  538,  601,  601,  610,  610,  618,  618,  537,

			  610,  536,  327,  328,  328,  328,  619,  619,  620,  620,
			  328,  328,  328,  328,  328,  328,  613,  613,  614,  614,
			  535,  613,  534,  614,  622,  622,  623,  623,  624,  624,
			  625,  625,  628,  628,  631,  631,  629,  629,  328,  330,
			  330,  330,  629,  634,  634,  532,  330,  330,  330,  330,
			  330,  330,  630,  630,  632,  632,  633,  633,  630,  531,
			  632,  530,  633,  635,  635,  636,  636,  637,  637,  635,
			  529,  636,  638,  638,  330,  331,  331,  331,  638,  528,
			  527,  524,  331,  331,  331,  331,  331,  331,  639,  639,
			  640,  640,  641,  641,  639,  523,  640,  521,  641,  642, yy_Dummy>>,
			1, 200, 600)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  642,  643,  643,  644,  644,  642,  520,  643,  519,  644,
			  331,  333,  333,  333,  518,  517,  516,  515,  333,  333,
			  333,  333,  333,  333,  645,  645,  646,  646,  647,  647,
			  645,  514,  646,  509,  647,  648,  648,  649,  649,  650,
			  650,  648,  507,  649,  506,  650,  333,  371,  371,  371,
			  505,  504,  503,  502,  371,  371,  371,  371,  371,  371,
			  651,  651,  499,  498,  497,  496,  651,  491,  490,  489,
			  488,  487,  486,  485,  484,  483,  482,  481,  480,  479,
			  478,  476,  371,  372,  372,  372,  475,  474,  473,  468,
			  372,  372,  372,  372,  372,  372,  467,  466,  465,  464,

			  463,  462,  461,  457,  456,  455,  454,  453,  452,  451,
			  450,  449,  446,  445,  438,  437,  436,  435,  372,  374,
			  374,  374,  434,  433,  432,  431,  374,  374,  374,  374,
			  374,  374,  430,  429,  428,  427,  426,  424,  423,  422,
			  419,  418,  416,  415,  407,  406,  405,  404,  403,  401,
			  400,  399,  398,  397,  374,  375,  375,  375,  396,  394,
			  392,  391,  375,  375,  375,  375,  375,  375,  390,  387,
			  386,  385,  384,  383,  382,  381,  380,  369,  368,  366,
			  364,  362,  360,  359,  358,  356,  355,  354,  353,  352,
			  375,  376,  376,  376,  350,  349,  348,  346,  376,  376, yy_Dummy>>,
			1, 200, 800)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  376,  376,  376,  376,  345,  344,  343,  342,  341,  338,
			  325,  324,  322,  319,  317,  312,  310,  309,  308,  307,
			  306,  305,  304,  303,  302,  301,  376,  377,  377,  377,
			  300,  298,  297,  296,  377,  377,  377,  377,  377,  377,
			  293,  292,  291,  290,  287,  285,  280,  271,  264,  258,
			  257,  256,  255,  254,  252,  251,  250,  248,  247,  246,
			  245,  244,  377,  408,  408,  408,  243,  242,  241,  240,
			  408,  408,  408,  408,  408,  408,  239,  237,  236,  235,
			  234,  229,  228,  227,  222,  216,  215,  212,  211,  210,
			  206,  202,  201,  200,  198,  190,  189,  188,  408,  409,

			  409,  409,  180,  179,  178,  177,  409,  409,  409,  409,
			  409,  409,  176,  175,  174,  172,  171,  170,  169,  167,
			  166,  159,  137,  136,  131,  130,  122,  110,  100,   83,
			   78,   77,   76,   75,  409,  410,  410,  410,   73,   72,
			   71,   70,  410,  410,  410,  410,  410,  410,   69,   68,
			   67,   66,   65,   63,   59,   58,   57,   52,   48,   47,
			   41,   37,   12,   11,    0,    0,    0,    0,    0,    0,
			  410,  412,  412,  412,    0,    0,    0,    0,  412,  412,
			  412,  412,  412,  412,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,  412,  413,  413,  413,
			    0,    0,    0,    0,  413,  413,  413,  413,  413,  413,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  413,  441,  441,  441,    0,    0,    0,    0,
			  441,  441,  441,  441,  441,  441,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  441,  442,
			  442,  442,    0,    0,    0,    0,  442,  442,  442,  442,
			  442,  442,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  442,  443,  443,  443,    0,    0,
			    0,    0,  443,  443,  443,  443,  443,  443,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  443,  444,  444,  444,    0,    0,    0,    0,  444,  444,
			  444,  444,  444,  444,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  444,  469,  469,  469,
			    0,    0,    0,    0,  469,  469,  469,  469,  469,  469, yy_Dummy>>,
			1, 200, 1200)
		end

	yy_chk_template_8 (an_array: ARRAY [INTEGER])
			-- Fill chunk #8 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,  469,  470,  470,  470,    0,    0,    0,    0,
			  470,  470,  470,  470,  470,  470,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  470,  471,
			  471,  471,    0,    0,    0,    0,  471,  471,  471,  471,
			  471,  471,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  471,  472,  472,  472,    0,    0,

			    0,    0,  472,  472,  472,  472,  472,  472,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  472,  492,  492,  492,    0,    0,    0,    0,  492,  492,
			  492,  492,  492,  492,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  492,  493,  493,  493,
			    0,    0,    0,    0,  493,  493,  493,  493,  493,  493,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>,
			1, 200, 1400)
		end

	yy_chk_template_9 (an_array: ARRAY [INTEGER])
			-- Fill chunk #9 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,  493,  494,  494,  494,    0,    0,    0,    0,
			  494,  494,  494,  494,  494,  494,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,  494,  495,
			  495,  495,    0,    0,    0,    0,  495,  495,  495,  495,
			  495,  495,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,  495,  510,  510,  510,    0,    0,
			    0,    0,  510,  510,  510,  510,  510,  510,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			  510,  511,  511,  511,    0,    0,    0,    0,  511,  511,
			  511,  511,  511,  511,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,  511,  567,  567,  567,
			  567,  567,  567,  567,  567,  567,  567,  567,  567,  567,
			  567,  567,  567,  568,  568,  568,  568,  568,  568,  568,
			  568,  568,  568,  568,  568,  568,  568,  568,  568,  569,
			  569,  569,  569,  569,  569,  569,  569,  569,  569,  569,
			  569,  569,  569,  569,  569,  570,  570,  570,  570,  570, yy_Dummy>>,
			1, 200, 1600)
		end

	yy_chk_template_10 (an_array: ARRAY [INTEGER])
			-- Fill chunk #10 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  570,  570,  570,  570,  570,  570,  570,  570,  570,  570,
			  570,  571,  571,  571,  571,  571,  571,  571,  571,  571,
			  571,  571,  571,  571,  571,  571,  571,  572,  572,  572,
			  572,  572,  572,  572,  572,  572,  572,  572,  572,  572,
			  572,  572,  572,  573,  573,  573,  573,  573,  573,  573,
			  573,  573,  573,  573,  573,  573,  573,  573,  573,  574,
			  574,  574,  574,  574,  574,  574,  574,  574,  574,  574,
			  574,  574,  574,  574,  574,  575,  575,  575,  575,  575,
			  575,  575,  575,  575,  575,  575,  575,  575,  575,  575,
			  575,  576,  576,  576,  576,  576,  576,  576,  576,  576,

			  576,  576,  576,  576,  576,  576,  576,  577,  577,  577,
			  577,  577,  577,  577,  577,  577,  577,  577,  577,  577,
			  577,  577,  577,  578,  578,  578,  578,  578,  578,  578,
			  578,  578,  578,  578,  578,  578,  578,  578,  578,  579,
			  579,  579,  579,  579,  579,  579,  579,  579,  579,  579,
			  579,  579,  579,  579,  579,  580,  580,  580,  580,  580,
			  580,  580,  580,  580,  580,  580,  580,  580,  580,  580,
			  580,  584,  584,  584,  584,  584,  584,  584,  584,  584,
			  584,  584,  584,  584,  584,  584,  584,  585,  585,    0,
			    0,    0,  585,    0,  585,  585,  585,  585,  585,  585, yy_Dummy>>,
			1, 200, 1800)
		end

	yy_chk_template_11 (an_array: ARRAY [INTEGER])
			-- Fill chunk #11 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  585,  585,  585,  586,  586,  586,  586,  586,  586,  586,
			  586,  586,  586,  586,  586,  586,  586,  586,  587,  587,
			  587,    0,  587,  587,  587,  587,  587,  587,  587,  587,
			  587,  587,  587,  589,  589,  589,  589,  589,  589,  589,
			  589,  589,  589,  589,  589,  589,  589,  589,  589,  591,
			  591,  591,  591,  591,  591,  591,  591,  591,  591,  591,
			  591,  591,  591,  591,  593,  593,  593,  593,  593,  593,
			  593,  593,  593,  593,  593,  593,  593,  593,  593,  594,
			  594,  594,  594,  594,  594,  594,  594,  594,  594,  594,
			  594,  594,  594,  594,  595,  595,  595,  595,  595,  595,

			  595,  595,  595,  595,  595,  595,  595,  595,  596,  596,
			  596,  596,  596,  596,  596,  596,  596,  596,  596,  596,
			  596,  596,  596,  597,  597,  597,  597,  597,  597,  597,
			  597,  597,  597,  597,  597,  597,  597,  597,  597,  598,
			  598,  598,  598,  598,  598,  598,  598,  598,  598,    0,
			  598,  598,  598,  598,  598,  599,  599,  599,  599,  599,
			  599,  599,  599,  599,  599,  599,  599,  599,    0,  599,
			  600,  600,  600,  600,  600,  600,  600,  600,  600,  600,
			  600,  600,  600,  600,  600,  602,  602,    0,  602,    0,
			  602,    0,  602,  602,  602,  602,  602,    0,    0,  602, yy_Dummy>>,
			1, 200, 2000)
		end

	yy_chk_template_12 (an_array: ARRAY [INTEGER])
			-- Fill chunk #12 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  602,  603,  603,  603,  603,  603,  603,  603,  603,  603,
			  603,  603,  603,  603,  603,  603,  604,  604,  604,    0,
			  604,  604,  604,  604,  604,  604,  604,  604,  604,  604,
			  604,  605,  605,  605,  605,  605,  605,  605,  605,  605,
			  605,  605,  605,  605,  605,  605,  606,  606,  606,  606,
			  606,  606,  606,  606,  606,  606,  606,  606,  606,  606,
			  606,  607,  607,  607,  607,  607,  607,  607,  607,  607,
			  607,  607,  607,  607,  607,  607,  608,  608,  608,  608,
			  608,  608,  608,  608,  608,  608,  608,  608,  608,  608,
			  608,  611,  611,  611,  611,  611,  611,  611,  611,  611,

			  611,  611,  611,  611,  611,  611,  612,  612,  612,  612,
			  612,  612,  612,  612,  612,  612,  612,  612,  612,  612,
			  612,  615,  615,  615,  615,  615,  615,  615,  615,  615,
			  615,  615,  615,  615,  615,  615,  616,  616,  616,  616,
			  616,  616,  616,  616,  616,  616,  616,  616,  616,  616,
			  616,  621,  621,  621,  621,  621,  621,  621,  621,  621,
			  621,  621,  621,  621,  621,  621,  626,  626,  626,  626,
			  626,  626,  626,  626,  626,  626,  626,  626,  626,  626,
			  626,  626,  627,  627,  627,  627,  627,  627,  627,  627,
			  627,  627,  627,  627,  627,  627,  627,  566,  566,  566, yy_Dummy>>,
			1, 200, 2200)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 651)
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
			    0,    0,   13,   67,  119,    0,    0,   68,   72,  171,
			    0, 1161, 1160,  225,    0,    0,    0,   81,   87,   90,
			  103,  279,    0,   93,  104,  110,  127,   89,   99,  114,
			  332,    2,    3,  379,  430,  342,  347, 1161, 2397,    7,
			 2397, 1147,  112,    0, 2397,    8, 2397, 1146, 1139, 2397,
			    0, 2397, 1151,    0,    0,   67, 2397, 1150, 1142, 1102,
			 2397,  107, 2397, 1140,    0, 1130, 1129, 1124, 1125, 1107,
			 1111, 1114, 1103, 1097,   88, 1107, 1092, 1109, 1128, 2397,
			 2397,  149, 2397, 1116,    0, 2397,  156, 2397, 2397,  148,
			 2397, 2397, 2397, 2397,  320, 2397,  165, 2397, 2397, 2397,

			 1115, 2397,    0,    0, 2397, 2397,    0,    0,  335, 2397,
			 1114, 2397, 2397,  322,   87, 2397, 2397,    0,  324, 2397,
			 2397, 2397, 1122, 2397,  339, 2397, 2397,  355,  318, 2397,
			 1106, 1078,  328,  337,    0,  367, 1117, 1109, 2397, 2397,
			  373,    0, 2397,   81,  364,  103,  108,  402,    0,  374,
			    0, 2397,  393,  399,    0,    0,  407, 2397,  393, 1114,
			  409,    0, 2397,  416,  481,    0, 1096, 1080,  119, 1079,
			 1084, 1081, 1075,  513, 1074, 1074, 1086, 1074, 1077, 1065,
			 1100, 2397,  417,    0,    0,  425,  431, 2397, 1082, 1046,
			 1045,  449,    0,    0,    0,    0,    0,  450, 1091, 2397, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1078, 1042, 1041, 2397, 2397, 2397, 1086, 2397,  453, 2397,
			 1071, 1070, 1061,  306,  421, 1034, 1033,  542,    0,  451,
			 2397,  456, 1077,  452,    0,  356, 2397, 1070, 1069, 1080,
			  452, 2397,  456,    0, 1048, 1053, 1037, 1055,    0, 1043,
			 1043, 1046, 1045, 1044, 1035, 1036, 1018, 1028, 1031,  425,
			 1030, 1033, 1027,  397, 1040, 1026, 1035, 1015, 1034,    0,
			    0,    0,    0,    0, 1033,    0,    0,    0,    0, 2397,
			 2397, 1011,  526, 2397,  527,  580,  616, 2397, 2397, 2397,
			 1045,  462, 2397,  528,  542, 1043,    0, 1038,  546,  561,
			 1002, 1029, 1013,  999,    0,    0, 1020, 1008,  992,  437,

			  991,  992,  989,  983,  983,  995,  989,  981,  988,  977,
			 1003,  542,  991,    0,    0, 2397,    0,  962, 2397,  961,
			 2397,    0,  960, 2397,  959,  983,  534,  652,  688,  339,
			  724,  760,  375,  796,    6,  568,  572,  563,  972,  444,
			    0,  975,  981,  974,  979,  963,  975,    0,  963,  969,
			  972,  560,  976,  962,  952,  953,  955,  586,  960,  947,
			  942,    0,  929, 2397,  928,    0,  927, 2397,  926,  956,
			  519,  832,  868,  563,  904,  940,  976, 1012,  587,    0,
			  941,  949,  934,  949,  931,  958,  942,  928,    0,    0,
			  955,  921,  947,  589,  935,    0,  932,  917,  928,  915, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  910,  922,    0,  896,  895,  894,  893,  923, 1048, 1084,
			 1120,  570, 1156, 1192,  341,  904,  907,    0,  902,  903,
			  584,    0,  906,  912,  907,  598,  912,  899,  894,  913,
			  897,  885,  897,  893,  909,  865,  864,  863,  862, 2397,
			  572, 1228, 1264, 1300, 1336,  887,  873,    0,    0,  876,
			  884,  869,  884,  871,  882,  869,  864,  876,    0, 2397,
			    0,  872,  888,  864,  877,  846,  845,  844,  837, 1372,
			 1408, 1444, 1480,  853,  857,  847,  846,    0,  841,  844,
			  838,  850,  846,  862,  838,  851,  837,  847,  818,  817,
			  816,  815, 1516, 1552, 1588, 1624,  826,  824,  837,  823,

			    0,    0,  823,  839,  815,  828,  809,  818,    0,  793,
			 1660, 1696,  582,  588,  801,  787,  781,  785,  778,  786,
			  771,  773,    0,  755,  751,  598,  600,  740,  737,  731,
			  721,  724,  721,    0,  682,  690,  665,  669,  666,  658,
			  653,    0,  625,  631,  619,  601,  583,    0,  581,  559,
			  568,  543,  536,    0,  528,  522,  417,  331,  309,    0,
			    0,  128,  106,    0,   51,    0, 2397, 1746, 1762, 1778,
			 1794, 1810, 1826, 1842, 1858, 1874, 1890, 1906, 1922, 1938,
			 1954,  644,  650,  640, 1970, 1986, 2001, 2016,  663, 2032,
			  672, 2047,  677, 2062, 2077, 2091, 2106, 2122, 2138, 2153, yy_Dummy>>,
			1, 200, 400)
		end

	yy_base_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 2168,  684, 2184, 2199, 2214, 2229, 2244, 2259, 2274,  643,
			  687, 2289, 2304,  708,  710, 2319, 2334,  655,  689,  698,
			  700, 2349,  716,  718,  720,  722, 2365, 2380,  724,  728,
			  744,  726,  746,  748,  735,  755,  757,  759,  764,  780,
			  782,  784,  791,  793,  795,  816,  818,  820,  827,  829,
			  831,  852, yy_Dummy>>,
			1, 52, 600)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 651)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			yy_def_template_3 (an_array)
			an_array.area.fill_with (566, 600, 651)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  567,  566,  568,  568,  569,  569,  570,  570,  566,
			    9,  571,  571,  566,   13,   13,   13,  572,  572,  573,
			  573,  566,   21,  574,  574,  575,  575,  576,  576,  577,
			  577,  578,  578,  579,  579,  580,  580,  566,  566,  566,
			  566,  566,  581,  582,  566,  566,  566,  566,  566,  566,
			  583,  566,  566,  584,  585,  586,  566,  587,  566,  566,
			  566,  566,  566,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  589,  566,
			  566,  566,  566,  566,  590,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  591,  566,  566,  566,  566,  566,

			  566,  566,  592,  593,  566,  566,  594,  595,  566,  566,
			  595,  566,  566,  596,  597,  566,  566,  598,  591,  566,
			  566,  566,  599,  566,  566,  566,  566,  566,  566,  566,
			  566,  600,  591,  601,  602,  603,  604,  566,  566,  566,
			  566,  605,  566,  581,  581,  581,  581,  566,  582,  566,
			  606,  566,  583,  566,  584,  585,  586,  566,  586,  566,
			  587,  607,  566,  566,  566,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  589,  566,  566,  608,  590,  566,  566,  566,  566,  609,
			  610,  566,  611,  592,  593,  594,  595,  566,  612,  566, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  566,  613,  614,  566,  566,  566,  599,  566,  566,  566,
			  566,  566,  566,  600,  600,  566,  566,  601,  602,  603,
			  566,  603,  566,  604,  615,  581,  566,  566,  566,  566,
			  566,  566,  566,  616,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  566,  617,
			  618,  619,  620,  621,  566,  622,  623,  624,  625,  566,
			  566,  566,  600,  566,  600,  600,  275,  566,  566,  566,
			  566,  566,  566,  566,  581,  626,  627,  566,  566,  566,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,

			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  566,  628,  629,  566,  630,
			  566,  631,  632,  566,  633,  566,  600,  275,  275,  600,
			  275,  275,  600,  275,  566,  566,  566,  581,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  634,  635,  566,  636,  637,  638,  566,  639,  566,
			  600,  275,  275,  600,  275,  275,  275,  275,  581,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588, yy_Dummy>>,
			1, 200, 200)
		end

	yy_def_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  588,  588,  588,  640,  641,  642,  643,  566,  275,  275,
			  275,  600,  275,  275,  581,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  644,  645,  646,  647,  566,
			  600,  275,  275,  275,  275,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  566,
			  588,  588,  588,  588,  588,  648,  649,  650,  651,  275,
			  275,  275,  275,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  566,  566,
			  566,  566,  275,  275,  275,  275,  588,  588,  588,  588,

			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  275,  275,  600,  600,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  600,  600,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,  588,  588,  588,  588,
			  588,  588,  588,  588,  588,  588,    0,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566,
			  566,  566,  566,  566,  566,  566,  566,  566,  566,  566, yy_Dummy>>,
			1, 200, 400)
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
			    0,   54,   54,   54,   54,   54,   54,   54,   54,    1,
			    2,   54,   54,    3,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,    1,   54,    4,   54,    5,    6,   54,    7,
			    8,    9,   10,   11,   12,   13,    9,   14,   15,   15,
			   15,   15,   15,   15,   15,   15,   16,   17,   18,   54,
			   19,   20,   21,    9,   54,   22,   23,   24,   25,   26,
			   27,   28,   29,   30,   31,   32,   33,   34,   35,   36,
			   37,   29,   38,   39,   40,   41,   42,   43,   44,   29,
			   29,   45,   46,   47,   48,   49,   54,   22,   23,   24,

			   25,   26,   27,   28,   29,   30,   31,   32,   33,   34,
			   35,   36,   37,   29,   38,   39,   40,   41,   42,   43,
			   44,   29,   29,   50,   51,   52,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54, yy_Dummy>>,
			1, 200, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   53,   54, yy_Dummy>>,
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
			   13,   16,   14,   15,   16, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 566)
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
			    0,   62,   62,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,  123,  123,  133,   10,    1,
			    2,   10,    9,    7,   71,   64,   65,   71,   70,   67,
			   68,   69,   71,  130,   11,   15,   15,   15,   15,   15,
			   56,   21,   54,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   62,   63,
			   20,   17,   19,   20,   18,   98,   94,   99,   96,   95,
			   97,  100,  102,  101,  100,   93,   87,   88,   90,   89,

			   93,   91,   92,  122,  120,  121,  119,   60,   59,   61,
			   60,  113,  114,  113,  113,  116,  118,  116,  116,  117,
			   58,  131,   58,   86,   84,   85,   74,   86,   83,   83,
			   86,   81,   86,   77,  123,  127,  127,  127,  128,  129,
			    1,    1,    8,    9,    9,    4,    5,    0,    7,   64,
			   64,   71,    0,   66,  130,   11,    0,   12,    0,    0,
			    0,   14,   16,   21,   21,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   62,   63,   17,   17,   18,   94,   95,  103,  103,  103,
			  103,   87,   87,   92,  122,  119,   60,   59,   59,  107, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  107,  107,  107,  111,  112,  115,    0,   57,   84,   75,
			    0,    0,    0,    0,    0,    0,    0,    0,  123,    0,
			  124,    0,    0,    0,  126,    9,    3,    0,    0,    0,
			    0,   13,    0,   21,   55,   55,   55,   55,   30,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,  104,  106,
			    0,  105,    0,   59,  108,  110,    0,  109,    0,   73,
			   72,    0,    0,   80,    0,    0,    0,   78,   79,   76,
			    0,    0,  125,    0,    9,    0,   66,    0,    0,    0,
			   55,   55,   55,   55,   32,   38,   55,   55,   55,   55,

			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   50,   51,  104,  106,    0,  105,    0,
			  108,  110,    0,  109,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    9,   55,   55,
			   26,   55,   55,   55,   55,   55,   55,   31,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,  106,    0,  106,    0,  110,    0,  110,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    9,   22,
			   55,   55,   55,   55,   55,   55,   55,   55,   33,   39,
			   55,   55,   55,   55,   55,   52,   55,   55,   55,   55, yy_Dummy>>,
			1, 200, 200)
		end

	yy_accept_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			   55,   55,   36,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    6,   55,   55,   28,   55,   55,
			   55,   27,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,    0,    0,    0,    0,   82,
			    0,    0,    0,    0,    0,   55,   55,   34,   23,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   37,   53,
			   40,   55,   55,   55,   55,    0,    0,    0,    0,    0,
			    0,    0,    0,   55,   55,   55,   55,   29,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,    0,    0,
			    0,    0,    0,    0,    0,    0,   55,   55,   55,   55,

			   35,   41,   55,   55,   55,   55,   55,   55,   42,   55,
			    0,    0,    0,    0,   55,   55,   55,   55,   55,   55,
			   55,   55,   44,   55,   55,    0,    0,   55,   55,   55,
			   55,   55,   55,   43,   55,   55,   55,   55,   55,   55,
			   55,   45,   55,   55,   55,   55,   55,   24,   55,   55,
			   55,   55,   55,   46,   55,   55,   55,   55,   55,   48,
			   25,   55,   55,   47,   55,   49,    0, yy_Dummy>>,
			1, 167, 400)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 2397
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 566
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 567
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 54
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
