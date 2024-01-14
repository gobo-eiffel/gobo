note

	description:

		"Shared dynamic primary_type comparators by id"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2016-2018, Eric Bezault and others"
	license: "MIT License"

class ET_SHARED_DYNAMIC_PRIMARY_TYPE_COMPARATOR_BY_ID

feature -- Access

	dynamic_primary_type_comparator: ET_DYNAMIC_PRIMARY_TYPE_COMPARATOR_BY_ID
			-- Dynamic primary type comparator by id
		once
			create Result.make
		ensure
			instance_free: class
			dynamic_primary_type_comparator_not_void: Result /= Void
		end

end
