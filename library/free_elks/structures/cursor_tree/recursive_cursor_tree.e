indexing

	description:
		"Cursor trees with a recursive structure"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: recursive_cursor_tree, cursor_tree, tree;
	access: cursor, membership;
	representation: recursive;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

deferred class RECURSIVE_CURSOR_TREE [G] inherit

	CURSOR_TREE [G]
		redefine
			is_empty, extendible, extend
		end

feature -- Access

	item: G is
			-- Item at cursor position
		local
			a: like active
		do
			a := active
			check
				a_attached: a /= Void
			end
			Result := a.item
		end

	cursor: RECURSIVE_TREE_CURSOR [G] is
			-- Current cursor position
		do
			create Result.make (active, active_parent, after, before, below)
		end

feature -- Measurement

	arity: INTEGER is
			-- Number of children of active node.
			-- If cursor is `above', 0 if tree is empty, 1 otherwise.
		require else
			valid_cursor: not off or else above
		local
			a: like active
		do
			a := active
			if a /= Void then
				Result := a.arity
			end
		end

	count: INTEGER is
			-- Number of items in the tree
		local
			pos: like cursor
		do
			pos := cursor
			from
				start
			until
				off
			loop
				Result := Result + 1
				preorder_forth
			end
			go_to (pos)
			corresponding_child
		end

feature -- Status report

	after: BOOLEAN
			-- Is there no valid cursor position to the right of cursor?

	before: BOOLEAN
			-- Is there no valid cursor position to the left of cursor?

	above: BOOLEAN is
			-- Is there no valid cursor position above cursor?
		do
			if not below then
				Result := (active_parent = Void)
			end
		end

	is_empty: BOOLEAN is
			-- Is the tree empty?
		local
			a: like above_node
		do
			a := above_node
			if a /= Void then
				Result := a.arity = 0
			end
		end

	extendible: BOOLEAN is
			-- May new items be added on current level?
		do
			Result := (not above) and (not is_root)
		end

	isfirst: BOOLEAN is
			-- Is cursor on first sibling?
		local
			a: like active_parent
		do
			a := active_parent
			if not off and then a /= Void then
				Result := a.child_isfirst
			end
		end

	islast: BOOLEAN is
			-- Is cursor on last sibling?
		local
			a: like active_parent
		do
			a := active_parent
			if not off and then a /= Void then
				Result := a.child_islast
			end
		end

	is_root: BOOLEAN is
			-- Is cursor on tree root?
		do
			if not off then
				Result := (active_parent = above_node)
			end
		end

	valid_cursor (p: CURSOR): BOOLEAN is
			-- Can the cursor be moved to position `p'?
		local
			pos: like cursor
		do
			if {temp: like cursor} p then
				if temp.active = above_node or temp.before or
					temp.after or temp.below
				then
					Result := True
				else
					pos := cursor
					from
						start
					until
						active = temp.active or else off
					loop
						preorder_forth
					end
					Result := not off
					go_to (pos)
				end
			end
		end

feature -- Cursor movement

	back is
			-- Move cursor one position backward.
		local
			a: like active_parent
			c: ?like active
		do
			if below then
				after := False
				before := True
			elseif after then
				after := False
			elseif isfirst then
				before := True
			else
				a := active_parent
				if a /= Void then
					a.child_back
					c := a.child
					check
						c_attached: c /= Void
					end
					active := c
				end
			end
		end

	forth is
			-- Move cursor one position forward.
		local
			a: like active_parent
			c: ?like active
		do
			if below then
				before := False
				after := True
			elseif before then
				before := False
			elseif islast then
				after := True
			else
				a := active_parent
				if a /= Void then
					a.child_forth
					c := a.child
					check
						c_attached: c /= Void
					end
					active := c
				end
			end
		end

	up is
			-- Move cursor one level upward to parent,
			-- or `above' if `is_root' holds.
		local
			a: ?like active
		do
			if below then
				below := False
			else
				a := active_parent
				check
					a_attached: a /= Void
				end
				active := a
				active_parent := a.parent
				corresponding_child
			end
			after := False
			before := False
		end

	down (i: INTEGER) is
			-- Move cursor one level downward:
			-- to `i'-th child if there is one,
			-- or `after' if `i' = `arity' + 1,
			-- or `before' if `i' = 0.
		local
			a: like active
			c: ?like active
		do
			if i = 0 then
				if arity = 0 then
					below := True
				else
					a := active
					active_parent := a
					a.child_go_i_th (1)
					c := a.child
					check
						c_attached: c /= Void
					end
					active := c
				end
				before := True
			elseif above or else i <= arity then
				a := active
				active_parent := a
				a.child_go_i_th (i)
				c := a.child
				check
					c_attached: c /= Void
				end
				active := c
			else
				if arity = 0 then
					below := True
				else
					a := active
					active_parent := a
					a.child_go_i_th (arity)
					c := a.child
					check
						c_attached: c /= Void
					end
					active := c
				end
				after := True
			end
		end

	go_to (p: CURSOR) is
			-- Move cursor to position `p'.
		do
			if {temp: like cursor} p then
				unchecked_go (temp)
			else
				check
					False
				end
			end
		end

feature -- Insert element

	extend (v: G) is
			-- Add `v' after last child.
			-- Make `v' the `first_child' if `below' and place
			-- cursor `before'.
		local
			pos: CURSOR
		do
			pos := cursor
			go_last_child
			put_right (v)
			go_to (pos)
			if below then
				below := False
				before := False
				after := False
				down (0)
			end
		end

feature -- Element change

	replace (v: G) is
			-- Replace current item by `v'.
		local
			a: like active
		do
			a := active
			if a /= Void then
				a.replace (v)
			end
		end

feature -- Removal

	remove is
			-- Remove node at cursor position
			-- (and consequently the corresponding
			-- subtree). Cursor moved up one level.
		local
			a: ?like active
		do
			corresponding_child
			a := active_parent
			check
				a_attached: a /= Void
			end
			active := a
			active_parent := a.parent
			a.remove_child
			a.child_back
		ensure then
			not_off_unless_empty: is_empty or else not off
		end

	wipe_out is
			-- Remove all items.
		local
			a: like above_node
		do
			if not is_empty then
				a := above_node
				if a /= Void then
					a.child_start
					a.remove_child
				end
			end
			active := above_node
			active_parent := Void
			after := False
			before := False
			below := False
		ensure then
			cursor_above: above
		end

feature {NONE} -- Implementation

	active: DYNAMIC_TREE [G]
			-- Current node

	active_parent: ?like active
			-- Parent of current node

	above_node: like active
			-- Node above root; physical root of tree

	corresponding_child is
			-- Make `active' the current child of `active_parent'.
		require
			active_exists: active /= Void
		local
			a: like active_parent
		do
			a := active_parent
			if a /= Void then
				a.set_child (active)
			end
		end

	unchecked_go (p: like cursor) is
			-- Make an attempt to move cursor
			-- to position `p', without checking
			-- whether `p' is a valid cursor position
			-- or not.
		local
			a: ?like active
		do
			active_parent := p.active_parent
			a := p.active
			check
				a_attached: a /= Void
			end
			active := a
			corresponding_child
			after := p.after
			before := p.before
			below := p.below
		end

invariant
	coherency: not above implies ({a: like active_parent} active_parent and then a.child = active)

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

end -- class RECURSIVE_CURSOR_TREE
