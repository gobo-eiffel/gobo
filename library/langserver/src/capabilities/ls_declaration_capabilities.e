note

	description:

		"LSP 'textDocument/declaration' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_DECLARATION_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_link_support: like link_support)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			link_support := a_link_support
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			link_support_set: link_support = a_link_support
		end

feature -- Access

	link_support: detachable LS_BOOLEAN
			-- The client supports additional metadata in the form of declaration links.

feature -- Field names

	link_support_name: STRING_8 = "linkSupport"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_declaration_capabilities (Current)
		end

end
