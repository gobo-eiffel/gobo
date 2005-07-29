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

			if include_self and then node_test.matches_node (starting_node.node_type, starting_node.fingerprint, starting_node.type_annotation) then
				first_node := starting_node
			end

			-- Now catch the case where the first node is an attribute or namespace node

			next_node := starting_node.parent 
			if next_node /= Void and then not node_test.matches_node (next_node.node_type, next_node.fingerprint, next_node.type_annotation) then
				advance
			end
		ensure
			starting_node_set: starting_node = a_start_node
			test_set: node_test = a_node_test
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
			index := 1
			if first_node /= Void then
				current_item := first_node
				first_node := Void
			else
				current_item := next_node
			end
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			advance
			if first_node /= Void then
				current_item := first_node
				first_node := Void
			else
				current_item := next_node
			end
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

	first_node: XM_XPATH_TINY_NODE
			-- The first node to possibly be returned by the enumeration

	next_node: XM_XPATH_TINY_NODE
			-- The next node to be returned by the enumeration

	advance is
			-- Move to the next matching node
		do
			from
				next_node := next_node.parent
			until
				next_node = Void or else node_test.matches_node (next_node.node_type, next_node.fingerprint, next_node.type_annotation)
			loop
				next_node := next_node.parent
			end
		end
	
invariant

	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void
	
end
	
