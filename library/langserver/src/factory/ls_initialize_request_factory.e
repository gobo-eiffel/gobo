note

	description:

		"LSP factories for 'initialize' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_INITIALIZE_REQUEST_FACTORY

inherit

	LS_MESSAGE_FACTORY
		redefine
			new_response_result
		end

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		local
			l_response: LS_RESPONSE
			l_error: LS_RESPONSE_ERROR
			l_error_message: detachable STRING_8
			l_work_done_token: detachable LS_PROGRESS_TOKEN
			l_trace: detachable LS_TRACE_VALUE
			l_client_info: detachable LS_APPLICATION_INFO
			l_locale: detachable LS_STRING
			l_root_path: detachable LS_OPTIONAL_STRING
			l_workspace_folders: detachable LS_OPTIONAL_WORKSPACE_FOLDER_LIST
			l_initialization_options: detachable LS_ANY
		do
			if not attached request_id_in_object (a_object, {LS_INITIALIZE_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_INITIALIZE_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached {LS_OBJECT} a_object.value ({LS_INITIALIZE_REQUEST}.params_name) as l_params then
				l_error_message := {LS_INITIALIZE_REQUEST}.params_name + ": missing field"
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached optional_integer_in_object (l_params, {LS_INITIALIZE_REQUEST}.process_id_name, False) as l_process_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_INITIALIZE_REQUEST}.process_id_name + ": missing field" end
				l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached optional_document_uri_in_object (l_params, {LS_INITIALIZE_REQUEST}.root_uri_name, False) as l_root_uri then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_INITIALIZE_REQUEST}.root_uri_name + ": missing field" end
				l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached client_all_capabilities_in_object (l_params, {LS_INITIALIZE_REQUEST}.capabilities_name, False) as l_capabilities then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_INITIALIZE_REQUEST}.capabilities_name + ": missing field" end
				l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				l_client_info := application_info_in_object (l_params, {LS_INITIALIZE_REQUEST}.client_info_name, True)
				if attached last_error as l_last_error then
					l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_last_error
					create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
					create l_response.make_error (l_id, l_error)
					create {LS_HANDLED_MESSAGE} Result.make (l_response)
				end
				if last_error = Void then
					l_locale := string_in_object (l_params, {LS_INITIALIZE_REQUEST}.locale_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if last_error = Void then
					l_root_path := optional_string_in_object (l_params, {LS_INITIALIZE_REQUEST}.root_path_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if last_error = Void then
					l_workspace_folders := optional_workspace_folder_list_in_object (l_params, {LS_INITIALIZE_REQUEST}.workspace_folders_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if last_error = Void then
					l_trace := trace_value_in_object (l_params, {LS_INITIALIZE_REQUEST}.trace_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if last_error = Void then
					l_work_done_token := progress_token_in_object (l_params, {LS_INITIALIZE_REQUEST}.work_done_token_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_INITIALIZE_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if Result = Void then
					l_initialization_options := l_params.value ({LS_INITIALIZE_REQUEST}.initialization_options_name)
					create {LS_INITIALIZE_REQUEST} Result.make (l_id, l_process_id, l_client_info, l_locale,
						l_root_path, l_root_uri, l_workspace_folders, l_capabilities,
						l_trace, l_initialization_options, l_work_done_token)
				end
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_INITIALIZE_RESULT
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		do
			if not attached {LS_OBJECT} a_response.result_ as l_object then
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			elseif attached initialize_result_from_object (l_object, {LS_RESPONSE}.result_name) as l_initialize_result then
				Result := l_initialize_result
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_INITIALIZE_REQUEST_HANDLER
			-- Message handler for current dynamic registration options
		do
			Result := {LS_INITIALIZE_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
