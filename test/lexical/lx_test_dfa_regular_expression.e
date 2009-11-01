indexing

	description:

		"Test features of class LX_DFA_REGULAR_EXPRESSION"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_TEST_DFA_REGULAR_EXPRESSION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_has_dollar is
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

	test_compile1 is
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

	test_recognizes is
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

	test_split1 is
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

	test_split2 is
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

	test_split3 is
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

	test_match1 is
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

	test_match2 is
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

	test_match_substring1 is
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

	test_match_substring2 is
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

feature -- Test Input 1

	test_input1_regexp1 is
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

	test_replacement2 is
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

end
