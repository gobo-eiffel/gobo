indexing

	description:

		"XPath Element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

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

	node_kind: STRING is
			-- Identifies the kind of node
		do
			Result := "element"
		ensure then
			node_kind_is_element: STRING_.same_string (Result, "element")
		end

	is_element: BOOLEAN is
			-- Is `Current' an element?
		do
			Result := True
		end

	as_element: XM_XPATH_ELEMENT is
			-- `Current' seen as an element
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			-- Type
		do
			Result := element_node_kind_test
		end

	base_uri: STRING is
			-- Base URI as per XML:Base recommendation
		local
			l_uri: UT_URI
			l_xml_base, l_initial_system_id: STRING
			l_parent: XM_XPATH_COMPOSITE_NODE
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
			if has_excluded_characters (Result) then
				Result := escape_custom (utf8.to_utf8 (Result), unescaped_uri_characters, False)
			end
			if not l_resolved then
				l_parent := parent
				if l_parent /= Void then
					create l_uri.make (l_parent.base_uri)
					create l_uri.make_resolve (l_uri, Result)
					Result := l_uri.full_reference
				elseif l_initial_system_id = Void then
					create l_uri.make (system_id)
					if l_uri.is_absolute then
						create l_uri.make_resolve (l_uri, Result)
						Result := l_uri.full_reference
					end
				end
			end
		end

	attribute_value_by_name (a_uri: STRING; a_local_name:STRING): STRING is
			-- Value of named attribute
		require
			uri_not_void: a_uri /= Void
			local_name_not_void: a_local_name /= Void and then is_ncname (a_local_name)
		deferred
		end

	attribute_value (a_fingerprint: INTEGER): STRING is
			-- Value of attribute identified by `a_fingerprint'
		deferred
		end

	type_annotation: INTEGER is
			--Type annotation of this node
		do
			Result := type_factory.untyped_type.fingerprint
		end

	uri_code_for_prefix (a_xml_prefix: STRING): INTEGER is
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

	uri_code_for_prefix_code (a_prefix_code: INTEGER): INTEGER is
			-- URI code for `a_prefix_code'
		deferred
		ensure
			nearly_positive_result: Result > -2
		end

	declared_namespaces: DS_ARRAYED_LIST [INTEGER] is
			-- Codes for namespaces declared on `Current'
		deferred
		ensure
			declared_namespaces_not_void: Result /= Void
		end

	namespace_codes_in_scope: DS_ARRAYED_LIST [INTEGER] is
			-- List of namespace codes in scope
		deferred
		ensure
			namespace_codes_in_scope_not_void: Result /= Void
		end

	prefixes_in_scope: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_STRING_VALUE] is
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
			variant
				l_namespace_code_list.count + 1 - l_cursor.index
			until
				l_cursor.after
			loop
				l_xml_prefix := shared_name_pool.prefix_from_namespace_code (l_cursor.item)
				create l_string_value.make (l_xml_prefix)
				l_prefix_list.put_last (l_string_value)
				l_cursor.forth
			end
			create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_STRING_VALUE]} Result.make (l_prefix_list)
		ensure
			iterator_not_void_nor_in_error: Result /= Void and then not Result.is_error
		end

feature -- Status report

	is_nilled: BOOLEAN is
			-- Is current node "nilled"? (i.e. xsi: nill="true")
		do
			Result := nilled_property
		end

feature -- Status setting

	set_name_code (a_name_code: INTEGER) is
			-- Set `name_code'.
			-- Needed (indirectly, through `XM_XPATH_TINY_ELEMENT') by `XM_XSLT_STRIPPER'.
		require
			valid_name_code: a_name_code >= -1
		deferred
		end

feature -- Element change

		output_namespace_nodes (a_receiver: XM_XPATH_RECEIVER; include_ancestors: BOOLEAN) is
			-- Output all namespace nodes associated with this element.
		require
			receiver_not_void: a_receiver /= Void
		deferred
		end

feature {NONE} -- Access

	-- TODO - scrap this

	nilled_property: BOOLEAN
			-- Nilled property from the infoset

	unescaped_uri_characters: DS_HASH_SET [CHARACTER] is
			-- Characters not to be escaped for fn:encode-for-uri()
		local
			a_character_set: STRING
		once
			a_character_set := STRING_.concat (Rfc_lowalpha_characters, Rfc_upalpha_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_digit_characters)
			a_character_set := STRING_.appended_string (a_character_set, Rfc_mark_characters)
			a_character_set := STRING_.appended_string (a_character_set, "#")
			Result := new_character_set (a_character_set)
		end

invariant
	-- namespaces_have_unique_names: All namespace nodes must have distinct names.
	-- At most one has no name.
	-- parent_namespace_relationship: namespaces.for_all (agent (parent.is_equal (Current)))
	-- attributes_have_distinct_names: All attributes must have distinct QNames.
	-- parent_attribute_relationship: attributes.for_all (agent (parent.is_equal (Current)))

end
