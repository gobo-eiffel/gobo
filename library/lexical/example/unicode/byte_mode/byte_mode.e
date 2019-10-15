class BYTE_MODE

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton
		end

	KL_SHARED_ARGUMENTS
		export {NONE} all end

create

	make
	

feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (sc = INITIAL)
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
--|#line 27 "byte_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'byte_mode.l' at line 27")
end

			last_token := T_break
			last_utf8_value := text
			last_unicode_value := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (last_utf8_value)
		
when 2 then
--|#line 32 "byte_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'byte_mode.l' at line 32")
end

			last_token := T_symbol
			last_utf8_value := text
			last_unicode_value := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (last_utf8_value)
		
when 3 then
--|#line 37 "byte_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'byte_mode.l' at line 37")
end

			last_token := T_word
			last_utf8_value := text
			last_unicode_value := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (last_utf8_value)
		
when 4 then
--|#line 42 "byte_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'byte_mode.l' at line 42")
end

			last_token := T_invalid_byte
			last_invalid_byte := text_item (1)
		
when 5 then
--|#line 0 "byte_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'byte_mode.l' at line 0")
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
			terminate
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,    5,    6,    7,    8,    8,    8,    8,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    9,   10,   11,
			   12,   13,   14,   15,   16,   17,   18,   19,   20,    4,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   32,   33,   21,   34,   34,   62,   63,   39,   41,   41,
			   41,   44,   45,   39,   34,   47,   41,   41,   41,   35,
			   55,   55,   36,   37,   38,   40,   57,   58,   34,   34,
			   59,   40,   34,   34,   34,   34,   34,   39,   69,   39,
			   39,   69,   39,   34,   21,   21,   21,   21,   21,   42,
			   42,   42,   42,   42,   46,   46,   46,   46,   46,   49,

			   49,   49,   49,   49,   50,   50,   50,   50,   50,   51,
			   51,   51,   52,   52,   52,   52,   52,   53,   53,   53,
			   54,   54,   54,   54,   54,   66,   66,   66,   66,   66,
			   67,   67,   67,   67,   67,   68,   68,   68,   68,   68,
			   21,   21,   21,   34,   21,   69,   69,   34,   34,   34,
			   34,   65,   64,   61,   34,   60,   56,   69,   48,   43,
			   34,   69,    3,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    4,    4,    5,    5,   37,   37,    7,   11,   11,
			   11,   13,   13,   39,   64,   13,   24,   24,   24,    5,
			   79,   79,    5,    5,    5,    7,   26,   26,   63,   61,
			   26,   39,   44,   44,   44,   44,   44,   47,   59,   65,
			   47,   59,   65,   44,   70,   70,   70,   70,   70,   71,
			   71,   71,   71,   71,   72,   72,   72,   72,   72,   73,

			   73,   73,   73,   73,   74,   74,   74,   74,   74,   75,
			   75,   75,   76,   76,   76,   76,   76,   77,   77,   77,
			   78,   78,   78,   78,   78,   80,   80,   80,   80,   80,
			   81,   81,   81,   81,   81,   82,   82,   82,   82,   82,
			   83,   83,   83,   84,   60,   58,   56,   84,   48,   45,
			   43,   40,   38,   36,   35,   27,   25,   22,   14,   12,
			    9,    3,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,  161,   13,   42,    0,   44,  162,  147,
			    0,   35,  148,   47,  154,    0,    0,    0,    0,    0,
			    0,    0,  144,    0,   43,  145,   62,  151,    0,    0,
			    0,    0,    0,    0,    0,  141,  142,   41,  148,   50,
			  143,    0,    0,  146,   68,  137,    0,   73,  144,    0,
			    0,    0,    0,    0,    0,    0,  142,    0,  133,   74,
			  137,   65,    0,   56,   50,   75,    0,    0,    0,  162,
			   83,   88,   93,   98,  103,  108,  111,  114,  119,   59,
			  124,  129,  134,  138,  142, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   69,    1,   69,   69,   69,    5,   69,   69,   70,
			   70,   69,   71,   72,   73,   74,   75,   76,   77,   78,
			   79,    4,   70,   70,   69,   71,   72,   73,   74,   75,
			   76,   77,   78,   79,    5,   69,   69,   69,   69,   69,
			   69,   70,   70,   70,   70,   70,   70,   70,   70,   70,
			   70,   70,   70,   80,   81,   82,   70,   83,   70,   70,
			   59,   69,   84,   69,   69,   69,   70,   70,   70,    0,
			   69,   69,   69,   69,   69,   69,   69,   69,   69,   69,
			   69,   69,   69,   69,   69, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (29, 46, 127)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (18, 195, 223)
			yy_ec_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   29,   29,   29,   29,   29,   29,   29,   29,    1,
			    2,    1,    1,    1,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,    1,   29,   29,   29,   29,   29,   29,   29,
			   29,   29,   29,    3,   29,    3, yy_Dummy>>,
			1, 46, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    4,    5,    6,    7,    6,    6,    6,    6,    8,    6,
			    6,    9,    9,    9,    9,    9,   10,   10,   10,   10,
			   10,   10,   10,   10,   10,   10,   11,   10,   10,   10,
			   10,   12,   13,   14,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   15,   14,   14,
			   14,   14,   14,   14,   14,   14,   14,   14,   14,   14,
			   14,   14,   14,   14,   16,   16,   17, yy_Dummy>>,
			1, 67, 128)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			   19,   20,   21,   22,   23,   23,   23,   23,   23,   23,
			   23,   23,   23,   24,   25,   25,   26,   27,   27,   27,
			   28,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   29, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    6,    6,    6,    1,    1,    1,    1,    1,    2,
			    3,    3,    3,    4,    4,    5,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    6,    3,    1,    1,    2,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    3,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    1,    0,    0,    0,    0,    2,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 162
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 69
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 70
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 29
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

	yyNb_rules: INTEGER = 5
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 6
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Read file specified as first command-line argument and 
			-- print result to file specified as second command-line argument.
		local
			l_input_file: KL_TEXT_INPUT_FILE
			l_output_file: KL_TEXT_OUTPUT_FILE
		do
			make_scanner_skeleton
			last_utf8_value := ""
			last_unicode_value := ""
			create l_input_file.make (Arguments.argument (1))
			l_input_file.open_read
			set_input_buffer (new_utf8_file_buffer (l_input_file))
			create l_output_file.make (Arguments.argument (2))
			l_output_file.recursive_open_write
			l_output_file.put_string ({UC_UTF8_ROUTINES}.utf8_bom)
			from
				read_token
			until
				last_token <= 0
			loop
				l_output_file.put_line ("Token code: " + last_token.out)
				if last_token = T_invalid_byte then
					l_output_file.put_line ("Invalid byte: " + last_invalid_byte.out)
				else
					l_output_file.put_line ("Token value: " + last_utf8_value)
				end
				read_token
			end
			l_output_file.close
			l_input_file.close
		end

feature -- Access

	last_utf8_value: STRING_8
		-- Value of last token, using UTF-8 encoding

	last_unicode_value: STRING_32
		-- Value of last token

	last_invalid_byte: CHARACTER_8
		-- Value of last invalid byte

feature -- Token codes

	T_break: INTEGER = 260
	T_symbol: INTEGER = 261
	T_word: INTEGER = 262
	T_invalid_byte: INTEGER = 263
			-- Token codes
			
end
