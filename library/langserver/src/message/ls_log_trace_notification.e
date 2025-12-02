note

	description:
	"[
		LSP '$/logTrace' notifications.

		Notifications to log the trace of the server's execution.
		The amount and content of these notifications depends on
		the current trace configuration. If trace is 'off', the
		server should not send any 'logTrace' notification. If trace
		is 'messages', the server should not add the 'verbose' field
		in the 'LogTraceParams'.

		'$/logTrace' should be used for systematic trace reporting.
		For single debugging messages, the server should send 
		'window/logMessage' notifications.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOG_TRACE_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_LOG_TRACE_PARAMS

create

	make,
	make_verbose

feature {NONE} -- Initialization

	make (a_message: like message)
			-- Create a new '$/logTrace' notification.
		require
			a_message_not_void: a_message /= Void
		do
			message := a_message
		ensure
			message_set: message = a_message
		end

	make_verbose (a_message: like message; a_verbose: like verbose)
			-- Create a new '$/logTrace' notification.
		require
			a_message_not_void: a_message /= Void
		do
			message := a_message
			verbose := a_verbose
		ensure
			message_set: message = a_message
			verbose_set: verbose = a_verbose
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "$/logTrace"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_LOG_TRACE_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.log_trace_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_log_trace_notification (Current)
		end

end
