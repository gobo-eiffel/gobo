indexing

	description:

		"XPath nodes that can have children"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_CHILD_BEARING_NODE

inherit

	XM_XPATH_NODE

	-- DS_SORTER [INTEGER]

invariant

	-- Uncomment these when agents are available to Gobo classes.
	proper_children: -- children.for_all (agent is_possible_child)
	sorted_children: -- children are sorted in order of ascending `identity'. (document order).
			-- children.sorted
	normalized_text_nodes: -- no two consecutive child nodes may both be text nodes
	parent_relationship: -- children.for_all (agent (parent.is_equal (Current)))
	no_duplicates: -- children.for_all (--all nodes are distinct)
	
end -- class XM_XPATH_CHILD_BEARING_NODE
