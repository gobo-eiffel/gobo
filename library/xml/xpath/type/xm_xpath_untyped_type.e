note

	description:

		"Objects that implement xdt:untyped"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNTYPED_TYPE

inherit

	XM_XPATH_COMPLEX_TYPE
		redefine
			is_untyped
		end

create

	make

feature {NONE} -- Initialization

	make
			-- Establish invariant.
		do
			local_name := "untyped"
			namespace_uri := Xml_schema_uri
			fingerprint := Untyped_type_code
		end

feature -- Access

	is_untyped: BOOLEAN
			-- Is `Current' an untyped?
		do
			Result := True
		end

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN
			-- Does `a_item' conform to `Current'?

		do
			Result := is_same_type (a_item.item_type)
		end

	super_type: XM_XPATH_ITEM_TYPE
			-- Type from which this item type is derived by restriction
		do
			Result := type_factory.any_type -- TODO - is this correct?
		end

	primitive_type: INTEGER
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := fingerprint
		end

	atomized_item_type: XM_XPATH_ATOMIC_TYPE
			-- Type of atomic values that will be produced when an item of this type is atomized
		do
			Result := type_factory.untyped_atomic_type
		end

	is_simple_content: BOOLEAN
			-- Is content simple?
		do
			Result := False
		end

	simple_content_type: XM_XPATH_SIMPLE_TYPE
			-- Simple content type
		do
			-- Pre-condition cannot be met
			check is_simple_content: False then end
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN
			-- Is `other' the same type as `Current'?
		do
			Result := other.is_untyped
		end

feature -- Conversion

	conventional_name: STRING
			-- Representation of this type name for use in error messages
		do
			Result := "xdt:untyped"
		end

end

