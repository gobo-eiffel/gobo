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

creation

	make

feature {NONE} -- Initialization

	make is
		-- Establish invariant.
		do
			is_impure := True
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

feature -- Status report

	recovered: BOOLEAN
			-- Did `Current' recover from the last recoverable error?
	
feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a warning.
		do
			-- TODO
			error_stream.put_line (a_message)
			warnings := warnings + 1
		end

	error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a recoverable error.
		do
			recovered := True -- TODO
			error_stream.put_line (a_message)
			errors := errors + 1
		end

	fatal_error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a non-recoverable error.
		do
			error_stream.put_line (a_message)
			fatal_errors := fatal_errors + 1
		end

feature -- Duplication

	new_instance: like Current is
			-- Pristine instance of `Current'
		do
			create Result.make
		end
	
invariant

end
	
