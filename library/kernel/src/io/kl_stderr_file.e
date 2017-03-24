note

	description:

		"Standard error files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The character '%%N' is automatically %
		%converted to the line separtor of the underlying file system %
		%when written to the standard error file."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STDERR_FILE

inherit

	KI_TEXT_OUTPUT_STREAM

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new standard error file.
		do
		ensure
			name_set: name.is_equal ("stderr")
			is_open_write: is_open_write
		end

feature -- Access

	name: STRING = "stderr"
			-- Name of output stream

	eol: STRING = "%N"
			-- Line separator

feature -- Status report

	is_open_write: BOOLEAN = True
			-- Is standard error file opened in write mode?

feature -- Output

	put_character (c: CHARACTER)
			-- Write `c' to standard error file.
		do
			console.put_character (c)
		end

	put_string (a_string: STRING)
			-- Write `a_string' to standard error file.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding.
		local
			a_string_string: STRING
		do
			a_string_string := STRING_.as_string (a_string)
			console.put_string (a_string_string)
		end

feature -- Basic operations

	flush
			-- Flush buffered data to disk.
		do
			console.flush
		end

feature {NONE} -- Implementation

	console: PLAIN_TEXT_FILE
			-- Console object
		once
			Result := io.error
		ensure
			console_not_void: Result /= Void
		end

end