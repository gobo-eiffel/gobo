indexing

	description:

		"Skeletons of scanners implemented with tables"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1999, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_SCANNER_SKELETON

inherit

	YY_SCANNER
		redefine
			append_text_to_string, append_text_substring_to_string,
			make_with_buffer, set_input_buffer,
			flush_input_buffer
		end

	KL_IMPORTED_STRING_BUFFER_ROUTINES
	KL_IMPORTED_FIXED_ARRAY_ROUTINES
	KL_IMPORTED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	make_with_buffer (a_buffer: like input_buffer) is
			-- Create a new scanner with
			-- `a_buffer' as input buffer.
		do
			input_buffer := a_buffer
			yy_initialize
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
				Result := STRING_BUFFER_.substring (yy_content,
					yy_start_position, yy_position - 1)
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
			-- (For efficiency reason, this function bypasses the
			-- call to `text' and creates the substring directly
			-- from the input buffer.)
		do
			if e < s then
				!! Result.make (0)
			else
				Result := STRING_BUFFER_.substring (yy_content,
					yy_start_position + s - 1, yy_start_position + e - 1)
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

	append_text_to_string (a_string: STRING) is
			-- Append `text' at end of `a_string'.
			-- (For efficiency reason, this feature bypasses the
			-- call to `text' and directly copies the characters
			-- from the input buffer.)
		do
			if yy_start_position < yy_position then
				STRING_BUFFER_.append_substring_to_string (yy_content,
					yy_start_position, yy_position - 1, a_string)
			end
		end

	append_text_substring_to_string (s, e: INTEGER; a_string: STRING) is
			-- Append `text_substring' at end of `a_string'.
			-- (For efficiency reason, this feature bypasses
			-- the call to `text_substring' and directly copies
			-- the characters from the input buffer.)
		do
			if s <= e then
				STRING_BUFFER_.append_substring_to_string (yy_content,
					yy_start_position + s - 1, yy_start_position + e - 1, a_string)
			end
		end

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
		do
			if yy_position <= input_buffer.lower then
					-- Need to shift characters up to make room.
				input_buffer.set_position (yy_position)
				input_buffer.compact_right
					-- `input_buffer.content' may have been resized.
					-- Therefore `content' has to be queried again.
				yy_set_content (input_buffer.content)
				yy_position := input_buffer.position - 1
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
			found: BOOLEAN
		do
			if yy_content.item (yy_position) = yyEnd_of_buffer_character then
					-- `yy_position' now points to the character we want
					-- to return. If this occurs before the EOB characters,
					-- then it's a valid NULL; if not, then we've hit the
					-- end of the buffer.
				if yy_position > input_buffer.upper then
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
						found := True
					end
				end
			end
			if not found then
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

feature {NONE} -- Implementation

	yy_load_input_buffer is
			-- Take `input_buffer' state into account.
		do
			yy_set_content (input_buffer.content)
			yy_position := input_buffer.position
			yy_start_position := yy_position
		ensure
			yy_content_set: yy_content = input_buffer.content
			yy_start_position_set: yy_start_position = input_buffer.position
			yy_position_set: yy_position = input_buffer.position
		end

	yy_refill_input_buffer is
			-- Refill `input_buffer'.
			-- Update `yy_start_position' and `yy_position'.
		require
			end_of_buffer_not_missed: yy_position <= (input_buffer.upper + 2)
		local
			yy_new_position: INTEGER
		do
			input_buffer.set_position (yy_start_position)
			input_buffer.fill
				-- `input_buffer.content' may have been resized.
				-- Therefore `content' has to be queried again.
			yy_set_content (input_buffer.content)
			yy_new_position := input_buffer.position
			yy_position := yy_position - yy_start_position + yy_new_position
			yy_start_position := yy_new_position
		end

	yy_set_content (a_content: like yy_content) is
			-- Set `yy_content' to `a_content'.
		require
			a_content_not_void: a_content /= Void
		do
			yy_content := a_content
		ensure
			yy_content_set: yy_content = a_content
		end

	yy_build_tables is
			-- Build scanner tables.
		deferred
		end

	yy_fixed_array (an_array: ARRAY [INTEGER]): like FIXED_INTEGER_ARRAY_TYPE is
			-- Zero-based array containing items of `an_array'
		require
			an_array_not_void: an_array /= Void
		do
			Result := FIXED_INTEGER_ARRAY_.to_fixed_array (an_array)
		ensure
			array_not_void: Result /= Void
			count_set: Result.count = an_array.count
--			same_items: forall i in 0 .. (an_array.count - 1),
--				Result.item (i) = an_array.item (an_array.lower + i)
		end

	yy_array_subcopy (an_array, other: ARRAY [INTEGER]; start_pos, end_pos, index_pos: INTEGER) is
			-- Copy items of `other' within bounds `start_pos' and `end_pos'
			-- to `an_array' starting at index `index_pos'.
		require
			an_array_not_void: an_array /= Void
			other_not_void: other /= Void
			not_same: an_array /= other
			start_pos_large_enough: start_pos >= other.lower
			end_pos_small_enough: end_pos <= other.upper
			valid_bounds: start_pos <= end_pos + 1
			index_pos_large_enough: index_pos >= an_array.lower
			enough_space: (an_array.upper - index_pos) >= (end_pos - start_pos)
		do
			INTEGER_ARRAY_.subcopy (an_array, other, start_pos, end_pos, index_pos)
		ensure
			-- copied: forall i in 0 .. (end_pos - start_pos),
			--     an_array.item (index_pos + i) = other.item (start_pos + i)
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

	yy_content: like STRING_BUFFER_TYPE
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

	yy_content_not_void: yy_content /= Void

end -- class YY_SCANNER_SKELETON
