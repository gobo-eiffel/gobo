note

	description:

		"LSP 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZE_REQUEST

inherit

	LS_REQUEST

	LS_INITIALIZE_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id;
		a_process_id: like process_id;
		a_client_info: like client_info;
		a_locale: like locale;
		a_root_path: like root_path;
		a_root_uri: like root_uri;
		a_workspace_folders: like workspace_folders;
		a_capabilities: like capabilities;
		a_trace: like trace;
		a_initialization_options: like initialization_options;
		a_work_done_token: like work_done_token)
			-- Create a new 'initialize' request.
		require
			a_id_not_void: a_id /= Void
			a_process_id_not_void: a_process_id /= Void
			a_root_uri_not_void: a_root_uri /= Void
			a_capabilities_not_void: a_capabilities /= Void
		do
			id := a_id
			process_id := a_process_id
			client_info := a_client_info
			locale := a_locale
			root_path := a_root_path
			root_uri := a_root_uri
			workspace_folders := a_workspace_folders
			capabilities := a_capabilities
			trace := a_trace
			initialization_options := a_initialization_options
			work_done_token := a_work_done_token
		ensure
			id_set: id = a_id
			process_id_set: process_id = a_process_id
			client_info_set: client_info = a_client_info
			locale_set: locale = a_locale
			root_path_set: root_path = a_root_path
			root_uri_set: root_uri = a_root_uri
			workspace_folders_set: workspace_folders = a_workspace_folders
			capabilities_set: capabilities = a_capabilities
			trace_set: trace = a_trace
			initialization_options_set: initialization_options = a_initialization_options
			work_done_token_set: work_done_token = a_work_done_token
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "initialize"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_INITIALIZE_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.initialize_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_initialize_request (Current)
		end

end
