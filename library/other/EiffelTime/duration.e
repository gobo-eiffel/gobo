indexing

	description:

		"EiffelTime DURATION class interface"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class DURATION

inherit

	DT_DURATION
		redefine
			absolute_time
		end

feature -- Access

	zero: DURATION is
			-- Neutral element for "+" and "-"
		deferred
		ensure
			zero_not_void: Result /= Void
		end

	absolute_time (a_time: ABSOLUTE): ABSOLUTE is
			-- Addition of current duration to `a_time'
			-- (Create a new object at each call.)
		do
			Result := a_time + Current
		end

end
