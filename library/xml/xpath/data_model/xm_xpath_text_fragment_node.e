indexing

	description:

		"Objects which represent the sole node in a text document fragment."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEXT_FRAGMENT_NODE

inherit

	XM_XPATH_NODE
		redefine
			typed_value, base_uri
		end

create

	make

feature {NONE} -- Initialization

	make (a_string_value: STRING; a_parent: XM_XPATH_DOCUMENT; a_system_id: STRING) is
			-- Establsh invariant.
		require
			string_value_not_void: a_string_value /= Void
			parent_not_void: a_parent /= Void
			system_id_not_void: a_system_id /= Void
		do
			string_value := a_string_value
			system_id := a_system_id
			node_type := Text_node
			parent := a_parent
			document := a_parent
			document_number := document.document_number
			name_code := -1
			is_possible_child := True
		ensure
			string_value_set: string_value = a_string_value
			system_id_set: system_id = a_system_id
			parent_set: parent = a_parent
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make (node_type)
		end

	document: XM_XPATH_DOCUMENT
			-- Document that owns this node

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order).
		do
			create Result.make (0, 0)
		end
	
	document_number: INTEGER

	string_value: STRING
			-- String value

	base_uri: STRING is
			-- Base URI
		do
			Result := system_id
		end

	system_id: STRING
		
	line_number: INTEGER is -1


	node_kind: STRING is
			-- "attribute", "element",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		do
			Result := "text"
		end

	parent: XM_XPATH_COMPOSITE_NODE
			-- Parent of current node
	
	root: XM_XPATH_NODE is
			-- The root node for `Current'
		do
			Result := document
		end
	
	name_code: INTEGER
			-- Name code this node - used in displaying names

	node_name: STRING is
			-- Qualified name
		do
			if name_code = -1 then
				Result := ""
			else
				Result := shared_name_pool.display_name_from_name_code (name_code)
			end
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current'
		do
			Result := Void
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE] is
			-- Typed value
		local
			an_untyped_atomic_value: XM_XPATH_UNTYPED_ATOMIC_VALUE
		do
			create an_untyped_atomic_value.make (string_value)
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ATOMIC_VALUE]} Result.make (an_untyped_atomic_value)
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		do
			todo ("new_axis_iterator", False)
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		do
			todo ("new_axis_iterator with node test", False)
		end

	atomized_value: XM_XPATH_VALUE is
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		do
			create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		do
			Result := Current = other
		end

feature -- Element change

	set_name_code (a_name_code: INTEGER) is
			-- Set name code.
		require
			positive_name_code: a_name_code >= 0
		do
			name_code := a_name_code
		ensure
			name_code_set: name_code = a_name_code
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_characters (string_value, 0)
		end

feature {XM_XPATH_NODE} -- Local
	
	is_possible_child: BOOLEAN

invariant

	text_node_type: node_type = Text_node

end
