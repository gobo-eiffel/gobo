indexing

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

	C_DATE
		rename
			millisecond_now as millisecond
		undefine
			default_create
		end

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

feature -- Setting

	set_local_time is
			-- Set clock to current local time.
		do
			is_utc := False
			update
			year := year_now
			month := month_now
			day := day_now
			hour := hour_now
			minute := minute_now
			second := second_now
		end

	set_utc_time is
			-- Set clock to current UTC time.
		do
			is_utc := True
			update
			year := year_now
			month := month_now
			day := day_now
			hour := hour_now
			minute := minute_now
			second := second_now
		end

end
