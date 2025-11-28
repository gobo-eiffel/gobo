note

	description:

		"LSP factories for 'textDocument/willSave' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_FACTORY

inherit

	LS_MESSAGE_FACTORY
		redefine
			new_server_registration_options
		end

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		local
			l_error_message: STRING_8
		do
			if not attached {LS_OBJECT} a_object.value ({LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.params_name) as l_params then
				l_error_message := {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.params_name + ": missing field"
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached text_document_identifier_in_object (l_params, {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.text_document_name, False) as l_text_document then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.text_document_name + ": missing field" end
				l_error_message := {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached text_document_save_reason_in_object (l_params, {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.reason_name, False) as l_reason then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.reason_name + ": missing field" end
				l_error_message := {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.method, a_object, l_error_message)
			else
				create {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION} Result.make (l_text_document, l_reason)
			end
		end

	new_server_registration_options (a_registration: LS_REGISTRATION; a_manager: LS_MESSAGE_MANAGER): detachable LS_WILL_SAVE_TEXT_DOCUMENT_REGISTRATION_OPTIONS
			-- Create a new dynamic registration options from `a_registration`.
			-- Set `last_error` in case of error.
		do
			if not attached {LS_OBJECT} a_registration.register_options as l_object then
				last_error := {LS_REGISTRATION}.register_options_name + ": invalid type"
			elseif attached will_save_text_document_registration_options_from_object (l_object, {LS_REGISTRATION}.register_options_name) as l_will_save_text_document_registration_options then
				Result := l_will_save_text_document_registration_options
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
