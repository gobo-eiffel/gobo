indexing

	description:

		"Test features of class RX_PCRE_REGULAR_EXPRESSION"

	library: "Gobo Eiffel Regexp Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class RX_TEST_PCRE_REGULAR_EXPRESSION

inherit

	TS_TEST_CASE

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
			assert_equal ("match_count1", 1, a_regexp.match_count)
			assert_equal ("captured_substring0_1", "the quick brown fox", a_regexp.captured_substring (0))
				-- Match second subject.
			a_regexp.match ("The quick brown FOX")
			assert ("not_matched2", not a_regexp.has_matched)
				-- Match third subject.
			a_regexp.match ("What do you know about the quick brown fox?")
			assert ("has_matched3", a_regexp.has_matched)
			assert_equal ("match_count3", 1, a_regexp.match_count)
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
			assert_equal ("match_count1", 2, a_regexp.match_count)
				-- Matched substring:
			assert_equal ("captured_substring0_1", "8#8", a_regexp.captured_substring (0))
				-- Matched part in the first parentheses:
			assert_equal ("captured_substring1_1", "8", a_regexp.captured_substring (1))
			a_replacement := a_regexp.replacement ("\1\#0")
			assert_equal ("relacement1", "8#0", a_replacement)
			a_replacement := a_regexp.replace_all ("\1\#0")
			assert_equal ("relacement2", "abc8#0def", a_replacement)
		end

end
