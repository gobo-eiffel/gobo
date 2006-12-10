indexing

	description:

		"Objects that compare two nodes, not necessarily in the same document"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_GLOBAL_ORDER_COMPARER

inherit

	XM_XPATH_NODE_ORDER_COMPARER

feature -- Comparison

		three_way_comparison (a_node, another_node: XM_XPATH_NODE): INTEGER is
			-- If nodes are then same, 0;
			-- if `a_node' smaller, -1; if greater, 1
		local
			l_document_one, l_document_two: INTEGER
		do
			l_document_one := a_node.document_number
			l_document_two := another_node.document_number
			if l_document_one = l_document_two then
				Result := a_node.three_way_comparison (another_node)
			else
				Result := (l_document_one - l_document_two).sign
			end
		end

end
	
