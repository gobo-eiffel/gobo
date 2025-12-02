note

	description:

		"LSP factories for '$/logTrace' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_LOG_TRACE_NOTIFICATION_FACTORY

inherit

	LS_MESSAGE_FACTORY

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		local
			l_error_message: STRING_8
			l_verbose: detachable LS_STRING
		do
			if not attached {LS_OBJECT} a_object.value ({LS_LOG_TRACE_NOTIFICATION}.params_name) as l_params then
				l_error_message := {LS_LOG_TRACE_NOTIFICATION}.params_name + ": missing field"
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_LOG_TRACE_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached string_in_object (l_params, {LS_LOG_TRACE_NOTIFICATION}.message_name, False) as l_message then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_LOG_TRACE_NOTIFICATION}.message_name + ": missing field" end
				l_error_message := {LS_LOG_TRACE_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_LOG_TRACE_NOTIFICATION}.method, a_object, l_error_message)
			else
				l_verbose := string_in_object (l_params, {LS_LOG_TRACE_NOTIFICATION}.verbose_name, True)
				if attached last_error as l_last_error then
					l_error_message := {LS_LOG_TRACE_NOTIFICATION}.params_name + "." + l_last_error
					create {LS_INVALID_NOTIFICATION} Result.make ({LS_LOG_TRACE_NOTIFICATION}.method, a_object, l_error_message)
				else
					create {LS_LOG_TRACE_NOTIFICATION} Result.make_verbose (l_message, l_verbose)
				end
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_LOG_TRACE_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_LOG_TRACE_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
