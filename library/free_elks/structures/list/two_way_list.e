indexing

	description:
		"Sequential, two-way linked lists"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: two_way_list, sequence;
	representation: linked;
	access: index, cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class TWO_WAY_LIST [G] inherit

	LINKED_LIST [G]
		redefine
			first_element, last_element,
			extend, put_front, put_left, put_right,
			merge_right, merge_left, new_cell,
			remove, remove_left, remove_right, wipe_out,
			previous, finish, move, islast, new_chain,
			forth, back, cursor
		select
			put_front,
			merge_right,
			move, put_right,
			wipe_out
		end

	LINKED_LIST [G]
		rename
			put_front as ll_put_front,
			put_right as ll_put_right,
			merge_right as ll_merge_right,
			move as ll_move,
			wipe_out as ll_wipe_out
		export
			{NONE}
				ll_put_front, ll_put_right,
				ll_move, ll_merge_right, ll_wipe_out
		redefine
			put_left, merge_left, remove, new_chain,
			remove_left, finish, islast, first_element, extend,
			last_element, previous, new_cell, remove_right,
			forth, back, cursor
		end

create
	make
	
create {TWO_WAY_LIST}
	make_sublist

feature -- Access

	first_element: BI_LINKABLE [G]
			-- Head of list
			-- (Anchor redefinition)

	last_element: like first_element
			-- Tail of the list

	sublist: like Current
			-- Result produced by last `split'

	cursor: TWO_WAY_LIST_CURSOR [G] is
			-- Current cursor position
		do
			create Result.make (active, after, before)
		end
		
feature -- Status report

	islast: BOOLEAN is
			-- Is cursor at last position?
		do
			Result := (active = last_element)
				and then not after
				and then not before
		end

feature -- Cursor movement

	forth is
			-- Move cursor to next position, if any.
		do
			if before then
				before := False
				if is_empty then
					after := True
				end
			else
				active := active.right
				if active = Void then
					active := last_element
					after := True
				end
			end
		end

	back is
			-- Move cursor to previous position, if any.
		do
			if after then
				after := False
				if is_empty then
					before := True
				end
			else
				active := active.left
				if active = Void then
					active := first_element
					before := True
				end
			end
		end

	finish is
			-- Move cursor to last position.
			-- (Go before if empty)
		do
			if not is_empty then
				active := last_element
				after := False
				before := False
			else
				after := False
				before := True
			end
		ensure then
			not_after: not after
		end

	move (i: INTEGER) is
			-- Move cursor `i' positions. The cursor
			-- may end up `off' if the offset is to big.
		local
			counter: INTEGER
			p: like first_element
		do
			if i > 0 then
				ll_move (i)
			elseif i < 0 then
				if after then
					after := False
					counter := -1
				end
				from
					p := active
				until
					(counter = i) or else (p = Void)
				loop
					p := p.left
					counter := counter - 1
				end
				if p = Void then
					before := True
					active := first_element
				else
					active := p
				end
			end
		end

feature -- Element change

	put_front (v: like item) is
			-- Add `v' to beginning.
			-- Do not move cursor.
		do
			ll_put_front (v)
			if count = 1 then
				last_element := first_element
			end
		end

	extend (v: like item) is
			-- Add `v' to end.
			-- Do not move cursor.
		local
			p: like first_element
		do
			p := new_cell (v)
			if is_empty then
				first_element := p
				active := p
			else
				p.put_left (last_element)
			end
			last_element := p
			if after then
				active := p
			end
			count := count + 1
		end

	put_left (v: like item) is
			-- Add `v' to the left of cursor position.
			-- Do not move cursor.
		local
			p: like first_element
		do
			p := new_cell (v)
			if is_empty then
				first_element := p
				last_element := p
				active := p
				before := False
			elseif after then
				p.put_left (last_element)
				last_element := p
				active := p
			elseif isfirst then
				p.put_right (active)
				first_element := p
			else
				p.put_left (active.left)
				p.put_right (active)
			End
			count := count + 1
		end

	put_right (v: like item) is
			-- Add `v' to the right of cursor position.
			-- Do not move cursor.
		local
			was_last: BOOLEAN
		do
			was_last := islast
			ll_put_right (v)
			if count = 1 then
					-- `p' is only element in list
				last_element := active
			elseif was_last then
					-- `p' is last element in list
				last_element := active.right
			end
		end

	merge_left (other: like Current) is
			-- Merge `other' into current structure before cursor
			-- position. Do not move cursor. Empty `other'.
		local
			other_first_element: like first_element
			other_last_element: like first_element
			other_count: INTEGER
		do
			if not other.is_empty then
				other_first_element := other.first_element
				other_last_element := other.last_element
				other_count := other.count
					check
						other_first_element /= Void
						other_last_element /= Void
					end
				if is_empty then
					last_element := other_last_element
					first_element := other_first_element
					if before then
						active := first_element
					else -- after because of invariant 'empty_property'
						active := last_element
					end
				elseif isfirst then
					other_last_element.put_right (first_element)
					first_element := other_first_element
				elseif after then
					other_first_element.put_left (last_element)
					last_element := other_last_element
					active := last_element
				else
					other_first_element.put_left (active.left)
					active.put_left (other_last_element)
				end
				count := count + other_count
				other.wipe_out
			end
		end

	merge_right (other: like Current) is
			-- Merge `other' into current structure after cursor
			-- position. Do not move cursor. Empty `other'.
		do
			if is_empty or else islast then
				last_element := other.last_element
			end
			ll_merge_right (other)
		end

feature -- Removal

	remove is
			-- Remove current item.
			-- Move cursor to right neighbor
			-- (or `after' if no right neighbor).
		local
			succ, pred, removed: like first_element
		do
			removed := active
			if isfirst then
				active := first_element.right
				first_element.forget_right
				first_element := active
				if count = 1 then
					check
						no_active: active = Void
					end
					after := True
					last_element := Void
				end
			elseif islast then
				active := last_element.left
				last_element.forget_left
				last_element := active
				after := True
			else
				pred := active.left
				succ := active.right
				pred.forget_right
				succ.forget_left
				pred.put_right (succ)
				active := succ
			end
			count := count - 1
			cleanup_after_remove (removed)
		end

	remove_left is
			-- Remove item to the left of cursor position.
			-- Do not move cursor.
		do
			back; remove
		end

	remove_right is
			-- Remove item to the right of cursor position.
			-- Do not move cursor.
		do
			forth; remove; back
		end

	wipe_out is
			-- Remove all items.
		do
			ll_wipe_out
			last_element := Void
		end

	split (n: INTEGER) is
			-- Remove from current list
			-- min (`n', `count' - `index' - 1) items
			-- starting at cursor position.
			-- Move cursor right one position.
			-- Make extracted sublist accessible
			-- through attribute `sublist'.
		require
			not_off: not off
			valid_sublist: n >= 0
		local
			actual_number, active_index: INTEGER
			p_elem, s_elem, e_elem, n_elem: like first_element
		do
			if n = 0 then
					--just create new empty sublist
				create sublist.make
			else
					-- recognize first breakpoint
				active_index := index
				if active_index + n > count + 1 then
					actual_number := count + 1 - active_index
				else
					actual_number := n
				end
				s_elem := active
				p_elem := previous
					-- recognize second breakpoint
				move (actual_number - 1)
				e_elem := active
				n_elem := next
					-- make sublist
				s_elem.forget_left
				e_elem.forget_right
				create sublist.make_sublist (s_elem, e_elem, actual_number)
					-- fix `Current'
				count := count - actual_number
				if p_elem /= Void then
					p_elem.put_right (n_elem)
				else
					first_element := n_elem
				end
				if n_elem /= Void then
					active := n_elem
				else
					last_element := p_elem
					active := p_elem
					after := True
				end
			end
		end

	remove_sublist is
		do
			sublist := Void
		end

feature {TWO_WAY_LIST} -- Implementation

	make_sublist (first_item, last_item: like first_element; n: INTEGER) is
			-- Create sublist
		do
			make
			first_element := first_item
			last_element := last_item
			active := first_element
			count := n
		end

	new_chain: like Current is
			-- A newly created instance of the same type.
			-- This feature may be redefined in descendants so as to
			-- produce an adequately allocated and initialized object.
		do
			create Result.make
		end

	new_cell (v: like item): like first_element is
			-- A newly created instance of the type of `first_element'.
		do
			create Result
			Result.put (v)
		end

	previous: like first_element is
			-- Element left of cursor
		do
			if after then
				Result := active
			elseif active /= Void then
				Result := active.left
			end
		end

invariant

	non_empty_list_has_two_endpoints: not is_empty implies
				(first_element /= Void and last_element /= Void)
	first_element_constraint: first_element /= Void implies 
				first_element.left = Void
	last_element_constraint: last_element /= Void implies 
				last_element.right = Void

indexing
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2006, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			 Eiffel Software
			 356 Storke Road, Goleta, CA 93117 USA
			 Telephone 805-685-1006, Fax 805-685-6869
			 Website http://www.eiffel.com
			 Customer support http://support.eiffel.com
		]"







end -- class TWO_WAY_LIST



