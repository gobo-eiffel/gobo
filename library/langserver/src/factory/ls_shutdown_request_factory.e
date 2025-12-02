note

	description:

		"LSP factories for 'shutdown' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_SHUTDOWN_REQUEST_FACTORY

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
			if not attached request_id_in_object (a_object, {LS_SHUTDOWN_REQUEST}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_SHUTDOWN_REQUEST}.id_name + ": missing field" end
				create l_error.make ({LS_ERROR_CODES}.invalid_request, l_error_message)
				create l_response.make_error ({LS_NULL}.null, l_error)
				create {LS_HANDLED_MESSAGE} Result.make (l_response)
			else
				create {LS_SHUTDOWN_REQUEST} Result.make (l_id)
			end
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_NULL
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		do
			if attached {LS_NULL} a_response.result_ as l_null then
				Result := l_null
			else
				last_error := {LS_RESPONSE}.result_name + ": invalid type"
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_SHUTDOWN_REQUEST_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_SHUTDOWN_REQUEST}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
