note

	description:

		"LSP server handlers for 'textDocument/didClose' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_HANDLER

inherit

	LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
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
			a_manager.on_did_close_text_document_notification (a_notification)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
