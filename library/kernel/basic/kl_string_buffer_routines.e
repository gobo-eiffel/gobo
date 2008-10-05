indexing

	description:

		"Routines that ought to be in a class STRING_BUFFER. %
		%A string buffer is a sequence of characters equipped %
		%with features `put', `item' and `count'."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STRING_BUFFER_ROUTINES

obsolete

	"[020717] Use descendants of KI_CHARACTER_BUFFER instead."

inherit

	KL_IMPORTED_STRING_BUFFER_ROUTINES

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_IMPORTED_ANY_ROUTINES

	STRING_HANDLER

feature -- Initialization

	make (n: INTEGER): like STRING_BUFFER_TYPE is
			-- Create a new string buffer being able
			-- to contain `n' characters.
		require
			non_negative_n: n >= 0
		do
			create Result.make (n)
			Result.set_count (n)
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count = n
		end

	make_from_string (a_string: STRING): like STRING_BUFFER_TYPE is
			-- Create a new string buffer with characters from `a_string'.
		require
			a_string_not_void: a_string /= Void
			is_string: ANY_.same_types (a_string, "")
		do
			Result := make (a_string.count)
			copy_from_string (Result, lower, a_string)
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count = a_string.count
			charaters_set: substring (Result, lower, a_string.count + lower - 1).is_equal (a_string)
		end

feature -- Conversion

	to_string_buffer (a_string: STRING): like STRING_BUFFER_TYPE is
			-- String buffer filled with characters from `a_string'.
			-- The string buffer and `a_string' may share internal
			-- data. Use `make_from_string' if this is a concern.
		require
			a_string_not_void: a_string /= Void
			is_string: ANY_.same_types (a_string, "")
		do
			Result := a_string
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count >= a_string.count
			charaters_set: substring (Result, lower, a_string.count + lower - 1).is_equal (a_string)
		end

feature -- Access

	substring (a_buffer: like STRING_BUFFER_TYPE; s, e: INTEGER): STRING is
			-- New string made up of characters held in
			-- `a_buffer' between indexes `s' and `e'
		require
			a_buffer_not_void: a_buffer /= Void
			s_large_enough: s >= lower
			e_small_enough: e <= upper (a_buffer)
			valid_interval: s <= e + 1
		do
			if e < s then
					-- Empty string
				create Result.make (0)
			else
				Result := a_buffer.substring (s, e)
			end
		ensure
			substring_not_void: Result /= Void
			is_string: ANY_.same_types (Result, "")
			count_set: Result.count = e - s + 1
		end

feature -- Measurement

	lower: INTEGER is 1
			-- Lower index

	upper (a_buffer: like STRING_BUFFER_TYPE): INTEGER is
			-- Upper index
		require
			a_buffer_not_void: a_buffer /= Void
		do
			Result := a_buffer.count + lower - 1
		ensure
			definition: a_buffer.count = (Result - lower + 1)
		end

feature -- Element change

	append_substring_to_string (a_buffer: like STRING_BUFFER_TYPE; s, e: INTEGER; a_string: STRING) is
			-- Append string made up of characters held in `a_buffer'
			-- between indexes `s' and `e' to `a_string'.
		require
			a_buffer_not_void: a_buffer /= Void
			a_string_not_void: a_string /= Void
			is_string: ANY_.same_types (a_string, "")
			not_same: to_string_buffer (a_string) /= a_buffer
			s_large_enough: s >= lower
			e_small_enough: e <= upper (a_buffer)
			valid_interval: s <= e + 1
		do
			if s <= e then
				a_string.append_string (a_buffer.substring (s, e))
			end
		ensure
			count_set: a_string.count = old (a_string.count) + (e - s + 1)
			characters_set: s <= e implies a_string.substring (old (a_string.count) + 1, a_string.count).is_equal (substring (a_buffer, s, e))
		end

	copy_from_string (a_buffer: like STRING_BUFFER_TYPE; pos: INTEGER; a_string: STRING) is
			-- Copy characters of `a_string' to `a_buffer'
			-- starting at position `pos'.
		require
			a_buffer_not_void: a_buffer /= Void
			a_string_not_void: a_string /= Void
			is_string: ANY_.same_types (a_string, "")
			not_same: to_string_buffer (a_string) /= a_buffer
			pos_large_enough: pos >= lower
			enough_space: (pos + a_string.count - 1) <= upper (a_buffer)
		local
			nb: INTEGER
			i, j: INTEGER
		do
			nb := a_string.count
			if nb > 0 then
				j := pos
				from
					i := 1
				until
					i > nb
				loop
					a_buffer.put (a_string.item (i), j)
					j := j + 1
					i := i + 1
				end
			end
		ensure
			charaters_set: substring (a_buffer, pos, a_string.count + pos - 1).is_equal (a_string)
		end

	copy_from_stream (a_buffer: like STRING_BUFFER_TYPE; pos: INTEGER; a_stream: like INPUT_STREAM_TYPE; nb_char: INTEGER): INTEGER is
			-- Fill `a_buffer', starting at position `pos' with
			-- at most `nb_char' characters read from `a_stream'.
			-- Return the number of characters actually read.
		require
			a_buffer_not_void: a_buffer /= Void
			pos_large_enough: pos >= lower
			a_stream_not_void: a_stream /= Void
			a_stream_open_read: INPUT_STREAM_.is_open_read (a_stream)
			nb_char_large_enough: nb_char >= 0
			enough_space: (pos + nb_char - 1) <= upper (a_buffer)
		do
			Result := INPUT_STREAM_.read_stream (a_stream, a_buffer, pos, nb_char)
		ensure
			nb_char_read_large_enough: Result >= 0
			nb_char_read_small_enough: Result <= nb_char
		end

	move_left (a_buffer: like STRING_BUFFER_TYPE; old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
			nb_positive: nb >= 0
			old_pos_large_enough: old_pos >= lower
			enough_characters: (old_pos + nb - 1) <= upper (a_buffer)
			new_pos_large_enough: new_pos >= lower
			enough_space: (new_pos + nb - 1) <= upper (a_buffer)
			move_left: old_pos > new_pos
		local
			i, j, nb2: INTEGER
		do
			if nb > 0 then
				j := new_pos
				nb2 := old_pos + nb - 1
				from
					i := old_pos
				until
					i > nb2
				loop
					a_buffer.put (a_buffer.item (i), j)
					j := j + 1
					i := i + 1
				end
			end
		end

	move_right (a_buffer: like STRING_BUFFER_TYPE; old_pos, new_pos: INTEGER; nb: INTEGER) is
			-- Copy `nb' characters from `old_pos' to
			-- `new_pos' in `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
			nb_positive: nb >= 0
			old_pos_large_enough: old_pos >= lower
			enough_characters: (old_pos + nb - 1) <= upper (a_buffer)
			new_pos_large_enough: new_pos >= lower
			enough_space: (new_pos + nb - 1) <= upper (a_buffer)
			move_right: old_pos < new_pos
		local
			i, j: INTEGER
		do
			if nb > 0 then
				j := new_pos + nb - 1
				from
					i := old_pos + nb - 1
				until
					i < old_pos
				loop
					a_buffer.put (a_buffer.item (i), j)
					j := j - 1
					i := i - 1
				end
			end
		end

feature -- Resizing

	resize (a_buffer: like STRING_BUFFER_TYPE; n: INTEGER): like STRING_BUFFER_TYPE is
			-- Resize `a_buffer' so that it contains `n' characters.
			-- Do not lose any previously entered characters.
			-- Note: the returned string buffer might be `a_buffer' or
			-- a newly created string buffer where characters from
			-- `a_buffer' have been copied to.
		require
			a_buffer_not_void: a_buffer /= Void
			n_large_enough: n >= a_buffer.count
		do
			a_buffer.resize (n)
			a_buffer.set_count (n)
			Result := a_buffer
		ensure
			string_buffer_not_void: Result /= Void
			count_set: Result.count = n
		end

end
