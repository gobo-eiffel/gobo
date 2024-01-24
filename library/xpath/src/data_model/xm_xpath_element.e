note

	description:

		"XPath Element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2015, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_ELEMENT

inherit

	XM_XPATH_COMPOSITE_NODE
		redefine
			type_annotation, is_nilled, base_uri, is_element, as_element
		end

	UC_IMPORTED_UTF8_ROUTINES
		export {NONE} all end

	UT_URL_ENCODING
		export {NONE} all end

	XM_UNICODE_CHARACTERS_1_1

feature -- Access

	node_kind: STRING
			-- Identifies the kind of node
		do
			Result := "element"
		ensure then
			node_kind_is_element: STRING_.same_string (Result, "element")
		end

	is_element: BOOLEAN
			-- Is `Current' an element?
		do
			Result := True
		end

	as_element: XM_XPATH_ELEMENT
			-- `Current' seen as an element
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Type
		do
			Result := element_node_kind_test
		end

	base_uri: detachable STRING
			-- Base URI as per W3C XML:Base REC
		local
			l_uri: UT_URI
			l_xml_base: detachable STRING
			l_initial_system_id: detachable STRING
			l_parent: detachable XM_XPATH_COMPOSITE_NODE
			l_resolved: BOOLEAN
		do
			l_xml_base := attribute_value (Xml_base_type_code)
			if l_xml_base /= Void then
				Result := l_xml_base
			else
				l_initial_system_id := system_id
				l_parent := parent
				if l_parent = Void then
					Result := l_initial_system_id
					l_resolved := True
				elseif STRING_.same_string (l_parent.system_id, l_initial_system_id) then
					Result := l_parent.base_uri
					l_resolved := True
				else
					Result := l_initial_system_id
				end
			end
			check Result /= Void then
				if has_excluded_characters (Result) then
					Result := escape_custom (utf8.to_utf8 (Result), unescaped_uri_characters, False)
				end
			end
			if not l_resolved then
				l_parent := parent
				if l_parent /= Void then
					check attached l_parent.base_uri as l_parent_base_uri and Result /= Void then
						create l_uri.make (l_parent_base_uri)
						create l_uri.make_resolve (l_uri, Result)
						Result := l_uri.full_reference
					end
				elseif l_initial_system_id = Void then
					create l_uri.make (system_id)
					if l_uri.is_absolute then
						create l_uri.make_resolve (l_uri, Result)
						Result := l_uri.full_reference
					end
				end
			end
		end

	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): detachable STRING
			-- Value of named attribute
		require
			uri_not_void: a_uri /= Void
			local_name_not_void: a_local_name /= Void and then is_ncname (a_local_name)
		deferred
		end

	attribute_value (a_fingerprint: INTEGER): detachable STRING
			-- Value of attribute identified by `a_fingerprint'
		deferred
		end

	type_annotation: INTEGER
			--Type annotation of this node
		do
			Result := type_factory.untyped_type.fingerprint
		end

	uri_code_for_prefix (a_xml_prefix: STRING): INTEGER
			-- URI code for `a_xml_prefix'
		require
			prefix_not_void: a_xml_prefix /= Void
		local
			l_prefix_code: INTEGER
		do
			if STRING_.same_string (Xml_prefix, a_xml_prefix) then
				Result := Xml_uri_code
			else
				if shared_name_pool.is_code_for_prefix_allocated (a_xml_prefix) then
					l_prefix_code := shared_name_pool.code_for_prefix (a_xml_prefix)
				else
					l_prefix_code := -1
				end
				if l_prefix_code = -1 then
					Result := -1
				else
					Result := uri_code_for_prefix_code (l_prefix_code)
				end
			end
		ensure
			nearly_positive_result: Result > -2
		end

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER
			-- URI code for `a_prefix_code'
		deferred
		ensure
			nearly_positive_result: Result > -2
		end

	declared_namespaces: DS_ARRAYED_LIST [INTEGER]
			-- Codes for namespaces declared on `Current'
		deferred
		ensure
			declared_namespaces_not_void: Result /= Void
		end

	namespace_codes_in_scope: DS_ARRAYED_LIST [INTEGER]
			-- List of namespace codes in scope, including the XML namespace
		deferred
		ensure
			namespace_codes_in_scope_not_void: Result /= Void
			namespace_codes_in_scope_not_empty: not Result.is_empty
		end

	prefixes_in_scope: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_STRING_VALUE]
			-- Namespace prefixes in scope
		local
			l_namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_prefix_list: DS_ARRAYED_LIST [XM_XPATH_STRING_VALUE]
			l_xml_prefix: STRING
			l_string_value: XM_XPATH_STRING_VALUE
		do
			l_namespace_code_list := namespace_codes_in_scope
			create l_prefix_list.make (l_namespace_code_list.count)
			from
				l_cursor := l_namespace_code_list.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				l_xml_prefix := shared_name_pool.prefix_from_namespace_code (l_cursor.item)
				create l_string_value.make (l_xml_prefix)
				l_prefix_list.put_last (l_string_value)
				l_cursor.forth
			variant
				l_namespace_code_list.count + 1 - l_cursor.index
			end
			check
				not_empty: not l_prefix_list.is_empty
				-- because of XML namespace, or more formally, the postcondition of `namespace_codes_in_scope'
			end
			create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_STRING_VALUE]} Result.make (l_prefix_list)
		ensure
			iterator_not_void_nor_in_error: Result /= Void and then not Result.is_error
		end

	path: STRING
			-- XPath expression for location within document;
			-- Used for reporting purposes.
		local
			l_preceding_path: STRING
		do
			check attached node_name as l_node_name then
				if not attached parent as l_parent then
					Result := l_node_name
				else
					l_preceding_path := l_parent.path
					if STRING_.same_string (l_preceding_path, "/") then
						Result := STRING_.concat (l_preceding_path, l_node_name)
					else
						Result := STRING_.concat (l_preceding_path, "/")
						Result := STRING_.appended_string (Result, l_node_name)
						Result := STRING_.appended_string (Result, "[")
						Result := STRING_.appended_string (Result, simple_number)
						Result := STRING_.appended_string (Result, "]")
					end
				end
			end
		end

feature -- Status report

	is_nilled: BOOLEAN
			-- Is current node "nilled"? (i.e. xsi: nill="true")
		do
			Result := False
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER)
			-- Set `name_code'.
			-- Needed (indirectly, through `XM_XPATH_TINY_ELEMENT') by `XM_XSLT_STRIPPER'.
		require
			valid_name_code: a_name_code >= -1
		deferred
		end

feature -- Element change

		output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN)
			-- Output all namespace nodes associated with this element.
		require
			receiver_not_void: a_receiver /= Void
		deferred
		end

feature {NONE} -- Access

	unescaped_uri_characters: DS_HASH_SET [CHARACTER]
			-- Characters not to be escaped for fn:encode-for-uri()
		local
			l_character_set: STRING
		once
			l_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			l_character_set := STRING_.appended_string (l_character_set, Rfc_digit_characters)
			l_character_set := STRING_.appended_string (l_character_set, Rfc_mark_characters)
			l_character_set := STRING_.appended_string (l_character_set, "#")
			Result := new_character_set (l_character_set)
		end

invariant

		-- namespaces_have_unique_names: All namespace nodes must have distinct names.
	-- At most one has no name.
	-- parent_namespace_relationship: namespaces.for_all (agent (parent.is_equal (Current)))
	-- attributes_have_distinct_names: All attributes must have distinct QNames.
	-- parent_attribute_relationship: attributes.for_all (agent (parent.is_equal (Current)))

end
