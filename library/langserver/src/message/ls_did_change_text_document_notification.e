note

	description:

		"LSP 'textDocument/didChange' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_DID_CHANGE_TEXT_DOCUMENT_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_text_document: like text_document; a_content_changes: like content_changes)
			-- Create a new 'textDocument/didChange' notification.
		require
			a_text_document_not_void: a_text_document /= Void
			a_content_changes_not_void: a_content_changes /= Void
		do
			text_document := a_text_document
			content_changes := a_content_changes
		ensure
			text_document_set: text_document = a_text_document
			content_changes_set: content_changes = a_content_changes
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "textDocument/didChange"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_DID_CHANGE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.did_change_text_document_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_text_document_notification (Current)
		end

end
