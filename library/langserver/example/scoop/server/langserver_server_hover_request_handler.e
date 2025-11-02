note

	description:

		"Langserver client handlers for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LANGSERVER_SERVER_HOVER_REQUEST_HANDLER

inherit

	LS_HOVER_REQUEST_HANDLER
		redefine
			handle
		end

create

	make

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		do
			precursor (a_request, a_manager)
		end

end
