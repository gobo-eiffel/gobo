note

	description:

		"LSP capabilities provided by the client (editor or tool)"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CLIENT_ALL_CAPABILITIES

inherit

	LS_CLIENT_CAPABILITIES

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new client capabilities.
		do
		end

feature -- Access

	text_document: detachable LS_TEXT_DOCUMENT_CAPABILITIES
			-- Text document specific client capabilities.

feature -- Setting

	set_text_document (a_text_document: like text_document)
			-- Set `text_document` to `a_text_document`.
		do
			text_document := a_text_document
		ensure
			text_document_set: text_document = a_text_document
		end

feature -- Field names

	text_document_name: STRING_8 = "textDocument"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_client_all_capabilities (Current)
		end

end
