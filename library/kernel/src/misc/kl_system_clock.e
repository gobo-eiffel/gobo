note

	description:

		"System clocks (precision to the millisecond)"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SYSTEM_CLOCK

inherit

	KI_SYSTEM_CLOCK

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new system clock.
		do
		end

feature -- Access

	year: INTEGER
			-- Year

	month: INTEGER
			-- Month

	day: INTEGER
			-- Day

	hour: INTEGER
			-- Hour

	minute: INTEGER
			-- Minute

	second: INTEGER
			-- Second

	millisecond: INTEGER
			-- Millisecond

feature -- Setting

	set_local_time
			-- Set clock to current local time.
		local
			l_clock: detachable C_DATE
		do
			l_clock := local_clock
			if l_clock = Void then
				create l_clock
				local_clock := l_clock
			else
				l_clock.update
			end
			year := l_clock.year_now
			month := l_clock.month_now
			day := l_clock.day_now
			hour := l_clock.hour_now
			minute := l_clock.minute_now
			second := l_clock.second_now
			millisecond := l_clock.millisecond_now
		end

	set_utc_time
			-- Set clock to current UTC time.
		local
			l_clock: detachable C_DATE
		do
			l_clock := utc_clock
			if l_clock = Void then
				create l_clock.make_utc
				utc_clock := l_clock
			else
				l_clock.update
			end
			year := l_clock.year_now
			month := l_clock.month_now
			day := l_clock.day_now
			hour := l_clock.hour_now
			minute := l_clock.minute_now
			second := l_clock.second_now
			millisecond := l_clock.millisecond_now
		end

feature {NONE} -- Implementation

	utc_clock: detachable C_DATE
			-- Clock in UTC time

	local_clock: detachable C_DATE
			-- Clock in local time

end
