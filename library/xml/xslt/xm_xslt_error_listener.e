indexing

	description:

		"Objects that receive notification of transformation errors"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_ERROR_LISTENER

inherit

	XM_XSLT_CONFIGURATION_CONSTANTS
	
feature -- Access

	recovery_policy: INTEGER
		-- Recovery policy when warnings or errors are encountered

feature -- Status report

	is_impure: BOOLEAN
			-- Does `Current' have state?

	recovered: BOOLEAN is
			-- Did `Current' recover from the last recoverable error?
		deferred
		end

	warning_threshold: INTEGER
			-- Limit on number of warnings to be displayed;
			-- Descendants may choose to ignore this.

	recoverable_error_threshold: INTEGER
			-- Limit on number of recoverable errors to be displayed;
			-- Descendants may choose to ignore this.
	
feature -- Events

	warning (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a warning.
		require
			message_not_void: a_message /= Void
		deferred
		end

	error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a recoverable error.
		require
			message_not_void: a_message /= Void
		deferred
		end

	fatal_error (a_message: STRING; a_locator: XM_XPATH_LOCATOR) is
			-- Receive notification of a non-recoverable error.
		require
			message_not_void: a_message /= Void
		deferred
		end

feature -- Element change

	set_recovery_policy (a_recovery_policy: like recovery_policy) is
			-- Set recovery policy.
		require
			valid_recovery_policy: a_recovery_policy >= Recover_silently and then a_recovery_policy <= Do_not_recover
			impure_handler: is_impure
		deferred
		ensure
			recovery_policy_set: recovery_policy = a_recovery_policy
		end

	set_warning_threshold (a_warning_threshold: like warning_threshold) is
			-- Set `warning_threshold'.
		require
			impure_handler: is_impure
		deferred
		ensure
			threshold_set: warning_threshold = a_warning_threshold
		end

	set_recoverable_error_threshold (a_recoverable_error_threshold: like recoverable_error_threshold) is
			-- Set `recoverable_error_threshold'.
		require
			impure_handler: is_impure
		deferred
		ensure
			threshold_set: recoverable_error_threshold = a_recoverable_error_threshold
		end

	treat_warnings_as_recoverable_errors is
			-- Treat warnings as recoverable errors.
		require
			impure_handler: is_impure
		deferred
		end

feature -- Duplication

	new_instance: like Current is
			-- Pristine instance of `Current'
		require
			impure_handler: is_impure
		deferred
		ensure
			instance_not_void: Result /= Void
		end

invariant

	recovery_policy: recovery_policy >= Recover_silently and then recovery_policy <= Do_not_recover

end
	
