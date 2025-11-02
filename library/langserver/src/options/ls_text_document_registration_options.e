note

	description:

		"LSP general text document registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS

inherit

	LS_SERVER_REGISTRATION_OPTIONS

feature {NONE} -- Initialization

	make (a_document_selector: like document_selector)
			-- Create a new server options.
		require
			a_document_selector_not_void: a_document_selector /= Void
		do
			document_selector := a_document_selector
		ensure
			document_selector_set: document_selector = a_document_selector
		end

feature -- Access

	document_selector: LS_OPTIONAL_DOCUMENT_SELECTOR
			-- A document selector to identify the scope of the registration. If set to
			-- null the document selector provided on the client side will be used.

feature -- Field names

	document_selector_name: STRING_8 = "documentSelector"
			-- Field names

invariant

	document_selector_not_void: document_selector /= Void

end
