note
	description: "Representation of an Eiffel type."
	remark: "At any given time, there is no more than one instance of TYPE representing a given Eiffel type."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-07 23:32:27 +0100 (Mon, 07 Jan 2013) $"
	revision: "$Revision: 690 $"

frozen class
	TYPE [G]

inherit
	HASHABLE
		rename
			default as any_default
		redefine
			is_equal, out
		end

	DEBUG_OUTPUT
		rename
			default as any_default
		redefine
			is_equal, out
		end

create {NONE}
	-- Creation is done either by using manifest types
	-- or by calling ANY.generating_type.

convert
		-- Conversion useful for the transition period because of the
		-- modification in ANY:
		--    generating_type: STRING
		-- becomes:
		--    generating_type: TYPE [like Current]
	to_string_8: {STRING_8, STRING_GENERAL, READABLE_STRING_GENERAL, READABLE_STRING_8},
	to_string_32: {STRING_32, READABLE_STRING_32}

feature -- Access

	name: IMMUTABLE_STRING_8
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		do
			if attached internal_name as l_name then
				Result := l_name
			else
				create Result.make_from_string (runtime_name)
				internal_name := Result
			end
		ensure
			name_not_void: Result /= Void
		end

	base_class_name: STRING
			-- Name of base class of Eiffel type represented by `Current',
			-- in upper-case
		external
			"built_in"
		ensure
			base_class_name_not_void: Result /= Void
		end

	generic_parameter_type (i: INTEGER): TYPE [detachable ANY]
			-- `i'-th generic parameter of Eiffel type represented by `Current'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= generic_parameter_count
		external
			"built_in"
		ensure
			generic_parameter_not_void: Result /= Void
		end

	type_id: INTEGER
			-- Id of the Eiffel type represented by `Current'
		external
			"built_in"
		ensure
			type_id_not_negative: Result >= 0
		end

	attached_type: TYPE [attached G]
			-- Attached version of current type
		do
			Result := {attached G}
		end

	detachable_type: TYPE [detachable G]
			-- Attached version of current type
		do
			Result := {detachable G}
		end

	hash_code: INTEGER
			-- Hash code value
		do
			Result := type_id
		end

	new_instance: attached G
			-- New instance of of current type, if not deferred,
			-- Void otherwise.
			-- Note: returned object is not initialized and may
			-- hence violate its invariant.
			-- The current type cannot represent a SPECIAL type, use
			-- `new_special_any_instance' instead.
		require
			not_special_type: not is_special
		external
			"built_in"
		ensure
			dynamic_type_set: Result.generating_type = attached_type
		end

	new_special_any_instance (a_count: INTEGER): SPECIAL [detachable ANY]
			-- New instance of current type that represents
			-- a SPECIAL [XX] with `a_count' element where XX is a reference type.
			-- To create a SPECIAL of basic type, use `SPECIAL'.
		require
			a_count_valid: a_count >= 0
			special_type: is_special and generic_parameter_type (1).is_reference
		external
			"built_in"
		ensure
			dynamic_type_set: Result.generating_type.same_type (attached_type)
			count_set: Result.count = 0
			capacity_set: Result.capacity = a_count
		end

	field_name (i: INTEGER): STRING
			-- Name of `i'-th field of direct instances of current type
		require
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			not_special: not is_special
		external
			"built_in"
		ensure
			field_name_not_void: Result /= Void
		end

	field_static_type (i: INTEGER): TYPE [detachable ANY]
			-- Static type of declared `i'-th field of direct instances of current type
		require
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
		external
			"built_in"
		end

	field (i: INTEGER; object: G): detachable ANY
			-- Object attached to the `i'-th field of `object'
			-- (directly or through a reference)
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			not_special: not is_special
		external
			"built_in"
		end

	boolean_field (i: INTEGER; object: G): BOOLEAN
			-- Boolean value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			boolean_field: field_static_type (i) = {BOOLEAN}
		external
			"built_in"
		end

	character_8_field (i: INTEGER; object: G): CHARACTER_8
			-- CHARACTER_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			character_8_field: field_static_type (i) = {CHARACTER_8}
		external
			"built_in"
		end

	character_32_field (i: INTEGER; object: G): CHARACTER_32
			-- CHARACTER_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			character_32_field: field_static_type (i) = {CHARACTER_32}
		external
			"built_in"
		end

	integer_8_field (i: INTEGER; object: G): INTEGER_8
			-- INTEGER_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_8_field: field_static_type (i) = {INTEGER_8}
		external
			"built_in"
		end

	integer_16_field (i: INTEGER; object: G): INTEGER_16
			-- INTEGER_16 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_16_field: field_static_type (i) = {INTEGER_16}
		external
			"built_in"
		end

	integer_32_field (i: INTEGER; object: G): INTEGER_32
			-- INTEGER_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_32_field: field_static_type (i) = {INTEGER_32}
		external
			"built_in"
		end

	integer_64_field (i: INTEGER; object: G): INTEGER_64
			-- INTEGER_64 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_64_field: field_static_type (i) = {INTEGER_64}
		external
			"built_in"
		end

	natural_8_field (i: INTEGER; object: G): NATURAL_8
			-- NATURAL_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_8_field: field_static_type (i) = {NATURAL_8}
		external
			"built_in"
		end

	natural_16_field (i: INTEGER; object: G): NATURAL_16
			-- NATURAL_16 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_16_field: field_static_type (i) = {NATURAL_16}
		external
			"built_in"
		end

	natural_32_field (i: INTEGER; object: G): NATURAL_32
			-- NATURAL_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_32_field: field_static_type (i) = {NATURAL_32}
		external
			"built_in"
		end

	natural_64_field (i: INTEGER; object: G): NATURAL_64
			-- NATURAL_64 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_64_field: field_static_type (i) = {NATURAL_64}
		external
			"built_in"
		end

	pointer_field (i: INTEGER; object: G): POINTER
			-- Pointer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			pointer_field: field_static_type (i) = {POINTER}
		external
			"built_in"
		end

	real_32_field (i: INTEGER; object: G): REAL_32
			-- REAL_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			real_32_field: field_static_type (i) = {REAL_32}
		external
			"built_in"
		end

	real_64_field (i: INTEGER; object: G): REAL_64
			-- REAL_64 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			real_64_field: field_static_type (i) = {REAL_64}
		external
			"built_in"
		end

feature -- Measurement

	generic_parameter_count: INTEGER
			-- Number of generic parameters in Eiffel type represented by `Current'
		external
			"built_in"
		ensure
			generic_parameter_count_not_negative: Result >= 0
		end

	field_count: INTEGER
			-- Number of logical fields in direct instances of current type
		external
			"built_in"
		ensure
			field_count_not_negative: Result >= 0
		end

feature -- Status report

	has_default: BOOLEAN
			-- Is current type a type that has a default value?
			-- I.e. a detachable type or an expanded type.
		external
			"built_in"
		end

	is_expanded: BOOLEAN
			-- Is current type an expanded type?
		external
			"built_in"
		end

	is_reference: BOOLEAN
			-- Is current type a reference type?
		do
			Result := not is_expanded
		ensure
			definition: Result = not is_expanded
		end

	is_special: BOOLEAN
			-- Is current type a special type?
		do
			Result := attached {TYPE [SPECIAL [detachable ANY]]} Current
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
		do
			Result := type_id = other.type_id
		end

feature -- Element change

	set_boolean_field (i: INTEGER; object: G; value: BOOLEAN)
			-- Set boolean value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			boolean_field: field_static_type (i) = {BOOLEAN}
		external
			"built_in"
		end

	set_character_8_field (i: INTEGER; object: G; value: CHARACTER_8)
			-- Set CHARACTER_8 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			character_8_field: field_static_type (i) = {CHARACTER_8}
		external
			"built_in"
		end

	set_character_32_field (i: INTEGER; object: G; value: CHARACTER_32)
			-- Set CHARACTER_32 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			character_32_field: field_static_type (i) = {CHARACTER_32}
		external
			"built_in"
		end

	set_integer_8_field (i: INTEGER; object: G; value: INTEGER_8)
			-- Set INTEGER_8 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_8_field: field_static_type (i) = {INTEGER_8}
		external
			"built_in"
		end

	set_integer_16_field (i: INTEGER; object: G; value: INTEGER_16)
			-- Set INTEGER_16 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_16_field: field_static_type (i) = {INTEGER_16}
		external
			"built_in"
		end

	set_integer_32_field (i: INTEGER; object: G; value: INTEGER_32)
			-- Set INTEGER_32 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_32_field: field_static_type (i) = {INTEGER_32}
		external
			"built_in"
		end

	set_integer_64_field (i: INTEGER; object: G; value: INTEGER_64)
			-- Set INTEGER_64 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			integer_64_field: field_static_type (i) = {INTEGER_64}
		external
			"built_in"
		end

	set_natural_8_field (i: INTEGER; object: G; value: NATURAL_8)
			-- Set NATURAL_8 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_8_field: field_static_type (i) = {NATURAL_8}
		external
			"built_in"
		end

	set_natural_16_field (i: INTEGER; object: G; value: NATURAL_16)
			-- Set NATURAL_16 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_16_field: field_static_type (i) = {NATURAL_16}
		external
			"built_in"
		end

	set_natural_32_field (i: INTEGER; object: G; value: NATURAL_32)
			-- Set NATURAL_32 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_32_field: field_static_type (i) = {NATURAL_32}
		external
			"built_in"
		end

	set_natural_64_field (i: INTEGER; object: G; value: NATURAL_64)
			-- Set NATURAL_64 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			natural_64_field: field_static_type (i) = {NATURAL_64}
		external
			"built_in"
		end

	set_pointer_field (i: INTEGER; object: G; value: POINTER)
			-- Set POINTER value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			pointer_field: field_static_type (i) = {POINTER}
		external
			"built_in"
		end

	set_real_32_field (i: INTEGER; object: G; value: REAL_32)
			-- Set REAL_32 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			real_32_field: field_static_type (i) = {REAL_32}
		external
			"built_in"
		end

	set_real_64_field (i: INTEGER; object: G; value: REAL_64)
			-- Set REAL_64 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			real_64_field: field_static_type (i) = {REAL_64}
		external
			"built_in"
		end

	set_reference_field (i: INTEGER; object: G; value: detachable ANY)
			-- Set reference value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			direct_instance: object.generating_type = Current
			index_large_enough: i >= 1
			index_small_enough: i <= field_count
			reference_field: field_static_type (i).is_reference
--			valid_value: is_attached_type (field_static_type_of_type (i, dynamic_type (object))) implies value /= Void
--			value_conforms_to_field_static_type:
--				value /= Void implies field_conforms_to (dynamic_type (value), field_static_type_of_type (i, dynamic_type (object)))
		external
			"built_in"
		end

feature -- Conversion

	adapt alias "[]" (g: detachable G): detachable G
			-- Adapts `g' or calls necessary conversion routine to adapt `g'
		do
			Result := g
		ensure
			adapted: Result ~ g
		end

	attempt alias "#?" (obj: detachable separate ANY): detachable G
			-- Result of assignment attempt of `obj' to entity of type G
		do
			if attached {G} obj as l_g then
				Result := l_g
			end
		ensure
			assigned_or_void: Result = obj or Result = default_detachable_value
		end

	default_detachable_value: detachable G
		do
		end

	default: G
		require
			has_default: has_default
		external
			"built_in"
		end

feature -- Output

	out: STRING
			-- <Precursor>
		do
			create Result.make_from_string (name)
		end

	debug_output: STRING
			-- <Precursor>
		do
			create Result.make_from_string (name)
		end

feature -- Features from STRING needed here for the transition period (see convert clause)

	plus alias "+" (other: STRING): STRING
			-- Append a copy of 's' at the end of a copy of the name of the
			-- Eiffel type represented by `Current', then return the Result.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name + other' instead (or 'out + other' during the transition period)."
		require
			argument_not_void: other /= Void
		do
			create Result.make (name.count + other.count)
			Result.append (name)
			Result.append (other)
		ensure
			result_exists: Result /= Void
			definition: Result.same_string (name + other)
		end

	same_string (other: STRING): BOOLEAN
			-- Do the name of the Eiffel type represented by `Current'
			-- and `other' have same character sequence?
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.same_string (other)' instead (or 'out.same_string (other)' during the transition period)."
		require
			other_not_void: other /= Void
		do
			Result := name.same_string (other)
		ensure
			definition: Result = name.same_string (other)
		end

	is_case_insensitive_equal (other: STRING): BOOLEAN
			-- Is the name of the Eiffel type represented by `Current'
			-- made of same character sequence as `other' regardless
			-- of casing (possibly with a different capacity)?
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.is_case_insensitive_equal (other)' instead (or 'out.is_case_insensitive_equal (other)' during the transition period)."
		require
			other_not_void: other /= Void
		do
			Result := name.is_case_insensitive_equal (other)
		ensure
			definition: Result = name.is_case_insensitive_equal (other)
		end

	as_lower: STRING
			-- New object with all letters of the name of the Eiffel type
			-- represented by `Current' in lower case.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.as_lower' instead (or 'out.as_lower' during the transition period)."
		do
			create Result.make_from_string (name)
			Result.to_lower
		ensure
			as_lower_not_void: Result /= Void
			definition: Result.same_string (name.as_lower)
		end

	as_upper: STRING
			-- New object with all letters of the name of the Eiffel type
			-- represented by `Current' in upper case.
			-- This feature from STRING is needed here for the
			-- transition period (see convert clause).
		obsolete
			"[070813] Use 'name.as_upper' instead (or 'out.as_upper' during the transition period)."
		do
			create Result.make_from_string (name)
			Result.to_upper
		ensure
			as_upper_not_void: Result /= Void
			definition: Result.same_string (name.as_upper)
		end

	to_string_8: STRING_8
		obsolete
			"Use `name' instead (or `out' during the transition period)."
		do
			create Result.make_from_string (name)
		ensure
			to_string_8_not_void: Result /= Void
		end

	to_string_32: STRING_32
			-- Name of type
		obsolete
			"[080717] Use 'name' instead (or 'out' during the transition period)."
		do
			create Result.make_from_string_general (name)
		ensure
			to_string_32_not_void: Result /= Void
		end

feature {NONE} -- Implementation: Access

	internal_name: detachable IMMUTABLE_STRING_8
			-- Storage for once per object `name'

feature {NONE} -- Implementation

	runtime_name: STRING
			-- Name of Eiffel type represented by `Current', using Eiffel style guidelines
			-- as specified in OOSC2 (e.g. COMPARABLE, HASH_TABLE [FOO, BAR], ...)
		external
			"built_in"
		ensure
			name_not_void: Result /= Void
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
