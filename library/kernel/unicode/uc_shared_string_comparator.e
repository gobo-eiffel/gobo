indexing

	description:

		"Shared comparator between strings that can be polymorphically unicode strings"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class UC_SHARED_STRING_COMPARATOR

feature -- Access

	string_comparator: UC_STRING_COMPARATOR is
			-- String comparator
		once
			create Result
		ensure
			string_comparator_not_void: Result /= Void
		end

end
