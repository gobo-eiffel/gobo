note

	description:

		"Objects that compare two nodes in the same document"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LOCAL_ORDER_COMPARER

inherit

	XM_XPATH_NODE_ORDER_COMPARER

feature -- Comparison

		three_way_comparison (a_node, another_node: XM_XPATH_NODE): INTEGER
			-- If nodes are then same, 0;
			-- if `a_node' smaller, -1; if greater, 1
		do
			Result := a_node.three_way_comparison (another_node)
		end
end

