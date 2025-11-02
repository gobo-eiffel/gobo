note

	description:

		"LSP 'Hover' capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_HOVER_CAPABILITIES

inherit

	LS_DYNAMIC_REGISTRATION_CAPABILITIES
		rename
			make as make_dynamic_registration_capabilities
		end

create

	make

feature {NONE} -- Initialization

	make (a_dynamic_registration: like dynamic_registration; a_content_format: like content_format)
			-- Create a new client capabilities.
		do
			dynamic_registration := a_dynamic_registration
			content_format := a_content_format
		ensure
			dynamic_registration_set: dynamic_registration = a_dynamic_registration
			content_format_set: content_format = a_content_format
		end

feature -- Access

	content_format: detachable LS_MARKUP_KIND_LIST
			-- Client supports the follow content formats if the content
			-- property refers to a `literal of type MarkupContent`.
			-- The order describes the preferred format of the client.

feature -- Field names

	content_format_name: STRING_8 = "contentFormat"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_hover_capabilities (Current)
		end

end
