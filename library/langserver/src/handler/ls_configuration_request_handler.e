note

	description:

		"LSP handlers for 'workspace/configuration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CONFIGURATION_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER
		redefine
			client_capabilities
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_CONFIGURATION_CAPABILITIES
			-- Client capabilities

feature -- Status report

	is_configuration_supported: BOOLEAN
			-- Does client support 'workspace/configuration' requests?
		do
			Result := attached client_capabilities as l_capabilities and then l_capabilities.to_boolean
		end

feature {NONE} -- Implementation

	request: LS_CONFIGURATION_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	response_result: LS_CONFIGURATION_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
