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

	item_type: INTEGER is
			-- Type
		do
			Result := Namespace_node
		end

	string_value: STRING is
			-- String-value
		do
			-- TODO - change this
			Result := clone (uri_property)
		end

--	typed_value: DS_ARRAYED_LIST [??] is
			-- Typed value
--		do
--			create Result.make (1)
			-- TODO: Result.put_first (create {???}.make_untyped (string_value))
--		end

feature {NONE} -- Access

	-- TODO scrap these

	prefix_property: STRING
			-- Prefix property from the infoset.

	uri_property: STRING
			-- Namespace name property from the infoset.

invariant

	uri_not_void: uri_property /= Void
	
end
