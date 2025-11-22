note

	description:

		"LSP handlers for 'textDocument/willSave' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER

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

	client_capabilities: detachable LS_WILL_SAVE_TEXT_DOCUMENT_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_WILL_SAVE_TEXT_DOCUMENT_OPTIONS
			-- Server options

feature -- Status report

	is_will_save_supported: BOOLEAN
			-- Does client support will save notifications?
		do
			if attached client_capabilities as l_capabilities and then attached l_capabilities.will_save as l_will_save then
				Result := l_will_save
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
			elseif not is_will_save_supported then
				-- Will save notifications are not supported by the client.
			elseif not generating_type.same_type ({detachable LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	notification: LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

end
