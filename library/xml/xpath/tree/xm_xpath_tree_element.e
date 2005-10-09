indexing

	description:

		"Standard tree element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TREE_ELEMENT

inherit
	
	XM_XPATH_ELEMENT
		undefine
			document_element, next_sibling, previous_sibling, type_annotation, first_child, last_child, has_child_nodes, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_COMPOSITE_NODE
		undefine
			is_nilled, local_part, base_uri, is_element, as_element
		redefine
			name_code, system_id, line_number, is_tree_element, as_tree_element
		end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create {XM_XPATH_NODE_FACTORY}

	make, make_in_error_state

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: XM_XPATH_TREE_COMPOSITE_NODE; an_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  DS_ARRAYED_LIST [INTEGER];
			a_name_code: INTEGER; a_sequence_number: INTEGER) is
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do
			document := a_document
			parent_node := a_parent
			node_type := Element_node
			name_code := a_name_code
			create children.make (5)
			if an_attribute_collection = Void then
				create attribute_collection.make
			else
				attribute_collection := an_attribute_collection
			end
			if a_namespace_list /= Void then
				namespace_code_list := a_namespace_list
			else
				create namespace_code_list.make (5)
			end
			sequence_number_high_word := a_sequence_number
		ensure
			name_code_set: name_code = a_name_code
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
			create attribute_collection.make
			create namespace_code_list.make (0)
			sequence_number_high_word := 50000
			set_last_error_from_string (a_message, Xpath_errors_uri, "FOER0000", Static_error)
		end

feature -- Access

	is_tree_element: BOOLEAN is
			-- Is `Current' an element?
		do
			Result := True
		end

	as_tree_element: XM_XPATH_TREE_ELEMENT is
			-- `Current' seen as an element
		do
			Result := Current
		end

	system_id: STRING is
			-- SYSTEM id of `Current', or `Void' if not known
		do
			Result := document.system_id_for_node (sequence_number_high_word)
		end

	line_number: INTEGER is
			-- Line number of node in original source document, or -1 if not known
		do
			Result := document.line_number_for_node (sequence_number_high_word)
		end

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

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER is
			-- URI code for `a_prefix_code'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code: INTEGER
			a_composite: XM_XPATH_COMPOSITE_NODE 
		do
			Result := -1 -- not found
			if a_prefix_code = Xml_prefix_index - 1 then
				Result := Xml_uri_code
			else
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
			end
			
			-- If we have got so far, without finding `a_prefix_code',
			--  then we must look at the parent element
			
			if Result = -1 then
				a_composite := parent
				if a_composite = Void or else not a_composite.is_element then
					
					-- Document node
					
					if a_prefix_code = 0 then
						Result := Default_uri_code
					end
				else
					Result := a_composite.as_element.uri_code_for_prefix_code (a_prefix_code)
				end
			end
		end

	prefix_for_uri (a_uri: STRING): STRING is
			-- Prefix bound to `a_uri'
		require
			uri_exists: a_uri /= Void
		local
			a_uri_code: INTEGER
		do
			if STRING_.same_string (a_uri, Xml_uri) then
				Result := Xml_prefix
			else
				if not shared_name_pool.is_code_for_uri_allocated (a_uri) then
					shared_name_pool.allocate_code_for_uri (a_uri)
				end
				a_uri_code := shared_name_pool.code_for_uri (a_uri)
				if a_uri_code < 0 then
					Result := Void
				else
					Result := prefix_for_uri_code (a_uri_code)
				end
			end
		end

	prefix_for_uri_code (a_uri_code: INTEGER): STRING is
			-- Prefix bound to namespace indicated by `a_uri_code'
		require
			valid_uri_code: shared_name_pool.is_valid_uri_code (a_uri_code)
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				a_cursor := namespace_code_list.new_cursor; a_cursor.start
			until
				a_cursor.after
			loop
				if uri_code_from_namespace_code (a_cursor.item) = a_uri_code then
					Result := shared_name_pool.prefix_from_namespace_code (a_cursor.item)
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end
	
	declared_namespaces: DS_ARRAYED_LIST [INTEGER] is
			-- Codes for namespaces declared on `Current'
		do
			Result := namespace_code_list
		end

	accumulated_namespace_codes: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes in scope

	namespace_codes_in_scope: DS_ARRAYED_LIST [INTEGER] is
			-- Namespace codes in scope for `Current'
		local
			some_excluded_prefixes: DS_HASH_SET [INTEGER] -- _16
		do
			if accumulated_namespace_codes = Void then
				create some_excluded_prefixes.make_default
				create accumulated_namespace_codes.make_default
				accumulate_namespace_codes (Current, accumulated_namespace_codes, True, some_excluded_prefixes)
			end
			Result := accumulated_namespace_codes
		ensure then
			namespace_codes_accumulated: accumulated_namespace_codes /= Void
		end

	is_idrefs (an_attribute: INTEGER): BOOLEAN is
			-- Value of is-idrefs property for `an_attribute'
		require
			valid_attribute: an_attribute > 0 and then an_attribute <= number_of_attributes
		do
			Result := attribute_collection.is_idrefs (an_attribute)
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
	
	output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN) is
			-- Output all namespace nodes associated with this element.
		local
			a_parent: XM_XPATH_COMPOSITE_NODE
         a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			from
				a_cursor := namespace_code_list.new_cursor; a_cursor.start
			until
					a_cursor.after
			loop
				if a_cursor.item >= 0 then -- drop any excluded namespaces
					a_receiver.notify_namespace (a_cursor.item, 0)
				end
				a_cursor.forth
			end

			-- Now add the namespaces defined on the ancestor nodes.
			-- We rely on the receiver to eliminate multiple declarations of the same prefix.

			if include_ancestors then
				a_parent := parent
				if a_parent /= Void and then a_parent.is_element then
					a_parent.as_tree_node.as_tree_element.output_namespace_nodes (a_receiver, true)
				end
			end
		end

	add_namespace (a_namespace_code: INTEGER) is
			-- Add a namespace definition.
		require
			valid_namespace_code: shared_name_pool.is_valid_namespace_code (a_namespace_code)
			namespace_codes_not_accumulated: accumulated_namespace_codes = Void
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
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
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


feature -- Duplication
																																	
	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN) is
				-- Copy `Current' to `a_receiver'.
		local																													
			a_type_code, an_index, child_namespaces: INTEGER
			a_node: XM_XPATH_NODE																														
		do
			if copy_annotations then
				a_type_code := type_annotation
			end																													
			a_receiver.start_element (name_code, a_type_code, 0)

			-- output namespaces


			if which_namespaces /= No_namespaces then
				output_namespace_nodes (a_receiver, which_namespaces = All_namespaces)
			end

         -- output attributes																																	

			from
            an_index := 1
			until
            an_index > attribute_collection.number_of_attributes
			loop
            if copy_annotations then
				   a_type_code := type_annotation
				else
				   a_type_code := 0																																	
				end																																	
            a_receiver.notify_attribute (attribute_collection.attribute_name_code (an_index), a_type_code,attribute_collection.attribute_value_by_index (an_index), 0)
            an_index := an_index + 1																																	
			end

        	-- output children																																

			if which_namespaces /= No_namespaces then
            child_namespaces := Local_namespaces																																	
			else
            child_namespaces := No_namespaces
			end
			from
            a_node := first_child
			until
            a_node = Void
			loop
            a_node.copy_node (a_receiver, child_namespaces, copy_annotations)
            a_node := a_node.next_sibling
			end

         a_receiver.end_element																																	
		end
																																	
																																	
feature {XM_XPATH_NODE} -- Restricted

	is_possible_child: BOOLEAN is
			-- Can this node be a child of a document or element node?
		do
			Result := True
		end
feature {XM_XPATH_TREE_ELEMENT} -- Local

	accumulate_namespace_codes (an_owner: XM_XPATH_TREE_ELEMENT; an_accumulation_list: DS_ARRAYED_LIST [INTEGER]; add_xml: BOOLEAN; some_excluded_prefixes: DS_HASH_SET [INTEGER]) is
			-- Accumulate namespace codes in scope.
		require
			list_owner_not_void: an_owner /= Void
			accumulation_list: an_accumulation_list /= Void
			non_empty_accumulation_list: an_accumulation_list.count > 0 implies an_owner /= Current
		local
			a_code_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code: INTEGER
			a_prefix_code, a_uri_code: INTEGER -- _16
			a_parent: XM_XPATH_COMPOSITE_NODE
		do
			from
				a_code_cursor := namespace_code_list.new_cursor; a_code_cursor.start
			variant
				namespace_code_list.count + 1 - a_code_cursor.index
			until
				a_code_cursor.after
			loop
				a_namespace_code := a_code_cursor.item
				a_prefix_code := prefix_code_from_namespace_code (a_namespace_code)
				a_uri_code := uri_code_from_namespace_code (a_namespace_code)
				if a_uri_code = Default_uri_code then

					-- A namespace undeclaration

					some_excluded_prefixes.force (a_prefix_code)
				else
					if not some_excluded_prefixes.has (a_prefix_code) then
						some_excluded_prefixes.force_new (a_prefix_code)
						an_accumulation_list.force_last (a_namespace_code)
					end
				end
				a_code_cursor.forth
			end

			-- Now add the namespaces defined on the ancestor nodes.

			if parent.node_type /= Document_node then
				a_parent := parent
				check
					parent_is_element: a_parent /= Void
				end
				a_parent.as_tree_node.as_tree_element.accumulate_namespace_codes (an_owner, an_accumulation_list, False, some_excluded_prefixes)
			end

			if add_xml then
				a_namespace_code := created_namespace_code (Xml_uri_code, Xml_prefix_index - 1)
				an_accumulation_list.force_last (a_namespace_code)
			end
		end
	
feature {XM_XPATH_TREE_ATTRIBUTE, XM_XPATH_TREE_ATTRIBUTE_ENUMERATION, XM_XPATH_TREE_DOCUMENT} -- Restricted

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

	is_id (an_attribute_index: INTEGER): BOOLEAN is
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attribute_collection.is_id (an_attribute_index)
		end

feature {NONE} -- Implementation

	attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION
			-- Attributes

	namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes for all namespaces defined on this element;
			-- (NOT all namespaces in scope - must scan up the parent chain for that)

invariant

	namespace_list_not_void: namespace_code_list /= Void
	attribute_collection_not_void: attribute_collection /= Void

end
	
