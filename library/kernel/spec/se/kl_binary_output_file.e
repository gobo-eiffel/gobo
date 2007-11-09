indexing

	description:

		"Binary output files containing extended ASCII %
		%characters (8-bit code between 0 and 255)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2006, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_BINARY_OUTPUT_FILE

inherit

	KI_BINARY_OUTPUT_FILE






	KL_OUTPUT_FILE
















































	BINARY_FILE_WRITE
		rename
			flush as old_flush,
			make as old_make,
			is_connected as old_is_open_write,
			disconnect as old_close
		export
			{NONE} all
		end


create

	make


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

	old_put_character (c: CHARACTER) is
			-- Write `c' at current position.
		do
			put_byte (c.code)
		end

	old_put_string (s: STRING) is
			-- Write `s' at current position.
		local
			i, nb: INTEGER
		do
			nb := s.count
			from i := 1 until i > nb loop
				old_put_character (s.item (i))
				i := i + 1
			end
		end
































end
