indexing

	description:

		"Objects that may be compared according to a partial order relation"

	remark: "[
		The basic operation is < (less than); others
		are defined in terms of this operation and is_equal.
	]"
	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2000, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KL_PART_COMPARABLE

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		require
			other_not_void: other /= Void
		deferred
		end

	is_less_equal alias "<=" (other: like Current): BOOLEAN is
			-- Is current object less than or equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := (Current < other) or is_equal (other)
		ensure
			definition: Result = ((Current < other) or is_equal (other))
		end

	is_greater alias ">" (other: like Current): BOOLEAN is
			-- Is current object greater than `other'?
		require
			other_not_void: other /= Void
		do
			Result := other < Current
		ensure
			definition: Result = (other < Current)
		end

	is_greater_equal alias ">=" (other: like Current): BOOLEAN is
			-- Is current object greater than or equal to `other'?
		require
			other_not_void: other /= Void
		do
			Result := (other < Current) or is_equal (other)
		ensure
			definition: Result = ((other < Current) or is_equal (other))
		end

end
