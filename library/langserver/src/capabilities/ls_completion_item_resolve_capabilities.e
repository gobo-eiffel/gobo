note

	description:
	"[
		LSP completion item resolve capabilities.

		Indicate which properties a client can resolve lazily on a
		completion item. Before version 3.16.0 only the predefined properties
		`documentation` and `detail` could be resolved lazily.
	]"
	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_ITEM_RESOLVE_CAPABILITIES

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_properties: like properties)
			-- Create a new client capabilities.
		require
			a_properties_not_void: a_properties /= Void
		do
			properties := a_properties
		ensure
			properties_set: properties = a_properties
		end

feature -- Access

	properties: LS_STRING_LIST
			-- The properties that a client can resolve lazily.

feature -- Field names

	properties_name: STRING_8 = "properties"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_item_resolve_capabilities (Current)
		end

invariant

	properties_not_void: properties /= Void

end
