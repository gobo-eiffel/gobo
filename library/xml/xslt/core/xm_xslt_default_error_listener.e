indexing

	description:

	"Objects used to receive notification of errors%
%if the user does not supply an error listener"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_DEFAULT_ERROR_LISTENER

inherit

	XM_XSLT_ERROR_LISTENER

	XM_XPATH_ERROR_TYPES

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_recovery_policy: INTEGER; a_error_reporter: UT_ERROR_HANDLER) is
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover			
			error_reporter_not_void: a_error_reporter /= Void
		do
			recovery_policy := a_recovery_policy
			error_reporter := a_error_reporter
			warning_threshold := 25
			recoverable_error_threshold := 25
			create error_change_stack.make_default
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
			error_reporter_set: error_reporter = a_error_reporter
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
			l_error: XM_XPATH_ERROR_VALUE
		do
			if warnings_are_recoverable_errors then
				create l_error.make_from_string (a_message, Gexslt_eiffel_type_uri, "WARNING", Dynamic_error)
				error (l_error)
			elseif (warning_threshold > 0 and then warnings <= warning_threshold) or warning_threshold < 0 then
				if a_locator /= Void then display_location_information (a_locator, False) end
				error_reporter.report_warning_message (STRING_.concat ("Warning: ", a_message))
				warnings := warnings + 1
				if warnings > warning_threshold and warning_threshold > 0 then
					error_reporter.report_warning_message ("No more warnings will be displayed")
				end
			end
		end

	error (a_error: XM_XPATH_ERROR_VALUE) is
			-- Receive notification of a recoverable error.
		local
			l_msg: STRING
			l_error: like a_error
		do
			if recovery_policy /= Recover_silently then
					display_location_information (a_error, True)
			end
			recovered := True
			if recovery_policy = Recover_with_warnings then
				l_msg := "Recoverable error: "
			elseif recovery_policy = Do_not_recover then
				recovered := False
				l_msg := "Error: "
			end
			if recovery_policy /= Recover_silently then
				if is_error_code_editing then
					create l_error.make (a_error.description, error_change_stack.item.first, error_change_stack.item.second, a_error.value, a_error.type)
				else
					l_error := a_error
				end
				error_reporter.report_error_message (STRING_.concat (l_msg, l_error.error_message))
			end
			errors := errors + 1
			if recovery_policy = Recover_with_warnings and then recoverable_error_threshold >=0 and then errors >= recoverable_error_threshold then
				recovery_policy := Recover_silently
				error_reporter.report_error_message ("No more recoverable errors will be displayed")
			end
		end

	fatal_error (a_error: XM_XPATH_ERROR_VALUE) is
			-- Receive notification of a non-recoverable error.
		local
			l_error: like a_error
		do
			display_location_information (a_error, True)
			if is_error_code_editing then
				create l_error.make (a_error.description, error_change_stack.item.first, error_change_stack.item.second, a_error.value, a_error.type)
			else
				l_error := a_error
			end
			error_reporter.report_error_message (STRING_.concat ("Fatal error: ", l_error.error_message))
			fatal_errors := fatal_errors + 1
		end

feature {NONE} -- Implementation

	error_reporter: UT_ERROR_HANDLER
			-- Error reporter

	display_location_information (a_locator: XM_XPATH_LOCATOR; is_an_error: BOOLEAN) is
			-- Display location information.
		require
			locator_not_void: a_locator /= Void
		local
			a_message: STRING
		do
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

invariant

	error_reporter_not_void: error_reporter /= Void

end
	
