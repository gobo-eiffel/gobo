indexing

	description:

		"Objects that receive notification of transformation errors"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_ERROR_LISTENER

feature -- Status report

	is_impure: BOOLEAN
			-- Does `Current' have state?

	recovered: BOOLEAN is
			-- Did `Current' recover from the last recoverable error?
		deferred
		end
	
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

feature -- Duplication

	new_instance: like Current is
			-- Pristine instance of `Current'
		require
			impure: is_impure
		deferred
		ensure
			instance_not_void: Result /= Void
		end

end
	
