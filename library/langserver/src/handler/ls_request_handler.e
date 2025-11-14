note

	description:

		"LSP request handlers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_REQUEST_HANDLER

inherit

	LS_MESSAGE_HANDLER
		rename
			message as request
		redefine
			request,
			internal_handle
		end

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
		do
			create l_error.make ({LS_ERROR_CODES}.request_failed, "method '" + a_request.method.utf8_value + "' not supported")
			create l_response.make_error (a_request.id, l_error)
			a_manager.send_message (l_response)
		end

	handle_response (a_response: LS_RESPONSE; a_request: like request; a_manager: like message_manager)
			-- Handle response `a_response` to `a_request`.
		require
			a_response_not_void: a_response /= Void
			a_request_not_void: a_request /= Void
			a_manager_not_void: a_manager /= Void
		do
			if attached a_response.error as l_error then
				handle_response_error (l_error, a_request, a_manager)
			elseif
				attached a_manager.message_factories.value (a_request.method) as l_factory and then
				attached {like response_result} l_factory.new_response_result (a_response, a_manager) as l_result
			then
				handle_response_result (l_result, a_request, a_manager)
			end
		end

	handle_response_result (a_result: like response_result; a_request: like request; a_manager: like message_manager)
			-- Handle response result `a_result` to `a_request`.
		require
			a_result_not_void: a_result /= Void
			a_request_not_void: a_request /= Void
			a_manager_not_void: a_manager /= Void
		do
		end

	handle_response_error (a_error: LS_RESPONSE_ERROR; a_request: like request; a_manager: like message_manager)
			-- Handle response error `a_error` to `a_request`.
		require
			a_error_not_void: a_error /= Void
			a_request_not_void: a_request /= Void
			a_manager_not_void: a_manager /= Void
		do
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
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "is shutdown")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			else
				handle (a_request, a_manager)
			end
		end

feature {NONE} -- Implementation

	request: LS_REQUEST
			-- Type of request to be handled by current handler
		deferred
		end

	response_result: LS_RESPONSE_RESULT
			-- Type of response result to be handled by current handler
		deferred
		end

end
