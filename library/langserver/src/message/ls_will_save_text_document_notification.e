note

	description:

		"LSP 'textDocument/willSave' notifications"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION

inherit

	LS_NOTIFICATION

	LS_WILL_SAVE_TEXT_DOCUMENT_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_text_document: like text_document; a_reason: like reason)
			-- Create a new 'textDocument/willSave' notification.
		require
			a_text_document_not_void: a_text_document /= Void
			a_reason_not_void: a_reason /= Void
		do
			text_document := a_text_document
			reason := a_reason
		ensure
			text_document_set: text_document = a_text_document
			reason_set: reason = a_reason
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "textDocument/willSave"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_WILL_SAVE_TEXT_DOCUMENT_NOTIFICATION_HANDLER
			-- Message handler for current notification
		do
			Result := a_manager.will_save_text_document_notification_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_will_save_text_document_notification (Current)
		end

end
