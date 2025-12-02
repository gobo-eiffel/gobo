note

	description:

		"LSP factories for 'textDocument/publishDiagnostics' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_PUBLISH_DIAGNOSTICS_NOTIFICATION_FACTORY

inherit

	LS_MESSAGE_FACTORY

create

	make

feature -- Access

	new_message (a_object: LS_OBJECT; a_manager: LS_MESSAGE_MANAGER): LS_MESSAGE
			-- Create a new message from `a_object`.
		local
			l_error_message: STRING_8
			l_version: detachable LS_INTEGER
		do
			if not attached {LS_OBJECT} a_object.value ({LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.params_name) as l_params then
				l_error_message := {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.params_name + ": missing field"
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached document_uri_in_object (l_params, {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.uri_name, False) as l_uri then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.uri_name + ": missing field" end
				l_error_message := {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.method, a_object, l_error_message)
			elseif not attached diagnostic_list_in_object (l_params, {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.diagnostics_name, False) as l_diagnostics then
				l_error_message := if attached last_error as l_last_error then l_last_error else {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.diagnostics_name + ": missing field" end
				l_error_message := {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.params_name + "." + l_error_message
				create {LS_INVALID_NOTIFICATION} Result.make ({LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.method, a_object, l_error_message)
			else
				l_version := integer_in_object (l_params, {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.version_name, True)
				if attached last_error as l_last_error then
					l_error_message := {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.params_name + "." + l_last_error
					create {LS_INVALID_NOTIFICATION} Result.make ({LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.method, a_object, l_error_message)
				else
					create {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION} Result.make (l_uri, l_version, l_diagnostics)
				end
			end
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_PUBLISH_DIAGNOSTICS_NOTIFICATION_HANDLER
			-- Message handler for this kind of messages
		do
			Result := {LS_PUBLISH_DIAGNOSTICS_NOTIFICATION}.handler (a_manager)
		ensure then
			instance_free: class
		end

end
