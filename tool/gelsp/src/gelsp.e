note

	description:

		"Gobo Eiffel Language Server, using protocol LSP."

	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class GELSP

inherit

	LS_SERVER
		undefine
			version_number
		redefine
			server_name,
			server_description,
			hover_request_handler,
			initialized_notification_handler
		end

	GELSP_VERSION

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature -- Access

	server_name: STRING_8 = "gelsp"
			-- Server name

	server_description: STRING_8 = "Gobo Eiffel LSP, Language Server for Eiffel."
			-- Server description

feature -- Handlers

	hover_request_handler: GELSP_HOVER_REQUEST_HANDLER
			-- Handler for 'textDocument/hover' requests
		once ("OBJECT")
			create Result.make
		end

	initialized_notification_handler: GELSP_INITIALIZED_NOTIFICATION_HANDLER
			-- Handler for 'initialized' notifications
		once ("OBJECT")
			create Result.make
		end

end
