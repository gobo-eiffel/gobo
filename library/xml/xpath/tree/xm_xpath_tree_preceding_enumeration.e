indexing

	description:

		"Objects that enumerate the preceding:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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

	make (a_starting_node: XM_XPATH_TREE_NODE; a_node_test: XM_XPATH_NODE_TEST) is
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

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Does `Current' yield a node_sequence?	
		local
			a_tree_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_TREE_NODE]
		do
			a_tree_node_iterator ?= ANY_.to_any (Current)
			Result := a_tree_node_iterator
		end

feature -- Cursor movement

	start is
			-- Move to next position
		do
			index := 1
			current_item := next_node
		end

	forth is
			-- Move to next position
		do
			index := index + 1
			advance
			current_item := next_node
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (starting_node, node_test)
		end

feature {NONE} -- Implemnentation

	next_ancestor: like starting_node
			-- Next ancestor;
			--  tested by `is_conforming' and adjusted by advance

	advance_one_step is
			-- Move to the next candidate node
		do
			next_node := next_node.previous_node_in_document_order
		end
	
	is_conforming (a_node: like starting_node): BOOLEAN is
			-- Does `a_node' conform to `node_test', or is it `Void'?
		local
			is_ancestor: BOOLEAN
		do
			if a_node /= Void then
				if a_node.is_same_node (next_ancestor) then
						check
							next_ancestor_not_void: next_ancestor /= Void
							-- We'll never test the root node, because it's always
							--  an ancestor, so next_ancestor will never be `Void'.
						end
					is_ancestor := True
				end
			end
			if not is_ancestor then Result := Precursor (a_node) end
		end

	advance is
			-- Move to the next matching node
		do
			from
				advance_one_step
			until
				is_conforming (next_node)
			loop
				if next_node.is_same_node (next_ancestor) then next_ancestor := next_ancestor.parent end
				advance_one_step
			end
		end

end
	
