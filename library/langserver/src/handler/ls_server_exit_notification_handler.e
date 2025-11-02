note

	description:

		"LSP server handlers for 'exit' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_EXIT_NOTIFICATION_HANDLER

inherit

	LS_EXIT_NOTIFICATION_HANDLER
		redefine
			message_manager,
			internal_handle,
			handle
		end

	KL_SHARED_EXCEPTIONS
		export {NONE} all end

create

	make

feature -- Basic operations

	handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
		do
			if a_manager.is_shutdown then
				Exceptions.die (0)
			else
				Exceptions.die (1)
			end
		end

feature {LS_MESSAGE} -- Basic operations

	internal_handle (a_notification: like notification; a_manager: like message_manager)
			-- Handle `a_notification`.
			-- Check the soundness of the client/server communication.
		do
			handle (a_notification, a_manager)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
