note

	description:

		"LSP 'exit' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_EXIT_NOTIFICATION

inherit

	LS_NOTIFICATION

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new 'exit' notification.
		do
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "exit"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_EXIT_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.exit_notification_handler
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_exit_notification (Current)
		end

end
