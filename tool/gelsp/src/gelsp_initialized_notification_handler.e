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
			handle,
			message_manager
		end

create

	make

feature -- Basic operations

	handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
		do
			a_manager.on_initialized_notification (a_notification)
		end

feature {NONE} -- Implementation

	message_manager: GELSP
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
