indexing

	description:

		"Test features of class HASHABLE listed in KS_HASHABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KS_TEST_HASHABLE

inherit

	KL_TEST_CASE

feature -- Test

	test_hash_code1 is
			-- Test feature `hash_code'.
		local
			a_hashable, a_hashable2: HASHABLE
		do
			a_hashable := clone ("foobar")
			assert ("hash_code1", a_hashable.hash_code = a_hashable.hash_code) 
			a_hashable2 := clone ("foobar")
			assert ("hash_code2", a_hashable.hash_code = a_hashable2.hash_code) 
		end

	test_hash_code2 is
			-- Test feature `hash_code'.
		local
			a_hashable, a_hashable2: HASHABLE
		do
			a_hashable := 5
			assert ("hash_code1", a_hashable.hash_code = a_hashable.hash_code) 
			a_hashable2 := 5
			assert ("hash_code2", a_hashable.hash_code = a_hashable2.hash_code) 
		end

end
