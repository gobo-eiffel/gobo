note

	description:

		"Shared attribute comparators by name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_SHARED_ATTRIBUTE_COMPARATOR_BY_NAME

feature -- Access

	attribute_comparator_by_name: ET_ATTRIBUTE_COMPARATOR_BY_NAME
			-- Attribute comparator by name
		once
			create Result.make
		ensure
			instance_free: class
			attribute_comparator_by_name_not_void: Result /= Void
		end

end
