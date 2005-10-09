indexing

	description:

		"Objects that represent the XPath NodeTest production"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_NODE_TEST

inherit

	XM_XPATH_ITEM_TYPE
		redefine
			is_node_test, as_node_test
		end

	XM_XPATH_TYPE

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_SHARED_ANY_NODE_TEST
		export {NONE} all end

	XM_XPATH_SHARED_ANY_TYPE
	
feature -- Access

	is_node_test: BOOLEAN is
			-- Is `Current' a node test?
		do
			Result := True
		end

	as_node_test: XM_XPATH_NODE_TEST is
			-- `Current' seen as a node test
		do
			Result := Current
		end

	fingerprint: INTEGER is
			-- Determine the name fingerprint of nodes to which this pattern applies
		do
			Result := -1 -- Means can match multiple fingerprints
		end

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		local
			a_node: XM_XPATH_NODE
		do
			if an_item.is_node then
				a_node := an_item.as_node
				Result := matches_node (a_node.node_type, a_node.fingerprint, a_node.type_annotation)
			end
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			Result := any_node_test
		end

	node_kind: INTEGER is
			-- Type of nodes matched
		do
			Result := Any_node
		end

	node_kind_mask: INTEGER is
			-- Mask of types of nodes matched;
			-- A bit mask.
		deferred
		end

	constraining_node_names: DS_SET [INTEGER] is
			-- Set of fingerprints of node names allowed
		require
			at_most_one_name_constraint: is_at_most_one_name_constraint
		do
			-- default is that there are no constraints
		ensure
			not_void_if_any_constraints: True
		end

	primitive_type: INTEGER is
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := node_kind
		end

	atomized_item_type: XM_XPATH_ATOMIC_TYPE is
			-- Type of atomic values that will be produced when an item of this type is atomized
		do
			Result := type_factory.any_atomic_type
		end

	content_type: XM_XPATH_SCHEMA_TYPE is
			-- Content type
		do
			Result := any_type
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		do
			if other.is_node_test then
				Result := STRING_.same_string (original_text, other.as_node_test.original_text)
			end
		end

feature -- Status report

	is_at_most_one_name_constraint: BOOLEAN is
			-- Is there at most one name constraint?
		do
			Result := True
		end

	allows_text_nodes: BOOLEAN is
			-- Does this node test allow text nodes?
		deferred
		end

	original_text: STRING
			-- Original text of the node-test, for use in diagnostics

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages
		do
			Result := original_text
		end

feature -- Matching

	matches_node (a_node_kind: INTEGER; a_fingerprint: INTEGER; a_node_type: INTEGER): BOOLEAN is
			-- Is this node test satisfied by a given node?
		deferred
		end

end
