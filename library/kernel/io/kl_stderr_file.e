note

	description:

		"Standard error files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The character '%N' is automatically %
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

	KL_OPERATING_SYSTEM
		export {NONE} all end

	CONSOLE
		rename
			make as old_make,
			put_boolean as old_put_boolean,
			put_character as old_put_character,
			put_string as old_put_string,
			put_integer as old_put_integer,
			put_integer_8 as old_put_integer_8,
			put_integer_16 as old_put_integer_16,
			put_integer_32 as old_put_integer_32,
			put_integer_64 as old_put_integer_64,
			put_natural_8 as old_put_natural_8,
			put_natural_16 as old_put_natural_16,
			put_natural_32 as old_put_natural_32,
			put_natural_64 as old_put_natural_64,
			put_new_line as old_put_new_line,
			is_open_write as old_is_open_write,
			flush as old_flush,
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
				old_put_string,
				old_is_open_write
			{CONSOLE} all
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new standard error file.
		do
			make_open_stderr ("stderr")
		ensure
			name_set: name.is_equal ("stderr")
			is_open_write: is_open_write
		end

feature -- Access

	eol: STRING is "%N"
			-- Line separator

feature -- Status report

	is_open_write: BOOLEAN is
			-- Is standard error file opened in write mode?
		do
			Result := old_is_open_write
		end

feature -- Output

	put_character (c: CHARACTER) is
			-- Write `c' to standard error file.
		do
			old_put_character (c)
		end

	put_string (a_string: STRING) is
			-- Write `a_string' to standard error file.
			-- Note: If `a_string' is a UC_STRING or descendant, then
			-- write the bytes of its associated UTF unicode encoding.
		local
			a_string_string: STRING
		do
			a_string_string := STRING_.as_string (a_string)
			old_put_string (a_string_string)
		end

feature -- Basic operations

	flush is
			-- Flush buffered data to disk.
		do
			old_flush
		end

end
