indexing

	description:

		"XPath Element node"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ELEMENT

inherit

	XM_XPATH_CHILD_BEARING_NODE

	XM_XPATH_BASE_URI_OR_FROM_PARENT

	XM_XPATH_NAMED_NODE

	XM_XPATH_PARENT
	
	XM_XPATH_TYPE
	
feature -- Access

	node_kind: STRING is
			-- Identifies the kind of node.
		do
			create Result.make_from_string ("element")
		ensure
			node_kind_is_document: Result.is_equal ("element")
		end

	string_value: UC_STRING is
			-- String-value.
		do
			-- Return the concatentation of the string value of all it's 
			-- text-node descendants.
			-- Actually, more complicated than this.
			-- TODO
		end

	typed_value: DS_ARRAYED_LIST [ANY_ATOMIC] is
			-- Typed value.
		deferred
			-- TODO
		ensure
			typed_value_not_void: Result /= Void
		end

feature -- Status report

	is_nilled: DL_ARRAYED_LIST [BOOLEAN]
			-- True if "nilled".
			-- Change to a three-valued logic result?
		do
			create Result.make (1)
			Result.put_first (nilled_property)
		ensure
			known_nilled: not Result.is_empty
		end	

feature {NONE} -- Access

	nilled_property: BOOLEAN
			-- Nilled property from the infoset

invariant

	namespaces_have_unique_names: -- All namespace nodes must have distinct names.
			-- At most one has no name.
	parent_namespace_relationship: -- namespaces.for_all (agent (parent.is_equal (Current)))
	attributes_have_distinct_names: -- All attributes must have distinct QNames.
	parent_attribute_relationship: -- attributes.for_all (agent (parent.is_equal (Current)))
	
end -- class XM_XPATH_ELEMENT
