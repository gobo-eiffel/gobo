indexing
	description: "Objects that may be compared according to a partial order relation"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	PART_COMPARABLE

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		require
			other_exists: other /= Void
		deferred
		end

	infix "<=" (other: like Current): BOOLEAN is
			-- Is current object less than or equal to `other'?
		require
			other_exists: other /= Void
		do
			Result := (Current < other) or is_equal (other)
		end

	infix ">" (other: like Current): BOOLEAN is
			-- Is current object greater than `other'?
		require
			other_exists: other /= Void
		do
			Result := other < Current
		end

	infix ">=" (other: like Current): BOOLEAN is
			-- Is current object greater than or equal to `other'?
		require
			other_exists: other /= Void
		do
			Result := (other < Current) or is_equal (other)
		end

end
