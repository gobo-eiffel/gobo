indexing

	description:

		"XPath Comment node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COMMENT

inherit

	XM_XPATH_NODE
	
	XM_XPATH_BASE_URI_FROM_PARENT

	XM_XPATH_NAMELESS_NODE
	
	XM_XPATH_PARENT
	
	XM_XPATH_NO_TYPE

	XM_XPATH_NO_ATTRIBUTES
	
	XM_XPATH_NO_CHILDREN
	
feature -- Access

	node_kind: STRING is
			-- Identifies the kind of node.
		do
			create Result.make_from_string ("comment")
		ensure
			node_kind_is_document: Result.is_equal ("comment")
		end

	string_value: UC_STRING is
			-- String-value.
		do
			create Result.make_from_string (content_property)
		end

	typed_value: DS_ARRAYED_LIST [ANY_ATOMIC] is
			-- Typed value.
		do
			create Result.make (1)
			Result.put_first (create {ANY_ATOMIC}.make_as_string (string_value))
		end

feature {NONE} -- Access
	

	content_property: STRING
			-- Content property from the infoset.
	
end -- class XM_XPATH_COMMENT
