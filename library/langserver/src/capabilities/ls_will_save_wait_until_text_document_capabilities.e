note

	description:

		"LSP text document 'WillSaveWaitUntil' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_WAIT_UNTIL_TEXT_DOCUMENT_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_will_save_wait_until: like will_save_wait_until)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			will_save_wait_until := a_will_save_wait_until
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			will_save_wait_until_set: will_save_wait_until = a_will_save_wait_until
		end

feature -- Access

	will_save_wait_until: detachable LS_BOOLEAN
			-- The client supports sending a will save request and
			-- waits for a response providing text edits which will
			-- be applied to the document before it is saved.
			
feature -- Field names

	will_save_wait_until_name: STRING_8 = "willSaveWaitUntil"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_will_save_wait_until_text_document_capabilities (Current)
		end

end
