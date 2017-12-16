note

	description:

		"Days of the week which start on Sunday"

	pattern: "Use features from DT_WEEK_DAYS_FROM_SUNDAY to get instances of this class"
	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class DT_WEEK_DAY_FROM_SUNDAY

inherit

	DT_WEEK_DAY

	DT_WEEK_DAYS_FROM_SUNDAY
		export
			{NONE} all
		undefine
			is_equal
		end

	DT_SHARED_WEEK_DAYS_FROM_MONDAY
		export
			{NONE} all
		undefine
			is_equal
		end

create {DT_WEEK_DAYS_FROM_SUNDAY}

	make_monday,
	make_tuesday,
	make_wednesday,
	make_thursday,
	make_friday,
	make_saturday,
	make_sunday

feature -- Access

	next_day: like Current
			-- Week day after `Current' day
		do
			if is_saturday then
				Result := sunday
			else
				Result := week_day_from_code (code + 1)
			end
		end

	previous_day: like Current
			-- Week day before `Current' day
		do
			if is_sunday then
				Result := saturday
			else
				Result := week_day_from_code (code - 1)
			end
		end

feature -- Comparison

	same_week_day (other: DT_WEEK_DAY): BOOLEAN
			-- Are `Current' and `other' the same week day?
		do
			if ANY_.same_types (Current, other) then
				Result := code = other.code
			else
				inspect code
				when monday_code then
					Result := other.is_monday
				when tuesday_code then
					Result := other.is_tuesday
				when wednesday_code then
					Result := other.is_wednesday
				when thursday_code then
					Result := other.is_thursday
				when friday_code then
					Result := other.is_friday
				when saturday_code then
					Result := other.is_saturday
				when sunday_code then
					Result := other.is_sunday
				end
			end
		end

feature -- Conversion

	as_week_day_from_monday: DT_WEEK_DAY_FROM_MONDAY
			-- Version of `Current' day in a week that starts on Monday
		do
			if is_sunday then
				Result := week_days_from_monday.sunday
			else
				Result := week_days_from_monday.week_day_from_code (code - 1)
			end
		end

	as_week_day_from_sunday: DT_WEEK_DAY_FROM_SUNDAY
			-- Version of `Current' day in a week that starts on Sunday
		do
			Result := Current
		end

invariant

	first_day: sunday_code = 1

end
