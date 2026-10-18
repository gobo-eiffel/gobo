note

	description:

		"LSP factories for '$/goboEiffel/formatView' requests"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_SOURCE_DEFINITION_REQUEST_FACTORY

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
			l_partial_result_token: detachable LS_PROGRESS_TOKEN
			l_definition_params: LS_DEFINITION_PARAMS
		do
			if not attached request_id_in_object (a_object, {GELSP_SOURCE_DEFINITION_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {GELSP_SOURCE_DEFINITION_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached {LS_OBJECT} a_object.value ({GELSP_SOURCE_DEFINITION_REQUEST}.params_name) as l_params then
				l_error_message := {GELSP_SOURCE_DEFINITION_REQUEST}.params_name + ": missing field"
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached text_document_identifier_in_object (l_params, {LS_DEFINITION_REQUEST}.text_document_name, False) as l_text_document then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_DEFINITION_REQUEST}.text_document_name + ": missing field" end
				l_error_message := {LS_DEFINITION_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached position_in_object (l_params, {LS_DEFINITION_REQUEST}.position_name, False) as l_position then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_DEFINITION_REQUEST}.position_name + ": missing field" end
				l_error_message := {LS_DEFINITION_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				l_work_done_token := progress_token_in_object (l_params, {LS_DEFINITION_REQUEST}.work_done_token_name, True)
				if attached last_error as l_last_error then
					l_error_message := {LS_DEFINITION_REQUEST}.params_name + "." + l_last_error
					create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
					create l_response.make_error (l_id, l_error)
					create {LS_HANDLED_MESSAGE} Result.make (l_response)
				end
				if Result = Void then
					l_partial_result_token := progress_token_in_object (l_params, {LS_DEFINITION_REQUEST}.partial_result_token_name, True)
					if attached last_error as l_last_error then
						l_error_message := {LS_DEFINITION_REQUEST}.params_name + "." + l_last_error
						create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
						create l_response.make_error (l_id, l_error)
						create {LS_HANDLED_MESSAGE} Result.make (l_response)
					end
				end
				if Result = Void then
					create l_definition_params.make (l_text_document, l_position, l_work_done_token, l_partial_result_token)
					create {GELSP_SOURCE_DEFINITION_REQUEST} Result.make (l_id, l_definition_params)
				end
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_DEFINITION_RESULT
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		do
			if not attached a_response.result_ as l_any then
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			elseif attached definition_result_from_any (l_any, {LS_RESPONSE}.result_name) as l_definition_result then
				Result := l_definition_result
			end
		end

	handler (a_manager: GELSP): GELSP_SOURCE_DEFINITION_REQUEST_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {GELSP_SOURCE_DEFINITION_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
