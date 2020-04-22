note
	description: "[
		Objects to which numerical operations are applicable
		Note: The model is that of a commutative ring.
	]"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
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

	one: like Current
			-- Neutral element for "*" and "/"
		deferred
		ensure
			result_exists: Result /= Void
		end

	zero: like Current
			-- Neutral element for "+" and "-"
		deferred
		ensure
			result_exists: Result /= Void
		end

feature -- Status report

	divisible (other: like Current): BOOLEAN
			-- May current object be divided by `other'?
		require
			other_exists: other /= Void
		deferred
		end

	exponentiable (other: NUMERIC): BOOLEAN
			-- May current object be elevated to the power `other'?
		obsolete
			"Will be removed since not used. [2017-05-31]"
		require
			other_exists: other /= Void
		deferred
		end

feature -- Basic operations

	plus alias "+" (other: like Current): like Current
			-- Sum with `other' (commutative).
		require
			other_exists: other /= Void
		deferred
		ensure
			result_exists: Result /= Void
			commutative: Result ~ (other + Current)
		end

	minus alias "-" alias "−" (other: like Current): like Current
			-- Result of subtracting `other'
		require
			other_exists: other /= Void
		deferred
		ensure
			result_exists: Result /= Void
		end

	product alias "*" alias "×" (other: like Current): like Current
			-- Product by `other'
		require
			other_exists: other /= Void
		deferred
		ensure
			result_exists: Result /= Void
		end

	quotient alias "/" alias "÷" (other: like Current): like Current
			-- Division by `other'
		require
			other_exists: other /= Void
			good_divisor: divisible (other)
		deferred
		ensure
			result_exists: Result /= Void
		end

	identity alias "+": like Current
			-- Unary plus
		deferred
		ensure
			result_exists: Result /= Void
		end

	opposite alias "-" alias "−": like Current
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

note
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
