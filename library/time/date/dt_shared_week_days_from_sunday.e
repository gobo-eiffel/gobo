note

	description:

		"Shared days of the week which start on Sunday"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_SHARED_WEEK_DAYS_FROM_SUNDAY

feature -- Access

	week_days_from_sunday: DT_WEEK_DAYS_FROM_SUNDAY
			-- Week days from sunday
		once
			create Result
		ensure
			week_days_from_sunday_not_void: Result /= Void
		end

end
