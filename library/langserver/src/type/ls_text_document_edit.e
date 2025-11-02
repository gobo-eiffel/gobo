note

	description:
	"[
		LSP textual changes on a single text document.

		The text document is referred to as a
		LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER to allow clients
		to check the text document version before an edit is applied.
		A LS_TEXT_DOCUMENT_EDIT describes all changes on a version Si and
		after they are applied move the document to version Si+1.
		So the creator of a LS_TEXT_DOCUMENT_EDIT doesn't need to sort
		the array of edits or do any kind of ordering.
		However the edits must be non overlapping.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_EDIT

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_text_document: like text_document; a_edits: like edits)
			-- Create a new text document edit.
		require
			a_text_document_not_void: a_text_document /= Void
			a_edits_not_void: a_edits /= Void
		do
			text_document := a_text_document
			edits := a_edits
		ensure
			text_document_set: text_document = a_text_document
			edits_set: edits = a_edits
		end

feature -- Access

	text_document: LS_OPTIONAL_VERSIONED_TEXT_DOCUMENT_IDENTIFIER
			-- The text document to change.

	edits: LS_TEXT_EDIT_LIST
			-- The edits to be applied.
			--
			-- Support for AnnotatedTextEdit  is guarded by the
			-- client capability `workspace.workspaceEdit.changeAnnotationSupport`

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
	edits_name: STRING_8 = "edits"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_edit (Current)
		end

invariant

	text_document_not_void: text_document /= Void
	new_text_not_void: edits /= Void

end
