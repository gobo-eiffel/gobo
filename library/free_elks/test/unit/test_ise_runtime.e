note

	description:

		"Test features of class ISE_RUNTIME"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2016, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_ISE_RUNTIME

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_is_special_any_type
			-- Test feature 'REFLECTOR.is_special_any_type'.
		local
			l_r: REFLECTOR
		do
			create l_r
			assert_false ("toto_dd", l_r.is_special_any_type (({SPECIAL [DD]}).type_id))
			assert_true ("toto_ref", l_r.is_special_any_type (({detachable SPECIAL [STRING]}).type_id))
			assert_true ("toto_ref2", l_r.is_special_any_type (({attached SPECIAL [STRING]}).type_id))
			assert_false ("toto_int", l_r.is_special_any_type (({SPECIAL [INTEGER]}).type_id))
			assert_false ("tata_dd", l_r.is_special_type (({SPECIAL [DD]}).type_id))
			assert_true ("tata_ref", l_r.is_special_type (({detachable SPECIAL [STRING]}).type_id))
			assert_true ("tata_ref1", l_r.is_special_type (({attached SPECIAL [STRING]}).type_id))
			assert_true ("tata_int", l_r.is_special_type (({detachable SPECIAL [INTEGER]}).type_id))
			assert_true ("tata_int2", l_r.is_special_type (({attached SPECIAL [INTEGER]}).type_id))
		end

	test_compiler_version
			-- Test feature 'compiler_version'.
		do
			assert ("compiler_version", {ISE_RUNTIME}.compiler_version >= 0)
		end

	test_generator_of_type
			-- Test feature 'generator_of_type'.
		do
			assert_strings_equal ("string_8", "STRING_8", {ISE_RUNTIME}.generator_of_type (({STRING_8}).type_id))
			assert_strings_equal ("integer_16", "INTEGER_16", {ISE_RUNTIME}.generator_of_type (({INTEGER_16}).type_id))
			assert_strings_equal ("array", "ARRAY", {ISE_RUNTIME}.generator_of_type (({ARRAY [ANY]}).type_id))
		end

	test_generating_type_of_type
			-- Test feature 'generating_type_of_type'.
		do
			if is_void_safe_mode then
				assert_strings_equal ("string_8_void_safe", "!STRING_8", {ISE_RUNTIME}.generating_type_of_type (({STRING_8}).type_id))
				assert_strings_equal ("array_any_void_safe", "!ARRAY [!ANY]", {ISE_RUNTIME}.generating_type_of_type (({ARRAY [ANY]}).type_id))
			else
				assert_strings_equal ("string_8_non_void_safe", "STRING_8", {ISE_RUNTIME}.generating_type_of_type (({STRING_8}).type_id))
				assert_strings_equal ("array_any_non_void_safe", "ARRAY [ANY]", {ISE_RUNTIME}.generating_type_of_type (({ARRAY [ANY]}).type_id))
			end
			assert_strings_equal ("integer_16", "INTEGER_16", {ISE_RUNTIME}.generating_type_of_type (({INTEGER_16}).type_id))
		end

	test_type_id_from_name
			-- Test feature 'type_id_from_name'.
		local
			l_cstr: C_STRING
		do
			create l_cstr.make ("ARRAY [ANY]")
			assert_integers_equal ("type_of_array", ({detachable ARRAY [detachable ANY]}).type_id, {ISE_RUNTIME}.type_id_from_name (l_cstr.item))
			create l_cstr.make ("STRING_8")
			assert_integers_equal ("type_of_string_8", ({detachable STRING_8}).type_id, {ISE_RUNTIME}.type_id_from_name (l_cstr.item))
			create l_cstr.make ("INTEGER_16")
			assert_integers_equal ("type_of_integer_16", ({INTEGER_16}).type_id, {ISE_RUNTIME}.type_id_from_name (l_cstr.item))
		end

	test_check_assert
			-- Test feature 'check_assert'.
		do
			assert_true ("check_assert_1", {ISE_RUNTIME}.check_assert (False))
			assert_false ("check_assert_2", {ISE_RUNTIME}.check_assert (True))
		end

	test_in_assertion
			-- Test feature 'in_assertion'.
		do
			assert_false ("in_assertion_1", {ISE_RUNTIME}.in_assertion)
			assert_true ("check_assert_1", {ISE_RUNTIME}.check_assert (False))
			assert_true ("in_assertion_2", {ISE_RUNTIME}.in_assertion)
			assert_false ("check_assert_2", {ISE_RUNTIME}.check_assert (True))
			assert_false ("in_assertion_3", {ISE_RUNTIME}.in_assertion)
		end

	test_dynamic_type
			-- Test feature 'dynamic_type'.
		local
			s: STRING_8
			i: INTEGER_16
			arr: ARRAY [ANY]
		do
			s := "gobo"
			create arr.make_filled ("", 1, 5)
			assert_integers_equal ("string_8", ({detachable STRING_8}).type_id, {ISE_RUNTIME}.dynamic_type (s))
			assert_integers_equal ("integer_16", ({INTEGER_16}).type_id, {ISE_RUNTIME}.dynamic_type (i))
			assert_integers_equal ("array_any", ({detachable ARRAY [ANY]}).type_id, {ISE_RUNTIME}.dynamic_type (arr))
		end

	test_type_conforms_to
			-- Test feature 'type_conforms_to'.
		do
			assert ("string_8_conforms_to_string_8", {ISE_RUNTIME}.type_conforms_to (({STRING_8}).type_id, ({STRING_8}).type_id))
			assert ("string_8_conforms_to_any", {ISE_RUNTIME}.type_conforms_to (({STRING_8}).type_id, ({ANY}).type_id))
			assert_false ("string_8_does_not_conforms_to_integer_16", {ISE_RUNTIME}.type_conforms_to (({STRING_8}).type_id, ({INTEGER_16}).type_id))
			assert ("integer_16_conforms_to_integer_16", {ISE_RUNTIME}.type_conforms_to (({INTEGER_16}).type_id, ({INTEGER_16}).type_id))
			assert ("integer_16_conforms_to_any", {ISE_RUNTIME}.type_conforms_to (({INTEGER_16}).type_id, ({ANY}).type_id))
			assert_false ("integer_16_does_not_conforms_to_string_8", {ISE_RUNTIME}.type_conforms_to (({INTEGER_16}).type_id, ({STRING_8}).type_id))
			assert ("arrays", {ISE_RUNTIME}.type_conforms_to (({ARRAY [INTEGER_16]}).type_id, ({ARRAY [ANY]}).type_id))
			assert ("none_conforms_to_string_8", {ISE_RUNTIME}.type_conforms_to (({detachable NONE}).type_id, ({detachable STRING_8}).type_id))
			assert_false ("none_does_not_conform_to_boolean", {ISE_RUNTIME}.type_conforms_to (({detachable NONE}).type_id, ({BOOLEAN}).type_id))
		end

	test_is_attached_type
			-- Test feature 'is_attached_type'.
		do
			if is_void_safe_mode then
				assert_true ("attached_void_safe", {ISE_RUNTIME}.is_attached_type (({attached STRING_8}).type_id))
			else
				assert_false ("attached_non_void_safe", {ISE_RUNTIME}.is_attached_type (({attached STRING_8}).type_id))
			end
			assert_false ("detachable", {ISE_RUNTIME}.is_attached_type (({detachable STRING_8}).type_id))
		end

	test_attached_type
			-- Test feature 'attached_type'.
		do
			if is_void_safe_mode then
				assert_integers_equal ("attached_void_safe", ({attached STRING_8}).type_id, {ISE_RUNTIME}.attached_type (({attached STRING_8}).type_id))
				assert_integers_equal ("detachable_void_safe", ({attached STRING_8}).type_id, {ISE_RUNTIME}.attached_type (({detachable STRING_8}).type_id))
			else
				assert_integers_not_equal ("attached_non_void_safe", ({attached STRING_8}).type_id, {ISE_RUNTIME}.attached_type (({attached STRING_8}).type_id))
				assert_integers_not_equal ("detachable_non_void_safe", ({attached STRING_8}).type_id, {ISE_RUNTIME}.attached_type (({detachable STRING_8}).type_id))
			end
		end

	test_detachable_type
			-- Test feature 'detachable_type'.
		do
			assert_integers_equal ("attached", ({detachable STRING_8}).type_id, {ISE_RUNTIME}.detachable_type (({attached STRING_8}).type_id))
			assert_integers_equal ("detachable", ({detachable STRING_8}).type_id, {ISE_RUNTIME}.detachable_type (({detachable STRING_8}).type_id))
		end

	test_is_field_transient_of_type
			-- Test feature 'is_field_transient_of_type'.
		do
			assert_false ("not_transient", {ISE_RUNTIME}.is_field_transient_of_type (field_index ("boolean_1", Current), generating_type.type_id))
		end

	test_is_field_expanded_of_type
			-- Test feature 'is_field_expanded_of_type'.
		do
			assert_false ("basic_expanded", {ISE_RUNTIME}.is_field_expanded_of_type (field_index ("boolean_1", Current), generating_type.type_id))
			assert_true ("user_expanded", {ISE_RUNTIME}.is_field_expanded_of_type (field_index ("expanded_1", Current), generating_type.type_id))
			assert_false ("reference", {ISE_RUNTIME}.is_field_expanded_of_type (field_index ("string_8_1", Current), generating_type.type_id))
		end

	test_is_special
			-- Test feature 'is_special'.
		local
			s1: STRING
			s2: SPECIAL [STRING]
			s3: SPECIAL [INTEGER]
			s4: SPECIAL [DD]
		do
			s1 := "gobo"
			assert_false ("not_special", {ISE_RUNTIME}.is_special ($s1))
			create s2.make_empty (2)
			assert_true ("special_reference", {ISE_RUNTIME}.is_special (object_address (s2)))
			create s3.make_empty (2)
			assert_true ("special_basic_expanded", {ISE_RUNTIME}.is_special (object_address (s3)))
			create s4.make_empty (2)
			assert_true ("special_user_expanded", {ISE_RUNTIME}.is_special (object_address (s4)))
		end

	test_is_special_of_expanded
			-- Test feature 'is_special_of_expanded'.
		local
			s1: STRING
			s2: SPECIAL [STRING]
			s3: SPECIAL [INTEGER]
			s4: SPECIAL [DD]
		do
			s1 := "gobo"
			assert_false ("not_special", {ISE_RUNTIME}.is_special_of_expanded ($s1))
			create s2.make_empty (2)
			assert_false ("special_reference", {ISE_RUNTIME}.is_special_of_expanded (object_address (s2)))
			create s3.make_empty (2)
			assert_false ("special_basic_expanded", {ISE_RUNTIME}.is_special_of_expanded (object_address (s3)))
			create s4.make_empty (2)
			assert_true ("special_user_expanded", {ISE_RUNTIME}.is_special_of_expanded (object_address (s4)))
		end

	test_is_special_of_reference
			-- Test feature 'is_special_of_reference'
		local
			s1: STRING
			s2: SPECIAL [STRING]
			s3: SPECIAL [INTEGER]
			s4: SPECIAL [DD]
		do
			s1 := "gobo"
			assert_false ("not_special", {ISE_RUNTIME}.is_special_of_reference ($s1))
			create s2.make_empty (2)
			assert_true ("special_reference", {ISE_RUNTIME}.is_special_of_reference (object_address (s2)))
			create s3.make_empty (2)
			assert_false ("special_basic_expanded", {ISE_RUNTIME}.is_special_of_reference (object_address (s3)))
			create s4.make_empty (2)
			assert_false ("special_user_expanded", {ISE_RUNTIME}.is_special_of_reference (object_address (s4)))
		end

	test_is_expanded
			-- Test feature 'is_expanded'.
		local
			a: ANY
		do
			a := "gobo"
			assert_false ("not_expanded", {ISE_RUNTIME}.is_expanded ($a))
			a := 2
			assert_true ("expanded", {ISE_RUNTIME}.is_expanded ($a))
		end

	test_is_tuple
			-- Test feature 'is_tuple'.
		local
			a: ANY
			s: SPECIAL [STRING]
		do
			a := "gobo"
			assert_false ("not_tuple_1", {ISE_RUNTIME}.is_tuple ($a))
			a := ["gobo"]
			assert_true ("tuple", {ISE_RUNTIME}.is_tuple ($a))
			create s.make_empty (2)
			assert_false ("not_tuple_2", {ISE_RUNTIME}.is_tuple (object_address (s)))
		end

	test_is_copy_semantics_field
			-- Test feature 'is_copy_semantics_field'.
		do
			any_1 := Void
			assert_false ("void", {ISE_RUNTIME}.is_copy_semantics_field (field_index ("any_1", Current), $Current, 0))
			any_1 := 2
			assert_true ("integer", {ISE_RUNTIME}.is_copy_semantics_field (field_index ("any_1", Current), $Current, 0))
			any_1 := "gobo"
			assert_false ("string", {ISE_RUNTIME}.is_copy_semantics_field (field_index ("any_1", Current), $Current, 0))
		end

	test_is_special_copy_semantics_item
			-- Test feature 'is_special_copy_semantics_item'.
		local
			l_special: SPECIAL [detachable ANY]
		do
			create l_special.make_filled (Void, 3)
			l_special.put (2, 1)
			l_special.put ("gobo", 2)
			assert_false ("void", {ISE_RUNTIME}.is_special_copy_semantics_item (0, object_address (l_special)))
			assert_true ("integer", {ISE_RUNTIME}.is_special_copy_semantics_item (1, object_address (l_special)))
			assert_false ("string", {ISE_RUNTIME}.is_special_copy_semantics_item (2, object_address (l_special)))
		end

	test_field_count_of_type
			-- Test feature 'field_count_of_type'.
		do
			assert_integers_equal ("fields_in_array", 4, {ISE_RUNTIME}.field_count_of_type (({ARRAY [ANY]}).type_id))
			assert_integers_equal ("fields_in_any", 0, {ISE_RUNTIME}.field_count_of_type (({ANY}).type_id))
			assert_integers_equal ("fields_in_string_8", 5, {ISE_RUNTIME}.field_count_of_type (({STRING_8}).type_id))
			assert_integers_equal ("fields_in_boolean", 1, {ISE_RUNTIME}.field_count_of_type (({BOOLEAN}).type_id))
		end

	test_field_name_of_type
			-- Test feature 'field_name_of_type'.
		local
			l_c_string: C_STRING
		do
			create l_c_string.make_by_pointer ({ISE_RUNTIME}.field_name_of_type (field_index ("any_1", Current), generating_type.type_id))
			assert_strings_equal ("any_1", "any_1", l_c_string.string)
			create l_c_string.make_by_pointer ({ISE_RUNTIME}.field_name_of_type (field_index ("boolean_1", Current), generating_type.type_id))
			assert_strings_equal ("boolean_1", "boolean_1", l_c_string.string)
		end

	test_field_static_type_of_type
			-- Test feature 'field_static_type_of_type'.
		do
			assert_integers_equal ("any_1", ({detachable ANY}).type_id, {ISE_RUNTIME}.field_static_type_of_type (field_index ("any_1", Current), generating_type.type_id))
			assert_integers_equal ("boolean_1", ({BOOLEAN}).type_id, {ISE_RUNTIME}.field_static_type_of_type (field_index ("boolean_1", Current), generating_type.type_id))
		end

	test_field_type_of_type
			-- Test feature 'field_type_of_type'.
		do
			assert_integers_equal ("any_1", {REFLECTOR_CONSTANTS}.reference_type, {ISE_RUNTIME}.field_type_of_type (field_index ("any_1", Current), generating_type.type_id))
			assert_integers_equal ("boolean_1", {REFLECTOR_CONSTANTS}.boolean_type, {ISE_RUNTIME}.field_type_of_type (field_index ("boolean_1", Current), generating_type.type_id))
			assert_integers_equal ("character_8_1", {REFLECTOR_CONSTANTS}.character_8_type, {ISE_RUNTIME}.field_type_of_type (field_index ("character_8_1", Current), generating_type.type_id))
			assert_integers_equal ("character_32_1", {REFLECTOR_CONSTANTS}.character_32_type, {ISE_RUNTIME}.field_type_of_type (field_index ("character_32_1", Current), generating_type.type_id))
			assert_integers_equal ("integer_8_1", {REFLECTOR_CONSTANTS}.integer_8_type, {ISE_RUNTIME}.field_type_of_type (field_index ("integer_8_1", Current), generating_type.type_id))
			assert_integers_equal ("integer_16_1", {REFLECTOR_CONSTANTS}.integer_16_type, {ISE_RUNTIME}.field_type_of_type (field_index ("integer_16_1", Current), generating_type.type_id))
			assert_integers_equal ("integer_32_1", {REFLECTOR_CONSTANTS}.integer_32_type, {ISE_RUNTIME}.field_type_of_type (field_index ("integer_32_1", Current), generating_type.type_id))
			assert_integers_equal ("integer_64_1", {REFLECTOR_CONSTANTS}.integer_64_type, {ISE_RUNTIME}.field_type_of_type (field_index ("integer_64_1", Current), generating_type.type_id))
			assert_integers_equal ("natural_8_1", {REFLECTOR_CONSTANTS}.natural_8_type, {ISE_RUNTIME}.field_type_of_type (field_index ("natural_8_1", Current), generating_type.type_id))
			assert_integers_equal ("natural_16_1", {REFLECTOR_CONSTANTS}.natural_16_type, {ISE_RUNTIME}.field_type_of_type (field_index ("natural_16_1", Current), generating_type.type_id))
			assert_integers_equal ("natural_32_1", {REFLECTOR_CONSTANTS}.natural_32_type, {ISE_RUNTIME}.field_type_of_type (field_index ("natural_32_1", Current), generating_type.type_id))
			assert_integers_equal ("natural_64_1", {REFLECTOR_CONSTANTS}.natural_64_type, {ISE_RUNTIME}.field_type_of_type (field_index ("natural_64_1", Current), generating_type.type_id))
			assert_integers_equal ("pointer_1", {REFLECTOR_CONSTANTS}.pointer_type, {ISE_RUNTIME}.field_type_of_type (field_index ("pointer_1", Current), generating_type.type_id))
			assert_integers_equal ("real_32_1", {REFLECTOR_CONSTANTS}.real_32_type, {ISE_RUNTIME}.field_type_of_type (field_index ("real_32_1", Current), generating_type.type_id))
			assert_integers_equal ("real_64_1", {REFLECTOR_CONSTANTS}.real_64_type, {ISE_RUNTIME}.field_type_of_type (field_index ("real_64_1", Current), generating_type.type_id))
			assert_integers_equal ("expanded_1", {REFLECTOR_CONSTANTS}.expanded_type, {ISE_RUNTIME}.field_type_of_type (field_index ("expanded_1", Current), generating_type.type_id))
		end

	test_persistent_field_count_of_type_count
			-- Test feature 'persistent_field_count_of_type'.
		do
			assert_integers_equal ("persistent_fields_in_array", 4, {ISE_RUNTIME}.persistent_field_count_of_type (({ARRAY [ANY]}).type_id))
			assert_integers_equal ("persistent_fields_in_any", 0, {ISE_RUNTIME}.persistent_field_count_of_type (({ANY}).type_id))
			assert_integers_equal ("persistent_fields_in_string_8", 5, {ISE_RUNTIME}.persistent_field_count_of_type (({STRING_8}).type_id))
			assert_integers_equal ("persistent_fields_in_boolean", 1, {ISE_RUNTIME}.persistent_field_count_of_type (({BOOLEAN}).type_id))
		end

	test_storable_version_of_type
			-- Test feature 'storable_version_of_type'.
		do
			assert ("no_storable_version", {ISE_RUNTIME}.storable_version_of_type (generating_type.type_id) = Void)
		end

	test_generic_parameter_count
			-- Test feature 'generic_parameter_count'.
		do
			assert_integers_equal ("string_8", 0, {ISE_RUNTIME}.generic_parameter_count (({STRING_8}).type_id))
			assert_integers_equal ("array", 1, {ISE_RUNTIME}.generic_parameter_count (({ARRAY [ANY]}).type_id))
			assert_integers_equal ("table", 2, {ISE_RUNTIME}.generic_parameter_count (({TABLE [ANY, INTEGER]}).type_id))
		end

	test_eif_gen_param_id
			-- Test feature 'eif_gen_param_id'.
		do
			assert_integers_equal ("string_8", ({STRING_8}).type_id, {ISE_RUNTIME}.eif_gen_param_id (({ARRAY [STRING_8]}).type_id, 1))
			assert_integers_equal ("integer_16", ({INTEGER_16}).type_id, {ISE_RUNTIME}.eif_gen_param_id (({ARRAY [INTEGER_16]}).type_id, 1))
			assert_integers_equal ("detachable_any", ({detachable ANY}).type_id, {ISE_RUNTIME}.eif_gen_param_id (({TABLE [detachable ANY, attached HASHABLE]}).type_id, 1))
			assert_integers_equal ("attached_hashable", ({attached HASHABLE}).type_id, {ISE_RUNTIME}.eif_gen_param_id (({TABLE [detachable ANY, attached HASHABLE]}).type_id, 2))
		end

	test_object_size
			-- Test feature 'object_size'.
		local
			obj: ANY
			i64: INTEGER_64
			s: SPECIAL [INTEGER_64]
		do
			obj := i64
			assert ("integer_64", {ISE_RUNTIME}.object_size ($obj) >= 8)
			create s.make_empty (100)
			assert ("special", {ISE_RUNTIME}.object_size (object_address (s)) >= 800)
		end

	test_boolean_field
			-- Test feature 'boolean_field'.
		local
			a: ANY
		do
			boolean_1 := True
			assert ("true1", {ISE_RUNTIME}.boolean_field (field_index ("boolean_1", Current), $Current, 0) = True)
			boolean_1 := False
			assert ("false1", {ISE_RUNTIME}.boolean_field (field_index ("boolean_1", Current), $Current, 0) = False)
			a := True
			assert ("true2", {ISE_RUNTIME}.boolean_field (1, $a, 0) = True)
			a := False
			assert ("false2", {ISE_RUNTIME}.boolean_field (1, $a, 0) = False)
		end

	test_boolean_field_at
			-- Test feature 'boolean_field_at'.
		do
			boolean_1 := True
			assert ("true", {ISE_RUNTIME}.boolean_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("boolean_1", Current), generating_type.type_id), $Current, 0) = True)
			boolean_1 := False
			assert ("false", {ISE_RUNTIME}.boolean_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("boolean_1", Current), generating_type.type_id), $Current, 0) = False)
		end

	test_character_8_field
			-- Test feature 'character_8_field'.
		do
			character_8_1 := 'a'
			assert ("character_8", {ISE_RUNTIME}.character_8_field (field_index ("character_8_1", Current), $Current, 0) = 'a')
		end

	test_character_8_field_at
			-- Test feature 'character_8_field_at'.
		do
			character_8_1 := 'b'
			assert ("character_8", {ISE_RUNTIME}.character_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("character_8_1", Current), generating_type.type_id), $Current, 0) = 'b')
		end

	test_character_32_field
			-- Test feature 'character_32_field'.
		do
			character_32_1 := 'c'
			assert ("character_32", {ISE_RUNTIME}.character_32_field (field_index ("character_32_1", Current), $Current, 0) = 'c')
		end

	test_character_32_field_at
			-- Test feature 'character_32_field_at'.
		do
			character_32_1 := 'd'
			assert ("character_32", {ISE_RUNTIME}.character_32_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("character_32_1", Current), generating_type.type_id), $Current, 0) = 'd')
		end

	test_integer_8_field
			-- Test feature 'integer_8_field'.
		do
			integer_8_1 := 9
			assert ("integer_8", {ISE_RUNTIME}.integer_8_field (field_index ("integer_8_1", Current), $Current, 0) = 9)
		end

	test_integer_8_field_at
			-- Test feature 'integer_8_field_at'.
		do
			integer_8_1 := 10
			assert ("integer_8", {ISE_RUNTIME}.integer_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_8_1", Current), generating_type.type_id), $Current, 0) = 10)
		end

	test_integer_16_field
			-- Test feature 'integer_16_field'.
		do
			integer_16_1 := 17
			assert ("integer_16", {ISE_RUNTIME}.integer_16_field (field_index ("integer_16_1", Current), $Current, 0) = 17)
		end

	test_integer_16_field_at
			-- Test feature 'integer_16_field_at'.
		do
			integer_16_1 := 18
			assert ("integer_16", {ISE_RUNTIME}.integer_16_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_16_1", Current), generating_type.type_id), $Current, 0) = 18)
		end

	test_integer_32_field
			-- Test feature 'integer_32_field'.
		do
			integer_32_1 := 33
			assert ("integer_32", {ISE_RUNTIME}.integer_8_field (field_index ("integer_32_1", Current), $Current, 0) = 33)
		end

	test_integer_32_field_at
			-- Test feature 'integer_32_field_at'.
		do
			integer_32_1 := 34
			assert ("integer_32", {ISE_RUNTIME}.integer_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_32_1", Current), generating_type.type_id), $Current, 0) = 34)
		end

	test_integer_64_field
			-- Test feature 'integer_64_field'.
		do
			integer_64_1 := 65
			assert ("integer_64", {ISE_RUNTIME}.integer_64_field (field_index ("integer_64_1", Current), $Current, 0) = 65)
		end

	test_integer_64_field_at
			-- Test feature 'integer_64_field_at'.
		do
			integer_64_1 := 66
			assert ("integer_64", {ISE_RUNTIME}.integer_64_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_64_1", Current), generating_type.type_id), $Current, 0) = 66)
		end

	test_natural_8_field
			-- Test feature 'natural_8_field'.
		do
			natural_8_1 := 11
			assert ("natural_8", {ISE_RUNTIME}.natural_8_field (field_index ("natural_8_1", Current), $Current, 0) = 11)
		end

	test_natural_8_field_at
			-- Test feature 'natural_8_field_at'.
		do
			natural_8_1 := 12
			assert ("natural_8", {ISE_RUNTIME}.natural_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_8_1", Current), generating_type.type_id), $Current, 0) = 12)
		end

	test_natural_16_field
			-- Test feature 'natural_8_field'.
		do
			natural_16_1 := 19
			assert ("natural_16", {ISE_RUNTIME}.natural_16_field (field_index ("natural_16_1", Current), $Current, 0) = 19)
		end

	test_natural_16_field_at
			-- Test feature 'natural_16_field_at'.
		do
			natural_16_1 := 20
			assert ("natural_16", {ISE_RUNTIME}.natural_16_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_16_1", Current), generating_type.type_id), $Current, 0) = 20)
		end

	test_natural_32_field
			-- Test feature 'natural_32_field'.
		do
			natural_32_1 := 35
			assert ("natural_32", {ISE_RUNTIME}.natural_8_field (field_index ("natural_32_1", Current), $Current, 0) = 35)
		end

	test_natural_32_field_at
			-- Test feature 'natural_32_field_at'.
		do
			natural_32_1 := 36
			assert ("natural_32", {ISE_RUNTIME}.natural_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_32_1", Current), generating_type.type_id), $Current, 0) = 36)
		end

	test_natural_64_field
			-- Test feature 'natural_64_field'.
		do
			natural_64_1 := 67
			assert ("natural_64", {ISE_RUNTIME}.natural_64_field (field_index ("natural_64_1", Current), $Current, 0) = 67)
		end

	test_natural_64_field_at
			-- Test feature 'natural_64_field_at'.
		do
			natural_64_1 := 68
			assert ("natural_64", {ISE_RUNTIME}.natural_64_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_64_1", Current), generating_type.type_id), $Current, 0) = 68)
		end

	test_pointer_field
			-- Test feature 'pointer_field'.
		local
			p: POINTER
		do
			p := $test_pointer_field
			pointer_1 := p
			assert ("pointer", {ISE_RUNTIME}.pointer_field (field_index ("pointer_1", Current), $Current, 0) = p)
		end

	test_pointer_field_at
			-- Test feature 'pointer_field_at'.
		local
			p: POINTER
		do
			p := $test_pointer_field_at
			pointer_1 := p
			assert ("pointer", {ISE_RUNTIME}.pointer_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("pointer_1", Current), generating_type.type_id), $Current, 0) = p)
		end

	test_real_32_field
			-- Test feature 'real_32_field'.
		do
			real_32_1 := 33.0
			assert ("real_32", {ISE_RUNTIME}.real_32_field (field_index ("real_32_1", Current), $Current, 0) = 33.0)
		end

	test_real_32_field_at
			-- Test feature 'real_32_field_at'.
		do
			real_32_1 := 34.0
			assert ("real_32", {ISE_RUNTIME}.real_32_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("real_32_1", Current), generating_type.type_id), $Current, 0) = 34.0)
		end

	test_real_64_field
			-- Test feature 'real_64_field'.
		do
			real_64_1 := 65.0
			assert ("real_64", {ISE_RUNTIME}.real_64_field (field_index ("real_64_1", Current), $Current, 0) = 65.0)
		end

	test_real_64_field_at
			-- Test feature 'real_64_field_at'.
		do
			real_64_1 := 66.0
			assert ("real_64", {ISE_RUNTIME}.real_64_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("real_64_1", Current), generating_type.type_id), $Current, 0) = 66.0)
		end

	test_reference_field
			-- Test feature 'reference_field'.
		local
			s: STRING_8
			arr: ARRAY [ANY]
		do
			s := "gobo"
			string_8_1 := s
			assert ("string_8_1", {ISE_RUNTIME}.reference_field (field_index ("string_8_1", Current), $Current, 0) = s)
			create arr.make_filled ("", 1, 3)
			any_1 := arr
			assert ("any_1a", {ISE_RUNTIME}.reference_field (field_index ("any_1", Current), $Current, 0) = arr)
			any_1 := Current
			assert ("any_1b", {ISE_RUNTIME}.reference_field (field_index ("any_1", Current), $Current, 0) = Current)
		end

	test_reference_field_at
			-- Test feature 'reference_field_at'.
		local
			s: STRING_8
			arr: ARRAY [ANY]
		do
			s := "gobo"
			string_8_1 := s
			assert ("string_8_1", {ISE_RUNTIME}.reference_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("string_8_1", Current), generating_type.type_id), $Current, 0) = s)
			create arr.make_filled ("", 1, 3)
			any_1 := arr
			assert ("any_1a", {ISE_RUNTIME}.reference_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("any_1", Current), generating_type.type_id), $Current, 0) = arr)
			any_1 := Current
			assert ("any_1b", {ISE_RUNTIME}.reference_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("any_1", Current), generating_type.type_id), $Current, 0) = Current)

		end

	test_reference_field_at_offset
			-- Test feature 'reference_field_at_offset'.
		local
			s: STRING_8
			t: TUPLE
		do
			s := "gobo"
			assert ("reference_field_at_offset_zero_1", {ISE_RUNTIME}.reference_field_at_offset ($s, 0) = s)
			assert ("reference_field_at_offset_zero_2", {ISE_RUNTIME}.reference_field_at_offset ($Current, 0) = Current)
			t := []
			assert ("reference_field_at_offset_zero_3", {ISE_RUNTIME}.reference_field_at_offset ($t, 0) = t)
		end

	test_raw_reference_field_at_offset
			-- Test feature 'raw_reference_field_at_offset'.
		local
			s: STRING_8
			t: TUPLE
		do
			s := "gobo"
			assert ("reference_field_at_offset_zero_1", {ISE_RUNTIME}.raw_reference_field_at_offset ($s, 0) = $s)
			assert ("reference_field_at_offset_zero_2", {ISE_RUNTIME}.raw_reference_field_at_offset ($Current, 0) = $Current)
			t := []
			assert ("reference_field_at_offset_zero_3", {ISE_RUNTIME}.raw_reference_field_at_offset ($t, 0) = $t)
		end

	test_dynamic_type_at_offset
			-- Test feature 'dynamic_type_at_offset'.
		local
			s: STRING_8
			t: TUPLE
		do
			s := "gobo"
			assert_integers_equal ("dynamic_type_at_offset_zero_1", s.generating_type.type_id, {ISE_RUNTIME}.dynamic_type_at_offset ($s, 0))
			assert_integers_equal ("dynamic_type_at_offset_zero_2", generating_type.type_id, {ISE_RUNTIME}.dynamic_type_at_offset ($Current, 0))
			t := []
			assert_integers_equal ("dynamic_type_at_offset_zero_3", t.generating_type.type_id, {ISE_RUNTIME}.dynamic_type_at_offset ($t, 0))
		end

	test_set_boolean_field
			-- Test feature 'set_boolean_field'.
		local
			a: ANY
		do
			{ISE_RUNTIME}.set_boolean_field (field_index ("boolean_1", Current), $Current, 0, True)
			assert ("true1", boolean_1 = True)
			{ISE_RUNTIME}.set_boolean_field (field_index ("boolean_1", Current), $Current, 0, False)
			assert ("false1", boolean_1 = False)
			a := False
			{ISE_RUNTIME}.set_boolean_field (1, $a, 0, True)
			assert ("true2", attached {BOOLEAN} a as b and then b = True)
			{ISE_RUNTIME}.set_boolean_field (1, $a, 0, False)
			assert ("false2", attached {BOOLEAN} a as b and then b = False)
		end

	test_set_boolean_field_at
			-- Test feature 'set_boolean_field_at'.
		do
			{ISE_RUNTIME}.set_boolean_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("boolean_1", Current), generating_type.type_id), $Current, 0, True)
			assert ("true", boolean_1 = True)
			{ISE_RUNTIME}.set_boolean_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("boolean_1", Current), generating_type.type_id), $Current, 0, False)
			assert ("false", boolean_1 = False)
		end

	test_set_character_8_field
			-- Test feature 'set_character_8_field'.
		do
			{ISE_RUNTIME}.set_character_8_field (field_index ("character_8_1", Current), $Current, 0, 'w')
			assert ("character_8", character_8_1 = 'w')
		end

	test_set_character_8_field_at
			-- Test feature 'set_character_8_field_at'.
		do
			{ISE_RUNTIME}.set_character_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("character_8_1", Current), generating_type.type_id), $Current, 0, 'x')
			assert ("character_8", character_8_1 = 'x')
		end

	test_set_character_32_field
			-- Test feature 'set_character_32_field'.
		do
			{ISE_RUNTIME}.set_character_32_field (field_index ("character_32_1", Current), $Current, 0, 'y')
			assert ("character_32", character_32_1 = 'y')
		end

	test_set_character_32_field_at
			-- Test feature 'set_character_32_field_at'.
		do
			{ISE_RUNTIME}.set_character_32_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("character_32_1", Current), generating_type.type_id), $Current, 0, 'z')
			assert ("character_32", character_32_1 = 'z')
		end

	test_set_integer_8_field
			-- Test feature 'set_integer_8_field'.
		do
			{ISE_RUNTIME}.set_integer_8_field (field_index ("integer_8_1", Current), $Current, 0, 13)
			assert ("integer_8", integer_8_1 = 13)
		end

	test_set_integer_8_field_at
			-- Test feature 'set_integer_8_field_at'.
		do
			{ISE_RUNTIME}.set_integer_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_8_1", Current), generating_type.type_id), $Current, 0, 14)
			assert ("integer_8", integer_8_1 = 14)
		end

	test_set_integer_16_field
			-- Test feature 'set_integer_16_field'.
		do
			{ISE_RUNTIME}.set_integer_16_field (field_index ("integer_16_1", Current), $Current, 0, 21)
			assert ("integer_16", integer_16_1 = 21)
		end

	test_set_integer_16_field_at
			-- Test feature 'set_integer_16_field_at'.
		do
			{ISE_RUNTIME}.set_integer_16_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_16_1", Current), generating_type.type_id), $Current, 0, 22)
			assert ("integer_16", integer_16_1 = 22)
		end

	test_set_integer_32_field
			-- Test feature 'set_integer_32_field'.
		do
			{ISE_RUNTIME}.set_integer_32_field (field_index ("integer_32_1", Current), $Current, 0, 37)
			assert ("integer_32", integer_32_1 = 37)
		end

	test_set_integer_32_field_at
			-- Test feature 'set_integer_32_field_at'.
		do
			{ISE_RUNTIME}.set_integer_32_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_32_1", Current), generating_type.type_id), $Current, 0, 38)
			assert ("integer_32", integer_32_1 = 38)
		end

	test_set_integer_64_field
			-- Test feature 'set_integer_64_field'.
		do
			{ISE_RUNTIME}.set_integer_64_field (field_index ("integer_64_1", Current), $Current, 0, 69)
			assert ("iinteger_64", integer_64_1 = 69)
		end

	test_set_integer_64_field_at
			-- Test feature 'set_integer_64_field_at'.
		do
			{ISE_RUNTIME}.set_integer_64_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("integer_64_1", Current), generating_type.type_id), $Current, 0, 70)
			assert ("integer_64", integer_64_1 = 70)
		end

	test_set_natural_8_field
			-- Test feature 'set_natural_8_field'.
		do
			{ISE_RUNTIME}.set_natural_8_field (field_index ("natural_8_1", Current), $Current, 0, 15)
			assert ("natural_8", natural_8_1 = 15)
		end

	test_set_natural_8_field_at
			-- Test feature 'set_natural_8_field_at'.
		do
			{ISE_RUNTIME}.set_natural_8_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_8_1", Current), generating_type.type_id), $Current, 0, 16)
			assert ("natural_8", natural_8_1 = 16)
		end

	test_set_natural_16_field
			-- Test feature 'set_natural_16_field'.
		do
			{ISE_RUNTIME}.set_natural_16_field (field_index ("natural_16_1", Current), $Current, 0, 23)
			assert ("natural_16", natural_16_1 = 23)
		end

	test_set_natural_16_field_at
			-- Test feature 'set_natural_16_field_at'.
		do
			{ISE_RUNTIME}.set_natural_16_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_16_1", Current), generating_type.type_id), $Current, 0, 24)
			assert ("natural_16", natural_16_1 = 24)
		end

	test_set_natural_32_field
			-- Test feature 'set_natural_32_field'.
		do
			{ISE_RUNTIME}.set_natural_32_field (field_index ("natural_32_1", Current), $Current, 0, 39)
			assert ("natural_32", natural_32_1 = 39)
		end

	test_set_natural_32_field_at
			-- Test feature 'set_natural_32_field_at'.
		do
			{ISE_RUNTIME}.set_natural_32_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_32_1", Current), generating_type.type_id), $Current, 0, 40)
			assert ("natural_32", natural_32_1 = 40)
		end

	test_set_natural_64_field
			-- Test feature 'set_natural_64_field'.
		do
			{ISE_RUNTIME}.set_natural_64_field (field_index ("natural_64_1", Current), $Current, 0, 71)
			assert ("natural_64", natural_64_1 = 71)
		end

	test_set_natural_64_field_at
			-- Test feature 'set_natural_64_field_at'.
		do
			{ISE_RUNTIME}.set_natural_64_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("natural_64_1", Current), generating_type.type_id), $Current, 0, 72)
			assert ("natural_64", natural_64_1 = 72)
		end

	test_set_pointer_field
			-- Test feature 'set_pointer_field'.
		local
			p: POINTER
		do
			p := $test_set_pointer_field
			{ISE_RUNTIME}.set_pointer_field (field_index ("pointer_1", Current), $Current, 0, p)
			assert ("pointer", pointer_1 = p)
		end

	test_set_pointer_field_at
			-- Test feature 'set_pointer_field_at'.
		local
			p: POINTER
		do
			p := $test_set_pointer_field_at
			{ISE_RUNTIME}.set_pointer_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("pointer_1", Current), generating_type.type_id), $Current, 0, p)
			assert ("pointer", pointer_1 = p)
		end

	test_set_real_32_field
			-- Test feature 'set_real_32_field'.
		do
			{ISE_RUNTIME}.set_real_32_field (field_index ("real_32_1", Current), $Current, 0, 35.0)
			assert ("real_32", real_32_1 = 35.0)
		end

	test_set_real_32_field_at
			-- Test feature 'set_real_32_field_at'.
		do
			{ISE_RUNTIME}.set_real_32_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("real_32_1", Current), generating_type.type_id), $Current, 0, 36.0)
			assert ("real_32", real_32_1 = 36.0)
		end

	test_set_real_64_field
			-- Test feature 'set_real_64_field'.
		do
			{ISE_RUNTIME}.set_real_64_field (field_index ("real_64_1", Current), $Current, 0, 67.0)
			assert ("real_64", real_64_1 = 67.0)
		end

	test_set_real_64_field_at
			-- Test feature 'set_real_64_field_at'.
		do
			{ISE_RUNTIME}.set_real_64_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("real_64_1", Current), generating_type.type_id), $Current, 0, 68.0)
			assert ("real_64", real_64_1 = 68.0)
		end

	test_set_reference_field
			-- Test feature 'set_reference_field'.
		local
			s: STRING_8
			arr: ARRAY [ANY]
		do
			s := "gobo"
			{ISE_RUNTIME}.set_reference_field (field_index ("string_8_1", Current), $Current, 0, s)
			assert ("string_8_1", string_8_1 = s)
			create arr.make_filled ("", 1, 3)
			{ISE_RUNTIME}.set_reference_field (field_index ("any_1", Current), $Current, 0, arr)
			assert ("any_1", any_1 = arr)
		end

	test_set_reference_field_at
			-- Test feature 'set_reference_field_at'.
		local
			s: STRING_8
			arr: ARRAY [ANY]
		do
			s := "gobo"
			{ISE_RUNTIME}.set_reference_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("string_8_1", Current), generating_type.type_id), $Current, 0, s)
			assert ("string_8_1", string_8_1 = s)
			create arr.make_filled ("", 1, 3)
			{ISE_RUNTIME}.set_reference_field_at ({ISE_RUNTIME}.field_offset_of_type (field_index ("any_1", Current), generating_type.type_id), $Current, 0, arr)
			assert ("any_1", any_1 = arr)
		end

	test_set_pre_ecma_mapping
			-- Test feature 'set_pre_ecma_mapping'.
		do
			{ISE_RUNTIME}.set_pre_ecma_mapping (False)
			assert_false ("not_pre_ecma_mapping", {ISE_RUNTIME}.pre_ecma_mapping_status)
			{ISE_RUNTIME}.set_pre_ecma_mapping (True)
			assert_true ("pre_ecma_mapping", {ISE_RUNTIME}.pre_ecma_mapping_status)
		end

	test_is_object_marked
			-- Test feature 'is_object_marked'.
		local
			s: STRING
		do
			{ISE_RUNTIME}.lock_marking
			create s.make_empty
			assert_false ("not_marked_1", {ISE_RUNTIME}.is_object_marked ($s))
			{ISE_RUNTIME}.mark_object ($s)
			assert_true ("marked_1", {ISE_RUNTIME}.is_object_marked ($s))
			{ISE_RUNTIME}.unmark_object ($s)
			assert_false ("not_marked_2", {ISE_RUNTIME}.is_object_marked ($s))
			{ISE_RUNTIME}.unlock_marking
		end

feature -- Attributes

	boolean_1: BOOLEAN
			-- Attribute of type BOOLEAN

	character_8_1: CHARACTER_8
			-- Attribute of type CHARACTER_8

	character_32_1: CHARACTER_32
			-- Attribute of type CHARACTER_32

	integer_8_1: INTEGER_8
			-- Attribute of type INTEGER_8

	integer_16_1: INTEGER_16
			-- Attribute of type INTEGER_16

	integer_32_1: INTEGER_32
			-- Attribute of type INTEGER_32

	integer_64_1: INTEGER_64
			-- Attribute of type INTEGER_64

	natural_8_1: NATURAL_8
			-- Attribute of type NATURAL_8

	natural_16_1: NATURAL_16
			-- Attribute of type NATURAL_16

	natural_32_1: NATURAL_32
			-- Attribute of type NATURAL_32

	natural_64_1: NATURAL_64
			-- Attribute of type NATURAL_64

	pointer_1: POINTER
			-- Attribute of type POINTER

	real_32_1: REAL_32
			-- Attribute of type REAL_32

	real_64_1: REAL_64
			-- Attribute of type REAL_64

	string_8_1: detachable STRING_8
			-- Attribute of type STRING_8

	any_1: detachable ANY
			-- Attribute of type ANY

	expanded_1: DD
			-- Attribute of user-defined expanded type

feature {NONE} -- Implementation

	field_index (a_field_name: STRING; a_object: ANY): INTEGER
			-- Index of field `a_field_name' in `a_object';
			-- 0 if not such field
		require
			a_field_name_not_void: a_field_name /= Void
			a_object_not_void: a_object /= Void
		local
			internal: INTERNAL
			i, nb: INTEGER
		do
			create internal
			from
				i := 1
				nb := internal.field_count (a_object)
			until
				i > nb
			loop
				if internal.field_name (i, a_object).same_string (a_field_name) then
					Result := i
					i := nb + 1
				end
				i := i + 1
			end
		ensure
			field_index_large_enough: Result >= 0
			field_index_small_enough: Result <= (create {INTERNAL}).field_count (a_object)
		end

	object_address (a_object: ANY): POINTER
			-- Address of `a_object'
		require
			a_object_not_void: a_object /= Void
		external
			"C inline"
		alias
			"return (EIF_POINTER) eif_access($a_object);"
		end

	is_void_safe_mode: BOOLEAN
			-- Is current test compiled in void-safe mode?
		once
			Result := {attached STRING_8} /= {detachable STRING_8}
		end

end
