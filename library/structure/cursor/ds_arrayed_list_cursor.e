indexing

	description:

		"Cursors for arrayed list traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_ARRAYED_LIST_CURSOR [G]

inherit

	DS_BILINEAR_CURSOR [G]

	DS_DYNAMIC_CURSOR [G]

creation

	make

feature {NONE} -- Initialization

	make (list: like container) is
			-- Create a new cursor for `list'.
		require
			list_not_void: list /= Void
		do
			container := list
			--| index := 0
		ensure
			container_set: container = list
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
		do
			Result := container.item (index)
		end

	index: INTEGER
			-- Current cursor position

	container: DS_ARRAYED_LIST [G]
			-- List traversed

feature -- Status report

	after: BOOLEAN is
			-- Is there no valid position to right of cursor?
		do
			Result := index > container.count
		end

	before: BOOLEAN is
			-- Is there no valid position to left of cursor?
		do
			Result := index = 0
		end

	is_first: BOOLEAN is
			-- Is cursor on the first item?
		do
			Result := not container.is_empty and index = 1
		end

	is_last: BOOLEAN is
			-- Is cursor on the last item?
		do
			Result := not container.is_empty and index = container.count
		end

	is_valid: BOOLEAN is
			-- Is cursor valid?
		do
			Result := valid_index (index)
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		do
			index := 1
		end

	finish is
			-- Move cursor to last position.
		do
			index := container.count
		end

	forth is
			-- Move cursor to next position.
		do
			index := index + 1
		end

	back is
			-- Move cursor to previous position.
		do
			index := index - 1
		end

	go_to (i: INTEGER) is
			-- Move cursor to `i'-th position.
		do
			index := i
		end

feature -- Element change

	put (v: G) is
			-- Replace item at cursor position by `v'.
		do
			container.replace (v, index)
		end

end -- class DS_ARRAYED_LIST_CURSOR
