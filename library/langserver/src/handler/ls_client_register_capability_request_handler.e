note

	description:

		"LSP client handlers for 'client/registerCapability' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CLIENT_REGISTER_CAPABILITY_REQUEST_HANDLER

inherit

	LS_REGISTER_CAPABILITY_REQUEST_HANDLER
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
			l_registrations: LS_REGISTRATION_LIST
			l_registration: LS_REGISTRATION
			i, nb: INTEGER
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
			l_error_message: STRING_8
			l_handler: LS_MESSAGE_HANDLER
		do
			create l_error_message.make (0)
			l_registrations := a_request.registrations
			nb := l_registrations.count
			from i := 1 until i > nb loop
				l_registration := l_registrations.registration (i)
				if not attached a_manager.message_factories.value (l_registration.method) as l_factory then
					if not l_error_message.is_empty then
						l_error_message.append_string (", ")
					end
					l_error_message.append_string ("[" + l_registration.id.utf8_value + ", " + l_registration.method.utf8_value + "] ")
					l_error_message.append_string ("method '" + l_registration.method.utf8_value + "' not supported")
				elseif not attached l_factory.new_server_registration_options (l_registration, a_manager) as l_registration_options then
					if not l_error_message.is_empty then
						l_error_message.append_string (", ")
					end
					l_error_message.append_string ("[" + l_registration.id.utf8_value + ", " + l_registration.method.utf8_value + "] ")
					if not attached l_factory.last_error as l_last_error then
						l_error_message.append_string ({LS_REGISTRATION}.register_options_name + ": invalid field")
					else
						l_error_message.append_string (l_last_error)
					end
				else
					l_handler := l_factory.handler (a_manager)
					if not l_handler.is_dynamic_registration_supported then
						if not l_error_message.is_empty then
							l_error_message.append_string (", ")
						end
						l_error_message.append_string ("[" + l_registration.id.utf8_value + ", " + l_registration.method.utf8_value + "] ")
						l_error_message.append_string ("dynamic registration not supported")
					elseif l_handler.has_server_options_with_id (l_registration.id) then
						if not l_error_message.is_empty then
							l_error_message.append_string (", ")
						end
						l_error_message.append_string ("[" + l_registration.id.utf8_value + ", " + l_registration.method.utf8_value + "] ")
						l_error_message.append_string ("id already used")
					elseif not l_handler.is_server_option_valid (l_registration_options) then
						if not l_error_message.is_empty then
							l_error_message.append_string (", ")
						end
						l_error_message.append_string ("[" + l_registration.id.utf8_value + ", " + l_registration.method.utf8_value + "] ")
						l_error_message.append_string ("overlapping scope")
					else
						l_handler.register_server_options (l_registration.id, l_registration_options)
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
