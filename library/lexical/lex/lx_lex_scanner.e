indexing

	description:

		"Scanners for lexical analyzer generators such as 'gelex'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_LEX_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	LX_DESCRIPTION
		rename
			make as make_description,
			make_from_description as make_descrition_from_description,
			reset as reset_description
		end
		
	LX_LEX_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_SHARED_STRING_ROUTINES
		export
			{NONE} all
		end

creation

	make, make_from_description

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt := yy_nxt_
			yy_chk := yy_chk_
			yy_base := yy_base_
			yy_def := yy_def_
			yy_ec := yy_ec_
			yy_meta := yy_meta_
			yy_accept := yy_accept_
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 53 then
if yy_act <= 27 then
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 73
-- Separator or comment.
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 74
line_nb := line_nb + 1
end
else
if yy_act = 3 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 75

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 79
set_start_condition (SCNAME)
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 80
set_start_condition (XSCNAME)
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 81
set_start_condition (OPTION)
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 82

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 87

					last_token := ENDSECT
					set_start_condition (SECT2)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 91

					error_handler.unrecognized_directive (filename, line_nb)
					set_start_condition (RECOVER)
				
end
else
if yy_act = 10 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 95

					error_handler.directive_expected (filename, line_nb)
					set_start_condition (RECOVER)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 102
more
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 103
more
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 104
more
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 105
more
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 106
more
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 107

					last_string := text_substring (1, text_count - 2)
					line_nb := line_nb + last_string.occurrences ('%N')
					eiffel_header.force_last (last_string)
					set_start_condition (INITIAL)
				
end
else
if yy_act = 17 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 116
-- Separator or comment.
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 117
add_new_start_condition (text, start_condition = XSCNAME)
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 118

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 122

					error_handler.start_condition_expected (filename, line_nb)
					set_start_condition (RECOVER)
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 129
-- Separator or comment.
end
end
else
if yy_act <= 24 then
if yy_act <= 23 then
if yy_act = 22 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 130
backing_up_report := True
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 131
backing_up_report := False
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 132

					case_insensitive := False
				
end
else
if yy_act <= 26 then
if yy_act = 25 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 135

					case_insensitive := True
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 138
debug_mode := True
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 139
debug_mode := False
end
end
end
end
else
if yy_act <= 40 then
if yy_act <= 34 then
if yy_act <= 31 then
if yy_act <= 29 then
if yy_act = 28 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 140
no_default_rule := False
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 141
no_default_rule := True
end
else
if yy_act = 30 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 142
equiv_classes_used := True
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 143
equiv_classes_used := False
end
end
else
if yy_act <= 33 then
if yy_act = 32 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 144
full_table := True
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 145
full_table := False
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 146
meta_equiv_classes_used := True
end
end
else
if yy_act <= 37 then
if yy_act <= 36 then
if yy_act = 35 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 147
meta_equiv_classes_used := False
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 148
reject_used := True
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 149
reject_used := False
end
else
if yy_act <= 39 then
if yy_act = 38 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 150
user_action_used := True
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 151
user_action_used := False
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 152

					no_warning := False
					error_handler.set_no_warning (False)
				
end
end
end
else
if yy_act <= 47 then
if yy_act <= 44 then
if yy_act <= 42 then
if yy_act = 41 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 156

					no_warning := True
					error_handler.set_no_warning (True)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 161
set_start_condition (OUTFILE)
end
else
if yy_act = 43 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 171

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 175

					error_handler.unrecognized_option (text, filename, line_nb)
					set_start_condition (RECOVER)
			
end
end
else
if yy_act <= 46 then
if yy_act = 45 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 182

					output_filename := text_substring (2, text_count - 1)
					set_start_condition (OPTION)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 186

					output_filename := Void
					error_handler.missing_quote (filename, line_nb)
					set_start_condition (RECOVER)
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 194
-- Separates name and definition.
end
end
else
if yy_act <= 50 then
if yy_act <= 49 then
if yy_act = 48 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 195

					check last_string_not_void: last_string /= Void end
					process_name_definition (last_string, text)
					set_start_condition (INITIAL)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 200

					line_nb := line_nb + 1
					error_handler.incomplete_name_definition (filename, line_nb)
					set_start_condition (INITIAL)
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 208

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
end
else
if yy_act <= 52 then
if yy_act = 51 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 212

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 225
-- Separator or comment.
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 226
line_nb := line_nb + 1
end
end
end
end
end
else
if yy_act <= 80 then
if yy_act <= 67 then
if yy_act <= 60 then
if yy_act <= 57 then
if yy_act <= 55 then
if yy_act = 54 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 227

					last_token := ENDSECT
					set_start_condition (SECT3)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 231

					last_token := Caret_code
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
end
else
if yy_act = 56 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 240
last_token := Left_brace_code
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 241
last_token := Right_brace_code
end
end
else
if yy_act <= 59 then
if yy_act = 58 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 242

					last_token := Less_than_code
					set_start_condition (SCOND)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 246

					less (0)
						-- The line number is set when creating the rule,
						-- but it often gets the wrong number because
						-- it is done after the corresponding action has
						-- be scanned.
					rule_line_nb := line_nb
					set_start_condition (REGEXP)
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 258

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
end
end
else
if yy_act <= 64 then
if yy_act <= 62 then
if yy_act = 61 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 262
last_token := Dollar_code
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 263

					last_string := string_.to_lower (text)
					if name_definitions.has (last_string) then
						put_back_string (name_definitions.item (last_string))
					else
						error_handler.undefined_definition
							(text, filename, line_nb)
					end
				
end
else
if yy_act = 63 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 272

					last_token := Left_brace_code
					set_start_condition (NUM)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 276

					last_string := text
					if character_classes.has (last_string) then
						last_token := CCL_OP
						last_value := character_classes.item (last_string)
					else
						last_token := Left_bracket_code
						last_value := last_string
						less (1)
						set_start_condition (FIRSTCCL)
					end
				
end
end
else
if yy_act <= 66 then
if yy_act = 65 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 288
last_token := EOF_OP
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 289
last_token := text_item (1).code
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 290

					set_start_condition (ACTION_TEXT)
				
end
end
end
else
if yy_act <= 74 then
if yy_act <= 71 then
if yy_act <= 69 then
if yy_act = 68 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 293

					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 298

					last_token := CHAR
					process_character (text_item (1).code)
				
end
else
if yy_act = 70 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 305
-- Separator or comment.
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 306
line_nb := line_nb + 1
end
end
else
if yy_act <= 73 then
if yy_act = 72 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 307
last_token := Comma_code
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 308
last_token := Star_code
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 309

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
end
end
else
if yy_act <= 77 then
if yy_act <= 76 then
if yy_act = 75 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 313

					last_token := NAME
					last_value := text
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 317
error_handler.bad_start_condition (text, filename, line_nb)
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 321
-- Separator.
end
else
if yy_act <= 79 then
if yy_act = 78 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 322

					last_token := NUMBER
					check is_integer: string_.is_integer (text) end
					last_value := text.to_integer
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 327
last_token := Comma_code
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 328

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
end
end
end
end
else
if yy_act <= 93 then
if yy_act <= 87 then
if yy_act <= 84 then
if yy_act <= 82 then
if yy_act = 81 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 332

					error_handler.bad_character_in_brackets (filename, line_nb)
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 337

					error_handler.missing_bracket (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
end
else
if yy_act = 83 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 346

					process_character (text_item (1).code)
					last_token := CHAR
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 350

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
end
end
else
if yy_act <= 86 then
if yy_act = 85 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 354

					error_handler.missing_quote (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 362

					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				
end
else
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 371

					set_start_condition (CCL)
					last_token := Caret_code
				
end
end
else
if yy_act <= 90 then
if yy_act <= 89 then
if yy_act = 88 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 375
last_token := Caret_code
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 376

					last_token := CHAR
					process_character (text_item (1).code)
					set_start_condition (CCL)
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 381

					error_handler.bad_character_class (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
end
else
if yy_act <= 92 then
if yy_act = 91 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 390
last_token := Minus_code
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 391

					last_token := CHAR
					process_character (text_item (1).code)
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 395

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
end
end
end
else
if yy_act <= 100 then
if yy_act <= 97 then
if yy_act <= 95 then
if yy_act = 94 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 399

					error_handler.bad_character_class (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 408

					last_token := PIPED
					set_start_condition (SECT2)
				
end
else
if yy_act = 96 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 412

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 417
set_start_condition (EIFFEL_BLOCK2)
end
end
else
if yy_act <= 99 then
if yy_act = 98 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 418

					last_token := EIF_CODE
					last_value := text
					set_start_condition (SECT2)
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 426
more
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 427
more
end
end
else
if yy_act <= 103 then
if yy_act <= 102 then
if yy_act = 101 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 428
more
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 430
more
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 431

					last_token := EIF_CODE
					last_string := text_substring (1, text_count - 1)
					line_nb := line_nb + last_string.occurrences ('%N')
					last_value := last_string
					set_start_condition (SECT2)
				
end
else
if yy_act <= 105 then
if yy_act = 104 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 444

					last_token := EIF_CODE
					last_value := text
				
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 449

					if text_item (1) = '%N' then
						error_handler.bad_character ("%%N", filename, line_nb)
						line_nb := line_nb + 1
					else
						error_handler.bad_character (text, filename, line_nb)
					end
				
end
else
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 458
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
			else
				terminate
			end
		end

feature {NONE} -- Tables

	yy_nxt_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,  392,   39,   40,   39,  119,  119,  120,  120,  136,
			  392,  136,   41,   38,   39,   40,   39,   38,   38,   42,
			   38,   38,   38,   38,   41,   38,   38,   38,   38,   38,
			   38,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   38,   38,   38,   38,   38,   38,
			   38,   38,   45,   46,   45,  145,   55,  145,   56,   57,
			  179,  179,   47,   58,  102,   55,   48,   59,   57,   84,
			   85,   84,   58,  110,   84,   85,   84,   90,   86,   91,
			  102,   87,   87,   86,  181,  181,   87,   87,   90,  383,

			   91,  132,  181,  212,  133,   49,  110,   50,  134,   51,
			   45,   46,   45,  213,  153,   52,  154,  391,  103,  104,
			   47,  182,  182,  111,   48,  112,   88,   92,  159,  182,
			  159,   88,  155,  389,  103,  104,  390,  215,   92,  106,
			  107,  106,  106,  107,  106,  135,  111,  219,  112,  108,
			  389,  220,  108,   49,  175,   50,  175,   51,   60,   61,
			   62,   61,   60,   60,   60,   60,   60,   60,   60,   63,
			   60,   64,   64,   60,   60,   60,   64,   65,   66,   67,
			   68,   69,   64,   64,   64,   64,   64,   64,   70,   71,
			   72,   64,   73,   64,   64,   74,   64,   75,   64,   60,

			   60,   60,   60,   60,   60,   60,   60,   78,   79,   80,
			   79,   78,   78,   78,   78,   78,   78,   78,   81,   78,
			   78,   78,   78,   78,   78,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   82,   82,
			   82,   82,   82,   82,   82,   82,   82,   82,   78,   78,
			   78,   78,   78,   78,   78,   78,   93,   94,   95,   94,
			   93,   93,   93,   93,   93,   96,   97,   98,   93,   93,
			   93,   93,   93,   99,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,  100,  100,  100,
			  100,  100,  100,  100,  100,  100,  100,   93,   93,   93,

			   93,   93,   93,   93,   93,  114,  178,  114,  178,  183,
			  132,  183,  192,  133,  115,  181,  115,  134,  189,  196,
			  189,  196,  197,  197,  197,  204,  136,  205,  136,  392,
			  392,  392,  138,  388,  145,  392,  145,  153,  159,  154,
			  159,  175,  182,  175,  192,  116,  117,  116,  117,  122,
			  123,  122,  124,  125,  135,  387,  126,  126,  140,  206,
			  126,  141,  208,  127,  249,  178,  142,  178,  386,  392,
			  392,  392,  143,  148,  148,  392,  143,  209,  143,  179,
			  179,  149,  183,  149,  183,  189,  210,  189,  243,  128,
			  129,  211,  241,  242,  130,  126,  122,  123,  122,  124,

			  125,  254,  254,  126,  126,  148,  246,  126,  147,  196,
			  127,  196,  204,  276,  205,  244,  247,  255,  255,  281,
			  281,  282,  282,  152,  254,  254,  155,  255,  255,  291,
			  241,  242,  385,  292,  241,  242,  128,  129,  241,  242,
			  277,  130,  126,  216,  216,  384,  216,  216,  216,  216,
			  216,  216,  216,  216,  160,  216,  160,  160,  216,  216,
			  216,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  216,  216,  216,  216,  216,  216,
			  216,  216,  224,  225,  226,  227,  228,  201,  201,  392,

			  392,  383,  307,  229,  278,  392,  303,  230,  241,  242,
			  231,  308,  232,  203,  281,  281,  206,  282,  282,  283,
			  392,  238,  238,  238,  180,  180,  180,  392,  343,  201,
			  250,  305,  245,  241,  242,  241,  242,  344,  382,  392,
			  392,  279,  279,  381,  380,  392,  279,  279,  279,  279,
			  279,  279,  324,  148,  148,  148,  148,  148,  148,  148,
			  392,  379,  378,  377,  376,  375,  374,  392,  373,  372,
			  241,  242,  304,  304,  371,  370,  369,  304,  304,  304,
			  304,  304,  304,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,

			   38,   38,   38,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,

			   83,   83,   83,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,

			  113,  113,  113,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  118,  118,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  139,  368,  367,  366,  365,  139,  139,
			  139,  139,  139,  139,  139,  364,  363,  139,  144,  144,
			  144,  144,  144,  144,  144,  144,  144,  362,  144,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,

			  150,  150,  150,  150,  150,  150,  150,  150,  150,  151,
			  151,  151,  361,  360,  359,  358,  151,  151,  151,  151,
			  151,  151,  151,  151,  151,  151,  151,  151,  151,  152,
			  357,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  155,
			  356,  155,  155,  155,  355,  155,  155,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  161,
			  161,  161,  161,  161,  161,  161,  161,  161,  161,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  177,

			  177,  177,  177,  177,  177,  177,  177,  177,  354,  177,
			  180,  353,  180,  180,  180,  180,  180,  180,  180,  180,
			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  352,
			  185,  186,  351,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  186,  187,  350,  187,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  187,
			  187,  188,  349,  348,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  188,  188,

			  188,  191,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  193,  193,  193,  193,  193,  347,  193,  193,
			  193,  194,  346,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  199,  345,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  201,  201,  201,  201,  201,  201,  201,  202,  202,
			  202,  342,  202,  341,  340,  202,  202,  202,  202,  202,

			  202,  202,  202,  202,  202,  202,  202,  203,  339,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  206,  338,  206,
			  206,  206,  337,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  137,  336,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  137,  146,  335,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  157,  334,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,

			  157,  157,  157,  157,  157,  157,  157,  176,  333,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  184,  332,  184,
			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  184,  184,  184,  184,  184,  190,  331,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  216,  330,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  239,  329,  239,
			  239,  239,  239,  239,  239,  239,  239,  239,  239,  239,

			  239,  239,  239,  239,  239,  239,  239,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  252,  328,  252,
			  252,  252,  252,  252,  252,  252,  252,  252,  252,  252,
			  252,  252,  252,  252,  252,  252,  252,  327,  326,  325,
			  323,  322,  321,  320,  319,  318,  317,  316,  315,  314,
			  313,  312,  311,  310,  309,  306,  203,  302,  301,  300,
			  299,  298,  297,  296,  295,  294,  293,  290,  289,  288,
			  287,  286,  285,  284,  152,  209,  280,  275,  180,  274,
			  273,  272,  271,  270,  269,  268,  267,  266,  265,  264,

			  263,  262,  261,  260,  259,  258,  257,  256,  253,  252,
			  251,  248,  240,  195,  239,  237,  174,  236,  235,  234,
			  233,  223,  222,  221,  218,  217,  214,  207,  200,  198,
			  195,  190,  184,  176,  174,  172,  171,  170,  169,  168,
			  167,  166,  165,  164,  163,  162,  160,  158,  157,  156,
			  149,  147,  146,  137,  392,   77,   77,   37,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,

			  392,  392,  392,  392,  392,  392,  392>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,    1,    1,    1,   31,   32,   31,   32,   39,
			    0,   39,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    3,    3,    3,   45,    7,   45,    7,    7,
			   87,   87,    3,    7,   23,    8,    3,    8,    8,   17,
			   17,   17,    8,   27,   18,   18,   18,   19,   17,   19,
			   24,   17,   17,   18,   92,  111,   18,   18,   20,  391,

			   20,   35,  116,  154,   35,    3,   28,    3,   35,    3,
			    4,    4,    4,  154,   55,    4,   55,  390,   23,   23,
			    4,   92,  111,   27,    4,   27,   17,   19,   61,  116,
			   61,   18,  156,  388,   24,   24,  387,  156,   20,   25,
			   25,   25,   26,   26,   26,   35,   28,  164,   28,   25,
			  386,  164,   26,    4,   79,    4,   79,    4,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,
			    9,    9,    9,    9,    9,    9,    9,    9,    9,    9,

			    9,    9,    9,    9,    9,    9,    9,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   13,   13,   13,   13,
			   13,   13,   13,   13,   13,   13,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   21,

			   21,   21,   21,   21,   21,   29,   84,   30,   84,   94,
			   36,   94,  112,   36,   29,  129,   30,   36,  106,  122,
			  106,  122,  125,  125,  125,  132,  136,  132,  136,  139,
			  141,  142,   42,  385,  145,  140,  145,  152,  159,  152,
			  159,  175,  129,  175,  112,   29,   29,   30,   30,   33,
			   33,   33,   33,   33,   36,  384,   33,   33,   42,  207,
			   33,   42,  140,   33,  207,  178,   42,  178,  382,  139,
			  141,  142,   42,  148,  148,  140,  143,  143,  143,  179,
			  179,  149,  183,  149,  183,  189,  143,  189,  200,   33,
			   33,  149,  199,  199,   33,   33,   34,   34,   34,   34,

			   34,  213,  213,   34,   34,  148,  205,   34,  148,  196,
			   34,  196,  203,  241,  203,  200,  205,  215,  215,  247,
			  247,  249,  249,  254,  254,  254,  255,  255,  255,  264,
			  278,  278,  380,  264,  279,  279,   34,   34,  303,  303,
			  241,   34,   34,  160,  160,  379,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  168,  168,  168,  168,  168,  201,  201,  250,

			  208,  378,  285,  168,  243,  283,  276,  168,  304,  304,
			  168,  285,  168,  281,  281,  281,  282,  282,  282,  250,
			  324,  434,  434,  434,  438,  438,  438,  305,  330,  201,
			  208,  283,  201,  243,  243,  276,  276,  330,  377,  250,
			  208,  244,  244,  376,  375,  283,  244,  244,  244,  244,
			  244,  244,  305,  409,  409,  409,  409,  409,  409,  409,
			  324,  374,  373,  372,  370,  369,  368,  305,  367,  366,
			  244,  244,  277,  277,  365,  364,  362,  277,  277,  277,
			  277,  277,  277,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,

			  393,  393,  393,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  397,  397,  397,  397,  397,  397,  397,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  397,
			  397,  397,  397,  398,  398,  398,  398,  398,  398,  398,
			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,

			  398,  398,  398,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  403,  403,  403,  403,  403,  403,  403,
			  403,  403,  403,  403,  403,  403,  403,  403,  403,  403,

			  403,  403,  403,  404,  404,  404,  404,  404,  404,  404,
			  404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
			  404,  404,  404,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  406,  406,  406,  406,  406,  406,  406,  406,
			  406,  406,  406,  407,  361,  360,  359,  358,  407,  407,
			  407,  407,  407,  407,  407,  357,  356,  407,  408,  408,
			  408,  408,  408,  408,  408,  408,  408,  354,  408,  410,
			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,

			  410,  410,  410,  410,  410,  410,  410,  410,  410,  411,
			  411,  411,  353,  352,  351,  350,  411,  411,  411,  411,
			  411,  411,  411,  411,  411,  411,  411,  411,  411,  412,
			  348,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  413,
			  346,  413,  413,  413,  345,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  415,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  416,

			  416,  416,  416,  416,  416,  416,  416,  416,  344,  416,
			  417,  343,  417,  417,  417,  417,  417,  417,  417,  417,
			  417,  417,  417,  417,  417,  417,  417,  417,  417,  417,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  340,
			  418,  419,  339,  419,  419,  419,  419,  419,  419,  419,
			  419,  419,  419,  419,  419,  419,  419,  419,  419,  419,
			  419,  420,  337,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  421,  336,  335,  421,  421,  421,  421,  421,  421,
			  421,  421,  421,  421,  421,  421,  421,  421,  421,  421,

			  421,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  334,  423,  423,
			  423,  424,  333,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  425,  332,  425,  425,  425,  425,  425,  425,  425,
			  425,  425,  425,  425,  425,  425,  425,  425,  425,  425,
			  425,  426,  426,  426,  426,  426,  426,  426,  427,  427,
			  427,  329,  427,  328,  326,  427,  427,  427,  427,  427,

			  427,  427,  427,  427,  427,  427,  427,  428,  325,  428,
			  428,  428,  428,  428,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  428,  428,  429,  323,  429,
			  429,  429,  322,  429,  429,  429,  429,  429,  429,  429,
			  429,  429,  429,  429,  429,  429,  429,  430,  320,  430,
			  430,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  430,  430,  430,  430,  430,  431,  318,  431,
			  431,  431,  431,  431,  431,  431,  431,  431,  431,  431,
			  431,  431,  431,  431,  431,  431,  431,  432,  317,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,

			  432,  432,  432,  432,  432,  432,  432,  433,  316,  433,
			  433,  433,  433,  433,  433,  433,  433,  433,  433,  433,
			  433,  433,  433,  433,  433,  433,  433,  435,  314,  435,
			  435,  435,  435,  435,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  435,  435,  436,  313,  436,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  437,  312,  437,
			  437,  437,  437,  437,  437,  437,  437,  437,  437,  437,
			  437,  437,  437,  437,  437,  437,  437,  439,  311,  439,
			  439,  439,  439,  439,  439,  439,  439,  439,  439,  439,

			  439,  439,  439,  439,  439,  439,  439,  440,  440,  440,
			  440,  440,  440,  440,  440,  440,  440,  440,  440,  440,
			  440,  440,  440,  440,  440,  440,  440,  441,  310,  441,
			  441,  441,  441,  441,  441,  441,  441,  441,  441,  441,
			  441,  441,  441,  441,  441,  441,  441,  309,  308,  307,
			  302,  301,  300,  299,  298,  297,  296,  295,  294,  292,
			  291,  290,  289,  288,  287,  284,  280,  275,  273,  272,
			  271,  270,  269,  268,  267,  266,  265,  263,  262,  261,
			  259,  258,  257,  256,  253,  251,  246,  240,  237,  236,
			  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,

			  225,  224,  223,  222,  220,  219,  218,  217,  212,  211,
			  210,  206,  198,  194,  190,  181,  173,  172,  171,  170,
			  169,  167,  166,  165,  163,  162,  155,  133,  128,  127,
			  120,  108,   98,   81,   76,   75,   74,   73,   72,   71,
			   70,   69,   68,   67,   66,   65,   63,   59,   58,   57,
			   52,   48,   47,   41,   37,   12,   11,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,

			  392,  392,  392,  392,  392,  392,  392>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,   12,   60,  108,    0,    0,   61,   70,  157,
			    0, 1553, 1552,  206,    0,    0,    0,   77,   82,   84,
			   95,  255,    0,   71,   87,  137,  140,   80,  103,  302,
			  304,    2,    3,  347,  394,   96,  305, 1554, 1557,    7,
			 1557, 1541,  325,    0, 1557,   63, 1557, 1540, 1535, 1557,
			    0, 1557, 1543,    0,    0,  109, 1557, 1542, 1536, 1498,
			 1557,  126, 1557, 1534,    0, 1526, 1525, 1520, 1521, 1503,
			 1517, 1506, 1500, 1514, 1500, 1516, 1531, 1557, 1557,  152,
			 1557, 1521,    0, 1557,  304, 1557, 1557,   56, 1557, 1557,
			 1557, 1557,   80, 1557,  307, 1557, 1557, 1557, 1520, 1557,

			    0,    0, 1557, 1557,    0,    0,  316, 1557, 1519, 1557,
			 1557,   81,  300, 1557, 1557,    0,   88, 1557, 1557, 1557,
			 1525, 1557,  317, 1557, 1557,  320, 1557, 1513, 1485,  301,
			    0,    0,  320, 1520, 1557, 1557,  324,    0, 1557,  322,
			  328,  323,  324,  374,    0,  332,    0, 1557,  359,  379,
			    0,    0,  332, 1557,  100, 1518,  124,    0, 1557,  336,
			  442,    0, 1504, 1488,  127, 1487, 1492, 1484,  472, 1483,
			 1491, 1495, 1482, 1513, 1557,  339,    0,    0,  363,  365,
			 1557, 1501,    0,  380,    0,    0,    0,    0,    0,  383,
			 1510, 1557, 1557, 1557, 1508, 1557,  407, 1557, 1489,  349,

			  374,  483,    0,  407, 1557,  403, 1503,  351,  493, 1557,
			 1498, 1497, 1506,  387, 1557,  403,    0, 1478, 1483, 1467,
			 1485,    0, 1473, 1483, 1482, 1481, 1476, 1477, 1459, 1473,
			 1472, 1458, 1474, 1468, 1468, 1455, 1457, 1474,    0,    0,
			 1454,  399, 1557,  490,  527, 1557, 1484,  405, 1557,  407,
			  492, 1482,    0, 1477,  410,  413, 1445, 1470, 1456, 1442,
			    0, 1467, 1457, 1441,  409, 1440, 1445, 1437, 1445, 1449,
			 1436, 1443, 1448, 1456,    0, 1443,  492,  558,  387,  391,
			 1459,  500,  503,  498, 1431,  475,    0, 1434, 1440, 1433,
			 1438, 1422, 1440,    0, 1428, 1438, 1433, 1420, 1422, 1423,

			 1415, 1432, 1432,  395,  465,  520,    0, 1417, 1425, 1410,
			 1407, 1350, 1356, 1323, 1290,    0, 1296, 1267, 1256,    0,
			 1225,    0, 1211, 1210,  513, 1172, 1162,    0, 1157, 1157,
			  501,    0, 1132, 1119, 1100, 1064, 1065, 1025, 1557, 1019,
			 1003,    0,    0,  979,  985,  917,  929,    0,  909, 1557,
			  888,  882,  886,  876,  855,    0,  840,  838,  834,  830,
			  828,  841,  540,    0,  548,  542,  542,  541,  534,  538,
			  531,    0,  526,  523,  525,  507,  511,  511,  478,  418,
			  405,    0,  329,    0,  318,  294,  127,  109,  110,    0,
			   78,   76, 1557,  582,  602,  622,  642,  662,  682,  702,

			  722,  742,  762,  782,  802,  822,  842,  858,  870,  543,
			  888,  908,  928,  948,  962,  978,  991, 1009, 1022, 1040,
			 1060, 1080, 1100, 1120, 1140, 1160, 1171, 1187, 1206, 1226,
			 1246, 1266, 1286, 1306,  513, 1326, 1346, 1366,  516, 1386,
			 1406, 1426>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,  393,  392,  394,  394,  395,  395,  396,  396,  392,
			    9,  397,  397,  392,   13,   13,   13,  398,  398,  399,
			  399,  392,   21,  400,  400,  401,  401,  402,  402,  403,
			  403,  404,  404,  405,  405,  406,  406,  392,  392,  392,
			  392,  392,  407,  408,  392,  392,  392,  392,  392,  392,
			  409,  392,  392,  410,  411,  412,  392,  413,  392,  392,
			  392,  392,  392,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  415,  392,  392,  392,
			  392,  392,  416,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  417,  392,  392,  392,  392,  392,  392,  392,

			  418,  419,  392,  392,  420,  421,  392,  392,  421,  392,
			  392,  417,  422,  392,  392,  423,  417,  392,  392,  392,
			  424,  392,  392,  392,  392,  392,  392,  392,  425,  417,
			  426,  427,  428,  429,  392,  392,  392,  430,  392,  407,
			  407,  407,  407,  392,  408,  392,  431,  392,  409,  392,
			  410,  411,  412,  392,  412,  392,  413,  432,  392,  392,
			  392,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  415,  392,  392,  433,  416,  392,  392,
			  392,  392,  434,  392,  435,  418,  419,  420,  421,  392,
			  436,  392,  392,  392,  424,  392,  392,  392,  392,  425,

			  425,  426,  427,  428,  392,  428,  392,  429,  407,  392,
			  392,  392,  392,  392,  392,  392,  437,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  392,  438,  439,
			  392,  425,  392,  425,  425,  392,  392,  392,  392,  392,
			  407,  440,  441,  392,  392,  392,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  392,  425,  244,  425,  425,
			  392,  392,  392,  407,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,

			  414,  414,  392,  425,  425,  407,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  392,  407,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  392,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  392,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,    0,  392,  392,  392,  392,  392,  392,  392,

			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,
			  392,  392>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    4,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    5,    1,    6,    7,    1,    8,
			    9,    9,   10,    9,   11,   12,    9,   13,   14,   14,
			   14,   14,   14,   14,   14,   14,   15,   15,    1,    1,
			   16,   17,   18,    9,    1,   19,   20,   21,   22,   23,
			   24,   25,   26,   27,   28,   29,   30,   31,   32,   33,
			   34,   26,   35,   36,   37,   38,   39,   40,   41,   26,
			   26,   42,   43,   44,   45,   46,    1,   19,   20,   21,

			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   34,   26,   35,   36,   37,   38,   39,   40,
			   41,   26,   26,   47,   48,   49,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>, 0)
		end

	yy_meta_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    1,    1,    2,    3,    4,    1,    5,    6,    1,
			    1,    1,    7,    1,    8,    9,    1,    1,    1,   10,
			   10,   10,   10,   10,   10,   11,   12,   11,   11,   11,
			   11,   11,   11,   11,   11,   11,   11,   11,   13,   14,
			   15,   16,    1,    1,   17,    1,   18,   19,    1,   20>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			Result := integer_array_.make_from_array (<<
			    0,    0,    0,    0,    0,    0,    0,   11,   11,    0,
			    0,   50,   50,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,   99,   99,  107,   10,    1,
			    2,   10,    9,    7,   59,   52,   53,   59,   58,   55,
			   56,   57,   59,  104,   11,   15,   15,   15,   15,   15,
			   44,   21,   43,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   50,   51,   20,   17,
			   19,   20,   18,   81,   77,   82,   79,   78,   80,   83,
			   85,   84,   83,   76,   70,   71,   73,   72,   76,   74,

			   75,   98,   96,   97,   95,   48,   47,   49,   48,   89,
			   90,   89,   89,   92,   94,   92,   92,   93,   46,  105,
			   46,   69,   67,   68,   60,   69,   66,   69,   69,   69,
			   63,   99,  102,  102,  102,  103,    1,    1,    8,    9,
			    9,    4,    5,    0,    7,   52,   52,   59,    0,   54,
			  104,   11,    0,   12,    0,    0,    0,   14,   16,   21,
			   21,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   50,   51,   17,   17,   18,   77,   78,
			   86,   86,   86,   70,   70,   75,   98,   95,   48,   47,
			   47,   87,   88,   91,    0,   45,   67,   61,    0,    0,

			    0,    0,   99,    0,  100,    0,    0,    0,    9,    3,
			    0,    0,    0,    0,   13,    0,   21,   44,   44,   44,
			   44,   30,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   86,   86,   47,
			    0,    0,   64,    0,    0,   62,    0,    0,  101,    0,
			    9,    0,   54,    0,    0,    0,   44,   44,   44,   44,
			   32,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   40,    0,    0,    0,    0,    0,
			    0,    0,    0,    9,   44,   44,   26,   44,   44,   44,
			   44,   44,   44,   31,   44,   44,   44,   44,   44,   44,

			   44,   44,    0,    0,    0,    9,   22,   44,   44,   44,
			   44,   44,   44,   44,   44,   33,   44,   44,   44,   41,
			   44,   36,   44,    0,    6,   44,   44,   28,   44,   44,
			   44,   27,   44,   44,   44,   44,   44,   44,   65,   44,
			   44,   34,   23,   44,   44,   44,   44,   37,   44,   42,
			   44,   44,   44,   44,   44,   29,   44,   44,   44,   44,
			   44,   44,   44,   35,   44,   44,   44,   44,   44,   44,
			   44,   38,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   39,   44,   24,   44,   44,   44,   44,   44,   25,
			   44,   44,    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1557
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 392
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 393
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

	yyEnd_of_buffer: INTEGER is 107
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	SECT2: INTEGER is 1
	SECT3: INTEGER is 2
	EIFFEL_BLOCK: INTEGER is 3
	OPTION: INTEGER is 4
	RECOVER: INTEGER is 5
	SCNAME: INTEGER is 6
	XSCNAME: INTEGER is 7
	NUM: INTEGER is 8
	QUOTE: INTEGER is 9
	SCOND: INTEGER is 10
	ACTION_TEXT: INTEGER is 11
	DEFINITION: INTEGER is 12
	FIRSTCCL: INTEGER is 13
	CCL: INTEGER is 14
	OUTFILE: INTEGER is 15
	REGEXP: INTEGER is 16
	EIFFEL_BLOCK2: INTEGER is 17
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new scanner description scanner.
		require
			handler_not_void: handler /= Void
		do
			make_description
			make_compressed_scanner_skeleton
			error_handler := handler
			!! name_definitions.make (Initial_max_nb_names)
			!! character_classes.make (Initial_max_character_classes)
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

	make_from_description
		(a_description: LX_DESCRIPTION; handler: like error_handler) is
			-- Create a new scanner description scanner and
			-- initialize it with `a_description'.
		require
			a_description_not_void: a_description /= Void
			handler_not_void: handler /= Void
		do
			from_description (a_description)
			make_compressed_scanner_skeleton
			error_handler := handler
			!! name_definitions.make (Initial_max_nb_names)
			!! character_classes.make (Initial_max_character_classes)
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			reset_description
			name_definitions.wipe_out
			character_classes.wipe_out
			line_nb := 1
			last_string := Void
		end

feature -- Access

	error_handler: LX_LEX_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

	rule_line_nb: INTEGER
			-- Line number of rule being parsed

	filename: STRING is
			-- Name of file being parsed
		local
			file_buffer: YY_FILE_BUFFER
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				Result := input_stream_.name (file_buffer.file)
			else
				Result := "string"
			end
		ensure
			filename_not_void: Result /= Void
		end

	last_value: ANY
			-- Semantic value to be passed to the parser

	character_classes: DS_HASH_TABLE [LX_SYMBOL_CLASS, STRING]
			-- Character classes declared so far

	name_definitions: DS_HASH_TABLE [STRING, STRING]
			-- Name definition table

	last_string: STRING
			-- Last string which has been read

feature -- Setting

	set_error_handler (handler: like error_handler) is
			-- Set `error_handler' to `handler'.
		require
			handler_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature {NONE} -- Implementation

	put_back_string (str: STRING) is
			-- Put `str' back to buffer for the scanner
			-- to analyze it again.
		require
			str_not_void: str /= Void
		local
			i: INTEGER
		do
			from i := str.count until i < 1 loop
				unread_character (str.item (i))
				i := i - 1
			end
		end

	add_new_start_condition (a_name: STRING; exclusive: BOOLEAN) is
			-- Create a new start condition named `a_name' and
			-- insert it at the end of `start_conditions'.
		require
			a_name_not_void: a_name /= Void
		do
			if start_conditions.has_start_condition (a_name) then
				error_handler.start_condition_declared_twice
					(a_name, filename, line_nb)
			else
				start_conditions.force_new_start_condition (a_name, exclusive)
			end
		end

	process_character (a_code: INTEGER) is
			-- Check whether `a_code' is a valid code for character
			-- whose printable representation is held in `text'.
			-- Set `last_value' accordingly.
		do
			if a_code < characters_count then
				last_value := a_code
			else
				error_handler.character_out_of_range (text, filename, line_nb)
				last_value := 0
			end
		end

	process_escaped_character is
			-- Process escaped character whose printable representation
			-- is held in `text'. Check whether the corresponding 
			-- character is not out of range. Set `last_value' accordingly.
		require
			-- valid_text: `text' recognized by \\(.|[0-7]{1,3}|x[0-9a-f]{1,2})
		local
			c: CHARACTER
			a_code: INTEGER
			i, nb: INTEGER
		do
			c := text_item (2)
			inspect c
			when 'b' then
				a_code := Back_space_code
			when 'f' then
				a_code := Form_feed_code
			when 'n' then
				a_code := New_line_code
			when 'r' then
				a_code := Carriage_return_code
			when 't' then
				a_code := Tabulation_code
			when 'a' then
				a_code := 7
			when 'v' then
				a_code := 13
			when '0'..'7' then
					-- Octal.
				nb := text_count
				a_code := 0
				from i := 2 until i > nb loop
					a_code := a_code * 8 + text_item (i).code - Zero_code
					i := i + 1
				end
			when 'x', 'X' then
				nb := text_count
				if nb = 2 then
					a_code := c.code
				else
						-- Hexadecimal.
					a_code := 0
					from i := 3 until i > nb loop
					a_code := a_code * 16
						c := text_item (i)
						inspect c
						when '0'..'9' then
							a_code := a_code + c.code - Zero_code
						when 'a'..'z' then
							a_code := a_code + c.code - Lower_a_code + 10
						when 'A'..'Z' then
							a_code := a_code + c.code - Upper_a_code + 10
						end
						i := i + 1
					end
				end
			else
				a_code := c.code
			end
			process_character (a_code)
		end

	process_name_definition (a_name, a_definition: STRING) is
			-- Keep track of name definition.
			-- Trailing spaces are removed from `a_definition'
			-- and parentheses are added around it.
		require
			a_name_not_void: a_name /= Void
			a_definition_not_void: a_definition /= Void
		local
			bracketed_name: STRING
			parenthesised_definition: STRING
		do
			bracketed_name := string_.make (a_name.count + 2)
			bracketed_name.append_character ('{')
			bracketed_name.append_string (string_.to_lower (a_name))
			bracketed_name.append_character ('}')
			if name_definitions.has (bracketed_name) then
				error_handler.name_defined_twice (a_name, filename, line_nb)
			end
			parenthesised_definition := string_.make (a_definition.count + 2)
			parenthesised_definition.append_character ('(')
			parenthesised_definition.append_string (a_definition)
				-- Skip trailing white spaces.
			parenthesised_definition.right_adjust
			parenthesised_definition.append_character (')')
			name_definitions.force (parenthesised_definition, bracketed_name)
		end

feature {NONE} -- Constants

	Initial_max_nb_names: INTEGER is 101
			-- Maximum number of name definitions

	Initial_max_character_classes: INTEGER is 101
			-- Maximum number of character classes

invariant

	error_handler_not_void: error_handler /= Void
	name_definitions_not_void: name_definitions /= Void
	no_void_name_definition: not name_definitions.has_item (Void)
	character_classes_not_void: character_classes /= Void
	no_void_character_class: not character_classes.has_item (Void)

end -- class LX_LEX_SCANNER
