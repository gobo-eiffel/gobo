indexing

	description:

		"Objects that indicate the type of an atomic item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LIST_TYPE

inherit

	XM_XPATH_SIMPLE_TYPE

	XM_XPATH_TYPE

feature -- Access

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		do
			-- TODO
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			-- TODO
		end

	primitive_type: INTEGER is
			-- Primitive type corresponding to this item type
		local
			an_atomic_type: XM_XPATH_ATOMIC_TYPE
		do
			-- TODO
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		do
			-- TODO
		end

feature -- Status report

	is_built_in: BOOLEAN
			-- Is `Current' a built-in type?

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages;
			-- Where this is a QName, it will use conventional prefixes.
		do
			-- TODO
		end

invariant

	name_pool_not_void: name_pool /= Void
	base_type_not_void: base_type /= Void

end

