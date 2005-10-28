deferred class COMPARABLE

feature -- Comparison

	infix "<" (other: like Current): BOOLEAN is
			-- Is current object less than `other'?
		deferred
		end

	infix "<=" (other: like Current): BOOLEAN is
			-- Is current object less than or equal to `other'?
		do
			Result := not (other < Current)
		end

	infix ">" (other: like Current): BOOLEAN is
			-- Is current object greater than `other'?
		do
			Result := other < Current
		end

	infix ">=" (other: like Current): BOOLEAN is
			-- Is current object greater than or equal to `other'?
		do
			Result := not (Current < other)
		end

	three_way_comparison (other: like Current): INTEGER is
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
			equal_zero: (Result = 0) = is_equal (other)
			smaller_negative: (Result = -1) = (Current < other)
			greater_positive: (Result = 1) = (Current > other)
		end

	max (other: like Current): like Current is
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

	min (other: like Current): like Current is
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

end
