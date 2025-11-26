note

	description:

		"LSP message managers"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_MESSAGE_MANAGER

inherit

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

feature {NONE} -- Initialization

	make (a_connection: like connection)
			-- Create a new message manager.
		require
			a_connection_not_void: a_connection /= Void
		do
			create messages.make
			if {PLATFORM}.is_thread_capable then
				create messages_mutex.make
			end
			create message_parser.make
			create jsonrpc_printer.make
			connection := a_connection
			a_connection.set_message_manager (Current)
		ensure
			connection_set: connection = a_connection
		end

feature -- Access

	messages: DS_LINKED_LIST [LS_MESSAGE]
			-- Messages to be handled

	connection: separate LS_CONNECTION
			-- Connection to receive and send messages

	application_info: detachable LS_APPLICATION_INFO
			-- Information about current application
			-- (application name, application version)
			--
			-- (To be redefined in clients and servers.)
		do
		end

feature -- Status report

	debug_mode: BOOLEAN
			-- Should debug information be written to stderr?

	trace_value: LS_TRACE_VALUE
			-- Trace level
		do
			Result := set_trace_notification_handler.trace_value
		end

	is_initializing: BOOLEAN
			-- Has the client/server communication being initialized?
		do
			Result := initialize_request_handler.is_initializing
		end

	is_initialized: BOOLEAN
			-- Has the client/server communication been initialized?
		do
			Result := initialized_notification_handler.is_initialized
		end

	is_shutdown: BOOLEAN
			-- Has the client/server communication been shutdown?
		do
			Result := shutdown_request_handler.is_shutdown
		end

feature -- Status setting

	set_debug_mode (b: BOOLEAN)
			-- Set `debug_mode` to `b`.
		do
			debug_mode := b
		ensure
			debug_mode_set: debug_mode = b
		end

feature -- Basic operations

	start
			-- Start message manager.
		do
			separate connection as l_connection do
				l_connection.start
				receive_messages
				handle_messages
				l_connection.keep_alive
			end
		end

	send_cancel_request_notification (a_id: LS_REQUEST_ID)
			-- Send notification '$/cancelRequest'
			-- to cancel the request with request id `a_id`.
		require
			a_id_not_void: a_id /= Void
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_notification: LS_CANCEL_REQUEST_NOTIFICATION
		do
			create l_notification.make (a_id)
			send_message (l_notification)
		end

	send_progress_notification (a_token: LS_PROGRESS_TOKEN; a_value: LS_ANY)
			-- Send notification '$/progress'.
			-- Progress is reported against the token `a_token`.
		require
			a_token_not_void: a_token /= Void
			a_value_not_void: a_value /= Void
			is_initialized: is_initialized
			not_is_shutdown: not is_shutdown
		local
			l_notification: LS_PROGRESS_NOTIFICATION
		do
			create l_notification.make (a_token, a_value)
			send_message (l_notification)
		end

feature -- Handlers

	definition_request_handler: LS_DEFINITION_REQUEST_HANDLER
			-- Handler for 'textDocument/definition' requests
		once ("OBJECT")
			create Result.make
		ensure
			definition_request_handler_not_void: Result /= Void
		end

	did_change_text_document_notification_handler: LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didChange' notifications
		once ("OBJECT")
			create Result.make
		ensure
			did_change_text_document_notification_handler_not_void: Result /= Void
		end

	did_change_watched_files_notification_handler: LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION_HANDLER
			-- Handler for 'workspace/didChangeWatchedFiles' notifications
		once ("OBJECT")
			create Result.make
		ensure
			did_change_watched_files_notification_handler_not_void: Result /= Void
		end

	did_close_text_document_notification_handler: LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didClose' notifications
		once ("OBJECT")
			create Result.make
		ensure
			did_close_text_document_notification_handler_not_void: Result /= Void
		end

	did_open_text_document_notification_handler: LS_DID_OPEN_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didOpen' notifications
		once ("OBJECT")
			create Result.make
		ensure
			did_open_text_document_notification_handler_not_void: Result /= Void
		end

	did_save_text_document_notification_handler: LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didSave' notifications
		once ("OBJECT")
			create Result.make
		ensure
			did_save_text_document_notification_handler_not_void: Result /= Void
		end

	document_symbol_request_handler: LS_DOCUMENT_SYMBOL_REQUEST_HANDLER
			-- Handler for 'textDocument/documentSymbol' requests
		once ("OBJECT")
			create Result.make
		ensure
			document_symbol_request_handler_not_void: Result /= Void
		end

	hover_request_handler: LS_HOVER_REQUEST_HANDLER
			-- Handler for 'textDocument/hover' requests
		once ("OBJECT")
			create Result.make
		ensure
			hover_request_handler_not_void: Result /= Void
		end

	log_trace_notification_handler: LS_LOG_TRACE_NOTIFICATION_HANDLER
			-- Handler for '$/logTrace' notifications
		once ("OBJECT")
			create Result.make
		ensure
			log_trace_notification_handler_not_void: Result /= Void
		end

	progress_notification_handler: LS_PROGRESS_NOTIFICATION_HANDLER
			-- Handler for '$/progress' notifications
		once ("OBJECT")
			create Result.make
		ensure
			progress_notification_handler_not_void: Result /= Void
		end

	will_save_text_document_notification_handler: LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/willSave' notifications
		once ("OBJECT")
			create Result.make
		ensure
			will_save_text_document_notification_handler_not_void: Result /= Void
		end

	will_save_wait_until_text_document_request_handler: LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_HANDLER
			-- Handler for 'textDocument/willSaveWaitUntil' requests
		once ("OBJECT")
			create Result.make
		ensure
			will_save_wait_until_text_document_request_handler_not_void: Result /= Void
		end

feature {LS_MESSAGE, LS_MESSAGE_FACTORY, LS_INITIALIZE_REQUEST_HANDLER} -- Handlers (protocol)

	cancel_request_notification_handler: LS_CANCEL_REQUEST_NOTIFICATION_HANDLER
			-- Handler for '$/cancelRequest' notifications
		once ("OBJECT")
			create Result.make
		ensure
			cancel_request_notification_handler_not_void: Result /= Void
		end

	exit_notification_handler: LS_EXIT_NOTIFICATION_HANDLER
			-- Handler for 'exit' notifications
		once ("OBJECT")
			create Result.make
		ensure
			exit_notification_handler_not_void: Result /= Void
		end

	initialize_request_handler: LS_INITIALIZE_REQUEST_HANDLER
			-- Handler for 'initialize' requests
		once ("OBJECT")
			create Result.make
		ensure
			initialize_request_handler_not_void: Result /= Void
		end

	initialized_notification_handler: LS_INITIALIZED_NOTIFICATION_HANDLER
			-- Handler for 'initialized' notifications
		once ("OBJECT")
			create Result.make
		ensure
			initialized_notification_handler_not_void: Result /= Void
		end

	register_capability_request_handler: LS_REGISTER_CAPABILITY_REQUEST_HANDLER
			-- Handler for 'client/registerCapability' requests
		once ("OBJECT")
			create Result.make
		ensure
			register_capability_request_handler_not_void: Result /= Void
		end

	response_handler: LS_RESPONSE_HANDLER
			-- Handler for responses
		once ("OBJECT")
			create Result.make
		ensure
			response_handler_not_void: Result /= Void
		end

	set_trace_notification_handler: LS_SET_TRACE_NOTIFICATION_HANDLER
			-- Handler for '$/setTrace' notifications
		once ("OBJECT")
			create Result.make
		ensure
			set_trace_notification_handler_not_void: Result /= Void
		end

	shutdown_request_handler: LS_SHUTDOWN_REQUEST_HANDLER
			-- Handler for 'shutdown' requests
		once ("OBJECT")
			create Result.make
		ensure
			shutdown_request_handler_not_void: Result /= Void
		end

	unregister_capability_request_handler: LS_UNREGISTER_CAPABILITY_REQUEST_HANDLER
			-- Handler for 'client/unregisterCapability' requests
		once ("OBJECT")
			create Result.make
		ensure
			unregister_capability_request_handler_not_void: Result /= Void
		end

feature {LS_MESSAGE} -- Handlers (implementation)

	handled_message_handler: LS_HANDLED_MESSAGE_HANDLER
			-- Handler for already handled messages
		once ("OBJECT")
			create Result.make
		ensure
			handled_message_handler_not_void: Result /= Void
		end

	invalid_notification_handler: LS_INVALID_NOTIFICATION_HANDLER
			-- Handler for invalid notifications
		once ("OBJECT")
			create Result.make
		ensure
			invalid_notification_handler_not_void: Result /= Void
		end

	unknown_notification_handler: LS_UNKNOWN_NOTIFICATION_HANDLER
			-- Handler for unknown notifications
		once ("OBJECT")
			create Result.make
		ensure
			unknown_notification_handler_not_void: Result /= Void
		end

feature {NONE} -- Basic operations

	handle_messages
			-- Handle messages in `messages`.
		local
			l_message: detachable LS_MESSAGE
		do
			from
				lock_messages_mutex
				if not messages.is_empty then
					l_message := messages.last
				end
				unlock_messages_mutex
			until
				l_message = Void
			loop
				l_message.handle (Current)
				lock_messages_mutex
				messages.remove_last
				receive_messages
				if not messages.is_empty then
					l_message := messages.last
				else
					l_message := Void
				end
				unlock_messages_mutex
			end
		end

	receive_messages
			-- Receive messages from `connection` and
			-- add them to `messages`.
		local
			i, nb: INTEGER
		do
			separate connection as l_connection do
				l_connection.receive_message
				l_connection.lock_messages_mutex
				nb := l_connection.messages.count
				from i := 1 until i > nb loop
					receive_message (l_connection.messages.item (i))
					i := i + 1
				end
				l_connection.messages.wipe_out
				l_connection.unlock_messages_mutex
			end
		end

	receive_message (a_message: separate STRING_8)
			-- Parse `a_message` and add it to `messages`.
		local
			l_message: LS_MESSAGE
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
			l_request_id: LS_RESPONSE_ID
			l_error_message: STRING_8
		do
			if debug_mode then
				std.error.put_string (generator + " received: " + create {STRING_8}.make_from_separate (a_message) + "%N%N")
				std.error.flush
			end
			message_parser.parse_utf8_string (a_message)
			if not attached message_parser.last_object as l_object then
				if attached message_parser.last_error as l_last_error then
					l_error_message := l_last_error
				else
					l_error_message := "parse error"
				end
				create l_error.make ({LS_ERROR_CODES}.parse_error, l_error_message)
				l_request_id := {LS_NULL}.null
				create l_response.make_error (l_request_id, l_error)
				create {LS_HANDLED_MESSAGE} l_message.make (l_response)
			elseif attached l_object.value ({LS_RESPONSE}.result_name) or attached l_object.value ({LS_RESPONSE}.error_name) then
				l_message := response_factory.new_message (l_object, Current)
			elseif not attached l_object.value ({LS_REQUEST}.method_name) as l_method_value then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "missing 'method'")
				l_request_id := request_id_or_null_from_object (l_object, {LS_REQUEST}.id_name)
				create l_response.make_error (l_request_id, l_error)
				create {LS_HANDLED_MESSAGE} l_message.make (l_response)
			elseif not attached {LS_STRING} l_method_value as l_method then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "invalid type for 'method'")
				l_request_id := request_id_or_null_from_object (l_object, {LS_REQUEST}.id_name)
				create l_response.make_error (l_request_id, l_error)
				create {LS_HANDLED_MESSAGE} l_message.make (l_response)
			elseif attached message_factories.value (l_method) as l_factory then
				l_message := l_factory.new_message (l_object, Current)
			elseif l_object.value ({LS_REQUEST}.id_name) = Void then
					-- Unknown notification.
				create {LS_UNKNOWN_NOTIFICATION} l_message.make (l_method, l_object)
			else
				create l_error.make ({LS_ERROR_CODES}.method_not_found, "method '" + l_method.utf8_value + "' not supported")
				l_request_id := request_id_or_null_from_object (l_object, {LS_REQUEST}.id_name)
				create l_response.make_error (l_request_id, l_error)
				create {LS_HANDLED_MESSAGE} l_message.make (l_response)
			end
			if attached {LS_CANCEL_REQUEST_NOTIFICATION} l_message as l_cancel_notification then
				cancel_request_notification_handler.handle (l_cancel_notification, Current)
			else
				lock_messages_mutex
				messages.put_first (l_message)
				unlock_messages_mutex
			end
		end

feature {LS_MESSAGE_HANDLER} -- Basic operations

	send_message (a_message: LS_MESSAGE)
			-- Send `a_message`.
		require
			a_message_not_void: a_message /= Void
		local
			l_utf8: STRING_8
			l_old_utf8: STRING_8
		do
			create l_utf8.make (500)
			l_old_utf8 := jsonrpc_printer.utf8_string
			jsonrpc_printer.set_utf8_string (l_utf8)
			a_message.process (jsonrpc_printer)
			jsonrpc_printer.set_utf8_string (l_old_utf8)
			separate connection as l_connection do
				l_connection.send_message (l_utf8)
			end
			if debug_mode then
				std.error.put_string (generator + " sent: " + l_utf8 + "%N%N")
				std.error.flush
			end
		end

	send_request (a_request: LS_REQUEST)
			-- Send `a_request`.
		require
			a_request_not_void: a_request /= Void
		do
			response_handler.pending_requests.force (a_request, a_request.id)
			send_message (a_request)
		end

feature {LS_CONNECTION} -- Actions

	on_message_received
			-- Action executed when messages when `connection` receives messages.
		local
			l_was_empty: BOOLEAN
		do
			if {PLATFORM}.is_thread_capable then
				lock_messages_mutex
				l_was_empty := messages.is_empty
				unlock_messages_mutex
			end
			receive_messages
			if l_was_empty or {PLATFORM}.is_scoop_capable then
				handle_messages
			end
		end

feature {LS_RESPONSE_HANDLER, LS_REQUEST_HANDLER} -- Implementation

	message_factories: DS_HASH_TABLE [LS_MESSAGE_FACTORY, LS_STRING]
			-- Message factories, indexed by methods
		once ("OBJECT")
			create Result.make (100)
			Result.force (create {LS_CANCEL_REQUEST_NOTIFICATION_FACTORY}.make, {LS_CANCEL_REQUEST_NOTIFICATION}.method)
			Result.force (create {LS_DEFINITION_REQUEST_FACTORY}.make, {LS_DEFINITION_REQUEST}.method)
			Result.force (create {LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION_FACTORY}.make, {LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION}.method)
			Result.force (create {LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION_FACTORY}.make, {LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION}.method)
			Result.force (create {LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_FACTORY}.make, {LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION}.method)
			Result.force (create {LS_DID_OPEN_TEXT_DOCUMENT_NOTIFICATION_FACTORY}.make, {LS_DID_OPEN_TEXT_DOCUMENT_NOTIFICATION}.method)
			Result.force (create {LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION_FACTORY}.make, {LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION}.method)
			Result.force (create {LS_DOCUMENT_SYMBOL_REQUEST_FACTORY}.make, {LS_DOCUMENT_SYMBOL_REQUEST}.method)
			Result.force (create {LS_EXIT_NOTIFICATION_FACTORY}.make, {LS_EXIT_NOTIFICATION}.method)
			Result.force (create {LS_HOVER_REQUEST_FACTORY}.make, {LS_HOVER_REQUEST}.method)
			Result.force (create {LS_INITIALIZE_REQUEST_FACTORY}.make, {LS_INITIALIZE_REQUEST}.method)
			Result.force (create {LS_INITIALIZED_NOTIFICATION_FACTORY}.make, {LS_INITIALIZED_NOTIFICATION}.method)
			Result.force (create {LS_LOG_TRACE_NOTIFICATION_FACTORY}.make, {LS_LOG_TRACE_NOTIFICATION}.method)
			Result.force (create {LS_PROGRESS_NOTIFICATION_FACTORY}.make, {LS_PROGRESS_NOTIFICATION}.method)
			Result.force (create {LS_REGISTER_CAPABILITY_REQUEST_FACTORY}.make, {LS_REGISTER_CAPABILITY_REQUEST}.method)
			Result.force (create {LS_SET_TRACE_NOTIFICATION_FACTORY}.make, {LS_SET_TRACE_NOTIFICATION}.method)
			Result.force (create {LS_SHUTDOWN_REQUEST_FACTORY}.make, {LS_SHUTDOWN_REQUEST}.method)
			Result.force (create {LS_UNREGISTER_CAPABILITY_REQUEST_FACTORY}.make, {LS_UNREGISTER_CAPABILITY_REQUEST}.method)
			Result.force (create {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_FACTORY}.make, {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.method)
			Result.force (create {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_FACTORY}.make, {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.method)
		ensure
			message_factories_not_void: Result /= Void
			no_void_message_factory: not Result.has_void
		end

feature {NONE} -- Implementation

	response_factory: LS_MESSAGE_FACTORY
			-- Response factory
		once ("OBJECT")
			create {LS_RESPONSE_FACTORY} Result.make
		ensure
			response_factory_not_void: Result /= Void
		end

	message_parser: LS_MESSAGE_PARSER
			-- Message parser

	jsonrpc_printer: LS_JSONRPC_PRINTER
			-- JSON-RPC printer

	request_id_or_null_from_object (a_object: LS_OBJECT; a_field_name: STRING_8): LS_RESPONSE_ID
			-- Request id stored in field `a_field_name` of `a_object`.
			-- Or 'null' value if not found or invalid.
		require
			a_object_not_void: a_object /= Void
			a_field_name_not_void: a_field_name /= Void
		do
			Result := {LS_NULL}.null
			if attached {LS_REQUEST_ID} a_object.value (a_field_name) as l_id then
				Result := l_id
			elseif attached {LS_NUMBER} a_object.value (a_field_name) as l_number and then l_number.is_integer then
				Result := l_number.to_integer
			end
		ensure
			request_id_or_null_from_object_not_void: Result /= Void
		end

	request_id_counter: NATURAL_64
			-- Last request id used when sending a request

feature {LS_CANCEL_REQUEST_NOTIFICATION_HANDLER} -- Multithreading

	messages_mutex: detachable MUTEX
			-- Lock to access `messages` in multithreaded mode

	lock_messages_mutex
			-- Get exclusing access to `messages`.
		do
			if attached messages_mutex as l_mutex then
				l_mutex.lock
			end
		end

	unlock_messages_mutex
			-- Rlease exclusing access to `messages`.
		do
			if attached messages_mutex as l_mutex then
				l_mutex.unlock
			end
		end

invariant

	messages_not_void: messages /= Void
	no_void_message: not messages.has_void
	connection_not_void: connection /= Void
	message_parser_not_void: message_parser /= Void
	jsonrpc_printer_not_void: jsonrpc_printer /= Void

end
