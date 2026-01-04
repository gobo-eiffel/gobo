note

	description:

		"LSP message managers on the client side"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class LS_CLIENT_MESSAGE_MANAGER

inherit

	LS_MESSAGE_MANAGER
		redefine
			connection,
			initialize_request_handler,
			register_capability_request_handler,
			shutdown_request_handler,
			unregister_capability_request_handler
		end

create

	make

feature -- Access

	connection: separate LS_CLIENT_CONNECTION
			-- Connection to receive and send messages

	process_id: LS_OPTIONAL_INTEGER
			-- Process id of client
			--
			-- (To be redefined in clients.)
		do
			Result := {LS_NULL}.null
		ensure
			process_id_not_void: Result /= Void
		end

	locale: detachable LS_STRING
			-- The locale the client is currently showing the user interface
			-- in. This must not necessarily be the locale of the operating
			-- system.

			-- Uses IETF language tags as the value's syntax
			-- (See https://en.wikipedia.org/wiki/IETF_language_tag)
			--
			-- (To be redefined in clients.)
		do
		end

	root_path: detachable LS_OPTIONAL_STRING
			-- The rootPath of the workspace. Is 'null'
			-- if no folder is open.
			--
			-- @deprecated in favour of `rootUri`.
		local
			l_uri: UT_URI
			l_string: LS_STRING
		do
			Result := {LS_NULL}.null
			if attached {LS_DOCUMENT_URI} root_uri as l_root_uri then
				create l_uri.make (l_root_uri.to_string.utf8_value)
				if attached {UT_FILE_URI_ROUTINES}.uri_to_filename (l_uri) as l_root_path then
					l_string := l_root_path
					Result := l_string
				end
			else
				Result := {LS_NULL}.null
			end
		end

	root_uri: LS_OPTIONAL_DOCUMENT_URI
			-- The rootUri of the workspace. Is 'null' if no
			-- folder is open. If both `rootPath` and `rootUri` are set
			-- `rootUri` wins.
			--
			-- @deprecated in favour of `workspaceFolders`
		do
			if attached {LS_WORKSPACE_FOLDER_LIST} workspace_folders as l_workspace_folders and then l_workspace_folders.count > 0 then
				Result := l_workspace_folders.value (1).uri.to_string
			else
				Result := {LS_NULL}.null
			end
		end

	workspace_folders: detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			-- The workspace folders configured in the client.
			-- This property is only available if the client supports workspace folders.
			-- It can be 'null' if the client supports workspace folders but none are
			-- configured.
			--
			-- (To be redefined in clients.)
		do
			Result := {LS_NULL}.null
		end

	initialization_options: detachable LS_ANY
			-- User provided initialization options.
			--
			-- (To be redefined in clients.)
		do
		end

	initialization_work_done_token: detachable LS_PROGRESS_TOKEN
			-- Work done progress token to be used
			-- during intialization, if any
			--
			-- (To be redefined in clients.)
		do
		end

feature -- Basic operations

	send_initialize_request
			-- Send 'initialize' request to the server.
		require
			not_initializing: not is_initializing
			not_initialized: not is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_request: LS_INITIALIZE_REQUEST
			l_id: LS_STRING
		do
			request_id_counter := request_id_counter + 1
			l_id := request_id_counter.out
			create l_request.make (l_id, process_id, application_info, locale,
				root_path, root_uri, workspace_folders, client_capabilities,
				trace_value, initialization_options, initialization_work_done_token)
			send_request (l_request)
			initialize_request_handler.set_initializing (True)
		ensure
			is_initializing: is_initializing
		end

	send_initialized_notification
			-- Send 'initialized' notification to the server.
		require
			initializing: is_initializing
			not_initialized: not is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_notification: LS_INITIALIZED_NOTIFICATION
		do
			create l_notification.make
			send_message (l_notification)
			initialize_request_handler.set_initializing (False)
			initialized_notification_handler.set_initialized (True)
		ensure
			not_initializing: not is_initializing
			is_initialized: is_initialized
		end

	send_exit_notification
			-- Send 'exit' notification to the server.
		local
			l_notification: LS_EXIT_NOTIFICATION
		do
			create l_notification.make
			send_message (l_notification)
		end

	send_set_trace_message_notification
			-- Send '$/setTrace' 'message' notification to the server.
		require
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		do
			send_set_trace_notification ({LS_TRACE_VALUES}.message)
		ensure
			trace_value_set: trace_value ~ {LS_TRACE_VALUES}.message
		end

	send_set_trace_off_notification
			-- Send '$/setTrace' 'off' notification to the server.
		require
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		do
			send_set_trace_notification ({LS_TRACE_VALUES}.off)
		ensure
			trace_value_set: trace_value ~ {LS_TRACE_VALUES}.off
		end

	send_set_trace_verbose_notification
			-- Send '$/setTrace' 'verbose' notification to the server.
		require
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		do
			send_set_trace_notification ({LS_TRACE_VALUES}.verbose)
		ensure
			trace_value_set: trace_value ~ {LS_TRACE_VALUES}.verbose
		end

	send_shutdown_request
			-- Send 'shutdown' request to the server.
		require
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_request: LS_SHUTDOWN_REQUEST
			l_id: LS_STRING
		do
			request_id_counter := request_id_counter + 1
			l_id := request_id_counter.out
			create l_request.make (l_id)
			send_request (l_request)
		end

feature {NONE} -- Basic operations

	send_set_trace_notification (a_value: LS_TRACE_VALUE)
			-- Send '$/setTrace' notification to the server.
		require
			a_value_not_void: a_value /= Void
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_notification: LS_SET_TRACE_NOTIFICATION
		do
			set_trace_notification_handler.set_trace_value (a_value)
			create l_notification.make (a_value)
			send_message (l_notification)
		ensure
			trace_value_set: trace_value ~ a_value
		end

feature {LS_MESSAGE, LS_MESSAGE_FACTORY} -- Handlers (protocol)

	initialize_request_handler: LS_CLIENT_INITIALIZE_REQUEST_HANDLER
			-- Handler for 'initialize' requests
		once ("OBJECT")
			create Result.make
		end

	register_capability_request_handler: LS_CLIENT_REGISTER_CAPABILITY_REQUEST_HANDLER
			-- Handler for 'client/registerCapability' requests
		once ("OBJECT")
			create Result.make
		end

	shutdown_request_handler: LS_CLIENT_SHUTDOWN_REQUEST_HANDLER
			-- Handler for 'shutdown' requests
		once ("OBJECT")
			create Result.make
		end

	unregister_capability_request_handler: LS_CLIENT_UNREGISTER_CAPABILITY_REQUEST_HANDLER
			-- Handler for 'client/unregisterCapability' requests
		once ("OBJECT")
			create Result.make
		end

feature {NONE} -- Implementation

	client_capabilities: LS_CLIENT_ALL_CAPABILITIES
			-- Capabilities provided by the client (editor or tool)
		local
			l_text_document_capabilities: detachable LS_TEXT_DOCUMENT_CAPABILITIES
			l_workspace_capabilities: detachable LS_WORKSPACE_CAPABILITIES
			l_dynamic_registration: detachable LS_BOOLEAN
			l_will_save: detachable LS_BOOLEAN
			l_will_save_wait_until: detachable LS_BOOLEAN
			l_did_save: detachable LS_BOOLEAN
			l_text_document_sync_capabilities: detachable LS_TEXT_DOCUMENT_SYNC_CAPABILITIES
		do
			create Result.make
			did_open_text_document_notification_handler.build_client_capabilities
			did_close_text_document_notification_handler.build_client_capabilities
			did_change_text_document_notification_handler.build_client_capabilities
			will_save_text_document_notification_handler.build_client_capabilities
			will_save_wait_until_text_document_request_handler.build_client_capabilities
			did_save_text_document_notification_handler.build_client_capabilities
			if attached did_open_text_document_notification_handler.client_capabilities as l_capabilities then
				if attached l_capabilities.dynamic_registration as l_dynamic and then l_dynamic then
					l_dynamic_registration := l_dynamic
				end
			end
			if attached did_close_text_document_notification_handler.client_capabilities as l_capabilities then
				if attached l_capabilities.dynamic_registration as l_dynamic and then l_dynamic then
					l_dynamic_registration := l_dynamic
				end
			end
			if attached did_change_text_document_notification_handler.client_capabilities as l_capabilities then
				if attached l_capabilities.dynamic_registration as l_dynamic and then l_dynamic then
					l_dynamic_registration := l_dynamic
				end
			end
			if attached will_save_text_document_notification_handler.client_capabilities as l_capabilities then
				if attached l_capabilities.dynamic_registration as l_dynamic and then l_dynamic then
					l_dynamic_registration := l_dynamic
				end
				l_will_save := l_capabilities.will_save
			end
			if attached will_save_wait_until_text_document_request_handler.client_capabilities as l_capabilities then
				if attached l_capabilities.dynamic_registration as l_dynamic and then l_dynamic then
					l_dynamic_registration := l_dynamic
				end
				l_will_save_wait_until := l_capabilities.will_save_wait_until
			end
			if attached did_save_text_document_notification_handler.client_capabilities as l_capabilities then
				if attached l_capabilities.dynamic_registration as l_dynamic and then l_dynamic then
					l_dynamic_registration := l_dynamic
				end
				l_did_save := l_capabilities.did_save
			end
			if l_dynamic_registration /= Void or l_will_save /= Void or l_will_save_wait_until /= Void or l_did_save /= Void then
				create l_text_document_sync_capabilities.make (l_dynamic_registration, l_will_save, l_will_save_wait_until, l_did_save)
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_synchronization (l_text_document_sync_capabilities)
			end
			completion_request_handler.build_client_capabilities
			if attached completion_request_handler.client_capabilities as l_completion_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_completion (l_completion_capabilities)
			end
			hover_request_handler.build_client_capabilities
			if attached hover_request_handler.client_capabilities as l_hover_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_hover (l_hover_capabilities)
			end
			declaration_request_handler.build_client_capabilities
			if attached declaration_request_handler.client_capabilities as l_declaration_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_declaration (l_declaration_capabilities)
			end
			definition_request_handler.build_client_capabilities
			if attached definition_request_handler.client_capabilities as l_definition_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_definition (l_definition_capabilities)
			end
			type_definition_request_handler.build_client_capabilities
			if attached type_definition_request_handler.client_capabilities as l_type_definition_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_type_definition (l_type_definition_capabilities)
			end
			implementation_request_handler.build_client_capabilities
			if attached implementation_request_handler.client_capabilities as l_implementation_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_implementation (l_implementation_capabilities)
			end
			document_symbol_request_handler.build_client_capabilities
			if attached document_symbol_request_handler.client_capabilities as l_document_symbol_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_document_symbol (l_document_symbol_capabilities)
			end
			publish_diagnostics_notification_handler.build_client_capabilities
			if attached publish_diagnostics_notification_handler.client_capabilities as l_publish_diagnostics_capabilities then
				if l_text_document_capabilities = Void then
					create l_text_document_capabilities.make
					Result.set_text_document (l_text_document_capabilities)
				end
				l_text_document_capabilities.set_publish_diagnostics (l_publish_diagnostics_capabilities)
			end
			did_change_configuration_notification_handler.build_client_capabilities
			if attached did_change_configuration_notification_handler.client_capabilities as l_did_change_configuration_capabilities then
				if l_workspace_capabilities = Void then
					create l_workspace_capabilities.make
					Result.set_workspace (l_workspace_capabilities)
				end
				l_workspace_capabilities.set_did_change_configuration (l_did_change_configuration_capabilities)
			end
			did_change_watched_files_notification_handler.build_client_capabilities
			if attached did_change_watched_files_notification_handler.client_capabilities as l_did_change_watched_files_capabilities then
				if l_workspace_capabilities = Void then
					create l_workspace_capabilities.make
					Result.set_workspace (l_workspace_capabilities)
				end
				l_workspace_capabilities.set_did_change_watched_files (l_did_change_watched_files_capabilities)
			end
			workspace_symbol_request_handler.build_client_capabilities
			if attached workspace_symbol_request_handler.client_capabilities as l_workspace_symbol_capabilities then
				if l_workspace_capabilities = Void then
					create l_workspace_capabilities.make
					Result.set_workspace (l_workspace_capabilities)
				end
				l_workspace_capabilities.set_symbol (l_workspace_symbol_capabilities)
			end
			configuration_request_handler.build_client_capabilities
			if attached configuration_request_handler.client_capabilities as l_configuration_capabilities then
				if l_workspace_capabilities = Void then
					create l_workspace_capabilities.make
					Result.set_workspace (l_workspace_capabilities)
				end
				l_workspace_capabilities.set_configuration (l_configuration_capabilities)
			end
		ensure
			client_capabilities_not_void: Result /= Void
		end

end
