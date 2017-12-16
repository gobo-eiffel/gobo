note

	description:

		"Test features of class HASHABLE"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class TEST_HASHABLE

inherit

	TS_TEST_CASE

create

	make_default

feature -- Test

	test_hash_code1
			-- Test feature `hash_code'.
		local
			s: STRING
			a_hashable, a_hashable2: HASHABLE
		do
			s := "foobar"
			a_hashable := s.twin
			assert ("hash_code1", a_hashable.hash_code = a_hashable.hash_code)
			a_hashable2 := s.twin
			assert ("hash_code2", a_hashable.hash_code = a_hashable2.hash_code)
		end

	test_hash_code2
			-- Test feature `hash_code'.
		local
			a_hashable, a_hashable2: INTEGER
		do
			a_hashable := 5
			assert ("hash_code1", a_hashable.hash_code = a_hashable.hash_code)
			a_hashable2 := 5
			assert ("hash_code2", a_hashable.hash_code = a_hashable2.hash_code)
		end

end
