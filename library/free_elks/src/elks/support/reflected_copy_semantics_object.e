note
	description: "[
		Accessor to an object with copy semantics. Useful to manipulate fields of an object, or
		an expanded field of an object without causing any copying.
		]"
	implementation_details: "[
		The GC might be moving objects, some of the routines are actually builtin.
		]"
	date: "$Date$"
	revision: "$Revision$"

class
	REFLECTED_COPY_SEMANTICS_OBJECT

inherit
	REFLECTED_OBJECT

	REFLECTOR_CONSTANTS

create {REFLECTED_OBJECT}
	make, make_special

create {REFLECTED_COPY_SEMANTICS_OBJECT}
	make_recursive

feature {NONE} -- Initialization

	make (a_enclosing_object: REFLECTED_OBJECT; i: INTEGER)
			-- Setup a proxy to copy semantics field located at the `i'-th field of `a_enclosing_object'.
		require
			i_th_field_is_expanded: a_enclosing_object.is_copy_semantics_field (i)
		do
			referring_object := a_enclosing_object
			referring_physical_offset := a_enclosing_object.field_offset (i)
			physical_offset := 0
			dynamic_type := {ISE_RUNTIME}.dynamic_type_at_offset (object_address, 0)
		ensure
			enclosing_object_set: referring_object = a_enclosing_object
		end

	make_special (a_enclosing_object: REFLECTED_OBJECT; i: INTEGER)
			-- Setup a proxy to copy semantics item located at the `i'-th position of special represented by `a_enclosing_object'.
		require
			a_enclosing_object_is_special: a_enclosing_object.is_special
			a_enclosing_object_is_special_reference: a_enclosing_object.is_special_of_reference
			valid_index: attached {ABSTRACT_SPECIAL} a_enclosing_object.object as l_spec and then l_spec.valid_index (i)
			i_th_field_is_expanded: a_enclosing_object.is_special_copy_semantics_item (i)
		do
			referring_object := a_enclosing_object
			referring_physical_offset := i * {PLATFORM}.pointer_bytes
			physical_offset := 0
			dynamic_type := {ISE_RUNTIME}.dynamic_type_at_offset (object_address, 0)
		ensure
			enclosing_object_set: referring_object = a_enclosing_object
		end

	make_recursive (a_enclosing_object: REFLECTED_COPY_SEMANTICS_OBJECT; i: INTEGER)
			-- Setup a proxy to copy semantics field located at the `i'-th field of `a_enclosing_object'.
		require
			i_th_field_is_expanded: a_enclosing_object.is_copy_semantics_field (i) or a_enclosing_object.is_field_statically_expanded (i)
		do
			if a_enclosing_object.is_field_statically_expanded (i) then
					-- Field is expanded.
				referring_object := a_enclosing_object.referring_object
				referring_physical_offset := a_enclosing_object.referring_physical_offset
				physical_offset := a_enclosing_object.physical_offset + a_enclosing_object.field_offset (i)
				dynamic_type := {ISE_RUNTIME}.dynamic_type_at_offset (object_address, 0)
			else
				referring_object := a_enclosing_object
				referring_physical_offset := a_enclosing_object.field_offset (i)
				physical_offset := 0
				dynamic_type := {ISE_RUNTIME}.dynamic_type_at_offset (object_address, 0)
			end
		end

feature -- Access

	object: ANY
			-- <Precursor>
		note
			compiler: no_gc
		do
			Result := {ISE_RUNTIME}.reference_field_at (physical_offset, referring_object.object_address, referring_physical_offset)
			if Result = Void then
				check object_exists: False then end
			end
		end

	physical_offset: INTEGER
			-- Actual offset of `object' in `referring_object + referring_physical_offset'.

	copy_semantics_field (i: INTEGER): REFLECTED_COPY_SEMANTICS_OBJECT
			-- <Precursor>
		do
			create Result.make_recursive (Current, i)
		end

	expanded_field (i: INTEGER): REFLECTED_COPY_SEMANTICS_OBJECT
			-- <Precursor>
		do
			create Result.make_recursive (Current, i)
		end

feature {REFLECTED_OBJECT} -- Access

	object_address: POINTER
			-- <Precursor>
		note
			compiler: no_gc
		do
			Result := {ISE_RUNTIME}.raw_reference_field_at (physical_offset, referring_object.object_address, referring_physical_offset)
		end

feature {REFLECTED_COPY_SEMANTICS_OBJECT} -- Access

	referring_object: REFLECTED_OBJECT
			-- Enclosing object containing `object' or a reference to `object.

	referring_physical_offset: INTEGER
			-- Actual offset in bytes of `object' in `referring_object'.

;note
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"
end
