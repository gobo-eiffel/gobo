note

	description:

		"Shared days of the week which start on Monday"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004-2018, Eric Bezault and others"
	license: "MIT License"

class DT_SHARED_WEEK_DAYS_FROM_MONDAY

feature -- Access

	week_days_from_monday: DT_WEEK_DAYS_FROM_MONDAY
			-- Week days from monday
		once
			create Result
		ensure
			instance_free: class
			week_days_from_monday_not_void: Result /= Void
		end

end
