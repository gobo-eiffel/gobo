indexing

	description:

		"Objects that compare two nodes to determine document order"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class	XM_XPATH_NODE_ORDER_COMPARER

feature -- Comparison

		three_way_comparison (a_node, another_node: XM_XPATH_NODE): INTEGER is
			-- If nodes are then same, 0;
			-- if `a_node' smaller, -1; if greater, 1
		require
			first_node_not_void: a_node /= Void
			second_node_not_void: another_node /= Void
		deferred
		ensure
			valid_result: -1 <= Result and then Result <= 1
		end
end
	
