indexing

	description:

		"Common anchestor for all XML node classes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_NODE

feature {ANY} -- Access

	parent: XM_COMPOSITE
			-- parent of this node. Only void
			-- if this node is the root node

	root_node: XM_COMPOSITE is
			-- the root node of this node. In most cases this will be of
			-- type XM_DOCUMENT
		do
			if not is_root_node then
				Result := parent.root_node
			end
		end

	level: INTEGER is
			-- depth at which this node occures
			-- relative to it's root. The root node
			-- has the level 1.
		do
			if is_root_node then
				Result := 1
			else
				Result := parent.level + 1
			end
		end

feature {ANY} -- Status report

	is_root_node: BOOLEAN is
			-- is this node the root node
		do
			Result := parent = Void
		end

feature {ANY} -- Basic routines

	process (x: XM_NODE_PROCESSOR) is
		require
			x_not_void: x /= Void
		deferred
		end

feature {ANY} -- Element change

	set_parent (a_parent: XM_COMPOSITE) is
			-- make `a_parent' the new parent of this node.
		require
			a_parent_not_void: a_parent /= Void
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

end -- class XM_NODE
