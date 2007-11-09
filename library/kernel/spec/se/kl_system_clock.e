indexing

	description:

		"System clocks (precision to the millisecond)"

	remark:

		"With SmartEiffel under Windows the millisecond part may be stuck to zero."

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001-2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_SYSTEM_CLOCK

inherit

	KI_SYSTEM_CLOCK





















create

	make

feature {NONE} -- Initialization

	make is
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

	set_local_time is
			-- Set clock to current local time.

		local
			old_is_local: BOOLEAN

		do

			old_is_local := basic_time.time.is_local_time
			basic_time.time.set_local_time
			basic_time.update
			year := basic_time.time.year
			month := basic_time.time.month
			day := basic_time.time.day
			hour := basic_time.time.hour
			minute := basic_time.time.minute
			second := basic_time.time.second
			millisecond := basic_time.microsecond // 1000
			if not old_is_local then
				basic_time.time.set_universal_time
			end














		end

	set_utc_time is
			-- Set clock to current UTC time.

		local
			old_is_local: BOOLEAN

		do

			old_is_local := basic_time.time.is_local_time
			basic_time.time.set_universal_time
			basic_time.update
			year := basic_time.time.year
			month := basic_time.time.month
			day := basic_time.time.day
			hour := basic_time.time.hour
			minute := basic_time.time.minute
			second := basic_time.time.second
			millisecond := basic_time.microsecond // 1000
			if old_is_local then
				basic_time.time.set_local_time
			end














		end


feature {NONE} -- Implementation

	basic_time: MICROSECOND_TIME
			-- System time


end
