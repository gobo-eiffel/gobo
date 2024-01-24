note

	description:

		"Objects that indicate the type of an item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

deferred class XM_XPATH_ITEM_TYPE

inherit

	ANY

	KL_IMPORTED_ANY_ROUTINES

feature -- Access

	is_node_test: BOOLEAN
			-- Is `Current' a node test?
		do
			Result := False
		end

	as_node_test: XM_XPATH_NODE_TEST
			-- `Current' seen as a node test
		require
			node_test: is_node_test
		do
			check is_node_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_node_kind_test: BOOLEAN
			-- Is `Current' a node kind test?
		do
			Result := False
		end

	as_node_kind_test: XM_XPATH_NODE_KIND_TEST
			-- `Current' seen as a node kind test
		require
			node_kind_test: is_node_kind_test
		do
			check is_node_kind_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_name_test: BOOLEAN
			-- Is `Current' a name test?
		do
			Result := False
		end

	as_name_test: XM_XPATH_NAME_TEST
			-- `Current' seen as a name test
		require
			name_test: is_name_test
		do
			check is_name_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_local_name_test: BOOLEAN
			-- Is `Current' a local-name test?
		do
			Result := False
		end

	as_local_name_test: XM_XPATH_LOCAL_NAME_TEST
			-- `Current' seen as a local-name test
		require
			local_name_test: is_local_name_test
		do
			check is_local_name_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_namespace_test: BOOLEAN
			-- Is `Current' a namespace test?
		do
			Result := False
		end

	as_namespace_test: XM_XPATH_NAMESPACE_TEST
			-- `Current' seen as a namespace test
		require
			namespace_test: is_namespace_test
		do
			check is_namespace: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_content_test: BOOLEAN
			-- Is `Current' a content test?
		do
			Result := False
		end

	as_content_test: XM_XPATH_CONTENT_TYPE_TEST
			-- `Current' seen as a content test
		require
			content_test: is_content_test
		do
			check is_content_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_combined_node_test: BOOLEAN
			-- Is `Current' a combined node test?
		do
			Result := False
		end

	as_combined_node_test: XM_XPATH_COMBINED_NODE_TEST
			-- `Current' seen as a combined node test
		require
			combined_node_test: is_combined_node_test
		do
			check is_combined_node_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_document_node_test: BOOLEAN
			-- Is `Current' a document node test?
		do
			Result := False
		end

	as_document_node_test: XM_XPATH_DOCUMENT_NODE_TEST
			-- `Current' seen as a document node test
		require
			document_node_test: is_document_node_test
		do
			check is_document_node_test: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_no_node_test: BOOLEAN
			-- Is `Current' a no-node test?
		do
			Result := False
		end

	is_untyped: BOOLEAN
			-- Is `Current' an untyped?
		do
			Result := False
		end

	is_atomic_type: BOOLEAN
			-- Is `Current' an atomic type?
		do
			Result := False
		end

	as_atomic_type: XM_XPATH_ATOMIC_TYPE
			-- `Current' seen as an atomic type
		require
			atomic_type: is_atomic_type
		do
			check is_atomic_type: False then end
		ensure
			same_object: ANY_.same_objects (Result, Current)
		end

	is_any_type: BOOLEAN
			-- Is `Current' an any type?
		do
			Result := False
		end

	is_any_item_type: BOOLEAN
			-- Is `Current' an any item type?
		do
			Result := False
		end

	is_any_simple_type: BOOLEAN
			-- Is `Current' an any simple type?
		do
			Result := False
		end

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN
			-- Does `a_item' conform to `Current'?
		require
			item_not_void: a_item /= Void
		deferred
		end

	super_type: detachable XM_XPATH_ITEM_TYPE
			-- Type from which this item type is derived by restriction;
			-- This is the super-type in the XPath type hierarchy,
			--  as distinct from the Schema base type:
			--  this means that the super-type of xs:boolean is xdt:anyAtomicType,
			--  whose super-type is item() (rather than xs:anySimpleType).
		deferred
		end

	primitive_type: INTEGER
			-- fingerprint of primitive type corresponding to this item type;
			-- For item(), this is Any_item. For node(), it is Any_node.
			-- For specific node kinds, it is the value representing the node kind, for example Element_node.
			-- For xdt:anyAtomicType it is atomic_type. For numeric it is number_type.
			-- For other atomic types it is the primitive type as defined in XML Schema:
		deferred
		end

	atomized_item_type: XM_XPATH_ATOMIC_TYPE
			-- Type of atomic values that will be produced when an item of this type is atomized
		deferred
		ensure
			super_type_not_void: Result /= Void
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `other' the same type as `Current'?
		require
			other_item_type_not_void: other /= void
		deferred
		end

feature -- Conversion

	conventional_name: STRING
			-- Representation of this type name for use in error messages;
			-- Where this is a QName, it will use conventional prefixes.
		deferred
		ensure
			result_not_void: Result /= Void
		end

end

