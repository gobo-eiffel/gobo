class UNICODE_MODE

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_scanner_skeleton
		redefine
			report_invalid_unicode_character_error
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
--|#line 29 "unicode_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'unicode_mode.l' at line 29")
end

			last_token := T_break
			last_utf8_value := utf8_text
			last_unicode_value := unicode_text
		
when 2 then
--|#line 34 "unicode_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'unicode_mode.l' at line 34")
end

			last_token := T_symbol
			last_utf8_value := utf8_text
			last_unicode_value := unicode_text
		
when 3 then
--|#line 39 "unicode_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'unicode_mode.l' at line 39")
end

			last_token := T_word
			last_utf8_value := utf8_text
			last_unicode_value := unicode_text
		
when 4 then
--|#line 0 "unicode_mode.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'unicode_mode.l' at line 0")
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
			    0,    5,    6,    4,    9,    8,    7,   10,    3,   10,
			   10,   10, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,   13,   12,   11,    3,   10,   10,
			   10,   10, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    7,    0,    0,    0,    0,    0,    0,
			    8,    3,    4,    2, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   10,    1,   10,   11,   12,   13,   11,   12,   13,
			    0,   10,   10,   10, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 12290)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (3, 46, 159)
			an_array.put (1, 160)
			an_array.area.fill_with (3, 161, 5759)
			an_array.put (1, 5760)
			an_array.area.fill_with (3, 5761, 8191)
			an_array.area.fill_with (1, 8192, 8202)
			an_array.area.fill_with (3, 8203, 8238)
			an_array.put (1, 8239)
			an_array.area.fill_with (3, 8240, 8286)
			an_array.put (1, 8287)
			an_array.area.fill_with (3, 8288, 8703)
			yy_ec_template_2 (an_array)
			an_array.area.fill_with (3, 8708, 12287)
			yy_ec_template_3 (an_array)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,    3,    3,    3,    3,    3,    3,    3,    3,    1,
			    1,    1,    1,    1,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    1,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    2,    3,    2, yy_Dummy>>,
			1, 46, 0)
		end

	yy_ec_template_2 (an_array: ARRAY [INTEGER])
			-- Fill chunk #2 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    2,    3,    3,    2, yy_Dummy>>,
			1, 4, 8704)
		end

	yy_ec_template_3 (an_array: ARRAY [INTEGER])
			-- Fill chunk #3 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    1,    3,    3, yy_Dummy>>,
			1, 3, 12288)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    5,    3,    1,    2,    3,    1,    2,
			    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 8
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 10
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 11
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 3
			-- Equivalence code for NULL character

	yyMax_symbol_equiv_class: INTEGER = 12289
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

	yyNb_rules: INTEGER = 4
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 5
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
			set_input_buffer (new_unicode_file_buffer (l_input_file))
			create l_output_file.make (Arguments.argument (2))
			l_output_file.recursive_open_write
			l_output_file.put_string ({UC_UTF8_ROUTINES}.utf8_bom)
			from
				read_token
			until
				last_token <= 0
			loop
				l_output_file.put_line ("Token code: " + last_token.out)
				l_output_file.put_line ("Token value: " + last_utf8_value)
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

feature -- Token codes

	T_break: INTEGER = 260
	T_symbol: INTEGER = 261
	T_word: INTEGER = 262
			-- Token codes

feature {NONE} -- Error handling

	report_invalid_unicode_character_error (a_code: NATURAL_32)
			-- Report that the surrogate or invalid Unicode character
			-- with code `a_code' has been read from the input
			-- buffer and caused the scanner to fail.
			--
			-- Note that invalid UTF-8 sequences in the input file
			-- are replaced by the maximum CHARACTER_32 value, which
			-- is an invalid Unicode character.
		do
			std.error.put_line ("Surrogate or invalid Unicode character '\u{" + a_code.to_hex_string + "}'")
		end
			
end
