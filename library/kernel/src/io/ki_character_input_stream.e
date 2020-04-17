note

	description:

		"Interface for character input streams"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_CHARACTER_INPUT_STREAM

inherit

	KI_INPUT_STREAM [CHARACTER_8]
		rename
			read as read_character,
			unread as unread_character,
			last_item as last_character,
			valid_unread_item as valid_unread_character
		end

	KL_IMPORTED_ANY_ROUTINES

feature -- Input

	read_string (nb: INTEGER)
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in the input stream, there is no guarantee that they
			-- will all be read.)
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
			nb_large_enough: nb > 0
		deferred
		ensure
			last_string_count_small_enough: not end_of_input implies last_string.count <= nb
			character_read: not end_of_input implies last_string.count > 0
		end

	read_to_string (a_string: STRING_8; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos', with
			-- at most `nb' characters read from input stream.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in the input stream, there is no guarantee that they
			-- will all be read.)
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
			a_string_not_void: a_string /= Void
			valid_position: a_string.valid_index (pos)
			nb_large_enough: nb > 0
			nb_small_enough: nb <= a_string.count - pos + 1
		local
			i, end_pos: INTEGER
		do
			end_pos := pos + nb - 1
			from
				i := pos
			until
				i > end_pos
			loop
				read_character
				if not end_of_input then
					a_string.put (last_character, i)
					i := i + 1
				else
					Result := i - pos - nb
						-- Jump out of the loop.
					i := end_pos + 1
				end
			end
			Result := Result + i - pos
		ensure
			nb_char_read_large_enough: Result >= 0
			nb_char_read_small_enough: Result <= nb
			character_read: not end_of_input implies Result > 0
		end

feature -- Access

	last_string: STRING_8
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)
		require
			is_open_read: is_open_read
			not_end_of_input: not end_of_input
		deferred
		ensure
			last_string_not_void: Result /= Void
			string_type: ANY_.same_types (Result, {STRING_8} "")
		end

feature -- Status report

	valid_unread_character (a_character: CHARACTER_8): BOOLEAN
			-- Can `a_character' be put back in input stream?
		do
			Result := True
		end

end
