note

	description:

		"Attribute comparators by name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2026, Eric Bezault and others"
	license: "MIT License"

class ET_ATTRIBUTE_COMPARATOR_BY_NAME

inherit

	KL_COMPARATOR [ET_ATTRIBUTE]
		redefine
			less_than
		end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new comparator.
		do
		end

feature -- Status report

	less_than, attached_less_than (u, v: ET_ATTRIBUTE): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (STRING_.three_way_lower_case_comparison (u.name.name, v.name.name) = -1)
		end

end
