note

	description:
	"[
		LSP events describing an incremental change to a text document.
		If only a text is provided it is considered to be the full content
		of the document.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_TEXT_DOCUMENT_CONTENT_CHANGE_EVENT

inherit

	LS_ANY

feature -- Access

	text: LS_STRING
			-- Text of content change
		deferred
		ensure
			text_not_void: Result /= Void
		end

end
