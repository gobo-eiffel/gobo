indexing

	description:

		"Lists whose items are held either locally or in %
		%other nested lists. Note that nested lists built %
		%that way form a possibly cyclic di-graph. Nested %
		%lists can be 'flattened', that is all items %
		%accessible remotely are also kept locally, using %
		%a DS_NESTED_LIST_FLATTENER."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1998, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_NESTED_LIST [G]

feature -- Access

	local_items: DS_LINEAR [G] is
			-- Items held locally
		deferred
		ensure
			local_items_not_void: Result /= Void
		end

	remote_items: DS_LINEAR [DS_NESTED_LIST [G]] is
			-- Items held by other lists
		deferred
		ensure
			remote_items_not_void: Result /= Void
			no_void_remote: not Result.has (Void)
		end

feature {DS_NESTED_LIST_FLATTENER} -- Implementation

	index: INTEGER
			-- Index used to detect possible cycles
			-- in the di-graph made of nested lists

	set_index (i: INTEGER) is
			-- Set `index' to `i'.
		do
			index := i
		ensure
			index_set: index = i
		end

	set_local_items (items: like local_items) is
			-- Set `local_items' to `items'.
		require
			items_not_void: items /= Void
		deferred
		ensure
			local_items_set: local_items = items
		end

	add_local_item (an_item: G) is
			-- Add `an_item' to `local_items'.
		deferred
		ensure
			item_added: local_items.has (an_item)
		end

end -- class DS_NESTED_LIST
