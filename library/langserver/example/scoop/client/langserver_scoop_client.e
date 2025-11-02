note

	description:

		"LSP example SCOOP clients"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LANGSERVER_SCOOP_CLIENT

inherit

	LS_CLIENT_MESSAGE_MANAGER
		redefine
			application_info,
			hover_request_handler
		end

create

	make

feature -- Access

	application_info: detachable LS_APPLICATION_INFO
			-- Information about current application
			-- (application name, application version)
		do
			create Result.make ("langclient", "1.0.0")
		end

feature -- Handlers

	hover_request_handler: LANGSERVER_CLIENT_HOVER_REQUEST_HANDLER
			-- Handler for 'textDocument/hover' requests
		once ("OBJECT")
			create Result.make
		end

end
