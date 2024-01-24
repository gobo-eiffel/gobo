note

	description:

		"XPath orphan element/attribute/namespace/text/processing-instruction or comment nodes with no parent or children."

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ORPHAN

inherit

	XM_XPATH_NODE
		redefine
			base_uri, typed_value, generate_id
		end

create

	make

feature {NONE} -- Initialization

	make (a_node_type: INTEGER; a_string_value: STRING)
			-- Establish invariant.
		require
			valid_node_kind: a_node_type = Element_node or else
				a_node_type = Attribute_node or else
				a_node_type = Text_node or else
				a_node_type = Comment_node or else
				a_node_type = Namespace_node or else
				a_node_type = Processing_instruction_node
			string_value_not_void: a_string_value /= Void
		do
			node_type := a_node_type
			string_value := a_string_value
			system_id := ""
			name_code := -1
		ensure
			node_type_set: node_type = a_node_type
			string_value_set: string_value = a_string_value
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		do
			create {XM_XPATH_NODE_KIND_TEST} Result.make (node_type)
		end

	document: detachable XM_XPATH_DOCUMENT
			-- Document that owns this node
		do
			-- `Void' - by definition of an orphan
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE
			-- Node sequence number (in document order).
		do
			create Result.make (0, 0)
		end

	document_number: INTEGER

	string_value: STRING
			-- String value

	base_uri: detachable STRING
			-- Base URI
		do
			Result := Void
		end

	system_id: STRING

	line_number: INTEGER = -1


	node_kind: STRING
			-- "attribute", "element",
			-- "namespace", "processing-instruction",
			-- "comment", or "text".
		do
			inspect
				node_type
			when Element_node then
				Result := "element"
			when Attribute_node then
				Result := "attribute"
			when Processing_instruction_node then
				Result := "processing-instruction"
			when Text_node then
				Result := "text"
			when Namespace_node then
				Result := "namespace"
			when Comment_node then
				Result := "comment"
			end
		end

	parent: detachable XM_XPATH_COMPOSITE_NODE
			-- Parent of current node

	root: XM_XPATH_NODE
			-- The root node for `Current'
		do
			Result := Current
		end

	name_code: INTEGER
			-- Name code this node - used in displaying names

	node_name: STRING
			-- Qualified name
		do
			if name_code = -1 then
				Result := ""
			else
				Result := shared_name_pool.display_name_from_name_code (name_code)
			end
		end

	document_root: detachable XM_XPATH_DOCUMENT
			-- The document node for `Current'
		do
			Result := Void
		end

	typed_value: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ATOMIC_VALUE]
			-- Typed value
		local
			l_string_value: XM_XPATH_STRING_VALUE
		do
			inspect
				node_type
			when Comment_node, Processing_instruction_node, Namespace_node then
				create l_string_value.make (string_value)
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ATOMIC_VALUE]} Result.make (l_string_value)
			when Text_node then
				create l_string_value.make_untyped_atomic (string_value)
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ATOMIC_VALUE]} Result.make (l_string_value)
			else
				if type_annotation = type_factory.untyped_type.fingerprint or else type_annotation = type_factory.untyped_atomic_type.fingerprint then
					create l_string_value.make_untyped_atomic (string_value)
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ATOMIC_VALUE]} Result.make (l_string_value)
				else
					-- schema-aware
					todo ("typed_value", True)
					check False then end
				end
			end
		end

	atomized_value: XM_XPATH_VALUE
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		do
			inspect
				node_type
			when Comment_node, Processing_instruction_node, Namespace_node then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			when Text_node then
				create {XM_XPATH_STRING_VALUE} Result.make_untyped_atomic (string_value)
			else
				if type_annotation = type_factory.untyped_type.fingerprint or type_annotation = type_factory.untyped_atomic_type.fingerprint then
					create {XM_XPATH_STRING_VALUE} Result.make_untyped_atomic (string_value)
				else
					-- schema-aware
					todo ("atomized_value", True)
					check False then end
				end
			end
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		do
			todo ("new_axis_iterator", False)
			check False then end
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_NODE]
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		do
			todo ("new_axis_iterator with node test", False)
			check False then end
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		do
			Result := "/" + node_kind
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN
			-- Does `Current' represent the same node in the tree as `other'?
		do
			Result := Current = other
		end

feature -- Element change

	set_name_code (a_name_code: INTEGER)
			-- Set name code.
		require
			positive_name_code: a_name_code >= 0
		do
			name_code := a_name_code
		ensure
			name_code_set: name_code = a_name_code
		end

	generate_id
			-- Generate a unique id for `Current'
		do
			shared_serial_number_generator.generate_next_serial_number
			if shared_serial_number_generator.last_generated_serial_number > 0 then
				generated_id := "N" + shared_serial_number_generator.last_generated_serial_number.out
			else
				generated_id := "Nn" + shared_serial_number_generator.last_generated_serial_number.abs.out
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN)
			-- Copy `Current' to `a_receiver'.
		local
			l_type_annotation, l_code: INTEGER
		do
			inspect
				node_type
			when Element_node then

				-- Note that Element_node is only used as
				--  a dummy by the stripper, so:

				check
					elements_not_copied: False
				end
			when Attribute_node then
				if copy_annotations then
					l_type_annotation := type_annotation
				else
					l_type_annotation := -1
				end
				a_receiver.notify_attribute (name_code, l_type_annotation, string_value, 0)
			when Processing_instruction_node then
				a_receiver.notify_processing_instruction (local_part, string_value, 0)
			when Text_node then
				a_receiver.notify_characters (string_value, 0)
			when Comment_node then
				a_receiver.notify_comment (string_value, 0)
			when Namespace_node then
				if shared_name_pool.is_namespace_code_allocated (local_part, string_value) then
					l_code := shared_name_pool.namespace_code (local_part, string_value)
				else
					shared_name_pool.allocate_namespace_code (local_part, string_value)
					l_code := shared_name_pool.last_namespace_code
				end
				a_receiver.notify_namespace (l_code, 0)
			end
		end

invariant

	no_document: document = Void
	valid_node_type: node_type = Text_node or else
		node_type = Attribute_node or else
		node_type = Element_node or else
		node_type = Comment_node or else
		node_type = Namespace_node or else
		node_type = Processing_instruction_node
	no_parent: parent = Void

end
