indexing

	description:

		"XPath Comment nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COMMENT

inherit

	XM_XPATH_BASE_URI_FROM_PARENT
	
	XM_XPATH_TYPELESS_NODE

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			Result := "comment"
		ensure then
			node_kind_is_comment: STRING_.same_string ( Result, "comment")
		end

	item_type: INTEGER is
			-- Type
		do
			Result := Comment_node
		end
	
	string_value: STRING is
			-- String-value
		do
			Result := clone (content_property)
		end

feature {NONE} -- Access

	-- TODO scrap this

	content_property: STRING
			-- Content property from the infoset
end
