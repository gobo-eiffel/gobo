indexing

	description:

		"Skeletons of scanners implemented with tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_SCANNER_SKELETON

inherit

	YY_SCANNER
		redefine
			make_with_buffer, set_input_buffer,
			flush_input_buffer
		end

	KL_SHARED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	make_with_buffer (a_buffer: like input_buffer) is
			-- Create a new scanner with
			-- `a_buffer' as input buffer.
		do
			yy_initialize
			output_file := std.output
			input_buffer := a_buffer
			yy_load_input_buffer
		end

	yy_initialize is
			-- Initialize lexical analyzer.
		do
			yy_build_tables
			yy_start_state := 1
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input source.
			-- (This routine can be called in `wrap' before scanning
			-- another input buffer.)
		do
			yy_start_state := 1
			yy_more_flag := False
				-- Backing-up information.
			yy_last_accepting_state := 0
			yy_last_accepting_cpos := 0
		end

feature -- Access

	text: STRING is
			-- Text of last token read
			-- (Create a new string at each call.)
		do
			if yy_start_position < yy_position then
				Result :=
					yy_content.substring (yy_start_position, yy_position - 1)
			else
				!! Result.make (0)
			end
		end

	text_count: INTEGER is
			-- Length of last token read
		do
			Result := yy_position - yy_start_position
		end

	text_item (i: INTEGER): CHARACTER is
			-- `i'-th character of last token read
		do
			Result := yy_content.item (yy_start_position + i - 1)
		end

	text_substring (s, e: INTEGER): STRING is
			-- Substring of last token read
			-- (Create a new string at each call.)
		do
			if e < s then
				!! Result.make (0)
			else
				Result := yy_content.substring
					(yy_start_position + s - 1, yy_start_position + e - 1)
			end
		end

	start_condition: INTEGER is
			-- Start condition
		do
			Result := (yy_start_state - 1) // 2
		end

feature -- Setting

	set_start_condition (a_start_condition: INTEGER) is
			-- Set `start_condition' to `a_start_condition'.
		do
			yy_start_state := 2 * a_start_condition + 1
		end

feature -- Element change

	more is
			-- Tell scanner to append the next matched token
			-- to current value of `text' instead of 
			-- replacing it.
		do
			yy_more_flag := True
		end

	less (n: INTEGER) is
			-- Return all but the first `n' matched
			-- characters back to `input_buffer'.
		do
			yy_position := yy_start_position + n
		end

	unread_character (c: CHARACTER) is
			-- Put `c' back to `input_buffer'. This will alter both
			-- `text' and the content of `input_buffer'.
		local
			yy_i, yy_j: INTEGER
			yy_count, yy_capacity: INTEGER
			yy_buff: STRING
		do
			if yy_position < 2 then
					-- Need to shift characters up to make room.
				yy_capacity := input_buffer.capacity
				yy_count := input_buffer.count
				if yy_count < yy_capacity then
					yy_buff := yy_content
						-- + 2 for EOB characters.
					yy_j := yy_capacity + 2
					from yy_i := yy_count + 2 until yy_i < 1 loop
						yy_buff.put (yy_buff.item (yy_i), yy_j)
						yy_j := yy_j - 1
						yy_i := yy_i - 1
					end
					yy_position := yy_position + yy_j - yy_i - 1
					input_buffer.set_count (yy_capacity)
				else
					fatal_error ("scanner push-back overflow")
				end
			else
				yy_position := yy_position - 1
			end
			yy_content.put (c, yy_position)
				-- Alter `yy_start_position' to keep `text_count' meaningful.
			yy_start_position := yy_position
		end

	read_character is
			-- Read a character from `input_buffer'.
			-- Make result available in `last_character'.
		local
			yy_found: BOOLEAN
		do
			if yy_content.item (yy_position) = yyEnd_of_buffer_character then
					-- `yy_position' now points to the character we want
					-- to return. If this occurs before the EOB characters,
					-- then it's a valid NULL; if not, then we've hit the
					-- end of the buffer.
				if yy_position > input_buffer.count then
						-- EOB has been reached. Need more input.
					yy_start_position := yy_position
					yy_refill_input_buffer
					if not input_buffer.filled then
							-- The EOF has been reached.
						if wrap then
								-- EOF character.
							last_character := yyEnd_of_file_character
						else
								-- A new input buffer should have been set.
								-- Read character from it.
							read_character
						end
						yy_found := True
					end
				end
			end
			if not yy_found then
				last_character := yy_content.item (yy_position)
				yy_position := yy_position + 1
				input_buffer.set_beginning_of_line
					(last_character = yyNew_line_character)
			end
		end

feature -- Input

	set_input_buffer (a_buffer: like input_buffer) is
			-- Set `input_buffer' to `a_buffer'.
		do
			if a_buffer /= input_buffer then
					-- Flush out information for old buffer.
				input_buffer.set_position (yy_position)
				input_buffer := a_buffer
				yy_load_input_buffer
			end
		end

	flush_input_buffer is
			-- Flush `input_buffer'. `input_buffer' will be automatically
			-- refilled unless end of file has been found.
		do
			input_buffer.flush
			yy_load_input_buffer
		end

feature {NONE} -- Tables

	yy_ec: ARRAY [INTEGER]
			-- Equivalence classes;
			-- Void if equivalence classes are not used

	yy_accept: ARRAY [INTEGER]
			-- Accepting ids indexed by state ids

feature {NONE} -- Implementation

	yy_load_input_buffer is
			-- Take `input_buffer' state into account.
		do
			yy_position := input_buffer.position
			yy_start_position := yy_position
			yy_content := input_buffer.content
		ensure
			yy_content_set: yy_content = input_buffer.content
			yy_start_position_set: yy_start_position = input_buffer.position
			yy_position_set: yy_position = input_buffer.position
		end

	yy_refill_input_buffer is
			-- Refill `input_fill'.
			-- Update `yy_start_position' and `yy_position'.
		local
			yy_new_position: INTEGER
		do
			if yy_position > input_buffer.count + 2 then
				fatal_error
					("fatal scanner internal error: end of buffer missed")
			else
				input_buffer.set_position (yy_start_position)
				input_buffer.fill
				yy_new_position := input_buffer.position
				yy_position := yy_position - yy_start_position + yy_new_position
				yy_start_position := yy_new_position
			end
		end

	yy_build_tables is
			-- Build scanner tables.
		deferred
		ensure
			yy_accept_not_void: yy_accept /= Void
		end

	yy_execute_action (yy_act: INTEGER) is
			-- Execute semantic action.
		deferred
		end

	yy_execute_eof_action (yy_sc: INTEGER) is
			-- Execute EOF semantic action.
		deferred
		end

	yy_at_beginning_of_line: INTEGER is
			-- 1 if the next token scanned from the current input
			-- buffer will have '^' rules active, 0 otherwise
		do
			if input_buffer.beginning_of_line then
				Result := 1
			end
		end

	yy_set_beginning_of_line is
			-- Set `yy_at_beginning_of_line' according
			-- to the current position in input source.
		do
			if yy_position > yy_start_position then
				input_buffer.set_beginning_of_line
					(yy_content.item (yy_position - 1) = '%N')
			end
		end

	yy_previous_state: INTEGER is
			-- State just before EOB character was reached
		deferred
		end

	yy_null_trans_state (yy_current_state: INTEGER): INTEGER is
			-- State reachable from `yy_current_state' through
			-- a transition on NULL character; 0 if jammed
		deferred
		end

	yy_start_state: INTEGER
			-- Start state

	yy_content: STRING
			-- Characters in `input_buffer'

	yy_position: INTEGER
			-- Current position in `yy_content'

	yy_start_position: INTEGER
			-- Start position of the current token in `yy_content'

	yy_more_flag: BOOLEAN
	yy_more_len: INTEGER
			-- `more' information

	yy_last_accepting_state: INTEGER
	yy_last_accepting_cpos: INTEGER
			-- Definition for backing up

feature {NONE} -- Constants

	yyBuffer_capacity: INTEGER is 16384
			-- Capacity of default input buffer

	yyEnd_of_buffer_character: CHARACTER is '%U'
			-- End of buffer character

	yyEnd_of_file_character: CHARACTER is '%/255/'
			-- End of file character

	yyNew_line_character: CHARACTER is '%N'
			-- New line character

	yyEnd_of_buffer: INTEGER is deferred end
			-- End of buffer rule code

	yyBacking_up: BOOLEAN is deferred end
			-- Does current scanner back up?
			-- (i.e. does it have non-accepting states)

	yyNull_equiv_class: INTEGER is deferred end
			-- Equivalence code for NULL character

invariant

	yy_accept_not_void: yy_accept /= Void
	yy_content_not_void: yy_content /= Void

end -- class YY_SCANNER_SKELETON
