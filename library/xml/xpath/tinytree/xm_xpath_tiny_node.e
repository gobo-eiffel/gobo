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

	XM_XPATH_NODE

feature {NONE} -- Implementation

	node_number: INTEGER
			-- Uniquely identifies this node within the document

	document: XM_XPATH_TINY_DOCUMENT
			-- Document that owns this node

invariant

	non_negative_node_number: node_number >= 0
	owned_node: document /= Void
	
end -- class XM_XPATH_TINY_NODE
