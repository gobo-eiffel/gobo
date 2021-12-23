note

	description:

		"Test features of class STRING"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2008-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_STRING

inherit

	TS_TEST_CASE

	KL_SHARED_EIFFEL_COMPILER
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

create

	make_default

feature -- Test

	test_is_integer
			-- test feature 'is_integer'.
		local
			s: STRING
		do
				-- Note: There is a bug in VE 4.0 (build 4001).
				-- STRING.is_integer (the precondition of STRING.to_integer)
				-- returns false when the number of characters in `a_string'
				-- is greater than PLATFORM.Maximum_integer.out.count. So
				-- "00000000000000000000000000000000065" is not considered
				-- as an integer even though it is valid according to ELKS 2001.
			s := "00000000000000000000000000000000065"
			assert ("is_integer1", s.is_integer)
			assert_integers_equal ("to_integer1", 65, s.to_integer)
		end

	test_make
			-- Test feature 'make'.
		local
			a_string: STRING
		do
				-- Creation routine.
			create a_string.make (5)
			assert_integers_equal ("count1", 0, a_string.count)
			create a_string.make (0)
			assert_integers_equal ("count2", 0, a_string.count)
				-- Regular routine.
			a_string := "foobar"
			a_string.make (5)
			assert_integers_equal ("count3", 0, a_string.count)
			a_string := "foobar"
			a_string.make (0)
			assert_integers_equal ("count4", 0, a_string.count)
		end

	test_make_from_string
			-- Test feature 'make_from_string'.
		local
			a_string1, a_string2: STRING
		do
				-- Creation routine.
			a_string1 := "foobar"
			create a_string2.make_from_string (a_string1)
			assert_equal ("equal1", "foobar", a_string2)
			a_string1.put ('g', 3)
			assert_equal ("changed1", "fogbar", a_string1)
			assert_equal ("not_aliased1", "foobar", a_string2)
				-- Creation with empty string.
			a_string1 := ""
			create a_string2.make_from_string (a_string1)
			assert_equal ("equal2", "", a_string2)
			a_string1.append_character ('g')
			assert_equal ("changed2", "g", a_string1)
			assert_equal ("not_aliased2", "", a_string2)
				-- Regular routine.
			a_string1 := "foobar"
			a_string2 := "go"
			a_string2.make_from_string (a_string1)
			assert_equal ("equal3", "foobar", a_string2)
			a_string1.put ('g', 3)
			assert_equal ("changed3", "fogbar", a_string1)
			assert_equal ("not_aliased3", "foobar", a_string2)
				-- Target string longer than argument.
			a_string1 := "foobar"
			a_string2 := "gobogobogobo"
			a_string2.make_from_string (a_string1)
			assert_equal ("equal4", "foobar", a_string2)
			a_string1.put ('g', 3)
			assert_equal ("changed4", "fogbar", a_string1)
			assert_equal ("not_aliased4", "foobar", a_string2)
				-- Empty target string.
			a_string1 := "foobar"
			a_string2 := ""
			a_string2.make_from_string (a_string1)
			assert_equal ("equal5", "foobar", a_string2)
			a_string1.put ('g', 3)
			assert_equal ("changed5", "fogbar", a_string1)
			assert_equal ("not_aliased5", "foobar", a_string2)
				-- Empty argument string.
			a_string1 := ""
			a_string2 := "gobo"
			create a_string2.make_from_string (a_string1)
			assert_equal ("equal6", "", a_string2)
			a_string1.append_character ('g')
			assert_equal ("changed6", "g", a_string1)
			assert_equal ("not_aliased6", "", a_string2)
				-- Target string same as argument.
			a_string1 := "foobar"
			a_string2 := a_string1
			a_string2.make_from_string (a_string1)
			assert_equal ("equal5", "foobar", a_string2)
		end

	test_make_empty
			-- Test feature 'make_empty'.
		local
			a_string: STRING
		do
			create a_string.make_empty
			assert_integers_equal ("empty", 0, a_string.count)
		end

	test_make_filled
			-- Test feature 'make_filled'.
		local
			a_string: STRING
		do
			create a_string.make_filled ('G', 4)
			assert_equal ("filled1", "GGGG",  a_string)
			create a_string.make_filled ('s', 0)
			assert_equal ("filled2", "",  a_string)
		end

	test_count
			-- Test feature 'count'.
		local
			a_string: STRING
		do
			a_string := "foo"
			assert_integers_equal ("count1", 3, a_string.count)
			a_string := ""
			assert_integers_equal ("count2", 0, a_string.count)
			a_string := "foobar"
			assert_integers_equal ("count3", 6, a_string.count)
		end

	test_valid_index
			-- Test feature 'valid_index'.
		local
			a_string: STRING
		do
			a_string := "foo"
			assert ("valid1", a_string.valid_index (1))
			assert ("valid2", a_string.valid_index (2))
			assert ("valid3", a_string.valid_index (3))
			assert ("not_valid1", not a_string.valid_index (0))
			assert ("not_valid2", not a_string.valid_index (4))
			a_string := ""
			assert ("not_valid3", not a_string.valid_index (0))
			assert ("not_valid4", not a_string.valid_index (1))
		end

	test_item
			-- Test feature 'item'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert_characters_equal ("item1", 'b', a_string.item (1))
			assert_characters_equal ("item2", 'a', a_string.item (2))
			assert_characters_equal ("item3", 'r', a_string.item (3))
		end

	test_item_code
			-- Test feature 'item_code'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert_integers_equal ("item_code1", ('b').code, a_string.item_code (1))
			assert_integers_equal ("item_code2", ('a').code, a_string.item_code (2))
			assert_integers_equal ("item_code3", ('r').code, a_string.item_code (3))
		end

	test_at
			-- Test feature `at'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert_characters_equal ("item1", 'b', a_string.at (1))
			assert_characters_equal ("item2", 'a', a_string.at (2))
			assert_characters_equal ("item3", 'r', a_string.at (3))
		end

	test_put
			-- Test feature 'put'.
		local
			a_string: STRING
		do
			a_string := "bar"
			a_string.put ('f', 1)
			assert_characters_equal ("item1", 'f', a_string.item (1))
			assert_characters_equal ("item2", 'a', a_string.item (2))
			assert_characters_equal ("item3", 'r', a_string.item (3))
			a_string.put ('o', 2)
			assert_characters_equal ("item4", 'f', a_string.item (1))
			assert_characters_equal ("item5", 'o', a_string.item (2))
			assert_characters_equal ("item6", 'r', a_string.item (3))
			a_string.put ('z', 3)
			assert_characters_equal ("item7", 'f', a_string.item (1))
			assert_characters_equal ("item8", 'o', a_string.item (2))
			assert_characters_equal ("item9", 'z', a_string.item (3))
		end

	test_string
			-- Test feature 'string'.
		local
			a_string1, a_string2: STRING
		do
			a_string1 := "foo"
			a_string2 := a_string1.string
			assert ("not_void1", a_string2 /= Void)
			assert ("string_type1", a_string2.same_type (""))
			assert ("new_string1", a_string2 /= a_string1)
			assert_equal ("value1", "foo", a_string2)
				-- Empty string.
			a_string1 := ""
			a_string2 := a_string1.string
			assert ("not_void2", a_string2 /= Void)
			assert ("string_type2", a_string2.same_type (""))
			assert ("new_string2", a_string2 /= a_string1)
			assert_equal ("value2", "", a_string2)
		end

	test_substring
			-- Test feature 'substring'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert_equal ("substring1", "bar", a_string.substring (1, 3))
			assert_equal ("substring2", "ba", a_string.substring (1, 2))
			assert_equal ("substring3", "a", a_string.substring (2, 2))
			assert_equal ("substring4", "", a_string.substring (2, 1))
			a_string := ""
			assert_equal ("substring5", "", a_string.substring (1, 0))
		end

	test_is_equal
			-- Test feature 'is_equal'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert ("is_equal1", a_string.is_equal ("bar"))
			assert ("not_is_equal1", not a_string.is_equal ("foo"))
			assert ("not_is_equal2", not a_string.is_equal ("ba"))
			assert ("not_is_equal3", not a_string.is_equal ("bart"))
			a_string := ""
			assert ("is_equal2", a_string.is_equal (""))
			assert ("not_is_equal4", not a_string.is_equal ("foo"))
		end

	test_same_string
			-- Test feature 'same_string'.
		local
			a_string1, a_string2: STRING
		do
			a_string1 := "foo"
			a_string2 := "foo"
			assert ("same1", a_string1.same_string (a_string2))
			a_string1 := "foo"
			a_string2 := "bar"
			assert ("not_same1", not a_string1.same_string (a_string2))
				-- Empty strings.
			a_string1 := ""
			a_string2 := ""
			assert ("same2", a_string1.same_string (a_string2))
			a_string1 := ""
			a_string2 := "bar"
			assert ("not_same2", not a_string1.same_string (a_string2))
			a_string1 := "foo"
			a_string2 := ""
			assert ("not_same3", not a_string1.same_string (a_string2))
		end

	test_out
			-- Test feature 'out'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert_equal ("out1", "bar", a_string.out)
			a_string := ""
			assert_equal ("out2", "", a_string.out)
		end

	test_copy
			-- Test feature 'copy'.
		local
			a_string: STRING
		do
			a_string := "zx"
			a_string.copy ("foobar")
			assert_equal ("copy1", "foobar", a_string)
			a_string := ""
			a_string.copy ("bar")
			assert_equal ("copy2", "bar", a_string)
			a_string := "foo"
			a_string.copy ("")
			assert_equal ("copy3", "", a_string)
			a_string := "toto"
			a_string.copy (a_string)
			assert_equal ("copy4", "toto", a_string)
		end

	test_fill_with
			-- Test feature 'fill_with'.
		local
			a_string: STRING
		do
			a_string := "foo"
			a_string.fill_with ('a')
			assert_equal ("fill1", "aaa", a_string)
			a_string := ""
			a_string.fill_with ('a')
			assert_equal ("fill2", "", a_string)
		end

	test_append_character
			-- Test feature 'append_character'.
		local
			a_string: STRING
		do
			a_string := "bar"
			a_string.append_character ('f')
			assert_equal ("append_character1", "barf", a_string)
			a_string := ""
			a_string.append_character ('z')
			assert_equal ("append_character2", "z", a_string)
		end

	test_append_string
			-- Test feature 'append_string'.
		local
			a_string: STRING
		do
			a_string := "foo"
			a_string.append_string ("bar")
			assert_equal ("append_string1", "foobar", a_string)
			a_string := ""
			a_string.append_string ("bar")
			assert_equal ("append_string2", "bar", a_string)
			a_string := "foo"
			a_string.append_string ("")
			assert_equal ("append_string3", "foo", a_string)
			a_string := "foo"
			a_string.append_string (a_string)
			assert_equal ("append_string4", "foofoo", a_string)
		end

	test_infix_plus
			-- Test feature `plus' with 'alias "+"'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foo"
			a_string2 := "bar"
			assert_equal ("append_string1", "foobar", a_string + a_string2)
			assert ("new_string1", (a_string + a_string2) /= a_string)
			assert ("new_string2", (a_string + a_string2) /= a_string2)
			a_string := ""
			a_string2 := "bar"
			assert_equal ("append_string2", "bar", a_string + a_string2)
			a_string := "foo"
			a_string2 := ""
			assert_equal ("append_string3", "foo", a_string + a_string2)
			a_string := "foo"
			assert_equal ("append_string4", "foofoo", a_string + a_string)
		end

	test_insert_character
			-- Test feature 'insert_character'.
		local
			a_string: STRING
		do
			a_string := "foo"
			a_string.insert_character ('a', 2)
			assert_equal ("insert1", "faoo", a_string)
			a_string.insert_character ('g', 5)
			assert_equal ("insert2", "faoog", a_string)
			a_string.insert_character ('s', 1)
			assert_equal ("insert3", "sfaoog", a_string)
				-- Empty string.
			a_string := ""
			a_string.insert_character ('a', 1)
			assert_equal ("insert4", "a", a_string)
		end

	test_insert_string
			-- Test feature 'insert_string'.
		local
			a_string: STRING
		do
			a_string := "foo"
			a_string.insert_string ("aa", 2)
			assert_equal ("insert1", "faaoo", a_string)
			a_string.insert_string ("", 1)
			assert_equal ("insert2", "faaoo", a_string)
			a_string.insert_string ("gobo", 6)
			assert_equal ("insert3", "faaoogobo", a_string)
			a_string.insert_string ("s", 1)
			assert_equal ("insert4", "sfaaoogobo", a_string)
				-- Empty string.
			a_string := ""
			a_string.insert_string ("foo", 1)
			assert_equal ("insert5", "foo", a_string)
				-- Same object.
				-- Does not work with ISE 5.4/5.5 due to a bug.
			if not eiffel_compiler.is_ise then
				a_string := "bar"
				a_string.insert_string (a_string, 2)
				assert_equal ("insert6", "bbarar", a_string)
			end
		end

	test_index_of
			-- Test feature 'index_of'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert_integers_equal ("index_of_b1", 1, a_string.index_of ('b', 1))
			assert_integers_equal ("index_of_b2", 0, a_string.index_of ('b', 2))
			assert_integers_equal ("index_of_b3", 0, a_string.index_of ('b', 3))
			assert_integers_equal ("index_of_b4", 0, a_string.index_of ('b', 4))
			assert_integers_equal ("index_of_a1", 2, a_string.index_of ('a', 1))
			assert_integers_equal ("index_of_a2", 2, a_string.index_of ('a', 2))
			assert_integers_equal ("index_of_a3", 0, a_string.index_of ('a', 3))
			assert_integers_equal ("index_of_a4", 0, a_string.index_of ('a', 4))
			assert_integers_equal ("index_of_r1", 3, a_string.index_of ('r', 1))
			assert_integers_equal ("index_of_r2", 3, a_string.index_of ('r', 2))
			assert_integers_equal ("index_of_r3", 3, a_string.index_of ('r', 3))
			assert_integers_equal ("index_of_r4", 0, a_string.index_of ('r', 4))
			assert_integers_equal ("index_of_z1", 0, a_string.index_of ('z', 1))
			assert_integers_equal ("index_of_z2", 0, a_string.index_of ('z', 2))
			assert_integers_equal ("index_of_z3", 0, a_string.index_of ('z', 3))
			assert_integers_equal ("index_of_z4", 0, a_string.index_of ('z', 4))
			a_string := ""
			assert_integers_equal ("index_of_o1", 0, a_string.index_of ('o', 1))
		end

	test_substring_index1
			-- Test feature 'substring_index'.
		local
			a_string1: STRING
		do
			a_string1 := "foobar"
			assert_integers_equal ("index1", 4, a_string1.substring_index ("bar", 1))
			assert_integers_equal ("index2", 4, a_string1.substring_index ("bar", 4))
			assert_integers_equal ("index3", 0, a_string1.substring_index ("bar", 5))
			assert_integers_equal ("index4", 0, a_string1.substring_index ("bar", 7))
			assert_integers_equal ("index5", 3, a_string1.substring_index ("oba", 2))
			assert_integers_equal ("index6", 1, a_string1.substring_index ("fo", 1))
			assert_integers_equal ("index7", 2, a_string1.substring_index ("o", 1))
			assert_integers_equal ("index8", 3, a_string1.substring_index ("o", 3))
			assert_integers_equal ("index9", 5, a_string1.substring_index ("", 5))
			if not operating_system.is_dotnet then
					-- Bug in ISE 5.5 for .NET.
				assert_integers_equal ("index10", 7, a_string1.substring_index ("", 7))
			end
			assert_integers_equal ("index11", 0, a_string1.substring_index ("gobo", 2))
			assert_integers_equal ("index12", 0, a_string1.substring_index ("gobogobogobo", 1))
			assert_integers_equal ("index13", 0, a_string1.substring_index (a_string1, 2))
			assert_integers_equal ("index14", 1, a_string1.substring_index (a_string1, 1))
			assert_integers_equal ("index15", 0, a_string1.substring_index (a_string1, 7))
			a_string1 := ""
			assert_integers_equal ("index16", 0, a_string1.substring_index ("gobo", 1))
			if not operating_system.is_dotnet then
					-- Bug in ISE 5.5 for .NET.
				assert_integers_equal ("index17", 1, a_string1.substring_index ("", 1))
			end
		end

	test_substring_index2
			-- Test feature 'substring_index'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foobar"
			a_string2 := "bar"
			assert_integers_equal ("index1", 4, a_string.substring_index (a_string2, 1))
			assert_integers_equal ("index2", 4, a_string.substring_index (a_string2, 2))
			assert_integers_equal ("index3", 4, a_string.substring_index (a_string2, 3))
			assert_integers_equal ("index4", 4, a_string.substring_index (a_string2, 4))
			assert_integers_equal ("index5", 0, a_string.substring_index (a_string2, 5))
			assert_integers_equal ("index6", 0, a_string.substring_index (a_string2, 6))
			a_string := "bar"
			a_string2 := "foobar"
			assert_integers_equal ("index6", 0, a_string.substring_index (a_string2, 1))
			assert_integers_equal ("index7", 0, a_string.substring_index (a_string2, 2))
			assert_integers_equal ("index8", 0, a_string.substring_index (a_string2, 3))
			assert_integers_equal ("index9", 1, a_string.substring_index (a_string, 1))
			assert_integers_equal ("index10", 0, a_string.substring_index (a_string, 2))
			assert_integers_equal ("index11", 0, a_string.substring_index (a_string, 3))
		end

	test_has
			-- Test feature 'has'.
		local
			a_string: STRING
		do
			a_string := "bar"
			assert ("has_b", a_string.has ('b'))
			assert ("has_a", a_string.has ('a'))
			assert ("has_r", a_string.has ('r'))
			assert ("not_has_o", not a_string.has ('o'))
			a_string := ""
			assert ("not_has_f", not a_string.has ('f'))
		end

	test_has_substring
			-- Test feature 'has_substring'.
		local
			a_string1: STRING
		do
			a_string1 := "foobar"
			assert ("has1", a_string1.has_substring ("oo"))
			assert ("has2", a_string1.has_substring ("foobar"))
			assert ("has3", a_string1.has_substring (a_string1))
			assert ("has4", a_string1.has_substring (""))
			assert ("not_has1", not a_string1.has_substring ("gobo"))
				-- Empty string.
			a_string1 := ""
			if not operating_system.is_dotnet then
					-- Bug in ISE 5.5 for .NET.
				assert ("has5", a_string1.has_substring (""))
			end
			assert ("not_has2", not a_string1.has_substring ("gobo"))
		end

	test_occurrences
			-- Test feature 'occurrences'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			assert_integers_equal ("b", 1, a_string.occurrences ('b'))
			assert_integers_equal ("a", 1, a_string.occurrences ('a'))
			assert_integers_equal ("r", 1, a_string.occurrences ('r'))
			assert_integers_equal ("o", 2, a_string.occurrences ('o'))
			assert_integers_equal ("f", 1, a_string.occurrences ('f'))
			assert_integers_equal ("z", 0, a_string.occurrences ('z'))
			a_string := ""
			assert_integers_equal ("x", 0, a_string.occurrences ('x'))
		end

	test_keep_head
			-- Test feature 'keep_head'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.keep_head (10)
			assert_equal ("head_10", "foobar", a_string)
			a_string.keep_head (6)
			assert_equal ("head_6", "foobar", a_string)
			a_string.keep_head (3)
			assert_equal ("head_3", "foo", a_string)
			a_string.keep_head (0)
			assert_equal ("head_0", "", a_string)
				-- Empty string.
			a_string := ""
			a_string.keep_head (0)
			assert_equal ("head2_0", "", a_string)
			a_string.keep_head (5)
			assert_equal ("head2_5", "", a_string)
		end

	test_keep_tail
			-- Test feature 'keep_tail'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.keep_tail (10)
			assert_equal ("tail_10", "foobar", a_string)
			a_string.keep_tail (6)
			assert_equal ("tail_6", "foobar", a_string)
			a_string.keep_tail (3)
			assert_equal ("tail_3", "bar", a_string)
			a_string.keep_tail (0)
			assert_equal ("tail_0", "", a_string)
				-- Empty string.
			a_string := ""
			a_string.keep_tail (0)
			assert_equal ("tail2_0", "", a_string)
			a_string.keep_tail (5)
			assert_equal ("tail2_5", "", a_string)
		end

	test_remove_head
			-- Test feature 'remove_head'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.remove_head (10)
			assert_equal ("tail_10", "", a_string)
			a_string := "foobar"
			a_string.remove_head (6)
			assert_equal ("tail_6", "", a_string)
			a_string := "foobar"
			a_string.remove_head (3)
			assert_equal ("tail_3", "bar", a_string)
			a_string := "foobar"
			a_string.remove_head (0)
			assert_equal ("tail_0", "foobar", a_string)
				-- Empty string.
			a_string := ""
			a_string.remove_head (0)
			assert_equal ("tail2_0", "", a_string)
			a_string.remove_head (5)
			assert_equal ("tail2_5", "", a_string)
		end

	test_remove_tail
			-- Test feature 'remove_tail'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.remove_tail (10)
			assert_equal ("head_10", "", a_string)
			a_string := "foobar"
			a_string.remove_tail (6)
			assert_equal ("head_6", "", a_string)
			a_string := "foobar"
			a_string.remove_tail (3)
			assert_equal ("head_3", "foo", a_string)
			a_string := "foobar"
			a_string.remove_tail (0)
			assert_equal ("head_0", "foobar", a_string)
				-- Empty string.
			a_string := ""
			a_string.remove_tail (0)
			assert_equal ("head2_0", "", a_string)
			a_string.remove_tail (5)
			assert_equal ("head2_5", "", a_string)
		end

	test_remove_substring
			-- Test feature 'remove_substring'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.remove_substring (2, 4)
			assert_equal ("remove1", "far", a_string)
			a_string := "gobo"
			a_string.remove_substring (1, 4)
			assert_equal ("remove2", "", a_string)
			a_string := "gobo"
			a_string.remove_substring (1, 0)
			assert_equal ("remove3", "gobo", a_string)
			a_string := ""
			a_string.remove_substring (1, 0)
			assert_equal ("remove4", "", a_string)
		end

	test_hash_code
			-- Test feature 'hash_code'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foobar"
			assert ("hash_code1", a_string.hash_code = a_string.hash_code)
			a_string2 := "foobar"
			assert ("hash_code2", a_string.hash_code = a_string2.hash_code)
		end

	test_replace_substring
			-- Test feature 'replace_substring'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foobar"
			a_string2 := "toto"
			a_string.replace_substring (a_string2, 1, 6)
			assert_equal ("replaced1", "toto", a_string)
			a_string := "foobar"
			a_string2 := "toto"
			a_string.replace_substring (a_string2, 1, 1)
			assert_equal ("replaced2", "totooobar", a_string)
			a_string := "foobar"
			a_string2 := "toto"
			a_string.replace_substring (a_string2, 4, 6)
			assert_equal ("replaced3", "foototo", a_string)
			a_string := "foobar"
			a_string2 := ""
			a_string.replace_substring (a_string2, 2, 4)
			assert_equal ("replaced4", "far", a_string)
				-- Empty string.
			a_string := ""
			a_string.replace_substring ("", 1, 0)
			assert_equal ("replaced6", "", a_string)
			a_string.replace_substring ("gobo", 1, 0)
			assert_equal ("replaced7", "gobo", a_string)
				-- Empty substring.
			a_string := "foo"
			a_string.replace_substring ("bar", 2, 1)
			assert_equal ("replaced8", "fbaroo", a_string)
				-- Replacing a substring by itself.
			if not operating_system.is_dotnet then
					-- Bug in ISE 5.5 for .NET.
				a_string := "foobar"
				a_string.replace_substring (a_string, 4, 6)
				assert_equal ("replaced5", "foofoobar", a_string)
			end
		end

	test_wipe_out
			-- Test feature 'wipe_out'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.wipe_out
			assert_equal ("wiped_out1", "", a_string)
			a_string := ""
			a_string.wipe_out
			assert_equal ("wiped_out2", "", a_string)
		end

	test_remove
			-- Test feature 'remove'.
		local
			a_string: STRING
		do
			a_string := "foobar"
			a_string.remove (1)
			assert_equal ("removed1", "oobar", a_string)
			a_string.remove (5)
			assert_equal ("removed2", "ooba", a_string)
			a_string.remove (3)
			assert_equal ("removed3", "ooa", a_string)
		end

	test_to_lower
			-- Test feature 'to_lower'.
		local
			a_string: STRING
		do
			a_string := "foo.BAR"
			a_string.to_lower
			assert_equal ("to_lower1", "foo.bar", a_string)
			a_string := ""
			a_string.to_lower
			assert_equal ("to_lower2", "", a_string)
		end

	test_to_upper
			-- Test feature 'to_upper'.
		local
			a_string: STRING
		do
			a_string := "foo.BAR"
			a_string.to_upper
			assert_equal ("to_upper1", "FOO.BAR", a_string)
			a_string := ""
			a_string.to_upper
			assert_equal ("to_upper2", "", a_string)
		end

	test_as_lower
			-- Test feature 'as_lower'.
		local
			a_string, a_string2: STRING
		do
			a_string := "FoO"
			a_string2 := a_string.as_lower
			assert ("new_string1", a_string2 /= a_string)
			assert_equal ("lower1", "foo", a_string2)
				-- Empty string.
			a_string := ""
			a_string2 := a_string.as_lower
			assert ("new_string2", a_string2 /= a_string)
			assert_equal ("lower2", "", a_string2)
		end

	test_as_upper
			-- Test feature 'as_upper'.
		local
			a_string, a_string2: STRING
		do
			a_string := "Foo"
			a_string2 := a_string.as_upper
			assert ("new_string1", a_string2 /= a_string)
			assert_equal ("upper1", "FOO", a_string2)
				-- Empty string.
			a_string := ""
			a_string2 := a_string.as_upper
			assert ("new_string2", a_string2 /= a_string)
			assert_equal ("upper2", "", a_string2)
		end

	test_infix_less
			-- Test feature `is_less' with 'alias "<"'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foo"
			a_string2 := "bar"
			assert ("not_less1", not (a_string < a_string2))
			assert ("not_less2", not (a_string < a_string))
			assert ("less1", a_string2 < a_string)
			a_string := "fo"
			a_string2 := "foo"
			assert ("less2", a_string < a_string2)
			assert ("not_less3", not (a_string2 < a_string))
			a_string := ""
			a_string2 := "foo"
			assert ("less3", a_string < a_string2)
			assert ("not_less4", not (a_string2 < a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert ("not_less5", not (a_string < a_string2))
			assert ("not_less6", not (a_string2 < a_string))
		end

	test_infix_less_equal
			-- Test feature `is_less_equal' with 'alias "<="'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foo"
			a_string2 := "bar"
			assert ("not_less1", not (a_string <= a_string2))
			assert ("less1", a_string <= a_string)
			assert ("less2", a_string2 <= a_string)
			a_string := "fo"
			a_string2 := "foo"
			assert ("less3", a_string <= a_string2)
			assert ("not_less3", not (a_string2 <= a_string))
			a_string := ""
			a_string2 := "foo"
			assert ("less4", a_string <= a_string2)
			assert ("not_less4", not (a_string2 <= a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert ("less5", a_string <= a_string2)
			assert ("less6", a_string2 <= a_string)
		end

	test_infix_greater
			-- Test feature `is_greater' with 'alias ">"'.
		local
			a_string, a_string2: STRING
		do
			a_string := "bar"
			a_string2 := "foo"
			assert ("not_greater1", not (a_string > a_string2))
			assert ("not_greater2", not (a_string > a_string))
			assert ("greater1", a_string2 > a_string)
			a_string := "foo"
			a_string2 := "fo"
			assert ("greater2", a_string > a_string2)
			assert ("not_greater3", not (a_string2 > a_string))
			a_string := "foo"
			a_string2 := ""
			assert ("greater3", a_string > a_string2)
			assert ("not_greater4", not (a_string2 > a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert ("not_greater5", not (a_string > a_string2))
			assert ("not_greater6", not (a_string2 > a_string))
		end

	test_infix_greater_equal
			-- Test feature `is_greater_equal' with 'alias ">="'.
		local
			a_string, a_string2: STRING
		do
			a_string := "bar"
			a_string2 := "foo"
			assert ("not_greater1", not (a_string >= a_string2))
			assert ("greater1", a_string >= a_string)
			assert ("greater2", a_string2 >= a_string)
			a_string := "foo"
			a_string2 := "fo"
			assert ("greater3", a_string >= a_string2)
			assert ("not_greater3", not (a_string2 >= a_string))
			a_string := "foo"
			a_string2 := ""
			assert ("greater4", a_string >= a_string2)
			assert ("not_greater4", not (a_string2 >= a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert ("greater5", a_string >= a_string2)
			assert ("greater6", a_string2 >= a_string)
		end

	test_min
			-- Test feature 'min'.
		local
			a_string, a_string2: STRING
		do
			a_string := "bar"
			a_string2 := "foo"
			assert_same ("min1", a_string, a_string.min (a_string2))
			assert_same ("min2", a_string, a_string.min (a_string))
			assert_same ("min3", a_string, a_string2.min (a_string))
			a_string := "foo"
			a_string2 := ""
			assert_same ("min4", a_string2, a_string.min (a_string2))
			assert_same ("min5", a_string2, a_string2.min (a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert_same ("min6", a_string, a_string.min (a_string2))
			assert_same ("min7", a_string2, a_string2.min (a_string))
		end

	test_max
			-- Test feature 'max'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foo"
			a_string2 := "bar"
			assert_same ("max1", a_string, a_string.max (a_string2))
			assert_same ("max2", a_string, a_string.max (a_string))
			assert_same ("max3", a_string, a_string2.max (a_string))
			a_string := ""
			a_string2 := "foo"
			assert_same ("max4", a_string2, a_string.max (a_string2))
			assert_same ("max5", a_string2, a_string2.max (a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert_same ("max6", a_string, a_string.max (a_string2))
			assert_same ("max7", a_string2, a_string2.max (a_string))
		end

	test_three_way_comparison
			-- Test feature 'three_way_comparison'.
		local
			a_string, a_string2: STRING
		do
			a_string := "foo"
			a_string2 := "bar"
			assert_integers_equal ("compare1", 1, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare2", 0, a_string.three_way_comparison (a_string))
			assert_integers_equal ("compare3", -1, a_string2.three_way_comparison (a_string))
			a_string := ""
			a_string2 := "foo"
			assert_integers_equal ("compare4", -1, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare5", 1, a_string2.three_way_comparison (a_string))
			a_string := "foo"
			a_string2 := "foo"
			assert_integers_equal ("compare6", 0, a_string.three_way_comparison (a_string2))
			assert_integers_equal ("compare7", 0, a_string2.three_way_comparison (a_string))
		end

	test_manifest_string
			-- Test special characters in manifest strings.
		local
			a_string: STRING
		do
			a_string := "%/0/"
			assert_integers_equal ("code_0", 0, a_string.item (1).code)
			a_string := "%/1/"
			assert_integers_equal ("code_1", 1, a_string.item (1).code)
			a_string := "%/2/"
			assert_integers_equal ("code_2", 2, a_string.item (1).code)
			a_string := "%/3/"
			assert_integers_equal ("code_3", 3, a_string.item (1).code)
			a_string := "%/4/"
			assert_integers_equal ("code_4", 4, a_string.item (1).code)
			a_string := "%/5/"
			assert_integers_equal ("code_5", 5, a_string.item (1).code)
			a_string := "%/6/"
			assert_integers_equal ("code_6", 6, a_string.item (1).code)
			a_string := "%/7/"
			assert_integers_equal ("code_7", 7, a_string.item (1).code)
			a_string := "%/8/"
			assert_integers_equal ("code_8", 8, a_string.item (1).code)
			a_string := "%/9/"
			assert_integers_equal ("code_9", 9, a_string.item (1).code)
			a_string := "%/10/"
			assert_integers_equal ("code_10", 10, a_string.item (1).code)
			a_string := "%/11/"
			assert_integers_equal ("code_11", 11, a_string.item (1).code)
			a_string := "%/12/"
			assert_integers_equal ("code_12", 12, a_string.item (1).code)
			a_string := "%/13/"
			assert_integers_equal ("code_13", 13, a_string.item (1).code)
			a_string := "%/14/"
			assert_integers_equal ("code_14", 14, a_string.item (1).code)
			a_string := "%/15/"
			assert_integers_equal ("code_15", 15, a_string.item (1).code)
			a_string := "%/16/"
			assert_integers_equal ("code_16", 16, a_string.item (1).code)
			a_string := "%/17/"
			assert_integers_equal ("code_17", 17, a_string.item (1).code)
			a_string := "%/18/"
			assert_integers_equal ("code_18", 18, a_string.item (1).code)
			a_string := "%/19/"
			assert_integers_equal ("code_19", 19, a_string.item (1).code)
			a_string := "%/20/"
			assert_integers_equal ("code_20", 20, a_string.item (1).code)
			a_string := "%/21/"
			assert_integers_equal ("code_21", 21, a_string.item (1).code)
			a_string := "%/22/"
			assert_integers_equal ("code_22", 22, a_string.item (1).code)
			a_string := "%/23/"
			assert_integers_equal ("code_23", 23, a_string.item (1).code)
			a_string := "%/24/"
			assert_integers_equal ("code_24", 24, a_string.item (1).code)
			a_string := "%/25/"
			assert_integers_equal ("code_25", 25, a_string.item (1).code)
			a_string := "%/26/"
			assert_integers_equal ("code_26", 26, a_string.item (1).code)
			a_string := "%/27/"
			assert_integers_equal ("code_27", 27, a_string.item (1).code)
			a_string := "%/28/"
			assert_integers_equal ("code_28", 28, a_string.item (1).code)
			a_string := "%/29/"
			assert_integers_equal ("code_29", 29, a_string.item (1).code)
			a_string := "%/30/"
			assert_integers_equal ("code_30", 30, a_string.item (1).code)
			a_string := "%/31/"
			assert_integers_equal ("code_31", 31, a_string.item (1).code)
			a_string := "%/32/"
			assert_integers_equal ("code_32", 32, a_string.item (1).code)
			a_string := "%/33/"
			assert_integers_equal ("code_33", 33, a_string.item (1).code)
			a_string := "%/34/"
			assert_integers_equal ("code_34", 34, a_string.item (1).code)
			a_string := "%/35/"
			assert_integers_equal ("code_35", 35, a_string.item (1).code)
			a_string := "%/36/"
			assert_integers_equal ("code_36", 36, a_string.item (1).code)
			a_string := "%/37/"
			assert_integers_equal ("code_37", 37, a_string.item (1).code)
			a_string := "%/38/"
			assert_integers_equal ("code_38", 38, a_string.item (1).code)
			a_string := "%/39/"
			assert_integers_equal ("code_39", 39, a_string.item (1).code)
			a_string := "%/40/"
			assert_integers_equal ("code_40", 40, a_string.item (1).code)
			a_string := "%/41/"
			assert_integers_equal ("code_41", 41, a_string.item (1).code)
			a_string := "%/42/"
			assert_integers_equal ("code_42", 42, a_string.item (1).code)
			a_string := "%/43/"
			assert_integers_equal ("code_43", 43, a_string.item (1).code)
			a_string := "%/44/"
			assert_integers_equal ("code_44", 44, a_string.item (1).code)
			a_string := "%/45/"
			assert_integers_equal ("code_45", 45, a_string.item (1).code)
			a_string := "%/46/"
			assert_integers_equal ("code_46", 46, a_string.item (1).code)
			a_string := "%/47/"
			assert_integers_equal ("code_47", 47, a_string.item (1).code)
			a_string := "%/48/"
			assert_integers_equal ("code_48", 48, a_string.item (1).code)
			a_string := "%/49/"
			assert_integers_equal ("code_49", 49, a_string.item (1).code)
			a_string := "%/50/"
			assert_integers_equal ("code_50", 50, a_string.item (1).code)
			a_string := "%/51/"
			assert_integers_equal ("code_51", 51, a_string.item (1).code)
			a_string := "%/52/"
			assert_integers_equal ("code_52", 52, a_string.item (1).code)
			a_string := "%/53/"
			assert_integers_equal ("code_53", 53, a_string.item (1).code)
			a_string := "%/54/"
			assert_integers_equal ("code_54", 54, a_string.item (1).code)
			a_string := "%/55/"
			assert_integers_equal ("code_55", 55, a_string.item (1).code)
			a_string := "%/56/"
			assert_integers_equal ("code_56", 56, a_string.item (1).code)
			a_string := "%/57/"
			assert_integers_equal ("code_57", 57, a_string.item (1).code)
			a_string := "%/58/"
			assert_integers_equal ("code_58", 58, a_string.item (1).code)
			a_string := "%/59/"
			assert_integers_equal ("code_59", 59, a_string.item (1).code)
			a_string := "%/60/"
			assert_integers_equal ("code_60", 60, a_string.item (1).code)
			a_string := "%/61/"
			assert_integers_equal ("code_61", 61, a_string.item (1).code)
			a_string := "%/62/"
			assert_integers_equal ("code_62", 62, a_string.item (1).code)
			a_string := "%/63/"
			assert_integers_equal ("code_63", 63, a_string.item (1).code)
			a_string := "%/64/"
			assert_integers_equal ("code_64", 64, a_string.item (1).code)
			a_string := "%/65/"
			assert_integers_equal ("code_65", 65, a_string.item (1).code)
			a_string := "%/66/"
			assert_integers_equal ("code_66", 66, a_string.item (1).code)
			a_string := "%/67/"
			assert_integers_equal ("code_67", 67, a_string.item (1).code)
			a_string := "%/68/"
			assert_integers_equal ("code_68", 68, a_string.item (1).code)
			a_string := "%/69/"
			assert_integers_equal ("code_69", 69, a_string.item (1).code)
			a_string := "%/70/"
			assert_integers_equal ("code_70", 70, a_string.item (1).code)
			a_string := "%/71/"
			assert_integers_equal ("code_71", 71, a_string.item (1).code)
			a_string := "%/72/"
			assert_integers_equal ("code_72", 72, a_string.item (1).code)
			a_string := "%/73/"
			assert_integers_equal ("code_73", 73, a_string.item (1).code)
			a_string := "%/74/"
			assert_integers_equal ("code_74", 74, a_string.item (1).code)
			a_string := "%/75/"
			assert_integers_equal ("code_75", 75, a_string.item (1).code)
			a_string := "%/76/"
			assert_integers_equal ("code_76", 76, a_string.item (1).code)
			a_string := "%/77/"
			assert_integers_equal ("code_77", 77, a_string.item (1).code)
			a_string := "%/78/"
			assert_integers_equal ("code_78", 78, a_string.item (1).code)
			a_string := "%/79/"
			assert_integers_equal ("code_79", 79, a_string.item (1).code)
			a_string := "%/80/"
			assert_integers_equal ("code_80", 80, a_string.item (1).code)
			a_string := "%/81/"
			assert_integers_equal ("code_81", 81, a_string.item (1).code)
			a_string := "%/82/"
			assert_integers_equal ("code_82", 82, a_string.item (1).code)
			a_string := "%/83/"
			assert_integers_equal ("code_83", 83, a_string.item (1).code)
			a_string := "%/84/"
			assert_integers_equal ("code_84", 84, a_string.item (1).code)
			a_string := "%/85/"
			assert_integers_equal ("code_85", 85, a_string.item (1).code)
			a_string := "%/86/"
			assert_integers_equal ("code_86", 86, a_string.item (1).code)
			a_string := "%/87/"
			assert_integers_equal ("code_87", 87, a_string.item (1).code)
			a_string := "%/88/"
			assert_integers_equal ("code_88", 88, a_string.item (1).code)
			a_string := "%/89/"
			assert_integers_equal ("code_89", 89, a_string.item (1).code)
			a_string := "%/90/"
			assert_integers_equal ("code_90", 90, a_string.item (1).code)
			a_string := "%/91/"
			assert_integers_equal ("code_91", 91, a_string.item (1).code)
			a_string := "%/92/"
			assert_integers_equal ("code_92", 92, a_string.item (1).code)
			a_string := "%/93/"
			assert_integers_equal ("code_93", 93, a_string.item (1).code)
			a_string := "%/94/"
			assert_integers_equal ("code_94", 94, a_string.item (1).code)
			a_string := "%/95/"
			assert_integers_equal ("code_95", 95, a_string.item (1).code)
			a_string := "%/96/"
			assert_integers_equal ("code_96", 96, a_string.item (1).code)
			a_string := "%/97/"
			assert_integers_equal ("code_97", 97, a_string.item (1).code)
			a_string := "%/98/"
			assert_integers_equal ("code_98", 98, a_string.item (1).code)
			a_string := "%/99/"
			assert_integers_equal ("code_99", 99, a_string.item (1).code)
			a_string := "%/100/"
			assert_integers_equal ("code_100", 100, a_string.item (1).code)
			a_string := "%/101/"
			assert_integers_equal ("code_101", 101, a_string.item (1).code)
			a_string := "%/102/"
			assert_integers_equal ("code_102", 102, a_string.item (1).code)
			a_string := "%/103/"
			assert_integers_equal ("code_103", 103, a_string.item (1).code)
			a_string := "%/104/"
			assert_integers_equal ("code_104", 104, a_string.item (1).code)
			a_string := "%/105/"
			assert_integers_equal ("code_105", 105, a_string.item (1).code)
			a_string := "%/106/"
			assert_integers_equal ("code_106", 106, a_string.item (1).code)
			a_string := "%/107/"
			assert_integers_equal ("code_107", 107, a_string.item (1).code)
			a_string := "%/108/"
			assert_integers_equal ("code_108", 108, a_string.item (1).code)
			a_string := "%/109/"
			assert_integers_equal ("code_109", 109, a_string.item (1).code)
			a_string := "%/110/"
			assert_integers_equal ("code_110", 110, a_string.item (1).code)
			a_string := "%/111/"
			assert_integers_equal ("code_111", 111, a_string.item (1).code)
			a_string := "%/112/"
			assert_integers_equal ("code_112", 112, a_string.item (1).code)
			a_string := "%/113/"
			assert_integers_equal ("code_113", 113, a_string.item (1).code)
			a_string := "%/114/"
			assert_integers_equal ("code_114", 114, a_string.item (1).code)
			a_string := "%/115/"
			assert_integers_equal ("code_115", 115, a_string.item (1).code)
			a_string := "%/116/"
			assert_integers_equal ("code_116", 116, a_string.item (1).code)
			a_string := "%/117/"
			assert_integers_equal ("code_117", 117, a_string.item (1).code)
			a_string := "%/118/"
			assert_integers_equal ("code_118", 118, a_string.item (1).code)
			a_string := "%/119/"
			assert_integers_equal ("code_119", 119, a_string.item (1).code)
			a_string := "%/120/"
			assert_integers_equal ("code_120", 120, a_string.item (1).code)
			a_string := "%/121/"
			assert_integers_equal ("code_121", 121, a_string.item (1).code)
			a_string := "%/122/"
			assert_integers_equal ("code_122", 122, a_string.item (1).code)
			a_string := "%/123/"
			assert_integers_equal ("code_123", 123, a_string.item (1).code)
			a_string := "%/124/"
			assert_integers_equal ("code_124", 124, a_string.item (1).code)
			a_string := "%/125/"
			assert_integers_equal ("code_125", 125, a_string.item (1).code)
			a_string := "%/126/"
			assert_integers_equal ("code_126", 126, a_string.item (1).code)
			a_string := "%/127/"
			assert_integers_equal ("code_127", 127, a_string.item (1).code)
			a_string := "%/128/"
			assert_integers_equal ("code_128", 128, a_string.item (1).code)
			a_string := "%/129/"
			assert_integers_equal ("code_129", 129, a_string.item (1).code)
			a_string := "%/130/"
			assert_integers_equal ("code_130", 130, a_string.item (1).code)
			a_string := "%/131/"
			assert_integers_equal ("code_131", 131, a_string.item (1).code)
			a_string := "%/132/"
			assert_integers_equal ("code_132", 132, a_string.item (1).code)
			a_string := "%/133/"
			assert_integers_equal ("code_133", 133, a_string.item (1).code)
			a_string := "%/134/"
			assert_integers_equal ("code_134", 134, a_string.item (1).code)
			a_string := "%/135/"
			assert_integers_equal ("code_135", 135, a_string.item (1).code)
			a_string := "%/136/"
			assert_integers_equal ("code_136", 136, a_string.item (1).code)
			a_string := "%/137/"
			assert_integers_equal ("code_137", 137, a_string.item (1).code)
			a_string := "%/138/"
			assert_integers_equal ("code_138", 138, a_string.item (1).code)
			a_string := "%/139/"
			assert_integers_equal ("code_139", 139, a_string.item (1).code)
			a_string := "%/140/"
			assert_integers_equal ("code_140", 140, a_string.item (1).code)
			a_string := "%/141/"
			assert_integers_equal ("code_141", 141, a_string.item (1).code)
			a_string := "%/142/"
			assert_integers_equal ("code_142", 142, a_string.item (1).code)
			a_string := "%/143/"
			assert_integers_equal ("code_143", 143, a_string.item (1).code)
			a_string := "%/144/"
			assert_integers_equal ("code_144", 144, a_string.item (1).code)
			a_string := "%/145/"
			assert_integers_equal ("code_145", 145, a_string.item (1).code)
			a_string := "%/146/"
			assert_integers_equal ("code_146", 146, a_string.item (1).code)
			a_string := "%/147/"
			assert_integers_equal ("code_147", 147, a_string.item (1).code)
			a_string := "%/148/"
			assert_integers_equal ("code_148", 148, a_string.item (1).code)
			a_string := "%/149/"
			assert_integers_equal ("code_149", 149, a_string.item (1).code)
			a_string := "%/150/"
			assert_integers_equal ("code_150", 150, a_string.item (1).code)
			a_string := "%/151/"
			assert_integers_equal ("code_151", 151, a_string.item (1).code)
			a_string := "%/152/"
			assert_integers_equal ("code_152", 152, a_string.item (1).code)
			a_string := "%/153/"
			assert_integers_equal ("code_153", 153, a_string.item (1).code)
			a_string := "%/154/"
			assert_integers_equal ("code_154", 154, a_string.item (1).code)
			a_string := "%/155/"
			assert_integers_equal ("code_155", 155, a_string.item (1).code)
			a_string := "%/156/"
			assert_integers_equal ("code_156", 156, a_string.item (1).code)
			a_string := "%/157/"
			assert_integers_equal ("code_157", 157, a_string.item (1).code)
			a_string := "%/158/"
			assert_integers_equal ("code_158", 158, a_string.item (1).code)
			a_string := "%/159/"
			assert_integers_equal ("code_159", 159, a_string.item (1).code)
			a_string := "%/160/"
			assert_integers_equal ("code_160", 160, a_string.item (1).code)
			a_string := "%/161/"
			assert_integers_equal ("code_161", 161, a_string.item (1).code)
			a_string := "%/162/"
			assert_integers_equal ("code_162", 162, a_string.item (1).code)
			a_string := "%/163/"
			assert_integers_equal ("code_163", 163, a_string.item (1).code)
			a_string := "%/164/"
			assert_integers_equal ("code_164", 164, a_string.item (1).code)
			a_string := "%/165/"
			assert_integers_equal ("code_165", 165, a_string.item (1).code)
			a_string := "%/166/"
			assert_integers_equal ("code_166", 166, a_string.item (1).code)
			a_string := "%/167/"
			assert_integers_equal ("code_167", 167, a_string.item (1).code)
			a_string := "%/168/"
			assert_integers_equal ("code_168", 168, a_string.item (1).code)
			a_string := "%/169/"
			assert_integers_equal ("code_169", 169, a_string.item (1).code)
			a_string := "%/170/"
			assert_integers_equal ("code_170", 170, a_string.item (1).code)
			a_string := "%/171/"
			assert_integers_equal ("code_171", 171, a_string.item (1).code)
			a_string := "%/172/"
			assert_integers_equal ("code_172", 172, a_string.item (1).code)
			a_string := "%/173/"
			assert_integers_equal ("code_173", 173, a_string.item (1).code)
			a_string := "%/174/"
			assert_integers_equal ("code_174", 174, a_string.item (1).code)
			a_string := "%/175/"
			assert_integers_equal ("code_175", 175, a_string.item (1).code)
			a_string := "%/176/"
			assert_integers_equal ("code_176", 176, a_string.item (1).code)
			a_string := "%/177/"
			assert_integers_equal ("code_177", 177, a_string.item (1).code)
			a_string := "%/178/"
			assert_integers_equal ("code_178", 178, a_string.item (1).code)
			a_string := "%/179/"
			assert_integers_equal ("code_179", 179, a_string.item (1).code)
			a_string := "%/180/"
			assert_integers_equal ("code_180", 180, a_string.item (1).code)
			a_string := "%/181/"
			assert_integers_equal ("code_181", 181, a_string.item (1).code)
			a_string := "%/182/"
			assert_integers_equal ("code_182", 182, a_string.item (1).code)
			a_string := "%/183/"
			assert_integers_equal ("code_183", 183, a_string.item (1).code)
			a_string := "%/184/"
			assert_integers_equal ("code_184", 184, a_string.item (1).code)
			a_string := "%/185/"
			assert_integers_equal ("code_185", 185, a_string.item (1).code)
			a_string := "%/186/"
			assert_integers_equal ("code_186", 186, a_string.item (1).code)
			a_string := "%/187/"
			assert_integers_equal ("code_187", 187, a_string.item (1).code)
			a_string := "%/188/"
			assert_integers_equal ("code_188", 188, a_string.item (1).code)
			a_string := "%/189/"
			assert_integers_equal ("code_189", 189, a_string.item (1).code)
			a_string := "%/190/"
			assert_integers_equal ("code_190", 190, a_string.item (1).code)
			a_string := "%/191/"
			assert_integers_equal ("code_191", 191, a_string.item (1).code)
			a_string := "%/192/"
			assert_integers_equal ("code_192", 192, a_string.item (1).code)
			a_string := "%/193/"
			assert_integers_equal ("code_193", 193, a_string.item (1).code)
			a_string := "%/194/"
			assert_integers_equal ("code_194", 194, a_string.item (1).code)
			a_string := "%/195/"
			assert_integers_equal ("code_195", 195, a_string.item (1).code)
			a_string := "%/196/"
			assert_integers_equal ("code_196", 196, a_string.item (1).code)
			a_string := "%/197/"
			assert_integers_equal ("code_197", 197, a_string.item (1).code)
			a_string := "%/198/"
			assert_integers_equal ("code_198", 198, a_string.item (1).code)
			a_string := "%/199/"
			assert_integers_equal ("code_199", 199, a_string.item (1).code)
			a_string := "%/200/"
			assert_integers_equal ("code_200", 200, a_string.item (1).code)
			a_string := "%/201/"
			assert_integers_equal ("code_201", 201, a_string.item (1).code)
			a_string := "%/202/"
			assert_integers_equal ("code_202", 202, a_string.item (1).code)
			a_string := "%/203/"
			assert_integers_equal ("code_203", 203, a_string.item (1).code)
			a_string := "%/204/"
			assert_integers_equal ("code_204", 204, a_string.item (1).code)
			a_string := "%/205/"
			assert_integers_equal ("code_205", 205, a_string.item (1).code)
			a_string := "%/206/"
			assert_integers_equal ("code_206", 206, a_string.item (1).code)
			a_string := "%/207/"
			assert_integers_equal ("code_207", 207, a_string.item (1).code)
			a_string := "%/208/"
			assert_integers_equal ("code_208", 208, a_string.item (1).code)
			a_string := "%/209/"
			assert_integers_equal ("code_209", 209, a_string.item (1).code)
			a_string := "%/210/"
			assert_integers_equal ("code_210", 210, a_string.item (1).code)
			a_string := "%/211/"
			assert_integers_equal ("code_211", 211, a_string.item (1).code)
			a_string := "%/212/"
			assert_integers_equal ("code_212", 212, a_string.item (1).code)
			a_string := "%/213/"
			assert_integers_equal ("code_213", 213, a_string.item (1).code)
			a_string := "%/214/"
			assert_integers_equal ("code_214", 214, a_string.item (1).code)
			a_string := "%/215/"
			assert_integers_equal ("code_215", 215, a_string.item (1).code)
			a_string := "%/216/"
			assert_integers_equal ("code_216", 216, a_string.item (1).code)
			a_string := "%/217/"
			assert_integers_equal ("code_217", 217, a_string.item (1).code)
			a_string := "%/218/"
			assert_integers_equal ("code_218", 218, a_string.item (1).code)
			a_string := "%/219/"
			assert_integers_equal ("code_219", 219, a_string.item (1).code)
			a_string := "%/220/"
			assert_integers_equal ("code_220", 220, a_string.item (1).code)
			a_string := "%/221/"
			assert_integers_equal ("code_221", 221, a_string.item (1).code)
			a_string := "%/222/"
			assert_integers_equal ("code_222", 222, a_string.item (1).code)
			a_string := "%/223/"
			assert_integers_equal ("code_223", 223, a_string.item (1).code)
			a_string := "%/224/"
			assert_integers_equal ("code_224", 224, a_string.item (1).code)
			a_string := "%/225/"
			assert_integers_equal ("code_225", 225, a_string.item (1).code)
			a_string := "%/226/"
			assert_integers_equal ("code_226", 226, a_string.item (1).code)
			a_string := "%/227/"
			assert_integers_equal ("code_227", 227, a_string.item (1).code)
			a_string := "%/228/"
			assert_integers_equal ("code_228", 228, a_string.item (1).code)
			a_string := "%/229/"
			assert_integers_equal ("code_229", 229, a_string.item (1).code)
			a_string := "%/230/"
			assert_integers_equal ("code_230", 230, a_string.item (1).code)
			a_string := "%/231/"
			assert_integers_equal ("code_231", 231, a_string.item (1).code)
			a_string := "%/232/"
			assert_integers_equal ("code_232", 232, a_string.item (1).code)
			a_string := "%/233/"
			assert_integers_equal ("code_233", 233, a_string.item (1).code)
			a_string := "%/234/"
			assert_integers_equal ("code_234", 234, a_string.item (1).code)
			a_string := "%/235/"
			assert_integers_equal ("code_235", 235, a_string.item (1).code)
			a_string := "%/236/"
			assert_integers_equal ("code_236", 236, a_string.item (1).code)
			a_string := "%/237/"
			assert_integers_equal ("code_237", 237, a_string.item (1).code)
			a_string := "%/238/"
			assert_integers_equal ("code_238", 238, a_string.item (1).code)
			a_string := "%/239/"
			assert_integers_equal ("code_239", 239, a_string.item (1).code)
			a_string := "%/240/"
			assert_integers_equal ("code_240", 240, a_string.item (1).code)
			a_string := "%/241/"
			assert_integers_equal ("code_241", 241, a_string.item (1).code)
			a_string := "%/242/"
			assert_integers_equal ("code_242", 242, a_string.item (1).code)
			a_string := "%/243/"
			assert_integers_equal ("code_243", 243, a_string.item (1).code)
			a_string := "%/244/"
			assert_integers_equal ("code_244", 244, a_string.item (1).code)
			a_string := "%/245/"
			assert_integers_equal ("code_245", 245, a_string.item (1).code)
			a_string := "%/246/"
			assert_integers_equal ("code_246", 246, a_string.item (1).code)
			a_string := "%/247/"
			assert_integers_equal ("code_247", 247, a_string.item (1).code)
			a_string := "%/248/"
			assert_integers_equal ("code_248", 248, a_string.item (1).code)
			a_string := "%/249/"
			assert_integers_equal ("code_249", 249, a_string.item (1).code)
			a_string := "%/250/"
			assert_integers_equal ("code_250", 250, a_string.item (1).code)
			a_string := "%/251/"
			assert_integers_equal ("code_251", 251, a_string.item (1).code)
			a_string := "%/252/"
			assert_integers_equal ("code_252", 252, a_string.item (1).code)
			a_string := "%/253/"
			assert_integers_equal ("code_253", 253, a_string.item (1).code)
			a_string := "%/254/"
			assert_integers_equal ("code_254", 254, a_string.item (1).code)
			a_string := "%/255/"
			assert_integers_equal ("code_255", 255, a_string.item (1).code)
		end

	test_verbatim_string
			-- Test verbatim strings.
		local
			s: STRING
		do
			s := "[
		foo
		bar
			]"
			assert_strings_equal ("string1", "foo%Nbar", s)
			s := "[
		foo
	bar
			]"
			assert_strings_equal ("string2", "%Tfoo%Nbar", s)
			s := "xyz[
  foo
 		bar
			]xyz"
			assert_strings_equal ("string3", " foo%N%T%Tbar", s)
			s := "{
		foo
	bar
}"
			assert_strings_equal ("string4", "%T%Tfoo%N%Tbar", s)
			s := "ab{
 	foo
  bar
			}ab"
			assert_strings_equal ("string5", " %Tfoo%N  bar", s)
			s := "[
				]"
			assert_strings_equal ("string6", "", s)
			s := "{
				}"
			assert_strings_equal ("string7", "", s)
		end

end
