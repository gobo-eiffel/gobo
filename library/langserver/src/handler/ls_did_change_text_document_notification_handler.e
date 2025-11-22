note

	description:

		"LSP handlers for 'textDocument/didChange' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			client_capabilities,
			server_options,
			registration_options
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_DID_CHANGE_TEXT_DOCUMENT_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_DID_CHANGE_TEXT_DOCUMENT_OPTIONS
			-- Server options

feature {NONE} -- Implementation

	notification: LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

end
