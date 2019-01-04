note

	description:

		"XPath nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2019, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE

inherit

	XM_XPATH_ITEM
		redefine
			is_node, as_node
		end

	XM_XPATH_SHARED_TYPE_FACTORY
		export {NONE} all end

	XM_XPATH_AXIS

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

	XM_XPATH_LOCATOR

	XM_XPATH_STANDARD_NAMESPACES
		export
			{NONE} all
			{ANY} No_namespaces, Local_namespaces, All_namespaces
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_SERIAL_NUMBER_GENERATOR
		export {NONE} all end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

	XM_XPATH_DEBUGGING_ROUTINES
		export {NONE} all end

		-- This class represents a node in gexslt's object model.
		-- It combines the features of the XPath data model,
		--  with some of the features from the W3C's dom::Node (for convenience),
		--  along with additional features to make life easier.

feature -- Access

	document: detachable XM_XPATH_DOCUMENT
			-- Document that owns this node
		deferred
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE
			-- Node sequence number (in document order);
			-- Sequence numbers are monotonic but not consecutive.
			-- The sequence number must be unique within the document.
		deferred
		ensure
			strictly_positive_sequence_number: Result /= Void and then Result.is_positive
		end

	document_number: INTEGER
			-- Uniquely identifies the owning document.
		deferred
		ensure
			strictly_positive_result: Result > 0
		end

	base_uri: detachable STRING
			-- Base URI as per W3C XML:base REC
		require
			not_in_error: not is_error
		do
			if attached parent as l_parent then
				Result := l_parent.base_uri
			end
		ensure
			base_uri_may_be_void: True
		end

	node_type: INTEGER
			-- `node_kind' expressed as an integer

	node_kind: STRING
			-- Kind of node
			-- Must be one of:
			-- "document", "element", "attribute",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		require
			not_in_error: not is_error
		deferred
		ensure
			node_kind_not_void: Result /= Void
		end

	node_name: detachable STRING
			-- Qualified name
		require
			not_in_error: not is_error
		deferred
		ensure
			node_name_may_be_void: True
		end

	parent: detachable XM_XPATH_COMPOSITE_NODE
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes
		require
			not_in_error: not is_error
		deferred
		ensure
			parent_may_be_void: True
			not_current_node: Result /= Void implies not is_same_node (Result)
		end

	root: XM_XPATH_NODE
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		require
			not_in_error: not is_error
		deferred
		ensure
			root_node_not_void: Result /= Void
		end

	type_annotation: INTEGER
			-- Type annotation of this node
		require
			not_in_error: not is_error
		do
			Result := type_factory.untyped_atomic_type.fingerprint
		end

	fingerprint: INTEGER
			-- Fingerprint of this node - used in matching names
		local
			l_name_code: INTEGER
		do
			l_name_code := name_code
			if l_name_code = -1 then
				Result := -1
			else
				Result := fingerprint_from_name_code (l_name_code)
			end
		end

	name_code: INTEGER
			-- Name code this node - used in displaying names
		require
			not_in_error: not is_error
		deferred
		end

	local_part: STRING
			-- Local part of the name;
			-- For nodeless names, return the empty string
		do
			if name_code < 0 then
				Result := ""
			else
				Result := shared_name_pool.local_name_from_name_code (name_code)
			end
		end


	uri: STRING
			-- Namespace URI part of the name of this node;
			-- This is the URI corresponding to the prefix,
			--  or the URI of the default namespace if appropriate.
		do
			if name_code = -1 then
				Result := ""
			else
				Result := shared_name_pool.namespace_uri_from_name_code (name_code)
			end
		ensure
			uri_not_void: Result /= Void
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		deferred
		ensure
			path_not_void: Result /= Void
		end

	simple_number: STRING
			-- Position of `Current' amongst it's siblings
		require
			no_previous_error: not is_error
		local
			l_node_test: XM_XPATH_NODE_TEST
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_position: INTEGER
		do
			if fingerprint = -1 then
				create {XM_XPATH_NODE_KIND_TEST} l_node_test.make (node_type)
			else
				create {XM_XPATH_NAME_TEST} l_node_test.make_same_type (Current)
			end
			from
				l_position := 1
				l_iterator := new_axis_iterator_with_node_test (Preceding_sibling_axis, l_node_test)
				l_iterator.start
			until
				l_iterator.after
			loop
				l_position := l_position + 1
				l_iterator.forth
			end
			Result := l_position.out
		ensure
			strictly_positive_integer: Result /= Void and then Result.is_integer and then Result.to_integer > 0
		end

	document_root: detachable XM_XPATH_DOCUMENT
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		require
			not_in_error: not is_error
		deferred
		end

	first_child: detachable XM_XPATH_NODE
			-- The first child of this node;
			-- If there are no children, return `Void'
		require
			not_in_error: not is_error
		do
			Result := Void
		end

	last_child: detachable XM_XPATH_NODE
			-- The last child of this node;
			-- If there are no children, return `Void'
		require
			not_in_error: not is_error
		do
			Result := Void
		end

	previous_sibling: detachable XM_XPATH_NODE
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'.
		require
			not_in_error: not is_error
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			l_iterator := new_axis_iterator (Preceding_sibling_axis)
			l_iterator.start
			if not l_iterator.after then
				Result := l_iterator.item
			end
		end

	next_sibling: detachable XM_XPATH_NODE
			-- The next sibling of this node;
			-- If there is no such node, return `Void'.
		require
			not_in_error: not is_error
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			l_iterator := new_axis_iterator (Following_sibling_axis)
			l_iterator.start
			if not l_iterator.after then
				Result := l_iterator.item
			end
		end

	document_element: detachable XM_XPATH_ELEMENT
			-- The top-level element;
			-- If the document is not well-formed
			-- (i.e. it is a document fragment), then
			-- return the first element child of the document root.
		require
			not_in_error: not is_error
		local
			l_root: detachable XM_XPATH_DOCUMENT
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_element_node_test: XM_XPATH_NODE_KIND_TEST
		do
			l_root := document_root
			if l_root /= Void then
				create l_element_node_test.make (Element_node)
				l_iterator := l_root.new_axis_iterator_with_node_test (Child_axis, l_element_node_test)
				l_iterator.start
				if not l_iterator.after and then l_iterator.item.is_element then
					Result := l_iterator.item.as_element
				end
			end
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			-- Typed value
		local
			l_type: INTEGER
		do
			l_type := type_annotation
			if l_type = type_factory.untyped_atomic_type.fingerprint then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_STRING_VALUE]} Result.make (create {XM_XPATH_STRING_VALUE}.make_untyped_atomic (string_value))
			elseif l_type = type_factory.untyped_type.fingerprint then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_STRING_VALUE]} Result.make (create {XM_XPATH_STRING_VALUE}.make_untyped_atomic (string_value))
			else
				-- TODO complex types should be dealt with properly for schema aware
				todo ("typed_value", True)
				check False then end
			end
		end

	atomized_value: XM_XPATH_VALUE
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		deferred
		ensure
			atomized_value_not_void: Result /= Void
		end

	type_name: STRING
			-- Type name for diagnostic purposes
		do
			inspect
				node_type
			when Document_node then
				Result := "document-node()"
			when Element_node then
				check attached node_name as l_node_name then
					Result := STRING_.concat ("element(", l_node_name)
					Result := STRING_.appended_string (Result, ", ")
					if type_annotation = type_factory.untyped_type.fingerprint then
						Result := STRING_.appended_string (Result, "xs:untyped)")
					else
						-- TODO: schema-aware
						todo ("type_name", True)
					end
				end
			when Attribute_node then
				check attached node_name as l_node_name then
					Result := STRING_.concat ("attribute(", l_node_name)
					Result := STRING_.appended_string (Result, ")") -- TODO add type annotation
				end
			when Text_node then
				Result := "text()"
			when Comment_node then
				Result := "comment()"
			when Processing_instruction_node then
				Result := "processing-instruction()"
			when Namespace_node then
				Result := "namespace()"
			end
		end

	new_axis_iterator (a_axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- An enumeration over the nodes reachable by `a_axis_type' from this node
		require
			not_in_error: not is_error
			valid_axis: is_axis_valid (a_axis_type)
		deferred
		ensure
			result_not_in_error: Result /= Void and then not Result.is_error
			invulnerable: Result.is_invulnerable
		end

	new_axis_iterator_with_node_test (a_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- An enumeration over the nodes reachable by `a_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		require
			not_in_error: not is_error
			node_test_not_void: a_node_test /= Void
			valid_axis: is_axis_valid (a_axis_type)
		deferred
		ensure
			result_not_in_error: Result /= Void and then not Result.is_error
			invulnerable: Result.is_invulnerable
		end

	generated_id: detachable STRING
			-- Unique identifier (across all documents)

	 is_ancestor_or_self (a_node: XM_XPATH_NODE): BOOLEAN
		 -- Is `Current' an ancestor of `a_node', or the same node?
		require
			a_node_not_void: a_node /= Void
		local
			l_node: detachable XM_XPATH_NODE
		do
			from
				l_node := a_node
			until
				l_node = Void
			loop
				if is_same_node (l_node) then
					Result := True
					l_node := Void
				else
					l_node := l_node.parent
				end
			end
		end

feature -- Comparison

	is_same_node (a_other: XM_XPATH_NODE): BOOLEAN
			-- Does `Current' represent the same node in the tree as `a_other'?
		require
			not_in_error: not is_error
			a_other_node_not_void: a_other /= Void
		deferred
		end

	three_way_comparison (a_other: XM_XPATH_NODE): INTEGER
			-- If current object equal to other, 0;
			-- if smaller, -1; if greater, 1
		require
			a_other_not_void: a_other /= Void
		do
			if sequence_number < a_other.sequence_number then
				Result := -1
			elseif sequence_number > a_other.sequence_number then
				Result := 1
			else
				Result := 0
			end
		ensure
			valid_result: -1 <= Result and then Result <= 1
		end

feature -- Status report

	is_error: BOOLEAN
			-- Has item failed evaluation?

	error_value: detachable XM_XPATH_ERROR_VALUE
			-- Error value

	is_nilled: BOOLEAN
			-- Is current node "nilled"? (i.e. xsi: nill="true");
			-- This cannot be `True' until we have schema-aware version.
		require
			not_in_error: not is_error
		do
			Result := False
		end

	has_attributes: BOOLEAN
			-- Does `Current' have any attributes?
		require
			not_in_error: not is_error
		do
			Result := False
		end

	has_child_nodes: BOOLEAN
			-- Does `Current' have any children?
		require
			not_in_error: not is_error
		do
			Result := False -- overriden for composite nodes
		end

	is_node: BOOLEAN
			-- Is `Current' a node?
		do
			Result := True
		end

	is_namespace: BOOLEAN
			-- Is `Current' a namespace?
		do
			Result := False
		end

	is_tiny_node: BOOLEAN
			-- Is `Current' a tiny-tree node?
		do
			Result := False
		end

	is_tree_node: BOOLEAN
			-- Is `Current' a standard (linked) tree node?
		do
			Result := False
		end

feature -- Status setting

	set_last_error (a_error_value: XM_XPATH_ERROR_VALUE)
			-- Set `error_value'.
		do
			is_error := True
			error_value := a_error_value
		end

	set_last_error_from_string (a_message, a_namespace_uri, a_code: STRING; a_error_type: INTEGER)
			-- Set `error_value'.
		do
			is_error := True
			create error_value.make_from_string (a_message, a_namespace_uri, a_code, a_error_type)
		end

feature -- Conversion

	as_item_value: XM_XPATH_VALUE
			-- `Current' seen as a value
		do
			create {XM_XPATH_SINGLETON_NODE} Result.make (Current)
		end

	as_node: XM_XPATH_NODE
			-- `Current' seen as a node
		do
			Result := Current
		end

	as_namespace: XM_XPATH_NAMESPACE_NODE
			-- `Current' seen as a node
		require
			namespace: is_namespace
		do
			check False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_tiny_node: XM_XPATH_TINY_NODE
			-- `Current' seen as a tiny-tree node
		require
			tiny_node: is_tiny_node
		do
			check False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	as_tree_node: XM_XPATH_TREE_NODE
			-- `Current' seen as a tree node
		require
			tree_node: is_tree_node
		do
			check False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

feature -- Basic operations

	generate_id
			-- Generate a unique id for `Current'
		require
			no_generated_id_yet: generated_id = Void
		do
			generated_id := "D" + document_number.out + "H" + sequence_number.high_word.out + "L" + sequence_number.low_word.out
		ensure
			id_generated: generated_id /= Void
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; a_which_namespaces: INTEGER; a_copy_annotations: BOOLEAN)
			-- Copy `Current' to `a_receiver'.
		require
			receiver_not_void: a_receiver /= Void
			a_which_namespaces_valid: a_which_namespaces = No_namespaces
				or a_which_namespaces = Local_namespaces or a_which_namespaces = All_namespaces
		deferred
		end

end
