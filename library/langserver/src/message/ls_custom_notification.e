note

	description:

		"LSP custom notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CUSTOM_NOTIFICATION

inherit

	LS_NOTIFICATION

create

	make

feature {NONE} -- Initialization

	make (a_method: like method; a_params: like params)
			-- Create a new custom notification.
		require
			a_method_not_void: a_method /= Void
		do
			method := a_method
			params := a_params
		ensure
			method_set: method = a_method
			params_set: params = a_params

		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked

	params: detachable LS_ANY
			-- Notification parameters

	handler (a_manager: LS_MESSAGE_MANAGER): LS_CUSTOM_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.custom_notification_handler
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_custom_notification (Current)
		end

end
