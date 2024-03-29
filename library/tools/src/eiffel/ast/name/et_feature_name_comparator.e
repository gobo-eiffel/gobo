﻿note

	description:

		"Feature name comparators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_FEATURE_NAME_COMPARATOR

inherit

	KL_COMPARATOR [ET_FEATURE_NAME]
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

	less_than, attached_less_than (u, v: ET_FEATURE_NAME): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (STRING_.three_way_lower_case_comparison (u.name, v.name) = -1)
		end

end
