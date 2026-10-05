note

	description:

		"LSP factories for '$/goboEiffel/formatView' requests"

	system: "Gobo Eiffel Language Server"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class GELSP_FORMAT_VIEW_REQUEST_FACTORY

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
			l_format_view_params: GELSP_FORMAT_VIEW_PARAMS
		do
			if not attached request_id_in_object (a_object, {GELSP_FORMAT_VIEW_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {GELSP_FORMAT_VIEW_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached {LS_OBJECT} a_object.value ({GELSP_FORMAT_VIEW_REQUEST}.params_name) as l_params then
				l_error_message := {GELSP_FORMAT_VIEW_REQUEST}.params_name + ": missing field"
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			elseif not attached document_uri_in_object (l_params, {GELSP_FORMAT_VIEW_PARAMS}.uri_name, False) as l_uri then
				l_error_message := if attached last_error as l_last_error then l_last_error else {GELSP_FORMAT_VIEW_PARAMS}.uri_name + ": missing field" end
				l_error_message := {GELSP_FORMAT_VIEW_REQUEST}.params_name + "." + l_error_message
				create l_error.make ({LS_ERROR_CODES}.invalid_params, l_error_message)
				create l_response.make_error (l_id, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				create l_format_view_params.make (l_uri)
				create {GELSP_FORMAT_VIEW_REQUEST} Result.make (l_id, l_format_view_params)
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable GELSP_FORMAT_VIEW
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		local
			l_error_message: STRING_8
		do
			if not attached {LS_OBJECT} a_response.result_ as l_object then
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			elseif not attached document_uri_in_object (l_object, {GELSP_FORMAT_VIEW}.uri_name, False) as l_uri then
				l_error_message := if attached last_error as l_last_error then l_last_error else {GELSP_FORMAT_VIEW}.uri_name + ": missing field" end
				last_error := {LS_RESPONSE}.result_name + "." + l_error_message
			elseif not attached string_in_object (l_object, {GELSP_FORMAT_VIEW}.text_name, False) as l_text then
				l_error_message := if attached last_error as l_last_error then l_last_error else {GELSP_FORMAT_VIEW}.text_name + ": missing field" end
				last_error := {LS_RESPONSE}.result_name + "." + l_error_message
			else
				create Result.make (l_uri, l_text)
			end
		end

	handler (a_manager: GELSP): GELSP_FORMAT_VIEW_REQUEST_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {GELSP_FORMAT_VIEW_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
