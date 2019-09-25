note

	description:

		"General parsers"

	library: "Gobo Eiffel Parse Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class YY_PARSER

feature {NONE} -- Initialization

	make
			-- Create a new parser.
		deferred
		end

feature -- Parsing

	parse
			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		deferred
		end

feature -- Status report

	syntax_error: BOOLEAN
			-- Has last parsing been unsuccesful?
		deferred
		end

	is_suspended: BOOLEAN
			-- Has parsing been suspended?
			-- The next call to `parse' will resume parsing in the state
			-- where the parser was when it was suspended. Note that a call
			-- to `abort' or `accept' will force `parse' to parse from scratch.
		deferred
		end

feature -- Access

	error_count: INTEGER
			-- Number of errors detected during last parsing
			-- (`error_count' can be non-zero even though
			-- `syntax_error' is false. This can happen when
			-- error recovery occurred.)
		deferred
		ensure
			error_count_non_negative: Result >= 0
		end

feature -- Basic operations

	accept
			-- Stop parsing successfully.
		deferred
		ensure
			accepted: not syntax_error
		end

	abort
			-- Abort parsing.
			-- Do not print error message.
		deferred
		ensure
			aborted: syntax_error
		end

	clear_all
			-- Clear temporary objects so that they can be collected
			-- by the garbage collector. (This routine is called by
			-- `parse' before exiting. It can be redefined in descendants.)
		do
		end

feature {YY_PARSER_ACTION} -- Basic operations

	suspend
			-- Suspend parsing.
			-- The next call to `parse' will resume parsing in the state
			-- where the parser was when it was suspended. Note that a call
			-- to `abort' or `accept' will force `parse' to parse from scratch.
		deferred
		ensure
			suspended: is_suspended
		end

	raise_error
			-- Raise a syntax error.
			-- Report error using the error action %error associated
			-- with current parsing state or `report_error' by default,
			-- and perform normal error recovery if possible.
		deferred
		end

	recover
			-- Recover immediately after a parse error.
		deferred
		end

	report_error (a_message: STRING)
			-- Print error message.
			-- (This routine is called by default by `parse' when it
			-- detects a syntax error and there is no error action
			-- %error available. It can be redefined in descendants.)
		require
			a_message_not_void: a_message /= Void
		deferred
		end

	clear_token
			-- Clear the previous lookahead token.
			-- Used in error-recovery rule actions.
		deferred
		end

feature {YY_PARSER_ACTION} -- Status report

	is_recovering: BOOLEAN
			-- Is current parser recovering from a syntax error?
		deferred
		end

feature {YY_PARSER_ACTION} -- Scanning

	read_token
			-- Read a token from input stream.
			-- Make result available in `last_token'.
			-- (This routine is called by `parse' when it needs a
			-- new token from the input stream.)
		deferred
		end

	last_token: INTEGER
			-- Last token read
		deferred
		end

end
