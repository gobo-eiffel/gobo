indexing

	description:

		"Error handlers for regular expression compilers"

	library:    "Gobo Eiffel Lexical Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class LX_REGEXP_ERROR_HANDLER

inherit

	LX_LEX_ERROR_HANDLER
		redefine
			terminate, info_message, warning_message,
			parsing_message, syntax_message, error_message
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new error handler.
		do
		end

feature -- Access

	program_name: STRING is
			-- Program name
		once
			Result := "regexp compiler"
		end

	usage: STRING is
			-- Command line usage
		once
			Result := ""
		end

	version: STRING is
			-- Version number
		once
			Result := "1.0"
		end

feature -- Termination

	terminate (exit_status: INTEGER) is
			-- Terminate program.
		do
		end

feature -- Error handling

	error_message (message: ARRAY [STRING]) is
			-- Report an error message and terminate.
		do
		end

	info_message (message: ARRAY [STRING]) is
			-- Report an info message and exit.
		do
		end

	syntax_message (filename: STRING; line: INTEGER; message: ARRAY [STRING]) is
			-- Report a syntax error message with location information.
		do
			syntax_error := True
		end

	warning_message (filename: STRING; line: INTEGER;
		message: ARRAY [STRING]) is
			-- Report a warning message with location information.
		do
		end

	parsing_message (filename: STRING; line: INTEGER; message: ARRAY [STRING]) is
			-- Report a parsing error message with location information.
		do
		end

end -- class LX_REGEXP_ERROR_HANDLER
