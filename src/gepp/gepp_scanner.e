indexing

	description:

		"Scanners for 'gepp' preprocessors"

	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class GEPP_SCANNER

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	GEPP_TOKENS
		export
			{NONE} all
		end


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
--|#line 41
set_start_condition (S_PREPROC)
when 2, 3 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 42

						if not ignored then
							echo
						end
						line_nb := line_nb + 1
					
when 4 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 49

						if not ignored then
							echo
						end
					
when 5 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 57
-- Separator.
when 6 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 58
-- Comment.
when 7 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 59
last_token := P_IFDEF
when 8 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 60
last_token := P_IFNDEF
when 9 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 61
last_token := P_ELSE
when 10 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 62
last_token := P_ENDIF
when 11 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 63
last_token := P_INCLUDE
when 12 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 64
last_token := P_DEFINE
when 13 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 65
last_token := P_UNDEF
when 14 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 66

						last_token := P_NAME
						last_value := text
					
when 15 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 70
last_token := P_AND
when 16 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 71
last_token := P_OR
when 17 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 72

						last_token := P_EOL
						line_nb := line_nb + 1
						set_start_condition (INITIAL)
					
when 18 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 77
last_token := text_item (1).code
when 19 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 80
last_token := text_item (1).code
when 20 then
	if yy_position > yy_start_position then
		input_buffer.set_beginning_of_line (yy_content.item (yy_position - 1) = '%N')
	end
--|#line 82
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
			    0,   58,   58,    8,    9,   10,   11,   12,   13,   14,
			   15,   15,   16,   17,   15,   18,   15,   15,   15,   19,
			   20,   28,   29,   30,   37,   24,   31,   24,   26,   38,
			    6,    6,    6,    7,    7,    7,   21,   21,   21,   57,
			   56,   55,   54,   53,   52,   51,   50,   49,   48,   47,
			   46,   45,   44,   43,   42,   41,   40,   39,   36,   35,
			   34,   23,   22,   33,   32,   27,   25,   23,   22,   58,
			    5,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58>>, 0)
		end

	yy_chk_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    0,    2,    2,    3,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    3,    3,    3,    3,
			    3,   17,   17,   18,   30,   62,   18,   62,   63,   30,
			   59,   59,   59,   60,   60,   60,   61,   61,   61,   56,
			   52,   51,   48,   47,   46,   45,   44,   43,   41,   40,
			   39,   38,   37,   36,   35,   34,   32,   31,   29,   28,
			   27,   23,   21,   20,   19,   16,   14,   11,    7,    5,
			   58,   58,   58,   58,   58,   58,   58,   58,   58,   58,
			   58,   58,   58,   58,   58,   58,   58>>, 0)
		end

	yy_base_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    0,    4,    0,   69,   70,   65,   70,   70,
			   70,   65,   70,    0,   61,    0,   56,    9,   13,   51,
			   47,   59,   70,   59,    0,   70,    0,   50,   45,   50,
			   16,   50,   48,   70,   44,   45,   42,   43,   43,   38,
			   40,   35,    0,   37,   36,   36,   29,   33,   33,    0,
			    0,   31,   32,    0,    0,    0,   30,    0,   70,   29,
			   32,   35,   24,   25>>, 0)
		end

	yy_def_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,   59,   60,   58,    3,   58,   58,   61,   58,   58,
			   58,   58,   58,   62,   58,   63,   63,   63,   63,   63,
			   58,   61,   58,   58,   62,   58,   63,   63,   63,   63,
			   63,   63,   63,   58,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,   63,   63,
			   63,   63,   63,   63,   63,   63,   63,   63,    0,   58,
			   58,   58,   58,   58>>, 0)
		end

	yy_ec_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    1,    1,    1,    1,    1,    1,    1,    1,    2,
			    3,    1,    1,    2,    1,    1,    1,    1,    1,    1,
			    1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
			    1,    1,    2,    1,    1,    4,    1,    1,    5,    1,
			    1,    1,    1,    1,    1,    6,    6,    1,    6,    6,
			    6,    6,    6,    6,    6,    6,    6,    6,    1,    1,
			    1,    1,    1,    1,    1,    6,    6,    7,    8,    9,
			   10,    6,    6,   11,    6,    6,   12,    6,   13,    6,
			    6,    6,    6,   14,    6,   15,    6,    6,    6,    6,
			    6,    1,    1,    1,    1,    6,    1,    6,    6,    7,

			    8,    9,   10,    6,    6,   11,    6,    6,   12,    6,
			   13,    6,    6,    6,    6,   14,    6,   15,    6,    6,
			    6,    6,    6,    1,   16,    1,    1,    1,    1,    1,
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
			    0,    1,    1,    2,    1,    1,    3,    3,    3,    3,
			    3,    3,    3,    3,    3,    3,    1>>, 0)
		end

	yy_accept_: ARRAY [INTEGER] is
		once
			!YY_ARRAY [INTEGER]! Result.make_from_array (<<
			    0,    0,    0,    0,    0,   21,   19,    4,    3,    1,
			   18,    5,   17,    6,   18,   14,   14,   14,   14,   14,
			   18,    4,    2,    5,    6,   15,   14,   14,   14,   14,
			   14,   14,   14,   16,   14,   14,   14,   14,   14,   14,
			   14,   14,    9,   14,   14,   14,   14,   14,   14,   10,
			    7,   14,   14,   13,   12,    8,   14,   11,    0>>, 0)
		end

feature {NONE} -- Constants

	yyJam_base: INTEGER is 70
			-- Position in `yy_nxt'/`yy_chk' tables
			-- where default jam table starts

	yyJam_state: INTEGER is 58
			-- State id corresponding to jam state

	yyTemplate_mark: INTEGER is 59
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

	yyEnd_of_buffer: INTEGER is 21
			-- End of buffer rule code

	INITIAL: INTEGER is 0
	S_PREPROC: INTEGER is 1
			-- Start condition codes

feature -- User-defined features



feature {NONE} -- Initialization

	make is
			-- Create a new scanner.
		do
			make_compressed_scanner_skeleton
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

feature -- Status report

	ignored: BOOLEAN is
			-- Is current line ignored?
		deferred
		end

end -- class GEPP_SCANNER
