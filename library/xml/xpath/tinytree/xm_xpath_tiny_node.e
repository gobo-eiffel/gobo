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

feature -- Initialization

	make_node is
			-- Establish invariant
		require
			not_created: children = Void and attributes = Void and namespaces = Void
		do
			create children.make_equal (7)
			create attributes.make_equal (7)
			create namespaces.make_equal (7)
		ensure
			created: children /= Void and attributes /= Void and namespaces /= Void
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
