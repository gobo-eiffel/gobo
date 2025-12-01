note

	description:

		"LSP 'textDocument/publishDiagnostics' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_PUBLISH_DIAGNOSTICS_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_PUBLISH_DIAGNOSTICS_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_uri: like uri; a_version: like version; a_diagnostics: like diagnostics)
			-- Create a new 'textDocument/publishDiagnostics' notification.
		require
			a_uri_not_void: a_uri /= Void
			a_diagnostics_not_void: a_diagnostics /= Void
		do
			uri := a_uri
			version := a_version
			diagnostics := a_diagnostics
		ensure
			uri_set: uri = a_uri
			version_set: version = a_version
			diagnostics_set: diagnostics = a_diagnostics
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "textDocument/publishDiagnostics"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_PUBLISH_DIAGNOSTICS_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.publish_diagnostics_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_publish_diagnostics_notification (Current)
		end

end
