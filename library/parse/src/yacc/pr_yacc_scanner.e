note

	description:

		"Scanners for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_YACC_SCANNER

inherit

	PR_YACC_SCANNER_SKELETON

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= ERROR_ACTION)
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
--|#line 39 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 39")
end
last_token := T_TOKEN
when 2 then
--|#line 40 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 40")
end
last_token := T_LEFT
when 3 then
--|#line 41 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 41")
end
last_token := T_RIGHT
when 4 then
--|#line 42 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 42")
end
last_token := T_NONASSOC
when 5 then
--|#line 43 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 43")
end
last_token := T_TYPE
when 6 then
--|#line 44 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 44")
end
last_token := T_START
when 7 then
--|#line 45 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 45")
end
last_token := T_EXPECT
when 8 then
--|#line 46 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 46")
end
last_token := Comma_code
when 9 then
--|#line 47 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 47")
end
last_token := Less_than_code
when 10 then
--|#line 48 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 48")
end
last_token := Greater_than_code
when 11 then
--|#line 49 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 49")
end
last_token := Left_bracket_code
when 12 then
--|#line 50 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 50")
end
last_token := Right_bracket_code
when 13 then
--|#line 51 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 51")
end

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_CODE)
					
when 14 then
--|#line 55 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 55")
end

						set_start_condition (EIFFEL_CODE)
					
when 15 then
--|#line 58 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 58")
end

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
when 16 then
--|#line 62 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 62")
end
last_token := T_UNKNOWN
when 17 then
--|#line 66 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 66")
end
-- Separator or comment.
when 18 then
--|#line 67 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 67")
end
line_nb := line_nb + 1
when 19 then
--|#line 69 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 69")
end

						last_token := T_INTEGER
						last_string_value := text
					
when 20 then
--|#line 73 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 73")
end

						last_token := T_INTEGER_8
						last_string_value := text
					
when 21 then
--|#line 77 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 77")
end

						last_token := T_INTEGER_16
						last_string_value := text
					
when 22 then
--|#line 81 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 81")
end

						last_token := T_INTEGER_32
						last_string_value := text
					
when 23 then
--|#line 85 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 85")
end

						last_token := T_INTEGER_64
						last_string_value := text
					
when 24 then
--|#line 89 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 89")
end

						last_token := T_NATURAL
						last_string_value := text
					
when 25 then
--|#line 93 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 93")
end

						last_token := T_NATURAL_8
						last_string_value := text
					
when 26 then
--|#line 97 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 97")
end

						last_token := T_NATURAL_16
						last_string_value := text
					
when 27 then
--|#line 101 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 101")
end

						last_token := T_NATURAL_32
						last_string_value := text
					
when 28 then
--|#line 105 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 105")
end

						last_token := T_NATURAL_64
						last_string_value := text
					
when 29 then
--|#line 109 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 109")
end

						last_token := T_BOOLEAN
						last_string_value := text
					
when 30 then
--|#line 113 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 113")
end

						last_token := T_REAL
						last_string_value := text
					
when 31 then
--|#line 117 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 117")
end

						last_token := T_REAL_32
						last_string_value := text
					
when 32 then
--|#line 121 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 121")
end

						last_token := T_REAL_64
						last_string_value := text
					
when 33 then
--|#line 125 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 125")
end

						last_token := T_DOUBLE
						last_string_value := text
					
when 34 then
--|#line 129 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 129")
end

						last_token := T_CHARACTER
						last_string_value := text
					
when 35 then
--|#line 133 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 133")
end

						last_token := T_CHARACTER_8
						last_string_value := text
					
when 36 then
--|#line 137 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 137")
end

						last_token := T_CHARACTER_32
						last_string_value := text
					
when 37 then
--|#line 141 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 141")
end

						last_token := T_POINTER
						last_string_value := text
					
when 38 then
--|#line 145 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 145")
end

						last_token := T_TUPLE
						last_string_value := text
					
when 39 then
--|#line 149 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 149")
end

						last_token := T_LIKE
						last_string_value := text
					
when 40 then
--|#line 153 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 153")
end

						last_token := T_CURRENT
						last_string_value := text
					
when 41 then
--|#line 157 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 157")
end

						last_token := T_EXPANDED
						last_string_value := text
					
when 42 then
--|#line 161 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 161")
end

						last_token := T_REFERENCE
						last_string_value := text
					
when 43 then
--|#line 165 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 165")
end

						last_token := T_SEPARATE
						last_string_value := text
					
when 44 then
--|#line 169 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 169")
end

						last_token := T_ATTACHED
						last_string_value := text
					
when 45 then
--|#line 173 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 173")
end

						last_token := T_DETACHABLE
						last_string_value := text
					
when 46 then
--|#line 177 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 177")
end

						last_token := T_AS
						last_string_value := text
					
when 47 then
--|#line 181 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 181")
end

						last_token := T_IDENTIFIER
						last_string_value := text
					
when 48 then
--|#line 185 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 185")
end

						last_token := T_NUMBER
						last_integer_value := text.to_integer
						if last_integer_value = 0 then
							report_null_integer_error
						end
					
when 49 then
--|#line 192 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 192")
end

						last_token := T_CHAR
						last_string_32_value := unicode_text
					
when 50 then
--|#line 196 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 196")
end

						last_token := T_STR
						last_string_value := utf8_text
						if text_count < 4 then
							report_invalid_string_token_error (utf8_text)
						end
					
when 51 then
--|#line 206 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 206")
end
last_token := T_PREC
when 52 then
--|#line 207 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 207")
end

						last_token := T_ERROR
						last_integer_value := line_nb
						set_start_condition (ERROR_SECTION)
					
when 53 then
--|#line 212 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 212")
end

						last_token := Colon_code
						last_integer_value := line_nb
					
when 54 then
--|#line 216 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 216")
end

						last_token := Bar_code
						last_integer_value := line_nb
					
when 55 then
--|#line 220 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 220")
end
last_token := Semicolon_code
when 56 then
--|#line 221 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 221")
end

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					
when 57 then
--|#line 225 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 225")
end

						set_start_condition (EIFFEL_ACTION)
					
when 58 then
--|#line 228 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 228")
end

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
when 59 then
--|#line 235 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 235")
end

						last_token := T_USER_CODE
						last_string_value := utf8_text
					
when 60 then
--|#line 242 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 242")
end
-- Separator or comment.
when 61 then
--|#line 243 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 243")
end
line_nb := line_nb + 1
when 62 then
--|#line 245 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 245")
end
last_token := Left_parenthesis_code
when 63 then
--|#line 246 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 246")
end
last_token := Right_parenthesis_code
when 64 then
--|#line 247 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 247")
end

						last_token := T_NUMBER
						last_error := text.to_integer
						last_integer_value := last_error
					
when 65 then
--|#line 252 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 252")
end

						line_nb := line_nb + 1
						set_start_condition (ERROR_ACTION)
					
when 66 then
--|#line 256 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 256")
end

						set_start_condition (ERROR_ACTION)
					
when 67 then
--|#line 262 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 262")
end
more
when 68 then
--|#line 263 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 263")
end
more
when 69 then
--|#line 264 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 264")
end
more
when 70 then
--|#line 265 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 265")
end
more
when 71 then
--|#line 266 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 266")
end
more
when 72 then
--|#line 267 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 267")
end

					line_nb := line_nb + 1
					more
				
when 73 then
--|#line 271 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 271")
end

					last_token := T_EIFFEL
					last_string_value := utf8_text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
when 74, 75, 76, 77, 78 then
--|#line 285 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 285")
end

					action_buffer.append_string (utf8_text)
				
when 79 then
--|#line 292 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 292")
end

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
when 80 then
--|#line 296 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 296")
end

					if start_condition = ERROR_ACTION then
						report_invalid_dollar_dollar_error
						action_buffer.append_string ("$$")
					elseif attached rule as l_rule then
						process_dollar_dollar (l_rule)
					else
						action_buffer.append_string ("$$")
					end
				
when 81 then
--|#line 306 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 306")
end

					if text_substring (2, text_count).is_integer then
						if attached rule as l_rule then
							if start_condition = ERROR_ACTION then
								process_dollar_n (text_substring (2, text_count).to_integer, last_error - 1, l_rule)
							else
								process_dollar_n (text_substring (2, text_count).to_integer, l_rule.rhs.count, l_rule)
							end
						else
							action_buffer.append_string (text)
						end
					else
						report_integer_too_large_error (text_substring (2, text_count))
						action_buffer.append_string (text)
					end
				
when 82 then
--|#line 322 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 322")
end

					if text_substring (3, text_count).is_integer then
						if attached rule as l_rule then
							if start_condition = ERROR_ACTION then
								process_dollar_n (- text_substring (3, text_count).to_integer, last_error - 1, l_rule)
							else
								process_dollar_n (- text_substring (3, text_count).to_integer, l_rule.rhs.count, l_rule)
							end
						else
							action_buffer.append_string (text)
						end
					else
						report_integer_too_large_error (text_substring (3, text_count))
						action_buffer.append_string (text)
					end
				
when 83 then
--|#line 338 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 338")
end

					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				
when 84 then
--|#line 342 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 342")
end

					if nb_open_brackets = 0 then
						last_token := T_ACTION
						last_string_value := cloned_string (action_buffer)
						action_buffer.wipe_out
						set_start_condition (SECTION2)
					else
						action_buffer.append_character ('}')
						nb_open_brackets := nb_open_brackets - 1
					end
				
when 85 then
--|#line 362 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 362")
end

					last_token := unicode_text_item (1).code.to_integer_32
				
when 86 then
--|#line 0 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
			else
				last_token := yyError_token
				fatal_error ("fatal scanner internal error: no action found")
			end
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 3 then
--|#line 276 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 276")
end

					report_missing_characters_error ("%%}")
					last_token := T_EIFFEL
					last_string_value := utf8_text_substring (1, text_count)
					set_start_condition (INITIAL)
				
when 4, 6 then
--|#line 353 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 353")
end

					report_missing_characters_error ("}")
					last_token := T_ACTION
					last_string_value := cloned_string (action_buffer)
					action_buffer.wipe_out
					set_start_condition (SECTION2)
				
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
			create an_array.make_filled (0, 0, 741)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   17,   18,   17,   19,   16,   20,   21,   16,   16,
			   22,   23,   16,   24,   24,   24,   24,   24,   24,   24,
			   24,   16,   16,   25,   26,   27,   28,   29,   30,   31,
			   32,   32,   32,   33,   32,   32,   34,   35,   32,   36,
			   37,   38,   39,   32,   32,   32,   40,   16,   41,   16,
			   16,   16,   16,   16,   42,   49,   88,   50,   16,   51,
			   52,   69,  100,   69,   53,   85,   86,   89,  195,   43,
			   44,   16,   16,   49,   90,   50,  194,   51,   52,  103,
			  104,  103,   53,   91,  108,  101,  109,  108,  117,  109,
			  118,  119,  204,  204,   16,  102,   16,  120,   45,   46,

			   42,  125,  135,  125,   16,  128,  129,  128,   69,  136,
			   69,   79,  137,   79,  152,   43,   44,   16,   16,  153,
			  103,  104,  103,  108,  296,  109,  108,  111,  109,  117,
			  296,  118,  160,  158,  138,  110,  122,  296,  193,  161,
			   16,  164,   16,  296,   45,   46,   55,  192,   56,   57,
			   56,   58,  125,  138,  125,   59,  128,  129,  128,  172,
			  172,  172,  172,  172,  172,  138,  238,  293,  239,  162,
			  294,   80,   80,   80,   80,   80,   80,  174,  275,  127,
			  276,   83,  277,  278,  279,  295,  280,   80,  281,  282,
			   84,   84,   84,  292,   60,  291,   61,   55,  290,   56, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   57,   56,   58,  289,  106,  288,   59,  106,  106,  106,
			  106,  106,  106,  114,  114,  114,  287,  121,  114,  121,
			  121,  173,  286,  173,  173,  203,  173,  203,  203,  226,
			  285,  226,  226,  227,  227,   80,  245,  227,  245,  245,
			  246,  246,  262,  262,  246,   60,  262,   61,   62,   63,
			   62,  261,  283,  261,  261,   64,   65,  274,   66,  273,
			   67,   67,   67,   67,   67,   67,   67,   67,   80,   80,
			   80,   80,  272,  272,  284,  284,  272,  138,  284,  271,
			  270,  269,  268,  267,  266,  265,  264,  263,   80,  138,
			  260,  259,  258,  257,  256,  255,  254,   68,   62,   63,

			   62,  253,  252,  251,  250,   64,   65,  249,   66,  248,
			   67,   67,   67,   67,   67,   67,   67,   67,  247,   80,
			  138,  244,  243,  242,  241,  240,  237,  236,  235,  234,
			  233,  232,  231,  230,  229,  228,   80,  138,  225,  224,
			  223,  222,  221,  122,  116,  111,  107,   68,   55,  220,
			   56,   57,   56,   58,  219,  218,  217,   59,  216,  215,
			  214,  213,  212,  211,  210,  209,  208,  207,  206,  205,
			  138,  202,  201,  200,  199,  198,  197,  196,  191,  190,
			  189,  188,  187,  186,  185,  184,  183,  182,  181,  180,
			  179,  178,  177,  176,  175,  171,   60,  170,   61,   55, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  169,   56,   57,   56,   58,  168,  167,  166,   59,  165,
			  163,  115,  159,  157,  156,  155,  154,  151,  150,  149,
			  148,  147,  146,  145,  144,  143,  142,  141,  138,  134,
			  133,  132,  131,  130,   71,  126,  124,  123,  115,  113,
			  112,   99,   98,   97,   96,   95,   94,   60,   93,   61,
			   72,   92,   87,   82,   81,   71,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,   73,  296,  296,  296,  296,  296,  296,
			   74,   75,  296,  296,   76,   77,   78,  296,  296,  296,
			  296,  296,  296,  296,   79,   80,  296,  296,  296,  296,

			  296,  139,  139,  139,  139,  139,  139,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  140,  140,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   48,   48,   48,   48,   48,   48,
			   48,   48,   48,   48,   48,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   70,   70,   70,
			   70,   70,   70,   70,   70,   70,   70,   80,   80,  296,
			   80,   80,   80,   80,   80,   80,   80,  105,  105,  105, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  105,  105,  105,  105,  105,  105,  105,  105,  107,  107,
			  107,  107,  107,  107,  107,  107,  107,  107,  111,  111,
			  296,  111,  111,  111,  111,  111,  111,  111,  116,  116,
			  116,  116,  116,  116,  116,  116,  116,  116,  122,  122,
			  296,  122,  122,  122,  122,  122,  122,  122,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  124,  124,
			  124,  124,  124,  124,  124,  124,  124,  124,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,   15,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,

			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296, yy_Dummy>>,
			1, 142, 600)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 741)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    3,    7,   29,    7,    3,    7,
			    7,   17,   42,   17,    7,   27,   27,   29,  323,    3,
			    3,    3,    3,    8,   30,    8,  322,    8,    8,   45,
			   45,   45,    8,   30,   50,   42,   50,   51,   56,   51,
			   56,   57,  325,  325,    3,   42,    3,   57,    3,    3,

			    4,   62,   78,   62,    4,   68,   68,   68,   69,   78,
			   69,   79,   79,   79,   97,    4,    4,    4,    4,   97,
			  103,  103,  103,  107,  109,  107,  110,  112,  110,  116,
			  118,  116,  112,  109,  140,   51,  123,  121,  321,  118,
			    4,  123,    4,  121,    4,    4,    9,  320,    9,    9,
			    9,    9,  125,  139,  125,    9,  128,  128,  128,  139,
			  139,  139,  139,  139,  139,  172,  215,  285,  215,  316,
			  285,  172,  172,  172,  172,  172,  172,  140,  267,  313,
			  267,  303,  267,  267,  268,  293,  268,  284,  268,  268,
			  304,  304,  304,  281,    9,  280,    9,   10,  279,   10, yy_Dummy>>,
			1, 200, 0)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			   10,   10,   10,  277,  306,  276,   10,  306,  306,  306,
			  306,  306,  306,  309,  309,  309,  275,  311,  309,  311,
			  311,  319,  274,  319,  319,  324,  319,  324,  324,  326,
			  273,  326,  326,  327,  327,  272,  328,  327,  328,  328,
			  329,  329,  331,  331,  329,   10,  331,   10,   11,   11,
			   11,  330,  269,  330,  330,   11,   11,  265,   11,  264,
			   11,   11,   11,   11,   11,   11,   11,   11,  332,  262,
			  332,  332,  333,  333,  334,  334,  333,  261,  334,  260,
			  259,  258,  254,  253,  252,  251,  249,  247,  246,  245,
			  244,  241,  240,  239,  238,  237,  236,   11,   12,   12,

			   12,  235,  234,  232,  231,   12,   12,  230,   12,  229,
			   12,   12,   12,   12,   12,   12,   12,   12,  228,  227,
			  226,  222,  221,  219,  217,  216,  214,  213,  212,  211,
			  210,  209,  208,  207,  206,  205,  204,  203,  201,  200,
			  199,  198,  196,  195,  194,  193,  192,   12,   13,  191,
			   13,   13,   13,   13,  190,  189,  188,   13,  187,  186,
			  185,  184,  182,  181,  180,  179,  178,  177,  176,  175,
			  173,  171,  170,  169,  168,  167,  166,  165,  157,  156,
			  155,  154,  153,  152,  151,  150,  149,  148,  147,  146,
			  145,  144,  143,  142,  141,  136,   13,  135,   13,   14, yy_Dummy>>,
			1, 200, 200)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  134,   14,   14,   14,   14,  133,  132,  131,   14,  130,
			  122,  115,  111,  102,  101,   99,   98,   96,   95,   94,
			   93,   92,   91,   90,   89,   88,   87,   86,   80,   77,
			   76,   75,   74,   73,   70,   66,   59,   58,   55,   53,
			   52,   39,   38,   37,   36,   35,   34,   14,   33,   14,
			   20,   31,   28,   23,   21,   19,   15,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   20,    0,    0,    0,    0,    0,    0,
			   20,   20,    0,    0,   20,   20,   20,    0,    0,    0,
			    0,    0,    0,    0,   20,   81,    0,    0,    0,    0,

			    0,   81,   81,   81,   81,   81,   81,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,   81,   81,  297,  297,  297,  297,  297,  297,  297,
			  297,  297,  297,  297,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  299,  299,  299,  299,  299,
			  299,  299,  299,  299,  299,  299,  300,  300,  300,  300,
			  300,  300,  300,  300,  300,  300,  300,  301,  301,  301,
			  301,  301,  301,  301,  301,  301,  301,  302,  302,    0,
			  302,  302,  302,  302,  302,  302,  302,  305,  305,  305, yy_Dummy>>,
			1, 200, 400)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  305,  305,  305,  305,  305,  305,  305,  305,  307,  307,
			  307,  307,  307,  307,  307,  307,  307,  307,  308,  308,
			    0,  308,  308,  308,  308,  308,  308,  308,  310,  310,
			  310,  310,  310,  310,  310,  310,  310,  310,  312,  312,
			    0,  312,  312,  312,  312,  312,  312,  312,  314,  314,
			  314,  314,  314,  314,  314,  314,  314,  314,  315,  315,
			  315,  315,  315,  315,  315,  315,  315,  315,  317,  317,
			  317,  317,  317,  317,  317,  317,  317,  317,  318,  318,
			  318,  318,  318,  318,  318,  318,  318,  318,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,

			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296, yy_Dummy>>,
			1, 142, 600)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 334)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   48,   94,    0,    0,   53,   71,  144,
			  195,  247,  297,  346,  397,  456,  688,   60,  688,  451,
			  444,  407,  688,  442,    0,  688,  688,   24,  414,   24,
			   45,  407,    0,  411,  413,  420,  406,  414,  413,  398,
			  688,  688,   56,  688,  688,   78,  688,    0,    0,  688,
			   80,   83,  434,  428,    0,  436,   84,   86,  431,  425,
			  688,  688,  100,  688,  688,  688,  424,    0,  104,  107,
			  430,  688,  688,  389,  403,  393,  397,  387,   64,  110,
			  421,  488,    0,    0,    0,    0,  385,  388,  400,  384,
			  381,  379,  382,  378,  384,  376,  384,   89,  377,  376,

			  688,  374,  373,  119,  688,    0,    0,  119,  688,  121,
			  122,  405,  120,    0,    0,  409,  125,  688,  127,  688,
			    0,  132,  403,  129,    0,  151,    0,    0,  155,  688,
			  370,  377,  369,  374,  375,  362,  356,  688,  688,  146,
			  127,  369,  357,  352,  351,  365,  363,  363,  358,  357,
			  342,  347,  347,  353,  356,  344,  339,  349,    0,  688,
			    0,    0,    0,  688,    0,  348,  334,  350,  342,  333,
			  343,  342,  158,  363,    0,  342,  339,  342,  337,  338,
			  328,  326,  331,    0,  321,  318,  310,  318,  316,  326,
			  316,  322,  334,  333,  332,  331,  315,  688,  300,  298, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  297,  301,  688,  330,  284,  303,  309,  306,  295,  299,
			  301,  301,  299,  302,  297,  150,  296,  299,    0,  283,
			  688,  280,  280,  688,  688,  688,  313,  267,  289,  272,
			  265,  262,  278,    0,  273,  261,  260,  255,  279,  276,
			  255,  249,  688,  688,  252,  282,  236,  259,    0,  257,
			    0,  259,  256,  234,  233,    0,    0,    0,  254,  251,
			  252,  270,  217,    0,  219,  221,    0,  164,  170,  223,
			    0,  688,  183,  181,  193,  198,  190,  186,    0,  180,
			  180,  176,    0,    0,  135,  151,    0,    0,    0,    0,
			    0,    0,    0,  170,    0,    0,  688,  532,  543,  554,

			  565,  575,  585,  175,  184,  596,  201,  606,  616,  207,
			  626,  214,  636,  173,  646,  656,  163,  666,  676,  217,
			  141,  132,   70,   62,  221,   86,  225,  227,  232,  234,
			  247,  236,  264,  266,  268, yy_Dummy>>,
			1, 135, 200)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 334)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  296,    1,    1,    1,  297,  297,  298,  298,  299,
			  299,  300,  300,  299,  299,  296,  296,  296,  296,  301,
			  296,  302,  296,  296,  303,  296,  296,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  296,  296,  296,  296,  296,  296,  296,  305,  306,  296,
			  307,  307,  308,  296,  309,  296,  310,  311,  312,  296,
			  296,  296,  296,  296,  296,  296,  296,  313,  296,  296,
			  301,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  302,  314,  303,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,

			  296,  296,  296,  296,  296,  305,  306,  307,  296,  307,
			  307,  296,  308,  315,  309,  296,  310,  296,  310,  296,
			  316,  311,  296,  312,  317,  296,  318,  313,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  319,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  296,  296,  320,  296,
			  321,  322,  316,  296,  323,  296,  296,  296,  296,  296,
			  296,  296,  296,  324,  325,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  296,  296,  320,  321,  322,  323,  296,  296,  296,  296, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  296,  296,  296,  326,  327,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  296,
			  296,  296,  296,  296,  296,  296,  328,  329,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  296,  296,  296,  330,  331,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,  304,  304,  304,  304,
			  296,  332,  333,  304,  304,  304,  304,  304,  304,  304,
			  304,  296,  334,  304,  304,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  296,  304,  304,  304,  304,  304,
			  304,  304,  304,  304,  304,  304,    0,  296,  296,  296,

			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296,  296,  296,  296,  296,  296,
			  296,  296,  296,  296,  296, yy_Dummy>>,
			1, 135, 200)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (53, 200, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   53,   53,   53,   53,   53,   53,   53,   53,    1,
			    2,   53,   53,    3,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,    1,   53,    4,   53,    5,    6,   53,    7,
			    8,    9,   53,   53,   10,   11,   53,   12,   13,   14,
			   15,   16,   17,   13,   18,   13,   19,   20,   21,   22,
			   23,   53,   24,   53,   53,   25,   26,   27,   28,   29,
			   30,   31,   32,   33,   34,   35,   36,   34,   37,   38,
			   39,   34,   40,   41,   42,   43,   34,   34,   44,   45,
			   34,   46,   47,   48,   53,   49,   53,   25,   26,   27,

			   28,   29,   30,   31,   32,   33,   34,   35,   36,   34,
			   37,   38,   39,   34,   40,   41,   42,   43,   34,   34,
			   44,   45,   34,   50,   51,   52,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53, yy_Dummy>>,
			1, 200, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,   11,    1,   11,    2,    3,    2,    4,   11,   11,
			   11,    5,   11,    6,    6,    6,    6,    6,    6,    6,
			    6,   11,   11,   11,   11,    7,    7,    7,    7,    7,
			    7,    8,    8,    8,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,   11,   11,   11,    8,
			    9,   11,   10,   11, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 296)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,    0,    0,    0,    0,   67,   67,   74,
			   74,    0,    0,   74,   74,   87,   85,   17,   18,   85,
			   16,   85,    8,   85,   48,    9,   10,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   11,   12,   85,   53,   55,   57,   54,   59,   67,   72,
			   71,   71,   71,   71,   74,   79,   78,   78,   78,   78,
			   83,   84,   60,   61,   62,   63,   85,   64,   66,   17,
			    0,   50,   15,    0,    0,    0,    0,    0,    0,   14,
			    0,    0,   17,   48,   47,   46,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   47,   47,

			   58,    0,    0,   57,   56,   59,   67,    0,   68,   68,
			   73,    0,    0,   70,   74,   79,    0,   75,   75,   80,
			    0,   81,    0,    0,   77,   60,   60,   64,   66,   65,
			    0,    0,    0,    0,    0,    0,    0,   13,   49,    0,
			    0,   47,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,    0,    0,    0,   69,
			    0,    0,   82,   76,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   47,   47,   47,   47,   47,
			   47,   47,   47,   39,   47,   47,   30,   47,   47,   47,
			    0,    0,    0,    0,    0,    0,    0,    2,    0,    0, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    5,    0,    0,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   47,   38,    0,
			   51,    0,    0,    3,    6,    1,    0,    0,   47,   47,
			   47,   47,   47,   33,   47,   47,   47,   47,   47,   47,
			   47,   47,   52,    7,    0,    0,    0,   47,   29,   47,
			   40,   47,   47,   19,   24,   37,   31,   32,   47,   47,
			    0,    0,    0,   44,   47,   47,   41,   47,   47,   47,
			   43,    4,    0,   34,   47,   47,   47,   47,   20,   47,
			   47,   47,   25,   42,    0,   47,   45,   21,   22,   23,
			   26,   27,   28,   47,   35,   36,    0, yy_Dummy>>,
			1, 97, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 688
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 296
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 297
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 53
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

	yyNb_rules: INTEGER = 86
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 87
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	SECTION2: INTEGER = 1
	SECTION3: INTEGER = 2
	EIFFEL_CODE: INTEGER = 3
	EIFFEL_ACTION: INTEGER = 4
	ERROR_SECTION: INTEGER = 5
	ERROR_ACTION: INTEGER = 6
			-- Start condition codes

feature -- User-defined features



end
