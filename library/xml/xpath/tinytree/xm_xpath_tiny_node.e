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

feature -- Access

	node_number: INTEGER
			-- Uniquely identifies this node within the document
	
	node_name: STRING is
			-- Qualified name
		do
			inspect
				item_type
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

	local_part: STRING is
			-- Local part of the name;
			-- For nodeless names, return the empty string
		local
			a_code: INTEGER
		do
			a_code := document.name_code_for_node (node_number)
			if a_code < 0 then
				Result := ""
			else
				Result := document.name_pool.local_name_from_name_code (a_code)
			end
		end

	name_code: INTEGER is
			-- Name code this node - used in displaying names;
		do
			Result := document.name_code_for_node (node_number)
		end

	parent: XM_XPATH_TINY_NODE is
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
				cached_parent_node := document.retrieve_node (p)
				Result := cached_parent_node
			end
		end

	fingerprint: INTEGER is
			-- Fingerprint of this node - used in matching names
		local
			nc, top_bits: INTEGER
		do
			nc := name_code
			if nc = -1 then
				Result := -1
			else
				-- mask nc with 0xfffff
				top_bits := (nc // bits_20) * bits_20
				Result := nc - top_bits
			end
		end

	new_axis_iterator (axis_type: INTEGER): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `axis_type' from this node
		do
			-- Fast path for child axis
			if axis_type = Child_axis then
				if has_child_nodes then
					create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (document, Current, Void, True)					
				else
					Result := empty_abstract_node_iterator
				end
			else
				Result := new_axis_iterator_with_node_test (axis_type, any_node_test)
			end
		end

	new_axis_iterator_with_node_test (axis_type: INTEGER; test: XM_XPATH_NODE_TEST): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- An enumeration over the nodes reachable by `axis_type' from this node;
			-- Only nodes that match the pattern specified by `test' will be selected.
		local
			the_item_type: INTEGER
			name_test: XM_XPATH_NAME_TEST
			parent_node: XM_XPATH_TINY_NODE
			the_document: XM_XPATH_TINY_DOCUMENT
		do
			the_item_type := item_type
			inspect
				axis_type
			when Ancestor_axis then
				if the_item_type = Document_node then
					Result := empty_abstract_node_iterator
				else
					create {XM_XPATH_TINY_ANCESTOR_ENUMERATION} Result.make (document, Current, test, False)
				end
			when Ancestor_or_self_axis then
				if the_item_type = Document_node then
					if test.matches_node (the_item_type, fingerprint, Any_item) then
						create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (Current)
					else
						Result := empty_abstract_node_iterator
					end
				else
					create {XM_XPATH_TINY_ANCESTOR_ENUMERATION} Result.make (document, Current, test, True)
				end
			when Attribute_axis then
				if the_item_type /= Element_node then
					Result := empty_abstract_node_iterator
				elseif document.alpha_value (node_number) < 1 then -- Element has no attributes
					Result := empty_abstract_node_iterator
				else
					create {XM_XPATH_TINY_ATTRIBUTE_ENUMERATION} Result.make (document, node_number, test)
				end
			when Child_axis then
				if has_child_nodes then
					create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (document, Current, test, True)
				else
					Result := empty_abstract_node_iterator
				end
			when Descendant_axis then
				name_test ?= test
				if the_item_type = Document_node and then name_test /= Void and then name_test.item_type = Element_node then
					the_document ?= Current
						check
							document_not_void: document /= Void
						end
					create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_TINY_ELEMENT]} Result.make (the_document.all_elements (test.fingerprint))
				else
					Result := empty_abstract_node_iterator
				end
			when Descendant_or_self_axis then
				if has_child_nodes then
					create {XM_XPATH_TINY_DESCENDANT_ENUMERATION} Result.make (document, Current, test, True)
				elseif test.matches_node (the_item_type, fingerprint, Any_item) then
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (Current)
				else
					Result := empty_abstract_node_iterator					
				end				
			when Following_axis then
				if the_item_type = Document_node then
					Result := empty_abstract_node_iterator
				elseif the_item_type = Attribute_node or else the_item_type = Namespace_node then
					parent_node := parent
					create {XM_XPATH_TINY_FOLLOWING_ENUMERATION} Result.make (document, parent_node, test, True)
				else
					create {XM_XPATH_TINY_FOLLOWING_ENUMERATION} Result.make (document, Current, test, False)
				end
			when Following_sibling_axis then
				if the_item_type = Document_node or else the_item_type = Attribute_node or else the_item_type = Namespace_node then
					Result := empty_abstract_node_iterator
				else
					create  {XM_XPATH_TINY_SIBLING_ENUMERATION} Result.make (document, Current, test, False)
				end
			when Parent_axis then
				parent_node := parent
				if parent_node = Void then
					Result := empty_abstract_node_iterator
				elseif test.matches_node (parent_node.item_type, parent_node.fingerprint, Any_item) then
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (parent_node)
				else
					Result := empty_abstract_node_iterator
				end
			when Preceding_axis then
				if the_item_type = Document_node then
					Result := empty_abstract_node_iterator
				elseif the_item_type = Attribute_node or else the_item_type = Namespace_node then
					parent_node := parent
					create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, parent_node, test, False)
				else
					create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, Current, test, False)
				end
			when Preceding_sibling_axis then
				if the_item_type = Document_node or else the_item_type = Attribute_node or else the_item_type = Namespace_node then
					Result := empty_abstract_node_iterator
				else
					create  {XM_XPATH_TINY_PRECEDING_SIBLING_ENUMERATION} Result.make (document, Current, test)
				end
			when Self_axis then
				if test.matches_node (the_item_type, fingerprint, Any_item) then
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_TINY_NODE]} Result.make (Current)
				else
					Result := empty_abstract_node_iterator
				end
			when Preceding_or_ancestor_axis then
				if the_item_type = Document_node then
					Result := empty_abstract_node_iterator
				elseif the_item_type = Attribute_node or else the_item_type = Namespace_node then
					parent_node := parent
					create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, parent_node, test, True)
				else
					create  {XM_XPATH_TINY_PRECEDING_ENUMERATION} Result.make (document, Current, test, True)
				end	
			end
		end

feature -- Status report

		has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		do
			Result := False -- overriden in XM_XPATH_TINY_COMPOSITE_NODE
		end

	is_same_node (other: XM_XPATH_TINY_NODE): BOOLEAN is
			-- Does `Current' represent the same node in the tree as `other'?
		do
			if other = Current then
				Result := True
			elseif document /= other.document then
				Result := False
			elseif node_number /= other.node_number then
				Result := False
			elseif item_type /= other.item_type then
				Result := False
			else
				Result := True
			end
		end
	
feature -- Element change

	set_parent_node (a_node: XM_XPATH_TINY_NODE) is
			--
		do
			cached_parent_node := a_node
		ensure
			parent_node_set: cached_parent_node = a_node
		end
	

feature {XM_XPATH_TINY_NODE} -- Implementation
	
	document: XM_XPATH_TINY_DOCUMENT
			-- Document that owns this node
	
feature {NONE} -- Implementation
	
	cached_parent_node: XM_XPATH_TINY_NODE
			-- Cached parent node
	
	bits_20: INTEGER is 1048576
			-- Bit mask for 20-bit number
		
	empty_abstract_node_iterator: XM_XPATH_EMPTY_ITERATOR [XM_XPATH_NODE] is
			-- shared empty iterator
		once
			create Result.make
		end

	any_node_test: XM_XPATH_ANY_NODE_TEST is
			-- share any_node test
		once
			create Result.make
		end

invariant

	positive_node_number: node_number > 0
	owned_node: document /= Void
	
end
