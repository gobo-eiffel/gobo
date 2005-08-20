indexing

	description:

		"Temporary trees whose document owns a single text node."

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TEXT_FRAGMENT_VALUE

inherit

	XM_XPATH_DOCUMENT
		redefine
			hash_code
		end

create

	make

feature {NONE} -- Initialization

	make (a_value, a_system_id: STRING) is
			-- Establish invariant.
		require
			value_not_void: a_value /= Void
			system_id_not_void: a_system_id /= Void
		do
			text := a_value
			system_id := a_system_id
			shared_name_pool.allocate_document_number (Current)
		ensure
			text_set: text = a_value
			system_id_set: system_id = a_system_id
		end

feature -- Access

	system_id: STRING
			-- SYSTEM id

	line_number: INTEGER
			-- Line number
	
	selected_id (an_id: STRING): XM_XPATH_ELEMENT is
			-- Element with ID value of `id'
		do
			Result := Void
		end

	string_value: STRING is
			--Value of the item as a string
		do
			Result := text
		end

	document_uri: STRING is
			-- Absoulte URI of the source from which the document was constructed
		do
			Result := system_id
		end

	idrefs_nodes (some_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Sequence of nodes in document order with an IDREF in `some_idrefs'
		do
			create {XM_XPATH_EMPTY_ITERATOR} Result.make
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		local
			a_node_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
		do
			inspect
				an_axis_type
			when Self_axis, Ancestor_or_self_axis then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
			when Child_axis, Descendant_axis then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (child_text_node)
			when Descendant_or_self_axis then
				create a_node_list.make (2)
				a_node_list.put (Current, 1)
				a_node_list.put (child_text_node, 2)
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_NODE]} Result.make (a_node_list)
			else
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			end
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		local
			a_node: XM_XPATH_NODE
			a_node_list: DS_ARRAYED_LIST [XM_XPATH_NODE]
		do
			inspect
				an_axis_type
			when Self_axis, Ancestor_or_self_axis then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
			when Child_axis, Descendant_axis then
				a_node := child_text_node
				if a_node_test.matches_item (a_node) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (child_text_node)
				else
					create {XM_XPATH_EMPTY_ITERATOR} Result.make
				end
			when Descendant_or_self_axis then
				a_node := child_text_node
				if a_node_test.matches_item (a_node) then
					create a_node_list.make (2)
					a_node_list.put (Current, 1)
					a_node_list.put (child_text_node, 2)
					create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_NODE]} Result.make (a_node_list)
				else
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
				end
			else
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			end	
		end
	
	unparsed_entity_system_id (an_entity_name: STRING): STRING is
			-- System identifier of an unparsed external entity
		do
			Result := Void
		end

	unparsed_entity_public_id (an_entity_name: STRING): STRING is
			-- Public identifier of an unparsed external entity
		do
			Result := Void
		end

	node_name: STRING is
			-- Qualified name
		do
			Result := "#text fragment"
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order);
			-- Sequence numbers are monotonic but not consecutive.
			-- The sequence number must be unique within the document.
		do
			create Result.make (0, 1)
		end

	name_code: INTEGER is
			-- Name code this node - used in displaying names
		do
			Result := -1
		end

	hash_code: INTEGER is
		do
			Result := document_number \\ 7
		end

	all_elements (a_fingerprint: INTEGER): DS_ARRAYED_LIST [XM_XPATH_ELEMENT] is
			-- An enumeration of all elements with a given name
		do
			create Result.make (0)
		end

	root: XM_XPATH_NODE is
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		do
			Result := Current
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		do
			Result := Current
		end

	parent: XM_XPATH_COMPOSITE_NODE is
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes or namespaces.
		do
			Result := Void
		end

	document: XM_XPATH_DOCUMENT is
			-- Document that owns this node
		do
			Result := Current
		end

	atomized_value: XM_XPATH_VALUE is
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		do
			create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (text)
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		do
			Result := other = Current
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		do
			a_receiver.notify_characters (text, 0)
		end

feature {XM_XPATH_NODE} -- Local

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

feature {NONE} -- Implementation

	text: STRING
			--  Text value

	cached_text_node: XM_XPATH_TEXT_FRAGMENT_NODE
			-- Sole text node

	child_text_node: XM_XPATH_TEXT_FRAGMENT_NODE is
			-- Sole text node
		do
			if cached_text_node = Void then
				create cached_text_node.make (text, Current, system_id)
			end
			Result := cached_text_node
		ensure
			result_not_void: Result /= Void
		end

invariant

	value_not_void: text /= Void
	
end
	
