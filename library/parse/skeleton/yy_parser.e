indexing

	description:

		"General parsers"

	library:    "Gobo Eiffel Parse Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
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
		deferred
		ensure
			error_count_positive: Result >= 0
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
		end

	abort is
			-- Abort parsing.
			-- Do not print error message.
		deferred
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
		require
			a_message_not_void: a_message /= Void
		deferred
		end

	clear_token is
			-- Clear the previous lookahead token.
			-- Used in error-recovery rule actions.
		deferred
		end

feature {NONE} -- Scanning

	read_token is
			-- Read a token from input stream.
			-- Make result available in `last_token'.
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
