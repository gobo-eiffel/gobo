﻿note

	description:

		"Reverse partial order comparators"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2017, Eric Bezault and others"
	license: "MIT License"

class KL_REVERSE_PART_COMPARATOR [G]

inherit

	KL_PART_COMPARATOR [G]

create

	make

feature {NONE} -- Initialization

	make (a_comparator: like comparator)
			-- Create a new reverse comparator based on `a_comparator'.
		require
			a_comparator_not_void: a_comparator /= Void
		do
			comparator := a_comparator
		ensure
			comparator_set: comparator = a_comparator
		end

feature -- Status report

	attached_less_than (u, v: attached G): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := comparator.less_than (v, u)
		ensure then
			definition: Result = comparator.less_than (v, u)
		end

feature -- Access

	comparator: KL_PART_COMPARATOR [G]
			-- Base comparator

feature -- Setting

	set_comparator (a_comparator: like comparator)
			-- Set `comparator' to `a_comparator'.
		require
			a_comparator_not_void: a_comparator /= Void
		do
			comparator := a_comparator
		ensure
			comparator_set: comparator = a_comparator
		end

invariant

	comparator_not_void: comparator /= Void

end
