indexing

	description:

		"Character output streams based on strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class KL_STRING_OUTPUT_STREAM

inherit

	KI_CHARACTER_OUTPUT_STREAM
	
creation

	make,
	make_string

feature {NONE} -- Creation

	make is
			-- Create string for output.
		do
			string  := STRING_.make (0)
		end

	make_string (a_string: STRING) is
			-- Create output to an existing string.
		require
			not_void: a_string /= Void
		do
			string := a_string
		end

feature -- Access

	string: STRING
			-- String into which the output is stored. 
			-- It is always the same object for each instance of this class,
			-- but not shared between instances.

	name: STRING is
			-- Name of output stream
		once
			Result := "STRING"
		end

feature -- Status report

	is_open_write: BOOLEAN is
			-- Can items be written to output stream?
		do
			Result := True
		end

feature -- Output

	put_character (v: CHARACTER) is
			-- Write `v' to output stream.
		do
			string.append_character (v)
		end

	put_string (a_string: STRING) is
			-- Write `a_string' to output stream.
		do
			string.append_string (a_string)
		end

feature -- Basic operations

	flush is
			-- Do nothing (operation does not apply to string).
		do
		end

invariant

	string_not_void: string /= Void

end
