indexing

	description:

		"Standard tree nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TREE_NODE
	
inherit

	XM_XPATH_NODE
		redefine
			next_sibling, previous_sibling, document_element
		end

	XM_XPATH_TYPE

	XM_XPATH_SHARED_ANY_ITEM_TYPE

	XM_XPATH_SHARED_ANY_NODE_TEST

	XM_XPATH_DEBUGGING_ROUTINES

feature -- Access

	document: XM_XPATH_TREE_DOCUMENT
			-- Document that owns this node

	system_id: STRING is
			-- SYSTEM id of `Current'
		do

			-- default implementation for child nodes

			if parent = Void then
				Result := ""
			else
				Result := parent.system_id
			end
		end

	line_number: INTEGER is
			-- Line number
		do

			-- default implementation for child nodes

			Result := parent.line_number
		end
			
	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order)
			-- In this implementation, parent nodes (elements and roots)
			--  have a zero least-significant word, while namespaces,
			--  attributes, text nodes, comments, and PIs have
			--  the top word the same as their owner and the
			--  bottom half reflecting their relative position.
			-- This is the default implementation for child nodes.
		local
			a_previous_node: XM_XPATH_TREE_NODE
			a_parent_node: XM_XPATH_TREE_COMPOSITE_NODE
			finished: BOOLEAN
			counter: INTEGER
		do
			from
				a_previous_node := Current
			until
				finished
			loop
				a_parent_node ?= a_previous_node
				if a_parent_node /= Void then
					finished := True

					-- N.B. the large offset is to leave room for namespace and attribute nodes.

					create Result.make_with_large_offset (a_previous_node.sequence_number.high_word, counter)
				else
					a_previous_node := a_previous_node.previous_node_in_document_order
				end
				counter := counter + 1
			end
				
		end

	document_element: XM_XPATH_TREE_ELEMENT is
			-- The top-level element
		do
			Result ?= document_root.document_element
		end

	document_number: INTEGER is
			-- Uniquely identifies the owning document.
		do
			Result := document.document_number
		end

	child_index: INTEGER
			-- Position within `parent'

	name_code: INTEGER is
			-- Name code this node - used in displaying names;
		do
			Result := -1 -- default implementation for nameless nodes
		end

	uri: STRING is
			-- URI part of the name of this node;
			-- This is the URI corresponding to the prefix,
			--  or the URI of the default namespace if appropriate.
		do
			if name_code = -1 then
				Result := ""
			else
				Result := document.name_pool.namespace_uri_from_name_code (name_code)
			end
		ensure
			uri_not_void: Result /= Void
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

	parent: XM_XPATH_TREE_COMPOSITE_NODE is
			-- Parent of current node;
			-- `Void' if current node is root, or for orphan nodes.
		do
			Result := parent_node
		end

	previous_sibling: XM_XPATH_NODE is
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		do
			if parent_node.is_valid_child_index (child_index - 1) then
				Result := parent_node.nth_child (child_index - 1)
			end
		end
	
	next_sibling: XM_XPATH_NODE is
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		do
			if parent_node.is_valid_child_index (child_index + 1) then
				Result := parent_node.nth_child (child_index + 1)
			end
		end

	root: XM_XPATH_NODE is
			-- The root node for `Current'
		do
			Result := document_root
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		do
			if parent /= void then
				Result := parent.document_root
			end
		end

	new_axis_iterator (an_axis_type: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `an_axis_type' from this node
		local
			a_composite_node: XM_XPATH_TREE_COMPOSITE_NODE
		do

			-- Fast path for child axis

			if an_axis_type = Child_axis then
				a_composite_node ?= Current
				if a_composite_node /= Void then
					Result := a_composite_node.child_iterator (any_node_test)
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
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TREE_NODE]} Result.make (Current)
				else
					Result := empty_abstract_node_iterator
				end
			when Preceding_or_ancestor_axis then
				Result := created_preceding_or_ancestor_axis_iterator (a_node_test)
			end
		end

feature -- Comparison

	is_same_node (other: XM_XPATH_TREE_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		do

			-- Default implementation. Differs for attributes (and namespaces? - we can share these)
			
			if other = Current then
				Result := True
			end
		end

feature -- Element change

	set_parent (a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_index: INTEGER) is
			-- Set parent.
		require
			parent_not_void: a_parent /= void
			strictly_positive_index: an_index > 0
		do
			child_index := an_index
			parent_node := a_parent
		ensure
			child_index_set: child_index = an_index
			parent_set: parent_node = a_parent
		end

feature {XM_XPATH_TREE_NODE, XM_XPATH_TREE_ENUMERATION} -- Restricted
	
	previous_node_in_document_order: XM_XPATH_TREE_NODE is
			-- Previous node within the document
		local
			a_previous_node: XM_XPATH_TREE_NODE
		do

			-- Find the last child of the previous sibling if there is one;
			--  otherwise the previous sibling element if there is one;
			--  otherwise the parent, up to the anchor element.
			-- If this reaches the document root, return `Void'

			a_previous_node ?= previous_sibling
			if a_previous_node /= Void then
				Result := a_previous_node.last_descendant_or_self
			else
				Result := parent
			end
		end

	next_node_in_document_order (an_anchor: XM_XPATH_TREE_NODE): XM_XPATH_TREE_NODE is
			-- Next node within the document;
			-- The scan stops if it encounters `an_anchor'
		require
			anchor_not_void: an_anchor /= Void -- and then `an_anchor' is an ancestor-or-self of `Current'
		local
			a_next_node, a_parent: XM_XPATH_TREE_NODE
			finished: BOOLEAN
		do
			a_next_node ?= first_child
			if a_next_node /= Void then
				Result := a_next_node
			else
				if an_anchor = Current then
					Result := Void
				else
					a_next_node ?= next_sibling
					if a_next_node /= Void then
						Result := a_next_node
					else
						from
							a_parent := Current
						until
							finished
						loop
							a_parent := a_parent.parent
							if a_parent = Void then
								finished := True
							elseif a_parent = an_anchor then
								finished := true
							else
								a_next_node ?= a_parent.next_sibling
								if a_next_node /= Void then
									Result := a_next_node
									finished := true
								end
							end
						end
					end
				end
			end
		end

	last_descendant_or_self: XM_XPATH_TREE_NODE is
			-- Last descendant or `Current' if no descendants
		local
			a_last_descendant: XM_XPATH_TREE_NODE
		do
			a_last_descendant ?= last_child
			if a_last_descendant = Void then
				Result := Current
			else
				Result := a_last_descendant.last_descendant_or_self
			end
		ensure
			last_descendant_or_self_not_void: Result /= Void
		end

feature {XM_XPATH_TREE_NODE} -- Local

	parent_node: XM_XPATH_TREE_COMPOSITE_NODE
			-- Possible parent

	
feature {NONE} -- Implementation
	
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
				create {XM_XPATH_TREE_ANCESTOR_ENUMERATION} Result.make (Current, a_node_test, False)
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
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TREE_NODE]} Result.make (Current)
				else
					Result := empty_abstract_node_iterator
				end
			else
				create {XM_XPATH_TREE_ANCESTOR_ENUMERATION} Result.make (Current, a_node_test, True)
			end
		ensure
			ancestor_or_self_axis_iterator_not_void: Result /= Void
		end

	created_attribute_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New attribute axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			an_element: XM_XPATH_TREE_ELEMENT
		do
			an_element ?= Current
			if an_element = Void then
				Result := empty_abstract_node_iterator
			else
				create {XM_XPATH_TREE_ATTRIBUTE_ENUMERATION} Result.make (an_element, a_node_test)
			end
		ensure
			attribute_axis_iterator_not_void: Result /= Void
		end

	created_child_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New child axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_composite_node: XM_XPATH_TREE_COMPOSITE_NODE
		do
			a_composite_node ?= Current
			if a_composite_node /= Void then
				Result := a_composite_node.child_iterator (a_node_test)
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
			a_document: XM_XPATH_TREE_DOCUMENT
		do
			a_name_test ?= a_node_test
			if node_type = Document_node and then a_name_test /= Void and then a_name_test.node_kind = Element_node then
				a_document ?= Current
					check
						document_not_void: document /= Void
						-- as `node_type' is `Document_node'
					end
				create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_TREE_ELEMENT]} Result.make (a_document.all_elements (a_node_test.fingerprint))
			elseif has_child_nodes then
				create {XM_XPATH_TREE_DESCENDANT_ENUMERATION} Result.make (Current, a_node_test, False)
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
				create {XM_XPATH_TREE_DESCENDANT_ENUMERATION} Result.make (Current, a_node_test, True)
			elseif a_node_test.matches_node (node_type, fingerprint, any_item.fingerprint) then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TREE_NODE]} Result.make (Current)
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
			a_parent_node: XM_XPATH_TREE_NODE
		do
			if node_type = Document_node then
				Result := empty_abstract_node_iterator
			else
				create {XM_XPATH_TREE_FOLLOWING_ENUMERATION} Result.make (Current, a_node_test)
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
				create  {XM_XPATH_TREE_FOLLOWING_SIBLING_ENUMERATION} Result.make (Current, a_node_test)
			end
		ensure
			following_sibling_axis_iterator_not_void: Result /= Void
		end

	created_parent_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New parent axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_parent_node: XM_XPATH_TREE_NODE
		do
			a_parent_node := parent
			if a_parent_node = Void then
				Result := empty_abstract_node_iterator
			elseif a_node_test.matches_node (a_parent_node.node_type, a_parent_node.fingerprint, any_item.fingerprint) then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TREE_NODE]} Result.make (a_parent_node)
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
			a_parent_node: XM_XPATH_TREE_NODE
		do
			if node_type = Document_node then
				Result := empty_abstract_node_iterator
			else
				create  {XM_XPATH_TREE_PRECEDING_ENUMERATION} Result.make (Current, a_node_test)
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
				create  {XM_XPATH_TREE_PRECEDING_SIBLING_ENUMERATION} Result.make (Current, a_node_test)
			end
		ensure
			preceding_sibling_axis_iterator_not_void: Result /= Void
		end

	created_preceding_or_ancestor_axis_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- New preceding-or-ancestor axis iterator
		require
			node_test_not_void: a_node_test /= Void
		local
			a_parent_node: XM_XPATH_TREE_NODE
		do
			if node_type = Document_node then
				Result := empty_abstract_node_iterator
			else
				create  {XM_XPATH_TREE_PRECEDING_OR_ANCESTOR_ENUMERATION} Result.make (Current, a_node_test)
			end	
		ensure
			preceding_or_ancestor_axis_iterator_not_void: Result /= Void
		end

invariant

	no_parent: parent_node = Void implies child_index = 0
	child_index: parent_node /= Void implies child_index > 0
	document_not_void: document /= Void

end
	
