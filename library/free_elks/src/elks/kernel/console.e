note
	description: "[
		Commonly used console input and output mechanisms. 
		This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
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
				readable, is_closed, extendible, is_open_write,
				putint, put_integer, put_integer_8, put_integer_16, put_integer_32, put_integer_64,
				readint, read_integer, read_integer_8, read_integer_16, read_integer_32, read_integer_64,
				put_natural, put_natural_8, put_natural_16, put_natural_32, put_natural_64,
				read_natural, read_natural_8, read_natural_16, read_natural_32, read_natural_64
		redefine
			initialize_encoding, detect_encoding,
			make_open_stdin, make_open_stdout, count, is_empty, exists,
			read_real, read_double, read_character,
			read_line, read_stream, read_word, next_line,
			put_boolean, put_real, put_double, put_string, put_character,
			put_new_line, new_line, end_of_file, file_close,
			readreal, readdouble, readchar, readline, readstream,
			readword, putbool, putreal, putdouble, putstring, putchar,
			dispose, read_to_string, back, read_line_thread_aware,
			read_stream_thread_aware, read_word_thread_aware,
			read_integer_with_no_type,
			ctoi_convertor,
			new_cursor
		end

	ANY

create {STD_FILES}
	make_open_stdin, make_open_stdout, make_open_stderr

feature -- Initialization

	make_open_stdin (fn: READABLE_STRING_GENERAL)
			-- Create a standard input file.
		do
			make_with_name (fn)
			file_pointer := console_def (0)
			set_read_mode
		end

	make_open_stdout (fn: READABLE_STRING_GENERAL)
			-- Create a standard output file.
		do
			make_with_name (fn)
			file_pointer := console_def (1)
			set_write_mode
		end

	make_open_stderr (fn: READABLE_STRING_GENERAL)
			-- Create a standard error file.
		do
			make_with_name (fn)
			file_pointer := console_def (2)
			set_write_mode
		end

	initialize_encoding
			-- <Precursor/>
		do
			Precursor
			encoding := {SYSTEM_ENCODINGS}.console_encoding
		end

feature -- Encoding

	detect_encoding
			-- <Precursor/>
		do
			encoding := {SYSTEM_ENCODINGS}.console_encoding
		end

feature -- Status report

	end_of_file: BOOLEAN
			-- Have we reached the end of file?
		do
			Result := console_eof (file_pointer)
		end

	exists: BOOLEAN
			-- Does file exist?
		do
			Result := True
		end

	count: INTEGER = 1
			-- Useless for CONSOLE class.
			--| `count' is non null not to invalidate invariant clauses.

feature -- Removal

	dispose
			-- This is closed by the operating system at completion.
		do
			-- file_close (file_pointer)
		end

feature {NONE} -- Cursor movement

	back
			-- Not supported on console
		do
		end

feature -- Iteration

	new_cursor: FILE_ITERATION_CURSOR
			-- <Precursor>
		do
			if is_open_read then
				create Result.make_open_stdin
			else
				create Result.make_empty
			end
		end

feature -- Input

	read_real, readreal
			-- Read a new real from standard input.
			-- Make result available in `last_real'.
		do
			last_real := console_readreal (file_pointer)
		end

	read_double, readdouble
			-- Read a new double from standard input.
			-- Make result available in `last_double'.
		do
			last_double := console_readdouble (file_pointer)
		end

	read_line, readline
			-- Read a string until new line or end of file.
			-- Make result available in `last_string'.
			-- New line will be consumed but not part of `last_string'.
		require else
			is_readable: file_readable
		do
			read_line_thread_aware
		end

	read_line_thread_aware
			-- <Precursor>
		require else
			is_readable: file_readable
		local
			str_cap: INTEGER
			read: INTEGER	-- Amount of bytes already read
			done: BOOLEAN
			l: like last_string
			l_old_count, l_new_count: INTEGER
			l_buffer: like read_data_buffer
		do
			l := last_string
			l_buffer := read_data_buffer
			from
				l.wipe_out
				str_cap := l_buffer.capacity
			until
				done
			loop
				read := console_readline (file_pointer, l_buffer.item, str_cap, 0)
				l_old_count := l.count
				l_new_count := l_old_count + read.min (str_cap)
				done := read <= str_cap
				l.grow (l_new_count)
				l.set_count (l_new_count)
				l_buffer.copy_to_string (l, 1, l_old_count + 1, read.min (str_cap))
			end
		end

	read_stream, readstream (nb_char: INTEGER)
 			-- Read a string of at most `nb_char' bound characters
			-- from standard input.
			-- Make result available in `last_string'.
		do
			read_stream_thread_aware (nb_char)
		end

	read_stream_thread_aware (nb_char: INTEGER)
			-- <Precursor>
		local
			new_count: INTEGER
			l_buffer: like read_data_buffer
			l_str: like last_string
		do
			l_str := last_string
			l_buffer := read_data_buffer
			l_buffer.set_count (nb_char)
			new_count := console_readstream (file_pointer, l_buffer.item, nb_char)
			l_buffer.set_count (new_count)
			l_str.grow (new_count)
			l_str.set_count (new_count)
			l_buffer.read_string_into (l_str)
		end

	read_word, readword
			-- Read a new word from standard input.
			-- Make result available in `last_string'.
		do
			read_word_thread_aware
		end

	read_word_thread_aware
			-- <Precursor>
		local
			str_cap: INTEGER
			read: INTEGER	-- Amount of bytes already read
			done: BOOLEAN
			l: like last_string
			l_old_count, l_new_count: INTEGER
			l_buffer: like read_data_buffer
		do
			l := last_string
			l_buffer := read_data_buffer
			from
				l.wipe_out
				str_cap := l_buffer.capacity
			until
				done
			loop
				read := console_readword (file_pointer, l_buffer.item, str_cap, 0)
				l_old_count := l.count
				l_new_count := l_old_count + read.min (str_cap)
				done := read <= str_cap
				l.grow (l_new_count)
				l.set_count (l_new_count)
				l_buffer.copy_to_string (l, 1, l_old_count + 1, read.min (str_cap))
			end
			separator := console_separator (file_pointer) -- Look ahead
		end

	read_character, readchar
			-- Read a new character from standard input.
			-- Make result available in `last_character'.
		do
			last_character := console_readchar (file_pointer)
		end

	next_line
			-- Move to next input line on standard input.
		do
			console_next_line (file_pointer)
		end

feature -- Output

	put_character, putchar (c: CHARACTER_8)
			-- Write `c' at end of default output.
		do
			console_pc (file_pointer, c)
		end

	put_string, putstring (s: READABLE_STRING_8)
			-- Write `s' at end of default output.
		local
			n: like {READABLE_STRING_8}.count
			external_s: ANY
		do
			n := s.count
			if n > 0 then
				external_s := s.area
				console_ps (file_pointer, $external_s, n)
			end
		end

	put_real, putreal (r: REAL_32)
			-- Write `r' at end of default output.
		do
			console_pr (file_pointer, r)
		end

	put_double, putdouble (d: REAL_64)
			-- Write `d' at end of default output.
		do
			console_pd (file_pointer, d)
		end

	put_boolean, putbool (b: BOOLEAN)
			-- Write `b' at end of default output.
		do
			if b then
				put_string ("True")
			else
				put_string ("False")
			end
		end

	put_new_line, new_line
			-- Write line feed at end of default output.
		do
			console_tnwl (file_pointer)
		end

feature {NONE} -- Inapplicable

	is_empty: BOOLEAN = False
			-- Useless for CONSOLE class.
			--| `empty' is false not to invalidate invariant clauses.

feature {FILE_ITERATION_CURSOR} -- Iteration

	console_def (number: INTEGER): POINTER
			-- Convert `number' to the corresponding
			-- file descriptor.
		external
			"C use %"eif_console.h%""
		end

feature {NONE} -- Implementation

	ctoi_convertor: STRING_TO_INTEGER_CONVERTOR
			-- Convertor used to parse string to integer or natural
		once
			create Result.make
			Result.set_leading_separators (internal_leading_separators)
			Result.set_leading_separators_acceptable (True)
			Result.set_trailing_separators_acceptable (False)
		end

	read_integer_with_no_type
			-- Read a ASCII representation of number of `type'
			-- at current position.
		do
			read_number_sequence (ctoi_convertor, {NUMERIC_INFORMATION}.type_no_limitation)
				-- Consume all left characters.
			consume_characters
		end

	consume_characters
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

	read_to_string (a_string: STRING; pos, nb: INTEGER): INTEGER
			-- Fill `a_string', starting at position `pos' with at
			-- most `nb' characters read from current file.
			-- Return the number of characters actually read.
		do
			Result := file_gss (file_pointer, a_string.area.item_address (pos - 1), nb)
				-- `a_string' was externally modified, we need to reset its `hash_code'.
			a_string.reset_hash_codes
		end

	console_eof (file: POINTER): BOOLEAN
		external
			"C signature (FILE *): EIF_BOOLEAN use %"eif_console.h%""
		end

	console_separator (file: POINTER): CHARACTER
			-- ASCII code of character following last word read
		external
			"C signature (FILE *): EIF_CHARACTER use %"eif_console.h%""
		end

	console_ps (file: POINTER; s: POINTER; length: INTEGER)
			-- Write string `s' at end of `file'
		external
			"C signature (FILE *, char *, EIF_INTEGER) use %"eif_console.h%""
		end

	console_pr (file: POINTER; r: REAL_32)
			-- Write real `r' at end of `file'
		external
			"C signature (FILE *, EIF_REAL) use %"eif_console.h%""
		end

	console_pc (file: POINTER; c: CHARACTER)
			-- Write character `c' at end of `file'
		external
			"C signature (FILE *, EIF_CHARACTER) use %"eif_console.h%""
		end

	console_pd (file: POINTER; d: REAL_64)
			-- Write double `d' at end of `file'
		external
			"C signature (FILE *, EIF_DOUBLE) use %"eif_console.h%""
		end

	console_pi (file: POINTER; i: INTEGER)
			-- Write integer `i' at end of `file'
		external
			"C signature (FILE *, EIF_INTEGER) use %"eif_console.h%""
		end

	console_tnwl (file: POINTER)
			-- Write a new_line to `file'
		external
			"C signature (FILE *) use %"eif_console.h%""
		end

	console_readreal (file: POINTER): REAL_32
			-- Read a real number from the console
		external
			"C blocking signature (FILE *): EIF_REAL use %"eif_console.h%""
		end

	console_readchar (file: POINTER): CHARACTER_8
			-- Read a character from the console
		external
			"C blocking signature (FILE *): EIF_CHARACTER use %"eif_console.h%""
		end

	console_readint (file: POINTER): INTEGER
			-- Read an integer from the console
		external
			"C blocking signature (FILE *): EIF_INTEGER use %"eif_console.h%""
		end

	console_readdouble (file: POINTER): REAL_64
			-- Read a double from the console
		external
			"C blocking signature (FILE *): EIF_DOUBLE use %"eif_console.h%""
		end

	console_readword (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER
			-- Read a string excluding white space and stripping
			-- leading white space from `file' into `a_string'.
			-- White space characters are: blank, new_line,
			-- tab, vertical tab, formfeed or end of file.
			-- If it does not fit, result is `length' - `begin' + 1,
			-- otherwise result is number of characters read.
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_console.h%""
		end

	console_readline (file: POINTER; a_string: POINTER; length, begin: INTEGER): INTEGER
			-- Read a stream from the console
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER, EIF_INTEGER): EIF_INTEGER use %"eif_console.h%""
		end

	console_next_line (file: POINTER)
			-- Move to next input line on standard input.
		external
			"C blocking signature (FILE *) use %"eif_console.h%""
		end

	console_readstream (file: POINTER; a_string: POINTER; length: INTEGER): INTEGER
			-- Read a stream from the console
		external
			"C blocking signature (FILE *, char *, EIF_INTEGER): EIF_INTEGER use %"eif_console.h%""
		end

	file_close (file: POINTER)
			-- Close `file'
		external
			"C signature (FILE *) use %"eif_console.h%""
		alias
			"console_file_close"
		end

note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
