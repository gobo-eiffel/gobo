note

	description:

		"LSP 'Cancel' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CANCEL_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	id: LS_REQUEST_ID
			-- The request id to cancel

feature -- Field names

	id_name: STRING_8 = "id"
			-- Field names

invariant

	id_not_void: id /= Void

end
