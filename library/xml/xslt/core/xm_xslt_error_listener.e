note

	description:

		"Objects that receive notification of transformation errors"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_ERROR_LISTENER

inherit

	XM_XSLT_CONFIGURATION_CONSTANTS

feature -- Access

	recovery_policy: INTEGER
		-- Recovery policy when warnings or errors are encountered

	warning_threshold: INTEGER
			-- Limit on number of warnings to be displayed

	recoverable_error_threshold: INTEGER
			-- Limit on number of recoverable errors to be displayed

	warnings_are_recoverable_errors: BOOLEAN
			-- Are warnings treated as recoverable errors?

feature -- Status report

	recovered: BOOLEAN
			-- Did `Current' recover from the last recoverable error?

	is_error_code_editing: BOOLEAN
			-- Will the next error code be edited?
		do
			Result := not error_change_stack.is_empty
		ensure
			definition: Result = not error_change_stack.is_empty
		end

feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR)
			-- Receive notification of a warning.
		require
			message_not_void: a_message /= Void
		deferred
		end

	error (a_error: XM_XPATH_ERROR_VALUE)
			-- Receive notification of a recoverable error.
		require
			error_not_void: a_error /= Void
		deferred
		end

	fatal_error (a_error: XM_XPATH_ERROR_VALUE)
			-- Receive notification of a non-recoverable error.
		require
			error_not_void: a_error /= Void
		deferred
		end

feature -- Status setting

	set_recovery_policy (a_recovery_policy: like recovery_policy)
			-- Set recovery policy.
		require
			valid_recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover
		do
			recovery_policy := a_recovery_policy
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

	set_warning_threshold (a_warning_threshold: like warning_threshold)
			-- Set `warning_threshold'.
		do
			warning_threshold := a_warning_threshold
		ensure
			threshold_set: warning_threshold = a_warning_threshold
		end

	set_recoverable_error_threshold (a_recoverable_error_threshold: like recoverable_error_threshold)
			-- Set `recoverable_error_threshold'.
		do
			recoverable_error_threshold := a_recoverable_error_threshold
		ensure
			threshold_set: recoverable_error_threshold = a_recoverable_error_threshold
		end

	treat_warnings_as_recoverable_errors
			-- Treat warnings as recoverable errors.
		do
			warnings_are_recoverable_errors := True
		end

feature -- Element change

	set_next_error_code (a_uri, a_code: STRING)
			-- Change the next reported error code to `a_uri'#`a_code'
		require
			a_uri_not_void: a_uri /= Void
			a_uri_not_empty: not a_uri.is_empty
			a_code_not_void: a_code /= Void
			a_code_not_empty: not a_code.is_empty
		do
			error_change_stack.force (create {DS_PAIR [STRING, STRING]}.make (a_uri, a_code))
		ensure
			one_more_change: error_change_stack.count = old error_change_stack.count + 1
			correct_error_code_set: error_change_stack.item.first.is_equal (a_uri) and error_change_stack.item.second.is_equal (a_code)
		end

	clear_next_error_code_change
			-- Reverse effect of last call to `set_next_error_code'.
		require
			next_error_code_set: is_error_code_editing
		do
			error_change_stack.remove
		ensure
			one_less: error_change_stack.count = old error_change_stack.count - 1
		end

feature {NONE} -- Implementation

	error_change_stack: DS_ARRAYED_STACK [DS_PAIR [STRING, STRING]]
			-- Stack for implementing `set_next_error_code'

invariant

	recovery_policy_in_range: recovery_policy >= Recover_silently and then recovery_policy <= Do_not_recover
	error_change_stack_not_void: error_change_stack /= Void

end

