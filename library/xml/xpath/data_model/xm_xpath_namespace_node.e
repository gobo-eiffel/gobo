note

	description:

		"XPath namespace nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMESPACE_NODE

inherit

	XM_XPATH_NODE
		redefine
			base_uri, uri, is_namespace, as_namespace, three_way_comparison
		end

		-- Note: Namespace axis is only supported in XPath 1.0 compatibility mode.
		-- Hence namespace nodes are transitory objects, only existing
		--  whilst traversing the namespace axis.

create

	make

feature {NONE} -- Initialization

	make (an_element: like element; a_namespace_code: like namespace_code; a_position: like position)
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

	is_namespace: BOOLEAN
			-- Is `Current' a namespace?
		do
			Result := True
		end

	as_namespace: XM_XPATH_NAMESPACE_NODE
			-- `Current' seen as a node
		do
			Result := Current
		end

	string_value: STRING
		-- Value of the item as a string
		do
			Result := shared_name_pool.uri_from_namespace_code (namespace_code)
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		do
			Result := namespace_node_kind_test
		end

	document: detachable XM_XPATH_DOCUMENT
			-- Document that owns this node
		do
			Result := element.document
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE
			-- Node sequence number (in document order);
			-- Sequence numbers are monotonic but not consecutive.
			-- The sequence number must be unique within the document.
		do
			create Result.make_from_sequence_number_with_double_offset (element.sequence_number, position)
		end

	document_number: INTEGER
			-- Uniquely identifies the owning document.
		do
			Result := element.document_number
		end

	base_uri: detachable STRING
			-- Base URI
		do
			Result := Void
		end

	system_id: STRING
			-- SYSTEM identifier
		do
			Result := element.system_id
		end

	line_number: INTEGER
			-- Line number
		do
			Result := element.line_number
		end

	node_kind: STRING
			-- Kind of node
			-- Must be one of:
			-- "document", "element", "attribute",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		do
			Result := "namespace"
		end

	node_name: detachable STRING
			-- Qualified name
		do
			if name_code /= -1 then
				Result := local_part
			end
		end

	parent: XM_XPATH_COMPOSITE_NODE
			-- Parent of current node
		do
			Result := element
		end

	root: XM_XPATH_NODE
			-- The root node for `Current'
		do
			Result := element.root
		end

	uri: STRING
			-- URI part of the name of this node;
			-- This is the URI corresponding to the prefix,
			--  or the URI of the default namespace if appropriate.
		do
			Result := ""
		end

	document_root: detachable XM_XPATH_DOCUMENT
			-- The document node for `Current'
		do
			Result := element.document_root
		end

	atomized_value: XM_XPATH_VALUE
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		do
			create {XM_XPATH_STRING_VALUE} Result.make (string_value)
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		do
			Result := new_axis_iterator_with_node_test (an_axis_type, any_node_test)
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		do
			inspect
				an_axis_type
			when Ancestor_axis then
				Result := element.new_axis_iterator_with_node_test (Ancestor_or_self_axis, a_node_test)
			when Ancestor_or_self_axis then
				if a_node_test.matches_item (Current, False) then
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
				check False then end
			when Parent_axis then
				if a_node_test.matches_item (element, False) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (element)
				else
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				end
			when Preceding_axis then
				--TODO
				check False then end
			when Self_axis then
				if a_node_test.matches_item (Current, False) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
				else
					create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE]} Result.make
				end
			when Preceding_or_ancestor_axis then
				--TODO
				check False then end
			end
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		local
			l_test: STRING
		do
			l_test := local_part
			if l_test.is_empty then

				-- Default namespace: need a node-test that selects unnamed nodes only

				l_test := "*[not(local-name()]"
			end
			Result := STRING_.concat (parent.path, "/namespace::")
			Result := STRING_.appended_string (Result, l_test)
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN
			-- Does `Current' represent the same node in the tree as `other'?
		do
			Result := other.is_namespace
				and then element.is_same_node (other.as_namespace.element)
				and then namespace_code = other.as_namespace.namespace_code
		end

	three_way_comparison (other: XM_XPATH_NODE): INTEGER
			-- If current object equal to other, 0;
			-- if smaller, -1; if greater, 1
		do
			if other.is_namespace and then element.is_same_node (other.as_namespace.element) then
				if position < other.as_namespace.position then
					Result := -1
				elseif position > other.as_namespace.position then
					Result := 1
				else
					Result := 0
				end
			elseif element.is_same_node (other) then
				Result := 1
			else
				Result := element.three_way_comparison (other)
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN)
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_namespace (namespace_code, 0)
		end

feature {XM_XPATH_NODE} -- Local

	position: INTEGER
			-- Position on namespace axis

	is_possible_child: BOOLEAN
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

invariant

	element_not_void: element /= Void
	strictly_positive_position: position > 0

end
