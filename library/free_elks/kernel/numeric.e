indexing
	description: "[
		Objects to which numerical operations are applicable
		Note: The model is that of a commutative ring.
		]"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class

	NUMERIC

inherit
	DEBUG_OUTPUT
		rename
			debug_output as out
		end

feature -- Access

	one: like Current is
			-- Neutral element for "*" and "/"
		deferred
		ensure
			result_exists: Result /= Void
		end

	zero: like Current is
			-- Neutral element for "+" and "-"
		deferred
		ensure
			result_exists: Result /= Void
		end

feature -- Status report

	divisible (other: like Current): BOOLEAN is
			-- May current object be divided by `other'?
		require
			other_exists: other /= Void
		deferred
		end

	exponentiable (other: NUMERIC): BOOLEAN is
			-- May current object be elevated to the power `other'?
		obsolete
			"[2008_04_01] Will be removed since not used."
		require
			other_exists: other /= Void
		deferred
		end

feature -- Basic operations

	infix "+" (other: like Current): like Current is
			-- Sum with `other' (commutative).
		require
			other_exists: other /= Void
		deferred
		ensure
			result_exists: Result /= Void
			commutative: equal (Result, other + Current)
		end

	infix "-" (other: like Current): like Current is
			-- Result of subtracting `other'
		require
			other_exists: other /= Void
		deferred
		ensure
			result_exists: Result /= Void
		end

	infix "*" (other: like Current): like Current is
			-- Product by `other'
		require
			other_exists: other /= Void
		deferred
		ensure
			result_exists: Result /= Void
		end

	infix "/" (other: like Current): like Current is
			-- Division by `other'
		require
			other_exists: other /= Void
			good_divisor: divisible (other)
		deferred
		ensure
			result_exists: Result /= Void
		end

	prefix "+": like Current is
			-- Unary plus
		deferred
		ensure
			result_exists: Result /= Void
		end

	prefix "-": like Current is
			-- Unary minus
		deferred
		ensure
			result_exists: Result /= Void
		end

invariant

--	neutral_addition: equal (Current + zero, Current);
--	self_subtraction: equal (Current - Current, zero);
--	neutral_multiplication: equal (Current * one, Current);
--	self_division: divisible (Current) implies equal (Current / Current, one)

end
