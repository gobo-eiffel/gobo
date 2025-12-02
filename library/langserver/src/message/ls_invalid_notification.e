note

	description:

		"LSP invalid notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INVALID_NOTIFICATION

inherit

	LS_NOTIFICATION

create

	make

feature {NONE} -- Initialization

	make (a_method: like method; a_notification: like notification; a_error: like error)
			-- Create a new invalid notification.
		require
			a_method_not_void: a_method /= Void
			a_notification_not_void: a_notification /= Void
			a_error_not_void: a_error /= Void
		do
			method := a_method
			notification := a_notification
			error := a_error
		ensure
			method_set: method = a_method
			notification_set: notification = a_notification
			error_set: error = a_error
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked

	notification: LS_OBJECT
			-- Invalid notification

	error: LS_STRING
			-- A string providing a short description of the invalidity

	handler (a_manager: LS_MESSAGE_MANAGER): LS_INVALID_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.invalid_notification_handler
		ensure then
			instance_free: class
		end

feature -- Field names

	notification_name: STRING_8 = "notification"
	error_name: STRING_8 = "error"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_invalid_notification (Current)
		end

invariant

	notification_not_void: notification /= Void
	error_not_void: error /= Void

end
