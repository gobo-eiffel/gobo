note

	description:

		"LSP 'textDocument/didClose' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_CLOSE_TEXT_DOCUMENT_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	text_document: LS_TEXT_DOCUMENT_IDENTIFIER
			-- The document that was closed.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
			-- Field names

invariant

	text_document_not_void: text_document /= Void

end
