note

	description:

		"Test features of KL_CELL"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_TEST_CELL

inherit

	KL_TEST_CASE

create

	make_default

feature -- Test

	test_put_nan
			-- Test feature 'put' with NaNs.
		local
			l_cell: KL_CELL [REAL_64]
		do
			create l_cell.make (0.0)
			l_cell.put ({REAL_64}.nan)
			assert ("nan", {KL_TYPE [REAL_64]}.same_objects (l_cell.item, {REAL_64}.nan))
		end

end
