note

	description:

		"Test features of class LX_DFA_REGULAR_EXPRESSION"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2009-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_TEST_DFA_REGULAR_EXPRESSION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_has_dollar
			-- Test feature `has_dollar'.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile ("foo$", True)
			assert ("compiled1", l_regexp.is_compiled)
			assert ("has_dollar1a", l_regexp.matches ("foo"))
			assert ("has_dollar1b", not l_regexp.matches ("foo$"))
			create l_regexp.make
			l_regexp.compile ("foo\$", True)
			assert ("compiled2", l_regexp.is_compiled)
			assert ("not_has_dollar2a", l_regexp.matches ("foo$bar"))
			assert ("not_has_dollar2b", not l_regexp.matches ("foo\"))
			assert ("not_has_dollar2c", not l_regexp.matches ("foo\$"))
			create l_regexp.make
			l_regexp.compile ("foo\\$", True)
			assert ("compiled3", l_regexp.is_compiled)
			assert ("has_dollar3a", l_regexp.matches ("foo\"))
			assert ("has_dollar3b", not l_regexp.matches ("foo\$"))
			assert ("has_dollar3c", not l_regexp.matches ("foo\\"))
			assert ("has_dollar3d", not l_regexp.matches ("foo\\$"))
		end

	test_compile1
			-- Test feature 'compile'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("^[abc]*$", False)
			assert ("compiled1", a_regexp.is_compiled)
			assert ("recognizes1", a_regexp.recognizes ("aaabbbccc"))
			assert ("not_recognizes1", not a_regexp.recognizes ("aaabbbcccddd"))
		end

	test_recognizes
			-- Test feature `recognizes'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
				-- Compile pattern.
			a_regexp.compile ("[a-z]+", False)
			assert ("is_compiled", a_regexp.is_compiled)
				-- Match string.
			assert ("recognizes1", a_regexp.recognizes ("gobo"))
				-- Match shorter string.
			assert ("recognizes2", a_regexp.recognizes ("we"))
				-- Match longer string.
			assert ("recognizes3", a_regexp.recognizes ("eiffel"))
		end

	test_split1
			-- Test feature `split'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("\|", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("|one|two")
			assert ("matching1", a_regexp.is_matching)
			a_split := a_regexp.split
			assert ("split_not_void1", a_split /= Void)
			assert_integers_equal ("split_count1", 3, a_split.count)
			assert_strings_equal ("split_item1", "", a_split.item (1))
			assert_strings_equal ("split_item2", "one", a_split.item (2))
			assert_strings_equal ("split_item3", "two", a_split.item (3))
		end

	test_split2
			-- Test feature `split'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("o*", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("gobo")
			assert ("matching1", a_regexp.is_matching)
			a_split := a_regexp.split
			assert ("split_not_void1", a_split /= Void)
			assert_integers_equal ("split_count1", 2, a_split.count)
			assert_strings_equal ("split_item1", "g", a_split.item (1))
			assert_strings_equal ("split_item2", "b", a_split.item (2))
		end

	test_split3
			-- Test feature `split'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("a*", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("gobo")
			assert ("matching1", a_regexp.is_matching)
			a_split := a_regexp.split
			assert ("split_not_void1", a_split /= Void)
			assert_integers_equal ("split_count1", 4, a_split.count)
			assert_strings_equal ("split_item1", "g", a_split.item (1))
			assert_strings_equal ("split_item2", "o", a_split.item (2))
			assert_strings_equal ("split_item3", "b", a_split.item (3))
			assert_strings_equal ("split_item4", "o", a_split.item (4))
		end

	test_match1
			-- Test feature 'match'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("^oo", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("foobar")
				-- Not matched because the "oo" is not at the beginning of the string "foobar".
			assert ("no_matched1", not a_regexp.has_matched)
		end

	test_match2
			-- Test feature 'match'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("oo$", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("foobar")
				-- Not matched because the "oo" is not at the end of the string "foobar".
			assert ("no_matched1", not a_regexp.has_matched)
		end

	test_match_substring1
			-- Test feature 'match_substring'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("^oo", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match_substring ("foobar", 2, 5)
				-- Matched because the "oo" is at the beginning of the substring.
			assert ("matched1", a_regexp.has_matched)
		end

	test_match_substring2
			-- Test feature 'match'.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("oo$", False)
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match_substring ("foobar", 1, 3)
				-- Matched because the "oo" is at the end of the substring>
			assert ("matched1", a_regexp.has_matched)
		end

	test_null_character
			-- Test with a null character.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile ("a%Ub", False)
			assert ("is_compiled", l_regexp.is_compiled)
			assert ("recognizes", l_regexp.recognizes ("a%Ub"))
		end

feature -- Test Input 1

	test_input1_regexp1
			-- Test first regexp in testinput1.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create a_regexp.make
				-- Compile pattern.
			a_regexp.compile ("the quick brown fox", False)
			assert ("is_compiled1", a_regexp.is_compiled)
				-- Match first subject.
			a_regexp.match ("the quick brown fox")
			assert ("has_matched1", a_regexp.has_matched)
			assert_integers_equal ("match_count1", 1, a_regexp.match_count)
			assert_equal ("captured_substring0_1", "the quick brown fox", a_regexp.captured_substring (0))
				-- Match second subject.
			a_regexp.match ("The quick brown FOX")
			assert ("not_matched2", not a_regexp.has_matched)
				-- Match third subject.
			a_regexp.match ("What do you know about the quick brown fox?")
			assert ("has_matched3", a_regexp.has_matched)
			assert_integers_equal ("match_count3", 1, a_regexp.match_count)
			assert_equal ("captured_substring0_3", "the quick brown fox", a_regexp.captured_substring (0))
				-- Match forth subject.
			a_regexp.match ("What do you know about THE QUICK BROWN FOX?")
			assert ("not_matched4", not a_regexp.has_matched)
		end

feature -- Test replacement

	test_replacement2
			-- Test replacement.
			-- This is to test that there is no infinite loop
			-- when replacing all occurrences of a pattern that
			-- matches the empty string.
		local
			a_regexp: LX_DFA_REGULAR_EXPRESSION
			a_replacement: STRING
		do
				-- Regexp that can match an empty string at the beginning.
			create a_regexp.make
			a_regexp.compile ("^(bye\.)?", False)
			assert ("is_compiled1", a_regexp.is_compiled)
			a_regexp.match (" world")
			a_replacement := a_regexp.replace_all ("hello")
			assert_equal ("relacement1", "hello world", a_replacement)
				-- Regexp that can match an empty string anywhere.
			create a_regexp.make
			a_regexp.compile ("(bye\.)?", False)
			assert ("is_compiled2", a_regexp.is_compiled)
			a_regexp.match ("foo")
			a_replacement := a_regexp.replace_all ("AA")
			assert_equal ("relacement2", "AAfAAoAAoAA", a_replacement)
		end

feature -- Test Unicode

	test_unicode_character
			-- Test regexps with unicode characters.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile_unicode ({STRING_32} "[a-z]+: ∀")
			assert ("compiled1", l_regexp.is_compiled)
			assert ("unicode_recognizes1", l_regexp.unicode_recognizes ({STRING_32} "forall: ∀"))
		end

	test_invalid_unicode_character
			-- Test regexps with invalid unicode characters.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
			l_pattern: STRING_32
		do
			create l_regexp.make
			create l_pattern.make_empty
			l_pattern.append_code (0x200000)
			l_regexp.compile_unicode (l_pattern)
			assert_false ("not_compiled1", l_regexp.is_compiled)
		end

	test_surrogate_unicode_character
			-- Test regexps with surrogate unicode characters.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
			l_pattern: STRING_32
		do
			create l_regexp.make
			create l_pattern.make_empty
			l_pattern.append_code (0xDDDD)
			l_regexp.compile_unicode (l_pattern)
			assert_false ("not_compiled1", l_regexp.is_compiled)
		end

	test_escaped_unicode_character
			-- Test regexps with escaped unicode characters.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile ("d\u00E9j\u00E0 vu", False)
			assert ("compiled1", l_regexp.is_compiled)
			assert ("recognizes1", l_regexp.recognizes ({UC_UTF8_ROUTINES}.to_utf8 ("déjà vu")))
			assert ("unicode_recognizes1", l_regexp.unicode_recognizes ("déjà vu"))
		end

	test_unicode_character_set
			-- Test regexps with unicode character set.
		local
			l_regexp: LX_DFA_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile ("(u:[a-z \u00E9\u00E0]+)", False)
			assert ("compiled1", l_regexp.is_compiled)
			assert ("recognizes1", l_regexp.recognizes ({UC_UTF8_ROUTINES}.to_utf8 ("déjà vu")))
			assert ("unicode_recognizes1", l_regexp.unicode_recognizes ("déjà vu"))
			assert ("unicode_recognizes2", l_regexp.unicode_recognizes ({STRING_32} "déjà vu"))
			assert_false ("not_recognizes1", l_regexp.recognizes ("déjà vu"))
			create l_regexp.make
			l_regexp.compile_unicode ({STRING_32} "[a-z é\u00E0∀]+")
			assert ("compiled2", l_regexp.is_compiled)
			assert ("unicode_recognizes3", l_regexp.unicode_recognizes ({STRING_32} "∀ déjà vu ∀"))
			create l_regexp.make
			l_regexp.compile_unicode ("déjà vu")
			assert ("compiled3", l_regexp.is_compiled)
			assert_false ("not_recognizes3", l_regexp.recognizes ("déjà vu"))
			assert ("unicode_recognizes4", l_regexp.unicode_recognizes ("déjà vu"))
			assert ("unicode_recognizes5", l_regexp.unicode_recognizes ({STRING_32} "déjà vu"))
				-- Cannot have Unicode characters in a 8-bit character set.
			create l_regexp.make
			l_regexp.compile ("[a-z \u00E9\u00E0]+", False)
			assert_false ("not_compiled1", l_regexp.is_compiled)
				-- Cannot have Unicode characters in a 8-bit character set.
			create l_regexp.make
			l_regexp.compile ({STRING_32} "[∀]+", False)
			assert_false ("not_compiled2", l_regexp.is_compiled)
		end

end
