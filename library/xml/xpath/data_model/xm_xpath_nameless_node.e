indexing

	description:

		"XPath nodes that lack a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMELESS_NODE

feature -- Access

	node_name: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Qualified name.
		do
			create Result.make (0)
		ensure then
			no_node_name: Result.is_empty
		end
		
end -- class XM_XPATH_NAMELESS_NODE
