indexing

	description:

		"XPath nodes that lack a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NAMELESS_NODE

inherit

	XM_XPATH_NODE
	
feature -- Access

	node_name: XM_EXPANDED_QNAME is
			-- Qualified name
		do
			Result := Void
		ensure then
			no_node_name: Result = Void
		end

end -- class XM_XPATH_NAMELESS_NODE
