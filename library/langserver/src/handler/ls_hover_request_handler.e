note

	description:

		"LSP handlers for 'textDocument/hover' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_HOVER_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER
		redefine
			client_capabilities,
			server_options,
			build_server_options,
			registration_options
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_HOVER_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_OPTIONAL_HOVER_OPTIONS
			-- Server options

feature -- Setting

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
			if not generating_type.same_type ({detachable LS_HOVER_REQUEST_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	request: LS_HOVER_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_HOVER_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

	response_result: LS_OPTIONAL_HOVER_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
