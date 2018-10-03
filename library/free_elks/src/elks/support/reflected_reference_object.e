note
	description: "[
		Accessor to an object. Useful to manipulate fields of an object, or
		an expanded field of an object without causing any copying.
		If applied to an expanded type, a copy will be manipulated.
		]"
	implementation_details: "[
		The GC might be moving objects, some of the routines are actually builtin.
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	REFLECTED_REFERENCE_OBJECT

inherit
	REFLECTED_OBJECT

	REFLECTOR_CONSTANTS

create
	make

create {REFLECTED_REFERENCE_OBJECT, RT_DBG_INTERNAL}
	make_for_expanded_field, make_for_expanded_field_at

feature {NONE} -- Initialization

	make (a_object: ANY)
			-- Setup a proxy to `a_object'.
		require
			not_expanded_object: True
		do
			enclosing_object := a_object
			dynamic_type := {ISE_RUNTIME}.dynamic_type (a_object)
			physical_offset := 0
		ensure
			enclosing_object_set: enclosing_object = a_object
			no_physical_offset: physical_offset = 0
		end

	make_for_expanded_field (a_enclosing_object: REFLECTED_REFERENCE_OBJECT; i: INTEGER)
			-- Setup a proxy to expanded field located at the `i'-th field of `a_enclosing_object'.
		require
			i_th_field_is_expanded: a_enclosing_object.is_field_statically_expanded (i)
		do
			enclosing_object := a_enclosing_object.enclosing_object
				-- To compute the type ID of the object at the `i'-th field.
			physical_offset := a_enclosing_object.physical_offset + a_enclosing_object.field_offset (i)
			dynamic_type := {ISE_RUNTIME}.dynamic_type_at_offset ($enclosing_object, physical_offset)
		ensure
			enclosing_object_set: enclosing_object = a_enclosing_object.enclosing_object
		end

	make_for_expanded_field_at (a_enclosing_object: ANY; a_physical_offset: INTEGER)
			-- Setup a proxy to expanded field located at the `a_physical_offset' of `a_enclosing_object'.
		require
			not_dotnet: not {PLATFORM}.is_dotnet
		do
			enclosing_object := a_enclosing_object
			physical_offset := a_physical_offset
			dynamic_type := {ISE_RUNTIME}.dynamic_type_at_offset ($a_enclosing_object, a_physical_offset)
		ensure
			enclosing_object_set: enclosing_object = a_enclosing_object
		end

feature -- Access

	object: ANY
			-- <Precursor>
		do
			Result := {ISE_RUNTIME}.reference_field_at_offset ($enclosing_object, physical_offset)
		end

	object_address: POINTER
			-- <Precursor>
		note
			compiler: no_gc
		do
			Result := {ISE_RUNTIME}.raw_reference_field_at_offset ($enclosing_object, physical_offset)
		end

	enclosing_object: separate ANY
			-- Enclosing object containing `object' or a reference to `object.

	physical_offset: INTEGER
			-- Actual offset in bytes of `object' in `enclosing_object'.

	copy_semantics_field (i: INTEGER): REFLECTED_COPY_SEMANTICS_OBJECT
			-- <Precursor>
		do
				-- We create a copy of `Current' otherwise if we update it with a new object
				-- the newly created instance would become invalid.
			create Result.make (twin, i)
		end

	expanded_field (i: INTEGER): REFLECTED_REFERENCE_OBJECT
			-- <Precursor>
		do
			create Result.make_for_expanded_field (Current, i)
		end

feature -- Settings

	set_object (a_obj: separate ANY)
			-- Update Current to represent a new reflected object.
		require
			physical_offset_not_set: physical_offset = 0
		do
			enclosing_object := a_obj
			physical_offset := 0
			dynamic_type := {ISE_RUNTIME}.dynamic_type (a_obj)
		ensure
			enclosing_object_set: enclosing_object = a_obj
			no_physical_offset: physical_offset = 0
		end

note
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
