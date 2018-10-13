note

	description:

		"Test features of KL_TYPE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_TYPE

inherit

	KL_TEST_CASE

create

	make_default

feature -- Test

	test_same_objects_nan
			-- Test feature 'same_objects' with NaNs.
		do
			assert ("same_nan", {KL_TYPE [REAL_64]}.same_objects ({REAL_64}.nan, {REAL_64}.nan))
		end

end
