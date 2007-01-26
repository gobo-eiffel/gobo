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
			create Result.make_from_string ("attribute")
		ensure then
			node_kind_is_attribute: STRING_.same_string ( Result, "attribute")
		end
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make_attribute_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

end
