note

	description:

		"LSP server handlers for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SERVER_INITIALIZE_REQUEST_HANDLER

inherit

	LS_INITIALIZE_REQUEST_HANDLER
		redefine
			message_manager,
			internal_handle,
			handle
		end

create

	make

feature -- Basic operations

	handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
		local
			l_response: LS_RESPONSE
			l_result: LS_INITIALIZE_RESULT
			l_server_capabilities: LS_SERVER_CAPABILITIES
			l_workspace_folders: detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			l_workspace_folder: LS_WORKSPACE_FOLDER
			l_workspace_folder_list: LS_WORKSPACE_FOLDER_LIST
			l_uri: LS_STRING
			l_text_document_sync_options: LS_TEXT_DOCUMENT_SYNC_OPTIONS
			l_open_close: detachable LS_BOOLEAN
			l_change: detachable LS_TEXT_DOCUMENT_SYNC_KIND
			l_save: detachable LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			l_will_save: detachable LS_BOOLEAN
			l_will_save_wait_until: detachable LS_BOOLEAN
		do
			if attached a_request.trace as l_trace then
				a_manager.set_trace_notification_handler.set_trace_value (l_trace)
			end
			l_workspace_folders := a_request.workspace_folders
			if not attached {LS_WORKSPACE_FOLDER_LIST} l_workspace_folders as l_list or else l_list.count = 0 then
				if attached {LS_DOCUMENT_URI} a_request.root_uri as l_root_uri then
					create l_workspace_folder.make (l_root_uri, "workspace1")
					create l_workspace_folder_list.make_with_capacity (1)
					l_workspace_folder_list.put_last (l_workspace_folder)
					l_workspace_folders := l_workspace_folder_list
				elseif attached {LS_STRING} a_request.root_path as l_root_path then
					l_uri := {UT_FILE_URI_ROUTINES}.filename_to_uri (l_root_path.utf8_value).full_reference
					create l_workspace_folder.make (l_uri, "workspace1")
					create l_workspace_folder_list.make_with_capacity (1)
					l_workspace_folder_list.put_last (l_workspace_folder)
					l_workspace_folders := l_workspace_folder_list
				end
			end
			a_manager.set_workspace_folders (l_workspace_folders)
			if attached a_request.capabilities.text_document as l_text_document_capabilities then
				a_manager.did_open_text_document_notification_handler.set_client_capabilities (l_text_document_capabilities.synchronization)
				a_manager.did_close_text_document_notification_handler.set_client_capabilities (l_text_document_capabilities.synchronization)
				a_manager.did_change_text_document_notification_handler.set_client_capabilities (l_text_document_capabilities.synchronization)
				a_manager.did_save_text_document_notification_handler.set_client_capabilities (l_text_document_capabilities.synchronization)
				a_manager.will_save_text_document_notification_handler.set_client_capabilities (l_text_document_capabilities.synchronization)
				a_manager.will_save_wait_until_text_document_request_handler.set_client_capabilities (l_text_document_capabilities.synchronization)
				a_manager.completion_request_handler.set_client_capabilities (l_text_document_capabilities.completion)
				a_manager.hover_request_handler.set_client_capabilities (l_text_document_capabilities.hover)
				a_manager.declaration_request_handler.set_client_capabilities (l_text_document_capabilities.declaration)
				a_manager.definition_request_handler.set_client_capabilities (l_text_document_capabilities.definition)
				a_manager.type_definition_request_handler.set_client_capabilities (l_text_document_capabilities.type_definition)
				a_manager.implementation_request_handler.set_client_capabilities (l_text_document_capabilities.implementation)
				a_manager.document_symbol_request_handler.set_client_capabilities (l_text_document_capabilities.document_symbol)
				a_manager.publish_diagnostics_notification_handler.set_client_capabilities (l_text_document_capabilities.publish_diagnostics)
			end
			if attached a_request.capabilities.workspace as l_workspace_capabilities then
				a_manager.did_change_watched_files_notification_handler.set_client_capabilities (l_workspace_capabilities.did_change_watched_files)
				a_manager.workspace_symbol_request_handler.set_client_capabilities (l_workspace_capabilities.symbol)
				a_manager.configuration_request_handler.set_client_capabilities (l_workspace_capabilities.configuration)
			end
			create l_server_capabilities.make
			a_manager.did_open_text_document_notification_handler.build_server_options
			a_manager.did_close_text_document_notification_handler.build_server_options
			a_manager.did_change_text_document_notification_handler.build_server_options
			a_manager.will_save_text_document_notification_handler.build_server_options
			a_manager.will_save_wait_until_text_document_request_handler.build_server_options
			a_manager.did_save_text_document_notification_handler.build_server_options
			if attached a_manager.did_open_text_document_notification_handler.server_options as l_server_options and then l_server_options.open then
				l_open_close := l_server_options.open
			elseif attached a_manager.did_close_text_document_notification_handler.server_options as l_server_options and then l_server_options.close then
				l_open_close := l_server_options.close
			end
			if attached a_manager.did_change_text_document_notification_handler.server_options as l_server_options then
				l_change := l_server_options.change
			end
			if attached a_manager.will_save_text_document_notification_handler.server_options as l_server_options then
				l_will_save := l_server_options.will_save
			end
			if attached a_manager.will_save_wait_until_text_document_request_handler.server_options as l_server_options then
				l_will_save_wait_until := l_server_options.will_save_wait_until
			end
			if attached a_manager.did_save_text_document_notification_handler.server_options as l_server_options then
				l_save := l_server_options.save
			end
			if l_open_close /= Void or l_change /= Void or l_will_save /= Void or l_will_save_wait_until /= Void or l_save /= Void then
				create l_text_document_sync_options.make (l_open_close, l_change, l_will_save, l_will_save_wait_until, l_save)
				l_server_capabilities.set_text_document_sync (l_text_document_sync_options)
			end
			a_manager.completion_request_handler.build_server_options
			a_manager.completion_item_resolve_request_handler.build_server_options
			if attached a_manager.completion_request_handler.server_options as l_completion_options then
				l_completion_options.set_resolve_provider (a_manager.completion_item_resolve_request_handler.server_options)
			end
			l_server_capabilities.set_completion_provider (a_manager.completion_request_handler.server_options)
			a_manager.hover_request_handler.build_server_options
			l_server_capabilities.set_hover_provider (a_manager.hover_request_handler.server_options)
			a_manager.declaration_request_handler.build_server_options
			l_server_capabilities.set_declaration_provider (a_manager.declaration_request_handler.server_options)
			a_manager.definition_request_handler.build_server_options
			l_server_capabilities.set_definition_provider (a_manager.definition_request_handler.server_options)
			a_manager.type_definition_request_handler.build_server_options
			l_server_capabilities.set_type_definition_provider (a_manager.type_definition_request_handler.server_options)
			a_manager.implementation_request_handler.build_server_options
			l_server_capabilities.set_implementation_provider (a_manager.implementation_request_handler.server_options)
			a_manager.document_symbol_request_handler.build_server_options
			l_server_capabilities.set_document_symbol_provider (a_manager.document_symbol_request_handler.server_options)
			a_manager.workspace_symbol_request_handler.build_server_options
			a_manager.workspace_symbol_resolve_request_handler.build_server_options
			if attached {LS_WORKSPACE_SYMBOL_OPTIONS} a_manager.workspace_symbol_request_handler.server_options as l_workspace_symbol_options then
				l_workspace_symbol_options.set_resolve_provider (a_manager.workspace_symbol_resolve_request_handler.server_options)
			elseif
				a_manager.workspace_symbol_request_handler.server_options = {LS_BOOLEAN}.true_ and then
				attached a_manager.workspace_symbol_resolve_request_handler.server_options as l_resolve_options
			then
				a_manager.workspace_symbol_request_handler.set_server_options (create {LS_WORKSPACE_SYMBOL_OPTIONS}.make (l_resolve_options, Void))
			end
			l_server_capabilities.set_workspace_symbol_provider (a_manager.workspace_symbol_request_handler.server_options)
			create l_result.make (l_server_capabilities)
			create l_response.make_success (a_request.id, l_result)
			a_manager.send_message (l_response)
		end

feature {LS_MESSAGE} -- Basic operations

	internal_handle (a_request: like request; a_manager: like message_manager)
			-- Handle `a_request`.
			-- Check the soundness of the client/server communication.
		local
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
		do
			if a_manager.is_initialized then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "already initialized")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			elseif a_manager.is_shutdown then
				create l_error.make ({LS_ERROR_CODES}.invalid_request, "is shutdown")
				create l_response.make_error (a_request.id, l_error)
				a_manager.send_message (l_response)
			else
				set_initializing (True)
				handle (a_request, a_manager)
				set_initializing (False)
			end
		end

feature {NONE} -- Implementation

	message_manager: LS_SERVER_MESSAGE_MANAGER
			-- Type of the surrounding message manager
		do
			check False then end
		end

end
