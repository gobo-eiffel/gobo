note

	description:

		"Values dealing with hour, minute, second and millisecond"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DT_TIME_VALUE

inherit

	ANY
			-- Export features of ANY.
		redefine
			out
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			out
		end

	KL_IMPORTED_INTEGER_ROUTINES
		undefine
			out
		end

feature -- Access

	hour: INTEGER
			-- Hour
		deferred
		end

	minute: INTEGER
			-- Minute
		deferred
		end

	second: INTEGER
			-- Second
		deferred
		end

	millisecond: INTEGER
			-- Millisecond
		deferred
		end

feature -- Output

	out: STRING
			-- Printable representation (hour:minute:second[.millisecond])
			-- (The millisecond part appears only when not zero.)
		do
			create Result.make (12)
			append_to_string (Result)
		end

	precise_out: STRING
			-- Printable representation (hour:minute:second.millisecond)
		do
			create Result.make (12)
			append_precise_to_string (Result)
		ensure
			precise_out_not_void: Result /= Void
		end

	time_out: STRING
			-- Printable representation (hour:minute:second[.millisecond])
			-- (The millisecond part appears only when not zero.)
		do
			create Result.make (12)
			append_time_to_string (Result)
		ensure
			time_out_not_void: Result /= Void
		end

	precise_time_out: STRING
			-- Printable representation (hour:minute:second.millisecond)
		do
			create Result.make (12)
			append_precise_time_to_string (Result)
		ensure
			precise_time_out_not_void: Result /= Void
		end

	append_to_string (a_string: STRING)
			-- Append printable representation
			-- (hour:minute:second[.millisecond]) to `a_string'.
			-- (The millisecond part appears only when not zero.)
		require
			a_string_not_void: a_string /= Void
		do
			append_time_to_string (a_string)
		end

	append_time_to_string (a_string: STRING)
			-- Append printable representation
			-- (hour:minute:second[.millisecond]) to `a_string'.
			-- (The millisecond part appears only when not zero.)
		require
			a_string_not_void: a_string /= Void
		local
			l_millisecond: INTEGER
		do
			INTEGER_.append_decimal_integer (hour, a_string)
			a_string.append_character (':')
			INTEGER_.append_decimal_integer (minute, a_string)
			a_string.append_character (':')
			INTEGER_.append_decimal_integer (second, a_string)
			l_millisecond := millisecond
			if l_millisecond /= 0 then
				a_string.append_character ('.')
				if l_millisecond < 0 then
					a_string.append_character ('-')
					l_millisecond := - l_millisecond
				end
				if l_millisecond < 10 then
					a_string.append_character ('0')
					a_string.append_character ('0')
				elseif l_millisecond < 100 then
					a_string.append_character ('0')
				end
				INTEGER_.append_decimal_integer (l_millisecond, a_string)
			end
		end

	append_precise_to_string (a_string: STRING)
			-- Append printable representation (hour:minute:second.millisecond)
			-- to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			append_precise_time_to_string (a_string)
		end

	append_precise_time_to_string (a_string: STRING)
			-- Append printable representation (hour:minute:second.millisecond)
			-- to `a_string'.
		require
			a_string_not_void: a_string /= Void
		do
			append_time_to_string (a_string)
			if millisecond = 0 then
				a_string.append_character ('.')
				a_string.append_character ('0')
				a_string.append_character ('0')
				a_string.append_character ('0')
			end
		end

end
