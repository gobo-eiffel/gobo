note

	description:

		"Objects that enumerate the following-sibling:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2012, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_FOLLOWING_SIBLING_ENUMERATION

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TREE_NODE]
		redefine
			start, as_node_iterator
		end

	XM_XPATH_TREE_ENUMERATION

create

	make

feature {NONE} -- Initialization

	make (a_starting_node: XM_XPATH_TREE_NODE; a_node_test: XM_XPATH_NODE_TEST)
			-- Establish invariant
		require
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			make_enumeration (a_starting_node, a_node_test)
			next_node := starting_node
			advance
		ensure
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Does `Current' yield a node_sequence?
		do
			if attached {XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TREE_NODE]} Current as a_tree_node_iterator then
				Result := a_tree_node_iterator
			end
		end

feature -- Cursor movement

	start
			-- Move to next position
		do
			index := 1
			current_item := next_node
		end

	forth
			-- Move to next position
		do
			index := index + 1
			advance
			current_item := next_node
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node, node_test)
		end

feature {NONE} -- Implemnentation


	advance_one_step
			-- Move to the next candidate node
		local
			a_node: XM_XPATH_NODE
		do
			a_node := next_node.next_sibling
			if a_node /= Void then
				next_node := a_node.as_tree_node
			else
				next_node := Void
			end
		end

end

