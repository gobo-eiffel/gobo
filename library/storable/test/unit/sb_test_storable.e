note

	description:

		"Test features of class STORABLE"

	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_TEST_STORABLE

inherit

	SB_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER

create

	make_default

feature -- Test

	test_independent_store
			-- Test feature `independent_store'.
		local
			l_object: SB_DATA_1
			l_filename: STRING
			l_file: RAW_FILE
			l_retrieved: detachable ANY
		do
			create l_object
			check_values (l_object)
			l_filename := new_filename ("gobo", ".tmp")
			create l_file.make_with_name (l_filename)
			l_file.open_write
			l_file.independent_store (l_object)
			l_file.close
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_1} l_retrieved as l_retrieved_object then
				check_values (l_retrieved_object)
			else
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_1_ge
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by Gobo Eiffel.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_1_ge_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_1} l_retrieved as l_object then
				check_values (l_object)
			else
				print (l_retrieved)
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_1_workbench_ise
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by ISE Eiffel in workbench mode.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_1_workbench_ise_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_1} l_retrieved as l_object then
				check_values (l_object)
			else
				assert ("is_retrieved", False)
			end
		end

	test_retrieved_1_finalized_ise
			-- Test feature `retrieved' with a Storable file stored by
			-- system compiled by ISE Eiffel in finalized mode.
		local
			l_retrieved: detachable ANY
			l_filename: STRING
			l_file: RAW_FILE
		do
			l_filename := Execution_environment.interpreted_string (storable_1_finalized_ise_filename)
			create l_file.make_with_name (l_filename)
			l_file.open_read
			l_retrieved := l_file.retrieved
			l_file.close
			if attached {SB_DATA_1} l_retrieved as l_object then
				check_values (l_object)
			else
				assert ("is_retrieved", False)
			end
		end

feature {NONE} -- Implementation

	check_values (a_object: SB_DATA_1)
			-- Check that the attributes of `a_object' have the expected values.
		do
			assert ("int_32", a_object.int_32 = 32)
			assert ("int_8", a_object.int_8 = 8)
			assert ("int_16", a_object.int_16 = 16)
			assert ("int_64", a_object.int_64 = 64)
			assert ("nat_8", a_object.nat_8 = 8)
			assert ("nat_16", a_object.nat_16 = 16)
			assert ("nat_32", a_object.nat_32 = 32)
			assert ("nat_64", a_object.nat_64 = 64)
			assert ("char_8", a_object.char_8 = 'c')
			assert ("char_32", a_object.char_32 = 'd')
			assert ("bool", a_object.bool = True)
			assert ("real_32", a_object.real_32 = 32.57)
			assert ("real_64", a_object.real_64 = 64.57)
			assert ("pointer", a_object.pointer = default_pointer)
			assert ("ref", attached {STRING} a_object.ref as l_ref and then l_ref.is_equal ("toto"))
			assert ("none", a_object.none = Void)
			assert ("exp", a_object.exp.int = 123)
			assert ("gen", a_object.gen.attr = 3)
			assert ("gen_gen", a_object.gen_gen.attr.attr = 6)
			assert ("int_32_ref", attached {INTEGER_32} a_object.int_32_ref as l_int_32 and then l_int_32 = 32)
			assert ("int_8_ref", attached {INTEGER_8} a_object.int_8_ref as l_int_8 and then l_int_8 = 8)
			assert ("int_16_ref", attached {INTEGER_16} a_object.int_16_ref as l_int_16 and then l_int_16 = 16)
			assert ("int_64_ref", attached {INTEGER_64} a_object.int_64_ref as l_int_64 and then l_int_64 = 64)
			assert ("nat_8_ref", attached {NATURAL_8} a_object.nat_8_ref as l_nat_8 and then l_nat_8 = 8)
			assert ("nat_16_ref", attached {NATURAL_16} a_object.nat_16_ref as l_nat_16 and then l_nat_16 = 16)
			assert ("nat_32_ref", attached {NATURAL_32} a_object.nat_32_ref as l_nat_32 and then l_nat_32 = 32)
			assert ("nat_64_ref", attached {NATURAL_64} a_object.nat_64_ref as l_nat_64 and then l_nat_64 = 64)
			assert ("char_8_ref", attached {CHARACTER_8} a_object.char_8_ref as l_char_8 and then l_char_8 = 'c')
			assert ("char_32_ref", attached {CHARACTER_32} a_object.char_32_ref as l_char_32 and then l_char_32 = 'd')
			assert ("bool_ref", attached {BOOLEAN} a_object.bool_ref as l_bool and then l_bool = True)
			assert ("real_32_ref", attached {REAL_32} a_object.real_32_ref as l_real_32 and then l_real_32 = 32.57)
			assert ("real_64_ref", attached {REAL_64} a_object.real_64_ref as l_real_64 and then l_real_64 = 64.57)
			assert ("pointer_ref", attached {POINTER} a_object.pointer_ref as l_pointer and then l_pointer = default_pointer)
			assert ("exp_ref", attached {SB_DATA_2} a_object.exp_ref as l_exp_ref and then l_exp_ref.int = 123)
			assert ("arr_int_32", attached {ARRAY [INTEGER_32]} a_object.arr_int_32)
			assert ("arr_int_32_lower", a_object.arr_int_32.lower = 1)
			assert ("arr_int_32_upper", a_object.arr_int_32.upper = 5)
			assert ("arr_int_32_items", a_object.arr_int_32.same_items ({ARRAY [INTEGER_32]} <<32, 33, 34, 35, 36>>))
			assert ("arr_int_8", attached {ARRAY [INTEGER_8]} a_object.arr_int_8)
			assert ("arr_int_8_lower", a_object.arr_int_8.lower = 1)
			assert ("arr_int_8_upper", a_object.arr_int_8.upper = 5)
			assert ("arr_int_8_items", a_object.arr_int_8.same_items ({ARRAY [INTEGER_8]} <<8, 9, 10, 11, 12>>))
			assert ("arr_int_16", attached {ARRAY [INTEGER_16]} a_object.arr_int_16)
			assert ("arr_int_16_lower", a_object.arr_int_16.lower = 1)
			assert ("arr_int_16_upper", a_object.arr_int_16.upper = 5)
			assert ("arr_int_16_items", a_object.arr_int_16.same_items ({ARRAY [INTEGER_16]} <<16, 17, 18, 19, 20>>))
			assert ("arr_int_64", attached {ARRAY [INTEGER_64]} a_object.arr_int_64)
			assert ("arr_int_64_lower", a_object.arr_int_64.lower = 1)
			assert ("arr_int_64_upper", a_object.arr_int_64.upper = 5)
			assert ("arr_int_64_items", a_object.arr_int_64.same_items ({ARRAY [INTEGER_64]} <<64, 65, 66, 67, 68>>))
			assert ("arr_nat_8", attached {ARRAY [NATURAL_8]} a_object.arr_nat_8)
			assert ("arr_nat_8_lower", a_object.arr_nat_8.lower = 1)
			assert ("arr_nat_8_upper", a_object.arr_nat_8.upper = 5)
			assert ("arr_nat_8_items", a_object.arr_nat_8.same_items ({ARRAY [NATURAL_8]} <<8, 9, 10, 11, 12>>))
			assert ("arr_nat_16", attached {ARRAY [NATURAL_16]} a_object.arr_nat_16)
			assert ("arr_nat_16_lower", a_object.arr_nat_16.lower = 1)
			assert ("arr_nat_16_upper", a_object.arr_nat_16.upper = 5)
			assert ("arr_nat_16_items", a_object.arr_nat_16.same_items ({ARRAY [NATURAL_16]} <<16, 17, 18, 19, 20>>))
			assert ("arr_nat_32", attached {ARRAY [NATURAL_32]} a_object.arr_nat_32)
			assert ("arr_nat_32_lower", a_object.arr_nat_32.lower = 1)
			assert ("arr_nat_32_upper", a_object.arr_nat_32.upper = 5)
			assert ("arr_nat_32_items", a_object.arr_nat_32.same_items ({ARRAY [NATURAL_32]} <<32, 33, 34, 35, 36>>))
			assert ("arr_nat_64", attached {ARRAY [NATURAL_64]} a_object.arr_nat_64)
			assert ("arr_nat_64_lower", a_object.arr_nat_64.lower = 1)
			assert ("arr_nat_64_upper", a_object.arr_nat_64.upper = 5)
			assert ("arr_nat_64_items", a_object.arr_nat_64.same_items ({ARRAY [NATURAL_64]} <<64, 65, 66, 67, 68>>))
			assert ("arr_char_8", attached {ARRAY [CHARACTER_8]} a_object.arr_char_8)
			assert ("arr_char_8_lower", a_object.arr_char_8.lower = 1)
			assert ("arr_char_8_upper", a_object.arr_char_8.upper = 5)
			assert ("arr_char_8_items", a_object.arr_char_8.same_items ({ARRAY [CHARACTER_8]} <<'z', 'y', 'x', 'w', 'v'>>))
			assert ("arr_char_32", attached {ARRAY [CHARACTER_32]} a_object.arr_char_32)
			assert ("arr_char_32_lower", a_object.arr_char_32.lower = 1)
			assert ("arr_char_32_upper", a_object.arr_char_32.upper = 5)
			assert ("arr_char_32_items", a_object.arr_char_32.same_items ({ARRAY [CHARACTER_32]} <<'m', 'n', 'o', 'p', 'q'>>))
			assert ("arr_bool", attached {ARRAY [BOOLEAN]} a_object.arr_bool)
			assert ("arr_bool_lower", a_object.arr_bool.lower = 1)
			assert ("arr_bool_upper", a_object.arr_bool.upper = 5)
			assert ("arr_bool_items", a_object.arr_bool.same_items ({ARRAY [BOOLEAN]} <<True, False, True, False, True>>))
			assert ("arr_real_32", attached {ARRAY [REAL_32]} a_object.arr_real_32)
			assert ("arr_real_32_lower", a_object.arr_real_32.lower = 1)
			assert ("arr_real_32_upper", a_object.arr_real_32.upper = 5)
			assert ("arr_real_32_items", a_object.arr_real_32.same_items ({ARRAY [REAL_32]} <<32.5, 33.5, 34.5, 35.5, 36.5>>))
			assert ("arr_real_64", attached {ARRAY [REAL_64]} a_object.arr_real_64)
			assert ("arr_real_64_lower", a_object.arr_real_64.lower = 1)
			assert ("arr_real_64_upper", a_object.arr_real_64.upper = 5)
			assert ("arr_real_64_items", a_object.arr_real_64.same_items ({ARRAY [REAL_64]} <<132.5, 133.5, 134.5, 135.5, 136.5>>))
			assert ("arr_pointer", attached {ARRAY [POINTER]} a_object.arr_pointer)
			assert ("arr_pointer_lower", a_object.arr_pointer.lower = 1)
			assert ("arr_pointer_upper", a_object.arr_pointer.upper = 5)
			assert ("arr_pointer_items", a_object.arr_pointer.same_items ({ARRAY [POINTER]} <<default_pointer, default_pointer, default_pointer, default_pointer, default_pointer>>))
			assert ("arr_ref", attached {ARRAY [STRING]} a_object.arr_ref)
			assert ("arr_ref_lower", a_object.arr_ref.lower = 1)
			assert ("arr_ref_upper", a_object.arr_ref.upper = 5)
			assert ("arr_ref_item_1", attached {STRING} a_object.arr_ref.item (1) as l_ref_1 and then l_ref_1.is_equal ("foo1"))
			assert ("arr_ref_item_2", attached {STRING} a_object.arr_ref.item (2) as l_ref_2 and then l_ref_2.is_equal ("foo2"))
			assert ("arr_ref_item_3", attached {STRING} a_object.arr_ref.item (3) as l_ref_3 and then l_ref_3.is_equal ("foo3"))
			assert ("arr_ref_item_4", attached {STRING} a_object.arr_ref.item (4) as l_ref_4 and then l_ref_4.is_equal ("foo4"))
			assert ("arr_ref_item_5", attached {STRING} a_object.arr_ref.item (5) as l_ref_5 and then l_ref_5.is_equal ("foo5"))
			assert ("arr_none", attached {ARRAY [detachable NONE]} a_object.arr_none)
			assert ("arr_none_lower", a_object.arr_none.lower = 1)
			assert ("arr_none_upper", a_object.arr_none.upper = 5)
			assert ("arr_none_items", a_object.arr_none.same_items ({ARRAY [detachable NONE]} <<Void, Void, Void, Void, Void>>))
			assert ("arr_exp", attached {ARRAY [SB_DATA_2]} a_object.arr_exp)
			assert ("arr_exp_lower", a_object.arr_exp.lower = 1)
			assert ("arr_exp_upper", a_object.arr_exp.upper = 5)
			assert ("arr_exp_item_1", a_object.arr_exp.item (1).int = 123)
			assert ("arr_exp_item_2", a_object.arr_exp.item (2).int = 123)
			assert ("arr_exp_item_3", a_object.arr_exp.item (3).int = 123)
			assert ("arr_exp_item_4", a_object.arr_exp.item (4).int = 123)
			assert ("arr_exp_item_5", a_object.arr_exp.item (5).int = 123)
			assert ("arr_gen", attached {ARRAY [SB_DATA_3 [INTEGER_32]]} a_object.arr_gen)
			assert ("arr_gen_lower", a_object.arr_gen.lower = 1)
			assert ("arr_gen_upper", a_object.arr_gen.upper = 5)
			assert_integers_equal ("arr_gen_item_1", 3, a_object.arr_gen.item (1).attr)
			assert_integers_equal ("arr_gen_item_2", 3, a_object.arr_gen.item (2).attr)
			assert_integers_equal ("arr_gen_item_3", 3, a_object.arr_gen.item (3).attr)
			assert_integers_equal ("arr_gen_item_4", 3, a_object.arr_gen.item (4).attr)
			assert_integers_equal ("arr_gen_item_5", 3, a_object.arr_gen.item (5).attr)
			assert ("arr_gen_gen", attached {ARRAY [SB_DATA_3 [SB_DATA_6 [INTEGER_32]]]} a_object.arr_gen_gen)
			assert ("arr_gen_gen_lower", a_object.arr_gen_gen.lower = 1)
			assert ("arr_gen_gen_upper", a_object.arr_gen_gen.upper = 5)
			if not eiffel_compiler.is_ise then
					-- ISE Eiffel (as of 25.02.9.8732) fails to retrieve a user-defined
					-- expanded attribute within an object which is itself a user-defined
					-- expanded item in SPECIAL objects.
				assert ("arr_gen_gen_item_1", a_object.arr_gen_gen.item (1).attr.attr = 6)
				assert ("arr_gen_gen_item_2", a_object.arr_gen_gen.item (2).attr.attr = 6)
				assert ("arr_gen_gen_item_3", a_object.arr_gen_gen.item (3).attr.attr = 6)
				assert ("arr_gen_gen_item_4", a_object.arr_gen_gen.item (4).attr.attr = 6)
				assert ("arr_gen_gen_item_5", a_object.arr_gen_gen.item (5).attr.attr = 6)
			end
			assert ("h_gen_second", a_object.h_gen.second.attr = 89)
			assert ("h_none_second", a_object.h_none.second = Void)
			assert ("t_int_32", a_object.t_int_32.v = 32)
			assert ("t_int_32_object_comparison", not a_object.t_int_32.object_comparison)
			assert ("t_int_8", a_object.t_int_8.v = 8)
			assert ("t_int_8_object_comparison", a_object.t_int_8.object_comparison)
			assert ("t_int_16", a_object.t_int_16.v = 16)
			assert ("t_int_64", a_object.t_int_64.v = 64)
			assert ("t_nat_8", a_object.t_nat_8.v = 8)
			assert ("t_nat_16", a_object.t_nat_16.v = 16)
			assert ("t_nat_32", a_object.t_nat_32.v = 32)
			assert ("t_nat_64", a_object.t_nat_64.v = 64)
			assert ("t_char_8", a_object.t_char_8.v = 'c')
			assert ("t_char_32", a_object.t_char_32.v = 'd')
			assert ("t_bool", a_object.t_bool.v = True)
			assert ("t_real_32", a_object.t_real_32.v = 32.57)
			assert ("t_real_64", a_object.t_real_64.v = 64.57)
			assert ("t_pointer", a_object.t_pointer.v = default_pointer)
			assert ("t_ref", attached {STRING} a_object.t_ref.v as l_ref and then l_ref.is_equal ("foo"))
			assert ("t_ref_object_comparison", a_object.t_ref.object_comparison)
			assert ("t_none", a_object.t_none.v = Void)
			assert ("t_exp", a_object.t_exp.v.int = 123)
			assert ("t_gen", a_object.t_gen.v.attr = 3)
			assert ("t_gen_gen", a_object.t_gen_gen.v.attr.attr = 6)
			assert ("detachable_none", a_object.detachable_none = Void)
			assert ("detachable_string", attached a_object.detachable_string as l_string and then l_string.is_equal ("foo"))
			assert ("attached_string", a_object.attached_string.is_equal ("bar"))
			assert ("detachable_cell", attached a_object.detachable_cell.item as l_string and then l_string.is_equal ("bar"))
			assert ("attached_cell", a_object.attached_cell.item.is_equal ("foo"))
			assert ("attached_formals_first", attached a_object.attached_formals.first as l_string and then l_string.is_equal ("foo"))
			assert ("attached_formals_second", a_object.attached_formals.second.is_equal ("bar"))
			assert ("attached_formals_first_cell", attached a_object.attached_formals.first_cell.item as l_string and then l_string.is_equal ("foo"))
			assert ("attached_formals_second_cell", a_object.attached_formals.second_cell.item.is_equal ("bar"))
		end

end
