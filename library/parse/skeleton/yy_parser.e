indexing

	description:

		"General parsers"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class YY_PARSER [G]

feature {NONE} -- Initialization

	make is
			-- Create a new parser.
		deferred
		end

feature -- Parsing

	parse is
			-- Parse input stream.
			-- Set `syntax_error' to True if
			-- parsing has not been successful.
		deferred
		end

feature -- Status report

	syntax_error: BOOLEAN is
			-- Has last parsing been unsuccesful?
		deferred
		end

feature -- Access

	error_count: INTEGER is
			-- Number of errors detected during last parsing
			-- (`error_count' can be non-zero even though
			-- `syntax_error' is false. This can happen when
			-- error recovery occurred.)
		deferred
		ensure
			error_count_non_negative: Result >= 0
		end

feature -- Element change

	clear_all is
			-- Clear temporary objects so that they can be collected
			-- by the garbage collector. (This routine is called by
			-- `parse' before exiting. It can be redefined in descendants.)
		do
		end

feature {YY_PARSER_ACTION} -- Status report

	is_recovering: BOOLEAN is
			-- Is current parser recovering from a syntax error?
		deferred
		end

feature {YY_PARSER_ACTION} -- Basic operations

	accept is
			-- Stop parsing successfully.
		deferred
		ensure
			accepted: not syntax_error
		end

	abort is
			-- Abort parsing.
			-- Do not print error message.
		deferred
		ensure
			aborted: syntax_error
		end

	raise_error is
			-- Raise a syntax error.
			-- Report error using `report_error' and
			-- perform normal error recovery if possible.
		deferred
		end

	recover is
			-- Recover immediately after a parse error.
		deferred
		end

	report_error (a_message: STRING) is
			-- Print error message.
			-- (This routine is called by `parse' when it detects
			-- a syntax error. It can be redefined in descendants.)
		require
			a_message_not_void: a_message /= Void
		deferred
		end

	clear_token is
			-- Clear the previous lookahead token.
			-- Used in error-recovery rule actions.
		deferred
		end

feature {YY_PARSER_ACTION} -- Scanning

	read_token is
			-- Read a token from input stream.
			-- Make result available in `last_token'.
			-- (This routine is called by `parse' when it needs a
			-- new token from the input stream.)
		deferred
		end

	last_token: INTEGER is
			-- Last token read
		deferred
		end

	last_value: G is
			-- Semantic value of last token read
		deferred
		end

end -- class YY_PARSER
