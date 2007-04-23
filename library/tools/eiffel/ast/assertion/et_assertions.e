indexing

	description:

		"Eiffel assertion lists"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ASSERTIONS

inherit

	ET_AST_NODE

	ET_HEAD_LIST [ET_ASSERTION_ITEM]

feature -- Initialization

	reset is
			-- Reset assertions as they were just after they were last parsed.
		local
			i, nb: INTEGER
		do
			nb := count - 1
			from i := 0 until i > nb loop
				storage.item (i).assertion.reset
				i := i + 1
			end
		end

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
