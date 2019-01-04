note

	description:

		"Cursors for linked list traversals"

	library: "Gobo Eiffel Structure Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DS_LINKED_LIST_CURSOR [G]

inherit

	DS_LIST_CURSOR [G]
		redefine
			item,
			off,
			same_position,
			next_cursor
		end

create

	make

feature {NONE} -- Initialization

	make (a_list: like container)
			-- Create a new cursor for `a_list'.
		require
			a_list_not_void: a_list /= Void
		do
			container := a_list
			before := True
		ensure
			container_set: container = a_list
			before: before
		end

feature -- Access

	item: G
			-- Item at cursor position
			-- (Performance: O(1).)
		do
			check not_off: attached current_cell as l_attached_current_cell then
				Result := l_attached_current_cell.item
			end
		end

	container: DS_LINKED_LIST [G]
			-- List traversed

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?

	before: BOOLEAN
			-- Is there no valid position to left of cursor?

	off: BOOLEAN
			-- Is there no item at cursor position?
		do
			Result := (current_cell = Void)
		ensure then
			definition: Result = (current_cell = Void)
		end

	same_position (other: like Current): BOOLEAN
			-- Is current cursor at same position as `other'?
		do
			Result := current_cell = other.current_cell and before = other.before and after = other.after
		end

feature -- Element change

	replace (v: G)
			-- Replace item at cursor position by `v'.
			-- (Performance: O(1).)
		do
			check not_off: attached current_cell as l_attached_current_cell then
				l_attached_current_cell.put (v)
			end
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	current_cell: detachable DS_LINKABLE [G]
			-- Cell at cursor position

feature {DS_LINKED_LIST} -- Implementation

	set_current_cell (a_cell: attached like current_cell)
			-- Set `current_cell' to `a_cell'.
			-- Do not change `after' or `before'.
		require
			not_off: current_cell /= Void
			a_cell_not_void: a_cell /= Void
		do
			current_cell := a_cell
		ensure
			current_cell_set: current_cell = a_cell
		end

	set_after
			-- Set position to after position.
		do
			current_cell := Void
			before := False
			after := True
		ensure
			after: after
		end

	set_before
			-- Set position to before position.
		do
			current_cell := Void
			before := True
			after := False
		ensure
			before: before
		end

	set (a_cell: like current_cell; b, a: BOOLEAN)
			-- Set cursor.
		require
			consistent: (a_cell /= Void) xor (a or b)
			not_both: not (a and b)
		do
			current_cell := a_cell
			before := b
			after := a
		ensure
			current_cell_set: current_cell = a_cell
			before_set: before = b
			after_set: after = a
		end

feature {DS_LINKED_LIST} -- Implementation

	next_cursor: detachable DS_LINKED_LIST_CURSOR [G]
			-- Next cursor
			-- (Used by `container' to keep track of traversing
			-- cursors (i.e. cursors associated with `container'
			-- and which are not currently `off').)

end
