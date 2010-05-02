note

	description:

		"Shared system clocks"

	pattern: "Singleton"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_SHARED_SYSTEM_CLOCK

feature -- Access

	system_clock: DT_SYSTEM_CLOCK
			-- Local system clock
		once
			create Result.make
		ensure
			system_clock_not_void: Result /= Void
		end

	utc_system_clock: DT_UTC_SYSTEM_CLOCK
			-- UTC system clock
		once
			create Result.make
		ensure
			utc_system_clock_not_void: Result /= Void
		end

end
