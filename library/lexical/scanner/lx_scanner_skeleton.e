indexing

	description:

		"Skeletons for scanners written 'by hand'"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class LX_SCANNER_SKELETON

inherit

	KL_IMPORTED_INPUT_STREAM_ROUTINES

feature {NONE} -- Initialization

	make is
			-- Create a new scanner with
			-- standard input as input file.
		do
			input_buffer := new_string_buffer ("")
			yy_content := input_buffer.content
			yy_index := input_buffer.index
			yy_count := yy_content.count
			last_character := EOF
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input source.
		do
		end

feature -- Access

	last_token: INTEGER
			-- Code of last token read
			-- (0 means that the end-of-input has been reached,
			-- non-positive values mean that an error occurred
			-- (see header-comment of `scanning_error'.))

feature -- Status report

	end_of_file: BOOLEAN is
			-- Has the end of input buffer been reached?
			-- This means that `last_token' has been set
			-- to 0 indicating "all done".
		do
			Result := (last_token = 0)
		end

	scanning_error: BOOLEAN is
			-- Has an error occurred during scanning?
			-- This can occur when too many `reject' are called (and hence
			-- nothing can be matched anymore) or when the option "nodefault"
			-- (or option -s) has been specified but the default rule is
			-- matched nevertheless. 
		do
			Result := (last_token < 0)
		end

feature -- Setting

	set_last_token (a_token: INTEGER) is
			-- Set `last_token' to `a_token'.
		do
			last_token := a_token
		ensure
			last_token_set: last_token = a_token
		end

feature -- Scanning

	scan is
			-- Scan `input_buffer' until end of file is found.
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

	read_character is
			-- Read next character in `input_buffer'.
			-- Make result available in `last_character'.
		do
			yy_index := yy_index + 1
			if yy_index > yy_count then
				if last_character /= EOF then
					yy_refill_input_buffer
					if yy_index > yy_count then
						last_character := EOF
					else
						last_character := yy_content.item (yy_index)
					end
				end
			else
				last_character := yy_content.item (yy_index)
			end
		end

	last_character: CHARACTER
			-- Last character read by `read_character'

feature -- Input

	input_buffer: LX_BUFFER
			-- Input buffer

	set_input_buffer (a_buffer: like input_buffer) is
			-- Set `input_buffer' to `a_buffer'.
		require
			a_buffer_not_void: a_buffer /= Void
		do
			if input_buffer /= a_buffer then
				input_buffer.set_index (yy_index)
				input_buffer := a_buffer
				yy_content := a_buffer.content
				yy_index := a_buffer.index
				yy_count := yy_content.count
				if yy_index > yy_count then
					last_character := EOF
				else
					last_character := yy_content.item (yy_index)
				end
			end
		ensure
			input_buffer_set: input_buffer = a_buffer
		end

	new_file_buffer (a_file: like INPUT_STREAM_TYPE): LX_FILE_BUFFER is
			-- New input buffer for `a_file'
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: INPUT_STREAM_.is_open_read (a_file)
		do
			!! Result.make (a_file)
		ensure
			new_buffer_not_void: Result /= Void
		end

	new_string_buffer (a_string: STRING): LX_BUFFER is
			-- New input buffer for `a_string'
		require
			a_string_not_void: a_string /= Void
		do
			!! Result.make (a_string)
		ensure
			new_buffer_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	yy_content: STRING
			-- Characters in `input_buffer'

	yy_index: INTEGER
			-- Index of `last_character' in `yy_content'

	yy_count: INTEGER
			-- Number of characters in `yy_content'

	yy_refill_input_buffer is
			-- Refill `input_buffer'.
		do
			input_buffer.refill
			yy_content := input_buffer.content
			yy_index := input_buffer.index
			yy_count := yy_content.count
		end

feature {NONE} -- Constants

	EOF: CHARACTER is '%U'
			-- Enf of file character
			-- (Do not use '%/255/' because of a bug in ISE 4.2.)

invariant

	input_buffer_not_void: input_buffer /= Void
	yy_content_definition: yy_content = input_buffer.content
	yy_count_definition: yy_count = yy_content.count
	valid_yy_index: yy_index >= 1

end -- class LX_SCANNER_SKELETON
