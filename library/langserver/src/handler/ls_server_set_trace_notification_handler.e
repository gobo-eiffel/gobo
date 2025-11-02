note

	description:

		"LSP server handlers for '$/setTrace' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_SET_TRACE_NOTIFICATION_HANDLER

inherit

	LS_SET_TRACE_NOTIFICATION_HANDLER
		redefine
			message_manager,
			handle
		end

create

	make

feature -- Basic operations

	handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
		do
			set_trace_value (a_notification.value)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
