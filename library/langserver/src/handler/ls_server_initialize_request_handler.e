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
			l_capabilities: LS_SERVER_CAPABILITIES
			l_workspace_folders: detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			l_workspace_folder: LS_WORKSPACE_FOLDER
			l_workspace_folder_list: LS_WORKSPACE_FOLDER_LIST
			l_uri: LS_STRING
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
				a_manager.hover_request_handler.set_client_capabilities (l_text_document_capabilities.hover)
			end
			if attached a_request.capabilities.workspace as l_workspace_capabilities then
				a_manager.did_change_watched_files_notification_handler.set_client_capabilities (l_workspace_capabilities.did_change_watched_files)
			end
			create l_capabilities.make
			a_manager.hover_request_handler.build_server_options
			if attached a_manager.hover_request_handler.server_options as l_server_options then
				l_capabilities.set_hover_provider (l_server_options)
			end
			create l_result.make (l_capabilities)
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
