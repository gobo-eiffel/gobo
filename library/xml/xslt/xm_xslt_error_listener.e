indexing

	description:

		"Objects that receive notification of transformation errors"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_ERROR_LISTENER

	-- TODO: add a locator parameterr to all routines

feature -- Events

	warning (a_message: STRING) is
			-- Receive notification of a warning.
		require
			message_not_void: a_message /= Void
		deferred
		end

	error (a_message: STRING) is
			-- Receive notification of a recoverable error.
		require
			message_not_void: a_message /= Void
		deferred
		end

	fatal_error (a_message: STRING) is
			-- Receive notification of a non-recoverable error.
		require
			message_not_void: a_message /= Void
		deferred
		end

end
	
