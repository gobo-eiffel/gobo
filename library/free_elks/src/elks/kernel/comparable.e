note
	description: "[
		Objects that may be compared according to a total order relation

		Note: The basic operation is `<' (less than); others are defined
			in terms of this operation and `is_equal'.
		]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

deferred class COMPARABLE inherit

	PART_COMPARABLE
		redefine
			is_less, is_less_equal,
			is_greater, is_greater_equal,
			is_equal
		end

feature -- Comparison

	is_less alias "<" (other: like Current): BOOLEAN
			-- Is current object less than `other'?
		deferred
		ensure then
			asymmetric: Result implies not (other < Current)
		end

	is_less_equal alias "<=" alias "≤" (other: like Current): BOOLEAN
			-- Is current object less than or equal to `other'?
		do
			Result := not (other < Current)
		ensure then
			definition: Result = ((Current < other) or (Current ~ other))
		end

	is_greater alias ">" (other: like Current): BOOLEAN
			-- Is current object greater than `other'?
		do
			Result := other < Current
		ensure then
			definition: Result = (other < Current)
		end

	is_greater_equal alias ">=" alias "≥" (other: like Current): BOOLEAN
			-- Is current object greater than or equal to `other'?
		do
			Result := not (Current < other)
 		ensure then
			definition: Result = (other <= Current)
		end

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object of the same type
			-- as current object and identical to it?
		do
			Result := not (Current < other) and not (other < Current)
		ensure then
			trichotomy: Result = (not (Current < other) and not (other < Current))
		end

	three_way_comparison alias "⋚" (other: like Current): INTEGER
			-- If current object equal to `other', 0;
			-- if smaller, -1; if greater, 1
		require
			other_exists: other /= Void
		do
			if Current < other then
				Result := -1
			elseif other < Current then
				Result := 1
			end
		ensure
			equal_zero: (Result = 0) = (Current ~ other)
			smaller_negative: (Result = -1) = (Current < other)
			greater_positive: (Result = 1) = (Current > other)
		end

	max alias "∨" (other: like Current): like Current
			-- The greater of current object and `other'
		require
			other_exists: other /= Void
		do
			if Current >= other then
				Result := Current
			else
				Result := other
			end
		ensure
			current_if_not_smaller: Current >= other implies Result = Current
			other_if_smaller: Current < other implies Result = other
		end

	min alias "∧" (other: like Current): like Current
			-- The smaller of current object and `other'
		require
			other_exists: other /= Void
		do
			if Current <= other then
				Result := Current
			else
				Result := other
			end
		ensure
			current_if_not_greater: Current <= other implies Result = Current
			other_if_greater: Current > other implies Result = other
		end

invariant

	irreflexive_comparison: not (Current < Current)

note
	ca_ignore:
		"CA057", "CA057: simplifiable boolean expression",
		"CA071", "CA071: self-comparison"
	copyright: "Copyright (c) 1984-2020, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
