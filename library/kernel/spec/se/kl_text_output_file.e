indexing

	description:

		"Text output files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The character '%%N' is %
		%automatically converted to the line separtor of %
		%the underlying file system when written to the file."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEXT_OUTPUT_FILE

inherit

	KI_TEXT_OUTPUT_FILE






	KL_OUTPUT_FILE






















































	TEXT_FILE_WRITE
		rename
			make as old_make,
			is_connected as old_is_open_write,
			put_character as old_put_character,
			put_string as old_put_string,
			put_integer as old_put_integer,
			put_boolean as old_put_boolean,
			put_new_line as old_put_new_line,
			disconnect as old_close,
			flush as old_flush
		export
			{NONE} all
		end


create

	make

feature -- Access

	eol: STRING is "%N"
			-- Line separator








































feature {NONE} -- Implementation


	old_open_write is
			-- Open file in write mode.
		do
			if string_name /= Empty_name then
				connect_to (string_name)
			end
		end

	old_open_append is
			-- Open file in append mode.
		do
			if string_name /= Empty_name then
				connect_for_appending_to (string_name)
			end
		end
































end
