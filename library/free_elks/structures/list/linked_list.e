indexing

	description: "Sequential, one-way linked lists"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: linked_list, sequence;
	representation: linked;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class LINKED_LIST [G] inherit

	DYNAMIC_LIST [G]
		redefine
			go_i_th, put_left, move, wipe_out,
			isfirst, islast, is_inserted,
			first, last, finish, merge_left, merge_right,
			readable, start, before, after, off, copy
		end

create
	make

feature {NONE} -- Initialization

	make is
			-- Create an empty list.
		do
			before := True
		ensure
			is_before: before
		end

feature -- Access

	item: G is
			-- Current item
		local
			a: like active
		do
			a := active
			if a /= Void then
				Result := a.item
			end
		end

	first: like item is
			-- Item at first position
		local
			f: like first_element
		do
			f := first_element
			if f /= Void then
				Result := f.item
			end
		end

	last: like item is
			-- Item at last position
		local
			l: like last_element
		do
			l := last_element
			if l /= Void then
				Result := l.item
			end
		end

	index: INTEGER
			-- Index of current position
		local
			l_active, l_active_iterator: like active
		do
			if after then
				Result := count + 1
			elseif not before then
				from
					Result := 1
					l_active := active
					l_active_iterator := first_element
				until
					l_active_iterator = l_active or else l_active_iterator = Void
				loop
					l_active_iterator := l_active_iterator.right
					Result := Result + 1
				end
			end
		end

	cursor: LINKED_LIST_CURSOR [G] is
			-- Current cursor position
		do
			create Result.make (active, after, before)
		end

feature -- Measurement

	count: INTEGER
			-- Number of items

feature -- Status report

	readable: BOOLEAN is
			-- Is there a current item that may be read?
		do
			Result := not off
		end

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?

	off: BOOLEAN is
			-- Is there no current item?
		do
			Result := after or before
		end

	isfirst: BOOLEAN is
			-- Is cursor at first position?
		do
			Result := not after and not before and (active = first_element)
		end

	islast: BOOLEAN is
			-- Is cursor at last position?
		local
			a: like active
		do
			if not after and then not before then
				a := active
				Result := a /= Void and then a.right = Void
			end
		end

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		local
			temp, sought: like first_element
		do
			if {ll_c: like cursor} p then
				from
					temp := first_element
					sought := ll_c.active
					Result := ll_c.after or else ll_c.before
				until
					Result or else temp = Void
				loop
					Result := (temp = sought)
					temp := temp.right
				end
			end
		end

	full: BOOLEAN is False
		-- Is structured filled to capacity? (Answer: no.)

	is_inserted (v: G): BOOLEAN is
			-- Has `v' been inserted at the end by the most recent `put' or
			-- `extend'?
		local
			l: like last_element
		do
			l := last_element
			if l /= Void then
				check
					put_constraint: (v /= l.item) implies not off
						-- Because, if this routine has not been called by
						-- `extend', it was called by `put' which replaces the
						-- current item, which implies the cursor is not `off'.
				end
				Result := (v = l.item) or else (v = item)
			end
		end

feature -- Cursor movement

	start is
			-- Move cursor to first position.
		do
			if first_element /= Void then
				active := first_element
				after := False
			else
				after := True
			end
			before := False
		ensure then
			empty_convention: is_empty implies after
		end

	finish is
			-- Move cursor to last position.
			-- (Go before if empty)
		local
			p: ?like new_cell
		do
			from
				p := active
			until
				p = Void
			loop
				active := p
				p := p.right
			end
			after := False
			before := (active = Void)
		ensure then
			Empty_convention: is_empty implies before
		end

	forth is
			-- Move cursor to next position.
		local
			a: like active
		do
			if before then
				before := False
				if is_empty then after := True end
			else
				a := active
				if a /= Void and then a.right /= Void then
					active := a.right
				else
					after := True
				end
			end
		end

	back is
			-- Move to previous item.
		do
			if is_empty then
				before := True
				after := False
			elseif after then
				after := False
			elseif isfirst then
				before := True
			else
				active := previous
			end
		end
	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the offset is too big.
		local
			counter, new_index: INTEGER
			p: like first_element
		do
			if i > 0 then
				if before then
					before := False
					counter := 1
				end
				from
					p := active
				until
					(counter = i) or else (p = Void)
				loop
					active := p
					p := p.right
					counter := counter + 1
				end
				if p = Void then
					after := True
				else
					active := p
				end
			elseif i < 0 then
				new_index := index + i
				before := True
				after := False
				active := first_element
				if (new_index > 0) then
					move (new_index)
				end
			end
		ensure then
	 		moved_if_inbounds:
	 			((old index + i) >= 0 and
	 			(old index + i) <= (count + 1))
	 				implies index = (old index + i)
	 		before_set: (old index + i) <= 0 implies before
	 		after_set: (old index + i) >= (count + 1) implies after
		end

	go_i_th (i: INTEGER) is
			-- Move cursor to `i'-th position.
		do
			if i = 0 then
				before := True
				after := False
				active := first_element
			elseif i = count + 1 then
				before := False
				after := True
				active := last_element
			else
				move (i - index)
			end
		end

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		local

		do
			if {ll_c: like cursor} p then
				after := ll_c.after
				before := ll_c.before
				if before then
					active := first_element
				elseif after then
					active := last_element
				else
					active := ll_c.active
				end
			else
				check
					correct_cursor_type: False
				end
			end
		end

feature -- Element change

	put_front (v: like item) is
			-- Add `v' to beginning.
			-- Do not move cursor.
		local
			p: like new_cell
		do
			p := new_cell (v)
			p.put_right (first_element)
			first_element := p
			if before or is_empty then
				active := p
			end
			count := count + 1
		end

	extend (v: like item) is
			-- Add `v' to end.
			-- Do not move cursor.
		local
			p: like first_element
			l: like last_element
		do
			p := new_cell (v)
			if is_empty then
				first_element := p
				active := p
			else
				l := last_element
				if l /= Void then
					l.put_right (p)
					if after then active := p end
				end
			end
			count := count + 1
		end

	put_left (v: like item) is
			-- Add `v' to the left of cursor position.
			-- Do not move cursor.
		local
			p: like new_cell
			a: like active
		do
			a := active
			if a = Void then
				put_front (v)
			elseif after then
				back
				put_right (v)
				move (2)
			else
				p := new_cell (a.item)
				p.put_right (a.right)
				a.put (v)
				a.put_right (p)
				active := p
				count := count + 1
			end
		ensure then
			previous_exists: previous /= Void
			item_inserted: {q: like previous} previous and then q.item = v
		end

	put_right (v: like item) is
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		local
			p: like new_cell
			a: like active
		do
			p := new_cell (v)
			check is_empty implies before end
			if before then
				p.put_right (first_element)
				first_element := p
				active := p
			else
				a := active
				if a /= Void then
					p.put_right (a.right)
					a.put_right (p)
				end
			end
			count := count + 1
		ensure then
			next_exists: next /= Void
			item_inserted: not old before implies ({n: like next} next and then n.item = v)
			item_inserted_before: old before implies ({c: like active} active and then c.item = v)
		end

	replace (v: like item) is
			-- Replace current item by `v'.
		local
			a: like active
		do
			a := active
			if a /= Void then
				a.put (v)
			end
		end

	merge_left (other: like Current) is
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		local
			other_first_element: like first_element
			other_last_element: like last_element
			other_count: INTEGER
			p: like first_element
		do
			other_last_element := other.last_element
			if other_last_element /= Void then
				other_first_element := other.first_element
				other_count := other.count
					check
						other_first_element /= Void
						other_last_element /= Void
					end
				if is_empty then
					first_element := other_first_element
					active := first_element
				elseif isfirst then
					other_last_element.put_right (first_element)
					first_element := other_first_element
				else
					p := previous
					if p /= Void then
						p.put_right (other_first_element)
					end
					other_last_element.put_right (active)
				end
				count := count + other_count
				other.wipe_out
			end
		end

	merge_right (other: like Current) is
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		local
			other_first_element: like first_element
			other_last_element: like last_element
			other_count: INTEGER
			a: like active
		do
			other_last_element := other.last_element
			if other_last_element /= Void then
				other_first_element := other.first_element
				other_count := other.count
					check
						other_first_element /= Void
						other_last_element /= Void
					end
				a := active
				if a = Void then
					first_element := other_first_element
					active := first_element
				else
					if not islast then
						other_last_element.put_right (a.right)
					end
					a.put_right (other_first_element)
				end
				count := count + other_count
				other.wipe_out
			end
		end

feature -- Removal

	remove is
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor).
		local
			succ: like first_element
			removed: like active
			a: like active
			p: like previous
		do
			removed := active
			if removed /= Void then
				if isfirst then
					first_element := removed.right
					removed.forget_right
					active := first_element
					if count = 1 then
						check
							no_active: active = Void
						end
						after := True
					end
				elseif islast then
					active := previous
					a := active
					if a /= Void then
						a.forget_right
					end
					after := True
				else
					succ := removed.right
					p := previous
					if p /= Void then
						p.put_right (succ)
					end
					removed.forget_right
					active := succ
				end
				count := count - 1
				cleanup_after_remove (removed)
			end
		end

	remove_left is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		do
			move (- 2)
			remove_right
			forth
		end

	remove_right is
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		local
			removed: like first_element
			f: like first_element
			a: like active
			succ: like active
		do
			if before then
				f := first_element
				if f /= Void then
					removed := f
					first_element := f.right
					a := active
					if a /= Void then
						a.forget_right
					end
					active := first_element
				end
			else
				a := active
				if a /= Void then
					succ := a.right
					if succ /= Void then
						removed := succ
						a.put_right (succ.right)
						succ.forget_right
					end
				end
			end
			count := count - 1
			cleanup_after_remove (removed)
		end

	wipe_out is
			-- Remove all items.
		do
			internal_wipe_out
		end

feature -- Duplication

	copy (other: like Current) is
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
		local
			cur: ?LINKED_LIST_CURSOR [G]
			obj_comparison: BOOLEAN
		do
			obj_comparison := other.object_comparison
			standard_copy (other)
			if not other.is_empty then
				internal_wipe_out
				if {l_cur: LINKED_LIST_CURSOR [G]} other.cursor then
					cur := l_cur
				end
				from
					other.start
				until
					other.off
				loop
					extend (other.item)
						-- For speeding up next insertion, we go
						-- to the end, that way `extend' does not
						-- need to traverse the list completely.
					finish
					other.forth
				end
				if cur /= Void then
					other.go_to (cur)
				end
			end
			object_comparison := obj_comparison
		end

feature {LINKED_LIST} -- Implementation

	new_chain: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make
		end

	new_cell (v: like item): LINKABLE [like item] is
			-- A newly created instance of the same type as `first_element'.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result
			Result.put (v)
		ensure
			result_exists: Result /= Void
		end

	previous: like first_element is
			-- Element left of cursor
		local
			p: like first_element
		do
			if after then
				Result := active
			elseif not (isfirst or before) then
				from
					p := first_element
				until
					p = Void or else p.right = active
				loop
					p := p.right
				end
				Result := p
			end
		end

	next: like first_element is
			-- Element right of cursor
		local
			a: like active
		do
			if before then
				Result := active
			else
				a := active
				if a /= Void then
					Result := a.right
				end
			end
		end

	active: like first_element
			-- Element at cursor position

	first_element: ?like new_cell
			-- Head of list

	last_element: like first_element is
			-- Tail of list
		local
			p: like first_element
		do
			from
				p := active
			until
				p = Void
			loop
				Result := p
				p := p.right
			end
		end

	cleanup_after_remove (v: like first_element) is
			-- Clean-up a just removed cell.
		require
			non_void_cell: v /= Void
		do
		end

feature {NONE} -- Implementation

	frozen internal_wipe_out is
			-- Remove all items.
			--| Used by `copy' instead of `wipe_out' to ensure that it
			--| will behave consistently even in descendants that
			--| redefine `wipe_out'.
		require
			prunable
		do
			active := Void
			first_element := Void
			before := True
			after := False
			count := 0
		ensure
			wiped_out: is_empty
			is_before: before
		end

invariant

	prunable: prunable
	empty_constraint: is_empty implies ((first_element = Void) and
				(active = Void))
	not_void_unless_empty: (active = Void) implies is_empty
	before_constraint: before implies (active = first_element)
	after_constraint: after implies (active = last_element)

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2008, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"

end -- class LINKED_LIST
