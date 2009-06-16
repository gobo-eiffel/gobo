indexing

	description:

		"Test features of class RX_PCRE_REGULAR_EXPRESSION"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class RX_TEST_PCRE_REGULAR_EXPRESSION

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_compile1 is
			-- Test feature 'compile'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("^[abc]*$")
			assert ("compiled1", a_regexp.is_compiled)
			assert ("recognizes1", a_regexp.recognizes ("aaabbbccc"))
			assert ("not_recognizes1", not a_regexp.recognizes ("aaabbbcccddd"))
		end

	test_compile2 is
			-- Test feature 'compile'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
				-- Try to compile a regexp with missing closing ']'.
			create a_regexp.make
			a_regexp.compile ("[0-9")
			assert ("not_compiled1", not a_regexp.is_compiled)
				-- Try to compile a regexp with missing closing ')'.
			create a_regexp.make
			a_regexp.compile ("(gobo")
			assert ("not_compiled2", not a_regexp.is_compiled)
				-- Try to compile invalid regexp "*"
				-- (it should be "\*").
			create a_regexp.make
			a_regexp.compile ("*")
			assert ("not_compiled3", not a_regexp.is_compiled)
				-- Try to compile degenerated regexp "|".
				-- Note that it will be interpreted as
				-- "<empty_string>|<empty_string>" (and not
				-- like "\|").
			create a_regexp.make
			a_regexp.compile ("|")
			assert ("compiled1", a_regexp.is_compiled)
		end

	test_optimize1 is
			-- Test feature 'optimize'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("(.*)|a")
			a_regexp.optimize
			assert ("recognizes1", a_regexp.recognizes ("a"))
			assert ("recognizes2", a_regexp.recognizes ("ab"))
			assert ("recognizes3", a_regexp.recognizes ("b"))
			assert ("recognizes4", a_regexp.recognizes ("ba"))
		end

	test_recognizes is
			-- Test feature `recognizes'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
				-- Compile pattern.
			a_regexp.compile ("[a-z]+")
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
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("\|")
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
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("o*")
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
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("a*")
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

	test_double_curly_braces is
			-- Test what happens when using double curly braces.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
				-- Compile pattern: match a digit, followed by one or two {, followed by }.
			a_regexp.compile ("[0-9]{{1,2}}")
			assert ("is_compiled1", a_regexp.is_compiled)
			assert ("recognizes1", a_regexp.recognizes ("5{}"))
			assert ("recognizes2", a_regexp.recognizes ("3{{}"))
			assert ("not_recognizes1", not a_regexp.recognizes ("7{{{}"))
			assert ("not_recognizes2", not a_regexp.recognizes ("7"))
			assert ("not_recognizes3", not a_regexp.recognizes ("17"))
		end

	test_degenerated1 is
			-- Test degenerated regexp "|".
			-- Check to see if it works like "<empty_string>|<empty_string>"
			-- (and not like "\|"). See bug#1917556.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
			a_split: ARRAY [STRING]
		do
			create a_regexp.make
			a_regexp.compile ("|")
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("|one|two")
			assert ("matching1", a_regexp.is_matching)
			a_split := a_regexp.split
			assert ("split_not_void1", a_split /= Void)
			assert_integers_equal ("split_count1", 8, a_split.count)
			assert_strings_equal ("split_item1", "|", a_split.item (1))
			assert_strings_equal ("split_item2", "o", a_split.item (2))
			assert_strings_equal ("split_item3", "n", a_split.item (3))
			assert_strings_equal ("split_item4", "e", a_split.item (4))
			assert_strings_equal ("split_item5", "|", a_split.item (5))
			assert_strings_equal ("split_item6", "t", a_split.item (6))
			assert_strings_equal ("split_item7", "w", a_split.item (7))
			assert_strings_equal ("split_item8", "o", a_split.item (8))
		end

	test_match1 is
			-- Test feature 'match'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("^oo")
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("foobar")
				-- Not matched because the "oo" is not at the beginning of the string "foobar".
			assert ("no_matched1", not a_regexp.has_matched)
		end

	test_match2 is
			-- Test feature 'match'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("oo$")
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match ("foobar")
				-- Not matched because the "oo" is not at the end of the string "foobar".
			assert ("no_matched1", not a_regexp.has_matched)
		end

	test_match_substring1 is
			-- Test feature 'match_substring'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("^oo")
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match_substring ("foobar", 2, 5)
				-- Matched because the "oo" is at the beginning of the substring.
			assert ("matched1", a_regexp.has_matched)
		end

	test_match_substring2 is
			-- Test feature 'match'.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
			a_regexp.compile ("oo$")
			assert ("compiled1", a_regexp.is_compiled)
			a_regexp.match_substring ("foobar", 1, 3)
				-- Matched because the "oo" is at the end of the substring>
			assert ("matched1", a_regexp.has_matched)
		end

feature -- Test Input 1

	test_input1_regexp1 is
			-- Test first regexp in testinput1.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create a_regexp.make
				-- Compile pattern.
			a_regexp.compile ("the quick brown fox")
			assert ("is_compiled1", a_regexp.is_compiled)
			a_regexp.optimize
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

	test_replacement1 is
			-- Test replacement.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
			a_replacement: STRING
		do
			create a_regexp.make
				-- Any digit followed by # and followed by the same digit.
			a_regexp.compile ("([0-9])#\1")
			assert ("is_compiled1", a_regexp.is_compiled)
			a_regexp.optimize
			a_regexp.match ("abc8#8def")
			assert ("has_matched1", a_regexp.has_matched)
			assert_integers_equal ("match_count1", 2, a_regexp.match_count)
				-- Matched substring:
			assert_equal ("captured_substring0_1", "8#8", a_regexp.captured_substring (0))
				-- Matched part in the first parentheses:
			assert_equal ("captured_substring1_1", "8", a_regexp.captured_substring (1))
			a_replacement := a_regexp.replacement ("\1\#0")
			assert_equal ("relacement1", "8#0", a_replacement)
			a_replacement := a_regexp.replace_all ("\1\#0")
			assert_equal ("relacement2", "abc8#0def", a_replacement)
		end

	test_replacement2 is
			-- Test replacement.
			-- This is to test that there is no infinite loop
			-- when replacing all occurrences of a pattern that
			-- matches the empty string.
		local
			a_regexp: RX_PCRE_REGULAR_EXPRESSION
			a_replacement: STRING
		do
				-- Regexp that can match an empty string at the beginning.
			create a_regexp.make
			a_regexp.compile ("^(bye\.)?")
			assert ("is_compiled1", a_regexp.is_compiled)
			a_regexp.match (" world")
			a_replacement := a_regexp.replace_all ("hello")
			assert_equal ("relacement1", "hello world", a_replacement)
				-- Regexp that can match an empty string anywhere.
			create a_regexp.make
			a_regexp.compile ("(bye\.)?")
			assert ("is_compiled2", a_regexp.is_compiled)
			a_regexp.match ("foo")
			a_replacement := a_regexp.replace_all ("AA")
			assert_equal ("relacement2", "AAfAAoAAoAA", a_replacement)
		end

end
