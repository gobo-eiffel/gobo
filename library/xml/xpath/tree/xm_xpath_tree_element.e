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

	XM_XPATH_ERROR_TYPES

creation {XM_XSLT_STRIPPER}

	make_dummy

creation {XM_XPATH_NODE_FACTORY}

	make, make_in_error_state

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
			a_name_code: INTEGER; a_sequence_number: INTEGER; a_line_number: INTEGER; a_base_uri: STRING) is
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
			base_uri_not_void: a_base_uri /= Void
		do
			document := a_document
			parent_node := a_parent
			node_type := Element_node
			name_code := a_name_code
			create children.make (5)
			if an_attribute_collection = Void then
				create attribute_collection.make (document.name_pool)
			else
				attribute_collection := an_attribute_collection
			end
			if a_namespace_list /= Void then
				namespace_code_list := a_namespace_list
			else
				create namespace_code_list.make (5)
			end
			sequence_number_high_word := a_sequence_number
			-- TODO root.set_line_number (a_line_number, a_sequence_number)
			-- TODO root.set_system_id (a_base_uri, a_sequence_number)
		ensure
			name_code_set: name_code = a_name_code
		end

	make_dummy (a_name_pool: XM_XPATH_NAME_POOL) is
			-- Create a dummy element
		require
			name_pool_not_void: a_name_pool /= Void
		do
			node_type := Element_node
			name_code := -1
			create children.make (5)
			create attribute_collection.make (a_name_pool)
			create namespace_code_list.make (5)
			sequence_number_high_word := 50000
		end

	make_in_error_state (a_document: XM_XPATH_TREE_DOCUMENT; a_message: STRING) is
			-- Create an element in an error state (used for reporting errors by the node factory).
		require
			document_not_void: a_document /= Void
			message_not_void: a_message /= Void
		do
			document := a_document
			node_type := Element_node
			name_code := -1
			create children.make (0)
			create attribute_collection.make (document.name_pool)
			create namespace_code_list.make (0)
			sequence_number_high_word := 50000
			set_last_error_from_string (a_message, 0, Static_error)
		end

feature -- Access

	name_code: INTEGER
			-- Name code of this node - used in displaying names

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		do
			Result := attribute_collection.attribute_value (a_fingerprint)
		end
	
	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		do
			Result := attribute_collection.attribute_value_by_name (a_uri, a_local_name)
		end

	uri_code_for_prefix (an_xml_prefix: STRING): INTEGER is
			-- URI code for `an_xml_prefix'
		require
			prefix_not_void: an_xml_prefix /= Void
		local
			a_prefix_code: INTEGER
		do
			a_prefix_code := document.name_pool.code_for_prefix (an_xml_prefix)
			if a_prefix_code = -1 then
				Result := -1
			else
				Result := 	uri_code_for_prefix_code (a_prefix_code)
			end
		ensure
			nearly_positive_result: Result > -2
		end

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER is
			-- URI code for `a_prefix_code'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code: INTEGER
		do
			Result := -1 -- not found
			from
				a_cursor := namespace_code_list.new_cursor
				a_cursor.start
			variant
				namespace_code_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				a_namespace_code := a_cursor.item
				if prefix_code_from_namespace_code (a_namespace_code) = a_prefix_code then
					Result := uri_code_from_namespace_code (a_namespace_code)
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		ensure
			nearly_positive_result: Result > -2
		end
	
	namespace_codes_in_scope:  DS_ARRAYED_LIST [INTEGER] is
			-- Namespace codes in scope;
			-- WARNING - this routine is NOT pure - it is a memo function.
		local
			a_parent: XM_XPATH_TREE_ELEMENT
			a_parent_list: DS_ARRAYED_LIST [INTEGER]
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code, a_prefix_code: INTEGER
		do
			if cached_namespace_codes_in_scope /= Void then
				do_nothing
			else
				create cached_namespace_codes_in_scope.make_from_linear (namespace_code_list)
				a_parent ?= parent
				if a_parent /= Void then
					a_parent_list := a_parent.namespace_codes_in_scope
					create cached_prefix_code_list.make (cached_namespace_codes_in_scope.count + a_parent_list.count)
					from
						a_cursor := cached_namespace_codes_in_scope.new_cursor
						a_cursor.start
					variant
						cached_namespace_codes_in_scope.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						a_prefix_code := 	prefix_code_from_namespace_code (a_cursor.item)
						cached_prefix_code_list.put_last (a_prefix_code)
						a_cursor.forth
					end
					if not cached_namespace_codes_in_scope.extendible (a_parent_list.count) then
						cached_namespace_codes_in_scope.resize (cached_namespace_codes_in_scope.count + a_parent_list.count)
					end

					-- Add in all codes from the parent list, unless we already have a match for the prefix
					
					from
						a_cursor := a_parent_list.new_cursor
						a_cursor.start
					variant
						a_parent_list.count + 1 - a_cursor.index
					until
						a_cursor.after
					loop
						a_namespace_code := a_cursor.item
						a_prefix_code := 	prefix_code_from_namespace_code (a_namespace_code)
						if not cached_prefix_code_list.has (a_prefix_code) then
							cached_prefix_code_list.put_last (a_prefix_code)
							cached_namespace_codes_in_scope.put_last (a_namespace_code)
						end
						a_cursor.forth
					end
				else
					
					-- Add the XML namespace

					if not cached_namespace_codes_in_scope.extendible (1) then
						cached_namespace_codes_in_scope.resize (cached_namespace_codes_in_scope.count + 1)
					end
					check
						xml_prefix_code_is_one: document.name_pool.code_for_prefix ("xml") = 1
						-- Architectural definition
					end
					cached_namespace_codes_in_scope.put_last (Xml_uri_code + bits_16) -- bits_16 = 1 << 16
				end
			end
			Result := cached_namespace_codes_in_scope
		ensure
        result_not_void: Result /= Void
		end

feature -- Measurement

	number_of_attributes: INTEGER is
			-- Number of attributes in `Current'
		do
			Result := attribute_collection.number_of_attributes
		ensure
			positive_result: Result >= 0
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
		do
			attribute_collection.add_attribute (a_name_code, a_type_code, a_value)
		end

	set_attribute_collection (an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION) is
			-- Set all attributes.
		require
			attribute_collection_not_void: an_attribute_collection /= Void
		do
			attribute_collection := an_attribute_collection
		ensure
			attribute_collection_set: attribute_collection = an_attribute_collection
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
			Result := attribute_collection.is_attribute_index_valid (an_attribute_index)
		end

	attribute_value_by_index (an_attribute_index: INTEGER): STRING is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_collection.attribute_value_by_index (an_attribute_index)
		ensure
			attribute_value_not_void: Result /= Void
		end

	attribute_name_code (an_attribute_index: INTEGER): INTEGER is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_collection.attribute_name_code (an_attribute_index)
		end

	attribute_type_code (an_attribute_index: INTEGER): INTEGER is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_collection.attribute_type_code (an_attribute_index)
		end

feature {NONE} -- Implementation

	attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION
			-- Attributes

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes for all namespaces defined on this element;
			-- (NOT all namespaces in scope - must scan up the parent chain for that)

	cached_prefix_code_list: DS_ARRAYED_LIST [INTEGER]
			-- Prefix codes for all namespacesin scope for `Current'

	cached_namespace_codes_in_scope:  DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes in scope for `Current'

invariant

	namespace_list_not_void: namespace_code_list /= Void
	attribute_collection_not_void: attribute_collection /= Void

end
	
