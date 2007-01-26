indexing

	description:

		"EiffelTime TIME_VALUE class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class TIME_VALUE

inherit

	DT_TIME_VALUE

	TIME_CONSTANTS
		undefine
			out
		end

feature -- Access

	fine_second: DOUBLE is
			-- Representation of second with decimals
		do
			Result := second + millisecond / 1000
		end

	fractionnal_second: DOUBLE is
			-- Fractionnal part of `fine_second'
		do
			Result := millisecond / 1000
		end

	milli_second: INTEGER is
			-- Millisecond of the current time
		do
			Result := millisecond
		end

	micro_second: INTEGER is 0
			-- Microsecond of the current time
 
	nano_second: INTEGER is  0
			-- Nanosecond of the current time

feature -- Output

	out_fine (p: INTEGER): STRING is
			-- Printable representation of time
			-- `p' is the number of decimals shown
		require
			p_strictly_positive: p > 0
		do
			Result := precise_out
		ensure
			out_fine_not_void: Result /= Void
		end

end
