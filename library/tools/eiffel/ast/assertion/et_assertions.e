indexing

	description:

		"Eiffel assertion lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSERTIONS

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_ASSERTION_ITEM]

feature -- Access

	assertion (i: INTEGER): ET_ASSERTION is
			-- Assertion at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).assertion
		ensure
			assertion_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ASSERTION_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

end
