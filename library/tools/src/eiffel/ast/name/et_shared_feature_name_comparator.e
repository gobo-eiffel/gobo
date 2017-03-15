note

	description:

		"Shared feature name comparators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_FEATURE_NAME_COMPARATOR

feature -- Access

	feature_name_comparator: ET_FEATURE_NAME_COMPARATOR
			-- Feature name comparator
		once
			create Result.make
		ensure
			feature_name_comparator_not_void: Result /= Void
		end

end
