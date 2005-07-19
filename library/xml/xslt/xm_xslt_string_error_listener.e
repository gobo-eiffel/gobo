indexing

	description:

	"Objects that receive notification of errors and store them in a string"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_STRING_ERROR_LISTENER

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

	make (a_recovery_policy: INTEGER) is
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover			
		do
			recovered := True
			recovery_policy := a_recovery_policy
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

feature -- Access

	error_text: STRING
			-- Text of error message

feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a warning.
		do
			if warnings_are_recoverable_errors then
				if recovery_policy = Do_not_recover then
					recovered := False
				else
					recovered := True
				end
				set_error_text (STRING_.concat ("Warning: ", a_message), a_locator)
			end
		end

	error (an_error: XM_XPATH_ERROR_VALUE; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a recoverable error.
		local
			a_msg: STRING
		do
			recovered := True
			if recovery_policy /= Recover_silently then
				if recovery_policy = Recover_with_warnings then
					a_msg := "Recoverable error: "
				elseif recovery_policy = Do_not_recover then
					recovered := False
					a_msg := "Error: "
				end
				set_error_text (STRING_.concat (a_msg, an_error.error_message), a_locator)
			end
		end

	fatal_error (an_error: XM_XPATH_ERROR_VALUE; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a non-recoverable error.
		do
			set_error_text (STRING_.concat ("Fatal error: ", an_error.error_message), a_locator)
		end

feature {NONE} -- Implementation


	set_error_text (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Set_error_text.
		require
			message_not_void: a_message /= Void
		do
			if a_locator /= Void then
				if a_locator.line_number > 0 then
					error_text := "At line " + a_locator.line_number.out + " in " + a_locator.system_id + ":"
				else
					error_text := "In " + a_locator.system_id + ":"
				end
			else
				error_text := ""
			end
			error_text := STRING_.appended_string (error_text, a_message)
		end

invariant

	error_text: not recovered implies error_text /= Void

end
	
