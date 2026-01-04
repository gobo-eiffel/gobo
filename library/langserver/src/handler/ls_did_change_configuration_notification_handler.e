note

	description:

		"LSP handlers for 'workspace/didChangeConfiguration' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_CONFIGURATION_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			client_capabilities
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_DID_CHANGE_CONFIGURATION_CAPABILITIES
			-- Client capabilities

feature {NONE} -- Implementation

	notification: LS_DID_CHANGE_CONFIGURATION_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

end
