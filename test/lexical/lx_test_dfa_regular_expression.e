indexing

	description:

		"Test features of class LX_DFA_REGULAR_EXPRESSION"

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

end
