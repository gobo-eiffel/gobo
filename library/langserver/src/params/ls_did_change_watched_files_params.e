note

	description:

		"LSP 'DidChangeWatchedFiles' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_CHANGE_WATCHED_FILES_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	changes: LS_FILE_EVENT_LIST
			-- The actual file events.

feature -- Field names

	changes_name: STRING_8 = "changes"
			-- Field names

invariant

	changes_not_void: changes /= Void

end
