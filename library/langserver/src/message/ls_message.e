note

	description:

		"LSP messages"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_MESSAGE

inherit

	LS_ANY

feature -- Access

	handler (a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE_HANDLER
			-- Message handler for current message
		require
			a_manager_not_void: a_manager /= Void
		deferred
		ensure
			handler_not_void: Result /= Void
		end

feature -- Field names

	jsonrpc_name: STRING_8 = "jsonrpc"
			-- Field names

feature -- Basic operations

	handle (a_manager: LS_MESSAGE_MANAGER)
			-- Handle current message using `handler`.
		require
			a_manager_not_void: a_manager /= Void
		do
			handler (a_manager).internal_handle (Current, a_manager)
		end

end
