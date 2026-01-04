note

	description:

		"LSP server handlers for 'workspace/didChangeConfiguration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_DID_CHANGE_CONFIGURATION_NOTIFICATION_HANDLER

inherit

	LS_DID_CHANGE_CONFIGURATION_NOTIFICATION_HANDLER
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
			a_manager.on_did_change_configuration_notification (a_notification)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
