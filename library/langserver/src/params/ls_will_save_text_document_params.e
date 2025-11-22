note

	description:

		"LSP 'textDocument/didSave' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_WILL_SAVE_TEXT_DOCUMENT_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	text_document: LS_TEXT_DOCUMENT_IDENTIFIER
			-- The document that will be saved.

	reason: LS_TEXT_DOCUMENT_SAVE_REASON
			-- Reason why a text document is saved.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
	reason_name: STRING_8 = "reason"
			-- Field names

invariant

	text_document_not_void: text_document /= Void
	reason_not_void: reason /= Void

end
