indexing

	description:

		"Test features of class KL_DOUBLE_ROUTINES"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_TEST_DOUBLE_ROUTINES

inherit

	KL_TEST_CASE

	KL_IMPORTED_DOUBLE_ROUTINES
	KL_SHARED_PLATFORM

feature -- Test

	test_log is
			-- Test feature `log'.
		local
			d: DOUBLE
		do
			d := 1.0
			d := DOUBLE_.log(d)
		end

	test_log10 is
			-- Test feature `log10'.
		local
			d: DOUBLE
		do
			d := 1.0
			d := DOUBLE_.log10(d)
		end

end
