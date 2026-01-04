note

	description:

		"LSP value processors"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

deferred class LS_PROCESSOR

feature {NONE} -- Initialization

	make
			-- Create a new processor.
		do
		end

feature {LS_ANY} -- Processing

	process_annotated_text_edit (a_value: LS_ANNOTATED_TEXT_EDIT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_application_info (a_value: LS_APPLICATION_INFO)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_array (a_value: LS_ARRAY)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_boolean (a_value: LS_BOOLEAN)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_cancel_request_notification (a_value: LS_CANCEL_REQUEST_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_change_annotation (a_value: LS_CHANGE_ANNOTATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_client_all_capabilities (a_value: LS_CLIENT_ALL_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_code_block (a_value: LS_CODE_BLOCK)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_code_description (a_value: LS_CODE_DESCRIPTION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_command (a_value: LS_COMMAND)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_capabilities (a_value: LS_COMPLETION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_context (a_value: LS_COMPLETION_CONTEXT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item (a_value: LS_COMPLETION_ITEM)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_capabilities (a_value: LS_COMPLETION_ITEM_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_defaults (a_value: LS_COMPLETION_ITEM_DEFAULTS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_kind_list (a_value: LS_COMPLETION_ITEM_KIND_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_kind_set (a_value: LS_COMPLETION_ITEM_KIND_SET)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_label_details (a_value: LS_COMPLETION_ITEM_LABEL_DETAILS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_list (a_value: LS_COMPLETION_ITEM_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_options (a_value: LS_COMPLETION_ITEM_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_resolve_request (a_value: LS_COMPLETION_ITEM_RESOLVE_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_tag_list (a_value: LS_COMPLETION_ITEM_TAG_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_item_tag_set (a_value: LS_COMPLETION_ITEM_TAG_SET)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_list (a_value: LS_COMPLETION_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_list_capabilities (a_value: LS_COMPLETION_LIST_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_request (a_value: LS_COMPLETION_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_options (a_value: LS_COMPLETION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_completion_registration_options (a_value: LS_COMPLETION_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_configuration_item (a_value: LS_CONFIGURATION_ITEM)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_configuration_item_list (a_value: LS_CONFIGURATION_ITEM_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_configuration_request (a_value: LS_CONFIGURATION_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_custom_notification (a_value: LS_CUSTOM_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_declaration_capabilities (a_value: LS_DECLARATION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_declaration_options (a_value: LS_DECLARATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_declaration_registration_options (a_value: LS_DECLARATION_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_declaration_request (a_value: LS_DECLARATION_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_definition_capabilities (a_value: LS_DEFINITION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_definition_options (a_value: LS_DEFINITION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_definition_registration_options (a_value: LS_DEFINITION_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_definition_request (a_value: LS_DEFINITION_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_diagnostic (a_value: LS_DIAGNOSTIC)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_diagnostic_list (a_value: LS_DIAGNOSTIC_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_diagnostic_related_information (a_value: LS_DIAGNOSTIC_RELATED_INFORMATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_diagnostic_related_information_list (a_value: LS_DIAGNOSTIC_RELATED_INFORMATION_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_diagnostic_tag_list (a_value: LS_DIAGNOSTIC_TAG_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_diagnostic_tag_set (a_value: LS_DIAGNOSTIC_TAG_SET)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_configuration_capabilities (a_value: LS_DID_CHANGE_CONFIGURATION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_configuration_notification (a_value: LS_DID_CHANGE_CONFIGURATION_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_text_document_capabilities (a_value: LS_DID_CHANGE_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_text_document_notification (a_value: LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_text_document_registration_options (a_value: LS_DID_CHANGE_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_watched_files_capabilities (a_value: LS_DID_CHANGE_WATCHED_FILES_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_watched_files_notification (a_value: LS_DID_CHANGE_WATCHED_FILES_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_change_watched_files_registration_options (a_value: LS_DID_CHANGE_WATCHED_FILES_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_close_text_document_capabilities (a_value: LS_DID_CLOSE_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_close_text_document_notification (a_value: LS_DID_CLOSE_TEXT_DOCUMENT_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_close_text_document_registration_options (a_value: LS_DID_CLOSE_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_open_text_document_capabilities (a_value: LS_DID_OPEN_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end
	
	process_did_open_text_document_notification (a_value: LS_DID_OPEN_TEXT_DOCUMENT_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_open_text_document_registration_options (a_value: LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_save_text_document_capabilities (a_value: LS_DID_SAVE_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_save_text_document_notification (a_value: LS_DID_SAVE_TEXT_DOCUMENT_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_save_text_document_options (a_value: LS_DID_SAVE_TEXT_DOCUMENT_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_did_save_text_document_registration_options (a_value: LS_DID_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_filter (a_value: LS_DOCUMENT_FILTER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_selector (a_value: LS_DOCUMENT_SELECTOR)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_symbol (a_value: LS_DOCUMENT_SYMBOL)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_symbol_capabilities (a_value: LS_DOCUMENT_SYMBOL_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_symbol_list (a_value: LS_DOCUMENT_SYMBOL_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_symbol_options (a_value: LS_DOCUMENT_SYMBOL_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_symbol_registration_options (a_value: LS_DOCUMENT_SYMBOL_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_document_symbol_request (a_value: LS_DOCUMENT_SYMBOL_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_exit_notification (a_value: LS_EXIT_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_file_event (a_value: LS_FILE_EVENT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_file_event_list (a_value: LS_FILE_EVENT_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_file_system_watcher (a_value: LS_FILE_SYSTEM_WATCHER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_file_system_watcher_list (a_value: LS_FILE_SYSTEM_WATCHER_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_handled_message (a_value: LS_HANDLED_MESSAGE)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_hover_capabilities (a_value: LS_HOVER_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_hover_options (a_value: LS_HOVER_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_hover_registration_options (a_value: LS_HOVER_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_hover_request (a_value: LS_HOVER_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_hover_result (a_value: LS_HOVER_RESULT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_implementation_capabilities (a_value: LS_IMPLEMENTATION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_implementation_options (a_value: LS_IMPLEMENTATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_implementation_registration_options (a_value: LS_IMPLEMENTATION_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_implementation_request (a_value: LS_IMPLEMENTATION_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_initialize_error (a_value: LS_INITIALIZE_ERROR)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_initialize_request (a_value: LS_INITIALIZE_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_initialize_result (a_value: LS_INITIALIZE_RESULT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_initialized_notification (a_value: LS_INITIALIZED_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_insert_replace_edit (a_value: LS_INSERT_REPLACE_EDIT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_insert_replace_ranges (a_value: LS_INSERT_REPLACE_RANGES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_insert_text_mode_list (a_value: LS_INSERT_TEXT_MODE_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_insert_text_mode_set (a_value: LS_INSERT_TEXT_MODE_SET)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_integer (a_value: LS_INTEGER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_invalid_notification (a_value: LS_INVALID_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_location (a_value: LS_LOCATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_location_link (a_value: LS_LOCATION_LINK)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_location_link_list (a_value: LS_LOCATION_LINK_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_location_list (a_value: LS_LOCATION_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_log_trace_notification (a_value: LS_LOG_TRACE_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_marked_string_list (a_value: LS_MARKED_STRING_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_markup_content (a_value: LS_MARKUP_CONTENT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_markup_kind_list (a_value: LS_MARKUP_KIND_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_null (a_value: LS_NULL)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_number (a_value: LS_NUMBER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_object (a_value: LS_OBJECT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_optional_range_location (a_value: LS_OPTIONAL_RANGE_LOCATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_optional_versioned_text_document_identifier (a_value: LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_position (a_value: LS_POSITION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_progress_notification (a_value: LS_PROGRESS_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_publish_diagnostics_capabilities (a_value: LS_PUBLISH_DIAGNOSTICS_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_publish_diagnostics_notification (a_value: LS_PUBLISH_DIAGNOSTICS_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_range (a_value: LS_RANGE)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_register_capability_request (a_value: LS_REGISTER_CAPABILITY_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_registration (a_value: LS_REGISTRATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_registration_list (a_value: LS_REGISTRATION_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_relative_pattern (a_value: LS_RELATIVE_PATTERN)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_resolve_capabilities (a_value: LS_RESOLVE_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_response (a_value: LS_RESPONSE)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_response_error (a_value: LS_RESPONSE_ERROR)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_server_capabilities (a_value: LS_SERVER_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_set_trace_notification (a_value: LS_SET_TRACE_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_shutdown_request (a_value: LS_SHUTDOWN_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_string (a_value: LS_STRING)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_string_list (a_value: LS_STRING_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_symbol_information (a_value: LS_SYMBOL_INFORMATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_symbol_information_list (a_value: LS_SYMBOL_INFORMATION_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_symbol_kind_list (a_value: LS_SYMBOL_KIND_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_symbol_kind_set (a_value: LS_SYMBOL_KIND_SET)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_symbol_tag_list (a_value: LS_SYMBOL_TAG_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_symbol_tag_set (a_value: LS_SYMBOL_TAG_SET)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_capabilities (a_value: LS_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_content_change_event_list (a_value: LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_edit (a_value: LS_TEXT_DOCUMENT_EDIT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_full_content_change_event (a_value: LS_TEXT_DOCUMENT_FULL_CONTENT_CHANGE_EVENT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_identifier (a_value: LS_TEXT_DOCUMENT_IDENTIFIER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_item (a_value: LS_TEXT_DOCUMENT_ITEM)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_incremental_content_change_event (a_value: LS_TEXT_DOCUMENT_INCREMENTAL_CONTENT_CHANGE_EVENT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_sync_capabilities (a_value: LS_TEXT_DOCUMENT_SYNC_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_document_sync_options (a_value: LS_TEXT_DOCUMENT_SYNC_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_edit (a_value: LS_TEXT_EDIT)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_text_edit_list (a_value: LS_TEXT_EDIT_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_type_definition_capabilities (a_value: LS_TYPE_DEFINITION_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_type_definition_options (a_value: LS_TYPE_DEFINITION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_type_definition_registration_options (a_value: LS_TYPE_DEFINITION_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_type_definition_request (a_value: LS_TYPE_DEFINITION_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_uinteger (a_value: LS_UINTEGER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_unknown_notification (a_value: LS_UNKNOWN_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_unregister_capability_request (a_value: LS_UNREGISTER_CAPABILITY_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_unregistration (a_value: LS_UNREGISTRATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_unregistration_list (a_value: LS_UNREGISTRATION_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_versioned_text_document_identifier (a_value: LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_will_save_text_document_capabilities (a_value: LS_WILL_SAVE_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_will_save_text_document_notification (a_value: LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_will_save_text_document_registration_options (a_value: LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end
	
	process_will_save_wait_until_text_document_capabilities (a_value: LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_will_save_wait_until_text_document_registration_options (a_value: LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_will_save_wait_until_text_document_request (a_value: LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_capabilities (a_value: LS_WORKSPACE_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_folder (a_value: LS_WORKSPACE_FOLDER)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_folder_list (a_value: LS_WORKSPACE_FOLDER_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol (a_value: LS_WORKSPACE_SYMBOL)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol_capabilities (a_value: LS_WORKSPACE_SYMBOL_CAPABILITIES)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol_list (a_value: LS_WORKSPACE_SYMBOL_LIST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol_options (a_value: LS_WORKSPACE_SYMBOL_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol_registration_options (a_value: LS_WORKSPACE_SYMBOL_REGISTRATION_OPTIONS)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol_request (a_value: LS_WORKSPACE_SYMBOL_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

	process_workspace_symbol_resolve_request (a_value: LS_WORKSPACE_SYMBOL_RESOLVE_REQUEST)
			-- Process `a_value`.
		require
			a_value_not_void: a_value /= Void
		deferred
		end

end
