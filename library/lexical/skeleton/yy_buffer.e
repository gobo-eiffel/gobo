indexing

	description:

		"Lexical analyzer input buffers";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

class YY_BUFFER

creation

	make, make_from_buffer

feature -- Initialization

	make (str: STRING) is
			-- Create a new buffer with characters from `str'.
			-- Do not alter `str' during the scanning process.
		require
			str_not_void: str /= Void
		local
			buff: STRING
		do
#ifndef VE
			!! buff.make (str.count + 2)
#else
			!! buff.make (0)
#endif
			buff.append_string (str)
			buff.append_character (End_of_buffer_character)
			buff.append_character (End_of_buffer_character)
			make_from_buffer (buff)
		ensure
			capacity_set: capacity = str.count
			count_set: count = str.count
			beginning_of_line: beginning_of_line
		end

	make_from_buffer (buff: STRING) is
			-- Create a new buffer using `buff'.
			-- `buff' might be altered during the scanning process.
			-- Use `make' if this behavior is not desired.
		require
			buff_not_void: buff /= Void
			valid_buff: buff.count >= 2 and then
				buff.item (buff.count - 1) = '%U' and
				buff.item (buff.count) = '%U'
		do
			capacity := buff.count - 2
			content := buff
			position := 1
			count := capacity
			beginning_of_line := True
		ensure
			content_set: content = buff
			capacity_set: capacity = buff.count - 2
			count_set: count = buff.count - 2
			beginning_of_line: beginning_of_line
		end

feature -- Access

	content: STRING
			-- Input buffer characters

	count: INTEGER
			-- Number of characters in buffer,
			-- not including EOB characters

	capacity: INTEGER
			-- Maximum number of characters in buffer,
			-- not including room for EOB characters

	position: INTEGER
			-- Current position in buffer

	beginning_of_line: BOOLEAN
			-- Is current position at the beginning of a line?

feature -- Setting

	set_capacity (size: INTEGER) is
			-- Set `capacity' to `size'.
		require
			size_small_enough: size + 2 <= content.count
			size_large_enough: size >= count
		do
			capacity := size
		ensure
			capacity_set: capacity = size
		end

	set_count (nb: INTEGER) is
			-- Set `count' to `nb'.
		require
			nb_small_enough: nb <= capacity
			nb_large_enough: nb >= 0
		do
			count := nb
		ensure
			count_set: count = nb
		end

	set_position (pos: INTEGER) is
			-- Set `position' to `pos'.
		require
			pos_small_enough: pos <= count + 2
			pos_large_enough: pos >= 1
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

	filled: BOOLEAN is
			-- Did the last call to `fill' add more characters to buffer?
		do
		end

feature -- Element change

	fill is
			-- Fill buffer. Set `filled' to True if characters
			-- have been added to buffer.
		do
		end

	flush is
			-- Flush buffer.
		do
			count := 0
				-- We always need two end-of-file characters.
				-- The first causes a transition to the end-of-buffer
				-- state. The second causes a jam in that state.
			content.put (End_of_buffer_character, 1)
			content.put (End_of_buffer_character, 2)
			position := 1
			beginning_of_line := True
		ensure
			flushed: count = 0
			beginning_of_line: beginning_of_line
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
	end_of_buffer: content.item (count + 1) = End_of_buffer_character and
		content.item (count + 2) = End_of_buffer_character
	valid_position: position >= 1 and position <= count + 2

end -- class YY_BUFFER
