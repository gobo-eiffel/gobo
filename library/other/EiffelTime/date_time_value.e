indexing

	description:

		"EiffelTime DATE_TIME_VALUE class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DATE_TIME_VALUE

inherit

	DT_DATE_TIME_VALUE
		redefine
			date, time
		end

	DATE_VALUE
		undefine
			out, append_to_string
		end

	TIME_VALUE
		undefine
			out, append_to_string,
			precise_out, append_precise_to_string
		end

feature -- Access

	date: DATE_VALUE is
			-- Date of the current object
		deferred
		end

	time: TIME_VALUE is
			-- Time of the current object
		deferred
		end

end
