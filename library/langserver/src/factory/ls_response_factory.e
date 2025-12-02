note

	description:

		"LSP factories for responses"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_RESPONSE_FACTORY

inherit

	LS_MESSAGE_FACTORY

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		local
			l_id: detachable LS_RESPONSE_ID
			l_result: detachable LS_ANY
			l_error: detachable LS_RESPONSE_ERROR
		do
			l_id := response_id_in_object (a_object, {LS_RESPONSE}.id_name, True)
			if l_id = Void then
				l_id := {LS_NULL}.null
			end
			l_result := a_object.value ({LS_RESPONSE}.result_name)
			l_error := response_error_in_object (a_object, {LS_RESPONSE}.error_name, True)
			if l_error /= Void then
				create {LS_RESPONSE} Result.make_error (l_id, l_error)
			elseif l_result /= Void then
				create {LS_RESPONSE} Result.make_success (l_id, l_result)
			else
				create {LS_RESPONSE} Result.make_success ({LS_NULL}.null, {LS_NULL}.null)
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_RESPONSE_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_RESPONSE}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
