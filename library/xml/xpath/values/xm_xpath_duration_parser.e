indexing

	description:

		"Parser for ISO 8601 extended format duration values, and XPath specializations"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DURATION_PARSER

inherit

	ANY

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Implementation

	make is
			-- Nothing to do.
		do
		end

feature -- Access

	is_duration (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent an xs:duration?
		require
			duration_exists: a_duration /= Void
		local
			a_pattern: STRING
		do
			a_pattern := a_duration
			STRING_.left_adjust (a_pattern)
			STRING_.right_adjust (a_pattern)
			last_parsed_duration := Void
			if not a_pattern.is_empty then
				if a_pattern.item (1).is_equal ('-') then
					is_negative := True
					Result := is_absolute_duration (a_pattern.substring (2, a_pattern.count))
				else
					is_negative := False
					Result := is_absolute_duration (a_pattern)
				end
			end
			if Result then last_parsed_duration := a_pattern end
		end

	is_months_duration (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent an xdt:yearMonthDuration?
		require
			duration_exists: a_duration /= Void
		local
			a_pattern: STRING
		do
			a_pattern := a_duration
			STRING_.left_adjust (a_pattern)
			STRING_.right_adjust (a_pattern)
			if not a_pattern.is_empty then
				if a_pattern.item (1).is_equal ('-') then
					is_negative := True
					Result := is_absolute_months_duration (a_pattern.substring (2, a_pattern.count))
				else
					is_negative := False
					Result := is_absolute_months_duration (a_pattern)
				end
			end
			if Result then last_parsed_duration := a_pattern end
		end

	is_seconds_duration (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent an xdt:dayTimeDuration?
		require
			duration_exists: a_duration /= Void
		local
			a_pattern: STRING
		do
			a_pattern := a_duration
			STRING_.left_adjust (a_pattern)
			STRING_.right_adjust (a_pattern)
			if not a_pattern.is_empty then
				if a_pattern.item (1).is_equal ('-') then
					is_negative := True
					Result := is_absolute_seconds_duration (a_pattern.substring (2, a_pattern.count))
				else
					is_negative := False
					Result := is_absolute_seconds_duration (a_pattern)
				end
			end
			if Result then last_parsed_duration := a_pattern end
		end

feature -- Conversion

	string_to_duration (a_duration: STRING): DT_DATE_TIME_DURATION is
			-- Parsed signed duration from `a_duration'
		require
			valid_duration: a_duration /= Void and then is_duration (a_duration)
		local
			a_pattern: STRING
			a_dummy: BOOLEAN
		do
			a_pattern := a_duration
			STRING_.left_adjust (a_pattern)
			STRING_.right_adjust (a_pattern)
			if not STRING_.same_string (a_pattern, last_parsed_duration) then
				a_dummy := is_duration (a_duration)
				check
					good_duration: a_dummy = True
					-- from pre-condition
					result_cached: STRING_.same_string (a_pattern, last_parsed_duration)
				end
			end
			Result := last_cached_duration
		ensure
			result_not_void: Result /= Void
		end

	string_to_months_duration (a_duration: STRING): DT_DATE_TIME_DURATION is
			-- Parsed signed xdt:yearMonthDuration from `a_duration'
		require
			valid_duration: a_duration /= Void and then is_months_duration (a_duration)
		local
			a_pattern: STRING
			a_dummy: BOOLEAN
		do
			a_pattern := a_duration
			STRING_.left_adjust (a_pattern)
			STRING_.right_adjust (a_pattern)
			if not STRING_.same_string (a_pattern, last_parsed_duration) then
				a_dummy := is_months_duration (a_duration)
				check
					good_duration: a_dummy = True
					-- from pre-condition
					result_cached: STRING_.same_string (a_pattern, last_parsed_duration)
				end
			end
			Result := last_cached_duration
		ensure
			result_not_void: Result /= Void
		end

	string_to_seconds_duration (a_duration: STRING): DT_DATE_TIME_DURATION is
			-- Parsed signed xdt:dayTimeDuration from `a_duration'
		require
			valid_duration: a_duration /= Void and then is_seconds_duration (a_duration)
		local
			a_pattern: STRING
			a_dummy: BOOLEAN
		do
			a_pattern := a_duration
			STRING_.left_adjust (a_pattern)
			STRING_.right_adjust (a_pattern)
			if not STRING_.same_string (a_pattern, last_parsed_duration) then
				a_dummy := is_seconds_duration (a_duration)
				check
					good_duration: a_dummy = True
					-- from pre-condition
					result_cached: STRING_.same_string (a_pattern, last_parsed_duration)
				end
			end
			Result := last_cached_duration
		ensure
			result_not_void: Result /= Void
		end

feature {NONE} -- Implementation

	last_parsed_duration: STRING
			-- Last sucessfully parsed duration

	last_cached_duration: DT_DATE_TIME_DURATION
			-- Cached result from sucessfull call to `is_duration', `is_months_duration' or `is_seconds_duration'

	is_negative: BOOLEAN
			-- is current parsed-duration negative

	any_designator_found: BOOLEAN
			-- Has a designator been found?

	current_year, current_month, current_day, current_hour, current_minute: INTEGER
			-- Values stored during parsing

	is_absolute_duration (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xs:duration?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index: INTEGER
		do
			if not a_duration.is_empty then
				Result := a_duration.item (1).is_equal ('P')
				if Result then
					current_year := 0
					any_designator_found := False
					an_index := a_duration.index_of ('Y', 1)
					if an_index > 0 then
						a_string := a_duration.substring (2, an_index - 1)
						Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
						if Result then
							any_designator_found := True
							current_year := a_string.to_integer
							if is_negative then current_year := 0 - current_year end
							Result := is_duration_after_year (a_duration.substring (an_index + 1, a_duration.count))
						end
					else
						Result := is_duration_after_year (a_duration.substring (2, a_duration.count))
					end
				end
			end
		end

	is_absolute_months_duration (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xdt:yearMonthDuration?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index: INTEGER
		do
			if not a_duration.is_empty then
				Result := a_duration.item (1).is_equal ('P')
				if Result then
					current_year := 0
					any_designator_found := False
					an_index := a_duration.index_of ('Y', 1)
					if an_index > 0 then
						a_string := a_duration.substring (2, an_index - 1)
						Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
						if Result then
							any_designator_found := True
							current_year := a_string.to_integer
							if is_negative then current_year := 0 - current_year end
							Result := is_months_duration_after_year (a_duration.substring (an_index + 1, a_duration.count))
						end
					else
						Result := is_months_duration_after_year (a_duration.substring (2, a_duration.count))
					end
				end
			end
		end

	is_absolute_seconds_duration (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xdt:dayTimeDuration?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index: INTEGER
		do
			if not a_duration.is_empty then
				Result := a_duration.item (1).is_equal ('P')
				if Result then
					current_year := 0; current_month := 0; current_day := 0
					any_designator_found := False
					an_index := a_duration.index_of ('D', 1)
					if an_index > 0 then
						a_string := a_duration.substring (2, an_index - 1)
						Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
						if Result then
							any_designator_found := True
							current_day := a_string.to_integer
							if is_negative then current_day := 0 - current_day end
							Result := is_duration_after_day (a_duration.substring (an_index + 1, a_duration.count))
						end
					else
						Result := is_duration_after_day (a_duration.substring (2, a_duration.count))
					end
				end
			end
		end

	is_duration_after_year (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xs:duration following optional Y designator?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index, a_time_designator: INTEGER			
		do
			if a_duration.is_empty then
				Result := any_designator_found
				if Result then
					create last_cached_duration.make (current_year, 0, 0, 0, 0, 0)
				end
			else
				current_month := 0
				an_index := a_duration.index_of ('M', 1)
				a_time_designator := a_duration.index_of ('T', 1)

				-- M can also occur after T, in which case it designates minutes

				if an_index > 0 and then a_time_designator = 0 or else an_index < a_time_designator then
					a_string := a_duration.substring (1, an_index - 1)
					Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
					if Result then
						any_designator_found := True
						current_month := a_string.to_integer
						if is_negative then current_month := 0 - current_month end
						Result := is_duration_after_month (a_duration.substring (an_index + 1, a_duration.count))
					end
				else
					Result := is_duration_after_month (a_duration.substring (1, a_duration.count))
				end
			end
		end

	is_months_duration_after_year (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xdt:yearMonthDuration following optional Y designator?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index, a_time_designator: INTEGER			
		do
			if a_duration.is_empty then
				Result := any_designator_found
				if Result then
					create last_cached_duration.make (current_year, 0, 0, 0, 0, 0)
				end
			else
				current_month := 0
				an_index := a_duration.index_of ('M', 1)
				if an_index > 0 then
					a_string := a_duration.substring (1, an_index - 1)
					Result := an_index = a_duration.count and then a_string.is_integer and then a_string.index_of ('-', 1) = 0
					if Result then
						current_month := a_string.to_integer
						if is_negative then current_month := 0 - current_month end
						create last_cached_duration.make (current_year, current_month, 0, 0, 0, 0)					
					end
				end
			end
		end

	is_duration_after_month (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xs:duration following optional M designator?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index: INTEGER			
		do
			if a_duration.is_empty then
				Result := any_designator_found
				if Result then
					create last_cached_duration.make (current_year, current_month, 0, 0, 0, 0)
				end
			else
				current_day := 0
				an_index := a_duration.index_of ('D', 1)
				if an_index > 0 then
					a_string := a_duration.substring (1, an_index - 1)
					Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
					if Result then
						any_designator_found := True
						current_day := a_string.to_integer
						if is_negative then current_day := 0 - current_day end
						Result := is_duration_after_day (a_duration.substring (an_index + 1, a_duration.count))
					end
				else
					Result := is_duration_after_day (a_duration.substring (1, a_duration.count))
				end
			end
		end

	is_duration_after_day (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xs:duration following optional D designator?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index: INTEGER			
		do
			if a_duration.is_empty then
				Result := any_designator_found
				if Result then
					create last_cached_duration.make (current_year, current_month, current_day, 0, 0, 0)
				end
			else
				current_hour := 0
				Result := a_duration.index_of ('T', 1) = 1 and then a_duration.count > 1
				if Result then
					an_index := a_duration.index_of ('H', 1)
					if an_index > 0 then
						a_string := a_duration.substring (2, an_index - 1)
						Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
						if Result then
							any_designator_found := True
							current_hour := a_string.to_integer
							if is_negative then current_hour := 0 - current_hour end
							Result := is_duration_after_hour (a_duration.substring (an_index + 1, a_duration.count))
						end
					else
						Result := is_duration_after_hour (a_duration.substring (2, a_duration.count))
					end
				end
			end
		end

	is_duration_after_hour (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xs:duration following optional H designator?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index: INTEGER			
		do
			if a_duration.is_empty then
				Result := any_designator_found
				if Result then
					create last_cached_duration.make (current_year, current_month, current_day, current_hour, 0, 0)
				end
			else
				current_minute := 0
				an_index := a_duration.index_of ('M', 1)
				if an_index > 0 then
					a_string := a_duration.substring (1, an_index - 1)
					Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
					if Result then
						any_designator_found := True
						current_minute := a_string.to_integer
						if is_negative then current_minute := 0 - current_minute end
						Result := is_duration_after_minute (a_duration.substring (an_index + 1, a_duration.count))
					end
				else
					Result := is_duration_after_minute (a_duration.substring (1, a_duration.count))
				end
			end
		end

	is_duration_after_minute (a_duration: STRING): BOOLEAN is
			-- Does `a_duration' represent a positive xs:duration following optional M designator?
		require
			duration_exists: a_duration /= Void
		local
			a_string: STRING
			an_index, a_count, a_second, a_millisecond, a_round_digit: INTEGER
			a_splitter: ST_SPLITTER
			some_components: DS_LIST [STRING]
			round_up_needed: BOOLEAN
		do
			if a_duration.is_empty then
				Result := any_designator_found
				if Result then
					create last_cached_duration.make (current_year, current_month, current_day, current_hour, current_minute, 0)
				end
			else
				an_index := a_duration.index_of ('S', 1)
				Result := an_index = a_duration.count
				if Result then
					a_string := a_duration.substring (1, an_index - 1)
					create a_splitter.make; a_splitter.set_separators (".")
					some_components := a_splitter.split_greedy (a_string)
					a_count := some_components.count
					Result := a_count = 1 or else a_count = 2
					if Result then
						a_string := some_components.item (1)
						Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
						if Result then
							a_second := a_string.to_integer
							if is_negative then a_second := 0 - a_second end
							if a_count = 2 then
								a_string := some_components.item (2)
								Result := a_string.is_integer and then a_string.index_of ('-', 1) = 0
								if a_string.count > 3 then
									a_round_digit := a_string.substring (4, 4).to_integer
									a_string := a_string.substring (1, 3)
								end
								a_millisecond := a_string.to_integer
								if a_round_digit > 4 then a_millisecond := a_millisecond + 1 end
								create last_cached_duration.make_precise (current_year, current_month, current_day, current_hour, current_minute, a_second, a_millisecond)
							else
								create last_cached_duration.make (current_year, current_month, current_day, current_hour, current_minute, a_second)
							end
						end
					end
				end
			end
		end

end
	
