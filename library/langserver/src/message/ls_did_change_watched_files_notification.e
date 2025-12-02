note

	description:

		"LSP 'workspace/didChangeWatchedFiles' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_DID_CHANGE_WATCHED_FILES_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_changes: like changes)
			-- Create a new 'workspace/didChangeWatchedFiles' notification.
		require
			a_changes_not_void: a_changes /= Void
		do
			changes := a_changes
		ensure
			changes_set: changes = a_changes
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "workspace/didChangeWatchedFiles"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.did_change_watched_files_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_watched_files_notification (Current)
		end

end
