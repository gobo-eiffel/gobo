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
		undefine
			local_part
		redefine
			name_code, sequence_number, parent, line_number
		end
	
creation

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_DOCUMENT; an_attribute_number: INTEGER) is
		do
			document := a_document
			node_number := an_attribute_number
			node_type := Attribute_node
		ensure
			document_set: document = a_document
			node_number_set: node_number = an_attribute_number
		end

feature -- Access
	
	line_number: INTEGER is
			-- Line number of node in original source document, or -1 if not known
		do
			Result := parent.line_number
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order)
		do

			-- Note - the offset is to allow room for namespace nodes
			
			create Result.make_with_offset (parent.sequence_number.high_word, node_number - document.alpha_value (document.attribute_parent (node_number)))
		end

	parent: XM_XPATH_TINY_COMPOSITE_NODE is
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes.
		do
			Result ?= document.retrieve_node (document.attribute_parent (node_number))
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := document.attribute_value (node_number)
		end

	name_code: INTEGER is
			-- Name code this node - used in displaying names;
		do
			Result := document.attribute_code_for_node (node_number)
		end
	
feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end
	
end
