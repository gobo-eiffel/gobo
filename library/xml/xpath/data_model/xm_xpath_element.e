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

	XM_XPATH_NODE_WITH_BASE_URI_OR_FROM_PARENT

	XM_XPATH_NAMED_NODE

	XM_XPATH_CHILD_NODE
	
	XM_XPATH_TYPED_NODE

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Identifies the kind of node
		do
			Result := "element"
		ensure then
			node_kind_is_element: STRING_.same_string (Result, "element")
		end

	string_value: STRING is
			-- String-value
		do
			-- Return the concatentation of the string value of all it's
			-- text-node descendants.
			-- Actually, more complicated than the above description.
			-- TODO
		end

	typed_value: DS_ARRAYED_LIST [XM_XPATH_ANY_ATOMIC_VALUE] is
			-- Typed value
		do
			-- TODO
		end

feature -- Status report

	is_nilled: BOOLEAN is
			-- Is current node "nilled"? (i.e. xsi: nill="true")
		do
			Result := nilled_property
		end	

feature {NONE} -- Access

	nilled_property: BOOLEAN
			-- Nilled property from the infoset

invariant

	-- namespaces_have_unique_names: All namespace nodes must have distinct names.
	-- At most one has no name.
	-- parent_namespace_relationship: namespaces.for_all (agent (parent.is_equal (Current)))
	-- attributes_have_distinct_names: All attributes must have distinct QNames.
	-- parent_attribute_relationship: attributes.for_all (agent (parent.is_equal (Current)))

end
