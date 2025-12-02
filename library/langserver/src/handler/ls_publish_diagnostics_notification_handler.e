note

	description:

		"LSP handlers for 'textDocument/publishDiagnostics' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_PUBLISH_DIAGNOSTICS_NOTIFICATION_HANDLER

inherit

	LS_NOTIFICATION_HANDLER
		redefine
			client_capabilities
		end

create

	make

feature -- Access

	client_capabilities: detachable LS_PUBLISH_DIAGNOSTICS_CAPABILITIES
			-- Client capabilities

feature -- Status report

	is_related_information_supported: BOOLEAN
			-- Does client accept diagnostics with related information?
		do
			Result := attached client_capabilities as l_capabilities and then
				attached l_capabilities.related_information as l_related_information and then
				l_related_information
		end

	is_version_supported: BOOLEAN
			-- Does client interpret the 'version' property of the
			-- 'textDocument/publishDiagnostics' notification's parameter?
		do
			Result := attached client_capabilities as l_capabilities and then
				attached l_capabilities.version_support as l_version_support and then
				l_version_support
		end

	is_code_description_supported: BOOLEAN
			-- Does client support 'code_description' property?
		do
			Result := attached client_capabilities as l_capabilities and then
				attached l_capabilities.code_description_support as l_code_description_support and then
				l_code_description_support
		end

	is_data_supported: BOOLEAN
			-- Does client support code action supports the 'data' property which is
			-- preserved between a 'textDocument/publishDiagnostics' and
			-- 'textDocument/codeAction' request?
		do
			Result := attached client_capabilities as l_capabilities and then
				attached l_capabilities.data_support as l_data_support and then
				l_data_support
		end

feature {NONE} -- Implementation

	notification: LS_PUBLISH_DIAGNOSTICS_NOTIFICATION
			-- Type of notification to be handled by current handler
		do
			check False then end
		end

end
