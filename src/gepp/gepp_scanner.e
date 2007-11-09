indexing

	description:

		"Scanners for 'gepp' preprocessors"

	copyright: "Copyright (c) 1999-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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
			Result := (INITIAL <= sc and sc <= S_SKIP_EOL)
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
if yy_act <= 13 then
if yy_act <= 7 then
if yy_act <= 4 then
if yy_act <= 2 then
if yy_act = 1 then
--|#line 41 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 41")
end

						-- Comment.
						set_start_condition (S_SKIP_EOL)
						if empty_lines then
							output_file.put_new_line
						end
					
else
--|#line 48 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 48")
end

						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
end
else
if yy_act = 3 then
--|#line 55 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 55")
end

						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
else
--|#line 62 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 62")
end

						last_token := P_ELSE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
end
end
else
if yy_act <= 6 then
if yy_act = 5 then
--|#line 69 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 69")
end

						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
else
--|#line 76 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 76")
end

						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
end
else
--|#line 83 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 83")
end

						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
end
end
else
if yy_act <= 10 then
if yy_act <= 9 then
if yy_act = 8 then
--|#line 90 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 90")
end

						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
else
--|#line 97 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 97")
end

						echo
						set_start_condition (S_READLINE)
					
end
else
--|#line 101 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 101")
end

						echo
						line_nb := line_nb + 1
					
end
else
if yy_act <= 12 then
if yy_act = 11 then
--|#line 102 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 102")
end

						echo
						line_nb := line_nb + 1
					
else
--|#line 106 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 106")
end

						echo
					
end
else
--|#line 112 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 112")
end

						echo
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
end
end
else
if yy_act <= 19 then
if yy_act <= 16 then
if yy_act <= 15 then
if yy_act = 14 then
--|#line 117 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 117")
end

						echo
						set_start_condition (INITIAL)
					
else
--|#line 124 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 124")
end

						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
else
--|#line 128 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 128")
end

						set_start_condition (INITIAL)
					
end
else
if yy_act <= 18 then
if yy_act = 17 then
--|#line 134 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 134")
end
-- Separator.
else
--|#line 135 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 135")
end

						last_token := P_STRING
						last_string_value := text_substring (2, text_count - 1)
					
end
else
--|#line 139 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 139")
end

						last_token := P_NAME
						last_string_value := text
					
end
end
else
if yy_act <= 22 then
if yy_act <= 21 then
if yy_act = 20 then
--|#line 143 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 143")
end
last_token := P_AND
else
--|#line 144 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 144")
end
last_token := P_OR
end
else
--|#line 145 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 145")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
end
else
if yy_act <= 24 then
if yy_act = 23 then
--|#line 154 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 154")
end
last_token := text_item (1).code
else
--|#line 157 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 157")
end
last_token := text_item (1).code
end
else
--|#line 0 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 0")
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
--|#line 0 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 0")
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
			    0,   72,   72,   12,   72,   13,   14,   15,   16,   17,
			   14,   18,   19,   19,   19,   19,   19,   19,   19,   19,
			   19,   19,   20,   27,   42,   43,   44,   28,   29,   45,
			   30,   51,   35,   35,   31,   71,   52,   10,   10,   10,
			   10,   10,   11,   11,   11,   11,   11,   21,   21,   21,
			   21,   21,   23,   23,   23,   23,   23,   25,   25,   25,
			   25,   25,   33,   70,   69,   33,   33,   37,   37,   37,
			   37,   37,   39,   39,   39,   39,   39,   27,   68,   27,
			   27,   27,   67,   66,   65,   64,   63,   62,   61,   60,
			   59,   58,   57,   56,   55,   54,   53,   50,   49,   48,

			   40,   38,   47,   32,   46,   41,   26,   40,   38,   36,
			   34,   32,   26,   72,   24,   24,   22,   22,    9,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    2,    0,    2,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,    3,   13,   29,   29,   30,   13,   13,   30,
			   13,   44,   79,   79,   13,   70,   44,   73,   73,   73,
			   73,   73,   74,   74,   74,   74,   74,   75,   75,   75,
			   75,   75,   76,   76,   76,   76,   76,   77,   77,   77,
			   77,   77,   78,   66,   65,   78,   78,   80,   80,   80,
			   80,   80,   81,   81,   81,   81,   81,   82,   62,   82,
			   82,   82,   61,   60,   59,   58,   57,   55,   54,   53,
			   52,   51,   50,   49,   48,   46,   45,   43,   42,   41,

			   39,   37,   33,   32,   31,   28,   25,   23,   21,   20,
			   18,   15,   11,    9,    8,    7,    6,    5,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    5,    0,  114,  113,  112,  111,  113,
			  118,  109,  118,   18,  118,  109,  118,    0,  104,    0,
			   92,  105,  118,  104,  118,  103,  118,    0,   95,   11,
			   15,   90,  101,   98,  118,    0,  118,   98,  118,   97,
			  118,   88,   83,   88,   22,   88,   86,  118,   82,   83,
			   80,   81,   81,   76,   78,   73,  118,   75,   74,   74,
			   67,   71,   68,  118,  118,   53,   54,  118,  118,  118,
			   25,  118,  118,   36,   41,   46,   51,   56,   61,   28,
			   66,   71,   76, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,   73,   74,   72,    3,   75,   75,   76,   76,   72,
			   72,   77,   72,   72,   72,   72,   72,   78,   72,   79,
			   72,   80,   72,   81,   72,   77,   72,   82,   72,   72,
			   72,   72,   72,   78,   72,   79,   72,   80,   72,   81,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,    0,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72, yy_Dummy>>)
		end

	yy_ec_template: SPECIAL [INTEGER] is
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
			    1,    1,    1,    1,    1,    1,    1, yy_Dummy>>)
		end

	yy_meta_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    1,    1,    2,    3,    1,    1,    4,    4,    4,
			    4,    4,    4,    4,    4,    4,    5,    1, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER] is
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    0,    0,   14,   14,   16,   16,   26,
			   24,   12,   11,    9,   23,   17,   22,   23,   23,   19,
			   23,   14,   13,   16,   15,   12,   10,    1,    0,    0,
			    0,    0,   17,    0,   20,   19,   21,   14,   13,   16,
			   15,    0,    0,    0,    0,    0,    0,   18,    0,    0,
			    0,    0,    0,    0,    0,    0,    4,    0,    0,    0,
			    0,    0,    0,    5,    2,    0,    0,    8,    7,    3,
			    0,    6,    0, yy_Dummy>>)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 118
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 72
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 73
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

	yyNb_rules: INTEGER is 25
			-- Number of rules

	yyEnd_of_buffer: INTEGER is 26
			-- End of buffer rule code

	yyLine_used: BOOLEAN is false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN is false
			-- Is `position' used?

	INITIAL: INTEGER is 0
	S_PREPROC: INTEGER is 1
	S_READLINE: INTEGER is 2
	S_SKIP_EOL: INTEGER is 3
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

	empty_lines: BOOLEAN
			-- Should empty lines be generated when lines are
			-- ignored in order to preserve line numbering?

feature -- Status setting

	set_empty_lines (b: BOOLEAN) is
			-- Set `empty_lines' to `b'.
		do
			empty_lines := b
		ensure
			empty_lines_set: empty_lines = b
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

	output_file: KI_TEXT_OUTPUT_STREAM
			-- Output file

	set_output_file (a_file: like output_file) is
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

	output (a_text: like text) is
			-- Output `a_text' to `output_file'.
		local
			nb: INTEGER
		do
			if not ignored then
				nb := a_text.count
				if nb > 0 then
					if a_text.item (nb) = '%N' then
						nb := nb - 1
						if nb > 0 and then a_text.item (nb) = '%R' then
							nb := nb - 1
						end
						if nb > 0 then
							output_file.put_line (a_text.substring (1, nb))
						else
							output_file.put_new_line
						end
					else
						output_file.put_string (a_text)
					end
				end
			elseif empty_lines then
				output_file.put_new_line
			end
		end

invariant

	output_not_void: output_file /= Void
	output_open_write: output_file.is_open_write

end
