indexing

	description:

		"XPath nodes that are not elements"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE_WITHOUT_ATTRIBUTES

inherit

	XM_XPATH_NODE
	
feature -- Status report

	is_nilled: BOOLEAN is
			-- Is current node "nilled"? (i.e. xsi: nill="true")
		do
			Result := False
		ensure then
			not_nilled: Result = False
		end
	
invariant

	attributes_are_empty: attributes.is_empty
	namespaces_are_empty: namespaces.is_empty
	
end
