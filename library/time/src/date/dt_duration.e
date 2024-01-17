note

	description:

		"Durations"

	library: "Gobo Eiffel Time Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"

deferred class DT_DURATION

inherit

	KL_PART_COMPARABLE

	HASHABLE

	KL_CLONABLE

feature -- Access

	absolute_time (a_time: DT_ABSOLUTE_TIME): DT_ABSOLUTE_TIME
			-- Addition of current duration to `a_time'
			-- (Create a new object at each call.)
		require
			a_time_not_void: a_time /= Void
		do
			Result := a_time + Current
		ensure
			absolute_time_not_void: Result /= Void
			definition: Result.is_equal (a_time + Current)
		end

feature -- Basic operations

	plus alias "+" (other: like Current): like Current
			-- Sum of current duration with `other'
		require
			other_not_void: other /= Void
		deferred
		ensure
			addition_not_void: Result /= Void
		end

	minus alias "-" (other: like Current): like Current
			-- Difference with `other'
		require
			other_not_void: other /= Void
		deferred
		ensure
			subtraction_not_void: Result /= Void
		end

	identity alias "+": like Current
			-- Unary plus
		do
			Result := Current
		ensure
			unary_plus_not_void: Result /= Void
			same_object: Result = Current
		end

	opposite alias "-": like Current
			-- Unary minus
		deferred
		ensure
			unary_minus_not_void: Result /= Void
		end

end
