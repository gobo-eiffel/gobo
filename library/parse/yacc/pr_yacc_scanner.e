indexing

	description:

		"Scanners for parser generators such as 'geyacc'"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class PR_YACC_SCANNER

inherit

	PR_YACC_SCANNER_SKELETON

create

	make

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= ERROR_ACTION)
		end

feature {NONE} -- Implementation

	yy_build_tables is
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

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 33 then
if yy_act <= 17 then
if yy_act <= 9 then
if yy_act <= 5 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 39 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 39")
end
last_token := T_TOKEN
else
--|#line 40 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 40")
end
last_token := T_LEFT
end
else
--|#line 41 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 41")
end
last_token := T_RIGHT
end
else
if yy_act = 4 then
--|#line 42 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 42")
end
last_token := T_NONASSOC
else
--|#line 43 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 43")
end
last_token := T_TYPE
end
end
else
if yy_act <= 7 then
if yy_act = 6 then
--|#line 44 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 44")
end
last_token := T_START
else
--|#line 45 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 45")
end
last_token := T_EXPECT
end
else
if yy_act = 8 then
--|#line 46 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 46")
end
last_token := Comma_code
else
--|#line 47 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 47")
end
last_token := Less_than_code
end
end
end
else
if yy_act <= 13 then
if yy_act <= 11 then
if yy_act = 10 then
--|#line 48 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 48")
end
last_token := Greater_than_code
else
--|#line 49 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 49")
end
last_token := Left_bracket_code
end
else
if yy_act = 12 then
--|#line 50 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 50")
end
last_token := Right_bracket_code
else
--|#line 51 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 51")
end

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_CODE)
					
end
end
else
if yy_act <= 15 then
if yy_act = 14 then
--|#line 55 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 55")
end

						set_start_condition (EIFFEL_CODE)
					
else
--|#line 58 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 58")
end

						last_token := T_2PERCENTS
						set_start_condition (SECTION2)
					
end
else
if yy_act = 16 then
--|#line 62 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 62")
end
last_token := T_UNKNOWN
else
--|#line 66 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 66")
end
-- Separator or comment.
end
end
end
end
else
if yy_act <= 25 then
if yy_act <= 21 then
if yy_act <= 19 then
if yy_act = 18 then
--|#line 67 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 67")
end
line_nb := line_nb + 1
else
--|#line 69 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 69")
end

						last_token := T_INTEGER
						last_string_value := text
					
end
else
if yy_act = 20 then
--|#line 73 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 73")
end

						last_token := T_BOOLEAN
						last_string_value := text
					
else
--|#line 77 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 77")
end

						last_token := T_REAL
						last_string_value := text
					
end
end
else
if yy_act <= 23 then
if yy_act = 22 then
--|#line 81 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 81")
end

						last_token := T_DOUBLE
						last_string_value := text
					
else
--|#line 85 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 85")
end

						last_token := T_CHARACTER
						last_string_value := text
					
end
else
if yy_act = 24 then
--|#line 89 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 89")
end

						last_token := T_POINTER
						last_string_value := text
					
else
--|#line 93 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 93")
end

						last_token := T_LIKE
						last_string_value := text
					
end
end
end
else
if yy_act <= 29 then
if yy_act <= 27 then
if yy_act = 26 then
--|#line 97 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 97")
end

						last_token := T_IDENTIFIER
						last_string_value := text
					
else
--|#line 101 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 101")
end

						last_token := T_NUMBER
						last_integer_value := text.to_integer
						if last_integer_value = 0 then
							report_null_integer_error
						end
					
end
else
if yy_act = 28 then
--|#line 108 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 108")
end

						last_token := T_CHAR
						last_string_value := text
					
else
--|#line 112 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 112")
end

						last_token := T_STR
						last_string_value := text
						if text_count < 4 then
							report_invalid_string_token_error (text)
						end
					
end
end
else
if yy_act <= 31 then
if yy_act = 30 then
--|#line 122 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 122")
end
last_token := T_PREC
else
--|#line 123 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 123")
end

						last_token := T_ERROR
						last_integer_value := line_nb
						set_start_condition (ERROR_SECTION)
					
end
else
if yy_act = 32 then
--|#line 128 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 128")
end

						last_token := Colon_code
						last_integer_value := line_nb
					
else
--|#line 132 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 132")
end

						last_token := Bar_code
						last_integer_value := line_nb
					
end
end
end
end
end
else
if yy_act <= 49 then
if yy_act <= 41 then
if yy_act <= 37 then
if yy_act <= 35 then
if yy_act = 34 then
--|#line 136 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 136")
end
last_token := Semicolon_code
else
--|#line 137 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 137")
end

						line_nb := line_nb + 1
						set_start_condition (EIFFEL_ACTION)
					
end
else
if yy_act = 36 then
--|#line 141 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 141")
end

						set_start_condition (EIFFEL_ACTION)
					
else
--|#line 144 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 144")
end

						last_token := T_2PERCENTS
						set_start_condition (SECTION3)
					
end
end
else
if yy_act <= 39 then
if yy_act = 38 then
--|#line 151 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 151")
end

						last_token := T_USER_CODE
						last_string_value := text
					
else
--|#line 158 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 158")
end
-- Separator or comment.
end
else
if yy_act = 40 then
--|#line 159 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 159")
end
line_nb := line_nb + 1
else
--|#line 161 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 161")
end
last_token := Left_parenthesis_code
end
end
end
else
if yy_act <= 45 then
if yy_act <= 43 then
if yy_act = 42 then
--|#line 162 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 162")
end
last_token := Right_parenthesis_code
else
--|#line 163 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 163")
end

						last_token := T_NUMBER
						last_error := text.to_integer
						last_integer_value := last_error
					
end
else
if yy_act = 44 then
--|#line 168 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 168")
end

						line_nb := line_nb + 1
						set_start_condition (ERROR_ACTION)
					
else
--|#line 172 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 172")
end

						set_start_condition (ERROR_ACTION)
					
end
end
else
if yy_act <= 47 then
if yy_act = 46 then
--|#line 178 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 178")
end
more
else
--|#line 179 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 179")
end
more
end
else
if yy_act = 48 then
--|#line 180 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 180")
end
more
else
--|#line 181 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 181")
end
more
end
end
end
end
else
if yy_act <= 57 then
if yy_act <= 53 then
if yy_act <= 51 then
if yy_act = 50 then
--|#line 182 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 182")
end
more
else
--|#line 183 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 183")
end

					line_nb := line_nb + 1
					more
				
end
else
if yy_act = 52 then
--|#line 187 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 187")
end

					last_token := T_EIFFEL
					last_string_value := text_substring (1, text_count - 2)
					set_start_condition (INITIAL)
				
else
--|#line 201 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 201")
end

					action_buffer.append_string (text)
				
end
end
else
if yy_act <= 55 then
if yy_act = 54 then
--|#line 202 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 202")
end

					action_buffer.append_string (text)
				
else
--|#line 203 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 203")
end

					action_buffer.append_string (text)
				
end
else
if yy_act = 56 then
--|#line 204 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 204")
end

					action_buffer.append_string (text)
				
else
--|#line 205 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 205")
end

					action_buffer.append_string (text)
				
end
end
end
else
if yy_act <= 61 then
if yy_act <= 59 then
if yy_act = 58 then
--|#line 208 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 208")
end

					line_nb := line_nb + text_count
					action_buffer.append_string (text)
				
else
--|#line 212 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 212")
end

					if start_condition = ERROR_ACTION then
						report_invalid_dollar_dollar_error
						action_buffer.append_string ("$$")
					elseif rule /= Void then
						process_dollar_dollar (rule)
					else
						action_buffer.append_string ("$$")
					end
				
end
else
if yy_act = 60 then
--|#line 222 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 222")
end

					if text_substring (2, text_count).is_integer then
						if rule /= Void then
							if start_condition = ERROR_ACTION then
								process_dollar_n (text_substring (2, text_count).to_integer, last_error - 1, rule)
							else
								process_dollar_n (text_substring (2, text_count).to_integer, rule.rhs.count, rule)
							end
						else
							action_buffer.append_string (text)
						end
					else
						report_integer_too_large_error (text_substring (2, text_count))
						action_buffer.append_string (text)
					end
				
else
--|#line 238 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 238")
end

					if text_substring (3, text_count).is_integer then
						if rule /= Void then
							if start_condition = ERROR_ACTION then
								process_dollar_n (- text_substring (3, text_count).to_integer, last_error - 1, rule)
							else
								process_dollar_n (- text_substring (3, text_count).to_integer, rule.rhs.count, rule)
							end
						else
							action_buffer.append_string (text)
						end
					else
						report_integer_too_large_error (text_substring (3, text_count))
						action_buffer.append_string (text)
					end
				
end
end
else
if yy_act <= 63 then
if yy_act = 62 then
--|#line 254 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 254")
end

					action_buffer.append_character ('{')
					nb_open_brackets := nb_open_brackets + 1
				
else
--|#line 258 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 258")
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
				
end
else
if yy_act = 64 then
--|#line 278 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 278")
end

					last_token := text_item (1).code
				
else
--|#line 0 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
end
end
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 3 then
--|#line 0 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 0")
end

					report_missing_characters_error ("%%}")
					last_token := T_EIFFEL
					last_string_value := text_substring (1, text_count)
					set_start_condition (INITIAL)
				
when 4, 6 then
--|#line 0 "pr_yacc_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'pr_yacc_scanner.l' at line 0")
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

	yy_nxt_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   16,   17,   18,   17,   19,   16,   20,   21,   16,
			   16,   22,   23,   16,   24,   24,   16,   16,   25,   26,
			   27,   28,   29,   30,   27,   27,   27,   27,   31,   27,
			   27,   32,   27,   27,   33,   34,   27,   27,   27,   27,
			   27,   35,   16,   36,   16,   16,   16,   16,   37,   64,
			   98,   64,   16,   78,   78,  139,   87,   38,   39,   16,
			   16,   44,   95,   45,   96,   46,   47,   44,  200,   45,
			   48,   46,   47,   88,  114,  114,   48,   90,   91,   90,
			   78,   78,   16,   89,   16,  199,   40,   41,   50,  198,
			   51,   52,   51,   53,  104,  106,  105,   54,   95,  122,

			   96,  107,  197,  108,  108,  112,  123,  112,  115,  116,
			  115,   64,   75,   64,   74,  124,   74,  201,  126,   90,
			   91,   90,   95,   95,   96,   96,  137,  104,  125,  105,
			   55,  196,   56,   50,  151,   51,   52,   51,   53,  201,
			   97,  195,   54,  127,  141,  141,  108,  108,  140,  109,
			  112,  194,  112,  193,  143,  114,  114,  115,  116,  115,
			  162,  162,  163,  163,  164,  164,  141,  141,  165,  165,
			  125,   94,  162,  162,  192,   55,   75,   56,   57,   58,
			   57,   98,  163,  163,  191,   59,   60,  190,   61,  189,
			   62,   62,  103,  164,  164,  109,  165,  165,  152,  188,

			  152,  152,   75,  187,   75,   75,  186,  185,  184,  183,
			  182,  181,  180,  179,  178,  177,  176,  175,  174,  173,
			  125,   63,   57,   58,   57,  172,  171,  170,  169,   59,
			   60,  168,   61,  167,   62,   62,  166,  161,  160,  159,
			  158,  157,  156,  155,  154,  153,  125,  150,  149,  148,
			  147,  146,  145,  144,  142,  102,  138,  136,  135,  134,
			  133,  132,  131,  130,  129,   63,   50,  128,   51,   52,
			   51,   53,  125,  121,  120,   54,  119,  118,  117,   66,
			  113,  111,  110,  102,  100,   99,   86,   85,   84,   83,
			   82,   81,   80,   77,   76,   66,  201,  201,  201,  201,

			  201,  201,  201,  201,  201,  201,  201,  201,   55,  201,
			   56,   50,  201,   51,   52,   51,   53,  201,  201,  201,
			   54,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,   55,  201,   56,   67,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,   68,  201,  201,  201,  201,  201,  201,
			   69,   70,  201,  201,   71,   72,   73,  201,  201,  201,
			  201,  201,  201,  201,   74,   42,   42,   42,   42,   42,

			   42,   42,   42,   42,   42,   42,   42,   42,   42,   42,
			   42,   42,   42,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   49,   49,   49,   49,   49,   49,   49,   49,   49,
			   49,   49,   49,   49,   49,   49,   49,   49,   49,   16,
			   16,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   16,   16,   16,   16,   65,  201,   65,
			   65,   65,   65,   65,   65,   65,   65,   65,   65,   65,
			   65,   65,   65,   65,   65,   75,  201,   75,   75,   75,
			  201,   75,   75,   75,   75,   75,   75,   75,   75,   75,

			   75,   75,   75,   79,   79,   79,   79,   79,   79,   79,
			   79,   79,   79,   92,   92,   92,   92,   92,   92,   92,
			   92,   92,   92,   92,   92,   92,   92,   92,   92,   92,
			   92,   93,  201,  201,   93,  201,  201,  201,   93,   93,
			   93,   93,   93,   93,   93,   93,   93,   93,   93,   94,
			  201,   94,   94,   94,   94,   94,   94,   94,   94,   94,
			   94,   94,   94,   94,   94,   94,   94,   98,  201,   98,
			   98,   98,  201,   98,   98,   98,   98,   98,   98,   98,
			   98,   98,   98,   98,   98,  101,  201,  201,  201,  201,
			  201,  201,  101,  101,  101,  101,  101,  101,  101,  101,

			  101,  101,  103,  201,  103,  103,  103,  103,  103,  103,
			  103,  103,  103,  103,  103,  103,  103,  103,  103,  103,
			  109,  201,  109,  109,  109,  201,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,   77,  201,
			   77,   77,   77,   77,   77,   77,   77,   77,   77,   77,
			   77,   77,   77,   77,   77,   77,  100,  201,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  111,  201,  111,  111,  111,  111,
			  111,  111,  111,  111,  111,  111,  111,  111,  111,  111,
			  111,  111,  113,  201,  113,  113,  113,  113,  113,  113,

			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			   15,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    3,   17,
			   99,   17,    3,   24,   24,   99,   37,    3,    3,    3,
			    3,    7,   45,    7,   45,    7,    7,    8,  198,    8,
			    7,    8,    8,   37,   62,   62,    8,   40,   40,   40,
			   78,   78,    3,   37,    3,  197,    3,    3,    9,  194,
			    9,    9,    9,    9,   51,   52,   51,    9,   46,   73,

			   46,   52,  192,   52,   52,   57,   73,   57,   63,   63,
			   63,   64,   76,   64,   74,   74,   74,   96,   76,   90,
			   90,   90,   94,   97,   94,   97,   96,  103,  126,  103,
			    9,  189,    9,   10,  126,   10,   10,   10,   10,  105,
			   46,  188,   10,   76,  107,  107,  108,  108,  105,  110,
			  112,  186,  112,  185,  110,  114,  114,  115,  115,  115,
			  137,  137,  139,  139,  140,  140,  141,  141,  143,  143,
			  151,  162,  162,  162,  181,   10,  151,   10,   11,   11,
			   11,  163,  163,  163,  180,   11,   11,  178,   11,  177,
			   11,   11,  164,  164,  164,  165,  165,  165,  220,  176,

			  220,  220,  221,  175,  221,  221,  174,  173,  171,  170,
			  169,  168,  166,  161,  160,  158,  156,  155,  154,  153,
			  152,   11,   12,   12,   12,  150,  149,  148,  147,   12,
			   12,  146,   12,  145,   12,   12,  144,  136,  135,  134,
			  133,  132,  131,  130,  129,  128,  127,  123,  122,  121,
			  120,  119,  118,  117,  109,  102,   98,   89,   88,   86,
			   85,   84,   83,   82,   81,   12,   13,   80,   13,   13,
			   13,   13,   75,   72,   71,   13,   70,   69,   68,   65,
			   61,   54,   53,   50,   48,   47,   34,   33,   32,   31,
			   30,   29,   28,   23,   21,   19,   15,    0,    0,    0,

			    0,    0,    0,    0,    0,    0,    0,    0,   13,    0,
			   13,   14,    0,   14,   14,   14,   14,    0,    0,    0,
			   14,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   14,    0,   14,   20,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   20,    0,    0,    0,    0,    0,    0,
			   20,   20,    0,    0,   20,   20,   20,    0,    0,    0,
			    0,    0,    0,    0,   20,  202,  202,  202,  202,  202,

			  202,  202,  202,  202,  202,  202,  202,  202,  202,  202,
			  202,  202,  202,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  204,  204,  204,  204,  204,  204,  204,  204,  204,
			  204,  204,  204,  204,  204,  204,  204,  204,  204,  205,
			  205,  205,  205,  205,  205,  205,  205,  205,  205,  205,
			  205,  205,  205,  205,  205,  205,  205,  206,    0,  206,
			  206,  206,  206,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  207,    0,  207,  207,  207,
			    0,  207,  207,  207,  207,  207,  207,  207,  207,  207,

			  207,  207,  207,  208,  208,  208,  208,  208,  208,  208,
			  208,  208,  208,  209,  209,  209,  209,  209,  209,  209,
			  209,  209,  209,  209,  209,  209,  209,  209,  209,  209,
			  209,  210,    0,    0,  210,    0,    0,    0,  210,  210,
			  210,  210,  210,  210,  210,  210,  210,  210,  210,  211,
			    0,  211,  211,  211,  211,  211,  211,  211,  211,  211,
			  211,  211,  211,  211,  211,  211,  211,  212,    0,  212,
			  212,  212,    0,  212,  212,  212,  212,  212,  212,  212,
			  212,  212,  212,  212,  212,  213,    0,    0,    0,    0,
			    0,    0,  213,  213,  213,  213,  213,  213,  213,  213,

			  213,  213,  214,    0,  214,  214,  214,  214,  214,  214,
			  214,  214,  214,  214,  214,  214,  214,  214,  214,  214,
			  215,    0,  215,  215,  215,    0,  215,  215,  215,  215,
			  215,  215,  215,  215,  215,  215,  215,  215,  216,    0,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  217,    0,  217,  217,
			  217,  217,  217,  217,  217,  217,  217,  217,  217,  217,
			  217,  217,  217,  217,  218,    0,  218,  218,  218,  218,
			  218,  218,  218,  218,  218,  218,  218,  218,  218,  218,
			  218,  218,  219,    0,  219,  219,  219,  219,  219,  219,

			  219,  219,  219,  219,  219,  219,  219,  219,  219,  219,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   41,    0,    0,    0,   58,   64,   85,
			  130,  176,  220,  263,  308,  296,  710,   47,  710,  290,
			  349,  252,  710,  281,   39,  710,  710,    0,  259,  264,
			  257,  257,  260,  254,  262,  710,  710,   49,  710,  710,
			   75,  710,    0,    0,  710,   57,   93,  278,  272,    0,
			  280,   89,   89,  275,  269,  710,  710,  103,  710,  710,
			  710,  268,   60,  106,  109,  274,  710,  710,  239,  253,
			  243,  246,  236,   66,  112,  264,  104,    0,   66,    0,
			  234,  244,  225,  225,  231,  232,  239,  710,  223,  222,
			  117,  710,    0,    0,  117,  710,  113,  118,  248,   42,

			    0,    0,  252,  122,  710,  135,  710,  130,  132,  246,
			  141,    0,  148,    0,  141,  155,  710,  219,  227,  219,
			  224,  229,  218,  213,  710,  710,  120,  238,  214,  209,
			  222,  218,  217,  208,  208,  203,  213,  146,  710,  148,
			  150,  152,  710,  154,  212,  196,  211,  201,  192,  202,
			  201,  162,  212,  195,  198,  186,  190,    0,  178,    0,
			  181,  191,  158,  168,  179,  182,  190,  710,  175,  173,
			  172,  176,  710,  187,  184,  179,  175,  165,  152,  710,
			  147,  138,  710,  710,  710,  121,  114,    0,  106,   96,
			  710,  710,   69,    0,   65,    0,    0,   63,   33,  710,

			    0,  710,  394,  412,  430,  448,  466,  484,  495,  512,
			  530,  548,  566,  584,  601,  619,  637,  655,  673,  691,
			  192,  196, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,  201,    1,    1,    3,  202,  202,  203,  203,  204,
			  204,  205,  205,  204,  204,  201,  201,  201,  201,  206,
			  201,  207,  201,  201,  201,  201,  201,  208,  208,  208,
			  208,  208,  208,  208,  208,  201,  201,  201,  201,  201,
			  201,  201,  209,  210,  201,  211,  211,  212,  201,  213,
			  201,  214,  201,  215,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  206,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  207,  216,  201,  208,
			  208,  208,  208,  208,  208,  208,  208,  201,  201,  201,
			  201,  201,  209,  210,  211,  201,  211,  211,  201,  212,

			  217,  213,  201,  214,  201,  214,  201,  201,  201,  201,
			  215,  218,  201,  219,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  220,  208,  208,
			  208,  208,  208,  208,  208,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  221,  208,  208,  208,  208,  208,  208,  208,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  208,  208,  208,  208,  208,  201,  201,
			  201,  201,  201,  201,  201,  208,  208,  208,  208,  208,
			  201,  201,  201,  208,  208,  208,  208,  201,  208,  201,

			  208,    0,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201,  201,  201,  201,  201,  201,  201,  201,  201,
			  201,  201, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    6,    7,    1,    8,
			    9,   10,    1,    1,   11,   12,    1,   13,   14,   14,
			   14,   14,   14,   14,   14,   14,   15,   15,   16,   17,
			   18,    1,   19,    1,    1,   20,   21,   22,   23,   24,
			   25,   26,   27,   28,   29,   30,   31,   29,   32,   33,
			   34,   29,   35,   36,   37,   38,   29,   29,   39,   40,
			   29,   41,   42,   43,    1,   44,    1,   20,   21,   22,

			   23,   24,   25,   26,   27,   28,   29,   30,   31,   29,
			   32,   33,   34,   29,   35,   36,   37,   38,   29,   29,
			   39,   40,   29,   45,   46,   47,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,

			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    1,    3,    4,    5,    6,    1,
			    1,    1,    7,    1,    8,    9,    1,    1,    1,    1,
			    8,    8,    8,    8,    8,    8,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   11,   12,   13,   14,   15,
			   16,    1,    1,    1,   17,   18,    1,    4, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   46,   46,   53,
			   53,    0,    0,   53,   53,   66,   64,   17,   18,   64,
			   16,   64,    8,   64,   27,    9,   10,   26,   26,   26,
			   26,   26,   26,   26,   26,   11,   12,   64,   32,   34,
			   36,   33,   38,   46,   51,   50,   50,   50,   50,   53,
			   58,   57,   57,   57,   57,   62,   63,   39,   40,   41,
			   42,   64,   43,   45,   17,    0,   29,   15,    0,    0,
			    0,    0,    0,    0,   14,    0,    0,   17,   27,   26,
			   26,   26,   26,   26,   26,   26,   26,   37,    0,    0,
			   36,   35,   38,   46,    0,   47,   47,   52,    0,    0,

			   49,   53,   58,    0,   54,   54,   59,    0,   60,    0,
			    0,   56,   39,   39,   43,   45,   44,    0,    0,    0,
			    0,    0,    0,    0,   13,   28,    0,    0,   26,   26,
			   26,   26,   26,   26,   26,    0,    0,    0,   48,    0,
			    0,   61,   55,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,   26,   26,   26,   26,   25,   26,   21,
			    0,    0,    0,    0,    0,    0,    0,    2,    0,    0,
			    0,    0,    5,   26,   26,   26,   26,   26,    0,   30,
			    0,    0,    3,    6,    1,   26,   26,   22,   26,   26,
			   31,    7,    0,   20,   26,   19,   24,    0,   26,    4,

			   23,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 710
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 201
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 202
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER is 1
			-- Equivalence code for NULL character

	yyReject_used: BOOLEAN is false
			-- Is `reject' called?

	yyVariable_trail_context: BOOLEAN is false
			-- Is there a regular expression with
			-- both leading and trailing parts having
			-- variable length?

	yyReject_or_variable_trail_context: BOOLEAN is false
			-- Is `reject' called or is there a
			-- regular expression with both leading
			-- and trailing parts having variable length?

	yyNb_rules: INTEGER is 65
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 66
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	SECTION2: INTEGER is 1
	SECTION3: INTEGER is 2
	EIFFEL_CODE: INTEGER is 3
	EIFFEL_ACTION: INTEGER is 4
	ERROR_SECTION: INTEGER is 5
	ERROR_ACTION: INTEGER is 6
			-- Start condition codes

feature -- User-defined features



end
