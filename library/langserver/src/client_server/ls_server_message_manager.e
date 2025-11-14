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
			did_change_watched_files_notification_handler,
			exit_notification_handler,
			initialize_request_handler,
			initialized_notification_handler,
			register_capability_request_handler,
			set_trace_notification_handler,
			shutdown_request_handler
		end

create

	make

feature -- Access

	connection: separate LS_SERVER_CONNECTION
			-- Connection to receive and send messages

	workspace_folders: detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			-- Workspace folders configured in the client

feature -- Sending notifications/requests

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
			send_request (l_request)
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
			send_request (l_request)
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

feature -- Handling 'workspace/didChangeWatchedFiles' notifications

	on_did_change_watched_files_notification (a_notification: LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION)
			-- Handle 'workspace/didChangeWatchedFiles' notification `a_notification`.
			-- Actions to be executed when watched files are changed.
			--
			-- (To be redefined in servers.)
		require
			a_notification_not_void: a_notification /= Void
		do
		end

	on_file_system_watchers_registered (a_watchers: LS_FILE_SYSTEM_WATCHER_LIST; a_registration: LS_REGISTRATION; a_response: LS_RESPONSE)
			-- Action to be executed when the client registered file system watchers.
			--
			-- (To be redefined in servers.)
		require
			a_watchers_not_void: a_watchers /= Void
			a_registration_not_void: a_registration /= Void
			a_response_not_void: a_response /= Void
		do
		end

	register_file_system_watchers (a_watchers: ARRAY [TUPLE [pattern: STRING_8; kind: detachable LS_WATCH_KIND]])
			-- Register watchers for file system change events.
		require
			a_watchers_not_void: a_watchers /= Void
			no_void_watcher: across a_watchers as l_watcher all l_watcher /= Void and then l_watcher.pattern /= Void end
			dynamic_registration_supported: did_change_watched_files_notification_handler.is_dynamic_registration_supported
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_registrations: LS_REGISTRATION_LIST
			l_registration: LS_REGISTRATION
			l_watcher_tuple: TUPLE [pattern: STRING_8; kind: detachable LS_WATCH_KIND]
			l_pattern: LS_STRING
			l_file_system_watcher: LS_FILE_SYSTEM_WATCHER
			l_file_system_watchers: LS_FILE_SYSTEM_WATCHER_LIST
			i, nb: INTEGER
			l_registration_options: LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS
		do
			i := a_watchers.lower
			nb := a_watchers.upper
			create l_file_system_watchers.make_with_capacity (nb - i + 1)
			from until i > nb loop
				l_watcher_tuple := a_watchers.item (i)
				l_pattern := l_watcher_tuple.pattern
				create l_file_system_watcher.make (l_pattern, l_watcher_tuple.kind)
				l_file_system_watchers.put_last (l_file_system_watcher)
				i := i + 1
			end
			create l_registration_options.make (l_file_system_watchers)
			create l_registration.make ("xxx", {LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION}.method, l_registration_options)
			create l_registrations.make_with_capacity (1)
			l_registrations.put_last (l_registration)
			send_register_capability_request (l_registrations)
		end

feature -- Handling 'exit' notifications

	on_exit_notification (a_notification: LS_EXIT_NOTIFICATION)
			-- Handle 'exit' notification `a_notification`.
			-- Actions to be executed before exiting.
			--
			-- (To be redefined in servers.)
		require
			a_notification_not_void: a_notification /= Void
		do
		end

feature -- Handling hover requests

	on_hover_request (a_request: LS_HOVER_REQUEST; a_response: LS_HOVER_RESPONSE)
			-- Handle 'textDocument/hover' request `a_request`.
			-- Build `a_response` accordingly.
			--
			-- (To be redefined in servers.
			-- Redefine `hover_request_handler` accordingly as per the precondition.)
		require
			a_request_not_void: a_request /= Void
			a_response_not_void: a_response /= Void
			hover_request_supported: hover_request_handler.conforms_to ({detachable LS_SERVER_HOVER_REQUEST_HANDLER})
		do
		end

feature -- Handling 'initialized' notifications

	on_initialized_notification (a_notification: LS_INITIALIZED_NOTIFICATION)
			-- Handle 'initialized' notification `a_notification`.
			-- Actions to be executed after initialization.
			--
			-- (To be redefined in servers.)
		require
			a_notification_not_void: a_notification /= Void
		do
		end

feature -- Handling shutdown requests

	on_shutdown_request (a_request: LS_SHUTDOWN_REQUEST)
			-- Handle 'shutdown' request `a_request`.
			-- Actions to be executed when client want to
			-- shutdown the server.
			--
			-- (To be redefined in servers.)
		require
			a_request_not_void: a_request /= Void
		do
		end

feature -- Handlers

	did_change_watched_files_notification_handler: LS_SERVER_DID_CHANGE_WATCHED_FILES_NOTIFICATION_HANDLER
			-- Handler for 'workspace/didChangeWatchedFiles' requests
		once ("OBJECT")
			create Result.make
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

	register_capability_request_handler: LS_SERVER_REGISTER_CAPABILITY_REQUEST_HANDLER
			-- Handler for 'client/registerCapability' requests
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

feature {LS_SERVER_INITIALIZE_REQUEST_HANDLER} -- Setting

	set_workspace_folders (a_workspace_folders: like workspace_folders)
			-- Set `workspace_folders` to `a_workspace_folders`.
		do
			workspace_folders := a_workspace_folders
		ensure
			workspace_folders_set: workspace_folders = a_workspace_folders
		end

end
