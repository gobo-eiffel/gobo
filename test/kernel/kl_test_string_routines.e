indexing

	description:

		"Test features of class KL_STRING_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_TEST_STRING_ROUTINES

inherit

	KL_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM

feature -- Test

	test_make is
			-- Test feature `make'.
		local
			a_string: STRING
		do
			a_string := STRING_.make (3)
			assert ("not_void1", a_string /= Void) 
			assert ("string_type1", a_string.same_type ("")) 
			assert_equal ("is_empty1", 0, a_string.count) 
			a_string := STRING_.make (0)
			assert ("not_void2", a_string /= Void) 
			assert ("string_type2", a_string.same_type ("")) 
			assert_equal ("is_empty2", 0, a_string.count) 
		end

	test_make_from_string is
			-- Test feature `make_from_string'.
		local
			a_string, foo: STRING
			uc_string: UC_UTF8_STRING
			bnullr: STRING
		do
			foo := clone ("foo")
			a_string := STRING_.make_from_string (foo)
			assert ("not_void1", a_string /= Void) 
			assert ("string_type1", a_string.same_type ("")) 
			assert ("new_string1", a_string /= foo) 
			assert_equal ("same_string1", "foo", a_string) 
			create uc_string.make_from_string ("bar")
			a_string := STRING_.make_from_string (uc_string)
			assert ("not_void2", a_string /= Void) 
			assert ("string_type2", a_string.same_type ("")) 
			assert ("new_string2", a_string /= uc_string) 
			assert_equal ("same_string2", "bar", a_string) 
			uc_string.put_code (too_big_character, 2)
			a_string := STRING_.make_from_string (uc_string)
			assert ("not_void3", a_string /= Void) 
			assert ("string_type3", a_string.same_type ("")) 
			assert ("new_string3", a_string /= uc_string) 
				-- HACT 4.0.1 does not support null characters
				-- in manifest strings.
			bnullr := clone ("bar")
			bnullr.put ('%U', 2)
			assert_equal ("same_string3", bnullr, a_string) 
		end

	test_make_empty is
			-- Test feature `make_empty'.
		local
			a_string: STRING
		do
			a_string := STRING_.make_empty
			assert ("not_void", a_string /= Void) 
			assert ("string_type", a_string.same_type ("")) 
			assert_equal ("is_empty", 0, a_string.count) 
		end

	test_make_filled is
			-- Test feature `make_filled'.
		local
			a_string: STRING
		do
			a_string := STRING_.make_filled ('G', 4)
			assert ("not_void1", a_string /= Void) 
			assert ("string_type1", a_string.same_type ("")) 
			assert_equal ("filled1", "GGGG",  a_string) 
			a_string := STRING_.make_filled ('s', 0)
			assert ("not_void2", a_string /= Void) 
			assert ("string_type2", a_string.same_type ("")) 
			assert_equal ("filled2", "",  a_string) 
		end

	test_make_buffer is
			-- Test feature `make_buffer'.
		local
			a_string: STRING
		do
			a_string := STRING_.make_buffer (4)
			assert ("not_void1", a_string /= Void) 
			assert ("string_type1", a_string.same_type ("")) 
			assert_equal ("count1", 4,  a_string.count) 
			a_string := STRING_.make_buffer (0)
			assert ("not_void2", a_string /= Void) 
			assert ("string_type2", a_string.same_type ("")) 
			assert_equal ("count2", 0,  a_string.count) 
		end

	test_has_substring is
			-- Test feature `has_substring'.
		local
			a_string1: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := clone ("foobar")
			assert ("has1", STRING_.has_substring (a_string1, "oo")) 
			assert ("has2", STRING_.has_substring (a_string1, "foobar")) 
			assert ("has3", STRING_.has_substring (a_string1, a_string1)) 
			assert ("has4", STRING_.has_substring (a_string1, "")) 
			assert ("not_has1", not STRING_.has_substring (a_string1, "gobo")) 
			create uc_string1.make_from_string ("bar")
			assert ("has5", STRING_.has_substring (a_string1, uc_string1)) 
			uc_string1.put_code (too_big_character, 2)
			assert ("not_has2", not STRING_.has_substring (a_string1, uc_string1)) 
			a_string1.put ('%U', 5)
			assert ("has6", STRING_.has_substring (a_string1, uc_string1)) 
			create uc_string1.make_from_string ("gobo-eiffel")
			uc_string1.put_code (too_big_character, 5)
			assert ("has7", STRING_.has_substring (uc_string1, "gobo")) 
			assert ("has8", STRING_.has_substring (uc_string1, "")) 
			create uc_string2.make_from_string ("boteif")
			uc_string2.put_code (too_big_character2, 3)
			assert ("has9", STRING_.has_substring (uc_string1, uc_string2)) 
			uc_string2.put ('-', 3)
			assert ("not_has3", not STRING_.has_substring (uc_string1, uc_string2)) 
			uc_string1.put ('-', 5)
			assert ("has10", STRING_.has_substring (uc_string1, uc_string2)) 
			assert ("has11", STRING_.has_substring (uc_string1, uc_string1)) 
		end

	test_is_integer is
			-- Test feature `is_integer'.
		local
			uc_string: UC_UTF8_STRING
		do
			assert ("is_integer1", STRING_.is_integer ("1234"))
			assert ("is_integer2", STRING_.is_integer ("00078"))
			assert ("not_integer1", not STRING_.is_integer ("1234a"))
			assert ("not_integer2", not STRING_.is_integer (""))
			create uc_string.make_from_string ("4534")
			assert ("is_integer3", STRING_.is_integer (uc_string))
			uc_string.put_code (9878, 2)
			assert ("not_integer3", not STRING_.is_integer (uc_string))
		end

	test_is_hexadecimal is
			-- Test feature `is_hexadecimal'.
		local
			uc_string: UC_UTF8_STRING
		do
			assert ("is_hexa1", STRING_.is_hexadecimal ("12A3B4CDEF"))
			assert ("is_hexa2", STRING_.is_hexadecimal ("12a3b4cdef"))
			assert ("is_hexa3", STRING_.is_hexadecimal ("000E78"))
			assert ("not_hexa1", not STRING_.is_hexadecimal ("1234z"))
			assert ("not_hexa2", not STRING_.is_hexadecimal (""))
			create uc_string.make_from_string ("45E34A")
			assert ("is_hexa4", STRING_.is_hexadecimal (uc_string))
			uc_string.put_code (9878, 2)
			assert ("not_hexa3", not STRING_.is_hexadecimal (uc_string))
		end

	test_string is
			-- Test feature `string'.
		local
			a_string1, a_string2: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string1 := clone ("foo")
			a_string2 := STRING_.string (a_string1)
			assert ("not_void1", a_string2 /= Void)
			assert ("string_type1", a_string2.same_type ("")) 
			assert ("new_string1", a_string2 /= a_string1) 
			assert_equal ("value1", "foo", a_string2) 
			create uc_string.make_from_string ("bar")
			a_string2 := STRING_.string (uc_string)
			assert ("not_void2", a_string2 /= Void)
			assert ("string_type2", a_string2.same_type ("")) 
			assert_equal ("value2", "bar", a_string2) 
			uc_string.put_code (too_big_character, 2)
			a_string2 := STRING_.string (uc_string)
			assert ("not_void3", a_string2 /= Void)
			assert ("string_type3", a_string2.same_type ("")) 
				-- HACT 4.0.1 does not support null characters
				-- in manifest strings.
			a_string1 := clone ("bar")
			a_string1.put ('%U', 2)
			assert_equal ("value3", a_string1, a_string2) 
		end

	test_substring is
			-- Test feature `substring'.
		local
			a_string1, a_string2: STRING
			uc_string1: UC_UTF8_STRING
			uc_string2: STRING
		do
			a_string1 := clone ("foobar")
			a_string2 := STRING_.substring (a_string1, 2, 1)
			assert ("not_void1", a_string2 /= Void)
			assert ("same_type1", a_string2.same_type (a_string1)) 
			assert ("new_string1", a_string2 /= a_string1) 
			assert_equal ("value1", "", a_string2) 
			a_string2 := STRING_.substring (a_string1, 4, 6)
			assert ("not_void2", a_string2 /= Void)
			assert ("same_type2", a_string2.same_type (a_string1)) 
			assert ("new_string2", a_string2 /= a_string1) 
			assert_equal ("value2", "bar", a_string2) 
			create uc_string1.make_from_string ("bar")
			uc_string1.put_code (432, 1)
			uc_string2 := STRING_.substring (uc_string1, 1, 3)
			assert ("not_void3", uc_string2 /= Void)
			assert ("same_type3", uc_string2.same_type (uc_string1)) 
			assert ("new_string3", uc_string2 /= uc_string1) 
			assert_equal ("value3", "%%/432/ar", uc_string2.out) 
		end

	test_substring_index is
			-- Test feature `substring_index'.
		local
			a_string1: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := clone ("foobar")
			assert_equal ("index1", 4, STRING_.substring_index (a_string1, "bar", 1))
			assert_equal ("index2", 0, STRING_.substring_index (a_string1, "bar", 5))
			assert_equal ("index3", 0, STRING_.substring_index (a_string1, "bar", 7))
			create uc_string1.make_from_string ("oba")
			assert_equal ("index4", 3, STRING_.substring_index (a_string1, uc_string1, 2))
			uc_string1.put_code (2345, 2)
			assert_equal ("index5", 0, STRING_.substring_index (a_string1, uc_string1, 1))
			create uc_string1.make_from_string ("foobar")
			uc_string1.put_code (432, 1)
			assert_equal ("index6", 2, STRING_.substring_index (uc_string1, "oob", 1))
			assert_equal ("index7", 0, STRING_.substring_index (uc_string1, "gobo", 2))
			create uc_string2.make_from_string ("foo")
			uc_string2.put_code (432, 1)
			assert_equal ("index8", 1, STRING_.substring_index (uc_string1, uc_string2, 1))
			assert_equal ("index9", 0, STRING_.substring_index (uc_string1, uc_string2, 7))
		end

	test_case_insensitive_hash_code is
			-- Test feature `case_insensitive_hash_code'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foobar")
			assert ("hash_code1", STRING_.case_insensitive_hash_code (a_string) = STRING_.case_insensitive_hash_code (a_string)) 
			a_string2 := clone ("fOoBaR")
			assert ("hash_code2", STRING_.case_insensitive_hash_code (a_string) = STRING_.case_insensitive_hash_code (a_string2)) 
		end

	test_concat is
			-- Test feature `concat'.
		local
			a_string, a_string1, a_string2: STRING
			uc_string1, uc_string2, uc_string3: UC_UTF8_STRING
		do
			a_string1 := clone ("foo")
			a_string2 := clone ("bar")
			a_string := STRING_.concat (a_string1, a_string2)
			assert_equal ("concat1", "foobar", a_string)
			assert ("new_string1", a_string /= a_string1)
			assert ("new_string2", a_string /= a_string2)
			create uc_string1.make_from_string ("gobo")
			uc_string1.put_code (345, 2)
			create uc_string2.make_from_string ("foogobo")
			uc_string2.put_code (345, 5)
			a_string := STRING_.concat (a_string1, uc_string1)
			assert_equal ("concat2", uc_string2, a_string)
			assert ("new_string3", a_string /= a_string1)
			assert ("new_string4", a_string /= uc_string1)
			create uc_string2.make_from_string ("gobofoo")
			uc_string2.put_code (345, 2)
			a_string := STRING_.concat (uc_string1, a_string1)
			assert_equal ("concat3", uc_string2, a_string)
			assert ("new_string5", a_string /= a_string1)
			assert ("new_string6", a_string /= uc_string1)
			create uc_string1.make_from_string ("foo")
			uc_string1.put_code (2345, 2)
			create uc_string2.make_from_string ("bar")
			uc_string2.put_code (453, 2)
			create uc_string3.make_from_string ("foobar")
			uc_string3.put_code (2345, 2)
			uc_string3.put_code (453, 5)
			a_string := STRING_.concat (uc_string1, uc_string2)
			assert_equal ("concat4", uc_string3, a_string)
			assert ("new_string7", a_string /= uc_string1)
			assert ("new_string8", a_string /= uc_string2)
		end

	test_elks_same_string is
			-- Test feature `elks_same_string'.
		local
			a_string1, a_string2: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := clone ("foo")
			assert ("same1", STRING_.elks_same_string (a_string1, a_string1))
			a_string2 := clone ("foo")
			assert ("same2", STRING_.elks_same_string (a_string1, a_string2))
			a_string2 := clone ("bar")
			assert ("not_same1", not STRING_.elks_same_string (a_string1, a_string2))
			create uc_string1.make_from_string ("foo")
			assert ("same3", STRING_.elks_same_string (a_string1, uc_string1))
			assert ("same4", STRING_.elks_same_string (uc_string1, a_string1))
			uc_string1.put_code (too_big_character, 3)
			assert ("not_same2", not STRING_.elks_same_string (a_string1, uc_string1))
			assert ("not_same3", not STRING_.elks_same_string (uc_string1, a_string1))
			create uc_string2.make_from_string ("foo")
			assert ("not_same4", not STRING_.elks_same_string (uc_string1, uc_string2))
			uc_string2.put_code (too_big_character2, 3)
			assert ("same5", STRING_.elks_same_string (uc_string1, uc_string2))
		end

	test_same_string is
			-- Test feature `same_string'.
		local
			a_string1, a_string2: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := clone ("foo")
			assert ("same1", STRING_.same_string (a_string1, a_string1))
			a_string2 := clone ("foo")
			assert ("same2", STRING_.same_string (a_string1, a_string2))
			a_string2 := clone ("bar")
			assert ("not_same1", not STRING_.same_string (a_string1, a_string2))
			create uc_string1.make_from_string ("foo")
			assert ("same3", STRING_.same_string (a_string1, uc_string1))
			assert ("same4", STRING_.same_string (uc_string1, a_string1))
			uc_string1.put_code (9876, 3)
			assert ("not_same2", not STRING_.same_string (a_string1, uc_string1))
			assert ("not_same3", not STRING_.same_string (uc_string1, a_string1))
			create uc_string2.make_from_string ("foo")
			assert ("not_same4", not STRING_.same_string (uc_string1, uc_string2))
			uc_string2.put_code (2852, 3)
			assert ("not_same5", not STRING_.same_string (uc_string1, uc_string2))
			uc_string2.put_code (9876, 3)
			assert ("same5", STRING_.same_string (uc_string1, uc_string2))
		end

	test_fill_with is
			-- Test feature `fill_with'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("foo")
			STRING_.fill_with (a_string, 'a')
			assert_equal ("fill1", "aaa", a_string)
			create uc_string.make_from_string ("bar")
			uc_string.put_code (345, 2)
			STRING_.fill_with (uc_string, 'z')
			assert_equal ("fill2", "zzz", uc_string.out)
		end

	test_insert_character is
			-- Test feature `insert_character'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("foo")
			STRING_.insert_character (a_string, 'a', 2)
			assert_equal ("insert1", "faoo", a_string)
			create uc_string.make_from_string ("bar")
			uc_string.put_code (345, 2)
			STRING_.insert_character (uc_string, 'z', 1)
			assert_equal ("insert2", "zb%%/345/r", uc_string.out)
		end

	test_to_lower is
			-- Test feature `to_lower'.
		local
			a_string, a_string2: STRING
			uc_string: UC_UTF8_STRING
			uc_string2: STRING
		do
			a_string := clone ("FoO")
			a_string2 := STRING_.to_lower (a_string)
			assert ("new_string1", a_string2 /= a_string)
			assert_equal ("lower1", "foo", a_string2)
			create uc_string.make_from_string ("bAR")
			uc_string2 := STRING_.to_lower (uc_string)
			assert ("new_string2", uc_string2 /= uc_string)
			assert_equal ("lower2", "bar", uc_string2.out)
		end

	test_to_upper is
			-- Test feature `to_upper'.
		local
			a_string, a_string2: STRING
			uc_string: UC_UTF8_STRING
			uc_string2: STRING
		do
			a_string := clone ("Foo")
			a_string2 := STRING_.to_upper (a_string)
			assert ("new_string1", a_string2 /= a_string)
			assert_equal ("upper1", "FOO", a_string2)
			create uc_string.make_from_string ("bAr")
			uc_string2 := STRING_.to_upper (uc_string)
			assert ("new_string2", uc_string2 /= uc_string)
			assert_equal ("upper2", "BAR", uc_string2.out)
		end

	test_as_lower is
			-- Test feature `as_lower'.
		local
			a_string, a_string2: STRING
			uc_string: UC_UTF8_STRING
			uc_string2: STRING
		do
			a_string := clone ("FoO")
			a_string2 := STRING_.as_lower (a_string)
			assert ("new_string1", a_string2 /= a_string)
			assert_equal ("lower1", "foo", a_string2)
			create uc_string.make_from_string ("bAR")
			uc_string2 := STRING_.as_lower (uc_string)
			assert ("new_string2", uc_string2 /= uc_string)
			assert_equal ("lower2", "bar", uc_string2.out)
		end

	test_as_upper is
			-- Test feature `as_upper'.
		local
			a_string, a_string2: STRING
			uc_string: UC_UTF8_STRING
			uc_string2: STRING
		do
			a_string := clone ("Foo")
			a_string2 := STRING_.as_upper (a_string)
			assert ("new_string1", a_string2 /= a_string)
			assert_equal ("upper1", "FOO", a_string2)
			create uc_string.make_from_string ("bAr")
			uc_string2 := STRING_.as_upper (uc_string)
			assert ("new_string2", uc_string2 /= uc_string)
			assert_equal ("upper2", "BAR", uc_string2.out)
		end

	test_keep_head is
			-- Test feature `keep_head'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("foobar")
			STRING_.keep_head (a_string, 10)
			assert_equal ("head1", "foobar", a_string) 
			STRING_.keep_head (a_string, 6)
			assert_equal ("head2", "foobar", a_string) 
			STRING_.keep_head (a_string, 3)
			assert_equal ("head3", "foo", a_string) 
			STRING_.keep_head (a_string, 0)
			assert_equal ("head4", "", a_string) 
			create uc_string.make_from_string ("foobar")
			uc_string.put_code (567, 3)
			STRING_.keep_head (uc_string, 10)
			assert_equal ("head5", "fo%%/567/bar", uc_string.out) 
			STRING_.keep_head (uc_string, 6)
			assert_equal ("head6", "fo%%/567/bar", uc_string.out) 
			STRING_.keep_head (uc_string, 3)
			assert_equal ("head7", "fo%%/567/", uc_string.out) 
			STRING_.keep_head (uc_string, 0)
			assert_equal ("head8", "", uc_string.out) 
		end

	test_keep_tail is
			-- Test feature `keep_tail'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("foobar")
			STRING_.keep_tail (a_string, 10)
			assert_equal ("tail1", "foobar", a_string) 
			STRING_.keep_tail (a_string, 6)
			assert_equal ("tail2", "foobar", a_string) 
			STRING_.keep_tail (a_string, 3)
			assert_equal ("tail3", "bar", a_string) 
			STRING_.keep_tail (a_string, 0)
			assert_equal ("tail4", "", a_string) 
			create uc_string.make_from_string ("foobar")
			uc_string.put_code (567, 3)
			STRING_.keep_tail (uc_string, 10)
			assert_equal ("tail5", "fo%%/567/bar", uc_string.out) 
			STRING_.keep_tail (uc_string, 6)
			assert_equal ("tail6", "fo%%/567/bar", uc_string.out) 
			STRING_.keep_tail (uc_string, 3)
			assert_equal ("tail7", "bar", uc_string.out) 
			STRING_.keep_tail (uc_string, 0)
			assert_equal ("tail8", "", uc_string.out) 
		end

	test_remove_substring is
			-- Test feature `remove_substring'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("foobar")
			STRING_.remove_substring (a_string, 2, 4)
			assert_equal ("remove1", "far", a_string)
			create uc_string.make_from_string ("foobar")
			uc_string.put_code (365, 3)
			STRING_.remove_substring (uc_string, 2, 4)
			assert_equal ("remove2", "far", uc_string.out)
		end

	test_wipe_out is
			-- Test feature `wipe_out'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("foobar")
			STRING_.wipe_out (a_string)
			assert_equal ("wiped_out1", 0, a_string.count)
			create uc_string.make_from_string ("foobar")
			uc_string.put_code (365, 3)
			STRING_.wipe_out (uc_string)
			assert_equal ("wiped_out2", 0, uc_string.count)
		end

	test_resize_buffer is
			-- Test feature `resize_buffer'.
		local
			a_string: STRING
		do
			a_string := STRING_.make_buffer (4)
			assert ("not_void1", a_string /= Void) 
			assert ("string_type1", a_string.same_type ("")) 
			assert_equal ("count1", 4,  a_string.count) 
			STRING_.resize_buffer (a_string, 6)
			assert_equal ("count2", 6,  a_string.count) 
		end

	test_hexadecimal_to_integer is
			-- Test feature `hexadecimal_to_integer'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := clone ("1A")
			assert_equal ("hexa1", 26,  STRING_.hexadecimal_to_integer (a_string))
			create uc_string.make_from_string ("B5")
			assert_equal ("hexa2", 181,  STRING_.hexadecimal_to_integer (uc_string))
		end

	test_same_case_insensitive is
			-- Test feature `same_case_insensitive'.
		local
			a_string1, a_string2: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := clone ("foo")
			a_string2 := clone ("FOO")
			assert ("same1", STRING_.same_case_insensitive (a_string1, a_string2))
			assert ("same2", STRING_.same_case_insensitive (a_string2, a_string1))
			assert ("same3", STRING_.same_case_insensitive (a_string1, a_string1))
			a_string2 := clone ("bar")
			assert ("not_same1", not STRING_.same_case_insensitive (a_string1, a_string2))
			create uc_string1.make_from_string ("foo")
			create uc_string2.make_from_string ("FOO")
			assert ("same4", STRING_.same_case_insensitive (uc_string1, uc_string2))
			assert ("same5", STRING_.same_case_insensitive (uc_string2, uc_string1))
			assert ("same6", STRING_.same_case_insensitive (uc_string1, uc_string1))
			create uc_string2.make_from_string ("bar")
			assert ("not_same2", not STRING_.same_case_insensitive (uc_string1, uc_string2))
		end

feature {NONE} -- Implementation

	too_big_character: INTEGER is
			-- Code of a character that does not fit into a CHARACTER
		once
			Result := Platform.Maximum_character_code + 1
		ensure
			too_big: Result > Platform.Maximum_character_code
		end

	too_big_character2: INTEGER is
			-- Code of a character that does not fit into a CHARACTER
		once
			Result := Platform.Maximum_character_code + 2
		ensure
			too_big: Result > Platform.Maximum_character_code
			different: Result /= too_big_character
		end

end
