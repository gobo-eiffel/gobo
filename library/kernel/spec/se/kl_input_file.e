indexing

	description:

		"Input files containing extended ASCII characters %
		%(8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
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

			is_readable,

			close
		end





	KL_IMPORTED_ANY_ROUTINES







feature -- Access

	last_character: CHARACTER
			-- Last character read

	last_string: STRING
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)


feature -- Status report


	is_readable: BOOLEAN is
			-- Can file be opened in read mode?
		do
			if is_open_read then
				Result := True
			else
				open_read
				if is_open_read then
					Result := True
					close
					if operating_system.is_unix then
						if string_name /= Empty_name then
							tmp_directory.reset (string_name)
						else
							tmp_directory.reset (name)
						end
						Result := not tmp_directory.is_readable
					end
				end
			end
		end


	is_open_read: BOOLEAN is
			-- Is file opened in read mode?
		do
			Result := old_is_open_read
		end

	end_of_file: BOOLEAN
			-- Has the end of file been reached?

feature -- Input

	read_character is
			-- Read the next character in input file.
			-- Make the result available in `last_character'.
		do
			if character_buffer /= Void then
				last_character := character_buffer.item
				character_buffer := character_buffer.right
			elseif old_end_of_file then
				end_of_file := True
			else
				old_read_character
				end_of_file := old_end_of_file

				if not end_of_file then
					last_character := old_last_character
				end

			end
		end

	unread_character (a_character: CHARACTER) is
			-- Put `a_character' back in input file.
			-- This character will be read first by the next
			-- call to a read routine.
		local
			a_cell: like character_buffer
		do
			create a_cell.make (a_character)
			if character_buffer /= Void then
				a_cell.put_right (character_buffer)
			end
			character_buffer := a_cell
			last_character := a_character
			end_of_file := False
		end

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in the input file, there is no guarantee that they
			-- will all be read.)
























		local
			i: INTEGER
			a_target: STRING
		do
			if last_string = Void then
				create a_target.make (nb)
				last_string := a_target
			else
				a_target := last_string
				if a_target.capacity < nb then
					a_target.resize (nb)
				end
				a_target.wipe_out
			end
			from i := nb until i < 1 loop
				read_character
				if not end_of_file then
					a_target.append_character (last_character)
					i := i - 1
				else
					i := 0 -- Jump out of the loop.
				end
			end





















			end_of_file := (last_string.count = 0)
		end


	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER is
			-- Fill `a_string', starting at position `pos' with
			-- at most `nb' characters read from input file.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in the input file, there is no guarantee that they
			-- will all be read.)
		local











			j, nb2: INTEGER

			i: INTEGER
		do

































			from
				j := pos
			until
				i = nb or
				character_buffer = Void
			loop
				i := i + 1
				a_string.put (character_buffer.item, j)
				character_buffer := character_buffer.right
				j := j + 1
			end
			if i < nb then
				if not old_end_of_file then



















					nb2 := nb
					from until i >= nb2 loop
						old_read_character
						if not old_end_of_file then
							a_string.put (old_last_character, j)
							j := j + 1
							i := i + 1
						else
							nb2 := i - 1 -- Jump out of the loop.
						end
					end

				end
				end_of_file := old_end_of_file
			end
			Result := i

		end


	read_to_buffer (a_buffer: KI_BUFFER [CHARACTER]; pos, nb: INTEGER): INTEGER is
			-- Fill `a_buffer', starting at position `pos', with
			-- at most `nb' characters read from input file.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in the input file, there is no guarantee that they
			-- will all be read.)
		local
			char_buffer: KL_CHARACTER_BUFFER
		do
			char_buffer ?= a_buffer
			if char_buffer /= Void then
				Result := char_buffer.fill_from_stream (Current, pos, nb)
			else
				Result := precursor (a_buffer, pos, nb)
			end
		end

feature -- Basic operations

	open_read is
			-- Open current file in read-only mode if
			-- it can be opened, let it closed otherwise.
		local
			rescued: BOOLEAN
		do
			if not rescued then
				if string_name /= Empty_name then
					character_buffer := Void
					end_of_file := False







						old_open_read



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

	close is
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

	character_buffer: KL_LINKABLE [CHARACTER]
			-- Unread characters


	old_open_read is
			-- Open file in read-only mode.
		require
			string_name_not_void: string_name /= Void
			string_name_not_empty: string_name.count > 0
		deferred
		end

	old_end_of_file: BOOLEAN is
			-- Has end-of-input been reached ?
			-- True when the last character has been read.
		require
			opened: old_is_open_read
		deferred
		end

	old_read_character is
			-- Read a new character.
			-- Make result available in `old_last_character'.
		require
			opened: old_is_open_read
			not_end_of_file: not old_end_of_file
		deferred
		end

	old_is_open_read: BOOLEAN is
			-- Is file open for reading?
		deferred
		end

	old_last_character: CHARACTER is
			-- Last character read with `old_read_character'.
		require
			opened: old_is_open_read
		deferred
		end

	tmp_directory: KL_DIRECTORY is
			-- Temporary directory object
		once
			create Result.make (dummy_name)
		ensure
			directory_not_void: Result /= Void
			directory_closed: Result.is_closed
		end































































































end
