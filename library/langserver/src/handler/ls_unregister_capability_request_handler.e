note

	description:

		"LSP handlers for 'client/unregisterCapability' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UNREGISTER_CAPABILITY_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER

create

	make

feature {NONE} -- Implementation

	request: LS_UNREGISTER_CAPABILITY_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	response_result: LS_NULL
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
