indexing

	description:

		"Shared days of the week which start on Monday"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_SHARED_WEEK_DAYS_FROM_MONDAY

feature -- Access

	week_days_from_monday: DT_WEEK_DAYS_FROM_MONDAY is
			-- Week days from monday
		once
			create Result
		ensure
			week_days_from_monday_not_void: Result /= Void
		end

end
