note
	description: "[
			Access to internal object properties.
			This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 2005-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2009-04-13 07:50:17 +0200 (Mon, 13 Apr 2009) $"
	revision: "$Revision: 290 $"

class
	INTERNAL

inherit
	INTERNAL_HELPER

feature -- Conformance

	is_instance_of (object: ANY; type_id: INTEGER): BOOLEAN
			-- Is `object' an instance of type `type_id'?
		require
			object_not_void: object /= Void
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			Result := l_type /= Void and then object.generating_type.conforms_to (l_type)
		end

	type_conforms_to (type1, type2: INTEGER): BOOLEAN
			-- Does `type1' conform to `type2'?
		require
			type1_nonnegative: type1 >= 0
			type2_nonnegative: type2 >= 0
		local
			l_type1: detachable TYPE [detachable ANY]
			l_type2: detachable TYPE [detachable ANY]
		do
			l_type1 := type_of_type (type1)
			l_type2 := type_of_type (type2)
			Result := l_type1 /= Void and l_type2 /= Void and then l_type1.conforms_to (l_type2)
		end

	field_conforms_to (a_source_type, a_field_type: INTEGER): BOOLEAN
			-- Does `a_source_type' conform to `a_field_type'?
			--| Different from `type_conforms_to' since possible attachment mark of `a_field_type'
			--| is discarded.
		require
			a_source_type_non_negative: a_source_type >= 0
			a_field_type_non_negative: a_field_type >= 0
		local
			l_type1: detachable TYPE [detachable ANY]
			l_type2: detachable TYPE [detachable ANY]
		do
			l_type1 := type_of_type (a_source_type)
			l_type2 := type_of_type (a_field_type)
			Result := l_type1 /= Void and l_type2 /= Void and then l_type1.conforms_to (l_type2.detachable_type)
		end

feature -- Creation

	dynamic_type_from_string (class_type: READABLE_STRING_GENERAL): INTEGER
			-- Dynamic type corresponding to `class_type'.
			-- If no dynamic type available, returns -1.
		require
			class_type_not_void: class_type /= Void
			class_type_not_empty: not class_type.is_empty
			is_valid_type_string: is_valid_type_string (class_type)
		local
			i: INTEGER
			l_type: detachable TYPE [detachable ANY]
			l_table: like internal_dynamic_type_string_table
		do
			l_table := internal_dynamic_type_string_table
			l_table.search (class_type)
			if l_table.found then
				Result := l_table.found_item
			else
			  Result := invalid_type
			  from
				  i := max_type_id
			  until
				  i < 1
			  loop
				  l_type := type_of_type (i)
				  if l_type /= Void and then l_type.name.same_string_general (class_type) then
					  Result := l_type.type_id
					  if l_type = {NONE} then
						  Result := none_type
					  end
						  -- Jump out of the loop.
					  i := 0
				  end
				  i := i - 1
				end
				l_table.put (Result, class_type)
			end
		ensure
			dynamic_type_from_string_valid: Result = -1 or Result = none_type or Result >= 0
		end

	new_instance_of (type_id: INTEGER): ANY
			-- New instance of dynamic `type_id'.
			-- Note: returned object is not initialized and may
			-- hence violate its invariant.
			-- `type_id' cannot represent a SPECIAL type, use
			-- `new_special_any_instance' instead.
		require
			type_id_nonnegative: type_id >= 0
			not_special_type: not is_special_type (type_id)
		local
			l_type: detachable TYPE [detachable ANY]
			l_exceptions: EXCEPTIONS
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.new_instance
			else
				create Result
				create l_exceptions
				l_exceptions.raise ("Unknown type with type_id " + type_id.out)
			end
		ensure
			not_special_type: not is_special (Result)
			dynamic_type_set: dynamic_type (Result) = type_id
		end

	new_special_any_instance (type_id, count: INTEGER): SPECIAL [detachable ANY]
			-- New instance of dynamic `type_id' that represents
			-- a SPECIAL with `count' element. To create a SPECIAL of
			-- basic type, use `SPECIAL'.
		require
			count_valid: count >= 0
			type_id_nonnegative: type_id >= 0
			special_type: is_special_any_type (type_id)
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			check l_type /= Void then
				Result := l_type.new_special_any_instance (count)
			end
		ensure
			special_type: is_special (Result)
			dynamic_type_set: dynamic_type (Result) = type_id
			count_set: Result.count = 0
			capacity_set: Result.capacity = count
		end

	type_of (object: detachable ANY): TYPE [detachable ANY]
			-- Associated TYPE instance of `object'
		do
			if object /= Void then
				Result := object.generating_type
			else
				Result := {NONE}
			end
		ensure
			result_not_void: Result /= Void
		end

	type_of_type (type_id: INTEGER): detachable TYPE [detachable ANY]
			-- Associated TYPE instance for an object of type id `type_id'
		require
			type_id_nonnegative: type_id >= 0
		external
			"built_in"
		ensure
			result_not_void: Result /= Void
		end

feature -- Status report

	is_special_any_type (type_id: INTEGER): BOOLEAN
			-- Is type represented by `type_id' represent
			-- a SPECIAL [XX] where XX is a reference type.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.conforms_to ({SPECIAL [detachable ANY]}) and then l_type.generic_parameter_type (1).is_reference
			end
		end

	is_special_type (type_id: INTEGER): BOOLEAN
			-- Is type represented by `type_id' represent
			-- a SPECIAL [XX] where XX is a reference type
			-- or a basic type.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			Result := l_type /= Void and then l_type.conforms_to ({SPECIAL [detachable ANY]})
		end

	is_special (object: ANY): BOOLEAN
			-- Is `object' a special object?
		require
			object_not_void: object /= Void
		do
			Result := attached {SPECIAL [detachable ANY]} object
		end

	is_tuple (object: ANY): BOOLEAN
			-- Is `object' a TUPLE object?
		require
			object_not_void: object /= Void
		do
			Result := attached {TUPLE} object
		end

	is_tuple_type (type_id: INTEGER): BOOLEAN
			-- Is type represented by `type_id' represent a TUPLE?
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			Result := l_type /= Void and then l_type.conforms_to ({TUPLE})
		end

	is_marked (obj: ANY): BOOLEAN
			-- Is `obj' marked?
		require
			object_exists: obj /= Void
		do
			print ("TODO: INTERNAL.is_marked not implemented yet%N")
--			Result := c_is_marked (obj)
		end

	is_attached_type (a_type_id: INTEGER): BOOLEAN
			-- Is `a_type_id' an attached type?
		require
			a_type_non_negative: a_type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (a_type_id)
			Result := l_type /= Void and then l_type = l_type.attached_type
		end

	is_field_transient (i: INTEGER; object: ANY): BOOLEAN
			-- Is `i'-th field of `object' a transient attribute?
			-- I.e. an attribute that does not need to be stored?
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
		do
-- TODO
--			Result := is_field_transient_of_type (i, {ISE_RUNTIME}.dynamic_type (object))
			Result := False
		end

	is_field_transient_of_type (i: INTEGER; a_type_id: INTEGER): BOOLEAN
			-- Is `i'-th field of `object' a transient attribute?
			-- I.e. an attribute that does not need to be stored?
		require
			a_type_non_negative: a_type_id >= 0
			index_large_enough: i >= 1
			index_small_enough: i <= field_count_of_type (a_type_id)
		do
-- TODO
--			Result := {ISE_RUNTIME}.is_field_transient_of_type (i - 1, a_type_id)
			Result := False
		end

	is_field_expanded (i: INTEGER; object: ANY): BOOLEAN
			-- Is `i'-th field of `object' a user-defined expanded attribute?
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
		do
			Result := object.generating_type.field_static_type (i).is_expanded
		end

	is_field_expanded_of_type (i: INTEGER; a_type_id: INTEGER): BOOLEAN
			-- Is `i'-th field of type `a_type_id' a user-defined expanded attribute?
		require
			a_type_non_negative: a_type_id >= 0
			index_large_enough: i >= 1
			index_small_enough: i <= field_count_of_type (a_type_id)
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (a_type_id)
			if l_type /= Void then
				Result := l_type.field_static_type (i).is_expanded
			end
		end

feature -- Access

	invalid_type: INTEGER = -1
			-- Invalid type id

	none_type: INTEGER = -2
			-- Type ID representation for NONE.

	Pointer_type: INTEGER = 0

	Reference_type: INTEGER = 1

	character_8_type, Character_type: INTEGER = 2

	Boolean_type: INTEGER = 3

	Integer_type, integer_32_type: INTEGER = 4

	Real_type, real_32_type: INTEGER = 5

	Double_type, real_64_type: INTEGER = 6

	Expanded_type: INTEGER = 7

	Bit_type: INTEGER = 8

	Integer_8_type: INTEGER = 9

	Integer_16_type: INTEGER = 10

	Integer_64_type: INTEGER = 11

	character_32_type, Wide_character_type: INTEGER = 12

	natural_8_type: INTEGER = 13

	natural_16_type: INTEGER = 14

	natural_32_type: INTEGER = 15

	natural_64_type: INTEGER = 16

	max_predefined_type: INTEGER = 16

	class_name (object: ANY): STRING
			-- Name of the class associated with `object'
		require
			object_not_void: object /= Void
		do
			Result := object.generator
		end

	class_name_of_type (type_id: INTEGER): STRING
			-- Name of class associated with dynamic type `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.base_class_name
			else
				Result := "**UNKNOWN**"
			end
		end

	type_name (object: ANY): STRING
			-- Name of `object''s generating type (type of which `object'
			-- is a direct instance).
		require
			object_not_void: object /= Void
		do
			Result := object.generating_type.name
		end

	type_name_of_type (type_id: INTEGER): STRING
			-- Name of `type_id''s generating type (type of which `type_id'
			-- is a direct instance).
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.name
			else
				Result := "**UNKNOWN**"
			end
		end

	dynamic_type (object: ANY): INTEGER
			-- Dynamic type of `object'
		require
			object_not_void: object /= Void
		do
			Result := object.generating_type.type_id
		ensure
			dynamic_type_nonnegative: Result >= 0
		end

	attached_type (type_id: INTEGER): INTEGER
			-- Attached version of `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.attached_type.type_id
			else
				Result := invalid_type
			end
		ensure
			unchanged_if_attached: is_attached_type (type_id) implies type_id = Result
		end

	detachable_type (type_id: INTEGER): INTEGER
			-- Detachable version of `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.detachable_type.type_id
			else
				Result := invalid_type
			end
		ensure
			unchanged_if_detachable: not is_attached_type (type_id) implies type_id = Result
		end

	generic_count (obj: ANY): INTEGER
			-- Number of generic parameter in `obj'.
		require
			obj_not_void: obj /= Void
		do
			Result := obj.generating_type.generic_parameter_count
		end

	generic_count_of_type (type_id: INTEGER): INTEGER
			-- Number of generic parameter in `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.generic_parameter_count
			end
		end

	generic_dynamic_type (object: ANY; i: INTEGER): INTEGER
			-- Dynamic type of generic parameter of `object' at
			-- position `i'.
		require
			object_not_void: object /= Void
			object_generic: generic_count (object) > 0
			i_valid: i > 0 and i <= generic_count (object)
		do
			Result := object.generating_type.generic_parameter_type (i).type_id
		ensure
			dynamic_type_nonnegative: Result >= 0
		end

	generic_dynamic_type_of_type (type_id: INTEGER; i: INTEGER): INTEGER
			-- Dynamic type of generic parameter of `type_id' at position `i'.
		require
			type_id_nonnegative: type_id >= 0
			type_id_generic: generic_count_of_type (type_id) > 0
			i_valid: i > 0 and i <= generic_count_of_type (type_id)
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.generic_parameter_type (i).type_id
			else
				Result := invalid_type
			end
		ensure
			dynamic_type_nonnegative: Result >= 0
		end

	storable_version_of_type (a_type_id: INTEGER): detachable IMMUTABLE_STRING_8
			-- Storable version if any specified.
		require
			a_type_id_nonnegative: a_type_id >= 0
--		local
--			l_result, l_null: POINTER
		do
			print ("TODO: INTERNAL.storable_version_of_type not implemented yet%N")
--			id_to_storable_version.search (a_type_id)
--			if id_to_storable_version.found then
--				Result := id_to_storable_version.found_item
--			else
--				l_result := {ISE_RUNTIME}.storable_version_of_type (a_type_id)
--				if l_result /= l_null then
--					create Result.make_from_c (l_result)
--					if Result.is_empty then
--						Result := Void
--					end
--				end
--				id_to_storable_version.put (Result, a_type_id)
--			end
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
			Result := object.generating_type.field (i, object)
		end

	field_name (i: INTEGER; object: ANY): STRING
			-- Name of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			not_special: not is_special (object)
		do
			Result := object.generating_type.field_name (i)
		ensure
			Result_exists: Result /= Void
		end

	field_name_of_type (i: INTEGER; type_id: INTEGER): STRING
			-- Name of `i'-th field of dynamic type `type_id'.
		require
			type_id_nonnegative: type_id >= 0
			index_large_enough: i >= 1
			index_small_enought: i <= field_count_of_type (type_id)
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.field_name (i)
			else
				Result := "**unknown**"
			end
		end

	field_offset (i: INTEGER; object: ANY): INTEGER
			-- Offset of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			not_special: not is_special (object)
		do
			print ("TODO: INTERNAL.field_offet not implemented yet%N")
--			Result := c_field_offset (i - 1, object)
		end

	field_type (i: INTEGER; object: ANY): INTEGER
			-- Abstract type of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
		do
			Result := field_type_of_type (i, object.generating_type.type_id)
		ensure
			field_type_nonnegative: Result >= 0
		end

	field_type_of_type (i: INTEGER; type_id: INTEGER): INTEGER
			-- Abstract type of `i'-th field of dynamic type `type_id'
		require
			type_id_nonnegative: type_id >= 0
			index_large_enough: i >= 1
			index_small_enough: i <= field_count_of_type (type_id)
		local
			l_type: detachable TYPE [detachable ANY]
			l_field_type: TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				l_field_type := l_type.field_static_type (i)
				if l_field_type = {BOOLEAN} then
					Result := boolean_type
				elseif l_field_type = {CHARACTER_8} then
					Result := character_8_type
				elseif l_field_type = {CHARACTER_32} then
					Result := character_32_type
				elseif l_field_type = {INTEGER_8} then
					Result := integer_8_type
				elseif l_field_type = {INTEGER_16} then
					Result := integer_16_type
				elseif l_field_type = {INTEGER_32} then
					Result := integer_32_type
				elseif l_field_type = {INTEGER_64} then
					Result := integer_64_type
				elseif l_field_type = {NATURAL_8} then
					Result := natural_8_type
				elseif l_field_type = {NATURAL_16} then
					Result := natural_16_type
				elseif l_field_type = {NATURAL_32} then
					Result := natural_32_type
				elseif l_field_type = {NATURAL_64} then
					Result := natural_64_type
				elseif l_field_type = {POINTER} then
					Result := pointer_type
				elseif l_field_type = {REAL_32} then
					Result := real_32_type
				elseif l_field_type = {REAL_64} then
					Result := real_64_type
				elseif l_field_type = {NONE} then
					Result := none_type
				elseif l_field_type.is_expanded then
					Result := expanded_type
				else
					Result := reference_type
				end
			else
				Result := invalid_type
			end
		ensure
			field_type_nonnegative: Result >= 0
		end

	field_static_type_of_type (i: INTEGER; type_id: INTEGER): INTEGER
			-- Static type of declared `i'-th field of dynamic type `type_id'
		require
			type_id_nonnegative: type_id >= 0
			index_large_enough: i >= 1
			index_small_enough: i <= field_count_of_type (type_id)
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.field_static_type (i).type_id
			else
				Result := invalid_type
			end
		ensure
			field_type_nonnegative: Result >= 0
		end

	expanded_field_type (i: INTEGER; object: ANY): STRING
			-- Class name associated with the `i'-th
			-- expanded field of `object'
		obsolete
			"Use `class_name_of_type (field_static_type_of_type (i, dynamic_type (object)))' instead."
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			is_expanded: field_type (i, object) = expanded_type
		do
			Result := object.generating_type.field_static_type (i).base_class_name
		ensure
			Result_exists: Result /= Void
		end

	character_8_field, character_field (i: INTEGER; object: ANY): CHARACTER_8
			-- CHARACTER_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_8_field: field_type (i, object) = Character_8_type
		do
			Result := object.generating_type.character_8_field (i, object)
		end

	character_32_field (i: INTEGER; object: ANY): CHARACTER_32
			-- CHARACTER_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_32_field: field_type (i, object) = Character_32_type
		do
			Result := object.generating_type.character_32_field (i, object)
		end

	boolean_field (i: INTEGER; object: ANY): BOOLEAN
			-- Boolean value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			boolean_field: field_type (i, object) = Boolean_type
		do
			Result := object.generating_type.boolean_field (i, object)
		end

	natural_8_field (i: INTEGER; object: ANY): NATURAL_8
			-- NATURAL_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_8_field: field_type (i, object) = natural_8_type
		do
			Result := object.generating_type.natural_8_field (i, object)
		end

	natural_16_field (i: INTEGER; object: ANY): NATURAL_16
			-- NATURAL_16 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_16_field: field_type (i, object) = natural_16_type
		do
			Result := object.generating_type.natural_16_field (i, object)
		end

	natural_32_field (i: INTEGER; object: ANY): NATURAL_32
			-- NATURAL_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_32_field: field_type (i, object) = natural_32_type
		do
			Result := object.generating_type.natural_32_field (i, object)
		end

	natural_64_field (i: INTEGER; object: ANY): NATURAL_64
			-- NATURAL_64 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_64_field: field_type (i, object) = natural_64_type
		do
			Result := object.generating_type.natural_64_field (i, object)
		end

	integer_8_field (i: INTEGER; object: ANY): INTEGER_8
			-- INTEGER_8 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_8_field: field_type (i, object) = Integer_8_type
		do
			Result := object.generating_type.integer_8_field (i, object)
		end

	integer_16_field (i: INTEGER; object: ANY): INTEGER_16
			-- INTEGER_16 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_16_field: field_type (i, object) = Integer_16_type
		do
			Result := object.generating_type.integer_16_field (i, object)
		end

	integer_field, integer_32_field (i: INTEGER; object: ANY): INTEGER
			-- INTEGER_32 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_32_field: field_type (i, object) = Integer_32_type
		do
			Result := object.generating_type.integer_32_field (i, object)
		end

	integer_64_field (i: INTEGER; object: ANY): INTEGER_64
			-- INTEGER_64 value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_64_field: field_type (i, object) = Integer_64_type
		do
			Result := object.generating_type.integer_64_field (i, object)
		end

	real_32_field, real_field (i: INTEGER; object: ANY): REAL
			-- Real value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_32_field: field_type (i, object) = real_32_type
		do
			Result := object.generating_type.real_32_field (i, object)
		end

	pointer_field (i: INTEGER; object: ANY): POINTER
			-- Pointer value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			pointer_field: field_type (i, object) = Pointer_type
		do
			Result := object.generating_type.pointer_field (i, object)
		end

	real_64_field, double_field (i: INTEGER; object: ANY): DOUBLE
			-- Double precision value of `i'-th field of `object'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_64_field: field_type (i, object) = real_64_type
		do
			Result := object.generating_type.real_64_field (i, object)
		end

feature -- Version

-- TODO: not implemented yet
--	compiler_version: INTEGER
--		external
--			"C macro use %"eif_project.h%""
--		alias
--			"egc_compiler_tag"
--		end

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
			object.generating_type.set_reference_field (i, object, value)
		end

	set_real_64_field, set_double_field (i: INTEGER; object: ANY; value: DOUBLE)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_64_field: field_type (i, object) = real_64_type
		do
			object.generating_type.set_real_64_field (i, object, value)
		end

	set_character_8_field, set_character_field (i: INTEGER; object: ANY; value: CHARACTER_8)
			-- Set character value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_field: field_type (i, object) = Character_8_type
		do
			object.generating_type.set_character_8_field (i, object, value)
		end

	set_character_32_field (i: INTEGER; object: ANY; value: CHARACTER_32)
			-- Set character 32 value of `i'-th field of `object' to `value'
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			character_field: field_type (i, object) = Character_32_type
		do
			object.generating_type.set_character_32_field (i, object, value)
		end

	set_boolean_field (i: INTEGER; object: ANY; value: BOOLEAN)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			boolean_field: field_type (i, object) = Boolean_type
		do
			object.generating_type.set_boolean_field (i, object, value)
		end

	set_natural_8_field (i: INTEGER; object: ANY; value: NATURAL_8)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_8_field: field_type (i, object) = natural_8_type
		do
			object.generating_type.set_natural_8_field (i, object, value)
		end

	set_natural_16_field (i: INTEGER; object: ANY; value: NATURAL_16)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_16_field: field_type (i, object) = natural_16_type
		do
			object.generating_type.set_natural_16_field (i, object, value)
		end

	set_natural_32_field (i: INTEGER; object: ANY; value: NATURAL_32)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_32_field: field_type (i, object) = natural_32_type
		do
			object.generating_type.set_natural_32_field (i, object, value)
		end

	set_natural_64_field (i: INTEGER; object: ANY; value: NATURAL_64)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			natural_64_field: field_type (i, object) = natural_64_type
		do
			object.generating_type.set_natural_64_field (i, object, value)
		end

	set_integer_8_field (i: INTEGER; object: ANY; value: INTEGER_8)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_8_field: field_type (i, object) = Integer_8_type
		do
			object.generating_type.set_integer_8_field (i, object, value)
		end

	set_integer_16_field (i: INTEGER; object: ANY; value: INTEGER_16)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_16_field: field_type (i, object) = Integer_16_type
		do
			object.generating_type.set_integer_16_field (i, object, value)
		end

	set_integer_field, set_integer_32_field (i: INTEGER; object: ANY; value: INTEGER)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_32_field: field_type (i, object) = Integer_32_type
		do
			object.generating_type.set_integer_32_field (i, object, value)
		end

	set_integer_64_field (i: INTEGER; object: ANY; value: INTEGER_64)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			integer_64_field: field_type (i, object) = Integer_64_type
		do
			object.generating_type.set_integer_64_field (i, object, value)
		end

	set_real_32_field, set_real_field (i: INTEGER; object: ANY; value: REAL)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			real_32_field: field_type (i, object) = real_32_type
		do
			object.generating_type.set_real_32_field (i, object, value)
		end

	set_pointer_field (i: INTEGER; object: ANY; value: POINTER)
		require
			object_not_void: object /= Void
			index_large_enough: i >= 1
			index_small_enough: i <= field_count (object)
			pointer_field: field_type (i, object) = Pointer_type
		do
			object.generating_type.set_pointer_field (i, object, value)
		end

feature -- Measurement

	max_type_id: INTEGER
			-- Maximum value of valid type_id
		external
			"built_in"
		ensure
			max_type_id_not_negative: Result >= 0
		end

	field_count (object: ANY): INTEGER
			-- Number of logical fields in `object'
		require
			object_not_void: object /= Void
		do
			Result := object.generating_type.field_count
		end

	field_count_of_type (type_id: INTEGER): INTEGER
			-- Number of logical fields in dynamic type `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.field_count
			end
		end

	persistent_field_count (object: ANY): INTEGER
			-- Number of logical fields in `object' that are not transient.
		require
			object_not_void: object /= Void
		do
-- TODO
--			Result := {ISE_RUNTIME}.persistent_field_count_of_type (dynamic_type (object))
			Result := field_count (object)
		ensure
			count_positive: Result >= 0
		end

	persistent_field_count_of_type (a_type_id: INTEGER): INTEGER
			-- Number of logical fields in dynamic type `type_id' that are not transient.
		require
			a_type_non_negative: a_type_id >= 0
		do
-- TODO
--			Result := {ISE_RUNTIME}.persistent_field_count_of_type (a_type_id)
			Result := field_count_of_type (a_type_id)
		end

--	bit_size (i: INTEGER; object: ANY): INTEGER
--			-- Size (in bit) of the `i'-th bit field of `object'
--		require
--			object_not_void: object /= Void
--			index_large_enough: i >= 1
--			index_small_enough: i <= field_count (object)
--			is_bit: field_type (i, object) = Bit_type
--		do
--			Result := c_bit_size (i - 1, object)
--		ensure
--			positive_result: Result > 0
--		end

--	physical_size (object: ANY): INTEGER
--			-- Space occupied by `object' in bytes
--		require
--			object_not_void: object /= Void
--		local
--			l_size: NATURAL_64
--		do
--			l_size := c_size (object)
--				-- Prevent overflow by giving the maximum INTEGER_32 value when it is very large.
--			Result := l_size.min ({INTEGER_32}.max_value.as_natural_64).as_integer_32
--		end

--	deep_physical_size (object: ANY): INTEGER
--			-- Space occupied by `object' and its children in bytes
--		require
--			object_not_void: object /= Void
--		local
--			l_size: NATURAL_64
--		do
--			l_size := deep_physical_size_64 (object)
--				-- Prevent overflow by giving the maximum INTEGER_32 value when it is very large.
--			Result := l_size.min ({INTEGER_32}.max_value.as_natural_64).as_integer_32
--		end

--	physical_size_64 (object: ANY): NATURAL_64
--			-- Space occupied by `object' in bytes
--		require
--			object_not_void: object /= Void
--		do
--			Result := c_size (object)
--		end

--	deep_physical_size_64 (object: ANY): NATURAL_64
--			-- Space occupied by `object' and its children in bytes
--		require
--			object_not_void: object /= Void
--		local
--			l_traverse: OBJECT_GRAPH_BREADTH_FIRST_TRAVERSABLE
--			l_objects: detachable ARRAYED_LIST [ANY]
--		do
--			create l_traverse
--			l_traverse.set_root_object (object)
--			l_traverse.set_is_skip_transient (False)
--			l_traverse.traverse
--			l_objects := l_traverse.visited_objects
--			if l_objects /= Void then
--				from
--					l_objects.start
--				until
--					l_objects.after
--				loop
--					Result := Result + physical_size_64 (l_objects.item)
--					l_objects.forth
--				end
--			end
--		end

feature -- Marking

--	mark (obj: ANY)
--			-- Mark object `obj'.
--			-- To be thread safe, make sure to call this feature when you
--			-- have the marking lock that you acquire using `lock_marking'.
--		require
--			object_not_void: obj /= Void
--			object_not_marked: not is_marked (obj)
--		do
--			c_mark (obj)
--		ensure
--			is_marked: is_marked (obj)
--		end

--	unmark (obj: ANY)
--			-- Unmark object `obj'.
--			-- To be thread safe, make sure to call this feature when you
--			-- have the marking lock that you acquire using `lock_marking'.
--		require
--			object_not_void: obj /= Void
--			object_marked: is_marked (obj)
--		do
--			c_unmark (obj)
--		ensure
--			is_not_marked: not is_marked (obj)
--		end

--	lock_marking
--			-- Get a lock on `mark' and `unmark' routine so that 2 threads cannot `mark' and
--			-- `unmark' at the same time.
--		external
--			"C blocking use %"eif_traverse.h%""
--		alias
--			"eif_lock_marking"
--		end

--	unlock_marking
--			-- Release a lock on `mark' and `unmark', so that another thread can
--			-- use `mark' and `unmark'.
--		external
--			"C use %"eif_traverse.h%""
--		alias
--			"eif_unlock_marking"
--		end

feature {NONE} -- Cached data

	internal_dynamic_type_string_table: STRING_TABLE [INTEGER]
			-- Table of dynamic type indexed by type name
		once
			create Result.make (100)
		ensure
			internal_dynamic_type_string_table_not_void: Result /= Void
		end

	id_to_storable_version: HASH_TABLE [detachable IMMUTABLE_STRING_8, INTEGER]
			-- Buffer for `storable_version_of_type' lookups index by type_id.
		once
			create Result.make (100)
		ensure
			id_to_storable_version_not_void: Result /= Void
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
