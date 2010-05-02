note

	description:

		"Classification class for nodes that can be children of the document node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_DOCUMENT_NODE

inherit

	XM_NODE

invariant

	--document_parent_not_void: parent /= Void

end
