note

	description:

		"LSP completion lists"

	library: "Gobo Eiffel Language Server Protocol Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class LS_COMPLETION_LIST

inherit

	LS_OPTIONAL_COMPLETION_RESULT

create

	make

feature {NONE} -- Initialization

	make (a_is_incomplete: like is_incomplete; a_item_defaults: like item_defaults; a_items: like items)
			-- Create a new completion list.
		require
			a_is_incomplete_not_void: a_is_incomplete /= Void
			a_items_not_void: a_items /= Void
		do
			is_incomplete := a_is_incomplete
			item_defaults := a_item_defaults
			items := a_items
		ensure
			is_incomplete_set: is_incomplete = a_is_incomplete
			item_defaults_set: item_defaults = a_item_defaults
			items_set: items = a_items
		end

feature -- Access

	is_incomplete: LS_BOOLEAN
			-- This list is not complete. Further typing should result in recomputing
			-- this list.
			--
			-- Recomputed lists have all their items replaced (not appended) in the
			-- incomplete completion sessions.

	item_defaults: detachable LS_COMPLETION_ITEM_DEFAULTS
			-- In many cases the items of an actual completion result share the same
			-- value for properties like `commitCharacters` or the range of a text
			-- edit. A completion list can therefore define item defaults which will
			-- be used if a completion item itself doesn't specify the value.
			--
			-- If a completion list specifies a default value and a completion item
			-- also specifies a corresponding value the one from the item is used.
			--
			-- Servers are only allowed to return default values if the client
			-- signals support for this via the `completionList.itemDefaults`
			-- capability.

	items: LS_COMPLETION_ITEM_LIST
			-- The completion items.

feature -- Field names

	is_incomplete_name: STRING_8 = "isIncomplete"
	item_defaults_name: STRING_8 = "itemDefaults"
	items_name: STRING_8 = "items"
			-- Field names

feature -- Processing

	process (a_processor: LS_PROCESSOR)
			-- Process current value.
		do
			a_processor.process_completion_list (Current)
		end

invariant

	is_incomplete_not_void: is_incomplete /= Void
	items_not_void: items /= Void

end
