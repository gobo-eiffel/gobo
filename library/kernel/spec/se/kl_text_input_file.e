indexing

	description:

		"Text input files containing extended ASCII characters %
		%(8-bit code between 0 and 255). The line separtor of the %
		%underlying file system is automatically converted to %%N %
		%when read from the file. However `read_line' and `read_new_line' %
		%are able to recognize '%%N', '%%R%%N' and '%%R' as line separators."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2006, Eric Bezault and others"
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




























































	TEXT_FILE_READ
		rename
			make as old_make,
			is_connected as old_is_open_read,
			end_of_input as old_end_of_file,
			last_character as old_last_character,
			read_character as old_read_character,
			unread_character as old_unread_character,
			read_line as old_read_line,
			disconnect as old_close
		export
			{TEXT_FILE_READ} old_close, old_is_open_read, end_reached, buffer, fill_buffer, buffer_size, old_read_character, old_end_of_file, old_last_character;
			{NONE} all
		undefine
			last_string
		end


create

	make

feature -- Access













	eol: STRING is "%N"
			-- Line separator

feature -- Input





















































































	read_line is
			-- Read characters from input file until a line separator
			-- or end of file is reached. Make the characters that have
			-- been read available in `last_string' and discard the line
			-- separator characters from the input file.
			-- Line separators recognized by current file are: '%N',
			-- '%R%N and '%R'.
		local
			done: BOOLEAN
			a_target: STRING
			c: CHARACTER
			is_eof: BOOLEAN
			has_carriage: BOOLEAN
		do
			if last_string = Void then



				create last_string.make (256)

			else




				last_string.wipe_out

			end
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

	read_new_line is
			-- Read a line separator from input file.
			-- Make the characters making up the recognized
			-- line separator available in `last_string',
			-- or make `last_string' empty and leave the
			-- input file unchanged if no line separator
			-- was found.
			-- Line separators recognized by current file are:
			-- '%N', '%R%N and '%R'.
		do
			if last_string = Void then



				create last_string.make (256)

			else




				last_string.wipe_out

			end
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


feature {NONE} -- Implementation


	old_open_read is
			-- Open file in read-only mode.
		do
			if string_name /= Empty_name then
				connect_to (string_name)
			end
		end






















end
