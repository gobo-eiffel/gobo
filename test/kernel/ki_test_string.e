indexing

	description:

		"Test features of class KI_STRING"

	library:    "Gobo Eiffel Kernel Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2001, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class KI_TEST_STRING

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
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
			-- assert_equal ("substring4", "", a_string.substring (2, 1)) 
			a_string := clone ("")
			-- Note: HACT 4.0.1 does not support empty substrings (from ELKS 2001) yet:
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
					-- HACT 4.0.1 has a bug when copying a string on itself.
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
			-- Note: ISE 5.1 and HACT 4.0.1 do not support replacing
			-- a substring by itself:
			--a_string := clone ("foobar")
			--a_string.replace_substring (a_string, 4, 6)
			--assert_equal ("replaced5", "foofoobar", a_string) 
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

end -- class KI_TEST_STRING
