note

	description:

		"Objects that enumerate the preceding:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_PRECEDING_ENUMERATION

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TREE_NODE]
		redefine
			start, as_node_iterator
		end

	XM_XPATH_TREE_ENUMERATION
		redefine
			is_conforming, advance
		end

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

			-- we need to avoid returning ancestors of the starting node

			next_node := starting_node
			next_ancestor := starting_node.parent
			advance
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

feature {NONE} -- Implemnentation

	next_ancestor: detachable like starting_node
			-- Next ancestor;
			--  tested by `is_conforming' and adjusted by advance

	advance_one_step
			-- Move to the next candidate node
		do
			check precondition_next_node_not_void: attached next_node as l_next_node then
				next_node := l_next_node.previous_node_in_document_order
			end
		end

	is_conforming (a_node: detachable like starting_node): BOOLEAN
			-- Does `a_node' conform to `node_test', or is it `Void'?
		local
			is_ancestor: BOOLEAN
		do
			if a_node /= Void then
				if attached next_ancestor as l_next_ancestor and then a_node.is_same_node (l_next_ancestor) then
						check
							next_ancestor_not_void: next_ancestor /= Void
							-- We'll never test the root node, because it's always
							--  an ancestor, so next_ancestor will never be `Void'.
						end
					is_ancestor := True
				end
			end
			if not is_ancestor then
				Result := Precursor (a_node)
			end
		end

	advance
			-- Move to the next matching node
		do
			from
				advance_one_step
			until
				is_conforming (next_node)
			loop
				if attached next_node as l_next_node and then attached next_ancestor as l_next_ancestor and then l_next_node.is_same_node (l_next_ancestor) then
					next_ancestor := l_next_ancestor.parent
				end
				advance_one_step
			end
		end

end

