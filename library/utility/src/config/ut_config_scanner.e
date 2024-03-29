﻿note

	description:

		"Scanners for config files made up of name/value pairs and preprocessor instructions"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 2007-2013, Eric Bezault and others"
	license: "MIT License"

deferred class UT_CONFIG_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		redefine
			wrap, output
		end

	UT_CONFIG_TOKENS
		export {NONE} all end


feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= S_EMPTY_LINE)
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
when 1, 2 then
--|#line 39 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 39")
end

						-- Comment.
						set_start_condition (S_SKIP_EOL)
					
when 3 then
--|#line 44 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 44")
end

						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
					
when 4 then
--|#line 48 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 48")
end

						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
					
when 5 then
--|#line 52 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 52")
end

						last_token := P_ELSE
						set_start_condition (S_PREPROC)
					
when 6 then
--|#line 56 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 56")
end

						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
					
when 7 then
--|#line 60 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 60")
end

						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
					
when 8 then
--|#line 64 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 64")
end

						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
					
when 9 then
--|#line 68 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 68")
end

						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
					
when 10 then
--|#line 72 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 72")
end

						last_token := P_NAME
						last_string_value := text
						check attached last_string_value as l_last_string_value then
							STRING_.left_adjust (l_last_string_value)
						end
						set_start_condition (S_NAME)
					
when 11 then
--|#line 80 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 80")
end

						last_token := P_EOL
						line_nb := line_nb + 1
					
when 12 then
--|#line 84 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 84")
end

						set_start_condition (S_EMPTY_LINE)
					
when 13 then
--|#line 90 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 90")
end

						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 14 then
--|#line 94 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 94")
end

						set_start_condition (INITIAL)
					
when 15 then
--|#line 100 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 100")
end
-- Separator.
when 16 then
--|#line 101 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 101")
end

						last_token := P_STRING
						last_string_value := text_substring (2, text_count - 1)
					
when 17 then
--|#line 105 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 105")
end

						last_token := P_NAME
						last_string_value := text
					
when 18 then
--|#line 109 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 109")
end
last_token := P_AND
when 19 then
--|#line 110 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 110")
end
last_token := P_OR
when 20 then
--|#line 111 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 111")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 21 then
--|#line 123 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 123")
end
-- Separator.
when 22 then
--|#line 124 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 124")
end

						last_token := P_COLON
						set_start_condition (S_VALUE)
					
when 23 then
--|#line 131 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 131")
end
-- Separator.
when 24 then
--|#line 132 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 132")
end

						last_token := P_VALUE
						last_string_value := text
					
when 25 then
--|#line 136 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 136")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 26 then
--|#line 148 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 148")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 27 then
--|#line 159 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 159")
end

						last_token := text_item (1).code
						set_start_condition (INITIAL)
					
when 28 then
--|#line 0 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 0")
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
			inspect yy_sc
when 1 then
--|#line 116 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 116")
end

						last_token := P_EOL
						set_start_condition (INITIAL)
					
when 5 then
--|#line 141 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 141")
end

						last_token := P_EOL
						set_start_condition (INITIAL)
					
when 6 then
--|#line 153 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 153")
end

						last_token := P_EOL
						set_start_condition (INITIAL)
					
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER]
			-- Template for `yy_nxt'
		once
			Result := yy_fixed_array (<<
			    0,   17,   18,   16,   19,   16,   20,   21,   16,   21,
			   21,   21,   21,   21,   21,   21,   21,   21,   16,   16,
			   22,   23,   24,   16,   25,   26,   26,   16,   26,   26,
			   26,   26,   26,   26,   26,   26,   26,   27,   16,   30,
			   30,   33,   34,   33,   34,   49,   31,   31,   36,   57,
			   58,   37,   59,   38,   40,   60,   39,   67,   87,   39,
			   41,   42,   68,   43,   86,   85,   84,   44,   88,   83,
			   82,   88,   81,   45,   36,   80,   79,   37,   78,   38,
			   62,   77,   62,   62,   62,   76,   75,   62,   74,   73,
			   72,   71,   70,   69,   66,   65,   64,   62,   62,   16,

			   16,   16,   16,   16,   28,   28,   28,   28,   28,   32,
			   32,   32,   32,   32,   47,   55,   53,   47,   47,   51,
			   51,   51,   51,   51,   54,   52,   54,   54,   54,   40,
			   63,   40,   40,   40,   45,   46,   45,   45,   45,   62,
			   61,   62,   62,   62,   56,   39,   55,   53,   52,   50,
			   48,   46,   39,   88,   35,   35,   29,   29,   15,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    9,
			   10,   11,   11,   12,   12,   94,    9,   10,   17,   42,
			   42,   17,   43,   17,   19,   43,   92,   59,   86,   92,
			   19,   19,   59,   19,   82,   81,   78,   19,   20,   77,
			   76,   20,   75,   20,   36,   74,   73,   36,   71,   36,
			   45,   70,   45,   45,   45,   69,   68,   45,   67,   66,
			   65,   64,   61,   60,   58,   57,   56,   45,   45,   89,

			   89,   89,   89,   89,   90,   90,   90,   90,   90,   91,
			   91,   91,   91,   91,   93,   55,   53,   93,   93,   95,
			   95,   95,   95,   95,   96,   51,   96,   96,   96,   97,
			   47,   97,   97,   97,   98,   46,   98,   98,   98,   99,
			   44,   99,   99,   99,   41,   39,   33,   30,   28,   27,
			   25,   22,   21,   15,   14,   13,    8,    7,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   19,    0,    0,    0,  155,  154,   38,
			   39,   40,   42,  153,  152,  153,  158,   47,  158,   50,
			   67,  146,  150,  158,    0,  145,    0,  131,  146,  158,
			  146,  158,    0,  145,  158,  158,   73,    0,    0,  139,
			    0,  133,   35,   40,  125,   79,  134,  127,  158,    0,
			  158,  123,  158,  115,    0,  114,   84,   79,   84,   47,
			   84,   82,    0,  158,   78,   79,   76,   77,   76,   71,
			   70,   63,  158,   64,   63,   61,   53,   57,   55,  158,
			  158,   53,   54,  158,  158,  158,   47,  158,  158,   98,
			  103,  108,   55,  113,   41,  118,  123,  128,  133,  138, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
		once
			Result := yy_fixed_array (<<
			    0,   89,   88,   88,    3,   89,   89,   90,   90,   89,
			   89,   91,   91,   89,   89,   88,   88,   92,   88,   88,
			   92,   20,   88,   88,   93,   88,   94,   88,   95,   88,
			   88,   88,   96,   88,   88,   88,   20,   19,   20,   20,
			   97,   88,   88,   88,   88,   98,   88,   93,   88,   94,
			   88,   95,   88,   88,   96,   88,   88,   88,   88,   88,
			   88,   88,   99,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,    0,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (19, 125, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   19,   19,   19,   19,   19,   19,   19,   19,    1,
			    2,   19,   19,    1,   19,   19,   19,   19,   19,   19,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,    1,   19,    3,    4,   19,   19,    5,   19,
			   19,   19,   19,   19,   19,    6,    7,   19,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    8,   19,
			   19,   19,   19,   19,   19,    7,    7,    9,   10,   11,
			   12,    7,    7,   13,    7,    7,   14,    7,   15,    7,
			    7,    7,    7,   16,    7,   17,    7,    7,    7,    7,
			    7,   19,   19,   19,   19,    7,   19,    7,    7,    9,

			   10,   11,   12,    7,    7,   13,    7,    7,   14,    7,
			   15,    7,    7,    7,    7,   16,    7,   17,    7,    7,
			    7,    7,    7,   19,   18, yy_Dummy>>,
			1, 125, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    1,    2,    3,    1,    5,    4,    4,    5,    4,
			    4,    4,    4,    4,    4,    4,    4,    4,    5,    5, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,    0,    0,   14,   14,    0,
			    0,    0,    0,    0,    0,   29,   27,   12,   11,   27,
			   10,   10,   15,   20,   27,   27,   17,   27,   14,   13,
			   21,   22,   24,   23,   25,   26,   12,    0,   10,   10,
			    2,    0,    0,    0,    0,    1,   15,    0,   18,   17,
			   19,   14,   13,   21,   24,   23,    0,    0,    0,    0,
			    0,    0,    1,   16,    0,    0,    0,    0,    0,    0,
			    0,    0,    5,    0,    0,    0,    0,    0,    0,    6,
			    3,    0,    0,    9,    8,    4,    0,    7,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER = 158
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 88
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 89
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 19
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

	yyNb_rules: INTEGER = 28
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 29
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	S_PREPROC: INTEGER = 1
	S_READLINE: INTEGER = 2
	S_SKIP_EOL: INTEGER = 3
	S_NAME: INTEGER = 4
	S_VALUE: INTEGER = 5
	S_EMPTY_LINE: INTEGER = 6
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_with_buffer (Empty_buffer)
			last_string_value := ""
			line_nb := 1
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			last_string_value := ""
			line_nb := 1
		end

feature -- Access

	line_nb: INTEGER
			-- Current line number

	include_stack: DS_STACK [YY_BUFFER]
			-- Input buffers not completely parsed yet
		deferred
		ensure
			include_stack_not_void: Result /= Void
			no_void_buffer: not Result.has_void
		end

	line_nb_stack: DS_STACK [INTEGER]
			-- Line numbers in the corresponding input buffers in `include_stack'
		deferred
		ensure
			line_nb_stack_not_void: Result /= Void
			same_count: Result.count = include_stack.count
		end

feature -- Status report

	ignored: BOOLEAN
			-- Is current line ignored?
		deferred
		end

feature -- Element change

	wrap: BOOLEAN
			-- Should current scanner terminate when end of file is reached?
			-- True unless an include file was being processed.
		local
			l_old_buffer: YY_BUFFER
			a_file: KI_CHARACTER_INPUT_STREAM
		do
			if not include_stack.is_empty then
				l_old_buffer := input_buffer
				set_input_buffer (include_stack.item)
				line_nb := line_nb_stack.item
				line_nb_stack.remove
				include_stack.remove
				if attached {YY_FILE_BUFFER} l_old_buffer as l_old_file_buffer then
					a_file := l_old_file_buffer.file
					if a_file.is_closable then
						a_file.close
					end
				end
				set_start_condition (INITIAL)
			else
				Result := True
			end
		end

feature -- Output

	output (a_text: like text)
			-- Silently ignore `a_text'.
		do
		end

end
