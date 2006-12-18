indexing

	description:

		"Objects that indicate the type of a list item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_LIST_TYPE

inherit

	XM_XPATH_SIMPLE_TYPE
		redefine

		end

	XM_XPATH_TYPE

feature -- Access

	matches_item (a_item: XM_XPATH_ITEM; a_treat_uri_as_string: BOOLEAN): BOOLEAN is
			-- Does `a_item' conform to `Current'?
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
		do
			-- TODO
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

	base_type_not_void: base_type /= Void

end

