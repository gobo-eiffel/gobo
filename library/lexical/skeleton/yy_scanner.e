indexing

	description:

		"General lexical analyzers";

	library:    "Gobo Eiffel Lexical Library";
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>";
	copyright:  "Copyright (c) 1997, Eric Bezault";
	date:       "$Date$";
	revision:   "$Revision$"

deferred class YY_SCANNER

feature {NONE} -- Initialization

	make is
			-- Create a new scanner with
			-- standard input as input file.
		do
			make_with_file (io.input)
		end

#ifndef ISE || HACT
	make_with_file (a_file: FILE) is
#else
	make_with_file (a_file: IO_MEDIUM) is
#endif
			-- Create a new scanner with
			-- `a_file' as input file.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			make_with_buffer (new_file_buffer (a_file))
		end

	make_with_buffer (a_buffer: like input_buffer) is
			-- Create a new scanner with
			-- `a_buffer' as input buffer.
		require
			a_buffer_not_void: a_buffer /= Void
		do
			output_file := io.output
			input_buffer := a_buffer
		ensure
			input_buffer_set: input_buffer = a_buffer
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input source.
			-- (This routine can be called in `wrap' before scanning
			-- another input buffer.)
		deferred
		end

feature -- Access

	last_token: INTEGER
			-- Code of last token read

	text: STRING is
			-- Text of last token read
			-- (Create a new string at each call.)
		deferred
		ensure
			text_not_void: Result /= Void
			correct_count: Result.count = text_count
		end

	text_count: INTEGER is
			-- Length of last token read
		deferred
		ensure
			positive_count: Result >= 0
		end

	text_item (i: INTEGER): CHARACTER is
			-- `i'-th character of last token read
		require
			i_large_enough: i >= 1
			i_small_enough: i <= text_count
		deferred
		ensure
			definition: Result = text.item (i)
		end

	text_substring (s, e: INTEGER): STRING is
			-- Substring of last token read
			-- (Create a new string at each call.)
		require
			meaningful_start: 1 <= s
			meaningful_interval: s + 1 <= e
			meaningful_end: e <= text_count
		deferred
		ensure
			text_substring_not_void: Result /= Void
			text_substring_empty: (s > e) implies Result.empty
			definition: s <= e implies Result.is_equal (text.substring (s, e))
		end

	start_condition: INTEGER is
			-- Start condition
		deferred
		end

feature -- Setting

	set_last_token (a_token: like last_token) is
			-- Set `last_token' to `a_token'.
		deferred
		ensure
			last_token_set: last_token = a_token
		end

	set_start_condition (a_start_condition: INTEGER) is
			-- Set `start_condition' to `a_start_condition'.
		deferred
		ensure
			start_condition_set: start_condition = a_start_condition
		end

feature -- Scanning

	scan is
			-- Scan `input_buffer' until end of file is found.
		do
			from
				read_token
			until
				last_token = 0
			loop
				read_token
			end
		ensure
			end_of_file: last_token = 0
		end

	read_token is
			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		deferred
		end

feature -- Element change

	terminate is
			-- Terminate scanner and set `last_token'
			-- to 0 indicating "all done".
		do
			last_token := 0
		end

	wrap: BOOLEAN is
			-- Should current scanner terminate when end of file is reached?
			-- This function can be redefined to switch to another input
			-- buffer (but don't forget to update `start_condition'.
		do
			Result := True
		end

	more is
			-- Tell scanner to append the next matched token
			-- to current value of `text' instead of 
			-- replacing it.
		deferred
		end

	less (n: INTEGER) is
			-- Return all but the first `n' matched
			-- characters back to `input_buffer'.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= text_count
		deferred
		ensure
			text_count_set: text_count = n
		end

	unread_character (c: CHARACTER) is
			-- Put `c' back to `input_buffer'. This will alter both
			-- `text' and the content of `input_buffer'.
		deferred
		end

	read_character is
			-- Read a character from `input_buffer'.
			-- Make result available in `last_character'.
		deferred
		end

	last_character: CHARACTER
			-- Last character read by `read_character'

feature -- Input

	input_buffer: YY_BUFFER
			-- Input buffer

	set_input_buffer (a_buffer: like input_buffer) is
			-- Set `input_buffer' to `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
		do
			input_buffer := a_buffer
		ensure
			input_buffer_set: input_buffer = a_buffer
		end

	flush_input_buffer is
			-- Flush `input_buffer'. `input_buffer' will be automatically
			-- refilled unless end of file has been found.
		do
			input_buffer.flush
		ensure
			flushed: input_buffer.count = 0
		end

#ifndef ISE || HACT
	new_file_buffer (a_file: FILE): YY_BUFFER is
#else
	new_file_buffer (a_file: IO_MEDIUM): YY_BUFFER is
#endif
			-- New input buffer for `a_file'
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		do
			!YY_FILE_BUFFER! Result.make (a_file)
		ensure
			new_buffer_not_void: Result /= Void
		end

	new_string_buffer (a_string: STRING): YY_BUFFER is
			-- New input buffer for `a_string'
		require
			a_string_not_void: a_string /= Void
		do
			!! Result.make (a_string)
		ensure
			new_buffer_not_void: Result /= Void
		end

feature -- Output

#ifndef ISE || HACT
	output_file: FILE
#else
	output_file: IO_MEDIUM
#endif
			-- Output file

	set_output_file (a_file: like output_file) is
			-- Set `output_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			output_file := a_file
		ensure
			output_file_set: output_file = a_file
		end

	echo is
			-- Copy `text' to `output_file'.
		do
			output_file.put_string (text)
		end

feature -- Error handling

	fatal_error (message: STRING) is
			-- A fatal error occurred.
			-- Print `message' and raise an exception.
		require
			message_not_void: message /= Void
		do
			io.error.put_string (message)
			io.error.new_line
-- TO DO: Exceptions are not standard among compiler vendors.
		end

invariant

	input_buffer_not_void: input_buffer /= Void
	output_not_void: output_file /= Void
	output_open_write: output_file.is_open_write

end -- class YY_SCANNER
