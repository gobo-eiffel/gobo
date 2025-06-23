note

	description: "Class used to test STORABLE with format independent_store_6_6"
	library: "Gobo Eiffel Storable Library"
	copyright: "Copyright (c) 2025, Eric Bezault and others"
	license: "MIT License"

class SB_DATA_1

inherit

	ANY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
		do
			int_32 := 32
			int_8 := 8
			int_16 := 16
			int_64 := 64
			nat_8 := 8
			nat_16 := 16
			nat_32 := 32
			nat_64 := 64
			char_8 := 'c'
			char_32 := 'd'
			bool := True
			real_32 := 32.57
			real_64 := 64.57
			ref := "toto"
			none := Void
			exp.set_int (123)
			gen.set_attr (3)
			gen_gen.attr.set_attr (6)
			int_32_ref := int_32
			int_8_ref := int_8
			int_16_ref := int_16
			int_64_ref := int_64
			nat_8_ref := nat_8
			nat_16_ref := nat_16
			nat_32_ref := nat_32
			nat_64_ref := nat_64
			char_8_ref := char_8
			char_32_ref := char_32
			bool_ref := True
			real_32_ref := real_32
			real_64_ref := real_64
			pointer_ref := default_pointer
			exp_ref := exp
			create arr_int_32.make_filled (0, 1, 5)
			arr_int_32.put (32, 1)
			arr_int_32.put (33, 2)
			arr_int_32.put (34, 3)
			arr_int_32.put (35, 4)
			arr_int_32.put (36, 5)
			create arr_int_8.make_filled (0, 1, 5)
			arr_int_8.put (8, 1)
			arr_int_8.put (9, 2)
			arr_int_8.put (10, 3)
			arr_int_8.put (11, 4)
			arr_int_8.put (12, 5)
			create arr_int_16.make_filled (0, 1, 5)
			arr_int_16.put (16, 1)
			arr_int_16.put (17, 2)
			arr_int_16.put (18, 3)
			arr_int_16.put (19, 4)
			arr_int_16.put (20, 5)
			create arr_int_64.make_filled (0, 1, 5)
			arr_int_64.put (64, 1)
			arr_int_64.put (65, 2)
			arr_int_64.put (66, 3)
			arr_int_64.put (67, 4)
			arr_int_64.put (68, 5)
			create arr_nat_8.make_filled (0, 1, 5)
			arr_nat_8.put (8, 1)
			arr_nat_8.put (9, 2)
			arr_nat_8.put (10, 3)
			arr_nat_8.put (11, 4)
			arr_nat_8.put (12, 5)
			create arr_nat_16.make_filled (0, 1, 5)
			arr_nat_16.put (16, 1)
			arr_nat_16.put (17, 2)
			arr_nat_16.put (18, 3)
			arr_nat_16.put (19, 4)
			arr_nat_16.put (20, 5)
			create arr_nat_32.make_filled (0, 1, 5)
			arr_nat_32.put (32, 1)
			arr_nat_32.put (33, 2)
			arr_nat_32.put (34, 3)
			arr_nat_32.put (35, 4)
			arr_nat_32.put (36, 5)
			create arr_nat_64.make_filled (0, 1, 5)
			arr_nat_64.put (64, 1)
			arr_nat_64.put (65, 2)
			arr_nat_64.put (66, 3)
			arr_nat_64.put (67, 4)
			arr_nat_64.put (68, 5)
			create arr_char_8.make_filled ('%U', 1, 5)
			arr_char_8.put ('z', 1)
			arr_char_8.put ('y', 2)
			arr_char_8.put ('x', 3)
			arr_char_8.put ('w', 4)
			arr_char_8.put ('v', 5)
			create arr_char_32.make_filled ('%U', 1, 5)
			arr_char_32.put ('m', 1)
			arr_char_32.put ('n', 2)
			arr_char_32.put ('o', 3)
			arr_char_32.put ('p', 4)
			arr_char_32.put ('q', 5)
			create arr_bool.make_filled (False, 1, 5)
			arr_bool.put (True, 1)
			arr_bool.put (False, 2)
			arr_bool.put (True, 3)
			arr_bool.put (False, 4)
			arr_bool.put (True, 5)
			create arr_real_32.make_filled (0.0, 1, 5)
			arr_real_32.put (32.5, 1)
			arr_real_32.put (33.5, 2)
			arr_real_32.put (34.5, 3)
			arr_real_32.put (35.5, 4)
			arr_real_32.put (36.5, 5)
			create arr_real_64.make_filled (0.0, 1, 5)
			arr_real_64.put (132.5, 1)
			arr_real_64.put (133.5, 2)
			arr_real_64.put (134.5, 3)
			arr_real_64.put (135.5, 4)
			arr_real_64.put (136.5, 5)
			create arr_pointer.make_filled (default_pointer, 1, 5)
			create arr_ref.make_filled ("", 1, 5)
			arr_ref.put ("foo1", 1)
			arr_ref.put ("foo2", 2)
			arr_ref.put ("foo3", 3)
			arr_ref.put ("foo4", 4)
			arr_ref.put ("foo5", 5)
			create arr_none.make_filled (Void, 1, 5)
			create arr_exp.make_filled (exp, 1, 5)
			create arr_gen.make_filled (gen, 1, 5)
			create arr_gen_gen.make_filled (gen_gen, 1, 5)
			create h_gen
			h_gen.second.set_attr (89)
			create h_none
			t_int_32 := [int_32]
			t_int_32.compare_references
			t_int_8 := [int_8]
			t_int_8.compare_objects
			t_int_16 := [int_16]
			t_int_64 := [int_64]
			t_nat_8 := [nat_8]
			t_nat_16 := [nat_16]
			t_nat_32 := [nat_32]
			t_nat_64 := [nat_64]
			t_char_8 := [char_8]
			t_char_32 := [char_32]
			t_bool := [True]
			t_real_32 := [real_32]
			t_real_64 := [real_64]
			t_pointer := [default_pointer]
			t_ref := ["foo"]
			t_ref.compare_objects
			t_none := [Void]
			t_exp := [exp]
			t_gen := [gen]
			t_gen_gen := [gen_gen]
			detachable_string := "foo"
			attached_string := "bar"
			create attached_cell.put ("foo")
			create detachable_cell.put ("bar")
			create attached_formals.make ("foo", "bar")
		end

feature -- Access

	int_32: INTEGER_32
	int_8: INTEGER_8
	int_16: INTEGER_16
	int_64: INTEGER_64
	nat_8: NATURAL_8
	nat_16: NATURAL_16
	nat_32: NATURAL_32
	nat_64: NATURAL_64
	char_8: CHARACTER_8
	char_32: CHARACTER_32
	bool: BOOLEAN
	real_32: REAL_32
	real_64: REAL_64
	pointer: POINTER
	ref: STRING_8
	none: detachable NONE
	exp: SB_DATA_2
	gen: SB_DATA_3 [INTEGER_32]
	gen_gen: SB_DATA_3 [SB_DATA_6 [INTEGER_32]]

	int_32_ref: ANY
	int_8_ref: ANY
	int_16_ref: ANY
	int_64_ref: ANY
	nat_8_ref: ANY
	nat_16_ref: ANY
	nat_32_ref: ANY
	nat_64_ref: ANY
	char_8_ref: ANY
	char_32_ref: ANY
	bool_ref: ANY
	real_32_ref: ANY
	real_64_ref: ANY
	pointer_ref: ANY
	exp_ref: ANY

	arr_int_32: ARRAY [INTEGER_32]
	arr_int_8: ARRAY [INTEGER_8]
	arr_int_16: ARRAY [INTEGER_16]
	arr_int_64: ARRAY [INTEGER_64]
	arr_nat_8: ARRAY [NATURAL_8]
	arr_nat_16: ARRAY [NATURAL_16]
	arr_nat_32: ARRAY [NATURAL_32]
	arr_nat_64: ARRAY [NATURAL_64]
	arr_char_8: ARRAY [CHARACTER_8]
	arr_char_32: ARRAY [CHARACTER_32]
	arr_bool: ARRAY [BOOLEAN]
	arr_real_32: ARRAY [REAL_32]
	arr_real_64: ARRAY [REAL_64]
	arr_pointer: ARRAY [POINTER]
	arr_ref: ARRAY [STRING_8]
	arr_none: ARRAY [detachable NONE]
	arr_exp: ARRAY [SB_DATA_2]
	arr_gen: ARRAY [SB_DATA_3 [INTEGER_32]]
	arr_gen_gen: ARRAY [SB_DATA_3 [SB_DATA_6 [INTEGER_32]]]

	h_gen: SB_DATA_4 [ANY, SB_DATA_3 [INTEGER_8]]
	h_none: SB_DATA_4 [STRING_8, detachable NONE]

	t_int_32: TUPLE [v: INTEGER_32]
	t_int_8: TUPLE [v: INTEGER_8]
	t_int_16: TUPLE [v: INTEGER_16]
	t_int_64: TUPLE [v: INTEGER_64]
	t_nat_8: TUPLE [v: NATURAL_8]
	t_nat_16: TUPLE [v: NATURAL_16]
	t_nat_32: TUPLE [v: NATURAL_32]
	t_nat_64: TUPLE [v: NATURAL_64]
	t_char_8: TUPLE [v: CHARACTER_8]
	t_char_32: TUPLE [v: CHARACTER_32]
	t_bool: TUPLE [v: BOOLEAN]
	t_real_32: TUPLE [v: REAL_32]
	t_real_64: TUPLE [v: REAL_64]
	t_pointer: TUPLE [v: POINTER]
	t_ref: TUPLE [v: STRING_8]
	t_none: TUPLE [v: detachable NONE]
	t_exp: TUPLE [v: SB_DATA_2]
	t_gen: TUPLE [v: SB_DATA_3 [INTEGER_32]]
	t_gen_gen: TUPLE [v: SB_DATA_3 [SB_DATA_6 [INTEGER_32]]]

	detachable_none: detachable NONE
	detachable_string: detachable STRING
	attached_string: attached STRING
	attached_cell: CELL [attached STRING]
	detachable_cell: CELL [detachable STRING]
	attached_formals: SB_DATA_5 [STRING, STRING]

end
