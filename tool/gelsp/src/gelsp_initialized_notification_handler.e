note

	description:

		"LSP handlers for 'initialized' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_INITIALIZED_NOTIFICATION_HANDLER

inherit

	LS_SERVER_INITIALIZED_NOTIFICATION_HANDLER
		redefine
			handle
		end

create

	make

feature -- Basic operations

	handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
		local
			l_registrations: LS_REGISTRATION_LIST
			l_registration: LS_REGISTRATION
			l_options: LS_HOVER_REGISTRATION_OPTIONS
		do
			create l_options.make ({LS_NULL}.null, False)
			create l_registration.make ("xxx", "textDocument/hover", l_options)
			create l_registrations.make_with_capacity (1)
			l_registrations.put_last (l_registration)
			a_manager.send_register_capability_request (l_registrations)
		end

end
