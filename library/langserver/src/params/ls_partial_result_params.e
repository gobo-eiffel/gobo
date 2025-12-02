note

	description:

		"LSP partial result parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_PARTIAL_RESULT_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	partial_result_token: detachable LS_PROGRESS_TOKEN
			-- An optional token that a server can use to report partial results (e.g.
			-- streaming) to the client.

feature -- Field names

	partial_result_token_name: STRING_8 = "partialResultToken"
			-- Field names

end
