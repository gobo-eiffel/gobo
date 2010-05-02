note

	description:

		"Simple stopwatches"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_STOPWATCH

inherit

	DT_SHARED_SYSTEM_CLOCK

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new stopwatch.
		do
		end

feature -- Access

	elapsed_time: DT_DATE_TIME_DURATION
			-- Elapsed time
		local
			l_start_time: like stop_time
			l_stop_time: like start_time
		do
			l_start_time := start_time
			if l_start_time /= Void then
				l_stop_time := stop_time
				if l_stop_time /= Void then
					Result := l_stop_time.canonical_duration (l_start_time)
				else
					Result := system_clock.date_time_now.canonical_duration (l_start_time)
				end
			else
				create Result.make (0, 0, 0, 0, 0, 0)
			end
		ensure
			elapsed_time_not_void: Result /= Void
		end

feature -- Status report

	is_started: BOOLEAN
			-- Has stopwatch been started?
		do
			Result := start_time /= Void and stop_time = Void
		ensure
			definition: Result = (start_time /= Void and stop_time = Void)
		end

feature -- Basic operations

	reset
			-- Reset stopwatch.
		do
			start_time := Void
			stop_time := Void
		ensure
			not_started: not is_started
			no_start_time: start_time = Void
			no_stop_time: stop_time = Void
		end

	start
			-- Start stopwatch.
		do
			start_time := system_clock.date_time_now
			stop_time := Void
		ensure
			started: is_started
			start_time: start_time /= Void
			no_stop_time: stop_time = Void
		end

	stop
			-- Stop stopwatch.
		require
			started: is_started
		do
			stop_time := system_clock.date_time_now
		ensure
			not_started: not is_started
			start_time: start_time /= Void
			stop_time: stop_time /= Void
		end

feature {NONE} -- Implementation

	start_time: detachable DT_DATE_TIME
			-- Time when stopwatch was started

	stop_time: detachable DT_DATE_TIME
			-- Time when stopwatch was stopped

end
