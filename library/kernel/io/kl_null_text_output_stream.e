note

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

	make (a_name: like name)
			-- Create a null output stream.
		require
			a_name_not_void: a_name /= Void
		do
			name := a_name
		ensure
			name_set: name = a_name
		end

feature -- Output

	put_character (c: CHARACTER)
			-- Write `c' to output stream.
		do
		end

	put_string (a_string: STRING)
			-- Write `a_string' to output stream.
		do
		end

feature -- Status report

	is_open_write: BOOLEAN = True
			-- Can items be written to output stream?

feature -- Access

	name: STRING
			-- Name of output stream

	eol: STRING = "%N"
			-- Line separator

feature -- Basic operations

	flush
			-- Flush buffered data to disk.
		do
		end

invariant

	is_open_write: is_open_write

end
