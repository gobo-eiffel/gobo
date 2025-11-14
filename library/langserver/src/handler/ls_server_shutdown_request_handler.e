note

	description:

		"LSP server handlers for 'shutdown' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_SHUTDOWN_REQUEST_HANDLER

inherit

	LS_SHUTDOWN_REQUEST_HANDLER
		redefine
			message_manager,
			internal_handle,
			handle
		end

create

	make

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_response: LS_RESPONSE
		do
			a_manager.on_shutdown_request (a_request)
			create l_response.make_success (a_request.id, {LS_NULL}.null)
			a_manager.send_message (l_response)
		end

feature {LS_MESSAGE} -- Basic operations

	internal_handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
			-- Check the soundness of the client/server communication.
		local
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
		do
			if not a_manager.is_initialized then
				create l_error.make ({LS_ERROR_CODES}.server_not_initialized, "not initialized")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			elseif a_manager.is_shutdown then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "already shutdown")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			else
				set_shutdown (True)
				handle (a_request, a_manager)
			end
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
