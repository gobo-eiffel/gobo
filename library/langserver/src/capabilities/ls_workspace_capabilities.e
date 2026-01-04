note

	description:

		"LSP workspace specific client capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_CAPABILITIES

inherit

	LS_CLIENT_CAPABILITIES

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new client capabilities.
		do
		end

feature -- Access

	did_change_configuration: detachable LS_DID_CHANGE_CONFIGURATION_CAPABILITIES
			-- Capabilities specific to the `workspace/didChangeConfiguration` notification.

	did_change_watched_files: detachable LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES
			-- Capabilities specific to the `workspace/didChangeWatchedFiles` notification.

	symbol: detachable LS_WORKSPACE_SYMBOL_CAPABILITIES
			-- Capabilities specific to the `workspace/symbol` request.

	configuration: detachable LS_CONFIGURATION_CAPABILITIES
			-- The client supports 'workspace/configuration' requests.

feature -- Setting

	set_did_change_configuration (a_did_change_configuration: like did_change_configuration)
			-- Set `did_change_configuration` to `a_did_change_configuration`.
		do
			did_change_configuration := a_did_change_configuration
		ensure
			did_change_configuration_set: did_change_configuration = a_did_change_configuration
		end

	set_did_change_watched_files (a_did_change_watched_files: like did_change_watched_files)
			-- Set `did_change_watched_files` to `a_did_change_watched_files`.
		do
			did_change_watched_files := a_did_change_watched_files
		ensure
			did_change_watched_files_set: did_change_watched_files = a_did_change_watched_files
		end

	set_symbol (a_symbol: like symbol)
			-- Set `symbol` to `a_symbol`.
		do
			symbol := a_symbol
		ensure
			symbol_set: symbol = a_symbol
		end

	set_configuration (a_configuration: like configuration)
			-- Set `did_change_watched_files` to `a_did_change_watched_files`.
		do
			configuration := a_configuration
		ensure
			configuration_set: configuration = a_configuration
		end

feature -- Field names

	did_change_configuration_name: STRING_8 = "didChangeConfiguration"
	did_change_watched_files_name: STRING_8 = "didChangeWatchedFiles"
	symbol_name: STRING_8 = "symbol"
	configuration_name: STRING_8 = "configuration"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_capabilities (Current)
		end

end
