indexing

	description:

		"Error handlers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_ERROR_HANDLER

inherit

	KL_SHARED_STANDARD_FILES
	KL_SHARED_STREAMS

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
			error_file := null_output_stream
			warning_file := null_output_stream
			message_file := null_output_stream
		ensure
			error_file_set: error_file = null_output_stream
			warning_file_set: warning_file = null_output_stream
			message_file_set: message_file = null_output_stream
		end

feature -- Reporting

	report_error (an_error: UT_ERROR) is
			-- Report `an_error'.
		require
			an_error_not_void: an_error /= Void
		do
			error_file.put_line (message (an_error))
		end

	report_warning (a_warning: UT_ERROR) is
			-- Report `a_warning'.
		require
			a_warning_not_void: a_warning /= Void
		do
			warning_file.put_line (message (a_warning))
		end

	report_message (a_message: UT_ERROR) is
			-- Report `a_message'.
		require
			a_message_not_void: a_message /= Void
		do
			message_file.put_line (message (a_message))
		end

feature -- Access

	error_file: KI_TEXT_OUTPUT_STREAM
			-- File where errors are logged

	warning_file: KI_TEXT_OUTPUT_STREAM
			-- File where warnings are logged

	message_file: KI_TEXT_OUTPUT_STREAM
			-- File where messages are logged

feature -- Setting

	set_error_file (a_file: like error_file) is
			-- Set `error_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			error_file := a_file
		ensure
			error_file_set: error_file = a_file
		end

	set_warning_file (a_file: like warning_file) is
			-- Set `warning_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			warning_file := a_file
		ensure
			warning_file_set: warning_file = a_file
		end

	set_message_file (a_file: like message_file) is
			-- Set `message_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
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

invariant

	error_file_not_void: error_file /= Void
	error_file_open_write: error_file.is_open_write
	warning_file_not_void: warning_file /= Void
	warning_file_open_write: warning_file.is_open_write
	message_file_not_void: message_file /= Void
	message_file_open_write: message_file.is_open_write

end -- class UT_ERROR_HANDLER
