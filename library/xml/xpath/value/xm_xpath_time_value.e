indexing

	description:

		"Objects that represent XPath timee values"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_TIME_VALUE

inherit

	XM_XPATH_CALENDAR_VALUE
		undefine
			is_xpath_time, as_xpath_time
		redefine
			is_time_value, as_time_value, hash_code
		end

	ST_XPATH_TIME_VALUE
		redefine
			make, make_from_time, make_from_zoned_time
		end

create

	make, make_from_time, make_from_zoned_time

feature {NONE} -- Initialization

	make (a_lexical_time: STRING) is
			-- Create from lexical time.
		do
			make_atomic_value
			Precursor (a_lexical_time)
			if not zoned then
				set_depends_upon_implicit_timezone
			end
		end

	make_from_time (a_time: DT_TIME) is
			-- Create from time object.
		do
			make_atomic_value
			Precursor (a_time)
			set_depends_upon_implicit_timezone
		end

	make_from_zoned_time (a_time: DT_FIXED_OFFSET_ZONED_TIME) is
			-- Create from time object.
		do
			make_atomic_value
			Precursor (a_time)
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where know
		do
			Result := type_factory.time_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	string_value: STRING is
			--Value of the item as a string
		local
			a_date_time_parser: ST_XSD_DATE_TIME_FORMAT
		do
			create a_date_time_parser.make_1_1
			if zoned then
				Result := a_date_time_parser.zoned_time_to_string (zoned_time)
			else
				Result := a_date_time_parser.time_to_string (local_time)
			end
		end

	as_zoneless: XM_XPATH_TIME_VALUE is
			-- Same value as `Current', but without a time zone
		do
			if zoned then
				create Result.make_from_time (zoned_time.time)
			else
				Result := Current
			end
		ensure
			result_not_void: Result /= Void
		end

	to_another_time_zone (an_offset: XM_XPATH_SECONDS_DURATION_VALUE): XM_XPATH_TIME_VALUE is
			-- Same time as `Current', but in `a_time_zone'
		require
			time_zone_not_void: an_offset /= Void
		local
			a_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_zoned_dt: DT_FIXED_OFFSET_ZONED_TIME
			a_time: DT_TIME
			a_dt: DT_DATE_TIME
		do
			create a_zone.make (an_offset.duration.time_duration)
			if not zoned then
				create a_zoned_dt.make (local_time, a_zone)
				create Result.make_from_zoned_time (a_zoned_dt)
			else
				a_time := zoned_time.time
				create a_dt.make_precise (1970, January, 1, a_time.hour, a_time.minute, a_time.second, a_time.millisecond)
				a_time := a_zone.date_time_from (a_dt, zoned_time.time_zone).time
				create a_zoned_dt.make (a_time, a_zone)
				create Result.make_from_zoned_time (a_zoned_dt)
			end
		ensure
			result_not_void: Result /= Void
		end

	hash_code: INTEGER is
			-- Hash code value
		do
			if zoned_time = Void then
				Result := local_time.hash_code
			else

				-- Equality implies same `hash_code', but
				--  not vice-versa:

				Result := utc_time.hash_code
			end
		end

	utc_date_time: DT_DATE_TIME is
			-- Date_Time adjusted to UTC
		local
			a_zoned_date_time: DT_FIXED_OFFSET_ZONED_DATE_TIME
			a_date: DT_DATE
			a_date_time: DT_DATE_TIME
		do
			create a_date.make (1970, 1, 1)
			create a_date_time.make_from_date_time (a_date, zoned_time.time)
			create a_zoned_date_time.make (a_date_time, zoned_time.time_zone)
			Result := a_zoned_date_time.date_time_to_utc
		end

	implicitly_zoned_date_time (a_context: XM_XPATH_CONTEXT): DT_DATE_TIME is
			-- Date_Time adjusted to UTC via implicit time zone
		local
			a_date_time: DT_DATE_TIME
			a_date: DT_DATE
		do
			create a_date.make (1970, 1, 1)
			create a_date_time.make_from_date_time (a_date, local_time)
			Result := a_context.implicit_timezone.date_time_to_utc (a_date_time)
		end

	utc_time: DT_TIME is
			-- Time adjusted to UTC;
			-- Ignores implicit time zone.
		do
			if zoned_time = Void then
				Result := local_time
			elseif cached_utc_time /= Void then
				Result := cached_utc_time
			else
				cached_utc_time := zoned_time.time_to_utc
				Result := cached_utc_time
			end
		ensure
			result_not_void: Result /= Void
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			if other.is_time_value then
				Result := zoned = other.as_time_value.zoned
					and then utc_time.three_way_comparison (other.as_time_value.utc_time) = 0
			end
		end

	three_way_comparison (other: XM_XPATH_ATOMIC_VALUE; a_context: XM_XPATH_CONTEXT): INTEGER is
			-- Comparison of `Current' to `other'
		local
			a_time: XM_XPATH_TIME_VALUE
			dt1, dt2: DT_DATE_TIME
			a_date: DT_DATE
		do
			a_time := other.as_time_value
			create a_date.make (1972, December, 31)
			if zoned = a_time.zoned then
				if zoned then
					create dt2.make_from_date_time (a_date, a_time.zoned_time.time)
					a_time.zoned_time.time_zone.convert_to_utc (dt2)
					create a_date.make (1972, December, 31)
					create dt1.make_from_date_time (a_date, zoned_time.time)
					zoned_time.time_zone.convert_to_utc (dt1)
					Result := dt1.three_way_comparison (dt2)
				else
					create dt2.make_from_date_time (a_date, a_time.local_time)
					create dt1.make_from_date_time (a_date, local_time)
					Result := dt1.three_way_comparison (dt2)
				end
 			elseif zoned then
				create dt2.make_from_date_time (a_date, a_time.local_time)
				a_context.implicit_timezone.convert_to_utc (dt2)
				create a_date.make (1972, December, 31)
				create dt1.make_from_date_time (a_date, zoned_time.time)
				zoned_time.time_zone.convert_to_utc (dt1)
				Result := dt1.three_way_comparison (dt2)
			else
				create dt2.make_from_date_time (a_date, a_time.zoned_time.time)
				a_time.zoned_time.time_zone.convert_to_utc (dt2)
				create a_date.make (1972, December, 31)
				create dt1.make_from_date_time (a_date, local_time)
				a_context.implicit_timezone.convert_to_utc (dt1)
				Result := dt1.three_way_comparison (dt2)
			end
		end

feature -- Status report

	is_time_value: BOOLEAN is
			-- Is `Current' a time value?
		do
			Result := True
		end

	is_comparable (other: XM_XPATH_ATOMIC_VALUE): BOOLEAN is
			-- Is `other' comparable to `Current'?
		do
			Result := other.is_time_value
		end

	is_convertible (a_required_type: XM_XPATH_ITEM_TYPE): BOOLEAN is
			-- Is `Current' convertible to `a_required_type'?
		do
			if	a_required_type = any_item or else a_required_type = type_factory.any_atomic_type
				or else a_required_type = type_factory.time_type
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
			a_string := STRING_.appended_string (indentation (a_level), "time (")
			a_string := STRING_.appended_string (a_string, string_value)
			a_string := STRING_.appended_string (a_string, ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Conversions

	as_time_value: XM_XPATH_TIME_VALUE is
			-- `Current' seen as a time value
		do
			Result := Current
		end

	convert_to_type (a_required_type: XM_XPATH_ITEM_TYPE) is
			-- Convert `Current' to `a_required_type'
		do
			if	a_required_type = any_item or a_required_type = type_factory.any_atomic_type or
				a_required_type = type_factory.time_type then
				converted_value := Current
			elseif a_required_type = type_factory.string_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make (string_value)
			elseif a_required_type = type_factory.untyped_atomic_type then
				create {XM_XPATH_STRING_VALUE} converted_value.make_untyped_atomic (string_value)
			end
		end

feature -- Basic operations

	plus (a_duration: XM_XPATH_DURATION_VALUE): like Current is
			-- Addition of `a_duration' to `Current'
		local
			a_time: DT_TIME
			a_date: DT_DATE
			a_dt: DT_DATE_TIME
			a_zoned_time: like zoned_time
		do
			a_duration.duration.set_year_month_day (0, 0, 0)
			if zoned then
				a_time := zoned_time.time.twin
			else
				a_time := local_time.twin
			end
			create a_date.make (1970, 1, 1)
			create a_dt.make_from_date_time (a_date, a_time)
			a_dt.add_duration (a_duration.duration)
			if zoned then
				create a_zoned_time.make (a_dt.time, zoned_time.time_zone.twin)
				create Result.make_from_zoned_time (a_zoned_time)
			else
				create Result.make_from_time (a_dt.time)
			end
		end

feature {NONE} -- Implementation

	cached_utc_time: DT_TIME
			-- Cached `Result' for `utc_time'

invariant

	zoned_time: zoned implies zoned_time /= Void
	unzoned_time: not zoned implies local_time /= Void

end
