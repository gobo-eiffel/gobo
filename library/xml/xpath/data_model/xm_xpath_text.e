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

	XM_XPATH_NAMELESS_NODE
	
	XM_XPATH_CHILD_NODE

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

	type: INTEGER is
			-- Type
		do
			Result := Untyped_atomic_type
		end

	string_value: STRING is
			-- String-value
		do
			Result := clone (content_property)
		end

feature {NONE} -- Access

	content_property: STRING
			-- Content property from the infoset

invariant
	type: type = Text_node
	content_not_void: content_property /= Void
	
end
