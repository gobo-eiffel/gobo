note

	description:

		"Test features of class UC_STRING"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class UC_TEST_STRING

inherit

	KL_TEST_CASE
	KL_SHARED_EIFFEL_COMPILER
	KL_SHARED_PLATFORM
	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES

create

	make_default

feature -- Test

	test_make1
			-- Test feature `make'.
		local
			a_string: UC_STRING
		do
			create a_string.make (0)
			assert_integers_equal ("count1", 0, a_string.count)
			create a_string.make (15)
			assert_integers_equal ("count2", 0, a_string.count)
		end

	test_make2
			-- Test feature `make'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.make (0)
			assert_integers_equal ("count1", 0, a_string.count)
			a_string.make (15)
			assert_integers_equal ("count2", 0, a_string.count)
		end

	test_make_from_string1
			-- Test feature `make_from_string'.
		local
			a_string: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("")
			assert_equal ("empty", "", a_string.out)
			create a_string.make_from_string ("foo")
			assert_equal ("foo", "foo", a_string.out)
			create uc_string.make (15)
			uc_string.append_item_code (265)
			uc_string.append_item_code (1021)
			uc_string.append_character ('f')
			uc_string.append_item_code (23456)
			create a_string.make_from_string (uc_string)
			assert_equal ("uc_string", "%%/265/%%/1021/f%%/23456/", a_string.out)
		end

	test_make_from_string2
			-- Test feature `make_from_string'.
		local
			a_string: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.make_from_string ("")
			assert_equal ("empty", "", a_string.out)
			a_string.make_from_string ("foo")
			assert_equal ("foo", "foo", a_string.out)
			create uc_string.make (15)
			uc_string.append_item_code (265)
			uc_string.append_item_code (1021)
			uc_string.append_character ('f')
			uc_string.append_item_code (23456)
			a_string.make_from_string (uc_string)
			assert_equal ("uc_string", "%%/265/%%/1021/f%%/23456/", a_string.out)
		end

	test_make_from_utf8
			-- Test feature `make_from_utf8'.
		local
			a_string: UC_STRING
			utf8: UC_UTF8_STRING
		do
			create a_string.make_from_utf8 ("")
			assert_equal ("empty", "", a_string.out)
			create a_string.make_from_utf8 ("foo")
			assert_equal ("foo", "foo", a_string.out)
			create utf8.make (15)
			utf8.append_item_code (265)
			utf8.append_item_code (1021)
			utf8.append_character ('f')
			utf8.append_item_code (23456)
			create a_string.make_from_utf8 (utf8.to_utf8)
			assert_equal ("utf8", "%%/265/%%/1021/f%%/23456/", a_string.out)
		end

	test_make_empty
			-- Test feature `make_empty'.
		local
			a_string: UC_STRING
		do
			create a_string.make_empty
			assert_integers_equal ("empty", 0, a_string.count)
		end

	test_make_filled_unicode
			-- Test feature `make_filled_unicode'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create c.make_from_character ('z')
			create a_string.make_filled_unicode (c, 6)
			assert_equal ("filled1", "zzzzzz", a_string.out)
			create c.make_from_code (777)
			create a_string.make_filled_unicode (c, 3)
			assert_equal ("filled2", "%%/777/%%/777/%%/777/", a_string.out)
			create a_string.make_filled_unicode (c, 0)
			assert_equal ("filled3", "", a_string.out)
		end

	test_make_filled_code
			-- Test feature `make_filled_code'.
		local
			a_string: UC_STRING
		do
			create a_string.make_filled_code (('z').code, 6)
			assert_equal ("filled1", "zzzzzz", a_string.out)
			create a_string.make_filled_code (777, 3)
			assert_equal ("filled2", "%%/777/%%/777/%%/777/", a_string.out)
			create a_string.make_filled_code (87, 0)
			assert_equal ("filled3", "", a_string.out)
		end

	test_make_filled
			-- Test feature `make_filled'.
		local
			a_string: UC_STRING
		do
			create a_string.make_filled ('z', 6)
			assert_equal ("filled1", "zzzzzz", a_string.out)
			create a_string.make_filled ('a', 0)
			assert_equal ("filled2", "", a_string.out)
		end

	test_count1
			-- Test feature `count'.
		local
			a_string: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("foo")
			assert_integers_equal ("count1", 3, a_string.count)
			create a_string.make_from_string ("")
			assert_integers_equal ("count2", 0, a_string.count)
			create a_string.make_from_string ("foobar")
			assert_integers_equal ("count3", 6, a_string.count)
			create uc_string.make (9)
			uc_string.append_character ('g')
			uc_string.append_item_code (365)
			uc_string.append_character ('o')
			create a_string.make_from_string (uc_string)
			assert_integers_equal ("count4", 3, a_string.count)
		end

	test_count2
			-- Test feature `count'.
		local
			a_string: STRING
			uc_string: UC_STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			assert_integers_equal ("count1", 3, a_string.count)
			create {UC_STRING} a_string.make_from_string ("")
			assert_integers_equal ("count2", 0, a_string.count)
			create {UC_STRING} a_string.make_from_string ("foobar")
			assert_integers_equal ("count3", 6, a_string.count)
			create uc_string.make (9)
			uc_string.append_character ('g')
			uc_string.append_item_code (365)
			uc_string.append_character ('o')
			create {UC_STRING} a_string.make_from_string (uc_string)
			assert_integers_equal ("count4", 3, a_string.count)
		end

	test_valid_index1
			-- Test feature `valid_index'.
		local
			a_string: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("foo")
			assert ("valid1", a_string.valid_index (1))
			assert ("valid2", a_string.valid_index (2))
			assert ("valid3", a_string.valid_index (3))
			assert ("not_valid1", not a_string.valid_index (0))
			assert ("not_valid2", not a_string.valid_index (4))
			create a_string.make_from_string ("")
			assert ("not_valid3", not a_string.valid_index (0))
			assert ("not_valid4", not a_string.valid_index (1))
			create uc_string.make (9)
			uc_string.append_character ('b')
			uc_string.append_item_code (9345)
			uc_string.append_character ('a')
			uc_string.append_character ('r')
			create a_string.make_from_string (uc_string)
			assert ("valid4", a_string.valid_index (1))
			assert ("valid5", a_string.valid_index (2))
			assert ("valid6", a_string.valid_index (3))
			assert ("valid7", a_string.valid_index (4))
			assert ("not_valid5", not a_string.valid_index (0))
			assert ("not_valid6", not a_string.valid_index (5))
		end

	test_valid_index2
			-- Test feature `valid_index'.
		local
			a_string: STRING
			uc_string: UC_STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			assert ("valid1", a_string.valid_index (1))
			assert ("valid2", a_string.valid_index (2))
			assert ("valid3", a_string.valid_index (3))
			assert ("not_valid1", not a_string.valid_index (0))
			assert ("not_valid2", not a_string.valid_index (4))
			create {UC_STRING} a_string.make_from_string ("")
			assert ("not_valid3", not a_string.valid_index (0))
			assert ("not_valid4", not a_string.valid_index (1))
			create uc_string.make (9)
			uc_string.append_character ('b')
			uc_string.append_item_code (9345)
			uc_string.append_character ('a')
			uc_string.append_character ('r')
			create {UC_STRING} a_string.make_from_string (uc_string)
			assert ("valid4", a_string.valid_index (1))
			assert ("valid5", a_string.valid_index (2))
			assert ("valid6", a_string.valid_index (3))
			assert ("valid7", a_string.valid_index (4))
			assert ("not_valid5", not a_string.valid_index (0))
			assert ("not_valid6", not a_string.valid_index (5))
		end

	test_unicode_item1
			-- Test feature `unicode_item'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("bar")
			create c.make_from_character ('b')
			assert_equal ("item1", c, a_string.unicode_item (1))
			create c.make_from_character ('a')
			assert_equal ("item2", c, a_string.unicode_item (2))
			create c.make_from_character ('r')
			assert_equal ("item3", c, a_string.unicode_item (3))
			a_string.put_item_code (543, 2)
			create c.make_from_code (543)
			assert_equal ("item4", c, a_string.unicode_item (2))
			a_string.put_item_code (134, 2)
			create c.make_from_code (134)
			assert_equal ("item5", c, a_string.unicode_item (2))
		end

	test_item_code1
			-- Test feature `item_code'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			assert_integers_equal ("item_code1", ('b').code, a_string.item_code (1))
			assert_integers_equal ("item_code2", ('a').code, a_string.item_code (2))
			assert_integers_equal ("item_code3", ('r').code, a_string.item_code (3))
			a_string.put_item_code (543, 2)
			assert_integers_equal ("item_code4", 543, a_string.item_code (2))
			a_string.put_item_code (134, 2)
			assert_integers_equal ("item_code5", 134, a_string.item_code (2))
		end

	test_item_code2
			-- Test feature `item_code'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			assert_integers_equal ("item_code1", ('b').code, a_string.item_code (1))
			assert_integers_equal ("item_code2", ('a').code, a_string.item_code (2))
			assert_integers_equal ("item_code3", ('r').code, a_string.item_code (3))
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (543, 2)
				assert_integers_equal ("item_code4", 543, a_string.item_code (2))
				uc_string.put_item_code (134, 2)
				assert_integers_equal ("item_code5", 134, a_string.item_code (2))
			end
		end

	test_item1
			-- Test feature `item'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			assert_characters_equal ("item1", 'b', a_string.item (1))
			assert_characters_equal ("item2", 'a', a_string.item (2))
			assert_characters_equal ("item3", 'r', a_string.item (3))
			a_string.put_item_code (too_big_character, 2)
			assert_characters_equal ("item4", '%U', a_string.item (2))
		end

	test_item2
			-- Test feature `item'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			assert_characters_equal ("item1", 'b', a_string.item (1))
			assert_characters_equal ("item2", 'a', a_string.item (2))
			assert_characters_equal ("item3", 'r', a_string.item (3))
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (too_big_character, 2)
				assert_characters_equal ("item4", '%U', a_string.item (2))
			end
		end

	test_at1
			-- Test feature `at'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			assert_characters_equal ("item1", 'b', a_string.at (1))
			assert_characters_equal ("item2", 'a', a_string.at (2))
			assert_characters_equal ("item3", 'r', a_string.at (3))
			a_string.put_item_code (too_big_character, 2)
			assert_characters_equal ("item4", '%U', a_string.at (2))
		end

	test_at2
			-- Test feature `at'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			assert_characters_equal ("item1", 'b', a_string.at (1))
			assert_characters_equal ("item2", 'a', a_string.at (2))
			assert_characters_equal ("item3", 'r', a_string.at (3))
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (too_big_character, 2)
				assert_characters_equal ("item4", '%U', a_string.at (2))
			end
		end

	test_put_unicode1
			-- Test feature `put_unicode'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("bar")
			create c.make_from_character ('f')
			a_string.put_unicode (c, 1)
			create c.make_from_character ('f')
			assert_equal ("put1", "far", a_string.out)
			create c.make_from_character ('o')
			a_string.put_unicode (c, 2)
			assert_equal ("put2", "for", a_string.out)
			create c.make_from_character ('z')
			a_string.put_unicode (c, 3)
			assert_equal ("put3", "foz", a_string.out)
			create c.make_from_code (257)
			a_string.put_unicode (c, 1)
			assert_equal ("put4", "%%/257/oz", a_string.out)
			create c.make_from_character ('b')
			a_string.put_unicode (c, 1)
			assert_equal ("put5", "boz", a_string.out)
		end

	test_put_item_code1
			-- Test feature `put_item_code'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.put_item_code (('f').code, 1)
			assert_equal ("put_code1", "far", a_string.out)
			a_string.put_item_code (('o').code, 2)
			assert_equal ("put_code2", "for", a_string.out)
			a_string.put_item_code (('z').code, 3)
			assert_equal ("put_code3", "foz", a_string.out)
			a_string.put_item_code (259, 1)
			assert_equal ("put_code4", "%%/259/oz", a_string.out)
			a_string.put_item_code (('b').code, 1)
			assert_equal ("put_code5", "boz", a_string.out)
		end

	test_put1
			-- Test feature `put'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.put ('f', 1)
			assert_equal ("put1", "far", a_string.out)
			a_string.put ('o', 2)
			assert_equal ("put2", "for", a_string.out)
			a_string.put ('z', 3)
			assert_equal ("put3", "foz", a_string.out)
		end

	test_put2
			-- Test feature `put'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			a_string.put ('f', 1)
			assert_equal ("put1", "far", a_string.out)
			a_string.put ('o', 2)
			assert_equal ("put2", "for", a_string.out)
			a_string.put ('z', 3)
			assert_equal ("put3", "foz", a_string.out)
		end

	test_substring1
			-- Test feature `substring'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("bar")
			assert_equal ("substring1", a_string2, a_string.substring (1, 3))
			create a_string2.make_from_string ("ba")
			assert_equal ("substring2", a_string2, a_string.substring (1, 2))
			create a_string2.make_from_string ("a")
			assert_equal ("substring3", a_string2, a_string.substring (2, 2))
			create a_string2.make_from_string ("")
			assert_equal ("substring4", a_string2, a_string.substring (2, 1))
			create a_string.make_from_string ("")
			assert_equal ("substring5", a_string2, a_string.substring (1, 0))
			create a_string.make_from_string ("bar")
			a_string.append_item_code (541)
			a_string.append_string ("foo")
			create a_string2.make_from_string ("ar")
			a_string2.append_item_code (541)
			a_string2.append_string ("fo")
			assert_equal ("substring6", a_string2, a_string.substring (2, 6))
		end

	test_substring3
			-- Test feature `substring'.
		local
			a_string: STRING
			a_string2: UC_STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			create a_string2.make_from_string ("bar")
			assert_equal ("substring1", a_string2, a_string.substring (1, 3))
			create a_string2.make_from_string ("ba")
			assert_equal ("substring2", a_string2, a_string.substring (1, 2))
			create a_string2.make_from_string ("a")
			assert_equal ("substring3", a_string2, a_string.substring (2, 2))
			create a_string2.make_from_string ("")
			assert_equal ("substring4", a_string2, a_string.substring (2, 1))
			create {UC_STRING} a_string.make_from_string ("")
			assert_equal ("substring5", a_string2, a_string.substring (1, 0))
			create {UC_STRING} a_string.make_from_string ("bar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.append_item_code (541)
				a_string.append_string ("foo")
				create a_string2.make_from_string ("ar")
				a_string2.append_item_code (541)
				a_string2.append_string ("fo")
				assert_equal ("substring6", a_string2, a_string.substring (2, 6))
			end
		end

	test_is_equal
			-- Test feature `is_equal'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("bar")
			assert ("is_equal1", a_string.is_equal (a_string2))
			create a_string2.make_from_string ("foo")
			assert ("not_is_equal1", not a_string.is_equal (a_string2))
			create a_string2.make_from_string ("ba")
			assert ("not_is_equal2", not a_string.is_equal (a_string2))
			create a_string2.make_from_string ("bart")
			assert ("not_is_equal3", not a_string.is_equal (a_string2))
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("")
			assert ("is_equal2", a_string.is_equal (a_string2))
			create a_string2.make_from_string ("foo")
			assert ("not_is_equal4", not a_string.is_equal (a_string2))
			create a_string.make_from_string ("bar")
			a_string.append_item_code (541)
			a_string.append_string ("foo")
			create a_string2.make_from_string ("bar")
			a_string2.append_item_code (541)
			a_string2.append_string ("foo")
			assert ("is_equal3", a_string.is_equal (a_string2))
			create a_string.make_from_string ("")
			a_string.append_item_code (541)
			a_string.append_string ("foo")
			create a_string2.make_from_string ("")
			a_string2.append_item_code (345)
			a_string2.append_string ("foo")
			assert ("not_is_equal5",  not a_string.is_equal (a_string2))
		end

	test_out1
			-- Test feature `out'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			assert_equal ("out1", "bar", a_string.out)
			create a_string.make_from_string ("")
			assert_equal ("out2", "", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.put_item_code (934, 2)
			assert_equal ("out3", "f%%/934/o", a_string.out)
		end

	test_out2
			-- Test feature `out'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			assert_equal ("out1", "bar", a_string.out)
			create {UC_STRING} a_string.make_from_string ("")
			assert_equal ("out2", "", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foo")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (934, 2)
				assert_equal ("out3", "f%%/934/o", a_string.out)
			end
		end

	test_to_utf8_1
			-- Test feature `to_utf8'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			assert_equal ("bar", "bar", a_string.to_utf8)
			create a_string.make_from_string ("")
			assert_equal ("empty", "", a_string.to_utf8)
			create a_string.make_from_string ("foo")
			a_string.put_item_code (934, 2)
			a_string.put_item_code (129, 3)
			assert_integers_equal ("foo_count", 5, a_string.to_utf8.count)
			assert_characters_equal ("foo_1", 'f', a_string.to_utf8.item (1))
				-- 934: 11001110 10100110
			assert_integers_equal ("foo_2", 206, a_string.to_utf8.item (2).code)
			assert_integers_equal ("foo_3", 166, a_string.to_utf8.item (3).code)
				-- 129: 11000010 10000001
			assert_integers_equal ("foo_4", 194, a_string.to_utf8.item (4).code)
			assert_integers_equal ("foo_5", 129, a_string.to_utf8.item (5).code)
		end

	test_to_utf16_be
			-- Test feature `to_utf16_be'.
		local
			a_unicode: UC_STRING
			a_byte_string: STRING
		do
			create a_unicode.make_from_utf8 ("M")
			a_byte_string := a_unicode.to_utf16_be
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 2, a_byte_string.count)
			assert_integers_equal ("first_byte1", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 77, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := a_unicode.to_utf16_be
			assert ("not_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 2, a_byte_string.count)
			assert_integers_equal ("first_byte2", 4, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 48, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := a_unicode.to_utf16_be
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 2, a_byte_string.count)
			assert_integers_equal ("first_byte3", 78, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 140, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := a_unicode.to_utf16_be
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 216, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 223, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 2, a_byte_string.item_code (4))
		end

	test_to_utf16_le
			-- Test feature `to_utf16_le'.
		local
			a_unicode: UC_STRING
			a_byte_string: STRING
		do
			create a_unicode.make_from_utf8 ("M")
			a_byte_string := a_unicode.to_utf16_le
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 2, a_byte_string.count)
			assert_integers_equal ("first_byte1", 77, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 0, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := a_unicode.to_utf16_le
			assert ("not_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 2, a_byte_string.count)
			assert_integers_equal ("first_byte1", 48, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 4, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := a_unicode.to_utf16_le
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 2, a_byte_string.count)
			assert_integers_equal ("first_byte3", 140, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 78, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := a_unicode.to_utf16_le
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 216, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 2, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 223, a_byte_string.item_code (4))
		end

	test_to_utf32_be
			-- Test feature `to_utf32_be'.
		local
			a_unicode: UC_STRING
			a_byte_string: STRING
		do
			create a_unicode.make_from_utf8 ("M")
			a_byte_string := a_unicode.to_utf32_be
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 4, a_byte_string.count)
			assert_integers_equal ("first_byte1", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte1", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte1", 77, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := a_unicode.to_utf32_be
			assert ("not_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 4, a_byte_string.count)
			assert_integers_equal ("first_byte2", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte2", 4, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte2", 48, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := a_unicode.to_utf32_be
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 4, a_byte_string.count)
			assert_integers_equal ("first_byte3", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte3", 78, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte3", 140, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := a_unicode.to_utf32_be
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 1, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 3, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 2, a_byte_string.item_code (4))
		end

	test_to_utf32_le
			-- Test feature `to_utf32_le'.
		local
			a_unicode: UC_STRING
			a_byte_string: STRING
		do
			create a_unicode.make_from_utf8 ("M")
			a_byte_string := a_unicode.to_utf32_le
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 4, a_byte_string.count)
			assert_integers_equal ("first_byte1", 77, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte1", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte1", 0, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := a_unicode.to_utf32_le
			assert ("not_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 4, a_byte_string.count)
			assert_integers_equal ("first_byte2", 48, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 4, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte2", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte2", 0, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := a_unicode.to_utf32_le
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 4, a_byte_string.count)
			assert_integers_equal ("first_byte3", 140, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 78, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte3", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte3", 0, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := a_unicode.to_utf32_le
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 2, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 3, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 1, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 0, a_byte_string.item_code (4))
		end

	test_copy
			-- Test feature `copy'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("zx")
			create a_string2.make_from_string ("foobar")
			a_string.copy (a_string2)
			assert_equal ("copy1", "foobar", a_string.out)
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("bar")
			a_string.copy (a_string2)
			assert_equal ("copy2", "bar", a_string.out)
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("")
			a_string.copy (a_string2)
			assert_equal ("copy3", "", a_string.out)
			create a_string.make_from_string ("toto")
			a_string.copy (a_string)
			assert_equal ("copy4", "toto", a_string.out)
			create a_string.make_from_string ("zx")
			create a_string2.make_from_string ("foobar")
			a_string2.put_item_code (692, 3)
			a_string.copy (a_string2)
			assert_equal ("copy4", "fo%%/692/bar", a_string.out)
		end

	test_append_unicode_character1
			-- Test feature `append_unicode_character'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("bar")
			create c.make_from_character ('f')
			a_string.append_unicode_character (c)
			assert_equal ("append_unicode_character1", "barf", a_string.out)
			create c.make_from_code (68457)
			a_string.append_unicode_character (c)
			assert_equal ("append_unicode_character2", "barf%%/68457/", a_string.out)
			create a_string.make_from_string ("")
			create c.make_from_code (462)
			a_string.append_unicode_character (c)
			assert_equal ("append_unicode_character3", "%%/462/", a_string.out)
			create c.make_from_character ('z')
			a_string.append_unicode_character (c)
			assert_equal ("append_unicode_character4", "%%/462/z", a_string.out)
		end

	test_append_character1
			-- Test feature `append_character'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.append_character ('f')
			assert_equal ("append_character1", "barf", a_string.out)
			create a_string.make_from_string ("")
			a_string.append_character ('z')
			assert_equal ("append_character2", "z", a_string.out)
		end

	test_append_character2
			-- Test feature `append_character'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			a_string.append_character ('f')
			assert_equal ("append_character1", "barf", a_string.out)
			create {UC_STRING} a_string.make_from_string ("")
			a_string.append_character ('z')
			assert_equal ("append_character2", "z", a_string.out)
		end

	test_append_string1
			-- Test feature `append_string'.
		local
			a_string: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("foo")
			a_string.append_string ("bar")
			assert_equal ("append_string1", "foobar", a_string.out)
			create a_string.make_from_string ("")
			a_string.append_string ("bar")
			assert_equal ("append_string2", "bar", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.append_string ("")
			assert_equal ("append_string3", "foo", a_string.out)
			create uc_string.make (4)
			uc_string.append_item_code (265)
			uc_string.append_item_code (1021)
			uc_string.append_character ('f')
			uc_string.append_item_code (23456)
			a_string.append_string (uc_string)
			assert_equal ("append_string4", "foo%%/265/%%/1021/f%%/23456/", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.append_string (a_string)
			assert_equal ("append_string5", "foofoo", a_string.out)
			create a_string.make_from_string ("bar")
			a_string.put_item_code (888, 2)
			a_string.append_string (a_string)
			assert_equal ("append_string6", "b%%/888/rb%%/888/r", a_string.out)
		end

	test_append_string2
			-- Test feature `append_string'.
		local
			a_string: STRING
			l_uc_string: UC_STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			a_string.append_string ("bar")
			assert_equal ("append_string1", "foobar", a_string.out)
			create {UC_STRING} a_string.make_from_string ("")
			a_string.append_string ("bar")
			assert_equal ("append_string2", "bar", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foo")
			a_string.append_string ("")
			assert_equal ("append_string3", "foo", a_string.out)
			create l_uc_string.make (4)
			l_uc_string.append_item_code (265)
			l_uc_string.append_item_code (1021)
			l_uc_string.append_character ('f')
			l_uc_string.append_item_code (23456)
			a_string.append_string (l_uc_string)
			assert_equal ("append_string4", "foo%%/265/%%/1021/f%%/23456/", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foo")
			a_string.append_string (a_string)
			assert_equal ("append_string5", "foofoo", a_string.out)
			create {UC_STRING} a_string.make_from_string ("bar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (888, 2)
				a_string.append_string (a_string)
				assert_equal ("append_string6", "b%%/888/rb%%/888/r", a_string.out)
			end
		end

	test_infix_plus1
			-- Test feature `plus' with 'alias "+"'.
		local
			a_string, a_string2: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("bar")
			assert_equal ("append_string1", "foobar", (a_string + a_string2).out)
			assert ("new_string1", (a_string + a_string2) /= a_string)
			assert ("new_string2", (a_string + a_string2) /= a_string2)
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("bar")
			assert_equal ("append_string2", "bar", (a_string + a_string2).out)
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("")
			assert_equal ("append_string3", "foo", (a_string + a_string2).out)
			create uc_string.make (4)
			uc_string.append_item_code (265)
			uc_string.append_item_code (1021)
			uc_string.append_character ('f')
			uc_string.append_item_code (23456)
			assert_equal ("append_string4", "foo%%/265/%%/1021/f%%/23456/", (a_string + uc_string).out)
			create a_string.make_from_string ("foo")
			assert_equal ("append_string5", "foofoo", (a_string + a_string).out)
			create a_string.make_from_string ("bar")
			a_string.put_item_code (888, 2)
			assert_equal ("append_string6", "b%%/888/rb%%/888/r", (a_string + a_string).out)
		end

	test_index_of_unicode1
			-- Test feature `index_of_unicode'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("bar")
			a_string.put_item_code (345, 2)
			create c.make_from_character ('b')
			assert_integers_equal ("index_of_b1", 1, a_string.index_of_unicode (c, 1))
			assert_integers_equal ("index_of_b2", 0, a_string.index_of_unicode (c, 2))
			assert_integers_equal ("index_of_b3", 0, a_string.index_of_unicode (c, 3))
			assert_integers_equal ("index_of_b4", 0, a_string.index_of_unicode (c, 4))
			create c.make_from_code (345)
			assert_integers_equal ("index_of_345_1", 2, a_string.index_of_unicode (c, 1))
			assert_integers_equal ("index_of_345_2", 2, a_string.index_of_unicode (c, 2))
			assert_integers_equal ("index_of_345_3", 0, a_string.index_of_unicode (c, 3))
			assert_integers_equal ("index_of_345_4", 0, a_string.index_of_unicode (c, 4))
			create c.make_from_character ('r')
			assert_integers_equal ("index_of_r1", 3, a_string.index_of_unicode (c, 1))
			assert_integers_equal ("index_of_r2", 3, a_string.index_of_unicode (c, 2))
			assert_integers_equal ("index_of_r3", 3, a_string.index_of_unicode (c, 3))
			assert_integers_equal ("index_of_r4", 0, a_string.index_of_unicode (c, 4))
			create c.make_from_character ('z')
			assert_integers_equal ("index_of_z1", 0, a_string.index_of_unicode (c, 1))
			assert_integers_equal ("index_of_z2", 0, a_string.index_of_unicode (c, 2))
			assert_integers_equal ("index_of_z3", 0, a_string.index_of_unicode (c, 3))
			assert_integers_equal ("index_of_z4", 0, a_string.index_of_unicode (c, 4))
			create a_string.make_from_string ("")
			create c.make_from_character ('o')
			assert_integers_equal ("index_of_o1", 0, a_string.index_of_unicode (c, 1))
		end

	test_index_of_item_code1
			-- Test feature `index_of_item_code'.
		local
			a_string: UC_STRING
			a_code: INTEGER
		do
			create a_string.make_from_string ("bar")
			a_string.put_item_code (345, 2)
			a_code := ('b').code
			assert_integers_equal ("index_of_b1", 1, a_string.index_of_item_code (a_code, 1))
			assert_integers_equal ("index_of_b2", 0, a_string.index_of_item_code (a_code, 2))
			assert_integers_equal ("index_of_b3", 0, a_string.index_of_item_code (a_code, 3))
			assert_integers_equal ("index_of_b4", 0, a_string.index_of_item_code (a_code, 4))
			a_code := 345
			assert_integers_equal ("index_of_345_1", 2, a_string.index_of_item_code (a_code, 1))
			assert_integers_equal ("index_of_345_2", 2, a_string.index_of_item_code (a_code, 2))
			assert_integers_equal ("index_of_345_3", 0, a_string.index_of_item_code (a_code, 3))
			assert_integers_equal ("index_of_345_4", 0, a_string.index_of_item_code (a_code, 4))
			a_code := ('r').code
			assert_integers_equal ("index_of_r1", 3, a_string.index_of_item_code (a_code, 1))
			assert_integers_equal ("index_of_r2", 3, a_string.index_of_item_code (a_code, 2))
			assert_integers_equal ("index_of_r3", 3, a_string.index_of_item_code (a_code, 3))
			assert_integers_equal ("index_of_r4", 0, a_string.index_of_item_code (a_code, 4))
			a_code := ('z').code
			assert_integers_equal ("index_of_z1", 0, a_string.index_of_item_code (a_code, 1))
			assert_integers_equal ("index_of_z2", 0, a_string.index_of_item_code (a_code, 2))
			assert_integers_equal ("index_of_z3", 0, a_string.index_of_item_code (a_code, 3))
			assert_integers_equal ("index_of_z4", 0, a_string.index_of_item_code (a_code, 4))
			create a_string.make_from_string ("")
			a_code := ('o').code
			assert_integers_equal ("index_of_o1", 0, a_string.index_of_item_code (a_code, 1))
		end

	test_index_of1
			-- Test feature `index_of'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.put_item_code (too_big_character, 2)
			assert_integers_equal ("index_of_b1", 1, a_string.index_of ('b', 1))
			assert_integers_equal ("index_of_b2", 0, a_string.index_of ('b', 2))
			assert_integers_equal ("index_of_b3", 0, a_string.index_of ('b', 3))
			assert_integers_equal ("index_of_b4", 0, a_string.index_of ('b', 4))
			assert_integers_equal ("index_of_456_1", 2, a_string.index_of ('%U', 1))
			assert_integers_equal ("index_of_456_2", 2, a_string.index_of ('%U', 2))
			assert_integers_equal ("index_of_456_3", 0, a_string.index_of ('%U', 3))
			assert_integers_equal ("index_of_456_4", 0, a_string.index_of ('%U', 4))
			assert_integers_equal ("index_of_r1", 3, a_string.index_of ('r', 1))
			assert_integers_equal ("index_of_r2", 3, a_string.index_of ('r', 2))
			assert_integers_equal ("index_of_r3", 3, a_string.index_of ('r', 3))
			assert_integers_equal ("index_of_r4", 0, a_string.index_of ('r', 4))
			assert_integers_equal ("index_of_z1", 0, a_string.index_of ('z', 1))
			assert_integers_equal ("index_of_z2", 0, a_string.index_of ('z', 2))
			assert_integers_equal ("index_of_z3", 0, a_string.index_of ('z', 3))
			assert_integers_equal ("index_of_z4", 0, a_string.index_of ('z', 4))
			a_string.put ('%U', 2)
			assert_integers_equal ("index_of_null1", 2, a_string.index_of ('%U', 1))
			assert_integers_equal ("index_of_null2", 2, a_string.index_of ('%U', 2))
			assert_integers_equal ("index_of_null3", 0, a_string.index_of ('%U', 3))
			assert_integers_equal ("index_of_null4", 0, a_string.index_of ('%U', 4))
			create a_string.make_from_string ("")
			assert_integers_equal ("index_of_o1", 0, a_string.index_of ('o', 1))
		end

	test_index_of2
			-- Test feature `index_of'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (too_big_character, 2)
				assert_integers_equal ("index_of_b1", 1, a_string.index_of ('b', 1))
				assert_integers_equal ("index_of_b2", 0, a_string.index_of ('b', 2))
				assert_integers_equal ("index_of_b3", 0, a_string.index_of ('b', 3))
				assert_integers_equal ("index_of_b4", 0, a_string.index_of ('b', 4))
				assert_integers_equal ("index_of_567_1", 2, a_string.index_of ('%U', 1))
				assert_integers_equal ("index_of_567_2", 2, a_string.index_of ('%U', 2))
				assert_integers_equal ("index_of_567_3", 0, a_string.index_of ('%U', 3))
				assert_integers_equal ("index_of_567_4", 0, a_string.index_of ('%U', 4))
				assert_integers_equal ("index_of_r1", 3, a_string.index_of ('r', 1))
				assert_integers_equal ("index_of_r2", 3, a_string.index_of ('r', 2))
				assert_integers_equal ("index_of_r3", 3, a_string.index_of ('r', 3))
				assert_integers_equal ("index_of_r4", 0, a_string.index_of ('r', 4))
				assert_integers_equal ("index_of_z1", 0, a_string.index_of ('z', 1))
				assert_integers_equal ("index_of_z2", 0, a_string.index_of ('z', 2))
				assert_integers_equal ("index_of_z3", 0, a_string.index_of ('z', 3))
				assert_integers_equal ("index_of_z4", 0, a_string.index_of ('z', 4))
				uc_string.put_item_code (0, 2)
				assert_integers_equal ("index_of_null1", 2, a_string.index_of ('%U', 1))
				assert_integers_equal ("index_of_null2", 2, a_string.index_of ('%U', 2))
				assert_integers_equal ("index_of_null3", 0, a_string.index_of ('%U', 3))
				assert_integers_equal ("index_of_null4", 0, a_string.index_of ('%U', 4))
			end
			create {UC_STRING} a_string.make_from_string ("")
			assert_integers_equal ("index_of_o1", 0, a_string.index_of ('o', 1))
		end

	test_has_unicode1
			-- Test feature `has_unicode'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("bar")
			a_string.append_item_code (432)
			create c.make_from_character ('b')
			assert ("has_b", a_string.has_unicode (c))
			create c.make_from_character ('a')
			assert ("has_a", a_string.has_unicode (c))
			create c.make_from_character ('r')
			assert ("has_r", a_string.has_unicode (c))
			create c.make_from_code (432)
			assert ("has_432", a_string.has_unicode (c))
			create c.make_from_character ('o')
			assert ("not_has_o", not a_string.has_unicode (c))
			create c.make_from_code (278)
			assert ("not_has_278", not a_string.has_unicode (c))
			create a_string.make_from_string ("")
			create c.make_from_character ('f')
			assert ("not_has_f", not a_string.has_unicode (c))
			create c.make_from_code (678)
			assert ("not_has_678", not a_string.has_unicode (c))
		end

	test_has_item_code1
			-- Test feature `has_item_code'.
		local
			a_string: UC_STRING
			a_code: INTEGER
		do
			create a_string.make_from_string ("bar")
			a_string.append_item_code (432)
			a_code := ('b').code
			assert ("has_b", a_string.has_item_code (a_code))
			a_code := ('a').code
			assert ("has_a", a_string.has_item_code (a_code))
			a_code := ('r').code
			assert ("has_r", a_string.has_item_code (a_code))
			a_code := 432
			assert ("has_432", a_string.has_item_code (a_code))
			a_code := ('o').code
			assert ("not_has_o", not a_string.has_item_code (a_code))
			a_code := 278
			assert ("not_has_278", not a_string.has_item_code (a_code))
			create a_string.make_from_string ("")
			a_code := ('f').code
			assert ("not_has_f", not a_string.has_item_code (a_code))
			a_code := 678
			assert ("not_has_678", not a_string.has_item_code (a_code))
		end

	test_has1
			-- Test feature `has'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.append_item_code (too_big_character)
			assert ("has_b", a_string.has ('b'))
			assert ("has_a", a_string.has ('a'))
			assert ("has_r", a_string.has ('r'))
			assert ("has_null", a_string.has ('%U'))
			assert ("not_has_o", not a_string.has ('o'))
			create a_string.make_from_string ("")
			assert ("not_has_f", not a_string.has ('f'))
		end

	test_has2
			-- Test feature `has'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.append_item_code (too_big_character)
				assert ("has_b", a_string.has ('b'))
				assert ("has_a", a_string.has ('a'))
				assert ("has_r", a_string.has ('r'))
				assert ("has_null", a_string.has ('%U'))
				assert ("not_has_o", not a_string.has ('o'))
			end
			create {UC_STRING} a_string.make_from_string ("")
			assert ("not_has_f", not a_string.has ('f'))
		end

	test_unicode_occurrences1
			-- Test feature `unicode_occurrences'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("foobar")
			a_string.append_item_code (988)
			a_string.append_item_code (988)
			a_string.append_item_code (988)
			create c.make_from_character ('b')
			assert_integers_equal ("b", 1, a_string.unicode_occurrences (c))
			create c.make_from_character ('a')
			assert_integers_equal ("a", 1, a_string.unicode_occurrences (c))
			create c.make_from_character ('r')
			assert_integers_equal ("r", 1, a_string.unicode_occurrences (c))
			create c.make_from_character ('o')
			assert_integers_equal ("o", 2, a_string.unicode_occurrences (c))
			create c.make_from_character ('f')
			assert_integers_equal ("f", 1, a_string.unicode_occurrences (c))
			create c.make_from_character ('z')
			assert_integers_equal ("z", 0, a_string.unicode_occurrences (c))
			create c.make_from_code (988)
			assert_integers_equal ("988", 3, a_string.unicode_occurrences (c))
			create c.make_from_code (444)
			assert_integers_equal ("444", 0, a_string.unicode_occurrences (c))
			create a_string.make_from_string ("")
			create c.make_from_character ('x')
			assert_integers_equal ("x", 0, a_string.unicode_occurrences (c))
			create c.make_from_code (555)
			assert_integers_equal ("555", 0, a_string.unicode_occurrences (c))
		end

	test_code_occurrences1
			-- Test feature `code_occurrences'.
		local
			a_string: UC_STRING
			a_code: INTEGER
		do
			create a_string.make_from_string ("foobar")
			a_string.append_item_code (988)
			a_string.append_item_code (988)
			a_string.append_item_code (988)
			a_code := ('b').code
			assert_integers_equal ("b", 1, a_string.code_occurrences (a_code))
			a_code := ('a').code
			assert_integers_equal ("a", 1, a_string.code_occurrences (a_code))
			a_code := ('r').code
			assert_integers_equal ("r", 1, a_string.code_occurrences (a_code))
			a_code := ('o').code
			assert_integers_equal ("o", 2, a_string.code_occurrences (a_code))
			a_code := ('f').code
			assert_integers_equal ("f", 1, a_string.code_occurrences (a_code))
			a_code := ('z').code
			assert_integers_equal ("z", 0, a_string.code_occurrences (a_code))
			a_code := 988
			assert_integers_equal ("988", 3, a_string.code_occurrences (a_code))
			a_code := 444
			assert_integers_equal ("444", 0, a_string.code_occurrences (a_code))
			create a_string.make_from_string ("")
			a_code := ('x').code
			assert_integers_equal ("x", 0, a_string.code_occurrences (a_code))
			a_code := 555
			assert_integers_equal ("555", 0, a_string.code_occurrences (a_code))
		end

	test_occurrences1
			-- Test feature `occurrences'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.append_item_code (too_big_character)
			a_string.append_item_code (too_big_character)
			a_string.append_item_code (too_big_character)
			assert_integers_equal ("b", 1, a_string.occurrences ('b'))
			assert_integers_equal ("a", 1, a_string.occurrences ('a'))
			assert_integers_equal ("r", 1, a_string.occurrences ('r'))
			assert_integers_equal ("o", 2, a_string.occurrences ('o'))
			assert_integers_equal ("f", 1, a_string.occurrences ('f'))
			assert_integers_equal ("z", 0, a_string.occurrences ('z'))
			assert_integers_equal ("null", 3, a_string.occurrences ('%U'))
			create a_string.make_from_string ("")
			assert_integers_equal ("x", 0, a_string.occurrences ('x'))
			assert_integers_equal ("null", 0, a_string.occurrences ('%U'))
		end

	test_occurrences2
			-- Test feature `occurrences'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foobar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.append_item_code (too_big_character)
				uc_string.append_item_code (too_big_character)
				uc_string.append_item_code (too_big_character)
				assert_integers_equal ("b", 1, a_string.occurrences ('b'))
				assert_integers_equal ("a", 1, a_string.occurrences ('a'))
				assert_integers_equal ("r", 1, a_string.occurrences ('r'))
				assert_integers_equal ("o", 2, a_string.occurrences ('o'))
				assert_integers_equal ("f", 1, a_string.occurrences ('f'))
				assert_integers_equal ("z", 0, a_string.occurrences ('z'))
				assert_integers_equal ("null", 3, a_string.occurrences ('%U'))
			end
			create {UC_STRING} a_string.make_from_string ("")
			assert_integers_equal ("x", 0, a_string.occurrences ('x'))
			assert_integers_equal ("null", 0, a_string.occurrences ('%U'))
		end

-- Not supported in SE 2.2b1.
--	obsolete_test_head1 is
--			-- Test feature `head'.
--		local
--			a_string: UC_STRING
--		do
--			create a_string.make_from_string ("foobar")
--			a_string.put_item_code (333, 3)
--			a_string.put_item_code (444, 4)
--			a_string.head (10)
--			assert_equal ("head_10", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.head (6)
--			assert_equal ("head_6", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.head (3)
--			assert_equal ("head_3", "fo%%/333/", a_string.out)
--			a_string.head (0)
--			assert_equal ("head_0", "", a_string.out)
--		end

--	obsolete_test_head2 is
--			-- Test feature `head'.
--		local
--			a_string: STRING
--			uc_string: UC_STRING
--		do
--			create {UC_STRING} a_string.make_from_string ("foobar")
--			uc_string ?= a_string
--			assert ("uc_string", uc_string /= Void)
--			uc_string.put_item_code (333, 3)
--			uc_string.put_item_code (444, 4)
--			a_string.head (10)
--			assert_equal ("head_10", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.head (6)
--			assert_equal ("head_6", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.head (3)
--			assert_equal ("head_3", "fo%%/333/", a_string.out)
--			a_string.head (0)
--			assert_equal ("head_0", "", a_string.out)
--		end

	test_keep_head1
			-- Test feature `keep_head'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (333, 3)
			a_string.put_item_code (444, 4)
			a_string.keep_head (10)
			assert_equal ("head_10", "fo%%/333/%%/444/ar", a_string.out)
			a_string.keep_head (6)
			assert_equal ("head_6", "fo%%/333/%%/444/ar", a_string.out)
			a_string.keep_head (3)
			assert_equal ("head_3", "fo%%/333/", a_string.out)
			a_string.keep_head (0)
			assert_equal ("head_0", "", a_string.out)
		end

-- Not supported in SE 2.2b1.
--	obsolete_test_tail1 is
--			-- Test feature `tail'.
--		local
--			a_string: UC_STRING
--		do
--			create a_string.make_from_string ("foobar")
--			a_string.put_item_code (333, 3)
--			a_string.put_item_code (444, 4)
--			a_string.tail (10)
--			assert_equal ("tail_10", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.tail (6)
--			assert_equal ("tail_6", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.tail (3)
--			assert_equal ("tail_3", "%%/444/ar", a_string.out)
--			a_string.tail (0)
--			assert_equal ("tail_0", "", a_string.out)
--		end
--
--	obsolete_test_tail2 is
--			-- Test feature `tail'.
--		local
--			a_string: STRING
--			uc_string: UC_STRING
--		do
--			create {UC_STRING} a_string.make_from_string ("foobar")
--			uc_string ?= a_string
--			assert ("uc_string", uc_string /= Void)
--			uc_string.put_item_code (333, 3)
--			uc_string.put_item_code (444, 4)
--			a_string.tail (10)
--			assert_equal ("tail_10", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.tail (6)
--			assert_equal ("tail_6", "fo%%/333/%%/444/ar", a_string.out)
--			a_string.tail (3)
--			assert_equal ("tail_3", "%%/444/ar", a_string.out)
--			a_string.tail (0)
--			assert_equal ("tail_0", "", a_string.out)
--		end

	test_keep_tail1
			-- Test feature `keep_tail'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (333, 3)
			a_string.put_item_code (444, 4)
			a_string.keep_tail (10)
			assert_equal ("tail_10", "fo%%/333/%%/444/ar", a_string.out)
			a_string.keep_tail (6)
			assert_equal ("tail_6", "fo%%/333/%%/444/ar", a_string.out)
			a_string.keep_tail (3)
			assert_equal ("tail_3", "%%/444/ar", a_string.out)
			a_string.keep_tail (0)
			assert_equal ("tail_0", "", a_string.out)
		end

	test_remove_head1
			-- Test feature `remove_head'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (333, 3)
			a_string.put_item_code (444, 4)
			a_string.remove_head (0)
			assert_equal ("removed1", "fo%%/333/%%/444/ar", a_string.out)
			a_string.remove_head (3)
			assert_equal ("removed2", "%%/444/ar", a_string.out)
			a_string.remove_head (10)
			assert_equal ("removed3", "", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (333, 3)
			a_string.put_item_code (444, 4)
			a_string.remove_head (6)
			assert_equal ("removed4", "", a_string.out)
		end

	test_remove_tail1
			-- Test feature `remove_tail'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (333, 3)
			a_string.put_item_code (444, 4)
			a_string.remove_tail (0)
			assert_equal ("removed1", "fo%%/333/%%/444/ar", a_string.out)
			a_string.remove_tail (3)
			assert_equal ("removed2", "fo%%/333/", a_string.out)
			a_string.remove_tail (10)
			assert_equal ("removed3", "", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (333, 3)
			a_string.put_item_code (444, 4)
			a_string.remove_tail (6)
			assert_equal ("removed4", "", a_string.out)
		end

	test_hash_code1
			-- Test feature `hash_code'.
		local
			a_string, a_string2: UC_STRING
			s: STRING
			c: CHARACTER
		do
			create a_string.make_from_string ("foobar")
			a_string.append_item_code (978)
			assert ("hash_code1", a_string.hash_code = a_string.hash_code)
			create a_string2.make_from_string ("foobar")
			a_string2.append_item_code (978)
			assert ("hash_code2", a_string.hash_code = a_string2.hash_code)
			s := "foobar"
			create a_string.make_from_string (STRING_.cloned_string (s))
			assert ("same_string1", a_string.same_string (s))
			assert_integers_equal ("same_hash_code1", s.hash_code, a_string.hash_code)
			s := ""
			create a_string.make_from_string (STRING_.cloned_string (s))
			assert ("same_string2", a_string.same_string (s))
			assert_integers_equal ("same_hash_code2", s.hash_code, a_string.hash_code)
			s := "foo"
			c := INTEGER_.to_character (Platform.Maximum_character_code)
			s.append_character (c)
			s.append_string ("bar")
			create a_string.make_from_string (STRING_.cloned_string (s))
			assert ("same_string3", a_string.same_string (s))
			assert_integers_equal ("same_hash_code3", s.hash_code, a_string.hash_code)
		end

	test_hash_code2
			-- Test feature `hash_code'.
		local
			a_string, a_string2: STRING
			s: STRING
			c: CHARACTER
		do
			create {UC_STRING} a_string.make_from_string ("foobar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string1", False)
			else
				uc_string.append_item_code (978)
				assert ("hash_code1", a_string.hash_code = a_string.hash_code)
			end
			create {UC_STRING} a_string2.make_from_string ("foobar")
			if not attached {UC_STRING} a_string2 as uc_string then
				assert ("uc_string2", False)
			else
				uc_string.append_item_code (978)
				assert ("hash_code2", a_string.hash_code = a_string2.hash_code)
			end
			s := "foobar"
			create {UC_STRING} a_string.make_from_string (STRING_.cloned_string (s))
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string3", False)
			else
				assert ("same_string1", uc_string.same_string (s))
				assert_integers_equal ("same_hash_code1", s.hash_code, a_string.hash_code)
			end
			s := ""
			create {UC_STRING} a_string.make_from_string (STRING_.cloned_string (s))
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string4", False)
			else
				assert ("same_string2", uc_string.same_string (s))
				assert_integers_equal ("same_hash_code2", s.hash_code, a_string.hash_code)
			end
			s := "foo"
			c := INTEGER_.to_character (Platform.Maximum_character_code)
			s.append_character (c)
			s.append_string ("bar")
			create {UC_STRING} a_string.make_from_string (STRING_.cloned_string (s))
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string5", False)
			else
				assert ("same_string3", uc_string.same_string (s))
				assert_integers_equal ("same_hash_code3", s.hash_code, a_string.hash_code)
			end
		end

	test_same_string1
			-- Test feature `same_string'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("foo")
			assert ("not_same1", not a_string.same_string (a_string2))
			assert ("not_same2", not a_string.same_string ("bar"))
			assert ("same1", a_string.same_string (a_string))
			assert ("same2", a_string.same_string ("foobar"))
			create a_string2.make_from_string ("foobar")
			assert ("same3", a_string.same_string (a_string2))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("foo")
			a_string2.append_item_code (too_big_character2)
			a_string2.append_string ("bar")
			assert ("same4", a_string.same_string (a_string2))
-- The semantics of `same_string' has changed in class STRING.
--			assert ("same5", a_string.same_string ("foo%Ubar"))
		end

	test_same_unicode_string1
			-- Test feature `same_unicode_string'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("foo")
			assert ("not_same1", not a_string.same_unicode_string (a_string2))
			assert ("not_same2", not a_string.same_unicode_string ("bar"))
			assert ("same1", a_string.same_unicode_string (a_string))
			assert ("same2", a_string.same_unicode_string ("foobar"))
			create a_string2.make_from_string ("foobar")
			assert ("same3", a_string.same_unicode_string (a_string2))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("foo")
			a_string2.append_item_code (too_big_character2)
			a_string2.append_string ("bar")
			assert ("not_same3", not a_string.same_unicode_string (a_string2))
			assert ("not_same4", not a_string.same_unicode_string ("foo%Ubar"))
			create a_string2.make_from_string ("foo")
			a_string2.append_item_code (too_big_character)
			a_string2.append_string ("bar")
			assert ("same4", a_string.same_unicode_string (a_string2))
		end

	test_string1
			-- Test feature `string'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			assert_equal ("string1", "foobar", a_string.string)
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			assert_equal ("string2", "foo%Ubar", a_string.string)
			create a_string.make (0)
			assert_equal ("string3", "", a_string.string)
		end

	test_fill_with_unicode1
			-- Test feature `fill_with_unicode'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("foobar")
			create c.make_from_character ('z')
			a_string.fill_with_unicode (c)
			assert_equal ("filled1", "zzzzzz", a_string.out)
			create a_string.make_from_string ("foo")
			create c.make_from_code (777)
			a_string.fill_with_unicode (c)
			assert_equal ("filled2", "%%/777/%%/777/%%/777/", a_string.out)
			create a_string.make_empty
			a_string.fill_with_unicode (c)
			assert_equal ("filled3", "", a_string.out)
		end

	test_fill_with_code1
			-- Test feature `fill_with_code'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.fill_with_code (('z').code)
			assert_equal ("filled1", "zzzzzz", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.fill_with_code (777)
			assert_equal ("filled2", "%%/777/%%/777/%%/777/", a_string.out)
			create a_string.make_empty
			a_string.fill_with_code (444)
			assert_equal ("filled3", "", a_string.out)
		end

	test_fill_with1
			-- Test feature `fill_with'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.fill_with ('z')
			assert_equal ("filled1", "zzzzzz", a_string.out)
			create a_string.make_empty
			a_string.fill_with ('a')
			assert_equal ("filled3", "", a_string.out)
		end

	test_unicode_substring_index1
			-- Test feature `unicode_substring_index'.
		local
			a_string: UC_STRING
			a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("bar")
			assert_integers_equal ("index1", 4, a_string.unicode_substring_index (a_string2, 1))
			assert_integers_equal ("index2", 4, a_string.unicode_substring_index (a_string2, 2))
			assert_integers_equal ("index3", 4, a_string.unicode_substring_index (a_string2, 3))
			assert_integers_equal ("index4", 4, a_string.unicode_substring_index (a_string2, 4))
			assert_integers_equal ("index5", 0, a_string.unicode_substring_index (a_string2, 5))
			assert_integers_equal ("index6", 0, a_string.unicode_substring_index (a_string2, 6))
			assert_integers_equal ("index7", 0, a_string.unicode_substring_index (a_string2, 7))
			assert_integers_equal ("index8", 4, a_string.unicode_substring_index ("bar", 1))
			assert_integers_equal ("index9", 4, a_string.unicode_substring_index ("bar", 2))
			assert_integers_equal ("index10", 4, a_string.unicode_substring_index ("bar", 3))
			assert_integers_equal ("index11", 4, a_string.unicode_substring_index ("bar", 4))
			assert_integers_equal ("index12", 0, a_string.unicode_substring_index ("bar", 5))
			assert_integers_equal ("index13", 0, a_string.unicode_substring_index ("bar", 6))
			assert_integers_equal ("index14", 0, a_string.unicode_substring_index ("bar", 7))
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foobar")
			assert_integers_equal ("index15", 0, a_string.unicode_substring_index (a_string2, 1))
			assert_integers_equal ("index16", 0, a_string.unicode_substring_index (a_string2, 2))
			assert_integers_equal ("index17", 0, a_string.unicode_substring_index (a_string2, 3))
			assert_integers_equal ("index18", 0, a_string.unicode_substring_index (a_string2, 4))
			assert_integers_equal ("index19", 1, a_string.unicode_substring_index ("", 1))
			assert_integers_equal ("index20", 2, a_string.unicode_substring_index ("", 2))
			assert_integers_equal ("index21", 3, a_string.unicode_substring_index ("", 3))
			assert_integers_equal ("index22", 4, a_string.unicode_substring_index ("", 4))
			assert_integers_equal ("index23", 1, a_string.unicode_substring_index (a_string, 1))
			assert_integers_equal ("index24", 0, a_string.unicode_substring_index (a_string, 2))
			assert_integers_equal ("index25", 0, a_string.unicode_substring_index (a_string, 3))
			assert_integers_equal ("index26", 0, a_string.unicode_substring_index (a_string, 4))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("o")
			a_string2.append_item_code (too_big_character)
			a_string2.append_string ("b")
			assert_integers_equal ("index27", 3, a_string.unicode_substring_index (a_string2, 1))
			assert_integers_equal ("index28", 3, a_string.unicode_substring_index (a_string2, 2))
			assert_integers_equal ("index29", 3, a_string.unicode_substring_index (a_string2, 3))
			assert_integers_equal ("index30", 0, a_string.unicode_substring_index (a_string2, 4))
			assert_integers_equal ("index31", 0, a_string.unicode_substring_index (a_string2, 5))
			assert_integers_equal ("index32", 0, a_string.unicode_substring_index (a_string2, 6))
			assert_integers_equal ("index33", 0, a_string.unicode_substring_index (a_string2, 7))
			assert_integers_equal ("index34", 0, a_string.unicode_substring_index (a_string2, 8))
		end

	test_substring_index1
			-- Test feature `substring_index'.
		local
			a_string: UC_STRING
			a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("bar")
			assert_integers_equal ("index1", 4, a_string.substring_index (a_string2, 1))
			assert_integers_equal ("index2", 4, a_string.substring_index (a_string2, 2))
			assert_integers_equal ("index3", 4, a_string.substring_index (a_string2, 3))
			assert_integers_equal ("index4", 4, a_string.substring_index (a_string2, 4))
			assert_integers_equal ("index5", 0, a_string.substring_index (a_string2, 5))
			assert_integers_equal ("index6", 0, a_string.substring_index (a_string2, 6))
			assert_integers_equal ("index7", 0, a_string.substring_index (a_string2, 7))
			assert_integers_equal ("index8", 4, a_string.substring_index ("bar", 1))
			assert_integers_equal ("index9", 4, a_string.substring_index ("bar", 2))
			assert_integers_equal ("index10", 4, a_string.substring_index ("bar", 3))
			assert_integers_equal ("index11", 4, a_string.substring_index ("bar", 4))
			assert_integers_equal ("index12", 0, a_string.substring_index ("bar", 5))
			assert_integers_equal ("index13", 0, a_string.substring_index ("bar", 6))
			assert_integers_equal ("index14", 0, a_string.substring_index ("bar", 7))
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foobar")
			assert_integers_equal ("index15", 0, a_string.substring_index (a_string2, 1))
			assert_integers_equal ("index16", 0, a_string.substring_index (a_string2, 2))
			assert_integers_equal ("index17", 0, a_string.substring_index (a_string2, 3))
			assert_integers_equal ("index18", 0, a_string.substring_index (a_string2, 4))
			assert_integers_equal ("index19", 1, a_string.substring_index ("", 1))
			assert_integers_equal ("index20", 2, a_string.substring_index ("", 2))
			assert_integers_equal ("index21", 3, a_string.substring_index ("", 3))
			assert_integers_equal ("index22", 4, a_string.substring_index ("", 4))
			assert_integers_equal ("index23", 1, a_string.substring_index (a_string, 1))
			assert_integers_equal ("index24", 0, a_string.substring_index (a_string, 2))
			assert_integers_equal ("index25", 0, a_string.substring_index (a_string, 3))
			assert_integers_equal ("index26", 0, a_string.substring_index (a_string, 4))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("o")
			a_string2.append_item_code (too_big_character)
			a_string2.append_string ("b")
			assert_integers_equal ("index27", 3, a_string.substring_index (a_string2, 1))
			assert_integers_equal ("index28", 3, a_string.substring_index (a_string2, 2))
			assert_integers_equal ("index29", 3, a_string.substring_index (a_string2, 3))
			assert_integers_equal ("index30", 0, a_string.substring_index (a_string2, 4))
			assert_integers_equal ("index31", 0, a_string.substring_index (a_string2, 5))
			assert_integers_equal ("index32", 0, a_string.substring_index (a_string2, 6))
			assert_integers_equal ("index33", 0, a_string.substring_index (a_string2, 7))
			assert_integers_equal ("index34", 0, a_string.substring_index (a_string2, 8))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("o")
			a_string2.append_item_code (too_big_character2)
			a_string2.append_string ("b")
			assert_integers_equal ("index35", 3, a_string.substring_index (a_string2, 1))
			assert_integers_equal ("index36", 3, a_string.substring_index (a_string2, 2))
			assert_integers_equal ("index37", 3, a_string.substring_index (a_string2, 3))
			assert_integers_equal ("index38", 0, a_string.substring_index (a_string2, 4))
			assert_integers_equal ("index39", 0, a_string.substring_index (a_string2, 5))
			assert_integers_equal ("index40", 0, a_string.substring_index (a_string2, 6))
			assert_integers_equal ("index41", 0, a_string.substring_index (a_string2, 7))
			assert_integers_equal ("index42", 0, a_string.substring_index (a_string2, 8))
		end

	test_has_unicode_substring1
			-- Test feature `has_unicode_substring'.
		local
			a_string: UC_STRING
			a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("bar")
			assert ("has1", a_string.has_unicode_substring (a_string2))
			assert ("has2", a_string.has_unicode_substring ("bar"))
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foobar")
			assert ("not_has1", not a_string.has_unicode_substring (a_string2))
			assert ("has3", a_string.has_unicode_substring (""))
			assert ("has4", a_string.has_unicode_substring (a_string))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("o")
			a_string2.append_item_code (too_big_character)
			a_string2.append_string ("b")
			assert ("has5", a_string.has_unicode_substring (a_string2))
		end

	test_has_substring1
			-- Test feature `has_substring'.
		local
			a_string: UC_STRING
			a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("bar")
			assert ("has1", a_string.has_substring (a_string2))
			assert ("has2", a_string.has_substring ("bar"))
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foobar")
			assert ("not_has1", not a_string.has_substring (a_string2))
			assert ("has3", a_string.has_substring (""))
			assert ("has4", a_string.has_substring (a_string))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("o")
			a_string2.append_item_code (too_big_character)
			a_string2.append_string ("b")
			assert ("has5", a_string.has_substring (a_string2))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (too_big_character)
			a_string.append_string ("bar")
			create a_string2.make_from_string ("o")
			a_string2.append_item_code (too_big_character2)
			a_string2.append_string ("b")
			assert ("has6", a_string.has_substring (a_string2))
		end

	test_is_empty1
			-- Test feature `is_empty'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			assert ("not_empty1", not a_string.is_empty)
			create a_string.make (15)
			assert ("empty1", a_string.is_empty)
			a_string.append_item_code (345)
			assert ("not_empty2", not a_string.is_empty)
		end

	test_replace_substring1
			-- Test feature `replace_substring'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("")
			a_string.replace_substring (a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.replace_substring (a_string, 4, 6)
			assert_equal ("replaced5", "foofoobar", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 4, 3)
			assert_equal ("replaced6", "foototobar", a_string.out)
		end

	test_replace_substring2
			-- Test feature `replace_substring'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foobar")
			create {UC_STRING} a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foobar")
			create {UC_STRING} a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foobar")
			create {UC_STRING} a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foobar")
			create {UC_STRING} a_string2.make_from_string ("")
			a_string.replace_substring (a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foobar")
			a_string.replace_substring (a_string, 4, 6)
			assert_equal ("replaced5", "foofoobar", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foobar")
			create {UC_STRING} a_string2.make_from_string ("toto")
			a_string.replace_substring (a_string2, 4, 3)
			assert_equal ("replaced6", "foototobar", a_string.out)
		end

	test_replace_substring_by_string1
			-- Test feature `replace_substring_by_string'.
		local
			a_string, a_string2: UC_STRING
			a_string3: STRING
			a_string4: UC_UTF8_STRING
		do
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("")
			a_string.replace_substring_by_string (a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.replace_substring_by_string (a_string, 4, 6)
			assert_equal ("replaced5", "foofoobar", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string2, 4, 3)
			assert_equal ("replaced6", "foototobar", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string3 := "toto"
			a_string.replace_substring_by_string (a_string3, 1, 6)
			assert_equal ("replaced7", "toto", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string3 := "toto"
			a_string.replace_substring_by_string (a_string3, 1, 1)
			assert_equal ("replaced8", "totooobar", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string3 := "toto"
			a_string.replace_substring_by_string (a_string3, 4, 6)
			assert_equal ("replaced9", "foototo", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string3 := ""
			a_string.replace_substring_by_string (a_string3, 2, 4)
			assert_equal ("replaced10", "far", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string3 := "toto"
			a_string.replace_substring_by_string (a_string3, 4, 3)
			assert_equal ("replaced11", "foototobar", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string4, 1, 6)
			assert_equal ("replaced12", "toto", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string4, 1, 1)
			assert_equal ("replaced13", "totooobar", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string4, 4, 6)
			assert_equal ("replaced14", "foototo", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string4.make_from_string ("")
			a_string.replace_substring_by_string (a_string4, 2, 4)
			assert_equal ("replaced15", "far", a_string.out)
			create a_string.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string.replace_substring_by_string (a_string4, 4, 3)
			assert_equal ("replaced16", "foototobar", a_string.out)
		end

	test_insert_unicode_character1
			-- Test feature `insert_unicode_character'.
		local
			a_string: UC_STRING
			c: UC_CHARACTER
		do
			create a_string.make_from_string ("bar")
			create c.make_from_character ('f')
			a_string.insert_unicode_character (c, 4)
			assert_equal ("inserted1", "barf", a_string.out)
			create c.make_from_code (68457)
			a_string.insert_unicode_character (c, 2)
			assert_equal ("inserted2", "b%%/68457/arf", a_string.out)
			create a_string.make_from_string ("")
			create c.make_from_code (462)
			a_string.insert_unicode_character (c, 1)
			assert_equal ("inserted3", "%%/462/", a_string.out)
			create c.make_from_character ('z')
			a_string.insert_unicode_character (c, 1)
			assert_equal ("inserted4", "z%%/462/", a_string.out)
		end

	test_insert_code1
			-- Test feature `insert_code'.
		local
			a_string: UC_STRING
			a_code: INTEGER
		do
			create a_string.make_from_string ("bar")
			a_code := ('f').code
			a_string.insert_code (a_code, 4)
			assert_equal ("inserted1", "barf", a_string.out)
			a_code := 68457
			a_string.insert_code (a_code, 2)
			assert_equal ("inserted2", "b%%/68457/arf", a_string.out)
			create a_string.make_from_string ("")
			a_code := 462
			a_string.insert_code (a_code, 1)
			assert_equal ("inserted3", "%%/462/", a_string.out)
			a_code := ('z').code
			a_string.insert_code (a_code, 1)
			assert_equal ("inserted4", "z%%/462/", a_string.out)
		end

	test_insert_character1
			-- Test feature `insert_character'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("bar")
			a_string.insert_character ('f', 4)
			assert_equal ("inserted1", "barf", a_string.out)
			a_string.insert_character ('o', 2)
			assert_equal ("inserted2", "boarf", a_string.out)
			create a_string.make_from_string ("")
			a_string.insert_character ('t', 1)
			assert_equal ("inserted3", "t", a_string.out)
			a_string.insert_character ('z', 1)
			assert_equal ("inserted4", "zt", a_string.out)
		end

	test_insert_string1
			-- Test feature `insert_string'.
		local
			a_string: UC_STRING
			uc_string: UC_STRING
		do
			create a_string.make_from_string ("foo")
			a_string.insert_string ("bar", 4)
			assert_equal ("inserted1", "foobar", a_string.out)
			create a_string.make_from_string ("")
			a_string.insert_string ("bar", 1)
			assert_equal ("inserted2", "bar", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.insert_string ("", 2)
			assert_equal ("inserted3", "foo", a_string.out)
			create uc_string.make (4)
			uc_string.append_item_code (265)
			uc_string.append_item_code (1021)
			uc_string.append_character ('f')
			uc_string.append_item_code (23456)
			a_string.insert_string (uc_string, 3)
			assert_equal ("inserted4", "fo%%/265/%%/1021/f%%/23456/o", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.insert_string (a_string, 2)
			assert_equal ("inserted5", "ffoooo", a_string.out)
			create a_string.make_from_string ("bar")
			a_string.put_item_code (888, 2)
			a_string.insert_string (a_string, 1)
			assert_equal ("inserted6", "b%%/888/rb%%/888/r", a_string.out)
		end

	test_remove_substring1
			-- Test feature `remove_substring'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.remove_substring (1, 6)
			assert_equal ("removed1", "", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.remove_substring (1, 1)
			assert_equal ("removed2", "oobar", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.remove_substring (4, 6)
			assert_equal ("removed3", "foo", a_string.out)
			create a_string.make_from_string ("foobar")
			a_string.remove_substring (4, 3)
			assert_equal ("removed4", "foobar", a_string.out)
			create a_string.make_from_string ("")
			a_string.remove_substring (1, 0)
			assert_equal ("removed5", "", a_string.out)
		end

	test_wipe_out1
			-- Test feature `wipe_out'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.wipe_out
			assert_equal ("wiped_out1", "", a_string.out)
			create a_string.make_empty
			a_string.wipe_out
			assert_equal ("wiped_out2", "", a_string.out)
			create a_string.make_from_string ("foo")
			a_string.append_item_code (888)
			a_string.append_string ("bar")
			a_string.wipe_out
			assert_equal ("wiped_out3", "", a_string.out)
		end

	test_wipe_out2
			-- Test feature `wipe_out'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foobar")
			a_string.wipe_out
			assert_equal ("wiped_out1", "", a_string.out)
			create {UC_STRING} a_string.make_empty
			a_string.wipe_out
			assert_equal ("wiped_out2", "", a_string.out)
			create {UC_STRING} a_string.make_from_string ("foo")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.append_item_code (888)
				uc_string.append_string ("bar")
				a_string.wipe_out
				assert_equal ("wiped_out3", "", a_string.out)
			end
		end

	test_remove1
			-- Test feature `remove'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foobar")
			a_string.put_item_code (367, 4)
			a_string.remove (1)
			assert_equal ("removed1", "oo%%/367/ar", a_string.out)
			a_string.remove (5)
			assert_equal ("removed2", "oo%%/367/a", a_string.out)
			a_string.remove (3)
			assert_equal ("removed3", "ooa", a_string.out)
		end

	test_remove2
			-- Test feature `remove'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foobar")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string", False)
			else
				uc_string.put_item_code (367, 4)
				a_string.remove (1)
				assert_equal ("removed1", "oo%%/367/ar", a_string.out)
				a_string.remove (5)
				assert_equal ("removed2", "oo%%/367/a", a_string.out)
				a_string.remove (3)
				assert_equal ("removed3", "ooa", a_string.out)
			end
		end

	test_to_lower1
			-- Test feature `to_lower'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foo.BAR")
			a_string.to_lower
			assert_equal ("to_lower1", "foo.bar", a_string.out)
			create a_string.make_empty
			a_string.to_lower
			assert_equal ("to_lower2", "", a_string.out)
		end

	test_to_lower2
			-- Test feature `to_lower'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo.BAR")
			a_string.to_lower
			assert_equal ("to_lower1", "foo.bar", a_string.out)
			create {UC_STRING} a_string.make_empty
			a_string.to_lower
			assert_equal ("to_lower2", "", a_string.out)
		end

	test_to_upper1
			-- Test feature `to_upper'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foo.BAR")
			a_string.to_upper
			assert_equal ("to_upper1", "FOO.BAR", a_string.out)
			create a_string.make_empty
			a_string.to_upper
			assert_equal ("to_upper2", "", a_string.out)
		end

	test_to_upper2
			-- Test feature `to_upper'.
		local
			a_string: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo.BAR")
			a_string.to_upper
			assert_equal ("to_upper1", "FOO.BAR", a_string.out)
			create {UC_STRING} a_string.make_empty
			a_string.to_upper
			assert_equal ("to_upper2", "", a_string.out)
		end

	test_as_lower1
			-- Test feature `as_lower'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foo.BAR")
			a_string2 := a_string.as_lower
			assert ("new_string", a_string2 /= a_string)
			assert_equal ("as_lower1", "foo.bar", a_string2.out)
			create a_string.make_empty
			assert_equal ("to_lower2", "", a_string.as_lower.out)
		end

	test_as_upper1
			-- Test feature `as_upper'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foo.BAR")
			a_string2 := a_string.as_upper
			assert ("new_string", a_string2 /= a_string)
			assert_equal ("as_upper1", "FOO.BAR", a_string2.out)
			create a_string.make_empty
			assert_equal ("to_upper2", "", a_string.as_upper.out)
		end

	test_infix_less1
			-- Test feature `is_less' with 'alias "<"'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("bar")
			assert ("not_less1", not (a_string < a_string2))
			assert ("not_less2", not (a_string < a_string))
			assert ("less1", a_string2 < a_string)
			create a_string.make_from_string ("fo")
			create a_string2.make_from_string ("foo")
			assert ("less2", a_string < a_string2)
			assert ("not_less3", not (a_string2 < a_string))
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("foo")
			assert ("less3", a_string < a_string2)
			assert ("not_less4", not (a_string2 < a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert ("not_less5", not (a_string < a_string2))
			assert ("not_less6", not (a_string2 < a_string))
			create a_string.make_from_string ("foo")
			a_string.append_item_code (3333)
			create a_string2.make_from_string ("foo")
			a_string2.append_item_code (9999)
			assert ("less4", a_string < a_string2)
			assert ("not_less7", not (a_string2 < a_string))
		end

	test_infix_less2
			-- Test feature `is_less' with 'alias "<"'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("bar")
			assert ("not_less1", not (a_string < a_string2))
			assert ("not_less2", not (a_string < a_string))
			assert ("less1", a_string2 < a_string)
			create {UC_STRING} a_string.make_from_string ("fo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("less2", a_string < a_string2)
			assert ("not_less3", not (a_string2 < a_string))
			create {UC_STRING} a_string.make_from_string ("")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("less3", a_string < a_string2)
			assert ("not_less4", not (a_string2 < a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("not_less5", not (a_string < a_string2))
			assert ("not_less6", not (a_string2 < a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string1", False)
			else
				uc_string.append_item_code (3333)
			end
			create {UC_STRING} a_string2.make_from_string ("foo")
			if not attached {UC_STRING} a_string2 as uc_string then
				assert ("uc_string2", False)
			else
				uc_string.append_item_code (9999)
			end
			assert ("less4", a_string < a_string2)
			assert ("not_less7", not (a_string2 < a_string))
		end

	test_infix_less_equal1
			-- Test feature `is_less_equal' with 'alias "<="'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("bar")
			assert ("not_less1", not (a_string <= a_string2))
			assert ("less1", a_string <= a_string)
			assert ("less2", a_string2 <= a_string)
			create a_string.make_from_string ("fo")
			create a_string2.make_from_string ("foo")
			assert ("less3", a_string <= a_string2)
			assert ("not_less2", not (a_string2 <= a_string))
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("foo")
			assert ("less4", a_string <= a_string2)
			assert ("not_less3", not (a_string2 <= a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert ("less5", a_string <= a_string2)
			assert ("less6", a_string2 <= a_string)
			create a_string.make_from_string ("foo")
			a_string.append_item_code (3333)
			create a_string2.make_from_string ("foo")
			a_string2.append_item_code (9999)
			assert ("less7", a_string <= a_string2)
			assert ("not_less4", not (a_string2 <= a_string))
		end

	test_infix_less_equal2
			-- Test feature `is_less_equal' with 'alias "<="'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("bar")
			assert ("not_less1", not (a_string <= a_string2))
			assert ("less1", a_string <= a_string)
			assert ("less2", a_string2 <= a_string)
			create {UC_STRING} a_string.make_from_string ("fo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("less3", a_string <= a_string2)
			assert ("not_less2", not (a_string2 <= a_string))
			create {UC_STRING} a_string.make_from_string ("")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("less4", a_string <= a_string2)
			assert ("not_less3", not (a_string2 <= a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("less5", a_string <= a_string2)
			assert ("less6", a_string2 <= a_string)
			create {UC_STRING} a_string.make_from_string ("foo")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string1", False)
			else
				uc_string.append_item_code (3333)
			end
			create {UC_STRING} a_string2.make_from_string ("foo")
			if not attached {UC_STRING} a_string2 as uc_string then
				assert ("uc_string2", False)
			else
				uc_string.append_item_code (9999)
			end
			assert ("less7", a_string <= a_string2)
			assert ("not_less4", not (a_string2 <= a_string))
		end

	test_infix_greater1
			-- Test feature `is_greater' with 'alias ">"'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foo")
			assert ("not_greater1", not (a_string > a_string2))
			assert ("not_greater2", not (a_string > a_string))
			assert ("greater1", a_string2 > a_string)
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("fo")
			assert ("greater2", a_string > a_string2)
			assert ("not_greater3", not (a_string2 > a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("")
			assert ("greater3", a_string > a_string2)
			assert ("not_greater4", not (a_string2 > a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert ("not_greater5", not (a_string > a_string2))
			assert ("not_greater6", not (a_string2 > a_string))
			create a_string.make_from_string ("foo")
			a_string2.append_item_code (9999)
			create a_string2.make_from_string ("foo")
			a_string.append_item_code (3333)
			assert ("greater4", a_string > a_string2)
			assert ("not_greater7", not (a_string2 > a_string))
		end

	test_infix_greater2
			-- Test feature `is_greater' with 'alias ">"'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("not_greater1", not (a_string > a_string2))
			assert ("not_greater2", not (a_string > a_string))
			assert ("greater1", a_string2 > a_string)
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("fo")
			assert ("greater2", a_string > a_string2)
			assert ("not_greater3", not (a_string2 > a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("")
			assert ("greater3", a_string > a_string2)
			assert ("not_greater4", not (a_string2 > a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("not_greater5", not (a_string > a_string2))
			assert ("not_greater6", not (a_string2 > a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string1", False)
			else
				uc_string.append_item_code (9999)
			end
			create {UC_STRING} a_string2.make_from_string ("foo")
			if not attached {UC_STRING} a_string2 as uc_string then
				assert ("uc_string2", False)
			else
				uc_string.append_item_code (3333)
			end
			assert ("greater4", a_string > a_string2)
			assert ("not_greater7", not (a_string2 > a_string))
		end

	test_infix_greater_equal1
			-- Test feature `is_greater_equal' with 'alias ">="'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foo")
			assert ("not_greater1", not (a_string >= a_string2))
			assert ("greater1", a_string >= a_string)
			assert ("greater2", a_string2 >= a_string)
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("fo")
			assert ("greater3", a_string >= a_string2)
			assert ("not_greater2", not (a_string2 >= a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("")
			assert ("greater4", a_string >= a_string2)
			assert ("not_greater3", not (a_string2 >= a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert ("greater5", a_string >= a_string2)
			assert ("greater6", a_string2 >= a_string)
			create a_string.make_from_string ("foo")
			a_string2.append_item_code (9999)
			create a_string2.make_from_string ("foo")
			a_string.append_item_code (3333)
			assert ("greater7", a_string >= a_string2)
			assert ("not_greater4", not (a_string2 >= a_string))
		end

	test_infix_greater_equal2
			-- Test feature `is_greater_equal' with 'alias ">="'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("not_greater1", not (a_string >= a_string2))
			assert ("greater1", a_string >= a_string)
			assert ("greater2", a_string2 >= a_string)
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("fo")
			assert ("greater3", a_string >= a_string2)
			assert ("not_greater2", not (a_string2 >= a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("")
			assert ("greater4", a_string >= a_string2)
			assert ("not_greater3", not (a_string2 >= a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert ("greater5", a_string >= a_string2)
			assert ("greater6", a_string2 >= a_string)
			create {UC_STRING} a_string.make_from_string ("foo")
			if not attached {UC_STRING} a_string as uc_string then
				assert ("uc_string1", False)
			else
				uc_string.append_item_code (9999)
			end
			create {UC_STRING} a_string2.make_from_string ("foo")
			if not attached {UC_STRING} a_string2 as uc_string then
				assert ("uc_string2", False)
			else
				uc_string.append_item_code (3333)
			end
			assert ("greater7", a_string >= a_string2)
			assert ("not_greater4", not (a_string2 >= a_string))
		end

	test_min1
			-- Test feature `min'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("bar")
			create a_string2.make_from_string ("foo")
			assert_same ("min1", a_string, a_string.min (a_string2))
			assert_same ("min2", a_string, a_string.min (a_string))
			assert_same ("min3", a_string, a_string2.min (a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("")
			assert_same ("min4", a_string2, a_string.min (a_string2))
			assert_same ("min5", a_string2, a_string2.min (a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert_same ("min6", a_string, a_string.min (a_string2))
			assert_same ("min7", a_string2, a_string2.min (a_string))
		end

	test_min2
			-- Test feature `min'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("bar")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert_same ("min1", a_string, a_string.min (a_string2))
			assert_same ("min2", a_string, a_string.min (a_string))
			assert_same ("min3", a_string, a_string2.min (a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("")
			assert_same ("min4", a_string2, a_string.min (a_string2))
			assert_same ("min5", a_string2, a_string2.min (a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert_same ("min6", a_string, a_string.min (a_string2))
			assert_same ("min7", a_string2, a_string2.min (a_string))
		end

	test_max1
			-- Test feature `max'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("bar")
			assert_same ("max1", a_string, a_string.max (a_string2))
			assert_same ("max2", a_string, a_string.max (a_string))
			assert_same ("max3", a_string, a_string2.max (a_string))
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("foo")
			assert_same ("max4", a_string2, a_string.max (a_string2))
			assert_same ("max5", a_string2, a_string2.max (a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert_same ("max6", a_string, a_string.max (a_string2))
			assert_same ("max7", a_string2, a_string2.max (a_string))
		end

	test_max2
			-- Test feature `max'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("bar")
			assert_same ("max1", a_string, a_string.max (a_string2))
			assert_same ("max2", a_string, a_string.max (a_string))
			assert_same ("max3", a_string, a_string2.max (a_string))
			create {UC_STRING} a_string.make_from_string ("")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert_same ("max4", a_string2, a_string.max (a_string2))
			assert_same ("max5", a_string2, a_string2.max (a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert_same ("max6", a_string, a_string.max (a_string2))
			assert_same ("max7", a_string2, a_string2.max (a_string))
		end

	test_three_way_comparison1
			-- Test feature `three_way_comparison'.
		local
			a_string, a_string2: UC_STRING
		do
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("bar")
			assert_integers_equal ("compare1", 1, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare2", 0, a_string.three_way_comparison (a_string))
			assert_integers_equal ("compare3", -1, a_string2.three_way_comparison (a_string))
			create a_string.make_from_string ("")
			create a_string2.make_from_string ("foo")
			assert_integers_equal ("compare4", -1, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare5", 1, a_string2.three_way_comparison (a_string))
			create a_string.make_from_string ("foo")
			create a_string2.make_from_string ("foo")
			assert_integers_equal ("compare6", 0, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare7", 0, a_string2.three_way_comparison (a_string))
		end

	test_three_way_comparison2
			-- Test feature `three_way_comparison'.
		local
			a_string, a_string2: STRING
		do
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("bar")
			assert_integers_equal ("compare1", 1, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare2", 0, a_string.three_way_comparison (a_string))
			assert_integers_equal ("compare3", -1, a_string2.three_way_comparison (a_string))
			create {UC_STRING} a_string.make_from_string ("")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert_integers_equal ("compare4", -1, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare5", 1, a_string2.three_way_comparison (a_string))
			create {UC_STRING} a_string.make_from_string ("foo")
			create {UC_STRING} a_string2.make_from_string ("foo")
			assert_integers_equal ("compare6", 0, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare7", 0, a_string2.three_way_comparison (a_string))
		end

	test_is_ascii1
			-- Test feature `is_ascii'.
		local
			a_string: UC_STRING
		do
			create a_string.make_from_string ("foo")
			assert ("is_ascii1", a_string.is_ascii)
			create a_string.make_empty
			assert ("is_ascii2", a_string.is_ascii)
			create a_string.make_from_string ("foo")
			a_string.append_item_code (130)
			a_string.append_string ("bar")
			assert ("not_is_ascii1", not a_string.is_ascii)
		end

feature {NONE} -- Implementation

	too_big_character: INTEGER
			-- Code of a character that does not fit into a CHARACTER
		once
			Result := Platform.Maximum_character_code + 1
		ensure
			too_big: Result > Platform.Maximum_character_code
		end

	too_big_character2: INTEGER
			-- Code of a character that does not fit into a CHARACTER
		once
			Result := Platform.Maximum_character_code + 2
		ensure
			too_big: Result > Platform.Maximum_character_code
			different: Result /= too_big_character
		end

end
