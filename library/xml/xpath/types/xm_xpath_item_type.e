indexing

	description:

		"Objects that indicate the type of an item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ITEM_TYPE

feature -- Access

	fingerprint: INTEGER is
			-- Fingerprint, as used by name pool mechanisms
		deferred
		end

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		require
			item_not_void: an_item /= Void
		deferred
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction;
			-- This is the super-type in the XPath type heirarchy,
			--  as distinct from the Schema base type:
			--  this means that the super-type of xs:boolean is xdt:anyAtomicType,
			--  whose super-type is item() (rather than xs:anySimpleType).
		deferred
		end

	primitive_type: INTEGER is
			-- fingerprint of primitive type corresponding to this item type;
			-- For item(), this is Any_item. For node(), it is Any_node.
			-- For specific node kinds, it is the value representing the node kind, for example Element_node.
			-- For xdt:anyAtomicType it is Atomic_type. For numeric it is Number_type.
			-- For other atomic types it is the primitive type as defined in XML Schema:
		deferred
		ensure
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		require
			other_item_type_not_void: other /= void
		deferred
		end

feature -- Status report

	is_abstract: BOOLEAN
			-- Does `Current' represent an abstract type?
	
feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages;
			-- Where this is a QName, it will use conventional prefixes.
		deferred
		ensure
			result_not_void: Result /= void
		end

end

