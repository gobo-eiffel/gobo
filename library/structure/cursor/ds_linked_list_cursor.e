indexing

	description:

		"Cursors for linked list traversals"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1997, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_LINKED_LIST_CURSOR [G]

inherit

	DS_BILINEAR_CURSOR [G]
		redefine
			off
		end

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
			before := True
		ensure
			container_set: container = list
			before: before
		end

feature -- Access

	item: G is
			-- Item at cursor position
		do
			Result := current_cell.item
		end

	index: INTEGER is
			-- Index of current position
		local
			a_cell: like current_cell
		do
			if after then
				Result := container.count + 1
			elseif not before then
				from
					a_cell := container.first_cell
					Result := 1
				until
					a_cell = current_cell
				loop
					a_cell := a_cell.right
					Result := Result + 1
				end
			end
		end
			
	container: DS_LINKED_LIST [G]
			-- List traversed

feature -- Status report

	after: BOOLEAN
			-- Is there no valid position to right of cursor?

	before: BOOLEAN
			-- Is there no valid position to left of cursor?

	is_first: BOOLEAN is
			-- Is cursor on the first item?
		do
			Result := current_cell /= Void and
				current_cell = container.first_cell
		end

	is_last: BOOLEAN is
			-- Is cursor on the last item?
		do
			Result := current_cell /= Void and
				current_cell = container.last_cell
		end

	off: BOOLEAN is
			-- Is there no item at cursor position?
		do
			Result := current_cell = Void
		end

	is_valid: BOOLEAN is
			-- Is cursor valid?
		local
			a_cell: like current_cell
		do
			from
				a_cell := container.first_cell
			until
				a_cell = Void or a_cell = current_cell
			loop
				a_cell := a_cell.right
			end
			Result := a_cell = current_cell
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		do
			before := False
			current_cell := container.first_cell
			after := current_cell = Void
		end

	finish is
			-- Move cursor to last position.
		do
			after := False
			current_cell := container.last_cell
			before := current_cell = Void
		end

	forth is
			-- Move cursor to next position.
		do
			if before then
				before := False
				current_cell := container.first_cell
			else
				current_cell := current_cell.right
			end
			after := current_cell = Void
		end

	back is
			-- Move cursor to previous position.
		local
			a_cell: like current_cell
		do
			if after then
				after := False
				current_cell := container.last_cell
			elseif is_first then
				before := True
				current_cell := Void
			else
				from
					a_cell := container.first_cell
				until
					a_cell.right = current_cell
				loop
					a_cell := a_cell.right
				end
				current_cell := a_cell
			end
			before := current_cell = Void
		end

	go_to (i: INTEGER) is
			-- Move cursor to `i'-th position.
		local
			j: INTEGER
			a_cell: like current_cell
		do
			if i = 0 then
				before := True
				after := False
				current_cell := Void
			elseif i = container.count + 1 then
				after := True
				before := False
				current_cell := Void
			else
				after := False
				before := False
				if i = 1 then
					current_cell := container.first_cell
				elseif i = container.count then
					current_cell := container.last_cell
				else
					from
						j := 1
						a_cell := container.first_cell
					until
						j = i
					loop
						a_cell := a_cell.right
						j := j + 1
					end
					current_cell := a_cell
				end
			end
		end

feature -- Element change

	put (v: G) is
			-- Replace item at cursor position by `v'.
		do
			current_cell.put (v)
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_SEARCHER} -- Implementation

	current_cell: DS_LINKABLE [G]
			-- Cell at cursor position

feature {DS_LINKED_LIST_SEARCHER} -- Implementation

	set (cell: like current_cell; b, a: BOOLEAN) is
			-- Set cursor.
		require
			consistent: cell = Void implies (a or b)
			not_both: not (a and b)
		do
			current_cell := cell
			before := b
			after := a
		ensure
			current_cell_set: current_cell = cell
			before_set: before = b
			after_set: after = a
		end

invariant

	off_definition: off = (current_cell = Void)

end -- class DS_LINKED_LIST_CURSOR
