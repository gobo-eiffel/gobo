indexing

	description:

		"XPath Attribute nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ATTRIBUTE

inherit

	XM_XPATH_BASE_URI_FROM_PARENT

	XM_XPATH_NAMED_NODE

	XM_XPATH_CHILD_NODE

	XM_XPATH_NODE_WITHOUT_ATTRIBUTES

	XM_XPATH_LEAF_NODE

	KL_IMPORTED_STRING_ROUTINES

feature -- Access

	node_kind: STRING is
			-- Kind of node
		do
			create Result.make_from_string ("attribute")
		ensure then
			node_kind_is_attribute: STRING_.same_string ( Result, "attribute")
		end

	string_value: STRING is
			-- String-value
		do
			-- TODO
		end

	typed_value: DS_ARRAYED_LIST [XM_XPATH_ANY_ATOMIC_VALUE] is
			-- Typed value
		do
			-- TODO
		end

	type: XM_EXPANDED_QNAME is
			-- Type
		do
			-- TODO
		ensure then
			type_not_void: Result /= Void
		end

feature {NONE} -- Access

	attribute_type_property: STRING
			-- Attribute-type property from the infoset

invariant

	type_not_void: attribute_type_property /= Void
			-- TODO: Is this necessarily true?
	
end -- class XM_XPATH_ATTRIBUTE
