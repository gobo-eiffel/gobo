﻿note

	description:

		"Cluster comparators by name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2017, Eric Bezault and others"
	license: "MIT License"

class ET_CLUSTER_COMPARATOR_BY_NAME

inherit

	KL_COMPARATOR [ET_CLUSTER]
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

	less_than, attached_less_than (u, v: ET_CLUSTER): BOOLEAN
			-- Is `u' considered less than `v'?
		do
			Result := (STRING_.three_way_case_insensitive_comparison (u.name, v.name) = -1)
		end

end
