indexing

	description:

		"XPath namespace nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMESPACE_NODE

inherit

	XM_XPATH_NODE
		redefine
			base_uri, uri, is_namespace, as_namespace
		end

		-- Note: Namespace axis is only supported in XPath 1.0 compatibility mode.
		-- Hence namespace nodes are transitory objects, only existing
		--  whilst traversing the namespace axis.

create

	make

feature {NONE} -- Initialization

	make (an_element: like element; a_namespace_code: like namespace_code; a_position: like position) is
			-- Establish invariant.
		require
			element_not_void: an_element /= Void
			strictly_positive_position: a_position > 0
		local
			a_prefix: STRING
		do
			element := an_element
			namespace_code := a_namespace_code
			position := a_position
			a_prefix := shared_name_pool.prefix_from_namespace_code (namespace_code)
			if a_prefix.count = 0 then
				name_code := -1
			else
				if shared_name_pool.is_name_code_allocated (Null_uri, Null_uri, a_prefix) then
					name_code := shared_name_pool.name_code (Null_uri, Null_uri, a_prefix)
				else
					shared_name_pool.allocate_name (Null_uri, Null_uri, a_prefix)
					name_code := shared_name_pool.last_name_code
				end
			end
			node_type := Namespace_node
		ensure
			element_set: element = an_element
			namespace_code_set: namespace_code = a_namespace_code
			position_set: position = a_position
			namespace_node: node_type = Namespace_node
		end

feature -- Access

	element: XM_XPATH_ELEMENT
			-- Owning element

	namespace_code: INTEGER
			-- Namespace code

	name_code: INTEGER
			-- Name code

	is_namespace: BOOLEAN is
			-- Is `Current' a namespace?
		do
			Result := True
		end
	
	as_namespace: XM_XPATH_NAMESPACE_NODE is
			-- `Current' seen as a node
		do
			Result := Current
		end

	string_value: STRING is
		-- Value of the item as a string
		do
			Result := shared_name_pool.uri_from_namespace_code (namespace_code)
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make_namespace_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end			
		end

	document: XM_XPATH_DOCUMENT is
			-- Document that owns this node
		do
			Result := element.document
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order);
			-- Sequence numbers are monotonic but not consecutive.
			-- The sequence number must be unique within the document.
		do
			create Result.make_from_sequence_number_with_double_offset (element.sequence_number, position)
		end
	
	document_number: INTEGER is
			-- Uniquely identifies the owning document.
		do
			Result := element.document_number
		end

	base_uri: STRING is
			-- Base URI
		do
			Result := element.base_uri
		end

	system_id: STRING is
			-- SYSTEM identifier
		do
			Result := element.system_id
		end

	line_number: INTEGER is
			-- Line number
		do
			Result := element.line_number
		end

	node_kind: STRING is
			-- Kind of node
			-- Must be one of:
			-- "document", "element", "attribute",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		do
			Result := "namespace"
		end

	node_name: STRING is
			-- Qualified name
		do
			if name_code /= -1 then
				Result := local_part
			end
		end

	parent: XM_XPATH_COMPOSITE_NODE is
			-- Parent of current node
		do
			Result := element
		end
	
	root: XM_XPATH_NODE is
			-- The root node for `Current'
		do
			Result := element.root
		end

	uri: STRING is
			-- URI part of the name of this node;
			-- This is the URI corresponding to the prefix,
			--  or the URI of the default namespace if appropriate.
		do
			Result := ""
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current'
		do
			Result := element.document_root
		end

	atomized_value: XM_XPATH_VALUE is
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		do
			create {XM_XPATH_STRING_VALUE} Result.make (string_value)
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		do
			Result := new_axis_iterator_with_node_test (an_axis_type, any_node_test)
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		do
			inspect
				an_axis_type
			when Ancestor_axis then
				Result := element.new_axis_iterator_with_node_test (Ancestor_or_self_axis, a_node_test)
			when Ancestor_or_self_axis then
				if a_node_test.matches_item (Current) then
					create {XM_XPATH_PREPEND_ITERATOR [XM_XPATH_NODE]} Result.make (Current, element.new_axis_iterator_with_node_test (Ancestor_or_self_axis, a_node_test).as_axis_iterator)
				else
					Result := element.new_axis_iterator_with_node_test (Ancestor_or_self_axis, a_node_test)
				end
			when
				Attribute_axis, Child_axis, Descendant_axis, Descendant_or_self_axis,
				Following_sibling_axis, Namespace_axis, Preceding_sibling_axis
			 then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
			when Following_axis then
				--TODO
			when Parent_axis then
				if a_node_test.matches_item (element) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (element)
				else
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				end
			when Preceding_axis then
				--TODO
			when Self_axis then
				if a_node_test.matches_item (Current) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
				else
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				end
			when Preceding_or_ancestor_axis then
				--TODO
			end
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		do
			Result := node_type = Namespace_node and then
			namespace_code = other.as_namespace.namespace_code
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_namespace (namespace_code, 0)
		end

feature {XM_XPATH_NODE} -- Local

	position: INTEGER
			-- Position on namespace axis

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

invariant

	element_not_void: element /= Void
	strictly_positive_position: position > 0

end
