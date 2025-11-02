note

	description:

		"LSP server handlers for 'initialized' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_INITIALIZED_NOTIFICATION_HANDLER

inherit

	LS_INITIALIZED_NOTIFICATION_HANDLER
		redefine
			message_manager,
			internal_handle
		end

create

	make

feature {LS_MESSAGE} -- Basic operations

	internal_handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
			-- Check the soundness of the client/server communication.
		do
			set_initialized (True)
			handle (a_notification, a_manager)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
