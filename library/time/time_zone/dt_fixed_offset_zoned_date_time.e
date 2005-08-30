indexing

	description:

		"Objects that pair a date-time with a time zone"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_FIXED_OFFSET_ZONED_DATE_TIME

inherit

	DT_ZONED_DATE_TIME
		redefine
			time_zone
		end

create

	make

feature -- Access

	time_zone: DT_FIXED_OFFSET_TIME_ZONE
			-- Time zone

end
	
