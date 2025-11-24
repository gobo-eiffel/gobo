note

	description:

		"LSP handlers for 'textDocument/definition' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DEFINITION_REQUEST_HANDLER

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

	client_capabilities: detachable LS_DEFINITION_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_OPTIONAL_DEFINITION_OPTIONS
			-- Server options

feature -- Status report

	is_location_link_supported: BOOLEAN
			-- Does client support location links?
		do
			if attached client_capabilities as l_client_capabilities and then attached l_client_capabilities.link_support as l_link_support then
				Result := l_link_support
			end
		end

feature -- Setting

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
			if server_options /= Void then
				-- Keep `server_options` if already built.
			elseif not generating_type.same_type ({detachable LS_DEFINITION_REQUEST_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	request: LS_DEFINITION_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_DEFINITION_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

	response_result: LS_OPTIONAL_DEFINITION_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
