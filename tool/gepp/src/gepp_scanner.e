note

	description:

		"Scanners for 'gepp' preprocessors"

	copyright: "Copyright (c) 1999-2018, Eric Bezault and others"
	license: "MIT License"

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

	valid_start_condition (sc: INTEGER): BOOLEAN
			-- Is `sc' a valid start condition?
		do
			Result := (INITIAL <= sc and sc <= S_SKIP_EOL)
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
--|#line 39 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 39")
end

						-- Comment.
						set_start_condition (S_SKIP_EOL)
						if empty_lines then
							output_file.put_new_line
						end
					
when 2 then
--|#line 46 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 46")
end

						last_token := P_IFDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 3 then
--|#line 53 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 53")
end

						last_token := P_IFNDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 4 then
--|#line 60 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 60")
end

						last_token := P_ELSE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 5 then
--|#line 67 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 67")
end

						last_token := P_ENDIF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 6 then
--|#line 74 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 74")
end

						last_token := P_INCLUDE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 7 then
--|#line 81 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 81")
end

						last_token := P_DEFINE
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 8 then
--|#line 88 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 88")
end

						last_token := P_UNDEF
						set_start_condition (S_PREPROC)
						if empty_lines then
							output_file.put_new_line
						end
					
when 9 then
--|#line 95 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 95")
end

						echo
						set_start_condition (S_READLINE)
					
when 10, 11 then
--|#line 99 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 99")
end

						echo
						line_nb := line_nb + 1
					
when 12 then
--|#line 104 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 104")
end

						echo
					
when 13 then
--|#line 110 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 110")
end

						echo
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 14 then
--|#line 115 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 115")
end

						echo
						set_start_condition (INITIAL)
					
when 15 then
--|#line 122 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 122")
end

						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 16 then
--|#line 126 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 126")
end

						set_start_condition (INITIAL)
					
when 17 then
--|#line 132 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 132")
end
-- Separator.
when 18 then
--|#line 133 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 133")
end

						last_token := P_STRING
						last_string_value := text_substring (2, text_count - 1)
					
when 19 then
--|#line 137 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 137")
end

						last_token := P_NAME
						last_string_value := text
					
when 20 then
--|#line 141 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 141")
end
last_token := P_AND
when 21 then
--|#line 142 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 142")
end
last_token := P_OR
when 22 then
--|#line 143 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 143")
end

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 23 then
--|#line 152 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 152")
end
last_token := text_item (1).code
when 24 then
--|#line 155 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 155")
end
last_token := text_item (1).code
when 25 then
--|#line 0 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 0")
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
--|#line 148 "gepp_scanner.l"
debug ("GELEX")
	std.error.put_line ("Executing scanner user-code from file 'gepp_scanner.l' at line 148")
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
			    0,   32,   12,   35,   13,   15,   16,   17,   14,   18,
			   19,   19,   19,   19,   19,   19,   19,   19,   19,   19,
			   20,   14,   27,   42,   43,   44,   28,   29,   45,   30,
			   51,   33,   33,   31,   71,   52,   10,   10,   10,   10,
			   11,   11,   11,   11,   21,   21,   21,   21,   23,   23,
			   23,   23,   25,   25,   25,   25,   37,   37,   37,   37,
			   39,   39,   39,   39,   27,   27,   27,   70,   69,   68,
			   67,   66,   65,   64,   63,   62,   61,   60,   59,   58,
			   57,   56,   55,   54,   53,   50,   49,   48,   40,   38,
			   47,   46,   41,   26,   40,   38,   36,   34,   32,   26,

			   72,   24,   24,   22,   22,    9,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72, yy_Dummy>>)
		end

	yy_chk_template: SPECIAL [INTEGER]
			-- Template for `yy_chk'
		once
			Result := yy_fixed_array (<<
			    0,   32,    2,   79,    2,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,    3,   13,   29,   29,   30,   13,   13,   30,   13,
			   44,   78,   78,   13,   70,   44,   73,   73,   73,   73,
			   74,   74,   74,   74,   75,   75,   75,   75,   76,   76,
			   76,   76,   77,   77,   77,   77,   80,   80,   80,   80,
			   81,   81,   81,   81,   82,   82,   82,   66,   65,   62,
			   61,   60,   59,   58,   57,   55,   54,   53,   52,   51,
			   50,   49,   48,   46,   45,   43,   42,   41,   39,   37,
			   33,   31,   28,   25,   23,   21,   20,   18,   15,   11,

			    9,    8,    7,    6,    5,   72,   72,   72,   72,   72,
			   72,   72,   72,   72,   72,   72,   72,   72,   72,   72,
			   72,   72,   72, yy_Dummy>>)
		end

	yy_base_template: SPECIAL [INTEGER]
			-- Template for `yy_base'
		once
			Result := yy_fixed_array (<<
			    0,    0,    0,    4,    0,  102,  101,  100,   99,  100,
			  105,   97,  105,   18,  105,   97,  105,    0,   92,    0,
			   80,   93,  105,   92,  105,   91,  105,    0,   83,   11,
			   15,   78,    0,   87,  105,    0,  105,   87,  105,   86,
			  105,   77,   72,   77,   22,   77,   75,  105,   71,   72,
			   69,   70,   70,   65,   67,   62,  105,   64,   63,   63,
			   56,   60,   60,  105,  105,   58,   59,  105,  105,  105,
			   25,  105,  105,   35,   39,   43,   47,   51,   28,    0,
			   55,   59,   62, yy_Dummy>>)
		end

	yy_def_template: SPECIAL [INTEGER]
			-- Template for `yy_def'
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

	yy_ec_template: SPECIAL [INTEGER]
			-- Template for `yy_ec'
		local
			an_array: ARRAY [INTEGER]
		once
			create an_array.make_filled (0, 0, 257)
			yy_ec_template_1 (an_array)
			an_array.area.fill_with (17, 125, 257)
			Result := yy_fixed_array (an_array)
		end

	yy_ec_template_1 (an_array: ARRAY [INTEGER])
			-- Fill chunk #1 of template for `yy_ec'.
		do
			yy_array_subcopy (an_array, <<
			    0,   17,   17,   17,   17,   17,   17,   17,   17,    1,
			    2,   17,   17,    1,   17,   17,   17,   17,   17,   17,
			   17,   17,   17,   17,   17,   17,   17,   17,   17,   17,
			   17,   17,    1,   17,    3,    4,   17,   17,    5,   17,
			   17,   17,   17,   17,   17,    6,    6,   17,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,   17,   17,
			   17,   17,   17,   17,   17,    6,    6,    7,    8,    9,
			   10,    6,    6,   11,    6,    6,   12,    6,   13,    6,
			    6,    6,    6,   14,    6,   15,    6,    6,    6,    6,
			    6,   17,   17,   17,   17,    6,   17,    6,    6,    7,

			    8,    9,   10,    6,    6,   11,    6,    6,   12,    6,
			   13,    6,    6,    6,    6,   14,    6,   15,    6,    6,
			    6,    6,    6,   17,   16, yy_Dummy>>,
			1, 125, 0)
		end

	yy_meta_template: SPECIAL [INTEGER]
			-- Template for `yy_meta'
		once
			Result := yy_fixed_array (<<
			    0,    4,    1,    2,    4,    4,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    4,    4, yy_Dummy>>)
		end

	yy_accept_template: SPECIAL [INTEGER]
			-- Template for `yy_accept'
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

	yyJam_base: INTEGER = 105
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER = 72
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER = 73
			-- Mark between normal states and templates

	yyNull_equiv_class: INTEGER = 17
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

	yyNb_rules: INTEGER = 25
			-- Number of rules

	yyEnd_of_buffer: INTEGER = 26
			-- End of buffer rule code

	yyLine_used: BOOLEAN = false
			-- Are line and column numbers used?

	yyPosition_used: BOOLEAN = false
			-- Is `position' used?

	INITIAL: INTEGER = 0
	S_PREPROC: INTEGER = 1
	S_READLINE: INTEGER = 2
	S_SKIP_EOL: INTEGER = 3
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make
			-- Create a new scanner.
		do
			make_with_buffer (Empty_buffer)
			output_file := std.output
			line_nb := 1
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
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

	empty_lines: BOOLEAN
			-- Should empty lines be generated when lines are
			-- ignored in order to preserve line numbering?

feature -- Status setting

	set_empty_lines (b: BOOLEAN)
			-- Set `empty_lines' to `b'.
		do
			empty_lines := b
		ensure
			empty_lines_set: empty_lines = b
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
				if attached {YY_FILE_BUFFER} l_old_buffer as l_file_buffer then
					a_file := l_file_buffer.file
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

	set_output_file (a_file: like output_file)
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

	output (a_text: like text)
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
