indexing

	description: 
		"[
		Binary search trees; left child item is less than current item,
		right child item is greater
		]"

	status: "See notice at end of class"
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

	make (v: like item) is
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

	parent: BINARY_SEARCH_TREE [G]
			-- Parent of current node

 	has (v: like item): BOOLEAN is
			-- Does tree contain a node whose item
			-- is equal to `v' (object comparison)?
		require else
			argument_not_void: v /= Void
		do
			if items_equal (item, v) then
				Result := True
			elseif v < item then
				if left_child /= Void then
					set_comparison_mode (left_child)
					Result := left_child.has (v)
				end
			else
				if right_child /= Void then
					set_comparison_mode (right_child)
					Result := right_child.has (v)
				end
			end
		end

feature -- Measurement

	min: like item is
			-- Minimum item in tree
		do
			if has_left then
				Result := left_child.min
			else
				Result := item
			end
		ensure
			minimum_present: has (Result)
			-- smallest: For every item `it' in tree, `Result' <= it
		end

	max: like item is
			-- Maximum item in tree
		do
			if has_right then
				Result := right_child.max
			else
				Result := item
			end
		ensure
			maximum_present: has (Result)
			-- largest: For every item `it' in tree, `it' <= Result
		end

feature	-- Status report

	sorted: BOOLEAN is
			-- Is tree sorted?
		do
			Result := True
			if
				(has_left and then left_item > item)
				or (has_right and then right_item < item)
			then
				Result := False
			else
				if has_left then
					Result := left_child.sorted_and_less (item)
				end
				if has_right and Result then
					Result := right_child.sorted
				end
			end
		end

	sorted_and_less (i: like item): BOOLEAN is
			-- Is tree sorted and all its elements less then i
		do
			Result := True
			if
				(has_left and then left_item > item)
				or (has_right and then right_item < item)
			then
				Result := False
			else
				if has_left then
					Result := left_child.sorted_and_less (item)
				end
				if has_right and Result then
					Result := right_child.sorted_and_less (i)
				end
			end
		end


feature -- Cursor movement

	node_action (v: like item) is
			-- Operation on node item,
			-- to be defined by descendant classes.
			-- Here it is defined as an empty operation.
			-- Redefine this procedure in descendant classes if useful
			-- operations are to be performed during traversals.
		do
		end

	preorder is
			-- Apply `node_action' to every node's item
			-- in tree, using pre-order.
		do
			node_action (item)
			if left_child /= Void then
				left_child.preorder
			end
			if right_child /= Void then
				right_child.preorder
			end
		end

	i_infix is
			-- Apply node_action to every node's item
			-- in tree, using infix order.
		do
			if left_child /= Void then
				left_child.i_infix
			end
			node_action (item)
			if right_child /= Void then
				right_child.i_infix
			end
		end

	postorder is
			-- Apply node_action to every node's item
			-- in tree, using post-order.
		do
			if left_child /= Void then
				left_child.postorder
			end
			if right_child /= Void then
				right_child.postorder
			end
			node_action (item)
		end

feature -- Element change

	put, extend (v: like item) is
			-- Put `v' at proper position in tree
			-- (unless `v' exists already).
			-- (Reference or object equality,
			-- based on `object_comparison'.)
		require
			new_item_exists: v /= Void
		do
			if not items_equal (v, item) then
				if v < item then
					if left_child = Void then
						put_left_child (new_tree)
						left_child.replace (v)
					else
						left_child.put (v)
					end
				else
					if right_child = Void then
						put_right_child (new_tree)
						right_child.replace (v)
					else
						right_child.put (v)
					end
				end
			end
		ensure
			item_inserted: has (v)
		end

feature -- Transformation

	sort is
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


	is_subset (other: like Current): BOOLEAN is
			-- Is Current a subset of other
		do
			Result := other.has (item)
			if Result and left_child /= Void then
				Result := left_child.is_subset (other)
			end
			if Result and right_child /= Void then
				Result := right_child.is_subset (other)
			end
		end

	intersect (other: BINARY_SEARCH_TREE [G]) is
			-- Remove all items not in `other'.
		do
			if right_child /= Void then
				right_child.intersect (other)
			end
			if left_child /= Void then
				left_child.intersect (other)
			end
			if not other.has (item) then
				remove_node
			end
		end

	subtract (other: BINARY_SEARCH_TREE [G]) is
			-- Remove all items also in `other'.
		require
			set_exists: other /= Void
		do
			if right_child /= Void then
				right_child.subtract (other)
			end
			if left_child /= Void then
				left_child.subtract (other)
			end
			if other.has (item) then
				remove_node
			end
		end

	merge (other: like Current) is
			-- Add all items of `other'.
		do
			if other.right_child /= Void then
				merge (other.right_child)
			end
			if other.left_child /= Void then
				merge (other.left_child)
			end
			extend (other.item)
		end

	remove_node is
			-- Remove current node from the tree.
		require
			is_not_root: not is_root
		local
			is_left_child: BOOLEAN
			m: like Current
		do
			is_left_child := Current = parent.left_child
			if not has_right then
				if left_child /= Void then
					left_child.attach_to_parent (Void)
				end
				if is_left_child then
					parent.put_left_child (left_child)
				else
					parent.put_right_child (left_child)
				end
				parent := Void
			elseif not has_left then
				if right_child /= Void then
					right_child.attach_to_parent (Void)
				end
				if is_left_child then
					parent.put_left_child (right_child)
				else
					parent.put_right_child (right_child)
				end
				parent := Void
			else
				m := right_child.min_node
				m.remove_node
				item := m.item
			end
		end

	pruned (v: like item; par: like Current): like Current is
			-- Prune `v'.
			-- (`par' is the parent node of the current node, needed to update
			-- `parent' correctly.)
		local
			m: like Current
		do
			if items_equal (item, v) then
				if has_none then
					-- Do nothing: Void Result
				elseif not has_right then
					left_child.attach_to_parent (par)
					Result := left_child
				elseif not has_left then
					right_child.attach_to_parent (par)
					Result := right_child
				else
					m := right_child.min_node
					m.remove_node
					item := m.item
					Result := Current
				end
			else
				Result := Current
				if v < item then
					if left_child /= Void then
						left_child := left_child.pruned (v, Current)
					end
				else
					if right_child /= Void then
						right_child := right_child.pruned (v, Current)
					end
				end
			end
		end

	min_node: like Current is
			-- Node containing min
		do
			if has_left then
				Result := left_child.min_node
			else
				Result := Current
			end
		end

	max_node: like Current is
			-- Node containing max
		do
			if has_right then
				Result := right_child.max_node
			else
				Result := Current
			end
		end

feature {NONE} -- Implementation

	fill_from_sorted_special (t: SPECIAL [G]; s, e: INTEGER) is
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

	items_equal (src, dest: like item): BOOLEAN is
			-- Are `src' and `dest' equal?
			-- (depending on `object_comparison')
		do
			if object_comparison then
				Result := src /= Void and then src.is_equal (dest)
			else
				Result := (src = dest)
			end
		end

	set_comparison_mode (t: like Current) is
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

indexing

	library: "[
			EiffelBase: Library of reusable components for Eiffel.
			]"

	status: "[
			Copyright 1986-2001 Interactive Software Engineering (ISE).
			For ISE customers the original versions are an ISE product
			covered by the ISE Eiffel license and support agreements.
			]"

	license: "[
			EiffelBase may now be used by anyone as FREE SOFTWARE to
			develop any product, public-domain or commercial, without
			payment to ISE, under the terms of the ISE Free Eiffel Library
			License (IFELL) at http://eiffel.com/products/base/license.html.
			]"

	source: "[
			Interactive Software Engineering Inc.
			ISE Building
			360 Storke Road, Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Electronic mail <info@eiffel.com>
			Customer support http://support.eiffel.com
			]"

	info: "[
			For latest info see award-winning pages: http://eiffel.com
			]"

end -- class BINARY_SEARCH_TREE


