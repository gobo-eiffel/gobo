note

	description:

		"Character input streams based on strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STRING_INPUT_STREAM

inherit

	KI_TEXT_INPUT_STREAM
		redefine
			valid_unread_character
		end

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_string: like string)
			-- Create a new string input stream.
		require
			a_string_not_void: a_string /= Void
		do
			create last_string.make_empty
			string := a_string
			location := 0
			end_of_input := False
		ensure
			string_set: string = a_string
			not_end_of_input: not end_of_input
		end

feature -- Status report

	is_open_read: BOOLEAN
			-- Can characters be read from input stream?
		do
			Result := True
		end

	end_of_input: BOOLEAN
			-- Has the end of input stream been reached?

	valid_unread_character (a_character: CHARACTER_8): BOOLEAN
			-- Can `a_character' be put back in input stream?
		do
			Result := (location >= 1 and location <= string.count) and then (a_character = string.item (location))
		end

feature -- Access

	name: STRING
			-- Name of input stream
		once
			Result := "STRING"
		end

	last_character: CHARACTER_8
			-- Last character read

	last_string: STRING_8
			-- Last string read
			-- (Note: this query always return the same object.
			-- Therefore a clone should be used if the result
			-- is to be kept beyond the next call to this feature.
			-- However `last_string' is not shared between file objects.)

	eol: STRING_8 = "%N"
			-- Line separator

feature -- Input

	read_character
			-- Read the next character in input stream.
			-- Make the result available in `last_character'.
		do
			location := location + 1
			if location <= string.count then
				last_character := string.item (location)
			else
				end_of_input := True
			end
		end

	unread_character (a_character: CHARACTER_8)
			-- Put `a_character' back in input stream.
			-- This item will be read first by the next
			-- call to a read routine.
		do
			location := location - 1
			end_of_input := False
			last_character := a_character
		end

	read_string (nb: INTEGER)
			-- Read at most `nb' characters from input stream.
			-- Make the characters that have actually been read
			-- available in `last_string'.
			-- (Note that even if at least `nb' characters are available
			-- in the input stream, there is no guarantee that they
			-- will all be read.)
		local
			i: INTEGER
		do
			STRING_.wipe_out (last_string)
			from
				i := 1
			until
				i > nb
			loop
				read_character
				if not end_of_input then
					last_string.append_character (last_character)
					i := i + 1
				else
						-- Jump out of the loop.
					i := nb + 1
				end
			end
			end_of_input := (last_string.count = 0)
		end

	read_line
			-- Read characters from input stream until a line separator
			-- or end of input is reached. Make the characters that have
			-- been read available in `last_string' and discard the line
			-- separator characters from the input stream.
		local
			done: BOOLEAN
			a_target: STRING_8
			c: CHARACTER_8
			is_eof: BOOLEAN
		do
			STRING_.wipe_out (last_string)
			is_eof := True
			a_target := last_string
			from
			until
				done
			loop
				read_character
				if end_of_input then
					done := True
				else
					is_eof := False
					c := last_character
					if c = '%N' then
						done := True
					else
						a_target.append_character (c)
					end
				end
			end
			end_of_input := is_eof
		end

	read_new_line
			-- Read a line separator from input stream.
			-- Make the characters making up the recognized
			-- line separator available in `last_string',
			-- or make `last_string' empty and leave the
			-- input stream unchanged if no line separator
			-- was found.
		do
			STRING_.wipe_out (last_string)
			read_character
			if not end_of_input then
				if last_character = '%N' then
					last_string.append_character ('%N')
				else
						-- Put character back to input file.
					unread_character (last_character)
				end
			end
			end_of_input := False
		end

feature {NONE} -- Implementation

	string: STRING_8
			-- String being read

	location: INTEGER
			-- Location of last character read

invariant

	string_not_void: string /= Void
	location_positive: location >= 0

end
