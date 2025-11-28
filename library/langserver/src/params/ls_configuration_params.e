note

	description:

		"LSP 'workspace/configuration' parameters"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

deferred class LS_CONFIGURATION_PARAMS

inherit

	LS_ANY

feature -- Access

	items: LS_CONFIGURATION_ITEM_LIST
			-- Configuration items.

feature -- Field names

	items_name: STRING_8 = "items"
			-- Field names

invariant

	items_not_void: items /= Void

end
