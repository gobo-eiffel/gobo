note

	description:

		"LSP 'initialized' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZED_NOTIFICATION

inherit

	LS_NOTIFICATION

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new 'initialized' notification.
		do
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "initialized"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_INITIALIZED_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.initialized_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_initialized_notification (Current)
		end

end
