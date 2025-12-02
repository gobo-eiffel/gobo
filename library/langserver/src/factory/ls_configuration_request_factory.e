note

	description:

		"LSP factories for 'workspace/configuration' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CONFIGURATION_REQUEST_FACTORY

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
		do
			if not attached request_id_in_object (a_object, {LS_CONFIGURATION_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_CONFIGURATION_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached {LS_OBJECT} a_object.value ({LS_CONFIGURATION_REQUEST}.params_name) as l_params then
				l_error_message := {LS_CONFIGURATION_REQUEST}.params_name + ": missing field"
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached configuration_item_list_in_object (l_params, {LS_CONFIGURATION_REQUEST}.items_name, False) as l_items then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_CONFIGURATION_REQUEST}.items_name + ": missing field" end
				l_error_message := {LS_CONFIGURATION_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				create {LS_CONFIGURATION_REQUEST} Result.make (l_id, l_items)
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_CONFIGURATION_RESULT
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		do
			if not attached a_response.result_ as l_any then
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			elseif attached configuration_result_from_any (l_any, {LS_RESPONSE}.result_name) as l_configuration_result_result then
				Result := l_configuration_result_result
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_CONFIGURATION_REQUEST_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_CONFIGURATION_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
