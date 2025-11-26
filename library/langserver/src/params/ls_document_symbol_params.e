note

	description:

		"LSP 'textDocument/documentSymbol' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DOCUMENT_SYMBOL_PARAMS

inherit

	LS_WORK_DONE_PROGRESS_PARAMS

	LS_PARTIAL_RESULT_PARAMS

feature -- Access

	text_document: LS_TEXT_DOCUMENT_IDENTIFIER
			-- The text document.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
			-- Field names

end
