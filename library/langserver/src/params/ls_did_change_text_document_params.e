note

	description:

		"LSP 'textDocument/didChange' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_DID_CHANGE_TEXT_DOCUMENT_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	text_document: LS_VERSIONED_TEXT_DOCUMENT_IDENTIFIER
			-- The document that did change. The version number points
			-- to the version after all provided content changes have
			-- been applied.

	content_changes: LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT_LIST
			-- The actual content changes. The content changes describe single state
			-- changes to the document. So if there are two content changes c1 (at
			-- array index 0) and c2 (at array index 1) for a document in state S then
			-- c1 moves the document from S to S' and c2 from S' to S''. So c1 is
			-- computed on the state S and c2 is computed on the state S'.
			
			-- To mirror the content of a document using change events use the following
			-- approach:
			-- - start with the same initial content
			-- - apply the 'textDocument/didChange' notifications in the order you
			--   receive them.
			-- - apply the `TextDocumentContentChangeEvent`s in a single notification
			--   in the order you receive them.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
	content_changes_name: STRING_8 = "contentChanges"
			-- Field names

invariant

	text_document_not_void: text_document /= Void
	content_changes_not_void: content_changes /= Void

end
