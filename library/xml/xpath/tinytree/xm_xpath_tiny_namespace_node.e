indexing

	description:

		"Tiny tree namespace nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_NAMESPACE

inherit

	XM_XPATH_NAMESPACE

	XM_XPATH_TINY_NODE
		redefine
			local_part
		end

creation

	make

feature {NONE} -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; a_node_number: INTEGER) is
		require
			valid_document: doc /= Void
			valid_node_number: a_node_number > 1 and a_node_number <= doc.last_node_added
		do
			document := doc
			node_number := a_node_number
			if document.name_pool.is_name_code_allocated ("", "", local_part) then
				my_name_code := document.name_pool.name_code  ("", "", local_part)
			else
				document.name_pool.allocate_name  ("", "", local_part)
				my_name_code := document.name_pool.last_name_code
			end
		ensure
			document_set: document = doc
			node_number_set: node_number = a_node_number
		end

feature -- Access

	local_part: STRING is
			-- Local name for this node. i.e. Namespace prefix
		do
			Result := document.name_pool.prefix_from_namespace_code (document.namespace_code_for_node (node_number))
		end
	
feature {XM_XPATH_NODE} -- Access

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

feature {NONE} -- Implementation

	my_name_code: INTEGER
			-- The name code from the name pool
	
end
