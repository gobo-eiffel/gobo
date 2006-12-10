indexing

	description:

		"Objects that enumerate the ancestor:: or ancestor-or-self:: Axes"

	library: "Gobo Eiffel XPATH Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ANCESTOR_ENUMERATION
	
inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]
		redefine
			start, as_node_iterator
		end

create

	make
	
feature {NONE} -- Initialization

	make (a_start_node: XM_XPATH_TINY_NODE; a_node_test: XM_XPATH_NODE_TEST; self: BOOLEAN) is
			-- Establish invariant
		require
			starting_node_not_void: a_start_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			starting_node := a_start_node
			node_test := a_node_test
			include_self := self
			current_item := starting_node
		ensure
			current_item_not_void: current_item /= Void
			starting_node_set: starting_node = a_start_node
			test_set: node_test = a_node_test
			include_self_set: include_self = self
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- `Current' seen as a node iterator
		local
			a_tiny_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TINY_NODE]
		do
			a_tiny_node_iterator ?= ANY_.to_any (Current)
			Result := a_tiny_node_iterator
		end

feature -- Cursor movement

	start is
			-- Move to next position
		do
			if include_self and node_test.matches_item (starting_node) then
				index := 1
			else
				forth
			end
		ensure then
			not_same_node: current_item /= Void and not include_self implies not starting_node.is_same_node (current_item)
		end

	forth is
			-- Move to next position
		local
			l_node: XM_XPATH_TINY_NODE
		do
			index := index + 1
			from
				l_node := current_item.parent
				current_item := l_node
			until
				l_node = Void or else node_test.matches_item (l_node)
			loop
				l_node := l_node.parent
			end
			if l_node /= Void then
				current_item := l_node
			end
		ensure then
			not_same_node: current_item /= Void implies not starting_node.is_same_node (current_item)
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node, node_test, include_self)
		end
	
feature {NONE} -- Implemnentation

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	include_self: BOOLEAN
			-- Do we include ourself in the enumeration

	advance is
			-- Move to the next matching node
		do
			-- Not used
		end
	
invariant

	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void
	
end
	
