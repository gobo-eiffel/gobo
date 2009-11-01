indexing

	description:

		"Test features of class KL_STRING_ROUTINES"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_STRING_ROUTINES

inherit

	KL_TEST_CASE

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_ANY_ROUTINES
	KL_SHARED_PLATFORM

create

	make_default

feature -- Test

	test_make_from_string is
			-- Test feature `make_from_string'.
		local
			a_string, foo: STRING
			uc_string: UC_UTF8_STRING
			bnullr: STRING
		do
			foo := STRING_.cloned_string ("foo")
			a_string := STRING_.make_from_string (foo)
			assert ("not_void1", a_string /= Void)
			assert ("string_type1", ANY_.same_types (a_string, ""))
			assert ("new_string1", a_string /= foo)
			assert_equal ("same_string1", "foo", a_string)
			create uc_string.make_from_string ("bar")
			a_string := STRING_.make_from_string (uc_string)
			assert ("not_void2", a_string /= Void)
			assert ("string_type2", ANY_.same_types (a_string, ""))
			assert ("new_string2", a_string /= uc_string)
			assert_equal ("same_string2", "bar", a_string)
			uc_string.put_item_code (too_big_character, 2)
			a_string := STRING_.make_from_string (uc_string)
			assert ("not_void3", a_string /= Void)
			assert ("string_type3", ANY_.same_types (a_string, ""))
			assert ("new_string3", a_string /= uc_string)
			bnullr := STRING_.cloned_string ("b%Ur")
			assert_equal ("same_string3", bnullr, a_string)
		end

	test_make_buffer is
			-- Test feature `make_buffer'.
		local
			a_string: STRING
		do
			a_string := STRING_.make_buffer (4)
			assert ("not_void1", a_string /= Void)
			assert ("string_type1", ANY_.same_types (a_string, ""))
			assert_integers_equal ("count1", 4,  a_string.count)
			a_string := STRING_.make_buffer (0)
			assert ("not_void2", a_string /= Void)
			assert ("string_type2", ANY_.same_types (a_string, ""))
			assert_integers_equal ("count2", 0,  a_string.count)
		end

	test_has_substring is
			-- Test feature `has_substring'.
		local
			a_string1: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := STRING_.cloned_string ("foobar")
			assert ("has1", STRING_.has_substring (a_string1, "oo"))
			assert ("has2", STRING_.has_substring (a_string1, "foobar"))
			assert ("has3", STRING_.has_substring (a_string1, a_string1))
			assert ("has4", STRING_.has_substring (a_string1, ""))
			assert ("not_has1", not STRING_.has_substring (a_string1, "gobo"))
			create uc_string1.make_from_string ("bar")
			assert ("has5", STRING_.has_substring (a_string1, uc_string1))
			uc_string1.put_item_code (too_big_character, 2)
			assert ("not_has2", not STRING_.has_substring (a_string1, uc_string1))
			a_string1.put ('%U', 5)
			assert ("has6", STRING_.has_substring (a_string1, uc_string1))
			create uc_string1.make_from_string ("gobo-eiffel")
			uc_string1.put_item_code (too_big_character, 5)
			assert ("has7", STRING_.has_substring (uc_string1, "gobo"))
			assert ("has8", STRING_.has_substring (uc_string1, ""))
			create uc_string2.make_from_string ("boteif")
			uc_string2.put_item_code (too_big_character2, 3)
			assert ("has9", STRING_.has_substring (uc_string1, uc_string2))
			uc_string2.put ('-', 3)
			assert ("not_has3", not STRING_.has_substring (uc_string1, uc_string2))
			uc_string1.put ('-', 5)
			assert ("has10", STRING_.has_substring (uc_string1, uc_string2))
			assert ("has11", STRING_.has_substring (uc_string1, uc_string1))
		end

	test_is_decimal is
			-- Test feature `is_decimal'.
		local
			uc_string: UC_UTF8_STRING
		do
			assert ("is_decimal1", STRING_.is_decimal ("1234"))
			assert ("is_decimal2", STRING_.is_decimal ("00078"))
			assert ("not_integer1", not STRING_.is_decimal ("1234a"))
			assert ("not_integer2", not STRING_.is_decimal (""))
			create uc_string.make_from_string ("4534")
			assert ("is_decimal3", STRING_.is_decimal (uc_string))
			uc_string.put_item_code (9878, 2)
			assert ("not_integer3", not STRING_.is_decimal (uc_string))
		end

	test_is_integer_64 is
			-- Test feature `is_integer_64'.
		local
			uc_string: UC_UTF8_STRING
		do
			assert ("is_integer_64_1", STRING_.is_integer_64 ("1234"))
			assert ("is_integer_64_2", STRING_.is_integer_64 ("00078"))
			create uc_string.make_from_string ("4534")
			assert ("is_integer_64_3", STRING_.is_integer_64 (uc_string))
			assert ("is_integer_64_4", STRING_.is_integer_64 ("9223372036854775807"))
			assert ("is_integer_64_5", STRING_.is_integer_64 ("+0000000009223372036854775807"))
			assert ("is_integer_64_6", STRING_.is_integer_64 ("-0000000009223372036854775808"))
			assert ("not_is_integer_64_1", not STRING_.is_integer_64 ("9223372036854775808"))
			assert ("not_is_integer_64_2", not STRING_.is_integer_64 ("10223372036854775807"))
			assert ("not_is_integer_64_3", not STRING_.is_integer_64 ("00019223372136854775807"))
			assert ("not_is_integer_64_4", not STRING_.is_integer_64 ("-+019223372136854775807"))
			assert ("not_is_integer_64_5", not STRING_.is_integer_64 ("0+019223372136854775807"))
		end

	test_to_integer_64 is
			-- Test feature `to_integer_64'.
		local
			uc_string: UC_UTF8_STRING
		do
			assert_equal ("to_integer_64_1", (1234).to_integer_64, STRING_.to_integer_64 ("1234"))
			assert_equal ("to_integer_64_2", (78).to_integer_64, STRING_.to_integer_64 ("00078"))
			create uc_string.make_from_string ("4534")
			assert_equal ("to_integer_64_3", (4534).to_integer_64, STRING_.to_integer_64 (uc_string))
			assert_equal ("to_integer_64_4", Platform.Maximum_integer_64, STRING_.to_integer_64 ("9223372036854775807"))
			assert_equal ("to_integer_64_5", Platform.Maximum_integer_64, STRING_.to_integer_64 ("+0000000009223372036854775807"))
			assert_equal ("to_integer_64_6", Platform.Minimum_integer_64, STRING_.to_integer_64 ("-0000000009223372036854775808"))
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
			uc_string.put_item_code (9878, 2)
			assert ("not_hexa3", not STRING_.is_hexadecimal (uc_string))
		end

	test_to_utf16_be is
			-- Test feature `to_utf16_be'.
		local
			a_unicode: UC_STRING
			a_string, a_byte_string: STRING
		do
			a_string := "M"
			a_byte_string := STRING_.to_utf16_be (a_string)
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 2, a_byte_string.count)
			assert_integers_equal ("first_byte1", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 77, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := STRING_.to_utf16_be (a_unicode)
			assert ("no_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 2, a_byte_string.count)
			assert_integers_equal ("first_byte2", 4, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 48, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := STRING_.to_utf16_be (a_unicode)
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 2, a_byte_string.count)
			assert_integers_equal ("first_byte3", 78, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 140, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := STRING_.to_utf16_be (a_unicode)
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 216, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 223, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 2, a_byte_string.item_code (4))
		end

	test_to_utf16_le is
			-- Test feature `to_utf16_le'.
		local
			a_unicode: UC_STRING
			a_string, a_byte_string: STRING
		do
			a_string := "M"
			a_byte_string := STRING_.to_utf16_le (a_string)
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 2, a_byte_string.count)
			assert_integers_equal ("first_byte1", 77, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 0, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := STRING_.to_utf16_le (a_unicode)
			assert ("not_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 2, a_byte_string.count)
			assert_integers_equal ("first_byte2", 48, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 4, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := STRING_.to_utf16_le (a_unicode)
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 2, a_byte_string.count)
			assert_integers_equal ("first_byte3", 140, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 78, a_byte_string.item_code (2))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := STRING_.to_utf16_le (a_unicode)
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 216, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 2, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 223, a_byte_string.item_code (4))
		end

	test_to_utf32_be is
			-- Test feature `to_utf32_be'.
		local
			a_unicode: UC_STRING
			a_string, a_byte_string: STRING
		do
			a_string := "M"
			a_byte_string := STRING_.to_utf32_be (a_string)
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 4, a_byte_string.count)
			assert_integers_equal ("first_byte1", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte1", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte1", 77, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := STRING_.to_utf32_be (a_unicode)
			assert ("no_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 4, a_byte_string.count)
			assert_integers_equal ("first_byte2", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte2", 4, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte2", 48, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := STRING_.to_utf32_be (a_unicode)
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 4, a_byte_string.count)
			assert_integers_equal ("first_byte3", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte3", 78, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte3", 140, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := STRING_.to_utf32_be (a_unicode)
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 0, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 1, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 3, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 2, a_byte_string.item_code (4))
		end

	test_to_utf32_le is
			-- Test feature `to_utf32_le'.
		local
			a_unicode: UC_STRING
			a_string, a_byte_string: STRING
		do
			a_string := "M"
			a_byte_string := STRING_.to_utf32_le (a_string)
			assert ("not_void1", a_byte_string /= Void)
			assert_integers_equal ("count1", 4, a_byte_string.count)
			assert_integers_equal ("first_byte1", 77, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte1", 0, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte1", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte1", 0, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (1072, 1)
			a_byte_string := STRING_.to_utf32_le (a_unicode)
			assert ("no_void2", a_byte_string /= Void)
			assert_integers_equal ("count2", 4, a_byte_string.count)
			assert_integers_equal ("first_byte2", 48, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte2", 4, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte2", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte2", 0, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (20108, 1)
			a_byte_string := STRING_.to_utf32_le (a_unicode)
			assert ("not_void3", a_byte_string /= Void)
			assert_integers_equal ("count3", 4, a_byte_string.count)
			assert_integers_equal ("first_byte3", 140, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte3", 78, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte3", 0, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte3", 0, a_byte_string.item_code (4))
			create a_unicode.make_filled_code (66306, 1)
			a_byte_string := STRING_.to_utf32_le (a_unicode)
			assert ("not_void4", a_byte_string /= Void)
			assert_integers_equal ("count4", 4, a_byte_string.count)
			assert_integers_equal ("first_byte4", 2, a_byte_string.item_code (1))
			assert_integers_equal ("second_byte4", 3, a_byte_string.item_code (2))
			assert_integers_equal ("third_byte4", 1, a_byte_string.item_code (3))
			assert_integers_equal ("fourth_byte4", 0, a_byte_string.item_code (4))
		end

	test_substring_index is
			-- Test feature `substring_index'.
		local
			a_string1: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := STRING_.cloned_string ("foobar")
			assert_integers_equal ("index1", 4, STRING_.substring_index (a_string1, "bar", 1))
			assert_integers_equal ("index2", 0, STRING_.substring_index (a_string1, "bar", 5))
			assert_integers_equal ("index3", 0, STRING_.substring_index (a_string1, "bar", 7))
			create uc_string1.make_from_string ("oba")
			assert_integers_equal ("index4", 3, STRING_.substring_index (a_string1, uc_string1, 2))
			uc_string1.put_item_code (2345, 2)
			assert_integers_equal ("index5", 0, STRING_.substring_index (a_string1, uc_string1, 1))
			create uc_string1.make_from_string ("foobar")
			uc_string1.put_item_code (432, 1)
			assert_integers_equal ("index6", 2, STRING_.substring_index (uc_string1, "oob", 1))
			assert_integers_equal ("index7", 0, STRING_.substring_index (uc_string1, "gobo", 2))
			create uc_string2.make_from_string ("foo")
			uc_string2.put_item_code (432, 1)
			assert_integers_equal ("index8", 1, STRING_.substring_index (uc_string1, uc_string2, 1))
			assert_integers_equal ("index9", 0, STRING_.substring_index (uc_string1, uc_string2, 7))
		end

	test_case_insensitive_hash_code is
			-- Test feature `case_insensitive_hash_code'.
		local
			a_string, a_string2: STRING
		do
			a_string := STRING_.cloned_string ("foobar")
			assert ("hash_code1", STRING_.case_insensitive_hash_code (a_string) = STRING_.case_insensitive_hash_code (a_string))
			a_string2 := STRING_.cloned_string ("fOoBaR")
			assert ("hash_code2", STRING_.case_insensitive_hash_code (a_string) = STRING_.case_insensitive_hash_code (a_string2))
		end

	test_concat is
			-- Test feature `concat'.
		local
			a_string, a_string1, a_string2: STRING
			uc_string1, uc_string2, uc_string3: UC_UTF8_STRING
		do
			a_string1 := STRING_.cloned_string ("foo")
			a_string2 := STRING_.cloned_string ("bar")
			a_string := STRING_.concat (a_string1, a_string2)
			assert_equal ("concat1", "foobar", a_string)
			assert ("new_string1", a_string /= a_string1)
			assert ("new_string2", a_string /= a_string2)
			create uc_string1.make_from_string ("gobo")
			uc_string1.put_item_code (345, 2)
			create uc_string2.make_from_string ("foogobo")
			uc_string2.put_item_code (345, 5)
			a_string := STRING_.concat (a_string1, uc_string1)
			assert_equal ("concat2", uc_string2, a_string)
			assert ("new_string3", a_string /= a_string1)
			assert ("new_string4", a_string /= uc_string1)
			create uc_string2.make_from_string ("gobofoo")
			uc_string2.put_item_code (345, 2)
			a_string := STRING_.concat (uc_string1, a_string1)
			assert_equal ("concat3", uc_string2, a_string)
			assert ("new_string5", a_string /= a_string1)
			assert ("new_string6", a_string /= uc_string1)
			create uc_string1.make_from_string ("foo")
			uc_string1.put_item_code (2345, 2)
			create uc_string2.make_from_string ("bar")
			uc_string2.put_item_code (453, 2)
			create uc_string3.make_from_string ("foobar")
			uc_string3.put_item_code (2345, 2)
			uc_string3.put_item_code (453, 5)
			a_string := STRING_.concat (uc_string1, uc_string2)
			assert_equal ("concat4", uc_string3, a_string)
			assert ("new_string7", a_string /= uc_string1)
			assert ("new_string8", a_string /= uc_string2)
		end

	test_appended_string is
			-- Test feature `appended_string'.
		local
			a_string, a_string1, a_string2: STRING
			uc_string1, uc_string2, uc_string3: UC_UTF8_STRING
		do
			a_string1 := "foo"
			a_string2 := "bar"
			a_string := STRING_.appended_string (a_string1, a_string2)
			assert_equal ("appended1", "foobar", a_string)
			assert ("same_string1", a_string = a_string1)
			assert ("new_string2", a_string /= a_string2)
			a_string1 := "foo"
			create uc_string1.make_from_string ("gobo")
			uc_string1.put_item_code (345, 2)
			create uc_string2.make_from_string ("foogobo")
			uc_string2.put_item_code (345, 5)
			a_string := STRING_.appended_string (a_string1, uc_string1)
			assert_equal ("appended2", uc_string2, a_string)
			assert ("new_string3", a_string /= a_string1)
			assert ("new_string4", a_string /= uc_string1)
			a_string1 := "foo"
			create uc_string2.make_from_string ("gobofoo")
			uc_string2.put_item_code (345, 2)
			a_string := STRING_.appended_string (uc_string1, a_string1)
			assert_equal ("appended3", uc_string2, a_string)
			assert ("new_string5", a_string /= a_string1)
			assert ("same_string6", a_string = uc_string1)
			create uc_string1.make_from_string ("foo")
			uc_string1.put_item_code (2345, 2)
			create uc_string2.make_from_string ("bar")
			uc_string2.put_item_code (453, 2)
			create uc_string3.make_from_string ("foobar")
			uc_string3.put_item_code (2345, 2)
			uc_string3.put_item_code (453, 5)
			a_string := STRING_.appended_string (uc_string1, uc_string2)
			assert_equal ("appended4", uc_string3, a_string)
			assert ("same_string7", a_string = uc_string1)
			assert ("new_string8", a_string /= uc_string2)
		end

	test_replaced_substring1 is
			-- Test feature `replaced_substring'.
		local
			a_string: STRING
			a_string1: STRING
			a_string2: UC_STRING
			a_string3: STRING
			a_string4: UC_UTF8_STRING
		do
			a_string1 := "foobar"
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string.out)
			a_string1 := "foobar"
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string.out)
			a_string1 := "foobar"
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string.out)
			a_string1 := "foobar"
			create a_string2.make_from_string ("")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string.out)
			if not operating_system.is_dotnet then
					-- Bug in ISE 5.5 for .NET.
				a_string1 := "foobar"
				a_string := STRING_.replaced_substring (a_string1, a_string1, 4, 6)
				assert_equal ("replaced5", "foofoobar", a_string.out)
			end
			a_string1 := "foobar"
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 4, 3)
			assert_equal ("replaced6", "foototobar", a_string.out)
			a_string1 := "foobar"
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 1, 6)
			assert_equal ("replaced7", "toto", a_string.out)
			a_string1 := "foobar"
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 1, 1)
			assert_equal ("replaced8", "totooobar", a_string.out)
			a_string1 := "foobar"
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 4, 6)
			assert_equal ("replaced9", "foototo", a_string.out)
			a_string1 := "foobar"
			a_string3 := ""
			a_string := STRING_.replaced_substring (a_string1, a_string3, 2, 4)
			assert_equal ("replaced10", "far", a_string.out)
			a_string1 := "foobar"
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 4, 3)
			assert_equal ("replaced11", "foototobar", a_string.out)
			a_string1 := "foobar"
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 1, 6)
			assert_equal ("replaced12", "toto", a_string.out)
			a_string1 := "foobar"
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 1, 1)
			assert_equal ("replaced13", "totooobar", a_string.out)
			a_string1 := "foobar"
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 4, 6)
			assert_equal ("replaced14", "foototo", a_string.out)
			a_string1 := "foobar"
			create a_string4.make_from_string ("")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 2, 4)
			assert_equal ("replaced15", "far", a_string.out)
			a_string1 := "foobar"
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 4, 3)
			assert_equal ("replaced16", "foototobar", a_string.out)
		end

	test_replaced_substring2 is
			-- Test feature `replaced_substring'.
		local
			a_string: STRING
			a_string1: UC_UTF8_STRING
			a_string2: UC_STRING
			a_string3: STRING
			a_string4: UC_UTF8_STRING
		do
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string := STRING_.replaced_substring (a_string1, a_string1, 4, 6)
			assert_equal ("replaced5", "foofoobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 4, 3)
			assert_equal ("replaced6", "foototobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 1, 6)
			assert_equal ("replaced7", "toto", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 1, 1)
			assert_equal ("replaced8", "totooobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 4, 6)
			assert_equal ("replaced9", "foototo", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := ""
			a_string := STRING_.replaced_substring (a_string1, a_string3, 2, 4)
			assert_equal ("replaced10", "far", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 4, 3)
			assert_equal ("replaced11", "foototobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 1, 6)
			assert_equal ("replaced12", "toto", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 1, 1)
			assert_equal ("replaced13", "totooobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 4, 6)
			assert_equal ("replaced14", "foototo", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 2, 4)
			assert_equal ("replaced15", "far", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 4, 3)
			assert_equal ("replaced16", "foototobar", a_string.out)
		end

	test_replaced_substring3 is
			-- Test feature `replaced_substring'.
		local
			a_string: STRING
			a_string1: UC_STRING
			a_string2: UC_STRING
			a_string3: STRING
			a_string4: UC_UTF8_STRING
		do
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string := STRING_.replaced_substring (a_string1, a_string1, 4, 6)
			assert_equal ("replaced5", "foofoobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string2.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string2, 4, 3)
			assert_equal ("replaced6", "foototobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 1, 6)
			assert_equal ("replaced7", "toto", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 1, 1)
			assert_equal ("replaced8", "totooobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 4, 6)
			assert_equal ("replaced9", "foototo", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := ""
			a_string := STRING_.replaced_substring (a_string1, a_string3, 2, 4)
			assert_equal ("replaced10", "far", a_string.out)
			create a_string1.make_from_string ("foobar")
			a_string3 := "toto"
			a_string := STRING_.replaced_substring (a_string1, a_string3, 4, 3)
			assert_equal ("replaced11", "foototobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 1, 6)
			assert_equal ("replaced12", "toto", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 1, 1)
			assert_equal ("replaced13", "totooobar", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 4, 6)
			assert_equal ("replaced14", "foototo", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 2, 4)
			assert_equal ("replaced15", "far", a_string.out)
			create a_string1.make_from_string ("foobar")
			create a_string4.make_from_string ("toto")
			a_string := STRING_.replaced_substring (a_string1, a_string4, 4, 3)
			assert_equal ("replaced16", "foototobar", a_string.out)
		end

	test_replaced_first_substring1 is
			-- Test feature `replaced_first_substring'.
		local
			a_text: STRING
			a_expt: STRING
			a_got: STRING
			s_old: STRING
			s_new: STRING
		do
			s_old := "-"
			s_new:= "#"

			a_text := "x"
			a_expt := "x"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_01", a_expt, a_got)
			assert_same ("replaced1_02", a_text, a_got)

			a_text := "--"
			a_expt := "#-"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_11", a_expt, a_got)

			a_text := "'- -'"
			a_expt := "'# -'"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_12", a_expt, a_got)

			a_text := "---"
			a_expt := "#--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_13", a_expt, a_got)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "foo#bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_21", a_expt, a_got)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "#foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_22", a_expt, a_got)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "foo#bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_23", a_expt, a_got)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "#foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_24", a_expt, a_got)

			s_old := "-"
			s_new:= "#-"

			a_text := "foo-bar"
			a_expt := "foo#-bar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_30", a_expt, a_got)

			a_text := "foobar-"
			a_expt := "foobar#-"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_31", a_expt, a_got)

			a_text := "foo-bar-"
			a_expt := "foo#-bar-"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_32", a_expt, a_got)

			a_text := "-foo-bar-"
			a_expt := "#-foo-bar-"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_33", a_expt, a_got)

			a_text := "--foo---bar--"
			a_expt := "#--foo---bar--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_34", a_expt, a_got)

			s_new := ""
			a_text := "--foo---bar--"
			a_expt := "-foo---bar--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_35", a_expt, a_got)

			s_new:= "-"
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_36", a_expt, a_got)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_37", a_expt, a_got)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_38", a_expt, a_got)

			s_old := "#"
			s_new := "-"
			a_text := "--foo---bar--"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_same ("replaced1_39", a_text, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "totobar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_40", a_expt, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "12foobar"
			a_expt := "12totobar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_41", a_expt, a_got)

			s_old := "bar"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "foototo"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_42", a_expt, a_got)

			s_old := "foo"
			s_new := "1"
			a_text := "foobar"
			a_expt := "1bar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_43", a_expt, a_got)

			s_old := "bar"
			s_new := "1"
			a_text := "foobar"
			a_expt := "foo1"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_43", a_expt, a_got)

			s_old := "bar"
			s_new := ""
			a_text := "foobar"
			a_expt := "foo"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_44", a_expt, a_got)

			s_old := "foo"
			s_new := ""
			a_text := "foobar"
			a_expt := "bar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_45", a_expt, a_got)

			s_old := "foobar"
			s_new := ""
			a_text := "foobar"
			a_expt := ""
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_46", a_expt, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobarfoobar"
			a_expt := "totobarfoobar"
			a_got := STRING_.replaced_first_substring (a_text, s_old, s_new)
			assert_equal ("replaced1_50", a_expt, a_got)
		end

	test_replaced_first_substring2 is
			-- Test feature `replaced_first_substring'.
		local
			a_text: STRING
			a_expt: STRING
			a_got: STRING
			s_old: STRING
			s_new: STRING
			a_uc_string: UC_STRING
		do
			s_old := "-"
			s_new:= "#"

			a_text := "x"
			a_expt := "x"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_01", a_expt, a_got.out)
			assert_same ("replaced1_02", a_uc_string, a_got)

			a_text := "--"
			a_expt := "#-"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_11", a_expt, a_got.out)

			a_text := "'- -'"
			a_expt := "'# -'"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_12", a_expt, a_got.out)

			a_text := "---"
			a_expt := "#--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_13", a_expt, a_got.out)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "foo#bar-foo-bar-foo-bar-foo-bar-foo-bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_21", a_expt, a_got.out)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "#foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_22", a_expt, a_got.out)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "foo#bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_23", a_expt, a_got.out)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "#foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_24", a_expt, a_got.out)

			s_old := "-"
			s_new:= "#-"

			a_text := "foo-bar"
			a_expt := "foo#-bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_30", a_expt, a_got.out)

			a_text := "foobar-"
			a_expt := "foobar#-"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_31", a_expt, a_got.out)

			a_text := "foo-bar-"
			a_expt := "foo#-bar-"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_32", a_expt, a_got.out)

			a_text := "-foo-bar-"
			a_expt := "#-foo-bar-"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_33", a_expt, a_got.out)

			a_text := "--foo---bar--"
			a_expt := "#--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_34", a_expt, a_got.out)

			s_new := ""
			a_text := "--foo---bar--"
			a_expt := "-foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_35", a_expt, a_got.out)

			s_new:= "-"
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_36", a_expt, a_got.out)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_37", a_expt, a_got.out)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_38", a_expt, a_got.out)

			s_old := "#"
			s_new := "-"
			a_text := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_same ("replaced1_39", a_uc_string, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "totobar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_40", a_expt, a_got.out)

			s_old := "foo"
			s_new := "toto"
			a_text := "12foobar"
			a_expt := "12totobar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_41", a_expt, a_got.out)

			s_old := "bar"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "foototo"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_42", a_expt, a_got.out)

			s_old := "foo"
			s_new := "1"
			a_text := "foobar"
			a_expt := "1bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_43", a_expt, a_got.out)

			s_old := "bar"
			s_new := "1"
			a_text := "foobar"
			a_expt := "foo1"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_43", a_expt, a_got.out)

			s_old := "bar"
			s_new := ""
			a_text := "foobar"
			a_expt := "foo"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_44", a_expt, a_got.out)

			s_old := "foo"
			s_new := ""
			a_text := "foobar"
			a_expt := "bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_45", a_expt, a_got.out)

			s_old := "foobar"
			s_new := ""
			a_text := "foobar"
			a_expt := ""
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_46", a_expt, a_got.out)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobarfoobar"
			a_expt := "totobarfoobar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_first_substring (a_uc_string, s_old, s_new)
			assert_equal ("replaced1_50", a_expt, a_got.out)
		end

	test_replaced_all_substrings1 is
			-- Test feature `replaced_all_substrings'.
		local
			a_text: STRING
			a_expt: STRING
			a_got: STRING
			s_old: STRING
			s_new: STRING
		do
			s_old := "-"
			s_new:= "#"

			a_text := "x"
			a_expt := "x"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_01", a_expt, a_got)
			assert_same ("replaced1_02", a_text, a_got)

			a_text := "--"
			a_expt := "##"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_11", a_expt, a_got)

			a_text := "'- -'"
			a_expt := "'# #'"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_12", a_expt, a_got)

			a_text := "---"
			a_expt := "###"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_13", a_expt, a_got)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "foo#bar#foo#bar#foo#bar#foo#bar#foo#bar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_21", a_expt, a_got)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "#foo#bar#foo#bar#foo#bar#foo#bar#foo#bar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_22", a_expt, a_got)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "foo#bar#foo#bar#foo#bar#foo#bar#foo#bar#"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_23", a_expt, a_got)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "#foo#bar#foo#bar#foo#bar#foo#bar#foo#bar#"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_24", a_expt, a_got)

			s_old := "-"
			s_new:= "##"

			a_text := "foo-bar"
			a_expt := "foo##bar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_30", a_expt, a_got)

			a_text := "foobar-"
			a_expt := "foobar##"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_31", a_expt, a_got)

			a_text := "foo-bar-"
			a_expt := "foo##bar##"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_32", a_expt, a_got)

			a_text := "-foo-bar-"
			a_expt := "##foo##bar##"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_33", a_expt, a_got)

			a_text := "--foo---bar--"
			a_expt := "####foo######bar####"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_34", a_expt, a_got)

			s_new := ""
			a_text := "--foo---bar--"
			a_expt := "foobar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_35", a_expt, a_got)

			s_new:= "-"
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_36", a_expt, a_got)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_37", a_expt, a_got)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_38", a_expt, a_got)

			s_old := "#"
			s_new := "-"
			a_text := "--foo---bar--"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_same ("replaced1_39", a_text, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "totobar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_40", a_expt, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "12foobar"
			a_expt := "12totobar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_41", a_expt, a_got)

			s_old := "bar"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "foototo"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_42", a_expt, a_got)

			s_old := "foo"
			s_new := "1"
			a_text := "foobar"
			a_expt := "1bar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_43", a_expt, a_got)

			s_old := "bar"
			s_new := "1"
			a_text := "foobar"
			a_expt := "foo1"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_43", a_expt, a_got)

			s_old := "bar"
			s_new := ""
			a_text := "foobar"
			a_expt := "foo"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_44", a_expt, a_got)

			s_old := "foo"
			s_new := ""
			a_text := "foobar"
			a_expt := "bar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_45", a_expt, a_got)

			s_old := "foobar"
			s_new := ""
			a_text := "foobar"
			a_expt := ""
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_46", a_expt, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobarfoobar"
			a_expt := "totobartotobar"
			a_got := STRING_.replaced_all_substrings (a_text, s_old, s_new)
			assert_equal ("replaced1_50", a_expt, a_got)
		end

	test_replaced_all_substrings2 is
			-- Test feature `replaced_all_substrings'.
		local
			a_text: STRING
			a_expt: STRING
			a_got: STRING
			s_old: STRING
			s_new: STRING
			a_uc_string: UC_STRING
		do
			s_old := "-"
			s_new:= "#"

			a_text := "x"
			a_expt := "x"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_01", a_expt, a_got.out)
			assert_same ("replaced2_02", a_got, a_uc_string)

			a_text := "--"
			a_expt := "##"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_11", a_expt, a_got.out)

			a_text := "'- -'"
			a_expt := "'# #'"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_12", a_expt, a_got.out)

			a_text := "---"
			a_expt := "###"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_13", a_expt, a_got.out)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "foo#bar#foo#bar#foo#bar#foo#bar#foo#bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_21", a_expt, a_got.out)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar"
			a_expt := "#foo#bar#foo#bar#foo#bar#foo#bar#foo#bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_22", a_expt, a_got.out)

			a_text := "foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "foo#bar#foo#bar#foo#bar#foo#bar#foo#bar#"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_23", a_expt, a_got.out)

			a_text := "-foo-bar-foo-bar-foo-bar-foo-bar-foo-bar-"
			a_expt := "#foo#bar#foo#bar#foo#bar#foo#bar#foo#bar#"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_24", a_expt, a_got.out)

			s_old := "-"
			s_new:= "##"

			a_text := "foo-bar"
			a_expt := "foo##bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_30", a_expt, a_got.out)

			a_text := "foobar-"
			a_expt := "foobar##"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_31", a_expt, a_got.out)

			a_text := "foo-bar-"
			a_expt := "foo##bar##"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_32", a_expt, a_got.out)

			a_text := "-foo-bar-"
			a_expt := "##foo##bar##"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_33", a_expt, a_got.out)

			a_text := "--foo---bar--"
			a_expt := "####foo######bar####"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_34", a_expt, a_got.out)

			s_new := ""
			a_text := "--foo---bar--"
			a_expt := "foobar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_35", a_expt, a_got.out)

			s_new:= "-"
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_36", a_expt, a_got.out)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_37", a_expt, a_got.out)

			s_new := s_old
			a_text := "--foo---bar--"
			a_expt := "--foo---bar--"
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_38", a_expt, a_got.out)

			s_old := "#"
			s_new := "-"
			a_text := "--foo---bar--"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_same ("replaced2_39", a_uc_string, a_got)

			s_old := "foo"
			s_new := "toto"
			a_text := "12foobar"
			a_expt := "12totobar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_41", a_expt, a_got.out)

			s_old := "bar"
			s_new := "toto"
			a_text := "foobar"
			a_expt := "foototo"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_42", a_expt, a_got.out)

			s_old := "foo"
			s_new := "1"
			a_text := "foobar"
			a_expt := "1bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_43", a_expt, a_got.out)

			s_old := "bar"
			s_new := "1"
			a_text := "foobar"
			a_expt := "foo1"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_43", a_expt, a_got.out)

			s_old := "bar"
			s_new := ""
			a_text := "foobar"
			a_expt := "foo"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_44", a_expt, a_got.out)

			s_old := "foo"
			s_new := ""
			a_text := "foobar"
			a_expt := "bar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_45", a_expt, a_got.out)

			s_old := "foobar"
			s_new := ""
			a_text := "foobar"
			a_expt := ""
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_46", a_expt, a_got.out)

			s_old := "foo"
			s_new := "toto"
			a_text := "foobarfoobar"
			a_expt := "totobartotobar"
			create a_uc_string.make_from_string (a_text)
			a_got := STRING_.replaced_all_substrings (a_uc_string, s_old, s_new)
			assert_equal ("replaced2_50", a_expt, a_got.out)
		end

	test_elks_same_string is
			-- Test feature `elks_same_string'.
		local
			a_string1, a_string2: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := STRING_.cloned_string ("foo")
			assert ("same1", STRING_.elks_same_string (a_string1, a_string1))
			a_string2 := STRING_.cloned_string ("foo")
			assert ("same2", STRING_.elks_same_string (a_string1, a_string2))
			a_string2 := STRING_.cloned_string ("bar")
			assert ("not_same1", not STRING_.elks_same_string (a_string1, a_string2))
			create uc_string1.make_from_string ("foo")
			assert ("same3", STRING_.elks_same_string (a_string1, uc_string1))
			assert ("same4", STRING_.elks_same_string (uc_string1, a_string1))
			uc_string1.put_item_code (too_big_character, 3)
			assert ("not_same2", not STRING_.elks_same_string (a_string1, uc_string1))
			assert ("not_same3", not STRING_.elks_same_string (uc_string1, a_string1))
			create uc_string2.make_from_string ("foo")
			assert ("not_same4", not STRING_.elks_same_string (uc_string1, uc_string2))
			uc_string2.put_item_code (too_big_character2, 3)
			assert ("same5", STRING_.elks_same_string (uc_string1, uc_string2))
		end

	test_same_string is
			-- Test feature `same_string'.
		local
			a_string1, a_string2: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := STRING_.cloned_string ("foo")
			assert ("same1", STRING_.same_string (a_string1, a_string1))
			a_string2 := STRING_.cloned_string ("foo")
			assert ("same2", STRING_.same_string (a_string1, a_string2))
			a_string2 := STRING_.cloned_string ("bar")
			assert ("not_same1", not STRING_.same_string (a_string1, a_string2))
			create uc_string1.make_from_string ("foo")
			assert ("same3", STRING_.same_string (a_string1, uc_string1))
			assert ("same4", STRING_.same_string (uc_string1, a_string1))
			uc_string1.put_item_code (9876, 3)
			assert ("not_same2", not STRING_.same_string (a_string1, uc_string1))
			assert ("not_same3", not STRING_.same_string (uc_string1, a_string1))
			create uc_string2.make_from_string ("foo")
			assert ("not_same4", not STRING_.same_string (uc_string1, uc_string2))
			uc_string2.put_item_code (2852, 3)
			assert ("not_same5", not STRING_.same_string (uc_string1, uc_string2))
			uc_string2.put_item_code (9876, 3)
			assert ("same5", STRING_.same_string (uc_string1, uc_string2))
		end

	test_left_adjust is
			-- Test feature `left_adjust'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := STRING_.cloned_string ("foobar")
			STRING_.left_adjust (a_string)
			assert_equal ("left_adjust1", "foobar", a_string)
			a_string.put (' ', 1)
			a_string.put ('%T', 2)
			a_string.put ('%N', 3)
			a_string.put ('%R', 4)
			STRING_.left_adjust (a_string)
			assert_equal ("left_adjust2", "ar", a_string)
			create uc_string.make_from_string ("foobar")
			uc_string.put_item_code (567, 1)
			uc_string.put_item_code (432, 6)
			STRING_.left_adjust (uc_string)
			assert_equal ("left_adjust3", "%%/567/ooba%%/432/", uc_string.out)
			uc_string.put (' ', 1)
			uc_string.put ('%T', 2)
			uc_string.put ('%N', 3)
			uc_string.put ('%R', 4)
			STRING_.left_adjust (uc_string)
			assert_equal ("left_adjust4", "a%%/432/", uc_string.out)
		end

	test_right_adjust is
			-- Test feature `right_adjust'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := STRING_.cloned_string ("foobar")
			STRING_.right_adjust (a_string)
			assert_equal ("right_adjust1", "foobar", a_string)
			a_string.put (' ', 3)
			a_string.put ('%T', 4)
			a_string.put ('%N', 5)
			a_string.put ('%R', 6)
			STRING_.right_adjust (a_string)
			assert_equal ("right_adjust2", "fo", a_string)
			create uc_string.make_from_string ("foobar")
			uc_string.put_item_code (567, 1)
			uc_string.put_item_code (432, 6)
			STRING_.right_adjust (uc_string)
			assert_equal ("right_adjust3", "%%/567/ooba%%/432/", uc_string.out)
			uc_string.put (' ', 3)
			uc_string.put ('%T', 4)
			uc_string.put ('%N', 5)
			uc_string.put ('%R', 6)
			STRING_.right_adjust (uc_string)
			assert_equal ("right_adjust4", "%%/567/o", uc_string.out)
		end

	test_wipe_out is
			-- Test feature `wipe_out'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := STRING_.cloned_string ("foobar")
			STRING_.wipe_out (a_string)
			assert_integers_equal ("wiped_out1", 0, a_string.count)
			create uc_string.make_from_string ("foobar")
			uc_string.put_item_code (365, 3)
			STRING_.wipe_out (uc_string)
			assert_integers_equal ("wiped_out2", 0, uc_string.count)
		end

	test_resize_buffer is
			-- Test feature `resize_buffer'.
		local
			a_string: STRING
		do
			a_string := STRING_.make_buffer (4)
			assert ("not_void1", a_string /= Void)
			assert ("string_type1", ANY_.same_types (a_string, ""))
			assert_integers_equal ("count1", 4,  a_string.count)
			STRING_.resize_buffer (a_string, 6)
			assert_integers_equal ("count2", 6,  a_string.count)
		end

	test_hexadecimal_to_integer is
			-- Test feature `hexadecimal_to_integer'.
		local
			a_string: STRING
			uc_string: UC_UTF8_STRING
		do
			a_string := STRING_.cloned_string ("1A")
			assert_integers_equal ("hexa1", 26,  STRING_.hexadecimal_to_integer (a_string))
			create uc_string.make_from_string ("B5")
			assert_integers_equal ("hexa2", 181,  STRING_.hexadecimal_to_integer (uc_string))
		end

	test_same_case_insensitive is
			-- Test feature `same_case_insensitive'.
		local
			a_string1, a_string2: STRING
			uc_string1, uc_string2: UC_UTF8_STRING
		do
			a_string1 := STRING_.cloned_string ("foo")
			a_string2 := STRING_.cloned_string ("FOO")
			assert ("same1", STRING_.same_case_insensitive (a_string1, a_string2))
			assert ("same2", STRING_.same_case_insensitive (a_string2, a_string1))
			assert ("same3", STRING_.same_case_insensitive (a_string1, a_string1))
			a_string2 := STRING_.cloned_string ("bar")
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
