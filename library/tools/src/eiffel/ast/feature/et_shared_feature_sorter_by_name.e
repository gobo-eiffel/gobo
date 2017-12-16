note

	description:

		"Shared feature sorters by name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_FEATURE_SORTER_BY_NAME

inherit

	ET_SHARED_FEATURE_COMPARATOR_BY_NAME
	
feature -- Access

	feature_sorter_by_name: DS_QUICK_SORTER [ET_FEATURE]
			-- Feature sorter by name
		once
			create Result.make (feature_comparator_by_name)
		ensure
			feature_sorter_by_name_not_void: Result /= Void
		end

end
