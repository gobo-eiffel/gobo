note

	description:

		"LSP text document 'DidChange' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_CHANGE_TEXT_DOCUMENT_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES

create

	make

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_change_text_document_capabilities (Current)
		end

end
