indexing

	description:

		"Lexical analyzer input buffers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1999, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class YY_BUFFER

inherit

	KL_IMPORTED_STRING_BUFFER_ROUTINES

creation

	make, make_from_buffer

feature {NONE} -- Initialization

	make (str: STRING) is
			-- Create a new buffer with characters from `str'.
			-- Do not alter `str' during the scanning process.
		require
			str_not_void: str /= Void
		local
			buff: like content
			nb: INTEGER
		do
			nb := str.count + 2
			buff := STRING_BUFFER_.make (nb)
			STRING_BUFFER_.copy_from_string (buff, lower, str)
			nb := nb + (lower - 1)
			buff.put (End_of_buffer_character, nb - 1)
			buff.put (End_of_buffer_character, nb)
			make_from_buffer (buff)
		ensure
			capacity_set: capacity = str.count
			count_set: count = str.count
			beginning_of_line: beginning_of_line
		end

	make_from_buffer (buff: like content) is
			-- Create a new buffer using `buff'.
			-- `buff' might be altered during the scanning process.
			-- Use `make' if this behavior is not desired.
		require
			buff_not_void: buff /= Void
			valid_buff: buff.count >= 2 and then
				buff.item (buff.count + (lower - 1) - 1) = '%U' and
				buff.item (buff.count + (lower - 1)) = '%U'
		local
			l: INTEGER
		do
			l := lower
			capacity := buff.count - 2
			upper := capacity + (l - 1)
			content := buff
			position := l
			beginning_of_line := True
		ensure
			content_set: content = buff
			capacity_set: capacity = buff.count - 2
			count_set: count = buff.count - 2
			beginning_of_line: beginning_of_line
		end

feature -- Access

	content: like STRING_BUFFER_TYPE
			-- Input buffer characters

	count: INTEGER is
			-- Number of characters in buffer,
			-- not including EOB characters
		do
			Result := upper - lower + 1
		ensure
			definition: Result = upper - lower + 1
		end

	capacity: INTEGER
			-- Maximum number of characters in buffer,
			-- not including room for EOB characters

	position: INTEGER
			-- Current position in buffer

	lower: INTEGER is
			-- Lower value for `position'
		once
			Result := STRING_BUFFER_.lower
		end

	upper: INTEGER
			-- Upper value for `position', not
			-- including room for EOB characters

	beginning_of_line: BOOLEAN
			-- Is current position at the beginning of a line?

feature -- Setting

	set_position (pos: INTEGER) is
			-- Set `position' to `pos'.
		require
			pos_small_enough: pos <= upper + 2
			pos_large_enough: pos >= lower
		do
			position := pos
		ensure
			position_set: position = pos
		end

	set_beginning_of_line (b: BOOLEAN) is
			-- Set `beginning_of_line' to `b'.
		do
			beginning_of_line := b
		ensure
			beginning_of_line_set: beginning_of_line = b
		end

feature -- Status report

	filled: BOOLEAN
			-- Did the last call to `fill' add
			-- more characters to buffer?

	interactive: BOOLEAN
			-- Is the input source interactive?
			-- If so, we will have to read characters one by one.

feature -- Status setting

	set_interactive (b: BOOLEAN) is
			-- Set `interactive' to `b'.
		do
			interactive := b
		ensure
			interactive_set: interactive = b
		end

feature -- Element change

	fill is
			-- Fill buffer. Set `filled' to True if characters
			-- have been added to buffer.
		do
			filled := False
		end

	flush is
			-- Flush buffer.
		local
			l: INTEGER
		do
			l := lower
				-- We always need two end-of-file characters.
				-- The first causes a transition to the end-of-buffer
				-- state. The second causes a jam in that state.
			content.put (End_of_buffer_character, l)
			content.put (End_of_buffer_character, l + 1)
			upper := l - 1
			position := l
			beginning_of_line := True
			filled := True
		ensure
			flushed: count = 0
			beginning_of_line: beginning_of_line
		end

	compact_left is
			-- Move unconsumed characters to the start of buffer
			-- and make sure there is still available space at
			-- the end of buffer.
		local
			new_position: INTEGER
			nb: INTEGER
		do
			nb := upper - position + 1
			if nb >= capacity then
					-- Buffer is full. Resize it.
				resize
			end
			new_position := lower
			if position /= new_position then
					-- Move the 2 EOB characters as well.
				STRING_BUFFER_.move_left (content, position, new_position, nb + 2)
				position := new_position
				upper := new_position + nb - 1
			end
		ensure
			compacted_left: position = lower
			not_full: capacity > count
		end

	compact_right is
			-- Move unconsumed characters to the end of buffer
			-- and make sure there is still available space at
			-- the start of buffer.
		local
			new_position: INTEGER
			nb: INTEGER
		do
			nb := upper - position + 1
			if nb >= capacity then
					-- Buffer is full. Resize it.
				resize
			end
			new_position := position + capacity - count
			if position /= new_position then
					-- Move the 2 EOB characters as well.
				STRING_BUFFER_.move_right (content, position, new_position, nb + 2)
				position := new_position
				upper := new_position + nb - 1
			end
		ensure
			compacted_right: count = capacity
			not_full: position > lower
		end

feature {NONE} -- Implementation

	resize is
			-- Increase `capacity'.
		do
			if capacity = 0 then
				capacity := Default_capacity
			else
				capacity := capacity * 2
			end
				-- Make sure `content.count' is big enough.
				-- Include room for 2 EOB characters.
			if capacity + 2 > content.count then
					-- Set `content.count' to `capacity' + 2.
				content := STRING_BUFFER_.resize (content, capacity + 2)
			end
		ensure
			resized: capacity > old capacity
		end

feature {NONE} -- Constants

	Default_capacity: INTEGER is 16384
			-- Default capacity of buffer

	End_of_buffer_character: CHARACTER is '%U'
			-- End of buffer character

invariant

	content_not_void: content /= Void
	content_count: content.count >= capacity + 2
	positive_capacity: capacity >= 0
	valid_count: count >= 0 and count <= capacity
	end_of_buffer: content.item (upper + 1) = End_of_buffer_character and
		content.item (upper + 2) = End_of_buffer_character
	valid_position: position >= lower and position <= upper + 2

end -- class YY_BUFFER
