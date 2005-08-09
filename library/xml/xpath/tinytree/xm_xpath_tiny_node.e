indexing

	description:

		"Tiny tree nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TINY_NODE
	
inherit

	XM_XPATH_NODE
		redefine
			is_tiny_node, as_tiny_node
		end

	XM_XPATH_TYPE

	XM_XPATH_SHARED_ANY_TYPE

	XM_XPATH_SHARED_ANY_NODE_TEST

feature -- Access

	is_tiny_node: BOOLEAN is
			-- Is `Current' a tiny-tree node?
		do
			Result := True
		end
	
	as_tiny_node: XM_XPATH_TINY_NODE is
			-- `Current' seen as a tiny-tree node
		do
			Result := Current
		end

	is_tiny_composite_node: BOOLEAN is
			-- Is `Current' a composite node?
		do
			Result := False
		end

	as_tiny_composite_node: XM_XPATH_TINY_COMPOSITE_NODE is
			-- `Current' seen as a composite node
		require
			tiny_composite: is_tiny_composite_node
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_tiny_document: BOOLEAN is
			-- Is `Current' a tiny-tree document node?
		do
			Result := False
		end

	as_tiny_document: XM_XPATH_TINY_DOCUMENT is
			-- `Current' seen as a tiny-tree document
		require
			tiny_document: is_tiny_document
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_tiny_element: BOOLEAN is
			-- Is `Current' an element?
		do
			Result := False
		end

	as_tiny_element: XM_XPATH_TINY_ELEMENT is
			-- `Current' seen as an element
		require
			tiny_element: is_tiny_element
		do
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	system_id: STRING is
			-- SYSTEM id of `Current', or `Void' if not known
		do
			Result := tree.system_id_for_node (node_number)
		end

	line_number: INTEGER is
			-- Line number of node in original source document, or -1 if not known
		do
			Result := tree.line_number_for_node (node_number)
		end

	node_number: INTEGER
			-- Uniquely identifies this node within the document (when combined with `node_kind')

	tree: XM_XPATH_TINY_FOREST
			-- Owning tree

	document: XM_XPATH_TINY_DOCUMENT is
			-- Document that owns this node
		do
			Result ?= document_root
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order)
			-- In this implementation, most nodes have a zero
			--  least-significant word, while namespacesand attributes have
			--  the top word the same as their owner and the bottom half reflecting their relative position.
		do
			create Result.make (node_number, 0)
		end

	document_number: INTEGER is
			-- Uniquely identifies the owning document.
		do
			Result := document.document_number
		end

	name_code: INTEGER is
			-- Name code this node - used in displaying names;
		do
			Result := tree.name_code_for_node (node_number)
		end

	parent: XM_XPATH_TINY_COMPOSITE_NODE is
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes.
		local
			p: INTEGER
			a_node: XM_XPATH_TINY_NODE
		do
			if cached_parent_node = Void then

				-- if parent_node is unknown, follow the next-sibling axis backwards
				-- until we find the owner pointer

				if tree.depth_of (node_number) = 1 then
					cached_parent_node := Void
				else
					from
						p := tree.retrieve_next_sibling (node_number)
					until
						p <= node_number
					loop
						p := tree.retrieve_next_sibling (p)
					end
					a_node := tree.retrieve_node (p)
					if a_node.is_tiny_composite_node then
						cached_parent_node := a_node.as_tiny_composite_node
					else
						cached_parent_node := Void
					end
				end
			end
			Result := cached_parent_node
		end

	node_name: STRING is
			-- Qualified name
		do
			inspect
				node_type
			when Attribute_node then
				Result := shared_name_pool.display_name_from_name_code (name_code)
			when Element_node then
				Result := shared_name_pool.display_name_from_name_code (name_code)
			when Namespace_node then
				Result := local_part
			when Processing_instruction_node then
				Result := local_part
			else
				Result := ""
			end
		end

	root: XM_XPATH_NODE is
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		do
			if tree.depth_of (node_number) = 1 then
				Result := current
			elseif cached_parent_node /= Void then
				Result := cached_parent_node.root
			else
				Result := tree.retrieve_node (tree.root_node (node_number))
			end
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		do
			Result ?= root
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		do

			-- Fast path for child axis

			if an_axis_type = Child_axis then
				if has_child_nodes then
					create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (tree, Current, Void, True)					
				else
					create {XM_XPATH_EMPTY_ITERATOR} Result.make
				end
			else
				Result := new_axis_iterator_with_node_test (an_axis_type, any_node_test)
			end
		end

	new_axis_iterator_with_node_test (an_axis_type: INTEGER; a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node;
			-- Only nodes that match the pattern specified by `a_node_test' will be selected.
		do
			inspect
				an_axis_type
			when Ancestor_axis then
				Result := created_ancestor_axis_iterator (a_node_test)
			when Ancestor_or_self_axis then
				Result := created_ancestor_or_self_axis_iterator (a_node_test)
			when Attribute_axis then
				Result := created_attribute_axis_iterator (a_node_test)
			when Child_axis then
				Result := created_child_axis_iterator (a_node_test)
			when Descendant_axis then
				Result := created_descendant_axis_iterator (a_node_test)
			when Descendant_or_self_axis then
				Result := created_descendant_or_self_axis_iterator (a_node_test)
			when Following_axis then
				Result := created_following_axis_iterator (a_node_test)
			when Following_sibling_axis then
				Result := created_following_sibling_axis_iterator (a_node_test)
			when Parent_axis then
				Result := created_parent_axis_iterator (a_node_test)
			when Preceding_axis then
				Result := created_preceding_axis_iterator (a_node_test)
			when Preceding_sibling_axis then
				Result := created_preceding_sibling_axis_iterator (a_node_test)
			when Self_axis then
				if a_node_test.matches_node (node_type, fingerprint, any_type.fingerprint) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
				else
					create {XM_XPATH_EMPTY_ITERATOR} Result.make
				end
			when Preceding_or_ancestor_axis then
				Result := created_preceding_or_ancestor_axis_iterator (a_node_test)
			end
		end

	atomized_value: XM_XPATH_VALUE is
			-- Typed value as atomic value or (unusually) sequence of atomic values.
		local
			an_annotation: INTEGER
		do
			an_annotation := type_annotation
			if an_annotation /= type_factory.untyped_atomic_type.fingerprint then
				todo ("atomized_value", True)
			else
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			end
		end

feature -- Comparison


	is_same_node (other: XM_XPATH_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		local
			a_tiny_node: XM_XPATH_TINY_NODE
		do
			if other = Current then
				Result := True
			else
				if other.is_tiny_node then
					a_tiny_node := other.as_tiny_node
					if node_number /= a_tiny_node.node_number then
						Result := False
					elseif node_type /= a_tiny_node.node_type then
						Result := False
					else
						Result := True
					end
				end
			end
		end

feature -- Element change

	set_parent_node (a_node: XM_XPATH_TINY_COMPOSITE_NODE) is
			--
		do
			cached_parent_node := a_node
		ensure
			parent_node_set: cached_parent_node = a_node
		end
	
feature {NONE} -- Implementation
	
	cached_parent_node: XM_XPATH_TINY_COMPOSITE_NODE
			-- Cached parent node

	created_ancestor_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New ancestor axis iterator
		require
			node_test_not_void: a_node_test /= Void
		do
			if node_type = Document_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			else
				create {XM_XPATH_TINY_ANCESTOR_ENUMERATION} Result.make (Current, a_node_test, False)
			end
		ensure
			ancestor_axis_iterator_not_void: Result /= Void
		end

	created_ancestor_or_self_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New ancestor-or-self axis iterator
		require
			node_test_not_void: a_node_test /= Void		
		do
			if node_type = Document_node then
				if a_node_test.matches_node (node_type, fingerprint, any_type.fingerprint) then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
				else
					create {XM_XPATH_EMPTY_ITERATOR} Result.make
				end
			else
				create {XM_XPATH_TINY_ANCESTOR_ENUMERATION} Result.make (Current, a_node_test, True)
			end
		ensure
			ancestor_or_self_axis_iterator_not_void: Result /= Void
		end

	created_attribute_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New attribute axis iterator
		require
			node_test_not_void: a_node_test /= Void		
		do
			if node_type /= Element_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			elseif tree.alpha_value (node_number) < 1 then -- Element has no attributes
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			else
				create {XM_XPATH_TINY_ATTRIBUTE_ENUMERATION} Result.make (tree, node_number, a_node_test)
			end
		ensure
			attribute_axis_iterator_not_void: Result /= Void
		end

	created_child_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New child axis iterator
		require
			node_test_not_void: a_node_test /= Void		
		do
			if has_child_nodes then
				create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (tree, Current, a_node_test, True)
			else
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			end
		ensure
			child_axis_iterator_not_void: Result /= Void
		end

	created_descendant_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New descendant axis iterator
		require
			node_test_not_void: a_node_test /= Void		
		do
			if a_node_test.is_name_test then
				if node_type = Document_node and then a_node_test.as_name_test.node_kind = Element_node then
					create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_TINY_ELEMENT]} Result.make (as_tiny_document.all_elements (a_node_test.fingerprint))
				else
					create {XM_XPATH_EMPTY_ITERATOR} Result.make
				end
			else
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			end
		ensure
			descendant_axis_iterator_not_void: Result /= Void
		end

	created_descendant_or_self_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New descendant-or-self axis iterator
		require
			node_test_not_void: a_node_test /= Void		
		do
			if has_child_nodes then
				create {XM_XPATH_TINY_DESCENDANT_ENUMERATION} Result.make (tree, Current, a_node_test, True)
			elseif a_node_test.matches_node (node_type, fingerprint, any_type.fingerprint) then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (Current)
			else
				create {XM_XPATH_EMPTY_ITERATOR} Result.make					
			end				
		ensure
			descendant_or_self_axis_iterator_not_void: Result /= Void
		end

	created_following_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New following axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_parent_node: XM_XPATH_TINY_NODE
		do
			if node_type = Document_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			elseif node_type = Attribute_node or else node_type = Namespace_node then
					a_parent_node := parent
					create {XM_XPATH_TINY_FOLLOWING_ENUMERATION} Result.make (tree, a_parent_node, a_node_test, True)
			else
				create {XM_XPATH_TINY_FOLLOWING_ENUMERATION} Result.make (tree, Current, a_node_test, False)
			end
		ensure
			following_axis_iterator_not_void: Result /= Void
		end

	created_following_sibling_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New following sibling axis iterator
		require
			node_test_not_void: a_node_test /= Void
		do
			if node_type = Document_node or else node_type = Attribute_node or else node_type = Namespace_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			else
				create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (tree, Current, a_node_test, False)
			end
		ensure
			following_sibling_axis_iterator_not_void: Result /= Void
		end

	created_parent_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New parent axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_parent_node: XM_XPATH_TINY_NODE
		do
			a_parent_node := parent
			if a_parent_node = Void then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			elseif a_node_test.matches_node (a_parent_node.node_type, a_parent_node.fingerprint, any_type.fingerprint) then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} Result.make (a_parent_node)
			else
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			end
		ensure
			parent_axis_iterator_not_void: Result /= Void
		end

	created_preceding_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New preceding axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_parent_node: XM_XPATH_TINY_NODE
		do
			if node_type = Document_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			elseif node_type = Attribute_node or else node_type = Namespace_node then
				a_parent_node := parent
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (tree, a_parent_node, a_node_test, False)
			else
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (tree, Current, a_node_test, False)
			end
		ensure
			preceding_axis_iterator_not_void: Result /= Void
		end

	created_preceding_sibling_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New preceding sibling axis iterator
		require
			node_test_not_void: a_node_test /= Void
		do	
			if node_type = Document_node or else node_type = Attribute_node or else node_type = Namespace_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			else
				create  {XM_XPATH_TINY_PRECEDING_SIBLING_ENUMERATION} Result.make (tree, Current, a_node_test)
			end
		ensure
			preceding_sibling_axis_iterator_not_void: Result /= Void
		end

	created_preceding_or_ancestor_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New preceding-or-ancestor axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_parent_node: XM_XPATH_TINY_NODE
		do
			if node_type = Document_node then
				create {XM_XPATH_EMPTY_ITERATOR} Result.make
			elseif node_type = Attribute_node or else node_type = Namespace_node then
				a_parent_node := parent
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (tree, a_parent_node, a_node_test, True)
			else
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (tree, Current, a_node_test, True)
			end	
		ensure
			preceding_or_ancestor_axis_iterator_not_void: Result /= Void
		end
	
invariant

	positive_node_number: node_number > 0
	owning_tree: tree /= Void

end
