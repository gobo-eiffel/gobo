note

	description:

		"LSP factories for '$/progress' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_PROGRESS_NOTIFICATION_FACTORY

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
			if not attached {LS_OBJECT} a_object.value ({LS_PROGRESS_NOTIFICATION}.params_name) as l_params then
				l_error_message := {LS_PROGRESS_NOTIFICATION}.params_name + ": missing field"
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_PROGRESS_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached progress_token_in_object (l_params, {LS_PROGRESS_NOTIFICATION}.token_name, False) as l_token then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_PROGRESS_NOTIFICATION}.token_name + ": missing field" end
				l_error_message := {LS_PROGRESS_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_PROGRESS_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached l_params.value ({LS_PROGRESS_NOTIFICATION}.value_name) as l_value then
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_PROGRESS_NOTIFICATION}.method, a_object, {LS_PROGRESS_NOTIFICATION}.value_name + ": missing field")
			else
				create {LS_PROGRESS_NOTIFICATION} Result.make (l_token, l_value)
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_PROGRESS_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_PROGRESS_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
