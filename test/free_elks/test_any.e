indexing

	description:

		"Test features of class ANY"

	library: "FreeELKS Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class TEST_ANY

inherit

	TS_TEST_CASE

feature -- Test

	test_generator is
			-- Test feature `generator'.
		local
			s: STRING
			i: INTEGER
		do
			s := "gobo"
				-- `generator' is of type STRING.
			assert ("string_type", s.same_type (s.generator))
			assert_equal ("string", "STRING", s.generator)
			assert_equal ("integer", "INTEGER", i.generator)
		end

end
