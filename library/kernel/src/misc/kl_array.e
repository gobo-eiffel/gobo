note

	description:

		"Adapters for class ARRAY"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_ARRAY [G]

inherit

	ARRAY [G]

create

	make_empty,
	make_filled

feature -- Resizing

	new_rebase (a_lower: like lower)
			-- Without changing the actual content of `Current' we set `lower' to `a_lower'
			-- and `upper' accordingly to `a_lower + count - 1'.
			--
			-- Note: needed in compatible mode.
		local
			l_old_lower: like lower
		do
			l_old_lower := lower
			lower := a_lower
			upper := a_lower + (upper - l_old_lower)
		ensure
			lower_set: lower = a_lower
			upper_set: upper = a_lower + old count - 1
		end
		
end
