﻿note

	description:

		"Standard tree element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TREE_ELEMENT

inherit

	XM_XPATH_ELEMENT
		undefine
			document_element, next_sibling, previous_sibling, first_child, last_child, has_child_nodes, is_tree_node, as_tree_node
		end

	XM_XPATH_TREE_COMPOSITE_NODE
		undefine
			is_nilled, local_part, base_uri, is_element, as_element, type_annotation
		redefine
			name_code, system_id, line_number, is_tree_element, as_tree_element
		end

	XM_XPATH_ERROR_TYPES
		export {NONE} all end

create {XM_XPATH_NODE_FACTORY}

	make, make_in_error_state

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TREE_DOCUMENT;  a_parent: detachable XM_XPATH_TREE_COMPOSITE_NODE;
		an_attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION; a_namespace_list:  detachable DS_ARRAYED_LIST [INTEGER];
		a_name_code: INTEGER; a_sequence_number: INTEGER)
			-- Establish invariant.
		require
			document_not_void: a_document /= Void
			strictly_positive_sequence_number: a_sequence_number > 0
		do
			document := a_document
			parent_node := a_parent
			node_type := Element_node
			name_code := a_name_code
			attribute_collection := an_attribute_collection
			if a_namespace_list /= Void then
				namespace_code_list := a_namespace_list
			end
			create children.make (8)
			sequence_number_high_word := a_sequence_number
		ensure
			name_code_set: name_code = a_name_code
		end

	make_in_error_state (a_document: XM_XPATH_TREE_DOCUMENT; a_message: STRING)
			-- Create an element in an error state (used for reporting errors by the node factory).
		require
			document_not_void: a_document /= Void
			message_not_void: a_message /= Void
		do
			document := a_document
			node_type := Element_node
			name_code := -1
			create children.make (0)
			sequence_number_high_word := 50000
			set_last_error_from_string (a_message, Xpath_errors_uri, "FOER0000", Static_error)
		end

feature -- Access

	attribute_collection: detachable XM_XPATH_ATTRIBUTE_COLLECTION
			-- Attributes

	is_tree_element: BOOLEAN
			-- Is `Current' an element?
		do
			Result := True
		end

	as_tree_element: XM_XPATH_TREE_ELEMENT
			-- `Current' seen as an element
		do
			Result := Current
		end

	system_id: STRING
			-- SYSTEM id of `Current', or `Void' if not known
		do
			Result := document.system_id_for_node (sequence_number_high_word)
		end

	line_number: INTEGER
			-- Line number of node in original source document, or -1 if not known
		do
			Result := document.line_number_for_node (sequence_number_high_word)
		end

	closing_line_number: INTEGER
			-- Line number of element end tag (or 0 if not known)
		do
			Result := document.closing_line_number_for_node (sequence_number_high_word)
		end

	name_code: INTEGER
			-- Name code of this node - used in displaying names


	attribute_value (a_fingerprint: INTEGER): detachable STRING
			-- Value of attribute identified by `a_fingerprint'
		do
			if attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.attribute_value (a_fingerprint)
			end
		end

	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): detachable STRING
			-- Value of named attribute
		do
			if attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.attribute_value_by_name (a_uri, a_local_name)
			end
		end

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER
			-- URI code for `a_prefix_code'
		local
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_namespace_code: INTEGER
			a_composite: detachable XM_XPATH_COMPOSITE_NODE
		do
			Result := -1 -- not found
			if a_prefix_code = Xml_prefix_index - 1 then
				Result := Xml_uri_code
			elseif attached namespace_code_list as l_namespace_code_list then
				from
					a_cursor := l_namespace_code_list.new_cursor
					a_cursor.start
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
				variant
					l_namespace_code_list.count + 1 - a_cursor.index
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

	prefix_for_uri (a_uri: STRING): detachable STRING
			-- Prefix bound to `a_uri'
		require
			uri_not_void: a_uri /= Void
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

	prefix_for_uri_code (a_uri_code: INTEGER): detachable STRING
			-- Prefix bound to namespace indicated by `a_uri_code'
		require
			valid_uri_code: shared_name_pool.is_valid_uri_code (a_uri_code)
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if attached namespace_code_list as l_namespace_code_list then
				from
					l_cursor := l_namespace_code_list.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					if uri_code_from_namespace_code (l_cursor.item) = a_uri_code then
						Result := shared_name_pool.prefix_from_namespace_code (l_cursor.item)
						l_cursor.go_after
					else
						l_cursor.forth
					end
				end
			end
		end

	declared_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Codes for namespaces declared on `Current'
		do
			check attached namespace_code_list as l_namespace_code_list then
				Result := l_namespace_code_list
			end
		end

	accumulated_namespace_codes: detachable DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes in scope

	namespace_codes_in_scope: DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes in scope for `Current'
		local
			some_excluded_prefixes: DS_HASH_SET [INTEGER] -- _16
			l_accumulated_namespace_codes: like accumulated_namespace_codes
		do
			l_accumulated_namespace_codes := accumulated_namespace_codes
			if l_accumulated_namespace_codes = Void then
				create some_excluded_prefixes.make_default
				create l_accumulated_namespace_codes.make_default
				accumulated_namespace_codes := l_accumulated_namespace_codes
				accumulate_namespace_codes (Current, l_accumulated_namespace_codes, True, some_excluded_prefixes)
			end
			Result := l_accumulated_namespace_codes
		ensure then
			namespace_codes_accumulated: accumulated_namespace_codes /= Void
		end

	is_idrefs (an_attribute: INTEGER): BOOLEAN
			-- Value of is-idrefs property for `an_attribute'
		require
			attribute_collection_not_void: attribute_collection /= Void
			valid_attribute: an_attribute > 0 and then an_attribute <= number_of_attributes
		do
			check precondition_attribute_collection_not_void: attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.is_idrefs (an_attribute)
			end
		end

feature -- Measurement

	number_of_attributes: INTEGER
			-- Number of attributes in `Current'
		do
			if attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.number_of_attributes
			end
		ensure
			positive_result: Result >= 0
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER)
			-- Set `name_code'.
		do
			name_code := a_name_code
		end

feature -- Element change

	output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN)
			-- Output all namespace nodes associated with this element.
		local
			l_parent: detachable XM_XPATH_COMPOSITE_NODE
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
		do
			if attached namespace_code_list as l_namespace_code_list then
				from
					l_cursor := l_namespace_code_list.new_cursor
					l_cursor.start
				until
					l_cursor.after
				loop
					if l_cursor.item >= 0 then -- drop any excluded namespaces
						a_receiver.notify_namespace (l_cursor.item, 0)
					end
					l_cursor.forth
				end

				-- Now add the namespaces defined on the ancestor nodes.
				-- We rely on the receiver to eliminate multiple declarations of the same prefix.
			end
			if include_ancestors then
				l_parent := parent
				if l_parent /= Void and then l_parent.is_element then
					l_parent.as_tree_node.as_tree_element.output_namespace_nodes (a_receiver, true)
				end
			end
		end

	add_namespace (a_namespace_code: INTEGER)
			-- Add a namespace definition.
		require
			valid_namespace_code: shared_name_pool.is_valid_namespace_code (a_namespace_code)
			namespace_codes_not_accumulated: accumulated_namespace_codes = Void
		local
			l_namespace_code_list: like namespace_code_list
		do
			l_namespace_code_list := namespace_code_list
			if l_namespace_code_list = Void then
				create l_namespace_code_list.make (5)
				namespace_code_list := l_namespace_code_list
			end
			if not l_namespace_code_list.extendible (1) then
				l_namespace_code_list.resize (2 * l_namespace_code_list.count)
			end
			l_namespace_code_list.put_last (a_namespace_code)
		ensure
			namespace_added: attached namespace_code_list as l_namespace_code_list_2 and then l_namespace_code_list_2.has (a_namespace_code)
		end

	add_attribute (a_name_code, a_type_code: INTEGER; a_value: STRING; a_properties: INTEGER)
			-- Add an attribute.
		require
			valid_name_code: shared_name_pool.is_valid_name_code (a_name_code)
			value_not_void: a_value /= Void
		local
			l_attribute_collection: like attribute_collection
		do
			l_attribute_collection := attribute_collection
			if l_attribute_collection = Void then
				create l_attribute_collection.make
				attribute_collection := l_attribute_collection
			end
			l_attribute_collection.add_attribute (a_name_code, a_type_code, a_value, a_properties)
		end

	set_attribute_collection (a_attribute_collection: XM_XPATH_ATTRIBUTE_COLLECTION)
			-- Set all attributes.
		require
			attribute_collection_not_void: a_attribute_collection /= Void
		do
			attribute_collection := a_attribute_collection
		ensure
			attribute_collection_set: attribute_collection = a_attribute_collection
			attribute_collection_not_void: attribute_collection /= Void
		end


feature -- Duplication

	copy_node (a_receiver: XM_XPATH_RECEIVER; which_namespaces: INTEGER; copy_annotations: BOOLEAN)
				-- Copy `Current' to `a_receiver'.
		local
			a_type_code, an_index, child_namespaces: INTEGER
			a_node: detachable XM_XPATH_NODE
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

			if attached attribute_collection as l_attribute_collection then
				from
					an_index := 1
				until
					an_index > l_attribute_collection.number_of_attributes
				loop
					if copy_annotations then
						a_type_code := type_annotation
					else
						a_type_code := 0
					end
					a_receiver.notify_attribute (l_attribute_collection.attribute_name_code (an_index), a_type_code, l_attribute_collection.attribute_value_by_index (an_index), 0)
					an_index := an_index + 1
				end
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

feature {XM_XPATH_TREE_ELEMENT} -- Local

	accumulate_namespace_codes (an_owner: XM_XPATH_TREE_ELEMENT; an_accumulation_list: DS_ARRAYED_LIST [INTEGER]; add_xml: BOOLEAN; some_excluded_prefixes: DS_HASH_SET [INTEGER])
			-- Accumulate namespace codes in scope.
		require
			list_owner_not_void: an_owner /= Void
			accumulation_list: an_accumulation_list /= Void
			non_empty_accumulation_list: an_accumulation_list.count > 0 implies an_owner /= Current
		local
			l_code_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_namespace_code: INTEGER
			l_prefix_code, l_uri_code: INTEGER -- _16
			l_parent: detachable XM_XPATH_COMPOSITE_NODE
		do
			if attached namespace_code_list as l_namespace_code_list then
				from
					l_code_cursor := l_namespace_code_list.new_cursor
					l_code_cursor.start
				until
					l_code_cursor.after
				loop
					l_namespace_code := l_code_cursor.item
					l_prefix_code := prefix_code_from_namespace_code (l_namespace_code)
					l_uri_code := uri_code_from_namespace_code (l_namespace_code)
					if l_uri_code = Default_uri_code then

						-- A namespace undeclaration

					some_excluded_prefixes.force (l_prefix_code)
					else
						if not some_excluded_prefixes.has (l_prefix_code) then
							some_excluded_prefixes.force_new (l_prefix_code)
							an_accumulation_list.force_last (l_namespace_code)
						end
					end
					l_code_cursor.forth
				variant
					l_namespace_code_list.count + 1 - l_code_cursor.index
				end
			end

			-- Now add the namespaces defined on the ancestor nodes.

			l_parent := parent
			check
					parent_is_element: l_parent /= Void
			then
				if l_parent.node_type /= Document_node then
					l_parent.as_tree_node.as_tree_element.accumulate_namespace_codes (an_owner, an_accumulation_list, False, some_excluded_prefixes)
				end
			end

			if add_xml then
				l_namespace_code := created_namespace_code (Xml_uri_code, Xml_prefix_index - 1)
				an_accumulation_list.force_last (l_namespace_code)
			end
		end

feature {XM_XPATH_TREE_ATTRIBUTE, XM_XPATH_TREE_ATTRIBUTE_ENUMERATION, XM_XPATH_TREE_DOCUMENT} -- Restricted

	is_attribute_index_valid (an_attribute_index: INTEGER): BOOLEAN
		do
			if attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.is_attribute_index_valid (an_attribute_index)
			end
		end

	attribute_value_by_index (an_attribute_index: INTEGER): STRING
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			check precondition_is_attribute_index_valid: attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.attribute_value_by_index (an_attribute_index)
			end
		ensure
			attribute_value_not_void: Result /= Void
		end

	attribute_name_code (an_attribute_index: INTEGER): INTEGER
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			check precondition_is_attribute_index_valid: attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.attribute_name_code (an_attribute_index)
			end
		end

	attribute_type_code (an_attribute_index: INTEGER): INTEGER
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			check precondition_is_attribute_index_valid: attached attribute_collection as l_attribute_collection then
				Result := l_attribute_collection.attribute_type_code (an_attribute_index)
			end
		end

	is_id (an_attribute_index: INTEGER): BOOLEAN
		require
			valid_attribute_index: is_attribute_index_valid (an_attribute_index)
		do
			Result := attached attribute_collection as l_attribute_collection and then l_attribute_collection.is_id (an_attribute_index)
		end

feature {NONE} -- Implementation

	namespace_code_list: detachable DS_ARRAYED_LIST [INTEGER]
			-- Namespace codes for all namespaces defined on this element;
			-- (NOT all namespaces in scope - must scan up the parent chain for that)

end

