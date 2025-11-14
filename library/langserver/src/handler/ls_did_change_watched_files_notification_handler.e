note

	description:

		"LSP handlers for 'workspace/didChangeWatchedFiles' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			client_capabilities,
			registration_options
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES
			-- Client capabilities

feature {NONE} -- Implementation

	notification: LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

end
