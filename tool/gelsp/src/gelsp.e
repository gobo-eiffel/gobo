note

	description:

		"Gobo Eiffel Language Server, using protocol LSP"

	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class GELSP

inherit

	LS_SERVER
		undefine
			version_number
		redefine
			make,
			server_name,
			server_description,
			completion_request_handler,
			definition_request_handler,
			did_change_configuration_notification_handler,
			did_change_text_document_notification_handler,
			did_change_watched_files_notification_handler,
			did_close_text_document_notification_handler,
			did_open_text_document_notification_handler,
			document_symbol_request_handler,
			hover_request_handler,
			implementation_request_handler,
			type_definition_request_handler,
			workspace_symbol_request_handler,
			on_completion_request,
			on_configuration_response,
			on_definition_request,
			on_did_change_configuration_notification,
			on_did_change_text_document_notification,
			on_did_change_watched_files_notification,
			on_did_close_text_document_notification,
			on_did_open_text_document_notification,
			on_document_symbol_request,
			on_hover_request,
			on_implementation_request,
			on_initialized_notification,
			on_shutdown_request,
			on_type_definition_request,
			on_workspace_symbol_request,
			add_other_options,
			process_other_options,
			error_handler
		end

	GELSP_VERSION

	ET_GOBO_CLI

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	UT_SHARED_ISE_VARIABLES
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	UT_SHARED_GOBO_VARIABLES
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	execute,
	execute_with_arguments,
	execute_with_arguments_and_error_handler

feature {NONE} -- Initialization

	make (a_connection: like connection)
			-- Create a new message manager.
		do
			create class_mapping.make (10_000)
			create edited_classes.make (500)
			create ecf_libraries.make (100)
			create diagnostics.make (100)
				-- Set environment variables "$GOBO", "$GOBO_LIBRARY",
				-- "$BOEHM_GC" and "$ZIG" if not set yet.
			gobo_variables.set_gobo_variables
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			precursor (a_connection)
		end

feature -- Status report

	is_configured: BOOLEAN
			-- Has the language server been fully initialized?

feature -- Access

	server_name: STRING_8 = "gelsp"
			-- Server name

	server_description: STRING_8 = "Gobo Eiffel LSP, Language Server for Eiffel."
			-- Server description

	workspace_folder_root_path: detachable STRING_8
			-- Root path of workspace folder, if any
		local
			l_uri: UT_URI
		do
			if attached {LS_WORKSPACE_FOLDER_LIST} workspace_folders as l_workspace_folders and then l_workspace_folders.count > 0 then
				create l_uri.make (l_workspace_folders.value (1).uri.to_string.utf8_value)
				if attached {UT_FILE_URI_ROUTINES}.uri_to_filename (l_uri) as l_root_path then
					Result := l_root_path
				end
			end
		end

feature -- Handling 'textDocument/completion' requests

	on_completion_request (a_request: LS_COMPLETION_REQUEST; a_response: LS_COMPLETION_RESPONSE)
			-- Handle 'textDocument/completion' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_browsable_name_finder: ET_BROWSABLE_NAME_FINDER
			l_request_position: LS_POSITION
			l_position: ET_COMPRESSED_POSITION
			l_completion_builder: GELSP_COMPLETION_BUILDER
		do
			if attached class_from_uri (a_request.text_document.uri) as l_class then
				l_request_position := a_request.position
				create l_position.make (l_request_position.line.value.to_integer_32 + 1, l_request_position.character.value.to_integer_32)
				create l_browsable_name_finder.make (system_processor)
				l_browsable_name_finder.find_browsable_name (l_position, l_class)
				if attached l_browsable_name_finder.last_browsable_name as l_last_browsable_name then
					create l_completion_builder.make (a_response, Current)
					l_last_browsable_name.build_completion (l_completion_builder)
				end
			end
		end

	completion_request_handler: LS_SERVER_COMPLETION_REQUEST_HANDLER
			-- Handler for 'textDocument/completion' requests
		local
			l_options: LS_COMPLETION_OPTIONS
			l_trigger_characters: LS_STRING_LIST
		once ("OBJECT")
			create Result.make
			create l_trigger_characters.make_with_capacity (2)
			l_trigger_characters.put_last ("_")
			l_trigger_characters.put_last (".")
			create l_options.make (l_trigger_characters, Void, Void, Void, False)
			Result.set_server_options (l_options)
		end

feature -- Handling 'textDocument/definition' requests

	on_definition_request (a_request: LS_DEFINITION_REQUEST; a_response: LS_DEFINITION_RESPONSE)
			-- Handle 'textDocument/definition' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_browsable_name_finder: ET_BROWSABLE_NAME_FINDER
			l_request_position: LS_POSITION
			l_position: ET_COMPRESSED_POSITION
			l_definition_builder: GELSP_DEFINITION_BUILDER
		do
			if attached class_from_uri (a_request.text_document.uri) as l_class then
				l_request_position := a_request.position
				create l_position.make (l_request_position.line.value.to_integer_32 + 1, l_request_position.character.value.to_integer_32 + 1)
				create l_browsable_name_finder.make (system_processor)
				l_browsable_name_finder.find_browsable_name (l_position, l_class)
				if attached l_browsable_name_finder.last_browsable_name as l_last_browsable_name then
					create l_definition_builder.make (a_response, l_position, Current)
					l_last_browsable_name.build_definition (l_definition_builder)
				end
			end
		end

	definition_request_handler: LS_SERVER_DEFINITION_REQUEST_HANDLER
			-- Handler for 'textDocument/definition' requests
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'textDocument/didChange' notifications

	on_did_change_text_document_notification (a_notification: LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION)
			-- Handle 'textDocument/didChange' notification `a_notification`.
			-- Actions to be executed when text documents are changed in the client.
		local
			nb: INTEGER
			l_class_text: STRING_8
			l_content_changes: LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST
			l_edited_group: ET_EDITED_CLASS_TEXT_GROUP
			l_master_class: ET_MASTER_CLASS
		do
			l_content_changes := a_notification.content_changes
			nb := l_content_changes.count
			if nb > 0 and attached pathname_from_uri (a_notification.text_document.uri) as l_filename then
				l_class_text := l_content_changes.value (nb).text.utf8_value
				if attached class_mapping.value (l_filename) as l_class then
					if attached {ET_EDITED_CLASS_TEXT_GROUP} l_class.group as l_group then
						l_group.set_class_text (l_class_text)
					else
						create l_edited_group.make (l_class_text, l_class)
						l_class.set_group (l_edited_group)
						edited_classes.force (l_edited_group, l_filename)
					end
					l_master_class := l_class.master_class_in_universe
					l_class.reset_after_preparsed
					l_master_class.set_modified (True)
					refresh_eiffel_system (False)
				elseif not edited_classes.has (l_filename) then
					create l_edited_group.make (l_class_text, tokens.unknown_class)
					edited_classes.force (l_edited_group, l_filename)
				end
			end
		end

	did_change_text_document_notification_handler: LS_SERVER_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didChange' notifications
		once ("OBJECT")
			create Result.make
			Result.set_server_options ({LS_TEXT_DOCUMENT_SYNC_KINDS}.full)
		end

feature -- Handling 'textDocument/didClose' notifications

	on_did_close_text_document_notification (a_notification: LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION)
			-- Handle 'textDocument/didClose' notification `a_notification`.
			-- Actions to be executed when text documents are closed in the client.
		local
			l_edited_class: ET_CLASS
		do
			if attached pathname_from_uri (a_notification.text_document.uri) as l_filename then
				if attached class_mapping.value (l_filename) as l_class then
					if attached {ET_EDITED_CLASS_TEXT_GROUP} l_class.group as l_edited_group then
						l_class.set_group (l_edited_group.current_group)
						l_edited_group.set_current_class (tokens.unknown_class)
					end
				end
				if attached edited_classes.value (l_filename) as l_edited_group then
					l_edited_class := l_edited_group.current_class
					if not l_edited_class.is_unknown then
						l_edited_class.set_group (l_edited_group.current_group)
						l_edited_group.set_current_class (tokens.unknown_class)
					end
					edited_classes.remove (l_filename)
				end
			end
		end

	did_close_text_document_notification_handler: LS_SERVER_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didClose' notifications
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'textDocument/didOpen' notifications

	on_did_open_text_document_notification (a_notification: LS_DID_OPEN_TEXT_DOCUMENT_NOTIFICATION)
			-- Handle 'textDocument/didOpen' notification `a_notification`.
			-- Actions to be executed when text documents are newly opened in the client.
		local
			l_class_text: STRING_8
			l_edited_group: ET_EDITED_CLASS_TEXT_GROUP
			l_master_class: ET_MASTER_CLASS
		do
			if attached pathname_from_uri (a_notification.text_document.uri) as l_filename then
				l_class_text := a_notification.text_document.text.utf8_value
				if attached class_mapping.value (l_filename) as l_class then
					if attached {ET_EDITED_CLASS_TEXT_GROUP} l_class.group as l_group then
						l_group.set_class_text (l_class_text)
					else
						create l_edited_group.make (l_class_text, l_class)
						l_class.set_group (l_edited_group)
						edited_classes.force (l_edited_group, l_filename)
					end
					l_master_class := l_class.master_class_in_universe
					l_class.reset_after_preparsed
					l_master_class.set_modified (True)
					refresh_eiffel_system (False)
				elseif not edited_classes.has (l_filename) then
					create l_edited_group.make (l_class_text, tokens.unknown_class)
					edited_classes.force (l_edited_group, l_filename)
				end
			end
		end

	did_open_text_document_notification_handler: LS_SERVER_DID_OPEN_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Handler for 'textDocument/didOpen' notifications
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'textDocument/documentSymbol' requests

	on_document_symbol_request (a_request: LS_DOCUMENT_SYMBOL_REQUEST; a_response: LS_DOCUMENT_SYMBOL_RESPONSE)
			-- Handle 'textDocument/documentSymbol' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_feature_clause: ET_FEATURE_CLAUSE
			l_feature_clause_symbols: DS_HASH_TABLE [LS_DOCUMENT_SYMBOL, ET_FEATURE_CLAUSE]
			i, nb: INTEGER
			l_document_symbol: LS_DOCUMENT_SYMBOL
			l_range: LS_RANGE
			l_selection_range: LS_RANGE
			l_text: STRING_8
			l_name: LS_STRING
		do
			if attached class_from_uri (a_request.text_document.uri) as l_class then
				if attached l_class.feature_clauses as l_feature_clauses then
					nb := l_feature_clauses.count
					create l_feature_clause_symbols.make_map (nb)
					from i := 1 until i > nb loop
						l_feature_clause := l_feature_clauses.item (i)
						l_range := range (l_feature_clause.feature_keyword, l_class)
						l_selection_range := range (l_feature_clause.feature_keyword, l_class)
						create l_text.make (50)
						l_text.append_string (tokens.feature_keyword.text)
						l_feature_clause.append_client_clause_to_string (" ", l_text)
						l_feature_clause.append_first_line_comment_to_string (" ", l_text)
						create l_name.make_from_utf8 (l_text)
						create l_document_symbol.make (l_name, Void, {LS_SYMBOL_KINDS}.interface, Void, Void, l_range, l_selection_range, Void)
						a_response.add_document_symbol (l_document_symbol)
						l_feature_clause_symbols.put (l_document_symbol, l_feature_clause)
						i := i + 1
					end
				end
				add_features_document_symbols (l_class.queries, l_class, l_feature_clause_symbols, a_response)
				add_features_document_symbols (l_class.procedures, l_class, l_feature_clause_symbols, a_response)
			end
		end

	add_features_document_symbols (a_feature_list: ET_FEATURE_LIST; a_class: ET_CLASS;
		a_feature_clause_symbols: detachable DS_HASH_TABLE [LS_DOCUMENT_SYMBOL, ET_FEATURE_CLAUSE];
		a_response: LS_DOCUMENT_SYMBOL_RESPONSE)
			-- Add the document symbols of each feature in `a_feature_list` declared
			-- in `a_class` to its associated feature clause document symbol if any,
			-- or to `a_response` otherwise.
		require
			a_feature_list_not_void: a_feature_list /= Void
			a_class_not_void: a_class /= Void
			a_response_not_void: a_response /= Void
		local
			l_feature: ET_FEATURE
			l_feature_name: ET_FEATURE_NAME
			i, nb: INTEGER
			l_document_symbol: LS_DOCUMENT_SYMBOL
			l_range: LS_RANGE
			l_selection_range: LS_RANGE
			l_text: STRING_8
			l_name: LS_STRING
			l_kind: LS_SYMBOL_KIND
			l_with_signature: BOOLEAN
		do
			nb := a_feature_list.declared_count
			from i := 1 until i > nb loop
				l_feature := a_feature_list.item (i)
				l_feature_name := l_feature.name
				l_range := range (l_feature, a_class)
				l_selection_range := range (l_feature_name, a_class)
				if l_feature.is_attribute then
					l_kind := {LS_SYMBOL_KINDS}.field
				else
					l_kind := {LS_SYMBOL_KINDS}.method
				end
				if l_with_signature then
					create l_text.make (50)
					l_feature.append_canonical_signature_to_string (a_class, l_text)
				else
					l_text := l_feature_name.lower_name
				end
				create l_name.make_from_utf8 (l_text)
				create l_document_symbol.make (l_name, Void, l_kind, Void, Void, l_range, l_selection_range, Void)
				if
					a_feature_clause_symbols /= Void and then
					attached l_feature.feature_clause as l_feature_clause and then
					attached a_feature_clause_symbols.value (l_feature_clause) as l_parent_symbol
				then
					if l_parent_symbol.range.end_ < l_document_symbol.range.end_ then
						l_parent_symbol.range.set_end (l_document_symbol.range.end_)
					end
					l_parent_symbol.add_child (l_document_symbol)
				else
					a_response.add_document_symbol (l_document_symbol)
				end
				i := i + 1
			end
		end

	document_symbol_request_handler: LS_SERVER_DOCUMENT_SYMBOL_REQUEST_HANDLER
			-- Handler for 'textDocument/documentSymbol' requests
		once ("OBJECT")
			create Result.make
			Result.set_server_options ({LS_BOOLEAN}.false_)
		end

feature -- Handling 'textDocument/hover' requests

	on_hover_request (a_request: LS_HOVER_REQUEST; a_response: LS_HOVER_RESPONSE)
			-- Handle 'textDocument/hover' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_browsable_name_finder: ET_BROWSABLE_NAME_FINDER
			l_request_position: LS_POSITION
			l_position: ET_COMPRESSED_POSITION
			l_text: STRING_8
		do
			if attached class_from_uri (a_request.text_document.uri) as l_class then
				l_request_position := a_request.position
				create l_position.make (l_request_position.line.value.to_integer_32 + 1, l_request_position.character.value.to_integer_32 + 1)
				create l_browsable_name_finder.make (system_processor)
				l_browsable_name_finder.find_browsable_name (l_position, l_class)
				if attached l_browsable_name_finder.last_browsable_name as l_last_browsable_name then
					if hover_request_handler.is_markdown_supported then
						create l_text.make (50)
						l_text.append_string (once "```eiffel%N")
						l_last_browsable_name.append_description_to_string (l_text)
						l_text.append_string (once "%N```")
						if l_text.count = 14 then
							-- No description.
						else
							a_response.set_markdown_utf8 (l_text, Current)
						end
					else
						create l_text.make (50)
						l_last_browsable_name.append_description_to_string (l_text)
						if l_text.is_empty then
							-- No description.
						elseif hover_request_handler.is_plaintext_supported then
							a_response.set_plaintext_utf8 (l_text, Current)
						else
							a_response.set_string_utf8 (l_text)
						end
					end
				end
			end
		end

	hover_request_handler: LS_SERVER_HOVER_REQUEST_HANDLER
			-- Handler for 'textDocument/hover' requests
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'textDocument/implementation' requests

	on_implementation_request (a_request: LS_IMPLEMENTATION_REQUEST; a_response: LS_IMPLEMENTATION_RESPONSE)
			-- Handle 'textDocument/implementation' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_browsable_name_finder: ET_BROWSABLE_NAME_FINDER
			l_request_position: LS_POSITION
			l_position: ET_COMPRESSED_POSITION
			l_implementation_builder: GELSP_IMPLEMENTATION_BUILDER
		do
			if attached class_from_uri (a_request.text_document.uri) as l_class then
				l_request_position := a_request.position
				create l_position.make (l_request_position.line.value.to_integer_32 + 1, l_request_position.character.value.to_integer_32 + 1)
				create l_browsable_name_finder.make (system_processor)
				l_browsable_name_finder.find_browsable_name (l_position, l_class)
				if attached l_browsable_name_finder.last_browsable_name as l_last_browsable_name then
					create l_implementation_builder.make (a_response, Current)
					l_last_browsable_name.build_implementation (l_implementation_builder)
				end
			end
		end

	implementation_request_handler: LS_SERVER_IMPLEMENTATION_REQUEST_HANDLER
			-- Handler for 'textDocument/implementation' requests
		once ("OBJECT")
			create Result.make

		end

feature -- Handling 'textDocument/typeDefinition' requests

	on_type_definition_request (a_request: LS_TYPE_DEFINITION_REQUEST; a_response: LS_TYPE_DEFINITION_RESPONSE)
			-- Handle 'textDocument/typeDefinition' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_browsable_name_finder: ET_BROWSABLE_NAME_FINDER
			l_request_position: LS_POSITION
			l_position: ET_COMPRESSED_POSITION
			l_type_definition_builder: GELSP_TYPE_DEFINITION_BUILDER
		do
			if attached class_from_uri (a_request.text_document.uri) as l_class then
				l_request_position := a_request.position
				create l_position.make (l_request_position.line.value.to_integer_32 + 1, l_request_position.character.value.to_integer_32 + 1)
				create l_browsable_name_finder.make (system_processor)
				l_browsable_name_finder.find_browsable_name (l_position, l_class)
				if attached l_browsable_name_finder.last_browsable_name as l_last_browsable_name then
					create l_type_definition_builder.make (a_response, l_position, Current)
					l_last_browsable_name.build_type_definition (l_type_definition_builder)
				end
			end
		end

	type_definition_request_handler: LS_SERVER_TYPE_DEFINITION_REQUEST_HANDLER
			-- Handler for 'textDocument/typeDefinition' requests
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'workspace/configuration' requests

	on_configuration_response (a_result: detachable LS_CONFIGURATION_RESULT; a_request: LS_CONFIGURATION_REQUEST; a_response: LS_RESPONSE)
			-- Action to be executed when the client sent response
			-- to a 'workspace/configuration' request.
		local
			l_configurations: LS_ARRAY
			l_value: STRING_8
			l_old_config_ecf_filename: STRING_8
			l_old_config_ecf_target: STRING_8
		do
			l_old_config_ecf_filename := config_ecf_filename
			l_old_config_ecf_target := config_ecf_target
			config_ecf_filename := Void
			config_ecf_target := Void
			if a_result /= Void then
				l_configurations := a_result.to_array
				if l_configurations.count = 2 then
					if attached {LS_STRING} l_configurations.value (1) as l_config_ecf_filename then
						l_value := l_config_ecf_filename.utf8_value
						l_value.right_adjust
						if not l_value.is_empty then
							config_ecf_filename := l_value
						end
					end
					if attached {LS_STRING} l_configurations.value (2) as l_config_ecf_target then
						l_value := l_config_ecf_target.utf8_value
						l_value.adjust
						if not l_value.is_empty then
							config_ecf_target := l_value
						end
					end
				end
			end
			if not is_configured then
				is_configured := True
				if did_change_watched_files_notification_handler.is_dynamic_registration_supported then
					register_did_change_watched_files_options ("xxx", <<["**/*.ecf", {LS_WATCH_KINDS}.change], ["**/*", {LS_WATCH_KINDS}.delete]>>)
				end
				if document_symbol_request_handler.is_dynamic_registration_supported then
					register_document_symbol_options ("yyyy", Void, {LS_NULL}.null, Void)
				end
					-- First Eiffel code analysis.
				build_eiffel_system
			elseif config_ecf_filename /~ l_old_config_ecf_filename or config_ecf_target /~ l_old_config_ecf_target then
					-- Settings have been changed.
				set_system_processor
				build_eiffel_system
			end
		end

feature -- Handling 'workspace/didChangeConfiguration' notifications

	on_did_change_configuration_notification (a_notification: LS_DID_CHANGE_CONFIGURATION_NOTIFICATION)
			-- Handle 'workspace/didChangeConfiguration' notification `a_notification`.
			-- Actions to be executed when watched files are changed.
		do
			send_configuration_request (<<[Void, "gobo-eiffel.workspaceEcfFile"], [Void, "gobo-eiffel.workspaceEcfTarget"]>>)
		end

	did_change_configuration_notification_handler: LS_SERVER_DID_CHANGE_CONFIGURATION_NOTIFICATION_HANDLER
			-- Handler for 'workspace/didChangeConfiguration' notifications
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'workspace/didChangeWatchedFiles' notifications

	on_did_change_watched_files_notification (a_notification: LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION)
			-- Handle 'workspace/didChangeWatchedFiles' notification `a_notification`.
			-- Actions to be executed when watched files are changed.
		local
			l_changes: LS_FILE_EVENT_LIST
			l_file_event: LS_FILE_EVENT
			i, nb: INTEGER
			l_incremental: BOOLEAN
			l_preparse_needed: BOOLEAN
			l_master_class: ET_MASTER_CLASS
			l_no_action: BOOLEAN
			l_deleted_class: ET_CLASS
			l_filename: STRING_8
			l_basename: STRING_8
			l_dirname: STRING_8
			l_found: BOOLEAN
			l_group: ET_PRIMARY_GROUP
			l_class_added: BOOLEAN
		do
			l_incremental := True
			l_no_action := True
			l_changes := a_notification.changes
			nb := l_changes.count
			from i := 1 until i > nb loop
				l_file_event := l_changes.value (i)
				if not attached pathname_from_uri (l_file_event.uri) as l_pathname then
						-- Rebuild from scratch, just in case we missed something.
					l_no_action := False
					l_incremental := False
					i := nb + 1 -- Jump out of the loop.
				elseif file_system.has_extension (l_pathname, {KL_FILE_SYSTEM}.ecf_extension) then
					if l_file_event.type.value /= {LS_FILE_CHANGE_TYPES}.changed.value then
							-- Ignore new or deleted ECF files.
						i := i + 1
					elseif ecf_libraries.is_empty then
							-- Rebuild from scratch, because there might have been
							-- an issue with one of our ECF files (hence the empty
							-- `ecf_libraries`), and this modification may have fixed it.
						l_no_action := False
						l_incremental := False
						i := nb + 1 -- Jump out of the loop.
					elseif not ecf_libraries.has (l_pathname) then
							-- Ignore modifications in other ECF files.
						i := i + 1
					else
						l_no_action := False
						l_incremental := False
						i := nb + 1 -- Jump out of the loop.
					end
				elseif not file_system.has_extension (l_pathname, {KL_FILE_SYSTEM}.eiffel_extension) then
						-- Look for deleted folders containing Eiffel classes.
					if l_file_event.type.value = {LS_FILE_CHANGE_TYPES}.deleted.value then
						from class_mapping.start until class_mapping.after loop
							l_filename := class_mapping.key_for_iteration
							if l_filename.starts_with (l_pathname) then
								if not edited_classes.has (l_filename) then
									l_no_action := False
									l_deleted_class := class_mapping.item_for_iteration
									l_master_class := l_deleted_class.master_class_in_universe
									l_master_class.reset_local_modified_class (l_deleted_class, system_processor)
									l_master_class.remove_unknown_local_classes
								end
							end
							class_mapping.forth
						end
					end
					i := i + 1
				elseif l_file_event.type.value = {LS_FILE_CHANGE_TYPES}.created.value then
						-- Look for cluster containing this file.
					if attached {ET_EIFFEL_PREPARSER_SKELETON} system_processor.eiffel_preparser as l_eiffel_preparser then
						l_basename := file_system.basename (l_pathname)
						l_dirname := file_system.dirname (l_pathname)
						l_found := False
						from class_mapping.start until class_mapping.after loop
							l_filename := class_mapping.key_for_iteration
							if file_system.same_pathnames (file_system.dirname (l_filename), l_dirname) then
								l_group := class_mapping.item_for_iteration.group
								if attached edited_classes.value (l_filename) as l_edited_group then
									l_group := l_edited_group.current_group
								end
								if
									attached {ET_CLUSTER} l_group as l_cluster and then
									l_cluster.is_valid_eiffel_filename (l_basename)
								then
									l_found := True
									class_mapping.go_after
									l_eiffel_preparser.preparse_file (l_pathname, l_cluster)
									l_class_added := True
								end
							end
							if not l_found then
								class_mapping.forth
							end
						end
					end
					l_no_action := False
					if not l_found then
						l_preparse_needed := True
					end
					i := i + 1
				elseif not attached class_mapping.value (l_pathname) as l_class then
						-- Class not in system.
						-- Ignore this event.
					i := i + 1
				elseif edited_classes.has (l_pathname) then
						-- Class being edited in the client.
						-- Ignore this event. Modifications to this class
						-- are handled by `on_did_change_text_document_notification`.
					i := i + 1
				else
					l_no_action := False
					l_master_class := l_class.master_class_in_universe
					l_master_class.reset_local_modified_class (l_class, system_processor)
					l_master_class.remove_unknown_local_classes
					i := i + 1
				end
			end
			if l_no_action then
				-- Done.
			elseif l_incremental then
				if l_class_added and not l_preparse_needed and attached eiffel_system as l_system then
					l_system.import_classes_recursive
				end
				refresh_eiffel_system (l_preparse_needed)
			else
				set_system_processor
				build_eiffel_system
			end
		end

	did_change_watched_files_notification_handler: LS_SERVER_DID_CHANGE_WATCHED_FILES_NOTIFICATION_HANDLER
			-- Handler for 'workspace/didChangeWatchedFiles' notifications
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'workspace/symbol' requests

	on_workspace_symbol_request (a_request: LS_WORKSPACE_SYMBOL_REQUEST; a_response: LS_WORKSPACE_SYMBOL_RESPONSE)
			-- Handle 'workspace/symbol' request `a_request`.
			-- Build `a_response` accordingly.
		local
			l_query: STRING_8
			i: INTEGER
			l_feature_name: detachable STRING_8
			l_class: ET_CLASS
			l_class_name: STRING_8
			l_symbol: LS_WORKSPACE_SYMBOL
		do
			l_query := a_request.query.utf8_value
			if not l_query.ends_with ("*") then
				l_query := l_query + "*"
			end
			l_class_name := l_query.as_upper
			i := l_query.index_of ('.', 1)
			if i /= 0 then
				l_class_name := l_class_name.substring (1, i - 1)
				l_feature_name := l_query.substring (i + 1, l_query.count)
			end
			if l_feature_name = Void then
				from class_mapping.start until class_mapping.after loop
					l_class := class_mapping.item_for_iteration
					l_class_name := l_class.upper_name
					if attached location (l_class.name, l_class) as l_location then
						create l_symbol.make (l_class_name, {LS_SYMBOL_KINDS}.class_, Void, Void, l_location, Void)
						a_response.add_workspace_symbol (l_symbol)
					end
					class_mapping.forth
				end
			elseif not l_class_name.is_empty then
				from class_mapping.start until class_mapping.after loop
					l_class := class_mapping.item_for_iteration
					if l_class_name.same_string (l_class.upper_name) then
						add_features_workspace_symbols (l_class.queries, l_class, a_response)
						add_features_workspace_symbols (l_class.procedures, l_class, a_response)
					end
					class_mapping.forth
				end
			end
		end

	add_features_workspace_symbols (a_feature_list: ET_FEATURE_LIST; a_class: ET_CLASS; a_response: LS_WORKSPACE_SYMBOL_RESPONSE)
			-- Add the workspace symbols of each feature in `a_feature_list` declared
			-- in `a_class` to `a_response` otherwise.
		require
			a_feature_list_not_void: a_feature_list /= Void
			a_class_not_void: a_class /= Void
			a_response_not_void: a_response /= Void
		local
			i, nb: INTEGER
			l_feature: ET_FEATURE
			l_class_name: STRING_8
			l_feature_name: STRING_8
			l_symbol: LS_WORKSPACE_SYMBOL
			l_kind: LS_SYMBOL_KIND
		do
			l_class_name := a_class.upper_name
			nb := a_feature_list.count
			from i := 1 until i > nb loop
				l_feature := a_feature_list.item (i)
				l_feature_name := l_feature.lower_name
				l_feature := l_feature.implementation_feature
				if attached location (l_feature.name, l_feature.implementation_class) as l_location then
					l_kind := if l_feature.is_attribute then {LS_SYMBOL_KINDS}.field else {LS_SYMBOL_KINDS}.method end
					create l_symbol.make (l_class_name + "." + l_feature_name, l_kind, Void, Void, l_location, Void)
					a_response.add_workspace_symbol (l_symbol)
				end
				i := i + 1
			end
		end

	workspace_symbol_request_handler: LS_SERVER_WORKSPACE_SYMBOL_REQUEST_HANDLER
			-- Handler for 'workspace/symbol' requests
		once ("OBJECT")
			create Result.make
		end

feature -- Handling 'initialized' notifications

	on_initialized_notification (a_notification: LS_INITIALIZED_NOTIFICATION)
			-- Handle 'initialized' notification `a_notification`.
		do
			if did_change_configuration_notification_handler.is_dynamic_registration_supported then
				register_did_change_configuration_options ("zzz")
			end
			send_configuration_request (<<[Void, "gobo-eiffel.workspaceEcfFile"], [Void, "gobo-eiffel.workspaceEcfTarget"]>>)
		end

feature -- Handling 'shutdown' requests

	on_shutdown_request (a_request: LS_SHUTDOWN_REQUEST)
			-- Handle 'shutdown' request `a_request`.
			-- Actions to be executed when client want to
			-- shutdown the server.
		do
			send_diagnostics
		end

feature {NONE} -- Eiffel processing

	build_eiffel_system
			-- Build Eiffel system from scratch (equivalent of Degrees 6 to 3).
			-- Build class filename mapping.
		local
			l_file: KL_TEXT_INPUT_FILE
			dt1: detachable DT_DATE_TIME
			dt2: detachable DT_DATE_TIME
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_filename: STRING_8
			l_message: STRING_8
		do
			send_custom_notification ("$/goboEiffel/busy", Void)
			if full_compilation_count >= max_full_compilation_count or total_compilation_count >= max_total_compilation_count then
				if trace_value ~ {LS_TRACE_VALUES}.message then
					send_log_trace_message_notification ("Restarting Eiffel language server...")
				elseif trace_value ~ {LS_TRACE_VALUES}.verbose then
					if full_compilation_count >= max_full_compilation_count then
						l_message := "Restarting Eiffel language server after " + max_full_compilation_count.out + " Eiffel compilations from scratch..."
					else
						l_message := "Restarting Eiffel language server after " + max_total_compilation_count.out + " Eiffel compilations..."
					end
					send_log_trace_verbose_notification ("Restarting Eiffel language server...", l_message)
				end
				send_custom_notification ("$/goboEiffel/restart", Void)
			else
				if debug_mode then
					dt1 := system_processor.benchmark_start_time
				end
				reset
				{MEMORY}.full_collect
				find_ecf_filename
				l_filename := ecf_filename
				if l_filename = Void then
					l_filename := file_system.nested_pathname ("${GOBO}", <<"library", "common", "config", "ecf", "default.ecf">>)
					l_filename := Execution_environment.interpreted_string (l_filename)
				end
				if debug_mode then
					dt2 := system_processor.benchmark_start_time
				end
				create l_file.make (l_filename)
				l_file.open_read
				if l_file.is_open_read then
					parse_ecf_file (l_file)
					l_file.close
				else
					report_cannot_read_error (l_filename)
				end
				if dt2 /= Void then
					system_processor.record_end_time (dt2, "Read ECF file")
				end
				if attached eiffel_system as l_system then
					system_processor.compile_degree_6 (l_system)
					build_class_mapping (l_system)
					create l_classes.make (l_system.class_count_recursive)
					l_system.classes_do_recursive (agent l_classes.force_last)
					system_processor.compile_classes (l_classes)
					send_diagnostics
					full_compilation_count := full_compilation_count + 1
					incremental_compilation_count := 0
					total_compilation_count := total_compilation_count + 1
					if debug_mode then
						std.error.put_line ("ECF file count: " + ecf_libraries.count.out)
						std.error.put_line ("Full compilation count: " + full_compilation_count.out)
						std.error.put_line ("Incremental compilation count: " + incremental_compilation_count.out)
						std.error.put_line ("Total compilation count: " + total_compilation_count.out)
						std.error.put_line ("Class count: " + class_mapping.count.out)
					end
				end
				if dt1 /= Void then
					system_processor.record_end_time (dt1, "Total Time")
				end
			end
			send_custom_notification ("$/goboEiffel/notBusy", Void)
		end

	refresh_eiffel_system (a_preparse_needed: BOOLEAN)
			-- Refresh Eiffel system after a class has been modified.
			-- `a_preparse_needed` means that we should run a Degree 6
			-- again to find new classes. Otherwise Degree 6 is skipped.
		local
			dt1: detachable DT_DATE_TIME
			dt2: detachable DT_DATE_TIME
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
			l_message: STRING_8
		do
			if total_compilation_count >= max_total_compilation_count then
				if trace_value ~ {LS_TRACE_VALUES}.message then
					send_log_trace_message_notification ("Restarting Eiffel language server...")
				elseif trace_value ~ {LS_TRACE_VALUES}.verbose then
					l_message := "Restarting Eiffel language server after " + max_total_compilation_count.out + " Eiffel compilations..."
					send_log_trace_verbose_notification ("Restarting Eiffel language server...", l_message)
				end
				send_custom_notification ("$/goboEiffel/restart", Void)
			else
				if debug_mode then
					dt1 := system_processor.benchmark_start_time
				end
				if attached eiffel_system as l_system then
					reset_class_mapping (True)
					if a_preparse_needed then
						system_processor.compile_degree_6 (l_system)
					else
						if debug_mode then
							dt2 := system_processor.benchmark_start_time
						end
						l_system.reset_classes_incremental_recursive (system_processor)
						if dt2 /= Void then
							system_processor.record_end_time (dt2, "Reset class incremental")
							dt2 := system_processor.benchmark_start_time
						end
					end
					build_class_mapping (l_system)
					if dt2 /= Void then
						system_processor.record_end_time (dt2, "Build class mapping")
					end
					create l_classes.make (l_system.class_count_recursive)
					l_system.classes_do_recursive (agent l_classes.force_last)
					system_processor.compile_classes (l_classes)
					send_diagnostics
					incremental_compilation_count := incremental_compilation_count + 1
					total_compilation_count := total_compilation_count + 1
					if debug_mode then
						std.error.put_line ("Full compilation count: " + full_compilation_count.out)
						std.error.put_line ("Incremental compilation count: " + incremental_compilation_count.out)
						std.error.put_line ("Total compilation count: " + total_compilation_count.out)
					end
				end
				if dt1 /= Void then
					system_processor.record_end_time (dt1, "Total Time")
				end
			end
		end

	reset
			-- Reset Eiffel processing.
		do
			ecf_filename := Void
			eiffel_system := Void
			ecf_libraries.wipe_out
			reset_class_mapping (False)
			error_handler.syntax_error_actions.wipe_out
			error_handler.syntax_error_actions.extend (agent report_syntax_error)
			error_handler.validity_error_actions.wipe_out
			error_handler.validity_error_actions.extend (agent report_validity_error)
		end

	find_ecf_filename
			-- Find the ECF filename for the current workspace.
			-- Make the result available in `ecf_filename`.
		local
			l_dir: KL_DIRECTORY
			l_filenames: DS_ARRAYED_LIST [STRING_8]
			l_sorter: DS_QUICK_SORTER [STRING_8]
			l_comparator: UC_STRING_COMPARATOR
		do
			ecf_filename := Void
			if attached workspace_folder_root_path as l_root_path then
				if attached config_ecf_filename as l_config_ecf_filename then
					if file_system.is_absolute_pathname (l_config_ecf_filename) then
						ecf_filename := l_config_ecf_filename
					else
						ecf_filename := file_system.pathname (l_root_path, l_config_ecf_filename)
					end
				else
					create l_dir.make (l_root_path)
					create l_filenames.make (5)
					l_dir.do_if (agent l_filenames.force_last, agent file_system.has_extension (?, file_system.ecf_extension))
					if l_filenames.count = 1 then
						ecf_filename := file_system.pathname (l_root_path, l_filenames.first)
					elseif not l_filenames.is_empty then
						create l_comparator
						create l_sorter.make (l_comparator)
						l_filenames.sort (l_sorter)
						ecf_filename := file_system.pathname (l_root_path, l_filenames.last)
					end
				end
			end
		end

	parse_ecf_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Read ECF file `a_file'.
			-- Put result in `eiffel_system' if no error occurred.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_ecf_parser: ET_ECF_SYSTEM_PARSER
			l_ecf_error_handler: ET_ECF_ERROR_HANDLER
			l_root_cluster: ET_ECF_CLUSTER
		do
			eiffel_system := Void
			ecf_libraries.wipe_out
			create l_ecf_error_handler.make_standard
			l_ecf_error_handler.set_info_file (std.error)
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_ise_version (ise_version)
			l_ecf_parser.set_override_settings (override_settings)
			l_ecf_parser.set_override_capabilities (override_capabilities)
			l_ecf_parser.set_override_variables (override_variables)
			l_ecf_parser.parse_file (a_file, config_ecf_target)
			if l_ecf_error_handler.has_error then
				-- Error already reported.
			elseif not attached l_ecf_parser.last_system as l_last_system then
				report_no_system_found_error (a_file.name)
			else
				eiffel_system := l_last_system
				if ecf_filename = Void and attached l_last_system.selected_target as l_target and attached workspace_folder_root_path as l_root_path then
						-- When no ECF files was provided, add a recursive cluster
						-- at the root of the workspace folder.
					create l_root_cluster.make ("root_cluster", l_root_path, l_last_system, l_target)
					l_root_cluster.set_recursive (True)
					l_last_system.clusters.put_last (l_root_cluster)
				end
				l_last_system.universes_do_recursive (agent (a_universe: ET_UNIVERSE)
					do
						if attached {ET_ECF_INTERNAL_UNIVERSE} a_universe as l_ecf_universe then
							ecf_libraries.force (l_ecf_universe, l_ecf_universe.filename)
						end
					end)
			end
		end

	build_class_mapping (a_system: ET_SYSTEM)
			-- Build `class_mapping` with the classes found in `a_system`.
		require
			a_system_not_void: a_system /= Void
		do
			reset_class_mapping (True)
			a_system.classes_do_recursive (
				agent (a_class: ET_CLASS)
					do
						if attached a_class.filename as l_filename then
							if attached edited_classes.value (l_filename) as l_edited_group then
								l_edited_group.set_current_class (a_class)
								a_class.set_group (l_edited_group)
							end
							class_mapping.force_last (a_class, l_filename)
						end
					end)
		end

	reset_class_mapping (a_incremental: BOOLEAN)
			-- Reset `class_mapping`.
			-- If `a_incremental` is False, it means that we recompile from scratch.
		do
			if not a_incremental then
				class_mapping.wipe_out
				edited_classes.do_all (agent (a_edited_group: ET_EDITED_CLASS_TEXT_GROUP) do a_edited_group.set_current_class (tokens.unknown_class) end)
			elseif not class_mapping.is_empty then
				edited_classes.do_all (agent (a_edited_group: ET_EDITED_CLASS_TEXT_GROUP)
					local
						l_edited_class: ET_CLASS
					do
						l_edited_class := a_edited_group.current_class
						if not l_edited_class.is_unknown then
							l_edited_class.set_group (a_edited_group.current_group)
							a_edited_group.set_current_class (tokens.unknown_class)
						end
					end)
				class_mapping.wipe_out
			end
		ensure
			class_mapping_reset: class_mapping.is_empty
			edited_classes_reset: across edited_classes as l_edited_class all l_edited_class.current_class.is_unknown end
		end

	report_validity_error (a_error: ET_VALIDITY_ERROR)
			-- Report validity error.
		require
			a_error_not_void: a_error /= Void
		local
			l_class_impl: ET_CLASS
			l_diagnostic_list: detachable LS_DIAGNOSTIC_LIST
			l_diagnostic: LS_DIAGNOSTIC
			l_code: LS_STRING
			l_range: LS_RANGE
			l_position: ET_POSITION
			l_last_position_plus_one: ET_COMPRESSED_POSITION
			l_message: STRING
			l_error_message: LS_STRING
			l_index: INTEGER
		do
			l_class_impl := a_error.class_impl
			if attached l_class_impl.filename as l_filename then
				l_diagnostic_list := diagnostics.value (l_filename)
				if l_diagnostic_list = Void then
					create l_diagnostic_list.make_with_capacity (10)
					diagnostics.force (l_diagnostic_list, l_filename)
				end
				l_position := a_error.position
				if attached {ET_AST_NODE} l_position as l_ast_node then
					l_range := range (l_ast_node, l_class_impl)
				else
					create l_last_position_plus_one.make (l_position.line, l_position.column + 1)
					create l_range.make (position (l_position, l_class_impl), position (l_last_position_plus_one, l_class_impl))
				end
				l_code := a_error.etl_code
				l_message := a_error.message (a_error.default_template)
				l_index := l_message.index_of (':', 1)
				if l_index > 0 then
					l_message.remove_head (l_index)
				end
				l_index := l_message.substring_index ("%N%Tclass ", 1)
				if l_index > 0 then
					l_message.keep_head (l_index - 1)
					l_message.right_adjust
				end
				l_message.replace_substring_all ("%R%N", "\n")
				l_message.replace_substring_all ("%N", "\n")
				if a_error.current_class /= l_class_impl then
					l_message := "class " + a_error.current_class.upper_name + " (" + l_class_impl.upper_name + "):" + l_message
				else
					l_message := "class " + l_class_impl.upper_name + ":" + l_message
				end
				create l_error_message.make_from_utf8 (l_message)
				create l_diagnostic.make (l_range, {LS_DIAGNOSTIC_SEVERITIES}.error, l_code, Void, "Eiffel", l_error_message, Void, Void, Void)
				l_diagnostic_list.put_last (l_diagnostic)
			end
		end

	report_syntax_error (a_error: ET_SYNTAX_ERROR)
			-- Report syntax error.
		require
			a_error_not_void: a_error /= Void
		local
			l_filename: STRING_8
			l_diagnostic_list: detachable LS_DIAGNOSTIC_LIST
			l_diagnostic: LS_DIAGNOSTIC
			l_range: LS_RANGE
			l_position: ET_POSITION
			l_last_position_plus_one: ET_COMPRESSED_POSITION
			l_message: STRING
			l_error_message: LS_STRING
		do
			l_filename := a_error.filename
			l_position := a_error.position
			l_diagnostic_list := diagnostics.value (l_filename)
			if l_diagnostic_list = Void then
				create l_diagnostic_list.make_with_capacity (10)
				diagnostics.force (l_diagnostic_list, l_filename)
			end
			create l_last_position_plus_one.make (l_position.line, l_position.column + 1)
			create l_range.make (position (l_position, tokens.unknown_class), position (l_last_position_plus_one, tokens.unknown_class))
			l_message := "Syntax error"
			create l_error_message.make_from_utf8 (l_message)
			create l_diagnostic.make (l_range, {LS_DIAGNOSTIC_SEVERITIES}.error, Void, Void, "Eiffel", l_error_message, Void, Void, Void)
			l_diagnostic_list.put_last (l_diagnostic)
		end

	send_diagnostics
			-- Send Eiffel error messages to client.
		local
			l_notification: LS_PUBLISH_DIAGNOSTICS_NOTIFICATION
			l_diagnostic_list: LS_DIAGNOSTIC_LIST
			l_filename: STRING_8
			l_uri: UT_URI
			l_string: LS_STRING
		do
			from diagnostics.start until diagnostics.after loop
				l_diagnostic_list := diagnostics.item_for_iteration
				l_filename := diagnostics.key_for_iteration
				l_uri := {UT_FILE_URI_ROUTINES}.filename_to_uri (l_filename)
				create l_string.make_from_string (l_uri.full_reference)
				create l_notification.make (l_string, Void, l_diagnostic_list)
				send_message (l_notification)
				if l_diagnostic_list.count = 0 then
					diagnostics.remove (l_filename)
				else
					l_diagnostic_list.wipe_out
					diagnostics.forth
				end
			end
		end

feature -- Eiffel system

	ecf_filename: detachable STRING_8
			-- Name of ECF file

	config_ecf_filename: detachable STRING_8
			-- Name of ECF file specified in the workspace config, if any

	config_ecf_target: detachable STRING_8
			-- Name of ECF target specified in the workspace config, if any

	eiffel_system: detachable ET_SYSTEM
			-- Eiffel system

	system_processor: ET_SYSTEM_PROCESSOR
			-- Eiffel system processor

	class_mapping: DS_HASH_TABLE [ET_CLASS, STRING_8]
			-- Eiffel classes indexed by filenames

	edited_classes: DS_HASH_TABLE [ET_EDITED_CLASS_TEXT_GROUP, STRING_8]
			-- Text of Eiffel classes currently edited in the client, indexed by filenames

	ecf_libraries: DS_HASH_TABLE [ET_ECF_INTERNAL_UNIVERSE, STRING_8]
			-- ECF libraries indexed by ECF filenames

	diagnostics: DS_HASH_TABLE [LS_DIAGNOSTIC_LIST, STRING_8]
			-- Diagnostics, indexed by filenames

	class_from_uri (a_uri: LS_URI): detachable ET_CLASS
			-- Eiffel class in file corresponding to `a_uri`, if any
		require
			a_uri_not_void: a_uri /= Void
		do
			if attached pathname_from_uri (a_uri) as l_filename then
				Result := class_mapping.value (l_filename)
			end
		end

	pathname_from_uri (a_uri: LS_URI): detachable STRING_8
			-- Eiffel class in file corresponding to `a_uri`, if any
		require
			a_uri_not_void: a_uri /= Void
		local
			l_uri: UT_URI
		do
			create l_uri.make (a_uri.to_string.utf8_value)
			Result := {UT_FILE_URI_ROUTINES}.uri_to_filename (l_uri)
		end

	ise_version: UT_VERSION
			-- ISE version, whose semantics should be
			-- used by the Eiffel code analysis process

	override_settings: detachable ET_ECF_SETTINGS
			-- Settings overriding those specified for the selected ECF target

	override_capabilities: detachable ET_ECF_CAPABILITIES
			-- Capabilities overriding those specified for the selected ECF target

	override_variables: detachable ET_ECF_VARIABLES
			-- Variables overriding those specified for the selected ECF target

	thread_count: INTEGER
			-- Number of threads to be used
		local
			l_option_value: detachable INTEGER_REF
		do
			if thread_option.was_found then
				l_option_value := thread_option.parameter
			end
			Result := thread_count_from_cli_value (l_option_value)
		ensure
			thread_count_not_negative: Result >= 1
		end

	full_compilation_count: INTEGER
			-- Number of compilations from scratch

	incremental_compilation_count: INTEGER
			-- Number of incremental compilations since the last compilation from scratch

	total_compilation_count: INTEGER
			-- Total number of compilations

	max_full_compilation_count: INTEGER = 1
			-- Maximum number of compilations from scratch before exiting

	max_total_compilation_count: INTEGER = 500
			-- Maximum number of compilations before exiting

feature -- Helper

	position (a_position: ET_POSITION; a_class: ET_CLASS): LS_POSITION
			-- LSP position corresponding to `a_position` in `a_class`
		require
			a_position_not_void: a_position /= Void
			a_class_no_void: a_class /= Void
		do
			create Result.make ((a_position.line - 1).max (0).to_natural_32, (a_position.column - 1).max (0).to_natural_32)
		ensure
			position_not_void: Result /= Void
		end

	range (a_node: ET_AST_NODE; a_class: ET_CLASS): LS_RANGE
			-- LSP range corresponding to `a_node` in `a_class`
		require
			a_node_not_void: a_node /= Void
			a_class_no_void: a_class /= Void
		local
			l_first_position: ET_POSITION
			l_last_position: ET_POSITION
			l_last_position_plus_one: ET_COMPRESSED_POSITION
		do
			l_first_position := a_node.first_position
			l_last_position := a_node.last_position
			if l_first_position.is_null then
				l_first_position := l_last_position
			elseif l_last_position.is_null then
				l_last_position := l_first_position
			end
			create l_last_position_plus_one.make (l_last_position.line, l_last_position.column + 1)
			create Result.make (position (l_first_position, a_class), position (l_last_position_plus_one, a_class))
		ensure
			range_not_void: Result /= Void
		end

	location (a_node: ET_AST_NODE; a_class: ET_CLASS): detachable LS_LOCATION
			-- LSP location corresponding to `a_node` in `a_class`
		require
			a_node_not_void: a_node /= Void
			a_class_no_void: a_class /= Void
		local
			l_uri: UT_URI
			l_string: LS_STRING
		do
			if attached a_class.filename as l_filename then
				l_uri := {UT_FILE_URI_ROUTINES}.filename_to_uri (l_filename)
				create l_string.make_from_string (l_uri.full_reference)
				create Result.make (l_string, range (a_node, a_class))
			end
		end

feature -- Argument parsing

	setting_option: AP_STRING_OPTION
			-- Option for '--setting=name=value'

	capability_option: AP_STRING_OPTION
			-- Option for '--capability=name=value'

	variable_option: AP_STRING_OPTION
			-- Option for '--variable=FOO=BAR'

	ise_option: AP_STRING_OPTION
			-- Option for '--ise=major[.minor[.revision[.build]]]'

	thread_option: AP_INTEGER_OPTION
			-- Option for '--thread=<thread_count>'

	add_other_options (a_parser: AP_PARSER)
			-- Add other command-line options.
		do
				-- setting.
			create setting_option.make_with_long_form ("setting")
			setting_option.set_description ("Override settings defined in ECF file.")
			setting_option.set_parameter_description ("name=value")
			a_parser.options.force_last (setting_option)
				-- capability.
			create capability_option.make_with_long_form ("capability")
			capability_option.set_description ("Override capability usage defined in ECF file.")
			capability_option.set_parameter_description ("name=value")
			a_parser.options.force_last (capability_option)
				-- variable.
			create variable_option.make_with_long_form ("variable")
			variable_option.set_description ("Override variables defined in ECF file.")
			variable_option.set_parameter_description ("NAME=VALUE")
			a_parser.options.force_last (variable_option)
				-- ise.
			create ise_option.make_with_long_form ("ise")
			ise_option.set_description ("Version of Eiffel whose semantics should be used during code analysis. (default: latest version)")
			ise_option.set_parameter_description ("major[.minor[.revision[.build]]]")
			ise_option.set_default_parameter (ise_latest.out)
			a_parser.options.force_last (ise_option)
				-- thread
			create thread_option.make_with_long_form ("thread")
			thread_option.set_description ("Number of threads to be used. Negative numbers -N mean %"number of CPUs - N%". (default: -3)")
			thread_option.set_parameter_description ("thread_count")
			if {PLATFORM}.is_thread_capable then
				a_parser.options.force_last (thread_option)
			end
		end

	process_other_options (a_parser: AP_PARSER)
			-- Process other command-line options
			-- after they have been parsed.
		do
			set_ise_version (ise_option, a_parser)
			set_override_settings (setting_option, a_parser)
			set_override_capabilities (capability_option, a_parser)
			set_override_variables (variable_option, a_parser)
			set_system_processor
		end

	set_ise_version (a_option: like ise_option; a_parser: AP_PARSER)
			-- Set `ise_version' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_ise_regexp: RX_PCRE_REGULAR_EXPRESSION
			l_ise_version: detachable UT_VERSION
		do
			l_ise_version := ise_latest
			if not attached a_option.parameter as l_parameter then
				report_usage_message (a_parser)
				Exceptions.die (1)
			elseif not STRING_.same_string (l_parameter, ise_latest.out) then
				create l_ise_regexp.make
				l_ise_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_ise_regexp.recognizes (l_parameter) then
					inspect l_ise_regexp.match_count
					when 2 then
						create l_ise_version.make_major (l_ise_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_ise_version.make_major_minor (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, 0)
					when 8 then
						create l_ise_version.make (l_ise_regexp.captured_substring (1).to_integer, l_ise_regexp.captured_substring (3).to_integer, l_ise_regexp.captured_substring (5).to_integer, l_ise_regexp.captured_substring (7).to_integer)
					else
						report_usage_message (a_parser)
						Exceptions.die (1)
					end
				else
					report_usage_message (a_parser)
					Exceptions.die (1)
				end
			end
			ise_version := l_ise_version
		end

	set_override_settings (a_option: like setting_option; a_parser: AP_PARSER)
			-- Set `override_settings' with information passed in `a_option'.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		do
			override_settings := settings_from_cli_value (a_option.parameters, False)
		end

	set_override_capabilities (a_option: like capability_option; a_parser: AP_PARSER)
			-- Set `override_capabilities' with information passed in `a_option'.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		do
			override_capabilities := capabilities_from_cli_value (a_option.parameters)
		end

	set_override_variables (a_option: like variable_option; a_parser: AP_PARSER)
			-- Set `override_variables' with information passed in `a_option'.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		do
			override_variables :=  variables_from_cli_value (a_option.parameters, True, False)
		end

	set_system_processor
			-- Set system processor.
		do
			system_processor := {ET_SYSTEM_PROCESSOR_FACTORY}.new_system_processor (thread_count)
			system_processor.set_benchmark_shown (debug_mode)
			system_processor.set_nested_benchmark_shown (False)
			system_processor.set_metrics_shown (False)
			system_processor.set_ise_version (ise_version)
			system_processor.set_unknown_builtin_reported (False)
			system_processor.set_preparse_shallow_mode
				-- Parse again classes even when they are in read-only clusters.
			system_processor.set_preparse_readonly_mode (True)
			system_processor.set_providers_enabled (True)
			system_processor.set_suppliers_enabled (True)
			system_processor.set_cluster_dependence_enabled (False)
			system_processor.set_flat_mode (False)
			system_processor.set_flat_dbc_mode (False)
			configure_error_handler
			configure_ast_factory
		end

	configure_ast_factory
			-- Configure the AST factory as needed.
		local
			l_ast_factory: ET_DECORATED_AST_FACTORY
		do
			create l_ast_factory.make
			l_ast_factory.set_keep_header_comments (True)
			system_processor.set_ast_factory (l_ast_factory)
		end

	configure_error_handler
			-- Configure `error_handler`.
		do
			if debug_mode then
				error_handler.set_info_file (std.error)
				error_handler.set_warning_file (std.error)
				error_handler.set_error_file (std.error)
				error_handler.set_keep_default_actions (True)
			else
				error_handler.set_info_null
				error_handler.set_warning_null
				error_handler.set_error_null
			end
			error_handler.set_ise
			error_handler.set_verbose (False)
			system_processor.set_error_handler (error_handler)
		end

feature -- Error handling

	error_handler: ET_AGENT_ERROR_HANDLER
			-- Error handler

	report_cannot_read_error (a_filename: STRING)
			-- Report that `a_filename` cannot be
			-- opened in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_CANNOT_READ_FILE_ERROR
		do
			create l_error.make (a_filename)
			report_error (l_error)
		end

	report_no_system_found_error (a_filename: STRING)
			-- Report that no Eiffel system was found in file `a_filename`.
		require
			a_filename_not_void: a_filename /= Void
		local
			l_error: UT_MESSAGE
		do
			create l_error.make ("No Eiffel system found in file '" + a_filename + "'.")
			report_error (l_error)
		end

invariant

	system_processor_not_void: system_processor /= Void
	class_mapping_not_void: class_mapping /= Void
	no_void_mapped_class: not class_mapping.has_void_item
	no_void_mapped_class_filename: not class_mapping.has_void
	edited_classes_not_void: edited_classes /= Void
	no_void_edited_class: not edited_classes.has_void_item
	no_void_edited_class_filename: not edited_classes.has_void
	ecf_libraries_not_void: ecf_libraries /= Void
	no_void_ecf_library: not ecf_libraries.has_void_item
	no_void_ecf_library_filename: not ecf_libraries.has_void
	ise_version_not_void: ise_version /= Void
	setting_option_not_void: setting_option /= Void
	capability_option_not_void: capability_option /= Void
	variable_option_not_void: variable_option /= Void
	ise_option_not_void: ise_option /= Void
	thread_option_not_void: thread_option /= Void

end
