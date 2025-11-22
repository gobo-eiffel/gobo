note

	description:

		"LSP optional 'textDocument/didSave' options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS

inherit

	LS_SERVER_OPTIONS

feature -- Access

	save: LS_OPTIONAL_DID_SAVE_TEXT_DOCUMENT_OPTIONS
			-- If present save notifications are sent to the server. If omitted the
			-- notification should not be sent.
		do
			Result := Current
		ensure
			save_not_void: Result /= Void
			
		end

end
