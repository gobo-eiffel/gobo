indexing

	description:

		"Error handlers"

	library:    "Gobo Eiffel Utility Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class UT_ERROR_HANDLER

inherit

	KL_IMPORTED_OUTPUT_STREAM_ROUTINES

	KL_SHARED_STANDARD_FILES

creation

	make_standard, make_null

feature {NONE} -- Initialization

	make_standard is
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and the standard output file for messages.
		do
			error_file := std.error
			warning_file := std.error
			message_file := std.output
		ensure
			error_file_set: error_file = std.error
			warning_file_set: warning_file = std.error
			message_file_set: message_file = std.output
		end

	make_null is
			-- Create a new error handler ignoring
			-- all errors, warnings and messages.
		do
				-- Default values.
			-- error_file := Void
			-- warning_file := Void
			-- message_file := Void
		ensure
			error_file_set: error_file = Void
			warning_file_set: warning_file = Void
			message_file_set: message_file = Void
		end

feature -- Reporting

	report_error (an_error: UT_ERROR) is
			-- Report `an_error'.
		require
			an_error_not_void: an_error /= Void
		do
			if error_file /= Void then
				error_file.put_string (message (an_error))
				error_file.put_character ('%N')
			end
		end

	report_warning (a_warning: UT_ERROR) is
			-- Report `a_warning'.
		require
			a_warning_not_void: a_warning /= Void
		do
			if warning_file /= Void then
				warning_file.put_string (message (a_warning))
				warning_file.put_character ('%N')
			end
		end

	report_message (a_message: UT_ERROR) is
			-- Report `a_message'.
		require
			a_message_not_void: a_message /= Void
		do
			if message_file /= Void then
				message_file.put_string (message (a_message))
				message_file.put_character ('%N')
			end
		end

feature -- Access

	error_file: like OUTPUT_STREAM_TYPE
			-- File where errors are logged

	warning_file: like OUTPUT_STREAM_TYPE
			-- File where warnings are logged

	message_file: like OUTPUT_STREAM_TYPE
			-- File where messages are logged

feature -- Setting

	set_error_file (a_file: like error_file) is
			-- Set `error_file' to `a_file'.
		do
			error_file := a_file
		ensure
			error_file_set: error_file = a_file
		end

	set_warning_file (a_file: like error_file) is
			-- Set `warning_file' to `a_file'.
		do
			warning_file := a_file
		ensure
			warning_file_set: warning_file = a_file
		end

	set_message_file (a_file: like message_file) is
			-- Set `message_file' to `a_file'.
		do
			message_file := a_file
		ensure
			message_file_set: message_file = a_file
		end

feature {NONE} -- Implementation

	message (an_error: UT_ERROR): STRING is
			-- Message built out of `an_error'
		require
			an_error_not_void: an_error /= Void
		do
			Result := an_error.default_message
		ensure
			message_not_void: Result /= Void
		end

end -- class UT_ERROR_HANDLER
