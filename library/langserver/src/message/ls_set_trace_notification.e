note

	description:

		"LSP '$/setTrace' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SET_TRACE_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_SET_TRACE_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_value: like value)
			-- Create a new '$/setTrace' notification.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "$/setTrace"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_SET_TRACE_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.set_trace_notification_handler
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_set_trace_notification (Current)
		end

end
