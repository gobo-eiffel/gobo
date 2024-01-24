note

	description:

		"Objects that enumerate the ancestor:: or ancestor-or-self:: Axes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TREE_ANCESTOR_ENUMERATION

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TREE_NODE]
		redefine
			start, as_node_iterator
		end

	XM_XPATH_TREE_ENUMERATION

create

	make

feature {NONE} -- Initialization

	make (a_starting_node: XM_XPATH_TREE_NODE; a_node_test: XM_XPATH_NODE_TEST; self: BOOLEAN)
			-- Establish invariant
		require
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			make_enumeration (a_starting_node, a_node_test)
			include_self := self
			next_node := starting_node
			if not include_self or else not is_conforming (next_node) then
				advance
			end
		ensure
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
			include_self: include_self = self
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Does `Current' yield a node_sequence?
		do
			Result := Current
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
			create Result.make (starting_node, node_test, include_self)
		end

feature {NONE} -- Implemnentation

	include_self: BOOLEAN
			-- Do we include ourself in the enumeration

	advance_one_step
			-- Move to the next candidate node
		do
			check precondition_next_node_not_void: attached next_node as l_next_node then
				next_node := l_next_node.parent
			end
		end

end

