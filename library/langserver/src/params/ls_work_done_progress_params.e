note

	description:

		"LSP 'WorkDoneProgress' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_WORK_DONE_PROGRESS_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	work_done_token: detachable LS_PROGRESS_TOKEN
			-- An optional token that a server can use to report work done progress.

feature -- Field names

	work_done_token_name: STRING_8 = "workDoneToken"
			-- Field names

end
