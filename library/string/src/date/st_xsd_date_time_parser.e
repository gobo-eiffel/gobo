note

	description:

		"XSD dates and times parsers"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2004-2022, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_XSD_DATE_TIME_PARSER

inherit

	ST_DATE_TIME_PARSER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_IMPORTED_CHARACTER_ROUTINES
		export {NONE} all end

create

	make_1_0,
	make_1_1

feature {NONE} -- Initialization

	make_1_0
			-- Create with XML Schema 1.0 rules.
		do
			last_cached_date_string := ""
			last_cached_zoned_date_string := ""
			last_cached_time_string := ""
			last_cached_zoned_time_string := ""
			last_cached_date_time_string := ""
			last_cached_zoned_date_time_string := ""
		ensure
			year_xero_is_not_valid: not is_year_zero_valid
		end

	make_1_1
			-- Create with XML Schema 1.1 rules.
		do
			last_cached_date_string := ""
			last_cached_zoned_date_string := ""
			last_cached_time_string := ""
			last_cached_zoned_time_string := ""
			last_cached_date_time_string := ""
			last_cached_zoned_date_time_string := ""
			is_year_zero_valid := True
		ensure
			year_xero_is_valid: is_year_zero_valid
		end

feature -- Access

	is_date (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid date?
		local
			a_date: STRING
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			a_year, a_month, a_day: INTEGER
			is_negative: BOOLEAN
			a_year_result: DS_PAIR [BOOLEAN, INTEGER]
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
					if a_formatted_date.item (1) = '-' then
						is_negative := True
						a_date := a_formatted_date.substring (2, a_formatted_date.count)
					else
						a_date := a_formatted_date
					end
					some_components := a_splitter.split_greedy (a_date)
					Result := some_components.count = 3
					if Result then
						a_year_result := year_ok (some_components.item (1), is_negative)
						if not a_year_result.first then
							Result := False
						else
							a_year := a_year_result.second
							a_month := month_ok (some_components.item (2))
							if a_month < January or else a_month > December then
								Result := False
							else
								a_day := day_ok (some_components.item (3))
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

	is_zoned_date (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned date?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date: like last_cached_date
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count) = 'Z' then
					if a_formatted_date.count >= 11 then
						Result := is_date (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date := last_cached_date
							check
									-- condition `is_date (...)' ensures with its postcondition `date_cached'
									-- that last_cached_date is not Void
								is_date: l_date /= Void
							then
								create last_cached_zoned_date.make (l_date, a_tz)
							end
						end
					end
				elseif a_formatted_date.count >= 16 then
					if a_formatted_date.item (a_formatted_date.count - 2) = ':' then
						if
							a_formatted_date.item (a_formatted_date.count - 5) = '+' or else
							a_formatted_date.item (a_formatted_date.count - 5) = '-'
						then
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
											if a_formatted_date.item (a_formatted_date.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_date (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date := last_cached_date
												check
														-- condition `is_date (...)' ensures with its postcondition `date_cached'
														-- that last_cached_date is not Void
													is_date: l_date /= Void
												then
													create last_cached_zoned_date.make (l_date, a_tz)
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
			date_cached: Result implies last_cached_zoned_date /= Void
		end

	is_date_time (a_formatted_date_time: STRING): BOOLEAN
			-- Is `a_formatted_date_time' a valid date-time?
		local
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			l_date: like last_cached_date
			l_time: like last_cached_time
			l_date_time: like last_cached_date_time
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
						Result := is_date (some_components.item (1)) and then
									is_time (some_components.item (2))
						if Result then
							last_cached_date_time_string := a_formatted_date_time
							l_date := last_cached_date
							l_time := last_cached_time
							check
									-- condition `is_date (...)' ensures with its postcondition `date_cached'
									-- that last_cached_date is not Void
								is_date: l_date /= Void
									-- condition `is_time (...)' ensures with its postcondition `time_cached'
									-- that last_cached_time is not Void
								is_time: l_time /= Void
							then
								create l_date_time.make_from_date_time (l_date, l_time)
								last_cached_date_time := l_date_time
								if last_time_carry then
									l_date_time.add_days (1)
								end
							end
						end
					end
				end
			end
		ensure then
			date_time_cached: Result implies last_cached_date_time /= Void
		end

	is_zoned_date_time (a_formatted_date_time: STRING): BOOLEAN
			-- Is `a_formatted_date_time' a valid zoned date-time?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date_time: like last_cached_date_time
		do
			if not a_formatted_date_time.is_empty then
				if STRING_.same_string (a_formatted_date_time, last_cached_zoned_date_time_string) then
					Result := True
					last_cached_zoned_date_time_string := a_formatted_date_time
				elseif a_formatted_date_time.item (a_formatted_date_time.count) = 'Z' then
					if a_formatted_date_time.count >= 20 then
						Result := is_date_time (a_formatted_date_time.substring (1, a_formatted_date_time.count - 1))
						if Result then
							last_cached_zoned_date_time_string := a_formatted_date_time
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date_time := last_cached_date_time
							check
									-- condition `is_date_time (...)' ensures with its postcondition `date_time_cached'
									-- that last_cached_date_time is not Void
								is_date_time: l_date_time /= Void
							then
								create last_cached_zoned_date_time.make (l_date_time, a_tz)
							end
						end
					end
				elseif a_formatted_date_time.count >= 25 then
					if a_formatted_date_time.item (a_formatted_date_time.count - 2) = ':' then
						if
							a_formatted_date_time.item (a_formatted_date_time.count - 5) = '+' or else
							a_formatted_date_time.item (a_formatted_date_time.count - 5) = '-'
						then
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
											if a_formatted_date_time.item (a_formatted_date_time.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_date_time (a_formatted_date_time.substring (1, a_formatted_date_time.count - 6))
											if Result then
												last_cached_zoned_date_time_string := a_formatted_date_time
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date_time := last_cached_date_time
												check
														-- condition `is_date_time (...)' ensures with its postcondition `date_time_cached'
														-- that last_cached_date_time is not Void
														is_date_time: l_date_time /= Void
												then
													create last_cached_zoned_date_time.make (l_date_time, a_tz)
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

	is_time (a_formatted_time: STRING): BOOLEAN
			-- Is `a_formatted_time' a valid time?
		local
			a_splitter: ST_SPLITTER
			some_components, some_seconds: DS_LIST [STRING]
			an_hour, a_minute, a_second, a_millisecond: INTEGER
		do
			last_time_carry := False
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
							-- until proved `True'
						Result := False
						if some_components.item (1).count = 2 and then CHARACTER_.is_digit (some_components.item (1).item (1)) and then CHARACTER_.is_digit (some_components.item (1).item (2)) then
							an_hour := some_components.item (1).to_integer
							Result := an_hour >= 0 and then an_hour <= 24
							if Result then
									-- until proved `True'
								Result := False
								if some_components.item (2).count = 2 and then CHARACTER_.is_digit (some_components.item (2).item (1)) and then CHARACTER_.is_digit (some_components.item (2).item (2)) then
									a_minute := some_components.item (2).to_integer
									Result := a_minute >= 0 and then a_minute <= 59
									if Result then
											-- until proved `True'
										Result := False
										a_splitter.set_separators (".")
										some_seconds := a_splitter.split_greedy (some_components.item (3))
										if some_seconds.count = 1 or else some_seconds.count = 2 then
											if some_seconds.item (1).count = 2 and then CHARACTER_.is_digit (some_seconds.item (1).item (1)) and then CHARACTER_.is_digit (some_seconds.item (1).item (2)) then
												a_second := some_seconds.item (1).to_integer
												Result := a_second >= 0 and then a_second <= 59
												if Result then
													if some_seconds.count = 2 then
														Result := some_seconds.item (2).is_integer and then some_seconds.item (2).item (1) /= '-'
														if Result then
															a_millisecond := milliseconds (some_seconds.item (2))
														end
														if Result and then an_hour = 24 then
															Result := a_minute = 0 and then a_second = 0 and then a_millisecond = 0
															last_time_carry := True
														end
													end
													if Result then
														if an_hour = 24 then
															an_hour := 0
															last_time_carry := True
														end
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

	is_zoned_time (a_formatted_time: STRING): BOOLEAN
			-- Is `a_formatted_time' a valid zoned time?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_time: like last_cached_time
		do
			if not a_formatted_time.is_empty then
				if STRING_.same_string (a_formatted_time, last_cached_zoned_time_string) then
					Result := True
					last_cached_zoned_time_string := a_formatted_time
				elseif a_formatted_time.item (a_formatted_time.count) = 'Z' then
					if a_formatted_time.count >= 9 then
						Result := is_time (a_formatted_time.substring (1, a_formatted_time.count - 1))
						if Result then
							last_cached_zoned_time_string := a_formatted_time
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_time := last_cached_time
							check
									-- condition `is_time (...)' ensures with its postcondition `time_cached'
									-- that last_cached_time is not Void
								is_time: l_time /= Void
							then
								create last_cached_zoned_time.make (l_time, a_tz)
							end
						end
					end
				elseif a_formatted_time.count >= 14 then
					if a_formatted_time.item (a_formatted_time.count - 2) = ':' then
						if
							a_formatted_time.item (a_formatted_time.count - 5) = '+' or else
							a_formatted_time.item (a_formatted_time.count - 5) = '-'
						then
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
											if a_formatted_time.item (a_formatted_time.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_time (a_formatted_time.substring (1, a_formatted_time.count - 6))
											if Result then
												last_cached_zoned_time_string := a_formatted_time
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_time := last_cached_time
												check
														-- condition `is_time (...)' ensures with its postcondition `time_cached'
														-- that last_cached_time is not Void
													is_time: l_time /= Void
												then
													create last_cached_zoned_time.make (l_time, a_tz)
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
			time_cached: Result implies last_cached_zoned_time /= Void
		end

	is_year_month (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid gYearMonth?
		require
			formatted_date_not_void: a_formatted_date /= Void
		local
			a_date: STRING
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			a_year, a_month: INTEGER
			is_negative: BOOLEAN
			a_year_result: DS_PAIR [BOOLEAN, INTEGER]
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_date_string) then
					Result := True
					last_cached_date_string := a_formatted_date
				elseif a_formatted_date.count < 7 then
					Result := False
				else
					create a_splitter.make
					a_splitter.set_separators ("-")
					if a_formatted_date.item (1) = '-' then
						a_date := a_formatted_date.substring (2, a_formatted_date.count)
						is_negative := True
					else
						a_date := a_formatted_date
					end
					some_components := a_splitter.split_greedy (a_date)
					Result := some_components.count = 2
					if Result then
						a_year_result := year_ok (some_components.item (1), is_negative)
						if not a_year_result.first then
							Result := False
						else
							a_year := a_year_result.second
							a_month := month_ok (some_components.item (2))
							if a_month < January or else a_month > December then
								Result := False
							else
								create last_cached_date.make (a_year, a_month, 1)
								last_cached_date_string := a_formatted_date
							end
						end
					end
				end
			end
		ensure
			zoneless: Result implies not is_zoned_year_month (a_formatted_date)
			year_month_cached: Result implies last_cached_date /= Void
		end

	is_zoned_year_month (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned gYearMonth?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date: like last_cached_date
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count) = 'Z' then
					if a_formatted_date.count >= 8 then
						Result := is_year_month (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date := last_cached_date
							check
									-- condition `is_year_month (...)' ensures with its postcondition `year_month_cached'
									-- that last_cached_date is not Void
								is_year_month: l_date /= Void
							then
								create last_cached_zoned_date.make (l_date, a_tz)
							end
						end
					end
				elseif a_formatted_date.count >= 13 then
					if a_formatted_date.item (a_formatted_date.count - 2) = ':' then
						if
							a_formatted_date.item (a_formatted_date.count - 5) = '+' or else
							a_formatted_date.item (a_formatted_date.count - 5) = '-'
						then
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
											if a_formatted_date.item (a_formatted_date.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_year_month (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date := last_cached_date
												check
														-- condition `is_year_month (...)' ensures with its postcondition `year_month_cached'
														-- that last_cached_date is not Void
													is_year_month: l_date /= Void
												then
													create last_cached_zoned_date.make (l_date, a_tz)
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
		ensure
			year_month_cached: Result implies last_cached_zoned_date /= Void
		end

	is_year (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid gYear?
		require
			formatted_date_not_void: a_formatted_date /= Void
		local
			a_date: STRING
			a_year: INTEGER
			is_negative: BOOLEAN
			a_year_result: DS_PAIR [BOOLEAN, INTEGER]
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_date_string) then
					Result := True
					last_cached_date_string := a_formatted_date
				elseif a_formatted_date.count < 4 then
					Result := False
				else
					if a_formatted_date.item (1) = '-' then
						a_date := a_formatted_date.substring (2, a_formatted_date.count)
						is_negative := True
					else
						a_date := a_formatted_date
					end
					a_year_result := year_ok (a_date, is_negative)
					if not a_year_result.first then
						Result := False
					else
						a_year := a_year_result.second
						Result := True
						create last_cached_date.make (a_year, 1, 1)
						last_cached_date_string := a_formatted_date
					end
				end
			end
		ensure
			zoneless: Result implies not is_zoned_year (a_formatted_date)
			year_cached: Result implies last_cached_date /= Void
		end

	is_zoned_year (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned gYear?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date: like last_cached_date
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count) = 'Z' then
					if a_formatted_date.count >= 5 then
						Result := is_year (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date := last_cached_date
							check
									-- condition `is_year (...)' ensures with its postcondition `year_cached'
									-- that last_cached_date is not Void
								is_year: l_date /= Void
							then
								create last_cached_zoned_date.make (l_date, a_tz)
							end
						end
					end
				elseif a_formatted_date.count >= 10 then
					if a_formatted_date.item (a_formatted_date.count - 2) = ':' then
						if
							a_formatted_date.item (a_formatted_date.count - 5) = '+' or else
							a_formatted_date.item (a_formatted_date.count - 5) = '-'
						then
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
											if a_formatted_date.item (a_formatted_date.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_year (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date := last_cached_date
												check
														-- condition `is_year (...)' ensures with its postcondition `year_cached'
														-- that last_cached_date is not Void
													is_year: l_date /= Void
												then
													create last_cached_zoned_date.make (l_date, a_tz)
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
		ensure
			year_cached: Result implies last_cached_zoned_date /= Void
		end

	is_month_day (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid gMonthDay?
		require
			formatted_date_not_void: a_formatted_date /= Void
		local
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			a_month, a_day: INTEGER
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_date_string) then
					Result := True
					last_cached_date_string := a_formatted_date
				elseif a_formatted_date.count = 7 then
					create a_splitter.make_with_separators ("-")
					some_components := a_splitter.split_greedy (a_formatted_date)
					Result := some_components.count = 4 and then some_components.item (1).is_empty and then some_components.item (2).is_empty
					if Result then
						a_month := month_ok (some_components.item (3))
						if a_month = 0 then
							Result := False
						else
							a_day := day_ok (some_components.item (4))
							if a_day = 0 then
								Result := False
							else
								create last_cached_date.make (1, a_month, a_day)
								last_cached_date_string := a_formatted_date
							end
						end
					end
				end
			end
		ensure
			zoneless: Result implies not is_zoned_month_day (a_formatted_date)
			month_day_cached: Result implies last_cached_date /= Void
		end

	is_zoned_month_day (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned gMonthDay?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date: like last_cached_date
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count) = 'Z' then
					if a_formatted_date.count = 8 then
						Result := is_month_day (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date := last_cached_date
							check
									-- condition `is_month_day (...)' ensures with its postcondition `month_day_cached'
									-- that last_cached_date is not Void
								is_month_day: l_date /= Void
							then
								create last_cached_zoned_date.make (l_date, a_tz)
							end
						end
					end
				elseif a_formatted_date.count = 13 then
					if a_formatted_date.item (a_formatted_date.count - 2) = ':' then
						if
							a_formatted_date.item (a_formatted_date.count - 5) = '+' or else
							a_formatted_date.item (a_formatted_date.count - 5) = '-'
						then
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
											if a_formatted_date.item (a_formatted_date.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_month_day (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date := last_cached_date
												check
														-- condition `is_month_day (...)' ensures with its postcondition `month_day_cached'
														-- that last_cached_date is not Void
													is_month_day: l_date /= Void
												then
													create last_cached_zoned_date.make (l_date, a_tz)
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
		ensure
			month_day_cached: Result implies last_cached_zoned_date /= Void
		end

	is_day (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid gDay?
		require
			formatted_date_not_void: a_formatted_date /= Void
		local
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			a_day: INTEGER
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_date_string) then
					Result := True
					last_cached_date_string := a_formatted_date
				elseif a_formatted_date.count = 5 then
					create a_splitter.make_with_separators ("-")
					some_components := a_splitter.split_greedy (a_formatted_date)
					Result := some_components.count = 4 and then some_components.item (1).is_empty and then
						some_components.item (2).is_empty and then some_components.item (3).is_empty
					if Result then
						a_day := day_ok (some_components.item (4))
						if a_day = 0 then
							Result := False
						else
							create last_cached_date.make (1, 1, a_day)
							last_cached_date_string := a_formatted_date
						end
					end
				end
			end
		ensure
			zoneless: Result implies not is_zoned_day (a_formatted_date)
			day_cached: Result implies last_cached_date /= Void
		end

	is_zoned_day (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned gDay?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date: like last_cached_date
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count) = 'Z' then
					if a_formatted_date.count = 6 then
						Result := is_day (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date := last_cached_date
							check
									-- condition `is_day (...)' ensures with its postcondition `day_cached'
									-- that last_cached_date is not Void
								is_day: l_date /= Void
							then
								create last_cached_zoned_date.make (l_date, a_tz)
							end
						end
					end
				elseif a_formatted_date.count = 11 then
					if a_formatted_date.item (a_formatted_date.count - 2) = ':' then
						if
							a_formatted_date.item (a_formatted_date.count - 5) = '+' or else
							a_formatted_date.item (a_formatted_date.count - 5) = '-'
						then
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
											if a_formatted_date.item (a_formatted_date.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_day (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date := last_cached_date
												check
														-- condition `is_day (...)' ensures with its postcondition `day_cached'
														-- that last_cached_date is not Void
													is_day: l_date /= Void
												then
													create last_cached_zoned_date.make (l_date, a_tz)
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
		ensure
			day_cached: Result implies last_cached_zoned_date /= Void
		end

	is_month (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid gMonth?
		require
			formatted_date_not_void: a_formatted_date /= Void
		local
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			a_month: INTEGER
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_date_string) then
					Result := True
					last_cached_date_string := a_formatted_date
				elseif a_formatted_date.count = 4 then
					create a_splitter.make_with_separators ("-")
					some_components := a_splitter.split_greedy (a_formatted_date)
					Result := some_components.count = 3 and then some_components.item (1).is_empty and then some_components.item (2).is_empty
					if Result then
						a_month := month_ok (some_components.item (3))
						if a_month = 0 then
							Result := False
						else
							create last_cached_date.make (1, a_month, 1)
							last_cached_date_string := a_formatted_date
						end
					end
				end
			end
		ensure
			zoneless: Result implies not is_zoned_month (a_formatted_date)
			month_cached: Result implies last_cached_date /= Void
		end

	is_zoned_month (a_formatted_date: STRING): BOOLEAN
			-- Is `a_formatted_date' a valid zoned gMonth?
		local
			a_count: STRING
			a_tz: DT_FIXED_OFFSET_TIME_ZONE
			an_hour, a_minute: INTEGER
			l_date: like last_cached_date
		do
			if not a_formatted_date.is_empty then
				if STRING_.same_string (a_formatted_date, last_cached_zoned_date_string) then
					Result := True
					last_cached_zoned_date_string := a_formatted_date
				elseif a_formatted_date.item (a_formatted_date.count) = 'Z' then
					if a_formatted_date.count = 5 then
						Result := is_month (a_formatted_date.substring (1, a_formatted_date.count - 1))
						if Result then
							last_cached_zoned_date_string := a_formatted_date
							create a_tz.make_named_hours_minutes ("Z", 0, 0)
							l_date := last_cached_date
							check
									-- condition `is_month (...)' ensures with its postcondition `month_cached'
									-- that last_cached_date is not Void
								is_month: l_date /= Void
							then
								create last_cached_zoned_date.make (l_date, a_tz)
							end
						end
					end
				elseif a_formatted_date.count = 10 then
					if a_formatted_date.item (a_formatted_date.count - 2) = ':' then
						if
							a_formatted_date.item (a_formatted_date.count - 5) = '+' or else
							a_formatted_date.item (a_formatted_date.count - 5) = '-'
						then
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
											if a_formatted_date.item (a_formatted_date.count - 5) = '-' then
												an_hour := -an_hour
												a_minute := -a_minute
											end
											Result := is_month (a_formatted_date.substring (1, a_formatted_date.count - 6))
											if Result then
												last_cached_zoned_date_string := a_formatted_date
												if an_hour = 0 and then a_minute = 0 then
													create a_tz.make_named_hours_minutes ("Z", 0, 0)
												else
													create a_tz.make_hours_minutes (an_hour, a_minute)
												end
												l_date := last_cached_date
												check
														-- condition `is_month (...)' ensures with its postcondition `month_cached'
														-- that last_cached_date is not Void
													is_month: l_date /= Void
												then
													create last_cached_zoned_date.make (l_date, a_tz)
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
		ensure
			month_cached: Result implies last_cached_zoned_date /= Void
		end

feature -- Status_report

	is_year_zero_valid: BOOLEAN
			-- Is "0000" a lexically valid year?

feature -- Conversion

	string_to_date (a_formatted_date: STRING): DT_DATE
			-- Parsed date from `a_formatted_date'
		local
			valid: BOOLEAN
			l_date: like last_cached_date
		do
			if a_formatted_date = last_cached_date_string then
				l_date := last_cached_date
				check
						-- implied by `last_cached_date_string /= Void' and invariant `last_cached_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_date (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_date
				check
						-- condition `is_date (...)' ensures with its postcondition `date_cached'
						-- that last_cached_date is not Void
					is_date: l_date /= Void
				then
					Result := l_date
				end
			end
		end

	string_to_zoned_date (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed date from `a_formatted_date'
		local
			valid: BOOLEAN
			l_date: like last_cached_zoned_date
		do
			if a_formatted_date = last_cached_zoned_date_string then
				l_date := last_cached_zoned_date
				check
						-- `last_cached_zoned_date_string /= Void' and invariant `last_cached_zoned_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_zoned_date (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_zoned_date
				check
						-- condition `is_zoned_date (...)' ensures with its postcondition `zoned_date_cached'
						-- that last_cached_zoned_date is not Void
					is_zoned_date: l_date /= Void
				then
					Result := l_date
				end
			end
		end

	string_to_date_time (a_formatted_date_time: STRING): DT_DATE_TIME
			-- Parsed date-time from `a_formatted_date_time'
		local
			valid: BOOLEAN
			l_date_time: like last_cached_date_time
		do
			if a_formatted_date_time = last_cached_date_time_string then
				l_date_time := last_cached_date_time
				check
						-- `last_cached_date_time_string /= Void' and invariant `last_cached_date_time_not_void'
					cached_date_time_not_void: l_date_time /= Void
				then
					Result := l_date_time
				end
			else
				valid := is_date_time (a_formatted_date_time)
				check
						-- From precondition.
					valid: valid
				end
				l_date_time := last_cached_date_time
				check
						-- condition `is_date_time (...)' ensures with its postcondition `date_time_cached'
						-- that last_cached_date_time is not Void
					is_date_time: l_date_time /= Void
				then
					Result := l_date_time
				end
			end
		end

	string_to_zoned_date_time (a_formatted_date_time: STRING): DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Parsed date-time from `a_formatted_date_time'
		local
			valid: BOOLEAN
			l_date_time: like last_cached_zoned_date_time
		do
			if a_formatted_date_time = last_cached_zoned_date_time_string then
				l_date_time := last_cached_zoned_date_time
				check
						-- `last_cached_zoned_date_time_string /= Void' and invariant `last_cached_zoned_date_time_not_void'
					cached_date_time_not_void: l_date_time /= Void
				then
					Result := l_date_time
				end
			else
				valid := is_zoned_date_time (a_formatted_date_time)
				check
						-- From precondition.
					valid: valid
				end
				l_date_time := last_cached_zoned_date_time
				check
						-- condition `is_zoned_date_time (...)' ensures with its postcondition `zoned_date_time_cached'
						-- that last_cached_zoned_date_time is not Void
					is_zoned_date_time: l_date_time /= Void
				then
					Result := l_date_time
				end
			end
		end

	string_to_time (a_formatted_time: STRING): DT_TIME
			-- Parsed time from `a_formatted_time'
		local
			valid: BOOLEAN
			l_time: like last_cached_time
		do
			if a_formatted_time = last_cached_time_string then
				l_time := last_cached_time
				check
						-- `last_cached_time_string /= Void' and invariant `last_cached_time_not_void'
					cached_time_not_void: l_time /= Void
				then
					Result := l_time
				end
			else
				valid := is_time (a_formatted_time)
				check
						-- From precondition.
					valid: valid
				end
				l_time := last_cached_time
				check
						-- condition `is_time (...)' ensures with its postcondition `time_cached'
						-- that last_cached_time is not Void
					is_time: l_time /= Void
				then
					Result := l_time
				end
			end
		end

	string_to_zoned_time (a_formatted_time: STRING): DT_FIXED_OFFSET_ZONED_TIME
			-- Parsed time from `a_formatted_time'
		local
			valid: BOOLEAN
			l_time: like last_cached_zoned_time
		do
			if a_formatted_time = last_cached_zoned_time_string then
				l_time := last_cached_zoned_time
				check
						-- `last_cached_zoned_time_string /= Void' and invariant `last_cached_zoned_time_not_void'
					cached_time_not_void: l_time /= Void
				then
					Result := l_time
				end
			else
				valid := is_zoned_time (a_formatted_time)
				check
						-- From precondition.
					valid: valid
				end
				l_time := last_cached_zoned_time
				check
						-- condition `is_zoned_time (...)' ensures with its postcondition `zoned_time_cached'
						-- that last_cached_zoned_time is not Void
					is_zoned_time: l_time /= Void
				then
					Result := l_time
				end
			end
		end

	string_to_year_month (a_formatted_date: STRING): DT_DATE
			-- Parsed gYearMonth from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_year_month_string: is_year_month (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_date
		do
			if a_formatted_date = last_cached_date_string then
				l_date := last_cached_date
				check
						-- `last_cached_date_string /= Void' and invariant `last_cached_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_year_month (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_date
				check
						-- condition `is_year_month (...)' ensures with its postcondition `year_month_cached'
						-- that last_cached_date is not Void
					is_year_month: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			year_month_not_void: Result /= Void
			day_is_one: Result.day = 1
		end

	string_to_zoned_year_month (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed gYearMonth from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_zoned_date_string: is_zoned_year_month (a_formatted_date)
			date_string_not_altered_since_call_to_is_zoned_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_zoned_date
		do
			if a_formatted_date = last_cached_zoned_date_string then
				l_date := last_cached_zoned_date
				check
						-- `last_cached_zoned_date_string /= Void' and invariant `last_cached_zoned_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_zoned_year_month (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_zoned_date
				check
						-- condition `is_zoned_year_month (...)' ensures with its postcondition `year_month_cached'
						-- that last_cached_date is not Void
					is_zoned_year_month: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			zoned_year_month_not_void: Result /= Void
		end

	string_to_year (a_formatted_date: STRING): DT_DATE
			-- Parsed gYear from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_year_string: is_year (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_date
		do
			if a_formatted_date = last_cached_date_string then
				l_date := last_cached_date
				check
						-- `last_cached_date_string /= Void' and invariant `last_cached_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_year (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_date
				check
						-- condition `is_year (...)' ensures with its postcondition `year_cached'
						-- that last_cached_date is not Void
					is_year: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			year_not_void: Result /= Void
			month_is_one: Result.month = 1
			day_is_one: Result.day = 1
		end

	string_to_zoned_year (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed gYear from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_zoned_date_string: is_zoned_year (a_formatted_date)
			date_string_not_altered_since_call_to_is_zoned_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_zoned_date
		do
			if a_formatted_date = last_cached_zoned_date_string then
				l_date := last_cached_zoned_date
				check
						-- `last_cached_zoned_date_string /= Void' and invariant `last_cached_zoned_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_zoned_year (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_zoned_date
				check
						-- condition `is_zoned_year (...)' ensures with its postcondition `year_cached'
						-- that last_cached_date is not Void
					is_zoned_year: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			zoned_year_not_void: Result /= Void
		end

	string_to_month_day (a_formatted_date: STRING): DT_DATE
			-- Parsed gMonthDay from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_month_day_string: is_month_day (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_date
		do
			if a_formatted_date = last_cached_date_string then
				l_date := last_cached_date
				check
						-- `last_cached_date_string /= Void' and invariant `last_cached_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_month_day (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_date
				check
						-- condition `is_month_day (...)' ensures with its postcondition `month_day_cached'
						-- that last_cached_date is not Void
					is_month_day: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			month_day_not_void: Result /= Void
			year_is_one: Result.year = 1
		end

	string_to_zoned_month_day (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed gMonthDay from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_month_day_string: is_zoned_month_day (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_zoned_date
		do
			if a_formatted_date = last_cached_zoned_date_string then
				l_date := last_cached_zoned_date
				check
						-- `last_cached_zoned_date_string /= Void' and invariant `last_cached_zoned_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_zoned_month_day (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_zoned_date
				check
						-- condition `is_zoned_month_day (...)' ensures with its postcondition `month_day_cached'
						-- that last_cached_date is not Void
					is_zoned_month_day: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			zoned_month_day_not_void: Result /= Void
		end

	string_to_day (a_formatted_date: STRING): DT_DATE
			-- Parsed gDay from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_day_string: is_day (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_date
		do
			if a_formatted_date = last_cached_date_string then
				l_date := last_cached_date
				check
						-- `last_cached_date_string /= Void' and invariant `last_cached_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_day (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_date
				check
						-- condition `is_day (...)' ensures with its postcondition `day_cached'
						-- that last_cached_date is not Void
					is_day: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			day_not_void: Result /= Void
			year_is_one: Result.year = 1
			month_is_one: Result.month = 1
		end

	string_to_zoned_day (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed gMonthDay from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_day_string: is_zoned_day (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_zoned_date
		do
			if a_formatted_date = last_cached_zoned_date_string then
				l_date := last_cached_zoned_date
				check
						-- `last_cached_zoned_date_string /= Void' and invariant `last_cached_zoned_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_zoned_day (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_zoned_date
				check
						-- condition `is_zoned_day (...)' ensures with its postcondition `day_cached'
						-- that last_cached_date is not Void
					is_zoned_day: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			zoned_day_not_void: Result /= Void
		end

	string_to_month (a_formatted_date: STRING): DT_DATE
			-- Parsed gMonth from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_month_string: is_month (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_date
		do
			if a_formatted_date = last_cached_date_string then
				l_date := last_cached_date
				check
						-- `last_cached_date_string /= Void' and invariant `last_cached_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_month (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_date
				check
						-- condition `is_month (...)' ensures with its postcondition `month_cached'
						-- that last_cached_date is not Void
					is_month: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			month_not_void: Result /= Void
			year_is_one: Result.year = 1
			day_is_one: Result.day = 1
		end

	string_to_zoned_month (a_formatted_date: STRING): DT_FIXED_OFFSET_ZONED_DATE
			-- Parsed gMonthMonth from `a_formatted_date'
		require
			formatted_date_not_void: a_formatted_date /= Void
			valid_month_string: is_zoned_month (a_formatted_date)
			date_string_not_altered_since_call_to_is_date: True
		local
			valid: BOOLEAN
			l_date: like last_cached_zoned_date
		do
			if a_formatted_date = last_cached_zoned_date_string then
				l_date := last_cached_zoned_date
				check
						-- `last_cached_zoned_date_string /= Void' and invariant `last_cached_zoned_date_not_void'
					cached_date_not_void: l_date /= Void
				then
					Result := l_date
				end
			else
				valid := is_zoned_month (a_formatted_date)
				check
						-- From precondition.
					valid: valid
				end
				l_date := last_cached_zoned_date
				check
						-- condition `is_zoned_month (...)' ensures with its postcondition `month_cached'
						-- that last_cached_date is not Void
					is_zoned_month: l_date /= Void
				then
					Result := l_date
				end
			end
		ensure
			zoned_month_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	last_cached_date_string: STRING
			-- Last string validated by `is_date'

	last_cached_date: detachable DT_DATE
			-- Last date validated by `is_date'

	last_cached_zoned_date_string: STRING
			-- Last string validated by `is_zoned_date'

	last_cached_zoned_date: detachable DT_FIXED_OFFSET_ZONED_DATE
			-- Last date validated by `is_zoned_date'

	last_cached_time_string: STRING
			-- Last string validated by `is_time'

	last_cached_time: detachable DT_TIME
			-- Last date validated by `is_time'

	last_time_carry: BOOLEAN
			-- Does `last_cached_time' include a 24-hour carry?

	last_cached_zoned_time_string: STRING
			-- Last string validated by `is_zoned_time'

	last_cached_zoned_time: detachable DT_FIXED_OFFSET_ZONED_TIME
			-- Last time validated by `is_zoned_time'

	last_cached_date_time_string: STRING
			-- Last string validated by `is_date_time'

	last_cached_date_time: detachable DT_DATE_TIME
			-- Last time validated by `is_date_time'

	last_cached_zoned_date_time_string: STRING
			-- Last string validated by `is_zoned_date_time'

	last_cached_zoned_date_time: detachable DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Last time validated by `is_zoned_date_time'

	year_ok (a_year: STRING; is_negative: BOOLEAN): DS_PAIR [BOOLEAN, INTEGER]
			-- Validated year number (0 = 1 BCE, -1 = 2 BCE etc.);
			-- Note: `a_year' may be altered.
		require
			a_year_not_void: a_year /= Void
			a_year_not_empty: not a_year.is_empty
		local
			a_count, a_year_number: INTEGER
		do
			a_count := a_year.count
			STRING_.left_adjust (a_year)
			STRING_.right_adjust (a_year)
			if a_year.count /= a_count then
				create Result.make (False, 0)
			elseif a_year.item (1) = '+' then
				create Result.make (False, 0)
			elseif not a_year.is_integer or else (STRING_.same_string (a_year, "0000") and then not is_year_zero_valid) then
				create Result.make (False, 0)
			elseif a_year.count < 4 then
				create Result.make (False, 0)
			elseif a_year.count > 4 and then a_year.item (1) = '0' then
				create Result.make (False, 0)
			else
				a_year_number := a_year.to_integer
				if is_negative then
					if is_year_zero_valid then
						create Result.make (True, 0 - a_year_number)
					else
						create Result.make (True, 1 - a_year_number)
					end
				else
					create Result.make (True, a_year_number)
				end
			end
		end

	month_ok (a_month: STRING): INTEGER
			-- Validated month number, or zero;
			-- Note: `a_month' may be altered.
		require
			a_month_not_void: a_month /= Void
			a_month_not_empty: not a_month.is_empty
		local
			a_count: INTEGER
		do
			a_count := a_month.count
			STRING_.left_adjust (a_month)
			STRING_.right_adjust (a_month)
			if a_month.count /= a_count then
				Result := 0
			elseif a_month.count /= 2 then
				Result := 0
			elseif a_month.item (1) = '+' then
				Result := 0
			elseif not a_month.is_integer then
				Result := 0
			else
				Result := a_month.to_integer
			end
		end

	day_ok (a_day: STRING): INTEGER
			-- Validated day number, or zero;
			-- Note: `a_day' may be altered.
		require
			a_day_not_void: a_day /= Void
			a_day_not_empty: not a_day.is_empty
		local
			a_count: INTEGER
		do
			a_count := a_day.count
			STRING_.left_adjust (a_day)
			STRING_.right_adjust (a_day)
			if a_day.count /= a_count then
				Result := 0
			elseif a_day.count /= 2 then
				Result := 0
			elseif a_day.item (1) = '+' then
				Result := 0
			elseif not a_day.is_integer then
				Result := 0
			else
				Result := a_day.to_integer
			end
		end

	milliseconds (some_milliseconds: STRING): INTEGER
			-- Number of milliseconds in `some_millseconds',
			-- Note: `some_milliseconds' may be altered.
		require
			some_milliseconds_not_void: some_milliseconds /= Void
			some_milliseconds_not_empty: not some_milliseconds.is_empty
			not_negative: some_milliseconds.item (1) /= '-'
			integral: some_milliseconds.is_integer
		local
			a_count: STRING
			a_digit: INTEGER
		do
			if some_milliseconds.count > 3 then
				a_digit := (some_milliseconds.code (4) - ('0').natural_32_code).to_integer_32
			end
			a_count := some_milliseconds
			a_count.keep_head (3)
			from
			until
				a_count.count = 3
			loop
				a_count.append_character ('0')
			end
			Result := a_count.to_integer
			if a_digit > 4 then
					-- Round up.
				Result := Result + 1
			end
		ensure
			milliseconds_not_negative: Result >= 0
		end

invariant

	last_cached_date_string_not_void: last_cached_date_string /= Void
	last_cached_date_not_void: not last_cached_date_string.is_empty implies last_cached_date /= Void
	last_cached_zoned_date_string_not_void: last_cached_zoned_date_string /= Void
	last_cached_zoned_date_not_void: not last_cached_zoned_date_string.is_empty implies last_cached_zoned_date /= Void
	last_cached_time_string_not_void: last_cached_time_string /= Void
	last_cached_time_not_void: not last_cached_time_string.is_empty implies last_cached_time /= Void
	last_cached_zoned_time_string_not_void: last_cached_zoned_time_string /= Void
	last_cached_zoned_time_not_void: not last_cached_zoned_time_string.is_empty implies last_cached_zoned_time /= Void
	last_cached_date_time_string_not_void: last_cached_date_time_string /= Void
	last_cached_date_time_not_void: not last_cached_date_time_string.is_empty implies last_cached_date_time /= Void
	last_cached_zoned_date_time_string_not_void: last_cached_zoned_date_time_string /= Void
	last_cached_zoned_date_time_not_void: not last_cached_zoned_date_time_string.is_empty implies last_cached_zoned_date_time /= Void

end
