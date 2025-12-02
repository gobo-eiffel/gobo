note

	description:

		"LSP 'textDocument/willSaveWaitUntil' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST

inherit

	LS_REQUEST

	LS_WILL_SAVE_TEXT_DOCUMENT_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_text_document: like text_document; a_reason: like reason)
			-- Create a new 'textDocument/willSaveWaitUntil' request.
		require
			a_id_not_void: a_id /= Void
			a_text_document_not_void: a_text_document /= Void
			a_reason_not_void: a_reason /= Void
		do
			id := a_id
			text_document := a_text_document
			reason := a_reason
		ensure
			id_set: id = a_id
			text_document_set: text_document = a_text_document
			reason_set: reason = a_reason
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "textDocument/willSaveWaitUntil"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.will_save_wait_until_text_document_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_will_save_wait_until_text_document_request (Current)
		end

end
