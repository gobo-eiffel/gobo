note

	description:

		"LSP server handlers for 'textDocument/declaration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_DECLARATION_REQUEST_HANDLER

inherit

	LS_DECLARATION_REQUEST_HANDLER
		redefine
			handle,
			message_manager
		end

create

	make

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_response: LS_DECLARATION_RESPONSE
		do
			create l_response.make (a_request.id)
			a_manager.on_declaration_request (a_request, l_response)
			a_manager.send_message (l_response)
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
