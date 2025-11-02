note

	description:

		"LSP client handlers for 'client/unregisterCapability' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CLIENT_UNREGISTER_CAPABILITY_REQUEST_HANDLER

inherit

	LS_UNREGISTER_CAPABILITY_REQUEST_HANDLER
		redefine
			handle,
			message_manager
		end

create

	make

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_unregistrations: LS_UNREGISTRATION_LIST
			l_unregistration: LS_UNREGISTRATION
			i, nb: INTEGER
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
			l_error_message: STRING_8
			l_handler: LS_MESSAGE_HANDLER
		do
			create l_error_message.make (0)
			l_unregistrations := a_request.unregistrations
			nb := l_unregistrations.count
			from i := 1 until i > nb loop
				l_unregistration := l_unregistrations.unregistration (i)
				if not attached a_manager.message_factories.value (l_unregistration.method) as l_factory then
					if not l_error_message.is_empty then
						l_error_message.append_string (", ")
					end
					l_error_message.append_string ("[" + l_unregistration.id.utf8_value + ", " + l_unregistration.method.utf8_value + "] ")
					l_error_message.append_string ("method '" + l_unregistration.method.utf8_value + "' not supported")
				else
					l_handler := l_factory.handler (a_manager)
					if not l_handler.is_dynamically_registrable then
						if not l_error_message.is_empty then
							l_error_message.append_string (", ")
						end
						l_error_message.append_string ("[" + l_unregistration.id.utf8_value + ", " + l_unregistration.method.utf8_value + "] ")
						l_error_message.append_string ("dynamic registration not supported")
					elseif not l_handler.has_server_options_with_id (l_unregistration.id) then
						if not l_error_message.is_empty then
							l_error_message.append_string (", ")
						end
						l_error_message.append_string ("[" + l_unregistration.id.utf8_value + ", " + l_unregistration.method.utf8_value + "] ")
						l_error_message.append_string ("id not found")
					else
						l_handler.unregister_server_options (l_unregistration.id)
					end
				end
				i := i + 1
			end
			if l_error_message.is_empty then
				create l_response.make_success (a_request.id, {LS_NULL}.null)
			else
				create l_error.make ({LS_ERROR_CODES}.request_failed, l_error_message)
				create l_response.make_error (a_request.id, l_error)
			end
			a_manager.send_message (l_response)
		end

feature {NONE} -- Implementation

	message_manager: LS_CLIENT_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
