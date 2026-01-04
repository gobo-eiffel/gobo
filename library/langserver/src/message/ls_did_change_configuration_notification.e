note

	description:

		"LSP 'workspace/didChangeConfiguration' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_CONFIGURATION_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_DID_CHANGE_CONFIGURATION_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_settings: like settings)
			-- Create a new 'workspace/didChangeConfiguration' notification.
		require
			a_settings_not_void: a_settings /= Void
		do
			settings := a_settings
		ensure
			settings_set: settings = a_settings
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "workspace/didChangeConfiguration"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_DID_CHANGE_CONFIGURATION_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.did_change_configuration_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_configuration_notification (Current)
		end

end
