indexing

	description:

		"Objects that provide access to a shared Gregorian calendar"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_SHARED_GREGORIAN_CALENDAR

feature -- Access

	calendar: DT_GREGORIAN_CALENDAR is
			-- Shared calendar
		once
			create Result
		ensure
			shared_calendar_not_void: Result /= Void
		end

end
