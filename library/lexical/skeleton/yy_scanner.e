indexing

	description:

		"General lexical analyzers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_SCANNER

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

	KL_SHARED_STANDARD_FILES

feature {NONE} -- Initialization

	make is
			-- Create a new scanner with
			-- standard input as input file.
		do
			make_with_file (std.input)
		end

	make_with_file (a_file: like INPUT_STREAM_TYPE) is
			-- Create a new scanner with
			-- `a_file' as input file.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			make_with_buffer (new_file_buffer (a_file))
		end

	make_with_buffer (a_buffer: like input_buffer) is
			-- Create a new scanner with
			-- `a_buffer' as input buffer.
		require
			a_buffer_not_void: a_buffer /= Void
		do
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
			-- (0 means that the end-of-input has been reached,
			-- non-positive values mean that an error occurred
			-- (see header-comment of `scanning_error'.))

	text: STRING is
			-- Text of last token read
			-- (Create a new string at each call.)
		deferred
		ensure
			text_not_void: Result /= Void
			correct_count: Result.count = text_count
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
			-- (For efficiency reason, this function can bypass the
			-- call to `text' and create the substring directly from
			-- the input buffer.)
		require
			meaningful_start: 1 <= s
			meaningful_interval: s <= e + 1
			meaningful_end: e <= text_count
		deferred
		ensure
			text_substring_not_void: Result /= Void
			text_substring_empty: (s > e) implies (Result.count = 0)
			definition: s <= e implies Result.is_equal (text.substring (s, e))
		end

	start_condition: INTEGER is
			-- Start condition
		deferred
		end

feature -- Measurement

	text_count: INTEGER is
			-- Number of characters in last token read
		deferred
		ensure
			positive_count: Result >= 0
		end

	line: INTEGER is
			-- Line number of last token read when
			-- '%option line' has been specified
		deferred
		ensure
			line_positive: Result >= 1
		end

	column: INTEGER is
			-- Column number of last token read when
			-- '%option line' has been specified
		deferred
		ensure
			column_positive: Result >= 1
		end

	position: INTEGER is
			-- Position of last token read (i.e. number of
			-- characters from the start of the input source)
			-- when '%option position' has been specified
		deferred
		ensure
			position_positive: Result >= 1
		end

feature -- Status report

	end_of_file: BOOLEAN is
			-- Has the end of input buffer been reached?
			-- This means that `last_token' has been set
			-- to 0 indicating "all done".
		do
			Result := (last_token = yyEOF_token)
		end

	scanning_error: BOOLEAN is
			-- Has an error occurred during scanning?
			-- This can occur when too many `reject' are called (and hence
			-- nothing can be matched anymore) or when the option "nodefault"
			-- (or option -s) has been specified but the default rule is
			-- matched nevertheless. 
		do
			Result := (last_token = yyError_token)
		end

	valid_start_condition (sc: INTEGER): BOOLEAN is
			-- Is `sc' a valid start condition?
		deferred
		end

feature -- Setting

	set_last_token (a_token: INTEGER) is
			-- Set `last_token' to `a_token'.
		do
			last_token := a_token
		ensure
			last_token_set: last_token = a_token
		end

	set_start_condition (a_start_condition: INTEGER) is
			-- Set `start_condition' to `a_start_condition'.
		require
			valid_start_condition: valid_start_condition (a_start_condition)
		deferred
		ensure
			start_condition_set: start_condition = a_start_condition
		end

feature -- Scanning

	scan is
			-- Scan `input_buffer' until end of file is found
			-- or an error occurs.
		do
			from
				read_token
			until
				last_token <= 0
			loop
				read_token
			end
		ensure
			end_of_file: not scanning_error implies end_of_file
		end

	read_token is
			-- Read a token from `input_buffer'.
			-- Make result available in `last_token'.
		deferred
		end

feature -- Element change

	append_text_to_string (a_string: STRING) is
			-- Append `text' at end of `a_string'.
			-- (For efficiency reason, this feature can bypass the
			-- call to `text' and directly copy the characters from
			-- the input buffer.)
		require
			a_string_not_void: a_string /= Void
		do
			a_string.append_string (text)
		ensure
			count_set: a_string.count = old (a_string.count) + text_count
		end

	append_text_substring_to_string (s, e: INTEGER; a_string: STRING) is
			-- Append `text_substring' at end of `a_string'.
			-- (For efficiency reason, this feature can bypass
			-- the call to `text_substring' and directly copy
			-- the characters from the input buffer.)
		require
			a_string_not_void: a_string /= Void
			s_large_enough: 1 <= s
			valid_interval: s <= e + 1
			e_small_enough: e <= text_count
		do
			a_string.append_string (text_substring (s, e))
		ensure
			count_set: a_string.count = old (a_string.count) + (e - s + 1)
		end

	terminate is
			-- Terminate scanner and set `last_token'
			-- to 0 indicating "all done".
		do
			last_token := yyEOF_token
		end

	wrap: BOOLEAN is
			-- Should current scanner terminate when end of file is reached?
			-- This function can be redefined to switch to another input
			-- buffer (but don't forget to update `start_condition').
			-- (default: True.)
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

	new_file_buffer (a_file: like INPUT_STREAM_TYPE): YY_FILE_BUFFER is
			-- New input buffer for `a_file'
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			!! Result.make (a_file)
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

	Empty_buffer: YY_BUFFER is
			-- Empty input buffer
		once
			!! Result.make ("")
		ensure
			empty_buffer_not_void: Result /= Void
		end

feature -- Output

	output (a_text: like text) is
			-- Output `a_text'.
			-- (Note: this routine can be redefined in descendant
			-- classes. Default: print `a_text' to standard output.)
		require
			a_text_not_void: a_text /= Void
		do
			std.output.put_string (a_text)
		end

	echo is
			-- Output `text' using feature `output'.
		do
			output (text)
		end

feature -- Action

	pre_action is
			-- Action executed before every semantic action
			-- when '%option pre-action' has been specified.
			-- (Note: this routine can be redefined in descendant
			-- classes. Default: do nothing.)
		do
		end

	post_action is
			-- Action executed after every semantic action
			-- when '%option post-action' has been specified.
			-- (Note: this routine can be redefined in descendant
			-- classes. Default: do nothing.)
		do
		end

	pre_eof_action is
			-- Action executed before every end-of-file semantic action
			-- (i.e. <<EOF>>) when '%option pre-eof-action' has been specified.
			-- (Note: this routine can be redefined in descendant classes.
			-- Default: do nothing.)
		do
		end

	post_eof_action is
			-- Action executed after every end-of-file semantic action
			-- (i.e. <<EOF>>) when '%option post-eof-action' has been specified.
			-- (Note: this routine can be redefined in descendant classes.
			-- Default: do nothing.)
		do
		end

	default_action is
			-- Action executed when default rule is matched.
			-- (Note: this routine can be redefined in descendant classes.
			-- Default: print last character read to standard output.)
		do
			echo
		end

feature -- Error handling

	fatal_error (a_message: STRING) is
			-- A fatal error occurred.
			-- Print `a_message'.
		require
			a_message_not_void: a_message /= Void
		do
			std.error.put_string (a_message)
			std.error.put_character ('%N')
		end

feature {NONE} -- Constants

	yyEOF_token: INTEGER is 0
	yyError_token: INTEGER is -1
	yyUnknown_token: INTEGER is -2
			-- Predefined token codes

invariant

	input_buffer_not_void: input_buffer /= Void
	valid_start_condition: valid_start_condition (start_condition)

end -- class YY_SCANNER
