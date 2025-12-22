note

	description:

		"LSP 'textDocument/completion' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_COMPLETION_PARAMS

inherit

	LS_TEXT_DOCUMENT_POSITION_PARAMS

	LS_WORK_DONE_PROGRESS_PARAMS

	LS_PARTIAL_RESULT_PARAMS

feature -- Access

	context: detachable LS_COMPLETION_CONTEXT
			-- The completion context. This is only available if the client specifies
			-- to send this using the client capability
			-- `completion.contextSupport === true`

feature -- Field names

	context_name: STRING_8 = "context"
			-- Field names

end
