note

	description:

		"Text input files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The line separtor of the %
		%underlying file system is automatically converted to %%N %
		%when read from the file. However `read_line' and `read_new_line' %
		%are able to recognize '%%N', '%%R%%N' and '%%R' as line separators."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEXT_INPUT_FILE

inherit

	KI_TEXT_INPUT_FILE
		undefine
			read_to_string,
			read_to_buffer
		end

	KL_INPUT_FILE
		redefine
			last_character,
			last_string
		end

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
			put_boolean as old_put_boolean,
			put_new_line as old_put_new_line,
			read_character as old_read_character,
			read_stream as old_read_stream,
			read_line as old_read_line,
			read_to_string as old_read_to_string,
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
		undefine
			file_readable
		redefine
			old_open_read,
			last_character,
			last_string
		end

create

	make

feature -- Access

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

	read_line
			-- Read characters from input file until a line separator
			-- or end of file is reached. Make the characters that have
			-- been read available in `last_string' and discard the line
			-- separator characters from the input file.
			-- Line separators recognized by current file are: '%N',
			-- '%R%N and '%R'.
		local
			done: BOOLEAN
			a_target: STRING_8
			c: CHARACTER_8
			is_eof: BOOLEAN
			has_carriage: BOOLEAN
		do
			STRING_.wipe_out (last_string)
			is_eof := True
			a_target := last_string
			from until done loop
				read_character
				if end_of_file then
					done := True
				else
					is_eof := False
					c := last_character
					inspect c
					when '%N' then
						done := True
					when '%R' then
						has_carriage := True
					else
						if has_carriage then
								-- Put character back to input file.
							unread_character (c)
							done := True
						else
							a_target.append_character (c)
						end
					end
				end
			end
			end_of_file := is_eof
		end

	read_new_line
			-- Read a line separator from input file.
			-- Make the characters making up the recognized
			-- line separator available in `last_string',
			-- or make `last_string' empty and leave the
			-- input file unchanged if no line separator
			-- was found.
			-- Line separators recognized by current file are:
			-- '%N', '%R%N and '%R'.
		do
			STRING_.wipe_out (last_string)
			read_character
			if not end_of_file then
				inspect last_character
				when '%N' then
					last_string.append_character ('%N')
				when '%R' then
					last_string.append_character ('%R')
					read_character
					if not end_of_file then
						if last_character = '%N' then
							last_string.append_character ('%N')
						else
								-- Put character back to input file.
							unread_character (last_character)
						end
					end
				else
						-- Put character back to input file.
					unread_character (last_character)
				end
			end
			end_of_file := False
		end

feature {PLAIN_TEXT_FILE} -- Implementation

	old_open_read
			-- Open file in read-only mode.
		do
			precursor
			if file_pointer = default_pointer then
				mode := Closed_file
				descriptor_available := False
			end
		end

end
