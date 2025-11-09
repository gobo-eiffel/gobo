note

	description:

		"LSP handlers for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP_HOVER_REQUEST_HANDLER

inherit

	LS_HOVER_REQUEST_HANDLER
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
			l_response: LS_RESPONSE
		do
			l_response := a_manager.on_hover_request (a_request)
			if l_response = Void then
				create l_response.make_success (a_request.id, {LS_NULL}.null)
			end
			a_manager.send_message (l_response)
		end

feature {NONE} -- Implementation

	message_manager: GELSP
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
