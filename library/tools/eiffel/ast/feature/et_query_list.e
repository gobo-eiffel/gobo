note

	description:

		"Eiffel lists of queries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_QUERY_LIST

inherit

	ET_FEATURE_LIST
		redefine
			item, fixed_array
		end

create

	make, make_with_capacity

feature -- Access

	item (i: INTEGER): ET_QUERY is
			-- Query at index `i' in list
		do
			Result := storage.item (count - i)
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_QUERY] is
			-- Fixed array routines
		once
			create Result
		end

end
