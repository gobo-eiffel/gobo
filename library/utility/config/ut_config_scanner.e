indexing

	description:

		"Scanners for config files made up of name/value pairs and preprocessor instructions"

	copyright: "Copyright (c) 2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= S_EMPTY_LINE)
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
if yy_act <= 14 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 40 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 40")
end

						-- Comment.
						set_start_condition (S_SKIP_EOL)
					
else
--|#line 41 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 41")
end

						-- Comment.
						set_start_condition (S_SKIP_EOL)
					
end
else
if yy_act = 3 then
--|#line 45 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 45")
end

						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
					
else
--|#line 49 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 49")
end

						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
					
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 53 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 53")
end

						last_token := P_ELSE
						set_start_condition (S_PREPROC)
					
else
--|#line 57 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 57")
end

						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
					
end
else
--|#line 61 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 61")
end

						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
					
end
end
else
if yy_act <= 11 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 65 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 65")
end

						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
					
else
--|#line 69 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 69")
end

						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
					
end
else
if yy_act = 10 then
--|#line 73 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 73")
end

						last_token := P_NAME
						last_string_value := text
						STRING_.left_adjust (last_string_value)
						set_start_condition (S_NAME)
					
else
--|#line 79 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 79")
end

						last_token := P_EOL
						line_nb := line_nb + 1
					
end
end
else
if yy_act <= 13 then
if yy_act = 12 then
--|#line 83 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 83")
end

						set_start_condition (S_EMPTY_LINE)
					
else
--|#line 89 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 89")
end

						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
else
--|#line 93 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 93")
end

						set_start_condition (INITIAL)
					
end
end
end
else
if yy_act <= 21 then
if yy_act <= 18 then
if yy_act <= 16 then
if yy_act = 15 then
--|#line 99 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 99")
end
-- Separator.
else
--|#line 100 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 100")
end

						last_token := P_STRING
						last_string_value := text_substring (2, text_count - 1)
					
end
else
if yy_act = 17 then
--|#line 104 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 104")
end

						last_token := P_NAME
						last_string_value := text
					
else
--|#line 108 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 108")
end
last_token := P_AND
end
end
else
if yy_act <= 20 then
if yy_act = 19 then
--|#line 109 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 109")
end
last_token := P_OR
else
--|#line 110 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 110")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
else
--|#line 122 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 122")
end
-- Separator.
end
end
else
if yy_act <= 25 then
if yy_act <= 23 then
if yy_act = 22 then
--|#line 123 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 123")
end

						last_token := P_COLON
						set_start_condition (S_VALUE)
					
else
--|#line 130 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 130")
end
-- Separator.
end
else
if yy_act = 24 then
--|#line 131 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 131")
end

						last_token := P_VALUE
						last_string_value := text
					
else
--|#line 135 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 135")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
end
else
if yy_act <= 27 then
if yy_act = 26 then
--|#line 147 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 147")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
else
--|#line 158 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 158")
end

						last_token := text_item (1).code
						set_start_condition (INITIAL)
					
end
else
--|#line 0 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 0")
end
last_token := yyError_token
fatal_error ("scanner jammed")
end
end
end
end
			yy_set_beginning_of_line
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		do
			inspect yy_sc
when 1 then
--|#line 0 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 0")
end

						last_token := P_EOL
						set_start_condition (INITIAL)
					
when 5 then
--|#line 0 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 0")
end

						last_token := P_EOL
						set_start_condition (INITIAL)
					
when 6 then
--|#line 0 "ut_config_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'ut_config_scanner.l' at line 0")
end

						last_token := P_EOL
						set_start_condition (INITIAL)
					
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   16,   17,   18,   16,   19,   16,   20,   21,   16,
			   21,   21,   21,   21,   21,   21,   21,   21,   21,   16,
			   16,   22,   23,   24,   16,   25,   26,   26,   16,   26,
			   26,   26,   26,   26,   26,   26,   26,   26,   27,   30,
			   30,   33,   34,   33,   34,   87,   31,   31,   36,   57,
			   58,   37,   59,   38,   40,   60,   86,   67,   85,   84,
			   41,   42,   68,   43,   83,   82,   81,   44,   88,   80,
			   79,   88,   78,   45,   36,   77,   76,   37,   75,   38,
			   62,   62,   74,   62,   62,   62,   73,   72,   62,   71,
			   70,   69,   66,   65,   64,   55,   53,   52,   62,   16,

			   16,   16,   16,   16,   16,   16,   16,   16,   28,   28,
			   28,   28,   28,   28,   28,   28,   28,   32,   32,   32,
			   32,   32,   32,   32,   32,   32,   39,   63,   46,   39,
			   39,   39,   39,   39,   47,   47,   61,   56,   47,   47,
			   47,   47,   47,   49,   49,   49,   49,   51,   51,   51,
			   51,   51,   51,   51,   51,   51,   54,   54,   39,   54,
			   54,   54,   54,   54,   54,   40,   40,   55,   40,   40,
			   40,   40,   40,   40,   45,   45,   53,   45,   45,   45,
			   45,   45,   45,   62,   62,   52,   62,   62,   62,   62,
			   62,   62,   50,   48,   46,   39,   88,   35,   35,   29,

			   29,   15,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    2,    2,    2,    2,    2,    2,    2,    2,    2,    2,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    9,
			   10,   11,   11,   12,   12,   86,    9,   10,   17,   42,
			   42,   17,   43,   17,   19,   43,   82,   59,   81,   78,
			   19,   19,   59,   19,   77,   76,   75,   19,   20,   74,
			   73,   20,   71,   20,   36,   70,   69,   36,   68,   36,
			   45,   45,   67,   45,   45,   45,   66,   65,   45,   64,
			   61,   60,   58,   57,   56,   55,   53,   51,   45,   89,

			   89,   89,   89,   89,   89,   89,   89,   89,   90,   90,
			   90,   90,   90,   90,   90,   90,   90,   91,   91,   91,
			   91,   91,   91,   91,   91,   91,   92,   47,   46,   92,
			   92,   92,   92,   92,   93,   93,   44,   41,   93,   93,
			   93,   93,   93,   94,   94,   94,   94,   95,   95,   95,
			   95,   95,   95,   95,   95,   95,   96,   96,   39,   96,
			   96,   96,   96,   96,   96,   97,   97,   33,   97,   97,
			   97,   97,   97,   97,   98,   98,   30,   98,   98,   98,
			   98,   98,   98,   99,   99,   28,   99,   99,   99,   99,
			   99,   99,   27,   25,   22,   21,   15,   14,   13,    8,

			    7,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88,   88,   88,   88,   88,   88,   88,   88,   88,   88,
			   88, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,   19,    0,    0,    0,  197,  196,   37,
			   38,   39,   41,  195,  194,  196,  201,   46,  201,   49,
			   66,  188,  192,  201,    0,  187,    0,  173,  182,  201,
			  174,  201,    0,  165,  201,  201,   72,    0,    0,  151,
			    0,  125,   34,   39,  120,   79,  126,  123,  201,    0,
			  201,   94,  201,   94,    0,   93,   81,   76,   81,   46,
			   81,   79,    0,  201,   75,   75,   72,   70,   67,   61,
			   63,   56,  201,   57,   56,   54,   47,   51,   47,  201,
			  201,   45,   45,  201,  201,  201,   33,  201,  201,   98,
			  107,  116,  124,  133,  137,  146,  155,  164,  173,  182, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
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

	yy_ec_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    5,    1,    1,    6,    1,
			    1,    1,    1,    1,    1,    7,    8,    1,    8,    8,
			    8,    8,    8,    8,    8,    8,    8,    8,    9,    1,
			    1,    1,    1,    1,    1,    8,    8,   10,   11,   12,
			   13,    8,    8,   14,    8,    8,   15,    8,   16,    8,
			    8,    8,    8,   17,    8,   18,    8,    8,    8,    8,
			    8,    1,    1,    1,    1,    8,    1,    8,    8,   10,

			   11,   12,   13,    8,    8,   14,    8,    8,   15,    8,
			   16,    8,    8,    8,    8,   17,    8,   18,    8,    8,
			    8,    8,    8,    1,   19,    1,    1,    1,    1,    1,
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
			    0,    1,    2,    3,    4,    5,    1,    6,    7,    1,
			    7,    7,    7,    7,    7,    7,    7,    8,    9,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
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

	yyJam_base: INTEGER is 201
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 88
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 89
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

	yyNb_rules: INTEGER is 28
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 29
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	S_PREPROC: INTEGER is 1
	S_READLINE: INTEGER is 2
	S_SKIP_EOL: INTEGER is 3
	S_NAME: INTEGER is 4
	S_VALUE: INTEGER is 5
	S_EMPTY_LINE: INTEGER is 6
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_with_buffer (Empty_buffer)
			line_nb := 1
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			line_nb := 1
		end

feature -- Access

	line_nb: INTEGER
			-- Current line number

	include_stack: DS_STACK [YY_BUFFER] is
			-- Input buffers not completely parsed yet
		deferred
		ensure
			include_stack_not_void: Result /= Void
			no_void_buffer: not Result.has (Void)
		end

	line_nb_stack: DS_STACK [INTEGER] is
			-- Line numbers in the corresponding input buffers in `include_stack'
		deferred
		ensure
			line_nb_stack_not_void: Result /= Void
			same_count: Result.count = include_stack.count
		end

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		deferred
		end

feature -- Element change

	wrap: BOOLEAN is
			-- Should current scanner terminate when end of file is reached?
			-- True unless an include file was being processed.
		local
			old_buffer: YY_FILE_BUFFER
			a_file: KI_CHARACTER_INPUT_STREAM
		do
			if not include_stack.is_empty then
				old_buffer ?= input_buffer
				set_input_buffer (include_stack.item)
				line_nb := line_nb_stack.item
				line_nb_stack.remove
				include_stack.remove
				if old_buffer /= Void then
					a_file := old_buffer.file
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

	output (a_text: like text) is
			-- Silently ignore `a_text'.
		do
		end

end
