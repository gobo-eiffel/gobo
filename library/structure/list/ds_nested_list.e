indexing

	description:

		"Lists whose items are held either locally or in %
		%other nested lists. Note that nested lists built %
		%that way form a possibly cyclic di-graph. Nested %
		%lists can be 'flattened', that is all items %
		%accessible remotely are also kept locally, using %
		%a DS_NESTED_LIST_FLATTENER."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DS_NESTED_LIST [G]

feature -- Access

	local_items: DS_LIST [G] is
			-- Items held locally
		deferred
		ensure
			local_items_not_void: Result /= Void
		end

	remote_items: DS_LIST [DS_NESTED_LIST [G]] is
			-- Items held by other lists
		deferred
		ensure
			remote_items_not_void: Result /= Void
		end

end -- class DS_NESTED_LIST
