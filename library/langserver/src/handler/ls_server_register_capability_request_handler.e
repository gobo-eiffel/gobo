note

	description:

		"LSP server handlers for 'client/registerCapability' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_REGISTER_CAPABILITY_REQUEST_HANDLER

inherit

	LS_REGISTER_CAPABILITY_REQUEST_HANDLER
		redefine
			message_manager,
			handle_response
		end

create

	make

feature -- Basic oprations

	handle_response (a_response: LS_RESPONSE; a_request: like request; a_manager: like message_manager)
			-- Handle response `a_response` to `a_request`.
		local
			l_registration_list: LS_REGISTRATION_LIST
			l_registration: LS_REGISTRATION
			i, nb: INTEGER
		do
			l_registration_list := a_request.registrations
			nb := l_registration_list.count
			from i := 1 until i > nb loop
				l_registration := l_registration_list.registration (i)
				if l_registration.method ~ {LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION}.method then
					if attached {LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS} l_registration.register_options as l_register_options then
						a_manager.on_file_system_watchers_registered (l_register_options.watchers, l_registration, a_response)
					end
				end
				i := i + 1
			end
			precursor (a_response, a_request, a_manager)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
