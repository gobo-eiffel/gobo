indexing

	description:

	"Objects that can test for the occurrence of an error message"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2006, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

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

	make (a_recovery_policy: INTEGER) is
			-- Establish invariant.
		require
			recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover
		do
			recovery_policy := a_recovery_policy
			create reported_errors.make (10)
			reported_errors.set_equality_tester (string_equality_tester)
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

feature -- Status report

	has (a_identifier: STRING): BOOLEAN is
			-- Has message `a_identifier' been seen?
		require
			a_identifier_not_void: a_identifier /= Void
		do
			Result := reported_errors.has (a_identifier)
		end

feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a warning.
		do
			do_nothing
		end

	error (a_error: XM_XPATH_ERROR_VALUE) is
			-- Receive notification of a recoverable error.
		do
			if recovery_policy = Do_not_recover then
				recovered := False
			else
				recovered := True
			end
			if reported_errors.has (a_error.error_identifier) then
				-- do nothing
			else
				reported_errors.force_new (a_error.error_identifier)
			end
		end

	fatal_error (a_error: XM_XPATH_ERROR_VALUE) is
			-- Receive notification of a non-recoverable error.
		do
			error (a_error)
		end

feature {NONE} -- Implementation

	reported_errors: DS_HASH_SET [STRING]
			-- Error identifiers seen

invariant

	reported_errors_not_void: reported_errors /= Void

end

