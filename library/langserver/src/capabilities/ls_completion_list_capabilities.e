note

	description:

		"LSP completion list capabilities"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_LIST_CAPABILITIES

inherit

	LS_ANY

create

	make

feature {NONE} -- Initialization

	make (a_item_defaults: like item_defaults)
			-- Create a new client capabilities.
		do
			item_defaults := a_item_defaults
		ensure
			item_defaults_set: item_defaults = a_item_defaults
		end

feature -- Access

	item_defaults: detachable LS_STRING_LIST
				-- The client supports the following itemDefaults on
				-- a completion list.
				--
				-- The value lists the supported property names of the
				-- `CompletionList.itemDefaults` object. If omitted
				-- no properties are supported.

feature -- Field names

	item_defaults_name: STRING_8 = "itemDefaults"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_list_capabilities (Current)
		end

end
