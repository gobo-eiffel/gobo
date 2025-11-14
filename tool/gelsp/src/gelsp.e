note

	description:

		"Gobo Eiffel Language Server, using protocol LSP."

	copyright: "Copyright (c) 2025, Eric Bezault and others"
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
			hover_request_handler,
			on_did_change_watched_files_notification,
			on_file_system_watchers_registered,
			on_hover_request,
			on_initialized_notification,
			add_other_options,
			process_other_options,
			error_handler
		end

	GELSP_VERSION

	KL_SHARED_EXECUTION_ENVIRONMENT
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
				-- Set environment variables "$GOBO", "$GOBO_LIBRARY",
				-- "$BOEHM_GC" and "$ZIG" if not set yet.
			gobo_variables.set_gobo_variables
				-- For compatibility with ISE's tools, define the environment
				-- variables "$ISE_LIBRARY", "$EIFFEL_LIBRARY", "$ISE_PLATFORM"
				-- and "$ISE_C_COMPILER" if not set yet.
			ise_variables.set_ise_variables
			precursor (a_connection)
		end

feature -- Access

	server_name: STRING_8 = "gelsp"
			-- Server name

	server_description: STRING_8 = "Gobo Eiffel LSP, Language Server for Eiffel."
			-- Server description

feature -- Handling 'workspace/didChangeWatchedFiles' notifications

	on_did_change_watched_files_notification (a_notification: LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION)
			-- Handle 'workspace/didChangeWatchedFiles' notification `a_notification`.
			-- Actions to be executed when watched files are changed.
		local
			l_changes: LS_FILE_EVENT_LIST
			l_file_event: LS_FILE_EVENT
			i, nb: INTEGER
			l_incremental: BOOLEAN
			l_master_class: ET_MASTER_CLASS
			l_no_action: BOOLEAN
			l_deleted_class: ET_CLASS
		do
			l_incremental := True
			l_no_action := True
			l_changes := a_notification.changes
			nb := l_changes.count
			from i := 1 until i > nb loop
				l_file_event := l_changes.file_event (i)
				if not attached pathname_from_uri (l_file_event.uri) as l_pathname then
						-- Rebuild from scratch, just in case we missed something.
					l_no_action := False
					l_incremental := False
					i := nb + 1 -- Jump out of the loop.
				elseif file_system.has_extension (l_pathname, {KL_FILE_SYSTEM}.ecf_extension) then
					l_no_action := False
					l_incremental := False
					i := nb + 1 -- Jump out of the loop.
				elseif not file_system.has_extension (l_pathname, {KL_FILE_SYSTEM}.eiffel_extension) then
						-- Look for deleted folders containing Eiffel classes.
					if l_file_event.type.value = {LS_FILE_CHANGE_TYPES}.deleted.value then
						from class_mapping.start until class_mapping.after loop
							if class_mapping.key_for_iteration.starts_with (l_pathname) then
								l_no_action := False
								l_deleted_class := class_mapping.item_for_iteration
								l_master_class := l_deleted_class.master_class_in_universe
								l_master_class.reset_local_modified_class (l_deleted_class, system_processor)
								l_master_class.remove_unknown_local_classes
							end
							class_mapping.forth
						end
					end
					i := i + 1
				elseif l_file_event.type.value = {LS_FILE_CHANGE_TYPES}.created.value then
					l_no_action := False
					l_incremental := False
					i := nb + 1 -- Jump out of the loop.
				elseif not attached class_mapping.value (l_pathname) as l_class then
					l_no_action := False
					l_incremental := False
					i := nb + 1 -- Jump out of the loop.
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
				refresh_eiffel_system
			else
				set_system_processor
				build_eiffel_system
			end
		end

	on_file_system_watchers_registered (a_watchers: LS_FILE_SYSTEM_WATCHER_LIST; a_registration: LS_REGISTRATION; a_response: LS_RESPONSE)
			-- Action to be executed when the client registered file system watchers.
		do
			build_eiffel_system
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
				if not l_class.implementation_checked then
					l_class.process (system_processor.implementation_checker)
				end
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
						a_response.set_markdown_utf8 (l_text, Current)
					else
						create l_text.make (50)
						l_last_browsable_name.append_description_to_string (l_text)
						if hover_request_handler.is_plaintext_supported then
							a_response.set_plaintext_utf8 (l_text, Current)
						else
							a_response.set_string_utf8 (l_text, Current)
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

feature -- Handling 'initialized' notification

	on_initialized_notification (a_notification: LS_INITIALIZED_NOTIFICATION)
			-- Handle 'initialized' notification `a_notification`.
		do
			register_file_system_watchers (<<["**/*.{ecf}", {LS_WATCH_KINDS}.create_ | {LS_WATCH_KINDS}.change], ["**/*", {LS_WATCH_KINDS}.delete]>>)
		end

feature {NONE} -- Eiffel processing

	build_eiffel_system
			-- Build Eiffel system from scratch (equivalent of Degrees 6 to 3).
			-- Build class filename mapping.
		local
			l_file: KL_TEXT_INPUT_FILE
			dt1: detachable DT_DATE_TIME
		do
			if debug_mode then
				dt1 := system_processor.benchmark_start_time
			end
			reset
			find_ecf_filename
			if attached ecf_filename as l_ecf_filename then
				create l_file.make (l_ecf_filename)
				l_file.open_read
				if l_file.is_open_read then
					parse_ecf_file (l_file)
					l_file.close
				else
					report_cannot_read_error (l_ecf_filename)
				end
			end
			if attached eiffel_system as l_system then
				system_processor.compile_all (l_system)
				build_class_mapping (l_system)
				if debug_mode then
					std.error.put_line ("Class count: " + class_mapping.count.out)
				end
			end
			if dt1 /= Void then
				system_processor.record_end_time (dt1, "Total Time")
			end
		end

	refresh_eiffel_system
			-- Refresh Eiffel system after a class has been modified.
		local
			dt1: detachable DT_DATE_TIME
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			if debug_mode then
				dt1 := system_processor.benchmark_start_time
			end
			if attached eiffel_system as l_system then
				l_system.reset_classes_incremental_recursive (system_processor)
				create l_classes.make (l_system.class_count_recursive)
				l_system.classes_do_recursive (agent l_classes.force_last)
				system_processor.compile_classes (l_classes)
				build_class_mapping (l_system)
			end
			if dt1 /= Void then
				system_processor.record_end_time (dt1, "Total Time")
			end
		end

	reset
			-- Reset Eiffel processing.
		do
			ecf_filename := Void
			eiffel_system := Void
			class_mapping.wipe_out
		end

	find_ecf_filename
			-- Find the ECF filename for the current workspace.
			-- Make the result available in `ecf_filename`.
		local
			l_filename: STRING_8
			l_uri: UT_URI
		do
			ecf_filename := Void
			if attached {LS_WORKSPACE_FOLDER_LIST} workspace_folders as l_workspace_folders and then l_workspace_folders.count > 0 then
				create l_uri.make (l_workspace_folders.workspace_folder (1).uri.to_string.utf8_value)
				if attached {UT_FILE_URI_ROUTINES}.uri_to_filename (l_uri) as l_root_path then
					l_filename := file_system.pathname (l_root_path, "lsp.ecf")
					if file_system.file_exists (l_filename) then
						ecf_filename := l_filename
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
		do
			eiffel_system := Void
			create l_ecf_error_handler.make_standard
			l_ecf_error_handler.set_info_file (std.error)
			create l_ecf_parser.make (l_ecf_error_handler)
			l_ecf_parser.set_ise_version (ise_version)
			l_ecf_parser.set_override_settings (override_settings)
			l_ecf_parser.set_override_capabilities (override_capabilities)
			l_ecf_parser.set_override_variables (override_variables)
			l_ecf_parser.parse_file (a_file, Void)
			if l_ecf_error_handler.has_error then
				-- Error already reported.
			elseif not attached l_ecf_parser.last_system as l_last_system then
				report_no_system_found_error (a_file.name)
			else
				eiffel_system := l_last_system
			end
		end

	build_class_mapping (a_system: ET_SYSTEM)
			-- Build `class_mapping` with the classes found in `a_system`.
		require
			a_system_not_void: a_system /= Void
		do
			class_mapping.wipe_out
			a_system.classes_do_recursive (
				agent (a_class: ET_CLASS)
					do
						if attached a_class.filename as l_filename then
							class_mapping.force_last (a_class, l_filename)
						end
					end)
		end

feature -- Eiffel system

	ecf_filename: detachable STRING_8
			-- Name of ECF file

	eiffel_system: detachable ET_SYSTEM
			-- Eiffel system

	system_processor: ET_SYSTEM_PROCESSOR
			-- Eiffel system processor

	class_mapping: DS_HASH_TABLE [ET_CLASS, STRING_8]
			-- Eiffel classes indexed by filenames

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
		do
			Result := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32 - 3
			if thread_option.was_found then
				Result := thread_option.parameter
				if Result <= 0 then
					Result := {EXECUTION_ENVIRONMENT}.available_cpu_count.as_integer_32 + Result
				end
			end
			if Result < 1 or not {PLATFORM}.is_thread_capable then
				Result := 1
			end
		ensure
			thread_count_not_negative: Result >= 1
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
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_override_settings: detachable ET_ECF_SETTINGS
		do
			if not a_option.parameters.is_empty then
				create l_override_settings.make
				l_override_settings.set_primary_values_from_definitions (a_option.parameters)
			end
			override_settings := l_override_settings
		end

	set_override_capabilities (a_option: like capability_option; a_parser: AP_PARSER)
			-- Set `override_capabilities' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_override_capabilities: detachable ET_ECF_CAPABILITIES
		do
			if not a_option.parameters.is_empty then
				create l_override_capabilities.make
				l_override_capabilities.set_primary_use_values_from_definitions (a_option.parameters)
			end
			override_capabilities := l_override_capabilities
		end

	set_override_variables (a_option: like variable_option; a_parser: AP_PARSER)
			-- Set `override_variables' with information passed in `a_option'.
			-- Report usage message and exit in case of invalid input.
		require
			a_option_not_void: a_option /= Void
			a_parser_not_void: a_parser /= Void
		local
			l_override_variables: ET_ECF_VARIABLES
			l_definition: STRING
			l_index: INTEGER
		do
			create l_override_variables.make
			l_override_variables.set_primary_value ("GOBO_EIFFEL", "ge")
			Execution_environment.set_variable_value ("GOBO_EIFFEL", "ge")
			if not a_option.parameters.is_empty then
				across a_option.parameters as i_variable loop
					if attached i_variable as l_variable then
						l_definition := l_variable
						if l_definition.count > 0 then
							l_index := l_definition.index_of ('=', 1)
							if l_index = 0 then
								l_override_variables.set_primary_value (l_definition, "")
							elseif l_index = l_definition.count then
								l_override_variables.set_primary_value (l_definition.substring (1, l_index - 1), "")
							elseif l_index /= 1 then
								l_override_variables.set_primary_value (l_definition.substring (1, l_index - 1), l_definition.substring (l_index + 1, l_definition.count))
							end
						end
					end
				end
			end
			override_variables := l_override_variables
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

	error_handler: ET_ERROR_HANDLER
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
	ise_version_not_void: ise_version /= Void
	setting_option_not_void: setting_option /= Void
	capability_option_not_void: capability_option /= Void
	variable_option_not_void: variable_option /= Void
	ise_option_not_void: ise_option /= Void
	thread_option_not_void: thread_option /= Void

end
