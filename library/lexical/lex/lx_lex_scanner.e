indexing

	description:

		"Scanners for lexical analyzer generators such as 'gelex'";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
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

	KL_STRING_ROUTINES
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
			inspect yy_act
when 1 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 73
-- Separator or comment.
when 2 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 74
line_nb := line_nb + 1
when 3 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 75

					line_nb := line_nb + 1
					set_start_condition (EIFFEL_BLOCK)
				
when 4 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 79
set_start_condition (SCNAME)
when 5 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 80
set_start_condition (XSCNAME)
when 6 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 81
set_start_condition (OPTION);
when 7 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 82

						-- Keep track of the definition name.
					last_string := text
					set_start_condition (DEFINITION)
				
when 8 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 87

					last_token := ENDSECT
					set_start_condition (SECT2)
				
when 9 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 91

					error_handler.unrecognized_directive (filename, line_nb)
					set_start_condition (RECOVER)
				
when 10 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 95

					error_handler.directive_expected (filename, line_nb)
					set_start_condition (RECOVER)
				
when 11 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 102
more
when 12 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 103
more
when 13 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 104
more
when 14 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 105
more
when 15 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 106
more
when 16 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 107

					last_string := text_substring (1, text_count - 2)
					line_nb := line_nb + last_string.occurrences ('%N')
					eiffel_header.force_last (last_string)
					set_start_condition (INITIAL)
				
when 17 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 116
-- Separator or comment.
when 18 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 117
add_new_start_condition (text, start_condition = XSCNAME)
when 19 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 118

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 20 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 122

					error_handler.start_condition_expected (filename, line_nb)
					set_start_condition (RECOVER)
				
when 21 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 129
-- Separator or comment.
when 22 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 130
backing_up_report := True
when 23 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 131
backing_up_report := False
when 24 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 132

					case_insensitive := False
				
when 25 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 135

					case_insensitive := True
				
when 26 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 138
debug_mode := True
when 27 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 139
debug_mode := False
when 28 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 140
no_default_rule := False
when 29 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 141
no_default_rule := True
when 30 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 142
equiv_classes_used := True
when 31 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 143
equiv_classes_used := False
when 32 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 144
full_table := True
when 33 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 145
full_table := False
when 34 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 146
meta_equiv_classes_used := True
when 35 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 147
meta_equiv_classes_used := False
when 36 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 148
reject_used := True
when 37 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 149
reject_used := False
when 38 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 150
user_action_used := True
when 39 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 151
user_action_used := False
when 40 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 152

					no_warning := False
					error_handler.set_no_warning (False)
				
when 41 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 156

					no_warning := True
					error_handler.set_no_warning (True)
				
when 42 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 161
set_start_condition (OUTFILE)
when 43 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 171

					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 44 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 175

					error_handler.unrecognized_option (text, filename, line_nb)
					set_start_condition (RECOVER)
			
when 45 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 182

					output_filename := text_substring (2, text_count - 1)
					set_start_condition (OPTION)
				
when 46 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 186

					output_filename := Void
					error_handler.missing_quote (filename, line_nb)
					set_start_condition (RECOVER)
				
when 47 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 194
-- Separates name and definition.
when 48 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 195

					check last_string_not_void: last_string /= Void end
					process_name_definition (last_string, text)
					set_start_condition (INITIAL)
				
when 49 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 200

					line_nb := line_nb + 1
					error_handler.incomplete_name_definition (filename, line_nb)
					set_start_condition (INITIAL)
				
when 50 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 208

						-- Eat characters to end of line.
					set_start_condition (INITIAL)
				
when 51 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 212

						-- Eat characters to end of line.
					line_nb := line_nb + 1
					set_start_condition (INITIAL)
				
when 52 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 225
-- Separator or comment.
when 53 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 226
line_nb := line_nb + 1
when 54 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 227

					last_token := ENDSECT
					set_start_condition (SECT3)
				
when 55 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 231

					last_token := Caret_code
					set_start_condition (REGEXP)
				
when 56 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 235
last_token := Left_brace_code
when 57 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 236
last_token := Right_brace_code
when 58 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 237

					last_token := Less_than_code
					set_start_condition (SCOND)
				
when 59 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 241

					less (0)
					set_start_condition (REGEXP)
				
when 60 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 248

					last_token := Double_quote_code
					set_start_condition (QUOTE)
				
when 61 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 252
last_token := Dollar_code
when 62 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 253

					last_string := string__to_lower (text)
					if name_definitions.has (last_string) then
						put_back_string (name_definitions.item (last_string))
					else
						error_handler.undefined_definition
							(text, filename, line_nb)
					end
				
when 63 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 262

					last_token := Left_brace_code
					set_start_condition (NUM)
				
when 64 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 266

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
				
when 65 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 278
last_token := EOF_OP
when 66 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 279
last_token := text_item (1).code
when 67 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 280

						-- The line number has already been set when creating
						-- `rule', but it often gets the wrong number because
						-- it is done before parsing the current rule.
					rule.set_line_nb (line_nb)
					set_start_condition (ACTION_TEXT)
				
when 68 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 287

						-- The line number has already been set when creating
						-- `rule', but it often gets the wrong number because
						-- it is done before parsing the current rule.
					rule.set_line_nb (line_nb)
					line_nb := line_nb + 1
					last_token := EMPTY
					set_start_condition (SECT2)
				
when 69 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 296

					last_token := CHAR
					process_character (text_item (1).code)
				
when 70 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 303
-- Separator or comment.
when 71 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 304
line_nb := line_nb + 1
when 72 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 305
last_token := Comma_code
when 73 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 306
last_token := Star_code
when 74 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 307

					last_token := Greater_than_code
					set_start_condition (SECT2)
				
when 75 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 311

					last_token := NAME
					last_value := text
				
when 76 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 315
error_handler.bad_start_condition (text, filename, line_nb)
when 77 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 319
-- Separator.
when 78 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 320

					last_token := NUMBER
					check is_integer: string__is_integer (text) end
					last_value := text.to_integer
				
when 79 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 325
last_token := Comma_code
when 80 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 326

					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 81 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 330

					error_handler.bad_character_in_brackets (filename, line_nb)
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 82 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 335

					error_handler.missing_bracket (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_brace_code
					set_start_condition (REGEXP)
				
when 83 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 344

					process_character (text_item (1).code)
					last_token := CHAR
				
when 84 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 348

					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 85 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 352

					error_handler.missing_quote (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Double_quote_code
					set_start_condition (REGEXP)
				
when 86 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 360

					last_token := CHAR
					process_escaped_character
					if start_condition = FIRSTCCL then
						set_start_condition (CCL)
					end
				
when 87 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 369

					set_start_condition (CCL)
					last_token := Caret_code
				
when 88 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 373
last_token := Caret_code
when 89 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 374

					last_token := CHAR
					process_character (text_item (1).code)
					set_start_condition (CCL)
				
when 90 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 379

					error_handler.bad_character_class (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 91 then
	yy_position := yy_position - 1
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 388
last_token := Minus_code
when 92 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 389

					last_token := CHAR
					process_character (text_item (1).code)
				
when 93 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 393

					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 94 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 397

					error_handler.bad_character_class (filename, line_nb)
					line_nb := line_nb + 1
					last_token := Right_bracket_code
					set_start_condition (REGEXP)
				
when 95 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 406

					last_token := PIPED
					set_start_condition (SECT2)
				
when 96 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 410

					last_token := EMPTY
					line_nb := line_nb + 1
					set_start_condition (SECT2)
				
when 97 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 415
set_start_condition (EIFFEL_BLOCK2)
when 98 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 416

					last_token := EIF_CODE
					last_value := text
					set_start_condition (SECT2)
				
when 99 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 424
more
when 100 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 425
more
when 101 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 426
more
when 102 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 428
more
when 103 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 429

					last_token := EIF_CODE
					last_string := text_substring (1, text_count - 1)
					line_nb := line_nb + last_string.occurrences ('%N')
					last_value := last_string
					set_start_condition (SECT2)
				
when 104 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 442

					last_token := EIF_CODE
					last_value := text
				
when 105 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 447

					if text_item (1) = '%N' then
						error_handler.bad_character ("%%N", filename, line_nb)
						line_nb := line_nb + 1
					else
						error_handler.bad_character (text, filename, line_nb)
					end
				
when 106 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 456
fatal_error ("scanner jammed")
			else
				fatal_error ("fatal scanner internal error: no action found")
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
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,  391,   39,   40,   39,  119,  119,  120,  120,  136,
			  391,  136,   41,   38,   39,   40,   39,   38,   38,   42,
			   38,   38,   38,   38,   41,   38,   38,   38,   38,   38,
			   38,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   43,   43,   43,   43,   43,   43,
			   43,   43,   43,   43,   38,   38,   38,   38,   38,   38,
			   38,   38,   45,   46,   45,  145,   55,  145,   56,   57,
			  179,  179,   47,   58,  102,   55,   48,   59,   57,   84,
			   85,   84,   58,  110,   84,   85,   84,   90,   86,   91,
			  102,   87,   87,   86,  181,  181,   87,   87,   90,  382,

			   91,  132,  181,  212,  133,   49,  110,   50,  134,   51,
			   45,   46,   45,  213,  153,   52,  154,  390,  103,  104,
			   47,  182,  182,  111,   48,  112,   88,   92,  159,  182,
			  159,   88,  155,  388,  103,  104,  389,  215,   92,  106,
			  107,  106,  106,  107,  106,  135,  111,  219,  112,  108,
			  388,  220,  108,   49,  175,   50,  175,   51,   60,   61,
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
			  189,  196,  197,  197,  197,  204,  136,  205,  136,  391,
			  391,  391,  138,  387,  145,  391,  145,  153,  159,  154,
			  159,  175,  182,  175,  192,  116,  117,  116,  117,  122,
			  123,  122,  124,  125,  135,  386,  126,  126,  140,  206,
			  126,  141,  208,  127,  248,  178,  142,  178,  385,  391,
			  391,  391,  143,  148,  148,  391,  143,  209,  143,  179,
			  179,  149,  183,  149,  183,  189,  210,  189,  242,  128,
			  129,  211,  240,  241,  130,  126,  122,  123,  122,  124,

			  125,  253,  253,  126,  126,  148,  245,  126,  147,  196,
			  127,  196,  204,  275,  205,  243,  246,  254,  254,  280,
			  280,  281,  281,  152,  253,  253,  155,  254,  254,  290,
			  240,  241,  384,  291,  240,  241,  128,  129,  240,  241,
			  276,  130,  126,  216,  216,  383,  216,  216,  216,  216,
			  216,  216,  216,  216,  160,  216,  160,  160,  216,  216,
			  216,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  216,  216,  216,  216,  216,  216,
			  216,  216,  224,  225,  226,  227,  228,  201,  201,  391,

			  391,  382,  306,  229,  277,  391,  302,  230,  240,  241,
			  231,  307,  232,  203,  280,  280,  206,  281,  281,  282,
			  391,  238,  238,  238,  180,  180,  180,  391,  342,  201,
			  249,  304,  244,  240,  241,  240,  241,  343,  381,  391,
			  391,  278,  278,  380,  379,  391,  278,  278,  278,  278,
			  278,  278,  323,  148,  148,  148,  148,  148,  148,  148,
			  391,  378,  377,  376,  375,  374,  373,  391,  372,  371,
			  240,  241,  303,  303,  370,  369,  368,  303,  303,  303,
			  303,  303,  303,   38,   38,   38,   38,   38,   38,   38,
			   38,   38,   38,   38,   38,   38,   38,   38,   38,   38,

			   38,   38,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   53,   53,   53,   53,   53,   53,   53,   53,   53,   53,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   54,
			   54,   54,   54,   54,   54,   54,   54,   54,   54,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   76,   76,
			   76,   76,   76,   76,   76,   76,   76,   76,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   83,   83,   83,
			   83,   83,   83,   83,   83,   83,   83,   89,   89,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   89,   89,
			   89,   89,   89,   89,   89,   89,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  101,  101,  101,  101,  101,
			  101,  101,  101,  101,  101,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  105,  105,  105,  105,  105,  105,
			  105,  105,  105,  105,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  109,  109,  109,  109,  109,  109,  109,
			  109,  109,  109,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  113,  113,  113,  113,  113,  113,  113,  113,
			  113,  113,  118,  118,  118,  118,  118,  118,  118,  118,

			  118,  118,  118,  118,  118,  118,  118,  118,  118,  118,
			  118,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  121,  121,  121,  121,  121,  121,  121,  121,  121,  121,
			  131,  131,  131,  131,  131,  131,  131,  131,  131,  131,
			  131,  131,  131,  131,  131,  131,  131,  131,  131,  139,
			  367,  366,  365,  364,  139,  139,  139,  139,  139,  139,
			  139,  363,  362,  139,  144,  144,  144,  144,  144,  144,
			  144,  144,  144,  361,  144,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  150,  150,  150,  150,  150,  150,
			  150,  150,  150,  150,  151,  151,  360,  359,  358,  357,

			  151,  151,  151,  151,  151,  151,  151,  151,  151,  151,
			  151,  151,  151,  152,  356,  152,  152,  152,  152,  152,
			  152,  152,  152,  152,  152,  152,  152,  152,  152,  152,
			  152,  152,  155,  355,  155,  155,  354,  155,  155,  155,
			  155,  155,  155,  155,  155,  155,  155,  155,  155,  155,
			  155,  161,  161,  161,  161,  161,  161,  161,  161,  161,
			  161,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  173,  173,  173,  173,  173,  173,  173,  173,  173,  173,
			  177,  177,  177,  177,  177,  177,  177,  177,  177,  353,
			  177,  180,  352,  180,  180,  180,  180,  180,  180,  180,

			  180,  180,  180,  180,  180,  180,  180,  180,  180,  180,
			  185,  185,  185,  185,  185,  185,  185,  185,  185,  351,
			  185,  186,  350,  186,  186,  186,  186,  186,  186,  186,
			  186,  186,  186,  186,  186,  186,  186,  186,  186,  186,
			  187,  349,  187,  187,  187,  187,  187,  187,  187,  187,
			  187,  187,  187,  187,  187,  187,  187,  187,  187,  188,
			  348,  188,  188,  188,  188,  188,  188,  188,  188,  188,
			  188,  188,  188,  188,  188,  188,  188,  188,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  191,  191,  191,
			  191,  191,  191,  191,  191,  191,  191,  193,  193,  193,

			  193,  193,  193,  193,  193,  193,  193,  193,  193,  193,
			  193,  193,  347,  193,  193,  193,  194,  346,  194,  194,
			  194,  194,  194,  194,  194,  194,  194,  194,  194,  194,
			  194,  194,  194,  194,  194,  199,  345,  199,  199,  199,
			  199,  199,  199,  199,  199,  199,  199,  199,  199,  199,
			  199,  199,  199,  199,  201,  201,  201,  201,  201,  201,
			  201,  202,  202,  344,  202,  341,  340,  202,  202,  202,
			  202,  202,  202,  202,  202,  202,  202,  202,  202,  203,
			  339,  203,  203,  203,  203,  203,  203,  203,  203,  203,
			  203,  203,  203,  203,  203,  203,  203,  203,  206,  338,

			  206,  206,  337,  206,  206,  206,  206,  206,  206,  206,
			  206,  206,  206,  206,  206,  206,  206,  137,  336,  137,
			  137,  137,  137,  137,  137,  137,  137,  137,  137,  137,
			  137,  137,  137,  137,  137,  137,  146,  335,  146,  146,
			  146,  146,  146,  146,  146,  146,  146,  146,  146,  146,
			  146,  146,  146,  146,  146,  157,  334,  157,  157,  157,
			  157,  157,  157,  157,  157,  157,  157,  157,  157,  157,
			  157,  157,  157,  157,  176,  333,  176,  176,  176,  176,
			  176,  176,  176,  176,  176,  176,  176,  176,  176,  176,
			  176,  176,  176,  184,  332,  184,  184,  184,  184,  184,

			  184,  184,  184,  184,  184,  184,  184,  184,  184,  184,
			  184,  184,  190,  331,  190,  190,  190,  190,  190,  190,
			  190,  190,  190,  190,  190,  190,  190,  190,  190,  190,
			  190,  216,  330,  216,  216,  216,  216,  216,  216,  216,
			  216,  216,  216,  216,  216,  216,  216,  216,  216,  216,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  250,
			  250,  250,  250,  250,  250,  250,  250,  250,  250,  251,
			  329,  251,  251,  251,  251,  251,  251,  251,  251,  251,
			  251,  251,  251,  251,  251,  251,  251,  251,  328,  327,
			  326,  325,  324,  322,  321,  320,  319,  318,  317,  316,

			  315,  314,  313,  312,  311,  310,  309,  308,  305,  203,
			  301,  300,  299,  298,  297,  296,  295,  294,  293,  292,
			  289,  288,  287,  286,  285,  284,  283,  152,  209,  279,
			  274,  180,  273,  272,  271,  270,  269,  268,  267,  266,
			  265,  264,  263,  262,  261,  260,  259,  258,  257,  256,
			  255,  252,  251,  250,  247,  239,  195,  237,  174,  236,
			  235,  234,  233,  223,  222,  221,  218,  217,  214,  207,
			  200,  198,  195,  190,  184,  176,  174,  172,  171,  170,
			  169,  168,  167,  166,  165,  164,  163,  162,  160,  158,
			  157,  156,  149,  147,  146,  137,  391,   77,   77,   37,

			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    1,    1,    1,   31,   32,   31,   32,   39,
			    0,   39,    1,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    3,    3,    3,   45,    7,   45,    7,    7,
			   87,   87,    3,    7,   23,    8,    3,    8,    8,   17,
			   17,   17,    8,   27,   18,   18,   18,   19,   17,   19,
			   24,   17,   17,   18,   92,  111,   18,   18,   20,  390,

			   20,   35,  116,  154,   35,    3,   28,    3,   35,    3,
			    4,    4,    4,  154,   55,    4,   55,  389,   23,   23,
			    4,   92,  111,   27,    4,   27,   17,   19,   61,  116,
			   61,   18,  156,  387,   24,   24,  386,  156,   20,   25,
			   25,   25,   26,   26,   26,   35,   28,  164,   28,   25,
			  385,  164,   26,    4,   79,    4,   79,    4,    9,    9,
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
			  141,  142,   42,  384,  145,  140,  145,  152,  159,  152,
			  159,  175,  129,  175,  112,   29,   29,   30,   30,   33,
			   33,   33,   33,   33,   36,  383,   33,   33,   42,  207,
			   33,   42,  140,   33,  207,  178,   42,  178,  381,  139,
			  141,  142,   42,  148,  148,  140,  143,  143,  143,  179,
			  179,  149,  183,  149,  183,  189,  143,  189,  200,   33,
			   33,  149,  199,  199,   33,   33,   34,   34,   34,   34,

			   34,  213,  213,   34,   34,  148,  205,   34,  148,  196,
			   34,  196,  203,  240,  203,  200,  205,  215,  215,  246,
			  246,  248,  248,  253,  253,  253,  254,  254,  254,  263,
			  277,  277,  379,  263,  278,  278,   34,   34,  302,  302,
			  240,   34,   34,  160,  160,  378,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  160,  160,  160,  160,  160,  160,  160,  160,
			  160,  160,  168,  168,  168,  168,  168,  201,  201,  249,

			  208,  377,  284,  168,  242,  282,  275,  168,  303,  303,
			  168,  284,  168,  280,  280,  280,  281,  281,  281,  249,
			  323,  433,  433,  433,  437,  437,  437,  304,  329,  201,
			  208,  282,  201,  242,  242,  275,  275,  329,  376,  249,
			  208,  243,  243,  375,  374,  282,  243,  243,  243,  243,
			  243,  243,  304,  408,  408,  408,  408,  408,  408,  408,
			  323,  373,  372,  371,  369,  368,  367,  304,  366,  365,
			  243,  243,  276,  276,  364,  363,  361,  276,  276,  276,
			  276,  276,  276,  392,  392,  392,  392,  392,  392,  392,
			  392,  392,  392,  392,  392,  392,  392,  392,  392,  392,

			  392,  392,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  393,  393,  393,  393,  393,  393,  393,  393,  393,
			  393,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  394,  394,  394,  394,  394,  394,  394,  394,  394,  394,
			  395,  395,  395,  395,  395,  395,  395,  395,  395,  395,
			  395,  395,  395,  395,  395,  395,  395,  395,  395,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  396,  396,
			  396,  396,  396,  396,  396,  396,  396,  396,  397,  397,
			  397,  397,  397,  397,  397,  397,  397,  397,  397,  397,
			  397,  397,  397,  397,  397,  397,  397,  398,  398,  398,

			  398,  398,  398,  398,  398,  398,  398,  398,  398,  398,
			  398,  398,  398,  398,  398,  398,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  399,  399,  399,  399,  399,
			  399,  399,  399,  399,  399,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  400,  400,  400,  400,  400,  400,
			  400,  400,  400,  400,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  401,  401,  401,  401,  401,  401,  401,
			  401,  401,  401,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  402,  402,  402,  402,  402,  402,  402,  402,
			  402,  402,  403,  403,  403,  403,  403,  403,  403,  403,

			  403,  403,  403,  403,  403,  403,  403,  403,  403,  403,
			  403,  404,  404,  404,  404,  404,  404,  404,  404,  404,
			  404,  404,  404,  404,  404,  404,  404,  404,  404,  404,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  405,
			  405,  405,  405,  405,  405,  405,  405,  405,  405,  406,
			  360,  359,  358,  357,  406,  406,  406,  406,  406,  406,
			  406,  356,  355,  406,  407,  407,  407,  407,  407,  407,
			  407,  407,  407,  353,  407,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  409,  409,  409,  409,  409,  409,
			  409,  409,  409,  409,  410,  410,  352,  351,  350,  349,

			  410,  410,  410,  410,  410,  410,  410,  410,  410,  410,
			  410,  410,  410,  411,  347,  411,  411,  411,  411,  411,
			  411,  411,  411,  411,  411,  411,  411,  411,  411,  411,
			  411,  411,  412,  345,  412,  412,  344,  412,  412,  412,
			  412,  412,  412,  412,  412,  412,  412,  412,  412,  412,
			  412,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  414,  414,  414,  414,  414,  414,  414,  414,  414,  414,
			  415,  415,  415,  415,  415,  415,  415,  415,  415,  343,
			  415,  416,  342,  416,  416,  416,  416,  416,  416,  416,

			  416,  416,  416,  416,  416,  416,  416,  416,  416,  416,
			  417,  417,  417,  417,  417,  417,  417,  417,  417,  339,
			  417,  418,  338,  418,  418,  418,  418,  418,  418,  418,
			  418,  418,  418,  418,  418,  418,  418,  418,  418,  418,
			  419,  336,  419,  419,  419,  419,  419,  419,  419,  419,
			  419,  419,  419,  419,  419,  419,  419,  419,  419,  420,
			  335,  420,  420,  420,  420,  420,  420,  420,  420,  420,
			  420,  420,  420,  420,  420,  420,  420,  420,  421,  421,
			  421,  421,  421,  421,  421,  421,  421,  421,  421,  421,
			  421,  421,  421,  421,  421,  421,  421,  422,  422,  422,

			  422,  422,  422,  422,  422,  422,  422,  422,  422,  422,
			  422,  422,  334,  422,  422,  422,  423,  333,  423,  423,
			  423,  423,  423,  423,  423,  423,  423,  423,  423,  423,
			  423,  423,  423,  423,  423,  424,  332,  424,  424,  424,
			  424,  424,  424,  424,  424,  424,  424,  424,  424,  424,
			  424,  424,  424,  424,  425,  425,  425,  425,  425,  425,
			  425,  426,  426,  331,  426,  328,  327,  426,  426,  426,
			  426,  426,  426,  426,  426,  426,  426,  426,  426,  427,
			  325,  427,  427,  427,  427,  427,  427,  427,  427,  427,
			  427,  427,  427,  427,  427,  427,  427,  427,  428,  324,

			  428,  428,  322,  428,  428,  428,  428,  428,  428,  428,
			  428,  428,  428,  428,  428,  428,  428,  429,  321,  429,
			  429,  429,  429,  429,  429,  429,  429,  429,  429,  429,
			  429,  429,  429,  429,  429,  429,  430,  319,  430,  430,
			  430,  430,  430,  430,  430,  430,  430,  430,  430,  430,
			  430,  430,  430,  430,  430,  431,  317,  431,  431,  431,
			  431,  431,  431,  431,  431,  431,  431,  431,  431,  431,
			  431,  431,  431,  431,  432,  316,  432,  432,  432,  432,
			  432,  432,  432,  432,  432,  432,  432,  432,  432,  432,
			  432,  432,  432,  434,  315,  434,  434,  434,  434,  434,

			  434,  434,  434,  434,  434,  434,  434,  434,  434,  434,
			  434,  434,  435,  313,  435,  435,  435,  435,  435,  435,
			  435,  435,  435,  435,  435,  435,  435,  435,  435,  435,
			  435,  436,  312,  436,  436,  436,  436,  436,  436,  436,
			  436,  436,  436,  436,  436,  436,  436,  436,  436,  436,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  438,
			  438,  438,  438,  438,  438,  438,  438,  438,  438,  439,
			  311,  439,  439,  439,  439,  439,  439,  439,  439,  439,
			  439,  439,  439,  439,  439,  439,  439,  439,  310,  309,
			  308,  307,  306,  301,  300,  299,  298,  297,  296,  295,

			  294,  293,  291,  290,  289,  288,  287,  286,  283,  279,
			  274,  272,  271,  270,  269,  268,  267,  266,  265,  264,
			  262,  261,  260,  258,  257,  256,  255,  252,  250,  245,
			  239,  237,  236,  235,  234,  233,  232,  231,  230,  229,
			  228,  227,  226,  225,  224,  223,  222,  220,  219,  218,
			  217,  212,  211,  210,  206,  198,  194,  181,  173,  172,
			  171,  170,  169,  167,  166,  165,  163,  162,  155,  133,
			  128,  127,  120,  108,   98,   81,   76,   75,   74,   73,
			   72,   71,   70,   69,   68,   67,   66,   65,   63,   59,
			   58,   57,   52,   48,   47,   41,   37,   12,   11,  391,

			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,   12,   60,  108,    0,    0,   61,   70,  157,
			    0, 1495, 1494,  206,    0,    0,    0,   77,   82,   84,
			   95,  255,    0,   71,   87,  137,  140,   80,  103,  302,
			  304,    2,    3,  347,  394,   96,  305, 1496, 1499,    7,
			 1499, 1483,  325,    0, 1499,   63, 1499, 1482, 1477, 1499,
			    0, 1499, 1485,    0,    0,  109, 1499, 1484, 1478, 1440,
			 1499,  126, 1499, 1476,    0, 1468, 1467, 1462, 1463, 1445,
			 1459, 1448, 1442, 1456, 1442, 1458, 1473, 1499, 1499,  152,
			 1499, 1463,    0, 1499,  304, 1499, 1499,   56, 1499, 1499,
			 1499, 1499,   80, 1499,  307, 1499, 1499, 1499, 1462, 1499,

			    0,    0, 1499, 1499,    0,    0,  316, 1499, 1461, 1499,
			 1499,   81,  300, 1499, 1499,    0,   88, 1499, 1499, 1499,
			 1467, 1499,  317, 1499, 1499,  320, 1499, 1455, 1427,  301,
			    0,    0,  320, 1462, 1499, 1499,  324,    0, 1499,  322,
			  328,  323,  324,  374,    0,  332,    0, 1499,  359,  379,
			    0,    0,  332, 1499,  100, 1460,  124,    0, 1499,  336,
			  442,    0, 1446, 1430,  127, 1429, 1434, 1426,  472, 1425,
			 1433, 1437, 1424, 1455, 1499,  339,    0,    0,  363,  365,
			 1499, 1443,    0,  380,    0,    0,    0,    0,    0,  383,
			    0, 1499, 1499, 1499, 1451, 1499,  407, 1499, 1432,  349,

			  374,  483,    0,  407, 1499,  403, 1446,  351,  493, 1499,
			 1441, 1440, 1449,  387, 1499,  403,    0, 1421, 1426, 1410,
			 1428,    0, 1416, 1426, 1425, 1424, 1419, 1420, 1402, 1416,
			 1415, 1401, 1417, 1411, 1411, 1398, 1400, 1417,    0, 1397,
			  399, 1499,  490,  527, 1499, 1427,  405, 1499,  407,  492,
			 1425,    0, 1420,  410,  413, 1388, 1413, 1399, 1385,    0,
			 1410, 1400, 1384,  409, 1383, 1388, 1380, 1388, 1392, 1379,
			 1386, 1391, 1399,    0, 1386,  492,  558,  387,  391, 1402,
			  500,  503,  498, 1374,  475,    0, 1377, 1383, 1376, 1381,
			 1365, 1383,    0, 1371, 1381, 1376, 1363, 1365, 1366, 1358,

			 1375, 1375,  395,  465,  520,    0, 1360, 1368, 1353, 1368,
			 1350, 1358, 1307, 1275,    0, 1282, 1254, 1244,    0, 1214,
			    0, 1197, 1184,  513, 1163, 1148,    0, 1130, 1131,  501,
			    0, 1133, 1113, 1080, 1093, 1043, 1004, 1499,  999,  983,
			    0,    0,  960,  966,  899,  912,    0,  893, 1499,  872,
			  866,  870,  860,  841,    0,  826,  824,  820,  816,  814,
			  827,  540,    0,  548,  542,  542,  541,  534,  538,  531,
			    0,  526,  523,  525,  507,  511,  511,  478,  418,  405,
			    0,  329,    0,  318,  294,  127,  109,  110,    0,   78,
			   76, 1499,  582,  601,  620,  639,  658,  677,  696,  715,

			  734,  753,  772,  791,  810,  829,  845,  857,  544,  874,
			  893,  912,  931,  945,  960,  973,  990, 1003, 1020, 1039,
			 1058, 1077, 1096, 1115, 1134, 1145, 1160, 1178, 1197, 1216,
			 1235, 1254, 1273,  514, 1292, 1311, 1330,  517, 1349, 1368>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,  392,  391,  393,  393,  394,  394,  395,  395,  391,
			    9,  396,  396,  391,   13,   13,   13,  397,  397,  398,
			  398,  391,   21,  399,  399,  400,  400,  401,  401,  402,
			  402,  403,  403,  404,  404,  405,  405,  391,  391,  391,
			  391,  391,  406,  407,  391,  391,  391,  391,  391,  391,
			  408,  391,  391,  409,  410,  411,  391,  412,  391,  391,
			  391,  391,  391,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  414,  391,  391,  391,
			  391,  391,  415,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  416,  391,  391,  391,  391,  391,  391,  391,

			  417,  418,  391,  391,  419,  420,  391,  391,  420,  391,
			  391,  416,  421,  391,  391,  422,  416,  391,  391,  391,
			  423,  391,  391,  391,  391,  391,  391,  391,  424,  416,
			  425,  426,  427,  428,  391,  391,  391,  429,  391,  406,
			  406,  406,  406,  391,  407,  391,  430,  391,  408,  391,
			  409,  410,  411,  391,  411,  391,  412,  431,  391,  391,
			  391,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  414,  391,  391,  432,  415,  391,  391,
			  391,  391,  433,  391,  434,  417,  418,  419,  420,  391,
			  435,  391,  391,  391,  423,  391,  391,  391,  391,  424,

			  424,  425,  426,  427,  391,  427,  391,  428,  406,  391,
			  391,  391,  391,  391,  391,  391,  436,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  391,  437,  391,
			  424,  391,  424,  424,  391,  391,  391,  391,  391,  406,
			  438,  439,  391,  391,  391,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  391,  424,  243,  424,  424,  391,
			  391,  391,  406,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,

			  413,  391,  424,  424,  406,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  391,  406,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  391,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  391,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,  413,  413,  413,  413,  413,  413,  413,  413,  413,
			  413,    0,  391,  391,  391,  391,  391,  391,  391,  391,

			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391,
			  391,  391,  391,  391,  391,  391,  391,  391,  391,  391>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
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
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    1,    1,    2,    1,    3,    1,    4,    5,    1,
			    1,    1,    6,    1,    7,    8,    1,    1,    1,    9,
			    9,    9,    9,    9,    9,   10,   11,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   10,   10,   12,   13,
			   14,   15,    1,    1,   16,    1,   17,   18,    1,   19>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
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
			   44,   44,   44,   44,   44,   44,   44,   86,   86,    0,
			    0,   64,    0,    0,   62,    0,    0,  101,    0,    9,
			    0,   54,    0,    0,    0,   44,   44,   44,   44,   32,
			   44,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   44,   44,   44,   40,    0,    0,    0,    0,    0,    0,
			    0,    0,    9,   44,   44,   26,   44,   44,   44,   44,
			   44,   44,   31,   44,   44,   44,   44,   44,   44,   44,

			   44,    0,    0,    0,    9,   22,   44,   44,   44,   44,
			   44,   44,   44,   44,   33,   44,   44,   44,   41,   44,
			   36,   44,    0,    6,   44,   44,   28,   44,   44,   44,
			   27,   44,   44,   44,   44,   44,   44,   65,   44,   44,
			   34,   23,   44,   44,   44,   44,   37,   44,   42,   44,
			   44,   44,   44,   44,   29,   44,   44,   44,   44,   44,
			   44,   44,   35,   44,   44,   44,   44,   44,   44,   44,
			   38,   44,   44,   44,   44,   44,   44,   44,   44,   44,
			   39,   44,   24,   44,   44,   44,   44,   44,   25,   44,
			   44,    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 1499
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 391
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 392
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

	filename: STRING is
			-- Name of file being parsed
		local
			file_buffer: YY_FILE_BUFFER
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				Result := file_buffer.file.name
			else
				Result := "string"
			end
		ensure
			filename_not_void: Result /= Void
		end

	last_value: ANY
			-- Semantic value to be passed to the parser

	rule: LX_RULE
			-- Rule being analyzed

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
			bracketed_name := string__make (a_name.count + 2)
			bracketed_name.append_character ('{')
			bracketed_name.append_string (string__to_lower (a_name))
			bracketed_name.append_character ('}')
			if name_definitions.has (bracketed_name) then
				error_handler.name_defined_twice (a_name, filename, line_nb)
			end
			parenthesised_definition := string__make (a_definition.count + 2)
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
