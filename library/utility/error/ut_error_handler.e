indexing

	description:

		"Error handlers"

	library: "Gobo Eiffel Utility Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UT_ERROR_HANDLER

inherit

	ANY -- Export features of ANY.

	KL_SHARED_STANDARD_FILES
	KL_SHARED_STREAMS

create

	make_standard, make_null

feature {NONE} -- Initialization

	make_standard is
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and the standard output file for info messages.
		do
			error_file := std.error
			warning_file := std.error
			info_file := std.output
		ensure
			error_file_set: error_file = std.error
			warning_file_set: warning_file = std.error
			info_file_set: info_file = std.output
		end

	make_null is
			-- Create a new error handler ignoring
			-- all error, warning and info messages.
		do
			error_file := null_output_stream
			warning_file := null_output_stream
			info_file := null_output_stream
		ensure
			error_file_set: error_file = null_output_stream
			warning_file_set: warning_file = null_output_stream
			info_file_set: info_file = null_output_stream
		end

feature -- Reporting

	report_error (an_error: UT_ERROR) is
			-- Report `an_error'.
		require
			an_error_not_void: an_error /= Void
		do
			report_error_message (message (an_error))
		end

	report_warning (a_warning: UT_ERROR) is
			-- Report `a_warning'.
		require
			a_warning_not_void: a_warning /= Void
		do
			report_warning_message (message (a_warning))
		end

	report_info (an_info: UT_ERROR) is
			-- Report `an_info'.
		require
			an_info_not_void: an_info /= Void
		do
			report_info_message (message (an_info))
		end

	report_error_message (an_error: STRING) is
			-- Report `an_error'.
		require
			an_error_not_void: an_error /= Void
		do
			error_file.put_line (an_error)
		end

	report_warning_message (a_warning: STRING) is
			-- Report `a_warning'.
		require
			a_warning_not_void: a_warning /= Void
		do
			warning_file.put_line (a_warning)
		end

	report_info_message (an_info: STRING) is
			-- Report `an_info'.
		require
			an_info_not_void: an_info /= Void
		do
			info_file.put_line (an_info)
		end

feature -- Access

	error_file: KI_TEXT_OUTPUT_STREAM
			-- File where errors are logged

	warning_file: KI_TEXT_OUTPUT_STREAM
			-- File where warnings are logged

	info_file: KI_TEXT_OUTPUT_STREAM
			-- File where info messages are logged

feature -- Status report

	is_verbose: BOOLEAN is
			-- Is `info_file' set to something other than
			-- the null output stream?
		do
			Result := info_file /= null_output_stream
		ensure
			definition: Result implies (info_file /= null_output_stream)
		end

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

	set_error_standard is
			-- Set `error_file' to standard error file.
		do
			error_file := std.error
		ensure
			error_file_set: error_file = std.error
		end

	set_error_null is
			-- Set `error_file' to null output stream,
			-- i.e. error messages will be ignored.
		do
			error_file := null_output_stream
		ensure
			error_file_set: error_file = null_output_stream
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

	set_warning_standard is
			-- Set `warning_file' to standard error file.
		do
			warning_file := std.error
		ensure
			warning_file_set: warning_file = std.error
		end

	set_warning_null is
			-- Set `warning_file' to null output stream,
			-- i.e. warning messages will be ignored.
		do
			warning_file := null_output_stream
		ensure
			warning_file_set: warning_file = null_output_stream
		end

	set_info_file (a_file: like info_file) is
			-- Set `info_file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			info_file := a_file
		ensure
			info_file_set: info_file = a_file
		end

	set_info_standard is
			-- Set `info_file' to standard output file.
		do
			info_file := std.output
		ensure
			info_file_set: info_file = std.output
		end

	set_info_null is
			-- Set `info_file' to null output stream,
			-- i.e. info messages will be ignored.
		do
			info_file := null_output_stream
		ensure
			info_file_set: info_file = null_output_stream
		end

feature -- Obsolete

	report_message (an_info: UT_ERROR) is
			-- Report `an_info'.
		obsolete
			"[020617] Use `report_info' instead."
		require
			an_info_not_void: an_info /= Void
		do
			report_info (an_info)
		end

	message_file: KI_TEXT_OUTPUT_STREAM is
			-- File where info messages are logged
		obsolete
			"[020617] Use `info_file' instead."
		do
			Result := info_file
		ensure
			definition: Result = info_file
		end

	set_message_file (a_file: like info_file) is
			-- Set `info_file' to `a_file'.
		obsolete
			"[020617] Use `set_info_file' instead."
		require
			a_file_not_void: a_file /= Void
			a_file_open_write: a_file.is_open_write
		do
			set_info_file (a_file)
		ensure
			info_file_set: info_file = a_file
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
	info_file_not_void: info_file /= Void
	info_file_open_write: info_file.is_open_write

end
