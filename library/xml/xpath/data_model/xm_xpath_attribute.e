indexing

	description:

		"XPath Attribute node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ATTRIBUTE

inherit

	XM_XPATH_NODE
	
	XM_XPATH_BASE_URI_FROM_PARENT

	XM_XPATH_NAMED_NODE

	XM_XPATH_PARENT
	
	XM_XPATH_NO_ATTRIBUTES
	
	XM_XPATH_NO_CHILDREN
	
feature -- Access

	node_kind: STRING is
			-- Identifies the kind of node.
		do
			create Result.make_from_string ("attribute")
		ensure
			node_kind_is_document: Result.is_equal ("attribute")
		end

	string_value: UC_STRING is
			-- String-value.
		do
			-- TODO
		end

	typed_value: DS_ARRAYED_LIST [ANY_ATOMIC] is
			-- Typed value.
		deferred
			-- TODO
		ensure
			typed_value_not_void: Result /= Void
		end

	type: DS_ARRAYED_LIST [XM_EXPANDED_QNAME] is
			-- Type.
		do
			create Result.make (1)
			-- TODO
		ensure then
			type: not Result.is_empty
		end

feature {NONE} -- Access
	
	attribute_type_property: STRING
			-- Attribute-type property from the infoset.
			
end
