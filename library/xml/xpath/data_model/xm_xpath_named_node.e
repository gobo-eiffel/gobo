indexing

	description:

		"XPath nodes that have a name"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMED_NODE

feature -- Access

	node_name: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Qualified name.
		do
			create Result.make (1)
	      Result.put_first (node_name_property)
		ensure then
			node_name: not Result.is_empty
		end

feature {NONE} -- Access
	
	node_name_property: XM_EXPANDED_QNAME
			-- Node-name property from the infoset.
			
end -- class XM_XPATH_NAMED_NODE
