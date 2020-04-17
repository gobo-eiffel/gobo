note

	description:

		"Standard output files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The character '%%N' is automatically %
		%converted to the line separtor of the underlying file system when %
		%written to the standard output file."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_STDOUT_FILE

inherit

	KI_TEXT_OUTPUT_STREAM

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new standard output file.
		do
		ensure
			name_set: name.is_equal ("stdout")
			is_open_write: is_open_write
		end

feature -- Access

	name: STRING = "stdout"
			-- Name of output stream

	eol: STRING_8 = "%N"
			-- Line separator

feature -- Status report

	is_open_write: BOOLEAN = True
			-- Is standard output file opened in write mode?

feature -- Output

	put_character (c: CHARACTER_8)
			-- Write `c' to standard output file.
		do
			console.put_character (c)
		end

	put_string (a_string: READABLE_STRING_8)
			-- Write `a_string' to standard output file.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding.
		do
			console.put_string (STRING_.as_readable_string_8_no_uc_string (a_string))
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
			Result := io.output
		ensure
			instance_free: class
			console_not_void: Result /= Void
		end

end
