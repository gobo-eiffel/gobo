note

	description:

		"Shared feature name sorters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_FEATURE_NAME_SORTER

inherit

	ET_SHARED_FEATURE_NAME_COMPARATOR

feature -- Access

	feature_name_sorter: DS_QUICK_SORTER [ET_FEATURE_NAME]
			-- Feature name sorter
		once
			create Result.make (feature_name_comparator)
		ensure
			instance_free: class
			feature_name_sorter_not_void: Result /= Void
		end

end
