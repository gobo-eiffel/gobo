note
	description: "[
			Access to internal object properties.
			This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	INTERNAL

inherit
	REFLECTOR

	OBJECT_GRAPH_MARKER
		export
			{ANY} all
		end

feature -- Conformance

	is_instance_of (object: ANY; type_id: INTEGER): BOOLEAN
			-- Is `object' an instance of type `type_id'?
		require
			object_not_void: object /= Void
			type_id_nonnegative: type_id >= 0
		do
			Result := type_conforms_to (dynamic_type (object), type_id)
		ensure
			instance_free: class
		end

feature -- Creation

	type_of (object: detachable ANY): TYPE [detachable ANY]
			-- Associated TYPE instance of `object'.
		do
			if object /= Void then
				Result := object.generating_type
			else
				Result := {detachable NONE}
			end
		ensure
			instance_free: class
			result_not_void: Result /= Void
		end

feature -- Status report

	is_special (object: ANY): BOOLEAN
			-- Is `object' a special object?
		require
			object_not_void: object /= Void
		do
			Result := is_special_type (dynamic_type (object))
		ensure
			instance_free: class
		end

	is_tuple (object: ANY): BOOLEAN
			-- Is `object' a TUPLE object?
		require
			object_not_void: object /= Void
		do
			Result := attached {TUPLE} object
		ensure
			instance_free: class
		end

	is_field_transient (i: INTEGER; object: ANY): BOOLEAN
			-- Is `i'-th field of `object' a transient attribute?
			-- I.e. an attribute that does not need to be stored?
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
		do
			Result := is_field_transient_of_type (i, dynamic_type (object))
		ensure
			instance_free: class
		end

	is_field_expanded (i: INTEGER; object: ANY): BOOLEAN
			-- Is `i'-th field of `object' a user-defined expanded attribute?
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
		do
			Result := is_field_expanded_of_type (i, dynamic_type (object))
		ensure
			instance_free: class
		end

feature -- Access

	class_name (object: ANY): STRING
			-- Name of the class associated with `object'
		require
			object_not_void: object /= Void
		do
			Result := object.generator
		ensure
			instance_free: class
		end

	type_name (object: ANY): STRING
			-- Name of `object`'s generating type
			-- (type of which `object` is a direct instance).
		obsolete "Use `type_name_32` instead. [2020-05-31]"
		require
			object_not_void: object /= Void
		do
			Result := {UTF_CONVERTER}.string_32_to_utf_8_string_8 (type_name_32 (object))
		ensure
			instance_free: class
		end

	type_name_32 (object: ANY): READABLE_STRING_32
			-- Name of `object`'s generating type
			-- (type of which `object` is a direct instance).
		require
			object_not_void: object /= Void
		do
			Result := object.generating_type.name_32
		ensure
			instance_free: class
		end

	dynamic_type (object: separate ANY): INTEGER
			-- Dynamic type of `object'
		require
			object_not_void: object /= Void
		do
			reflected_object.set_object (object)
			Result := reflected_object.dynamic_type
		ensure
			instance_free: class
			dynamic_type_nonnegative: Result >= 0
		end

	generic_count (obj: ANY): INTEGER
			-- Number of generic parameter in `obj'.
		require
			obj_not_void: obj /= Void
		do
			reflected_object.set_object (obj)
			Result := reflected_object.generic_count
		ensure
			instance_free: class
		end

	generic_dynamic_type (obj: ANY; i: INTEGER): INTEGER
			-- Dynamic type of generic parameter of `object' at
			-- position `i'.
		require
			obj_not_void: obj /= Void
			obj_generic: generic_count (obj) > 0
			i_valid: i > 0 and i <= generic_count (obj)
		do
			reflected_object.set_object (obj)
			Result := reflected_object.generic_dynamic_type (i)
		ensure
			instance_free: class
			dynamic_type_nonnegative: Result >= 0
		end

	field (i: INTEGER; object: ANY): detachable ANY
			-- Object attached to the `i'-th field of `object'
			-- (directly or through a reference)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			not_special: not is_special (object)
		do
			reflected_object.set_object (object)
			Result := reflected_object.field (i)
		ensure
			instance_free: class
		end

	reference_field (i: INTEGER; object: ANY): detachable ANY
			-- Reference value of the `i'-th field of `object'.
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			not_special: not is_special (object)
			valid_type: field_type (i, object) = reference_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.reference_field (i)
		ensure
			instance_free: class
		end

	field_name (i: INTEGER; object: ANY): STRING
			-- Name of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			not_special: not is_special (object)
		do
			Result := field_name_of_type (i, dynamic_type (object))
		ensure
			instance_free: class
			Result_exists: Result /= Void
		end

	field_offset (i: INTEGER; object: ANY): INTEGER
			-- Offset of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			not_special: not is_special (object)
		do
			reflected_object.set_object (object)
			Result := reflected_object.field_offset (i)
		ensure
			instance_free: class
		end

	field_type (i: INTEGER; object: ANY): INTEGER
			-- Abstract type of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
		do
			Result := field_type_of_type (i, dynamic_type (object))
		ensure
			instance_free: class
			field_type_nonnegative: Result >= 0
		end

	expanded_field_type (i: INTEGER; object: ANY): STRING
			-- Class name associated with the `i'-th
			-- expanded field of `object'
		obsolete
			"Use `class_name_of_type (field_static_type_of_type (i, dynamic_type (object)))' instead. [2017-05-31]"
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			is_expanded: field_type (i, object) = expanded_type
		do
			Result := class_name_of_type (field_static_type_of_type (i, dynamic_type (object)))
		ensure
			instance_free: class
			Result_exists: Result /= Void
		end

	character_8_field, character_field (i: INTEGER; object: ANY): CHARACTER_8
			-- Character value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_8_field: field_type (i, object) = character_8_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.character_8_field (i)
		ensure
			instance_free: class
		end

	character_32_field (i: INTEGER; object: ANY): CHARACTER_32
			-- Character value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_32_field: field_type (i, object) = character_32_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.character_32_field (i)
		ensure
			instance_free: class
		end

	boolean_field (i: INTEGER; object: ANY): BOOLEAN
			-- Boolean value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			boolean_field: field_type (i, object) = Boolean_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.boolean_field (i)
		ensure
			instance_free: class
		end

	natural_8_field (i: INTEGER; object: ANY): NATURAL_8
			-- NATURAL_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_8_field: field_type (i, object) = natural_8_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.natural_8_field (i)
		ensure
			instance_free: class
		end

	natural_16_field (i: INTEGER; object: ANY): NATURAL_16
			-- NATURAL_16 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_16_field: field_type (i, object) = natural_16_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.natural_16_field (i)
		ensure
			instance_free: class
		end

	natural_32_field (i: INTEGER; object: ANY): NATURAL_32
			-- NATURAL_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_field: field_type (i, object) = natural_32_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.natural_32_field (i)
		ensure
			instance_free: class
		end

	natural_64_field (i: INTEGER; object: ANY): NATURAL_64
			-- NATURAL_64 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_64_field: field_type (i, object) = natural_64_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.natural_64_field (i)
		ensure
			instance_free: class
		end

	integer_8_field (i: INTEGER; object: ANY): INTEGER_8
			-- Integer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_8_field: field_type (i, object) = Integer_8_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.integer_8_field (i)
		ensure
			instance_free: class
		end

	integer_16_field (i: INTEGER; object: ANY): INTEGER_16
			-- Integer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_16_field: field_type (i, object) = Integer_16_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.integer_16_field (i)
		ensure
			instance_free: class
		end

	integer_field, integer_32_field (i: INTEGER; object: ANY): INTEGER
			-- Integer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_32_field: field_type (i, object) = Integer_32_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.integer_32_field (i)
		ensure
			instance_free: class
		end

	integer_64_field (i: INTEGER; object: ANY): INTEGER_64
			-- Integer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_64_field: field_type (i, object) = Integer_64_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.integer_64_field (i)
		ensure
			instance_free: class
		end

	real_32_field, real_field (i: INTEGER; object: ANY): REAL_32
			-- Real value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_32_field: field_type (i, object) = real_32_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.real_32_field (i)
		ensure
			instance_free: class
		end

	pointer_field (i: INTEGER; object: ANY): POINTER
			-- Pointer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			pointer_field: field_type (i, object) = Pointer_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.pointer_field (i)
		ensure
			instance_free: class
		end

	real_64_field, double_field (i: INTEGER; object: ANY): REAL_64
			-- Double precision value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_64_field: field_type (i, object) = real_64_type
		do
			reflected_object.set_object (object)
			Result := reflected_object.real_64_field (i)
		ensure
			instance_free: class
		end

feature -- Element change

	set_reference_field (i: INTEGER; object: ANY; value: detachable ANY)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			reference_field: field_type (i, object) = Reference_type
			valid_value: is_attached_type (field_static_type_of_type (i, dynamic_type (object))) implies value /= Void
			value_conforms_to_field_static_type:
				value /= Void implies field_conforms_to (dynamic_type (value), field_static_type_of_type (i, dynamic_type (object)))
		do
			reflected_object.set_object (object)
			reflected_object.set_reference_field (i, value)
		ensure
			instance_free: class
		end

	set_real_64_field, set_double_field (i: INTEGER; object: ANY; value: REAL_64)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_64_field: field_type (i, object) = real_64_type
		do
			reflected_object.set_object (object)
			reflected_object.set_real_64_field (i, value)
		ensure
			instance_free: class
		end

	set_character_8_field, set_character_field (i: INTEGER; object: ANY; value: CHARACTER_8)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_8_field: field_type (i, object) = character_8_type
		do
			reflected_object.set_object (object)
			reflected_object.set_character_8_field (i, value)
		ensure
			instance_free: class
		end

	set_character_32_field (i: INTEGER; object: ANY; value: CHARACTER_32)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_32_field: field_type (i, object) = character_32_type
		do
			reflected_object.set_object (object)
			reflected_object.set_character_32_field (i, value)
		ensure
			instance_free: class
		end

	set_boolean_field (i: INTEGER; object: ANY; value: BOOLEAN)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			boolean_field: field_type (i, object) = Boolean_type
		do
			reflected_object.set_object (object)
			reflected_object.set_boolean_field (i, value)
		ensure
			instance_free: class
		end

	set_natural_8_field (i: INTEGER; object: ANY; value: NATURAL_8)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_8_field: field_type (i, object) = natural_8_type
		do
			reflected_object.set_object (object)
			reflected_object.set_natural_8_field (i, value)
		ensure
			instance_free: class
		end

	set_natural_16_field (i: INTEGER; object: ANY; value: NATURAL_16)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_16_field: field_type (i, object) = natural_16_type
		do
			reflected_object.set_object (object)
			reflected_object.set_natural_16_field (i, value)
		ensure
			instance_free: class
		end

	set_natural_32_field (i: INTEGER; object: ANY; value: NATURAL_32)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_32_field: field_type (i, object) = natural_32_type
		do
			reflected_object.set_object (object)
			reflected_object.set_natural_32_field (i, value)
		ensure
			instance_free: class
		end

	set_natural_64_field (i: INTEGER; object: ANY; value: NATURAL_64)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_64_field: field_type (i, object) = natural_64_type
		do
			reflected_object.set_object (object)
			reflected_object.set_natural_64_field (i, value)
		ensure
			instance_free: class
		end

	set_integer_8_field (i: INTEGER; object: ANY; value: INTEGER_8)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_8_field: field_type (i, object) = Integer_8_type
		do
			reflected_object.set_object (object)
			reflected_object.set_integer_8_field (i, value)
		ensure
			instance_free: class
		end

	set_integer_16_field (i: INTEGER; object: ANY; value: INTEGER_16)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_16_field: field_type (i, object) = Integer_16_type
		do
			reflected_object.set_object (object)
			reflected_object.set_integer_16_field (i, value)
		ensure
			instance_free: class
		end

	set_integer_field, set_integer_32_field (i: INTEGER; object: ANY; value: INTEGER)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_32_field: field_type (i, object) = Integer_32_type
		do
			reflected_object.set_object (object)
			reflected_object.set_integer_32_field (i, value)
		ensure
			instance_free: class
		end

	set_integer_64_field (i: INTEGER; object: ANY; value: INTEGER_64)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_64_field: field_type (i, object) = Integer_64_type
		do
			reflected_object.set_object (object)
			reflected_object.set_integer_64_field (i, value)
		ensure
			instance_free: class
		end

	set_real_32_field, set_real_field (i: INTEGER; object: ANY; value: REAL_32)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_32_field: field_type (i, object) = real_32_type
		do
			reflected_object.set_object (object)
			reflected_object.set_real_32_field (i, value)
		ensure
			instance_free: class
		end

	set_pointer_field (i: INTEGER; object: ANY; value: POINTER)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			pointer_field: field_type (i, object) = Pointer_type
		do
			reflected_object.set_object (object)
			reflected_object.set_pointer_field (i, value)
		ensure
			instance_free: class
		end

feature -- Measurement

	field_count (object: ANY): INTEGER
			-- Number of logical fields in `object'
		require
			object_not_void: object /= Void
		do
			reflected_object.set_object (object)
			Result := reflected_object.field_count
		ensure
			instance_free: class
		end

	persistent_field_count (object: ANY): INTEGER
			-- Number of logical fields in `object' that are not transient.
		require
			object_not_void: object /= Void
		do
			Result := persistent_field_count_of_type (dynamic_type (object))
		ensure
			instance_free: class
			count_positive: Result >= 0
		end

	physical_size (object: ANY): INTEGER
			-- Space occupied by `object' in bytes
		require
			object_not_void: object /= Void
		local
			l_size: NATURAL_64
		do
			l_size := {ISE_RUNTIME}.object_size ($object)
				-- Prevent overflow by giving the maximum INTEGER_32 value when it is very large.
			Result := l_size.min ({INTEGER_32}.max_value.as_natural_64).as_integer_32
		ensure
			instance_free: class
		end

	deep_physical_size (object: ANY): INTEGER
			-- Space occupied by `object' and its children in bytes
		require
			object_not_void: object /= Void
		local
			l_size: NATURAL_64
		do
			l_size := deep_physical_size_64 (object)
				-- Prevent overflow by giving the maximum INTEGER_32 value when it is very large.
			Result := l_size.min ({INTEGER_32}.max_value.as_natural_64).as_integer_32
		ensure
			instance_free: class
		end

	physical_size_64 (object: separate ANY): NATURAL_64
			-- Space occupied by `object' in bytes
		require
			object_not_void: object /= Void
		do
			Result := {ISE_RUNTIME}.object_size ($object)
		ensure
			instance_free: class
		end

	deep_physical_size_64 (object: ANY): NATURAL_64
			-- Space occupied by `object' and its children in bytes
		require
			object_not_void: object /= Void
		local
			l_traverse: OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE
		do
			create l_traverse
			l_traverse.set_root_object (object)
			l_traverse.set_is_skip_transient (False)
			l_traverse.traverse
			if attached l_traverse.visited_objects as l_objects then
				from
					l_objects.start
				until
					l_objects.after
				loop
					Result := Result + physical_size_64 (l_objects.item)
					l_objects.forth
				end
			end
		ensure
			instance_free: class
		end

feature {NONE} -- Implementation

	reflected_object: REFLECTED_REFERENCE_OBJECT
			-- Abstraction to reflect on objects.
		once
			create Result.make ("")
		ensure
			instance_free: class
		end

note
	copyright: "Copyright (c) 1984-2019, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
