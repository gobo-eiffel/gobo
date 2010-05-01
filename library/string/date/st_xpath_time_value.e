note

	description:

		"Time values consistent with XPath 2.0"

	library: "Gobo Eiffel String Library"
	copyright: "Copyright (c) 2007, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ST_XPATH_TIME_VALUE

inherit

	ST_XPATH_CALENDAR_VALUE
		redefine
			is_xpath_time,
			as_xpath_time
		end

create

	make,
	make_from_time,
	make_from_zoned_time

feature {NONE} -- Initialization

	make (a_lexical_time: STRING) is
			-- Create from lexical time.
		require
			lexical_time: a_lexical_time /= Void and then is_time (a_lexical_time)
		local
			l_date_time_parser: ST_XSD_DATE_TIME_PARSER
		do
			create l_date_time_parser.make_1_1
			if l_date_time_parser.is_zoned_time (a_lexical_time) then
				zoned := True
				zoned_time := l_date_time_parser.string_to_zoned_time (a_lexical_time)
			else
				local_time := l_date_time_parser.string_to_time (a_lexical_time)
			end
		end

	make_from_time (a_time: DT_TIME) is
			-- Create from time object.
		require
			time_not_void: a_time /= Void
		do
			local_time := a_time.twin
		end

	make_from_zoned_time (a_time: DT_FIXED_OFFSET_ZONED_TIME) is
			-- Create from time object.
		require
			time_not_void: a_time /= Void
		do
			zoned_time := a_time.twin
			zoned := True
		end

feature -- Access

	zoned_time: detachable DT_FIXED_OFFSET_ZONED_TIME
			-- Zoned time value

	local_time: detachable DT_TIME
			-- Time value without zone

	time: DT_TIME is
			-- Time components
		local
			l_time: detachable like time
			l_zoned_time: like zoned_time
		do
			if zoned then
				l_zoned_time := zoned_time
				check
						-- condition `zoned'
					zoned: l_zoned_time /= Void
				end
				l_time := l_zoned_time.time
			else
				l_time := local_time
				check
						-- condition `not zoned'
					not_zoned: l_time /= Void
				end
			end
			Result := l_time
		ensure
			time_not_void: Result /= Void
		end

feature -- Status report

	is_xpath_time: BOOLEAN is
			-- Does `Current' have a time component and no date component?
		do
			Result := True
		end

	is_time (a_lexical_time: STRING): BOOLEAN is
			-- Is `a_lexical_time' a valid time?
		require
			lexical_time_not_void: a_lexical_time /= Void
		local
			l_date_time_parser: ST_XSD_DATE_TIME_PARSER
		do
			create l_date_time_parser.make_1_1
			Result := l_date_time_parser.is_zoned_time (a_lexical_time) or l_date_time_parser.is_time (a_lexical_time)
		end

feature -- Conversion

	as_xpath_time: ST_XPATH_TIME_VALUE is
			-- `Current' seen as a time value
		do
			Result := Current
		end

end
