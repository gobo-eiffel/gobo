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

	XM_XPATH_TYPE

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_SHARED_ANY_NODE_TEST

feature -- Access

	node_number: INTEGER
			-- Uniquely identifies this node within the document (when combined with `node_kind')

	document: XM_XPATH_TINY_DOCUMENT
			-- Document that owns this node
	
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
			Result := document.name_code_for_node (node_number)
		end

	parent: XM_XPATH_TINY_COMPOSITE_NODE is
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes.
		local
			p: INTEGER
		do
			-- Are we the effective root of the tree
			if node_number = document.root_node then
				cached_parent_node := Void
				Result := Void
			elseif cached_parent_node /= Void then
				Result := cached_parent_node
			else
				-- if parent_node is unknown, follow the next-sibling axis backwards
				-- until we find the owner pointer
				from
					p := document.retrieve_next_sibling (node_number)
				until
					p <= node_number
				loop
					p := document.retrieve_next_sibling (p)
				end
				cached_parent_node ?= document.retrieve_node (p)
				Result := cached_parent_node
			end
		end

	node_name: STRING is
			-- Qualified name
		do
			inspect
				node_type
			when Attribute_node then
				Result := document.name_pool.display_name_from_name_code (name_code)
			when Element_node then
				Result := document.name_pool.display_name_from_name_code (name_code)
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
			Result := document.root
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		do
			Result := document.document_root
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		do

			-- Fast path for child axis

			if an_axis_type = Child_axis then
				if has_child_nodes then
					create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (document, Current, Void, True)					
				else
					Result := empty_abstract_node_iterator
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
				if a_node_test.matches_node (node_type, fingerprint, any_item.fingerprint) then
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (Current)
				else
					Result := empty_abstract_node_iterator
				end
			when Preceding_or_ancestor_axis then
				Result := created_preceding_or_ancestor_axis_iterator (a_node_test)
			end
		end

feature -- Comparison


	is_same_node (other: XM_XPATH_TINY_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		do
			if other = Current then
				Result := True
			elseif document /= other.document then
				Result := False
			elseif node_number /= other.node_number then
				Result := False
			elseif node_type /= other.node_type then
				Result := False
			else
				Result := True
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
	
	empty_abstract_node_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE] is
			-- Empty iterator
		do
			create Result.make
		end


	created_ancestor_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New ancestor axis iterator
		require
			node_test_not_void: a_node_test /= Void
		do
			if node_type = Document_node then
				Result := empty_abstract_node_iterator
			else
				create {XM_XPATH_TINY_ANCESTOR_ENUMERATION} Result.make (document, Current, a_node_test, False)
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
				if a_node_test.matches_node (node_type, fingerprint, any_item.fingerprint) then
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (Current)
				else
					Result := empty_abstract_node_iterator
				end
			else
				create {XM_XPATH_TINY_ANCESTOR_ENUMERATION} Result.make (document, Current, a_node_test, True)
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
				Result := empty_abstract_node_iterator
			elseif document.alpha_value (node_number) < 1 then -- Element has no attributes
				Result := empty_abstract_node_iterator
			else
				create {XM_XPATH_TINY_ATTRIBUTE_ENUMERATION} Result.make (document, node_number, a_node_test)
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
				create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (document, Current, a_node_test, True)
			else
				Result := empty_abstract_node_iterator
			end
		ensure
			child_axis_iterator_not_void: Result /= Void
		end

	created_descendant_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New descendant axis iterator
		require
			node_test_not_void: a_node_test /= Void		
		local
			a_name_test: XM_XPATH_NAME_TEST
			a_document: XM_XPATH_TINY_DOCUMENT
		do
			a_name_test ?= a_node_test
			if node_type = Document_node and then a_name_test /= Void and then a_name_test.node_kind = Element_node then
				a_document ?= Current
					check
						document_not_void: document /= Void
						-- as `node_type' is `Document_node'
					end
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_TINY_ELEMENT]} Result.make (a_document.all_elements (a_node_test.fingerprint))
			else
				Result := empty_abstract_node_iterator
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
				create {XM_XPATH_TINY_DESCENDANT_ENUMERATION} Result.make (document, Current, a_node_test, True)
			elseif a_node_test.matches_node (node_type, fingerprint, any_item.fingerprint) then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (Current)
			else
				Result := empty_abstract_node_iterator					
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
				Result := empty_abstract_node_iterator
			elseif node_type = Attribute_node or else node_type = Namespace_node then
					a_parent_node := parent
					create {XM_XPATH_TINY_FOLLOWING_ENUMERATION} Result.make (document, a_parent_node, a_node_test, True)
			else
				create {XM_XPATH_TINY_FOLLOWING_ENUMERATION} Result.make (document, Current, a_node_test, False)
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
				Result := empty_abstract_node_iterator
			else
				create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (document, Current, a_node_test, False)
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
				Result := empty_abstract_node_iterator
			elseif a_node_test.matches_node (a_parent_node.node_type, a_parent_node.fingerprint, any_item.fingerprint) then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (a_parent_node)
			else
				Result := empty_abstract_node_iterator
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
				Result := empty_abstract_node_iterator
			elseif node_type = Attribute_node or else node_type = Namespace_node then
				a_parent_node := parent
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, a_parent_node, a_node_test, False)
			else
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, Current, a_node_test, False)
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
				Result := empty_abstract_node_iterator
			else
				create  {XM_XPATH_TINY_PRECEDING_SIBLING_ENUMERATION} Result.make (document, Current, a_node_test)
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
				Result := empty_abstract_node_iterator
			elseif node_type = Attribute_node or else node_type = Namespace_node then
				a_parent_node := parent
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, a_parent_node, a_node_test, True)
			else
				create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, Current, a_node_test, True)
			end	
		ensure
			preceding_or_ancestor_axis_iterator_not_void: Result /= Void
		end
	
invariant

	positive_node_number: node_number > 0
	owned_node: document /= Void
	
end
