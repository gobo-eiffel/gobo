note
	description: "[
			Access to internal object properties.
			This class may be used as ancestor by classes needing its facilities.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-05-20 16:15:17 -0700 (Mon, 20 May 2013) $"
	revision: "$Revision: 92557 $"

class
	REFLECTOR

inherit
	REFLECTOR_HELPER

	REFLECTOR_CONSTANTS

feature -- Conformance

	type_conforms_to (type1, type2: INTEGER): BOOLEAN
			-- Does `type1' conform to `type2'?
		require
			type1_nonnegative: type1 >= 0
			type2_nonnegative: type2 >= 0
		local
			l_type1: detachable TYPE [detachable ANY]
			l_type2: detachable TYPE [detachable ANY]
		do
--<			Result := {ISE_RUNTIME}.type_conforms_to (type1, type2)
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
--<			Result := {ISE_RUNTIME}.type_conforms_to (a_source_type, {ISE_RUNTIME}.detachable_type (a_field_type))
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
--<			l_cstr: C_STRING
			i: INTEGER
			l_type: detachable TYPE [detachable ANY]
			l_table: like internal_dynamic_type_string_table
--<			l_pre_ecma_status: BOOLEAN
		do
			l_table := internal_dynamic_type_string_table
			l_table.search (class_type)
			if l_table.found then
				Result := l_table.found_item
			else
--<				create l_cstr.make (class_type)
--<					-- Take into consideration possible pre-ECMA mapping.
--<				l_pre_ecma_status := {ISE_RUNTIME}.pre_ecma_mapping_status
--<				{ISE_RUNTIME}.set_pre_ecma_mapping (not is_pre_ecma_mapping_disabled)
--<				Result := {ISE_RUNTIME}.type_id_from_name (l_cstr.item)
--<				{ISE_RUNTIME}.set_pre_ecma_mapping (l_pre_ecma_status)
				Result := invalid_type
				from
					i := internal.max_type_id
			 	until
					i < 1
				loop
					l_type := type_of_type (i)
					if l_type /= Void and then stripped_type_name (l_type).same_string_general (class_type) then
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

	stripped_type_name (a_type: TYPE [detachable ANY]): STRING
			-- Version of the name of `a_type' where attachement marks
			-- have been removed
		require
			a_type_not_void: a_type /= Void
		do
			Result := a_type.name.twin
			Result.replace_substring_all ("attached ", "")
			Result.replace_substring_all ("[attached] ", "")
			Result.replace_substring_all ("detachable ", "")
			Result.replace_substring_all ("[detachable] ", "")
		ensure
			stripped_type_name_not_void: Result /= Void
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
--<			Result := c_new_instance_of (type_id)
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.new_instance
			else
				create Result
				create l_exceptions
				l_exceptions.raise ("Unknown type with type_id " + type_id.out)
			end
		ensure
			not_special_type: not attached {SPECIAL [detachable ANY]} Result
			dynamic_type_set: Result.generating_type.type_id = type_id
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
--<			create Result.make_empty (count)
--<			c_set_dynamic_type (Result, type_id)
			l_type := type_of_type (type_id)
			check l_type /= Void then
				Result := l_type.new_special_any_instance (count)
			end
		ensure
			dynamic_type_set: Result.generating_type.type_id = type_id
			count_set: Result.count = 0
			capacity_set: Result.capacity = count
		end

	type_of_type (type_id: INTEGER): TYPE [detachable ANY]
			-- Associated TYPE instance for an object of type id `type_id'
		require
			type_id_nonnegative: type_id >= 0
		do
--<			Result := c_new_type_instance_of (type_id)
			check attached internal.type_of_type (type_id) as l_type then
				Result := l_type
			end
		ensure
			result_not_void: Result /= Void
		end

	internal: INTERNAL
			-- Internal routines
		once
			create Result
		ensure
			internal_not_void: Result /= Void
		end
		
feature -- Status report

	is_special_any_type (type_id: INTEGER): BOOLEAN
			-- Is type represented by `type_id' represent
			-- a SPECIAL [XX] where XX is a reference type.
		require
			type_id_nonnegative: type_id >= 0
--<		external
--<			"C signature (EIF_INTEGER): EIF_BOOLEAN use %"eif_internal.h%""
--<		alias
--<			"eif_special_any_type"
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
--<		external
--<			"C signature (EIF_INTEGER): BOOLEAN use %"eif_internal.h%""
--<		alias
--<			"eif_is_special_type"
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			Result := l_type /= Void and then l_type.conforms_to ({SPECIAL [detachable ANY]})
		end

	is_tuple_type (type_id: INTEGER): BOOLEAN
			-- Is type represented by `type_id' represent a TUPLE?
		require
			type_id_nonnegative: type_id >= 0
--<		external
--<			"C signature (EIF_INTEGER): BOOLEAN use %"eif_internal.h%""
--<		alias
--<			"eif_is_tuple_type"
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			Result := l_type /= Void and then l_type.conforms_to ({TUPLE})
		end

	is_attached_type (a_type_id: INTEGER): BOOLEAN
			-- Is `a_type_id' an attached type?
		require
			a_type_non_negative: a_type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
--<			Result := {ISE_RUNTIME}.is_attached_type (a_type_id)
			l_type := type_of_type (a_type_id)
			Result := l_type /= Void and then l_type.is_attached
		end

	is_field_transient_of_type (i: INTEGER; a_type_id: INTEGER): BOOLEAN
			-- Is `i'-th field of `object' a transient attribute?
			-- I.e. an attribute that does not need to be stored?
		require
			a_type_non_negative: a_type_id >= 0
			index_large_enough: i >= 1
			index_small_enough: i <= field_count_of_type (a_type_id)
		do
--<			Result := {ISE_RUNTIME}.is_field_transient_of_type (i, a_type_id)
-- TODO:
			Result := False
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
--<			Result := {ISE_RUNTIME}.is_field_expanded_of_type (i, a_type_id)
			l_type := type_of_type (a_type_id)
			if l_type /= Void then
				Result := l_type.field_static_type (i).is_expanded
			end
		end

feature -- Access

	class_name_of_type (type_id: INTEGER): STRING
			-- Name of class associated with dynamic type `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
--<			Result := {ISE_RUNTIME}.generator_of_type (type_id)
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.base_class_name
			else
				Result := "**UNKNOWN**"
			end
		end

	type_name_of_type (type_id: INTEGER): STRING
			-- Name of `type_id''s generating type (type of which `type_id'
			-- is a direct instance).
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
--<			Result := {ISE_RUNTIME}.generating_type_of_type (type_id)
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.name
			else
				Result := "**UNKNOWN**"
			end
		end

	attached_type (type_id: INTEGER): INTEGER
			-- Attached version of `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
--			Result := {ISE_RUNTIME}.attached_type (type_id)
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
--<			Result := {ISE_RUNTIME}.detachable_type (type_id)
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.detachable_type.type_id
			else
				Result := invalid_type
			end
		ensure
			unchanged_if_detachable: not is_attached_type (type_id) implies type_id = Result
		end

	generic_count_of_type (type_id: INTEGER): INTEGER
			-- Number of generic parameter in `type_id'.
		require
			type_id_nonnegative: type_id >= 0
		local
			l_type: detachable TYPE [detachable ANY]
		do
--<			Result := {ISE_RUNTIME}.generic_parameter_count (type_id)
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.generic_parameter_count
			end
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
--<			Result := {ISE_RUNTIME}.eif_gen_param_id (type_id, i)
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
--<		local
--<			l_result, l_null: POINTER
		do
			id_to_storable_version.search (a_type_id)
			if id_to_storable_version.found then
				Result := id_to_storable_version.found_item
			else
-- TODO:
--<				l_result := {ISE_RUNTIME}.storable_version_of_type (a_type_id)
--<				if l_result /= l_null then
--<					create Result.make_from_c (l_result)
--<					if Result.is_empty then
--<						Result := Void
--<					end
--<				end
				id_to_storable_version.put (Result, a_type_id)
			end
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
--<			create Result.make_from_c ({ISE_RUNTIME}.field_name_of_type (i, type_id))
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.field_name (i)
			else
				Result := "**unknown**"
			end
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
--<			Result := {ISE_RUNTIME}.field_type_of_type (i, type_id)
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
--<			Result := {ISE_RUNTIME}.field_static_type_of_type (i, type_id)
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.field_static_type (i).type_id
			else
				Result := invalid_type
			end
		ensure
			field_type_nonnegative: Result >= 0
		end

feature -- Version

	compiler_version: INTEGER
		do
			Result := 0
		end

feature -- Measurement

	field_count_of_type (type_id: INTEGER): INTEGER
			-- Number of logical fields in dynamic type `type_id'.
		require
			type_id_nonnegative: type_id >= 0
--<		external
--<			"C macro signature (EIF_INTEGER): EIF_INTEGER use %"eif_internal.h%""
--<		alias
--<			"ei_count_field_of_type"
		local
			l_type: detachable TYPE [detachable ANY]
		do
			l_type := type_of_type (type_id)
			if l_type /= Void then
				Result := l_type.field_count
			end
		end

	persistent_field_count_of_type (a_type_id: INTEGER): INTEGER
			-- Number of logical fields in dynamic type `type_id' that are not transient.
		require
			a_type_non_negative: a_type_id >= 0
		do
--<			Result := {ISE_RUNTIME}.persistent_field_count_of_type (a_type_id)
-- TODO:
			Result := field_count_of_type (a_type_id)
		end

feature {NONE} -- Implementation

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

--<	c_new_instance_of (type_id: INTEGER): ANY
--<			-- New instance of dynamic `type_id'.
--<			-- Note: returned object is not initialized and may
--<			-- hence violate its invariant.
--<			-- `type_id' cannot represent a SPECIAL type, use
--<			-- `new_special_any_instance' instead.	
--<		external
--<			"C macro use %"eif_macros.h%""
--<		alias
--<			"RTLNSMART"
--<		end

--<	c_new_type_instance_of (type_id: INTEGER): TYPE [detachable ANY]
--<			-- New instance of TYPE for object of type `type_id'.
--<		external
--<			"C macro use %"eif_macros.h%""
--<		alias
--<			"RTLNTY"
--<		end

--<	c_set_dynamic_type (obj: SPECIAL [detachable ANY]; dtype: INTEGER)
--<			-- Set `obj' dynamic type to `dtype'.
--<		external
--<			"built_in static"
--<		end

note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
