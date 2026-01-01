note

	description:

		"LSP factories for 'workspace/symbol' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WORKSPACE_SYMBOL_REQUEST_FACTORY

inherit

	LS_MESSAGE_FACTORY
		redefine
			new_server_registration_options,
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
			l_partial_result_token: detachable LS_PROGRESS_TOKEN
		do
			if not attached request_id_in_object (a_object, {LS_WORKSPACE_SYMBOL_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WORKSPACE_SYMBOL_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached {LS_OBJECT} a_object.value ({LS_WORKSPACE_SYMBOL_REQUEST}.params_name) as l_params then
				l_error_message := {LS_WORKSPACE_SYMBOL_REQUEST}.params_name + ": missing field"
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached string_in_object (l_params, {LS_WORKSPACE_SYMBOL_REQUEST}.query_name, False) as l_query then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WORKSPACE_SYMBOL_REQUEST}.query_name + ": missing field" end
				l_error_message := {LS_WORKSPACE_SYMBOL_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				l_work_done_token := progress_token_in_object (l_params, {LS_WORKSPACE_SYMBOL_REQUEST}.work_done_token_name, True)
				if attached last_error as l_last_error then
					l_error_message := {LS_WORKSPACE_SYMBOL_REQUEST}.params_name + "." + l_last_error
					create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
					create l_response.make_error (l_id, l_error)
					create {LS_HANDLED_MESSAGE} Result.make (l_response)
				end
				if Result = Void then
					l_partial_result_token := progress_token_in_object (l_params, {LS_WORKSPACE_SYMBOL_REQUEST}.partial_result_token_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_WORKSPACE_SYMBOL_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if Result = Void then
					create {LS_WORKSPACE_SYMBOL_REQUEST} Result.make (l_id, l_query, l_work_done_token, l_partial_result_token)
				end
			end
		end

	new_server_registration_options (a_registration: LS_REGISTRATION; a_manager: LS_MESSAGE_MANAGER): detachable LS_WORKSPACE_SYMBOL_REGISTRATION_OPTIONS
			-- Create a new dynamic registration options from `a_registration`.
			-- Set `last_error` in case of error.
		do
			if not attached {LS_OBJECT} a_registration.register_options as l_object then
				last_error := {LS_REGISTRATION}.register_options_name + ": invalid type"
			elseif attached workspace_symbol_registration_options_from_object (l_object, {LS_REGISTRATION}.register_options_name) as l_workspace_symbol_registration_options then
				Result := l_workspace_symbol_registration_options
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_OPTIONAL_WORKSPACE_SYMBOL_RESULT
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		do
			if not attached a_response.result_ as l_any then
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			elseif attached optional_workspace_symbol_result_from_any (l_any, {LS_RESPONSE}.result_name) as l_optional_workspace_symbol_result then
				Result := l_optional_workspace_symbol_result
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_WORKSPACE_SYMBOL_REQUEST_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_WORKSPACE_SYMBOL_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
