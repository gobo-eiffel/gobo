note

	description:

		"LSP 'textDocument/documentHighlight' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class LS_DOCUMENT_HIGHLIGHT_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_document_highlight_capabilities (Current)
		end

end
