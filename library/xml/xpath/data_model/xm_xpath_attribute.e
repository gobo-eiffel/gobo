indexing

	description:

		"XPath Attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ATTRIBUTE

inherit

	XM_XPATH_BASE_URI_FROM_PARENT

	XM_XPATH_TYPED_NODE
	
	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			create Result.make_from_string ("attribute")
		ensure then
			node_kind_is_attribute: STRING_.same_string ( Result, "attribute")
		end
	
	item_type: INTEGER is
			-- Type
		do
			Result := Attribute_node
		end
end
