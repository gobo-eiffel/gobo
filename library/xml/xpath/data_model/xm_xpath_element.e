indexing

	description:

		"XPath Element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ELEMENT

inherit

	XM_XPATH_COMPOSITE_NODE
		redefine
			type_annotation, is_nilled, base_uri, is_element, as_element
		end

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
			create {XM_XPATH_NODE_KIND_TEST} Result.make_element_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end			
		end

	base_uri: STRING is
			-- Base URI
		local
			an_xml_base, an_initial_system_id: STRING
			a_parent: XM_XPATH_COMPOSITE_NODE
		do
			an_xml_base := attribute_value (Xml_base_type_code)
			if an_xml_base /= Void then
				Result := an_xml_base
			else
				an_initial_system_id := system_id
				a_parent := parent
				if a_parent = Void then
					Result := an_initial_system_id
				elseif
					STRING_.same_string (a_parent.system_id, an_initial_system_id) then
					Result := a_parent.base_uri
				else
					Result := an_initial_system_id
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

	uri_code_for_prefix (an_xml_prefix: STRING): INTEGER is
			-- URI code for `an_xml_prefix'
		require
			prefix_not_void: an_xml_prefix /= Void
		local
			a_prefix_code: INTEGER
		do
			if STRING_.same_string (Xml_prefix, an_xml_prefix) then
				Result := Xml_uri_code
			elseif shared_name_pool.is_code_for_prefix_allocated (an_xml_prefix) then
				a_prefix_code := shared_name_pool.code_for_prefix (an_xml_prefix)
			else
				a_prefix_code := -1
			end
			if a_prefix_code = -1 then
				Result := -1
			else
				Result := uri_code_for_prefix_code (a_prefix_code)
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
			a_namespace_code_list: DS_ARRAYED_LIST [INTEGER]
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_prefix_list: DS_ARRAYED_LIST [XM_XPATH_STRING_VALUE]
			an_xml_prefix: STRING
			a_string_value: XM_XPATH_STRING_VALUE
		do
			a_namespace_code_list := namespace_codes_in_scope
			create a_prefix_list.make (a_namespace_code_list.count)
			from
				a_cursor := a_namespace_code_list.new_cursor; a_cursor.start
			variant
				a_namespace_code_list.count + 1 - a_cursor.index
			until
				a_cursor.after
			loop
				an_xml_prefix := shared_name_pool.prefix_from_namespace_code (a_cursor.item)
				create a_string_value.make (an_xml_prefix)
				a_prefix_list.put_last (a_string_value)
				a_cursor.forth
			end
			create {XM_XPATH_ARRAY_LIST_ITERATOR [XM_XPATH_STRING_VALUE]} Result.make (a_prefix_list)
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

invariant
	-- namespaces_have_unique_names: All namespace nodes must have distinct names.
	-- At most one has no name.
	-- parent_namespace_relationship: namespaces.for_all (agent (parent.is_equal (Current)))
	-- attributes_have_distinct_names: All attributes must have distinct QNames.
	-- parent_attribute_relationship: attributes.for_all (agent (parent.is_equal (Current)))

end
