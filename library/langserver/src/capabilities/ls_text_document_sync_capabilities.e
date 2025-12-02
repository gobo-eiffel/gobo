note

	description:

		"LSP text document sync capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_TEXT_DOCUMENT_SYNC_CAPABILITIES

inherit

	LS_DID_OPEN_TEXT_DOCUMENT_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		redefine
			process
		end

	LS_DID_CLOSE_TEXT_DOCUMENT_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		redefine
			process
		end

	LS_DID_CHANGE_TEXT_DOCUMENT_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		redefine
			process
		end

	LS_DID_SAVE_TEXT_DOCUMENT_CAPABILITIES
		rename
			make as make_did_save_text_document_capabilities
		redefine
			process
		end

	LS_WILL_SAVE_TEXT_DOCUMENT_CAPABILITIES
		rename
			make as make_will_save_text_document_capabilities
		redefine
			process
		end

	LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_CAPABILITIES
		rename
			make as make_will_save_wait_until_text_document_capabilities
		redefine
			process
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_will_save: like will_save; a_will_save_wait_until: like will_save_wait_until; a_did_save: like did_save)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			will_save := a_will_save
			will_save_wait_until := a_will_save_wait_until
			did_save := a_did_save
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			will_save_set: will_save = a_will_save
			will_save_wait_until_set: will_save_wait_until = a_will_save_wait_until
			did_save_set: did_save = a_did_save
		end

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_text_document_sync_capabilities (Current)
		end

end
