indexing

	description:

		"Tiny tree Attribute nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ATTRIBUTE

inherit

	XM_XPATH_ATTRIBUTE

	XM_XPATH_TINY_NODE

creation

	make

feature {NONE} -- Initialization

	make (doc: XM_XPATH_TINY_DOCUMENT; attribute_number: INTEGER) is
		do
			document := doc
			node_number := attribute_number
		ensure
			document_set: document = doc
			node_number_set: node_number = attribute_number
		end

feature -- Access

	string_value: STRING is
			--Value of the item as a string
		do
			Result := document.attribute_value (node_number)
		end

feature {XM_XPATH_NODE} -- Access

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end
	
end
