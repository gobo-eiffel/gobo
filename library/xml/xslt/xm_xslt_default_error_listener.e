indexing

	description:

	"Objects used to receive notification of errors%
%if the user does not supply an error listener"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFAULT_ERROR_LISTENER

inherit

	XM_XSLT_ERROR_LISTENER

	KL_SHARED_STANDARD_FILES

		-- TODO: add reporting policies (e.g. should warnings count as errors),
		--  and maybe selection of the error stream (?)

creation {XM_XSLT_PREPARED_STYLESHEET}

	make

feature {NONE} -- Initialization

	make is
		-- Establish invariant.
		do
			error_stream := std.error
		end

feature -- Access

	error_stream: KI_TEXT_OUTPUT_STREAM

	warnings, errors, fatal_errors: INTEGER
			-- Error counts

	total_errors: INTEGER is
			-- Toal error count
		do
			Result := warnings + errors + fatal_errors
		end

feature -- Events

	warning (a_message: STRING) is
			-- Receive notification of a warning.
		do
			-- TODO
			error_stream.put_line (a_message)
			warnings := warnings + 1
		end

	error (a_message: STRING) is
			-- Receive notification of a recoverable error.
		do
			error_stream.put_line (a_message)
			errors := errors + 1
		end

	fatal_error (a_message: STRING) is
			-- Receive notification of a non-recoverable error.
		do
			error_stream.put_line (a_message)
			fatal_errors := fatal_errors + 1
		end

invariant

end
	
