indexing

	description:

		"EiffelTime ABSOLUTE class interface"

	library:    "Gobo Eiffel Time Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 2000, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

deferred class ABSOLUTE

inherit

	DT_ABSOLUTE_TIME
		rename
			duration as relative_duration,
			infix "-" as dt_infix_minus
		redefine
			relative_duration
		end

feature -- Access

	origin: ABSOLUTE is
			-- Place of start for recording objects
		deferred
		ensure
			origin_not_void: Result /= Void
		end

	relative_duration (other: like Current): DURATION is
			-- Duration from `other' to `Current'
		deferred
		end

feature -- Measurement

	duration: like relative_duration is
			-- Lenght of the interval of time since `origin'
		do
			Result := relative_duration (origin)
		ensure
			definition: Result = relative_duration (origin)
		end

feature -- Element change

	add (a_duration: like relative_duration) is
			-- Add `a_duration' to `Current'.
		require
			a_duration_not_void: a_duration /= Void
		deferred
		end

end -- class ABSOLUTE
