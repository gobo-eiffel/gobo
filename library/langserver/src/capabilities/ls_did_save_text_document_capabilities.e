note

	description:

		"LSP text document 'DidSave' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DID_SAVE_TEXT_DOCUMENT_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_did_save: like did_save)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			did_save := a_did_save
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			did_save_set: did_save = a_did_save
		end

feature -- Access

	did_save: detachable LS_BOOLEAN
			-- The client supports did save notifications.

feature -- Field names

	did_save_name: STRING_8 = "didSave"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_did_save_text_document_capabilities (Current)
		end

end
