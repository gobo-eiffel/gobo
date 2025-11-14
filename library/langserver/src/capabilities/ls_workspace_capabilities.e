note

	description:

		"LSP workspace specific client capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
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

	did_change_watched_files: detachable LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES
			-- Capabilities specific to the `workspace/didChangeWatchedFiles` notification.

feature -- Setting

	set_did_change_watched_files (a_did_change_watched_files: like did_change_watched_files)
			-- Set `did_change_watched_files` to `a_did_change_watched_files`.
		do
			did_change_watched_files := a_did_change_watched_files
		ensure
			did_change_watched_files_set: did_change_watched_files = a_did_change_watched_files
		end

feature -- Field names

	did_change_watched_files_name: STRING_8 = "didChangeWatchedFiles"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_workspace_capabilities (Current)
		end

end
