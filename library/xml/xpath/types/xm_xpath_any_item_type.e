indexing

	description:

		"Objects that represent any item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ANY_ITEM_TYPE

inherit

	XM_XPATH_SCHEMA_TYPE

	XM_XPATH_TYPE

creation {XM_XPATH_SHARED_ANY_ITEM_TYPE}

	make
	
feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			local_name := "item"
			namespace_uri := ""
		end

feature -- Access

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		
		do
			Result := True 
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			do_nothing
		end

	primitive_type: INTEGER is
			-- fingerprint of primitive type corresponding to this item type
		do
			Result := Any_item_fingerprint
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		local
			an_any_item: XM_XPATH_ANY_ITEM_TYPE
		do
			an_any_item ?= other
			Result := an_any_item /= Void
		end

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages
		do
			Result := "item()"
		end

end
	
