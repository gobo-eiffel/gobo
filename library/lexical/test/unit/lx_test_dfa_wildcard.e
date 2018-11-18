note

	description:

		"Test features of class LX_DFA_WILDCARD"

	library: "Gobo Eiffel Lexical Library"
	copyright: "Copyright (c) 2001-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class LX_TEST_DFA_WILDCARD

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_make
			-- Test feature `make'.
		local
			a_wildcard: LX_DFA_WILDCARD
		do
			create a_wildcard.make
			assert ("a_wildcard_not_void", a_wildcard /= Void)
			assert ("not_compiled", not a_wildcard.is_compiled)
		end

	test_compile
			-- Test feature `compile'.
		local
			a_wildcard: LX_DFA_WILDCARD
		do
			create a_wildcard.compile ("@(library/**/kl*.e|**/*.?ace)", False)
			assert ("compiled1", a_wildcard.is_compiled)
		end

	test_recognizes
			-- Test feature `recognizes'.
		local
			a_wildcard: LX_DFA_WILDCARD
		do
			create a_wildcard.compile ("@(library/**/kl*.e|**/*.?ace)", False)
			assert ("compiled1", a_wildcard.is_compiled)
			assert ("recognizes1", a_wildcard.recognizes ("foo.xace"))
			assert ("recognizes2", a_wildcard.recognizes ("foo/bar/baz.race"))
			assert ("recognizes3", a_wildcard.recognizes ("library/bar/kl_foo.e"))
			assert ("recognizes4", a_wildcard.recognizes ("library/foo/bar/kl_foo.e"))
			assert ("recognizes5", a_wildcard.recognizes ("library/kl.e"))
			assert ("not_recognizes1", not a_wildcard.recognizes ("library\foo\kl_bar.e"))
			assert ("not_recognizes2", not a_wildcard.recognizes ("/foo.xace"))
			assert ("not_recognizes3", not a_wildcard.recognizes ("foo/kl_bar.e"))
			assert ("not_recognizes4", not a_wildcard.recognizes ("library/foo/bar.e"))
			assert ("not_recognizes5", not a_wildcard.recognizes ("library/foo/kl_bar.o"))
		end

	test_matches
			-- Test feature `matches'.
		local
			a_wildcard: LX_DFA_WILDCARD
		do
			create a_wildcard.compile ("@(library/**/kl*.e|**/*.?ace)", False)
			assert ("compiled1", a_wildcard.is_compiled)
			assert ("matches1", a_wildcard.matches ("foo.xace"))
			assert ("matches2", a_wildcard.matches ("abcfoo.xacexyz"))
			assert ("matches3", a_wildcard.matches ("foo/bar/baz.race"))
			assert ("matches4", a_wildcard.matches ("abcfoo/bar/baz.racexyz"))
			assert ("matches5", a_wildcard.matches ("library/bar/kl_foo.e"))
			assert ("matches6", a_wildcard.matches ("abclibrary/bar/kl_foo.exyz"))
			assert ("matches7", a_wildcard.matches ("library/foo/bar/kl_foo.e"))
			assert ("matches8", a_wildcard.matches ("abclibrary/foo/bar/kl_foo.exyz"))
			assert ("matches9", a_wildcard.matches ("library/kl.e"))
			assert ("matches10", a_wildcard.matches ("abclibrary/kl.exyz"))
			assert ("not_matches1", not a_wildcard.matches ("library\foo\kl_bar.e"))
			assert ("not_matches2", not a_wildcard.matches ("foo/kl_bar.e"))
			assert ("not_matches3", not a_wildcard.matches ("library/foo/bar.e"))
			assert ("not_matches4", not a_wildcard.matches ("library/foo/kl_bar.o"))
		end

	test_matched_position
			-- Test feature `matched_position'.
		local
			a_wildcard: LX_DFA_WILDCARD
			l_matched_position: detachable DS_PAIR [INTEGER, INTEGER]
		do
			create a_wildcard.compile ("@(library/**/kl*.e|**/*.?ace)", False)
			assert ("compiled1", a_wildcard.is_compiled)
			l_matched_position := a_wildcard.matched_position ("foo.xace")
			assert ("matches1", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first1", 1, l_matched_position.first)
			assert_integers_equal ("matches_second2", 8, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("abcfoo.xacexyz")
			assert ("matches2", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first2", 1, l_matched_position.first)
			assert_integers_equal ("matches_second2", 11, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("foo/bar/baz.race")
			assert ("matches3", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first3", 1, l_matched_position.first)
			assert_integers_equal ("matches_second3", 16, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("abcfoo/bar/baz.racexyz")
			assert ("matches4", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first4", 1, l_matched_position.first)
			assert_integers_equal ("matches_second4", 19, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("library/bar/kl_foo.e")
			assert ("matches5", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first5", 1, l_matched_position.first)
			assert_integers_equal ("matches_second5", 20, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("abclibrary/bar/kl_foo.exyz")
			assert ("matches6", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first6", 4, l_matched_position.first)
			assert_integers_equal ("matches_second6", 23,l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("library/foo/bar/kl_foo.e")
			assert ("matches7", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first7", 1, l_matched_position.first)
			assert_integers_equal ("matches_second7", 24, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("abclibrary/foo/bar/kl_foo.exyz")
			assert ("matches8", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first8", 4, l_matched_position.first)
			assert_integers_equal ("matches_second8", 27, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("library/kl.e")
			assert ("matches9", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first9", 1, l_matched_position.first)
			assert_integers_equal ("matches_second9", 12, l_matched_position.second)
			l_matched_position := a_wildcard.matched_position ("abclibrary/kl.exyz")
			assert ("matches10", l_matched_position /= Void)
			check asserted_above: l_matched_position /= Void then end
			assert_integers_equal ("matches_first10", 4, l_matched_position.first)
			assert_integers_equal ("matches_second10", 15, l_matched_position.second)
			assert ("not_matches1", a_wildcard.matched_position ("library\foo\kl_bar.e") = Void)
			assert ("not_matches2", a_wildcard.matched_position ("foo/kl_bar.e") = Void)
			assert ("not_matches3", a_wildcard.matched_position ("library/foo/bar.e") = Void)
			assert ("not_matches4", a_wildcard.matched_position ("library/foo/kl_bar.o") = Void)
		end

end
