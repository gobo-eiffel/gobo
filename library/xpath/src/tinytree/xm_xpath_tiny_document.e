note

	description:

		"Tiny tree Document nodes"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2003-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TINY_DOCUMENT

	-- A node in the XML parse tree representing the Document itself
	-- (or equivalently, the root node of the Document).

inherit

	XM_XPATH_DOCUMENT
		undefine
			has_child_nodes, first_child, is_tiny_node, as_tiny_node
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

	make (a_tree: XM_XPATH_TINY_FOREST; a_node_number: INTEGER; a_base_uri: STRING; a_document_uri: like document_uri)
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
			if attached document_uri as l_document_uri then
				set_system_id (l_document_uri.full_reference)
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

	system_id: STRING
			-- SYSTEM id of `Current', or `Void' if not known
		do
			Result := tree.system_id_for_node (node_number)
		end

	line_number: INTEGER
			-- Line number of node in original source document
		do
			Result := 0
		end

	is_tiny_document: BOOLEAN
			-- Is `Current' a tiny-tree document node?
		do
			Result := True
		end

	as_tiny_document: XM_XPATH_TINY_DOCUMENT
			-- `Current' seen as a tiny-tree document
		do
			Result := Current
		end

	selected_id (an_id: STRING): detachable XM_XPATH_ELEMENT
			-- Element with ID value of `id'
		do
			if not attached id_table as l_id_table then
				Result := Void
			elseif l_id_table.has (an_id) then
				Result := l_id_table.item (an_id)
			else
				Result := Void
			end
		end

	unparsed_entity_system_id (an_entity_name: STRING): detachable STRING
			-- System identifier of an unparsed external entity
		local
			an_entity_table_entry: DS_ARRAYED_LIST [STRING]
		do
			if not attached entity_table as l_entity_table then
				Result := Void
			elseif not l_entity_table.has (an_entity_name) then
				Result := Void
			else
				an_entity_table_entry := l_entity_table.item (an_entity_name)
					check
						entity_present: an_entity_table_entry /= Void
						-- Because `has' returned `True'.
					end
				Result := an_entity_table_entry.item (1)
			end
		end

	unparsed_entity_public_id (an_entity_name: STRING): detachable STRING
			-- Public identifier of an unparsed external entity
		local
			an_entity_table_entry: DS_ARRAYED_LIST [STRING]
			l_entity_table: like entity_table
		do
			l_entity_table := entity_table
			if l_entity_table = Void then
				Result := Void
			elseif not l_entity_table.has (an_entity_name) then
				Result := Void
			else
				an_entity_table_entry := l_entity_table.item (an_entity_name)
					check
						entity_present: an_entity_table_entry /= Void
						-- Because `has' returned `True'.
					end
				Result := an_entity_table_entry.item (2)
			end
		end

	document_uri: detachable UT_URI
			-- Absolute URI of the source from which the document was constructed

	all_elements (a_fingerprint: INTEGER): DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT]
			-- An enumeration of all elements with a given name;
			-- This is implemented as a memo function:
			--  the first time it is called for a particular
			--  element type, it remembers the result for next time.
		local
			a_list: DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT]
			an_index, a_stored_name_code, another_fingerprint, top_bits: INTEGER
			a_node: XM_XPATH_TINY_NODE
			l_element_list: like element_list
		do
			l_element_list := element_list
			if l_element_list = Void then
				create l_element_list.make_map (10)
				element_list := l_element_list
			end
			if l_element_list.has (a_fingerprint) then
				Result := l_element_list.item (a_fingerprint)
			else
				create a_list.make_default
				from
					an_index := 1
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
				variant
					tree.number_of_nodes - an_index + 1
				end
				if l_element_list.is_full then
					l_element_list.resize (l_element_list.count * 2)
				end
				l_element_list.put (a_list, a_fingerprint)
				Result := a_list
			end
		end

	root: XM_XPATH_NODE
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		do
			Result := Current
		end

	document_root: XM_XPATH_DOCUMENT
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		do
			Result := Current
		end

	idrefs_nodes (some_idrefs: DS_LIST [STRING]): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- Sequence of nodes in document order with an IDREF in `some_idrefs'
		do
			if not attached attribute_idref_table as l_attribute_idref_table then
				create {XM_XPATH_EMPTY_ITERATOR [XM_XPATH_TINY_NODE]} Result.make
			else
				Result := l_attribute_idref_table.new_iterator (some_idrefs)
			end
		end

	is_idref_registered (an_attribute_number: INTEGER; an_idref: STRING): BOOLEAN
			-- Is `an_attribute_number' registered for `an_idref'?
		require
			valid_attribute_number: tree.is_attribute_number_valid (an_attribute_number)
			idref_not_empty: an_idref /= Void and then not an_idref.is_empty
		do
			Result := attached attribute_idref_table as l_attribute_idref_table and then l_attribute_idref_table.has (an_attribute_number, an_idref)
		end

feature -- Element change

	set_system_id (a_system_id: STRING)
			-- Set the SYSTEM ID.
		require
			system_id_not_void: a_system_id /= Void
		do
			tree.set_system_id_for_node (node_number, a_system_id)
		end

	register_id (an_element: XM_XPATH_TINY_ELEMENT; a_value: STRING)
			-- Register an ID value.
		require
			element_not_void: an_element /= Void
		local
			l_id_table: like id_table
		do
			l_id_table := id_table
			if l_id_table = Void then
				create l_id_table.make_with_equality_testers (10, Void, string_equality_tester)
				id_table := l_id_table
			end
			if not l_id_table.has (a_value) then
				l_id_table.force_new (an_element, a_value)
			end
		end

	register_attribute_idref (an_attribute_number: INTEGER; an_idref: STRING)
			-- Register `an_idref' for `an_attribute_number'.
		require
			valid_attribute_number: tree.is_attribute_number_valid (an_attribute_number)
			idref_not_empty: an_idref /= Void and then not an_idref.is_empty
			not_already_registered: not is_idref_registered (an_attribute_number, an_idref)
		local
			l_attribute_idref_table: like attribute_idref_table
		do
			l_attribute_idref_table := attribute_idref_table
			if l_attribute_idref_table = Void then
				create l_attribute_idref_table.make (tree)
				attribute_idref_table := l_attribute_idref_table
			end
			l_attribute_idref_table.register (an_attribute_number, an_idref)
		ensure
			idref_registered: is_idref_registered (an_attribute_number, an_idref)
		end

	set_unparsed_entity (a_name, a_system_id, a_public_id: STRING)
			-- Save SYSTEM and PUBLIC ids for `a_name'.
		require
			entity_name_not_void: a_name /= Void
		local
			an_id_list: DS_ARRAYED_LIST [STRING]
			l_entity_table: like entity_table
		do
			l_entity_table := entity_table
			if l_entity_table = Void then
				create l_entity_table.make_with_equality_testers (10, Void, string_equality_tester)
				entity_table := l_entity_table
			end
			if l_entity_table.has (a_name) then
				-- Validation error - we will ignore duplicates
			else
				create an_id_list.make (2)
				an_id_list.set_equality_tester (string_equality_tester)
				an_id_list.put (a_system_id, 1)
				an_id_list.put (a_public_id, 2)
			end
		end

feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN)
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

	is_possible_child: BOOLEAN
			-- Can this node be a child of a document or element node?
		do
			Result := False
		end

feature {NONE} -- Implementation

	id_table: detachable DS_HASH_TABLE [XM_XPATH_TINY_ELEMENT, STRING]
			-- Mapping of IDs to elements.;
			--  created on demand

	element_list: detachable DS_HASH_TABLE [DS_ARRAYED_LIST [XM_XPATH_TINY_ELEMENT], INTEGER]
			-- Lists of elements with the same name;
			--  created on demand

	entity_table: detachable DS_HASH_TABLE [DS_ARRAYED_LIST [STRING], STRING]
			-- Mapping of unparsed entity names to their URI/PUBLIC-ID pairs;
			--  created on demand

	attribute_idref_table: detachable XM_XPATH_TINY_ATTRIBUTE_IDREF_TABLE
			-- Mapping of IDREFs to attributes;
			--  created on demand

invariant

	tree_not_void: tree /= Void

end
