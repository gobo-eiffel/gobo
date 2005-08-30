indexing

	description:

		"Objects that parse dates and times"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class DT_XSD_DATE_TIME_PARSER

inherit

	DT_DATE_TIME_PARSER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_CHARACTER_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant.
		do
			last_cached_date_string := ""
			last_cached_zoned_date_string := ""
			last_cached_time_string := ""
			last_cached_zoned_time_string := ""
			last_cached_date_time_string := ""
			last_cached_zoned_date_time_string := ""
		end

feature -- Access

	is_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid date?
		local
			a_date: STRING
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			a_year, a_month, a_day: INTEGER
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_date_string) then
					Result := True
					last_cached_date_string := a_formatted_date
				elseif a_formatted_date.count < 10 then
					Result := False
				else
					create a_splitter.make
					a_splitter.set_separators ("-")
					if a_formatted_date.item (1).is_equal ('-') then
						a_date := a_formatted_date.substring (2, a_formatted_date.count)
					else
						a_date := a_formatted_date
					end
					some_components := a_splitter.split_greedy (a_date)
					Result := some_components.count = 3
					if Result then
						a_year := year_ok (some_components.item (1))
						if a_year = 0 then
							Result := False
						else
							if a_formatted_date.item (1).is_equal ('-') then a_year := 1 - a_year end
							a_month := month_ok  (some_components.item (2))
							if a_month < January or else a_month > December then
								Result := False
							else
								a_day := day_ok  (some_components.item (3))
								if a_day > 0 and then a_day <= days_in_month (a_month, a_year) then
									create last_cached_date.make (a_year, a_month, a_day)
									last_cached_date_string := a_formatted_date
								else
									Result := False
								end
							end
						end
					end
				end
			end
		ensure then
			date_cached: Result implies last_cached_date /= Void
		end

	is_zoned_date (a_formatted_date: STRING): BOOLEAN is
			-- Is `a_formatted_date' a valid zoned date?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER 
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count).is_equal ('Z') then
					if a_formatted_date.count >= 11 then
						Result := is_date (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							create last_cached_zoned_date.make (last_cached_date, a_tz)
						end
					end
				elseif a_formatted_date.count >= 16 then
					if a_formatted_date.item (a_formatted_date.count - 2).is_equal (':') then
						if a_formatted_date.item (a_formatted_date.count - 5).is_equal ('+')
							or else a_formatted_date.item (a_formatted_date.count - 5).is_equal ('-') then
							a_count := a_formatted_date.substring (a_formatted_date.count - 4, a_formatted_date.count - 3)
							if CHARACTER_.is_digit (a_count.item (1)) and then CHARACTER_.is_digit (a_count.item (2)) then
								an_hour := a_count.to_integer
								Result := an_hour >= 0 and then an_hour <= 14
								if Result then
									a_count := a_formatted_date.substring (a_formatted_date.count - 1, a_formatted_date.count)
									if CHARACTER_.is_digit (a_count.item (1)) and then CHARACTER_.is_digit (a_count.item (2)) then
										a_minute := a_count.to_integer
										if an_hour = 14 then
											Result := a_minute = 0
										else
											Result := a_minute >= 0 and then a_minute <= 59
										end
										if Result then
											if a_formatted_date.item (a_formatted_date.count - 5).is_equal ('-') then
												an_hour := 0 - an_hour
												a_minute := 0 - a_minute
											end
											Result := is_date (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												create last_cached_zoned_date.make (last_cached_date, a_tz)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		ensure then
			date_cached: Result implies last_cached_zoned_date /= Void			
		end

	is_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid date-time?
		local
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
		do
			if not a_formatted_date_time.is_empty then
				if STRING_.same_string (a_formatted_date_time, last_cached_date_time_string) then
					Result := True
					last_cached_date_time_string := a_formatted_date_time
				elseif a_formatted_date_time.count < 19 then
					Result := False
				else
					create a_splitter.make
					a_splitter.set_separators ("T")
					some_components := a_splitter.split_greedy (a_formatted_date_time)
					Result := some_components.count = 2
					if Result then
						Result := is_date (some_components.item (1))
						if Result then
							Result := is_time (some_components.item (2))
						end
						if Result then
							last_cached_date_time_string := a_formatted_date_time
							create last_cached_date_time.make_from_date_time (last_cached_date, last_cached_time)
						end
					end
				end
			end
		ensure then
			date_time_cached: Result implies last_cached_date_time /= Void						
		end

	is_zoned_date_time (a_formatted_date_time: STRING): BOOLEAN is
			-- Is `a_formatted_date_time' a valid zoned date-time?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
		do
			if not a_formatted_date_time.is_empty then
				if STRING_.same_string (a_formatted_date_time, last_cached_zoned_date_time_string) then
					Result := True
					last_cached_zoned_date_time_string := a_formatted_date_time
				elseif a_formatted_date_time.item (a_formatted_date_time.count).is_equal ('Z') then
					if a_formatted_date_time.count >= 20 then
						Result := is_date_time (a_formatted_date_time.substring (1, a_formatted_date_time.count - 1))
						if Result then
							last_cached_zoned_date_time_string := a_formatted_date_time
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							create last_cached_zoned_date_time.make (last_cached_date_time, a_tz)
						end
					end
				elseif a_formatted_date_time.count >= 25 then
					if a_formatted_date_time.item (a_formatted_date_time.count - 2).is_equal (':') then
						if a_formatted_date_time.item (a_formatted_date_time.count - 5).is_equal ('+')
							or else a_formatted_date_time.item (a_formatted_date_time.count - 5).is_equal ('-') then
							a_count := a_formatted_date_time.substring (a_formatted_date_time.count - 4, a_formatted_date_time.count - 3)
							if CHARACTER_.is_digit (a_count.item (1)) and then CHARACTER_.is_digit (a_count.item (2)) then
								an_hour := a_count.to_integer
								Result := an_hour >= 0 and then an_hour <= 14
								if Result then
									a_count := a_formatted_date_time.substring (a_formatted_date_time.count - 1, a_formatted_date_time.count)
									if CHARACTER_.is_digit (a_count.item (1)) and then CHARACTER_.is_digit (a_count.item (2)) then
										a_minute := a_count.to_integer
										if an_hour = 14 then
											Result := a_minute = 0
										else
											Result := a_minute >= 0 and then a_minute <= 59
										end
										if Result then
											if a_formatted_date_time.item (a_formatted_date_time.count - 5).is_equal ('-') then
												an_hour := 0 - an_hour
												a_minute := 0 - a_minute
											end
											Result := is_date_time (a_formatted_date_time.substring (1, a_formatted_date_time.count - 6))
											if Result then
												last_cached_zoned_date_time_string := a_formatted_date_time
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												create last_cached_zoned_date_time.make (last_cached_date_time, a_tz)
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

	is_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid time?
		local
			a_splitter: ST_SPLITTER
			some_components, some_seconds: DS_LIST [STRING]
			an_hour, a_minute, a_second, a_millisecond: INTEGER
		do
			if not a_formatted_time.is_empty then
				if STRING_.same_string (a_formatted_time, last_cached_time_string) then
					Result := True
					last_cached_time_string := a_formatted_time
				elseif a_formatted_time.count < 8 then
					Result := False
				else
					create a_splitter.make
					a_splitter.set_separators (":")
					some_components := a_splitter.split_greedy (a_formatted_time)
					Result := some_components.count = 3
					if Result then
						Result := False -- until proved `True'
						if some_components.item (1).count = 2 and then CHARACTER_.is_digit (some_components.item (1).item (1)) and then CHARACTER_.is_digit (some_components.item (1).item (2)) then
							an_hour := some_components.item (1).to_integer
							Result := an_hour >= 0 and then an_hour <= 24
							if Result then
								Result := False -- until proved `True'
								if  some_components.item (2).count = 2 and then CHARACTER_.is_digit (some_components.item (2).item (1)) and then CHARACTER_.is_digit (some_components.item (2).item (2)) then
									a_minute := some_components.item (2).to_integer
									Result := a_minute >= 0 and then a_minute <= 59
									if Result then
										Result := False -- until proved `True'
										a_splitter.set_separators (".")
										some_seconds := a_splitter.split_greedy (some_components.item (3))
										if some_seconds.count = 1 or else some_seconds.count = 2 then
											if some_seconds.item (1).count = 2 and then CHARACTER_.is_digit (some_seconds.item (1).item (1)) and then CHARACTER_.is_digit (some_seconds.item (1).item (2)) then
												a_second := some_seconds.item (1).to_integer
												Result := a_second >= 0 and then a_second <= 59
												if Result then
													if some_seconds.count = 2 then
														Result := some_seconds.item (2).is_integer and then not some_seconds.item (2).item (1).is_equal ('-')
														if Result then a_millisecond := milliseconds (some_seconds.item (2)) end
														if Result and then an_hour = 24 then Result := a_minute = 0 and then a_second = 0 and then a_millisecond = 0 end
													end
													if Result then
														if an_hour = 24 then an_hour := 0 end
														create last_cached_time.make_precise (an_hour, a_minute, a_second, a_millisecond)
														last_cached_time_string := a_formatted_time
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		ensure then
			time_cached: Result implies last_cached_time /= Void			
		end

	is_zoned_time (a_formatted_time: STRING): BOOLEAN is
			-- Is `a_formatted_time' a valid zoned time?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER 
		do
			if not a_formatted_time.is_empty then
				if STRING_.same_string (a_formatted_time, last_cached_zoned_time_string) then
					Result := True
					last_cached_zoned_time_string := a_formatted_time
				elseif a_formatted_time.item (a_formatted_time.count).is_equal ('Z') then
					if a_formatted_time.count >= 9 then
						Result := is_time (a_formatted_time.substring (1, a_formatted_time.count - 1))
						if Result then
							last_cached_zoned_time_string := a_formatted_time
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							create last_cached_zoned_time.make (last_cached_time, a_tz)
						end
					end
				elseif a_formatted_time.count >= 14 then
					if a_formatted_time.item (a_formatted_time.count - 2).is_equal (':') then
						if a_formatted_time.item (a_formatted_time.count - 5).is_equal ('+')
							or else a_formatted_time.item (a_formatted_time.count - 5).is_equal ('-') then
							a_count := a_formatted_time.substring (a_formatted_time.count - 4, a_formatted_time.count - 3)
							if CHARACTER_.is_digit (a_count.item (1)) and then CHARACTER_.is_digit (a_count.item (2)) then
								an_hour := a_count.to_integer
								Result := an_hour >= 0 and then an_hour <= 14
								if Result then
									a_count := a_formatted_time.substring (a_formatted_time.count - 1, a_formatted_time.count)
									if CHARACTER_.is_digit (a_count.item (1)) and then CHARACTER_.is_digit (a_count.item (2)) then
										a_minute := a_count.to_integer
										if an_hour = 14 then
											Result := a_minute = 0
										else
											Result := a_minute >= 0 and then a_minute <= 59
										end
										if Result then
											if a_formatted_time.item (a_formatted_time.count - 5).is_equal ('-') then
												an_hour := 0 - an_hour
												a_minute := 0 - a_minute
											end
											Result := is_time (a_formatted_time.substring (1, a_formatted_time.count - 6))
											if Result then
												last_cached_zoned_time_string := a_formatted_time
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												create last_cached_zoned_time.make (last_cached_time, a_tz)
											end
										end
									end
								end
							end
						end
					end					
				end
			end
		ensure then
			time_cached: Result implies last_cached_zoned_time /= Void			
		end

feature -- Conversion

	string_to_date (a_formatted_date: STRING): DT_DATE is
			-- Parsed date from `a_formatted_date'
		local
			valid: BOOLEAN
		do
			if a_formatted_date = last_cached_date_string then
				Result := last_cached_date
			else
				valid := is_date (a_formatted_date)
				check
					valid: valid
					-- from pre-condition
				end
				Result := last_cached_date
			end
		end

	string_to_zoned_date (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE is
			-- Parsed date from `a_formatted_date'
		local
			valid: BOOLEAN
		do
			if a_formatted_date = last_cached_zoned_date_string then
				Result := last_cached_zoned_date
			else
				valid := is_zoned_date (a_formatted_date)
				check
					valid: valid
					-- from pre-condition
				end
				Result := last_cached_zoned_date
			end
		end

	string_to_date_time (a_formatted_date_time: STRING): DT_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		local
				valid: BOOLEAN
		do
			if a_formatted_date_time = last_cached_date_time_string then
				Result := last_cached_date_time
			else
				valid := is_date_time (a_formatted_date_time)
				check
					valid: valid
					-- from pre-condition
				end
				Result := last_cached_date_time
			end
		end

	string_to_zoned_date_time (a_formatted_date_time: STRING): DT_FIXED_OFFSET_ZONED_DATE_TIME is
			-- Parsed date-time from `a_formatted_date_time'
		local
			valid: BOOLEAN
		do
			if a_formatted_date_time = last_cached_zoned_date_time_string then
				Result := last_cached_zoned_date_time
			else
				valid := is_zoned_date_time (a_formatted_date_time)
				check
					valid: valid
					-- from pre-condition
				end
				Result := last_cached_zoned_date_time
			end	
		end

	string_to_time (a_formatted_time: STRING): DT_TIME is
			-- Parsed time from `a_formatted_time'
		local
			valid: BOOLEAN
		do
			if a_formatted_time = last_cached_time_string then
				Result := last_cached_time
			else
				valid := is_time (a_formatted_time)
				check
					valid: valid
					-- from pre-condition
				end
				Result := last_cached_time
			end
		end

	string_to_zoned_time (a_formatted_time: STRING): DT_FIXED_OFFSET_ZONED_TIME is
			-- Parsed time from `a_formatted_time'
		local
			valid: BOOLEAN
		do
			if a_formatted_time = last_cached_zoned_time_string then
				Result := last_cached_zoned_time
			else
				valid := is_zoned_time (a_formatted_time)
				check
					valid: valid
					-- from pre-condition
				end
				Result := last_cached_zoned_time
			end
		end

feature {NONE} -- Implementation

	last_cached_date_string: STRING
			-- Last string validated by `is_date'

	last_cached_date: DT_DATE
			-- Last date validated by `is_date'

	last_cached_zoned_date_string: STRING
			-- Last string validated by `is_zoned_date'

	last_cached_zoned_date: DT_FIXED_OFFSET_ZONED_DATE
			-- Last date validated by `is_zoned_date'

	last_cached_time_string: STRING
			-- Last string validated by `is_time'

	last_cached_time: DT_TIME
			-- Last date validated by `is_time'

	last_cached_zoned_time_string: STRING
			-- Last string validated by `is_zoned_time'

	last_cached_zoned_time: DT_FIXED_OFFSET_ZONED_TIME
			-- Last time validated by `is_zoned_time'

	last_cached_date_time_string: STRING
			-- Last string validated by `is_date_time'

	last_cached_date_time: DT_DATE_TIME
			-- Last time validated by `is_date_time'

	last_cached_zoned_date_time_string: STRING
			-- Last string validated by `is_zoned_date_time'

	last_cached_zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Last time validated by `is_zoned_date_time'

	year_ok (a_year: STRING): INTEGER is
			-- Validated year number, or zero
		require
			year_not_empty: a_year /= Void and then not a_year.is_empty
		do
			if a_year.item (1).is_equal ('+') then
				Result := 0
			elseif not a_year.is_integer or else a_year.is_equal ("0000") then
				Result := 0
			elseif a_year.count < 4 then
				Result := 0
			elseif a_year.count > 4 and then a_year.item (1).is_equal ('0') then
				Result := 0
			else
				Result := a_year.to_integer
			end
		end

	month_ok (a_month: STRING): INTEGER is
			-- Validated month number, or zero
		require
			month_not_empty: a_month /= Void and then not a_month.is_empty
		do
			if a_month.count /= 2 then
				Result := 0
			elseif a_month.item (1).is_equal ('+') then
				Result := 0
			elseif not a_month.is_integer then
				Result := 0
			else
				Result := a_month.to_integer
			end
		end

	day_ok (a_day: STRING): INTEGER is
			-- Validated day number, or zero
		require
			day_not_empty: a_day /= Void and then not a_day.is_empty
		do
			if a_day.count /= 2 then
				Result := 0
			elseif a_day.item (1).is_equal ('+') then
				Result := 0
			elseif not a_day.is_integer then
				Result := 0
			else
				Result := a_day.to_integer
			end
		end

	milliseconds (some_milliseconds: STRING): INTEGER is
			-- Number of milliseconds in `some_millseconds'
		require
			not_negative: not some_milliseconds.item (1).is_equal ('-')
			integral: some_milliseconds.is_integer
		local
			a_count: STRING
			a_digit: INTEGER
		do
			if some_milliseconds.count > 3 then a_digit := some_milliseconds.substring (4,4).to_integer end
			a_count := some_milliseconds; a_count.keep_head (3)
			from until a_count.count = 3 loop
				a_count.append_character ('0')
			end
			Result := a_count.to_integer
			if a_digit > 4 then Result := Result + 1 end -- round up
		ensure
			positive_result: Result >= 0
		end

invariant

	last_cached_date_string_exists: last_cached_date_string /= Void
	last_cached_date_exists: not last_cached_date_string.is_empty implies last_cached_date /= Void
	last_cached_zoned_date_string_exists: last_cached_zoned_date_string /= Void
	last_cached_zoned_date_exists: not last_cached_zoned_date_string.is_empty implies last_cached_zoned_date /= Void
	last_cached_time_string_exists: last_cached_time_string /= Void
	last_cached_time_exists: not last_cached_time_string.is_empty implies last_cached_time /= Void
	last_cached_zoned_time_string_exists: last_cached_zoned_time_string /= Void
	last_cached_zoned_time_exists: not last_cached_zoned_time_string.is_empty implies last_cached_zoned_time /= Void
	last_cached_date_time_string_exists: last_cached_date_time_string /= Void
	last_cached_date_time_exists: not last_cached_date_time_string.is_empty implies last_cached_date_time /= Void
	last_cached_zoned_date_time_string_exists: last_cached_zoned_date_time_string /= Void
	last_cached_zoned_date_time_exists: not last_cached_zoned_date_time_string.is_empty implies last_cached_zoned_date_time /= Void

end
