note

	description:

		"LSP factories for 'textDocument/willSaveWaitUntil' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_FACTORY

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
			l_error_message: STRING_8
		do
			if not attached request_id_in_object (a_object, {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached {LS_OBJECT} a_object.value ({LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.params_name) as l_params then
				l_error_message := {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.params_name + ": missing field"
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached text_document_identifier_in_object (l_params, {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.text_document_name, False) as l_text_document then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.text_document_name + ": missing field" end
				l_error_message := {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached text_document_save_reason_in_object (l_params, {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.reason_name, False) as l_reason then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.reason_name + ": missing field" end
				l_error_message := {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				create {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST} Result.make (l_id, l_text_document, l_reason)
			end
		end

	new_server_registration_options (a_registration: LS_REGISTRATION; a_manager: LS_MESSAGE_MANAGER): detachable LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Create a new dynamic registration options from `a_registration`.
			-- Set `last_error` in case of error.
		do
			if not attached {LS_OBJECT} a_registration.register_options as l_object then
				last_error := {LS_REGISTRATION}.register_options_name + ": invalid type"
			elseif attached will_save_wait_until_text_document_registration_options_from_object (l_object, {LS_REGISTRATION}.register_options_name) as l_will_save_wait_until_text_document_registration_options then
				Result := l_will_save_wait_until_text_document_registration_options
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_OPTIONAL_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_RESULT
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		do
			if not attached a_response.result_ as l_any then
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			elseif attached optional_will_save_wait_until_text_document_result_from_any (l_any, {LS_RESPONSE}.result_name) as l_optional_will_save_wait_until_text_document_result then
				Result := l_optional_will_save_wait_until_text_document_result
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
