note

	description:

		"LSP 'textDocument/didSave' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_SAVE_TEXT_DOCUMENT_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	text_document: LS_TEXT_DOCUMENT_IDENTIFIER
			-- The document that was saved.

	text: detachable LS_STRING
			-- Optional the content when saved. Depends on the includeText value
			-- when the save notification was requested.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
	text_name: STRING_8 = "text"
			-- Field names

invariant

	text_document_not_void: text_document /= Void

end
