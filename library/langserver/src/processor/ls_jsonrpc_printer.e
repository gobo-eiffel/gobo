note

	description:

		"LSP JSON-RPC version 2.0 printer"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_JSONRPC_PRINTER

inherit

	LS_PROCESSOR
		redefine
			make
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new processor.
		do
			utf8_string := ""
		end

feature -- Access

	utf8_string: STRING_8
			-- String where the JSON-RPC version of the values will be printed

	jsonrpc_version: STRING_8 = "2.0"
			-- JSON-RPC version

feature -- Setting

	set_utf8_string (a_utf8_string: STRING_8)
			-- Set `utf8_string` to `a_utf8_string`.
		require
			a_utf8_string_not_void: a_utf8_string /= Void
			a_utf8_string_is_string_8: a_utf8_string.same_type ({STRING_8} "")
			valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (a_utf8_string)
		do
			utf8_string := a_utf8_string
		ensure
			utf8_string_set: utf8_string = a_utf8_string
		end

feature {LS_ANY} -- Processing

	process_annotated_text_edit (a_value: LS_ANNOTATED_TEXT_EDIT)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_ANNOTATED_TEXT_EDIT}.range_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.range.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_ANNOTATED_TEXT_EDIT}.new_text_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.new_text.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_ANNOTATED_TEXT_EDIT}.annotation_id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.annotation_id.process (Current)
			utf8_string.append_character ('}')
		end

	process_application_info (a_value: LS_APPLICATION_INFO)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_APPLICATION_INFO}.name_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.name.process (Current)
			if attached a_value.version as l_version then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_APPLICATION_INFO}.version_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_version.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_array (a_value: LS_ARRAY)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.values.item (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_boolean (a_value: LS_BOOLEAN)
			-- Process `a_value`.
		do
			if a_value.value then
				utf8_string.append_string ({LS_BOOLEAN}.true_value)
			else
				utf8_string.append_string ({LS_BOOLEAN}.false_value)
			end
		end

	process_cancel_params (a_value: LS_CANCEL_PARAMS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_CANCEL_PARAMS}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character ('}')
		end

	process_cancel_request_notification (a_value: LS_CANCEL_REQUEST_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_CANCEL_REQUEST_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_CANCEL_REQUEST_NOTIFICATION}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_cancel_params (a_value)
			utf8_string.append_character ('}')
		end

	process_change_annotation (a_value: LS_CHANGE_ANNOTATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_CHANGE_ANNOTATION}.label_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.label.process (Current)
			if attached a_value.needs_confirmation as l_needs_confirmation then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_CHANGE_ANNOTATION}.needs_confirmation_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_needs_confirmation.process (Current)
			end
			if attached a_value.description as l_description then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_CHANGE_ANNOTATION}.description_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_description.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_client_all_capabilities (a_value: LS_CLIENT_ALL_CAPABILITIES)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			if attached a_value.text_document as l_text_document then
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_CLIENT_ALL_CAPABILITIES}.text_document_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_text_document.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_code_description (a_value: LS_CODE_DESCRIPTION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_CODE_DESCRIPTION}.href_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.href.process (Current)
			utf8_string.append_character ('}')
		end

	process_comma_if_not_first
			-- Append a comma to `utf8_string` if not preceded by '{'.
		do
			if not utf8_string.is_empty and then utf8_string.item (utf8_string.count) /= '{' then
				utf8_string.append_character (',')
			end
		end

	process_command (a_value: LS_COMMAND)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_COMMAND}.title_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.title.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_COMMAND}.command_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.command.process (Current)
			if attached a_value.arguments as l_arguments then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_COMMAND}.arguments_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_arguments.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_diagnostic (a_value: LS_DIAGNOSTIC)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_DIAGNOSTIC}.range_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.range.process (Current)
			if attached a_value.severity as l_severity then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.severity_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_severity.process (Current)
			end
			if attached a_value.code as l_code then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.code_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_code.process (Current)
			end
			if attached a_value.code_description as l_code_description then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.code_description_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_code_description.process (Current)
			end
			if attached a_value.source as l_source then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.source_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_source.process (Current)
			end
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_DIAGNOSTIC}.message_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.message.process (Current)
			if attached a_value.tags as l_tags then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.tags_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_tags.process (Current)
			end
			if attached a_value.related_information as l_related_information then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.related_information_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_related_information.process (Current)
			end
			if attached a_value.data as l_data then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DIAGNOSTIC}.data_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_data.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_diagnostic_related_information (a_value: LS_DIAGNOSTIC_RELATED_INFORMATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_DIAGNOSTIC_RELATED_INFORMATION}.location_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.location.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_DIAGNOSTIC_RELATED_INFORMATION}.message_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.message.process (Current)
			utf8_string.append_character ('}')
		end

	process_diagnostic_related_information_list (a_value: LS_DIAGNOSTIC_RELATED_INFORMATION_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.diagnostic_related_information (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_diagnostic_tag_list (a_value: LS_DIAGNOSTIC_TAG_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.diagnostic_tag (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_document_filter (a_value: LS_DOCUMENT_FILTER)
			-- Process `a_value`.
		local
			l_comma_needed: BOOLEAN
		do
			utf8_string.append_character ('{')
			if attached a_value.language as l_language then
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DOCUMENT_FILTER}.language_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_language.process (Current)
				l_comma_needed := True
			end
			if attached a_value.scheme as l_scheme then
				if l_comma_needed then
					utf8_string.append_character (',')
				end
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DOCUMENT_FILTER}.scheme_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_scheme.process (Current)
				l_comma_needed := True
			end
			if attached a_value.pattern as l_pattern then
				if l_comma_needed then
					utf8_string.append_character (',')
				end
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DOCUMENT_FILTER}.pattern_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_pattern.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_document_selector (a_value: LS_DOCUMENT_SELECTOR)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.document_filter (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_dynamic_registration_capabilities (a_value: LS_DYNAMIC_REGISTRATION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			if attached a_value.dynamic_registration as l_dynamic_registration then
				process_comma_if_not_first
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_DYNAMIC_REGISTRATION_CAPABILITIES}.dynamic_registration_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_dynamic_registration.process (Current)
			end
		end

	process_exit_notification (a_value: LS_EXIT_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_EXIT_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character ('}')
		end

	process_handled_message (a_value: LS_HANDLED_MESSAGE)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_HANDLED_MESSAGE}.response_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.response.process (Current)
			utf8_string.append_character ('}')
		end

	process_hover_capabilities (a_value: LS_HOVER_CAPABILITIES)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_dynamic_registration_capabilities (a_value)
			if attached a_value.content_format as l_content_format then
				process_comma_if_not_first
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_HOVER_CAPABILITIES}.content_format_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_content_format.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_hover_options (a_value: LS_HOVER_OPTIONS)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_work_done_progress_options (a_value)
			utf8_string.append_character ('}')
		end

	process_hover_params (a_value: LS_HOVER_PARAMS)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_text_document_location_params (a_value)
			process_work_done_progress_params (a_value)
			utf8_string.append_character ('}')
		end

	process_hover_registration_options (a_value: LS_HOVER_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_text_document_registration_options (a_value)
			process_work_done_progress_options (a_value)
			utf8_string.append_character ('}')
		end

	process_hover_request (a_value: LS_HOVER_REQUEST)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_HOVER_REQUEST}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_HOVER_REQUEST}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_HOVER_REQUEST}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_hover_params (a_value)
			utf8_string.append_character ('}')
		end

	process_hover_result (a_value: LS_HOVER_RESULT)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_HOVER_RESULT}.contents_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.contents.process (Current)
			utf8_string.append_character ('}')
		end

	process_initialize_error (a_value: LS_INITIALIZE_ERROR)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_ERROR}.retry_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.retry_.process (Current)
			utf8_string.append_character ('}')
		end

	process_initialize_params (a_value: LS_INITIALIZE_PARAMS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_PARAMS}.process_id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.process_id.process (Current)
			if attached a_value.client_info as l_client_info then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_INITIALIZE_PARAMS}.client_info_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_client_info.process (Current)
			end
			if attached a_value.locale as l_locale then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_INITIALIZE_PARAMS}.locale_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_locale.process (Current)
			end
			if attached a_value.root_path as l_root_path then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_INITIALIZE_PARAMS}.root_path_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_root_path.process (Current)
			end
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_PARAMS}.root_uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.root_uri.process (Current)
			if attached a_value.workspace_folders as l_workspace_folders then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_INITIALIZE_PARAMS}.workspace_folders_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_workspace_folders.process (Current)
			end
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_PARAMS}.capabilities_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.capabilities.process (Current)
			if attached a_value.trace as l_trace then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_INITIALIZE_PARAMS}.trace_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_trace.process (Current)
			end
			if attached a_value.initialization_options as l_initialization_options then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_INITIALIZE_PARAMS}.initialization_options_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_initialization_options.process (Current)
			end
			process_work_done_progress_params (a_value)
			utf8_string.append_character ('}')
		end

	process_initialize_request (a_value: LS_INITIALIZE_REQUEST)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_REQUEST}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_REQUEST}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_REQUEST}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_initialize_params (a_value)
			utf8_string.append_character ('}')
		end

	process_initialize_result (a_value: LS_INITIALIZE_RESULT)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZE_RESULT}.capabilities_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.capabilities.process (Current)
			utf8_string.append_character ('}')
		end

	process_initialized_notification (a_value: LS_INITIALIZED_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZED_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INITIALIZED_NOTIFICATION}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			utf8_string.append_character ('{')
			utf8_string.append_character ('}')
			utf8_string.append_character ('}')
		end

	process_integer (a_value: LS_INTEGER)
			-- Process `a_value`.
		do
			utf8_string.append_integer (a_value.value)
		end

	process_invalid_notification (a_value: LS_INVALID_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INVALID_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INVALID_NOTIFICATION}.notification_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.notification.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_INVALID_NOTIFICATION}.error_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.error.process (Current)
			utf8_string.append_character ('}')
		end

	process_jsonrpc_version
			-- Append jsonrpc version to `utf8_string`.
		do
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_MESSAGE}.jsonrpc_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			utf8_string.append_character ('"')
			utf8_string.append_string (jsonrpc_version)
			utf8_string.append_character ('"')
		end

	process_location (a_value: LS_LOCATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOCATION}.uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.uri.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOCATION}.range_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.range.process (Current)
			utf8_string.append_character ('}')
		end

	process_location_link (a_value: LS_LOCATION_LINK)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			if attached a_value.origin_selection_range as l_origin_selection_range then
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_LOCATION_LINK}.origin_selection_range_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_origin_selection_range.process (Current)
				utf8_string.append_character (',')
			end
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOCATION_LINK}.target_uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.target_uri.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOCATION_LINK}.target_range_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.target_range.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOCATION_LINK}.target_selection_range_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.target_selection_range.process (Current)
			utf8_string.append_character ('}')
		end

	process_log_trace_notification (a_value: LS_LOG_TRACE_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOG_TRACE_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOG_TRACE_NOTIFICATION}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_log_trace_params (a_value)
			utf8_string.append_character ('}')
		end

	process_log_trace_params (a_value: LS_LOG_TRACE_PARAMS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_LOG_TRACE_PARAMS}.message_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.message.process (Current)
			if attached a_value.verbose as l_verbose then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_LOG_TRACE_PARAMS}.verbose_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_verbose.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_markup_content (a_value: LS_MARKUP_CONTENT)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_MARKUP_CONTENT}.kind_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.kind.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_MARKUP_CONTENT}.value_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.value.process (Current)
			utf8_string.append_character ('}')
		end

	process_markup_kind_list (a_value: LS_MARKUP_KIND_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.markup_kind (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_null (a_value: LS_NULL)
			-- Process `a_value`.
		do
			utf8_string.append_string ({LS_NULL}.null_value)
		end

	process_number (a_value: LS_NUMBER)
			-- Process `a_value`.
		do
			utf8_string.append_string (a_value.literal)
		end

	process_object (a_value: LS_OBJECT)
			-- Process `a_value`.
		local
			l_first: BOOLEAN
			l_cursor: DS_HASH_TABLE_CURSOR [LS_ANY, LS_STRING]
		do
			utf8_string.append_character ('{')
			l_first := True
			l_cursor := a_value.values.new_cursor
			from l_cursor.start until l_cursor.after loop
				if not l_first then
					utf8_string.append_character (',')
				else
					l_first := False
				end
				l_cursor.key.process (Current)
				utf8_string.append_character (':')
				l_cursor.item.process (Current)
				l_cursor.forth
			end
			utf8_string.append_character ('}')
		end

	process_optional_versioned_text_document_identifier (a_value: LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.uri.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.version_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.version.process (Current)
			utf8_string.append_character ('}')
		end

	process_position (a_value: LS_POSITION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_POSITION}.line_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.line.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_POSITION}.character_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.character.process (Current)
			utf8_string.append_character ('}')
		end

	process_progress_notification (a_value: LS_PROGRESS_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_PROGRESS_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_PROGRESS_NOTIFICATION}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_PROGRESS_NOTIFICATION}.token_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.token.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_PROGRESS_NOTIFICATION}.value_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.value.process (Current)
			utf8_string.append_character ('}')
			utf8_string.append_character ('}')
		end

	process_range (a_value: LS_RANGE)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_RANGE}.start_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.start.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_RANGE}.end_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.end_.process (Current)
			utf8_string.append_character ('}')
		end

	process_register_capability_request (a_value: LS_REGISTER_CAPABILITY_REQUEST)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_REGISTER_CAPABILITY_REQUEST}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_REGISTER_CAPABILITY_REQUEST}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_REGISTER_CAPABILITY_REQUEST}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_registration_params (a_value)
			utf8_string.append_character ('}')
		end

	process_registration (a_value: LS_REGISTRATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_REGISTRATION}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_REGISTRATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			if attached a_value.register_options as l_register_options then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_REGISTRATION}.register_options_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_register_options.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_registration_list (a_value: LS_REGISTRATION_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.registration (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_registration_params (a_value: LS_REGISTRATION_PARAMS)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_REGISTRATION_PARAMS}.registrations_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.registrations.process (Current)
			utf8_string.append_character ('}')
		end

	process_response (a_value: LS_RESPONSE)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_RESPONSE}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			if attached a_value.result_ as l_result then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_RESPONSE}.result_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_result.process (Current)
			elseif attached a_value.error as l_error then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_RESPONSE}.error_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_error.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_response_error (a_value: LS_RESPONSE_ERROR)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_RESPONSE_ERROR}.code_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.code.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_RESPONSE_ERROR}.message_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.message.process (Current)
			if attached a_value.data as l_data then
				utf8_string.append_character (',')
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_RESPONSE_ERROR}.data_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_data.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_server_capabilities (a_value: LS_SERVER_CAPABILITIES)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			if attached a_value.hover_provider as l_hover_provider then
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_SERVER_CAPABILITIES}.hover_provider_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_hover_provider.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_set_trace_notification (a_value: LS_SET_TRACE_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_SET_TRACE_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_SET_TRACE_NOTIFICATION}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_set_trace_params (a_value)
			utf8_string.append_character ('}')
		end

	process_set_trace_params (a_value: LS_SET_TRACE_PARAMS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_SET_TRACE_PARAMS}.value_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.value.process (Current)
			utf8_string.append_character ('}')
		end

	process_shutdown_request (a_value: LS_SHUTDOWN_REQUEST)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_SHUTDOWN_REQUEST}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_SHUTDOWN_REQUEST}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character ('}')
		end

	process_string (a_value: LS_STRING)
			-- Process `a_value`.
		do
			utf8_string.append_character ('"')
			a_value.append_escaped_to_utf8 (utf8_string)
			utf8_string.append_character ('"')
		end

	process_text_document_capabilities (a_value: LS_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			if attached a_value.hover as l_hover then
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_TEXT_DOCUMENT_CAPABILITIES}.hover_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_hover.process (Current)
			end
			utf8_string.append_character ('}')
		end

	process_text_document_edit (a_value: LS_TEXT_DOCUMENT_EDIT)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_EDIT}.text_document_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.text_document.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_EDIT}.edits_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.edits.process (Current)
			utf8_string.append_character ('}')
		end

	process_text_document_identifier (a_value: LS_TEXT_DOCUMENT_IDENTIFIER)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_IDENTIFIER}.uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.uri.process (Current)
			utf8_string.append_character ('}')
		end

	process_text_document_item (a_value: LS_TEXT_DOCUMENT_ITEM)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_ITEM}.uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.uri.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_ITEM}.language_id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.language_id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_ITEM}.version_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.version.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_ITEM}.text_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.text.process (Current)
			utf8_string.append_character ('}')
		end

	process_text_document_location_params (a_value: LS_TEXT_DOCUMENT_POSITION_PARAMS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			process_comma_if_not_first
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_POSITION_PARAMS}.text_document_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.text_document.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_POSITION_PARAMS}.position_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.position.process (Current)
		end

	process_text_document_registration_options (a_value: LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			process_comma_if_not_first
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS}.document_selector_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.document_selector.process (Current)
		end

	process_text_edit (a_value: LS_TEXT_EDIT)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_EDIT}.range_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.range.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_TEXT_EDIT}.new_text_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.new_text.process (Current)
			utf8_string.append_character ('}')
		end

	process_text_edit_list (a_value: LS_TEXT_EDIT_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.text_edit (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_uinteger (a_value: LS_UINTEGER)
			-- Process `a_value`.
		do
			utf8_string.append_natural_32 (a_value.value)
		end

	process_unknown_notification (a_value: LS_UNKNOWN_NOTIFICATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNKNOWN_NOTIFICATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNKNOWN_NOTIFICATION}.notification_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.notification.process (Current)
			utf8_string.append_character ('}')
		end

	process_unregister_capability_request (a_value: LS_UNREGISTER_CAPABILITY_REQUEST)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			process_jsonrpc_version
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNREGISTER_CAPABILITY_REQUEST}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNREGISTER_CAPABILITY_REQUEST}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNREGISTER_CAPABILITY_REQUEST}.params_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			process_unregistration_params (a_value)
			utf8_string.append_character ('}')
		end

	process_unregistration (a_value: LS_UNREGISTRATION)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNREGISTRATION}.id_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.id.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNREGISTRATION}.method_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.method.process (Current)
			utf8_string.append_character ('}')
		end

	process_unregistration_list (a_value: LS_UNREGISTRATION_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.unregistration (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

	process_unregistration_params (a_value: LS_UNREGISTRATION_PARAMS)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_UNREGISTRATION_PARAMS}.unregistrations_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.unregistrations.process (Current)
			utf8_string.append_character ('}')
		end

	process_versioned_text_document_identifier (a_value: LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER)
			-- Process `a_value`.
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.uri.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER}.version_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.version.process (Current)
			utf8_string.append_character ('}')
		end

	process_work_done_progress_options (a_value: LS_WORK_DONE_PROGRESS_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			if attached a_value.work_done_progress as l_work_done_progress then
				process_comma_if_not_first
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_WORK_DONE_PROGRESS_OPTIONS}.work_done_progress_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_work_done_progress.process (Current)
			end
		end

	process_work_done_progress_params (a_value: LS_WORK_DONE_PROGRESS_PARAMS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		do
			if attached a_value.work_done_token as l_work_done_token then
				process_comma_if_not_first
				utf8_string.append_character ('"')
				utf8_string.append_string ({LS_WORK_DONE_PROGRESS_PARAMS}.work_done_token_name)
				utf8_string.append_character ('"')
				utf8_string.append_character (':')
				l_work_done_token.process (Current)
			end
		end

	process_workspace_folder (a_value: LS_WORKSPACE_FOLDER)
			-- Process `a_value`
		do
			utf8_string.append_character ('{')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_WORKSPACE_FOLDER}.uri_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.uri.process (Current)
			utf8_string.append_character (',')
			utf8_string.append_character ('"')
			utf8_string.append_string ({LS_WORKSPACE_FOLDER}.name_name)
			utf8_string.append_character ('"')
			utf8_string.append_character (':')
			a_value.name.process (Current)
			utf8_string.append_character ('}')
		end

	process_workspace_folder_list (a_value: LS_WORKSPACE_FOLDER_LIST)
			-- Process `a_value`.
		local
			i, nb: INTEGER
		do
			utf8_string.append_character ('[')
			nb := a_value.count
			from i := 1 until i > nb loop
				if i /= 1 then
					utf8_string.append_character (',')
				end
				a_value.workspace_folder (i).process (Current)
				i := i + 1
			end
			utf8_string.append_character (']')
		end

invariant

	utf8_string_not_void: utf8_string /= Void
	utf8_string_is_string_8: utf8_string.same_type ({STRING_8} "")
	valid_utf8: {UC_UTF8_ROUTINES}.valid_utf8 (utf8_string)

end
