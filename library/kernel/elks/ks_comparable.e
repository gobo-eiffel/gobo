indexing

	description:

		"Portable interface for class COMPARABLE"

	library: "Gobo Eiffel Kernel Library"
	copyright: "Copyright (c) 2001, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class KS_COMPARABLE

inherit

	ANY
		undefine
			is_equal
		redefine
			is_equal
		end

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			asymmetric: Result implies not (other < Current)
		end

	infix "<=" (other: like Current): BOOLEAN is
			-- Is current object less than or equal to `other'?
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			-- Note: Wrong precedence of operators in ELKS 95:
			-- definition: Result = (Current < other) or is_equal (other)
			definition: Result = (Current < other or is_equal (other))
		end

	infix ">=" (other: like Current): BOOLEAN is
			-- Is current object greater than or equal to `other'?
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			definition: Result = (other <= Current)
		end

	infix ">" (other: like Current): BOOLEAN is
			-- Is current object greater than `other'?
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			definition: Result = (other < Current)
		end

	is_equal (other: like Current): BOOLEAN is
			-- Is `other' attached to an object considered equal
			-- to current object?
			-- (ELKS 95 COMPARABLE)
		deferred
		ensure then
			trichotomy: Result = (not (Current < other) and not (other < Current))
		end

	max (other: like Current): like Current is
			-- The greater of current object and `other'
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			current_if_not_smaller: (Current >= other) implies (Result = Current)
			other_if_smaller: (Current < other) implies (Result = other)
		end

	min (other: like Current): like Current is
			-- The smaller of current object and `other'
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			current_if_not_greater: (Current <= other) implies (Result = Current)
			other_if_greater: (Current > other) implies (Result = other)
		end

	three_way_comparison (other: like Current): INTEGER is
			-- If current object equal to `other', 0; if smaller,
			-- -1; if greater, 1.
			-- (ELKS 95 COMPARABLE)
		require
			other_not_void: other /= Void
		deferred
		ensure
			equal_zero: (Result = 0) = is_equal (other)
			smaller_negative: (Result = -1) = (Current < other)
			greater_positive: (Result = 1) = (Current > other)
		end

invariant

	-- Note: Too memory consumming with SmartEiffel:
	-- irreflexive_comparison: not (Current < Current)

end
