note

	description:

		"LSP handlers for 'workspace/symbol' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_REQUEST_HANDLER

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

	client_capabilities: detachable LS_WORKSPACE_SYMBOL_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_OPTIONAL_WORKSPACE_SYMBOL_OPTIONS
			-- Server options

feature -- Setting

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
			if server_options /= Void then
				-- Keep `server_options` if already built.
			elseif not generating_type.same_type ({detachable LS_WORKSPACE_SYMBOL_REQUEST_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	request: LS_WORKSPACE_SYMBOL_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_WORKSPACE_SYMBOL_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

	response_result: LS_OPTIONAL_WORKSPACE_SYMBOL_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
