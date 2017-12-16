note

	description:

		"Shared class sorters by name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_CLASS_SORTER_BY_NAME

inherit

	ET_SHARED_CLASS_COMPARATOR_BY_NAME
	
feature -- Access

	class_sorter_by_name: DS_QUICK_SORTER [ET_CLASS]
			-- Class sorter by name
		once
			create Result.make (class_comparator_by_name)
		ensure
			class_sorter_by_name_not_void: Result /= Void
		end

end
