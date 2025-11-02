note

	description:

		"LSP server handlers for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_INITIALIZE_REQUEST_HANDLER

inherit

	LS_INITIALIZE_REQUEST_HANDLER
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
			l_result: LS_INITIALIZE_RESULT
			l_capabilities: LS_SERVER_CAPABILITIES
		do
			if attached a_request.trace as l_trace then
				a_manager.set_trace_notification_handler.set_trace_value (l_trace)
			end
			if attached a_request.capabilities.text_document as l_text_document_capabilities then
				a_manager.hover_request_handler.set_client_capabilities (l_text_document_capabilities.hover)
			end
			create l_capabilities.make
			a_manager.hover_request_handler.build_server_options
			if attached a_manager.hover_request_handler.server_options as l_server_options then
				l_capabilities.set_hover_provider (l_server_options)
			end
			create l_result.make (l_capabilities)
			create l_response.make_success (a_request.id, l_result)
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
			if a_manager.is_initialized then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "already initialized")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			elseif a_manager.is_shutdown then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "is shutdown")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			else
				set_initializing (True)
				handle (a_request, a_manager)
				set_initializing (False)
			end
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
