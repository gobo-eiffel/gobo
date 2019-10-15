class UTF8_MODE

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
--|#line 27 "utf8_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'utf8_mode.l' at line 27")
end

			last_token := T_break
			last_utf8_value := text
			last_unicode_value := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (last_utf8_value)
		
when 2 then
--|#line 32 "utf8_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'utf8_mode.l' at line 32")
end

			last_token := T_symbol
			last_utf8_value := text
			last_unicode_value := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (last_utf8_value)
		
when 3 then
--|#line 37 "utf8_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'utf8_mode.l' at line 37")
end

			last_token := T_word
			last_utf8_value := text
			last_unicode_value := {UTF_CONVERTER}.utf_8_string_8_to_string_32 (last_utf8_value)
		
when 4 then
--|#line 43 "utf8_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'utf8_mode.l' at line 43")
end

			last_token := T_invalid_byte
			last_invalid_byte := text_item (1)
		
when 5 then
--|#line 0 "utf8_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'utf8_mode.l' at line 0")
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
			   12,   13,   14,   15,   16,   17,   18,   19,    4,   21,
			   22,   23,   24,   25,   26,   27,   28,   29,   30,   31,
			   20,   32,   32,   59,   60,   37,   39,   39,   39,   42,
			   43,   37,   32,   45,   39,   39,   39,   33,   52,   52,
			   34,   35,   36,   38,   54,   55,   32,   32,   56,   38,
			   32,   32,   32,   32,   32,   37,   66,   37,   37,   66,
			   37,   32,   20,   20,   20,   20,   20,   40,   40,   40,
			   40,   40,   44,   44,   44,   44,   44,   47,   47,   47,

			   47,   47,   48,   48,   48,   48,   48,   49,   49,   49,
			   50,   50,   50,   51,   51,   51,   51,   51,   63,   63,
			   63,   63,   63,   64,   64,   64,   64,   64,   65,   65,
			   65,   65,   65,   20,   20,   20,   32,   20,   66,   66,
			   32,   32,   32,   32,   62,   61,   58,   32,   57,   53,
			   66,   46,   41,   32,   66,    3,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    4,    5,    5,   35,   35,    7,   11,   11,   11,   13,
			   13,   37,   61,   13,   23,   23,   23,    5,   75,   75,
			    5,    5,    5,    7,   25,   25,   60,   58,   25,   37,
			   42,   42,   42,   42,   42,   45,   56,   62,   45,   56,
			   62,   42,   67,   67,   67,   67,   67,   68,   68,   68,
			   68,   68,   69,   69,   69,   69,   69,   70,   70,   70,

			   70,   70,   71,   71,   71,   71,   71,   72,   72,   72,
			   73,   73,   73,   74,   74,   74,   74,   74,   76,   76,
			   76,   76,   76,   77,   77,   77,   77,   77,   78,   78,
			   78,   78,   78,   79,   79,   79,   80,   57,   55,   53,
			   80,   46,   43,   41,   38,   36,   34,   33,   26,   24,
			   21,   14,   12,    9,    3,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,  154,   12,   40,    0,   42,  155,  140,
			    0,   33,  141,   45,  147,    0,    0,    0,    0,    0,
			    0,  137,    0,   41,  138,   60,  144,    0,    0,    0,
			    0,    0,    0,  134,  135,   39,  141,   48,  136,    0,
			    0,  139,   66,  130,    0,   71,  137,    0,    0,    0,
			    0,    0,    0,  135,    0,  126,   72,  130,   63,    0,
			   54,   48,   73,    0,    0,    0,  155,   81,   86,   91,
			   96,  101,  106,  107,  112,   57,  117,  122,  127,  131,
			  135, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   66,    1,   66,   66,   66,    5,   66,   66,   67,
			   67,   66,   68,   69,   70,   71,   72,   73,   74,   75,
			    4,   67,   67,   66,   68,   69,   70,   71,   72,   73,
			   74,   75,    5,   66,   66,   66,   66,   66,   66,   67,
			   67,   67,   67,   67,   67,   67,   67,   67,   67,   67,
			   76,   77,   78,   67,   79,   67,   67,   56,   66,   80,
			   66,   66,   66,   67,   67,   67,    0,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (28, 46, 127)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (18, 195, 223)
			yy_ec_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   28,   28,   28,   28,   28,   28,   28,   28,    1,
			    2,    1,    1,    1,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,    1,   28,   28,   28,   28,   28,   28,   28,
			   28,   28,   28,    3,   28,    3, yy_Dummy>>,
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
			   23,   23,   23,   24,   23,   23,   25,   26,   26,   26,
			   27,   16,   16,   16,   16,   16,   16,   16,   16,   16,
			   16,   16,   16,   28, yy_Dummy>>,
			1, 34, 224)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    6,    6,    6,    1,    1,    1,    1,    1,    2,
			    3,    3,    3,    4,    4,    5,    6,    6,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    6, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    6,    3,    1,    1,    2,    4,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    4,    4,
			    3,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    1,    0,    0,    0,    0,    2,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
			    0,    0,    0,    0,    0,    0,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 155
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 66
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 67
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 28
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
