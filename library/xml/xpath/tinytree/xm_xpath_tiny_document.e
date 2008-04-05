indexing

	description:

		"Tiny tree Document nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TINY_DOCUMENT

	-- A node in the XML parse tree representing the Document itself
	-- (or equivalently, the root node of the Document).

inherit

	XM_XPATH_DOCUMENT
		undefine
			has_child_nodes, first_child, is_tiny_node, as_tiny_node
		redefine
			node_kind
		end

	XM_XPATH_TINY_COMPOSITE_NODE
		undefine
			document_number, base_uri, local_part, is_document, as_document
		redefine
			root, document_root, system_id, line_number, is_tiny_document, as_tiny_document
		end
	
	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STANDARD_FILES
		export {NONE} all end

	UC_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_tree: XM_XPATH_TINY_FOREST; a_node_number: INTEGER; a_base_uri: STRING; a_document_uri: like document_uri) is
			-- Establish invariant.
		require
			tree_not_void: a_tree /= Void
			strictly_positive_node_number: a_node_number > 0
		do
			tree := a_tree
			node_number := a_node_number
			node_type := Document_node
			base_uri := a_base_uri
			document_uri := a_document_uri
			if document_uri /= Void then
				set_system_id (document_uri.full_reference)
			end
		ensure
			tree_set: tree = a_tree
			node_number_set: node_number = a_node_number
			base_uri_set: base_uri = a_base_uri
			document_id_set: document_uri = a_document_uri
		end

feature -- Access

	base_uri: STRING
			-- Base URI of `Current'

	system_id: STRING is
			-- SYSTEM id of `Current', or `Void' if not known
		do
			Result := tree.system_id_for_node (node_number)
		end

	line_number: INTEGER is
			-- Line number of node in original source document
		do
			Result := 0
		end

	is_tiny_document: BOOLEAN is
			-- Is `Current' a tiny-tree document node?
		do
			Result := True
		end

	as_tiny_document: XM_XPATH_TINY_DOCUMENT is
			-- `Current' seen as a tiny-tree document
		do
			Result := Current
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "document"
		end		

	selected_id (an_id: STRING): XM_XPATH_ELEMENT is
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

	document_uri: UT_URI
			-- Absolute URI of the source from which the document was constructed

	all_elements (a_fingerprint: INTEGER): DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT] is
			-- An enumeration of all elements with a given name;
			-- This is implemented as a memo function:
			--  the first time it is called for a particular
			--  element type, it remembers the result for next time.
		local
			a_list: DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT]
			an_index, a_stored_name_code, another_fingerprint, top_bits: INTEGER
			a_node: XM_XPATH_TINY_NODE
		do
			if element_list = Void then
				create element_list.make_map (10)
			end
			if not element_list.has (a_fingerprint) then
				create a_list.make_default
			else
				Result := element_list.item (a_fingerprint)
			end
			if Result = Void then
				from
					an_index := 1
				variant
					tree.number_of_nodes - an_index + 1
				until
					an_index > tree.number_of_nodes
				loop
					a_stored_name_code := tree.retrieve_name_code (an_index)
					top_bits := (a_stored_name_code // bits_20) * bits_20
					another_fingerprint := a_stored_name_code - top_bits
					if tree.retrieve_node_kind (an_index) = Element_node
						and then  another_fingerprint = a_fingerprint then
						a_node := tree.retrieve_node (an_index)
						check
							is_element: a_node.is_tiny_element
						end
						if a_list.is_full then
							a_list.resize (a_list.count * 2)
						end
						a_list.put_last (a_node.as_tiny_element)
					end
					an_index := an_index + 1
				end
				if element_list.is_full then
					element_list.resize (element_list.count * 2)
				end
				element_list.put (a_list, a_fingerprint)
				Result := a_list
			end
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

	idrefs_nodes (some_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE] is
			-- Sequence of nodes in document order with an IDREF in `some_idrefs'
		do
			if attribute_idref_table = Void then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_TINY_NODE]} Result.make
			else
				Result := attribute_idref_table.new_iterator (some_idrefs)
			end
		end

	is_idref_registered (an_attribute_number: INTEGER; an_idref: STRING): BOOLEAN is
			-- Is `an_attribute_number' registered for `an_idref'?
		require
			valid_attribute_number: tree.is_attribute_number_valid (an_attribute_number)
			idref_not_empty: an_idref /= Void and then not an_idref.is_empty
		do
			Result := attribute_idref_table /= Void and then attribute_idref_table.has (an_attribute_number, an_idref)
		end

feature -- Element change

	set_system_id (a_system_id: STRING) is
			-- Set the SYSTEM ID.
		require
			system_id_not_void: a_system_id /= Void
		do
			tree.set_system_id_for_node (node_number, a_system_id)
		end

	register_id (an_element: XM_XPATH_TINY_ELEMENT; a_value: STRING) is
			-- Register an ID value.
		require
			element_not_void: an_element /= Void
		do
			if id_table = Void then
				create id_table.make_with_equality_testers (10, Void, string_equality_tester)
			end
			if not id_table.has (a_value) then
				id_table.force_new (an_element, a_value)
			end
		end

	register_attribute_idref (an_attribute_number: INTEGER; an_idref: STRING) is
			-- Register `an_idref' for `an_attribute_number'.
		require
			valid_attribute_number: tree.is_attribute_number_valid (an_attribute_number)
			idref_not_empty: an_idref /= Void and then not an_idref.is_empty
			not_already_registered: not is_idref_registered (an_attribute_number, an_idref)
		do
			if attribute_idref_table = Void then
				create attribute_idref_table.make (tree)
			end
			attribute_idref_table.register (an_attribute_number, an_idref)
		ensure
			idref_registered: is_idref_registered (an_attribute_number, an_idref)
		end

	set_unparsed_entity (a_name, a_system_id, a_public_id: STRING) is
			-- Save SYSTEM and PUBLIC ids for `a_name'.
		require
			entity_name_not_void: a_name /= Void
		local
			an_id_list: DS_ARRAYED_LIST [STRING]
		do
			if entity_table = Void then
				create entity_table.make_with_equality_testers (10, Void, string_equality_tester)
			end
			if entity_table.has (a_name) then
				-- Validation error - we will ignore duplicates
			else
				create an_id_list.make (2)
				an_id_list.set_equality_tester (string_equality_tester)
				an_id_list.put (a_system_id, 1)
				an_id_list.put (a_public_id, 2)
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
			-- Copy `Current' to `a_receiver'.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			
			-- output the children

			from
				an_iterator := new_axis_iterator (Child_axis); an_iterator.start
			until
				an_iterator.is_error or else an_iterator.after
			loop
				an_iterator.item.copy_node (a_receiver, which_namespaces, copy_annotations)
				an_iterator.forth
			end
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end
	
feature {NONE} -- Implementation

	id_table: DS_HASH_TABLE [XM_XPATH_TINY_ELEMENT, STRING]
			-- Mapping of IDs to elements.;
			--  created on demand

	element_list: DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT], INTEGER]
			-- Lists of elements with the same name;
			--  created on demand

	entity_table: DS_HASH_TABLE [DS_ARRAYED_LIST [STRING], STRING]
			-- Mapping of unparsed entity names to their URI/PUBLIC-ID pairs;
			--  created on demand

	attribute_idref_table: XM_XPATH_TINY_ATTRIBUTE_IDREF_TABLE
			-- Mapping of IDREFs to attributes;
			--  created on demand

invariant

	tree_not_void: tree /= Void

end
