note

	description:

		"LSP server handlers for 'workspace/configuration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_CONFIGURATION_REQUEST_HANDLER

inherit

	LS_CONFIGURATION_REQUEST_HANDLER
		redefine
			message_manager,
			handle_response
		end

create

	make

feature -- Basic oprations

	handle_response (a_response: LS_RESPONSE; a_request: like request; a_manager: like message_manager)
			-- Handle response `a_response` to `a_request`.
		do
			if attached a_response.error as l_error then
				a_manager.on_configuration_response (Void, a_request, a_response)
				handle_response_error (l_error, a_request, a_manager)
			elseif
				attached a_manager.message_factories.value (a_request.method) as l_factory and then
				attached {like response_result} l_factory.new_response_result (a_response, a_manager) as l_result
			then
				a_manager.on_configuration_response (l_result, a_request, a_response)
				handle_response_result (l_result, a_request, a_manager)
			else
				a_manager.on_configuration_response (Void, a_request, a_response)
			end
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
