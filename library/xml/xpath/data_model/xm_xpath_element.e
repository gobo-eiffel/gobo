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
			type_annotation, is_nilled, base_uri
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
