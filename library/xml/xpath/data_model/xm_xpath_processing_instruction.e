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

	XM_XPATH_LEAF_NODE

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

	string_value: STRING is
			-- String-value
		do
			create Result.make_from_string (content_property)
		end

	typed_value: DS_ARRAYED_LIST [XM_XPATH_ANY_ATOMIC_VALUE] is
			-- Typed value.
		do
			create Result.make (1)
			-- TODO: Result.put_first (create {XM_XPATH_ANY_ATOMIC_VALUE}.make_as_string (string_value))
		end

feature {NONE} -- Access

	target_property: STRING
			-- Target property from the infoset

	content_property: STRING
			-- Content property from the infoset

invariant

	target_not_void: target_property /= Void
	content_not_void: content_property /= Void
	
end -- class XM_XPATH_PROCESSING_INSTRUCTION
