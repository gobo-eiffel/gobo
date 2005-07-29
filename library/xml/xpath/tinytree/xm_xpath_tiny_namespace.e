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
		undefine
			local_part,	is_tiny_node, as_tiny_node
		end

	XM_XPATH_TINY_NODE
		undefine
			parent, base_uri, next_sibling, previous_sibling, is_tiny_namespace, as_tiny_namespace
		redefine
			local_part, name_code, sequence_number, is_same_node
		end

	XM_XPATH_RECEIVER_OPTIONS

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_node_number: INTEGER) is
		require
			valid_document: a_document /= Void
			valid_node_number: a_node_number > 1 and a_node_number <= a_document.last_node_added
		do
			tree := a_document
			node_number := a_node_number
			node_type := Namespace_node
			if shared_name_pool.is_name_code_allocated ("", "", local_part) then
				name_code := shared_name_pool.name_code  ("", "", local_part)
			else

				-- TODO need to check for resource exhaustion in name pool
				
				shared_name_pool.allocate_name  ("", "", local_part)
				name_code := shared_name_pool.last_name_code
			end
		ensure
			tree_set: tree = a_document
			node_number_set: node_number = a_node_number
		end

feature -- Access
	
	is_tiny_namespace: BOOLEAN is
			-- Is `Current' a namespace node?
		do
			Result := True
		end

	as_tiny_namespace: XM_XPATH_TINY_NAMESPACE is
			-- `Current' seen as a namespace node
		do
			Result := Current
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order)
		do
			create Result.make (0, 0)
		end

	local_part: STRING is
			-- Local name for this node. i.e. Namespace prefix
		do
			Result := shared_name_pool.prefix_from_namespace_code (tree.namespace_code_for_node (node_number))
		end

	parent: XM_XPATH_TINY_COMPOSITE_NODE is
			-- Parent of current node
		do
			Result := Void
		end

	name_code: INTEGER
			-- Name code of this node - used in displaying names
	
	string_value: STRING is
			-- String-value
		do
			Result := shared_name_pool.uri_from_namespace_code (tree.namespace_code_for_node (node_number))
		end

	namespace_code: INTEGER is
			-- Code for the namespace represented by `Current'
		do
			Result := tree.namespace_code_for_node (node_number)
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_TINY_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		local
			another_namespace: XM_XPATH_TINY_NAMESPACE
		do
			if other = Current then
				Result := True
			else
				if other.is_tiny_namespace then
					another_namespace := other.as_tiny_namespace
					Result := tree = another_namespace.tree and then	node_number = another_namespace.node_number
				end
			end
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

end
