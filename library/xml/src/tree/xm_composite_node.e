note

	description:

		"Classification class for nodes that can be children of the composite node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2014, Eric Bezault and others"
	license: "MIT License"

deferred class XM_COMPOSITE_NODE

inherit

	XM_NODE
		redefine
			parent
		end

feature -- Access

	parent: XM_COMPOSITE
			-- Parent of current node

feature -- Element change

	set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		require
			a_parent_not_void: a_parent /= Void
			not_root_node: not is_root_node
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

feature {XM_COMPOSITE} -- Element change

	node_set_parent (a_parent: like parent)
			-- Set `parent' to `a_parent'.
		do
			parent := a_parent
		ensure
			parent_set: parent = a_parent
		end

invariant

	parent_not_void: parent /= Void

end
