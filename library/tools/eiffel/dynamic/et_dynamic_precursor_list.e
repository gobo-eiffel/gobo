note

	description:

		"Eiffel lists of feature precursors at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_PRECURSOR_LIST

inherit

	ET_TAIL_LIST [ET_DYNAMIC_PRECURSOR]

create

	make, make_with_capacity

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_DYNAMIC_PRECURSOR]
			-- Fixed array routines
		once
			create Result
		end

end
