note

	description:

		"Test features of class GEANT_SHARED_PROPERTIES"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class GEANT_TEST_SHARED_PROPERTIES

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

create

	make_default

feature -- Test

	test_glob_prefix
			-- Test feature `glob_prefix'.
		do
			assert_equal ("glob_prefix1", "ab", sp.glob_prefix ("ab*.e"))

			assert_equal ("glob_prefix2", "", sp.glob_prefix ("*.e"))
			assert_equal ("glob_prefix3", "ttt/ab", sp.glob_prefix ("ttt/ab*.e"))
		end

	test_glob_postfix
			-- Test feature `glob_postfix'.
		do
			assert_equal ("glob_postfix1", ".e", sp.glob_postfix ("ab*.e"))
			assert_equal ("glob_postfix2", "ab", sp.glob_postfix ("ttt/*ab"))

			assert_equal ("glob_postfix3", "", sp.glob_postfix ("aser*"))
			assert_equal ("glob_postfix4", "", sp.glob_postfix ("ttt/ab*"))

			assert_equal ("glob_postfix5", ".e*fd", sp.glob_postfix ("ab*.e*fd"))
			assert_equal ("glob_postfix6", "ab*gg", sp.glob_postfix ("ttt/*ab*gg"))

		end

	test_remove_indentation
		local
			s,s2: STRING
		do
			s := "abc"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation1", "", s2)

			s := "%Tabc"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation2", "", s2)

			s := "%T|abc"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation3", "abc", s2)

			s := " %T |abc"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation4", "abc", s2)

			s := "{
				|abc
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation5", "abc", s2)

			s := "{
				|abc
				|xyz
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation6", "abc%Nxyz", s2)

			s := "{
			|abc
			|xyz
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation7", "abc%Nxyz", s2)

			s := "{
|abc
|xyz
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation8", "abc%Nxyz", s2)

			s := "{
					|abc
				|xyz
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation9", "abc%Nxyz", s2)

		end

feature -- Execution

	set_up
			-- Setup for a test.
		do
			create sp
		end

	tear_down
			-- Tear down after a test.
		do
			sp := Void
		end

feature {NONE} -- Implementation

	sp: GEANT_SHARED_PROPERTIES
			-- Object under test

end
