note

	description:

		"Input files containing extended ASCII characters %
		%(8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_INPUT_FILE

inherit

	KI_INPUT_FILE
		redefine
			read_to_string,
			read_to_buffer
		end

	KL_FILE
		rename
			open as open_read,
			is_open as is_open_read
		redefine
			make, close
		end

	STRING_HANDLER

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new file named `a_name'.
			-- (`a_name' should follow the pathname convention
			-- of the underlying platform. For pathname conversion
			-- use KI_FILE_SYSTEM.pathname_from_file_system.)
		do
			create last_string.make_empty
			precursor (a_name)
		end

feature -- Access

	last_character: CHARACTER_8
			-- Last character read

	last_string: STRING_8
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)

feature -- Status report

	is_open_read: BOOLEAN
			-- Is file opened in read mode?
		do
			Result := old_is_open_read
		end

	end_of_file: BOOLEAN
			-- Has the end of file been reached?

feature -- Input

	read_character
			-- Read the next character in input file.
			-- Make the result available in `last_character'.
		local
			l_character_buffer: like character_buffer
		do
			l_character_buffer := character_buffer
			if l_character_buffer /= Void then
				last_character := l_character_buffer.item
				character_buffer := l_character_buffer.right
			elseif old_end_of_file then
				end_of_file := True
			else
				old_read_character
				end_of_file := old_end_of_file
			end
		end

	unread_character (a_character: CHARACTER_8)
			-- Put `a_character' back in input file.
			-- This character will be read first by the next
			-- call to a read routine.
		local
			a_cell: like character_buffer
			l_character_buffer: like character_buffer
		do
			create a_cell.make (a_character)
			l_character_buffer := character_buffer
			if l_character_buffer /= Void then
				a_cell.put_right (l_character_buffer)
			end
			character_buffer := a_cell
			last_character := a_character
			end_of_file := False
		end

	read_string (nb: INTEGER)
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in the input file, there is no guarantee that they
			-- will all be read.)
		local
			i: INTEGER
		do
			if last_string.capacity < nb then
				last_string.resize (nb)
			end
			if character_buffer = Void then
				if not old_end_of_file then
					last_string.set_count (nb)
					i := old_read_to_string (last_string, 1, nb)
					last_string.reset_hash_codes
					last_string.set_count (i)
				else
					last_string.set_count (0)
				end
			else
				last_string.set_count (nb)
				i := read_to_string (last_string, 1, nb)
				last_string.set_count (i)
			end
			end_of_file := (last_string.count = 0)
		end

	read_to_string (a_string: STRING_8; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with
			-- at most `nb' characters read from input file.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in the input file, there is no guarantee that they
			-- will all be read.)
		local
			j: INTEGER
			tmp_string: STRING_8
			k, nb2: INTEGER
			i: INTEGER
			l_character_buffer: like character_buffer
		do
			from
				j := pos
				l_character_buffer := character_buffer
			until
				i = nb or l_character_buffer = Void
			loop
				i := i + 1
				a_string.put (l_character_buffer.item, j)
				l_character_buffer := l_character_buffer.right
				j := j + 1
			end
			character_buffer := l_character_buffer
			if i < nb then
				if not old_end_of_file then
					if ANY_.same_types (a_string, dummy_string) then
						i := i + old_read_to_string (a_string, j, nb - i)
						a_string.reset_hash_codes
					elseif ANY_.same_types (a_string, dummy_kl_character_buffer) then
						i := i + old_read_to_string (a_string, j, nb - i)
						a_string.reset_hash_codes
					else
						nb2 := nb - i
						create tmp_string.make (nb2)
						tmp_string.set_count (nb2)
						nb2 := old_read_to_string (tmp_string, 1, nb2)
						tmp_string.reset_hash_codes
						from
							k := 1
						until
							k > nb2
						loop
							a_string.put (tmp_string.item (k), j)
							j := j + 1
							k := k + 1
						end
						i := i + nb2
					end
				end
				end_of_file := old_end_of_file
			end
			Result := i
		end

	read_to_buffer (a_buffer: KI_BUFFER [CHARACTER_8]; pos, nb: INTEGER): INTEGER
			-- Fill `a_buffer', starting at position `pos', with
			-- at most `nb' characters read from input file.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in the input file, there is no guarantee that they
			-- will all be read.)
		do
			if attached {KL_CHARACTER_BUFFER} a_buffer as char_buffer then
				Result := char_buffer.fill_from_stream (Current, pos, nb)
			else
				Result := precursor (a_buffer, pos, nb)
			end
		end

feature -- Basic operations

	open_read
			-- Open current file in read-only mode if
			-- it can be opened, let it closed otherwise.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if string_name /= Empty_name then
					character_buffer := Void
					end_of_file := False
					if old_exists and then old_is_readable then
						old_open_read
					end
				end
			elseif not is_closed then
				close
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

	close
			-- Close current file if it is closable,
			-- let it open otherwise.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				old_close
				character_buffer := Void
			end
		rescue
			if not rescued then
				rescued := True
				retry
			end
		end

feature {NONE} -- Implementation

	character_buffer: detachable KL_LINKABLE [CHARACTER_8]
			-- Unread characters

	file_readable: BOOLEAN
			-- Is there a current item that may be read?
		do
			Result := is_open_read
		end

	old_read_to_string (a_string: STRING_8; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		require
			is_readable: file_readable
			not_end_of_file: not old_end_of_file
			a_string_not_void: a_string /= Void
			valid_position: a_string.valid_index (pos)
			nb_large_enough: nb > 0
			nb_small_enough: nb <= a_string.count - pos + 1
		deferred
		ensure
			nb_char_read_large_enough: Result >= 0
			nb_char_read_small_enough: Result <= nb
			character_read: not old_end_of_file implies Result > 0
		end

	dummy_string: STRING_8 = ""
			-- Dummy string

	dummy_kl_character_buffer: KL_CHARACTER_BUFFER
			-- Dummy KL_CHARACTER_BUFFER
		once
			create Result.make (0)
		ensure
			instance_free: class
			dummy_not_void: Result /= Void
		end

	old_end_of_file: BOOLEAN
			-- Has an EOF been detected?
		require
			opened: not old_is_closed
		deferred
		end

	old_read_character
			-- Read a new character.
			-- Make result available in `last_character'.
		require
			is_readable: file_readable
		deferred
		end

	old_is_open_read: BOOLEAN
			-- Is file open for reading?
		deferred
		end

	old_read_stream (nb_char: INTEGER)
			-- Read a string of at most `nb_char' bound characters
			-- or until end of file.
			-- Make result available in `last_string'.
		require
			is_readable: file_readable
		deferred
		end

	old_open_read
			-- Open file in read-only mode.
		require
			is_closed: old_is_closed
		deferred
		ensure
			exists: old_exists
			open_read: old_is_open_read
		end

end
