note

	description:

		"Scanners for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"

class PR_YACC_SCANNER

inherit

	PR_YACC_SCANNER_SKELETON

create

	make

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
--|#line 42 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 42")
end
last_token := T_TOKEN
when 2 then
--|#line 43 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 43")
end
last_token := T_LEFT
when 3 then
--|#line 44 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 44")
end
last_token := T_RIGHT
when 4 then
--|#line 45 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 45")
end
last_token := T_NONASSOC
when 5 then
--|#line 46 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 46")
end
last_token := T_TYPE
when 6 then
--|#line 47 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 47")
end
last_token := T_START
when 7 then
--|#line 48 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 48")
end
last_token := T_EXPECT
when 8 then
--|#line 49 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 49")
end
last_token := Comma_code
when 9 then
--|#line 50 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 50")
end
last_token := Less_than_code
when 10 then
--|#line 51 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 51")
end
last_token := Greater_than_code
when 11 then
--|#line 52 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 52")
end
last_token := Left_bracket_code
when 12 then
--|#line 53 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 53")
end
last_token := Right_bracket_code
when 13 then
--|#line 54 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 54")
end

						line_nb := line_nb + 1
						eiffel_text_count := 0
						set_start_condition (EIFFEL_CODE)
					
when 14 then
--|#line 59 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 59")
end

						eiffel_text_count := 0
						set_start_condition (EIFFEL_CODE)
					
when 15 then
--|#line 63 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 63")
end

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
when 16 then
--|#line 67 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 67")
end
last_token := T_UNKNOWN
when 17 then
--|#line 71 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 71")
end
-- Separator or comment.
when 18 then
--|#line 72 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 72")
end
line_nb := line_nb + 1
when 19 then
--|#line 74 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 74")
end

						last_token := T_INTEGER
						last_string_value := text
					
when 20 then
--|#line 78 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 78")
end

						last_token := T_INTEGER_8
						last_string_value := text
					
when 21 then
--|#line 82 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 82")
end

						last_token := T_INTEGER_16
						last_string_value := text
					
when 22 then
--|#line 86 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 86")
end

						last_token := T_INTEGER_32
						last_string_value := text
					
when 23 then
--|#line 90 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 90")
end

						last_token := T_INTEGER_64
						last_string_value := text
					
when 24 then
--|#line 94 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 94")
end

						last_token := T_NATURAL
						last_string_value := text
					
when 25 then
--|#line 98 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 98")
end

						last_token := T_NATURAL_8
						last_string_value := text
					
when 26 then
--|#line 102 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 102")
end

						last_token := T_NATURAL_16
						last_string_value := text
					
when 27 then
--|#line 106 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 106")
end

						last_token := T_NATURAL_32
						last_string_value := text
					
when 28 then
--|#line 110 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 110")
end

						last_token := T_NATURAL_64
						last_string_value := text
					
when 29 then
--|#line 114 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 114")
end

						last_token := T_BOOLEAN
						last_string_value := text
					
when 30 then
--|#line 118 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 118")
end

						last_token := T_REAL
						last_string_value := text
					
when 31 then
--|#line 122 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 122")
end

						last_token := T_REAL_32
						last_string_value := text
					
when 32 then
--|#line 126 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 126")
end

						last_token := T_REAL_64
						last_string_value := text
					
when 33 then
--|#line 130 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 130")
end

						last_token := T_DOUBLE
						last_string_value := text
					
when 34 then
--|#line 134 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 134")
end

						last_token := T_CHARACTER
						last_string_value := text
					
when 35 then
--|#line 138 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 138")
end

						last_token := T_CHARACTER_8
						last_string_value := text
					
when 36 then
--|#line 142 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 142")
end

						last_token := T_CHARACTER_32
						last_string_value := text
					
when 37 then
--|#line 146 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 146")
end

						last_token := T_POINTER
						last_string_value := text
					
when 38 then
--|#line 150 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 150")
end

						last_token := T_TUPLE
						last_string_value := text
					
when 39 then
--|#line 154 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 154")
end

						last_token := T_LIKE
						last_string_value := text
					
when 40 then
--|#line 158 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 158")
end

						last_token := T_CURRENT
						last_string_value := text
					
when 41 then
--|#line 162 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 162")
end

						last_token := T_EXPANDED
						last_string_value := text
					
when 42 then
--|#line 166 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 166")
end

						last_token := T_REFERENCE
						last_string_value := text
					
when 43 then
--|#line 170 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 170")
end

						last_token := T_SEPARATE
						last_string_value := text
					
when 44 then
--|#line 174 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 174")
end

						last_token := T_ATTACHED
						last_string_value := text
					
when 45 then
--|#line 178 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 178")
end

						last_token := T_DETACHABLE
						last_string_value := text
					
when 46 then
--|#line 182 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 182")
end

						last_token := T_AS
						last_string_value := text
					
when 47 then
--|#line 186 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 186")
end

						last_token := T_IDENTIFIER
						last_string_value := text
					
when 48 then
--|#line 190 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 190")
end

						last_token := T_NUMBER
						last_integer_value := text.to_integer
						if last_integer_value = 0 then
							report_null_integer_error
						end
					
when 49 then
--|#line 197 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 197")
end

						last_token := T_CHAR
						last_string_32_value := unicode_text
					
when 50 then
--|#line 201 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 201")
end

						last_token := T_STR
						last_string_value := utf8_text
						if text_count < 4 then
							report_invalid_string_token_error (utf8_text)
						end
					
when 51 then
--|#line 211 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 211")
end
last_token := T_PREC
when 52 then
--|#line 212 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 212")
end

						last_token := T_ERROR
						last_integer_value := line_nb
						set_start_condition (ERROR_SECTION)
					
when 53 then
--|#line 217 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 217")
end

						last_token := Colon_code
						last_integer_value := line_nb
					
when 54 then
--|#line 221 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 221")
end

						last_token := Bar_code
						last_integer_value := line_nb
					
when 55 then
--|#line 225 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 225")
end
last_token := Semicolon_code
when 56 then
--|#line 226 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 226")
end

						line_nb := line_nb + 1
						eiffel_text_count := 0
						set_start_condition (EIFFEL_ACTION)
					
when 57 then
--|#line 231 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 231")
end

						eiffel_text_count := 0
						set_start_condition (EIFFEL_ACTION)
					
when 58 then
--|#line 235 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 235")
end

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
when 59 then
--|#line 242 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 242")
end

						last_token := T_USER_CODE
						last_string_value := utf8_text
					
when 60 then
--|#line 249 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 249")
end
-- Separator or comment.
when 61 then
--|#line 250 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 250")
end
line_nb := line_nb + 1
when 62 then
--|#line 252 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 252")
end
last_token := Left_parenthesis_code
when 63 then
--|#line 253 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 253")
end
last_token := Right_parenthesis_code
when 64 then
--|#line 254 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 254")
end

						last_token := T_NUMBER
						last_error := text.to_integer
						last_integer_value := last_error
					
when 65 then
--|#line 259 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 259")
end

						line_nb := line_nb + 1
						eiffel_text_count := 0
						set_start_condition (ERROR_ACTION)
					
when 66 then
--|#line 264 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 264")
end

						eiffel_text_count := 0
						set_start_condition (ERROR_ACTION)
					
when 67 then
--|#line 271 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 271")
end
eiffel_more
when 68 then
--|#line 272 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 272")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 69 then
--|#line 276 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 276")
end
eiffel_more
when 70 then
--|#line 277 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 277")
end

					last_token := T_EIFFEL
					last_string_value := utf8_text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
when 71 then
--|#line 291 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 291")
end
eiffel_more
when 72 then
--|#line 292 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 292")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 73 then
--|#line 296 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 296")
end
eiffel_more
when 74 then
--|#line 298 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 298")
end

					append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
					eiffel_text_count := 0
					if start_condition = ERROR_ACTION then
						report_invalid_dollar_dollar_error
						action_buffer.append_string ("$$")
					elseif attached rule as l_rule then
						process_dollar_dollar (l_rule)
					else
						action_buffer.append_string ("$$")
					end
				
when 75 then
--|#line 310 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 310")
end

					if attached text_substring (eiffel_text_count + 2, text_count) as l_text_substring then
						append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
						eiffel_text_count := 0
						if l_text_substring.is_integer then
							if attached rule as l_rule then
								if start_condition = ERROR_ACTION then
									process_dollar_n (l_text_substring.to_integer, last_error - 1, l_rule)
								else
									process_dollar_n (l_text_substring.to_integer, l_rule.rhs.count, l_rule)
								end
							else
								eiffel_more
							end
						else
							report_integer_too_large_error (l_text_substring)
							eiffel_more
						end
					else
						eiffel_more
					end
				
when 76 then
--|#line 332 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 332")
end

					if attached text_substring (eiffel_text_count + 3, text_count) as l_text_substring then
						append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
						eiffel_text_count := 0
						if l_text_substring.is_integer then
							if attached rule as l_rule then
								if start_condition = ERROR_ACTION then
									process_dollar_n (- l_text_substring.to_integer, last_error - 1, l_rule)
								else
									process_dollar_n (- l_text_substring.to_integer, l_rule.rhs.count, l_rule)
								end
							else
								eiffel_more
							end
						else
							report_integer_too_large_error (l_text_substring)
							eiffel_more
						end
					else
						eiffel_more
					end
				
when 77 then
--|#line 354 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 354")
end

					nb_open_brackets := nb_open_brackets + 1
					eiffel_more
				
when 78 then
--|#line 358 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 358")
end

					if nb_open_brackets = 0 then
						last_token := T_ACTION
						append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
						eiffel_text_count := 0
						last_string_value := cloned_string (action_buffer)
						action_buffer.wipe_out
						set_start_condition (SECTION2)
					else
						nb_open_brackets := nb_open_brackets - 1
						eiffel_more
					end
				
when 79 then
--|#line 383 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 383")
end
eiffel_more
when 80 then
--|#line 384 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 384")
end
eiffel_more
when 81 then
--|#line 385 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 385")
end
eiffel_more
when 82 then
--|#line 386 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 386")
end
eiffel_more
when 83 then
--|#line 387 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 387")
end

						-- Multi-line manifest string.
					line_nb := line_nb + 1
					push_start_condition (EIFFEL_MSN)
					eiffel_more
				
when 84 then
--|#line 393 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 393")
end

						-- Verbatim string.
					eiffel_verbatim_marker := unicode_text_substring (eiffel_text_count + 2, text_count - 1)
					eiffel_verbatim_opening_character := unicode_text_item (text_count)
					push_start_condition (EIFFEL_VS1)
					eiffel_more
			
when 85 then
--|#line 403 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 403")
end

					pop_start_condition
					eiffel_more
				
when 86 then
--|#line 407 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 407")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 87 then
--|#line 411 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 411")
end

						-- Syntax error: empty line in middle of
						-- multi-line manifest string.
					line_nb := line_nb + 1
					eiffel_more
				
when 88 then
--|#line 417 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 417")
end

						-- Syntax error: missing character % at beginning
						-- of line in multi-line manifest string.
					pop_start_condition
					eiffel_more
				
when 89 then
--|#line 433 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 433")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_VS2)
					eiffel_more
				
when 90 then
--|#line 438 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 438")
end

						-- Syntax error.
					pop_start_condition
					eiffel_more
				
when 91 then
--|#line 450 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 450")
end

					if is_eiffel_verbatim_string_closer (eiffel_text_count + 1, text_count - 1) then
						eiffel_verbatim_marker := eiffel_no_verbatim_marker
						pop_start_condition
					else
						set_start_condition (EIFFEL_VS3)
					end
					eiffel_more
				
when 92 then
--|#line 459 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 459")
end

					line_nb := line_nb + 1
					eiffel_more
				
when 93 then
--|#line 463 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 463")
end

					set_start_condition (EIFFEL_VS3)
					eiffel_more
				
when 94 then
--|#line 474 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 474")
end

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_VS2)
					eiffel_more
				
when 95 then
--|#line 479 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 479")
end

						-- Syntax error.
					pop_start_condition
					eiffel_more
				
when 96 then
--|#line 490 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 490")
end

					last_token := unicode_text_item (1).code.to_integer_32
				
when 97 then
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
--|#line 282 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 282")
end

					report_missing_characters_error ("%%}")
					last_token := T_EIFFEL
					last_string_value := utf8_text_substring (1, text_count)
					set_start_condition (INITIAL)
				
when 4, 6 then
--|#line 371 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 371")
end

					report_missing_characters_error ("}")
					last_token := T_ACTION
					append_utf8_text_substring_to_string (1, eiffel_text_count, action_buffer)
					eiffel_text_count := 0
					last_string_value := cloned_string (action_buffer)
					action_buffer.wipe_out
					set_start_condition (SECTION2)
				
when 7 then
--|#line 423 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 423")
end

						-- Syntax error: missing character % at beginning
						-- of line in multi-line manifest string.
					pop_start_condition
				
when 8 then
--|#line 443 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 443")
end

						-- Syntax error.
					pop_start_condition
				
when 9 then
--|#line 467 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 467")
end

						-- Syntax error.
					pop_start_condition
				
when 10 then
--|#line 484 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 484")
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
			create an_array.make_filled (0, 0, 1360)
			yy_nxt_template_1 (an_array)
			yy_nxt_template_2 (an_array)
			yy_nxt_template_3 (an_array)
			yy_nxt_template_4 (an_array)
			yy_nxt_template_5 (an_array)
			yy_nxt_template_6 (an_array)
			yy_nxt_template_7 (an_array)
			an_array.area.fill_with (378, 1306, 1360)
			Result := yy_fixed_array (an_array)
		end

	yy_nxt_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			    0,   25,   26,   24,   27,   24,   28,   29,   24,   24,
			   30,   31,   24,   32,   32,   32,   32,   32,   32,   32,
			   32,   32,   24,   24,   33,   34,   35,   36,   37,   38,
			   39,   40,   40,   40,   41,   40,   40,   42,   43,   40,
			   44,   40,   45,   46,   47,   40,   40,   40,   48,   24,
			   49,   24,   24,   24,   24,   24,   50,   57,  377,   58,
			   24,   59,   60,   75,   76,   75,   61,  107,   77,   79,
			   80,   79,   51,   52,   24,   24,   57,   99,   58,  108,
			   59,   60,  104,  105,   63,   61,   58,   64,  162,   60,
			  109,  119,   63,   61,   58,   64,  163,   60,   24,  110,

			   24,   61,   53,   54,   50,   75,   76,   75,   24,  179,
			   77,   79,   80,   79,  180,  120,  122,  123,  141,  142,
			   51,   52,   24,   24,   63,  121,   58,   64,  146,   60,
			  147,  135,  290,   61,   65,  291,   66,  136,   63,  378,
			   58,   64,   65,   60,   66,  378,   24,   61,   24,  365,
			   53,   54,   67,   68,  127,  151,  128,  154,  131,   69,
			   70,  374,   71,   91,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,  146,   65,  147,   66,   82,   83,   82,
			   84,  373,   82,   83,   82,   84,  145,   92,   65,  165,
			   66,  143,  144,  143,   93,   94,  145,  268,  129,   95, yy_Dummy>>,
			1, 200, 0)
		end

	yy_nxt_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   96,   97,  129,   73,   67,   68,  148,  149,  148,   98,
			  372,   69,   70,  127,   71,  128,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,  272,   85,  152,  151,  152,
			   85,   85,   98,  164,  208,   85,  122,  123,  141,  142,
			  143,  144,  143,  371,  151,  145,  154,  191,  192,  191,
			  127,  127,  128,  226,  370,   73,  369,  129,  196,  197,
			  196,  129,  148,  149,  148,  152,  151,  152,  368,  198,
			  186,  187,  186,  229,  192,  229,  153,  196,  197,  196,
			  153,   99,  229,  192,  229,  297,  297,  166,  166,  166,
			  166,  166,  166,  166,  129,  165,  185,  185,  129,  300,

			  300,  206,  206,  206,  206,  206,  206,  206,  259,  187,
			  259,  303,  303,  367,  153,  185,  347,  347,  153,  167,
			  167,  186,  187,  186,  188,  185,  126,  126,  126,  126,
			  185,  185,  189,  185,  185,  185,  185,  185,  185,  185,
			  185,  185,  185,  185,  126,  126,  126,  126,  126,  126,
			  185,  126,  185,  126,  185,  185,  185,  126,  126,  185,
			  185,  126,  126,  126,  126,  126,  185,  185,  190,  185,
			  185,  185,  190,  185,  185,  185,  185,  378,  185,  378,
			   99,  185,  185,  185,  185,  102,  102,  185,  191,  192,
			  191,  127,  188,  128,  259,  187,  259,  126,  131,  185, yy_Dummy>>,
			1, 200, 200)
		end

	yy_nxt_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  185,  185,  185,  185,  185,  260,  185,  362,  185,  354,
			  353,  355,  185,  185,  356,  357,  185,  185,  185,  185,
			  185,  227,  228,  228,  228,  228,  228,  228,  228,  228,
			  352,  326,  131,   99,  165,  129,  329,  331,  165,  129,
			   99,   99,   99,   99,   99,   99,   99,  126,  228,  228,
			  228,  228,  228,  228,  228,  228,  228,  131,  145,  145,
			  350,  185,  261,  262,  298,  298,  298,  298,  298,  298,
			  298,  332,  265,  266,  269,  270,  185,  185,  358,  335,
			  359,  263,  332,  360,  361,  375,  264,  140,  140,  376,
			  329,  267,  326,  271,  346,  185,  268,  334,  272,  299,

			  299,  299,  299,  299,  299,  299,  299,  299,  297,  297,
			  195,  195,  299,  299,  299,  299,  299,  299,  301,  301,
			  301,  301,  301,  301,  301,  304,  304,  304,  304,  304,
			  304,  304,  188,  126,  297,  297,  231,  231,  233,  233,
			  296,  296,  131,  300,  300,  145,  327,  323,  324,  145,
			  303,  303,  348,  348,  348,  348,  348,  348,  348,  298,
			  298,  298,  298,  298,  298,  298,  325,  300,  300,  303,
			  303,  326,  327,  126,  298,  298,  298,  298,  298,  298,
			  298,  330,  188,  188,  335,  188,  347,  347,  333,  301,
			  301,  301,  301,  301,  301,  301,  345,  328,  304,  304, yy_Dummy>>,
			1, 200, 400)
		end

	yy_nxt_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  304,  304,  304,  304,  304,  330,  344,  333,  347,  347,
			  343,  342,  328,  348,  348,  348,  348,  348,  348,  348,
			  341,  364,  365,  340,  363,  339,   99,  331,  103,  103,
			  103,  103,  103,  103,  103,  137,  334,  301,  301,  137,
			  165,  137,  137,  241,  301,  336,  363,  241,  241,  241,
			  241,  364,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   56,   56,   56,   56,   56,   56,   56,   56,   56,   56,
			   62,   62,   62,   62,   62,   62,   62,   62,   62,   62,

			   62,   62,   62,   62,   62,   62,   62,   62,   62,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   24,   24,
			   24,   24,   24,   24,   24,   24,   24,   24,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   74,   74,   74,
			   74,   74,   74,   74,   74,   74,   74,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   78,   78,   78,   78,
			   78,   78,   78,   78,   78,   78,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   81,   81,   81,   81,   81,
			   81,   81,   81,   81,   81,   86,   86,   86,   86,   86,
			   86,   86,   86,   86,   86,   86,   86,   86,   86,   86, yy_Dummy>>,
			1, 200, 600)
		end

	yy_nxt_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   86,   86,   86,   86,   89,  322,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   99,  321,   99,   99,   99,  320,   99,
			   99,   99,   99,   99,   99,   99,   99,   99,   99,   99,
			   99,   99,  124,  124,  124,  124,  124,  124,  124,  124,
			  124,  124,  124,  124,  124,  124,  124,  124,  124,  124,
			  124,  125,  319,  318,  125,  317,  316,  125,  315,  125,
			  125,  125,  125,  125,  125,  125,  125,  125,  125,  125,
			  126,  314,  126,  126,  126,  126,  126,  126,  126,  126,
			  126,  126,  126,  126,  126,  126,  126,  126,  126,  131,

			  313,  131,  131,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  131,  131,  131,  131,  134,  312,
			  311,  310,  134,   99,  134,  165,  134,  134,  134,  134,
			  134,  134,  134,  134,  307,  306,  134,  145,  272,  145,
			  145,  145,  145,  145,  145,  145,  145,  145,  145,  145,
			  145,  145,  145,  145,  145,  145,  150,  150,  268,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  153,  153,  153,  153,  153,  153,
			  153,  153,  153,  153,  155,  155,  155,  155,  155,  155, yy_Dummy>>,
			1, 200, 800)
		end

	yy_nxt_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  155,  155,  101,  295,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  131,  294,  131,  131,  131,  293,  131,  304,
			  304,  131,  292,  289,  131,  133,  304,  133,  133,  133,
			  133,  133,  133,  133,  133,  133,  133,  133,  133,  133,
			  133,  133,  133,  133,  139,  288,  139,  139,  139,  139,
			  139,  139,  139,  139,  139,  139,  139,  139,  139,  139,
			  139,  139,  139,  145,  145,  145,  287,  145,  145,  145,
			  286,  145,  285,  284,  145,  207,  283,  145,  282,  207,

			  207,  207,  207,  281,  280,   99,  207,  188,  165,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  242,  242,  242,  242,
			  188,  188,  188,  277,  188,  188,  188,  276,  188,  275,
			  274,  188,  278,  273,  188,  258,  278,  278,  278,  278,
			  279,  279,  279,  279,  302,  302,  302,  302,  279,  305,
			  305,  305,  305,  308,  257,  256,  255,  308,  308,  308,
			  308,  309,  309,  309,  309,  254,  337,  253,  252,  309,
			  337,  337,  337,  337,  338,  338,  338,  338,  349,  349,
			  349,  349,  338,   99,  251,  250,  249,   99,   99,   99, yy_Dummy>>,
			1, 200, 1000)
		end

	yy_nxt_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_nxt'.
		do
			yy_array_subcopy (an_array, <<
			   99,  351,  351,  351,  351,  348,  348,  248,  247,  351,
			  246,  245,  348,  366,  366,  366,  366,  244,  243,  165,
			  240,  366,  239,  238,  237,  236,  235,  234,  232,  230,
			  225,  224,  223,  222,  221,  220,  219,  218,  217,  216,
			  215,  214,  213,  212,  211,  210,  209,  205,  204,  203,
			  202,  201,  200,  199,  156,  151,  138,  194,  193,  184,
			  183,  182,  181,  178,  177,  176,  175,  174,  173,  172,
			  171,  170,  169,  168,  165,  161,  160,  159,  158,  157,
			   90,   88,  156,  151,  139,  138,  133,  132,  130,  118,
			  117,  116,  115,  114,  113,  112,  111,  106,  101,  100,

			   90,   88,  378,   87,   87,   23, yy_Dummy>>,
			1, 106, 1200)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 1360)
			an_array.put (0, 0)
			an_array.area.fill_with (1, 1, 55)
			yy_chk_template_1 (an_array)
			yy_chk_template_2 (an_array)
			an_array.area.fill_with (128, 321, 375)
			yy_chk_template_3 (an_array)
			yy_chk_template_4 (an_array)
			yy_chk_template_5 (an_array)
			yy_chk_template_6 (an_array)
			yy_chk_template_7 (an_array)
			an_array.area.fill_with (378, 1305, 1360)
			Result := yy_fixed_array (an_array)
		end

	yy_chk_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			    3,    7,  375,    7,    3,    7,    7,   15,   15,   15,
			    7,   37,   15,   17,   17,   17,    3,    3,    3,    3,
			    8,  366,    8,   37,    8,    8,   35,   35,    9,    8,
			    9,    9,   97,    9,   38,   50,   10,    9,   10,   10,
			   97,   10,    3,   38,    3,   10,    3,    3,    4,   16,
			   16,   16,    4,  116,   16,   18,   18,   18,  116,   50,
			   53,   53,   73,   73,    4,    4,    4,    4,   13,   50,
			   13,   13,   77,   13,   77,   64,  253,   13,    9,  253,
			    9,   64,   14,  137,   14,   14,   10,   14,   10,  137,
			    4,   14,    4,  365,    4,    4,   11,   11,   58,   85,

			   58,   85,  231,   11,   11,  360,   11,   28,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,  145,   13,  145,
			   13,   19,   19,   19,   19,  359,   20,   20,   20,   20,
			  233,   28,   14,  167,   14,   75,   75,   75,   28,   28,
			   75,  231,   58,   28,   28,   28,   58,   11,   12,   12,
			   79,   79,   79,   28,  358,   12,   12,  126,   12,  126,
			   12,   12,   12,   12,   12,   12,   12,   12,   12,  233,
			   19,   82,   82,   82,   19,   20,   98,   98,  167,   20,
			  122,  122,  141,  141,  143,  143,  143,  356,  153,  143,
			  153,  129,  129,  129,  129,  188,  129,  188,  355,   12, yy_Dummy>>,
			1, 200, 56)
		end

	yy_chk_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  354,  126,  147,  147,  147,  126,  148,  148,  148,  152,
			  152,  152,  353,  147,  186,  186,  186,  190,  190,  190,
			   82,  196,  196,  196,   82,  100,  229,  229,  229,  261,
			  261,  100,  100,  100,  100,  100,  100,  100,  129,  166,
			  228,  228,  129,  265,  265,  166,  166,  166,  166,  166,
			  166,  166,  259,  259,  259,  269,  269,  352,  152,  228,
			  323,  323,  152,  100,  100, yy_Dummy>>,
			1, 65, 256)
		end

	yy_chk_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  185,  185,  185,  185,  351,  185,  185,  185,  185,  389,
			  389,  185,  191,  191,  191,  191,  296,  191,  226,  226,
			  226,  299,  301,  185,  185,  185,  185,  185,  185,  226,
			  185,  345,  185,  343,  341,  343,  185,  185,  343,  343,
			  185,  185,  185,  185,  185,  189,  189,  189,  189,  189,
			  189,  189,  189,  189,  340,  296,  302,  338,  206,  191,
			  299,  301,  337,  191,  206,  206,  206,  206,  206,  206,
			  206,  227,  227,  227,  227,  227,  227,  227,  227,  227,
			  227,  230,  304,  232,  336,  264,  227,  227,  262,  262,
			  262,  262,  262,  262,  262,  302,  230,  230,  232,  232,

			  264,  264,  344,  335,  344,  227,  332,  344,  344,  367,
			  227,  397,  397,  367,  329,  230,  326,  232,  322,  264,
			  230,  304,  232,  263,  263,  263,  263,  263,  263,  263,
			  263,  263,  327,  327,  405,  405,  263,  263,  263,  263,
			  263,  263,  266,  266,  266,  266,  266,  266,  266,  270,
			  270,  270,  270,  270,  270,  270,  295,  297,  297,  297,
			  410,  410,  411,  411,  417,  417,  300,  300,  300,  305,
			  327,  295,  295,  303,  303,  303,  324,  324,  324,  324,
			  324,  324,  324,  328,  328,  328,  328,  328,  328,  328,
			  295,  330,  330,  333,  333,  295,  297,  298,  298,  298, yy_Dummy>>,
			1, 200, 376)
		end

	yy_chk_template_4 (an_array: ARRAY [INTEGER])
			-- Fill chunk #4 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  298,  298,  298,  298,  298,  300,  348,  349,  305,  347,
			  347,  347,  303,  331,  331,  331,  331,  331,  331,  331,
			  321,  328,  334,  334,  334,  334,  334,  334,  334,  330,
			  317,  333,  363,  363,  316,  315,  298,  364,  364,  364,
			  364,  364,  364,  364,  314,  348,  349,  312,  347,  310,
			  309,  331,  390,  390,  390,  390,  390,  390,  390,  396,
			  334,  422,  422,  396,  308,  396,  396,  412,  422,  307,
			  363,  412,  412,  412,  412,  364,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  379,  379,  379,  379,  379,
			  379,  379,  379,  379,  379,  380,  380,  380,  380,  380,

			  380,  380,  380,  380,  380,  380,  380,  380,  380,  380,
			  380,  380,  380,  380,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  381,  381,  381,  381,  381,  381,  381,
			  381,  381,  381,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  382,  382,  382,  382,  382,  382,  382,  382,
			  382,  382,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  383,  383,  383,  383,  383,  383,  383,  383,  383,
			  383,  384,  384,  384,  384,  384,  384,  384,  384,  384,
			  384,  384,  384,  384,  384,  384,  384,  384,  384,  384,
			  385,  385,  385,  385,  385,  385,  385,  385,  385,  385, yy_Dummy>>,
			1, 200, 576)
		end

	yy_chk_template_5 (an_array: ARRAY [INTEGER])
			-- Fill chunk #5 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  385,  385,  385,  385,  385,  385,  385,  385,  385,  386,
			  386,  386,  386,  386,  386,  386,  386,  386,  386,  386,
			  386,  386,  386,  386,  386,  386,  386,  386,  387,  293,
			  387,  387,  387,  387,  387,  387,  387,  387,  387,  387,
			  387,  387,  387,  387,  387,  387,  387,  388,  292,  388,
			  388,  388,  291,  388,  388,  388,  388,  388,  388,  388,
			  388,  388,  388,  388,  388,  388,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  392,  290,  289,  392,  288,
			  287,  392,  286,  392,  392,  392,  392,  392,  392,  392,

			  392,  392,  392,  392,  393,  284,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  394,  283,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  395,  282,  281,  280,  395,  279,  395,  278,
			  395,  395,  395,  395,  395,  395,  395,  395,  274,  273,
			  395,  398,  272,  398,  398,  398,  398,  398,  398,  398,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,
			  399,  399,  268,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  400, yy_Dummy>>,
			1, 200, 776)
		end

	yy_chk_template_6 (an_array: ARRAY [INTEGER])
			-- Fill chunk #6 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  402,  260,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  403,  257,  403,  403,
			  403,  255,  403,  423,  423,  403,  254,  252,  403,  404,
			  423,  404,  404,  404,  404,  404,  404,  404,  404,  404,
			  404,  404,  404,  404,  404,  404,  404,  404,  406,  251,
			  406,  406,  406,  406,  406,  406,  406,  406,  406,  406,

			  406,  406,  406,  406,  406,  406,  406,  407,  407,  407,
			  250,  407,  407,  407,  249,  407,  248,  247,  407,  408,
			  246,  407,  245,  408,  408,  408,  408,  244,  243,  242,
			  408,  409,  241,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  413,  413,  413,  413,  414,  414,  414,  239,  414,  414,
			  414,  238,  414,  237,  236,  414,  415,  234,  414,  225,
			  415,  415,  415,  415,  416,  416,  416,  416,  418,  418,
			  418,  418,  416,  419,  419,  419,  419,  420,  224,  223,
			  222,  420,  420,  420,  420,  421,  421,  421,  421,  221, yy_Dummy>>,
			1, 200, 976)
		end

	yy_chk_template_7 (an_array: ARRAY [INTEGER])
			-- Fill chunk #7 of template for `yy_chk'.
		do
			yy_array_subcopy (an_array, <<
			  424,  220,  219,  421,  424,  424,  424,  424,  425,  425,
			  425,  425,  426,  426,  426,  426,  425,  427,  218,  216,
			  215,  427,  427,  427,  427,  428,  428,  428,  428,  429,
			  429,  214,  213,  428,  212,  211,  429,  430,  430,  430,
			  430,  210,  209,  207,  205,  430,  204,  203,  202,  201,
			  200,  199,  198,  194,  184,  183,  182,  181,  180,  179,
			  178,  177,  176,  175,  174,  173,  172,  171,  170,  169,
			  168,  163,  162,  161,  160,  159,  158,  157,  155,  150,
			  138,  132,  131,  121,  120,  118,  117,  115,  114,  113,
			  112,  111,  110,  109,  108,  107,  106,  105,   99,   96,

			   95,   94,   93,   92,   89,   88,   86,   81,   71,   67,
			   61,   60,   59,   47,   46,   45,   44,   43,   42,   41,
			   39,   36,   31,   29,   27,   25,   23,   22,   21, yy_Dummy>>,
			1, 129, 1176)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 430)
			yy_base_template_1 (an_array)
			yy_base_template_2 (an_array)
			yy_base_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_base_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			    0,    0,    0,   50,   98,    0,    0,   55,   74,   82,
			   90,  151,  203,  122,  136,   62,  104,   68,  110,  176,
			  181, 1302, 1301, 1302, 1305, 1300, 1305, 1296,  157, 1250,
			 1305, 1287,    0, 1305, 1305,   39, 1258,   34,   60, 1250,
			    0, 1257, 1260, 1267, 1253, 1261, 1260, 1244, 1305, 1305,
			   85, 1305, 1305,  115, 1305,    0,    0, 1305,  150, 1234,
			 1281, 1275,    0, 1305,  126, 1305, 1305, 1284, 1305, 1305,
			 1305, 1273,    0,  117, 1305,  190, 1305,  124, 1305,  205,
			 1305, 1281,  226, 1305, 1305,  153, 1280, 1305, 1280, 1276,
			 1305, 1305, 1233, 1248, 1238, 1242, 1231,   49,  231, 1267,

			  274,    0,    0,    0,    0, 1229, 1233, 1245, 1228, 1225,
			 1223, 1227, 1222, 1229, 1220, 1229,   83, 1222, 1221, 1305,
			 1218, 1217,  235, 1305,    0,    0,  209, 1305,  320,  246,
			 1305, 1251, 1245,    0,    0, 1305,    0,  134, 1255,    0,
			    0,  237, 1305,  239, 1305,  169, 1305,  257,  261, 1305,
			 1253, 1305,  264,  242, 1305, 1252, 1305, 1213, 1221, 1213,
			 1218, 1223, 1212, 1207, 1305, 1305,  288,  182, 1220, 1208,
			 1202, 1201, 1216, 1214, 1214, 1209, 1208, 1192, 1198, 1198,
			 1204, 1207, 1195, 1189, 1200,  375,  269, 1305,  247,  408,
			  272,  387, 1305, 1305, 1216,    0,  276, 1305, 1215, 1197, yy_Dummy>>,
			1, 200, 0)
		end

	yy_base_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			 1182, 1199, 1191, 1181, 1192, 1190,  427, 1212,    0, 1190,
			 1187, 1185, 1180, 1180, 1170, 1158, 1163,    0, 1152, 1134,
			 1126, 1133, 1124, 1135, 1125, 1117,  393,  435,  269,  281,
			  445,  146,  447,  174, 1115, 1305, 1097, 1095, 1093, 1095,
			 1305, 1101, 1051, 1071, 1077, 1070, 1058, 1060, 1062, 1061,
			 1056, 1039, 1013,  116, 1012, 1011,    0,  991, 1305,  307,
			 1001,  272,  451,  486,  449,  286,  505,    0,  907,  298,
			  512,    0,  887,  891,  891, 1305, 1305, 1305,  918,  869,
			  891,  882,  875,  856,  855,    0,  838,  824,  828,  821,
			  847,  811,  786,  761, 1305,  520,  380,  521,  561,  385,

			  530,  386,  420,  537,  446,  533, 1305,  606,  633,  572,
			  596,    0,  593,    0,  593,  582,  559,  555,    0,    0,
			    0,  568,  464,  303,  539,    0,  441,  495,  546,  439,
			  554,  576,  431,  556,  585,  428,  432,  431,  379,    0,
			  388,  373,    0,  395,  464,  377,    0,  573,  570,  571,
			 1305,  326,  262,  238,  237,  239,  226,    0,  191,  166,
			  144,    0,    0,  595,  600,   98,   23,  469,    0,    0,
			    0,    0,    0,    0,    0,   43,    0,    0, 1305,  651,
			  670,  689,  708,  727,  746,  765,  784,  803,  822,  375,
			  618,  841,  860,  879,  898,  917,  631,  477,  936,  955, yy_Dummy>>,
			1, 200, 200)
		end

	yy_base_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_base'.
		do
			yy_array_subcopy (an_array, <<
			  974,  993, 1012, 1029, 1044,  500, 1063, 1082, 1089, 1106,
			  526,  528,  637, 1116, 1129, 1136, 1140,  530, 1144, 1149,
			 1157, 1161,  628, 1030, 1170, 1174, 1178, 1187, 1191, 1196,
			 1203, yy_Dummy>>,
			1, 31, 400)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 430)
			yy_def_template_1 (an_array)
			yy_def_template_2 (an_array)
			an_array.area.fill_with (378, 379, 430)
			Result := yy_fixed_array (an_array)
		end

	yy_def_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			    0,  378,    1,    1,    1,  379,  379,  380,  380,  381,
			  381,  382,  382,  381,  381,  383,  383,  384,  384,  385,
			  385,  386,  386,  378,  378,  378,  378,  387,  378,  388,
			  378,  378,  389,  378,  378,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  378,  378,
			  378,  378,  378,  378,  378,  391,  392,  378,  393,  378,
			  394,  378,  395,  378,  396,  378,  378,  378,  378,  378,
			  378,  378,  397,  378,  378,  378,  378,  398,  378,  378,
			  378,  399,  399,  378,  378,  400,  401,  378,  378,  387,
			  378,  378,  378,  378,  378,  378,  378,  378,  378,  378,

			  388,  402,  389,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  378,
			  378,  378,  378,  378,  391,  392,  393,  378,  378,  393,
			  378,  378,  403,  404,  395,  378,  405,  396,  378,  406,
			  397,  378,  378,  378,  378,  398,  378,  407,  378,  378,
			  399,  378,  399,  400,  378,  401,  378,  378,  378,  378,
			  378,  378,  378,  378,  378,  378,  378,  408,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  378,  378,  128,  185,  378,  409,  185,
			  185,  393,  378,  378,  410,  405,  378,  378,  411,  378, yy_Dummy>>,
			1, 200, 0)
		end

	yy_def_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_def'.
		do
			yy_array_subcopy (an_array, <<
			  378,  378,  378,  378,  378,  378,  378,  412,  413,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  378,  378,  414,  185,  227,  185,
			  410,  410,  411,  411,  378,  378,  378,  378,  378,  378,
			  378,  415,  416,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  378,  378,  378,
			  417,  185,  185,  185,  227,  378,  378,  418,  410,  378,
			  378,  419,  411,  378,  378,  378,  378,  378,  420,  421,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  390,  378,  417,  417,  185,  185,  263,

			  378,  422,  418,  378,  423,  419,  378,  378,  424,  425,
			  390,  390,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  378,  378,  426,  417,  185,  185,  263,
			  378,  378,  418,  378,  378,  419,  378,  427,  428,  390,
			  390,  390,  390,  390,  390,  390,  390,  378,  429,  426,
			  378,  430,  390,  390,  390,  390,  390,  390,  390,  390,
			  390,  390,  390,  378,  378,  426,  378,  390,  390,  390,
			  390,  390,  390,  390,  390,  390,  390,  390,    0, yy_Dummy>>,
			1, 179, 200)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (55, 126, 159)
			an_array.put (3, 160)
			an_array.area.fill_with (55, 161, 5759)
			an_array.put (3, 5760)
			an_array.area.fill_with (55, 5761, 8191)
			an_array.area.fill_with (3, 8192, 8202)
			an_array.area.fill_with (55, 8203, 8238)
			an_array.put (3, 8239)
			an_array.area.fill_with (55, 8240, 8286)
			an_array.put (3, 8287)
			an_array.area.fill_with (55, 8288, 12287)
			yy_ec_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   55,   55,   55,   55,   55,   55,   55,   55,    1,
			    2,    3,    3,    1,   55,   55,   55,   55,   55,   55,
			   55,   55,   55,   55,   55,   55,   55,   55,   55,   55,
			   55,   55,    1,   55,    4,   55,    5,    6,   55,    7,
			    8,    9,   55,   55,   10,   11,   55,   12,   13,   14,
			   15,   16,   17,   18,   19,   18,   20,   21,   22,   23,
			   24,   55,   25,   55,   55,   26,   27,   28,   29,   30,
			   31,   32,   33,   34,   35,   36,   37,   35,   38,   39,
			   40,   41,   42,   43,   44,   45,   41,   35,   46,   47,
			   35,   48,   49,   50,   55,   51,   55,   26,   27,   28,

			   29,   30,   31,   32,   33,   34,   35,   36,   37,   35,
			   38,   39,   40,   41,   42,   43,   44,   45,   41,   35,
			   46,   47,   35,   52,   53,   54, yy_Dummy>>,
			1, 126, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    3,   55,   55, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    1,    3,    4,    5,    6,    7,    7,
			   19,    8,    9,   10,   10,   10,   10,   10,   10,   10,
			   11,   11,   19,   19,    7,    7,   12,   12,   12,   12,
			   13,   12,   14,   15,   14,   14,   14,   15,   15,   14,
			   14,   15,   15,   15,   15,   15,   14,   14,   19,   19,
			   19,   16,   17,   19,   18,   19, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 379)
			yy_accept_template_1 (an_array)
			yy_accept_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_accept_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			    0,    1,    1,    1,    1,    1,    1,    1,    2,    3,
			    4,    5,    5,    5,    6,    7,    7,    7,    7,    7,
			    7,    7,    7,    7,    8,   10,   13,   16,   18,   21,
			   23,   26,   28,   31,   34,   37,   40,   43,   46,   49,
			   52,   55,   58,   61,   64,   67,   70,   73,   76,   79,
			   82,   84,   87,   90,   93,   96,   99,  102,  105,  108,
			  111,  114,  117,  120,  123,  126,  129,  132,  135,  138,
			  141,  144,  146,  149,  152,  155,  158,  161,  164,  167,
			  170,  173,  176,  179,  182,  185,  188,  191,  194,  195,
			  195,  196,  197,  197,  197,  197,  197,  197,  197,  198,

			  198,  198,  199,  200,  201,  203,  204,  205,  206,  207,
			  208,  209,  210,  211,  212,  213,  214,  215,  216,  217,
			  218,  218,  218,  219,  220,  221,  222,  222,  223,  223,
			  224,  225,  225,  225,  226,  227,  228,  228,  229,  230,
			  231,  232,  233,  234,  234,  235,  235,  236,  236,  236,
			  237,  237,  238,  238,  238,  239,  239,  240,  240,  240,
			  240,  240,  240,  240,  240,  241,  242,  242,  242,  243,
			  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,
			  254,  255,  256,  257,  257,  257,  257,  257,  258,  258,
			  258,  259,  259,  260,  261,  261,  262,  262,  263,  263, yy_Dummy>>,
			1, 200, 0)
		end

	yy_accept_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_accept'.
		do
			yy_array_subcopy (an_array, <<
			  263,  263,  263,  263,  263,  263,  263,  263,  263,  263,
			  264,  265,  266,  267,  268,  269,  270,  271,  273,  274,
			  275,  277,  278,  279,  280,  280,  280,  280,  280,  280,
			  280,  280,  280,  280,  280,  280,  281,  281,  281,  281,
			  281,  282,  282,  282,  283,  284,  285,  286,  287,  288,
			  289,  290,  291,  292,  293,  294,  295,  297,  297,  298,
			  298,  298,  298,  298,  298,  298,  298,  298,  298,  298,
			  298,  298,  298,  298,  298,  298,  299,  300,  301,  301,
			  301,  302,  303,  304,  305,  306,  308,  309,  310,  311,
			  312,  313,  314,  315,  316,  317,  317,  317,  317,  317,

			  317,  317,  317,  317,  317,  317,  317,  318,  318,  318,
			  318,  319,  321,  322,  324,  325,  326,  328,  330,  332,
			  334,  336,  337,  338,  338,  338,  338,  338,  338,  338,
			  338,  338,  338,  338,  338,  338,  338,  338,  338,  338,
			  340,  341,  342,  344,  345,  346,  347,  349,  349,  349,
			  349,  350,  350,  352,  353,  354,  355,  356,  358,  359,
			  360,  361,  363,  365,  365,  365,  365,  365,  366,  368,
			  370,  372,  374,  376,  378,  380,  381,  383,  385,  385, yy_Dummy>>,
			1, 180, 200)
		end

	yy_acclist_template: SPECIAL [INTEGER]
			-- Template for `yy_acclist'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 384)
			yy_acclist_template_1 (an_array)
			yy_acclist_template_2 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_acclist_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			    0,   67,   67,   71,   71,   71,   71,   98,   96,   97,
			   17,   96,   97,   18,   96,   97,   96,   97,   16,   96,
			   97,   96,   97,    8,   96,   97,   96,   97,   48,   96,
			   97,    9,   96,   97,   10,   96,   97,   47,   96,   97,
			   47,   96,   97,   47,   96,   97,   47,   96,   97,   47,
			   96,   97,   47,   96,   97,   47,   96,   97,   47,   96,
			   97,   47,   96,   97,   47,   96,   97,   47,   96,   97,
			   47,   96,   97,   47,   96,   97,   11,   96,   97,   12,
			   96,   97,   96,   97,   53,   96,   97,   55,   96,   97,
			   57,   96,   97,   54,   96,   97,   59,   96,   97,   67,

			   96,   97,   68,   96,   97,   79,   96,   97,   69,   96,
			   97,   79,   96,   97,   79,   96,   97,   71,   96,   97,
			   72,   96,   97,   73,   96,   97,   77,   96,   97,   78,
			   96,   97,   60,   96,   97,   61,   96,   97,   62,   96,
			   97,   63,   96,   97,   96,   97,   64,   96,   97,   66,
			   96,   97,   88,   96,   97,   88,   96,   97,   87,   96,
			   97,   88,   96,   97,   90,   96,   97,   90,   96,   97,
			   89,   96,   97,   93,   96,   97,   93,   96,   97,   92,
			   96,   97,   93,   96,   97,   93,   96,   97,   95,   96,
			   97,   94,   96,   97,   17,   50,   15,   14,   17,   48, yy_Dummy>>,
			1, 200, 0)
		end

	yy_acclist_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_acclist'.
		do
			yy_array_subcopy (an_array, <<
			   47,   46,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   58,   57,   56,
			   59,   67,   82, -181,   70,   80,   71,   74,   75,   60,
			   60,   64,   66,   65,   87,   85,   89,   92,   91,   94,
			   13,   49,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   47,   83, -181,  -84,
			   81,   76,   86,   47,   47,   47,   47,   47,   47,   47,
			   47,   39,   47,   47,   47,   30,   47,   47,   47,   47,
			    2,    5,   47,   47,   47,   47,   47,   47,   47,   47,
			   47,   47,   47,   47,   47,   38,   47,   51,    3,    6,

			    1,   47,   47,   47,   47,   47,   33,   47,   47,   47,
			   47,   47,   47,   47,   47,   47,   52,    7,   47,   29,
			   47,   47,   40,   47,   47,   47,   19,   47,   24,   47,
			   37,   47,   31,   47,   32,   47,   47,   47,   44,   47,
			   47,   47,   41,   47,   47,   47,   47,   43,   47,    4,
			   34,   47,   47,   47,   47,   47,   20,   47,   47,   47,
			   47,   25,   47,   42,   47,   47,   45,   47,   21,   47,
			   22,   47,   23,   47,   26,   47,   27,   47,   28,   47,
			   47,   35,   47,   36,   47, yy_Dummy>>,
			1, 185, 200)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 1305
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 378
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 379
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 55
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

	yyNb_rules: INTEGER = 97
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 98
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
	EIFFEL_MSN: INTEGER = 7
	EIFFEL_VS1: INTEGER = 8
	EIFFEL_VS2: INTEGER = 9
	EIFFEL_VS3: INTEGER = 10
			-- Start condition codes

feature -- User-defined features



end
