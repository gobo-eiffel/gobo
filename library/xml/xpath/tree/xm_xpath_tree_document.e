indexing

	description:

		"Standard tree document nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_DOCUMENT
	
inherit
	
	XM_XPATH_DOCUMENT
		undefine
			document_element, next_sibling, previous_sibling, has_child_nodes,
			first_child, last_child
		end

	XM_XPATH_TREE_COMPOSITE_NODE
		undefine
			document_number, base_uri, local_part
		redefine
			document_element, next_sibling, previous_sibling, root, document_root
		end

creation

	make

feature {NONE} -- Initialization

	make (a_name_pool: XM_XPATH_NAME_POOL; a_system_id: STRING) is
			-- Establish invariant.
		require
			name_pool_not_void: a_name_pool /= Void
			system_id_not_void: a_system_id /= Void
		do
			document := Current
			node_type := Document_node
			create children.make (5)
			sequence_number_high_word := 1
			name_pool := a_name_pool
			base_uri := a_system_id
			name_pool.allocate_document_number (Current)
			document_number := name_pool.document_number (Current)
		ensure
			name_pool_set: name_pool = a_name_pool
			base_uri_set: STRING_.same_string (base_uri, a_system_id)
		end

feature -- Access

	document_element: XM_XPATH_TREE_ELEMENT
			-- Document element

	hash_code: INTEGER is
		do
			Result := document_number \\ 7
		end

	previous_sibling: XM_XPATH_NODE is
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end
	
	next_sibling: XM_XPATH_NODE is
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		do
			Result := Void
		end

	root: XM_XPATH_NODE is
			-- The root node for `Current'
		do
			Result := Current
		end

	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		do
			Result := Current
		end

	all_elements (a_fingerprint: INTEGER): DS_ARRAYED_LIST [XM_XPATH_TREE_ELEMENT] is
			-- An enumeration of all elements with a given name;
			-- This is implemented as a memo function:
			--  the first time it is called for a particular
			--  element type, it remembers the result for next time.
				local
			a_list: DS_ARRAYED_LIST [XM_XPATH_TREE_ELEMENT]
			an_element: XM_XPATH_TREE_ELEMENT
			a_node: XM_XPATH_TREE_NODE
		do
			if element_list = Void then
				create element_list.make (10)
			end
			if not element_list.has (a_fingerprint) then
				create a_list.make_default
			else
				a_list := element_list.item (a_fingerprint)
			end

			from
				a_node := next_node_in_document_order (Current)
			until
				a_node = Void
			loop
				if a_node.node_type = Element_node and then
					a_node.fingerprint = a_fingerprint then
					an_element ?= a_node
						check
							is_an_element: an_element /= Void
							-- because of `node_type'
						end
					if a_list.is_full then
						a_list.resize (a_list.count * 2)
					end
					a_list.put_last (an_element)
				end
				a_node := a_node.next_node_in_document_order (Current)
			end

			Result := a_list
		end

			
	unparsed_entity_system_id (an_entity_name: STRING): STRING is
			-- System identifier of an unparsed external entity
		local
			an_entity_table_entry: DS_ARRAYED_LIST [STRING]
		do
			if entity_table = Void then
				Result := Void
			elseif not entity_table.has (an_entity_name) then
				Result := Void
			else
				an_entity_table_entry := entity_table.item (an_entity_name)
					check
						entity_present: an_entity_table_entry /= Void
						-- Because `has' returned `True'.
					end
				Result := an_entity_table_entry.item (1)
			end
		end

	unparsed_entity_public_id (an_entity_name: STRING): STRING is
			-- Public identifier of an unparsed external entity
		local
			an_entity_table_entry: DS_ARRAYED_LIST [STRING]
		do
			if entity_table = Void then
				Result := Void
			elseif not entity_table.has (an_entity_name) then
				Result := Void
			else
				an_entity_table_entry := entity_table.item (an_entity_name)
					check
						entity_present: an_entity_table_entry /= Void
						-- Because `has' returned `True'.
					end
				Result := an_entity_table_entry.item (2)
			end
		end

	document_uri: STRING is
			-- Absoulte URI of the source from which the document was constructed
		do
			if system_id_map = Void then
				Result := Void
			else
				Result := system_id_map.system_id (1)
			end
		end

	select_id (an_id: STRING): XM_XPATH_ELEMENT is
			-- Element with ID value of `id'
		do
			if id_table = Void then
				Result := Void
			elseif id_table.has (an_id) then
				Result := id_table.item (an_id)
			else
				Result := Void
			end
		end

	system_id_for_node (a_node_number: INTEGER): STRING is
			-- SYSTEM ID of element or processing-instruction referenced by `a_node_number'
		require
			valid_node_number: a_node_number > 0
		do
			Result := system_id_map.system_id (a_node_number)
		end
		
feature -- Element change

	set_document_element (an_element: XM_XPATH_TREE_ELEMENT) is
			-- Set `document_element'.
		require
			document_element_not_void: an_element /= Void
		do
			document_element := an_element
		ensure
			document_element_not_void: document_element /= Void
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

feature {NONE} -- Implementation

	element_list: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_TREE_ELEMENT], INTEGER]
			-- Lists of elements with the same name.

	entity_table: DS_HASH_TABLE [DS_ARRAYED_LIST [STRING], STRING]
		-- Maps unparsed entity names to their URI/PUBLIC-ID pairs
		
	id_table: DS_HASH_TABLE [XM_XPATH_TINY_ELEMENT, STRING]
			-- Mapping of IDs to elements.

	system_id_map: XM_XPATH_SYSTEM_ID_MAP
			-- Maps element or processing-instruction sequence numbers to system-ids

invariant

	no_parent: parent_node = Void

end
	
