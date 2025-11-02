note

	description:

		"LSP 'LogTrace' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_LOG_TRACE_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	message: LS_STRING
			-- The message to be logged.

	verbose: detachable LS_STRING
			-- Additional information that can be computed if the 'trace' configuration
			-- is set to 'verbose'

feature -- Field names

	message_name: STRING_8 = "message"
	verbose_name: STRING_8 = "verbose"
			-- Field names

invariant

	message_not_void: message /= Void

end
