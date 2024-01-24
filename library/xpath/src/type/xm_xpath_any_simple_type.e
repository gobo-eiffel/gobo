note

	description:

		"Objects that implement xs:anySimpleType"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_ANY_SIMPLE_TYPE

inherit

	XM_XPATH_SIMPLE_TYPE
		redefine
			is_any_simple_type
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant.
		do
			local_name := "anySimpleType"
			namespace_uri := Xml_schema_uri
			fingerprint := Any_simple_type_code
		end

feature -- Access

	is_any_simple_type: BOOLEAN
			-- Is `Current' an any simple type?
		do
			Result := True
		end

	common_atomic_type: XM_XPATH_ATOMIC_TYPE
			-- Lowest common super-type
		do
			Result := type_factory.any_atomic_type
		end

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN
			-- Does `an_item' conform to `Current'?

		do
			Result := True
		end

	super_type: detachable XM_XPATH_ITEM_TYPE
			-- Type from which this item type is derived by restriction
		do
			-- do nothing
		end

	primitive_type: INTEGER
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := fingerprint
		end

	atomized_item_type: XM_XPATH_ATOMIC_TYPE
			-- Type of atomic values that will be produced when an item of this type is atomized
		do
			Result := type_factory.any_atomic_type
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `other' the same type as `Current'?
		do
			Result := other.is_any_simple_type
		end

feature -- Conversion

	conventional_name: STRING
			-- Representation of this type name for use in error messages
		do
			Result := "xa:anySimpleType"
		end

end

