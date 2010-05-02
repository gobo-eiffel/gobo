note

	description:

		"Gregorian calendar properties"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class KL_GREGORIAN_CALENDAR

inherit

	ANY

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

feature -- Year

	leap_year (y: INTEGER): BOOLEAN
			-- Is `y' a leap year?
		do
			Result := (y \\ 4 = 0) and ((y \\ 100 /= 0) or (y \\ 400 = 0))
		end

	Months_in_year: INTEGER = 12
			-- Number of months in a year
--		ensure
--			definition: Result = (December - Januray + 1)

	Days_in_year: INTEGER = 365
			-- Number of days in a non-leap year

	Days_in_leap_year: INTEGER = 366
			-- Number of days in a leap year

	Days_in_400_years: INTEGER = 146097
			-- Number of days in 400 years

	Days_in_100_years: INTEGER = 36524
			-- Number of days in 100 years

	Days_in_4_years: INTEGER = 1461
			-- Number of days in 4 years

	Days_in_3_years: INTEGER = 1095
			-- Number of days in 3 years with no leap year

	Days_in_3_leap_years: INTEGER = 1096
			-- Number of days in 3 years with a leap year

	Days_in_2_years: INTEGER = 730
			-- Number of days in 2 years with no leap year

	Days_in_2_leap_years: INTEGER = 731
			-- Number of days in 2 years with a leap year

feature -- Month

	January: INTEGER = 1
			-- Code for January

	February: INTEGER = 2
			-- Code for February

	March: INTEGER = 3
			-- Code for March

	April: INTEGER = 4
			-- Code for April

	May: INTEGER = 5
			-- Code for May

	June: INTEGER = 6
			-- Code for June

	July: INTEGER = 7
			-- Code for July

	August: INTEGER = 8
			-- Code for August

	September: INTEGER = 9
			-- Code for September

	October: INTEGER = 10
			-- Code for October

	November: INTEGER = 11
			-- Code for November

	December: INTEGER = 12
			-- Code for December

	days_in_month (m, y: INTEGER): INTEGER
			-- Number of days in month `m' of year `y'
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
		do
			inspect m
			when January, March, May, July, August, October, December then
				Result := 31
			when April, June, September, November then
				Result := 30
			when February then
				if leap_year (y) then
					Result := 29
				else
					Result := 28
				end
			end
		ensure
			at_least_one: Result >= 1
			max_days_in_month: Result <= Max_days_in_month
		end

	Max_days_in_month: INTEGER = 31
			-- Maximum number of days in a month

	days_at_month (m, y: INTEGER): INTEGER
			-- Number of days from beginning of year
			-- `y' until beginning of month `m'
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
		do
			inspect m
			when January then
				Result := 0
			when February then
				Result := 31
			when March then
				Result := 59
			when April then
				Result := 90
			when May then
				Result := 120
			when June then
				Result := 151
			when July then
				Result := 181
			when August then
				Result := 212
			when September then
				Result := 243
			when October then
				Result := 273
			when November then
				Result := 304
			when December then
				Result := 334
			end
			if m > February and then leap_year (y) then
				Result := Result + 1
			end
		ensure
			days_positive: Result >= 0
		end

feature -- Week day

	Days_in_week: INTEGER = 7
			-- Number of days in a week

feature -- Time

	Seconds_in_minute: INTEGER = 60
			-- Number of seconds in a minute

	Seconds_in_hour: INTEGER = 3600
			-- Number of seconds in an hour

	Seconds_in_day: INTEGER = 86400
			-- Number of seconds in a day

	Milliseconds_in_day: INTEGER = 86400000
			-- Number of milliseconds in a day

	Minutes_in_hour: INTEGER = 60
			-- Number of minutes in an hour

	Hours_in_day: INTEGER = 24
			-- Number of hours in a day

feature -- Epoch

	Epoch_year: INTEGER = 1970

	Epoch_month: INTEGER = 1

	Epoch_day: INTEGER = 1
			-- Epoch date (1 Jan 1970)

	epoch_days (y, m, d: INTEGER): INTEGER
			-- Number of days since epoch date (1 Jan 1970)
		require
			m_large_enough: m >= January
			m_small_enough: m <= December
			d_large_enough: d >= 1
			d_small_enough: d <= days_in_month (m, y)
		do
			Result := (y - Epoch_year) * Days_in_year +
				(((INTEGER_.div (y - 1, 4)) - (INTEGER_.div (y - 1, 100)) +
				(INTEGER_.div (y - 1, 400))) - Epoch_leap_years) +
				(days_at_month (m, y) - Epoch_days_at_month) +
				(d - Epoch_day)
		end

feature {NONE} -- Epoch

	Epoch_leap_years: INTEGER
			-- Number of leap years between year '1'
			-- and year 'Epoch_year - 1'
		once
			Result := ((Epoch_year - 1) // 4) - ((Epoch_year - 1) // 100) + ((Epoch_year - 1) // 400)
		end

	Epoch_days_at_month: INTEGER
			-- Number of days from beginning of year `Epoch_year'
			-- until beginning of month `Epoch_month' exclusive
		once
			Result := days_at_month (Epoch_month, Epoch_year)
		ensure
			days_positive: Result >= 0
		end

	Epoch_to_Y2K_days: INTEGER
			-- Number of days between epoch (1 Jan 1970)
			-- and Y2K (1 Jan 2000)
		once
			Result := epoch_days (2000, 1, 1)
		end

end
