note

	description:

		"LSP unknown notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_UNKNOWN_NOTIFICATION

inherit

	LS_NOTIFICATION

create

	make

feature {NONE} -- Initialization

	make (a_method: like method; a_notification: like notification)
			-- Create a new unknown notification.
		require
			a_method_not_void: a_method /= Void
			a_notification_not_void: a_notification /= Void
		do
			method := a_method
			notification := a_notification
		ensure
			method_set: method = a_method
			notification_set: notification = a_notification
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked

	notification: LS_OBJECT
			-- Unknown notification

	handler (a_manager: LS_MESSAGE_MANAGER): LS_UNKNOWN_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.unknown_notification_handler
		end

feature -- Field names

	notification_name: STRING_8 = "notification"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_unknown_notification (Current)
		end

invariant

	notification_not_void: notification /= Void

end
