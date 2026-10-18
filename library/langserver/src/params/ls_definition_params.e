note

	description:

		"LSP 'textDocument/definition' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025-2026, Eric Bezault and others"
	license: "MIT License"

class LS_DEFINITION_PARAMS

inherit

	LS_TEXT_DOCUMENT_POSITION_PARAMS

	LS_WORK_DONE_PROGRESS_PARAMS

	LS_PARTIAL_RESULT_PARAMS

create

	make

feature {NONE} -- Initialization

	make (a_text_document: like text_document; a_position: like position; a_work_done_token: like work_done_token; a_partial_result_token: like partial_result_token)
			-- Create a new 'textDocument/definition' request.
		require
			a_text_document_not_void: a_text_document /= Void
			a_position_not_void: a_position /= Void
		do
			text_document := a_text_document
			position := a_position
			work_done_token := a_work_done_token
			partial_result_token := a_partial_result_token
		ensure
			text_document_set: text_document = a_text_document
			position_set: position = a_position
			work_done_token_set: work_done_token = a_work_done_token
			partial_result_token_set: partial_result_token = a_partial_result_token
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_definition_params (Current)
		end

end
