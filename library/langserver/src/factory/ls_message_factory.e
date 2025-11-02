note

	description:

		"LSP message factories"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_MESSAGE_FACTORY

inherit

	LS_FACTORY

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		require
			a_object_not_void: a_object /= Void
			a_manager_not_void: a_manager /= Void
		deferred
		ensure
			new_message_not_void: Result /= Void
		end

	new_server_registration_options (a_registration: LS_REGISTRATION; a_manager: LS_MESSAGE_MANAGER): detachable LS_SERVER_REGISTRATION_OPTIONS
			-- Create a new dynamic registration options from `a_registration`.
			-- Set `last_error` in case of error.
		require
			a_registration_not_void: a_registration /= Void
			a_manager_not_void: a_manager /= Void
		do
			last_error := {LS_REGISTRATION}.register_options_name + ": invalid type"
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end

	new_response_result (a_response: LS_RESPONSE; a_manager: LS_MESSAGE_MANAGER): detachable LS_RESPONSE_RESULT
			-- Create a new response result from `a_response`.
			-- Set `last_error` in case of error.
		require
			a_response_not_void: a_response /= Void
			a_manager_not_void: a_manager /= Void
		do
			last_error := {LS_RESPONSE}.result_name + ": invalid type"
		ensure
			error_or_success: Result /= Void xor last_error /= Void
		end


	handler (a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE_HANDLER
			-- Message handler for current dynamic registration options
		require
			a_manager_not_void: a_manager /= Void
		deferred
		ensure
			handler_not_void: Result /= Void
		end
		
end
