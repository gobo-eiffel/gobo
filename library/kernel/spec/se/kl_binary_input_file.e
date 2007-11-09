indexing

	description:

		"Binary input files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_BINARY_INPUT_FILE

inherit

	KI_BINARY_INPUT_FILE
		undefine

			read_to_string,




			read_to_buffer
		end

	KL_INPUT_FILE






















































	BINARY_FILE_READ
		rename
			make as old_make,
			is_connected as old_is_open_read,
			end_of_input as old_end_of_file,
			disconnect as old_close,
			read_byte as old_read_byte,
			last_byte as old_last_byte
		export
			{NONE} all
		end


create

	make
















feature {NONE} -- Implementation


	old_open_read is
			-- Open file in read-only mode.
		do
			if string_name /= Empty_name then
				connect_to (string_name)
			end
		end

	old_read_character is
			-- Read a new character.
			-- Make result available in `old_last_character'.
		do
			old_read_byte
		end

	old_last_character: CHARACTER is
			-- Last character read with `old_read_character'.
		do
			Result := old_last_byte.to_character
		end






















end
