note

	description:

		"LSP configuration items"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_CONFIGURATION_ITEM

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_scope_uri: like scope_uri; a_section: like section)
			-- Create a new configuration item.
		do
			scope_uri := a_scope_uri
			section := a_section
		ensure
			scope_uri_set: scope_uri = a_scope_uri
			section_set: section = a_section
		end

feature -- Access

	scope_uri: detachable LS_URI
			-- The scope to get the configuration section for.

	section: detachable LS_STRING
			-- The configuration section asked for.

feature -- Field names

	scope_uri_name: STRING_8 = "scopeUri"
	section_name: STRING_8 = "section"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_configuration_item (Current)
		end

end
