indexing

	description:

		"Standard tree element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_ELEMENT

	-- TODO base_uri

inherit
	
	XM_XPATH_ELEMENT
		undefine
			document_element, next_sibling, previous_sibling, type_annotation, first_child, last_child, has_child_nodes
		end

	XM_XPATH_TREE_COMPOSITE_NODE
		undefine
			is_nilled, local_part
		redefine
			name_code
		end

creation {XM_XSLT_STRIPPER}

	make_dummy

creation {XM_XPATH_NODE_FACTORY}

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT; a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		require
			strictly_positive_sequence_number: a_sequence_number > 0
			base_uri_not_void: a_base_uri /= Void
		do
			document := a_document
			node_type := Element_node
			name_code := a_name_code
			create children.make (5)
			create attribute_name_codes.make (5)
			create attribute_type_codes.make (5)
			create attribute_values.make (5)
			create namespace_code_list.make (5)
			sequence_number_high_word := a_sequence_number
			-- TODO root.set_line_number (a_line_number, a_sequence_number)
			-- TODO root.set_system_id (a_base_uri, a_sequence_number)
		ensure
			name_code_set: name_code = a_name_code
		end

	make_dummy is
			-- Create a dummy element
		do
			node_type := Element_node
			name_code := -1
			create children.make (5)
			create attribute_name_codes.make (5)
			create attribute_type_codes.make (5)
			create attribute_values.make (5)
			create namespace_code_list.make (5)
			sequence_number_high_word := -1
		end

feature -- Access

	name_code: INTEGER
			-- Name code of this node - used in displaying names

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		local
			an_index: INTEGER
		do
			an_index := attribute_index (a_fingerprint)
			if an_index /= -1 then
				Result := attribute_values.item (an_index)
			end
		end
	
	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		local
			a_fingerprint: INTEGER
		do
			a_fingerprint := document.name_pool.fingerprint (a_uri, a_local_name)
			if a_fingerprint /= -1 then
				Result := attribute_value (a_fingerprint)
			end
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER) is
			-- Set `name_code'.
		do
			name_code := a_name_code
		end

feature -- Element change
	
	add_namespace (a_namespace_code: INTEGER) is
			-- Add a namespace definition.
		require
			valid_namespace_code: document.name_pool.is_valid_namespace_code (a_namespace_code)
		do
			if not namespace_code_list.extendible (1) then
				namespace_code_list.resize (2 * namespace_code_list.count)
			end
			namespace_code_list.put_last (a_namespace_code)
		ensure
			namespace_added: namespace_code_list.has (a_namespace_code)
		end

	add_attribute (a_name_code, a_type_code: INTEGER; a_value: STRING) is
			-- Add an attribute.
		require
			valid_name_code: document.name_pool.is_valid_name_code (a_name_code)
			value_not_void: a_value /= Void
		local
			new_size: INTEGER
		do
			if not attribute_name_codes.extendible (1) then
				new_size := 2* attribute_name_codes.count
				attribute_name_codes.resize (new_size)
				attribute_type_codes.resize (new_size)
				attribute_values.resize (new_size)
			end
			attribute_name_codes.put_last (a_name_code)
			attribute_type_codes.put_last (a_type_code)
			attribute_values.put_last (a_value)
		ensure
			attribute_name_code_added: attribute_name_codes.has (a_name_code)
			attribute_typee_code_added: attribute_type_codes.has (a_type_code)
			attribute_value_added: attribute_values.has (a_value)
		end

feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end

feature {XM_XPATH_TREE_ATTRIBUTE, XM_XPATH_TREE_ATTRIBUTE_ENUMERATION} -- Restricted

	is_attribute_index_valid (an_attribute_index: INTEGER): BOOLEAN is
		do
			Result := an_attribute_index > 0 and then an_attribute_index <= attribute_values.count
		end

	attribute_value_by_index (an_attribute_index: INTEGER): STRING is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_values.item (an_attribute_index)
		ensure
			attribute_value_not_void: Result /= Void
		end

	attribute_name_code (an_attribute_index: INTEGER): INTEGER is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_name_codes.item (an_attribute_index)
		end

	attribute_type_code (an_attribute_index: INTEGER): INTEGER is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_type_codes.item (an_attribute_index)
		end

feature {NONE} -- Implementation

	-- The next three lists are triples - i.e. item number n in all three lists forms a triple
	
	attribute_name_codes: DS_ARRAYED_LIST [INTEGER]
			-- Name codes of attributes

	attribute_type_codes: DS_ARRAYED_LIST [INTEGER]
			-- Type codes of attributes

	attribute_values: DS_ARRAYED_LIST [STRING]
			-- Values of attributes

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- Name codes for all namespaces defined on this element;
			-- (NOT all namespaces in scope - must scan up the parent chain for that)

	attribute_index (a_fingerprint: INTEGER): INTEGER is
			-- Index number of attribute with fingerprint `a_fingerprint'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			found: BOOLEAN
		do
			from
				a_cursor := attribute_name_codes.new_cursor
				a_cursor.start
			variant
				attribute_name_codes.count + 1 - a_cursor.index
			until
				found or else a_cursor.after
			loop
				if document.name_pool.fingerprint_from_name_code (a_cursor.item) = a_fingerprint then
					found := true
					Result := a_cursor.index
				end
				a_cursor.forth
			end
			if not found then Result := -1 end
		ensure
			nearly_positive_result: Result > -2
		end

invariant

	attribute_name_codes_not_void: attribute_name_codes /= Void
	attribute_type_codes_not_void: attribute_type_codes /= Void
	attribute_values_not_void: attribute_values /= Void
	namespace_list_not_void: namespace_code_list /= Void

end
	
