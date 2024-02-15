note

	description:

		"Test features of class TYPE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2016-2019, Eric Bezault and others"
	license: "MIT License"

class TEST_TYPE

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

create

	make_default

feature -- Test

	test_is_deferred
			-- Test feature 'is_deferred'.
		do
			assert_true ("deferred", ({COMPARABLE}).is_deferred)
			assert_false ("not_deferred", ({STRING_8}).is_deferred)
		end

	test_is_expanded
			-- Test feature 'is_expanded'.
		do
			assert_true ("basic_expanded", ({INTEGER_8}).is_expanded)
			assert_true ("non_basic_expanded", ({UTF_CONVERTER}).is_expanded)
			if not eiffel_compiler.is_ise then
					-- Crashing with ISE 16.05.9.9057:
				assert_true ("non_basic_generic_expanded", ({TYPED_POINTER [ANY]}).is_expanded)
			end
			assert_false ("reference", ({STRING_8}).is_expanded)
			assert_false ("none", ({NONE}).is_expanded)
		end

	test_is_attached
			-- Test feature 'is_attached'.
		do
			if is_void_safe_mode then
				assert_true ("attached_void_safe", ({attached STRING_8}).is_attached)
					-- Type "NONE" is considered attached in void-safe mode!
				assert_true ("none_void_safe", ({NONE}).is_attached)
			else
				assert_false ("attached_non_void_safe", ({attached STRING_8}).is_attached)
				assert_false ("none_non_void_safe", ({NONE}).is_attached)
			end
			assert_false ("detachable_string_8", ({detachable STRING_8}).is_attached)
			assert_false ("detachable_none", ({detachable NONE}).is_attached)
				-- Expanded types are considered as attached
				-- even in non-void-safe mode.
			assert_true ("basic_expanded", ({INTEGER_32}).is_attached)
			assert_true ("attached_basic_expanded", ({attached INTEGER_32}).is_attached)
			assert_true ("detachable_basic_expanded", ({detachable INTEGER_32}).is_attached)
			assert_true ("non_basic_expanded", ({UTF_CONVERTER}).is_attached)
			assert_true ("attached_non_basic_expanded", ({attached UTF_CONVERTER}).is_attached)
			assert_true ("detachable_non_basic_expanded", ({detachable UTF_CONVERTER}).is_attached)
			if not eiffel_compiler.is_ise then
					-- Crashing with ISE 16.05.9.9057:
				assert_true ("non_basic_generic_expanded", ({TYPED_POINTER [ANY]}).is_attached)
				assert_true ("attached_non_basic_generic_expanded", ({attached TYPED_POINTER [ANY]}).is_attached)
				assert_true ("detachable_non_basic_generic_expanded", ({detachable TYPED_POINTER [ANY]}).is_attached)
			end
		end

	test_type_id
			-- Test feature 'type_id'.
		do
			if is_void_safe_mode then
				assert_false ("same_type_id_void_safe", ({attached STRING_8}).type_id = ({detachable STRING_8}).type_id)
			else
				assert_true ("same_type_id_non_void_safe", ({attached STRING_8}).type_id = ({detachable STRING_8}).type_id)
			end
			assert_true ("same_type_index", ({attached STRING_8}).type_id.as_integer_16 = ({detachable STRING_8}).type_id.as_integer_16)
		end

	test_generic_parameter_count
			-- Test feature 'generic_parameter_count'.
		do
			assert_integers_equal ("any", 0, ({ANY}).generic_parameter_count)
			assert_integers_equal ("integer_32", 0, ({INTEGER_32}).generic_parameter_count)
			assert_integers_equal ("none", 0, ({INTEGER_32}).generic_parameter_count)
			assert_integers_equal ("special", 1, ({SPECIAL [ANY]}).generic_parameter_count)
			assert_integers_equal ("array", 1, ({ARRAY [BOOLEAN]}).generic_parameter_count)
			assert_integers_equal ("hash_table", 2, ({HASH_TABLE [STRING, STRING]}).generic_parameter_count)
			if not eiffel_compiler.is_ise then
					-- Crashing with ISE 16.05.9.9057:
				assert_integers_equal ("typed_pointer", 1, ({TYPED_POINTER [BOOLEAN]}).generic_parameter_count)
			end
		end

	test_generic_parameter_type
			-- Test feature 'generic_parameter_type'.
		do
			assert_same ("special", {ANY}, ({SPECIAL [ANY]}).generic_parameter_type (1))
			assert_same ("array", {BOOLEAN}, ({ARRAY [BOOLEAN]}).generic_parameter_type (1))
			assert_same ("hash_table", {HASHABLE}, ({HASH_TABLE [STRING, HASHABLE]}).generic_parameter_type (2))
			if not eiffel_compiler.is_ise then
					-- Crashing with ISE 16.05.9.9057:
				assert_same ("typed_pointer", {INTEGER_16}, ({TYPED_POINTER [INTEGER_16]}).generic_parameter_type (1))
			end
		end

	test_has_default
			-- Test feature 'has_default'.
		do
			assert_true ("detachable_string_8", ({detachable STRING_8}).has_default)
			assert_true ("detachable_none", ({detachable NONE}).has_default)
			assert_true ("basic_expanded", ({INTEGER_32}).has_default)
			assert_true ("non_basic_expanded", ({UTF_CONVERTER}).has_default)
			assert_true ("bb_detachable_string_8", (create {BB [detachable STRING_8]}).has_default)
			if not eiffel_compiler.is_ise then
					-- Crashing with ISE 16.05.9.9057:
				assert_true ("non_basic_generic_expanded", ({TYPED_POINTER [ANY]}).has_default)
			end
			if is_void_safe_mode then
				assert_false ("attached_string_8_void_safe", ({attached STRING_8}).has_default)
				assert_false ("attached_none_void_safe", ({attached NONE}).has_default)
				assert_false ("bb_attached_string_8_void_safe", (create {BB [attached STRING_8]}).has_default)
			else
				assert_true ("attached_string_8_non_void_safe", ({attached STRING_8}).has_default)
				assert_true ("attached_none_non_void_safe", ({attached NONE}).has_default)
				assert_true ("bb_attached_string_8_non_void_safe", (create {BB [attached STRING_8]}).has_default)
			end
		end

	test_default
			-- Test feature 'default'.
		do
			assert_same ("detachable_string_8", Void, ({detachable STRING_8}).default)
			assert_integers_equal ("integer_32", 0, ({INTEGER_32}).default)
			if not is_void_safe_mode then
				assert_same ("attached_string_8_non_void_safe", Void, ({attached STRING_8}).default)
			end
		end

	test_name
			-- Test feature 'name'.
		do
			if is_void_safe_mode then
				assert_strings_equal ("attached_string_8_void_safe", "!STRING_8", ({attached STRING_8}).name.to_string_8)
				assert_strings_equal ("attached_array_attached_any_void_safe", "!ARRAY [!ANY]", ({attached ARRAY [attached ANY]}).name.to_string_8)
				assert_strings_equal ("attached_array_detachable_any_void_safe", "!ARRAY [ANY]", ({attached ARRAY [detachable ANY]}).name.to_string_8)
				assert_strings_equal ("attached_none_void_safe", "!NONE", ({attached NONE}).name.to_string_8)
			else
				assert_strings_equal ("attached_string_8_non_void_safe", "STRING_8", ({attached STRING_8}).name.to_string_8)
				assert_strings_equal ("attached_array_attached_any_non_void_safe", "ARRAY [ANY]", ({attached ARRAY [attached ANY]}).name.to_string_8)
				assert_strings_equal ("attached_array_detachable_any_non_void_safe", "ARRAY [ANY]", ({attached ARRAY [detachable ANY]}).name.to_string_8)
				assert_strings_equal ("attached_none_non_void_safe", "NONE", ({attached NONE}).name.to_string_8)
			end
			assert_strings_equal ("detachable_string_8", "STRING_8", ({detachable STRING_8}).name.to_string_8)
			assert_strings_equal ("detachable_array_detachable_any", "ARRAY [ANY]", ({detachable ARRAY [detachable ANY]}).name.to_string_8)
			assert_strings_equal ("integer_16", "INTEGER_16", ({INTEGER_16}).name.to_string_8)
			assert_strings_equal ("detachable_none", "NONE", ({detachable NONE}).name.to_string_8)
		end

	test_twin
			-- Test feature 'twin'.
		do
			if not eiffel_compiler.is_ise then
				assert_same ("same_type_object", {ANY}, ({ANY}).twin)
			else
				assert_equal ("type_object_equal", {ANY}, ({ANY}).twin)
			end
		end

	test_expanded
			-- Test expanded types.
		do
			assert_same ("basic_expanded_detachable", {INTEGER_16}, {detachable INTEGER_16})
			assert_same ("basic_expanded_attached", {INTEGER_16}, {attached INTEGER_16})
			if not eiffel_compiler.is_ise then
				assert_same ("non_basic_expanded_detachable", {UTF_CONVERTER}, {detachable UTF_CONVERTER})
				assert_same ("non_basic_expanded_attached", {UTF_CONVERTER}, {attached UTF_CONVERTER})
				assert_same ("non_basic_generic_expanded_detachable", {TYPED_POINTER [ANY]}, {detachable TYPED_POINTER [ANY]})
				assert_same ("non_basic_generic_expanded_attached", {TYPED_POINTER [ANY]}, {attached TYPED_POINTER [ANY]})
			end
		end

	test_none
			-- Test "NONE" type.
		do
			if is_void_safe_mode then
					-- Type "NONE" is considered attached in void-safe mode!
				assert_same ("none_attached_void_safe", {attached NONE}, {NONE})
				assert_not_same ("none_detachable_void_safe", {detachable NONE}, {NONE})
			else
				assert_same ("none_attached_non_void_safe", {attached NONE}, {NONE})
				assert_same ("none_detachable_non_void_safe", {detachable NONE}, {NONE})
			end
		end

	test_is_attached_by_default
			-- Test compilation mode "is_attached_by_default".
		do
			if is_void_safe_mode then
					-- We expect the test to be compiled with "is_attached_by_default" mode.
				assert_same ("attached_by_default_void_safe", {attached STRING_8}, {STRING_8})
				assert_not_same ("detachable_void_safe", {detachable STRING_8}, {STRING_8})
			else
				assert_same ("attached_non_void_safe", {attached STRING_8}, {STRING_8})
				assert_same ("detachable_by_default_non_void_safe", {detachable STRING_8}, {STRING_8})
			end
		end

feature {NONE} -- Implementation

	is_void_safe_mode: BOOLEAN
			-- Is current test compiled in void-safe mode?
		once
			Result := {attached STRING_8} /~ {detachable STRING_8}
		end

end
