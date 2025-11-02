note

	description:

		"LSP text document specific client capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_CAPABILITIES

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

	hover: detachable LS_HOVER_CAPABILITIES
			-- Capabilities specific to the 'textDocument/hover' request.

feature -- Setting

	set_hover (a_hover: like hover)
			-- Set `hover` to `a_hover`.
		do
			hover := a_hover
		ensure
			hover_set: hover = a_hover
		end

feature -- Field names

	hover_name: STRING_8 = "hover"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_capabilities (Current)
		end

end
