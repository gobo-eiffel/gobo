indexing

	description:

		"Tiny tree nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TINY_NODE
	
inherit

	XM_XPATH_ABSTRACT_NODE

feature -- Access

		new_axis_iterator (axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_ABSTRACT_NODE] is
			-- An enumeration over the nodes reachable by `axis_type' from this node
		local
			test: XM_XPATH_ANY_NODE_TEST
		do
			-- Fast path for child axis
			if axis_type = Child_axis then
				if has_child_nodes then
					-- TODO create a sibling enumeration
				else
					-- TODO create an empty iterator
				end
			else
				Result := new_axis_iterator_with_node_test (axis_type, test)
			end
		end

	new_axis_iterator_with_node_test (axis_type: INTEGER; test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_ABSTRACT_NODE] is
			-- An enumeration over the nodes reachable by `axis_type' from this node;
			-- Only nodes that match the pattern specified by `test' will be selected.
		do
			-- TODO
		end

feature {NONE} -- Implementation

	node_number: INTEGER
			-- Uniquely identifies this node within the document

	document: XM_XPATH_TINY_DOCUMENT
			-- Document that owns this node

invariant

	positive_node_number: node_number > 0
	owned_node: document /= Void
	
end
