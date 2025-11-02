note

	description:

		"LSP message managers on the server side"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_MESSAGE_MANAGER

inherit

	LS_MESSAGE_MANAGER
		redefine
			connection,
			exit_notification_handler,
			initialize_request_handler,
			initialized_notification_handler,
			set_trace_notification_handler,
			shutdown_request_handler
		end

create

	make

feature -- Access

	connection: separate LS_SERVER_CONNECTION
			-- Connection to receive and send messages

feature -- Basic operations

	send_register_capability_request (a_registrations: LS_REGISTRATION_LIST)
			-- Send 'client/registerCapability' request to the client.
		require
			a_registrations_not_void: a_registrations /= Void
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_request: LS_REGISTER_CAPABILITY_REQUEST
			l_id: LS_STRING
		do
			request_id_counter := request_id_counter + 1
			l_id := request_id_counter.out
			create l_request.make (l_id, a_registrations)
			send_message (l_request)
		end

	send_unregister_capability_request (a_unregistrations: LS_UNREGISTRATION_LIST)
			-- Send 'client/unregisterCapability' request to the client.
		require
			a_unregistrations_not_void: a_unregistrations /= Void
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_request: LS_UNREGISTER_CAPABILITY_REQUEST
			l_id: LS_STRING
		do
			request_id_counter := request_id_counter + 1
			l_id := request_id_counter.out
			create l_request.make (l_id, a_unregistrations)
			send_message (l_request)
		end

	send_log_trace_message_notification (a_message: LS_STRING)
			-- Send '$/logTrace' notification to the client.
		require
			a_message_not_void: a_message /= Void
			trace_mode: trace_value ~ {LS_TRACE_VALUES}.message or trace_value ~ {LS_TRACE_VALUES}.verbose
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_notification: LS_LOG_TRACE_NOTIFICATION
		do
			create l_notification.make (a_message)
			send_message (l_notification)
		end

	send_log_trace_verbose_notification (a_message: LS_STRING; a_verbose: detachable LS_STRING)
			-- Send '$/logTrace' notification to the client.
		require
			a_message_not_void: a_message /= Void
			trace_mode: trace_value ~ {LS_TRACE_VALUES}.message or trace_value ~ {LS_TRACE_VALUES}.verbose
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_notification: LS_LOG_TRACE_NOTIFICATION
		do
			create l_notification.make_verbose (a_message, a_verbose)
			send_message (l_notification)
		end

feature {LS_MESSAGE, LS_MESSAGE_FACTORY, LS_INITIALIZE_REQUEST_HANDLER} -- Handlers (protocol)

	exit_notification_handler: LS_SERVER_EXIT_NOTIFICATION_HANDLER
			-- Handler for 'exit' notifications
		once ("OBJECT")
			create Result.make
		end

	initialize_request_handler: LS_SERVER_INITIALIZE_REQUEST_HANDLER
			-- Handler for 'initialize' requests
		once ("OBJECT")
			create Result.make
		end

	initialized_notification_handler: LS_SERVER_INITIALIZED_NOTIFICATION_HANDLER
			-- Handler for 'initialized' notifications
		once ("OBJECT")
			create Result.make
		end

	set_trace_notification_handler: LS_SERVER_SET_TRACE_NOTIFICATION_HANDLER
			-- Handler for '$/setTrace' notifications
		once ("OBJECT")
			create Result.make
		end

	shutdown_request_handler: LS_SERVER_SHUTDOWN_REQUEST_HANDLER
			-- Handler for 'shutdown' requests
		once ("OBJECT")
			create Result.make
		end

end
