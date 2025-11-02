note

	description:

		"LSP notification handlers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_NOTIFICATION_HANDLER

inherit

	LS_MESSAGE_HANDLER
		rename
			message as notification
		redefine
			notification,
			internal_handle
		end

feature -- Basic operations

	handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
		do
			-- Do nothing.
		end

feature {LS_MESSAGE} -- Basic operations

	internal_handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
			-- Check the soundness of the client/server communication.
		do
			if a_manager.is_initialized and not a_manager.is_shutdown then
				handle (a_notification, a_manager)
			end
		end

feature {NONE} -- Implementation

	notification: LS_NOTIFICATION
			-- Type of notification to be handled by current handler
		deferred
		end

end
