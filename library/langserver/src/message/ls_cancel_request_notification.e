note

	description:

		"LSP '$/cancelRequest' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CANCEL_REQUEST_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_CANCEL_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id)
			-- Create a new '$/cancelRequest' notification.
		require
			a_id_not_void: a_id /= Void
		do
			id := a_id
		ensure
			id_set: id = a_id
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "$/cancelRequest"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_CANCEL_REQUEST_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.cancel_request_notification_handler
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_cancel_request_notification (Current)
		end

end
