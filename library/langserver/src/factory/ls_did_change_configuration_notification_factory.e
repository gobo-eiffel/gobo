note

	description:

		"LSP factories for 'workspace/didChangeWatchedFiles' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_CONFIGURATION_NOTIFICATION_FACTORY

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
			if not attached {LS_OBJECT} a_object.value ({LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.params_name) as l_params then
				l_error_message := {LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.params_name + ": missing field"
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached l_params.value ({LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.settings_name) as l_settings then
				l_error_message := {LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.settings_name + ": missing field"
				l_error_message := {LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.method, a_object, l_error_message)
			else
				create {LS_DID_CHANGE_CONFIGURATION_NOTIFICATION} Result.make (l_settings)
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_DID_CHANGE_CONFIGURATION_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_DID_CHANGE_CONFIGURATION_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
