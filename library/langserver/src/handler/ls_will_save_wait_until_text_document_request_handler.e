note

	description:

		"LSP handlers for 'textDocument/willSaveWaitUntil' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_HANDLER

inherit

	LS_REQUEST_HANDLER
		redefine
			client_capabilities,
			server_options,
			registration_options,
			build_server_options
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_CAPABILITIES
			-- Client capabilities

	server_options: detachable LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_OPTIONS
			-- Server options

feature -- Status report

	is_will_save_wait_until_supported: BOOLEAN
			-- Does client support will save wait until requests?
		do
			if attached client_capabilities as l_capabilities and then attached l_capabilities.will_save_wait_until as l_will_save_wait_until then
				Result := l_will_save_wait_until
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
			elseif not is_will_save_wait_until_supported then
				-- Will save wait until are not supported by the client.
			elseif not generating_type.same_type ({detachable LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_HANDLER}) then
				server_options := {LS_BOOLEAN}.true_
			end
		end

feature {NONE} -- Implementation

	request: LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST
			-- Type of request to be handled by current handler
		do
			check False then end
		end

	registration_options: LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Type of the dynamic registration options
		do
			check False then end
		end

	response_result: LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT
			-- Type of response result to be handled by current handler
		do
			check False then end
		end

end
