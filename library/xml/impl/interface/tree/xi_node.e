indexing

	description:

		"Common anchestor for all XML node classes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

deferred class XI_NODE

inherit

	DP_IMPLEMENTATION

feature {ANY} -- Access

	parent: XM_COMPOSITE is
			-- parent of this node. Only void
			-- if this node is the root node
		deferred
		end

feature {ANY} -- Status

feature {ANY} -- Element change

	set_parent (a_parent: XM_COMPOSITE) is
			-- make `a_parent' the new parent of this node.
		require
			a_parent_not_void: a_parent /= Void
		deferred
		ensure
			parent_set: parent = a_parent
		end

end -- class XI_NODE

