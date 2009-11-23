indexing

	description:

		"Standard input files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The line separtor of the %
		%underlying file system is automatically converted to %%N %
		%when read from the satndard input file. However `read_line' %
		%and `read_new_line' are able to recognize '%%N', '%%R%%N' %
		%and '%%R' as line separators."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STDIN_FILE

inherit

	KI_TEXT_INPUT_STREAM
		rename
			end_of_input as end_of_file
		redefine
			read_to_string,
			read_to_buffer
		end

	KL_OPERATING_SYSTEM
		export {NONE} all end

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

	CONSOLE
		rename
			make as old_make,
			read_stream as old_read_stream,
			read_line as old_read_line,
			read_character as old_read_character,
			read_to_string as old_read_to_string,
			end_of_file as old_end_of_file,
			is_open_read as old_is_open_read,
			append as old_append,
			close as old_close
		export
			{CONSOLE}
				open_read,
				extendible,
				file_pointer,
				count,
				old_close,
				is_closed,
				put_string,
				is_open_write
			{CONSOLE} all
		redefine
			file_readable,
			last_string
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new standard input file.
		do
			create last_string.make_empty
			make_open_stdin ("stdin")
			end_of_file := False
		ensure
			name_set: name.is_equal ("stdin")
			is_open_read: is_open_read
			not_end_of_file: not end_of_file
		end

feature -- Access

	last_string: STRING
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)

	eol: STRING is "%N"
			-- Line separator

feature -- Status report

	is_open_read: BOOLEAN is
			-- Is standard input file opened in read mode?
		do
			Result := old_is_open_read
		end

	end_of_file: BOOLEAN
			-- Has the end of file been reached?

feature -- Input

	read_character is
			-- Read the next character in standard input file.
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

	unread_character (a_character: CHARACTER) is
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

	read_string (nb: INTEGER) is
			-- Read at most `nb' characters from standard input file.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in standard input file, there is no guarantee that they
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

	read_line is
			-- Read characters from standard input file until a line separator
			-- or end of file is reached. Make the characters that have
			-- been read available in `last_string' and discard the line
			-- separator characters from the standard input file.
			-- Line separators recognized by current standard input
			-- file are: '%N', '%R%N and '%R'.
		local
			done: BOOLEAN
			c: CHARACTER
			is_eof: BOOLEAN
			has_carriage: BOOLEAN
		do
			last_string.clear_all
			is_eof := True
			from
			until
				done
			loop
				read_character
				if end_of_file then
					done := True
				else
					is_eof := False
					c := last_character
					inspect c
					when '%N' then
						done := True
					when '%R' then
						has_carriage := True
					else
						if has_carriage then
								-- Put character back to input file.
							unread_character (c)
							done := True
						else
							last_string.append_character (c)
						end
					end
				end
			end
			end_of_file := is_eof
		end

	read_new_line is
			-- Read a line separator from standard input file.
			-- Make the characters making up the recognized
			-- line separator available in `last_string',
			-- or make `last_string' empty and leave the
			-- standard input file unchanged if no line
			-- separator was found.
			-- Line separators recognized by current standard
			-- input file are: '%N', '%R%N and '%R'.
		do
			last_string.clear_all
			read_character
			if not end_of_file then
				inspect last_character
				when '%N' then
					last_string.append_character ('%N')
				when '%R' then
					last_string.append_character ('%R')
					read_character
					if not end_of_file then
						if last_character = '%N' then
							last_string.append_character ('%N')
						else
								-- Put character back to input file.
							unread_character (last_character)
						end
					end
				else
						-- Put character back to input file.
					unread_character (last_character)
				end
			end
			end_of_file := False
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER is
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from standard input file.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in standard input file, there is no guarantee that they
			-- will all be read.)
		local
			i, j: INTEGER
			k, nb2: INTEGER
			tmp_string: STRING
			a_buff: like character_buffer
		do
			from
				j := pos
				a_buff := character_buffer
			until
				i = nb or a_buff = Void
			loop
				i := i + 1
				a_string.put (a_buff.item, j)
				a_buff := a_buff.right
				j := j + 1
			end
			character_buffer := a_buff
			if i < nb then
				if not old_end_of_file then
					if ANY_.same_types (a_string, dummy_string) then
						Result := i + old_read_to_string (a_string, j, nb - i)
					else
						nb2 := nb - i
						create tmp_string.make (nb2)
						tmp_string.set_count (nb2)
						nb2 := old_read_to_string (tmp_string, 1, nb2)
						from
							k := 1
						until
							k > nb2
						loop
							a_string.put (tmp_string.item (k), j)
							j := j + 1
							k := k + 1
						end
						Result := i + nb2
					end
				else
					Result := i
				end
				end_of_file := old_end_of_file
			else
				Result := i
			end
		end

	read_to_buffer (a_buffer: KI_BUFFER [CHARACTER]; pos, nb: INTEGER): INTEGER is
			-- Fill `a_buffer', starting at position `pos', with
			-- at most `nb' characters read from standard input file.
			-- Return the number of characters actually read.
			-- (Note that even if at least `nb' characters are available
			-- in standard input file, there is no guarantee that they
			-- will all be read.)
		local
			char_buffer: ?KL_CHARACTER_BUFFER
		do
			char_buffer ?= a_buffer
			if char_buffer /= Void then
				Result := char_buffer.fill_from_stream (Current, pos, nb)
			else
				Result := precursor (a_buffer, pos, nb)
			end
		end

feature {CONSOLE} -- Implementation

	file_readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := is_open_read
		end

feature {NONE} -- Implementation

	character_buffer: ?KL_LINKABLE [CHARACTER]
			-- Unread characters

	dummy_string: STRING is ""
			-- Dummy string

end
