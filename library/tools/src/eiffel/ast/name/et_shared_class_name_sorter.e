note

	description:

		"Shared class name sorters"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SHARED_CLASS_NAME_SORTER

inherit

	ET_SHARED_CLASS_NAME_COMPARATOR

feature -- Access

	class_name_sorter: DS_QUICK_SORTER [ET_CLASS_NAME]
			-- Class name sorter
		once
			create Result.make (class_name_comparator)
		ensure
			instance_free: class
			class_name_sorter_not_void: Result /= Void
		end

end
