indexing

	description:

		"Scanners for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class GEPP_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		redefine
			wrap, output
		end

	GEPP_TOKENS
		export
			{NONE} all
		end


feature -- Status report

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= S_READLINE)
		end

feature {NONE} -- Implementation

	yy_build_tables is
			-- Build scanner tables.
		do
			yy_nxt ?= yy_nxt_template
			yy_chk ?= yy_chk_template
			yy_base ?= yy_base_template
			yy_def ?= yy_def_template
			yy_ec ?= yy_ec_template
			yy_meta ?= yy_meta_template
			yy_accept ?= yy_accept_template
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		do
if yy_act <= 12 then
if yy_act <= 6 then
if yy_act <= 3 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 44

						-- Comment.
						set_start_condition (S_PREPROC)
					
else
--|#line 48

						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
					
end
else
--|#line 52

						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
					
end
else
if yy_act <= 5 then
if yy_act = 4 then
--|#line 56

						last_token := P_ELSE
						set_start_condition (S_PREPROC)
					
else
--|#line 60

						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
					
end
else
--|#line 64

						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
					
end
end
else
if yy_act <= 9 then
if yy_act <= 8 then
if yy_act = 7 then
--|#line 68

						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
					
else
--|#line 72

						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
					
end
else
--|#line 76

						if not ignored then
							echo
						end
						set_start_condition (S_READLINE)
					
end
else
if yy_act <= 11 then
if yy_act = 10 then
--|#line 82

						if not ignored then
							echo
						end
						line_nb := line_nb + 1
					
else
--|#line 83

						if not ignored then
							echo
						end
						line_nb := line_nb + 1
					
end
else
--|#line 89

						if not ignored then
							echo
						end
					
end
end
end
else
if yy_act <= 18 then
if yy_act <= 15 then
if yy_act <= 14 then
if yy_act = 13 then
--|#line 97

						if not ignored then
							echo
						end
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
else
--|#line 104

						if not ignored then
							echo
						end
						set_start_condition (INITIAL)
					
end
else
--|#line 113
-- Separator.
end
else
if yy_act <= 17 then
if yy_act = 16 then
--|#line 114

						last_token := P_STRING
						last_value := text_substring (2, text_count - 1)
					
else
--|#line 118

						last_token := P_NAME
						last_value := text
					
end
else
--|#line 122
last_token := P_AND
end
end
else
if yy_act <= 21 then
if yy_act <= 20 then
if yy_act = 19 then
--|#line 123
last_token := P_OR
else
--|#line 124

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
else
--|#line 129
last_token := text_item (1).code
end
else
if yy_act = 22 then
--|#line 132
last_token := text_item (1).code
else
--|#line 0
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
			else
				terminate
			end
		end

feature {NONE} -- Table templates

	yy_nxt_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   66,   66,   10,   66,   11,   12,   13,   14,   15,
			   12,   16,   17,   17,   17,   17,   17,   17,   17,   17,
			   17,   17,   18,   23,   36,   37,   38,   24,   25,   39,
			   26,   45,   31,   31,   27,   65,   46,    8,    8,    8,
			    8,    8,    9,    9,    9,    9,    9,   19,   19,   19,
			   19,   19,   21,   21,   21,   21,   21,   29,   64,   63,
			   29,   29,   33,   33,   33,   33,   33,   23,   62,   23,
			   23,   23,   61,   60,   59,   58,   57,   56,   55,   54,
			   53,   52,   51,   50,   49,   48,   47,   44,   43,   42,
			   34,   41,   28,   40,   35,   22,   34,   32,   30,   28,

			   22,   66,   20,   20,    7,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66>>)
		end

	yy_chk_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    2,    0,    2,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,   11,   25,   25,   26,   11,   11,   26,
			   11,   38,   72,   72,   11,   64,   38,   67,   67,   67,
			   67,   67,   68,   68,   68,   68,   68,   69,   69,   69,
			   69,   69,   70,   70,   70,   70,   70,   71,   60,   59,
			   71,   71,   73,   73,   73,   73,   73,   74,   56,   74,
			   74,   74,   55,   54,   53,   52,   51,   49,   48,   47,
			   46,   45,   44,   43,   42,   40,   39,   37,   36,   35,
			   33,   29,   28,   27,   24,   21,   19,   18,   16,   13,

			    9,    7,    6,    5,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66>>)
		end

	yy_base_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    5,    0,  100,   99,  101,  104,   97,
			  104,   18,  104,   97,  104,    0,   92,    0,   80,   93,
			  104,   92,  104,    0,   84,   11,   15,   79,   90,   87,
			  104,    0,  104,   87,  104,   78,   73,   78,   22,   78,
			   76,  104,   72,   73,   70,   71,   71,   66,   68,   63,
			  104,   65,   64,   64,   57,   61,   58,  104,  104,   48,
			   49,  104,  104,  104,   25,  104,  104,   36,   41,   46,
			   51,   56,   28,   61,   66>>)
		end

	yy_def_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,   67,   68,   66,    3,   69,   69,   66,   66,   70,
			   66,   66,   66,   66,   66,   71,   66,   72,   66,   73,
			   66,   70,   66,   74,   66,   66,   66,   66,   66,   71,
			   66,   72,   66,   73,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,   66,   66,   66,   66,
			   66,   66,   66,   66,   66,   66,    0,   66,   66,   66,
			   66,   66,   66,   66,   66>>)
		end

	yy_ec_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    4,    5,    1,    1,    6,    1,
			    1,    1,    1,    1,    1,    7,    7,    1,    7,    7,
			    7,    7,    7,    7,    7,    7,    7,    7,    1,    1,
			    1,    1,    1,    1,    1,    7,    7,    8,    9,   10,
			   11,    7,    7,   12,    7,    7,   13,    7,   14,    7,
			    7,    7,    7,   15,    7,   16,    7,    7,    7,    7,
			    7,    1,    1,    1,    1,    7,    1,    7,    7,    8,

			    9,   10,   11,    7,    7,   12,    7,    7,   13,    7,
			   14,    7,    7,    7,    7,   15,    7,   16,    7,    7,
			    7,    7,    7,    1,   17,    1,    1,    1,    1,    1,
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
			    1,    1,    1,    1,    1,    1,    1>>)
		end

	yy_meta_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    1,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    5,    1>>)
		end

	yy_accept_template: ANY is
			-- This is supposed to be "like FIXED_INTEGER_ARRAY_TYPE",
			-- but once functions cannot be declared with anchored types.
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   14,   14,   24,   22,   12,
			   11,    9,   21,   15,   20,   21,   21,   17,   21,   14,
			   13,   12,   10,    1,    0,    0,    0,    0,   15,    0,
			   18,   17,   19,   14,   13,    0,    0,    0,    0,    0,
			    0,   16,    0,    0,    0,    0,    0,    0,    0,    0,
			    4,    0,    0,    0,    0,    0,    0,    5,    2,    0,
			    0,    8,    7,    3,    0,    6,    0>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 104
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 66
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 67
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

	yyNb_rules: INTEGER is 23
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 24
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	S_PREPROC: INTEGER is 1
	S_READLINE: INTEGER is 2
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_with_buffer (Empty_buffer)
			output_file := std.output
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

	last_value: ANY
			-- Semantic value to be passed to the parser

	include_stack: DS_STACK [YY_BUFFER] is
			-- Input buffers not completely parsed yet
		deferred
		ensure
			include_stack_not_void: Result /= Void
			no_void_buffer: not Result.has (Void)
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
		do
			if not include_stack.is_empty then
				old_buffer ?= input_buffer
				set_input_buffer (include_stack.item)
				include_stack.remove
				if old_buffer /= Void then
					INPUT_STREAM_.close (old_buffer.file)
				end
				set_start_condition (INITIAL)
			else
				Result := True
			end
		end

feature -- Output

	output_file: like OUTPUT_STREAM_TYPE
			-- Output file

	set_output_file (a_file: like OUTPUT_STREAM_TYPE) is
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: OUTPUT_STREAM_.is_open_write (a_file)
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

	output (a_text: like text) is
			-- Output `a_text' to `output_file'.
		do
			output_file.put_string (a_text)
		end

invariant

	output_not_void: output_file /= Void
	output_open_write: OUTPUT_STREAM_.is_open_write (output_file)

end -- class GEPP_SCANNER
