note

	description:

		"Standard tree attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TREE_ATTRIBUTE

inherit

	XM_XPATH_ATTRIBUTE
		undefine
			document_element, next_sibling, previous_sibling, local_part, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_NODE
		redefine
			name_code, is_same_node, sequence_number,
			next_sibling, previous_sibling, previous_node_in_document_order, next_node_in_document_order,
			is_tree_attribute, as_tree_attribute,
			parent
		end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; an_element: XM_XPATH_TREE_ELEMENT; an_index: INTEGER)
			-- Establish invariant
		require
			element_not_void: an_element /= Void
			strictly_positive_index: an_index > 0
		do
			document := a_document
			node_type := Attribute_node
			parent_node := an_element
			child_index := an_index
			string_value := an_element.attribute_value_by_index (child_index)
			name_code := an_element.attribute_name_code (child_index)
		ensure
			parent_set: parent_node = an_element
			child_index_set: child_index = an_index
		end

feature -- Access

	string_value: STRING
			-- Value of the item as a string

	name_code: INTEGER
			-- Name code this node - used in displaying names

	is_tree_attribute: BOOLEAN
			-- Is `Current' an attribute?
		do
			Result := True
		end

	as_tree_attribute: XM_XPATH_TREE_ATTRIBUTE
			-- `Current' seen as an attribute
		do
			Result := Current
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE
			-- Node sequence number (in document order)
			-- In this implementation, parent nodes (elements and roots)
			--  have a zero least-significant word, while namespaces,
			--  attributes, text nodes, comments, and PIs have
			--  the top word the same as their owner and the
			--  bottom half reflecting their relative position.
		do
			create Result.make_from_sequence_number_with_double_offset (parent_node.sequence_number, child_index)
		end

	previous_sibling: detachable XM_XPATH_NODE
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end

	next_sibling: detachable XM_XPATH_NODE
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end

	is_idrefs: BOOLEAN
			-- Value of is-idrefs property
		do
			Result := parent_node.as_tree_element.is_idrefs (child_index)
		end

	parent: XM_XPATH_TREE_COMPOSITE_NODE
			-- Parent of current node
		do
			Result := parent_node
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN
			-- Does `Current' represent the same node in the tree as `other'?
		local
			another_attribute: XM_XPATH_TREE_ATTRIBUTE
		do
			if other = Current then
				Result := True
			else
				if other.is_tree_node and then other.as_tree_node.is_tree_attribute then
					another_attribute := other.as_tree_node.as_tree_attribute
					Result := parent_node.is_same_node (another_attribute.parent_node) and then name_code = another_attribute.name_code
				end
			end
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

feature {XM_XPATH_TREE_NODE} -- Restricted

	previous_node_in_document_order: XM_XPATH_TREE_NODE
			-- Previous node within the document
		do
			Result := parent
		end

	next_node_in_document_order (an_anchor: XM_XPATH_TREE_NODE): detachable XM_XPATH_TREE_NODE
			-- Next node within the document (skipping attributes);
			-- The scan stops if it encounters `an_anchor'
		do
			if an_anchor /= Current then
				Result := parent.next_node_in_document_order (an_anchor)
			end
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

invariant

	parent_not_void: parent_node /= Void

end

