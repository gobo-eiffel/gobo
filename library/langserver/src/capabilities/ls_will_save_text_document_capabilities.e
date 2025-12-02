note

	description:

		"LSP text document 'WillSave' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_WILL_SAVE_TEXT_DOCUMENT_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_will_save: like will_save)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			will_save := a_will_save
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			will_save_set: will_save = a_will_save
		end

feature -- Access

	will_save: detachable LS_BOOLEAN
			-- The client supports sending will save notifications.
			
feature -- Field names

	will_save_name: STRING_8 = "willSave"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_will_save_text_document_capabilities (Current)
		end

end
