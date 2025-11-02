note

	description:
	"[
		LSP text document position parameters.

		A parameter literal used in requests to pass a text document
		and a position inside that document. It is up to the client
		to decide how a selection is converted into a position when
		issuing a request for a text document. The client can for
		example honor or ignore the selection direction to make LSP
		request consistent with features implemented internally.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_TEXT_DOCUMENT_POSITION_PARAMS

inherit

	LS_MESSAGE_PARAMS

feature -- Access

	text_document: LS_TEXT_DOCUMENT_IDENTIFIER
			-- The text document.

	position: LS_POSITION
			-- The position inside the text document.

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
	position_name: STRING = "position"
			-- Field names

invariant

	text_document_not_void: text_document /= Void
	position_not_void: position /= Void

end
