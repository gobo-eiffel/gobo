note

	description:

	"Objects that can test for the occurrence of an error message"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006-2018, Colin Adams and others"
	license: "MIT License"

class XM_XSLT_TESTING_ERROR_LISTENER

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
			recovery_policy := a_recovery_policy
			create reported_errors.make (10)
			reported_errors.set_equality_tester (string_equality_tester)
			create error_change_stack.make_default
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

feature -- Access

	reported_errors: DS_HASH_SET [STRING]
			-- Error identifiers seen

feature -- Status report

	has (a_identifier: STRING): BOOLEAN
			-- Has message `a_identifier' been seen?
		require
			a_identifier_not_void: a_identifier /= Void
		do
			Result := reported_errors.has (a_identifier)
		end

	count: INTEGER
			-- Number of different errors that occurred (possibly recovered)
		do
			Result := reported_errors.count
		ensure
			non_negative_count: Result >= 0
		end

feature -- Events

	warning (a_message: STRING; a_locator: detachable XM_XPATH_LOCATOR)
			-- Receive notification of a warning.
		do
			do_nothing
		end

	error (a_error: XM_XPATH_ERROR_VALUE)
			-- Receive notification of a recoverable error.
		local
			l_error: like a_error
		do
			if recovery_policy = Do_not_recover then
				recovered := False
			else
				recovered := True
			end
			if is_error_code_editing then
					create l_error.make (a_error.description, error_change_stack.item.first, error_change_stack.item.second, a_error.value, a_error.type)
				else
					l_error := a_error
				end
			if reported_errors.has (l_error.error_identifier) then
				-- do nothing
			else
				reported_errors.force_new (l_error.error_identifier)
			end
		end

	fatal_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Receive notification of a non-recoverable error.
		do
			error (a_error)
		end

invariant

	reported_errors_not_void: reported_errors /= Void

end

