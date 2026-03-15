note

	description:

		"LSP 'textDocument/selectionRange' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

deferred class LS_SELECTION_RANGE_PARAMS

inherit

	LS_WORK_DONE_PROGRESS_PARAMS

	LS_PARTIAL_RESULT_PARAMS

feature -- Access

	text_document: LS_TEXT_DOCUMENT_IDENTIFIER
			-- The text document.

	positions: LS_POSITION_LIST
			-- The positions inside the text document.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
	positions_name: STRING = "positions"
			-- Field names

invariant

	text_document_not_void: text_document /= Void
	positions_not_void: positions /= Void

end
