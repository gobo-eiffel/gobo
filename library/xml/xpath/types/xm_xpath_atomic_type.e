indexing

	description:

		"Objects that indicate the type of an atomic item"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATOMIC_TYPE

inherit

	XM_XPATH_SIMPLE_TYPE
		redefine
			is_atomic_type, as_atomic_type
		end

	XM_XPATH_TYPE

	XM_XPATH_SHARED_ANY_ITEM_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_namespace_uri, a_local_name: STRING; a_base_type: XM_XPATH_SCHEMA_TYPE; a_fingerprint: INTEGER) is
			-- Create a built-in type.
		require
			base_type_not_void: a_base_type /= Void
			local_name_not_void: a_local_name /= Void and then a_local_name.count > 0
			namespace_uri_not_void: a_namespace_uri /= Void
		do
			fingerprint := a_fingerprint
			base_type := a_base_type
			local_name := a_local_name
			namespace_uri := a_namespace_uri
			is_built_in := a_fingerprint < 1024
		ensure
			fingerprint_set: fingerprint = a_fingerprint
			base_type_set: base_type = a_base_type
			local_name_set: STRING_.same_string (local_name, a_local_name)
			namespace_uri_set: STRING_.same_string (namespace_uri, a_namespace_uri)
		end
	
feature -- Access

	is_atomic_type: BOOLEAN is
			-- Is `Current' an atomic type?
		do
			Result := True
		end

	as_atomic_type: XM_XPATH_ATOMIC_TYPE is
			-- `Current' seen as an atomic type
		do
			Result := Current
		end

	common_atomic_type: XM_XPATH_ATOMIC_TYPE is
			-- Lowest common super-type
		do
			Result := Current
		end

	matches_item (an_item: XM_XPATH_ITEM): BOOLEAN is
			-- Does `an_item' conform to `Current'?
		local
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
		do
			if an_item.is_atomic_value then
				an_atomic_value := an_item.as_atomic_value
				if fingerprint = an_atomic_value.item_type.fingerprint then
					Result := True
				else
					Result := is_sub_type (an_item.item_type, Current)
				end
			end
		end

	super_type: XM_XPATH_ITEM_TYPE is
			-- Type from which this item type is derived by restriction
		do
			if is_same_type (type_factory.any_atomic_type) then
				Result := any_item
			else
				Result := base_type
			end
		end

	primitive_type: INTEGER is
			-- Primitive type corresponding to this item type
		local
			a_super_type: XM_XPATH_ITEM_TYPE
		do
			if type_factory.is_primitive_type (fingerprint) then
				Result := fingerprint
			else
				a_super_type := super_type
				if a_super_type.is_atomic_type then
					Result := a_super_type.as_atomic_type.primitive_type
				else
					Result := fingerprint
				end
			end
		end

	atomized_item_type: XM_XPATH_ATOMIC_TYPE is
			-- Type of atomic values that will be produced when an item of this type is atomized
		do
			Result := Current
		end

feature -- Comparison

	is_same_type (other: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `other' the same type as `Current'?
		do
			Result := other.is_atomic_type and then other.fingerprint = fingerprint
		end

feature -- Status report

	is_built_in: BOOLEAN
			-- Is `Current' a built-in type?

feature -- Conversion
	
	conventional_name: STRING is
			-- Representation of this type name for use in error messages;
			-- Where this is a QName, it will use conventional prefixes.
		do
			if fingerprint < 0 then
				Result := "illegal fingerprint"
			elseif fingerprint < 1024 then
				Result := standard_display_name
			else
				Result := shared_name_pool.display_name_from_name_code (fingerprint)
			end
		end

end

