indexing

	description:

		"Objects that implement xdt:untyped"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_UNTYPED_TYPE

inherit

	XM_XPATH_SCHEMA_TYPE

creation

	make
	
feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			local_name := "untyped"
			namespace_uri := Xpath_defined_datatypes_uri
			fingerprint := Untyped_type_code
		end

feature -- Access

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		
		do
			Result := is_same_type (an_item.item_type)
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			Result := type_factory.any_type -- TODO - is this correct?
		end

	primitive_type: INTEGER is
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := fingerprint
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		local
			an_untyped: like Current
		do
			an_untyped ?= other
			Result := an_untyped /= Void
		end

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages
		do
			Result := "xdt:untyped"
		end

end
	
