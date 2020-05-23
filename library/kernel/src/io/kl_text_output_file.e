note

	description:

		"Text output files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The character '%%N' is %
		%automatically converted to the line separtor of %
		%the underlying file system when written to the file."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEXT_OUTPUT_FILE

inherit

	KI_TEXT_OUTPUT_FILE

	KL_OUTPUT_FILE

	PLAIN_TEXT_FILE
		rename
			make as old_make_obsolete,
			make_with_name as old_make,
			name as string_name,
			count as old_count,
			exists as old_exists,
			is_readable as old_is_readable,
			is_open_read as old_is_open_read,
			is_open_write as old_is_open_write,
			end_of_file as old_end_of_file,
			is_closed as old_is_closed,
			open_read as old_open_read,
			open_write as old_open_write,
			open_append as old_open_append,
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
			put_boolean as old_put_boolean,
			put_new_line as old_put_new_line,
			read_character as old_read_character,
			read_stream as old_read_stream,
			read_line as old_read_line,
			change_name as old_change_name,
			change_mode as old_change_mode,
			flush as old_flush,
			close as old_close,
			delete as old_delete,
			reset as old_reset,
			append as old_append
		export
			{PLAIN_TEXT_FILE} old_open_read, extendible, file_pointer, old_count, old_close, old_is_closed, old_put_string, old_is_open_write;
			{PLAIN_TEXT_FILE} all
		redefine
			old_open_write,
			old_open_append
		end

create

	make

feature -- Access

	eol: STRING_8 = "%N"
			-- Line separator

feature {PLAIN_TEXT_FILE} -- Implementation

	old_open_write
			-- Open file in write-only mode;
			-- create it if it does not exist.
		do
			precursor
			if file_pointer = default_pointer then
				mode := Closed_file
				descriptor_available := False
			end
		end

	old_open_append
			-- Open file in append-only mode;
			-- create it if it does not exist.
		do
			precursor
			if file_pointer = default_pointer then
				mode := Closed_file
				descriptor_available := False
			end
		end

end
