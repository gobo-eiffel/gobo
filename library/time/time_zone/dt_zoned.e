indexing

	description:

		"Objects that pair an absolute time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_ZONED

feature -- Access

	time_zone: DT_TIME_ZONE
			-- Time zone

invariant

	time_zone_not_void: time_zone /= Void

end
