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

creation

	make

feature {NONE} -- Initialization

	make (a_recovery_policy: INTEGER) is
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover			
		do
			is_impure := True
			error_stream := std.error
			recovery_policy := a_recovery_policy
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
			if recovery_policy /= Recover_silently then
				display_location_information (a_locator)
				error_stream.put_string ("Warning: ")
				error_stream.put_line (a_message)
				warnings := warnings + 1
				if warnings > 25 then
					error_stream.put_line ("No more warnings will be displayed")
					recovery_policy := Recover_silently
				end
			end
		end

	error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a recoverable error.
		do
			if recovery_policy /= Recover_silently then
				display_location_information (a_locator)
			end				
			if recovery_policy = Recover_with_warnings then
				recovered := True
				error_stream.put_string ("Recoverable error: ")
			else
				recovered := False
				error_stream.put_string ("Error: ")
			end
			error_stream.put_line (a_message)
			errors := errors + 1
		end

	fatal_error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a non-recoverable error.
		do
			display_location_information (a_locator)
			error_stream.put_string ("Fatal error: ")
			error_stream.put_line (a_message)
			fatal_errors := fatal_errors + 1
		end

feature -- Element change

	set_recovery_policy (a_recovery_policy: INTEGER) is
			-- Set recovery policy.
		do
			recovery_policy := a_recovery_policy
		end

feature -- Duplication

	new_instance: like Current is
			-- Pristine instance of `Current'
		do
			create Result.make (recovery_policy)
		end

feature {NONE} -- Implementation

	display_location_information (a_locator: XM_XPATH_LOCATOR) is
			-- Display location information.
		do
			if a_locator /= Void then
				if a_locator.line_number > 0 then
					error_stream.put_string ("At line " + a_locator.line_number.out)
					error_stream.put_string (" in " + a_locator.system_id)
					error_stream.put_line (":")
				else
					error_stream.put_string ("In " + a_locator.system_id)
					error_stream.put_line (":")
				end
			end
		end

invariant

	recovery_policy: recovery_policy >= Recover_silently and then recovery_policy <= Do_not_recover

end
	
