note

	description:

		"LSP response handlers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_RESPONSE_HANDLER

inherit

	LS_MESSAGE_HANDLER
		rename
			message as response
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new response handler.
		do
			create pending_requests.make (100)
		end

feature -- Access

	pending_requests: DS_HASH_TABLE [LS_REQUEST, LS_REQUEST_ID]
			-- Requests for which a response is expected

feature -- Basic operations

	handle (a_response: like response; a_manager: like message_manager)
			-- Handle `a_response`.
		local
			l_request: LS_REQUEST
			l_handler: LS_REQUEST_HANDLER
		do
			if attached {LS_REQUEST_ID} a_response.id as l_id then
				pending_requests.search (l_id)
				if pending_requests.found then
					l_request := pending_requests.found_item
					pending_requests.remove_found_item
					l_handler := l_request.handler (a_manager)
					l_handler.handle_response (a_response, l_request, a_manager)
				end
			end
		end

feature {NONE} -- Implementation

	response: LS_RESPONSE
			-- Type of message to be handled by current handler
		do
			check False then end
		end

invariant

	pending_requests_not_void: pending_requests /= Void
	not_void_pending_request: not pending_requests.has_void_item

end
