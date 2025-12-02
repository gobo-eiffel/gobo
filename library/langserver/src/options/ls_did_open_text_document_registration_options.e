note

	description:

		"LSP 'textDocument/didOpen' dynamic registration options"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_OPEN_TEXT_DOCUMENT_REGISTRATION_OPTIONS

inherit

	LS_TEXT_DOCUMENT_REGISTRATION_OPTIONS

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_open_text_document_registration_options (Current)
		end

end
