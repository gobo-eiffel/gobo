note

	description:

		"Days of the week"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_WEEK_DAY

inherit

	ANY
		redefine
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		undefine
			is_equal
		end

feature {NONE} -- Initialization

	make_monday
			-- Create a Monday.
		do
			make (monday_code)
		ensure
			is_monday: is_monday
		end

	make_tuesday
			-- Create a Tuesday.
		do
			make (tuesday_code)
		ensure
			is_tuesday: is_tuesday
		end

	make_wednesday
			-- Create a Wednesday.
		do
			make (wednesday_code)
		ensure
			is_wednesday: is_wednesday
		end

	make_thursday
			-- Create a Thursday.
		do
			make (thursday_code)
		ensure
			is_thursday: is_thursday
		end

	make_friday
			-- Create a Friday.
		do
			make (friday_code)
		ensure
			is_friday: is_friday
		end

	make_saturday
			-- Create a Saturday.
		do
			make (saturday_code)
		ensure
			is_saturday: is_saturday
		end

	make_sunday
			-- Create a Sunday.
		do
			make (sunday_code)
		ensure
			is_sunday: is_sunday
		end

	make (a_code: INTEGER)
			-- Create a day with code `a_code'.
		require
			a_code_valid: a_code >= 1 and a_code <= Days_in_week
		do
			code := a_code
		ensure
			code_set: code = a_code
		end

feature -- Status report

	is_monday: BOOLEAN
			-- Is `Current' day a Monday?
		do
			Result := code = monday_code
		ensure
			definition: Result = (code = monday_code)
		end

	is_tuesday: BOOLEAN
			-- Is `Current' day a Tuesday?
		do
			Result := code = tuesday_code
		ensure
			definition: Result = (code = tuesday_code)
		end

	is_wednesday: BOOLEAN
			-- Is `Current' day a Wednesday?
		do
			Result := code = wednesday_code
		ensure
			definition: Result = (code = wednesday_code)
		end

	is_thursday: BOOLEAN
			-- Is `Current' day a Thursday?
		do
			Result := code = thursday_code
		ensure
			definition: Result = (code = thursday_code)
		end

	is_friday: BOOLEAN
			-- Is `Current' day a Friday?
		do
			Result := code = friday_code
		ensure
			definition: Result = (code = friday_code)
		end

	is_saturday: BOOLEAN
			-- Is `Current' day a Saturday?
		do
			Result := code = saturday_code
		ensure
			definition: Result = (code = saturday_code)
		end

	is_sunday: BOOLEAN
			-- Is `Current' day a Sunday?
		do
			Result := code = sunday_code
		ensure
			definition: Result = (code = sunday_code)
		end

feature -- Comparison

	same_week_day (other: DT_WEEK_DAY): BOOLEAN
			-- Are `Current' and `other' the same week day?
		require
			other_not_void: other /= Void
		deferred
		end

	is_equal (other: like Current): BOOLEAN
			-- Are `Current' and `other' the same week day?
		do
			if ANY_.same_types (Current, other) then
				Result := same_week_day (other)
			end
		end

feature -- Access

	next_day: like Current
			-- Week day after `Current' day
		deferred
		ensure
			next_day_not_void: Result /= Void
			sunday_definition: is_sunday implies Result.is_monday
			monday_definition: is_monday implies Result.is_tuesday
			tuesday_definition: is_tuesday implies Result.is_wednesday
			wednesday_definition: is_wednesday implies Result.is_thursday
			thursday_definition: is_thursday implies Result.is_friday
			friday_definition: is_friday implies Result.is_saturday
			saturday_definition: is_saturday implies Result.is_sunday
		end

	previous_day: like Current
			-- Week day before `Current' day
		deferred
		ensure
			previous_day_not_void: Result /= Void
			sunday_definition: is_sunday implies Result.is_saturday
			monday_definition: is_monday implies Result.is_sunday
			tuesday_definition: is_tuesday implies Result.is_monday
			wednesday_definition: is_wednesday implies Result.is_tuesday
			thursday_definition: is_thursday implies Result.is_wednesday
			friday_definition: is_friday implies Result.is_thursday
			saturday_definition: is_saturday implies Result.is_friday
		end

	code: INTEGER
			-- Code for `Current' day

	monday_code: INTEGER
			-- Code for Monday
		deferred
		end

	tuesday_code: INTEGER
			-- Code for Tuesday
		deferred
		end

	wednesday_code: INTEGER
			-- Code for Wednesday
		deferred
		end

	thursday_code: INTEGER
			-- Code for Thursday
		deferred
		end

	friday_code: INTEGER
			-- Code for Friday
		deferred
		end

	saturday_code: INTEGER
			-- Code for Saturday
		deferred
		end

	sunday_code: INTEGER
			-- Code for Sunday
		deferred
		end

feature -- Measurement

	Days_in_week: INTEGER
			-- Number of days in a week
		deferred
		ensure
			definition: Result = 7
		end

feature -- Conversion

	as_week_day_from_monday: DT_WEEK_DAY_FROM_MONDAY
			-- Version of `Current' day in a week that starts on Monday
		deferred
		ensure
			week_day_not_void: Result /= Void
			is_monday: is_monday = Result.is_monday
			is_tuesday: is_tuesday = Result.is_tuesday
			is_wednesday: is_wednesday = Result.is_wednesday
			is_thursday: is_thursday = Result.is_thursday
			is_friday: is_friday = Result.is_friday
			is_saturday: is_saturday = Result.is_saturday
			is_sunday: is_sunday = Result.is_sunday
		end

	as_week_day_from_sunday: DT_WEEK_DAY_FROM_SUNDAY
			-- Version of `Current' day in a week that starts on Sunday
		deferred
		ensure
			week_day_not_void: Result /= Void
			is_monday: is_monday = Result.is_monday
			is_tuesday: is_tuesday = Result.is_tuesday
			is_wednesday: is_wednesday = Result.is_wednesday
			is_thursday: is_thursday = Result.is_thursday
			is_friday: is_friday = Result.is_friday
			is_saturday: is_saturday = Result.is_saturday
			is_sunday: is_sunday = Result.is_sunday
		end

invariant

	valid_code: code >= 1 and code <= Days_in_week
	valid_monday: monday_code >= 1 and monday_code <= Days_in_week
	valid_tuesday: tuesday_code >= 1 and tuesday_code <= Days_in_week
	valid_wednesday: wednesday_code >= 1 and wednesday_code <= Days_in_week
	valid_thursday: thursday_code >= 1 and thursday_code <= Days_in_week
	valid_friday: friday_code >= 1 and friday_code <= Days_in_week
	valid_saturday: saturday_code >= 1 and saturday_code <= Days_in_week
	valid_sunday: sunday_code >= 1 and sunday_code <= Days_in_week

end
