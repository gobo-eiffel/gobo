note

	description:
		"[
		Binary search trees; left child item is less than current item,
		right child item is greater
		]"
	legal: "See notice at end of class."

	status: "See notice at end of class."
	names: binary_search_tree, tree;
	representation: recursive, array;
	access: cursor, membership;
	contents: generic;
	date: "$Date$"
	revision: "$Revision$"

class BINARY_SEARCH_TREE [G -> COMPARABLE] inherit

	BINARY_TREE [G]
		rename
			make as bt_make,
			put as bt_put
		export {BINARY_SEARCH_TREE}
			put_left_child, put_right_child,
			remove_left_child, remove_right_child
		redefine
			parent, has
		end

create
	make

create {BINARY_SEARCH_TREE}
	bt_make

feature {NONE} -- Initialization

	make (v: like item)
			-- Create single node with item `v'.
		require
			v_not_void: v /= Void
		do
			bt_make (v)
		ensure
			item_set: item = v
			is_root: is_root
			is_leaf: is_leaf
		end


feature -- Access

	parent: ?BINARY_SEARCH_TREE [G]
			-- Parent of current node

 	has (v: like item): BOOLEAN
			-- Does tree contain a node whose item
			-- is equal to `v' (object comparison)?
		local
			c: like left_child
			i: like item
		do
			if v /= Void then
				if items_equal (item, v) then
					Result := True
				else
					i := item
					if i /= Void then
						if v < i then
							c := left_child
						else
							c := right_child
						end
						if c /= Void then
							set_comparison_mode (c)
							Result := c.has (v)
						end
					end
				end
			end
		end

	tree_item (v: like item): ?like Current
			-- Node whose item is equal to `v' (object_comparison)
			-- otherwise default value.
		require
			v_not_void: v /= Void
		local
			c: like left_child
			i: like item
		do
			if items_equal (item, v) then
				Result := Current
			else
				i := item
				if i /= Void then
					if v < i then
						c := left_child
						if c /= Void then
							set_comparison_mode (c)
							Result := c.tree_item (v)
						end
					else
						c := right_child
						if c /= Void then
							set_comparison_mode (c)
							Result := c.tree_item (v)
						end
					end
				end
			end
		end

feature -- Measurement

	min: like item
			-- Minimum item in tree
		local
			l: like left_child
		do
			l := left_child
			if l /= Void then
				Result := l.min
			else
				Result := item
			end
		ensure
			minimum_present: has (Result)
			-- smallest: For every item `it' in tree, `Result' <= it
		end

	max: like item
			-- Maximum item in tree
		local
			r: like right_child
		do
			r := right_child
			if r /= Void then
				Result := r.max
			else
				Result := item
			end
		ensure
			maximum_present: has (Result)
			-- largest: For every item `it' in tree, `it' <= Result
		end

feature	-- Status report

	sorted: BOOLEAN
			-- Is tree sorted?
		local
			c: like left_child
		do
			Result := True
			if
				(has_left and then left_item > item)
				or (has_right and then right_item < item)
			then
				Result := False
			else
				c := left_child
				if c /= Void then
					Result := c.sorted_and_less (item)
				end
				c := right_child
				if c /= Void and Result then
					Result := c.sorted
				end
			end
		end

	sorted_and_less (i: like item): BOOLEAN
			-- Is tree sorted and all its elements less then i
		local
			c: like left_child
		do
			Result := True
			if
				(has_left and then left_item > item)
				or (has_right and then right_item < item)
			then
				Result := False
			else
				c := left_child
				if c /= Void then
					Result := c.sorted_and_less (item)
				end
				c := right_child
				if c /= Void and Result then
					Result := c.sorted_and_less (i)
				end
			end
		end


feature -- Cursor movement

	node_action (v: like item)
			-- Operation on node item,
			-- to be defined by descendant classes.
			-- Here it is defined as an empty operation.
			-- Redefine this procedure in descendant classes if useful
			-- operations are to be performed during traversals.
		do
		end

	preorder
			-- Apply `node_action' to every node's item
			-- in tree, using pre-order.
		local
			c: like left_child
		do
			node_action (item)
			c := left_child
			if c /= Void then
				c.preorder
			end
			c := right_child
			if c /= Void then
				c.preorder
			end
		end

	i_infix
			-- Apply node_action to every node's item
			-- in tree, using infix order.
		local
			c: like left_child
		do
			c := left_child
			if c /= Void then
				c.i_infix
			end
			node_action (item)
			c := right_child
			if c /= Void then
				c.i_infix
			end
		end

	postorder
			-- Apply node_action to every node's item
			-- in tree, using post-order.
		local
			c: like left_child
		do
			c := left_child
			if c /= Void then
				c.postorder
			end
			c := right_child
			if c /= Void then
				c.postorder
			end
			node_action (item)
		end

feature -- Element change

	put, extend (v: like item)
			-- Put `v' at proper position in tree
			-- (unless `v' exists already).
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		require
			new_item_exists: v /= Void
		local
			c: like left_child
			i: like item
		do
			if not items_equal (v, item) then
				i := item
				if i /= Void and then v < i then
					c := left_child
					if c = Void then
						c := new_tree
						put_left_child (c)
						c.replace (v)
					else
						c.put (v)
					end
				else
					c := right_child
					if c = Void then
						c := new_tree
						put_right_child (c)
						c.replace (v)
					else
						c.put (v)
					end
				end
			end
		ensure
			item_inserted: has (v)
		end

feature -- Transformation

	sort
			-- Sort tree.
			--| Uses heapsort.
			--| The reason for the `external sort' is that
			--| the insertion order in the tree will ensure
			--| it is balanced
		local
			seq: LINEAR [G]
			temp: ARRAY [G]
			heap: HEAP_PRIORITY_QUEUE [G]
			i: INTEGER
		do
			seq := linear_representation
			i := count
			remove_left_child
			remove_right_child
			from
				seq.start
				create heap.make (i)
			until
				seq.off
			loop
				heap.put (seq.item)
				seq.forth
			end
			from
				create temp.make (1, heap.count)
				i := 1
			until
				heap.is_empty
			loop
				temp.put (heap.item, i)
				heap.remove
				i := i + 1
			end
			replace (temp.item ((temp.count) // 2 + 1))
			fill_from_sorted_special (temp.area, 0, temp.count - 1)
		ensure
			is_sorted: sorted
		end

feature {BINARY_SEARCH_TREE, BINARY_SEARCH_TREE_SET} -- Implementation


	is_subset (other: like Current): BOOLEAN
			-- Is Current a subset of other
		local
			c: like left_child
		do
			Result := other.has (item)
			if Result then
				c := left_child
				if c /= Void then
					Result := c.is_subset (other)
				end
			end
			if Result then
				c := right_child
				if c /= Void then
					Result := c.is_subset (other)
				end
			end
		end

	intersect (other: BINARY_SEARCH_TREE [G])
			-- Remove all items not in `other'.
		local
			c: like left_child
		do
			c := right_child
			if c /= Void then
				c.intersect (other)
			end
			c := left_child
			if c /= Void then
				c.intersect (other)
			end
			if not other.has (item) then
				remove_node
			end
		end

	subtract (other: BINARY_SEARCH_TREE [G])
			-- Remove all items also in `other'.
		require
			set_exists: other /= Void
		local
			c: like left_child
		do
			c := right_child
			if c /= Void then
				c.subtract (other)
			end
			c := left_child
			if c /= Void then
				c.subtract (other)
			end
			if other.has (item) then
				remove_node
			end
		end

	merge (other: like Current)
			-- Add all items of `other'.
		local
			c: like left_child
		do
			c := other.right_child
			if c /= Void then
				merge (c)
			end
			c := other.left_child
			if c /= Void then
				merge (c)
			end
			extend (other.item)
		end

	remove_node
			-- Remove current node from the tree.
		require
			is_not_root: not is_root
		local
			is_left_child: BOOLEAN
			m: like Current
			p: like parent
			c: like left_child
		do
			p := parent
			if p /= Void then
				is_left_child := Current = p.left_child
				c := right_child
				if c = Void then
					c := left_child
					if c /= Void then
						c.attach_to_parent (Void)
					end
					if is_left_child then
						p.put_left_child (c)
					else
						p.put_right_child (c)
					end
					parent := Void
				elseif not has_left then
					c.attach_to_parent (Void)
					if is_left_child then
						p.put_left_child (c)
					else
						p.put_right_child (c)
					end
					parent := Void
				else
					m := c.min_node
					m.remove_node
					item := m.item
				end
			end
		end

	pruned (v: like item; par: ?like Current): ?like Current
			-- Prune `v'.
			-- (`par' is the parent node of the current node, needed to update
			-- `parent' correctly.)
		local
			m: like Current
			c: like left_child
		do
			if items_equal (item, v) then
				if has_none then
					-- Do nothing: Void Result
				else
					Result := right_child
					if Result = Void then
						Result := left_child
						if Result /= Void then
							Result.attach_to_parent (par)
						end
					elseif not has_left then
						Result.attach_to_parent (par)
					else
						c := right_child
						if c /= Void then
							m := c.min_node
							m.remove_node
							item := m.item
						end
						Result := Current
					end
				end
			else
				Result := Current
				if v < item then
					c := left_child
					if c /= Void then
						left_child := c.pruned (v, Current)
					end
				else
					c := right_child
					if c /= Void then
						right_child := c.pruned (v, Current)
					end
				end
			end
		end

	min_node: like Current
			-- Node containing min
		local
			l: like left_child
		do
			l := left_child
			if l /= Void then
				Result := l.min_node
			else
				Result := Current
			end
		end

	max_node: like Current
			-- Node containing max
		local
			r: like right_child
		do
			r := right_child
			if r /= Void then
				Result := r.max_node
			else
				Result := Current
			end
		end

feature {NONE} -- Implementation

	fill_from_sorted_special (t: SPECIAL [G]; s, e: INTEGER)
			-- Put values from `t' into tree in such an order that
			-- the tree will be balanced if `t' is sorted.
		local
			m: INTEGER
		do
			m := (s + e) // 2
			put (t.item (m))
			if m - 1 >= s then
				fill_from_sorted_special (t, s, m - 1)
			end
			if m + 1 <= e then
				fill_from_sorted_special (t, m + 1, e)
			end
		end

	items_equal (src, dest: like item): BOOLEAN
			-- Are `src' and `dest' equal?
			-- (depending on `object_comparison')
		do
			if object_comparison then
				Result := src ~ dest
			else
				Result := src = dest
			end
		end

	set_comparison_mode (t: like Current)
			-- Set comparison mode of `t' to the same mode as `Current'.
		require
			not_void: t /= Void
		do
			if object_comparison then
				t.compare_objects
			else
				t.compare_references
			end
		ensure
			mode_set: object_comparison = t.object_comparison
		end

note
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

end -- class BINARY_SEARCH_TREE


