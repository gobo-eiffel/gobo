indexing
	description: "[
		Commonly used console input and output mechanisms. 
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2006, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class CONSOLE inherit

	PLAIN_TEXT_FILE
		rename
			make_open_read as make_open_stdin,
			make_open_write as make_open_stdout
		export
			{NONE}
				all
			{CONSOLE} open_read, close
			{ANY}
				separator, append, file_pointer, last_character, last_integer,
				last_integer_32, last_integer_8, last_integer_16, last_integer_64,
				last_natural_8, last_natural_16, last_natural, last_natural_32,
				last_natural_64,
				last_real, last_string, last_double, file_readable,
				lastchar, lastint, lastreal, laststring, lastdouble,
				readable, is_closed, extendible, is_open_write
		redefine
			make_open_stdin, make_open_stdout, count, is_empty, exists,
			 read_real, read_double, read_character,
			read_line, read_stream, read_word, next_line,
			put_boolean, put_real, put_double, put_string, put_character,
			put_new_line, new_line, end_of_file, file_close,
			readreal, readdouble, readchar, readline, readstream,
			readword, putbool, putreal, putdouble, putstring, putchar,
			dispose, read_to_string, back,
			read_integer_with_no_type,
			ctoi_convertor

		end

	ANY

create {STD_FILES}
	make_open_stdin, make_open_stdout, make_open_stderr

feature -- Initialization

	make_open_stdin (fn: STRING) is
			-- Create an unix standard input file.
		do
			make (fn)
			file_pointer := console_def (0)
			set_read_mode
		end

	make_open_stdout (fn: STRING) is
			-- Create an unix standard output file.
		do
			make (fn)
			file_pointer := console_def (1)
			set_write_mode
		end

	make_open_stderr (fn: STRING) is
			-- Create an unix standard error file.
		do
			make (fn)
			file_pointer := console_def (2)
			set_write_mode
		end

feature -- Status report

	end_of_file: BOOLEAN is
			-- Have we reached the end of file?
		do
			Result := console_eof (file_pointer)
		end

	exists: BOOLEAN is
			-- Does file exist?
		do
			Result := True
		end

	count: INTEGER is 1
			-- Useless for CONSOLE class.
			--| `count' is non null not to invalidate invariant clauses.

feature -- Removal

	dispose is
			-- This is closed by the operating system at completion.
		do
			-- file_close (file_pointer)
		end

feature {NONE} -- Cursor movement

	back is
			-- Not supported on console
		do
		end

feature -- Input

	read_real, readreal is
			-- Read a new real from standard input.
			-- Make result available in `last_real'.
		do
			last_real := console_readreal (file_pointer)
		end

	read_double, readdouble is
			-- Read a new double from standard input.
			-- Make result available in `last_double'.
		do
			last_double := console_readdouble (file_pointer)
		end

	read_line, readline is
			-- Read a string until new line or end of file.
			-- Make result available in `last_string'.
			-- New line will be consumed but not part of `last_string'.
		require else
			is_readable: file_readable
		local
			str_cap: INTEGER
			read: INTEGER -- Amount of bytes already read
			str_area: ANY
			done: BOOLEAN
		do
			from
				if last_string = Void then
					create_last_string (0)
				end
				str_area := last_string.area
				str_cap := last_string.capacity
			until
				done
			loop
				read := read +
					console_readline (file_pointer, $str_area, str_cap, read)
				if read > str_cap then
						-- End of line not reached yet
						--|The string must be consistently set before
						--|resizing.
					last_string.set_count (str_cap)
					if str_cap < 2048 then
						last_string.grow (str_cap + 1024)
					else
							-- Increase capacity by `Growth_percentage' as
							-- defined in RESIZABLE.
						last_string.automatic_grow
					end
					str_area := last_string.area
					str_cap := last_string.capacity
					read := read - 1	-- True amount of byte read
				else
					last_string.set_count (read)
					done := True
				end
			end
				-- Ensure fair amount of garbage.
			if read < 1024 then
				last_string.resize (read)
			end
		end

	read_stream, readstream (nb_char: INTEGER) is
 			-- Read a string of at most `nb_char' bound characters
			-- from standard input.
			-- Make result available in `last_string'.
		local
			new_count: INTEGER
			str_area: ANY
		do
			if last_string = Void then
				create_last_string (nb_char)
			else
				last_string.grow (nb_char)
			end
			str_area := last_string.area
			new_count := console_readstream (file_pointer, $str_area, nb_char)
			last_string.set_count (new_count)
		end

	read_word, readword is
			-- Read a new word from standard input.
			-- Make result available in `last_string'.
		local
			str_area: ANY
			str_cap: INTEGER
			done: BOOLEAN
			read: INTEGER
		do
			from
				if last_string = Void then
					create_last_string (0)
				end
				str_area := last_string.area
				str_cap := last_string.capacity
			until
				done
			loop
				read := read +
					console_readword (file_pointer, $str_area, str_cap, read)
				if read > str_cap then
						-- End of word not reached yet
					if str_cap < 2048 then
						last_string.grow (str_cap + 1024)
					else
							-- Increase capacity by `Growth_percentage' as
							-- defined in RESIZABLE.
						last_string.automatic_grow
					end
					str_area := last_string.area
					str_cap := last_string.capacity
					read := read - 1	-- True amount of byte read
				else
					last_string.set_count (read)
					done := True
				end
			end
				-- Ensure fair amount of garbage.
			if read < 1024 then
				last_string.resize (read)
			end
			separator := console_separator (file_pointer) -- Look ahead
		end

	read_character, readchar is
			-- Read a new character from standard input.
			-- Make result available in `last_character'.
		do
			last_character := console_readchar (file_pointer)
		end


	next_line is
			-- Move to next input line on standard input.
		do
			console_next_line (file_pointer)
		end

feature -- Output

	put_character, putchar (c: CHARACTER) is
			-- Write `c' at end of default output.
		do
			console_pc (file_pointer, c)
		end

	put_string, putstring (s: STRING) is
			-- Write `s' at end of default output.
		local
			external_s: ANY
		do
			if s.count /= 0 then
				external_s := s.area
				console_ps (file_pointer, $external_s, s.count)
			end
		end

	put_real, putreal (r: REAL) is
			-- Write `r' at end of default output.
		do
			console_pr (file_pointer, r)
		end

	put_double, putdouble (d: DOUBLE) is
			-- Write `d' at end of default output.
		do
			console_pd (file_pointer, d)
		end

	put_boolean, putbool (b: BOOLEAN) is
			-- Write `b' at end of default output.
		do
			if b then
				put_string ("True")
			else
				put_string ("False")
			end
		end

	put_new_line, new_line is
			-- Write line feed at end of default output.
		do
			console_tnwl (file_pointer)
		end

feature {NONE} -- Inapplicable


	is_empty: BOOLEAN is False
			-- Useless for CONSOLE class.
			--| `empty' is false not to invalidate invariant clauses.

feature {NONE} -- Implementation

	ctoi_convertor: STRING_TO_INTEGER_CONVERTOR is
			-- Convertor used to parse string to integer or natural
		once
			create Result.make
			Result.set_leading_separators (internal_leading_separators)
			Result.set_leading_separators_acceptable (True)
			Result.set_trailing_separators_acceptable (False)
		end

	read_integer_with_no_type is
			-- Read a ASCII representation of number of `type'
			-- at current position.
		do
			read_number_sequence (ctoi_convertor, {NUMERIC_INFORMATION}.type_no_limitation)
				-- Consume all left characters.
			consume_characters
		end

	consume_characters is
			-- Consume all characters from current position
			-- until we meet a new-line character.
		do
			from

			until
				end_of_file or last_character = '%N'
			loop
				read_character
			end
		end

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER is
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		do
			Result := file_gss (file_pointer, a_string.area.item_address (pos - 1), nb)
		end

	console_def (number: INTEGER): POINTER is
			-- Convert `number' to the corresponding
			-- file descriptor.
		external
			"C use %"eif_console.h%""
		end

	console_eof (file: POINTER): BOOLEAN is
		external
			"C signature (FILE *): EIF_BOOLEAN use %"eif_console.h%""
		end

	console_separator (file: POINTER): CHARACTER is
			-- ASCII code of character following last word read
		external
			"C signature (FILE *): EIF_CHARACTER use %"eif_console.h%""
		end

	console_ps (file: POINTER; s_name: POINTER; length: INTEGER) is
			-- Write string `s' at end of `file'
		external
			"C signature (FILE *, char *, EIF_INTEGER) use %"eif_console.h%""
		end

	console_pr (file: POINTER; r: REAL) is
			-- Write real `r' at end of `file'
		external
			"C signature (FILE *, EIF_REAL) use %"eif_console.h%""
		end

	console_pc (file: POINTER; c: CHARACTER) is
			-- Write character `c' at end of `file'
		external
			"C signature (FILE *, EIF_CHARACTER) use %"eif_console.h%""
		end

	console_pd (file: POINTER; d: DOUBLE) is
			-- Write double `d' at end of `file'
		external
			"C signature (FILE *, EIF_DOUBLE) use %"eif_console.h%""
		end

	console_pi (file: POINTER; i: INTEGER) is
			-- Write integer `i' at end of `file'
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_console.h%""
		end

	console_tnwl (file: POINTER) is
			-- Write a new_line to `file'
		external
			"C signature (FILE *) use %"eif_console.h%""
		end

	console_readreal (file: POINTER): REAL is
			-- Read a real number from the console
		external
			"C blocking signature (FILE *): EIF_REAL use %"eif_console.h%""
		end

	console_readchar (file: POINTER): CHARACTER is
			-- Read a character from the console
		external
			"C blocking signature (FILE *): EIF_CHARACTER use %"eif_console.h%""
		end

	console_readint (file: POINTER): INTEGER is
			-- Read an integer from the console
		external
			"C blocking signature (FILE *): EIF_INTEGER use %"eif_console.h%""
		end

	console_readdouble (file: POINTER): DOUBLE is
			-- Read a double from the console
		external
			"C blocking signature (FILE *): EIF_DOUBLE use %"eif_console.h%""
		end

	console_readword (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER is
			-- Read a string excluding white space and stripping
			-- leading white space from `file' into `a_string'.
			-- White space characters are: blank, new_line,
			-- tab, vertical tab, formfeed or end of file.
			-- If it does not fit, result is `length' - `begin' + 1,
			-- otherwise result is number of characters read.
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_console.h%""
		end

	console_readline (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER is
			-- Read a stream from the console
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_console.h%""
		end

	console_next_line (file: POINTER) is
			-- Move to next input line on standard input.
		external
			"C blocking signature (FILE *) use %"eif_console.h%""
		end

	console_readstream (file: POINTER; a_string: POINTER; length: INTEGER): INTEGER is
			-- Read a stream from the console
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER): EIF_INTEGER use %"eif_console.h%""
		end

	file_close (file: POINTER) is
			-- Close `file'
		external
			"C signature (FILE *) use %"eif_console.h%""
		alias
			"console_file_close"
		end

end
