indexing

	description:

		"Test features of class STRING listed in KS_STRING"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KS_TEST_STRING

inherit

	KL_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

feature -- Test

	test_count is
			-- Test feature `count'.
		local
			a_string: STRING
		do
			a_string := clone ("foo")
			assert_equal ("count1", 3, a_string.count)
			a_string := clone ("")
			assert_equal ("count2", 0, a_string.count)
			a_string := clone ("foobar")
			assert_equal ("count3", 6, a_string.count)
		end

	test_valid_index is
			-- Test feature `valid_index'.
		local
			a_string: STRING
		do
			a_string := clone ("foo")
			assert ("valid1", a_string.valid_index (1)) 
			assert ("valid2", a_string.valid_index (2)) 
			assert ("valid3", a_string.valid_index (3)) 
			assert ("not_valid1", not a_string.valid_index (0)) 
			assert ("not_valid2", not a_string.valid_index (4)) 
			a_string := clone ("")
			assert ("not_valid3", not a_string.valid_index (0)) 
			assert ("not_valid4", not a_string.valid_index (1)) 
		end

	test_item is
			-- Test feature `item'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert_equal ("item1", 'b', a_string.item (1)) 
			assert_equal ("item2", 'a', a_string.item (2)) 
			assert_equal ("item3", 'r', a_string.item (3)) 
		end

	test_item_code is
			-- Test feature `item_code'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert_equal ("item_code1", ('b').code, a_string.item_code (1)) 
			assert_equal ("item_code2", ('a').code, a_string.item_code (2)) 
			assert_equal ("item_code3", ('r').code, a_string.item_code (3)) 
		end

	test_infix_at is
			-- Test feature `infix "@"'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert_equal ("item1", 'b', a_string @ 1) 
			assert_equal ("item2", 'a', a_string @ 2) 
			assert_equal ("item3", 'r', a_string @ 3) 
		end

	test_put is
			-- Test feature `put'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			a_string.put ('f', 1)
			assert_equal ("item1", 'f', a_string.item (1)) 
			assert_equal ("item2", 'a', a_string.item (2)) 
			assert_equal ("item3", 'r', a_string.item (3)) 
			a_string.put ('o', 2)
			assert_equal ("item4", 'f', a_string.item (1)) 
			assert_equal ("item5", 'o', a_string.item (2)) 
			assert_equal ("item6", 'r', a_string.item (3)) 
			a_string.put ('z', 3)
			assert_equal ("item7", 'f', a_string.item (1)) 
			assert_equal ("item8", 'o', a_string.item (2)) 
			assert_equal ("item9", 'z', a_string.item (3)) 
		end

	test_substring is
			-- Test feature `substring'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert_equal ("substring1", "bar", a_string.substring (1, 3)) 
			assert_equal ("substring2", "ba", a_string.substring (1, 2)) 
			assert_equal ("substring3", "a", a_string.substring (2, 2)) 
			-- TODO: Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- assert_equal ("substring4", "", a_string.substring (2, 1)) 
			a_string := clone ("")
			-- TODO: Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- assert_equal ("substring5", "", a_string.substring (1, 0)) 
		end

	test_is_equal is
			-- Test feature `is_equal'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert ("is_equal1", a_string.is_equal ("bar")) 
			assert ("not_is_equal1", not a_string.is_equal ("foo")) 
			assert ("not_is_equal2", not a_string.is_equal ("ba")) 
			assert ("not_is_equal3", not a_string.is_equal ("bart")) 
			a_string := clone ("")
			assert ("is_equal2", a_string.is_equal ("")) 
			assert ("not_is_equal4", not a_string.is_equal ("foo")) 
		end

	test_out is
			-- Test feature `out'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert_equal ("out1", "bar", a_string.out) 
			a_string := clone ("")
			assert_equal ("out2", "", a_string.out) 
		end

	test_copy is
			-- Test feature `copy'.
		local
			a_string: STRING
		do
			a_string := clone ("zx")
			a_string.copy ("foobar")
			assert_equal ("copy1", "foobar", a_string) 
			a_string := clone ("")
			a_string.copy ("bar")
			assert_equal ("copy2", "bar", a_string) 
			a_string := clone ("foo")
			a_string.copy ("")
			assert_equal ("copy3", "", a_string) 
			if not eiffel_compiler.is_hact then
					-- TODO: HACT 4.0.1 has a bug when copying a string on itself.
				a_string := clone ("toto")
				a_string.copy (a_string)
				assert_equal ("copy4", "toto", a_string) 
			end
		end

	test_append_character is
			-- Test feature `append_character'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			a_string.append_character ('f')
			assert_equal ("append_character1", "barf", a_string) 
			a_string := clone ("")
			a_string.append_character ('z')
			assert_equal ("append_character2", "z", a_string) 
		end

	test_append_string is
			-- Test feature `append_string'.
		local
			a_string: STRING
		do
			a_string := clone ("foo")
			a_string.append_string ("bar")
			assert_equal ("append_string1", "foobar", a_string) 
			a_string := clone ("")
			a_string.append_string ("bar")
			assert_equal ("append_string2", "bar", a_string) 
			a_string := clone ("foo")
			a_string.append_string ("")
			assert_equal ("append_string3", "foo", a_string) 
			a_string := clone ("foo")
			a_string.append_string (a_string)
			assert_equal ("append_string4", "foofoo", a_string) 
		end

	test_infix_plus is
			-- Test feature `infix "+"'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foo")
			a_string2 := clone ("bar")
			assert_equal ("append_string1", "foobar", a_string + a_string2) 
			assert ("new_string1", (a_string + a_string2) /= a_string) 
			assert ("new_string2", (a_string + a_string2) /= a_string2) 
			a_string := clone ("")
			a_string2 := clone ("bar")
			assert_equal ("append_string2", "bar", a_string + a_string2) 
			a_string := clone ("foo")
			a_string2 := clone ("")
			assert_equal ("append_string3", "foo", a_string + a_string2) 
			a_string := clone ("foo")
			assert_equal ("append_string4", "foofoo", a_string + a_string) 
		end

	test_index_of is
			-- Test feature `index_of'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert_equal ("index_of_b1", 1, a_string.index_of ('b', 1)) 
			assert_equal ("index_of_b2", 0, a_string.index_of ('b', 2)) 
			assert_equal ("index_of_b3", 0, a_string.index_of ('b', 3)) 
			assert_equal ("index_of_b4", 0, a_string.index_of ('b', 4)) 
			assert_equal ("index_of_a1", 2, a_string.index_of ('a', 1)) 
			assert_equal ("index_of_a2", 2, a_string.index_of ('a', 2)) 
			assert_equal ("index_of_a3", 0, a_string.index_of ('a', 3)) 
			assert_equal ("index_of_a4", 0, a_string.index_of ('a', 4)) 
			assert_equal ("index_of_r1", 3, a_string.index_of ('r', 1)) 
			assert_equal ("index_of_r2", 3, a_string.index_of ('r', 2)) 
			assert_equal ("index_of_r3", 3, a_string.index_of ('r', 3)) 
			assert_equal ("index_of_r4", 0, a_string.index_of ('r', 4)) 
			assert_equal ("index_of_z1", 0, a_string.index_of ('z', 1)) 
			assert_equal ("index_of_z2", 0, a_string.index_of ('z', 2)) 
			assert_equal ("index_of_z3", 0, a_string.index_of ('z', 3)) 
			assert_equal ("index_of_z4", 0, a_string.index_of ('z', 4)) 
			a_string := clone ("")
			assert_equal ("index_of_o1", 0, a_string.index_of ('o', 1)) 
		end

	test_has is
			-- Test feature `has'.
		local
			a_string: STRING
		do
			a_string := clone ("bar")
			assert ("has_b", a_string.has ('b')) 
			assert ("has_a", a_string.has ('a')) 
			assert ("has_r", a_string.has ('r')) 
			assert ("not_has_o", not a_string.has ('o')) 
			a_string := clone ("")
			assert ("not_has_f", not a_string.has ('f')) 
		end

	test_occurrences is
			-- Test feature `occurrences'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			assert_equal ("b", 1, a_string.occurrences ('b')) 
			assert_equal ("a", 1, a_string.occurrences ('a')) 
			assert_equal ("r", 1, a_string.occurrences ('r')) 
			assert_equal ("o", 2, a_string.occurrences ('o')) 
			assert_equal ("f", 1, a_string.occurrences ('f')) 
			assert_equal ("z", 0, a_string.occurrences ('z')) 
			a_string := clone ("")
			assert_equal ("x", 0, a_string.occurrences ('x')) 
		end

	test_head is
			-- Test feature `head'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			a_string.head (10)
			assert_equal ("head_10", "foobar", a_string) 
			a_string.head (6)
			assert_equal ("head_6", "foobar", a_string) 
			a_string.head (3)
			assert_equal ("head_3", "foo", a_string) 
			a_string.head (0)
			assert_equal ("head_0", "", a_string) 
		end

	test_tail is
			-- Test feature `tail'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			a_string.tail (10)
			assert_equal ("tail_10", "foobar", a_string) 
			a_string.tail (6)
			assert_equal ("tail_6", "foobar", a_string) 
			a_string.tail (3)
			assert_equal ("tail_3", "bar", a_string) 
			a_string.tail (0)
			assert_equal ("tail_0", "", a_string) 
		end

	test_hash_code is
			-- Test feature `hash_code'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foobar")
			assert ("hash_code1", a_string.hash_code = a_string.hash_code) 
			a_string2 := clone ("foobar")
			assert ("hash_code2", a_string.hash_code = a_string2.hash_code) 
		end

	test_substring_index is
			-- Test feature `substring_index'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foobar")
			a_string2 := clone ("bar")
			assert_equal ("index1", 4, a_string.substring_index (a_string2, 1)) 
			assert_equal ("index2", 4, a_string.substring_index (a_string2, 2)) 
			assert_equal ("index3", 4, a_string.substring_index (a_string2, 3)) 
			assert_equal ("index4", 4, a_string.substring_index (a_string2, 4)) 
			assert_equal ("index5", 0, a_string.substring_index (a_string2, 5)) 
			assert_equal ("index6", 0, a_string.substring_index (a_string2, 6)) 
			a_string := clone ("bar")
			a_string2 := clone ("foobar")
			assert_equal ("index6", 0, a_string.substring_index (a_string2, 1)) 
			assert_equal ("index7", 0, a_string.substring_index (a_string2, 2)) 
			assert_equal ("index8", 0, a_string.substring_index (a_string2, 3)) 
			assert_equal ("index9", 1, a_string.substring_index (a_string, 1)) 
			assert_equal ("index10", 0, a_string.substring_index (a_string, 2)) 
			assert_equal ("index11", 0, a_string.substring_index (a_string, 3)) 
		end

	test_replace_substring is
			-- Test feature `replace_substring'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foobar")
			a_string2 := clone ("toto")
			a_string.replace_substring (a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string) 
			a_string := clone ("foobar")
			a_string2 := clone ("toto")
			a_string.replace_substring (a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string) 
			a_string := clone ("foobar")
			a_string2 := clone ("toto")
			a_string.replace_substring (a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string) 
			a_string := clone ("foobar")
			a_string2 := clone ("")
			a_string.replace_substring (a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string) 
			-- TODO: Note: ISE 5.1 and HACT 4.0.1 do not support replacing
			-- a substring by itself:
			-- a_string := clone ("foobar")
			-- a_string.replace_substring (a_string, 4, 6)
			-- assert_equal ("replaced5", "foofoobar", a_string) 
		end

	test_wipe_out is
			-- Test feature `wipe_out'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			a_string.wipe_out
			assert_equal ("wiped_out1", "", a_string) 
			a_string := clone ("")
			a_string.wipe_out
			assert_equal ("wiped_out2", "", a_string) 
		end

	test_remove is
			-- Test feature `remove'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			a_string.remove (1)
			assert_equal ("removed1", "oobar", a_string) 
			a_string.remove (5)
			assert_equal ("removed2", "ooba", a_string) 
			a_string.remove (3)
			assert_equal ("removed3", "ooa", a_string) 
		end

	test_to_lower is
			-- Test feature `to_lower'.
		local
			a_string: STRING
		do
			a_string := clone ("foo.BAR")
			a_string.to_lower
			assert_equal ("to_lower1", "foo.bar", a_string)
			a_string := clone ("")
			a_string.to_lower
			assert_equal ("to_lower2", "", a_string)
		end

	test_to_upper is
			-- Test feature `to_upper'.
		local
			a_string: STRING
		do
			a_string := clone ("foo.BAR")
			a_string.to_upper
			assert_equal ("to_upper1", "FOO.BAR", a_string)
			a_string := clone ("")
			a_string.to_upper
			assert_equal ("to_upper2", "", a_string)
		end

	test_infix_less is
			-- Test feature `infix "<"'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foo")
			a_string2 := clone ("bar")
			assert ("not_less1", not (a_string < a_string2))
			assert ("not_less2", not (a_string < a_string))
			assert ("less1", a_string2 < a_string)
			a_string := clone ("fo")
			a_string2 := clone ("foo")
			assert ("less2", a_string < a_string2)
			assert ("not_less3", not (a_string2 < a_string))
			a_string := clone ("")
			a_string2 := clone ("foo")
			assert ("less3", a_string < a_string2)
			assert ("not_less4", not (a_string2 < a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert ("not_less5", not (a_string < a_string2))
			assert ("not_less6", not (a_string2 < a_string))
		end

	test_infix_less_equal is
			-- Test feature `infix "<="'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foo")
			a_string2 := clone ("bar")
			assert ("not_less1", not (a_string <= a_string2))
			assert ("less1", a_string <= a_string)
			assert ("less2", a_string2 <= a_string)
			a_string := clone ("fo")
			a_string2 := clone ("foo")
			assert ("less3", a_string <= a_string2)
			assert ("not_less3", not (a_string2 <= a_string))
			a_string := clone ("")
			a_string2 := clone ("foo")
			assert ("less4", a_string <= a_string2)
			assert ("not_less4", not (a_string2 <= a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert ("less5", a_string <= a_string2)
			assert ("less6", a_string2 <= a_string)
		end

	test_infix_greater is
			-- Test feature `infix ">"'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("bar")
			a_string2 := clone ("foo")
			assert ("not_greater1", not (a_string > a_string2))
			assert ("not_greater2", not (a_string > a_string))
			assert ("greater1", a_string2 > a_string)
			a_string := clone ("foo")
			a_string2 := clone ("fo")
			assert ("greater2", a_string > a_string2)
			assert ("not_greater3", not (a_string2 > a_string))
			a_string := clone ("foo")
			a_string2 := clone ("")
			assert ("greater3", a_string > a_string2)
			assert ("not_greater4", not (a_string2 > a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert ("not_greater5", not (a_string > a_string2))
			assert ("not_greater6", not (a_string2 > a_string))
		end

	test_infix_greater_equal is
			-- Test feature `infix ">="'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("bar")
			a_string2 := clone ("foo")
			assert ("not_greater1", not (a_string >= a_string2))
			assert ("greater1", a_string >= a_string)
			assert ("greater2", a_string2 >= a_string)
			a_string := clone ("foo")
			a_string2 := clone ("fo")
			assert ("greater3", a_string >= a_string2)
			assert ("not_greater3", not (a_string2 >= a_string))
			a_string := clone ("foo")
			a_string2 := clone ("")
			assert ("greater4", a_string >= a_string2)
			assert ("not_greater4", not (a_string2 >= a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert ("greater5", a_string >= a_string2)
			assert ("greater6", a_string2 >= a_string)
		end

	test_min is
			-- Test feature `min'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("bar")
			a_string2 := clone ("foo")
			assert_same ("min1", a_string, a_string.min (a_string2))
			assert_same ("min2", a_string, a_string.min (a_string))
			assert_same ("min3", a_string, a_string2.min (a_string))
			a_string := clone ("foo")
			a_string2 := clone ("")
			assert_same ("min4", a_string2, a_string.min (a_string2))
			assert_same ("min5", a_string2, a_string2.min (a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert_same ("min6", a_string, a_string.min (a_string2))
			assert_same ("min7", a_string2, a_string2.min (a_string))
		end

	test_max is
			-- Test feature `max'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foo")
			a_string2 := clone ("bar")
			assert_same ("max1", a_string, a_string.max (a_string2))
			assert_same ("max2", a_string, a_string.max (a_string))
			assert_same ("max3", a_string, a_string2.max (a_string))
			a_string := clone ("")
			a_string2 := clone ("foo")
			assert_same ("max4", a_string2, a_string.max (a_string2))
			assert_same ("max5", a_string2, a_string2.max (a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert_same ("max6", a_string, a_string.max (a_string2))
			assert_same ("max7", a_string2, a_string2.max (a_string))
		end

	test_three_way_comparison is
			-- Test feature `three_way_comparison'.
		local
			a_string, a_string2: STRING
		do
			a_string := clone ("foo")
			a_string2 := clone ("bar")
			assert_equal ("compare1", 1, a_string.three_way_comparison (a_string2))
			assert_equal ("compare2", 0, a_string.three_way_comparison (a_string))
			assert_equal ("compare3", -1, a_string2.three_way_comparison (a_string))
			a_string := clone ("")
			a_string2 := clone ("foo")
			assert_equal ("compare4", -1, a_string.three_way_comparison (a_string2))
			assert_equal ("compare5", 1, a_string2.three_way_comparison (a_string))
			a_string := clone ("foo")
			a_string2 := clone ("foo")
			assert_equal ("compare6", 0, a_string.three_way_comparison (a_string2))
			assert_equal ("compare7", 0, a_string2.three_way_comparison (a_string))
		end

	test_manifest_string_0 is
			-- Test special characters %/0/ in manifest strings.
		local
			a_string: STRING
		do
			if not eiffel_compiler.is_hact then
					-- HACT does not support null characters in manifest strings.
				a_string := "%/0/"
				assert_equal ("code_0", 0, a_string.item (1).code)
			end
		end

	test_manifest_string_1 is
			-- Test special character %/1/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/1/"
			assert_equal ("code_1", 1, a_string.item (1).code)
		end

	test_manifest_string_2 is
			-- Test special character %/2/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/2/"
			assert_equal ("code_2", 2, a_string.item (1).code)
		end

	test_manifest_string_3 is
			-- Test special character %/3/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/3/"
			assert_equal ("code_3", 3, a_string.item (1).code)
		end

	test_manifest_string_4 is
			-- Test special character %/4/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/4/"
			assert_equal ("code_4", 4, a_string.item (1).code)
		end

	test_manifest_string_5 is
			-- Test special character %/5/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/5/"
			assert_equal ("code_5", 5, a_string.item (1).code)
		end

	test_manifest_string_6 is
			-- Test special character %/6/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/6/"
			assert_equal ("code_6", 6, a_string.item (1).code)
		end

	test_manifest_string_7 is
			-- Test special character %/7/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/7/"
			assert_equal ("code_7", 7, a_string.item (1).code)
		end

	test_manifest_string_8 is
			-- Test special character %/8/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/8/"
			assert_equal ("code_8", 8, a_string.item (1).code)
		end

	test_manifest_string_9 is
			-- Test special character %/9/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/9/"
			assert_equal ("code_9", 9, a_string.item (1).code)
		end

	test_manifest_string_10 is
			-- Test special character %/10/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/10/"
			assert_equal ("code_10", 10, a_string.item (1).code)
		end

	test_manifest_string_11 is
			-- Test special character %/11/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/11/"
			assert_equal ("code_11", 11, a_string.item (1).code)
		end

	test_manifest_string_12 is
			-- Test special character %/12/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/12/"
			assert_equal ("code_12", 12, a_string.item (1).code)
		end

	test_manifest_string_13 is
			-- Test special character %/13/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/13/"
			assert_equal ("code_13", 13, a_string.item (1).code)
		end

	test_manifest_string_14 is
			-- Test special character %/14/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/14/"
			assert_equal ("code_14", 14, a_string.item (1).code)
		end

	test_manifest_string_15 is
			-- Test special character %/15/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/15/"
			assert_equal ("code_15", 15, a_string.item (1).code)
		end

	test_manifest_string_16 is
			-- Test special character %/16/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/16/"
			assert_equal ("code_16", 16, a_string.item (1).code)
		end

	test_manifest_string_17 is
			-- Test special character %/17/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/17/"
			assert_equal ("code_17", 17, a_string.item (1).code)
		end

	test_manifest_string_18 is
			-- Test special character %/18/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/18/"
			assert_equal ("code_18", 18, a_string.item (1).code)
		end

	test_manifest_string_19 is
			-- Test special character %/19/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/19/"
			assert_equal ("code_19", 19, a_string.item (1).code)
		end

	test_manifest_string_20 is
			-- Test special character %/20/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/20/"
			assert_equal ("code_20", 20, a_string.item (1).code)
		end

	test_manifest_string_21 is
			-- Test special character %/21/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/21/"
			assert_equal ("code_21", 21, a_string.item (1).code)
		end

	test_manifest_string_22 is
			-- Test special character %/22/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/22/"
			assert_equal ("code_22", 22, a_string.item (1).code)
		end

	test_manifest_string_23 is
			-- Test special character %/23/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/23/"
			assert_equal ("code_23", 23, a_string.item (1).code)
		end

	test_manifest_string_24 is
			-- Test special character %/24/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/24/"
			assert_equal ("code_24", 24, a_string.item (1).code)
		end

	test_manifest_string_25 is
			-- Test special character %/25/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/25/"
			assert_equal ("code_25", 25, a_string.item (1).code)
		end

	test_manifest_string_26 is
			-- Test special character %/26/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/26/"
			assert_equal ("code_26", 26, a_string.item (1).code)
		end

	test_manifest_string_27 is
			-- Test special character %/27/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/27/"
			assert_equal ("code_27", 27, a_string.item (1).code)
		end

	test_manifest_string_28 is
			-- Test special character %/28/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/28/"
			assert_equal ("code_28", 28, a_string.item (1).code)
		end

	test_manifest_string_29 is
			-- Test special character %/29/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/29/"
			assert_equal ("code_29", 29, a_string.item (1).code)
		end

	test_manifest_string_30 is
			-- Test special character %/30/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/30/"
			assert_equal ("code_30", 30, a_string.item (1).code)
		end

	test_manifest_string_31 is
			-- Test special character %/31/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/31/"
			assert_equal ("code_31", 31, a_string.item (1).code)
		end

	test_manifest_string_32 is
			-- Test special character %/32/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/32/"
			assert_equal ("code_32", 32, a_string.item (1).code)
		end

	test_manifest_string_33 is
			-- Test special character %/33/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/33/"
			assert_equal ("code_33", 33, a_string.item (1).code)
		end

	test_manifest_string_34 is
			-- Test special character %/34/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/34/"
			assert_equal ("code_34", 34, a_string.item (1).code)
		end

	test_manifest_string_35 is
			-- Test special character %/35/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/35/"
			assert_equal ("code_35", 35, a_string.item (1).code)
		end

	test_manifest_string_36 is
			-- Test special character %/36/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/36/"
			assert_equal ("code_36", 36, a_string.item (1).code)
		end

	test_manifest_string_37 is
			-- Test special character %/37/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/37/"
			assert_equal ("code_37", 37, a_string.item (1).code)
		end

	test_manifest_string_38 is
			-- Test special character %/38/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/38/"
			assert_equal ("code_38", 38, a_string.item (1).code)
		end

	test_manifest_string_39 is
			-- Test special character %/39/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/39/"
			assert_equal ("code_39", 39, a_string.item (1).code)
		end

	test_manifest_string_40 is
			-- Test special character %/40/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/40/"
			assert_equal ("code_40", 40, a_string.item (1).code)
		end

	test_manifest_string_41 is
			-- Test special character %/41/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/41/"
			assert_equal ("code_41", 41, a_string.item (1).code)
		end

	test_manifest_string_42 is
			-- Test special character %/42/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/42/"
			assert_equal ("code_42", 42, a_string.item (1).code)
		end

	test_manifest_string_43 is
			-- Test special character %/43/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/43/"
			assert_equal ("code_43", 43, a_string.item (1).code)
		end

	test_manifest_string_44 is
			-- Test special character %/44/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/44/"
			assert_equal ("code_44", 44, a_string.item (1).code)
		end

	test_manifest_string_45 is
			-- Test special character %/45/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/45/"
			assert_equal ("code_45", 45, a_string.item (1).code)
		end

	test_manifest_string_46 is
			-- Test special character %/46/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/46/"
			assert_equal ("code_46", 46, a_string.item (1).code)
		end

	test_manifest_string_47 is
			-- Test special character %/47/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/47/"
			assert_equal ("code_47", 47, a_string.item (1).code)
		end

	test_manifest_string_48 is
			-- Test special character %/48/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/48/"
			assert_equal ("code_48", 48, a_string.item (1).code)
		end

	test_manifest_string_49 is
			-- Test special character %/49/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/49/"
			assert_equal ("code_49", 49, a_string.item (1).code)
		end

	test_manifest_string_50 is
			-- Test special character %/50/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/50/"
			assert_equal ("code_50", 50, a_string.item (1).code)
		end

	test_manifest_string_51 is
			-- Test special character %/51/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/51/"
			assert_equal ("code_51", 51, a_string.item (1).code)
		end

	test_manifest_string_52 is
			-- Test special character %/52/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/52/"
			assert_equal ("code_52", 52, a_string.item (1).code)
		end

	test_manifest_string_53 is
			-- Test special character %/53/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/53/"
			assert_equal ("code_53", 53, a_string.item (1).code)
		end

	test_manifest_string_54 is
			-- Test special character %/54/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/54/"
			assert_equal ("code_54", 54, a_string.item (1).code)
		end

	test_manifest_string_55 is
			-- Test special character %/55/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/55/"
			assert_equal ("code_55", 55, a_string.item (1).code)
		end

	test_manifest_string_56 is
			-- Test special character %/56/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/56/"
			assert_equal ("code_56", 56, a_string.item (1).code)
		end

	test_manifest_string_57 is
			-- Test special character %/57/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/57/"
			assert_equal ("code_57", 57, a_string.item (1).code)
		end

	test_manifest_string_58 is
			-- Test special character %/58/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/58/"
			assert_equal ("code_58", 58, a_string.item (1).code)
		end

	test_manifest_string_59 is
			-- Test special character %/59/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/59/"
			assert_equal ("code_59", 59, a_string.item (1).code)
		end

	test_manifest_string_60 is
			-- Test special character %/60/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/60/"
			assert_equal ("code_60", 60, a_string.item (1).code)
		end

	test_manifest_string_61 is
			-- Test special character %/61/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/61/"
			assert_equal ("code_61", 61, a_string.item (1).code)
		end

	test_manifest_string_62 is
			-- Test special character %/62/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/62/"
			assert_equal ("code_62", 62, a_string.item (1).code)
		end

	test_manifest_string_63 is
			-- Test special character %/63/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/63/"
			assert_equal ("code_63", 63, a_string.item (1).code)
		end

	test_manifest_string_64 is
			-- Test special character %/64/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/64/"
			assert_equal ("code_64", 64, a_string.item (1).code)
		end

	test_manifest_string_65 is
			-- Test special character %/65/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/65/"
			assert_equal ("code_65", 65, a_string.item (1).code)
		end

	test_manifest_string_66 is
			-- Test special character %/66/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/66/"
			assert_equal ("code_66", 66, a_string.item (1).code)
		end

	test_manifest_string_67 is
			-- Test special character %/67/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/67/"
			assert_equal ("code_67", 67, a_string.item (1).code)
		end

	test_manifest_string_68 is
			-- Test special character %/68/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/68/"
			assert_equal ("code_68", 68, a_string.item (1).code)
		end

	test_manifest_string_69 is
			-- Test special character %/69/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/69/"
			assert_equal ("code_69", 69, a_string.item (1).code)
		end

	test_manifest_string_70 is
			-- Test special character %/70/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/70/"
			assert_equal ("code_70", 70, a_string.item (1).code)
		end

	test_manifest_string_71 is
			-- Test special character %/71/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/71/"
			assert_equal ("code_71", 71, a_string.item (1).code)
		end

	test_manifest_string_72 is
			-- Test special character %/72/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/72/"
			assert_equal ("code_72", 72, a_string.item (1).code)
		end

	test_manifest_string_73 is
			-- Test special character %/73/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/73/"
			assert_equal ("code_73", 73, a_string.item (1).code)
		end

	test_manifest_string_74 is
			-- Test special character %/74/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/74/"
			assert_equal ("code_74", 74, a_string.item (1).code)
		end

	test_manifest_string_75 is
			-- Test special character %/75/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/75/"
			assert_equal ("code_75", 75, a_string.item (1).code)
		end

	test_manifest_string_76 is
			-- Test special character %/76/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/76/"
			assert_equal ("code_76", 76, a_string.item (1).code)
		end

	test_manifest_string_77 is
			-- Test special character %/77/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/77/"
			assert_equal ("code_77", 77, a_string.item (1).code)
		end

	test_manifest_string_78 is
			-- Test special character %/78/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/78/"
			assert_equal ("code_78", 78, a_string.item (1).code)
		end

	test_manifest_string_79 is
			-- Test special character %/79/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/79/"
			assert_equal ("code_79", 79, a_string.item (1).code)
		end

	test_manifest_string_80 is
			-- Test special character %/80/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/80/"
			assert_equal ("code_80", 80, a_string.item (1).code)
		end

	test_manifest_string_81 is
			-- Test special character %/81/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/81/"
			assert_equal ("code_81", 81, a_string.item (1).code)
		end

	test_manifest_string_82 is
			-- Test special character %/82/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/82/"
			assert_equal ("code_82", 82, a_string.item (1).code)
		end

	test_manifest_string_83 is
			-- Test special character %/83/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/83/"
			assert_equal ("code_83", 83, a_string.item (1).code)
		end

	test_manifest_string_84 is
			-- Test special character %/84/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/84/"
			assert_equal ("code_84", 84, a_string.item (1).code)
		end

	test_manifest_string_85 is
			-- Test special character %/85/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/85/"
			assert_equal ("code_85", 85, a_string.item (1).code)
		end

	test_manifest_string_86 is
			-- Test special character %/86/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/86/"
			assert_equal ("code_86", 86, a_string.item (1).code)
		end

	test_manifest_string_87 is
			-- Test special character %/87/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/87/"
			assert_equal ("code_87", 87, a_string.item (1).code)
		end

	test_manifest_string_88 is
			-- Test special character %/88/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/88/"
			assert_equal ("code_88", 88, a_string.item (1).code)
		end

	test_manifest_string_89 is
			-- Test special character %/89/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/89/"
			assert_equal ("code_89", 89, a_string.item (1).code)
		end

	test_manifest_string_90 is
			-- Test special character %/90/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/90/"
			assert_equal ("code_90", 90, a_string.item (1).code)
		end

	test_manifest_string_91 is
			-- Test special character %/91/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/91/"
			assert_equal ("code_91", 91, a_string.item (1).code)
		end

	test_manifest_string_92 is
			-- Test special character %/92/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/92/"
			assert_equal ("code_92", 92, a_string.item (1).code)
		end

	test_manifest_string_93 is
			-- Test special character %/93/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/93/"
			assert_equal ("code_93", 93, a_string.item (1).code)
		end

	test_manifest_string_94 is
			-- Test special character %/94/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/94/"
			assert_equal ("code_94", 94, a_string.item (1).code)
		end

	test_manifest_string_95 is
			-- Test special character %/95/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/95/"
			assert_equal ("code_95", 95, a_string.item (1).code)
		end

	test_manifest_string_96 is
			-- Test special character %/96/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/96/"
			assert_equal ("code_96", 96, a_string.item (1).code)
		end

	test_manifest_string_97 is
			-- Test special character %/97/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/97/"
			assert_equal ("code_97", 97, a_string.item (1).code)
		end

	test_manifest_string_98 is
			-- Test special character %/98/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/98/"
			assert_equal ("code_98", 98, a_string.item (1).code)
		end

	test_manifest_string_99 is
			-- Test special character %/99/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/99/"
			assert_equal ("code_99", 99, a_string.item (1).code)
		end

	test_manifest_string_100 is
			-- Test special character %/100/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/100/"
			assert_equal ("code_100", 100, a_string.item (1).code)
		end

	test_manifest_string_101 is
			-- Test special character %/101/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/101/"
			assert_equal ("code_101", 101, a_string.item (1).code)
		end

	test_manifest_string_102 is
			-- Test special character %/102/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/102/"
			assert_equal ("code_102", 102, a_string.item (1).code)
		end

	test_manifest_string_103 is
			-- Test special character %/103/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/103/"
			assert_equal ("code_103", 103, a_string.item (1).code)
		end

	test_manifest_string_104 is
			-- Test special character %/104/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/104/"
			assert_equal ("code_104", 104, a_string.item (1).code)
		end

	test_manifest_string_105 is
			-- Test special character %/105/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/105/"
			assert_equal ("code_105", 105, a_string.item (1).code)
		end

	test_manifest_string_106 is
			-- Test special character %/106/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/106/"
			assert_equal ("code_106", 106, a_string.item (1).code)
		end

	test_manifest_string_107 is
			-- Test special character %/107/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/107/"
			assert_equal ("code_107", 107, a_string.item (1).code)
		end

	test_manifest_string_108 is
			-- Test special character %/108/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/108/"
			assert_equal ("code_108", 108, a_string.item (1).code)
		end

	test_manifest_string_109 is
			-- Test special character %/109/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/109/"
			assert_equal ("code_109", 109, a_string.item (1).code)
		end

	test_manifest_string_110 is
			-- Test special character %/110/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/110/"
			assert_equal ("code_110", 110, a_string.item (1).code)
		end

	test_manifest_string_111 is
			-- Test special character %/111/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/111/"
			assert_equal ("code_111", 111, a_string.item (1).code)
		end

	test_manifest_string_112 is
			-- Test special character %/112/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/112/"
			assert_equal ("code_112", 112, a_string.item (1).code)
		end

	test_manifest_string_113 is
			-- Test special character %/113/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/113/"
			assert_equal ("code_113", 113, a_string.item (1).code)
		end

	test_manifest_string_114 is
			-- Test special character %/114/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/114/"
			assert_equal ("code_114", 114, a_string.item (1).code)
		end

	test_manifest_string_115 is
			-- Test special character %/115/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/115/"
			assert_equal ("code_115", 115, a_string.item (1).code)
		end

	test_manifest_string_116 is
			-- Test special character %/116/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/116/"
			assert_equal ("code_116", 116, a_string.item (1).code)
		end

	test_manifest_string_117 is
			-- Test special character %/117/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/117/"
			assert_equal ("code_117", 117, a_string.item (1).code)
		end

	test_manifest_string_118 is
			-- Test special character %/118/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/118/"
			assert_equal ("code_118", 118, a_string.item (1).code)
		end

	test_manifest_string_119 is
			-- Test special character %/119/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/119/"
			assert_equal ("code_119", 119, a_string.item (1).code)
		end

	test_manifest_string_120 is
			-- Test special character %/120/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/120/"
			assert_equal ("code_120", 120, a_string.item (1).code)
		end

	test_manifest_string_121 is
			-- Test special character %/121/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/121/"
			assert_equal ("code_121", 121, a_string.item (1).code)
		end

	test_manifest_string_122 is
			-- Test special character %/122/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/122/"
			assert_equal ("code_122", 122, a_string.item (1).code)
		end

	test_manifest_string_123 is
			-- Test special character %/123/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/123/"
			assert_equal ("code_123", 123, a_string.item (1).code)
		end

	test_manifest_string_124 is
			-- Test special character %/124/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/124/"
			assert_equal ("code_124", 124, a_string.item (1).code)
		end

	test_manifest_string_125 is
			-- Test special character %/125/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/125/"
			assert_equal ("code_125", 125, a_string.item (1).code)
		end

	test_manifest_string_126 is
			-- Test special character %/126/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/126/"
			assert_equal ("code_126", 126, a_string.item (1).code)
		end

	test_manifest_string_127 is
			-- Test special character %/127/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/127/"
			assert_equal ("code_127", 127, a_string.item (1).code)
		end

	test_manifest_string_128 is
			-- Test special character %/128/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/128/"
			assert_equal ("code_128", 128, a_string.item (1).code)
		end

	test_manifest_string_129 is
			-- Test special character %/129/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/129/"
			assert_equal ("code_129", 129, a_string.item (1).code)
		end

	test_manifest_string_130 is
			-- Test special character %/130/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/130/"
			assert_equal ("code_130", 130, a_string.item (1).code)
		end

	test_manifest_string_131 is
			-- Test special character %/131/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/131/"
			assert_equal ("code_131", 131, a_string.item (1).code)
		end

	test_manifest_string_132 is
			-- Test special character %/132/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/132/"
			assert_equal ("code_132", 132, a_string.item (1).code)
		end

	test_manifest_string_133 is
			-- Test special character %/133/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/133/"
			assert_equal ("code_133", 133, a_string.item (1).code)
		end

	test_manifest_string_134 is
			-- Test special character %/134/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/134/"
			assert_equal ("code_134", 134, a_string.item (1).code)
		end

	test_manifest_string_135 is
			-- Test special character %/135/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/135/"
			assert_equal ("code_135", 135, a_string.item (1).code)
		end

	test_manifest_string_136 is
			-- Test special character %/136/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/136/"
			assert_equal ("code_136", 136, a_string.item (1).code)
		end

	test_manifest_string_137 is
			-- Test special character %/137/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/137/"
			assert_equal ("code_137", 137, a_string.item (1).code)
		end

	test_manifest_string_138 is
			-- Test special character %/138/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/138/"
			assert_equal ("code_138", 138, a_string.item (1).code)
		end

	test_manifest_string_139 is
			-- Test special character %/139/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/139/"
			assert_equal ("code_139", 139, a_string.item (1).code)
		end

	test_manifest_string_140 is
			-- Test special character %/140/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/140/"
			assert_equal ("code_140", 140, a_string.item (1).code)
		end

	test_manifest_string_141 is
			-- Test special character %/141/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/141/"
			assert_equal ("code_141", 141, a_string.item (1).code)
		end

	test_manifest_string_142 is
			-- Test special character %/142/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/142/"
			assert_equal ("code_142", 142, a_string.item (1).code)
		end

	test_manifest_string_143 is
			-- Test special character %/143/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/143/"
			assert_equal ("code_143", 143, a_string.item (1).code)
		end

	test_manifest_string_144 is
			-- Test special character %/144/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/144/"
			assert_equal ("code_144", 144, a_string.item (1).code)
		end

	test_manifest_string_145 is
			-- Test special character %/145/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/145/"
			assert_equal ("code_145", 145, a_string.item (1).code)
		end

	test_manifest_string_146 is
			-- Test special character %/146/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/146/"
			assert_equal ("code_146", 146, a_string.item (1).code)
		end

	test_manifest_string_147 is
			-- Test special character %/147/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/147/"
			assert_equal ("code_147", 147, a_string.item (1).code)
		end

	test_manifest_string_148 is
			-- Test special character %/148/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/148/"
			assert_equal ("code_148", 148, a_string.item (1).code)
		end

	test_manifest_string_149 is
			-- Test special character %/149/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/149/"
			assert_equal ("code_149", 149, a_string.item (1).code)
		end

	test_manifest_string_150 is
			-- Test special character %/150/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/150/"
			assert_equal ("code_150", 150, a_string.item (1).code)
		end

	test_manifest_string_151 is
			-- Test special character %/151/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/151/"
			assert_equal ("code_151", 151, a_string.item (1).code)
		end

	test_manifest_string_152 is
			-- Test special character %/152/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/152/"
			assert_equal ("code_152", 152, a_string.item (1).code)
		end

	test_manifest_string_153 is
			-- Test special character %/153/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/153/"
			assert_equal ("code_153", 153, a_string.item (1).code)
		end

	test_manifest_string_154 is
			-- Test special character %/154/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/154/"
			assert_equal ("code_154", 154, a_string.item (1).code)
		end

	test_manifest_string_155 is
			-- Test special character %/155/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/155/"
			assert_equal ("code_155", 155, a_string.item (1).code)
		end

	test_manifest_string_156 is
			-- Test special character %/156/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/156/"
			assert_equal ("code_156", 156, a_string.item (1).code)
		end

	test_manifest_string_157 is
			-- Test special character %/157/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/157/"
			assert_equal ("code_157", 157, a_string.item (1).code)
		end

	test_manifest_string_158 is
			-- Test special character %/158/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/158/"
			assert_equal ("code_158", 158, a_string.item (1).code)
		end

	test_manifest_string_159 is
			-- Test special character %/159/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/159/"
			assert_equal ("code_159", 159, a_string.item (1).code)
		end

	test_manifest_string_160 is
			-- Test special character %/160/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/160/"
			assert_equal ("code_160", 160, a_string.item (1).code)
		end

	test_manifest_string_161 is
			-- Test special character %/161/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/161/"
			assert_equal ("code_161", 161, a_string.item (1).code)
		end

	test_manifest_string_162 is
			-- Test special character %/162/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/162/"
			assert_equal ("code_162", 162, a_string.item (1).code)
		end

	test_manifest_string_163 is
			-- Test special character %/163/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/163/"
			assert_equal ("code_163", 163, a_string.item (1).code)
		end

	test_manifest_string_164 is
			-- Test special character %/164/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/164/"
			assert_equal ("code_164", 164, a_string.item (1).code)
		end

	test_manifest_string_165 is
			-- Test special character %/165/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/165/"
			assert_equal ("code_165", 165, a_string.item (1).code)
		end

	test_manifest_string_166 is
			-- Test special character %/166/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/166/"
			assert_equal ("code_166", 166, a_string.item (1).code)
		end

	test_manifest_string_167 is
			-- Test special character %/167/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/167/"
			assert_equal ("code_167", 167, a_string.item (1).code)
		end

	test_manifest_string_168 is
			-- Test special character %/168/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/168/"
			assert_equal ("code_168", 168, a_string.item (1).code)
		end

	test_manifest_string_169 is
			-- Test special character %/169/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/169/"
			assert_equal ("code_169", 169, a_string.item (1).code)
		end

	test_manifest_string_170 is
			-- Test special character %/170/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/170/"
			assert_equal ("code_170", 170, a_string.item (1).code)
		end

	test_manifest_string_171 is
			-- Test special character %/171/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/171/"
			assert_equal ("code_171", 171, a_string.item (1).code)
		end

	test_manifest_string_172 is
			-- Test special character %/172/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/172/"
			assert_equal ("code_172", 172, a_string.item (1).code)
		end

	test_manifest_string_173 is
			-- Test special character %/173/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/173/"
			assert_equal ("code_173", 173, a_string.item (1).code)
		end

	test_manifest_string_174 is
			-- Test special character %/174/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/174/"
			assert_equal ("code_174", 174, a_string.item (1).code)
		end

	test_manifest_string_175 is
			-- Test special character %/175/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/175/"
			assert_equal ("code_175", 175, a_string.item (1).code)
		end

	test_manifest_string_176 is
			-- Test special character %/176/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/176/"
			assert_equal ("code_176", 176, a_string.item (1).code)
		end

	test_manifest_string_177 is
			-- Test special character %/177/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/177/"
			assert_equal ("code_177", 177, a_string.item (1).code)
		end

	test_manifest_string_178 is
			-- Test special character %/178/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/178/"
			assert_equal ("code_178", 178, a_string.item (1).code)
		end

	test_manifest_string_179 is
			-- Test special character %/179/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/179/"
			assert_equal ("code_179", 179, a_string.item (1).code)
		end

	test_manifest_string_180 is
			-- Test special character %/180/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/180/"
			assert_equal ("code_180", 180, a_string.item (1).code)
		end

	test_manifest_string_181 is
			-- Test special character %/181/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/181/"
			assert_equal ("code_181", 181, a_string.item (1).code)
		end

	test_manifest_string_182 is
			-- Test special character %/182/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/182/"
			assert_equal ("code_182", 182, a_string.item (1).code)
		end

	test_manifest_string_183 is
			-- Test special character %/183/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/183/"
			assert_equal ("code_183", 183, a_string.item (1).code)
		end

	test_manifest_string_184 is
			-- Test special character %/184/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/184/"
			assert_equal ("code_184", 184, a_string.item (1).code)
		end

	test_manifest_string_185 is
			-- Test special character %/185/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/185/"
			assert_equal ("code_185", 185, a_string.item (1).code)
		end

	test_manifest_string_186 is
			-- Test special character %/186/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/186/"
			assert_equal ("code_186", 186, a_string.item (1).code)
		end

	test_manifest_string_187 is
			-- Test special character %/187/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/187/"
			assert_equal ("code_187", 187, a_string.item (1).code)
		end

	test_manifest_string_188 is
			-- Test special character %/188/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/188/"
			assert_equal ("code_188", 188, a_string.item (1).code)
		end

	test_manifest_string_189 is
			-- Test special character %/189/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/189/"
			assert_equal ("code_189", 189, a_string.item (1).code)
		end

	test_manifest_string_190 is
			-- Test special character %/190/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/190/"
			assert_equal ("code_190", 190, a_string.item (1).code)
		end

	test_manifest_string_191 is
			-- Test special character %/191/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/191/"
			assert_equal ("code_191", 191, a_string.item (1).code)
		end

	test_manifest_string_192 is
			-- Test special character %/192/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/192/"
			assert_equal ("code_192", 192, a_string.item (1).code)
		end

	test_manifest_string_193 is
			-- Test special character %/193/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/193/"
			assert_equal ("code_193", 193, a_string.item (1).code)
		end

	test_manifest_string_194 is
			-- Test special character %/194/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/194/"
			assert_equal ("code_194", 194, a_string.item (1).code)
		end

	test_manifest_string_195 is
			-- Test special character %/195/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/195/"
			assert_equal ("code_195", 195, a_string.item (1).code)
		end

	test_manifest_string_196 is
			-- Test special character %/196/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/196/"
			assert_equal ("code_196", 196, a_string.item (1).code)
		end

	test_manifest_string_197 is
			-- Test special character %/197/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/197/"
			assert_equal ("code_197", 197, a_string.item (1).code)
		end

	test_manifest_string_198 is
			-- Test special character %/198/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/198/"
			assert_equal ("code_198", 198, a_string.item (1).code)
		end

	test_manifest_string_199 is
			-- Test special character %/199/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/199/"
			assert_equal ("code_199", 199, a_string.item (1).code)
		end

	test_manifest_string_200 is
			-- Test special character %/200/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/200/"
			assert_equal ("code_200", 200, a_string.item (1).code)
		end

	test_manifest_string_201 is
			-- Test special character %/201/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/201/"
			assert_equal ("code_201", 201, a_string.item (1).code)
		end

	test_manifest_string_202 is
			-- Test special character %/202/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/202/"
			assert_equal ("code_202", 202, a_string.item (1).code)
		end

	test_manifest_string_203 is
			-- Test special character %/203/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/203/"
			assert_equal ("code_203", 203, a_string.item (1).code)
		end

	test_manifest_string_204 is
			-- Test special character %/204/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/204/"
			assert_equal ("code_204", 204, a_string.item (1).code)
		end

	test_manifest_string_205 is
			-- Test special character %/205/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/205/"
			assert_equal ("code_205", 205, a_string.item (1).code)
		end

	test_manifest_string_206 is
			-- Test special character %/206/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/206/"
			assert_equal ("code_206", 206, a_string.item (1).code)
		end

	test_manifest_string_207 is
			-- Test special character %/207/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/207/"
			assert_equal ("code_207", 207, a_string.item (1).code)
		end

	test_manifest_string_208 is
			-- Test special character %/208/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/208/"
			assert_equal ("code_208", 208, a_string.item (1).code)
		end

	test_manifest_string_209 is
			-- Test special character %/209/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/209/"
			assert_equal ("code_209", 209, a_string.item (1).code)
		end

	test_manifest_string_210 is
			-- Test special character %/210/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/210/"
			assert_equal ("code_210", 210, a_string.item (1).code)
		end

	test_manifest_string_211 is
			-- Test special character %/211/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/211/"
			assert_equal ("code_211", 211, a_string.item (1).code)
		end

	test_manifest_string_212 is
			-- Test special character %/212/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/212/"
			assert_equal ("code_212", 212, a_string.item (1).code)
		end

	test_manifest_string_213 is
			-- Test special character %/213/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/213/"
			assert_equal ("code_213", 213, a_string.item (1).code)
		end

	test_manifest_string_214 is
			-- Test special character %/214/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/214/"
			assert_equal ("code_214", 214, a_string.item (1).code)
		end

	test_manifest_string_215 is
			-- Test special character %/215/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/215/"
			assert_equal ("code_215", 215, a_string.item (1).code)
		end

	test_manifest_string_216 is
			-- Test special character %/216/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/216/"
			assert_equal ("code_216", 216, a_string.item (1).code)
		end

	test_manifest_string_217 is
			-- Test special character %/217/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/217/"
			assert_equal ("code_217", 217, a_string.item (1).code)
		end

	test_manifest_string_218 is
			-- Test special character %/218/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/218/"
			assert_equal ("code_218", 218, a_string.item (1).code)
		end

	test_manifest_string_219 is
			-- Test special character %/219/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/219/"
			assert_equal ("code_219", 219, a_string.item (1).code)
		end

	test_manifest_string_220 is
			-- Test special character %/220/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/220/"
			assert_equal ("code_220", 220, a_string.item (1).code)
		end

	test_manifest_string_221 is
			-- Test special character %/221/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/221/"
			assert_equal ("code_221", 221, a_string.item (1).code)
		end

	test_manifest_string_222 is
			-- Test special character %/222/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/222/"
			assert_equal ("code_222", 222, a_string.item (1).code)
		end

	test_manifest_string_223 is
			-- Test special character %/223/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/223/"
			assert_equal ("code_223", 223, a_string.item (1).code)
		end

	test_manifest_string_224 is
			-- Test special character %/224/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/224/"
			assert_equal ("code_224", 224, a_string.item (1).code)
		end

	test_manifest_string_225 is
			-- Test special character %/225/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/225/"
			assert_equal ("code_225", 225, a_string.item (1).code)
		end

	test_manifest_string_226 is
			-- Test special character %/226/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/226/"
			assert_equal ("code_226", 226, a_string.item (1).code)
		end

	test_manifest_string_227 is
			-- Test special character %/227/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/227/"
			assert_equal ("code_227", 227, a_string.item (1).code)
		end

	test_manifest_string_228 is
			-- Test special character %/228/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/228/"
			assert_equal ("code_228", 228, a_string.item (1).code)
		end

	test_manifest_string_229 is
			-- Test special character %/229/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/229/"
			assert_equal ("code_229", 229, a_string.item (1).code)
		end

	test_manifest_string_230 is
			-- Test special character %/230/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/230/"
			assert_equal ("code_230", 230, a_string.item (1).code)
		end

	test_manifest_string_231 is
			-- Test special character %/231/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/231/"
			assert_equal ("code_231", 231, a_string.item (1).code)
		end

	test_manifest_string_232 is
			-- Test special character %/232/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/232/"
			assert_equal ("code_232", 232, a_string.item (1).code)
		end

	test_manifest_string_233 is
			-- Test special character %/233/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/233/"
			assert_equal ("code_233", 233, a_string.item (1).code)
		end

	test_manifest_string_234 is
			-- Test special character %/234/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/234/"
			assert_equal ("code_234", 234, a_string.item (1).code)
		end

	test_manifest_string_235 is
			-- Test special character %/235/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/235/"
			assert_equal ("code_235", 235, a_string.item (1).code)
		end

	test_manifest_string_236 is
			-- Test special character %/236/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/236/"
			assert_equal ("code_236", 236, a_string.item (1).code)
		end

	test_manifest_string_237 is
			-- Test special character %/237/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/237/"
			assert_equal ("code_237", 237, a_string.item (1).code)
		end

	test_manifest_string_238 is
			-- Test special character %/238/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/238/"
			assert_equal ("code_238", 238, a_string.item (1).code)
		end

	test_manifest_string_239 is
			-- Test special character %/239/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/239/"
			assert_equal ("code_239", 239, a_string.item (1).code)
		end

	test_manifest_string_240 is
			-- Test special character %/240/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/240/"
			assert_equal ("code_240", 240, a_string.item (1).code)
		end

	test_manifest_string_241 is
			-- Test special character %/241/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/241/"
			assert_equal ("code_241", 241, a_string.item (1).code)
		end

	test_manifest_string_242 is
			-- Test special character %/242/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/242/"
			assert_equal ("code_242", 242, a_string.item (1).code)
		end

	test_manifest_string_243 is
			-- Test special character %/243/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/243/"
			assert_equal ("code_243", 243, a_string.item (1).code)
		end

	test_manifest_string_244 is
			-- Test special character %/244/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/244/"
			assert_equal ("code_244", 244, a_string.item (1).code)
		end

	test_manifest_string_245 is
			-- Test special character %/245/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/245/"
			assert_equal ("code_245", 245, a_string.item (1).code)
		end

	test_manifest_string_246 is
			-- Test special character %/246/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/246/"
			assert_equal ("code_246", 246, a_string.item (1).code)
		end

	test_manifest_string_247 is
			-- Test special character %/247/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/247/"
			assert_equal ("code_247", 247, a_string.item (1).code)
		end

	test_manifest_string_248 is
			-- Test special character %/248/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/248/"
			assert_equal ("code_248", 248, a_string.item (1).code)
		end

	test_manifest_string_249 is
			-- Test special character %/249/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/249/"
			assert_equal ("code_249", 249, a_string.item (1).code)
		end

	test_manifest_string_250 is
			-- Test special character %/250/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/250/"
			assert_equal ("code_250", 250, a_string.item (1).code)
		end

	test_manifest_string_251 is
			-- Test special character %/251/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/251/"
			assert_equal ("code_251", 251, a_string.item (1).code)
		end

	test_manifest_string_252 is
			-- Test special character %/252/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/252/"
			assert_equal ("code_252", 252, a_string.item (1).code)
		end

	test_manifest_string_253 is
			-- Test special character %/253/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/253/"
			assert_equal ("code_253", 253, a_string.item (1).code)
		end

	test_manifest_string_254 is
			-- Test special character %/254/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/254/"
			assert_equal ("code_254", 254, a_string.item (1).code)
		end

	test_manifest_string_255 is
			-- Test special character %/255/ in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/255/"
			assert_equal ("code_255", 255, a_string.item (1).code)
		end

end
