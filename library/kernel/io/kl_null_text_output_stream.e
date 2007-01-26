indexing

	description:

		"Text output streams which silently ignore characters"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_NULL_TEXT_OUTPUT_STREAM

inherit

	KI_TEXT_OUTPUT_STREAM

create

	make

feature {NONE} -- Initialization

	make (a_name: like name) is
			-- Create a null output stream.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Output

	put_character (c: CHARACTER) is
			-- Write `c' to output stream.
		do
		end

	put_string (a_string: STRING) is
			-- Write `a_string' to output stream.
		do
		end

feature -- Status report

	is_open_write: BOOLEAN is True
			-- Can items be written to output stream?

feature -- Access

	name: STRING
			-- Name of output stream

	eol: STRING is "%N"
			-- Line separator

feature -- Basic operations

	flush is
			-- Flush buffered data to disk.
		do
		end

invariant

	is_open_write: is_open_write

end
