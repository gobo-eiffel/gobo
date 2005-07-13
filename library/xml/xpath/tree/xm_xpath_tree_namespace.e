indexing

	description:

		"Standard tree namespace nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_NAMESPACE
	
inherit
	
	XM_XPATH_NAMESPACE
		undefine
			document_element, local_part, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_NODE
		undefine
			base_uri, next_sibling, previous_sibling
		redefine
			is_same_node, name_code, local_part, previous_node_in_document_order, next_node_in_document_order, is_tree_namespace, as_tree_namespace
		end

	XM_XPATH_RECEIVER_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; an_element: XM_XPATH_TREE_ELEMENT; a_namespace_code, an_index: INTEGER) is
			-- Establish invariant
		require
			element_not_void: an_element /= Void
			strictly_positive_index: an_index > 0
			positive_namespace_code: a_namespace_code >= 0
		local
			a_local_part: STRING
		do
			document := a_document
			node_type := Namespace_node
			parent_node := an_element
			child_index := an_index
			namespace_code := a_namespace_code
			a_local_part := shared_name_pool.prefix_from_namespace_code (namespace_code)
			if a_local_part = Void then a_local_part := "" end
			if shared_name_pool.is_name_code_allocated ("", "", a_local_part) then
				name_code := shared_name_pool.name_code  ("", "", a_local_part)
			else

				-- TODO need to check for resource exhaustion in name pool
				
				shared_name_pool.allocate_name  ("", "", a_local_part)
				name_code := shared_name_pool.last_name_code
			end
		ensure
			parent_set: parent = an_element
			child_index_set: child_index = an_index
			namespace_code_set: namespace_code = a_namespace_code
		end

feature -- Access

	namespace_code: INTEGER
			-- Code for the namespace represented by `Current'

	is_tree_namespace: BOOLEAN is
			-- Is `Current' a namespace?
		do
			Result := True
		end

	as_tree_namespace: XM_XPATH_TREE_NAMESPACE is
			-- `Current' seen as a namespace
		do
			Result := Current
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		local
			another_namespace: XM_XPATH_TREE_NAMESPACE
		do
			if other = Current then
				Result := True
			elseif other.is_tree_node and then other.as_tree_node.is_tree_namespace then
				another_namespace := other.as_tree_node.as_tree_namespace
				Result := document = another_namespace.document and then namespace_code = another_namespace.namespace_code
			end
		end

	local_part: STRING is
			-- Local name for this node. i.e. Namespace prefix
		do
			Result := shared_name_pool.prefix_from_namespace_code (namespace_code)
		end

	name_code: INTEGER
			-- Name code of this node - used in displaying names
	
	string_value: STRING is
			-- String-value
		do
			Result := shared_name_pool.uri_from_namespace_code (namespace_code)
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_namespace (namespace_code, Reject_duplicates)
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end
feature {XM_XPATH_TREE_NODE, XM_XPATH_TREE_ENUMERATION} -- Restricted
	
	previous_node_in_document_order: XM_XPATH_TREE_NODE is
			-- Previous node within the document
		do
			Result := parent
		end

	next_node_in_document_order (an_anchor: XM_XPATH_TREE_NODE): XM_XPATH_TREE_NODE is
			-- Next node within the document;
			-- The scan stops if it encounters `an_anchor'
		do
			Result := parent.next_node_in_document_order (an_anchor)
		end

end
	
