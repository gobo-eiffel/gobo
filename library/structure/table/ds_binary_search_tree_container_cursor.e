indexing

	description:

		"Cursors for in-order traversal of containers using binary search tree algorithms"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008, Daniel Tuser and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			item,
			next_cursor
		end

feature {NONE} -- Initialization

	make (a_container: like container) is
			-- Create a new cursor for `a_container'.
		require
			a_container_not_void: a_container /= Void
		do
			container := a_container
			set_is_before (True)
		ensure
			container_set: container = a_container
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
		do
			Result := position.item
		end

	container: DS_BINARY_SEARCH_TREE_CONTAINER [G, K]
			-- Container traversed

feature {NONE} -- Access

	key: K is
			-- Key at cursor position
		require
			not_off: not off
		do
			Result := position.key
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]
			-- Current position in the underlying tree

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Status report

	is_before: BOOLEAN
			-- When `position' is Void, is the cursor considered `before'?
			-- (Otherwise it is `after'.)

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Setting

	set_position (a_position: like position) is
			-- Set `position to `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
		ensure
			position_set: position = a_position
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Status setting

	set_is_before (a_bool: BOOLEAN) is
			-- Set `is_before' to `a_bool'.
		do
			position := Void
			is_before := a_bool
		ensure
			position_is_void: position = Void
			is_before_set: is_before = a_bool
		end

feature {DS_BILINEAR} -- Implementation

	next_cursor: DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
