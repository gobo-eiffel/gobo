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

	XM_XPATH_ERROR_TYPES

	XM_XPATH_STANDARD_NAMESPACES

	KL_IMPORTED_STRING_ROUTINES

create

	make

feature {NONE} -- Initialization

	make (a_recovery_policy: INTEGER; an_error_reporter: UT_ERROR_HANDLER) is
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover			
			error_reporter_not_void: an_error_reporter /= Void
		do
			recovery_policy := a_recovery_policy
			error_reporter := an_error_reporter
			warning_threshold := 25
			recoverable_error_threshold := 25
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
			error_reporter_set: error_reporter = an_error_reporter
		end

feature -- Access

	warnings, errors, fatal_errors: INTEGER
			-- Error counts

	total_errors: INTEGER is
			-- Toal error count
		do
			Result := warnings + errors + fatal_errors
		end

feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a warning.
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			if warnings_are_recoverable_errors then
				create an_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "WARNING", Dynamic_error)
				error (an_error, a_locator)
			elseif warning_threshold >= 0 and then warnings <= warning_threshold then
				display_location_information (a_locator, False)
				error_reporter.report_warning_message (STRING_.concat ("Warning: ", a_message))
				warnings := warnings + 1
				if warnings > warning_threshold then
					error_reporter.report_warning_message ("No more warnings will be displayed")
				end
			end
		end

	error (an_error: XM_XPATH_ERROR_VALUE; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a recoverable error.
		local
			a_msg: STRING
		do
			if recovery_policy /= Recover_silently then
					display_location_information (a_locator, True)
			end
			recovered := True
			if recovery_policy = Recover_with_warnings then
				a_msg := "Recoverable error: "
			elseif recovery_policy = Do_not_recover then
				recovered := False
				a_msg := "Error: "
			end
			if recovery_policy /= Recover_silently then
				error_reporter.report_error_message (STRING_.concat (a_msg, an_error.error_message))
			end
			errors := errors + 1
			if recovery_policy = Recover_with_warnings and then recoverable_error_threshold >=0 and then errors >= recoverable_error_threshold then
				recovery_policy := Recover_silently
				error_reporter.report_error_message ("No more recoverable errors will be displayed")
			end
		end

	fatal_error (an_error: XM_XPATH_ERROR_VALUE; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a non-recoverable error.
		do
			display_location_information (a_locator, True)
			error_reporter.report_error_message (STRING_.concat ("Fatal error: ", an_error.error_message))
			fatal_errors := fatal_errors + 1
		end

feature {NONE} -- Implementation

	error_reporter: UT_ERROR_HANDLER
			-- Error reporter

	display_location_information (a_locator: XM_XPATH_LOCATOR; is_an_error: BOOLEAN) is
			-- Display location information.
		local
			a_message: STRING
		do
			if a_locator /= Void then
				if a_locator.line_number > 0 then
					a_message := "At line " + a_locator.line_number.out + " in " + a_locator.system_id + ":"
				else
					a_message := "In " + a_locator.system_id + ":"
				end
				if is_an_error then
					error_reporter.report_error_message (a_message)
				else
					error_reporter.report_warning_message (a_message)
				end
			end
		end

invariant

	error_reporter_not_void: error_reporter /= Void

end
	
