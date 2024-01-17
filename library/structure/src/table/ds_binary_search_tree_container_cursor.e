note

	description:

		"Cursors for in-order traversal of containers using binary search tree algorithms"

	storable_version: "20130823"
	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 2008-2013, Daniel Tuser and others"
	license: "MIT License"

deferred class DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			item,
			next_cursor
		end

	MISMATCH_CORRECTOR
		export
			{NONE} all
		undefine
			copy, is_equal
		redefine
			correct_mismatch
		end

feature {NONE} -- Initialization

	make (a_container: like container)
			-- Create a new cursor for `a_container'.
		require
			a_container_not_void: a_container /= Void
		do
			container := a_container
			set_before (True)
		ensure
			container_set: container = a_container
			before: before
		end

feature -- Access

	item: G
			-- Item at cursor position
		do
			check not_off: attached position as l_position then
				Result := l_position.item
			end
		end

	container: DS_BINARY_SEARCH_TREE_CONTAINER [G, K]
			-- Container traversed

feature {NONE} -- Access

	key: K
			-- Key at cursor position
		require
			not_off: not off
		do
			check not_off: attached position as l_position then
				Result := l_position.key
			end
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Access

	position: detachable DS_BINARY_SEARCH_TREE_CONTAINER_NODE [G, K]
			-- Current position in the underlying tree

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?
		do
			Result := position = Void and then not before
		end

	before: BOOLEAN
			-- Is there no valid position to left of cursor?

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Setting

	set_position (a_position: like position)
			-- Set `position to `a_position'.
		require
			a_position_not_void: a_position /= Void
		do
			position := a_position
			before := False
		ensure
			position_set: position = a_position
		end

feature {DS_BINARY_SEARCH_TREE_CONTAINER} -- Status setting

	set_before (a_bool: BOOLEAN)
			-- Set `before' to `a_bool'.
		do
			position := Void
			before := a_bool
		ensure
			position_is_void: position = Void
			before_set: before = a_bool
		end

feature -- Cursor movement

	go_at_or_before_key (a_key: K)
			-- Move to last position with a smaller key than `k'.
		do
			container.cursor_go_at_or_before_key (Current, a_key)
		ensure
			not_after: not after
		end

	go_at_or_after_key (a_key: K)
			-- Move to first position with a greater key than `k'.
		do
			container.cursor_go_at_or_after_key (Current, a_key)
		ensure
			not_before: not before
		end

feature {DS_BILINEAR} -- Implementation

	next_cursor: detachable DS_BINARY_SEARCH_TREE_CONTAINER_CURSOR [G, K]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

feature {NONE} -- Storable mismatch

	correct_mismatch
			-- Attempt to correct object mismatch using `mismatch_information'.
		local
			l_stored_version_number: INTEGER
		do
			if not attached mismatch_information.stored_version as l_stored_version or else l_stored_version.is_empty then
				correct_mismatch_20130823
			elseif l_stored_version.is_integer then
				l_stored_version_number := l_stored_version.to_integer
				if l_stored_version_number < 20130823 then
					correct_mismatch_20130823
				else
					precursor
				end
			else
				precursor
			end
		end

	correct_mismatch_20130823
			-- Correct storable mismatch introducted in version "20130823".
		do
			if position = Void then
				if mismatch_information.has ("is_before") then
					if attached {BOOLEAN} mismatch_information.item ("is_before") as l_old_is_before then
						before := l_old_is_before
					end
				end
			end
		end

end
