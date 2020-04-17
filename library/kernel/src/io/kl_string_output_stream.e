note

	description:

		"Character output streams based on strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STRING_OUTPUT_STREAM

inherit

	KI_TEXT_OUTPUT_STREAM

	KL_IMPORTED_STRING_ROUTINES

create

	make,
	make_empty

feature {NONE} -- Initialization

	make (a_string: STRING_8)
			-- Create output to an existing string.
		require
			a_string_not_void: a_string /= Void
		do
			string := a_string
		ensure
			string_set: string = a_string
		end

	make_empty
			-- Create string for output.
		do
			create string.make (256)
		ensure
			empty: string.count = 0
		end

feature -- Access

	string: STRING_8
			-- String into which the output is stored

	name: STRING
			-- Name of output stream
		once
			Result := "STRING"
		end

	eol: STRING_8 = "%N"
			-- Line separator

feature -- Setting

	set_string (a_string: STRING_8)
			-- Set `string' to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			string := a_string
		ensure
			string_set: string = a_string
		end

feature -- Status report

	is_open_write: BOOLEAN
			-- Can characters be written to output stream?
		do
			Result := True
		end

feature -- Output

	put_character (c: CHARACTER_8)
			-- Write `c' to output stream.
		do
			string.append_character (c)
		end

	put_string (a_string: READABLE_STRING_8)
			-- Write `a_string' to output stream.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding.
		do
			string.append_string (STRING_.as_readable_string_8_no_uc_string (a_string))
		end

feature -- Basic operations

	flush
			-- Do nothing (operation does not apply to string).
		do
		end

invariant

	string_not_void: string /= Void

end
