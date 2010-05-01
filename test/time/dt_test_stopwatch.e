note

	description:

		"Test features of class DT_STOPWATCH"

	test_status: "ok_to_run"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_TEST_STOPWATCH

inherit

	TS_TEST_CASE
	DT_SHARED_SYSTEM_CLOCK

create

	make_default

feature -- Test

	test_start_stop is
			-- Test starting and stopping the stopwatch.
		local
			s: DT_STOPWATCH
			td: DT_TIME_DURATION
		do
				-- Test starting and stopping and then checking elapsed time.
			create s.make
			s.start
			wait
			s.stop
			td := s.elapsed_time
			assert ("elapsed_time_positive1", td.millisecond > 0)
				-- Test starting and *not* stopping and then checking elapsed time.
			create s.make
			s.start
			wait
			td := s.elapsed_time
			assert ("elapsed_time_positive2", td.millisecond > 0)
				-- Test *not* starting or stopping and then checking elapsed time.
			create s.make
			wait
			td := s.elapsed_time
			assert ("elapsed_time_null", td.millisecond = 0)
		end

feature {NONE} -- Implementation

	wait is
			-- Make sure that some time is elapsed.
		local
			l_time: DT_DATE_TIME
		do
			from
				l_time := system_clock.date_time_now
			until
				l_time < system_clock.date_time_now
			loop
			end
		end

end
