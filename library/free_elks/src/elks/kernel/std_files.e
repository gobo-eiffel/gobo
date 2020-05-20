note
	description: "[
		Commonly used input and output mechanisms.
		This class may be used as either ancestor or supplier
		by classes needing its facilities.
	]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	STD_FILES

feature -- Access

	input: PLAIN_TEXT_FILE
			-- Standard input file
		once
			create {CONSOLE} Result.make_open_stdin ("stdin")
		ensure
			instance_free: class
			input_not_void: Result /= Void
		end

	output: PLAIN_TEXT_FILE
			-- Standard output file
		once
			create {CONSOLE} Result.make_open_stdout ("stdout")
		ensure
			instance_free: class
			output_not_void: Result /= Void
		end

	error: PLAIN_TEXT_FILE
			-- Standard error file
		once
			create {CONSOLE} Result.make_open_stderr ("stderr")
		ensure
			instance_free: class
			error_not_void: Result /= Void
		end

	default_output: detachable PLAIN_TEXT_FILE
			-- Default output

	standard_default: PLAIN_TEXT_FILE
			-- Return the `default_output' or `output'
			-- if `default_output' is Void.
			--| Useful if a class inherits from STD_FILES and
			--| and a `putint' is applied without standard setting.
		do
			Result := default_output
			if Result = Void then
				Result := output
			end
		end

feature -- Status report

	last_character, lastchar: CHARACTER
			-- Last character read by `read_character'
		do
			Result := input.last_character
		ensure
			instance_free: class
		end

	last_integer, lastint, last_integer_32: INTEGER
			-- Last integer read by `read_integer'
		do
			Result := input.last_integer
		ensure
			instance_free: class
		end

	last_integer_8: INTEGER_8
			-- Last 8-bit integer read by `read_integer_8'
		do
			Result := input.last_integer_8
		ensure
			instance_free: class
		end

	last_integer_16: INTEGER_16
			-- Last 16-bit integer read by `read_integer_16'
		do
			Result := input.last_integer_16
		ensure
			instance_free: class
		end

	last_integer_64: INTEGER_64
			-- Last 8-bit integer read by `read_integer_64'
		do
			Result := input.last_integer_64
		ensure
			instance_free: class
		end

	last_natural_8: NATURAL_8
			-- Last 8-bit natural read by `read_natural_8'
		do
			Result := input.last_natural_8
		ensure
			instance_free: class
		end

	last_natural_16: NATURAL_16
			-- Last 16-bit natural read by `read_natural_16'
		do
			Result := input.last_natural_16
		ensure
			instance_free: class
		end

	last_natural, last_natural_32: NATURAL_32
			-- Last 32-bit natural read by `read_natural_32'
		do
			Result := input.last_natural_32
		ensure
			instance_free: class
		end

	last_natural_64: NATURAL_64
			-- Last 64-bit natural read by `read_natural_64'
		do
			Result := input.last_natural_64
		ensure
			instance_free: class
		end

	last_real, lastreal, last_real_32: REAL_32
			-- Last real read by `read_real'
		do
			Result := input.last_real
		ensure
			instance_free: class
		end

	last_string, laststring: STRING
			-- Last string read by `read_line',
			-- `read_stream', or `read_word'
		do
			Result := input.last_string
		ensure
			instance_free: class
		end

	last_double, lastdouble, last_real_64: REAL_64
			-- Last double read by `read_double'.
		do
			Result := input.last_double
		ensure
			instance_free: class
		end

feature -- Element change

	set_error_default
			-- Use standard error as default output.
		do
			default_output := error
		end

	set_file_default (f: PLAIN_TEXT_FILE)
			-- Use `f' as default output.
		require
			valid_argument: f /= Void
			file_open_write: f.is_open_write
		do
			default_output := f
		end

	set_output_default
			-- Use standard output as default output.
		do
			default_output := output
		end

	put_character, putchar (c: CHARACTER_8)
			-- Write `c' at end of default output.
		do
			standard_default.put_character (c)
		end

	put_string, putstring (s: READABLE_STRING_8)
			-- Write `s' at end of default output.
		require
			string_not_void: s /= Void
		do
			standard_default.put_string (s)
		end

	put_string_32 (s: READABLE_STRING_32)
			-- Write `s' at end of default output.
		require
			string_not_void: s /= Void
		do
			standard_default.put_string_32 (s)
		end

	put_real, putreal, put_real_32 (r: REAL_32)
			-- Write `r' at end of default output.
		do
			standard_default.put_real (r)
		end

	put_double, putdouble, put_real_64 (d: REAL_64)
			-- Write `d' at end of default output.
		do
			standard_default.put_double (d)
		end

	put_integer, putint, put_integer_32 (i: INTEGER)
			-- Write `i' at end of default output.
		do
			standard_default.put_integer (i)
		end

	put_integer_8 (i: INTEGER_8)
			-- Write `i' at end of default output.
		do
			standard_default.put_integer_8 (i)
		end

	put_integer_16 (i: INTEGER_16)
			-- Write `i' at end of default output.
		do
			standard_default.put_integer_16 (i)
		end

	put_integer_64 (i: INTEGER_64)
			-- Write `i' at end of default output.
		do
			standard_default.put_integer_64 (i)
		end

	put_natural_8 (i: NATURAL_8)
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_8 (i)
		end

	put_natural_16 (i: NATURAL_16)
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_16 (i)
		end

	put_natural, put_natural_32 (i: NATURAL_32)
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_32 (i)
		end

	put_natural_64 (i: NATURAL_64)
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_64 (i)
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
			standard_default.put_new_line
		end

feature -- Input

	read_integer, readint, read_integer_32
			-- Read a new 32-bit integer from standard input.
			-- Make result available in `last_integer'.
		do
			input.read_integer
		ensure
			instance_free: class
		end

	read_integer_8
			-- Read a new 8-bit integer from standard input.
			-- Make result available in `last_integer_8'.
		do
			input.read_integer_8
		ensure
			instance_free: class
		end

	read_integer_16
			-- Read a new 16-bit integer from standard input.
			-- Make result available in `last_integer_16'.
		do
			input.read_integer_16
		ensure
			instance_free: class
		end

	read_integer_64
			-- Read a new 64-bit integer from standard input.
			-- Make result available in `last_integer_64'.
		do
			input.read_integer_64
		ensure
			instance_free: class
		end

	read_natural_8
			-- Read a new 8-bit natural from standard input.
			-- Make result available in `last_natural_8'.
		do
			input.read_natural_8
		ensure
			instance_free: class
		end

	read_natural_16
			-- Read a new 16-bit natural from standard input.
			-- Make result available in `last_natural_16'.
		do
			input.read_natural_16
		ensure
			instance_free: class
		end

	read_natural, read_natural_32
			-- Read a new 32-bit natural from standard input.
			-- Make result available in `last_natural'.
		do
			input.read_natural_32
		ensure
			instance_free: class
		end

	read_natural_64
			-- Read a new 64-bit natural from standard input.
			-- Make result available in `last_natural_64'.
		do
			input.read_natural_64
		ensure
			instance_free: class
		end

	read_real, readreal
			-- Read a new real from standard input.
			-- Make result available in `last_real'.
		do
			input.read_real
		ensure
			instance_free: class
		end

	read_double, readdouble
			-- Read a new double from standard input.
			-- Make result available in `last_double'.
		do
			input.read_double
		ensure
			instance_free: class
		end

	read_line, readline
			-- Read a line from standard input.
			-- Make result available in `last_string'.
		do
			input.read_line
		ensure
			instance_free: class
			last_string_not_void: last_string /= Void
		end

	read_stream, readstream (nb_char: INTEGER)
 			-- Read a string of at most `nb_char' bound characters
			-- from standard input.
			-- Make result available in `last_string'.
		do
			input.read_stream (nb_char)
		ensure
			instance_free: class
			last_string_not_void: last_string /= Void
		end

	read_word, readword
			-- Read a new word from standard input.
			-- Make result available in `last_string'.
		do
			input.read_word
		ensure
			instance_free: class
			last_string_not_void: last_string /= Void
		end

	read_character, readchar
			-- Read a new character from standard input.
			-- It will not return until read operation is
			-- terminated when enter key is pressed.
			-- Make result available in `last_character'.
			-- `last_character' will also contains platform
			-- specific newline character.
		do
			input.read_character
		ensure
			instance_free: class
		end

	to_next_line, next_line
			-- Move to next input line on standard input.
		do
			input.next_line
		ensure
			instance_free: class
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
