indexing

	description:

		"EiffelBase LINKED_LIST class interface"

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class LINKED_LIST [G]

inherit

	DYNAMIC_LIST [G]
		redefine
			compare_objects, compare_references
		end

	DS_LINKED_LIST [G]
		rename
			item as i_th,
			item_for_iteration as item,
			is_empty as empty,
			remove_at as remove,
			replace_at as replace,
			force_last as extend,
			force_first as put_front,
			is_first as isfirst,
			is_last as islast,
			search_forth as search,
			replace as put_i_th,
			delete as prune_all,

			valid_cursor as ds_valid_cursor,
			valid_index as ds_valid_index,
			extendible as ds_extendible,
			force as ds_force,
			put as ds_put,
			append as ds_append,
			prune as ds_prune,
			remove as ds_remove,
			swap as ds_swap,
			go_to as ds_go_to,
			extend as ds_extend,
			sorted as ds_sorted,
			sort as ds_sort
		export
			{ANY} make
		end

creation

	make

feature -- Access

	cursor: CURSOR is
			-- Current cursor position
		local
			a_cursor: like cursor_anchor
		do
			!! a_cursor.make (internal_cursor.current_cell, before, after)
			Result := a_cursor
		end

	index_of (v: G; i: INTEGER): INTEGER is
			-- Index of `i'-th occurrence of `v'.
			-- 0 if none.
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		local
			a_tester: like equality_tester
			j, occur: INTEGER
			a_cell: like first_cell
		do
			j := 1
			a_cell := first_cell
			a_tester := equality_tester
			if a_tester /= Void then
				from until (a_cell = Void or occur = i) loop
					if a_tester.test (a_cell.item, v) then
						occur := occur + 1
					end
					a_cell := a_cell.right
					j := j + 1
				end
			else
				from until (a_cell = Void or occur = i) loop
					if a_cell.item = v then
						occur := occur + 1
					end
					a_cell := a_cell.right
					j := j + 1
				end
			end
			if occur = i then
				Result := j - 1
			end
		end

feature -- Status report

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		local
			a_cursor: like cursor_anchor
			cursor_cell, a_cell: like first_cell
		do
			a_cursor ?= p
			if a_cursor /= Void then
				cursor_cell := a_cursor.current_cell
				if cursor_cell /= Void then
					from a_cell := first_cell until (a_cell = Void) loop
						if cursor_cell = a_cell then
							Result := True
							a_cell := Void  -- Jump out of the loop.
						else
							a_cell := a_cell.right
						end
					end
				else
					Result := True
				end
			end
		end

	full: BOOLEAN is False
			-- Is structure filled to capacity?

feature -- Cursor movement

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		local
			a_cursor: like cursor_anchor
		do
			a_cursor ?= p
			internal_cursor.set (a_cursor.current_cell, a_cursor.before, a_cursor.after)
		end

	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the absolute value of `i'
			-- is too big.
		local
			j: INTEGER
		do
			if i >= 0 then
				from j := 1 until (j > i or after) loop
					forth
					j := j + 1
				end
			else
				j := index + i
				if j < 1 then
					go_before
				else
					go_i_th (j)
				end
			end
		end

feature -- Element change

	merge_left (other: like Current) is
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		do
			extend_left (other)
			other.wipe_out
		end

	merge_right (other: like Current) is
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		do
			extend_right (other)
			other.wipe_out
		end

	append (s: LINEAR [G]) is
			-- Append a copy of `s'.
		local
			l: like s
			al: ARRAYED_LIST [G]
			nb: INTEGER
		do
			nb := s.ds_count
			if s = Current then
				!! al.make (nb)
				al.append (s)
				l := al
			else
				l := s
			end
			from l.start until l.after loop
				put_last (l.item)
				l.forth
			end
		end

	fill (other: CONTAINER [G]) is
			-- Fill with as many items of `other' as possible.
			-- The representations of `other' and current structure
			-- need not be the same.
		do
			append (other.linear_representation)
		end

feature -- Removal

	prune (v: G) is
			-- Remove the first occurrence of `v' if any.
			-- If no such occurrence go `off'.
		local
			a_tester: like equality_tester
		do
			a_tester := equality_tester
			if a_tester /= Void then
				from
					if before then
						start
					end
				until
					after or else
					a_tester.test (item, v)
				loop
					forth
				end
				if not after then
					remove
				end
			else
				from
					if before then
						start
					end
				until
					after or else item = v
				loop
					forth
				end
				if not after then
					remove
				end
			end
		end

feature -- Transformation

	swap (i: INTEGER) is
			-- Exchange item at `i'-th position with item
			-- at cursor position.
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			a_cursor.go_i_th (i)
			a_cursor.swap (internal_cursor)
			a_cursor.go_after
		end

feature -- Duplication

	duplicate (n: INTEGER): like Current is
			-- Copy of sub-chain beginning at current position
			-- and having min (`n', `from_here') items,
			-- where `from_here' is the number of items
			-- at or to the right of current position.
		local
			i: INTEGER
			a_cell: like first_cell
		do
			from
				a_cell := internal_cursor.current_cell
				!! Result.make
			until
				a_cell = Void or i >= n
			loop
				Result.put_last (a_cell.item)
				a_cell := a_cell.right
				i := i + 1
			end
		end

feature -- Status setting

	compare_objects is
			-- Ensure that future search operations will use `equal'
			-- rather than `=' for comparing references.
		do
			object_comparison := True
			!! equality_tester
		end

	compare_references is
			-- Ensure that future search operations will use `='
			-- rather than `equal' for comparing references.
		do
			object_comparison := False
			equality_tester := Void
		end

feature {NONE} -- Type anchors

	cursor_anchor: LINKED_LIST_CURSOR [G] is do end
			-- Type anchor for `cursor'

end -- class LINKED_LIST
