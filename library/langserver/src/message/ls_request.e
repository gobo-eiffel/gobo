note

	description:

		"LSP requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_REQUEST

inherit

	LS_MESSAGE
		redefine
			handler
		end

feature -- Access

	id: LS_REQUEST_ID
			-- Request id

	method: LS_STRING
			-- Method to be invoked
		deferred
		ensure
			method_not_void: Result /= Void
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_REQUEST_HANDLER
			-- Message handler for current message
		deferred
		end

feature -- Basic operations

	handle_response (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER)
			-- Handle  response `a_response` to current message using `handler`.
		require
			a_response_not_void: a_response /= Void
			a_manager_not_void: a_manager /= Void
		do
			handler (a_manager).handle_response (a_response, Current, a_manager)
		end

feature -- Field names

	id_name: STRING_8 = "id"
	method_name: STRING_8 = "method"
	params_name: STRING_8 = "params"
			-- Field names

invariant

	id_not_void: id /= Void

end
