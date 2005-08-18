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
			first_child, last_child, is_tree_node, as_tree_node
		redefine
			hash_code
		end

	XM_XPATH_TREE_COMPOSITE_NODE
		undefine
			document_number, base_uri, local_part, system_id, line_number, hash_code, is_document, as_document
		redefine
			document_element, next_sibling, previous_sibling, root, document_root, is_tree_document, as_tree_document
		end

create

	make

feature {NONE} -- Initialization

	make (a_system_id: STRING) is
			-- Establish invariant.
		require
			system_id_not_void: a_system_id /= Void
		do
			cached_id_table := Void
			document := Current
			node_type := Document_node
			create children.make (5)
			create system_id_map.make
			sequence_number_high_word := 1
			set_system_id (a_system_id)
			shared_name_pool.allocate_document_number (Current)
		ensure
			base_uri_set: STRING_.same_string (base_uri, a_system_id)
			cached_id_table_is_void: cached_id_table = Void
		end

feature -- Access

	is_tree_document: BOOLEAN is
			-- Is `Current' a document?
		do
			Result := True
		end

	as_tree_document: XM_XPATH_TREE_DOCUMENT is
			-- `Current' seen as a document
		do
			Result := Current
		end

	system_id: STRING is
			-- SYSTEM id of `Current', or `Void' if not known
		do
			Result := system_id_map.system_id (sequence_number_high_word)
		end

	line_number: INTEGER is
			-- Line number of node in original source document, or 0 if not known
		do
			Result := 0
		end

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
			a_node: XM_XPATH_TREE_NODE
		do
			if element_list = Void then
				create element_list.make_map (10)
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
					check
						is_an_element: a_node.is_tree_element
						-- because of `node_type'
					end
					if a_list.is_full then
						a_list.resize (a_list.count * 2)
					end
					a_list.put_last (a_node.as_tree_element)
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
			-- Absolute URI of the source from which the document was constructed
		do
			Result := system_id_map.system_id (1)
		end

	selected_id (an_id: STRING): XM_XPATH_ELEMENT is
			-- Element with ID value of `id'
		do
			if id_table.has (an_id) then
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
		ensure
			system_id_not_void: Result /= Void
		end

	line_number_for_node (a_node_number: INTEGER): INTEGER is
			-- Line number of `a_node_number' in original source document, or 0 if not known
		do
			if line_number_map /= Void then
				Result := line_number_map.line_number (a_node_number)
			end
		end

feature -- Status report

	is_line_numbering: BOOLEAN is
			-- is line numbering turned on?
		do
			Result := line_number_map /= Void
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the SYSTEM ID.
		require
			system_id_not_void: a_system_id /= Void
		do
			set_system_id_for_node (1, a_system_id)
		end

	set_system_id_for_node (a_node_number: INTEGER; a_system_id: STRING) is
			-- Set the SYSTEM ID for `a_node_number'.
		require
			system_id_not_void: a_system_id /= Void
			valid_node_number: a_node_number > 0
		do
			system_id_map.set_system_id(a_node_number, a_system_id)
		end

	set_line_numbering is
			-- Turn on line numbering
		require
			no_line_numbering: not is_line_numbering
		do
			create line_number_map.make
			set_line_number_for_node (1, 0)
		ensure
			line_number_map_not_void: line_number_map /= Void
		end

	set_line_number_for_node (a_node_number: INTEGER; a_line_number: INTEGER) is
			-- Set the line number for `a_node_number'.
		require
			valid_node_number: a_node_number > 0
			prositive_line_number: a_line_number >= 0
		do
			if line_number_map /= Void then
				line_number_map.set_line_number(a_node_number, a_line_number)
			end
		end

	set_document_element (an_element: XM_XPATH_TREE_ELEMENT) is
			-- Set `document_element'.
		require
			document_element_not_void: an_element /= Void
		do
			document_element := an_element
		ensure
			document_element_not_void: document_element /= Void
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		local
			a_node: XM_XPATH_NODE
		do
			from
				a_node := first_child
			until
				a_node = Void
			loop
				a_node.copy_node (a_receiver, which_namespaces, copy_annotations)
				a_node := a_node.next_sibling
			end
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

	cached_id_table: like id_table
			-- Cache for `id_table'
	
	id_table: DS_HASH_TABLE [XM_XPATH_TREE_ELEMENT, STRING] is
			-- Mapping of IDs to elements.
			-- Implemented as a memo function
		local
			a_node: XM_XPATH_TREE_NODE
			an_element: XM_XPATH_TREE_ELEMENT
			an_index: INTEGER
			a_value: STRING
		do
			if cached_id_table = Void then
				create cached_id_table.make_with_equality_testers (10, Void, string_equality_tester)
				from
					a_node := Current
				until
					a_node = Void
				loop
					if a_node.node_type = Element_node then
						an_element := a_node.as_tree_element
						from
							an_index := 1
						variant
							an_element.number_of_attributes + 1 - an_index
						until
							an_index > an_element.number_of_attributes
						loop
							if an_element.is_id (an_index) then
								a_value := an_element.attribute_value_by_index (an_index)
								if is_ncname (a_value) then
									if not cached_id_table.has (a_value) then
										cached_id_table.put (an_element, a_value)
									end
								end
							end
							an_index := an_index + 1
						end
					end
					a_node := a_node.next_node_in_document_order (Current)
				end
			end
			Result := cached_id_table
		ensure
			id_table_not_void: Result /= Void
			result_cached: Result = cached_id_table
		end

	system_id_map: XM_XPATH_SYSTEM_ID_MAP
			-- Maps element or processing-instruction sequence numbers to system-ids

	line_number_map: XM_XPATH_LINE_NUMBER_MAP
			-- Maps sequence numbers to line numbers

invariant

	no_parent: parent_node = Void
	system_id_map: system_id_map /= Void

end
	
