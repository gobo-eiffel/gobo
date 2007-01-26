indexing

	description:

		"Lexical analyzer input buffers"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 1999-2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class YY_BUFFER

inherit

	ANY -- Needed for SE 2.1b1.

create

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
			buff := new_default_buffer (nb)
			buff.fill_from_string (str, 1)
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
				buff.item (buff.count - 1) = '%U' and
				buff.item (buff.count) = '%U'
		do
			capacity := buff.count - 2
			count := capacity
			content := buff
			index := 1
			line := 1
			column := 1
			position := 1
			beginning_of_line := True
		ensure
			content_set: content = buff
			capacity_set: capacity = buff.count - 2
			count_set: count = buff.count - 2
			beginning_of_line: beginning_of_line
		end

feature -- Access

	name: STRING is
			-- Name of buffer
		do
				-- Note: this routine should be a once-function but
				-- there is a bug in SE -0.74b22 (and still in SE 1.0)
				-- in the generated C code of the postcondition
				-- "name_not_void" in the redefined routine
				-- YY_FILE_BUFFER.name.
			Result := Name_constant
		ensure
			name_not_void: Result /= Void
		end

	content: KI_CHARACTER_BUFFER
			-- Input buffer characters

	count: INTEGER
			-- Number of characters in buffer,
			-- not including EOB characters

	capacity: INTEGER
			-- Maximum number of characters in buffer,
			-- not including room for EOB characters

	position: INTEGER
			-- Position of last token read in current
			-- buffer (i.e. number of characters from
			-- the start of the input source)

	line, column: INTEGER
			-- Line and column number of last token
			-- read in current buffer

	index: INTEGER
			-- Current index in `content'

	beginning_of_line: BOOLEAN
			-- Is current position at the beginning of a line?

feature -- Setting

	set_position (p, l, c: INTEGER) is
			-- Set `position' to `p', `line' to `l'
			-- and `column' to `c'.
		require
			p_positive: p >= 1
			l_positive: l >= 1
			c_positive: c >= 1
		do
			position := p
			line := l
			column := c
		ensure
			position_set: position = p
			line_set: line = l
			column_set: column = c
		end

	set_index (i: INTEGER) is
			-- Set `index' to `i'.
		require
			i_small_enough: i <= count + 2
			i_large_enough: i >= 1
		do
			index := i
		ensure
			index_set: index = i
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
		do
				-- We always need two end-of-file characters.
				-- The first causes a transition to the end-of-buffer
				-- state. The second causes a jam in that state.
			content.put (End_of_buffer_character, 1)
			content.put (End_of_buffer_character, 2)
			count := 0
			index := 1
			line := 1
			column := 1
			position := 1
			beginning_of_line := True
			filled := True
		ensure
			flushed: count = 0
			beginning_of_line: beginning_of_line
		end

	wipe_out is
			-- Wipe out buffer.
		do
			flush
			filled := False
		ensure
			wiped_out: count = 0
			beginning_of_line: beginning_of_line
			not_filled: not filled
		end

	compact_left is
			-- Move unconsumed characters to the start of buffer
			-- and make sure there is still available space at
			-- the end of buffer.
		local
			nb: INTEGER
		do
			nb := count - index + 1
			if nb >= capacity then
					-- Buffer is full. Resize it.
				resize
			end
			if index /= 1 then
					-- Move the 2 EOB characters as well.
				content.move_left (index, 1, nb + 2)
				index := 1
				count := nb
			end
		ensure
			compacted_left: index = 1
			not_full: capacity > count
		end

	compact_right is
			-- Move unconsumed characters to the end of buffer
			-- and make sure there is still available space at
			-- the start of buffer.
		local
			new_index: INTEGER
			nb: INTEGER
		do
			nb := count - index + 1
			if nb >= capacity then
					-- Buffer is full. Resize it.
				resize
			end
			new_index := index + capacity - count
			if index /= new_index then
					-- Move the 2 EOB characters as well.
				content.move_right (index, new_index, nb + 2)
				index := new_index
				count := new_index + nb - 1
			end
		ensure
			compacted_right: count = capacity
			not_full: index > 1
		end

feature {NONE} -- Implementation

	new_default_buffer (nb: INTEGER): like content is
			-- New buffer that can contain `nb' characters;
			-- `nb' should be large enough to make room for
			-- the two end-of-buffer characters
			-- (Note: create a new object at each call.)
		require
			nb_large_enough: nb >= 2
		do
			create {KL_CHARACTER_BUFFER} Result.make (nb)
		ensure
			buffer_not_void: Result /= Void
			buffer_count_set: Result.count = nb
			buffer_count_large_enough: Result.count >= 2
		end

	resize is
			-- Increase `capacity'.
		do
			if capacity = 0 then
				capacity := default_capacity
			else
				capacity := capacity * 2
			end
				-- Make sure `content.count' is big enough.
				-- Include room for 2 EOB characters.
			if capacity + 2 > content.count then
					-- Set `content.count' to `capacity' + 2.
				content.resize (capacity + 2)
			end
		ensure
			resized: capacity > old capacity
		end

feature {NONE} -- Constants

	default_capacity: INTEGER is
			-- Default capacity of buffer
		once
			Result := 16384
		ensure
			positive_default_capacity: Result > 0
		end

	End_of_buffer_character: CHARACTER is '%U'
			-- End of buffer character

	Name_constant: STRING is "<string>"
			-- Name of string buffer

invariant

	content_not_void: content /= Void
	content_count: content.count >= capacity + 2
	positive_capacity: capacity >= 0
	valid_count: count >= 0 and count <= capacity
	end_of_buffer: content.item (count + 1) = End_of_buffer_character and
		content.item (count + 2) = End_of_buffer_character
	valid_index: index >= 1 and index <= count + 2
	line_positive: line >= 1
	column_positive: column >= 1
	position_positive: position >= 1

end
