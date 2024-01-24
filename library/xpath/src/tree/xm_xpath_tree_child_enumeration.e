note

	description:

		"Objects that enumerate the child:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TREE_CHILD_ENUMERATION

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
		local
			a_node: detachable XM_XPATH_NODE
		do
			make_enumeration (a_starting_node, a_node_test)
			a_node := starting_node.first_child
			if a_node /= Void and then a_node.is_tree_node then
				from
					next_node := a_node.as_tree_node
				until
					is_conforming (next_node)
				loop
					advance_one_step
				end
			end
		ensure
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
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
			create Result.make (starting_node, node_test)
		end

feature {NONE} -- Implementation

	advance_one_step
			-- Move to the next candidate node
		local
			a_node: detachable XM_XPATH_NODE
		do
			check precondition_next_node_not_void: attached next_node as l_next_node then
				a_node := l_next_node.next_sibling
				if a_node /= Void then
					check
						tree_node: a_node.is_tree_node
						-- Because trees cannot mix
					end
					next_node := a_node.as_tree_node
				else
					next_node := Void
				end
			end
		end

end

