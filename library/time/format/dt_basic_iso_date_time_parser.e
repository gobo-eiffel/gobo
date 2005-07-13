indexing

	description:

		"Objects that parse dates and times in the ISO 8601:2000 basic format"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_BASIC_ISO_DATE_TIME_PARSER

inherit

	DT_ISO_DATE_TIME_PARSER

create

	make, make_expanded, make_truncated

feature {NONE} -- Initialization

	make (a_calendar_date_precision: INTEGER; reduced_weeks_ok: BOOLEAN)is
			-- Create a parser without expanded or truncated representations.
		require
			calendar_date_precision: a_calendar_date_precision >= Full_calendar_precision and then a_calendar_date_precision <= Specific_century			
		do
			calendar_date_precision := a_calendar_date_precision
			reduced_precision_week_dates := reduced_weeks_ok
		ensure
			calendar_date_precision_set: calendar_date_precision = a_calendar_date_precision
			reduced_precision_week_dates: reduced_precision_week_dates = reduced_weeks_ok
		end

	make_expanded (a_calendar_date_precision: INTEGER; reduced_weeks_ok: BOOLEAN; extra_digits: INTEGER; before_1582_allowed, year_zero_allowed: BOOLEAN)is
			-- Create a parser with expanded representations.
		require
			calendar_date_precision: a_calendar_date_precision >= Full_calendar_precision and then a_calendar_date_precision <= Specific_century			
		do
			calendar_date_precision := a_calendar_date_precision
			reduced_precision_week_dates := reduced_weeks_ok
			extra_year_digits := extra_digits
			are_expanded_representations_used := True
			is_before_1582_allowed := before_1582_allowed
			is_year_zero_allowed := year_zero_allowed
		ensure
			calendar_date_precision_set: calendar_date_precision = a_calendar_date_precision
			reduced_precision_week_dates: reduced_precision_week_dates = reduced_weeks_ok
			extra_year_digits_set: extra_year_digits = extra_digits
			expanded_representations_permitted: are_expanded_representations_used
			early_dates_set: is_before_1582_allowed = before_1582_allowed
			year_zero: is_year_zero_allowed = year_zero_allowed
		end

	make_truncated (a_calendar_date_precision: INTEGER; reduced_weeks_ok: BOOLEAN) is
			-- Create a parser with truncated representations.
		require
			calendar_date_precision: a_calendar_date_precision >= Full_calendar_precision and then a_calendar_date_precision <= Specific_century			
		do
			calendar_date_precision := a_calendar_date_precision
			reduced_precision_week_dates := reduced_weeks_ok
			are_truncated_representations_used := True
		ensure
			calendar_date_precision_set: calendar_date_precision = a_calendar_date_precision
			reduced_precision_week_dates: reduced_precision_week_dates = reduced_weeks_ok
			truncated_representations_used: are_truncated_representations_used
		end

feature -- Access

	is_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid date?
		do
			negative_sign_present := False
			if are_expanded_representations_used then
				Result := is_expanded_date (a_formatted_date)
			elseif are_truncated_representations_used then
				Result := is_truncated_date (a_formatted_date)
			else
				Result := is_standard_date (a_formatted_date)
			end
		end

	is_zoned_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid zoned date?
		do
			-- TODO
		end

	is_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid date-time?
		do
			-- TODO
		end

	is_zoned_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid zoned date-time?
		do
			-- TODO
		end

	is_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid time?
		do
			-- TODO
		end

	is_zoned_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid zoned time?
		do
			-- TODO
		end

feature -- Conversion

	string_to_date (a_formatted_date: STRING): DT_DATE is
			-- Parsed date from `a_formatted_date'
		do
			negative_sign_present := False
			if are_expanded_representations_used then
				Result := string_to_expanded_date (a_formatted_date)
			elseif are_truncated_representations_used then
				Result := string_to_truncated_date (a_formatted_date)
			else
				Result := string_to_standard_date (a_formatted_date)
			end
		end

	string_to_zoned_date (a_formatted_date: STRING): DT_ZONED_DATE is
			-- Parsed date from `a_formatted_date'
		do
			-- TODO
		end

	string_to_date_time (a_formatted_date_time: STRING): DT_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		do
			-- TODO
		end

	string_to_zoned_date_time (a_formatted_date_time: STRING): DT_ZONED_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		do
			-- TODO
		end

	string_to_time (a_formatted_time: STRING): DT_TIME is
			-- Parsed time from `a_formatted_time'
		do
			-- TODO
		end

	string_to_zoned_time (a_formatted_time: STRING): DT_ZONED_TIME is
			-- Parsed time from `a_formatted_time'
		do
			-- TODO
		end

feature {NONE} -- Implementation

	negative_sign_present: BOOLEAN
			-- Was a negative sign found?

	is_expanded_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid expanded date?
		require
			expanded_representations_in_use: are_expanded_representations_used
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		local
			a_count: INTEGER
			a_prefix: STRING
		do
			a_count := a_formatted_date.count
			if a_count > 0 then
				if a_formatted_date.item (1) = '-' then
					negative_sign_present := True
					Result := is_standard_date (a_formatted_date.substring (2, a_count))
				elseif a_formatted_date.item (1) = '+' then
					Result := is_standard_date (a_formatted_date.substring (2, a_count))
				else
					create a_prefix.make_filled ('0', extra_year_digits)
					Result := is_standard_date (a_prefix + a_formatted_date)
				end
			end
		end

	string_to_expanded_date (a_formatted_date: STRING): DT_DATE is
			--  Parsed version of `a_formatted_date'
		require
			expanded_representations_in_use: are_expanded_representations_used
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		local
			a_count: INTEGER
			a_prefix: STRING
		do
			a_count := a_formatted_date.count
			if a_formatted_date.item (1) = '-' then
				negative_sign_present := True
				Result := string_to_standard_date (a_formatted_date.substring (2, a_count))
			elseif a_formatted_date.item (1) = '+' then
				Result := string_to_standard_date (a_formatted_date.substring (2, a_count))
			else
				create a_prefix.make_filled ('0', extra_year_digits)
				Result := string_to_standard_date (a_prefix + a_formatted_date)
			end
		ensure
			expanded_date_not_void: Result /= Void
		end

	is_truncated_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid truncated date?
		require
			truncated_representations_in_use: are_truncated_representations_used
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		local
			a_count, a_w, a_hyphen, a_year, a_month: INTEGER
		do
			a_w := a_formatted_date.index_of ('W', 1)
			if a_w = 0 then a_w := a_formatted_date.index_of ('w', 1) end
			if a_w /= 0 then
				Result := is_truncated_week_date (a_formatted_date, a_w)
			else
				Result := is_ordinal_date (a_formatted_date)
				if not Result then
					a_count := a_formatted_date.count
					a_hyphen := a_formatted_date.index_of ('-', 1)
					if a_count = 6 and then a_hyphen = 0 and then a_formatted_date.is_integer and then is_implicit_century_set then -- YYMMDD
						a_year := a_formatted_date.substring (1, 2).to_integer
						Result :=  is_valid_year (a_year + (100 * implicit_century))
						if Result then
							a_month := a_formatted_date.substring (3, 4).to_integer
							Result := is_valid_month (a_month)
							if Result then
								Result := is_valid_day (a_formatted_date.substring (5, 6).to_integer, a_month, a_year + (100 * implicit_century))
							end
						end
					elseif a_count = 5 and then a_hyphen = 1
						 and then is_implicit_century_set and then a_formatted_date.substring (2, 5).is_integer then -- -YYMM
						 a_year := a_formatted_date.substring (2, 3).to_integer + (100 * implicit_century)
						 Result := is_implicit_century_set and then is_valid_year (a_year)
							 and then is_valid_month (a_formatted_date.substring (4, 5).to_integer)
					elseif a_count = 3 and then a_hyphen = 1 and then a_formatted_date.substring (2, 3).is_integer then -- -YY
						Result := is_implicit_century_set and then is_valid_year (a_formatted_date.substring (2, 3).to_integer + (100 * implicit_century))
					elseif a_count = 6 and then a_formatted_date.substring (3, 6).is_integer and then a_formatted_date.substring (1, 2).is_equal ("--") then -- --MMDD
						Result := is_implicit_year_set
						if Result then
							a_month := a_formatted_date.substring (3, 4).to_integer
							Result := is_valid_month (a_month)
								and then is_valid_day (a_formatted_date.substring (5, 6).to_integer, a_month, implicit_year)
						end
					elseif a_count = 5 then -- ---DD
						Result := is_implicit_year_set and then is_implicit_month_set
							and then a_formatted_date.substring (1, 3).is_equal ("---")
							and then a_formatted_date.substring (4, 5).is_integer
							and then is_valid_day (a_formatted_date.substring (4, 5).to_integer, implicit_month, implicit_year)
					elseif a_count = 4 then -- --MM
						Result := is_implicit_year_set 
							and then a_formatted_date.substring (1, 2).is_equal ("--")
							and then a_formatted_date.substring (3, 4).is_integer
							and then is_valid_month (a_formatted_date.substring (3, 4).to_integer)
					end
				end
			end
		end

	string_to_truncated_date (a_formatted_date: STRING): DT_DATE is
			--  Parsed version of `a_formatted_date'
		require
			truncated_representations_in_use: are_truncated_representations_used
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		local
			a_count, a_w, a_hyphen, a_year, a_month, a_day: INTEGER
		do
			a_w := a_formatted_date.index_of ('W', 1)
			if a_w = 0 then a_w := a_formatted_date.index_of ('w', 1) end
			if a_w /= 0 then
				-- Result := string_to_truncated_week_date (a_formatted_date, a_w)
			else
				a_count := a_formatted_date.count
				a_hyphen := a_formatted_date.index_of ('-', 1)
				if a_count = 4 and then a_hyphen = 1 then 
					if a_formatted_date.index_of ('-', 2) = 2 and then is_implicit_year_set then -- --MM
						create Result.make (implicit_year, a_formatted_date.substring (3, 4).to_integer, 1) 
					else -- -DDD
						create Result.make (implicit_year, January, 1)
						a_day := a_formatted_date.substring (2, 4).to_integer
						Result.add_days (a_day - 1)
					end
				elseif a_count = 5 and then a_hyphen = 0 and then a_formatted_date.is_integer and then is_implicit_century_set then -- YYDDD
					create Result.make ((implicit_century * 100) + a_formatted_date.substring (1, 2).to_integer, January, 1)
					a_day := a_formatted_date.substring (3, 5).to_integer
					Result.add_days (a_day - 1)
				else -- Calendar date
					if a_count = 6 and then a_hyphen = 0 and then a_formatted_date.is_integer and then is_implicit_century_set then -- YYMMDD
						a_year := a_formatted_date.substring (1, 2).to_integer + (100 * implicit_century)
						a_month := a_formatted_date.substring (3, 4).to_integer
						a_day := a_formatted_date.substring (5, 6).to_integer
						create Result.make (a_year, a_month, a_day)
					elseif a_count = 6 and then a_formatted_date.substring (1, 2).is_equal ("--") and then is_implicit_year_set then -- --MMDD
						a_month := a_formatted_date.substring (3, 4).to_integer
						a_day := a_formatted_date.substring (5, 6).to_integer
						create Result.make (implicit_year, a_month, a_day)
					elseif a_count = 5 and then a_hyphen = 1 and then
						is_implicit_century_set and then a_formatted_date.substring (2, 5).is_integer then -- -YYMM
						a_year := a_formatted_date.substring (2, 3).to_integer + (100 * implicit_century)
						a_month := a_formatted_date.substring (4, 5).to_integer
						create Result.make (a_year, a_month, 1)
					elseif a_count = 3 and then a_hyphen = 1 then -- -YY
						create Result.make ((implicit_century * 100) + a_formatted_date.substring (2, 3).to_integer, January, 1)
					else -- ---DD
						check
							implicit_month_and_year: a_count = 5 and then a_formatted_date.substring (1, 3).is_equal ("---")
								and then is_implicit_year_set and then is_implicit_month_set and then a_formatted_date.substring (4, 5).is_integer
						end
						create Result.make (implicit_year, implicit_month, a_formatted_date.substring (4, 5).to_integer)
					end
				end
			end
		ensure
			truncated_date_not_void: Result /= Void
		end

	is_ordinal_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid ordinal date (without sign or zone)?
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		local
			a_count, a_year_count, a_year: INTEGER
		do
			a_year_count := 4 + extra_year_digits
			a_count := a_formatted_date.count
			if a_count /= a_year_count + 3 then
				Result := are_truncated_representations_used
				if Result then
					if a_count = 4 then
						Result := is_implicit_year_set and then is_valid_year (implicit_year) and then a_formatted_date.index_of ('-', 1) = 1
						if Result then
							Result := a_formatted_date.substring (2,4).is_integer and then is_valid_day_of_year (a_formatted_date.substring (2, 4).to_integer, implicit_year)
						end
					elseif a_count = 5 then
						Result := is_implicit_century_set and then a_formatted_date.is_integer 
						if Result then
							a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, 2).to_integer + (100 * implicit_century))
							Result := is_valid_year (a_year)
							if Result then
								Result := is_valid_day_of_year (a_formatted_date.substring (3, 5).to_integer, a_year)
							end
						end
					end
				end
			else  -- complete or expanded representation
				Result := a_formatted_date.is_integer
				if Result then
					a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
					Result := is_valid_year (a_year)
					if Result then
						Result := is_valid_day_of_year (a_formatted_date.substring (a_year_count + 1, a_count).to_integer, a_year)
					end
				end
			end
		end

	string_to_ordinal_date_without_hyphen  (a_formatted_date: STRING): DT_DATE is
			--  Parsed version of `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			no_hyphen: a_formatted_date.index_of ('-', 1) = 0
			is_standard_date_without_hyphen (a_formatted_date)
		local
			a_count, a_year_count, a_year, a_day: INTEGER
		do
			a_year_count := 4 + extra_year_digits
			a_count := a_formatted_date.count
			if a_count /= a_year_count + 3 then
				if a_count = 4 then
					check
						leading_hyphen: a_formatted_date.item (1) = '-'
					end
					a_day := a_formatted_date.substring (2, 4).to_integer
					create Result.make (implicit_year, January, 1)
					Result.add_days (a_day - 1)
				else
					check
						count_is_five: a_count = 5
					end
					a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, 2).to_integer + (100 * implicit_century))
					a_day := a_formatted_date.substring (3, 5).to_integer
					create Result.make (a_year, January, 1)
					Result.add_days (a_day - 1)
				end
			else -- complete or expanded representation
				a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
				a_day := a_formatted_date.substring (a_year_count + 1, a_count).to_integer
				create Result.make (a_year, January, 1)
				Result.add_days (a_day - 1)
			end
		ensure
			ordinal_date_without_hyphen_not_void: Result /= Void
		end

	is_standard_week_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid standard week date (i.e. no truncated representation or sign)?
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			no_hyphen: a_formatted_date.index_of ('-', 1) = 0
		local
			a_count, a_year_count, a_year: INTEGER
			a_w: INTEGER
		do
			a_year_count := 4 + extra_year_digits
			a_count := a_formatted_date.count
			a_w := a_formatted_date.index_of ('W', 1)
			if a_w = 0 then a_w := a_formatted_date.index_of ('w', 1) end
			Result := a_w > 0 and then a_w <= a_year_count + 1
			if Result then
				if a_w < a_year_count + 1 then
					Result := False
				else
					Result := a_formatted_date.substring (1, a_w - 1).is_integer
					if Result then
						a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_w - 1).to_integer)
						Result := is_valid_year (a_year)
						if Result then
							Result := a_formatted_date.substring (a_w + 1, a_count).is_integer
							if Result then
								if a_count - a_w = 3 then
									Result := is_valid_week (a_formatted_date.substring (a_w + 1, a_count - 1).to_integer, a_year)
									if Result then
										Result := is_valid_week_day (a_formatted_date.substring (a_count, a_count).to_integer)
									end
								else
									Result := a_count - a_w = 2 and then reduced_precision_week_dates
									if Result then
										Result := is_valid_week (a_formatted_date.substring (a_w + 1, a_count).to_integer, a_year)
									end
								end
							end
						end
					end
				end
			end
		end

	string_to_standard_week_date (a_formatted_date: STRING): DT_DATE is
			--  Parsed version of `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			no_hyphen: a_formatted_date.index_of ('-', 1) = 0
			standard_week_date: is_standard_week_date (a_formatted_date)
		local
			a_count, a_year_count, a_year, a_week, a_day: INTEGER
			a_w: INTEGER
		do
			a_year_count := 4 + extra_year_digits
			a_w := a_formatted_date.index_of ('W', 1)
			if a_w = 0 then a_w := a_formatted_date.index_of ('w', 1) end
			a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_w - 1).to_integer)
			a_count := a_formatted_date.count
			if a_count - a_w = 3 then
				a_week := a_formatted_date.substring (a_w + 1, a_count - 1).to_integer
				a_day := a_formatted_date.substring (a_count, a_count).to_integer
				-- TODO
			else
				a_week := a_formatted_date.substring (a_w + 1, a_count).to_integer
				a_day := 1
				-- TODO				
			end
		end

	is_truncated_week_date (a_formatted_date: STRING; a_w_index: INTEGER): BOOLEAN is
			-- Is `a_formatted_date' a week date in truncated representation?
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			truncated_representations_allowed: are_truncated_representations_used
			w_index_in_range: a_w_index > 0 and then a_w_index < a_formatted_date.count
		local
			a_count, a_year: INTEGER
		do
			a_count := a_formatted_date.count
			if a_w_index = 3 then
				if is_implicit_century_set and then a_formatted_date.substring (1,2).is_integer then
					a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1,2).to_integer + (100 * implicit_century))
					Result := is_valid_year (a_year)
				elseif is_implicit_decade_set and then a_formatted_date.substring (2,2).is_integer and then a_formatted_date.item (1) = '-' then
					a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (2,2).to_integer + (10 * implicit_decade))
					Result := is_valid_year (a_year)
				else
					Result := False
				end
			elseif a_w_index = 2 then
				Result := is_implicit_year_set and then is_valid_year (implicit_year)
				a_year := implicit_year
			else
				Result := False
			end
			if Result then -- `a_year' is the (valid) year
				if a_count - a_w_index = 3 then -- wwD
					Result := a_formatted_date.substring (a_w_index + 1, a_count).is_integer
					if Result then
						Result := is_valid_week (a_formatted_date.substring (a_w_index + 1, a_count - 1).to_integer, a_year)
						if Result then
							Result := is_valid_week_day (a_formatted_date.substring (a_count, a_count).to_integer)
						end
					end
				elseif a_count - a_w_index = 2 then
					if a_formatted_date.item (a_w_index + 1) = '-' then
						Result := is_implicit_week_set and then is_valid_week (implicit_week, a_year) and then is_valid_week_day (a_formatted_date.substring (a_count, a_count).to_integer)
					else
						Result := is_valid_week (a_formatted_date.substring (a_w_index + 1, a_count - 1).to_integer, a_year)
						if Result then
							Result := is_valid_week_day (a_formatted_date.substring (a_count, a_count).to_integer)
						end
					end
				else
					Result := False
				end
			end
		end

	is_standard_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid standard date (i.e. no truncated representation or sign)?
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
		local
			a_hyphen, a_count, a_year, a_year_count, a_month: INTEGER
		do
			a_count := a_formatted_date.count
			a_year_count := 4 + extra_year_digits
			a_hyphen := a_formatted_date.index_of ('-', 1)
			if a_hyphen > 0 then
				Result := calendar_date_precision >= Specific_month
					and then a_hyphen = a_year_count + 1
					and then a_count = a_year_count + 3
				if Result then
					Result := a_formatted_date.substring (1, a_year_count).is_integer
					if Result then
						a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
						Result := is_valid_year (a_year)
						if Result then
							Result := a_formatted_date.substring (a_hyphen + 1, a_hyphen + 2).is_integer
							if Result then
								a_month := a_formatted_date.substring (a_hyphen + 1, a_hyphen + 2).to_integer
								Result := is_valid_month (a_month)
							end
						end
					end
				end
			else
				Result := is_standard_date_without_hyphen (a_formatted_date)
			end
		end

	string_to_standard_date (a_formatted_date: STRING): DT_DATE is
			--  Parsed version of `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			is_standard_date (a_formatted_date)
		local
			a_hyphen, a_count, a_year, a_month, a_year_count: INTEGER
		do
			a_count := a_formatted_date.count
			a_year_count := 4 + extra_year_digits
			a_hyphen := a_formatted_date.index_of ('-', 1)
			if a_hyphen > 0 then
				a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
				a_month := a_formatted_date.substring (a_hyphen + 1, a_hyphen + 2).to_integer
				create Result.make (a_year, a_month, 1)
			else
				Result := string_to_standard_date_without_hyphen (a_formatted_date)
			end
		ensure
			standard_date_not_void: Result /= Void
		end

	is_standard_date_without_hyphen (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid standard date without a hyphen?
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			no_hyphen: a_formatted_date.index_of ('-', 1) = 0
		local
			a_count, a_year_count, a_year, a_month, a_day: INTEGER
		do
			if a_formatted_date.index_of ('W', 1) > 0 or else a_formatted_date.index_of ('w', 1) > 0 then
				Result := is_standard_week_date (a_formatted_date)
			else
				a_count := a_formatted_date.count
				a_year_count := 4 + extra_year_digits
				if a_count = a_year_count + 3 then
					Result := is_ordinal_date (a_formatted_date)
				else
					Result := a_year_count <= a_count and then a_formatted_date.substring (1, a_year_count).is_integer
					if Result then
						a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
						Result := is_valid_year (a_year)
						if Result then
							if a_count = a_year_count then
								Result := calendar_date_precision >= Specific_year
							else
								Result := a_count = a_year_count + 4 -- reduced precision of year and month includes a hyphen
								if Result then
									Result := a_formatted_date.substring (a_year_count + 1, a_year_count + 2).is_integer
									if Result then
										a_month := a_formatted_date.substring (a_year_count + 1, a_year_count + 2).to_integer
										Result := is_valid_month (a_month)
										if Result then
											Result := a_formatted_date.substring (a_year_count + 3, a_year_count + 4).is_integer
											if Result then
												a_day := a_formatted_date.substring (a_year_count + 3, a_year_count + 4).to_integer
												Result := is_valid_day (a_day, a_month, a_year)
											end
										end
									end
								end
							end
						end
					elseif calendar_date_precision = Specific_century then
						Result := a_count = a_year_count - 2 and then a_formatted_date.substring (1, a_year_count - 2).is_integer
						if Result then
							a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count - 2).to_integer)
							Result := is_valid_year (a_year * 100)
						end
					end
				end
			end
		end

	string_to_standard_date_without_hyphen  (a_formatted_date: STRING): DT_DATE is
			--  Parsed version of `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			zoneless: not is_zoned_date (a_formatted_date)
			no_hyphen: a_formatted_date.index_of ('-', 1) = 0
			is_standard_date_without_hyphen (a_formatted_date)
		local
			a_count, a_year_count, a_year, a_month, a_day: INTEGER
		do
			if a_formatted_date.index_of ('W', 1) > 0 or else a_formatted_date.index_of ('w', 1) > 0 then
				Result := string_to_standard_week_date (a_formatted_date)
			else
				a_count := a_formatted_date.count
				a_year_count := 4 + extra_year_digits
				if a_count = a_year_count + 3 then
					Result := string_to_ordinal_date_without_hyphen (a_formatted_date)
				else
					if a_year = 0 then a_year := -1 end
					if a_count = a_year_count then
						a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
						create Result.make (a_year, January, 1)
					elseif a_count = a_year_count - 2 and then calendar_date_precision = Specific_century then
						a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count - 2).to_integer)					
						create Result.make (a_year * 100 , January, 1)
					else -- must be complete representation
						a_year := year_adjusted_for_negative_sign (a_formatted_date.substring (1, a_year_count).to_integer)
						a_month := a_formatted_date.substring (a_year_count + 1, a_year_count + 2).to_integer
						a_day := a_formatted_date.substring (a_year_count + 3, a_year_count + 4).to_integer
						create Result.make (a_year, a_month, a_day)
					end
				end
			end
		ensure
			standard_date_without_hyphen_not_void: Result /= Void
		end

	year_adjusted_for_negative_sign (a_year: INTEGER): INTEGER is
			-- Negative value for `a_year'
		require
			positive_year: a_year >= 0
		do
			if negative_sign_present then
				if is_year_zero_allowed then
					Result := 0 - a_year
				else
					Result := 1 - a_year
				end
			else
				Result := a_year
			end
		end

end
	
