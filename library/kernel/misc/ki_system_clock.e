note

	description:

		"Interface for system clocks (precision to the millisecond)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KI_SYSTEM_CLOCK

feature {NONE} -- Initialization

	make is
			-- Create a new system clock.
		deferred
		end

feature -- Access

	year: INTEGER is
			-- Year
		deferred
		end

	month: INTEGER is
			-- Month
		deferred
		ensure
			month_large_enough: Result >= 1
			month_small_enough: Result <= 12
		end

	day: INTEGER is
			-- Day
		deferred
		ensure
			day_large_enough: Result >= 1
			day_small_enough: Result <= 31
		end

	hour: INTEGER is
			-- Hour
		deferred
		ensure
			hour_large_enough: Result >= 0
			hour_small_enough: Result < 24
		end

	minute: INTEGER is
			-- Minute
		deferred
		ensure
			minute_large_enough: Result >= 0
			minute_small_enough: Result < 60
		end

	second: INTEGER is
			-- Second
		deferred
		ensure
			second_large_enough: Result >= 0
			second_small_enough: Result < 62
		end

	millisecond: INTEGER is
			-- Millisecond
		deferred
		ensure
			millisecond_large_enough: Result >= 0
			millisecond_small_enough: Result < 999
		end

feature -- Setting

	set_local_time is
			-- Set clock to current local time.
		deferred
		end

	set_utc_time is
			-- Set clock to current UTC time.
		deferred
		end

end
