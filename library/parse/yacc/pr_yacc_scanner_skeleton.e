indexing

	description:

		"Scanner skeletons for parser generators such as 'geyacc'"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class PR_YACC_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	PR_YACC_TOKENS
		export
			{NONE} all
		end

	UT_CHARACTER_CODES
		export
			{NONE} all
		end

	KL_IMPORTED_STRING_ROUTINES
	UT_IMPORTED_FORMATTERS

feature {NONE} -- Initialization

	make (handler: like error_handler) is
			-- Create a new grammar description scanner.
		require
			handler_not_void: handler /= Void
		do
			make_compressed_scanner_skeleton
			error_handler := handler
			action_buffer := STRING_.make (Init_buffer_size)
			successful := True
			line_nb := 1
		ensure
			error_handler_set: error_handler = handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			successful := True
			action_buffer.wipe_out
			line_nb := 1
		end

feature -- Status report

	successful: BOOLEAN
			-- Has no fatal error been detected?

feature -- Access

	error_handler: UT_ERROR_HANDLER
			-- Error handler

	line_nb: INTEGER
			-- Current line number

	filename: STRING is
			-- Name of file being parsed
		local
			file_buffer: YY_FILE_BUFFER
		do
			file_buffer ?= input_buffer
			if file_buffer /= Void then
				Result := INPUT_STREAM_.name (file_buffer.file)
			else
				Result := "string"
			end
		ensure
			filename_not_void: Result /= Void
		end

	last_value: ANY
			-- Semantic value to be passed to the parser

feature -- Setting

	set_error_handler (handler: like error_handler) is
			-- Set `error_handler' to `handler'.
		require
			handler_not_void: handler /= Void
		do
			error_handler := handler
		ensure
			error_handler_set: error_handler = handler
		end

feature {NONE} -- Implementation

	action_buffer: STRING
			-- Buffer for semanic action text

	nb_rhs: INTEGER
			-- Number of right-hand-side items
			-- read so far in current rule

	process_dollar_n (n: INTEGER) is
			-- Process $`n' in semantic actions.
		local
			offset: INTEGER
		do
			offset := nb_rhs - n
			if offset = 0 then
				action_buffer.append_string ("yyvs.item (yyvsp)")
			else
				action_buffer.append_string ("yyvs.item (yyvsp - ")
				INTEGER_FORMATTER_.append_decimal_integer (action_buffer, offset)
				action_buffer.append_character (')')
			end
		end

	process_dollar_dollar is
			-- Process $$ in semantic actions.
		do
			action_buffer.append_string ("yyval")
		end

	cloned_string (a_string: STRING): STRING is
			-- Cloned version of `a_string'
		require
			a_string /= Void
		do
			Result := STRING_.make (action_buffer.count)
			Result.append_string (action_buffer)
		ensure
			cloned_string_not_void: Result /= Void
			is_equal: Result.is_equal (a_string)
			not_same: Result /= a_string
		end

feature {NONE} -- Error handling

	report_missing_characters_error (chars: STRING) is
			-- Report that `chars' is missing.
		require
			chars_not_void: chars /= Void
		local
			an_error: PR_MISSING_CHARACTERS_ERROR
		do
			!! an_error.make (filename, line_nb, chars)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

	report_null_integer_error is
			-- Report that the integer just read
			-- cannot be null.
		local
			an_error: PR_NULL_INTEGER_ERROR
		do
			!! an_error.make (filename, line_nb)
			error_handler.report_error (an_error)
			successful := False
		ensure
			not_successful: not successful
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `action_buffer'

invariant

	error_handler_not_void: error_handler /= Void
	action_buffer_not_void: action_buffer /= Void

end -- class PR_YACC_SCANNER_SKELETON
