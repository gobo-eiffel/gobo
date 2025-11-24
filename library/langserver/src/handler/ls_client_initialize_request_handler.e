note

	description:

		"LSP client handlers for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CLIENT_INITIALIZE_REQUEST_HANDLER

inherit

	LS_INITIALIZE_REQUEST_HANDLER
		redefine
			message_manager,
			handle_response_result,
			handle_response_error
		end

create

	make

feature -- Basic operations

	handle_response_result (a_result: like response_result; a_request: like request; a_manager: like message_manager)
			-- Handle response result `a_result` to `a_request`.
		local
			l_server_capabilities: LS_SERVER_CAPABILITIES
		do
			l_server_capabilities := a_result.capabilities
			if attached {LS_TEXT_DOCUMENT_SYNC_KIND} l_server_capabilities.text_document_sync as l_sync_kind then
				a_manager.did_change_text_document_notification_handler.set_server_options (l_sync_kind)
			elseif attached {LS_TEXT_DOCUMENT_SYNC_OPTIONS} l_server_capabilities.text_document_sync as l_text_document_sync then
				a_manager.did_open_text_document_notification_handler.set_server_options (l_text_document_sync.open_close)
				a_manager.did_close_text_document_notification_handler.set_server_options (l_text_document_sync.open_close)
				a_manager.did_change_text_document_notification_handler.set_server_options (l_text_document_sync.change)
				a_manager.will_save_text_document_notification_handler.set_server_options (l_text_document_sync.will_save)
				a_manager.will_save_wait_until_text_document_request_handler.set_server_options (l_text_document_sync.will_save_wait_until)
				a_manager.did_save_text_document_notification_handler.set_server_options (l_text_document_sync.save)
			end
			a_manager.hover_request_handler.set_server_options (l_server_capabilities.hover_provider)
			a_manager.definition_request_handler.set_server_options (l_server_capabilities.definition_provider)
			a_manager.send_initialized_notification
		end

	handle_response_error (a_error: LS_RESPONSE_ERROR; a_request: like request; a_manager: like message_manager)
			-- Handle response error `a_error` to `a_request`.
		local
			l_retry: BOOLEAN
		do
			if
				attached {LS_OBJECT} a_error.data as l_data and then
				attached (create {LS_FACTORY}.make).initialize_error_from_object (l_data, {LS_RESPONSE}.error_name) as l_initialize_error and then
				l_initialize_error.retry_.value
			then
				l_retry := should_resend_initialize_request (a_error, a_request, a_manager)
			end
			if l_retry then
				set_initializing (False)
				a_manager.send_initialize_request
			end
		end

	should_resend_initialize_request (a_error: LS_RESPONSE_ERROR; a_request: like request; a_manager: like message_manager): BOOLEAN
			-- Should the 'initialize' method be sent again?
			--
			-- (To be redefined in clients.)
		require
			a_error_not_void: a_error /= Void
			a_request_not_void: a_request /= Void
			a_manager_not_void: a_manager /= Void
		do
			-- (1) show the message provided by the ResponseError to the user
			-- (2) user selects retry or cancel
			-- (3) if user selected retry the initialize method is sent again.
		end

feature {NONE} -- Implementation

	message_manager: LS_CLIENT_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
