note

	description:

		"LSP client handlers for 'shutdown' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CLIENT_SHUTDOWN_REQUEST_HANDLER

inherit

	LS_SHUTDOWN_REQUEST_HANDLER
		redefine
			message_manager,
			handle_response_result
		end

create

	make

feature -- Basic operations

	handle_response_result (a_result: like response_result; a_request: like request; a_manager: like message_manager)
			-- Handle response result `a_result` to `a_request`.
		do
			a_manager.send_exit_notification
		end

feature {NONE} -- Implementation

	message_manager: LS_CLIENT_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
