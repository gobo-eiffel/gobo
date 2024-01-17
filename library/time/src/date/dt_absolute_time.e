note

	description:

		"Absolute temporal notion"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"

deferred class DT_ABSOLUTE_TIME

inherit

	KL_COMPARABLE
		undefine
			is_equal
		end

	HASHABLE

	KL_CLONABLE

feature -- Access

	minus alias "-" (other: like Current): like duration
			-- Duration between `other' and `Current'
		require
			other_not_void: other /= Void
		do
			Result := duration (other)
		ensure
			duration_not_void: Result /= Void
			definition: (other + Result).is_equal (Current)
		end

	plus alias "+" (a_duration: like duration): like Current
			-- Addition of `a_duration' to `Current'
			-- (Create a new object at each call.)
		require
			a_duration_not_void: a_duration /= Void
		do
			Result := cloned_object
			Result.add_duration (a_duration)
		ensure
			addition_not_void: Result /= Void
		end

	duration (other: like Current): DT_DURATION
			-- Duration between `other' and `Current'
		require
			other_not_void: other /= Void
		deferred
		ensure
			duration_not_void: Result /= Void
			definition: (other + Result).is_equal (Current)
		end

feature -- Element change

	add_duration (a_duration: like duration)
			-- Add `a_duration' to `Current'.
		require
			a_duration_not_void: a_duration /= Void
		deferred
		end

end
