note

	description:

		"LSP 'textDocument/documentSymbol' requests"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_SYMBOL_REQUEST

inherit

	LS_REQUEST

	LS_DOCUMENT_SYMBOL_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_id: like id; a_text_document: like text_document; a_work_done_token: like work_done_token; a_partial_result_token: like partial_result_token)
			-- Create a new 'textDocument/documentSymbol' request.
		require
			a_id_not_void: a_id /= Void
			a_text_document_not_void: a_text_document /= Void
		do
			id := a_id
			text_document := a_text_document
			work_done_token := a_work_done_token
			partial_result_token := a_partial_result_token
		ensure
			id_set: id = a_id
			text_document_set: text_document = a_text_document
			work_done_token_set: work_done_token = a_work_done_token
			partial_result_token_set: partial_result_token = a_partial_result_token
		end

feature -- Access

	method: LS_STRING
			-- Method to be invoked
		once
			Result := "textDocument/documentSymbol"
		ensure then
			instance_free: class
		end

	handler (a_manager: LS_MESSAGE_MANAGER): LS_DOCUMENT_SYMBOL_REQUEST_HANDLER
			-- Message handler for current request
		do
			Result := a_manager.document_symbol_request_handler
		ensure then
			instance_free: class
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_symbol_request (Current)
		end

end
