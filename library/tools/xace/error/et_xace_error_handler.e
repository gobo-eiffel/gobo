indexing

	description:

		"Xace error handlers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_ERROR_HANDLER

inherit

	ET_ERROR_HANDLER
		redefine
			report_error
		end

creation

	make, make_standard, make_null

feature {NONE} -- Initialization

	make is
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and ignoring messages.
		do
			error_file := std.error
			warning_file := std.error
			message_file := Void
		ensure
			error_file_set: error_file = std.error
			warning_file_set: warning_file = std.error
			message_file_set: message_file = Void
		end

feature -- Status report

	is_verbose: BOOLEAN is
			-- Is error handler in verbose mode?
		do
			Result := (message_file /= Void)
		end

	has_error: BOOLEAN is
			-- Has an error been reported?
		do
			Result := (error_count > 0)
		end

feature -- Status setting

	enable_verbose is
			-- Set `is_verbose' to True.
		do
			message_file := std.output
		ensure
			verbose: is_verbose
		end

	disable_verbose is
			-- Set `is_verbose' to False.
		do
			message_file := Void
		ensure
			not_verbose: not is_verbose
		end

feature -- Measurement

	error_count: INTEGER
			-- Number of errors reported so far

feature -- Reporting

	report_cannot_read_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			!! an_error.make (a_filename)
			report_error (an_error)
		end

	report_cannot_write_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			!! an_error.make (a_filename)
			report_error (an_error)
		end

	report_parser_error (a_message: STRING) is
			-- Report an XML parser error.
		require
			a_message_not_void: a_message /= Void
		local
			an_error: UT_MESSAGE
		do
			!! an_error.make (a_message)
			report_error (an_error)
		end

	report_no_parser_available_error is
			-- Report that there is no XML parser available.
		local
			an_error: ET_XACE_NO_PARSER_AVAILABLE_ERROR
		do
			!! an_error.make
			report_error (an_error)
		end

	report_not_xace_file_error (a_filename: STRING) is
			-- Report that file `a_filename' does not contain
			-- an Xace document.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: ET_XACE_NOT_XACE_FILE_ERROR
		do
			!! an_error.make (a_filename)
			report_error (an_error)
		end

	report_error (an_error: UT_ERROR) is
			-- Report `an_error'.
		do
			error_count := error_count + 1
			precursor (an_error)
		end

end -- class ET_XACE_ERROR_HANDLER
