note

	description:

		"Abstract clocks"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"

deferred class DT_CLOCK

inherit

	ANY
			-- Export features of ANY.

	DT_DATE_HANDLER

	DT_TIME_HANDLER

	DT_DATE_TIME_HANDLER

feature -- Access

	time_now: DT_TIME
			-- Current time
			-- (Create a new time object at each call.)
		do
			create Result.make_from_storage (0)
			set_time_to_now (Result)
		ensure
			time_now_not_void: Result /= Void
		end

	date_now: DT_DATE
			-- Current date
			-- (Create a new date object at each call.)
		do
			create Result.make_from_storage (0)
			set_date_to_now (Result)
		ensure
			date_now_not_void: Result /= Void
		end

	date_time_now: DT_DATE_TIME
			-- Current date time
			-- (Create a new date time object at each call.)
		do
			create Result.make_from_storage (0, 0)
			set_date_time_to_now (Result)
		ensure
			date_time_now_not_void: Result /= Void
		end

feature -- Setting

	set_time_to_now (a_time: DT_TIME)
			-- Set `a_time' to current time.
		require
			a_time_not_void: a_time /= Void
		deferred
		end

	set_date_to_now (a_date: DT_DATE)
			-- Set `a_date' to current date.
		require
			a_date_not_void: a_date /= Void
		deferred
		end

	set_date_time_to_now (a_date_time: DT_DATE_TIME)
			-- Set `a_date_time' to current date time.
		require
			a_date_time_not_void: a_date_time /= Void
		deferred
		end

end
