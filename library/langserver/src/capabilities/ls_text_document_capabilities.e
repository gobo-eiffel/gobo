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

	synchronization: detachable LS_TEXT_DOCUMENT_SYNC_CAPABILITIES
			-- Capabilities specific to text document synchronization

	hover: detachable LS_HOVER_CAPABILITIES
			-- Capabilities specific to the 'textDocument/hover' request.

feature -- Setting

	set_synchronization (a_synchronization: like synchronization)
			-- Set `synchronization` to `a_synchronization`.
		do
			synchronization := a_synchronization
		ensure
			synchronization_set: synchronization = a_synchronization
		end

	set_hover (a_hover: like hover)
			-- Set `hover` to `a_hover`.
		do
			hover := a_hover
		ensure
			hover_set: hover = a_hover
		end

feature -- Field names

	hover_name: STRING_8 = "hover"
	synchronization_name: STRING_8 = "synchronization"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_capabilities (Current)
		end

end
