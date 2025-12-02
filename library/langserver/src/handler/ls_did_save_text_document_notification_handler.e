note

	description:

		"LSP handlers for 'textDocument/didSave' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER

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

	client_capabilities: detachable LS_DID_SAVE_TEXT_DOCUMENT_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- Server options

feature -- Status report

	is_did_save_supported: BOOLEAN
			-- Does client support did save notifications?
		do
			if attached client_capabilities as l_capabilities and then attached l_capabilities.did_save as l_did_save then
				Result := l_did_save
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
			elseif not is_did_save_supported then
				-- Did save notifications are not supported by the client.
			elseif not generating_type.same_type ({detachable LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	notification: LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

end
