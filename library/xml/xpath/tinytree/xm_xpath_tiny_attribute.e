note

	description:

		"Tiny tree Attribute nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_ATTRIBUTE

inherit

	XM_XPATH_ATTRIBUTE
		undefine
			is_tiny_node, as_tiny_node
		end

	XM_XPATH_TINY_NODE
		undefine
			local_part
		redefine
			name_code, sequence_number, parent, line_number, root
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; an_attribute_number: INTEGER)
		do
			tree := a_document
			node_number := an_attribute_number
			node_type := Attribute_node
		ensure
			document_set: tree = a_document
			node_number_set: node_number = an_attribute_number
		end

feature -- Access

	line_number: INTEGER
			-- Line number of node in original source document, or -1 if not known
		do
			Result := parent.line_number
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE
			-- Node sequence number (in document order)
		do

			-- Note - the offset is to allow room for namespace nodes

			create Result.make_with_offset (parent.sequence_number.high_word, node_number - tree.alpha_value (tree.attribute_parent (node_number)))
		end

	parent: XM_XPATH_TINY_COMPOSITE_NODE
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes.
		local
			a_node: XM_XPATH_TINY_NODE
		do
			a_node := tree.retrieve_node (tree.attribute_parent (node_number))
			if a_node.is_tiny_composite_node then Result := a_node.as_tiny_composite_node end
		end

	root: XM_XPATH_NODE
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		do
			Result := parent.root
		end

	string_value: STRING
			--Value of the item as a string
		do
			Result := tree.attribute_value (node_number)
		end

	name_code: INTEGER
			-- Name code this node - used in displaying names;
		do
			Result := tree.attribute_code_for_node (node_number)
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN)
			-- Copy `Current' to `a_receiver'.
		local
			a_type_code: INTEGER
		do
			if copy_annotations then
				a_type_code := type_annotation
			else
				a_type_code := -1
			end
			a_receiver.notify_attribute (name_code, a_type_code, string_value, 0)
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

end
