indexing

	description:

		"Objects that pair an absolute time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_ZONED

feature -- Access

	time_zone: DT_TIME_ZONE
			-- Time zone

invariant

	time_zone_not_void: time_zone /= Void

end
	
