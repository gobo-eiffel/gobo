indexing

	description:

		"XPath Namespace nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NAMESPACE

inherit

	XM_XPATH_TYPELESS_NODE

	XM_XPATH_CHILD_NODE

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	base_uri: STRING is
			-- Base URI
		do
			Result := Void
		ensure then
			base_uri_is_void: Result = Void
		end

	node_kind: STRING is
			-- Kind of node
		do
			Result := "namespace"
		ensure then
			node_kind_is_namespace: STRING_.same_string (Result, "namespace")
		end

	node_name: XM_EXPANDED_QNAME is
			-- Qualified name
		do
			-- TODO: create Result.make (Void, prefix_property)
		ensure then
			node_name_not_void: Result /= Void
		end

	string_value: STRING is
			-- String-value
		do
			Result := clone (uri_property)
		end

--	typed_value: DS_ARRAYED_LIST [XM_XPATH_ANY_ATOMIC_VALUE] is
			-- Typed value
--		do
--			create Result.make (1)
			-- TODO: Result.put_first (create {XM_XPATH_ANY_ATOMIC_VALUE}.make_untyped (string_value))
--		end

feature {NONE} -- Access

	prefix_property: STRING
			-- Prefix property from the infoset.

	uri_property: STRING
			-- Namespace name property from the infoset.

invariant

	uri_not_void: uri_property /= Void
	
end
