indexing

	description:

		"Values dealing with year, month, day, hour, minute, second and millisecond"

	library:    "Gobo Eiffel Time Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class DT_DATE_TIME_VALUE

inherit

	DT_DATE_VALUE
		undefine
			out, append_to_string
		end

	DT_TIME_VALUE
		redefine
			out, append_to_string,
			precise_out, append_precise_to_string
		end

feature -- Access

	date: DT_DATE_VALUE is
			-- Date part
		deferred
		ensure
			date_not_void: Result /= Void
		end

	time: DT_TIME_VALUE is
			-- Time part
		deferred
		ensure
			time_not_void: Result /= Void
		end

feature -- Output

	out: STRING is
			-- Printable representation
			-- (year/month/day hour:minute:second[.millisecond])
			-- (The millisecond part appears only when not zero.)
		do
			Result := STRING_.make (23)
			append_to_string (Result)
		end

	precise_out: STRING is
			-- Printable representation
			-- (year/month/day hour:minute:second.millisecond)
		do
			Result := STRING_.make (23)
			append_precise_to_string (Result)
		end

	append_to_string (a_string: STRING) is
			-- Append printable representation
			-- (year/month/day hour:minute:second[.millisecond]) to `a_string'.
			-- (The millisecond part appears only when not zero.)
		do
			append_date_to_string (a_string)
			a_string.append_character (' ')
			append_time_to_string (a_string)
		end

	append_precise_to_string (a_string: STRING) is
			-- Append printable representation
			-- (year/month/day hour:minute:second.millisecond)
			-- to `a_string'.
		do
			append_date_to_string (a_string)
			a_string.append_character (' ')
			append_precise_time_to_string (a_string)
		end

end -- class DT_DATE_TIME_VALUE
