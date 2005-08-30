indexing

	description:

		"Objects that parse dates and times according to ISO 8601:2000"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_ISO_DATE_TIME_PARSER

inherit
	
	DT_DATE_TIME_PARSER

	DT_ISO_CONSTANTS

	DT_WEEK_DAYS_FROM_MONDAY

		-- See bottom of file for some notes

	
		-- N.B. Some of the configuration options herein were intended to support deriving
	   --      XML Schema dates from the ISO extended format. This attempt has now been abandoned,
		--      so this class can be simplified accordingly
	
feature -- Access

	extra_year_digits: INTEGER
			-- Number of extra digits in year for expanded representations

	decimal_digits: INTEGER
			-- Number of digits to be used on fractional time component

	implicit_century, implicit_decade, implicit_year, implicit_month, implicit_week: INTEGER
			-- For use in truncated dates;
			-- N.B. `implicit_century' is a number of centuries, not years.
			-- N.B. `implicit_decade' is a number of decades, not years.

	implicit_hour, implicit_minute: INTEGER
			-- For use in trucated times

	reduced_precision_week_dates: BOOLEAN
			-- Are reduced-precision week dates allowed?

	calendar_date_precision: INTEGER
			-- Maximal precision-reduction allowed for calendar dates

	is_valid_year (a_year: INTEGER): BOOLEAN is
			-- Is `a_year' a valid year?
		do
			if a_year = 0 then
				Result := is_year_zero_allowed
			elseif a_year < 1582 then
				Result := is_before_1582_allowed
			else
				Result := True
			end
		end

	is_valid_day_of_year (a_day_number, a_year: INTEGER): BOOLEAN is
			-- Is `a_day_number' valid within `a_year'?
		require
			valid_year: is_valid_year (a_year)
		do
			Result := a_day_number > 0
			if Result then
				if leap_year (a_year) then
					Result := a_day_number <= Days_in_leap_year
				else
					Result := a_day_number <= Days_in_year
				end
			end
		end

	is_valid_month (a_month: INTEGER): BOOLEAN is
			-- Is `a_month' a valid_month?
		do
			Result := a_month > 0 and then a_month < 13
		end

	is_valid_day (a_day, a_month, a_year: INTEGER): BOOLEAN is
			-- Is `a_day' valid for `a_month' in `a_year'?
		require
			valid_year: is_valid_year (a_year)
		do
			Result := a_day >0 and then a_day <= days_in_month (a_month, a_year)
		end

	is_valid_week_day (a_day: INTEGER): BOOLEAN is
			-- Is `a_day' a valid week-day number?
		do
			Result := monday.code <= a_day and then a_day <= sunday.code
		end

	is_valid_week (a_week, a_year: INTEGER): BOOLEAN is
			-- Is `a_week' a valid week in `a_year'?
		require
			valid_year: is_valid_year (a_year)
		do
			if a_year <= 0 and then is_year_zero_allowed then
				Result := valid_week (a_week, a_year)
			elseif a_year > 0 then
				Result := valid_week (a_week, a_year)
			end
		end

feature -- Status report

	are_truncated_representations_used: BOOLEAN
			-- Are higher-order components omitted?

	are_expanded_representations_used: BOOLEAN
			-- Are years outside of the range 0000-9999 used?

	are_decimals_allowed: BOOLEAN
			-- Are decimals allowed in the lowest-order time component?

	is_permissible_decimal_point (a_character: CHARACTER): BOOLEAN is
			-- Is `a_character' a permissible value for a decimal point?
		do
			Result := a_character = ',' or else a_character = '.'
		end

	is_implicit_century_set: BOOLEAN
			-- Is `implicit_century' meaningful?

	is_implicit_decade_set: BOOLEAN
			-- Is `implicit_decade' meaningful?

	is_implicit_year_set: BOOLEAN
			-- Is `implicit_year' meaningful?

	is_implicit_month_set: BOOLEAN
			-- Is `implicit_month' meaningful?

	is_implicit_week_set: BOOLEAN
			-- Is `implicit_week' meaningful?

	is_implicit_hour_set: BOOLEAN
			-- Is `implicit_hour' meaningful?

	is_implicit_minute_set: BOOLEAN
			-- Is `implicit_minute' meaningful?

	is_before_1582_allowed: BOOLEAN
			-- Are dates before the introduction of the Gregorian calendar allowed?

	is_year_zero_allowed: BOOLEAN
			-- Is "0000" a legitimate year (= 1 BCE)?

feature -- Status setting

	set_implicit_century (a_century: INTEGER) is
			-- Set `implicit_century'.
		require
			positive_implicit_century: a_century > 0
			truncated_representations_in_use: are_truncated_representations_used
		do
			implicit_century := a_century
			is_implicit_century_set := True
		ensure
			implicit_century_set: is_implicit_century_set and then implicit_century = a_century
		end

	set_implicit_decade (a_decade: INTEGER) is
			-- Set `implicit_decade'.
		require
			positive_implicit_decade: a_decade > 0
			truncated_representations_in_use: are_truncated_representations_used
		do
			implicit_decade := a_decade
			is_implicit_decade_set := True
		ensure
			implicit_decade_set: is_implicit_decade_set and then implicit_decade = a_decade
		end

	set_implicit_year (a_year: INTEGER) is
			-- Set `implicit_year'.
		require
			positive_implicit_year: a_year > 0
			truncated_representations_in_use: are_truncated_representations_used
		do
			implicit_year := a_year
			is_implicit_year_set := True
		ensure
			implicit_year_set: is_implicit_year_set and then implicit_year = a_year
		end

	set_implicit_month (a_month: INTEGER) is
			-- Set `implicit_month'.
		require
			implicit_year_set: is_implicit_year_set
			valid_month: is_valid_month (a_month)
			truncated_representations_in_use: are_truncated_representations_used
		do
			implicit_month := a_month
			is_implicit_month_set := True
		ensure
			implicit_month_set: is_implicit_month_set and then implicit_month = a_month
		end

	set_implicit_week (a_week: INTEGER) is
			-- Set `implicit_week'.
		require
			implicit_year_set: is_implicit_year_set
			valid_week:  is_valid_week (a_week, implicit_year)
			truncated_representations_in_use: are_truncated_representations_used
		do
			implicit_week := a_week
			is_implicit_week_set := True
		ensure
			implicit_week_set: is_implicit_week_set and then implicit_week = a_week
		end

invariant

	consistent_extra_digits: not are_expanded_representations_used implies extra_year_digits = 0
	consistent_early_dates: is_year_zero_allowed implies is_before_1582_allowed
	consistent_implicit_century: is_implicit_century_set and then is_implicit_year_set implies
		implicit_year - (100 * implicit_century) >= 0
	consistent_implicit_decade: is_implicit_decade_set and then is_implicit_year_set implies
		implicit_year - (10 * implicit_decade) >= 0
	expanded_or_truncated_or_neither: not (are_expanded_representations_used and are_truncated_representations_used)
	calendar_date_precision: calendar_date_precision >= Full_calendar_precision and then calendar_date_precision <= Specific_century

		-- NOTES:
		-- This is an attempt to implement the whole of ISO 8601:2000 (*)
		-- The basic and extended formats are implemented individually
		--  by descendants of this class.
		-- The assumption is that complete representations are assumed by default.
		-- Expanded representations may be used by agreement of both parties.
		--  (in practice, that means the creation routine of a descendant of this class
		--   will set `are_expanded_representations_used' to `True', and extra_year_digits
		--   to the agreed number of extra numerals in the year field.)
		-- Use of expanded representations mean that that a fixed number of extra year digits
		--  MUST be present, preceded by the sign, unless the value is positive and has no leading
		--  zeros. Or else all extra digits must be omitted, along with the sign. (Should there be a flag to permit this?)
		-- Alternatively, truncated representations may be used by agreement of both parties.
		--  (in practice, that means the creation routine of a descendant of this class
		--   will set `are_truncated_representations_used' to `True', and at least one of
		--   `implicit_century', `implicit_century',`implicit_year', `implicit_month',
		--   `implicit_week', `implicit_hour' or `implicit_minute'.)
		-- Is it an error to supply a complete representation when truncated representation
		--  has been agreed? I'm not sure - maybe it should be configurable.
		-- Any one of the above representations may use reduced precision, if allowed.
		-- Any one of the above representations MUST use decimal representation, if allowed. In this
		--  case `decimal_digits' must be set by the creation routine. (???)
	
		-- (*) Durations still to be added

end
