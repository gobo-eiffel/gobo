indexing

	description:

		"Classification class for nodes that can be children of element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"
	
deferred class XM_ELEMENT_NODE

inherit

	XM_NODE

invariant

	--element_parent_not_void: parent /= Void
	
end
