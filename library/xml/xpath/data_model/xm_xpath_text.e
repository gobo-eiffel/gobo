indexing

	description:

		"XPath Text nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TEXT

inherit

	XM_XPATH_BASE_URI_FROM_PARENT

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	XM_XPATH_TYPE
	
	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			Result := "text"
		ensure then
			node_kind_is_text: STRING_.same_string (Result, "text")
		end

	item_type: INTEGER is
			-- Type
		do
			Result := Text_node
		end

invariant

	type: item_type = Text_node
	
end
