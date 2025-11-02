note

	description:

		"LSP 'Progress' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_PROGRESS_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	token: LS_PROGRESS_TOKEN
			-- The progress token provided by the client or server.

	value: LS_ANY
			-- The progress data.

feature -- Field names

	token_name: STRING_8 = "token"
	value_name: STRING_8 = "value"
			-- Field names

invariant

	token_not_void: token /= Void
	value_not_void: value /= Void

end
