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
			a_root, another_root: XM_XPATH_NODE
			a_document, another_document: INTEGER
		do
			a_root := a_node.document_root
			another_root := another_node.document_root
			if a_root = Void then
				if another_root = Void then
					Result := a_node.three_way_comparison (another_node)
				else
					Result := -1
				end
			elseif another_root = Void then
				Result := +1
			elseif a_root.is_same_node (another_root) then
				Result := a_node.three_way_comparison (another_node)
			else
				a_document := a_root.document_number
				another_document := another_root.document_number
				Result := (a_document - another_document).sign
			end
		end
end
	
