note

	description:

		"Objects that filter a document to a sub-tree anchored on an origin node"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_SUBTREE_FILTER

inherit

	XM_XPATH_SINGLETON_NODE_MAPPING_FUNCTION

create

	make

feature {NONE} -- Initializaion

	make (a_node: like origin)
			-- Initialize `Current'.
		require
			a_node_not_void: a_node /= Void
		do
			origin := a_node
		ensure
			origin_set: origin = a_node
		end

feature -- Access

	origin: XM_XPATH_NODE
			-- Root of sub-tree

	mapped_node (a_node: XM_XPATH_NODE): XM_XPATH_NODE
			-- `a_node' mapped to zero or one nodes
		do
			if a_node = Void then
				-- nothing to do
			elseif origin.is_ancestor_or_self (a_node) then
				Result := a_node
			end
		end

invariant

	origin_not_void: origin /= Void

end
