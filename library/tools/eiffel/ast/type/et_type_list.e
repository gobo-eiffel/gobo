indexing

	description:

		"Eiffel comma-separated lists of types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2003, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_TYPE_LIST

inherit

	ET_AST_NODE

	ET_AST_LIST [ET_TYPE_ITEM]

feature -- Access

	type (i: INTEGER): ET_TYPE is
			-- Type of `i'-th item in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := item (i).type
		ensure
			type_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_TYPE_ITEM] is
			-- Fixed array routines
		once
			create Result
		end

end
