note

	description:

		"LSP handlers for already handled messages"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_HANDLED_MESSAGE_HANDLER

inherit

	LS_MESSAGE_HANDLER

create

	make

feature -- Basic operations

	handle (a_message: LS_HANDLED_MESSAGE; a_manager: like message_manager)
			-- Handle `a_message`.
		do
			a_manager.send_message (a_message.response)
		end

feature {NONE} -- Implementation

	message: LS_HANDLED_MESSAGE
			-- Type of message to be handled by current handler
		do
			check False then end
		end

end
