indexing

	description:

		"Lists of Eiffel qualified feature calls at run-time"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DYNAMIC_CALL_LIST

inherit

	ET_AST_LIST [ET_DYNAMIC_CALL]

creation

	make, make_with_capacity

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_DYNAMIC_CALL] is
			-- Fixed array routines
		once
			create Result
		end

end
