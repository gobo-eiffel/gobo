note

	description:

		"LSP options to be used when registering for file system change events"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS

inherit

	LS_SERVER_REGISTRATION_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_watchers: like watchers)
			-- Create a new server options.
		require
			a_watchers_not_void: a_watchers /= Void
		do
			watchers := a_watchers
		ensure
			watchers_set: watchers = a_watchers
		end

feature -- Access

	watchers: LS_FILE_SYSTEM_WATCHER_LIST
			-- The watchers to register.

feature -- Field names

	watchers_name: STRING_8 = "watchers"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_watched_files_registration_options (Current)
		end

invariant

	watchers_not_void: watchers /= Void

end
