indexing

	description:

		"XPath Namespace node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NAMESPACE

inherit

	XM_XPATH_NODE
	
	XM_XPATH_PARENT
	
	XM_XPATH_NO_TYPE

	XM_XPATH_NO_ATTRIBUTES
	
	XM_XPATH_NO_CHILDREN
	
feature -- Access

	base_uri: DS_ARRAYED_LIST [ANY_URI] is
			-- Base URI.
		do
create Result.make (0)
		ensure
			empty_uri: Result.is_empty
		end

	node_kind: STRING is
			-- Identifies the kind of node.
		do
			create Result.make_from_string ("namespace")
		ensure
			node_kind_is_document: Result.is_equal ("namespace")
		end

	node_name: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Qualified name.
		local
			XM_EXPANDED_QNAME: qname
		do
			create Result.make (1)
			create qname.make (Void, prefix_property)
			Result.put_first (qname)
		ensure
			node_name_not_empty: Result.count = 1 
		end

	string_value: UC_STRING is
			-- String-value.
		do
			create Result.make_from_string (uri_property)
		end

	typed_value: DS_ARRAYED_LIST [ANY_ATOMIC] is
			-- Typed value.
		do
			create Result.make (1)
			Result.put_first (create {ANY_ATOMIC}.make_untyped (string_value))
		end

feature {NONE} -- Access
	
	prefix_property: STRING
			-- Prefix property from the infoset.

	uri_property: STRING
			-- Namespace name property from the infoset.
	
end
