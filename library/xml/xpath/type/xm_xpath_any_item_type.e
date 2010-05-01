note

	description:

		"Objects that represent any item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_ITEM_TYPE

inherit

	XM_XPATH_ITEM_TYPE
		redefine
			is_any_item_type
		end

	XM_XPATH_TYPE

create {XM_XPATH_SHARED_ANY_ITEM_TYPE}

	make
	
feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
		end

feature -- Access

	is_any_item_type: BOOLEAN is
			-- Is `Current' an any item type?
		do
			Result := True
		end

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN is
			-- Does `a_item' conform to `Current'?
		
		do
			Result := True 
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			-- do nothing
		end

	primitive_type: INTEGER is
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := Any_item_fingerprint
		end

	atomized_item_type: XM_XPATH_ATOMIC_TYPE is
			-- Type of atomic values that will be produced when an item of this type is atomized
		do
			Result := type_factory.any_atomic_type
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		do
			Result := other.is_any_item_type
		end

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages
		do
			Result := "item()"
		end

end
	
