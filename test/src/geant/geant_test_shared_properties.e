indexing

	description:

		"Test features of class GEANT_SHARED_PROPERTIES"

	library: "Gobo Eiffel Ant"
	copyright: "Copyright (c) 2002, Sven Ehrke and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class GEANT_TEST_SHARED_PROPERTIES

inherit

	TS_TEST_CASE
		redefine
			tear_down, set_up
		end

feature -- Test

	test_string_remove_head is
			-- Test feature `string_remove_head'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			assert ("string_remove_head1", sp.string_remove_head (a_string, 0).is_equal ("foobar")) 
			assert ("string_remove_head2", sp.string_remove_head (a_string, 1).is_equal ("oobar")) 
			assert ("string_remove_head3", sp.string_remove_head (a_string, 2).is_equal ("obar")) 
			assert ("string_remove_head4", sp.string_remove_head (a_string, 3).is_equal ("bar")) 
			assert ("string_remove_head5", sp.string_remove_head (a_string, 4).is_equal ("ar")) 
			assert ("string_remove_head6", sp.string_remove_head (a_string, 5).is_equal ("r")) 
			assert ("string_remove_head7", sp.string_remove_head (a_string, 6).is_equal ("")) 
			assert ("string_remove_head8", sp.string_remove_head (a_string, 7).is_equal ("")) 
		end

	test_string_remove_tail is
			-- Test feature `string_remove_tail'.
		local
			a_string: STRING
		do
			a_string := clone ("foobar")
			assert ("string_remove_tail1", sp.string_remove_tail (a_string, 0).is_equal ("foobar")) 
			assert ("string_remove_tail2", sp.string_remove_tail (a_string, 1).is_equal ("fooba")) 
			assert ("string_remove_tail3", sp.string_remove_tail (a_string, 2).is_equal ("foob")) 
			assert ("string_remove_tail4", sp.string_remove_tail (a_string, 3).is_equal ("foo")) 
			assert ("string_remove_tail5", sp.string_remove_tail (a_string, 4).is_equal ("fo")) 
			assert ("string_remove_tail6", sp.string_remove_tail (a_string, 5).is_equal ("f")) 
			assert ("string_remove_tail7", sp.string_remove_tail (a_string, 6).is_equal ("")) 
			assert ("string_remove_tail8", sp.string_remove_tail (a_string, 7).is_equal ("")) 
		end

	test_glob_prefix is
			-- Test feature `glob_prefix'.
		do
			assert_equal ("glob_prefix1", "ab", sp.glob_prefix ("ab*.e"))

			assert_equal ("glob_prefix2", "", sp.glob_prefix ("*.e"))
			assert_equal ("glob_prefix3", "ttt/ab", sp.glob_prefix ("ttt/ab*.e"))
		end

	test_glob_postfix is
			-- Test feature `glob_postfix'.
		do
			assert_equal ("glob_postfix1", ".e", sp.glob_postfix ("ab*.e"))
			assert_equal ("glob_postfix2", "ab", sp.glob_postfix ("ttt/*ab"))

			assert_equal ("glob_postfix3", "", sp.glob_postfix ("aser*"))
			assert_equal ("glob_postfix4", "", sp.glob_postfix ("ttt/ab*"))

			assert_equal ("glob_postfix5", ".e*fd", sp.glob_postfix ("ab*.e*fd"))
			assert_equal ("glob_postfix6", "ab*gg", sp.glob_postfix ("ttt/*ab*gg"))

		end

feature -- Execution

	set_up is
			-- Setup for a test.
		do
			!! sp
		end

	tear_down is
			-- Tear down after a test.
		do
			sp := Void
		end

feature {NONE} -- Implementation

	sp: GEANT_SHARED_PROPERTIES
			-- Object under test

end
