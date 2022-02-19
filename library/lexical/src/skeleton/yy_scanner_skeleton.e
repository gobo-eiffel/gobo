note

	description:

		"Skeletons of scanners implemented with tables"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_SCANNER_SKELETON

inherit

	YY_SCANNER
		redefine
			append_text_to_string,
			append_unicode_text_to_string,
			append_utf8_text_to_string,
			append_text_substring_to_string,
			append_unicode_text_substring_to_string,
			append_utf8_text_substring_to_string,
			make_with_buffer,
			set_input_buffer,
			flush_input_buffer
		end

	KL_IMPORTED_SPECIAL_ROUTINES

	KL_IMPORTED_STRING_ROUTINES

	KL_IMPORTED_ARRAY_ROUTINES

feature {NONE} -- Initialization

	make_with_buffer (a_buffer: like input_buffer)
			-- Create a new scanner with
			-- `a_buffer' as input buffer.
		do
			yy_pushed_start_conditions := SPECIAL_INTEGER_.make (yyInitial_pushed_start_conditions_capacity)
			input_buffer := a_buffer
			yy_initialize
			yy_load_input_buffer
		end

	yy_initialize
			-- Initialize lexical analyzer.
		do
			yy_build_tables
			yy_start_state := 1
			yy_line := 1
			yy_column := 1
			yy_position := 1
			yy_start := 1
			yy_end := 1
			line := 1
			column := 1
			position := 1
		end

feature -- Initialization

	reset
			-- Reset scanner before scanning next input source.
			-- (This routine can be called in `wrap' before scanning
			-- another input buffer.)
		do
			pushed_start_condition_count := 0
			yy_start_state := 1
			yy_line := 1
			yy_column := 1
			yy_position := 1
			yy_start := 1
			yy_end := 1
			line := 1
			column := 1
			position := 1
			yy_more_flag := False
			yy_more_len := 0
				-- Backing-up information.
			yy_last_accepting_state := 0
			yy_last_accepting_cpos := 0
		end

 	reset_start_condition
			-- Clear pushed start conditions and set `start_condition'
			-- to the "INITIAL" start condition.
		do
			pushed_start_condition_count := 0
			yy_start_state := 1
		end

feature -- Access

	text: STRING_8
			-- Text of last token read
			-- (Create a new string at each call.)
			--
			-- Note that if `input_buffer' contains Unicode characters
			-- which cannot be represented as 8-bit characters, they
			-- will be replaced by a replacement character specified
			-- in the buffer.
		do
			if yy_start < yy_end then
				Result := yy_content.substring (yy_start, yy_end - 1)
			else
				create Result.make (0)
			end
		end

	unicode_text: STRING_32
			-- Unicode text of last token read
			-- (Create a new string at each call.)
			--
			-- Note that `unicode_text' does not contain surrogate
			-- or invalid Unicode characters.
		do
			if yy_start < yy_end then
				Result := yy_content.unicode_substring (yy_start, yy_end - 1)
			else
				create Result.make (0)
			end
		end

	utf8_text: STRING_8
			-- UTF-8 representation of last token read
			-- (Create a new string at each call.)
			--
			-- Note that `unicode_text' does not contain surrogate
			-- or invalid Unicode characters, therefore the resulting
			-- string is valid UTF-8.
		do
			if yy_start < yy_end then
				Result := yy_content.utf8_substring (yy_start, yy_end - 1)
			else
				create Result.make (0)
			end
		end

	text_item (i: INTEGER): CHARACTER_8
			-- `i'-th character of last token read
		local
			l_content_area: like yy_content_area
		do
			l_content_area := yy_content_area
			if l_content_area /= Void then
				Result := l_content_area.item (yy_start + i - 1)
			else
				Result := yy_content.item (yy_start + i - 1)
			end
		end

	unicode_text_item (i: INTEGER): CHARACTER_32
			-- `i'-th Unicode character of last token read
			--
			-- Note that `unicode_text' does not contain surrogate
			-- or invalid Unicode characters.
		local
			l_content_area: like yy_unicode_content_area
		do
			l_content_area := yy_unicode_content_area
			if l_content_area /= Void then
				Result := l_content_area.item (yy_start + i - 1)
			else
				Result := yy_content.unicode_item (yy_start + i - 1)
			end
		end

	text_substring (s, e: INTEGER): STRING_8
			-- Substring of last token read
			-- (Create a new string at each call.)
			-- (For efficiency reason, this function bypasses the
			-- call to `text' and creates the substring directly
			-- from the input buffer.)
		do
			if e < s then
				create Result.make (0)
			else
				Result := yy_content.substring (yy_start + s - 1, yy_start + e - 1)
			end
		end

	unicode_text_substring (s, e: INTEGER): STRING_32
			-- Unicode substring of last token read
			-- (Create a new string at each call.)
			-- (For efficiency reason, this function can bypass the
			-- call to `unicode_text' and create the substring directly from
			-- the input buffer.)
			--
			-- Note that `unicode_text' does not contain surrogate
			-- or invalid Unicode characters.
		do
			if e < s then
				create Result.make (0)
			else
				Result := yy_content.unicode_substring (yy_start + s - 1, yy_start + e - 1)
			end
		end

	utf8_text_substring (s, e: INTEGER): STRING_8
			-- UTF-8 representation of substring of last token read
			-- (Create a new string at each call.)
			-- (For efficiency reason, this function can bypass the
			-- call to `unicode_text' and create the substring directly from
			-- the input buffer.)
			--
			-- Note that `unicode_text' does not contain surrogate
			-- or invalid Unicode characters, the the resulting
			-- string is valid UTF-8.
		do
			if e < s then
				create Result.make (0)
			else
				Result := yy_content.utf8_substring (yy_start + s - 1, yy_start + e - 1)
			end
		end

	start_condition: INTEGER
			-- Start condition
		do
			Result := (yy_start_state - 1) // 2
		ensure then
			definition: Result = (yy_start_state - 1) // 2
		end

feature -- Measurement

	text_count: INTEGER
			-- Number of characters in last token read
		do
			Result := yy_end - yy_start
		end

	line: INTEGER
			-- Line number of last token read when
			-- '%option line' has been specified

	column: INTEGER
			-- Column number of last token read when
			-- '%option line' has been specified

	position: INTEGER
			-- Position of last token read (i.e. number of
			-- characters from the start of the input source)
			-- when '%option position' has been specified

	pushed_start_condition_count: INTEGER
			-- Number of start conditions already pushed (and not popped yet)

feature -- Setting

	set_start_condition (a_start_condition: INTEGER)
			-- Set `start_condition' to `a_start_condition'.
		do
			yy_start_state := 2 * a_start_condition + 1
		end

	push_start_condition (a_start_condition: INTEGER)
			-- Set start condition and add previous to stack.
		do
			if pushed_start_condition_count >= yy_pushed_start_conditions.capacity then
				yy_pushed_start_conditions := SPECIAL_INTEGER_.aliased_resized_area (yy_pushed_start_conditions, pushed_start_condition_count + yyInitial_pushed_start_conditions_capacity)
			end
			SPECIAL_INTEGER_.force (yy_pushed_start_conditions, start_condition, pushed_start_condition_count)
			pushed_start_condition_count := pushed_start_condition_count + 1
			set_start_condition (a_start_condition)
		end

	pop_start_condition
			-- Restore previous start condition.
		do
			pushed_start_condition_count := pushed_start_condition_count - 1
			set_start_condition (yy_pushed_start_conditions.item (pushed_start_condition_count))
		end

feature -- Element change

	append_text_to_string (a_string: STRING_8)
			-- Append `text' at end of `a_string'.
			-- (For efficiency reason, this feature bypasses the
			-- call to `text' and directly copies the characters
			-- from the input buffer.)
		do
			if yy_start < yy_end then
				yy_content.append_substring_to_string (yy_start, yy_end - 1, a_string)
			end
		end

	append_unicode_text_to_string (a_string: STRING_32)
			-- Append `unicode_text' at end of `a_string'.
			-- (For efficiency reason, this feature can bypass the
			-- call to `unicode_text' and directly copy the characters from
			-- the input buffer.)
		do
			if yy_start < yy_end then
				yy_content.append_unicode_substring_to_string (yy_start, yy_end - 1, a_string)
			end
		end

	append_utf8_text_to_string (a_string: STRING_8)
			-- Append `utf8_text' at end of `a_string'.
			-- (For efficiency reason, this feature can bypass the
			-- call to `utf8_text' and directly copy the characters from
			-- the input buffer.)
		do
			if yy_start < yy_end then
				yy_content.append_utf8_substring_to_string (yy_start, yy_end - 1, a_string)
			end
		end

	append_text_substring_to_string (s, e: INTEGER; a_string: STRING_8)
			-- Append `text_substring' at end of `a_string'.
			-- (For efficiency reason, this feature bypasses
			-- the call to `text_substring' and directly copies
			-- the characters from the input buffer.)
		do
			if s <= e then
				yy_content.append_substring_to_string (yy_start + s - 1, yy_start + e - 1, a_string)
			end
		end

	append_unicode_text_substring_to_string (s, e: INTEGER; a_string: STRING_32)
			-- Append `unicode_text_substring' at end of `a_string'.
			-- (For efficiency reason, this feature can bypass
			-- the call to `unicode_text_substring' and directly copy
			-- the characters from the input buffer.)
		do
			if s <= e then
				yy_content.append_unicode_substring_to_string (yy_start + s - 1, yy_start + e - 1, a_string)
			end
		end

	append_utf8_text_substring_to_string (s, e: INTEGER; a_string: STRING_8)
			-- Append `utf8_text_substring' at end of `a_string'.
			-- (For efficiency reason, this feature can bypass the
			-- call to `utf8_text' and directly copy the characters from
			-- the input buffer.)
		do
			if s <= e then
				yy_content.append_utf8_substring_to_string (yy_start + s - 1, yy_start + e - 1, a_string)
			end
		end

	more
			-- Tell scanner to append the next matched token
			-- to current value of `text' instead of
			-- replacing it.
		do
			yy_more_flag := True
		end

	less (n: INTEGER)
			-- Return all but the first `n' matched
			-- characters back to `input_buffer'.
		local
			removed: INTEGER
			new_yy_end: INTEGER
			old_yy_more_len: INTEGER
		do
			if yyLine_used then
				new_yy_end := yy_start + n
				removed := yy_end - new_yy_end
				yy_end := new_yy_end
				if removed < yy_column then
					yy_column := yy_column - removed
				else
						-- New-lines have been removed.
						-- We need to rescan the token.
					old_yy_more_len := yy_more_len
					yy_more_len := 0
					yy_line := line
					yy_column := column
					yy_set_line_column
					yy_more_len := old_yy_more_len
				end
			else
				yy_end := yy_start + n
			end
			yy_position := position + n
		end

	unread_character (c: CHARACTER_8)
			-- Put `c' back to `input_buffer'. This will alter both
			-- `text' and the content of `input_buffer'.
			-- The behavior is undefined if `c' is too large to fit into `input_buffer'.
		do
			if yy_end <= 1 then
					-- Need to shift characters up to make room.
				input_buffer.set_index (yy_end)
				input_buffer.compact_right
					-- `input_buffer.content' may have been resized.
					-- Therefore `content' has to be queried again.
				yy_set_content (input_buffer.content)
				yy_end := input_buffer.index - 1
			else
				yy_end := yy_end - 1
			end
			yy_content.put (c, yy_end)
				-- Alter `yy_start' to keep `text_count' meaningful.
			yy_start := yy_end
		end

	unread_unicode_character (c: CHARACTER_32)
			-- Put `c' back to `input_buffer'. This will alter both
			-- `text' and the content of `input_buffer'.
		do
			if yy_end <= 1 then
					-- Need to shift characters up to make room.
				input_buffer.set_index (yy_end)
				input_buffer.compact_right
					-- `input_buffer.content' may have been resized.
					-- Therefore `content' has to be queried again.
				yy_set_content (input_buffer.content)
				yy_end := input_buffer.index - 1
			else
				yy_end := yy_end - 1
			end
			if attached {KL_UNICODE_CHARACTER_BUFFER} yy_content as l_unicode_content then
				l_unicode_content.put_unicode (c, yy_end)
			elseif c.is_character_8 then
				yy_content.put (c.to_character_8, yy_end)
			else
				yy_content.put ('%/255/', yy_end)
			end
				-- Alter `yy_start' to keep `text_count' meaningful.
			yy_start := yy_end
		end

	read_character
			-- Read a character from `input_buffer'.
			-- Make result available in `last_character' and `last_unicode_character'.
			--
			-- Note that if `input_buffer' contains Unicode characters
			-- which cannot be represented as 8-bit characters, they
			-- will be replaced by a replacement character specified
			-- in the buffer.
		local
			found: BOOLEAN
			c: CHARACTER_32
			l_content_area: like yy_content_area
			l_unicode_content_area: like yy_unicode_content_area
		do
			l_content_area := yy_content_area
			l_unicode_content_area := yy_unicode_content_area
			if l_content_area /= Void then
				c := l_content_area.item (yy_end).to_character_32
			elseif l_unicode_content_area /= Void then
				c := l_unicode_content_area.item (yy_end)
			else
				c := yy_content.unicode_item (yy_end)
			end
			if c = yyEnd_of_buffer_unicode_character then
					-- `yy_end' now points to the character we want
					-- to return. If this occurs before the EOB characters,
					-- then it's a valid NULL; if not, then we've hit the
					-- end of the buffer.
				if yy_end > input_buffer.count then
						-- EOB has been reached. Need more input.
					yy_start := yy_end
					yy_refill_input_buffer
					if not input_buffer.filled then
							-- The EOF has been reached.
						if wrap then
								-- EOF character.
							last_character := yyEnd_of_file_character
							last_unicode_character := yyEnd_of_file_unicode_character
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
				l_content_area := yy_content_area
				l_unicode_content_area := yy_unicode_content_area
				if l_content_area /= Void then
					last_character := l_content_area.item (yy_end)
					last_unicode_character := last_character.to_character_32
				else
					if l_unicode_content_area /= Void then
						last_unicode_character := l_unicode_content_area.item (yy_end)
					else
						last_unicode_character := yy_content.unicode_item (yy_end)
					end
					if last_unicode_character.is_character_8 then
						last_character := last_unicode_character.to_character_8
					else
						last_character := yy_content.item (yy_end)
					end
				end
				yy_end := yy_end + 1
				yy_position := yy_position + 1
				if last_unicode_character = yyNew_line_unicode_character then
					yy_line := yy_line + 1
					yy_column := 1
					input_buffer.set_beginning_of_line (True)
				else
					yy_column := yy_column + 1
					input_buffer.set_beginning_of_line (False)
				end
			end
		end

feature -- Input

	set_input_buffer (a_buffer: like input_buffer)
			-- Set `input_buffer' to `a_buffer'.
		do
			if a_buffer /= input_buffer then
					-- Flush out information for old buffer.
				input_buffer.set_index (yy_end)
				input_buffer.set_position (yy_position, yy_line, yy_column)
				input_buffer := a_buffer
				yy_load_input_buffer
			end
		end

	flush_input_buffer
			-- Flush `input_buffer'. `input_buffer' will be automatically
			-- refilled unless end of file has been found.
		do
			input_buffer.flush
			yy_load_input_buffer
		end

feature -- Debugging

	print_last_token
			-- Print to standard error debug information
			-- about the last token read. Can be redefined
			-- in descendant classes to print more information.
			-- (Called at the end of `read_token' when compiled
			-- with 'debug ("GELEX")' enabled).
		do
			std.error.put_string ("Last token code: ")
			std.error.put_integer (last_token)
			std.error.put_character ('%N')
			if yyLine_used then
					-- Line and column numbers are used.
				std.error.put_string ("Last token line: ")
				std.error.put_integer (line)
				std.error.put_string ("%NLast token column: ")
				std.error.put_integer (column)
				std.error.put_character ('%N')
			end
			if yyPosition_used then
					-- Position number is used.
				std.error.put_string ("Last token position: ")
				std.error.put_integer (position)
				std.error.put_character ('%N')
			end
			std.error.put_string ("Last token text: ")
			inspect last_token
			when yyEOF_token then
				std.error.put_string ("EOF token%N")
			when yyError_token then
				std.error.put_string ("Error token%N")
			when yyUnknown_token then
					-- Should never happen.
				std.error.put_string ("Unknown token%N")
			else
				std.error.put_character ('%"')
				std.error.put_string (text)
				std.error.put_string ("%"%N")
			end
		end

feature {NONE} -- Implementation

	yy_load_input_buffer
			-- Take `input_buffer' state into account.
		do
			yy_set_content (input_buffer.content)
			yy_end := input_buffer.index
			yy_start := yy_end
			yy_line := input_buffer.line
			yy_column := input_buffer.column
			yy_position := input_buffer.position
		ensure
			yy_content_set: yy_content = input_buffer.content
			yy_start_set: yy_start = input_buffer.index
			yy_end_set: yy_end = input_buffer.index
			yy_line_set: yy_line = input_buffer.line
			yy_column_set: yy_column = input_buffer.column
			yy_position_set: yy_position = input_buffer.position
		end

	yy_refill_input_buffer
			-- Refill `input_buffer'.
			-- Update `yy_start' and `yy_end'.
		require
			end_of_buffer_not_missed: yy_end <= (input_buffer.count + 2)
		local
			yy_new_start: INTEGER
		do
			input_buffer.set_index (yy_start)
			input_buffer.fill
				-- `input_buffer.content' may have been resized.
				-- Therefore `content' has to be queried again.
			yy_set_content (input_buffer.content)
			yy_new_start := input_buffer.index
			yy_end := yy_end - yy_start + yy_new_start
			yy_start := yy_new_start
		end

	yy_set_content (a_content: like yy_content)
			-- Set `yy_content' to `a_content'.
		require
			a_content_not_void: a_content /= Void
		do
			yy_content := a_content
			yy_content_area := a_content.as_special
			yy_unicode_content_area := a_content.as_unicode_special
		ensure
			yy_content_set: yy_content = a_content
		end

	yy_build_tables
			-- Build scanner tables.
		deferred
		end

	yy_fixed_array (an_array: ARRAY [INTEGER]): SPECIAL [INTEGER]
			-- Zero-based array containing items of `an_array'
		require
			an_array_not_void: an_array /= Void
		do
			Result := SPECIAL_INTEGER_.to_special (an_array)
		ensure
			array_not_void: Result /= Void
			count_set: Result.count = an_array.count
--			same_items: forall i in 0 .. (an_array.count - 1), Result.item (i) = an_array.item (an_array.lower + i)
		end

	yy_array_subcopy (an_array: ARRAY [INTEGER]; other: ARRAY [INTEGER]; start_pos, end_pos, index_pos: INTEGER)
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
--			copied: forall i in 0 .. (end_pos - start_pos), an_array.item (index_pos + i) = other.item (start_pos + i)
		end

	yy_execute_action (yy_act: INTEGER)
			-- Execute semantic action.
		deferred
		end

	yy_execute_eof_action (yy_sc: INTEGER)
			-- Execute EOF semantic action.
		deferred
		end

	yy_at_beginning_of_line: INTEGER
			-- 1 if the next token scanned from the current input
			-- buffer will have '^' rules active, 0 otherwise
		do
			if input_buffer.beginning_of_line then
				Result := 1
			end
		end

	yy_set_beginning_of_line
			-- Set `yy_at_beginning_of_line' according
			-- to the current position in input source.
		do
			if yy_end > yy_start then
				if attached yy_content_area as l_content_area then
					input_buffer.set_beginning_of_line (l_content_area.item (yy_end - 1) = yyNew_line_character)
				elseif attached yy_unicode_content_area as l_content_area then
					input_buffer.set_beginning_of_line (l_content_area.item (yy_end - 1) = yyNew_line_unicode_character)
				else
					input_buffer.set_beginning_of_line (yy_content.item (yy_end - 1) = yyNew_line_character)
				end
			end
		end

	yy_set_line (a_column: INTEGER)
			-- Set `yy_line' and `yy_column' knowing that there
			-- are `a_column' characters in the last token
			-- after the last new-line or from the beginning
			-- of the token if it has no new-line character.
		require
			a_column_positive: a_column >= 0
		local
			i, nb: INTEGER
			a_line: INTEGER
			c: CHARACTER_32
			l_content_area: like yy_content_area
			l_unicode_content_area: like yy_unicode_content_area
		do
			l_content_area := yy_content_area
			l_unicode_content_area := yy_unicode_content_area
			from
				i := yy_end - a_column - 1
				nb := yy_start + yy_more_len
			until
				i < nb
			loop
				if l_content_area /= Void then
					c := l_content_area.item (i).to_character_32
				elseif l_unicode_content_area /= Void then
					c := l_unicode_content_area.item (i)
				else
					c := yy_content.unicode_item (i)
				end
				if c = yyNew_line_unicode_character then
					a_line := a_line + 1
				end
				i := i - 1
			end
			if a_line = 0 then
				yy_column := yy_column + yy_end - nb
			else
				yy_line := yy_line + a_line
				yy_column := a_column + 1
			end
		end

	yy_set_column (a_line: INTEGER)
			-- Set `yy_line' and `yy_column' knowing that there
			-- are `a_line' new-line characters in last token.
		require
			a_line_positive: a_line > 0
		local
			i, nb: INTEGER
			a_column: INTEGER
			c: CHARACTER_32
			l_content_area: like yy_content_area
			l_unicode_content_area: like yy_unicode_content_area
		do
			l_content_area := yy_content_area
			l_unicode_content_area := yy_unicode_content_area
			from
				i := yy_end - 1
				nb := yy_start + yy_more_len
			until
				i < nb
			loop
				if l_content_area /= Void then
					c := l_content_area.item (i).to_character_32
				elseif l_unicode_content_area /= Void then
					c := l_unicode_content_area.item (i)
				else
					c := yy_content.unicode_item (i)
				end
				if c /= yyNew_line_unicode_character then
					a_column := a_column + 1
					i := i - 1
				else
					yy_column := a_column + 1
						-- Jump out of the loop
					i := nb - 1
				end
			end
			yy_line := yy_line + a_line
		end

	yy_set_line_column
			-- Set `yy_line' and `yy_column'.
		local
			i, nb: INTEGER
			a_line, a_column: INTEGER
			new_line_found: BOOLEAN
			c: CHARACTER_32
			l_content_area: like yy_content_area
			l_unicode_content_area: like yy_unicode_content_area
		do
			l_content_area := yy_content_area
			l_unicode_content_area := yy_unicode_content_area
			from
				i := yy_end - 1
				nb := yy_start + yy_more_len
			until
				i < nb or new_line_found
			loop
				if l_content_area /= Void then
					c := l_content_area.item (i).to_character_32
				elseif l_unicode_content_area /= Void then
					c := l_unicode_content_area.item (i)
				else
					c := yy_content.unicode_item (i)
				end
				if c = yyNew_line_unicode_character then
					a_line := a_line + 1
					new_line_found := True
				else
					a_column := a_column + 1
				end
				i := i - 1
			end
			from
			until
				i < nb
			loop
				if l_content_area /= Void then
					c := l_content_area.item (i).to_character_32
				elseif l_unicode_content_area /= Void then
					c := l_unicode_content_area.item (i)
				else
					c := yy_content.unicode_item (i)
				end
				if c = yyNew_line_unicode_character then
					a_line := a_line + 1
				end
				i := i - 1
			end
			if new_line_found then
				yy_line := yy_line + a_line
				yy_column := a_column + 1
			else
				yy_column := yy_column + a_column
			end
		end

	yy_previous_state: INTEGER
			-- State just before EOB character was reached
		deferred
		end

	yy_null_trans_state (yy_current_state: INTEGER): INTEGER
			-- State reachable from `yy_current_state' through
			-- a transition on NULL character; 0 if jammed
		deferred
		end

	yy_start_state: INTEGER
			-- Start state

	yy_content: KI_CHARACTER_BUFFER
			-- Characters in `input_buffer'

	yy_content_area: detachable SPECIAL [CHARACTER_8]
			-- Characters in `input_buffer';
			-- More efficient than `yy_content' when not void;
			-- Characters are indexed starting at 1

	yy_unicode_content_area: detachable SPECIAL [CHARACTER_32]
			-- Unicode characters in `input_buffer';
			-- More efficient than `yy_content' when not void;
			-- Characters are indexed starting at 1

	yy_end: INTEGER
			-- Current index in `yy_content'

	yy_start: INTEGER
			-- Start index of current token in `yy_content'

	yy_line, yy_column: INTEGER
			-- Line and column numbers of next token to be read

	yy_position: INTEGER
			-- Position of next token to be read (i.e. number
			-- of characters from the start of the input source)

	yy_more_flag: BOOLEAN
			-- `more' information

	yy_more_len: INTEGER
			-- `more' information

	yy_last_accepting_state: INTEGER
			-- Definition for backing up

	yy_last_accepting_cpos: INTEGER
			-- Definition for backing up

	yy_pushed_start_conditions: SPECIAL [INTEGER]
			-- Start condition stack when using `push_start_condition' and `pop_start_condition'

feature {NONE} -- Constants

	yyInitial_pushed_start_conditions_capacity: INTEGER = 10
			-- Initial capavity for `yy_pushed_start_conditions'

	yyBuffer_capacity: INTEGER = 16384
			-- Capacity of default input buffer

	yyEnd_of_buffer_character: CHARACTER_8 = '%U'
			-- End of buffer character

	yyEnd_of_buffer_unicode_character: CHARACTER_32 = '%U'
			-- End of buffer character

	yyEnd_of_file_character: CHARACTER_8 = '%/255/'
			-- End of file character

	yyEnd_of_file_unicode_character: CHARACTER_32 = '%/255/'
			-- End of file character

	yyNew_line_character: CHARACTER_8 = '%N'
			-- New line character

	yyNew_line_unicode_character: CHARACTER_32 = '%N'
			-- New line character

	yyEnd_of_buffer: INTEGER
			-- End of buffer rule code
		deferred
		end

	yyBacking_up: BOOLEAN
			-- Does current scanner back up?
			-- (i.e. does it have non-accepting states)
		deferred
		end

	yyLine_used: BOOLEAN
			-- Are line and column numbers used?
		deferred
		end

	yyPosition_used: BOOLEAN
			-- Is `position' used?
		deferred
		end

	yyNull_equiv_class: INTEGER
			-- Equivalence code for NULL character
		deferred
		end

	yyMax_symbol_equiv_class: INTEGER
			-- All symbols greater than this symbol will have
			-- the same equivalence class as this symbol
		deferred
		end

	yy_Dummy: INTEGER = 2147483647
			-- To be inserted in manifest arrays
			-- in order to make SE 2.1b1 happy.

invariant

	yy_content_not_void: yy_content /= Void
	yy_line_positive: yy_line >= 1
	yy_column_positive: yy_column >= 1
	yy_position_positive: yy_position >= 1
	yy_pushed_start_conditions_not_void: yy_pushed_start_conditions /= Void

end
