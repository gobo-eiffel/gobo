indexing

	description:

		"XPath nodes that have a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NAMED_NODE

inherit

	XM_XPATH_NODE
	
feature -- Access

	node_name: XM_EXPANDED_QNAME is
			-- Qualified name
		do
			Result := node_name_property
		ensure then
			node_name: Result /= Void
		end

feature {NONE} -- Access

	node_name_property: XM_EXPANDED_QNAME
			-- Node-name property from the infoset

invariant

	node_name_not_void: node_name_property /= Void

end
