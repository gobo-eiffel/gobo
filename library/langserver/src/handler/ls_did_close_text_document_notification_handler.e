note

	description:

		"LSP handlers for 'textDocument/didClose' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			client_capabilities,
			server_options,
			registration_options,
			build_server_options
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_DID_CLOSE_TEXT_DOCUMENT_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_DID_CLOSE_TEXT_DOCUMENT_OPTIONS
			-- Server options

feature -- Setting

	build_server_options
			-- Build `server_options`.
			--
			-- (To be redefined in servers.)
		do
			if server_options /= Void then
				-- Keep `server_options` if already built.
			elseif not generating_type.same_type ({detachable LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	notification: LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

end
