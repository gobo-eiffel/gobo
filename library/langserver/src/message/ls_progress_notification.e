note

	description:

		"LSP '$/progress' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_PROGRESS_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_PROGRESS_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_token: like token; a_value: like value)
			-- Create a new '$/progress' notification.
		require
			a_token_not_void: a_token /= Void
			a_value_not_void: a_value /= Void
		do
			token := a_token
			value := a_value
		ensure
			token_set: token = a_token
			value_set: value = a_value
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "$/progress"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_PROGRESS_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.progress_notification_handler
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_progress_notification (Current)
		end

end
