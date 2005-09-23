indexing

	description:

		"Objects that represent XPath xs:dateTime values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_DATE_TIME_VALUE

inherit

	XM_XPATH_CALENDAR_VALUE
		redefine
			is_date_time_value, as_date_time_value, hash_code
		end

create

	make, make_from_date_time, make_from_zoned_date_time, make_from_date, make_from_zoned_date

feature {NONE} -- Initialization

	make (a_lexical_date_time: STRING) is
			-- Create from lexical xs:dateTime.
		require
			lexical_date_time: a_lexical_date_time /= Void and then is_date_time (a_lexical_date_time)
		local
			a_date_time_parser: DT_XSD_DATE_TIME_PARSER
		do
			make_atomic_value
			create a_date_time_parser.make
			if a_date_time_parser.is_zoned_date_time (a_lexical_date_time) then
				zoned := True
				zoned_date_time := a_date_time_parser.string_to_zoned_date_time (a_lexical_date_time)				
			else
				local_date_time := a_date_time_parser.string_to_date_time (a_lexical_date_time)
			end
			if not zoned then set_depends_upon_implicit_timezone end
		end

	make_from_date_time (a_date_time: DT_DATE_TIME) is
			-- Create from date_time object.
		require
			date_time_exists: a_date_time /= Void
		do
			make_atomic_value
			local_date_time := a_date_time
			set_depends_upon_implicit_timezone
		end

	make_from_zoned_date_time (a_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME) is
			-- Create from date_time object.
		require
			date_time_exists: a_date_time /= Void
		do
			make_atomic_value
			zoned_date_time := a_date_time
			zoned := True
		end

	make_from_date (a_date: DT_DATE) is
			-- Create from date object.
		require
			date_exists: a_date /= Void
		do
			make_atomic_value
			create local_date_time.make_from_date (a_date)
			set_depends_upon_implicit_timezone
		end

	make_from_zoned_date (a_date: DT_FIXED_OFFSET_ZONED_DATE) is
			-- Create from date_time object.
		require
			date_exists: a_date /= Void
		do
			make_atomic_value
			create zoned_date_time.make_from_zoned_date (a_date)
			zoned := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where know
		do
			Result := type_factory.date_time_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		local
			a_date_time_parser: DT_XSD_DATE_TIME_FORMAT
		do
			create a_date_time_parser.make
			if zoned then
				Result := a_date_time_parser.zoned_date_time_to_string (zoned_date_time)
			else
				Result := a_date_time_parser.date_time_to_string (local_date_time)
			end
		end

	as_zoneless: XM_XPATH_DATE_TIME_VALUE is
			-- Same value as `Current', but without a time zone
		do
			if zoned then
				create Result.make_from_date_time (zoned_date_time.date_time)
			else
				Result := Current
			end
		ensure
			result_not_void: Result /= Void
		end

	to_another_time_zone (an_offset: XM_XPATH_SECONDS_DURATION_VALUE): XM_XPATH_DATE_TIME_VALUE is
			-- Same dateTime as `Current', but in `a_time_zone'
		require
			time_zone_exists: an_offset /= Void
		local
			a_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_zoned_dt: DT_FIXED_OFFSET_ZONED_DATE_TIME
			a_dt: DT_DATE_TIME
		do
			create a_zone.make (an_offset.duration)
			if not zoned then
				create a_zoned_dt.make (local_date_time, a_zone)
				create Result.make_from_zoned_date_time (a_zoned_dt)
			else
				a_dt := a_zone.date_time_from (zoned_date_time.date_time, zoned_date_time.time_zone)
				create a_zoned_dt.make (a_dt, a_zone)
				create Result.make_from_zoned_date_time (a_zoned_dt)
			end
		ensure
			result_not_void: Result /= Void
		end

	zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
			-- Zoned date_time value

	local_date_time: DT_DATE_TIME
			-- Date_Time value without zone

	date: DT_DATE is
			-- Date component, ignoring time zone
		do
			if zoned then
				Result := zoned_date_time.zoned_date.date
			else
				Result := local_date_time.date
			end
		ensure
			result_not_void: Result /= Void
		end

	time: DT_TIME is
			-- Time component, ignoring time zone
		do
			if zoned then
				Result := zoned_date_time.zoned_time.time
			else
				Result := local_date_time.time
			end
		ensure
			result_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			if zoned_date_time = Void then
				Result := local_date_time.hash_code
			else
				
				-- Equality implies same `hash_code', but
				--  not vice-versa:

				Result := utc_date_time.hash_code + zoned_date_time.time_zone.fixed_offset.hash_code
			end
		end

	implicitly_zoned_date_time (a_context: XM_XPATH_CONTEXT): DT_DATE_TIME is
			-- Date_Time adjusted to UTC via implicit time zone
		do
			Result := a_context.implicit_timezone.date_time_to_utc (local_date_time)
		end

	utc_date_time: DT_DATE_TIME is
			-- Date_Time adjusted to UTC
		do
			if cached_utc_date_time /= Void then
				Result := cached_utc_date_time
			else
				cached_utc_date_time := zoned_date_time.date_time_to_utc
				Result := cached_utc_date_time
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_date_time_value then
				if zoned then
					Result := other.as_date_time_value.zoned
						and then utc_date_time.three_way_comparison (other.as_date_time_value.utc_date_time) = 0
				else
					Result := not other.as_date_time_value.zoned
						and then local_date_time.three_way_comparison (other.as_date_time_value.local_date_time) = 0
				end
			end
		end
	
	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Comparison of `Current' to `other'
		local
			a_date_time: XM_XPATH_DATE_TIME_VALUE
			dt1, dt2: DT_DATE_TIME
		do
			a_date_time := other.as_date_time_value
			if zoned = a_date_time.zoned then
				if zoned then
					create dt2.make_from_date_time (a_date_time.zoned_date_time.date_time.date, a_date_time.zoned_date_time.date_time.time)
					a_date_time.zoned_date_time.time_zone.convert_to_utc (dt2)
					create dt1.make_from_date_time (zoned_date_time.date_time.date, zoned_date_time.date_time.time)
					zoned_date_time.time_zone.convert_to_utc (dt1)
					Result := dt1.three_way_comparison (dt2)
				else
					create dt2.make_from_date_time (a_date_time.local_date_time.date, a_date_time.local_date_time.time)
					create dt1.make_from_date_time (local_date_time.date, local_date_time.time)
					Result := dt1.three_way_comparison (dt2)
				end
 			elseif zoned then
				create dt2.make_from_date_time (a_date_time.local_date_time.date, a_date_time.local_date_time.time)
				a_context.implicit_timezone.convert_to_utc (dt2)
				create dt1.make_from_date_time (zoned_date_time.date_time.date, zoned_date_time.date_time.time)
				zoned_date_time.time_zone.convert_to_utc (dt1)
				Result := dt1.three_way_comparison (dt2)
			else -- `other' is zoned
				create dt2.make_from_date_time (a_date_time.zoned_date_time.date_time.date, a_date_time.zoned_date_time.date_time.time)
				a_date_time.zoned_date_time.time_zone.convert_to_utc (dt2)
				create dt1.make_from_date_time (local_date_time.date, local_date_time.time)
				a_context.implicit_timezone.convert_to_utc (dt1)
				Result := dt1.three_way_comparison (dt2)
			end
		end

feature -- Status report

	is_date_time_value: BOOLEAN is
			-- Is `Current' a date_time value?
		do
			Result := True
		end

	is_date_time (a_lexical_date_time: STRING): BOOLEAN is
			-- Is `a_lexical_date_time' a valid xs:dateTime?
		require
			lexical_date_time_exists: a_lexical_date_time /= Void
		local
			a_date_time_parser: DT_XSD_DATE_TIME_PARSER
		do
			create a_date_time_parser.make
			Result := a_date_time_parser.is_zoned_date_time (a_lexical_date_time)
				or else a_date_time_parser.is_date_time (a_lexical_date_time)
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_date_time_value
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.date_type
				or else a_required_type = type_factory.time_type
				or else a_required_type = type_factory.date_time_type
				or else a_required_type = type_factory.g_year_month_type
				or else a_required_type = type_factory.g_year_type
				or else a_required_type = type_factory.g_month_type
				or else a_required_type = type_factory.g_month_day_type
				or else a_required_type = type_factory.g_day_type
				or else a_required_type = type_factory.string_type
				or else a_required_type = type_factory.untyped_atomic_type then
				Result := True
			end
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "dateTime (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversions

	as_date_time_value: XM_XPATH_DATE_TIME_VALUE is
			-- `Current' seen as a dateTime value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE): XM_XPATH_ATOMIC_VALUE is
			-- Convert `Current' to `a_required_type'
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.date_time_type then
				Result := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			elseif a_required_type = type_factory.date_type then
				if zoned then
					create {XM_XPATH_DATE_VALUE} Result.make_from_zoned_date (zoned_date_time.zoned_date)
				else
					create {XM_XPATH_DATE_VALUE} Result.make_from_date (local_date_time.date)
				end
			elseif a_required_type = type_factory.time_type then
				if zoned then
					create {XM_XPATH_TIME_VALUE} Result.make_from_zoned_time (zoned_date_time.zoned_time)
				else
					create {XM_XPATH_TIME_VALUE} Result.make_from_time (local_date_time.time)
				end
			elseif a_required_type = type_factory.g_year_month_type then
				if zoned then
					create {XM_XPATH_YEAR_MONTH_VALUE} Result.make_from_zoned_date (zoned_date_time.zoned_date)
				else
					create {XM_XPATH_YEAR_MONTH_VALUE} Result.make_from_date (local_date_time.date)
				end
			elseif a_required_type = type_factory.g_year_type then
				if zoned then
					create {XM_XPATH_YEAR_VALUE} Result.make_from_zoned_date (zoned_date_time.zoned_date)
				else
					create {XM_XPATH_YEAR_VALUE} Result.make_from_date (local_date_time.date)
				end
			elseif a_required_type = type_factory.g_month_type then
				if zoned then
					create {XM_XPATH_MONTH_VALUE} Result.make_from_zoned_date (zoned_date_time.zoned_date)
				else
					create {XM_XPATH_MONTH_VALUE} Result.make_from_date (local_date_time.date)
				end
			elseif a_required_type = type_factory.g_month_day_type then
				if zoned then
					create {XM_XPATH_MONTH_DAY_VALUE} Result.make_from_zoned_date (zoned_date_time.zoned_date)
				else
					create {XM_XPATH_MONTH_DAY_VALUE} Result.make_from_date (local_date_time.date)
				end
			elseif a_required_type = type_factory.g_day_type then
				if zoned then
					create {XM_XPATH_DAY_VALUE} Result.make_from_zoned_date (zoned_date_time.zoned_date)
				else
					create {XM_XPATH_DAY_VALUE} Result.make_from_date (local_date_time.date)
				end				
			end
		end

feature -- Basic operations

	plus (a_duration: XM_XPATH_DURATION_VALUE): like Current is
			-- Addition of `a_duration' to `Current'
		local
			a_date_time: DT_DATE_TIME
			a_zoned_date_time: like zoned_date_time
		do
			if zoned then
				a_date_time := zoned_date_time.date_time
			else
				a_date_time := local_date_time
			end
			a_date_time.add_duration (a_duration.duration)
			if zoned then
				create a_zoned_date_time.make (a_date_time, zoned_date_time.time_zone)
				create Result.make_from_zoned_date_time (a_zoned_date_time)
			else
				create Result.make_from_date_time (a_date_time)
			end
		end

feature {NONE} -- Implementation

	cached_utc_date_time: DT_DATE_TIME
			-- Cached `Result' for `utc_date_time'

invariant

	zoned_date_time: zoned implies zoned_date_time /= Void
	unzoned_date_time: not zoned implies local_date_time /= Void

end
