indexing

	description:

		"XPath Processing-instruction nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_PROCESSING_INSTRUCTION

inherit

	XM_XPATH_TYPELESS_NODE

	XM_XPATH_NODE_WITH_BASE_URI_OR_FROM_PARENT

	XM_XPATH_CHILD_NODE

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			Result := "processing-instruction"
		ensure then
			node_kind_is_processing_instruction: STRING_.same_string (Result, "processing-instruction")
		end

	node_name: XM_EXPANDED_QNAME is
			-- Qualified name
		do
			-- TODO: create Result.make (Void, target_property)
		ensure then
			node_name_not_void: Result /= Void
		end

	string_value: UC_UTF8_STRING is
			-- String-value
		do
			Result := clone (content_property)
		end

feature {NONE} -- Access

	target_property: UC_UTF8_STRING
			-- Target property from the infoset

	content_property: UC_UTF8_STRING
			-- Content property from the infoset

invariant
	target_not_void: target_property /= Void
	content_not_void: content_property /= Void
	
end
