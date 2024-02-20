note

	description:

	"Objects that receive notification of errors and store them in a string"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2005-2018, Colin Adams and others"
	license: "MIT License"

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

	make (a_recovery_policy: INTEGER)
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover
		do
			recovered := True
			recovery_policy := a_recovery_policy
			create error_change_stack.make_default
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

feature -- Access

	error_text: detachable STRING
			-- Text of error message

feature -- Events

	warning (a_message: STRING; a_locator: detachable XM_XPATH_LOCATOR)
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

	error (a_error: XM_XPATH_ERROR_VALUE)
			-- Receive notification of a recoverable error.
		local
			l_msg: STRING
			l_error: like a_error
		do
			recovered := True
			if recovery_policy /= Recover_silently then
				if recovery_policy = Recover_with_warnings then
					l_msg := "Recoverable error: "
				else
					check recovery_policy = Do_not_recover then
						recovered := False
						l_msg := "Error: "
					end
				end
				if is_error_code_editing then
					create l_error.make (a_error.description, error_change_stack.item.first, error_change_stack.item.second, a_error.value, a_error.type)
				else
					l_error := a_error
				end
				set_error_text (STRING_.concat (l_msg, l_error.error_message), a_error)
			end
		end

	fatal_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Receive notification of a non-recoverable error.
		local
			l_error: like a_error
		do
			if is_error_code_editing then
				create l_error.make (a_error.description, error_change_stack.item.first, error_change_stack.item.second, a_error.value, a_error.type)
			else
				l_error := a_error
			end
			set_error_text (STRING_.concat ("Fatal error: ", l_error.error_message), a_error)
		end

feature {NONE} -- Implementation


	set_error_text (a_message: STRING; a_locator: detachable XM_XPATH_LOCATOR)
			-- Set_error_text.
		require
			message_not_void: a_message /= Void
		local
			l_error_text: like error_text
		do
			if a_locator /= Void then
				if a_locator.line_number > 0 then
					l_error_text := "At line " + a_locator.line_number.out + " in " + a_locator.system_id + ":"
				else
					l_error_text := "In " + a_locator.system_id + ":"
				end
			else
				l_error_text := ""
			end
			error_text := STRING_.appended_string (l_error_text, a_message)
		end

invariant

	error_text: not recovered implies error_text /= Void

end

