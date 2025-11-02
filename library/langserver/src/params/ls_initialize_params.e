note

	description:

		"LSP 'Initialize' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_INITIALIZE_PARAMS

inherit

	LS_WORK_DONE_PROGRESS_PARAMS

feature -- Access

	process_id: LS_OPTIONAL_INTEGER
			-- The process Id of the parent process that started the server. Is 'null' if
			-- the process has not been started by another process. If the parent
			-- process is not alive then the server should exit (see exit notification)
			-- its process.

	client_info: detachable LS_APPLICATION_INFO
			-- Information about the client

	locale: detachable LS_STRING
			-- The locale the client is currently showing the user interface
			-- in. This must not necessarily be the locale of the operating
			-- system.
			
			-- Uses IETF language tags as the value's syntax
			-- (See https://en.wikipedia.org/wiki/IETF_language_tag)

	root_path: detachable LS_OPTIONAL_STRING
			-- The rootPath of the workspace. Is 'null'
			-- if no folder is open.
			--
			-- @deprecated in favour of `rootUri`.

	root_uri: LS_OPTIONAL_DOCUMENT_URI
			-- The rootUri of the workspace. Is 'null' if no
			-- folder is open. If both `rootPath` and `rootUri` are set
			-- `rootUri` wins.
			--
			-- @deprecated in favour of `workspaceFolders`

	workspace_folders: detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			-- The workspace folders configured in the client when the server starts.
			-- This property is only available if the client supports workspace folders.
			-- It can be 'null' if the client supports workspace folders but none are
			-- configured.

	capabilities: LS_CLIENT_ALL_CAPABILITIES
			-- The capabilities provided by the client (editor or tool)

	trace: detachable LS_TRACE_VALUE
			-- The initial trace setting. If omitted trace is disabled ('off').

	initialization_options: detachable LS_ANY
			-- User provided initialization options.
	
feature -- Field names

	process_id_name: STRING_8 = "processId"
	client_info_name: STRING_8 = "clientInfo"
	locale_name: STRING_8 = "locale"
	root_path_name: STRING_8 = "rootPath"
	root_uri_name: STRING_8 = "rootUri"
	workspace_folders_name: STRING_8 = "workspaceFolders"
	capabilities_name: STRING_8 = "capabilities"
	trace_name: STRING_8 = "trace"
	initialization_options_name: STRING_8 = "initializationOptions"
			-- Field names

invariant

	process_id_not_void: process_id /= Void
	root_uri_not_void: root_uri /= Void
	capabilities_not_void: capabilities /= Void

end
