indexing

	description:

		"XPath Attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ATTRIBUTE

inherit

	XM_XPATH_NODE
	
feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			Result := "attribute"
		ensure then
			node_kind_is_attribute: STRING_.same_string (Result, "attribute")
		end
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			 Result := attribute_node_kind_test
		end

end
