note

	description:

		"Test features of class GEANT_SHARED_PROPERTIES"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002-2018, Sven Ehrke and others"
	license: "MIT License"

class GEANT_TEST_SHARED_PROPERTIES

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_glob_prefix
			-- Test feature `glob_prefix'.
		local
			sp: GEANT_SHARED_PROPERTIES
		do
			create sp
			assert_equal ("glob_prefix1", "ab", sp.glob_prefix ("ab*.e"))

			assert_equal ("glob_prefix2", "", sp.glob_prefix ("*.e"))
			assert_equal ("glob_prefix3", "ttt/ab", sp.glob_prefix ("ttt/ab*.e"))
		end

	test_glob_postfix
			-- Test feature `glob_postfix'.
		local
			sp: GEANT_SHARED_PROPERTIES
		do
			create sp
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
			sp: GEANT_SHARED_PROPERTIES
		do
			create sp
			s := "abc"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation1", "abc", s2)

			s := "%Tabc"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation2", "%Tabc", s2)

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
			assert_equal ("remove_indentation5a", "abc", s2)

			s := "{
				|Release_notes.txt

			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation5b", "Release_notes.txt%N", s2)

			s := "{
				|Release_notes.txt
bla
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation5c", "Release_notes.txt%Nbla", s2)

			s := "{
				|Release_notes.txt
bla
				|Release_notes.txt
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation5d", "Release_notes.txt%Nbla%NRelease_notes.txt", s2)

			s := "{
				|Release_notes.txt
bla
				|Release_notes.txt
bli
bla
			}"
			s2 := sp.removed_indentation (s)
			assert_equal ("remove_indentation5e", "Release_notes.txt%Nbla%NRelease_notes.txt%Nbli%Nbla", s2)

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

end
