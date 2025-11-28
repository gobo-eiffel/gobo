note

	description:

		"LSP factories for '$/cancelRequest' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CANCEL_REQUEST_NOTIFICATION_FACTORY

inherit

	LS_MESSAGE_FACTORY

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		local
			l_error_message: STRING_8
		do
			if not attached {LS_OBJECT} a_object.value ({LS_CANCEL_REQUEST_NOTIFICATION}.params_name) as l_params then
				l_error_message := {LS_CANCEL_REQUEST_NOTIFICATION}.params_name + ": missing field"
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_CANCEL_REQUEST_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached request_id_in_object (l_params, {LS_CANCEL_REQUEST_NOTIFICATION}.id_name, False) as l_id then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_CANCEL_REQUEST_NOTIFICATION}.id_name + ": missing field" end
				l_error_message := {LS_CANCEL_REQUEST_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_CANCEL_REQUEST_NOTIFICATION}.method, a_object, l_error_message)
			else
				create {LS_CANCEL_REQUEST_NOTIFICATION} Result.make (l_id)
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_CANCEL_REQUEST_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_CANCEL_REQUEST_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
