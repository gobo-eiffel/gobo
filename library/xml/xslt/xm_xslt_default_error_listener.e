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

	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_recovery_policy: INTEGER; an_error_reporter: UT_ERROR_HANDLER) is
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover			
			error_reporter_not_void: an_error_reporter /= Void
		do
			is_impure := True
			recovery_policy := a_recovery_policy
			error_reporter := an_error_reporter
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

feature -- Status report

	recovered: BOOLEAN
			-- Did `Current' recover from the last recoverable error?
	
feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a warning.
		do
			if recovery_policy /= Recover_silently then
				display_location_information (a_locator, False)
				error_reporter.report_warning_message (STRING_.concat ("Warning: ", a_message))
				warnings := warnings + 1
				if warnings > 25 then
					error_reporter.report_warning_message ("No more warnings will be displayed")
					recovery_policy := Recover_silently
				end
			end
		end

	error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a recoverable error.
		local
			a_msg: STRING
		do
			if recovery_policy /= Recover_silently then
				display_location_information (a_locator, True)
			end				
			if recovery_policy = Recover_with_warnings then
				recovered := True
				a_msg := "Recoverable error: "
			else
				recovered := False
				a_msg := "Error: "
			end
			error_reporter.report_error_message (STRING_.concat (a_msg, a_message))
			errors := errors + 1
		end

	fatal_error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a non-recoverable error.
		do
			display_location_information (a_locator, True)
			error_reporter.report_error_message (STRING_.concat ("Fatal error: ", a_message))
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
			create Result.make (recovery_policy, error_reporter)
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

	recovery_policy: recovery_policy >= Recover_silently and then recovery_policy <= Do_not_recover
	error_reporter_not_void: error_reporter /= Void

end
	
