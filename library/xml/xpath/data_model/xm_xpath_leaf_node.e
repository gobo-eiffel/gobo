indexing

	description:

		"XPath nodes that cannot have children"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_LEAF_NODE

inherit

	XM_XPATH_NODE
	
invariant

	children_are_empty: children.is_empty
	
end
