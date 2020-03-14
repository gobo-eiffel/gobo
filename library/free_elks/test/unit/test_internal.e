note

	description:

		"Test features of class INTERNAL"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2010-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_INTERNAL

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_field_count
			-- Test feature 'field_count'.
		local
			internal: INTERNAL
			arr: ARRAY [ANY]
			l_attribute_count_in_ts_test_case: INTEGER
		do
			l_attribute_count_in_ts_test_case := 5
			create internal
			assert_integers_equal ("fields_in_current", 16 + l_attribute_count_in_ts_test_case, internal.field_count (Current))
			create arr.make_filled ("", 1, 5)
			assert_integers_equal ("fields_in_array", 4, internal.field_count (arr))
		end

	test_field_count_of_type
			-- Test feature 'field_count_of_type'.
		local
			internal: INTERNAL
			l_attribute_count_in_ts_test_case: INTEGER
		do
			l_attribute_count_in_ts_test_case := 5
			create internal
			assert_integers_equal ("fields_in_current", 16 + l_attribute_count_in_ts_test_case, internal.field_count_of_type (({like Current}).type_id))
			assert_integers_equal ("fields_in_array", 4, internal.field_count_of_type (({ARRAY [ANY]}).type_id))
		end

	test_type_of_type
			-- Test feature 'type_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_equal ("type_of_array", {ARRAY [ANY]}, internal.type_of_type (({ARRAY [ANY]}).type_id))
			assert_equal ("type_of_string_8", {STRING_8}, internal.type_of_type (({STRING_8}).type_id))
			assert_equal ("type_of_integer_16", {INTEGER_16}, internal.type_of_type (({INTEGER_16}).type_id))
		end

	test_type_of
			-- Test feature 'type_of'.
		local
			internal: INTERNAL
			s: STRING_8
			i: INTEGER_16
		do
			create internal
			s := "gobo"
			assert_equal ("type_of_string_8", {detachable STRING_8}, internal.type_of (s))
			assert_equal ("type_of_integer_16", {INTEGER_16}, internal.type_of (i))
		end

	test_dynamic_type_from_string
			-- Test feature 'dynamic_type_from_string'.
		local
			internal: INTERNAL
		do
			create internal
			assert_integers_equal ("type_of_array", ({detachable ARRAY [detachable ANY]}).type_id, internal.dynamic_type_from_string ("ARRAY [ANY]"))
			assert_integers_equal ("type_of_string_8", ({detachable STRING_8}).type_id, internal.dynamic_type_from_string ("STRING_8"))
			assert_integers_equal ("type_of_integer_16", ({INTEGER_16}).type_id, internal.dynamic_type_from_string ("INTEGER_16"))
		end

	test_is_instance_of
			-- Test feature 'is_instance_of'.
		local
			internal: INTERNAL
			s: STRING_8
			i: INTEGER_16
		do
			create internal
			s := "gobo"
			assert ("string_8_is_detachable_string_8", internal.is_instance_of (s, ({detachable STRING_8}).type_id))
			assert ("string_8_is_detachable_any", internal.is_instance_of (s, ({detachable ANY}).type_id))
			if is_void_safe_mode then
					-- The types of objects are considered to be detachable!
				assert_false ("string_8_is_not_string_8", internal.is_instance_of (s, ({STRING_8}).type_id))
				assert_false ("string_8_is_not_any", internal.is_instance_of (s, ({ANY}).type_id))
			end
			assert_false ("string_8_is_not_integer_16", internal.is_instance_of (s, ({INTEGER_16}).type_id))
			assert ("integer_16_is_integer_16", internal.is_instance_of (i, ({INTEGER_16}).type_id))
			assert ("integer_16_is_any", internal.is_instance_of (i, ({ANY}).type_id))
			assert_false ("integer_16_is_not_string_8", internal.is_instance_of (i, ({STRING_8}).type_id))
		end

	test_type_conforms_to
			-- Test feature 'type_conforms_to'.
		local
			internal: INTERNAL
		do
			create internal
			assert ("string_8_conforms_to_string_8", internal.type_conforms_to (({STRING_8}).type_id, ({STRING_8}).type_id))
			assert ("string_8_conforms_to_any", internal.type_conforms_to (({STRING_8}).type_id, ({ANY}).type_id))
			assert_false ("string_8_does_not_conforms_to_integer_16", internal.type_conforms_to (({STRING_8}).type_id, ({INTEGER_16}).type_id))
			assert ("integer_16_conforms_to_integer_16", internal.type_conforms_to (({INTEGER_16}).type_id, ({INTEGER_16}).type_id))
			assert ("integer_16_conforms_to_any", internal.type_conforms_to (({INTEGER_16}).type_id, ({ANY}).type_id))
			assert_false ("integer_16_does_not_conforms_to_string_8", internal.type_conforms_to (({INTEGER_16}).type_id, ({STRING_8}).type_id))
			assert ("arrays", internal.type_conforms_to (({ARRAY [INTEGER_16]}).type_id, ({ARRAY [ANY]}).type_id))
		end

	test_is_special_any_type
			-- Test feature 'is_special_any_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert ("special_string_8", internal.is_special_any_type (({detachable SPECIAL [STRING_8]}).type_id))
			assert ("special_string_8_2", internal.is_special_any_type (({attached SPECIAL [STRING_8]}).type_id))
			assert_false ("special_integer_16", internal.is_special_any_type (({SPECIAL [INTEGER_16]}).type_id))
			assert_false ("string_8", internal.is_special_any_type (({STRING_8}).type_id))
			assert_false ("integer_16", internal.is_special_any_type (({INTEGER_16}).type_id))
		end

	test_is_special_type
			-- Test feature 'is_special_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert ("special_string_8", internal.is_special_type (({detachable SPECIAL [STRING_8]}).type_id))
			assert ("special_string_8_2", internal.is_special_type (({attached SPECIAL [STRING_8]}).type_id))
			assert ("special_integer_16", internal.is_special_type (({detachable SPECIAL [INTEGER_16]}).type_id))
			assert ("special_integer_16_2", internal.is_special_type (({attached SPECIAL [INTEGER_16]}).type_id))
			assert_false ("string_8", internal.is_special_type (({STRING_8}).type_id))
			assert_false ("integer_16", internal.is_special_type (({INTEGER_16}).type_id))
		end

	test_is_special
			-- Test feature 'is_special'.
		local
			internal: INTERNAL
			sp_string_8: SPECIAL [STRING_8]
			sp_integer_16: SPECIAL [INTEGER_16]
			s: STRING_8
			i: INTEGER_16
		do
			create internal
			create sp_string_8.make_filled ("gobo", 0)
			create sp_integer_16.make_filled (17, 0)
			s := "gobo"
			assert ("special_string_8", internal.is_special (sp_string_8))
			assert ("special_integer_16", internal.is_special (sp_integer_16))
			assert_false ("string_8", internal.is_special (s))
			assert_false ("integer_16", internal.is_special (i))
		end

	test_is_tuple
			-- Test feature 'is_tuple'.
		local
			internal: INTERNAL
			t: TUPLE
			t_string_8: TUPLE [STRING_8]
			t_integer_16: TUPLE [INTEGER_16]
			s: STRING_8
			i: INTEGER_16
		do
			create internal
			t := []
			s := "gobo"
			t_string_8 := [s]
			t_integer_16 := [i]
			assert ("tuple", internal.is_tuple (t))
			assert ("tuple_string_8", internal.is_tuple (t_string_8))
			assert ("tuple_integer_16", internal.is_tuple (t_integer_16))
			assert_false ("string_8", internal.is_tuple (s))
			assert_false ("integer_16", internal.is_tuple (i))
		end

	test_is_tuple_type
			-- Test feature 'is_tuple_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert ("tuple", internal.is_tuple_type (({detachable TUPLE}).type_id))
			assert ("tuple_2", internal.is_tuple_type (({attached TUPLE}).type_id))
			assert ("tuple_string_8", internal.is_tuple_type (({detachable TUPLE [STRING_8]}).type_id))
			assert ("tuple_string_8_2", internal.is_tuple_type (({attached TUPLE [STRING_8]}).type_id))
			assert ("tuple_integer_16", internal.is_tuple_type (({detachable TUPLE [INTEGER_16]}).type_id))
			assert ("tuple_integer_16_2", internal.is_tuple_type (({attached TUPLE [INTEGER_16]}).type_id))
			assert_false ("string_8", internal.is_tuple_type (({STRING_8}).type_id))
			assert_false ("integer_16", internal.is_tuple_type (({INTEGER_16}).type_id))
		end

	test_class_name
			-- Test feature 'class_name'.
		local
			internal: INTERNAL
			s: STRING_8
			i: INTEGER_16
			arr: ARRAY [ANY]
		do
			create internal
			s := "gobo"
			create arr.make_filled ("", 1, 5)
			assert_strings_equal ("string_8", "STRING_8", internal.class_name (s))
			assert_strings_equal ("integer_16", "INTEGER_16", internal.class_name (i))
			assert_strings_equal ("array", "ARRAY", internal.class_name (arr))
		end

	test_class_name_of_type
			-- Test feature 'class_name_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_strings_equal ("string_8", "STRING_8", internal.class_name_of_type (({STRING_8}).type_id))
			assert_strings_equal ("integer_16", "INTEGER_16", internal.class_name_of_type (({INTEGER_16}).type_id))
			assert_strings_equal ("array", "ARRAY", internal.class_name_of_type (({ARRAY [ANY]}).type_id))
		end

	test_type_name
			-- Test feature 'type_name'.
		obsolete
			"INTERNAL.typename is obsolete in ISE 19.08.10.3505 [2019-10-02]"
		local
			internal: INTERNAL
			s: STRING_8
			i: INTEGER_16
			arr: ARRAY [ANY]
		do
			create internal
			s := "gobo"
			create arr.make_filled ("", 1, 5)
			assert_strings_equal ("string_8", "STRING_8", internal.type_name (s))
			assert_strings_equal ("integer_16", "INTEGER_16", internal.type_name (i))
			if is_void_safe_mode then
				assert_strings_equal ("array_any", "ARRAY [!ANY]", internal.type_name (arr))
			else
				assert_strings_equal ("array_any", "ARRAY [ANY]", internal.type_name (arr))
			end
		end

	test_type_name_of_type
			-- Test feature 'type_name_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			if is_void_safe_mode then
				assert_strings_equal ("string_8", "!STRING_8", internal.type_name_of_type (({STRING_8}).type_id))
				assert_strings_equal ("array_any", "!ARRAY [!ANY]", internal.type_name_of_type (({ARRAY [ANY]}).type_id))
			else
				assert_strings_equal ("string_8", "STRING_8", internal.type_name_of_type (({STRING_8}).type_id))
				assert_strings_equal ("array_any", "ARRAY [ANY]", internal.type_name_of_type (({ARRAY [ANY]}).type_id))
			end
			assert_strings_equal ("integer_16", "INTEGER_16", internal.type_name_of_type (({INTEGER_16}).type_id))
		end

	test_dynamic_type
			-- Test feature 'dynamic_type'.
		local
			internal: INTERNAL
			s: STRING_8
			i: INTEGER_16
			arr: ARRAY [ANY]
		do
			create internal
			s := "gobo"
			create arr.make_filled ("", 1, 5)
			assert_integers_equal ("string_8", ({detachable STRING_8}).type_id, internal.dynamic_type (s))
			assert_integers_equal ("integer_16", ({INTEGER_16}).type_id, internal.dynamic_type (i))
			assert_integers_equal ("array_any", ({detachable ARRAY [ANY]}).type_id, internal.dynamic_type (arr))
		end

	test_field_name
			-- Test feature 'field_name'.
		local
			internal: INTERNAL
			s: STRING_8
		do
			create internal
			s := "gobo"
			assert_strings_equal ("integer_8_1", "integer_8_1", internal.field_name (field_index ("integer_8_1", Current), Current))
			assert_strings_equal ("count", "count", internal.field_name (field_index ("count", s), s))
		end

	test_field_name_of_type
			-- Test feature 'field_name_of_type'.
		local
			internal: INTERNAL
			s: STRING_8
		do
			create internal
			s := "gobo"
			assert_strings_equal ("string_8_1", "string_8_1", internal.field_name_of_type (field_index ("string_8_1", Current), ({like Current}).type_id))
			assert_strings_equal ("count", "count", internal.field_name_of_type (field_index ("count", s), ({STRING_8}).type_id))
		end

	test_field_type
			-- Test feature 'field_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_integers_equal ("boolean", {INTERNAL}.boolean_type, internal.field_type (field_index ("boolean_1", Current), Current))
			assert_integers_equal ("character_8", {INTERNAL}.character_8_type, internal.field_type (field_index ("character_8_1", Current), Current))
			assert_integers_equal ("character_32", {INTERNAL}.character_32_type, internal.field_type (field_index ("character_32_1", Current), Current))
			assert_integers_equal ("integer_8", {INTERNAL}.integer_8_type, internal.field_type (field_index ("integer_8_1", Current), Current))
			assert_integers_equal ("integer_16", {INTERNAL}.integer_16_type, internal.field_type (field_index ("integer_16_1", Current), Current))
			assert_integers_equal ("integer_32", {INTERNAL}.integer_32_type, internal.field_type (field_index ("integer_32_1", Current), Current))
			assert_integers_equal ("integer_64", {INTERNAL}.integer_64_type, internal.field_type (field_index ("integer_64_1", Current), Current))
			assert_integers_equal ("natural_8", {INTERNAL}.natural_8_type, internal.field_type (field_index ("natural_8_1", Current), Current))
			assert_integers_equal ("natural_16", {INTERNAL}.natural_16_type, internal.field_type (field_index ("natural_16_1", Current), Current))
			assert_integers_equal ("natural_32", {INTERNAL}.natural_32_type, internal.field_type (field_index ("natural_32_1", Current), Current))
			assert_integers_equal ("natural_64", {INTERNAL}.natural_64_type, internal.field_type (field_index ("natural_64_1", Current), Current))
			assert_integers_equal ("pointer", {INTERNAL}.pointer_type, internal.field_type (field_index ("pointer_1", Current), Current))
			assert_integers_equal ("real_32", {INTERNAL}.real_32_type, internal.field_type (field_index ("real_32_1", Current), Current))
			assert_integers_equal ("real_64", {INTERNAL}.real_64_type, internal.field_type (field_index ("real_64_1", Current), Current))
			assert_integers_equal ("string_8", {INTERNAL}.reference_type, internal.field_type (field_index ("string_8_1", Current), Current))
			assert_integers_equal ("any", {INTERNAL}.reference_type, internal.field_type (field_index ("any_1", Current), Current))
		end

	test_field_type_of_type
			-- Test feature 'field_type_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_integers_equal ("boolean", {INTERNAL}.boolean_type, internal.field_type_of_type (field_index ("boolean_1", Current), ({like Current}).type_id))
			assert_integers_equal ("character_8", {INTERNAL}.character_8_type, internal.field_type_of_type (field_index ("character_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("character_32", {INTERNAL}.character_32_type, internal.field_type_of_type (field_index ("character_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_8", {INTERNAL}.integer_8_type, internal.field_type_of_type (field_index ("integer_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_16", {INTERNAL}.integer_16_type, internal.field_type_of_type (field_index ("integer_16_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_32", {INTERNAL}.integer_32_type, internal.field_type_of_type (field_index ("integer_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_64", {INTERNAL}.integer_64_type, internal.field_type_of_type (field_index ("integer_64_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_8", {INTERNAL}.natural_8_type, internal.field_type_of_type (field_index ("natural_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_16", {INTERNAL}.natural_16_type, internal.field_type_of_type (field_index ("natural_16_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_32", {INTERNAL}.natural_32_type, internal.field_type_of_type (field_index ("natural_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_64", {INTERNAL}.natural_64_type, internal.field_type_of_type (field_index ("natural_64_1", Current), ({like Current}).type_id))
			assert_integers_equal ("pointer", {INTERNAL}.pointer_type, internal.field_type_of_type (field_index ("pointer_1", Current), ({like Current}).type_id))
			assert_integers_equal ("real_32", {INTERNAL}.real_32_type, internal.field_type_of_type (field_index ("real_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("real_64", {INTERNAL}.real_64_type, internal.field_type_of_type (field_index ("real_64_1", Current), ({like Current}).type_id))
			assert_integers_equal ("string_8", {INTERNAL}.reference_type, internal.field_type_of_type (field_index ("string_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("any", {INTERNAL}.reference_type, internal.field_type_of_type (field_index ("any_1", Current), ({like Current}).type_id))
		end

	test_field_static_type_of_type
			-- Test feature 'field_static_type_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_integers_equal ("boolean", ({BOOLEAN}).type_id, internal.field_static_type_of_type (field_index ("boolean_1", Current), ({like Current}).type_id))
			assert_integers_equal ("character_8", ({CHARACTER_8}).type_id, internal.field_static_type_of_type (field_index ("character_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("character_32", ({CHARACTER_32}).type_id, internal.field_static_type_of_type (field_index ("character_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_8", ({INTEGER_8}).type_id, internal.field_static_type_of_type (field_index ("integer_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_16", ({INTEGER_16}).type_id, internal.field_static_type_of_type (field_index ("integer_16_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_32", ({INTEGER_32}).type_id, internal.field_static_type_of_type (field_index ("integer_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("integer_64", ({INTEGER_64}).type_id, internal.field_static_type_of_type (field_index ("integer_64_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_8", ({NATURAL_8}).type_id, internal.field_static_type_of_type (field_index ("natural_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_16", ({NATURAL_16}).type_id, internal.field_static_type_of_type (field_index ("natural_16_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_32", ({NATURAL_32}).type_id, internal.field_static_type_of_type (field_index ("natural_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("natural_64", ({NATURAL_64}).type_id, internal.field_static_type_of_type (field_index ("natural_64_1", Current), ({like Current}).type_id))
			assert_integers_equal ("pointer", ({POINTER}).type_id, internal.field_static_type_of_type (field_index ("pointer_1", Current), ({like Current}).type_id))
			assert_integers_equal ("real_32", ({REAL_32}).type_id, internal.field_static_type_of_type (field_index ("real_32_1", Current), ({like Current}).type_id))
			assert_integers_equal ("real_64", ({REAL_64}).type_id, internal.field_static_type_of_type (field_index ("real_64_1", Current), ({like Current}).type_id))
			assert_integers_equal ("string_8", ({detachable STRING_8}).type_id, internal.field_static_type_of_type (field_index ("string_8_1", Current), ({like Current}).type_id))
			assert_integers_equal ("any", ({detachable ANY}).type_id, internal.field_static_type_of_type (field_index ("any_1", Current), ({like Current}).type_id))
		end

	test_field
			-- Test feature 'field'.
		local
			internal: INTERNAL
			c8: CHARACTER_8
			c32: CHARACTER_32
			p: POINTER
			s: STRING_8
			arr: ARRAY [ANY]
		do
			create internal
			boolean_1 := True
			assert_equal ("true", True, internal.field (field_index ("boolean_1", Current), Current))
			boolean_1 := False
			assert_equal ("false", False, internal.field (field_index ("boolean_1", Current), Current))
			character_8_1 := 'g'
			c8 := 'g'
			assert_equal ("character_8", c8, internal.field (field_index ("character_8_1", Current), Current))
			character_32_1 := 'o'
			c32 := 'o'
			assert_equal ("character_32", c32, internal.field (field_index ("character_32_1", Current), Current))
			integer_8_1 := 8
			assert_equal ("integer_8", {INTEGER_8} 8, internal.field (field_index ("integer_8_1", Current), Current))
			integer_16_1 := 16
			assert_equal ("integer_16", {INTEGER_16} 16, internal.field (field_index ("integer_16_1", Current), Current))
			integer_32_1 := 32
			assert_equal ("integer_32", {INTEGER_32} 32, internal.field (field_index ("integer_32_1", Current), Current))
			integer_64_1 := 64
			assert_equal ("integer_64", {INTEGER_64} 64, internal.field (field_index ("integer_64_1", Current), Current))
			natural_8_1 := 8
			assert_equal ("natural_8", {NATURAL_8} 8, internal.field (field_index ("natural_8_1", Current), Current))
			natural_16_1 := 16
			assert_equal ("natural_16", {NATURAL_16} 16, internal.field (field_index ("natural_16_1", Current), Current))
			natural_32_1 := 32
			assert_equal ("natural_32", {NATURAL_32} 32, internal.field (field_index ("natural_32_1", Current), Current))
			natural_64_1 := 64
			assert_equal ("natural_64", {NATURAL_64} 64, internal.field (field_index ("natural_64_1", Current), Current))
			p := $test_field
			pointer_1 := p
			assert_equal ("pointer", p, internal.field (field_index ("pointer_1", Current), Current))
			real_32_1 := {REAL_32} 32.0
			assert_equal ("real_32", {REAL_32} 32.0, internal.field (field_index ("real_32_1", Current), Current))
			real_64_1 := 64.0
			assert_equal ("real_64", {REAL_64} 64.0, internal.field (field_index ("real_64_1", Current), Current))
			s := "foo"
			string_8_1 := s
			assert_same ("string_8_1", s, internal.field (field_index ("string_8_1", Current), Current))
			create arr.make_filled ("", 1, 4)
			any_1 := arr
			assert_same ("any_1", arr, internal.field (field_index ("any_1", Current), Current))
		end

	test_boolean_field
			-- Test feature 'boolean_field'.
		local
			internal: INTERNAL
		do
			create internal
			boolean_1 := True
			assert ("true", internal.boolean_field (field_index ("boolean_1", Current), Current) = True)
			boolean_1 := False
			assert ("false", internal.boolean_field (field_index ("boolean_1", Current), Current) = False)
		end

	test_character_8_field
			-- Test feature 'character_8_field'.
		local
			internal: INTERNAL
		do
			create internal
			character_8_1 := 'a'
			assert ("character_8", internal.character_8_field (field_index ("character_8_1", Current), Current) = 'a')
		end

	test_character_32_field
			-- Test feature 'character_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			character_32_1 := 'b'
			assert ("character_32", internal.character_32_field (field_index ("character_32_1", Current), Current) = 'b')
		end

	test_integer_8_field
			-- Test feature 'integer_8_field'.
		local
			internal: INTERNAL
		do
			create internal
			integer_8_1 := 9
			assert ("integer_8", internal.integer_8_field (field_index ("integer_8_1", Current), Current) = 9)
		end

	test_integer_16_field
			-- Test feature 'integer_16_field'.
		local
			internal: INTERNAL
		do
			create internal
			integer_16_1 := 17
			assert ("integer_16", internal.integer_16_field (field_index ("integer_16_1", Current), Current) = 17)
		end

	test_integer_32_field
			-- Test feature 'integer_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			integer_32_1 := 33
			assert ("integer_32", internal.integer_32_field (field_index ("integer_32_1", Current), Current) = 33)
		end

	test_integer_64_field
			-- Test feature 'integer_64_field'.
		local
			internal: INTERNAL
		do
			create internal
			integer_64_1 := 65
			assert ("integer_64", internal.integer_64_field (field_index ("integer_64_1", Current), Current) = 65)
		end

	test_natural_8_field
			-- Test feature 'natural_8_field'.
		local
			internal: INTERNAL
		do
			create internal
			natural_8_1 := 9
			assert ("natural_8", internal.natural_8_field (field_index ("natural_8_1", Current), Current) = 9)
		end

	test_natural_16_field
			-- Test feature 'natural_16_field'.
		local
			internal: INTERNAL
		do
			create internal
			natural_16_1 := 17
			assert ("natural_16", internal.natural_16_field (field_index ("natural_16_1", Current), Current) = 17)
		end

	test_natural_32_field
			-- Test feature 'natural_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			natural_32_1 := 33
			assert ("natural_32", internal.natural_32_field (field_index ("natural_32_1", Current), Current) = 33)
		end

	test_natural_64_field
			-- Test feature 'natural_64_field'.
		local
			internal: INTERNAL
		do
			create internal
			natural_64_1 := 65
			assert ("natural_64", internal.natural_64_field (field_index ("natural_64_1", Current), Current) = 65)
		end

	test_pointer_field
			-- Test feature 'pointer_field'.
		local
			internal: INTERNAL
			p: POINTER
		do
			create internal
			p := $test_pointer_field
			pointer_1 := p
			assert ("pointer", internal.pointer_field (field_index ("pointer_1", Current), Current) = p)
		end

	test_real_32_field
			-- Test feature 'real_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			real_32_1 := {REAL_32} 33.0
			assert ("real_32", internal.real_32_field (field_index ("real_32_1", Current), Current) = {REAL_32} 33.0)
		end

	test_real_64_field
			-- Test feature 'real_64_field'.
		local
			internal: INTERNAL
		do
			create internal
			real_64_1 := 65.0
			assert ("real_64", internal.real_64_field (field_index ("real_64_1", Current), Current) = 65.0)
		end

	test_set_boolean_field
			-- Test feature 'set_boolean_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_boolean_field (field_index ("boolean_1", Current), Current, True)
			assert ("true", boolean_1 = True)
			internal.set_boolean_field (field_index ("boolean_1", Current), Current, False)
			assert ("false", boolean_1 = False)
		end

	test_set_character_8_field
			-- Test feature 'set_character_8_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_character_8_field (field_index ("character_8_1", Current), Current, 'x')
			assert ("character_8", character_8_1 = 'x')
		end

	test_set_character_32_field
			-- Test feature 'set_character_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_character_32_field (field_index ("character_32_1", Current), Current, 'y')
			assert ("character_32", character_32_1 = 'y')
		end

	test_set_integer_8_field
			-- Test feature 'set_integer_8_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_integer_8_field (field_index ("integer_8_1", Current), Current, 10)
			assert ("integer_8", integer_8_1 = 10)
		end

	test_set_integer_16_field
			-- Test feature 'set_integer_16_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_integer_16_field (field_index ("integer_16_1", Current), Current, 18)
			assert ("integer_16", integer_16_1 = 18)
		end

	test_set_integer_32_field
			-- Test feature 'set_integer_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_integer_32_field (field_index ("integer_32_1", Current), Current, 34)
			assert ("integer_32", integer_32_1 = 34)
		end

	test_set_integer_64_field
			-- Test feature 'set_integer_64_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_integer_64_field (field_index ("integer_64_1", Current), Current, 66)
			assert ("integer_64", integer_64_1 = 66)
		end

	test_set_natural_8_field
			-- Test feature 'set_natural_8_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_natural_8_field (field_index ("natural_8_1", Current), Current, 10)
			assert ("natural_8", natural_8_1 = 10)
		end

	test_set_natural_16_field
			-- Test feature 'set_natural_16_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_natural_16_field (field_index ("natural_16_1", Current), Current, 18)
			assert ("natural_16", natural_16_1 = 18)
		end

	test_set_natural_32_field
			-- Test feature 'set_natural_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_natural_32_field (field_index ("natural_32_1", Current), Current, 34)
			assert ("natural_32", natural_32_1 = 34)
		end

	test_set_natural_64_field
			-- Test feature 'set_natural_64_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_natural_64_field (field_index ("natural_64_1", Current), Current, 66)
			assert ("natural_64", natural_64_1 = 66)
		end

	test_set_pointer_field
			-- Test feature 'set_pointer_field'.
		local
			internal: INTERNAL
			p: POINTER
		do
			create internal
			p := $test_set_pointer_field
			internal.set_pointer_field (field_index ("pointer_1", Current), Current, p)
			assert ("pointer", pointer_1 = p)
		end

	test_set_real_32_field
			-- Test feature 'set_real_32_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_real_32_field (field_index ("real_32_1", Current), Current, {REAL_32} 34.0)
			assert ("real_32", real_32_1 = {REAL_32} 34.0)
		end

	test_set_real_64_field
			-- Test feature 'set_real_64_field'.
		local
			internal: INTERNAL
		do
			create internal
			internal.set_real_64_field (field_index ("real_64_1", Current), Current, 66.0)
			assert ("real_64", real_64_1 = 66.0)
		end

	test_set_reference_field
			-- Test feature 'set_reference_field'.
		local
			internal: INTERNAL
			s: STRING_8
			arr: ARRAY [ANY]
		do
			create internal
			s := "gobo"
			internal.set_reference_field (field_index ("string_8_1", Current), Current, s)
			assert ("string_8_1", string_8_1 = s)
			create arr.make_filled ("", 1, 3)
			internal.set_reference_field (field_index ("any_1", Current), Current, arr)
			assert ("any_1", any_1 = arr)
		end

	test_generic_count
			-- Test feature 'generic_count'.
		local
			internal: INTERNAL
			s: STRING_8
			arr: ARRAY [ANY]
		do
			create internal
			s := "gobo"
			assert_integers_equal ("string_8", 0, internal.generic_count (s))
			create arr.make_filled ("", 1, 3)
			assert_integers_equal ("array", 1, internal.generic_count (arr))
		end

	test_generic_count_of_type
			-- Test feature 'generic_count_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_integers_equal ("string_8", 0, internal.generic_count_of_type (({STRING_8}).type_id))
			assert_integers_equal ("array", 1, internal.generic_count_of_type (({ARRAY [ANY]}).type_id))
		end

	test_generic_dynamic_type
			-- Test feature 'generic_dynamic_type'.
		local
			internal: INTERNAL
			arr_s: ARRAY [STRING_8]
			arr_i: ARRAY [INTEGER_16]
		do
			create internal
			create arr_s.make_filled ("", 1, 3)
			assert_integers_equal ("string_8", ({STRING_8}).type_id, internal.generic_dynamic_type (arr_s, 1))
			create arr_i.make_filled (0, 1, 3)
			assert_integers_equal ("integer_16", ({INTEGER_16}).type_id, internal.generic_dynamic_type (arr_i, 1))
		end

	test_generic_dynamic_type_of_type
			-- Test feature 'generic_dynamic_type_of_type'.
		local
			internal: INTERNAL
		do
			create internal
			assert_integers_equal ("string_8", ({STRING_8}).type_id, internal.generic_dynamic_type_of_type (({ARRAY [STRING_8]}).type_id, 1))
			assert_integers_equal ("integer_16", ({INTEGER_16}).type_id, internal.generic_dynamic_type_of_type (({ARRAY [INTEGER_16]}).type_id, 1))
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

	is_void_safe_mode: BOOLEAN
			-- Is current test compiled in void-safe mode?
		once
			Result := {attached STRING_8} /~ {detachable STRING_8}
		end

end
