indexing

	description:

		"Cursors for bilinked list traversals"

	library:    "Gobo Eiffel Structures Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_BILINKED_LIST_CURSOR [G]

inherit

	DS_LINKED_LIST_CURSOR [G]
		redefine
			back, container, current_cell,
			search_back, go_i_th
		end

creation

	make

feature -- Access

	container: DS_BILINKED_LIST [G]
			-- List traversed

feature -- Cursor movement

	back is
			-- Move cursor to previous position.
			-- (Performance: O(1).)
		local
			was_off: BOOLEAN
		do
			if after then
				was_off := True
				current_cell := container.last_cell
				after := False
			else
				current_cell := current_cell.left
			end
			before := (current_cell = Void)
			if before then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	search_back (v: G) is
			-- Move to first position at or before current
			-- position where `item' and `v' are equal.
			-- (Use `equality_tester''s criterion from `container'
			-- if not void, use `=' criterion otherwise.)
			-- Move `before' if not found.
		local
			a_cell: like current_cell
			a_tester: DS_EQUALITY_TESTER [G]
			was_off: BOOLEAN
		do
			was_off := off
			a_cell := current_cell
			a_tester := container.equality_tester
			if a_tester /= Void then
				from until
					a_cell = Void or else a_tester.test (a_cell.item, v)
				loop
					a_cell := a_cell.left
				end
			else
					-- Use `=' as comparison criterion.
				from until
					a_cell = Void or else a_cell.item = v
				loop
					a_cell := a_cell.left
				end
			end
			current_cell := a_cell
			before := (a_cell = Void)
			if before then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position.
			-- (Performance: O(min(i,container.count-i)).)
		local
			j, k, count: INTEGER
			a_cell: like current_cell
			was_off: BOOLEAN
		do
			was_off := off
			count := container.count
			if i = 0 then
				before := True
				after := False
				current_cell := Void
			elseif i = count + 1 then
				after := True
				before := False
				current_cell := Void
			else
				after := False
				before := False
				if i = 1 then
					current_cell := container.first_cell
				elseif i = count then
					current_cell := container.last_cell
				else
					k := count - i + 1
					if k < i then
						a_cell := container.last_cell
						from j := 1 until j = k loop
							a_cell := a_cell.left
							j := j + 1
						end
						current_cell := a_cell
					else
						a_cell := container.first_cell
						from j := 1 until j = i loop
							a_cell := a_cell.right
							j := j + 1
						end
						current_cell := a_cell
					end
				end
			end
			if off then
				if not was_off then
					container.remove_traversing_cursor (Current)
				end
			elseif was_off then
				container.add_traversing_cursor (Current)
			end
		end

feature {DS_LINKED_LIST, DS_LINKED_LIST_CURSOR} -- Implementation

	current_cell: DS_BILINKABLE [G]
			-- Cell at cursor position

end -- class DS_BILINKED_LIST_CURSOR
