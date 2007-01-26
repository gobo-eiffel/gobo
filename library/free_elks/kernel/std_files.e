indexing
	description: "[
		Commonly used input and output mechanisms.
		This class may be used as either ancestor or supplier
		by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class
	STD_FILES

feature -- Access

	input: PLAIN_TEXT_FILE is
			-- Standard input file
		once
			create {CONSOLE} Result.make_open_stdin ("stdin")
		ensure
			input_not_void: Result /= Void
		end

	output: PLAIN_TEXT_FILE is
			-- Standard output file
		once
			create {CONSOLE} Result.make_open_stdout ("stdout")
		ensure
			output_not_void: Result /= Void
		end

	error: PLAIN_TEXT_FILE is
			-- Standard error file
		once
			create {CONSOLE} Result.make_open_stderr ("stderr")
		ensure
			error_not_void: Result /= Void
		end

	default_output: PLAIN_TEXT_FILE
			-- Default output

	standard_default: PLAIN_TEXT_FILE is
			-- Return the `default_output' or `output'
			-- if `default_output' is Void.
			--| Useful if a class inherits from STD_FILES and
			--| and a `putint' is applied without standard setting.
		do
			if default_output = Void then
				Result := output
			else
				Result := default_output
			end
		end

feature -- Status report

	last_character, lastchar: CHARACTER is
			-- Last character read by `read_character'
		do
			Result := input.last_character
		end

	last_integer, lastint, last_integer_32: INTEGER is
			-- Last integer read by `read_integer'
		do
			Result := input.last_integer
		end

	last_integer_8: INTEGER_8 is
			-- Last 8-bit integer read by `read_integer_8'
		do
			Result := input.last_integer_8
		end

	last_integer_16: INTEGER_16 is
			-- Last 16-bit integer read by `read_integer_16'
		do
			Result := input.last_integer_16
		end

	last_integer_64: INTEGER_64 is
			-- Last 8-bit integer read by `read_integer_64'
		do
			Result := input.last_integer_64
		end

	last_natural_8: NATURAL_8 is
			-- Last 8-bit natural read by `read_natural_8'
		do
			Result := input.last_natural_8
		end

	last_natural_16: NATURAL_16 is
			-- Last 16-bit natural read by `read_natural_16'
		do
			Result := input.last_natural_16
		end

	last_natural, last_natural_32: NATURAL_32 is
			-- Last 32-bit natural read by `read_natural_32'
		do
			Result := input.last_natural_32
		end

	last_natural_64: NATURAL_64 is
			-- Last 64-bit natural read by `read_natural_64'
		do
			Result := input.last_natural_64
		end

	last_real, lastreal: REAL is
			-- Last real read by `read_real'
		do
			Result := input.last_real
		end

	last_string, laststring: STRING is
			-- Last string read by `read_line',
			-- `read_stream', or `read_word'
		do
			Result := input.last_string
		end

	last_double, lastdouble: DOUBLE is
			-- Last double read by `read_double'
		do
			Result := input.last_double
		end

feature -- Element change

	set_error_default is
			-- Use standard error as default output.
		do
			default_output := error
		end

	set_file_default (f: PLAIN_TEXT_FILE) is
			-- Use `f' as default output.
		require
			valid_argument: f /= Void
			file_open_write: f.is_open_write
		do
			default_output := f
		end

	set_output_default is
			-- Use standard output as default output.
		do
			default_output := output
		end

	put_character, putchar (c: CHARACTER) is
			-- Write `c' at end of default output.
		do
			standard_default.put_character (c)
		end

	put_string, putstring (s: STRING) is
			-- Write `s' at end of default output.
		require
			string_not_void: s /= Void
		do
			standard_default.put_string (s)
		end

	put_real, putreal (r: REAL) is
			-- Write `r' at end of default output.
		do
			standard_default.put_real (r)
		end

	put_double, putdouble (d: DOUBLE) is
			-- Write `d' at end of default output.
		do
			standard_default.put_double (d)
		end

	put_integer, putint, put_integer_32 (i: INTEGER) is
			-- Write `i' at end of default output.
		do
			standard_default.put_integer (i)
		end

	put_integer_8 (i: INTEGER_8) is
			-- Write `i' at end of default output.
		do
			standard_default.put_integer_8 (i)
		end

	put_integer_16 (i: INTEGER_16) is
			-- Write `i' at end of default output.
		do
			standard_default.put_integer_16 (i)
		end

	put_integer_64 (i: INTEGER_64) is
			-- Write `i' at end of default output.
		do
			standard_default.put_integer_64 (i)
		end

	put_natural_8 (i: NATURAL_8) is
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_8 (i)
		end

	put_natural_16 (i: NATURAL_16) is
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_16 (i)
		end

	put_natural, put_natural_32 (i: NATURAL_32) is
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_32 (i)
		end

	put_natural_64 (i: NATURAL_64) is
			-- Write `i' at end of default output.
		do
			standard_default.put_natural_64 (i)
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
			standard_default.put_new_line
		end

feature -- Input

	read_integer, readint, read_integer_32 is
			-- Read a new 32-bit integer from standard input.
			-- Make result available in `last_integer'.
		do
			input.read_integer
		end

	read_integer_8 is
			-- Read a new 8-bit integer from standard input.
			-- Make result available in `last_integer_8'.
		do
			input.read_integer_8
		end

	read_integer_16 is
			-- Read a new 16-bit integer from standard input.
			-- Make result available in `last_integer_16'.
		do
			input.read_integer_16
		end

	read_integer_64 is
			-- Read a new 64-bit integer from standard input.
			-- Make result available in `last_integer_64'.
		do
			input.read_integer_64
		end

	read_natural_8 is
			-- Read a new 8-bit natural from standard input.
			-- Make result available in `last_natural_8'.
		do
			input.read_natural_8
		end

	read_natural_16 is
			-- Read a new 16-bit natural from standard input.
			-- Make result available in `last_natural_16'.
		do
			input.read_natural_16
		end

	read_natural, read_natural_32 is
			-- Read a new 32-bit natural from standard input.
			-- Make result available in `last_natural'.
		do
			input.read_natural_32
		end

	read_natural_64 is
			-- Read a new 64-bit natural from standard input.
			-- Make result available in `last_natural_64'.
		do
			input.read_natural_64
		end

	read_real, readreal is
			-- Read a new real from standard input.
			-- Make result available in `last_real'.
		do
			input.read_real
		end

	read_double, readdouble is
			-- Read a new double from standard input.
			-- Make result available in `last_double'.
		do
			input.read_double
		end

	read_line, readline is
			-- Read a line from standard input.
			-- Make result available in `last_string'.
		do
			input.read_line
		ensure
			last_string_not_void: last_string /= Void
		end

	read_stream, readstream (nb_char: INTEGER) is
 			-- Read a string of at most `nb_char' bound characters
			-- from standard input.
			-- Make result available in `last_string'.
		do
			input.read_stream (nb_char)
		ensure
			last_string_not_void: last_string /= Void
		end

	read_word, readword is
			-- Read a new word from standard input.
			-- Make result available in `last_string'.
		do
			input.read_word
		ensure
			last_string_not_void: last_string /= Void
		end

	read_character, readchar is
			-- Read a new character from standard input.
			-- It will not return until read operation is
			-- terminated when enter key is pressed.
			-- Make result available in `last_character'.
			-- `last_character' will also contains platform
			-- specific newline character.
		do
			input.read_character
		end

	to_next_line, next_line is
			-- Move to next input line on standard input.
		do
			input.next_line
		end

end
